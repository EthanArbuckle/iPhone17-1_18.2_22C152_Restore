@interface IMDRecordZoneManager
+ (IMDRecordZoneManager)sharedInstance;
- (APSConnection)pushConnection;
- (CKRecordZone)analyticRecordZone;
- (CKRecordZone)attachmentRecordZone;
- (CKRecordZone)chat1RecordZone;
- (CKRecordZone)chatBotAttachmentRecordZone;
- (CKRecordZone)chatBotMessageRecordZone;
- (CKRecordZone)chatBotRecoverableMessageRecordZone;
- (CKRecordZone)chatRecordZone;
- (CKRecordZone)deDupeSaltRecordZone;
- (CKRecordZone)messageRecordZone;
- (CKRecordZone)recoverableMessageRecordZone;
- (CKRecordZone)scheduledMessageRecordZone;
- (CKRecordZone)updateRecordZone;
- (CKRecordZoneID)analyticRecordZoneID;
- (CKRecordZoneID)attachmentRecordZoneID;
- (CKRecordZoneID)chat1RecordZoneID;
- (CKRecordZoneID)chatBotAttachmentRecordZoneID;
- (CKRecordZoneID)chatBotMessageRecordZoneID;
- (CKRecordZoneID)chatBotRecoverableMessageRecordZoneID;
- (CKRecordZoneID)chatRecordZoneID;
- (CKRecordZoneID)deDupeSaltZoneID;
- (CKRecordZoneID)messageRecordZoneID;
- (CKRecordZoneID)metricZoneID;
- (CKRecordZoneID)recoverableMessageRecordZoneID;
- (CKRecordZoneID)scheduledMessageRecordZoneID;
- (CKRecordZoneID)updateRecordZoneID;
- (IMDCKDatabaseManager)dataBaseManager;
- (IMDRecordZoneManager)init;
- (id)ckUtilities;
- (id)errorAnalyzer;
- (int64_t)derivedQualityOfService;
- (void)_checkRecordZoneExists:(id)a3 completionBlock:(id)a4;
- (void)_createRecordZone:(id)a3 completionBlock:(id)a4;
- (void)_createRecordZoneIfNeeded:(id)a3 completionBlock:(id)a4;
- (void)_createSubscriptionForZoneID:(id)a3 subscriptionID:(id)a4 recordType:(id)a5 completionBlock:(id)a6;
- (void)_createSubscriptionIfNeededForZoneID:(id)a3 subscriptionID:(id)a4 recordType:(id)a5 completionBlock:(id)a6;
- (void)_deleteAllZonesForDatabase:(id)a3;
- (void)_deleteZone:(id)a3;
- (void)_deleteZone:(id)a3 forDatabase:(id)a4;
- (void)_handleNotificationForZoneID:(id)a3 subscriptionID:(id)a4;
- (void)_setUpPushConnection;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)createAnalyticZoneIfNeededWithCompletionBlock:(id)a3;
- (void)createAttachmentZoneIfNeededWithCompletionBlock:(id)a3;
- (void)createChatBotAttachmentZoneIfNeededWithCompletionBlock:(id)a3;
- (void)createChatBotMessageZoneIfNeededWithCompletionBlock:(id)a3;
- (void)createChatBotRecoverableMessageZoneIfNeededWithCompletionBlock:(id)a3;
- (void)createChatZoneIfNeededWithCompletionBlock:(id)a3;
- (void)createDeDupeSaltZoneIfNeededWithCompletionBlock:(id)a3;
- (void)createMessageZoneIfNeededWithCompletionBlock:(id)a3;
- (void)createRecoverableMessageZoneIfNeededWithCompletionBlock:(id)a3;
- (void)createScheduledMessageZoneIfNeededWithCompletionBlock:(id)a3;
- (void)createSubscriptionIfNeededOnDeDupeZoneForSubscription:(id)a3 recordType:(id)a4 completionBlock:(id)a5;
- (void)createUpdateZoneIfNeededWithCompletionBlock:(id)a3;
- (void)dealloc;
- (void)deleteAllZones;
- (void)deleteAnalyticZone;
- (void)deleteAttachmentZone;
- (void)deleteChat1Zone;
- (void)deleteChatBotAttachmentZone;
- (void)deleteChatBotMessageZone;
- (void)deleteChatBotRecoverableMessageZone;
- (void)deleteChatZone;
- (void)deleteDeDupeSaltZone;
- (void)deleteMessageZone;
- (void)deleteRecoverableMessageZone;
- (void)deleteScheduledMessageZone;
- (void)deleteUpdateZone;
- (void)fetchChatZoneToCheckManateeStatus:(id)a3;
- (void)setDataBaseManager:(id)a3;
- (void)setPushConnection:(id)a3;
@end

