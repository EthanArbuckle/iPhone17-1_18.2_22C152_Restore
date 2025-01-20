@interface MessageGroupController
+ (MessageGroupController)sharedInstance;
+ (id)memberDisplayIDsFromParticipants:(id)a3 toIdentifier:(id)a4;
+ (void)addMembers:(id)a3 toHandleInfo:(id)a4;
- (BOOL)_canSendMessagesWithEngram;
- (BOOL)_checkForParticipantLeaveOnENGroup:(id)a3 groupMessagePayload:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 service:(id)a7;
- (BOOL)_hasValidSendParametersForMessage:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6;
- (BOOL)_participantsContainBizID:(id)a3;
- (BOOL)_serverAllowsMessageSend;
- (BOOL)_shouldAdjustTimestampOfResentMessages;
- (BOOL)_shouldDropMessageGroupID:(id)a3 participants:(id)a4 fromIdentifier:(id)a5 toIdentifier:(id)a6;
- (BOOL)_shouldRequestGroupPhoto:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationDate:(id)a5;
- (BOOL)_shouldSendEngramOnChat:(id)a3;
- (BOOL)shouldCompressGroupPayload:(id)a3;
- (BOOL)shouldDropDueToGroupSize:(id)a3;
- (IMDChatRegistry)chatRegistry;
- (MessageGroupController)initWithSession:(id)a3;
- (MessageServiceSession)session;
- (NSMutableDictionary)groupPhotoRequestsFromStorage;
- (NSMutableDictionary)groupPhotoRequestsInFlight;
- (NSMutableDictionary)mostRecentGroupPhotoRequestDates;
- (double)_groupPhotoRequestRateLimit;
- (double)_messageRetryTimeout;
- (id)IDSServerBagiMessageSharedInstance;
- (id)_findChatFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7;
- (id)_newSendContextForMessage:(id)a3 withChat:(id)a4;
- (id)chatForGroupMessagePayload:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5;
- (id)engramControllerSharedInstance;
- (id)findChatWithMessageData:(id)a3 account:(id)a4 session:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 timestamp:(id)a8;
- (id)lockDownManager;
- (id)newGroupMessagePayloadForChat:(id)a3 fromID:(id)a4;
- (int64_t)currentMessageSendServerVersion;
- (void)_addGroupPhotoRefreshDate:(id)a3 context:(id)a4;
- (void)_addOriginalTimestampIfNecessary:(id)a3 context:(id)a4;
- (void)_checkAndPerformLegacyAddRemove:(id)a3 participantsToAdd:(id)a4 participantsToRemove:(id)a5 service:(id)a6 fromIdentifier:(id)a7;
- (void)_handleGroupVisualIdentityRequest:(id)a3 fromParticipants:(id)a4 groupID:(id)a5 identifier:(id)a6 session:(id)a7 toIdentifier:(id)a8 fromToken:(id)a9 requestGUID:(id)a10;
- (void)_populateP2PDictionary:(id)a3 chat:(id)a4 fromID:(id)a5;
- (void)_populateP2PDictionary:(id)a3 chat:(id)a4 omitName:(BOOL)a5 fromID:(id)a6;
- (void)_requestGroupPhotoUpdate:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5 session:(id)a6;
- (void)_sendGroupPhoto:(id)a3 toIdentifier:(id)a4 fromIdentifier:(id)a5 toToken:(id)a6 session:(id)a7 requestGUID:(id)a8;
- (void)addParticipants:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 service:(id)a8 groupPhoto:(id)a9 completionBlock:(id)a10;
- (void)dealloc;
- (void)engroupForChat:(id)a3 service:(id)a4 completionBlock:(id)a5;
- (void)handleAddToNewGroup:(id)a3 groupID:(id)a4 groupPhotoTransferDict:(id)a5 identifier:(id)a6 session:(id)a7 toIdentifier:(id)a8 toName:(id)a9 toParticipants:(id)a10;
- (void)handler:(id)a3 account:(id)a4 groupMessagePayload:(id)a5 messageID:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 idsService:(id)a9 fromToken:(id)a10 timeStamp:(id)a11 storageContext:(id)a12;
- (void)leaveChat:(id)a3 fromID:(id)a4 fromAccount:(id)a5 session:(id)a6 service:(id)a7 completionBlock:(id)a8;
- (void)receiveGroupUpdate:(id)a3 chat:(id)a4 service:(id)a5;
- (void)receiveMessageData:(id)a3 account:(id)a4 session:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 incomingEngroup:(id)a8 service:(id)a9 timestamp:(id)a10 fromStorage:(BOOL)a11 completionBlock:(id)a12;
- (void)receiveMessageData:(id)a3 session:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timestamp:(id)a7 fromStorage:(BOOL)a8 completionBlock:(id)a9;
- (void)removeParticipants:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 service:(id)a8 completionBlock:(id)a9;
- (void)requestGroupPhotoIfNecessary:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationDate:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 messageIsFromStorage:(BOOL)a8 session:(id)a9;
- (void)requestGroupPhotosForMessagesFromStorage;
- (void)sendMessage:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 service:(id)a8 completionBlock:(id)a9;
- (void)setGroupPhoto:(id)a3 forChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 isPhotoRefresh:(BOOL)a8;
- (void)setName:(id)a3 fromName:(id)a4 forChat:(id)a5 fromID:(id)a6 fromAccount:(id)a7 messageID:(id)a8 session:(id)a9 completionBlock:(id)a10;
@end

@implementation MessageGroupController

- (id)IDSServerBagiMessageSharedInstance
{
  return +[IDSServerBag sharedInstanceForBagType:1];
}

- (id)lockDownManager
{
  return +[IMLockdownManager sharedInstance];
}

- (id)engramControllerSharedInstance
{
  return +[MessageEngramGroupController sharedInstance];
}

+ (MessageGroupController)sharedInstance
{
  if (qword_EC510 != -1) {
    dispatch_once(&qword_EC510, &stru_DF828);
  }
  return (MessageGroupController *)qword_EC528;
}

- (IMDChatRegistry)chatRegistry
{
  return +[IMDChatRegistry sharedInstance];
}

- (id)chatForGroupMessagePayload:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5
{
  id v9 = [a3 _stringForKey:off_EB058[0]];
  id v10 = [a3 _stringForKey:off_EB060[0]];
  id v11 = [a3 _arrayForKey:@"p"];
  v12 = [(MessageGroupController *)self session];

  return [(MessageServiceSession *)v12 bestCandidateGroupChatWithFromIdentifier:a4 toIdentifier:a5 displayName:v9 participants:v11 groupID:v10];
}

- (id)newGroupMessagePayloadForChat:(id)a3 fromID:(id)a4
{
  if ([a3 style] == 45) {
    return 0;
  }
  v7 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v8 = [(MessageServiceSession *)[(MessageGroupController *)self session] groupIDForChat:a3];
  if (v8) {
    CFDictionarySetValue(v7, off_EAFF0[0], v8);
  }
  id v9 = [a3 displayName];
  if (v9) {
    CFDictionarySetValue(v7, off_EB058[0], v9);
  }
  id v10 = sub_76578((__CFArray *)a3, a4);
  if (v10) {
    CFDictionarySetValue(v7, @"p", v10);
  }
  return v7;
}

- (MessageGroupController)initWithSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MessageGroupController;
  v4 = [(MessageGroupController *)&v7 init];
  if (v4)
  {
    v4->_groupPhotoRequestsFromStorage = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->_groupPhotoRequestsInFlight = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->_mostRecentGroupPhotoRequestDates = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    objc_storeWeak((id *)&v4->_session, a3);
    v5 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v5 addObserver:v4 selector:"requestGroupPhotosForMessagesFromStorage" name:IMMessageFromStorageTimerFiredNotification object:0];
  }
  return v4;
}

- (void)dealloc
{
  [+[IMMobileNetworkManager sharedInstance] removeFastDormancyDisableToken:@"iMessageGroupManager"];

  v3.receiver = self;
  v3.super_class = (Class)MessageGroupController;
  [(MessageGroupController *)&v3 dealloc];
}

- (int64_t)currentMessageSendServerVersion
{
  return 0;
}

- (BOOL)_canSendMessagesWithEngram
{
  unsigned int v3 = +[IMUserDefaults isEngramEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(MessageGroupController *)self _serverAllowsMessageSend];
  }
  return v3;
}

- (BOOL)_serverAllowsMessageSend
{
  id v3 = [(MessageGroupController *)self IDSServerBagiMessageSharedInstance];
  id v4 = [v3 objectForKey:off_EB098];
  if (v4) {
    id v5 = [v4 integerValue];
  }
  else {
    id v5 = 0;
  }
  int64_t v6 = [(MessageGroupController *)self currentMessageSendServerVersion];
  if (IMOSLoggingEnabled())
  {
    objc_super v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if ((uint64_t)v5 > v6) {
        CFStringRef v8 = @"NO";
      }
      else {
        CFStringRef v8 = @"YES";
      }
      int v10 = 138412802;
      CFStringRef v11 = v8;
      __int16 v12 = 2112;
      v13 = +[NSNumber numberWithInteger:v5];
      __int16 v14 = 2112;
      v15 = +[NSNumber numberWithInteger:[(MessageGroupController *)self currentMessageSendServerVersion]];
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Server is allowing us to send messages to engroups: %@ serverVersion: %@ localVersion: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  return (uint64_t)v5 <= v6;
}

- (BOOL)_shouldAdjustTimestampOfResentMessages
{
  return _IMSharedHelperShouldAdjustTimestampOfResentMessages(self, a2);
}

- (double)_messageRetryTimeout
{
  _IMSharedHelperRetryTimeout(self, a2);
  return result;
}

- (void)_addOriginalTimestampIfNecessary:(id)a3 context:(id)a4
{
  id v7 = [a3 messageSummaryInfo];
  unsigned int v8 = objc_msgSend(objc_msgSend(v7, "objectForKey:", IMMessageSummaryInfoUpdatedDateWithServerTime), "BOOLValue");
  if ([(MessageGroupController *)self _shouldAdjustTimestampOfResentMessages]
    && v8)
  {
    id v9 = [a3 time];
    if (IMOSLoggingEnabled())
    {
      int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412546;
        id v13 = [a3 time];
        __int16 v14 = 2112;
        id v15 = [a3 guid];
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Adding original timestamp %@ to message context with GUID %@", (uint8_t *)&v12, 0x16u);
      }
    }
    CFStringRef v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "__im_nanosecondTimeIntervalSinceEpochTime"));
    if (v11) {
      CFDictionarySetValue((CFMutableDictionaryRef)a4, @"oe", v11);
    }
  }
}

