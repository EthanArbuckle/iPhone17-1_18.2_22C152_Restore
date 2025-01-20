@interface CKDraftManager
+ (id)sharedInstance;
- (NSArray)pendingRecipients;
- (NSMutableDictionary)cachedDrafts;
- (NSMutableSet)dirtyDraftIDs;
- (NSString)pendingChatIdentifier;
- (id)_draftForKey:(id)a3;
- (id)_pendingChatIdentifier;
- (id)_pendingChatIdentifierURL;
- (id)_pendingRecipients;
- (id)_pendingRecipientsURL;
- (id)draftForConversation:(id)a3;
- (id)draftForPendingConversationWithRecipients:(id *)a3;
- (id)draftForPendingConversationWithRecipients:(id *)a3 chatIdentifier:(id *)a4;
- (void)_clearDraftForConversation:(id)a3;
- (void)_setDraft:(id)a3 forKey:(id)a4;
- (void)_setPendingChatIdentifier:(id)a3;
- (void)_setPendingRecipients:(id)a3;
- (void)clearDraftForComposition:(id)a3;
- (void)clearDraftForPendingConversation;
- (void)dealloc;
- (void)flushCache;
- (void)saveCompositionAndFlushCache:(BOOL)a3;
- (void)setCachedDrafts:(id)a3;
- (void)setDirtyDraftIDs:(id)a3;
- (void)setDraft:(id)a3 forConversation:(id)a4;
- (void)setDraftForPendingConversation:(id)a3 withRecipients:(id)a4;
- (void)setDraftForPendingConversation:(id)a3 withRecipients:(id)a4 chatIdentifier:(id)a5;
- (void)setPendingChatIdentifier:(id)a3;
- (void)setPendingRecipients:(id)a3;
@end

@implementation CKDraftManager

+ (id)sharedInstance
{
  if (sDraftManager) {
    goto LABEL_2;
  }
  id v4 = objc_alloc_init((Class)a1);
  v5 = (void *)sDraftManager;
  sDraftManager = (uint64_t)v4;

  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v6 BOOLForKey:@"PendingCleared"])
  {

    goto LABEL_13;
  }
  int v7 = CKIsRunningInMessages();

  if (!v7)
  {
LABEL_13:
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "****** Not Clearing pending drafts *******", v11, 2u);
      }
    }
    goto LABEL_2;
  }
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "****** Clearing pending drafts *******", buf, 2u);
    }
  }
  v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v9 setBool:1 forKey:@"PendingCleared"];

  [(id)sDraftManager clearDraftForPendingConversation];
  [(id)sDraftManager saveCompositionAndFlushCache:0];
LABEL_2:
  v2 = (void *)sDraftManager;

  return v2;
}

- (void)dealloc
{
  [(CKDraftManager *)self saveCompositionAndFlushCache:1];
  v3.receiver = self;
  v3.super_class = (Class)CKDraftManager;
  [(CKDraftManager *)&v3 dealloc];
}

- (void)_clearDraftForConversation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[CKDraftManager _clearDraftForConversation:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "%s conversation:[%@]", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    int v7 = "-[CKDraftManager _clearDraftForConversation:]";
    id v8 = v4;
    _CKLog();
  }
  v6 = objc_msgSend(v4, "uniqueIdentifier", v7, v8);
  [(CKDraftManager *)self _setDraft:0 forKey:v6];
}

- (id)draftForConversation:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "draftForConversation: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    id v9 = v4;
    _CKLog();
  }
  v6 = objc_msgSend(v4, "uniqueIdentifier", v9);
  int v7 = [(CKDraftManager *)self _draftForKey:v6];

  return v7;
}