@implementation IMDRecordZoneManager

+ (IMDRecordZoneManager)sharedInstance
{
  if (qword_1EBE2B820 != -1) {
    dispatch_once(&qword_1EBE2B820, &unk_1F3390900);
  }
  return (IMDRecordZoneManager *)qword_1EBE2B948;
}

- (IMDRecordZoneManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)IMDRecordZoneManager;
  v2 = [(IMDRecordZoneManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_dataBaseManager = 0;
    id v4 = objc_alloc(MEMORY[0x1E4F1A320]);
    uint64_t v5 = *MEMORY[0x1E4F19C08];
    v3->_chatRecordZoneID = (CKRecordZoneID *)[v4 initWithZoneName:@"chatManateeZone" ownerName:*MEMORY[0x1E4F19C08]];
    v3->_chatRecordZone = (CKRecordZone *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v3->_chatRecordZoneID];
    v3->_chat1RecordZoneID = (CKRecordZoneID *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"chat1ManateeZone" ownerName:v5];
    v3->_chat1RecordZone = (CKRecordZone *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v3->_chat1RecordZoneID];
    v3->_messageRecordZoneID = (CKRecordZoneID *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"messageManateeZone" ownerName:v5];
    v3->_messageRecordZone = (CKRecordZone *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v3->_messageRecordZoneID];
    v3->_attachmentRecordZoneID = (CKRecordZoneID *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"attachmentManateeZone" ownerName:v5];
    v3->_attachmentRecordZone = (CKRecordZone *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v3->_attachmentRecordZoneID];
    v3->_updateRecordZoneID = (CKRecordZoneID *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"messageUpdateZone" ownerName:v5];
    v3->_updateRecordZone = (CKRecordZone *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v3->_updateRecordZoneID];
    v3->_analyticRecordZoneID = (CKRecordZoneID *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"analyticManateeZone" ownerName:v5];
    v3->_analyticRecordZone = (CKRecordZone *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v3->_analyticRecordZoneID];
    v3->_deDupeSaltZoneID = (CKRecordZoneID *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"RecordKeyManateeZone" ownerName:v5];
    v3->_deDupeSaltRecordZone = (CKRecordZone *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v3->_deDupeSaltZoneID];
    v3->_metricZoneID = (CKRecordZoneID *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"MetricsManateeZone" ownerName:v5];
    v3->_recoverableMessageRecordZoneID = (CKRecordZoneID *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"recoverableMessageDeleteZone" ownerName:v5];
    v3->_recoverableMessageRecordZone = (CKRecordZone *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v3->_recoverableMessageRecordZoneID];
    v3->_scheduledMessageRecordZoneID = (CKRecordZoneID *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"scheduledMessageZone" ownerName:v5];
    v3->_scheduledMessageRecordZone = (CKRecordZone *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v3->_scheduledMessageRecordZoneID];
    v3->_chatBotMessageRecordZoneID = (CKRecordZoneID *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"chatBotMessageZone" ownerName:v5];
    v3->_chatBotMessageRecordZone = (CKRecordZone *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v3->_chatBotMessageRecordZoneID];
    v3->_chatBotAttachmentRecordZoneID = (CKRecordZoneID *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"chatBotAttachmentZone" ownerName:v5];
    v3->_chatBotAttachmentRecordZone = (CKRecordZone *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v3->_chatBotAttachmentRecordZoneID];
    v3->_chatBotRecoverableMessageRecordZoneID = (CKRecordZoneID *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"chatBotRecoverableMessageDeleteZone" ownerName:v5];
    v3->_chatBotRecoverableMessageRecordZone = (CKRecordZone *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v3->_chatBotRecoverableMessageRecordZoneID];
    if ((IMIsRunningInUnitTesting() & 1) == 0) {
      [(IMDRecordZoneManager *)v3 _setUpPushConnection];
    }
  }
  return v3;
}