- (void)_addGroupPhotoRefreshDate:(id)a3 context:(id)a4
{
  id v5 = [a3 groupPhotoGuid];
  id v6 = [+[IMDFileTransferCenter sharedInstance] transferForGUID:v5];
  if (!v6)
  {
    id v6 = [+[IMDAttachmentStore sharedInstance] attachmentWithGUID:v5];
    if (!v6)
    {
      if (!IMOSLoggingEnabled()) {
        return;
      }
      CFStringRef v11 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
        return;
      }
      LOWORD(v13) = 0;
      int v12 = "File transfers from both IMDFileTransferCenter and IMDAttachmentStore are empty. Not updating the date";
LABEL_15:
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v13, 2u);
      return;
    }
  }
  id v7 = [v6 refreshDate];
  int v8 = IMOSLoggingEnabled();
  if (!v7)
  {
    if (!v8) {
      return;
    }
    CFStringRef v11 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v13) = 0;
    int v12 = "Refresh Date is nil, not adding the date to the message context.";
    goto LABEL_15;
  }
  if (v8)
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Adding group photo refresh date %@ to message context", (uint8_t *)&v13, 0xCu);
    }
  }
  int v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "__im_nanosecondTimeIntervalSinceEpochTime"));
  if (v10) {
    CFDictionarySetValue((CFMutableDictionaryRef)a4, @"gpru", v10);
  }
}

- (void)sendMessage:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 service:(id)a8 completionBlock:(id)a9
{
  uint64_t v16 = v32;
  unsigned __int8 v17 = -[MessageGroupController _hasValidSendParametersForMessage:toChat:fromID:fromAccount:](self, "_hasValidSendParametersForMessage:toChat:fromID:fromAccount:");
  if (v32 && (v17 & 1) == 0)
  {
    uint64_t v18 = *(void *)(v32 + 16);
    HIDWORD(v32) = 4;
    LOBYTE(v32) = 0;
    __asm { BRAA            X9, X8 }
  }
  if (v32)
  {
    id v19 = [(MessageGroupController *)self _newSendContextForMessage:a3 withChat:a4];
    [(MessageGroupController *)self _addOriginalTimestampIfNecessary:a3 context:v19];
    [(MessageGroupController *)self _addGroupPhotoRefreshDate:a4 context:v19];
    if (([a3 isTypingMessage] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v27 = 138412546;
          uint64_t v28 = v32;
          __int16 v29 = 2112;
          id v30 = v19;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Group message success, calling completion block: %@  (Context: %@)", (uint8_t *)&v27, 0x16u);
        }
      }
    }
    unsigned int v21 = [(MessageGroupController *)self _shouldSendEngramOnChat:a4];
    int v22 = IMOSLoggingEnabled();
    if (v21)
    {
      if (v22)
      {
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Engram enabled, so we will try to look up the group or create a group if we don't have one", (uint8_t *)&v27, 2u);
        }
      }
      objc_msgSend(-[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance"), "sendMessageWithEngram:chat:service:fromID:fromAccount:session:context:groupController:completionBlock:", a3, a4, a8, a5, a6, a7, v19, self, v16);
    }
    else
    {
      if (v22)
      {
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Engram disabled, sending with legacy crypto", (uint8_t *)&v27, 2u);
        }
      }
      LOBYTE(v26) = 1;
      (*(void (**)(uint64_t, MessageGroupController *, id, id, id, id, id, void, void))(v16 + 16))(v16, self, a4, a3, a5, a6, v19, 0, v26);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Group message success, no completion block specified", (uint8_t *)&v27, 2u);
    }
  }
}

- (BOOL)_hasValidSendParametersForMessage:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6
{
  if (a3 && a4 && (id v10 = [a5 length], a6) && v10)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    int v11 = IMOSLoggingEnabled();
    if (v11)
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      int v11 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if (v11)
      {
        int v14 = 138413058;
        id v15 = a3;
        __int16 v16 = 2112;
        id v17 = a4;
        __int16 v18 = 2112;
        id v19 = a5;
        __int16 v20 = 2112;
        id v21 = a6;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Invalid request to send message: %@ to chat: %@ from ID: %@ fromAccount: %@", (uint8_t *)&v14, 0x2Au);
        LOBYTE(v11) = 0;
      }
    }
  }
  return v11;
}

- (BOOL)_shouldSendEngramOnChat:(id)a3
{
  unsigned int v4 = [(MessageGroupController *)self _canSendMessagesWithEngram];
  if (v4)
  {
    if ([a3 style] == 43)
    {
      LOBYTE(v4) = +[IMUserDefaults __im_isEngramEnabledForGroups];
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (id)_newSendContextForMessage:(id)a3 withChat:(id)a4
{
  id v6 = objc_msgSend(a4, "displayName", a3);
  id v7 = [(MessageServiceSession *)[(MessageGroupController *)self session] groupIDForChat:a4];
  int v8 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v9 = [a4 properties];
  id v10 = (const void *)IMDChatGroupParticipantVersionKey;
  if ([v9 objectForKey:IMDChatGroupParticipantVersionKey])
  {
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  setParticipantVersionForChat(a4, 0);
  if (v6) {
LABEL_3:
  }
    CFDictionarySetValue(v8, off_EB058[0], v6);
LABEL_4:
  if (v7) {
    CFDictionarySetValue(v8, off_EB060[0], v7);
  }
  if (off_EB070[0]) {
    CFDictionarySetValue(v8, off_EB068[0], off_EB070[0]);
  }
  int v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a4 groupParticipantVersion]);
  if (v11) {
    CFDictionarySetValue(v8, v10, v11);
  }
  return v8;
}

+ (id)memberDisplayIDsFromParticipants:(id)a3 toIdentifier:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_77428;
  v5[3] = &unk_DF850;
  v5[4] = a4;
  return objc_msgSend(objc_msgSend(a3, "__imArrayByFilteringWithBlock:", v5), "_IDsFromURIs");
}

+ (void)addMembers:(id)a3 toHandleInfo:(id)a4
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    uint64_t v8 = kFZChatParticipantStatusKey;
    uint64_t v9 = kFZPersonID;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(a4, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2), v8, *(void *)(*((void *)&v12 + 1) + 8 * (void)v10), v9, 0));
        id v10 = (char *)v10 + 1;
      }
      while (v6 != v10);
      id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)receiveMessageData:(id)a3 session:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timestamp:(id)a7 fromStorage:(BOOL)a8 completionBlock:(id)a9
{
  LOBYTE(v9) = a8;
  -[MessageGroupController receiveMessageData:account:session:toIdentifier:fromIdentifier:incomingEngroup:service:timestamp:fromStorage:completionBlock:](self, "receiveMessageData:account:session:toIdentifier:fromIdentifier:incomingEngroup:service:timestamp:fromStorage:completionBlock:", a3, [a4 account], a4, a5, a6, 0, 0, a7, v9, a9);
}

- (id)findChatWithMessageData:(id)a3 account:(id)a4 session:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 timestamp:(id)a8
{
  if (IMOSLoggingEnabled())
  {
    long long v12 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Trying to find chat", (uint8_t *)&v23, 2u);
    }
  }
  [a3 _FTOptionallyDecompressData];
  long long v13 = (void *)JWDecodeDictionary();
  if ([v13 count])
  {
    id v14 = [v13 _stringForKey:off_EB058[0]];
    id v15 = [v13 _stringForKey:off_EB060[0]];
    id v16 = [v13 _arrayForKey:@"p"];
    if ((unint64_t)[v16 count] < 3) {
      id v17 = 0;
    }
    else {
      id v17 = [(MessageGroupController *)self _findChatFromIdentifier:a7 toIdentifier:a6 displayName:v14 participants:v16 groupID:v15];
    }
    if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        id v24 = v17;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Found chat in second attempt %@", (uint8_t *)&v23, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v18 = JWDecodeDictionary();
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, " ******* that failed, trying a simple decode now", (uint8_t *)&v23, 2u);
      }
    }
    if (!v18)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v20 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v23 = 138412290;
          id v24 = a3;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, " ******* BAD DATA: %@", (uint8_t *)&v23, 0xCu);
        }
      }
    }
    return 0;
  }
  return v17;
}