- (void)setDraft:(id)a3 forConversation:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v6 = (char *)a3;
  int v7 = (char *)a4;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v6;
      __int16 v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_DEBUG, "setDraft: %@ forConversation: %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v22 = v6;
    v24 = v7;
    _CKLog();
  }
  id v9 = objc_msgSend(v7, "uniqueIdentifier", v22, v24);

  if ([v6 hasNonwhiteSpaceContent])
  {
    int v10 = 0;
  }
  else
  {
    id v11 = [v6 bizIntent];
    int v10 = v11 == 0;
  }
  int v12 = [v6 isExpirableComposition];
  uint64_t v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v14 = [v13 isAudioMessagesEntryViewRecordingEnabled];

  if (v14)
  {
    if (v10) {
      int v10 = [v6 isAudioComposition] ^ 1;
    }
    if (v12) {
      int v12 = [v6 isAudioComposition] ^ 1;
    }
  }
  if (v6) {
    BOOL v15 = v9 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15) {
    int v16 = 1;
  }
  else {
    int v16 = v10;
  }
  int v17 = IMOSLoggingEnabled();
  if (v16 | v12)
  {
    if (v17)
    {
      CKLogCStringForType(15);
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v7;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Clearing the draft conversation. This is expected if the conversation has NO composition, or the composition lacks content, or the conversation has no unique identifier, or composition was only whitespace, or the composition was expirable (and not an audio message). Conversation: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      v23 = v7;
      _CKLogExternal();
    }
    -[CKDraftManager _clearDraftForConversation:](self, "_clearDraftForConversation:", v7, v23);
  }
  else
  {
    if (v17)
    {
      CKLogCStringForType(15);
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v28 = "-[CKDraftManager setDraft:forConversation:]";
        __int16 v29 = 2112;
        v30 = v6;
        __int16 v31 = 2112;
        v32 = v7;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_DEBUG, "%s draft:[%@],conversation:[%@]", buf, 0x20u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      v25 = v6;
      v26 = v7;
      v23 = "-[CKDraftManager setDraft:forConversation:]";
      _CKLog();
    }
    v20 = objc_msgSend(v7, "uniqueIdentifier", v23, v25, v26);
    [(CKDraftManager *)self _setDraft:v6 forKey:v20];

    if (IMIsRunningInMessagesExtension())
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CKDraftManagerSavedDraft", 0, 0, 1u);
    }
  }
}

- (id)draftForPendingConversationWithRecipients:(id *)a3
{
  return [(CKDraftManager *)self draftForPendingConversationWithRecipients:a3 chatIdentifier:0];
}

- (id)draftForPendingConversationWithRecipients:(id *)a3 chatIdentifier:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v12 = "-[CKDraftManager draftForPendingConversationWithRecipients:chatIdentifier:]";
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    int v10 = "-[CKDraftManager draftForPendingConversationWithRecipients:chatIdentifier:]";
    _CKLog();
  }
  id v8 = [(CKDraftManager *)self _draftForKey:@"Pending", v10];
  if (a3)
  {
    *a3 = [(CKDraftManager *)self _pendingRecipients];
  }
  if (a4)
  {
    *a4 = [(CKDraftManager *)self _pendingChatIdentifier];
  }

  return v8;
}

- (void)setDraftForPendingConversation:(id)a3 withRecipients:(id)a4
{
}

- (void)setDraftForPendingConversation:(id)a3 withRecipients:(id)a4 chatIdentifier:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  if (v8 | v9)
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315906;
        uint64_t v13 = "-[CKDraftManager setDraftForPendingConversation:withRecipients:chatIdentifier:]";
        __int16 v14 = 2112;
        unint64_t v15 = v8;
        __int16 v16 = 2112;
        unint64_t v17 = v9;
        __int16 v18 = 2112;
        id v19 = v10;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "%s draft:[%@],recipients:[%@], chatID:%@", (uint8_t *)&v12, 0x2Au);
      }
    }
    [(CKDraftManager *)self _setDraft:v8 forKey:@"Pending"];
    [(CKDraftManager *)self _setPendingRecipients:v9];
    [(CKDraftManager *)self _setPendingChatIdentifier:v10];
  }
  else
  {
    [(CKDraftManager *)self clearDraftForPendingConversation];
  }
}

- (void)clearDraftForPendingConversation
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[CKDraftManager clearDraftForPendingConversation]";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    id v4 = "-[CKDraftManager clearDraftForPendingConversation]";
    _CKLog();
  }
  [(CKDraftManager *)self _setDraft:0, @"Pending", v4 forKey];
  [(CKDraftManager *)self _setPendingRecipients:0];
  [(CKDraftManager *)self _setPendingChatIdentifier:0];
}

- (void)clearDraftForComposition:(id)a3
{
  [a3 cleanupCKShareFromComposition];

  [(CKDraftManager *)self clearDraftForPendingConversation];
}

