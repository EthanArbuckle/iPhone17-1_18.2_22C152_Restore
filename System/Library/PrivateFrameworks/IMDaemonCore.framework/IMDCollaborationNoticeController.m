@interface IMDCollaborationNoticeController
+ (id)sharedController;
- (BOOL)_hasAdministrativePrivilegesForHighlight:(id)a3 chatGUID:(id)a4;
- (BOOL)_highlightEligibleForSuggestAddingUser:(id)a3;
- (BOOL)hasPopulatedHighlightTracking;
- (IMDCollaborationNoticeController)init;
- (IMDCollaborationNoticeDispatcher)noticeDispatcher;
- (IMDCollaborationNoticeStore)noticeStore;
- (NSDictionary)highlightURLsForChatGUID;
- (NSSet)highlightURLs;
- (OS_dispatch_queue)collaborationNoticeDispatcherQueue;
- (OS_dispatch_queue)mappingChatsToHighlightsQueue;
- (OS_dispatch_queue)noticeDataQueue;
- (SWHighlightCenter)highlightCenter;
- (id)noticesForChatGUID:(id)a3;
- (void)_chatGUIDsForNotice:(id)a3 completionBlock:(id)a4;
- (void)_chatGUIDsForNoticeURL:(id)a3 completionBlock:(id)a4;
- (void)_generateParticipantChangeNoticesForChat:(id)a3 highlight:(id)a4 participant:(id)a5 noticeType:(int64_t)a6 checkedPrivileges:(BOOL)a7 messageGUID:(id)a8;
- (void)_generateParticipantChangeNoticesForChat:(id)a3 highlights:(id)a4 participants:(id)a5 noticeType:(int64_t)a6;
- (void)_handleChatParticipantsDidChange:(id)a3;
- (void)_isShareBearURL:(id)a3 completionHandler:(id)a4;
- (void)_mapChatGUIDsToHighlight:(id)a3 completionBlock:(id)a4;
- (void)_processNotice:(id)a3;
- (void)_shouldPostParticipantChangeNoticesForChat:(id)a3 withParticipants:(id)a4 forNoticeType:(int64_t)a5;
- (void)_updateMappingHighlightsToChats;
- (void)broadcastNoticesDidChangeForChatGUIDs:(id)a3;
- (void)dismissNotice:(id)a3;
- (void)dispatcher:(id)a3 didReceiveDismissalReflectionForNoticeGUIDs:(id)a4;
- (void)dispatcher:(id)a3 didReceiveDismissalRequest:(id)a4 fromID:(id)a5;
- (void)dispatcher:(id)a3 didReceiveNotice:(id)a4 fromID:(id)a5;
- (void)highlightCenterHighlightsDidChange:(id)a3;
- (void)receiveHighlightEvent:(id)a3 fromSender:(id)a4 guidString:(id)a5 date:(id)a6;
- (void)setHasPopulatedHighlightTracking:(BOOL)a3;
- (void)setHighlightURLs:(id)a3;
- (void)setHighlightURLsForChatGUID:(id)a3;
- (void)setNoticeStore:(id)a3;
- (void)updateNotice:(id)a3;
@end

@implementation IMDCollaborationNoticeController

+ (id)sharedController
{
  if (qword_1EBE2BC30 != -1) {
    dispatch_once(&qword_1EBE2BC30, &unk_1F3392160);
  }
  v2 = (void *)qword_1EBE2BC18;

  return v2;
}