- (void)receiveMessageData:(id)a3 account:(id)a4 session:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 incomingEngroup:(id)a8 service:(id)a9 timestamp:(id)a10 fromStorage:(BOOL)a11 completionBlock:(id)a12
{
  uint64_t v18 = v90;
  id v19 = v88;
  id v20 = [a3 length];
  if (v90) {
    BOOL v21 = v20 == 0;
  }
  else {
    BOOL v21 = 0;
  }
  if (v21)
  {
    uint64_t v29 = *(void *)(v90 + 16);
    __asm { BRAA            X8, X7 }
  }
  if (v90)
  {
    uint64_t v59 = v87;
    id v62 = a8;
    id v63 = a5;
    unsigned int v64 = log;
    [a3 _FTOptionallyDecompressData];
    int v22 = (void *)JWDecodeDictionary();
    if (![v22 count])
    {
      int v22 = (void *)JWDecodeDictionary();
      if (IMOSLoggingEnabled())
      {
        int v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          LOWORD(v68) = 0;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, " ******* that failed, trying a simple decode now", (uint8_t *)&v68, 2u);
        }
      }
      if (!v22)
      {
        if (IMOSLoggingEnabled())
        {
          id v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            int v68 = 138412290;
            id v69 = a3;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, " ******* BAD DATA: %@", (uint8_t *)&v68, 0xCu);
          }
        }
        int v22 = 0;
      }
    }
    id v25 = [v22 _arrayForKey:@"p"];
    if ((unint64_t)[v25 count] < 3)
    {
      id v27 = 0;
      id v65 = 0;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        unsigned int v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LOWORD(v68) = 0;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "This is a group chat. Looking for group name and groupID", (uint8_t *)&v68, 2u);
        }
      }
      id v65 = [v22 _stringForKey:off_EB058[0]];
      id v27 = [v22 _stringForKey:off_EB060[0]];
      id v28 = [v22 _numberForKey:@"gpru"];
      if ([v28 unsignedLongLongValue]) {
        +[NSDate __im_iMessageDateFromTimeStamp:v28];
      }
    }
    if ([(MessageGroupController *)self _shouldDropMessageGroupID:v27 participants:v25 fromIdentifier:a7 toIdentifier:a6])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          int v68 = 138412546;
          id v69 = v27;
          __int16 v70 = 2112;
          id v71 = v25;
          _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Dropping message from MessageGroupController. groupID: %@ participants: %@", (uint8_t *)&v68, 0x16u);
        }
      }
      (*(void (**)(uint64_t, MessageGroupController *, void, void, void, void, void))(v18 + 16))(v18, self, 0, 0, 0, 0, 0);
      return;
    }
    uint64_t v58 = IMDChatGroupParticipantVersionKey;
    id v61 = objc_msgSend(objc_msgSend(v22, "_numberForKey:"), "integerValue");
    if ((unint64_t)[v25 count] < 3)
    {
      v50 = 0;
    }
    else
    {
      v60 = [(MessageGroupController *)self _findChatFromIdentifier:a7 toIdentifier:a6 displayName:v65 participants:v25 groupID:v27];
      if (![(MessageGroupController *)self _canSendMessagesWithEngram])
      {
        unsigned int v55 = objc_msgSend(-[__CFArray __imSetFromArray](sub_76578(v60, a6), "__imSetFromArray"), "isEqualToSet:", objc_msgSend(objc_msgSend(v25, "__imArrayByApplyingBlock:", &stru_DF890), "__imSetFromArray"));
        id v54 = [(__CFArray *)v60 groupParticipantVersion];
        id v32 = [(__CFArray *)v60 properties];
        id v56 = [v32 objectForKey:off_EB080[0]];
        uint64_t v33 = (uint64_t)[v19 longLongValue];
        uint64_t v34 = v33 / 1000000000 - (void)[v56 longLongValue];
        id v35 = [v22 _stringForKey:off_EB068[0]];
        if (IMOSLoggingEnabled())
        {
          v53 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            id v57 = [v56 longLongValue];
            uint64_t v36 = (uint64_t)[v19 longLongValue];
            v37 = +[NSNumber numberWithBool:v64];
            int v68 = 134220034;
            id v69 = v54;
            __int16 v70 = 2048;
            id v71 = v61;
            __int16 v72 = 2048;
            uint64_t v73 = v34;
            __int16 v74 = 2048;
            id v75 = v57;
            __int16 v76 = 2048;
            uint64_t v77 = v36 / 1000000000;
            CFStringRef v38 = @"NO";
            __int16 v78 = 2112;
            id v79 = v25;
            __int16 v80 = 2112;
            id v81 = v35;
            __int16 v82 = 2112;
            if (v55) {
              CFStringRef v38 = @"YES";
            }
            CFStringRef v83 = v38;
            __int16 v84 = 2112;
            v85 = v37;
            _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, "receiveMessageData localVersion: %ld, versionReceived:%ld, timeDifference: %lld, lastUpdated:%lld, timestamp:%lld, participants: %@, protocolVersion: %@, isIncomingParticipantSetSame %@, fromStorage %@", (uint8_t *)&v68, 0x5Cu);
          }
        }
        int v39 = (v35 == 0) & ~v55;
        if ((uint64_t)v54 <= (uint64_t)v61) {
          int v39 = 1;
        }
        if (v34 > 10) {
          int v40 = v39;
        }
        else {
          int v40 = 0;
        }
        if (!v35)
        {
          if (IMOSLoggingEnabled())
          {
            v41 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              LOWORD(v68) = 0;
              _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "Not converving participants. Message from legacy device", (uint8_t *)&v68, 2u);
            }
          }
          int v40 = 0;
        }
        if (IMOSLoggingEnabled())
        {
          v42 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            CFStringRef v43 = @"NO";
            if (v40) {
              CFStringRef v43 = @"YES";
            }
            int v68 = 138412290;
            id v69 = (id)v43;
            _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "shouldConvergeParticipants: %@", (uint8_t *)&v68, 0xCu);
          }
        }
        if ([v27 length])
        {
          id v44 = [v25 count];
          if (a6)
          {
            if (a7 && (unint64_t)v44 >= 2)
            {
              int v45 = [(__CFArray *)v60 style] == 45 ? 0 : v40;
              if (v45 == 1)
              {
                v67[0] = _NSConcreteStackBlock;
                v67[1] = 3221225472;
                v67[2] = sub_782E8;
                v67[3] = &unk_DF8B8;
                v67[4] = a6;
                v46 = (__CFString *)objc_msgSend(objc_msgSend(v25, "__imArrayByApplyingBlock:", v67), "__imArrayByApplyingBlock:", &stru_DF8D8);
                BOOL v47 = [v22 _numberForKey:v58] == 0;
                int v48 = IMOSLoggingEnabled();
                if (v47)
                {
                  if (v48)
                  {
                    v51 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                    {
                      LOWORD(v68) = 0;
                      _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "Incrementing participant version by 1 on message receive.", (uint8_t *)&v68, 2u);
                    }
                  }
                  incrementParticipantVersionForChat(v60);
                }
                else
                {
                  if (v48)
                  {
                    v49 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                    {
                      int v68 = 134217984;
                      id v69 = v61;
                      _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "Setting participant version to version received :%ld", (uint8_t *)&v68, 0xCu);
                    }
                  }
                  setParticipantVersionForChat(v60, (uint64_t)v61);
                }
                _ConvergeGroupParticipants(v63, v60, (uint64_t)v27, v46, a6, a7, (int)[a6 isEqualToIgnoringCase:a7], 0, 2, a4);
              }
            }
          }
        }
      }
      if (!v62) {
        goto LABEL_78;
      }
      v50 = v60;
      if (v60)
      {
        if ([(MessageGroupController *)self _canSendMessagesWithEngram]) {
          [(MessageGroupController *)self receiveGroupUpdate:v62 chat:v60 service:v59];
        }
LABEL_78:
        v50 = v60;
      }
    }
    v52 = v50;
    -[MessageGroupController requestGroupPhotoIfNecessary:incomingParticipantVersion:incomingGroupPhotoCreationDate:toIdentifier:fromIdentifier:messageIsFromStorage:session:](self, "requestGroupPhotoIfNecessary:incomingParticipantVersion:incomingGroupPhotoCreationDate:toIdentifier:fromIdentifier:messageIsFromStorage:session:", v63);
    (*(void (**)(uint64_t, MessageGroupController *, __CFArray *, id, id, id, void *))(v18 + 16))(v18, self, v52, v27, v65, v25, v22);
    return;
  }
  if (IMOSLoggingEnabled())
  {
    id v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      LOWORD(v68) = 0;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Message received, no completion block specified", (uint8_t *)&v68, 2u);
    }
  }
}

- (void)engroupForChat:(id)a3 service:(id)a4 completionBlock:(id)a5
{
  if (+[IMUserDefaults isEngramEnabled])
  {
    id v9 = [a3 engramID];
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Going to look up the engroup for engramID: %@", buf, 0xCu);
      }
    }
    if ([v9 length])
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_785AC;
      v13[3] = &unk_DF3E8;
      v13[5] = self;
      v13[6] = a5;
      v13[4] = a3;
      objc_msgSend(-[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance"), "lookUpENGroupForChat:service:completion:", a3, a4, v13);
      return;
    }
    if (IMOSLoggingEnabled())
    {
      long long v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = a3;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "No engramID for chat: %@ defaulting to legacy crypto", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Engram is disabled on this device, failed to lookup group", buf, 2u);
    }
  }
  (*((void (**)(id, MessageGroupController *, id, void, void, void))a5 + 2))(a5, self, a3, 0, 0, 0);
}

- (void)receiveGroupUpdate:(id)a3 chat:(id)a4 service:(id)a5
{
  if (a3)
  {
    id v9 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "groupID"), "stableGroupID"), "dataRepresentation"), "__im_engramStringRepresentation");
    if ([v9 length])
    {
      unsigned __int8 v10 = objc_msgSend(objc_msgSend(a4, "engramID"), "isEqualToString:", v9);
      int v11 = IMOSLoggingEnabled();
      if (v10)
      {
        if (v11)
        {
          long long v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            LOWORD(v16) = 0;
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Incoming engram id is same as this chat's engram id.", (uint8_t *)&v16, 2u);
          }
        }
        if ([a4 style] == 43
          && (unint64_t)objc_msgSend(objc_msgSend(a4, "participants"), "count") >= 3)
        {
          if (IMOSLoggingEnabled())
          {
            long long v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              LOWORD(v16) = 0;
              _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "We have a group chat so going to take the incoming group's participants", (uint8_t *)&v16, 2u);
            }
          }
          objc_msgSend(-[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance"), "convergeOnIncomingGroup:chat:service:", a3, a4, a5);
        }
      }
      else
      {
        if (v11)
        {
          id v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            int v16 = 138412546;
            id v17 = v9;
            __int16 v18 = 2112;
            id v19 = [a4 chatIdentifier];
            _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Storing engram id as %@ for chat with identifier: %@", (uint8_t *)&v16, 0x16u);
          }
        }
        [a4 updateEngramID:v9];
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Didn't get an engramID to store from a groupID data representation", (uint8_t *)&v16, 2u);
      }
    }
  }
}

- (void)addParticipants:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 service:(id)a8 groupPhoto:(id)a9 completionBlock:(id)a10
{
  if ([a4 style] == 45)
  {
    if (IMOSLoggingEnabled())
    {
      int v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v50 = a4;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "No need to add participants, this is a 1-1 chat: %@", buf, 0xCu);
      }
    }
    if (a10) {
      (*((void (**)(id, MessageGroupController *, id, id, uint64_t, void))a10 + 2))(a10, self, a4, a3, 1, 0);
    }
  }
  else
  {
    id v17 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    [(MessageGroupController *)self _populateP2PDictionary:v17 chat:a4 fromID:a5];
    if (off_EB020[0]) {
      CFDictionarySetValue(v17, off_EB010[0], off_EB020[0]);
    }
    id v18 = [a4 displayName];
    if (v18) {
      CFDictionarySetValue(v17, off_EAFF8[0], v18);
    }
    id v19 = [sub_76578((__CFArray *)a4, a5) arrayByAddingObjectsFromArray:a3];
    if (v19) {
      CFDictionarySetValue(v17, off_EB000[0], v19);
    }
    if (a9) {
      CFDictionarySetValue(v17, off_EB008[0], a9);
    }
    incrementParticipantVersionForChat(a4);
    sub_790AC(a4, 0);
    id v20 = [a4 properties];
    BOOL v21 = (const void *)IMDChatGroupParticipantVersionKey;
    id v22 = [v20 objectForKey:IMDChatGroupParticipantVersionKey];
    if (v22) {
      CFDictionarySetValue(v17, v21, v22);
    }
    if (a10)
    {
      uint64_t v44 = 0;
      int v45 = &v44;
      uint64_t v46 = 0x2020000000;
      char v47 = 1;
      if ([(MessageGroupController *)self _canSendMessagesWithEngram])
      {
        if (IMOSLoggingEnabled())
        {
          int v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "engramEnabled and we are adding a participant to the engroup", buf, 2u);
          }
        }
        id v24 = +[NSNumber numberWithInteger:1];
        if (v24) {
          CFDictionarySetValue(v17, off_EB088[0], v24);
        }
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_79250;
        v43[3] = &unk_DF900;
        v43[10] = a10;
        v43[11] = &v44;
        v43[4] = self;
        v43[5] = a4;
        v43[6] = a3;
        v43[7] = a7;
        v43[8] = v17;
        v43[9] = a5;
        objc_msgSend(-[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance", v24), "addParticipantsToENGroup:chat:service:fromID:completion:", a3, a4, a8, a5, v43);
      }
      if (*((unsigned char *)v45 + 24))
      {
        if (IMOSLoggingEnabled())
        {
          id v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            unsigned int v26 = +[IMUserDefaults isEngramEnabled];
            CFStringRef v27 = @"NO";
            if (v26) {
              CFStringRef v27 = @"YES";
            }
            *(_DWORD *)buf = 138412546;
            id v50 = (id)v27;
            __int16 v51 = 2112;
            id v52 = a8;
            _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Adding participants through legacy methods isEnabled: %@ idsService: %@", buf, 0x16u);
          }
        }
        (*((void (**)(id, MessageGroupController *, id, id, uint64_t, void))a10 + 2))(a10, self, a4, a3, 1, 0);
        if (a7)
        {
          id v28 = [sub_76578((__CFArray *)a4, a5) arrayByAddingObjectsFromArray:a3];
          if (IMOSLoggingEnabled())
          {
            uint64_t v29 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              id v30 = [(MessageServiceSession *)[(MessageGroupController *)self session] groupIDForChat:a4];
              *(_DWORD *)buf = 138413058;
              id v50 = a3;
              __int16 v51 = 2112;
              id v52 = v30;
              __int16 v53 = 2112;
              id v54 = a4;
              __int16 v55 = 2112;
              id v56 = v17;
              _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "* Adding participants: %@    groupID: %@   chat: %@   dictionary: %@", buf, 0x2Au);
            }
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v50 = v28;
              _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "target Participants :%@", buf, 0xCu);
            }
          }
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v32 = [v28 countByEnumeratingWithState:&v39 objects:v48 count:16];
          if (v32)
          {
            uint64_t v34 = *(void *)v40;
            *(void *)&long long v33 = 138412290;
            long long v38 = v33;
            do
            {
              for (i = 0; i != v32; i = (char *)i + 1)
              {
                if (*(void *)v40 != v34) {
                  objc_enumerationMutation(v28);
                }
                uint64_t v36 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                if (IMOSLoggingEnabled())
                {
                  v37 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v38;
                    id v50 = v36;
                    _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "handle in target Participants :%@", buf, 0xCu);
                  }
                }
                objc_msgSend(a7, "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:", v17, a5, v36, 0, v38);
              }
              id v32 = [v28 countByEnumeratingWithState:&v39 objects:v48 count:16];
            }
            while (v32);
          }
          objc_msgSend(a7, "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:", v17, a5, objc_msgSend(a5, "_stripFZIDPrefix"), 0);
        }
      }
      _Block_object_dispose(&v44, 8);
    }
  }
}