- (IMDCKDatabaseManager)dataBaseManager
{
  result = self->_dataBaseManager;
  if (!result)
  {
    result = +[IMDCKDatabaseManager sharedInstance];
    self->_dataBaseManager = result;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMDRecordZoneManager;
  [(IMDRecordZoneManager *)&v3 dealloc];
}

- (APSConnection)pushConnection
{
  if (!self->_pushConnection)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F4E1E8]);
    id v4 = (APSConnection *)[v3 initWithEnvironmentName:*MEMORY[0x1E4F4E1D0] namedDelegatePort:@"com.apple.aps.imagent" queue:MEMORY[0x1E4F14428]];
    self->_pushConnection = v4;
    [(APSConnection *)v4 setDelegate:self];
    if (!self->_pushConnection)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)objc_super v7 = 0;
          _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "We couldn't create the push connection for the IMDRecordZoneManager", v7, 2u);
        }
      }
    }
  }
  return self->_pushConnection;
}

- (void)_setUpPushConnection
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = [(IMDRecordZoneManager *)self pushConnection];
  id v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  if (![v3 length]) {
    id v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "executablePath"), "lastPathComponent");
  }
  v10[0] = [@"com.apple.icloud-container." stringByAppendingString:v3];
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(APSConnection *)v2 setEnabledTopics:v4];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412546;
      objc_super v7 = v2;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Created push connection %@ with enabled topics %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "APSConnection didReceivePublicToken", v5, 2u);
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a4, "userInfo", a3);
  int v6 = (void *)[MEMORY[0x1E4F1A1D0] notificationFromRemoteNotificationDictionary:v5];
  if (IMOSLoggingEnabled())
  {
    objc_super v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "APSConnection didReceiveIncomingMessage pushPayload: %@ ckNotification: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  if ([v6 notificationType] == 2)
  {
    -[IMDRecordZoneManager _handleNotificationForZoneID:subscriptionID:](self, "_handleNotificationForZoneID:subscriptionID:", [v6 recordZoneID], objc_msgSend(v6, "subscriptionID"));
  }
  else if (IMOSLoggingEnabled())
  {
    __int16 v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "notificationType"));
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Received a notification for an unsupported notitifcation type: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_handleNotificationForZoneID:(id)a3 subscriptionID:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = a3;
      __int16 v11 = 2112;
      id v12 = a4;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Received a notification for zoneID: %@ for subscriptionID: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  if (objc_msgSend(a3, "isEqual:", -[IMDRecordZoneManager deDupeSaltZoneID](self, "deDupeSaltZoneID")))
  {
    [+[IMDCKExitManager sharedInstance] handleNotificationForSubscriptionID:a4];
  }
  else if (IMOSLoggingEnabled())
  {
    __int16 v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = a3;
      __int16 v11 = 2112;
      id v12 = a4;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Received a notification for zoneID we haven't set up: %@ subscriptionID: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_createSubscriptionForZoneID:(id)a3 subscriptionID:(id)a4 recordType:(id)a5 completionBlock:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1A340]) initWithZoneID:a3 subscriptionID:a4];
  if ([a5 length]) {
    [v10 setRecordType:a5];
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      __int16 v16 = 2112;
      id v17 = a3;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Creating subscription: %@ for zoneID: %@", buf, 0x16u);
    }
  }
  id v12 = [(IMDCKDatabaseManager *)[(IMDRecordZoneManager *)self dataBaseManager] truthDatabase];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1D96D5C6C;
  v13[3] = &unk_1E6B73C60;
  v13[4] = a6;
  [v12 saveSubscription:v10 completionHandler:v13];
}