- (IMDCollaborationNoticeController)init
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)IMDCollaborationNoticeController;
  v2 = [(IMDCollaborationNoticeController *)&v23 init];
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[IMDCollaborationNoticeController init]";
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
      }
    }
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.IMDaemonCore.IMDCollaborationNoticeController.NoticeArrayQueue", v4);
    noticeDataQueue = v2->_noticeDataQueue;
    v2->_noticeDataQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.IMDaemonCore.IMDCollaborationNoticeController.MappingHighlightsToChatsQueue", 0);
    mappingChatsToHighlightsQueue = v2->_mappingChatsToHighlightsQueue;
    v2->_mappingChatsToHighlightsQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.IMDaemonCore.IMDCollaborationNoticeController.CollaborationNoticeDispatcherQueue", 0);
    collaborationNoticeDispatcherQueue = v2->_collaborationNoticeDispatcherQueue;
    v2->_collaborationNoticeDispatcherQueue = (OS_dispatch_queue *)v9;

    if ([MEMORY[0x1E4F6E730] supportsSharedWithYou])
    {
      v11 = (SWHighlightCenter *)objc_alloc_init((Class)MEMORY[0x1E0169C30](@"SWHighlightCenter", @"SharedWithYou"));
      highlightCenter = v2->_highlightCenter;
      v2->_highlightCenter = v11;

      [(SWHighlightCenter *)v2->_highlightCenter setDelegate:v2];
      v13 = objc_alloc_init(IMDCollaborationNoticeDispatcher);
      noticeDispatcher = v2->_noticeDispatcher;
      v2->_noticeDispatcher = v13;

      [(IMDCollaborationNoticeDispatcher *)v2->_noticeDispatcher setDelegate:v2];
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionary];
      highlightURLsForChatGUID = v2->_highlightURLsForChatGUID;
      v2->_highlightURLsForChatGUID = (NSDictionary *)v15;

      uint64_t v17 = [MEMORY[0x1E4F1CAD0] set];
      highlightURLs = v2->_highlightURLs;
      v2->_highlightURLs = (NSSet *)v17;

      v2->_hasPopulatedHighlightTracking = 0;
      v19 = objc_alloc_init(IMDCollaborationNoticeStore);
      noticeStore = v2->_noticeStore;
      v2->_noticeStore = v19;

      v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v21 addObserver:v2 selector:sel__handleChatParticipantsDidChange_ name:@"__kIMDChatParticipantsDidChangeNotification" object:0];
    }
  }
  return v2;
}

- (NSDictionary)highlightURLsForChatGUID
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1D984A900;
  v11 = sub_1D984A910;
  id v12 = 0;
  v3 = [(IMDCollaborationNoticeController *)self noticeDataQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D984A918;
  v6[3] = &unk_1E6B77D78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)setHighlightURLsForChatGUID:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(IMDCollaborationNoticeController *)self highlightURLsForChatGUID];
  char v6 = [v4 isEqualToDictionary:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(IMDCollaborationNoticeController *)self noticeDataQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1D984AA4C;
    v8[3] = &unk_1E6B73218;
    v8[4] = self;
    id v9 = v4;
    dispatch_barrier_sync(v7, v8);
  }
}

- (id)noticesForChatGUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_queue_t v5 = [(IMDCollaborationNoticeController *)self highlightURLsForChatGUID];
  char v6 = [v5 objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 allObjects];

  v8 = [(IMDCollaborationNoticeController *)self noticeStore];
  id v9 = [v8 noticesForURLs:v7];

  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      int v13 = 138412802;
      v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Found %@ notices for chatGUID: %@ : %@", (uint8_t *)&v13, 0x20u);
    }
  }

  return v9;
}