- (void)removeParticipants:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 service:(id)a8 completionBlock:(id)a9
{
  if ([a4 style] == 45)
  {
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = a4;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "No need to remove participants, this is a 1-1 chat: %@", buf, 0xCu);
      }
    }
    if (a9) {
      (*((void (**)(id, MessageGroupController *, id, id, uint64_t, void))a9 + 2))(a9, self, a4, a3, 1, 0);
    }
  }
  else
  {
    int v16 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    [(MessageGroupController *)self _populateP2PDictionary:v16 chat:a4 fromID:a5];
    if (off_EB020[0]) {
      CFDictionarySetValue(v16, off_EB010[0], off_EB020[0]);
    }
    id v17 = [a4 displayName];
    if (v17) {
      CFDictionarySetValue(v16, off_EAFF8[0], v17);
    }
    id v18 = [sub_76578((__CFArray *)a4, a5) arrayByExcludingObjectsInArray:a3];
    if (v18) {
      CFDictionarySetValue(v16, off_EB000[0], v18);
    }
    incrementParticipantVersionForChat(a4);
    sub_790AC(a4, 0);
    id v19 = [a4 properties];
    id v20 = (const void *)IMDChatGroupParticipantVersionKey;
    id v21 = [v19 objectForKey:IMDChatGroupParticipantVersionKey];
    if (v21) {
      CFDictionarySetValue(v16, v20, v21);
    }
    if (a9)
    {
      uint64_t v38 = 0;
      long long v39 = &v38;
      uint64_t v40 = 0x2020000000;
      char v41 = 1;
      if ([(MessageGroupController *)self _canSendMessagesWithEngram])
      {
        if (IMOSLoggingEnabled())
        {
          id v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "engramEnabled and we are removing a participant from the engroup", buf, 2u);
          }
        }
        int v23 = +[NSNumber numberWithInteger:1];
        if (v23) {
          CFDictionarySetValue(v16, off_EB088[0], v23);
        }
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_799EC;
        v37[3] = &unk_DF900;
        v37[10] = a9;
        v37[11] = &v38;
        v37[4] = self;
        v37[5] = a4;
        v37[6] = a3;
        v37[7] = a7;
        v37[8] = v16;
        v37[9] = a5;
        objc_msgSend(-[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance", v23), "removeParticipantsFromENGroup:chat:service:fromID:completion:", a3, a4, a8, a5, v37);
      }
      if (*((unsigned char *)v39 + 24))
      {
        if (IMOSLoggingEnabled())
        {
          id v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            unsigned int v25 = +[IMUserDefaults isEngramEnabled];
            CFStringRef v26 = @"NO";
            if (v25) {
              CFStringRef v26 = @"YES";
            }
            *(_DWORD *)buf = 138412546;
            id v44 = (id)v26;
            __int16 v45 = 2112;
            id v46 = a8;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Removing participants with legacy methods isEngramEnabled: %@ idsService: %@", buf, 0x16u);
          }
        }
        (*((void (**)(id, MessageGroupController *, id, id, uint64_t, void))a9 + 2))(a9, self, a4, a3, 1, 0);
        if (a7)
        {
          if (IMOSLoggingEnabled())
          {
            CFStringRef v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              id v28 = [(MessageServiceSession *)[(MessageGroupController *)self session] groupIDForChat:a4];
              *(_DWORD *)buf = 138413058;
              id v44 = a3;
              __int16 v45 = 2112;
              id v46 = v28;
              __int16 v47 = 2112;
              id v48 = a4;
              __int16 v49 = 2112;
              id v50 = v16;
              _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "* Removing participants: %@    groupID: %@   chat: %@   dictionary: %@", buf, 0x2Au);
            }
          }
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v29 = objc_msgSend(a4, "participants", 0);
          id v30 = [v29 countByEnumeratingWithState:&v33 objects:v42 count:16];
          if (v30)
          {
            uint64_t v31 = *(void *)v34;
            do
            {
              for (i = 0; i != v30; i = (char *)i + 1)
              {
                if (*(void *)v34 != v31) {
                  objc_enumerationMutation(v29);
                }
                objc_msgSend(a7, "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:", v16, a5, objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "ID"), 0);
              }
              id v30 = [v29 countByEnumeratingWithState:&v33 objects:v42 count:16];
            }
            while (v30);
          }
          objc_msgSend(a7, "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:", v16, a5, objc_msgSend(a5, "_stripFZIDPrefix"), 0);
        }
      }
      _Block_object_dispose(&v38, 8);
    }
  }
}

- (void)leaveChat:(id)a3 fromID:(id)a4 fromAccount:(id)a5 session:(id)a6 service:(id)a7 completionBlock:(id)a8
{
  id v11 = a3;
  if ([a3 style] == 45)
  {
    if (IMOSLoggingEnabled())
    {
      long long v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v11;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "No need to leave chat, this is a 1-1 chat: %@", buf, 0xCu);
      }
    }
    if (a8) {
      (*((void (**)(id, MessageGroupController *, id, uint64_t, void))a8 + 2))(a8, self, v11, 1, 0);
    }
  }
  else if (a6)
  {
    id v37 = a8;
    long long v13 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    [(MessageGroupController *)self _populateP2PDictionary:v13 chat:v11 fromID:a4];
    if (off_EB020[0]) {
      CFDictionarySetValue(v13, off_EB010[0], off_EB020[0]);
    }
    id v14 = [v11 displayName];
    if (v14) {
      CFDictionarySetValue(v13, off_EAFF8[0], v14);
    }
    if (v11 && a4)
    {
      id v15 = [a4 _stripFZIDPrefix];
      int v16 = (__CFArray *)objc_alloc_init((Class)NSMutableArray);
      *(_OWORD *)__int16 v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v36 = v11;
      id v17 = [v11 participants];
      id v18 = [v17 countByEnumeratingWithState:v45 objects:buf count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v46;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v46 != v19) {
              objc_enumerationMutation(v17);
            }
            id v21 = *(void **)(*(void *)&v45[8] + 8 * i);
            if ((-[__CFArray containsObjectIdenticalTo:](v16, "containsObjectIdenticalTo:", [v21 ID]) & 1) == 0&& !(objc_msgSend(v15, "isEqualToIgnoringCase:", objc_msgSend(v21, "ID")) & 1 | (v16 == 0))&& objc_msgSend(v21, "ID"))
            {
              CFArrayAppendValue(v16, [v21 ID]);
            }
          }
          id v18 = [v17 countByEnumeratingWithState:v45 objects:buf count:16];
        }
        while (v18);
      }
      if (IMOSLoggingEnabled())
      {
        id v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          id v23 = [v36 participants];
          *(_DWORD *)id v50 = 138412802;
          id v51 = v23;
          __int16 v52 = 2112;
          id v53 = a4;
          __int16 v54 = 2112;
          __int16 v55 = v16;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "chat participants %@, from %@, IDs %@", v50, 0x20u);
        }
      }
      id v24 = v16;
      id v11 = v36;
      if (v24)
      {
        CFDictionarySetValue(v13, off_EB000[0], v24);
        id v11 = v36;
      }
    }
    unsigned int v25 = v11;
    incrementParticipantVersionForChat(v11);
    sub_790AC(v11, 0);
    id v26 = [v11 properties];
    CFStringRef v27 = (const void *)IMDChatGroupParticipantVersionKey;
    id v28 = [v26 objectForKey:IMDChatGroupParticipantVersionKey];
    if (v28) {
      CFDictionarySetValue(v13, v27, v28);
    }
    if (IMOSLoggingEnabled())
    {
      id v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        id v30 = [(MessageServiceSession *)[(MessageGroupController *)self session] groupIDForChat:v25];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2112;
        id v57 = v13;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Leaving group groupID: %@   chat: %@   dictionary: %@", buf, 0x20u);
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v57) = 1;
    if ([(MessageGroupController *)self _canSendMessagesWithEngram])
    {
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_7A2FC;
      v44[3] = &unk_DF928;
      v44[10] = buf;
      v44[4] = v13;
      v44[5] = self;
      v44[6] = v25;
      v44[7] = a6;
      v44[8] = a4;
      v44[9] = v37;
      objc_msgSend(-[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance"), "lookUpENGroupForChat:service:completion:", v25, a7, v44);
    }
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int16 v45 = 0;
          _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Engram not enabled so sending leave with legacy methods", v45, 2u);
        }
      }
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v32 = [v25 participants];
      id v33 = [v32 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v41;
        do
        {
          for (j = 0; j != v33; j = (char *)j + 1)
          {
            if (*(void *)v41 != v34) {
              objc_enumerationMutation(v32);
            }
            objc_msgSend(a6, "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:", v13, a4, objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * (void)j), "ID"), 0);
          }
          id v33 = [v32 countByEnumeratingWithState:&v40 objects:v49 count:16];
        }
        while (v33);
      }
      objc_msgSend(a6, "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:", v13, a4, objc_msgSend(a4, "_stripFZIDPrefix"), 0);
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)setName:(id)a3 fromName:(id)a4 forChat:(id)a5 fromID:(id)a6 fromAccount:(id)a7 messageID:(id)a8 session:(id)a9 completionBlock:(id)a10
{
  if ([a5 style] == 45)
  {
    if (IMOSLoggingEnabled())
    {
      int v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = a5;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "No need to rename chat, this is a 1-1 chat: %@", buf, 0xCu);
      }
    }
    if (a10) {
      (*((void (**)(id, MessageGroupController *, id, id, uint64_t, void))a10 + 2))(a10, self, a5, a3, 1, 0);
    }
  }
  else
  {
    if (a10) {
      (*((void (**)(id, MessageGroupController *, id, id, uint64_t, void))a10 + 2))(a10, self, a5, a3, 1, 0);
    }
    if (a9)
    {
      id v17 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      [(MessageGroupController *)self _populateP2PDictionary:v17 chat:a5 omitName:1 fromID:a6];
      if (off_EB018[0]) {
        CFDictionarySetValue(v17, off_EB010[0], off_EB018[0]);
      }
      if (a3) {
        CFDictionarySetValue(v17, off_EAFF8[0], a3);
      }
      if (a4) {
        CFDictionarySetValue(v17, off_EAFE8[0], a4);
      }
      if (off_EB070[0]) {
        CFDictionarySetValue(v17, off_EB068[0], off_EB070[0]);
      }
      if (IMOSLoggingEnabled())
      {
        id v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413314;
          id v29 = a4;
          __int16 v30 = 2112;
          id v31 = a3;
          __int16 v32 = 2112;
          id v33 = [(MessageServiceSession *)[(MessageGroupController *)self session] groupIDForChat:a5];
          __int16 v34 = 2112;
          id v35 = a5;
          __int16 v36 = 2112;
          id v37 = v17;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Updating group name %@ => %@    groupID: %@   chat: %@   dictionary: %@", buf, 0x34u);
        }
      }
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v19 = objc_msgSend(a5, "participants", 0);
      id v20 = [v19 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v24;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v24 != v21) {
              objc_enumerationMutation(v19);
            }
            objc_msgSend(a9, "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:toToken:messageID:", v17, a6, objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "ID"), 0, 0, a8);
          }
          id v20 = [v19 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v20);
      }
      objc_msgSend(a9, "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:toToken:messageID:", v17, a6, objc_msgSend(a6, "_stripFZIDPrefix"), 0, 0, a8);
    }
  }
}