- (void)_createSubscriptionIfNeededForZoneID:(id)a3 subscriptionID:(id)a4 recordType:(id)a5 completionBlock:(id)a6
{
  id v11 = [(IMDCKDatabaseManager *)[(IMDRecordZoneManager *)self dataBaseManager] truthDatabase];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1D96D5E74;
  v12[3] = &unk_1E6B73C88;
  v12[7] = a5;
  v12[8] = a6;
  v12[4] = a4;
  v12[5] = self;
  v12[6] = a3;
  [v11 fetchSubscriptionWithID:a4 completionHandler:v12];
}

- (void)_checkRecordZoneExists:(id)a3 completionBlock:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1A090]);
    v18[0] = a3;
    __int16 v8 = objc_msgSend(v7, "initWithRecordZoneIDs:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 1));
    id v9 = objc_alloc_init(MEMORY[0x1E4F1A208]);
    [v9 setAllowsCellularAccess:1];
    objc_msgSend(v9, "setQualityOfService:", -[IMDRecordZoneManager derivedQualityOfService](self, "derivedQualityOfService"));
    [v8 setConfiguration:v9];

    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412546;
        id v15 = (id)[v8 operationID];
        __int16 v16 = 2112;
        uint64_t v17 = [v8 recordZoneIDs];
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Created CKFetchRecordZonesOperation operation ID %@ zoneID %@", (uint8_t *)&v14, 0x16u);
      }
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1D96D6318;
    v13[3] = &unk_1E6B73CB0;
    v13[4] = a3;
    void v13[5] = a4;
    [v8 setFetchRecordZonesCompletionBlock:v13];
    if (v8)
    {
      objc_msgSend(-[IMDCKDatabaseManager truthDatabase](-[IMDRecordZoneManager dataBaseManager](self, "dataBaseManager"), "truthDatabase"), "addOperation:", v8);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Error initializing fetchOperation ", (uint8_t *)&v14, 2u);
        }
      }
      (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.private.IM.IMRecordZoneManagerErrorDomain" code:1 userInfo:0]);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = a3;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "_checkRecordZoneExists invalid parameter: recordZoneID %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)_createRecordZone:(id)a3 completionBlock:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc(MEMORY[0x1E4F1A180]);
  v11[0] = a3;
  __int16 v8 = objc_msgSend(v7, "initWithRecordZonesToSave:recordZoneIDsToDelete:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, 1), 0);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v9 setAllowsCellularAccess:1];
  objc_msgSend(v9, "setQualityOfService:", -[IMDRecordZoneManager derivedQualityOfService](self, "derivedQualityOfService"));
  [v8 setConfiguration:v9];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = sub_1D96D6610;
  v10[3] = &unk_1E6B73CD8;
  v10[4] = a3;
  v10[5] = a4;
  [v8 setModifyRecordZonesCompletionBlock:v10];
  objc_msgSend(-[IMDCKDatabaseManager truthDatabase](-[IMDRecordZoneManager dataBaseManager](self, "dataBaseManager"), "truthDatabase"), "addOperation:", v8);
}

- (void)_createRecordZoneIfNeeded:(id)a3 completionBlock:(id)a4
{
  uint64_t v7 = [a3 zoneID];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D96D6824;
  v8[3] = &unk_1E6B73D28;
  v8[4] = v7;
  v8[5] = a3;
  v8[6] = self;
  v8[7] = a4;
  [(IMDRecordZoneManager *)self _checkRecordZoneExists:v7 completionBlock:v8];
}