- (void)broadcastNoticesDidChangeForChatGUIDs:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    if (IMOSLoggingEnabled())
    {
      dispatch_queue_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315394;
        v10 = "-[IMDCollaborationNoticeController broadcastNoticesDidChangeForChatGUIDs:]";
        __int16 v11 = 2112;
        id v12 = v4;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "%s guids: %@.", (uint8_t *)&v9, 0x16u);
      }
    }
    char v6 = +[IMDBroadcastController sharedProvider];
    uint64_t v7 = [v6 broadcasterForChatListeners];
    [v7 collaborationNoticesDidChangeForChatGUIDs:v4];
  }
  else if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      v10 = "-[IMDCollaborationNoticeController broadcastNoticesDidChangeForChatGUIDs:]";
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "%s No chatGUIDs provided, aborting broadcast.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)dismissNotice:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    dispatch_queue_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "-[IMDCollaborationNoticeController dismissNotice:]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "%s for notice: %@", buf, 0x16u);
    }
  }
  char v6 = [(IMDCollaborationNoticeController *)self noticeStore];
  uint64_t v7 = [v6 deleteNotice:v4];

  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1D984AFA4;
    v9[3] = &unk_1E6B77DA0;
    v9[4] = self;
    id v10 = v4;
    [(IMDCollaborationNoticeController *)self _chatGUIDsForNotice:v10 completionBlock:v9];
  }
  else
  {
    v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1D9904F30(v4);
    }
  }
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDCollaborationNoticeController *)self highlightCenter];

  if (v5 == v4)
  {
    if (IMOSLoggingEnabled())
    {
      char v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = 136315138;
        v8 = "-[IMDCollaborationNoticeController highlightCenterHighlightsDidChange:]";
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "%s updating mapping of highlights to chats", (uint8_t *)&v7, 0xCu);
      }
    }
    [(IMDCollaborationNoticeController *)self _updateMappingHighlightsToChats];
  }
}

- (void)receiveHighlightEvent:(id)a3 fromSender:(id)a4 guidString:(id)a5 date:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v25 = a5;
  id v12 = a6;
  __int16 v13 = +[IMDCollaborationNoticeTypeGenerator sharedGenerator];
  uint64_t v14 = [v13 typeForHighlightEvent:v10];

  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [NSNumber numberWithInteger:v14];
      *(_DWORD *)buf = 138412802;
      id v34 = v10;
      __int16 v35 = 2112;
      v36 = v16;
      __int16 v37 = 2112;
      id v38 = v11;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "highlightEvent: %@ (type: %@) from sender: %@", buf, 0x20u);
    }
  }
  if (v14 == -1)
  {
    __int16 v17 = IMLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1D9904FB8();
    }
  }
  else
  {
    __int16 v17 = [MEMORY[0x1E4F6EA28] sharedManager];
    v18 = [v10 highlightURL];
    uint64_t v19 = [v17 urlMinusFragment:v18 onlyCKURL:1];

    if (v19)
    {
      if (IMOSLoggingEnabled())
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v19;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "\tnoticeURL: %@", buf, 0xCu);
        }
      }
      v21 = [(IMDCollaborationNoticeController *)self highlightURLs];
      char v22 = [v21 containsObject:v19];

      if (v22)
      {
        objc_super v23 = [(IMDCollaborationNoticeController *)self highlightCenter];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = sub_1D984B5D8;
        v26[3] = &unk_1E6B77DF0;
        v27 = v19;
        uint64_t v32 = v14;
        id v28 = v25;
        id v29 = v11;
        id v30 = v12;
        v31 = self;
        [v23 getCollaborationHighlightForURL:v27 completionHandler:v26];

        v24 = v27;
      }
      else
      {
        v24 = IMLogHandleForCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_1D9905020();
        }
      }
    }
    else
    {
      v24 = IMLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1D9904FEC();
      }
    }
  }
}

- (void)_processNotice:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDCollaborationNoticeController *)self noticeStore];
  [v5 saveNotice:v4];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D984BB60;
  v6[3] = &unk_1E6B77E18;
  v6[4] = self;
  [(IMDCollaborationNoticeController *)self _chatGUIDsForNotice:v4 completionBlock:v6];
}

- (void)updateNotice:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDCollaborationNoticeController *)self noticeStore];
  id v6 = (id)[v5 deleteNotice:v4];

  int v7 = [(IMDCollaborationNoticeController *)self noticeStore];
  [v7 saveNotice:v4];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D984BCDC;
  v8[3] = &unk_1E6B77E18;
  v8[4] = self;
  [(IMDCollaborationNoticeController *)self _chatGUIDsForNotice:v4 completionBlock:v8];
}