- (void)setGroupPhoto:(id)a3 forChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 isPhotoRefresh:(BOOL)a8
{
  BOOL v8 = a8;
  if (IMGetDomainBoolForKey())
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "*** Not sending group photo because of FailGroupPhotoSend default", (uint8_t *)&v28, 2u);
      }
    }
    return;
  }
  if (!a7) {
    return;
  }
  id v15 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  [(MessageGroupController *)self _populateP2PDictionary:v15 chat:a4 fromID:a5];
  incrementParticipantVersionForChat(a4);
  if (off_EB028[0]) {
    CFDictionarySetValue(v15, off_EB010[0], off_EB028[0]);
  }
  if (v8)
  {
    int v16 = off_EB050[0];
    if (!off_EB050[0]) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  int v16 = off_EB048[0];
  if (off_EB048[0]) {
LABEL_12:
  }
    CFDictionarySetValue(v15, off_EB040[0], v16);
LABEL_13:
  if (a3) {
    CFDictionarySetValue(v15, off_EB008[0], a3);
  }
  id v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a4 groupParticipantVersion]);
  if (v17) {
    CFDictionarySetValue(v15, IMDChatGroupParticipantVersionKey, v17);
  }
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412802;
      id v29 = [(MessageServiceSession *)[(MessageGroupController *)self session] groupIDForChat:a4];
      __int16 v30 = 2112;
      id v31 = a4;
      __int16 v32 = 2112;
      id v33 = v15;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Updating group photo groupID: %@   chat: %@   dictionary: %@", (uint8_t *)&v28, 0x20u);
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v19 = objc_msgSend(a4, "participants", 0);
  id v20 = [v19 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v24;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(a7, "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:", v15, a5, objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "ID"), 0);
      }
      id v20 = [v19 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v20);
  }
  objc_msgSend(a7, "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:", v15, a5, objc_msgSend(a5, "_stripFZIDPrefix"), 0);
}

- (BOOL)_shouldRequestGroupPhoto:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationDate:(id)a5
{
  id v8 = [a3 groupPhotoGuid];
  if (![v8 length]) {
    goto LABEL_11;
  }
  id v9 = [+[IMDAttachmentStore sharedInstance] attachmentWithGUID:v8];
  if (!v9 || (unsigned __int8 v10 = v9, ![v9 existsAtLocalPath]))
  {
    if (IMOSLoggingEnabled())
    {
      int v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        int64_t v25 = (int64_t)v8;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Request group photo, we don't have a valid file transfer for group photo guid: %@", (uint8_t *)&v24, 0xCu);
      }
    }
LABEL_11:
    if (a5)
    {
      if (objc_msgSend(objc_msgSend(a3, "guid"), "length")) {
        return 1;
      }
      if (!IMOSLoggingEnabled()) {
        return 0;
      }
      id v17 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      int v24 = 138412290;
      int64_t v25 = (int64_t)a3;
      id v18 = "Don't request group photo for chat, guid is nil for some reason: %@";
      id v19 = v17;
      uint32_t v20 = 12;
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        return 0;
      }
      id v22 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      LOWORD(v24) = 0;
      id v18 = "Don't request group photo, incomingGroupPhotoCreationDate is nil.";
      id v19 = v22;
      uint32_t v20 = 2;
    }
LABEL_23:
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v24, v20);
    return 0;
  }
  id v11 = [a3 properties];
  id v12 = objc_msgSend(objc_msgSend(v11, "objectForKey:", off_EB078[0]), "integerValue");
  int v13 = IMOSLoggingEnabled();
  if ((uint64_t)v12 >= a4)
  {
    if (!v13) {
      return 0;
    }
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    int v24 = 138412546;
    int64_t v25 = (int64_t)v8;
    __int16 v26 = 2112;
    id v27 = [v10 localPath];
    id v18 = "Don't request group photo, we already have a file transfer for group photo guid: %@ and it exists at the local path: %@";
    id v19 = v21;
    uint32_t v20 = 22;
    goto LABEL_23;
  }
  if (!v13) {
    return 1;
  }
  id v14 = OSLogHandleForIMFoundationCategory();
  BOOL v15 = 1;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v24 = 134218240;
    int64_t v25 = a4;
    __int16 v26 = 2048;
    id v27 = v12;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Incoming group photo participant version (%ld) is newer than local version with last known photo change (%ld), requesting photo", (uint8_t *)&v24, 0x16u);
  }
  return v15;
}

- (void)_populateP2PDictionary:(id)a3 chat:(id)a4 fromID:(id)a5
{
}

- (void)_populateP2PDictionary:(id)a3 chat:(id)a4 omitName:(BOOL)a5 fromID:(id)a6
{
  id v10 = [(MessageServiceSession *)[(MessageGroupController *)self session] groupIDForChat:a4];
  if (v10) {
    CFDictionarySetValue((CFMutableDictionaryRef)a3, off_EAFF0[0], v10);
  }
  if (!a5)
  {
    id v11 = [a4 displayName];
    if (v11) {
      CFDictionarySetValue((CFMutableDictionaryRef)a3, off_EB058[0], v11);
    }
  }
  id v12 = sub_76578((__CFArray *)a4, a6);
  if (v12) {
    CFDictionarySetValue((CFMutableDictionaryRef)a3, off_EAFE0[0], v12);
  }
  int v13 = off_EB070[0];
  if (off_EB070[0])
  {
    id v14 = off_EB068[0];
    CFDictionarySetValue((CFMutableDictionaryRef)a3, v14, v13);
  }
}

- (void)_requestGroupPhotoUpdate:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5 session:(id)a6
{
  id v11 = -[NSMutableDictionary objectForKey:](-[MessageGroupController mostRecentGroupPhotoRequestDates](self, "mostRecentGroupPhotoRequestDates"), "objectForKey:", [a3 guid]);
  [+[NSDate date] timeIntervalSinceDate:v11];
  double v13 = v12;
  [(MessageGroupController *)self _groupPhotoRequestRateLimit];
  double v15 = v14;
  int v16 = IMOSLoggingEnabled();
  if (v13 >= v15)
  {
    if (v16)
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v32 = [a3 guid];
        __int16 v33 = 2112;
        id v34 = a4;
        __int16 v35 = 2112;
        id v36 = a5;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Requesting group photo for chatGuid %@ from %@ to %@", buf, 0x20u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = a3;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
      }
    }
    if ([a4 length])
    {
      if ([a5 length])
      {
        if (objc_msgSend(objc_msgSend(a3, "guid"), "length"))
        {
          -[NSMutableDictionary setObject:forKey:](-[MessageGroupController mostRecentGroupPhotoRequestDates](self, "mostRecentGroupPhotoRequestDates"), "setObject:forKey:", +[NSDate date](NSDate, "date"), [a3 guid]);
          long long v23 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          [(MessageGroupController *)self _populateP2PDictionary:v23 chat:a3 fromID:a4];
          id v24 = +[NSString stringGUID];
          if (off_EB030[0]) {
            CFDictionarySetValue(v23, off_EB010[0], off_EB030[0]);
          }
          if (v24) {
            CFDictionarySetValue(v23, off_EB038[0], v24);
          }
          v29[0] = @"chat";
          v29[1] = @"fromIdentifier";
          v30[0] = a3;
          v30[1] = a4;
          v29[2] = @"toIdentifier";
          v29[3] = @"session";
          v30[2] = a5;
          v30[3] = a6;
          v29[4] = off_EB038[0];
          v30[4] = v24;
          -[NSMutableDictionary setObject:forKey:](-[MessageGroupController groupPhotoRequestsInFlight](self, "groupPhotoRequestsInFlight"), "setObject:forKey:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 5), [a3 guid]);
          dispatch_time_t v25 = dispatch_time(0, 15000000000);
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_7B4C0;
          v28[3] = &unk_DF1E0;
          v28[4] = self;
          v28[5] = a3;
          dispatch_after(v25, (dispatch_queue_t)&_dispatch_main_q, v28);
          [a6 _forwardP2PGroupCommand:v23 fromPerson:a4 toPerson:a5 toGroup:0];
        }
        else if (IMOSLoggingEnabled())
        {
          id v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v32 = a3;
            id v18 = "Cannot request chat, guid is nil: %@";
            id v19 = v27;
            uint32_t v20 = 12;
            goto LABEL_26;
          }
        }
        return;
      }
      if (!IMOSLoggingEnabled()) {
        return;
      }
      __int16 v26 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_WORD *)buf = 0;
      id v18 = "Cannot request chat, toIdentifier is nil";
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        return;
      }
      __int16 v26 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_WORD *)buf = 0;
      id v18 = "Cannot request chat, fromIdentifier is nil";
    }
    id v19 = v26;
    uint32_t v20 = 2;
    goto LABEL_26;
  }
  if (v16)
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v11;
      __int16 v33 = 2112;
      id v34 = [a3 guid];
      id v18 = "We already requested a photo from this group at %@. not requesting again. chatGUID %@";
      id v19 = v17;
      uint32_t v20 = 22;