- (void)_deleteZone:(id)a3
{
  [+[IMDCKDatabaseManager sharedInstance] truthDatabase];

  MEMORY[0x1F4181798](self, sel__deleteZone_forDatabase_);
}

- (void)_deleteZone:(id)a3 forDatabase:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 zoneID];
  id v6 = objc_alloc(MEMORY[0x1E4F1A180]);
  v8[0] = v5;
  uint64_t v7 = objc_msgSend(v6, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 1));
  [v7 setModifyRecordZonesCompletionBlock:&unk_1F3390920];
  [a4 addOperation:v7];
}

- (void)createChatZoneIfNeededWithCompletionBlock:(id)a3
{
  [(IMDRecordZoneManager *)self chatRecordZone];

  MEMORY[0x1F4181798](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteChatZone
{
  [(IMDRecordZoneManager *)self chatRecordZone];

  MEMORY[0x1F4181798](self, sel__deleteZone_);
}

- (void)deleteChat1Zone
{
  [(IMDRecordZoneManager *)self chat1RecordZone];

  MEMORY[0x1F4181798](self, sel__deleteZone_);
}

- (void)createAttachmentZoneIfNeededWithCompletionBlock:(id)a3
{
  [(IMDRecordZoneManager *)self attachmentRecordZone];

  MEMORY[0x1F4181798](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteAttachmentZone
{
  [(IMDRecordZoneManager *)self attachmentRecordZone];

  MEMORY[0x1F4181798](self, sel__deleteZone_);
}

- (void)createMessageZoneIfNeededWithCompletionBlock:(id)a3
{
  [(IMDRecordZoneManager *)self messageRecordZone];

  MEMORY[0x1F4181798](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteMessageZone
{
  [(IMDRecordZoneManager *)self messageRecordZone];

  MEMORY[0x1F4181798](self, sel__deleteZone_);
}

- (void)createUpdateZoneIfNeededWithCompletionBlock:(id)a3
{
  [(IMDRecordZoneManager *)self updateRecordZone];

  MEMORY[0x1F4181798](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteUpdateZone
{
  [(IMDRecordZoneManager *)self updateRecordZone];

  MEMORY[0x1F4181798](self, sel__deleteZone_);
}

- (void)createAnalyticZoneIfNeededWithCompletionBlock:(id)a3
{
  [(IMDRecordZoneManager *)self analyticRecordZone];

  MEMORY[0x1F4181798](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteAnalyticZone
{
  [(IMDRecordZoneManager *)self analyticRecordZone];

  MEMORY[0x1F4181798](self, sel__deleteZone_);
}

- (void)createDeDupeSaltZoneIfNeededWithCompletionBlock:(id)a3
{
  [(IMDRecordZoneManager *)self deDupeSaltRecordZone];

  MEMORY[0x1F4181798](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteDeDupeSaltZone
{
  [(IMDRecordZoneManager *)self deDupeSaltRecordZone];

  MEMORY[0x1F4181798](self, sel__deleteZone_);
}

- (void)createSubscriptionIfNeededOnDeDupeZoneForSubscription:(id)a3 recordType:(id)a4 completionBlock:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      id v11 = a3;
      __int16 v12 = 2112;
      id v13 = a4;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Going to create subscription on deDupe zone for subscriptionID: %@ recordType: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  [(IMDRecordZoneManager *)self _createSubscriptionIfNeededForZoneID:[(IMDRecordZoneManager *)self deDupeSaltZoneID] subscriptionID:a3 recordType:a4 completionBlock:a5];
}

- (void)createRecoverableMessageZoneIfNeededWithCompletionBlock:(id)a3
{
  [(IMDRecordZoneManager *)self recoverableMessageRecordZone];

  MEMORY[0x1F4181798](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteRecoverableMessageZone
{
  [(IMDRecordZoneManager *)self recoverableMessageRecordZone];

  MEMORY[0x1F4181798](self, sel__deleteZone_);
}

- (void)createScheduledMessageZoneIfNeededWithCompletionBlock:(id)a3
{
  [(IMDRecordZoneManager *)self scheduledMessageRecordZone];

  MEMORY[0x1F4181798](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteScheduledMessageZone
{
  [(IMDRecordZoneManager *)self scheduledMessageRecordZone];

  MEMORY[0x1F4181798](self, sel__deleteZone_);
}

- (void)createChatBotMessageZoneIfNeededWithCompletionBlock:(id)a3
{
  [(IMDRecordZoneManager *)self chatBotMessageRecordZone];

  MEMORY[0x1F4181798](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteChatBotMessageZone
{
  [(IMDRecordZoneManager *)self chatBotMessageRecordZone];

  MEMORY[0x1F4181798](self, sel__deleteZone_);
}

- (void)createChatBotAttachmentZoneIfNeededWithCompletionBlock:(id)a3
{
  [(IMDRecordZoneManager *)self chatBotAttachmentRecordZone];

  MEMORY[0x1F4181798](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteChatBotAttachmentZone
{
  [(IMDRecordZoneManager *)self chatBotAttachmentRecordZone];

  MEMORY[0x1F4181798](self, sel__deleteZone_);
}

- (void)createChatBotRecoverableMessageZoneIfNeededWithCompletionBlock:(id)a3
{
  [(IMDRecordZoneManager *)self chatBotRecoverableMessageRecordZone];

  MEMORY[0x1F4181798](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteChatBotRecoverableMessageZone
{
  [(IMDRecordZoneManager *)self chatBotRecoverableMessageRecordZone];

  MEMORY[0x1F4181798](self, sel__deleteZone_);
}

- (void)deleteAllZones
{
  [(IMDCKDatabaseManager *)[(IMDRecordZoneManager *)self dataBaseManager] truthDatabase];

  MEMORY[0x1F4181798](self, sel__deleteAllZonesForDatabase_);
}

- (void)_deleteAllZonesForDatabase:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", -[IMDRecordZoneManager chatRecordZoneID](self, "chatRecordZoneID"), -[IMDRecordZoneManager chat1RecordZoneID](self, "chat1RecordZoneID"), -[IMDRecordZoneManager messageRecordZoneID](self, "messageRecordZoneID"), -[IMDRecordZoneManager attachmentRecordZoneID](self, "attachmentRecordZoneID"), -[IMDRecordZoneManager updateRecordZoneID](self, "updateRecordZoneID"), -[IMDRecordZoneManager recoverableMessageRecordZoneID](self, "recoverableMessageRecordZoneID"), -[IMDRecordZoneManager scheduledMessageRecordZoneID](self, "scheduledMessageRecordZoneID"), -[IMDRecordZoneManager chatBotMessageRecordZoneID](self, "chatBotMessageRecordZoneID"), -[IMDRecordZoneManager chatBotAttachmentRecordZoneID](self, "chatBotAttachmentRecordZoneID"), -[IMDRecordZoneManager chatBotRecoverableMessageRecordZoneID](self, "chatBotRecoverableMessageRecordZoneID"), 0);
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      id v11 = a3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Request to delete zones %@ for database %@", buf, 0x16u);
    }
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A180]) initWithRecordZonesToSave:0 recordZoneIDsToDelete:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D96D76D4;
  v7[3] = &unk_1E6B73D70;
  v7[4] = a3;
  [v6 setModifyRecordZonesCompletionBlock:v7];
  [a3 addOperation:v6];
}

- (id)ckUtilities
{
  return +[IMDCKUtilities sharedInstance];
}

- (id)errorAnalyzer
{
  return (id)[MEMORY[0x1E4F6EA68] sharedInstance];
}

- (int64_t)derivedQualityOfService
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "qualityOfService");
  if (v2 <= 17) {
    int64_t v3 = 17;
  }
  else {
    int64_t v3 = v2;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 134218240;
      uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "qualityOfService");
      __int16 v8 = 2048;
      int64_t v9 = v3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "QOS: 0x%lX target qos: 0x%lX", (uint8_t *)&v6, 0x16u);
    }
  }
  return v3;
}

- (void)fetchChatZoneToCheckManateeStatus:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = [(IMDRecordZoneManager *)self chatRecordZoneID];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A090]) initWithRecordZoneIDs:v5];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  objc_msgSend(v7, "setQualityOfService:", -[IMDRecordZoneManager derivedQualityOfService](self, "derivedQualityOfService"));
  [v7 setAllowsCellularAccess:1];
  if (IMOSLoggingEnabled())
  {
    __int16 v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Attempting to infer manatee status by fetching chat zone.", buf, 2u);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D96D7B54;
  v9[3] = &unk_1E6B73CB0;
  v9[4] = self;
  v9[5] = a3;
  [v6 setFetchRecordZonesCompletionBlock:v9];
  objc_msgSend(-[IMDCKDatabaseManager truthDatabase](-[IMDRecordZoneManager dataBaseManager](self, "dataBaseManager"), "truthDatabase"), "addOperation:", v6);
}

- (CKRecordZoneID)chatRecordZoneID
{
  return self->_chatRecordZoneID;
}

- (CKRecordZone)chatRecordZone
{
  return self->_chatRecordZone;
}

- (CKRecordZoneID)chat1RecordZoneID
{
  return self->_chat1RecordZoneID;
}

- (CKRecordZone)chat1RecordZone
{
  return self->_chat1RecordZone;
}

- (CKRecordZoneID)attachmentRecordZoneID
{
  return self->_attachmentRecordZoneID;
}

- (CKRecordZone)attachmentRecordZone
{
  return self->_attachmentRecordZone;
}

- (CKRecordZoneID)messageRecordZoneID
{
  return self->_messageRecordZoneID;
}

- (CKRecordZone)messageRecordZone
{
  return self->_messageRecordZone;
}

- (CKRecordZoneID)updateRecordZoneID
{
  return self->_updateRecordZoneID;
}

- (CKRecordZone)updateRecordZone
{
  return self->_updateRecordZone;
}

- (CKRecordZoneID)analyticRecordZoneID
{
  return self->_analyticRecordZoneID;
}

- (CKRecordZone)analyticRecordZone
{
  return self->_analyticRecordZone;
}

- (CKRecordZoneID)deDupeSaltZoneID
{
  return self->_deDupeSaltZoneID;
}

- (CKRecordZone)deDupeSaltRecordZone
{
  return self->_deDupeSaltRecordZone;
}

- (CKRecordZoneID)metricZoneID
{
  return self->_metricZoneID;
}

- (CKRecordZoneID)recoverableMessageRecordZoneID
{
  return self->_recoverableMessageRecordZoneID;
}

- (CKRecordZone)recoverableMessageRecordZone
{
  return self->_recoverableMessageRecordZone;
}

- (CKRecordZoneID)scheduledMessageRecordZoneID
{
  return self->_scheduledMessageRecordZoneID;
}

- (CKRecordZone)scheduledMessageRecordZone
{
  return self->_scheduledMessageRecordZone;
}

- (CKRecordZoneID)chatBotMessageRecordZoneID
{
  return self->_chatBotMessageRecordZoneID;
}

- (CKRecordZone)chatBotMessageRecordZone
{
  return self->_chatBotMessageRecordZone;
}

- (CKRecordZoneID)chatBotAttachmentRecordZoneID
{
  return self->_chatBotAttachmentRecordZoneID;
}

- (CKRecordZone)chatBotAttachmentRecordZone
{
  return self->_chatBotAttachmentRecordZone;
}

- (CKRecordZoneID)chatBotRecoverableMessageRecordZoneID
{
  return self->_chatBotRecoverableMessageRecordZoneID;
}

- (CKRecordZone)chatBotRecoverableMessageRecordZone
{
  return self->_chatBotRecoverableMessageRecordZone;
}

- (void)setDataBaseManager:(id)a3
{
}

- (void)setPushConnection:(id)a3
{
}

@end