- (void)_updateMappingHighlightsToChats
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = dispatch_group_create();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [(IMDCollaborationNoticeController *)self highlightCenter];
  id v6 = [v5 highlights];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v12 = [v11 URL];
        if (v12)
        {
          dispatch_group_enter(v4);
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = sub_1D984C020;
          v19[3] = &unk_1E6B77E40;
          v19[4] = self;
          id v20 = v15;
          id v21 = v12;
          id v22 = v3;
          objc_super v23 = v4;
          [(IMDCollaborationNoticeController *)self _mapChatGUIDsToHighlight:v11 completionBlock:v19];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D984C290;
  block[3] = &unk_1E6B73BC8;
  block[4] = self;
  id v17 = v15;
  id v18 = v3;
  id v13 = v3;
  id v14 = v15;
  dispatch_group_notify(v4, MEMORY[0x1E4F14428], block);
}

- (void)dispatcher:(id)a3 didReceiveNotice:(id)a4 fromID:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IMDCollaborationNoticeDispatcher unarchiveNoticeTransmissionEvent:v9];
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      id v16 = v11;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Received notice: %@ from %@", (uint8_t *)&v15, 0x16u);
    }
  }
  id v13 = [v9 guidString];
  id v14 = [v9 date];
  [(IMDCollaborationNoticeController *)self receiveHighlightEvent:v11 fromSender:v10 guidString:v13 date:v14];
}

- (void)dispatcher:(id)a3 didReceiveDismissalReflectionForNoticeGUIDs:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = dispatch_group_create();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * v11);
        id v13 = [(IMDCollaborationNoticeController *)self noticeStore];
        id v14 = [v13 deleteNoticeWithGUIDString:v12];

        dispatch_group_enter(v7);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = sub_1D984C80C;
        v19[3] = &unk_1E6B77E68;
        v19[4] = self;
        id v20 = v6;
        id v21 = v7;
        [(IMDCollaborationNoticeController *)self _chatGUIDsForNoticeURL:v14 completionBlock:v19];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D984C930;
  block[3] = &unk_1E6B73218;
  block[4] = self;
  id v18 = v6;
  id v15 = v6;
  dispatch_group_notify(v7, MEMORY[0x1E4F14428], block);
}

- (void)dispatcher:(id)a3 didReceiveDismissalRequest:(id)a4 fromID:(id)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(IMDCollaborationNoticeController *)self highlightCenter];
  uint64_t v8 = [v6 collaborationId];
  id v35 = 0;
  uint64_t v9 = [v7 collaborationHighlightForIdentifier:v8 error:&v35];
  id v10 = v35;

  if (v10)
  {
    uint64_t v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1D9905238(v6, (uint64_t)v10, v11);
    }
  }
  else if (v9 && ([v9 URL], uint64_t v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    id v13 = [MEMORY[0x1E4F1CA48] array];
    id v14 = [(IMDCollaborationNoticeController *)self noticeStore];
    id v15 = [v9 URL];
    v37[0] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    __int16 v17 = [v14 noticesForURLs:v16];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v11 = v17;
    uint64_t v18 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v11);
          }
          long long v22 = [*(id *)(*((void *)&v31 + 1) + 8 * v21) guidString];
          [v13 addObject:v22];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v19);
    }

    long long v23 = [(IMDCollaborationNoticeController *)self noticeStore];
    long long v24 = [v6 collaborationId];
    id v25 = (id)[v23 deleteAllNoticesWithCollaborationIdentifier:v24];

    long long v26 = [(IMDCollaborationNoticeController *)self noticeDispatcher];
    [(IMDCollaborationNoticeController *)self dispatcher:v26 didReceiveDismissalReflectionForNoticeGUIDs:v13];

    uint64_t v27 = [v9 URL];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1D984CCDC;
    v29[3] = &unk_1E6B77DA0;
    v29[4] = self;
    id v30 = v13;
    id v28 = v13;
    [(IMDCollaborationNoticeController *)self _chatGUIDsForNoticeURL:v27 completionBlock:v29];
  }
  else
  {
    uint64_t v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1D99051B4(v6);
    }
  }
}