LABEL_26:
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, v18, buf, v20);
    }
  }
}

- (double)_groupPhotoRequestRateLimit
{
  uint64_t v2 = IMGetDomainIntForKey();
  double result = (double)v2;
  if (v2 <= 0) {
    return 300.0;
  }
  return result;
}

- (void)requestGroupPhotoIfNecessary:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationDate:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 messageIsFromStorage:(BOOL)a8 session:(id)a9
{
  BOOL v9 = a8;
  if (IMOSLoggingEnabled())
  {
    int v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [a3 guid];
      CFStringRef v18 = @"NO";
      *(_DWORD *)buf = 138413058;
      id v35 = v17;
      __int16 v36 = 2048;
      if (v9) {
        CFStringRef v18 = @"YES";
      }
      int64_t v37 = a4;
      __int16 v38 = 2112;
      id v39 = a5;
      __int16 v40 = 2112;
      id v41 = (id)v18;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Requesting group photo if necessary. chatGuid %@ incomingParticipantVersion %ld incomingGroupPhotoCreationDate %@ fromStorage %@", buf, 0x2Au);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = a3;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
    }
  }
  if (![(MessageGroupController *)self _shouldRequestGroupPhoto:a3 incomingParticipantVersion:a4 incomingGroupPhotoCreationDate:a5])
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    id v27 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    id v35 = a3;
    int v28 = "Not requesting group photo for chat %@";
    id v29 = v27;
    uint32_t v30 = 12;
LABEL_31:
    _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, v28, buf, v30);
    return;
  }
  if (!v9)
  {
    [(MessageGroupController *)self _requestGroupPhotoUpdate:a3 fromIdentifier:a7 toIdentifier:a6 session:a9];
    return;
  }
  if (a3) {
    BOOL v20 = a7 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  int v23 = !v20 && a6 != 0 && a9 != 0;
  int v24 = IMOSLoggingEnabled();
  if (!v23)
  {
    if (!v24) {
      return;
    }
    id v31 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 138413058;
    id v35 = a7;
    __int16 v36 = 2112;
    int64_t v37 = (int64_t)a6;
    __int16 v38 = 2112;
    id v39 = a9;
    __int16 v40 = 2112;
    id v41 = a3;
    int v28 = "Message is from storage, but an object is nil fromIdentifer: %@ toIdentifier: %@ session: %@ chat: %@";
    id v29 = v31;
    uint32_t v30 = 42;
    goto LABEL_31;
  }
  if (v24)
  {
    dispatch_time_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v26 = [a3 guid];
      *(_DWORD *)buf = 138412802;
      id v35 = v26;
      __int16 v36 = 2112;
      int64_t v37 = (int64_t)a7;
      __int16 v38 = 2112;
      id v39 = a6;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Adding chat to pending group photo requests %@ fromIdentifier %@ toIdentifier %@", buf, 0x20u);
    }
  }
  v32[0] = @"chat";
  v32[1] = @"fromIdentifier";
  v33[0] = a3;
  v33[1] = a7;
  v32[2] = @"toIdentifier";
  v32[3] = @"session";
  v33[2] = a6;
  v33[3] = a9;
  -[NSMutableDictionary setObject:forKey:](-[MessageGroupController groupPhotoRequestsFromStorage](self, "groupPhotoRequestsFromStorage"), "setObject:forKey:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 4), [a3 guid]);
}

- (void)requestGroupPhotosForMessagesFromStorage
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v6 = [(NSMutableDictionary *)[(MessageGroupController *)self groupPhotoRequestsFromStorage] count];
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Requesting group photos for messages from storage %lu", buf, 0xCu);
    }
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_7BA5C;
  v4[3] = &unk_DF950;
  v4[4] = self;
  [(NSMutableDictionary *)[(MessageGroupController *)self groupPhotoRequestsFromStorage] enumerateKeysAndObjectsUsingBlock:v4];
  [(NSMutableDictionary *)[(MessageGroupController *)self groupPhotoRequestsFromStorage] removeAllObjects];
}

- (void)_sendGroupPhoto:(id)a3 toIdentifier:(id)a4 fromIdentifier:(id)a5 toToken:(id)a6 session:(id)a7 requestGUID:(id)a8
{
  if (IMOSLoggingEnabled())
  {
    double v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = a4;
      __int16 v35 = 2112;
      id v36 = [a3 guid];
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Responding to group photo request from %@ for chatGuid %@", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    double v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = a3;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = objc_msgSend(a3, "participants", a6);
  id v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v29;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v15);
        }
        if (objc_msgSend(objc_msgSend(a4, "_stripFZIDPrefix"), "isEqualToString:", objc_msgSend(objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "ID"), "_stripFZIDPrefix")))
        {
          id v22 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          [(MessageGroupController *)self _populateP2PDictionary:v22 chat:a3 fromID:a5];
          if (off_EB028[0]) {
            CFDictionarySetValue(v22, off_EB010[0], off_EB028[0]);
          }
          if (off_EB050[0]) {
            CFDictionarySetValue(v22, off_EB040[0], off_EB050[0]);
          }
          int v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 groupParticipantVersion]);
          if (v23) {
            CFDictionarySetValue(v22, IMDChatGroupParticipantVersionKey, v23);
          }
          id v24 = [a7 fileTransferDictionaryForChat:a3];
          if (v24) {
            CFDictionarySetValue(v22, off_EB008[0], v24);
          }
          if (a8) {
            CFDictionarySetValue(v22, off_EB038[0], a8);
          }
          [a7 _forwardP2PGroupCommand:v22 fromPerson:a5 toPerson:a4 toGroup:0 toToken:v26];

          return;
        }
      }
      id v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = [a3 guid];
      *(_DWORD *)buf = 138412546;
      id v34 = a4;
      __int16 v35 = 2112;
      id v36 = v20;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Attempting to send group photo to someone who is not in the group. toIdentifier: %@ chatGuid: %@", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = a3;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
    }
  }
}

- (id)_findChatFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7
{
  double v12 = [(MessageGroupController *)self session];

  return [(MessageServiceSession *)v12 bestCandidateGroupChatWithFromIdentifier:a3 toIdentifier:a4 displayName:a5 participants:a6 groupID:a7];
}

- (void)handleAddToNewGroup:(id)a3 groupID:(id)a4 groupPhotoTransferDict:(id)a5 identifier:(id)a6 session:(id)a7 toIdentifier:(id)a8 toName:(id)a9 toParticipants:(id)a10
{
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      id v29 = a4;
      __int16 v30 = 2112;
      id v31 = a6;
      __int16 v32 = 2112;
      id v33 = a8;
      __int16 v34 = 2112;
      id v35 = a9;
      __int16 v36 = 2112;
      id v37 = a10;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "handleAddToNewGroup called. groupID %@ identifier %@ toIdentifier %@ toName %@ toParticipants %@", buf, 0x34u);
    }
  }
  if ([a7 _shouldBlackholeGroupChatFromSender:a6 toRecipient:a8 withOtherParticipants:a10 forAccount:a3])
  {
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v17 = "should blackhole from participants. early returning";
LABEL_18:
        int v23 = v16;
        uint32_t v24 = 2;
LABEL_19:
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, v17, buf, v24);
      }
    }
  }
  else
  {
    id v18 = +[MessageGroupController memberDisplayIDsFromParticipants:a10 toIdentifier:a8];
    if ((unint64_t)[v18 count] < 2)
    {
      if (IMOSLoggingEnabled())
      {
        id v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          uint64_t v17 = "added to a group chat with only one other person -- dropping this message";
          goto LABEL_18;
        }
      }
    }
    else
    {
      id v19 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v18 count]);
      +[MessageGroupController addMembers:v18 toHandleInfo:v19];
      id v20 = [(IMDChatRegistry *)[(MessageGroupController *)self chatRegistry] generateUnusedChatIdentifierForGroupChatWithAccount:a3];
      if (IMOSLoggingEnabled())
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = v20;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Will create chat with identifier %@", buf, 0xCu);
        }
      }
      objc_msgSend(a7, "didJoinChat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:", v20, 43, a9, a4, objc_msgSend(a8, "_stripFZIDPrefix"), 0, v19);
      id v22 = [(IMDChatRegistry *)[(MessageGroupController *)self chatRegistry] existingChatWithIdentifier:v20 account:a3];
      if (v22)
      {
        if (a5) {
          [a7 receivedGroupPhotoUpdate:a5 chat:v22 sender:a6 isHidden:1];
        }
      }
      else if (IMOSLoggingEnabled())
      {
        dispatch_time_t v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = v20;
          uint64_t v17 = "failed to create new chat with identifier %@";
          int v23 = v25;
          uint32_t v24 = 12;
          goto LABEL_19;
        }
      }
    }
  }
}

- (BOOL)shouldCompressGroupPayload:(id)a3
{
  return [a3 objectForKey:off_EB008[0]] == 0;
}