- (void)saveCompositionAndFlushCache:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v5 = self->_dirtyDraftIDs;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v52 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        id v10 = [(NSMutableDictionary *)self->_cachedDrafts objectForKey:v9];
        [v10 saveCompositionWithGUID:v9];
      }
      uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v6);
  }

  [(NSMutableSet *)self->_dirtyDraftIDs removeAllObjects];
  if (v3) {
    [(CKDraftManager *)self flushCache];
  }
  id v11 = [(CKDraftManager *)self _pendingRecipientsURL];
  if ([(NSArray *)self->_pendingRecipients count])
  {
    if (IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        pendingRecipients = self->_pendingRecipients;
        *(_DWORD *)buf = 138412290;
        v56 = pendingRecipients;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Saving draft with recipients: %@", buf, 0xCu);
      }
    }
    __int16 v14 = (void *)MEMORY[0x1E4F28F98];
    unint64_t v15 = [(CKDraftManager *)self pendingRecipients];
    id v50 = 0;
    __int16 v16 = [v14 dataWithPropertyList:v15 format:100 options:0 error:&v50];
    id v17 = v50;

    if (v17)
    {
      __int16 v18 = IMLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CKDraftManager saveCompositionAndFlushCache:]((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
    id v49 = 0;
    char v25 = [v16 writeToURL:v11 options:1073741825 error:&v49];
    id v26 = v49;
    if ((v25 & 1) == 0)
    {
      v27 = IMLogHandleForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[CKDraftManager saveCompositionAndFlushCache:]((uint64_t)v26, v27, v28, v29, v30, v31, v32, v33);
      }

      [(NSArray *)self->_pendingRecipients writeToURL:v11 atomically:1];
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v17 removeItemAtURL:v11 error:0];
  }

  v34 = [(CKDraftManager *)self _pendingChatIdentifierURL];
  if ([(NSString *)self->_pendingChatIdentifier length])
  {
    if (IMOSLoggingEnabled())
    {
      v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        pendingChatIdentifier = self->_pendingChatIdentifier;
        *(_DWORD *)buf = 138412290;
        v56 = (NSArray *)pendingChatIdentifier;
        _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "Saving draft with chatID: %@", buf, 0xCu);
      }
    }
    v37 = [(CKDraftManager *)self pendingChatIdentifier];
    v38 = [v37 dataUsingEncoding:4];

    id v48 = 0;
    char v39 = [v38 writeToURL:v34 options:1073741825 error:&v48];
    id v40 = v48;
    if ((v39 & 1) == 0)
    {
      v41 = IMLogHandleForCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[CKDraftManager saveCompositionAndFlushCache:]((uint64_t)v40, v41, v42, v43, v44, v45, v46, v47);
      }

      [(NSArray *)self->_pendingRecipients writeToURL:v34 atomically:1];
    }
  }
  else
  {
    v38 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v38 removeItemAtURL:v34 error:0];
  }
}

- (void)flushCache
{
}

- (id)_pendingRecipientsURL
{
  if (_pendingRecipientsURL_onceToken != -1) {
    dispatch_once(&_pendingRecipientsURL_onceToken, &__block_literal_global_92);
  }
  v2 = (void *)_pendingRecipientsURL_sPendingRecipientsURL;

  return v2;
}

void __39__CKDraftManager__pendingRecipientsURL__block_invoke()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v0 = CKDraftsDirectoryURL();
  v1 = [v0 path];
  v8[0] = v1;
  v8[1] = @"Pending";
  v8[2] = @"recipients.plist";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  BOOL v3 = [NSString pathWithComponents:v2];
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v3 isDirectory:0];
  v5 = (void *)_pendingRecipientsURL_sPendingRecipientsURL;
  _pendingRecipientsURL_sPendingRecipientsURL = v4;

  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = [(id)_pendingRecipientsURL_sPendingRecipientsURL URLByDeletingLastPathComponent];
  [v6 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:0];
}

- (id)_pendingChatIdentifierURL
{
  if (_pendingChatIdentifierURL_onceToken != -1) {
    dispatch_once(&_pendingChatIdentifierURL_onceToken, &__block_literal_global_61_0);
  }
  v2 = (void *)_pendingChatIdentifierURL_sPendingChatIdentifierURL;

  return v2;
}

void __43__CKDraftManager__pendingChatIdentifierURL__block_invoke()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v0 = CKDraftsDirectoryURL();
  v1 = [v0 path];
  v8[0] = v1;
  v8[1] = @"Pending";
  v8[2] = @"chatid";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  BOOL v3 = [NSString pathWithComponents:v2];
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v3 isDirectory:0];
  v5 = (void *)_pendingChatIdentifierURL_sPendingChatIdentifierURL;
  _pendingChatIdentifierURL_sPendingChatIdentifierURL = v4;

  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = [(id)_pendingChatIdentifierURL_sPendingChatIdentifierURL URLByDeletingLastPathComponent];
  [v6 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:0];
}

- (id)_draftForKey:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_cachedDrafts objectForKey:v4];
  if (!v5)
  {
    v5 = +[CKComposition savedCompositionForGUID:v4];
    if (v5)
    {
      cachedDrafts = self->_cachedDrafts;
      if (!cachedDrafts)
      {
        uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        unint64_t v8 = self->_cachedDrafts;
        self->_cachedDrafts = v7;

        cachedDrafts = self->_cachedDrafts;
      }
      [(NSMutableDictionary *)cachedDrafts setObject:v5 forKey:v4];
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      __int16 v14 = v5;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "_draftForKey: %@, comp %@", (uint8_t *)&v11, 0x16u);
    }
  }

  return v5;
}