- (void)_mapChatGUIDsToHighlight:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F6EA70]);
  uint64_t v9 = [(IMDCollaborationNoticeController *)self highlightCenter];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1D984CE2C;
  v12[3] = &unk_1E6B77E90;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [v8 fetchAttributionsForHighlight:v9 highlight:v10 completionBlock:v12];
}

- (void)_chatGUIDsForNotice:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = [a3 metadata];
  id v8 = [v7 contentURL];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1D984D0C8;
  v10[3] = &unk_1E6B77EB8;
  id v11 = v6;
  id v9 = v6;
  [(IMDCollaborationNoticeController *)self _chatGUIDsForNoticeURL:v8 completionBlock:v10];
}

- (void)_chatGUIDsForNoticeURL:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    id v9 = [(IMDCollaborationNoticeController *)self highlightCenter];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1D984D230;
    v12[3] = &unk_1E6B77F08;
    id v13 = v6;
    id v15 = v8;
    id v16 = v7;
    id v14 = self;
    id v10 = v8;
    [v9 getCollaborationHighlightForURL:v13 completionHandler:v12];
  }
  else
  {
    id v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1D990538C();
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (NSSet)highlightURLs
{
  return self->_highlightURLs;
}

- (void)setHighlightURLs:(id)a3
{
}

- (IMDCollaborationNoticeDispatcher)noticeDispatcher
{
  return self->_noticeDispatcher;
}

- (OS_dispatch_queue)mappingChatsToHighlightsQueue
{
  return self->_mappingChatsToHighlightsQueue;
}

- (OS_dispatch_queue)noticeDataQueue
{
  return self->_noticeDataQueue;
}

- (OS_dispatch_queue)collaborationNoticeDispatcherQueue
{
  return self->_collaborationNoticeDispatcherQueue;
}

- (IMDCollaborationNoticeStore)noticeStore
{
  return self->_noticeStore;
}

- (void)setNoticeStore:(id)a3
{
}

- (SWHighlightCenter)highlightCenter
{
  return self->_highlightCenter;
}

- (BOOL)hasPopulatedHighlightTracking
{
  return self->_hasPopulatedHighlightTracking;
}

- (void)setHasPopulatedHighlightTracking:(BOOL)a3
{
  self->_hasPopulatedHighlightTracking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightCenter, 0);
  objc_storeStrong((id *)&self->_noticeStore, 0);
  objc_storeStrong((id *)&self->_collaborationNoticeDispatcherQueue, 0);
  objc_storeStrong((id *)&self->_noticeDataQueue, 0);
  objc_storeStrong((id *)&self->_mappingChatsToHighlightsQueue, 0);
  objc_storeStrong((id *)&self->_noticeDispatcher, 0);
  objc_storeStrong((id *)&self->_highlightURLs, 0);

  objc_storeStrong((id *)&self->_highlightURLsForChatGUID, 0);
}

- (void)_handleChatParticipantsDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Participants changed in [%@]", (uint8_t *)&v14, 0xCu);
    }
  }
  if (v5)
  {
    id v7 = [v4 userInfo];
    id v8 = [v7 objectForKey:@"__kIMDChatParticipantsDidChangeAddedParticipantsKey"];

    id v9 = [v4 userInfo];
    id v10 = [v9 objectForKey:@"__kIMDChatParticipantsDidChangeRemovedParticipantsKey"];

    if ([v8 count] || objc_msgSend(v10, "count"))
    {
      uint64_t v11 = [v8 count];
      if (v11) {
        uint64_t v12 = v8;
      }
      else {
        uint64_t v12 = v10;
      }
      if (v11) {
        uint64_t v13 = 8;
      }
      else {
        uint64_t v13 = 9;
      }
      [(IMDCollaborationNoticeController *)self _shouldPostParticipantChangeNoticesForChat:v5 withParticipants:v12 forNoticeType:v13];
    }
  }
}