- (void)handler:(id)a3 account:(id)a4 groupMessagePayload:(id)a5 messageID:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 idsService:(id)a9 fromToken:(id)a10 timeStamp:(id)a11 storageContext:(id)a12
{
  id v15 = [a8 _stripFZIDPrefix];
  id v16 = [a7 _stripFZIDPrefix];
  unsigned int v17 = [v16 isEqualToIgnoringCase:v15];
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      CFStringRef v19 = @"NO";
      *(_DWORD *)buf = 138413314;
      *(void *)v99 = v15;
      if (v17) {
        CFStringRef v19 = @"YES";
      }
      *(_WORD *)&v99[8] = 2112;
      id v100 = a5;
      *(_WORD *)v101 = 2112;
      *(void *)&v101[2] = v19;
      __int16 v102 = 2112;
      id v103 = v16;
      __int16 v104 = 2112;
      id v105 = a11;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Incoming group message payload from: %@   payload: %@  isReflection: %@  to: %@, timestamp: %@", buf, 0x34u);
    }
  }
  int v92 = v17;
  id v20 = [a5 objectForKey:off_EB010[0]];
  id v96 = [a5 _arrayForKey:off_EAFE0[0]];
  id v21 = [a5 _stringForKey:off_EAFE8[0]];
  id v93 = [a5 _arrayForKey:off_EB000[0]];
  id v22 = [a5 _stringForKey:off_EAFF8[0]];
  id v23 = [a5 _stringForKey:off_EAFF0[0]];
  id v24 = [a5 _stringForKey:off_EB058[0]];
  id v25 = [a5 objectForKey:off_EB088[0]];
  if (v25) {
    BOOL v26 = (uint64_t)[v25 integerValue] < 2;
  }
  else {
    BOOL v26 = 0;
  }
  if (![+[IMGroupBlocklistManager sharedInstance] isGroupInBlocklist:v23])
  {
    if ([v20 isEqualToString:off_EB018[0]])
    {
      if (IMOSLoggingEnabled())
      {
        id v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v99 = v21;
          *(_WORD *)&v99[8] = 2112;
          id v100 = v22;
          _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Name update for %@ => %@", buf, 0x16u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        __int16 v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v99 = v23;
          _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "            Group ID: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v99 = v96;
          _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "   From participants: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        __int16 v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v99 = v21;
          _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "           From name: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v99 = v22;
          _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "             To name: %@", buf, 0xCu);
        }
      }
      id v36 = [(MessageGroupController *)self _findChatFromIdentifier:v15 toIdentifier:v16 displayName:v21 participants:v96 groupID:v23];
      int v37 = IMOSLoggingEnabled();
      if (v36)
      {
        if (v37)
        {
          __int16 v38 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v99 = v22;
            _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "   Updating to display name: %@", buf, 0xCu);
          }
        }
        if (v92) {
          id v15 = 0;
        }
        objc_msgSend(a3, "didReceiveDisplayNameChange:guid:fromID:toIdentifier:forChat:style:account:", v22, a6, v15, v16, objc_msgSend(v36, "chatIdentifier"), objc_msgSend(v36, "style"), a4);
        return;
      }
      if (!v37) {
        return;
      }
      uint64_t v59 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v59, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_WORD *)buf = 0;
      long long v28 = "   No group found";
LABEL_82:
      id v29 = v59;
      uint32_t v30 = 2;
      goto LABEL_13;
    }
    if (![v20 isEqualToString:off_EB020[0]])
    {
      if ([v20 isEqualToString:off_EB028[0]])
      {
        id v49 = [(MessageGroupController *)self _findChatFromIdentifier:v15 toIdentifier:v16 displayName:v24 participants:v96 groupID:v23];
        id v50 = [a5 _dictionaryForKey:off_EB008[0]];
        if (IMOSLoggingEnabled())
        {
          id v51 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v99 = v49;
            _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "Received group photo update for chat %@", buf, 0xCu);
          }
        }
        if (v49 && [v49 style] != 45)
        {
          id v52 = [a5 _numberForKey:IMDChatGroupParticipantVersionKey];
          id v53 = -[NSMutableDictionary objectForKey:](-[MessageGroupController groupPhotoRequestsInFlight](self, "groupPhotoRequestsInFlight"), "objectForKey:", [v49 guid]);
          id v54 = [v53 _stringForKey:off_EB038[0]];
          if (IMOSLoggingEnabled())
          {
            __int16 v55 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              id v56 = [a5 _stringForKey:off_EB038[0]];
              *(_DWORD *)buf = 138412546;
              *(void *)v99 = v54;
              *(_WORD *)&v99[8] = 2112;
              id v100 = v56;
              _os_log_impl(&dword_0, v55, OS_LOG_TYPE_INFO, "Found an inflight request with GUID: %@, incoming GUID: %@", buf, 0x16u);
            }
          }
          if (objc_msgSend(objc_msgSend(a5, "_stringForKey:", off_EB038[0]), "isEqualToString:", v54))
          {
            id v57 = [a5 _stringForKey:off_EB040[0]];
            unsigned int v58 = [v57 isEqualToString:off_EB050[0]];
          }
          else
          {
            unsigned int v58 = 0;
          }
          if (objc_msgSend(objc_msgSend(objc_msgSend(v53, "_stringForKey:", @"toIdentifier"), "_stripFZIDPrefix"), "isEqualToString:", objc_msgSend(v15, "_stripFZIDPrefix")))BOOL v76 = objc_msgSend(a5, "_stringForKey:", off_EB040[0]) == 0; {
          else
          }
            BOOL v76 = 0;
          id v77 = [a5 _stringForKey:off_EB040[0]];
          unsigned int v78 = [v77 isEqualToString:off_EB048[0]];
          uint64_t v79 = v58 | v76;
          if (IMOSLoggingEnabled())
          {
            __int16 v80 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)v99 = v58;
              *(_WORD *)&v99[4] = 1024;
              *(_DWORD *)&v99[6] = v76;
              LOWORD(v100) = 1024;
              *(_DWORD *)((char *)&v100 + 2) = v78;
              HIWORD(v100) = 1024;
              *(_DWORD *)v101 = (v79 | v78) ^ 1;
              _os_log_impl(&dword_0, v80, OS_LOG_TYPE_INFO, "Group photo message parsed: isExplicitlyRequestedResponse: %d, isLegacyRequestedResponse: %d, isExplicitlyNewPhoto: %d, isAssumedLegacyNewPhoto: %d", buf, 0x1Au);
            }
          }
          id v81 = [v49 groupParticipantVersion];
          if (IMOSLoggingEnabled())
          {
            __int16 v82 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218242;
              *(void *)v99 = v81;
              *(_WORD *)&v99[8] = 2112;
              id v100 = v52;
              _os_log_impl(&dword_0, v82, OS_LOG_TYPE_INFO, " => currentVersion %ld incomingVersion %@", buf, 0x16u);
            }
          }
          if ((uint64_t)v81 <= (int)[v52 intValue] || !v52)
          {
            if (v52)
            {
              setParticipantVersionForChat(v49, (uint64_t)[v52 integerValue]);
              sub_7617C(v49, (uint64_t)[v52 integerValue]);
              sub_790AC(v49, a11);
            }
            [a3 receivedGroupPhotoUpdate:v50 chat:v49 sender:v15 isHidden:v79];
          }
        }
      }
      else if ([v20 isEqualToString:off_EB030[0]])
      {
        -[MessageGroupController _handleGroupVisualIdentityRequest:fromParticipants:groupID:identifier:session:toIdentifier:fromToken:requestGUID:](self, "_handleGroupVisualIdentityRequest:fromParticipants:groupID:identifier:session:toIdentifier:fromToken:requestGUID:", v24, v96, v23, v15, a3, v16, a10, [a5 _stringForKey:off_EB038[0]]);
      }
      else if (IMOSLoggingEnabled())
      {
        v60 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v99 = v20;
          long long v28 = "Unsupported group message command %@";
          id v29 = v60;
          uint32_t v30 = 12;
          goto LABEL_13;
        }
      }
      return;
    }
    if (!v21) {
      id v21 = v22;
    }
    id v91 = [a5 _dictionaryForKey:off_EB008[0]];
    if (IMOSLoggingEnabled())
    {
      id v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v99 = v93;
        _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Updating participants to: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      __int16 v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v99 = v23;
        _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "            Group ID: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v41 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v99 = v96;
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "   From participants: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      long long v42 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v99 = v21;
        _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "           Group name: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      long long v43 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v99 = v93;
        _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "     To participants: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v44 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        CFStringRef v45 = @"NO";
        if (v26) {
          CFStringRef v45 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v99 = v45;
        _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "    From engram device: %@", buf, 0xCu);
      }
    }
    id v46 = [(MessageGroupController *)self _findChatFromIdentifier:v15 toIdentifier:v16 displayName:v21 participants:v96 groupID:v23];
    long long v47 = v46;
    if (!v46) {
      goto LABEL_172;
    }
    if (objc_msgSend(objc_msgSend(v46, "engramID"), "length")
      && [(MessageGroupController *)self _checkForParticipantLeaveOnENGroup:v47 groupMessagePayload:a5 toIdentifier:v16 fromIdentifier:v15 service:a9])
    {
      return;
    }
    if ([v47 style] == 45)
    {
LABEL_172:
      if (IMOSLoggingEnabled())
      {
        long long v48 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "   No group found", buf, 2u);
        }
      }
      [(MessageGroupController *)self handleAddToNewGroup:a4 groupID:v23 groupPhotoTransferDict:v91 identifier:v15 session:a3 toIdentifier:v16 toName:v22 toParticipants:v93];
      return;
    }
    if (IMOSLoggingEnabled())
    {
      id v61 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v99 = v93;
        *(_WORD *)&v99[8] = 2112;
        id v100 = v16;
        _os_log_impl(&dword_0, v61, OS_LOG_TYPE_INFO, "   Updating participants to be: %@   toIdentifier: %@", buf, 0x16u);
      }
    }
    id v62 = [a5 _numberForKey:IMDChatGroupParticipantVersionKey];
    id v63 = [v47 groupParticipantVersion];
    if ((uint64_t)v63 <= (int)[v62 intValue]) {
      setParticipantVersionForChat(v47, (uint64_t)[v62 integerValue]);
    }
    else {
      incrementParticipantVersionForChat(v47);
    }
    sub_790AC(v47, a11);
    if ([v47 state] || !objc_msgSend(objc_msgSend(a5, "_stringForKey:", off_EB068[0]), "length")) {
      goto LABEL_95;
    }
    if (IMOSLoggingEnabled())
    {
      __int16 v70 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v99 = v47;
        _os_log_impl(&dword_0, v70, OS_LOG_TYPE_INFO, "Incoming group participant update for unjoined chat %@", buf, 0xCu);
      }
    }
    if ([v93 containsObject:v16])
    {
      if (IMOSLoggingEnabled())
      {
        id v71 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v71, OS_LOG_TYPE_INFO, "Looks like we are going to get added to this chat so let's take the incoming set of participants", buf, 2u);
        }
      }
      __int16 v72 = sub_76578((__CFArray *)v47, 0);
      if (-[__CFArray count](v72, "count") && [v93 count])
      {
        id v65 = (__CFString *)[v93 arrayByExcludingObjectsInArray:v72];
        if (IMOSLoggingEnabled())
        {
          uint64_t v73 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v99 = v65;
            _os_log_impl(&dword_0, v73, OS_LOG_TYPE_INFO, "Adding participants %@", buf, 0xCu);
          }
        }
        _ConvergeGroupParticipants(a3, v47, (uint64_t)v23, v65, v16, v15, v92, 0, 0, a4);
        unsigned int v64 = (__CFString *)[(__CFArray *)v72 arrayByExcludingObjectsInArray:v93];
        if (IMOSLoggingEnabled())
        {
          __int16 v74 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v99 = v64;
            _os_log_impl(&dword_0, v74, OS_LOG_TYPE_INFO, "Also remove participants we do not have now %@", buf, 0xCu);
          }
        }
        _ConvergeGroupParticipants(a3, v47, (uint64_t)v23, v64, v16, v15, v92, 0, 1, a4);
        char v75 = 1;
      }
      else
      {
        id v65 = 0;
        unsigned int v64 = 0;
        char v75 = 0;
      }
      BOOL v87 = [v47 style] != 45 && v91 != 0;
      int v88 = IMOSLoggingEnabled();
      if (v87)
      {
        if (v88)
        {
          v89 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v99 = v47;
            _os_log_impl(&dword_0, v89, OS_LOG_TYPE_INFO, "Got group photo for unjoined chat %@", buf, 0xCu);
          }
        }
        [a3 receivedGroupPhotoUpdate:v91 chat:v47 sender:v15 isHidden:1];
      }
      else if (v88)
      {
        uint64_t v90 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v99 = v72;
          *(_WORD *)&v99[8] = 2112;
          id v100 = v93;
          _os_log_impl(&dword_0, v90, OS_LOG_TYPE_INFO, "Empty currentParticipantsExcludingSelf %@ or toParicipants %@", buf, 0x16u);
        }
      }
      if (v75) {
        goto LABEL_147;
      }
    }
    else
    {
LABEL_95:
      unsigned int v64 = 0;
      id v65 = 0;
    }
    id v66 = [v96 count];
    if (v66 > [v93 count])
    {
      unsigned int v64 = (__CFString *)[v96 arrayByExcludingObjectsInArray:v93];
      if (IMOSLoggingEnabled())
      {
        v67 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v99 = v64;
          _os_log_impl(&dword_0, v67, OS_LOG_TYPE_INFO, "Participants to remove %@", buf, 0xCu);
        }
      }
      _ConvergeGroupParticipants(a3, v47, (uint64_t)v23, v64, v16, v15, v92, 1, 1, a4);
      goto LABEL_147;
    }
    id v68 = objc_msgSend(v93, "__imSetFromArray");
    id v69 = objc_msgSend(v96, "__imSetFromArray");
    if ([v68 isEqualToSet:v69] && objc_msgSend(a5, "_stringForKey:", off_EB068[0]))
    {
      if (!IMOSLoggingEnabled()) {
        return;
      }
      uint64_t v59 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v59, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_WORD *)buf = 0;
      long long v28 = "GroupNew Incoming participant update has the same target and source pariticpants. Ignoring this message";
      goto LABEL_82;
    }
    if ([v68 isEqualToSet:v69])
    {
      id v65 = (__CFString *)objc_msgSend(v93, "arrayByExcludingObjectsInArray:", sub_76578((__CFArray *)v47, v16));
      if (!IMOSLoggingEnabled()) {
        goto LABEL_146;
      }
      CFStringRef v83 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_INFO)) {
        goto LABEL_146;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v99 = v65;
      __int16 v84 = "Adding participants from Okemo Taos device, participantsToAdd:%@";
    }
    else
    {
      id v65 = (__CFString *)[v93 arrayByExcludingObjectsInArray:v96];
      if (!IMOSLoggingEnabled()) {
        goto LABEL_146;
      }
      CFStringRef v83 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_INFO)) {
        goto LABEL_146;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v99 = v65;
      __int16 v84 = "Adding participants from non Okemo Taos device, participantsToAdd:%@";
    }
    _os_log_impl(&dword_0, v83, OS_LOG_TYPE_INFO, v84, buf, 0xCu);