- (void)_setDraft:(id)a3 forKey:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    unint64_t v8 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "_setDraft: %@, %@", (uint8_t *)&v14, 0x16u);
    }
  }
  if (v6)
  {
    if (!self->_cachedDrafts)
    {
      uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      cachedDrafts = self->_cachedDrafts;
      self->_cachedDrafts = v9;
    }
    if (!self->_dirtyDraftIDs)
    {
      int v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      dirtyDraftIDs = self->_dirtyDraftIDs;
      self->_dirtyDraftIDs = v11;
    }
    id v13 = [(NSMutableDictionary *)self->_cachedDrafts objectForKey:v7];
    if (v13 != v6)
    {
      [(NSMutableDictionary *)self->_cachedDrafts setObject:v6 forKey:v7];
      [(NSMutableSet *)self->_dirtyDraftIDs addObject:v7];
    }
  }
  else
  {
    +[CKComposition deleteCompositionWithGUID:v7];
    [(NSMutableDictionary *)self->_cachedDrafts removeObjectForKey:v7];
    [(NSMutableSet *)self->_dirtyDraftIDs removeObject:v7];
  }
}

- (void)_setPendingRecipients:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_pendingRecipients != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong((id *)&self->_pendingRecipients, a3);
    NSUInteger v6 = [(NSArray *)self->_pendingRecipients count];
    v5 = v9;
    if (!v6)
    {
      id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      unint64_t v8 = [(CKDraftManager *)self _pendingRecipientsURL];
      [v7 removeItemAtURL:v8 error:0];

      v5 = v9;
    }
  }
}

- (id)_pendingRecipients
{
  pendingRecipients = self->_pendingRecipients;
  if (!pendingRecipients)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C978]);
    v5 = [(CKDraftManager *)self _pendingRecipientsURL];
    NSUInteger v6 = (NSArray *)[v4 initWithContentsOfURL:v5];
    id v7 = self->_pendingRecipients;
    self->_pendingRecipients = v6;

    pendingRecipients = self->_pendingRecipients;
  }

  return pendingRecipients;
}

- (void)_setPendingChatIdentifier:(id)a3
{
  v5 = (NSString *)a3;
  if (self->_pendingChatIdentifier != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong((id *)&self->_pendingChatIdentifier, a3);
    NSUInteger v6 = [(NSString *)self->_pendingChatIdentifier length];
    v5 = v9;
    if (!v6)
    {
      id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      unint64_t v8 = [(CKDraftManager *)self _pendingChatIdentifierURL];
      [v7 removeItemAtURL:v8 error:0];

      v5 = v9;
    }
  }
}

- (id)_pendingChatIdentifier
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  pendingChatIdentifier = self->_pendingChatIdentifier;
  if (!pendingChatIdentifier)
  {
    id v4 = [NSString alloc];
    v5 = [(CKDraftManager *)self _pendingChatIdentifierURL];
    id v12 = 0;
    NSUInteger v6 = (NSString *)[v4 initWithContentsOfURL:v5 encoding:4 error:&v12];
    id v7 = v12;
    unint64_t v8 = self->_pendingChatIdentifier;
    self->_pendingChatIdentifier = v6;

    if (v7 && IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [(CKDraftManager *)self _pendingChatIdentifierURL];
        *(_DWORD *)buf = 138412546;
        id v14 = v7;
        __int16 v15 = 2112;
        __int16 v16 = v10;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Got error while decoding _pendingChatIdentifier: %@, at: %@.", buf, 0x16u);
      }
    }

    pendingChatIdentifier = self->_pendingChatIdentifier;
  }

  return pendingChatIdentifier;
}

- (NSMutableDictionary)cachedDrafts
{
  return self->_cachedDrafts;
}

- (void)setCachedDrafts:(id)a3
{
}

- (NSMutableSet)dirtyDraftIDs
{
  return self->_dirtyDraftIDs;
}

- (void)setDirtyDraftIDs:(id)a3
{
}

- (NSArray)pendingRecipients
{
  return self->_pendingRecipients;
}

- (void)setPendingRecipients:(id)a3
{
}

- (NSString)pendingChatIdentifier
{
  return self->_pendingChatIdentifier;
}

- (void)setPendingChatIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingChatIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingRecipients, 0);
  objc_storeStrong((id *)&self->_dirtyDraftIDs, 0);

  objc_storeStrong((id *)&self->_cachedDrafts, 0);
}

- (void)saveCompositionAndFlushCache:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)saveCompositionAndFlushCache:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)saveCompositionAndFlushCache:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end