- (void)_shouldPostParticipantChangeNoticesForChat:(id)a3 withParticipants:(id)a4 forNoticeType:(int64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v15 = 134218242;
      int64_t v16 = a5;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Notice type: %ld with participants: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  uint64_t v11 = [(IMDCollaborationNoticeController *)self highlightURLsForChatGUID];
  uint64_t v12 = [v8 guid];
  uint64_t v13 = [v11 objectForKey:v12];

  if ([v13 count])
  {
    [(IMDCollaborationNoticeController *)self _generateParticipantChangeNoticesForChat:v8 highlights:v13 participants:v9 noticeType:a5];
  }
  else if (IMOSLoggingEnabled())
  {
    int v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "No highlight found", (uint8_t *)&v15, 2u);
    }
  }
}

- (void)_generateParticipantChangeNoticesForChat:(id)a3 highlights:(id)a4 participants:(id)a5 noticeType:(int64_t)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v21 = a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = a5;
  uint64_t v22 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v22)
  {
    uint64_t v20 = *(void *)v35;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v10;
        uint64_t v11 = *(void *)(*((void *)&v34 + 1) + 8 * v10);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v12 = v21;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v31;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v31 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * v16);
              id v18 = [(IMDCollaborationNoticeController *)self highlightCenter];
              v25[0] = MEMORY[0x1E4F143A8];
              v25[1] = 3221225472;
              v25[2] = sub_1D984DBC8;
              v25[3] = &unk_1E6B77FA8;
              v25[4] = self;
              id v26 = v9;
              uint64_t v27 = v17;
              uint64_t v28 = v11;
              int64_t v29 = a6;
              [v18 getCollaborationHighlightForURL:v17 completionHandler:v25];

              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v14);
        }

        uint64_t v10 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v22);
  }
}

- (void)_generateParticipantChangeNoticesForChat:(id)a3 highlight:(id)a4 participant:(id)a5 noticeType:(int64_t)a6 checkedPrivileges:(BOOL)a7 messageGUID:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (a7
    || ([v14 guid],
        id v18 = objc_claimAutoreleasedReturnValue(),
        BOOL v19 = [(IMDCollaborationNoticeController *)self _hasAdministrativePrivilegesForHighlight:v15 chatGUID:v18], v18, v19))
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F22398];
    id v21 = [v15 URL];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1D984E860;
    v23[3] = &unk_1E6B77FD0;
    id v24 = v15;
    id v25 = v14;
    int64_t v29 = a6;
    id v26 = v17;
    id v27 = v16;
    uint64_t v28 = self;
    [v20 getAppLinkWithURL:v21 completionHandler:v23];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "No admin privileges, not showing group collaboration banner", buf, 2u);
    }
  }
}

- (BOOL)_hasAdministrativePrivilegesForHighlight:(id)a3 chatGUID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IMDCollaborationNoticeController *)self highlightCenter];
  id v9 = [v8 originalSenderForCollaborationHighlight:v6];

  uint64_t v10 = [v9 handle];
  if ([v10 length]
    && (+[IMDAccountController sharedInstance],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 accountAssociatedWithHandle:v10],
        v11,
        v12))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = [v6 URL];
        int v17 = 138412290;
        id v18 = v14;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Has privileges to change membership for URL: %@", (uint8_t *)&v17, 0xCu);
      }
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_highlightEligibleForSuggestAddingUser:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDCollaborationNoticeController *)self noticeDispatcher];
  id v6 = [v5 rateLimiter];
  id v7 = [v4 URL];
  id v8 = [v6 dateLastUpdatedForURL:v7];

  if (!v8)
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Could not get last updated date from rate limiter", v13, 2u);
      }
    }
    id v8 = [v4 creationDate];
  }
  [v8 timeIntervalSinceNow];
  BOOL v11 = (uint64_t)(v10 / -86400.0) < 90;

  return v11;
}

- (void)_isShareBearURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F22398];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1D984F0F4;
  v10[3] = &unk_1E6B77FF8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 getAppLinkWithURL:v9 completionHandler:v10];
}

@end