LABEL_146:
    _ConvergeGroupParticipants(a3, v47, (uint64_t)v23, v65, v16, v15, v92, 1, 0, a4);
LABEL_147:
    if ([(MessageGroupController *)self _canSendMessagesWithEngram])
    {
      if (IMOSLoggingEnabled())
      {
        v85 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v85, OS_LOG_TYPE_INFO, "Engram enabled -- so going to check to see if we can perform a legacy add / remove", buf, 2u);
        }
      }
      [(MessageGroupController *)self _checkAndPerformLegacyAddRemove:v47 participantsToAdd:v65 participantsToRemove:v64 service:a9 fromIdentifier:v16];
    }
    return;
  }
  if (IMOSLoggingEnabled())
  {
    id v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v99 = v23;
      *(_WORD *)&v99[8] = 2112;
      id v100 = a5;
      long long v28 = "Ignoring group message payload because groupId(%@) is in the denylist. Payload: %@";
      id v29 = v27;
      uint32_t v30 = 22;
LABEL_13:
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, v28, buf, v30);
    }
  }
}

- (void)_handleGroupVisualIdentityRequest:(id)a3 fromParticipants:(id)a4 groupID:(id)a5 identifier:(id)a6 session:(id)a7 toIdentifier:(id)a8 fromToken:(id)a9 requestGUID:(id)a10
{
  if (IMOSLoggingEnabled())
  {
    unsigned int v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = a5;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Incoming group photo request for groupID %@", (uint8_t *)&v22, 0xCu);
    }
  }
  id v18 = [(MessageGroupController *)self _findChatFromIdentifier:a6 toIdentifier:a8 displayName:a3 participants:a4 groupID:a5];
  id v19 = [v18 groupPhotoGuid];
  if ([v19 length] && objc_msgSend(objc_msgSend(a7, "fileTransferDictionaryForChat:", v18), "count"))
  {
    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412290;
        id v23 = v19;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Responding with group photo with guid %@", (uint8_t *)&v22, 0xCu);
      }
    }
    [(MessageGroupController *)self _sendGroupPhoto:v18 toIdentifier:a6 fromIdentifier:a8 toToken:a9 session:a7 requestGUID:a10];
  }
  else if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v18;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Dropping group photo request -- no group photo set or missing file transfer dictionary for chat %@", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (BOOL)_checkForParticipantLeaveOnENGroup:(id)a3 groupMessagePayload:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 service:(id)a7
{
  id v13 = [a4 objectForKey:off_EB088[0]];
  if (!v13 || (uint64_t)[v13 integerValue] > 1) {
    return 0;
  }
  if (objc_msgSend(objc_msgSend(a4, "objectForKey:", off_EB090[0]), "BOOLValue"))
  {
    id v21 = a6;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_7DCD0;
    v18[3] = &unk_DF978;
    v18[4] = a5;
    objc_msgSend(-[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance"), "removeParticipantsFromENGroup:chat:service:fromID:completion:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1), a3, a7, a5, v18);
  }
  if (!IMOSLoggingEnabled()) {
    return 1;
  }
  double v14 = OSLogHandleForIMFoundationCategory();
  BOOL v15 = 1;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v16 = [a3 engramID];
    *(_DWORD *)buf = 138412290;
    id v20 = v16;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "We received a participant update from an engramCompatibleDevice so we want to drop it if we have an engramID for this chat: %@", buf, 0xCu);
  }
  return v15;
}

- (void)_checkAndPerformLegacyAddRemove:(id)a3 participantsToAdd:(id)a4 participantsToRemove:(id)a5 service:(id)a6 fromIdentifier:(id)a7
{
  if ([a4 count] && objc_msgSend(objc_msgSend(a3, "engramID"), "length"))
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412546;
        id v17 = a4;
        __int16 v18 = 2112;
        id v19 = [a3 engramID];
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Attempting to add participants from legacy device: %@ for engram group id: %@", (uint8_t *)&v16, 0x16u);
      }
    }
    objc_msgSend(-[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance"), "addParticipantsToENGroup:chat:service:fromID:completion:", a4, a3, a6, a7, &stru_DF9B8);
  }
  if ([a5 count] && objc_msgSend(objc_msgSend(a3, "engramID"), "length"))
  {
    if (IMOSLoggingEnabled())
    {
      double v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = [a3 engramID];
        int v16 = 138412546;
        id v17 = a5;
        __int16 v18 = 2112;
        id v19 = v15;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Attempting to remove participants from legacy device: %@ for engram group id: %@", (uint8_t *)&v16, 0x16u);
      }
    }
    objc_msgSend(-[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance"), "removeParticipantsFromENGroup:chat:service:fromID:completion:", a5, a3, a6, a7, &stru_DF9D8);
  }
}

- (BOOL)_shouldDropMessageGroupID:(id)a3 participants:(id)a4 fromIdentifier:(id)a5 toIdentifier:(id)a6
{
  if (IMSharedHelperAreObjectsLogicallySame()) {
    return 0;
  }
  if ([a3 length]
    && [+[IMGroupBlocklistManager sharedInstance] isGroupInBlocklist:a3])
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      BOOL v9 = 1;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        return v9;
      }
      int v15 = 138412290;
      id v16 = a3;
      id v11 = "GroupID %@ was found in denylist, dropping message";
      double v12 = v10;
LABEL_15:
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, 0xCu);
      return v9;
    }
    return 1;
  }
  if ([(MessageGroupController *)self shouldDropDueToGroupSize:a4]) {
    return 1;
  }
  if ([(MessageGroupController *)self _participantsContainBizID:a4])
  {
    if (IMOSLoggingEnabled())
    {
      double v14 = OSLogHandleForIMFoundationCategory();
      BOOL v9 = 1;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        return v9;
      }
      int v15 = 138412290;
      id v16 = a4;
      id v11 = "Dropping message because participant list contains biz id. participants: %@";
      double v12 = v14;
      goto LABEL_15;
    }
    return 1;
  }
  return 0;
}

- (BOOL)_participantsContainBizID:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(a3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ((IMStringIsBusinessID() & 1) != 0
           || (objc_msgSend(objc_msgSend(v8, "lowercaseString"), "containsString:", @"urn:biz:") & 1) != 0))
        {
          LOBYTE(v4) = 1;
          return (char)v4;
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v4 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return (char)v4;
}

- (BOOL)shouldDropDueToGroupSize:(id)a3
{
  id v4 = objc_msgSend(-[MessageGroupController IDSServerBagiMessageSharedInstance](self, "IDSServerBagiMessageSharedInstance"), "objectForKey:", @"md-max-chat-participants-incoming");
  if (v4)
  {
    id v5 = [v4 unsignedIntegerValue];
    if (!v5) {
      return 0;
    }
    unint64_t v6 = (unint64_t)v5 + 1;
  }
  else
  {
    unint64_t v6 = 51;
  }
  id v7 = [a3 count];
  if ((unint64_t)v7 <= v6) {
    return 0;
  }
  id v8 = v7;
  if (!IMOSLoggingEnabled()) {
    return 1;
  }
  BOOL v9 = OSLogHandleForIMFoundationCategory();
  BOOL v10 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v12 = 134218240;
    id v13 = v8;
    __int16 v14 = 2048;
    unint64_t v15 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Incoming Group message has too many participants (%lu, max = %lu), should drop message", (uint8_t *)&v12, 0x16u);
  }
  return v10;
}

- (MessageServiceSession)session
{
  return (MessageServiceSession *)objc_loadWeak((id *)&self->_session);
}

- (NSMutableDictionary)groupPhotoRequestsFromStorage
{
  return self->_groupPhotoRequestsFromStorage;
}

- (NSMutableDictionary)groupPhotoRequestsInFlight
{
  return self->_groupPhotoRequestsInFlight;
}

- (NSMutableDictionary)mostRecentGroupPhotoRequestDates
{
  return self->_mostRecentGroupPhotoRequestDates;
}

- (void).cxx_destruct
{
}

@end