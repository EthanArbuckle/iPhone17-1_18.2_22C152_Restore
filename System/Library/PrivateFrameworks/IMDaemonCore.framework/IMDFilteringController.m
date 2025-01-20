@interface IMDFilteringController
+ (IMDFilteringController)sharedInstance;
- (BOOL)_areAllParticipantsUnknown:(id)a3 fromSender:(id)a4;
- (BOOL)_isMessageCategorized:(int64_t)a3;
- (BOOL)_isSpamFilteringEnabled;
- (BOOL)_shouldCheckChatForSMSSpam:(id)a3 participants:(id)a4 sender:(id)a5 fallbackFilterCategory:(int64_t *)a6 fallbackFilterSubCategory:(int64_t *)a7;
- (BOOL)_storeSpamCompletionBlock:(id)a3 forMessageGUID:(id)a4;
- (BOOL)hasSpamExtensionUpdated;
- (IMDFilteringController)init;
- (NSMutableDictionary)spamBlockMap;
- (OS_dispatch_queue)processingQueue;
- (id)_createNewChatIdentifierFromChatIdentifier:(id)a3 andCategoryLabel:(id)a4;
- (id)_getSpamExtensionID;
- (id)_getSpamExtensionName;
- (id)_newSMSFilteringSettingsDictForFilterState:(int64_t)a3;
- (id)account;
- (id)relayController;
- (int64_t)_numberOfRepliesFor:(id)a3 fallbackFilterCategory:(int64_t *)a4 fallbackFilterSubCategory:(int64_t *)a5;
- (void)_categorizeRelayMessageWithCategory:(int64_t)a3 subCategory:(int64_t)a4 deviceID:(id)a5 completion:(id)a6;
- (void)_checkAndUpdateFilterParamsForFilterExtension;
- (void)_checkAndUpdateSMSFilteringSettingsForDeviceID:(id)a3 smsFilterCapabilitiesOptions:(unint64_t)a4 filterExtensionName:(id)a5;
- (void)_checkAndUpdateSMSSpamFilterExtensionForUnregisteredOrUpdatedPlugins:(id)a3 arePluginsRegistered:(BOOL)a4;
- (void)_checkIfMessageIsSpam:(id)a3 fromSender:(id)a4 withGuid:(id)a5 receiverISOCountryCode:(id)a6 receivedViaRelay:(BOOL)a7;
- (void)_clearSpamMapForMessageGUID:(id)a3;
- (void)_disableSpamFiltering;
- (void)_disableSpamFilteringAndRelay;
- (void)_enableSpamFiltering;
- (void)_executeSpamCompletionBlockForMessageGuid:(id)a3 category:(int64_t)a4 subCategory:(int64_t)a5 receivedViaRelay:(BOOL)a6;
- (void)_processReceivedSMSFilteringSettingsDictionary:(id)a3 deviceID:(id)a4;
- (void)_processReceivedSMSFilteringSettingsDictionaryInBlastDoor:(id)a3 deviceID:(id)a4;
- (void)_processReceivedSMSFilteringSettingsMessage:(id)a3 deviceID:(id)a4;
- (void)_relayCurrentSMSFilteringSettings;
- (void)_relaySMSFilteringSettingsForFilterState:(int64_t)a3;
- (void)_smsSpamCheck:(id)a3 withMessageBody:(id)a4 withGuid:(id)a5 sender:(id)a6 receiverISOCountryCode:(id)a7 receivedViaRelay:(BOOL)a8;
- (void)_updateFilterParamsForFilterExtension;
- (void)_updateSpamFilteringState:(int64_t)a3;
- (void)categorizeIncomingMessage:(id)a3 deviceID:(id)a4 category:(int64_t)a5 subCategory:(int64_t)a6 messageGUID:(id)a7 sender:(id)a8 wasRelayed:(BOOL)a9 chatIdentifier:(id)a10 participants:(id)a11 checkingForSpam:(BOOL *)a12 myReceiverISOCountryCode:(id)a13 messageBody:(id)a14 completion:(id)a15;
- (void)categorizeIncomingMessage:(id)a3 messageGUID:(id)a4 sender:(id)a5 wasRelayed:(BOOL)a6 chatIdentifier:(id)a7 participants:(id)a8 checkingForSpam:(BOOL *)a9 myReceiverISOCountryCode:(id)a10 messageBody:(id)a11 completion:(id)a12;
- (void)categorizeIncomingMessageGUID:(id)a3 sender:(id)a4 wasRelayed:(BOOL)a5 chatIdentifier:(id)a6 participants:(id)a7 checkingForSpam:(BOOL *)a8 myReceiverISOCountryCode:(id)a9 messageBody:(id)a10 completion:(id)a11;
- (void)disableFilteringIfNeeded;
- (void)handler:(id)a3 incomingSMSFilteringSettingsMessage:(id)a4 fromToken:(id)a5;
- (void)setHasSpamExtensionUpdated:(BOOL)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setSpamBlockMap:(id)a3;
@end

@implementation IMDFilteringController

- (void)_processReceivedSMSFilteringSettingsDictionaryInBlastDoor:(id)a3 deviceID:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    if ([MEMORY[0x1E4F6E938] supportsIncomingSMSRelayFiltering])
    {
      v8 = [MEMORY[0x1E4F6E950] untrustedContext];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = sub_1D98629B8;
      v10[3] = &unk_1E6B78258;
      v10[4] = self;
      id v11 = v7;
      +[IMBlastdoor sendDictionary:v6 senderContext:v8 withCompletionBlock:v10];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Received invalid deviceID:%@. Not checking if we need to update filterCapabilities", buf, 0xCu);
    }
  }
}

- (void)_processReceivedSMSFilteringSettingsMessage:(id)a3 deviceID:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F6E938] supportsIncomingSMSRelayFiltering])
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Device is iPad. Checking if we need to update filterCapbilities from relayed message", (uint8_t *)&v12, 2u);
      }
    }
    v9 = [v6 filterExtensionName];
    uint64_t v10 = [v6 smsFilterCapabilitiesOptions];
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412802;
        id v13 = v9;
        __int16 v14 = 2048;
        uint64_t v15 = v10;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Received filterExtensionName: %@, smsFilterCapabilitiesOptions: %lu from deviceID:%@. Checking if we need to update filterCapabilities", (uint8_t *)&v12, 0x20u);
      }
    }
    [(IMDFilteringController *)self _checkAndUpdateSMSFilteringSettingsForDeviceID:v7 smsFilterCapabilitiesOptions:v10 filterExtensionName:v9];
  }
}

+ (IMDFilteringController)sharedInstance
{
  if (qword_1EBE2BAB0 != -1) {
    dispatch_once(&qword_1EBE2BAB0, &unk_1F33922A0);
  }
  v2 = (void *)qword_1EBE2BCF0;

  return (IMDFilteringController *)v2;
}

- (IMDFilteringController)init
{
  v11.receiver = self;
  v11.super_class = (Class)IMDFilteringController;
  v2 = [(IMDFilteringController *)&v11 init];
  if (v2)
  {
    uint64_t v3 = im_primary_queue();
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v3;

    v5 = +[IMDRelayPushHandler sharedInstance];
    [v5 addListener:v2];

    id v6 = +[IMDRelayPushHandler sharedInstance];
    [v6 setRegistered:1];

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v2, (CFNotificationCallback)sub_1D9862F00, @"com.apple.LaunchServices.pluginsunregistered", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v8 = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(v8, v2, (CFNotificationCallback)sub_1D986303C, @"com.apple.LaunchServices.pluginsregistered", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1D9863178, @"_SMSFilterExtensionParamsChangeDistributedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (id)_createNewChatIdentifierFromChatIdentifier:(id)a3 andCategoryLabel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    id v7 = [v5 stringByAppendingFormat:@"(%@)", v6];
  }
  else
  {
    id v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (void)_categorizeRelayMessageWithCategory:(int64_t)a3 subCategory:(int64_t)a4 deviceID:(id)a5 completion:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  objc_super v11 = (void (**)(id, int64_t, int64_t, void *))a6;
  int v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v13 = [v12 isSMSFilterSyncEnabled];

  if (v13)
  {
    if ([v10 length]
      && [(IMDFilteringController *)self _isMessageCategorized:a3])
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v19 = 134218240;
          int64_t v20 = a3;
          __int16 v21 = 2048;
          int64_t v22 = a4;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Relayed message was categorized on iPhone. Received category: %ld and subCategory: %ld.", (uint8_t *)&v19, 0x16u);
        }
      }
      if (a4
        && ([MEMORY[0x1E4F6E930] isValidSubActionForDeviceID:v10 action:a3 subAction:a4] & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            int v19 = 134218240;
            int64_t v20 = a4;
            __int16 v21 = 2048;
            int64_t v22 = a3;
            _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "%ld is not a valid subAction for category: %ld. Resetting subCategory to None", (uint8_t *)&v19, 0x16u);
          }
        }
        a4 = 0;
      }
      __int16 v16 = [MEMORY[0x1E4F6E930] fetchFilterExtensionNameForDeviceID:v10];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Relayed message was not categorized on iPhone or device ID is invalid.", (uint8_t *)&v19, 2u);
        }
      }
      __int16 v16 = 0;
      a4 = 0;
      a3 = 0;
    }
    if (![v16 length])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Received Device ID has no extension Name. Resetting category and subCategory to None", (uint8_t *)&v19, 2u);
        }
      }
      a4 = 0;
      a3 = 0;
    }
    v11[2](v11, a3, a4, v16);
  }
}

- (void)_smsSpamCheck:(id)a3 withMessageBody:(id)a4 withGuid:(id)a5 sender:(id)a6 receiverISOCountryCode:(id)a7 receivedViaRelay:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  [(IMDFilteringController *)self _storeSpamCompletionBlock:a3 forMessageGUID:v16];
  [(IMDFilteringController *)self _checkIfMessageIsSpam:v17 fromSender:v15 withGuid:v16 receiverISOCountryCode:v14 receivedViaRelay:v8];
}

- (BOOL)_shouldCheckChatForSMSSpam:(id)a3 participants:(id)a4 sender:(id)a5 fallbackFilterCategory:(int64_t *)a6 fallbackFilterSubCategory:(int64_t *)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = IMGetDomainIntForKey();
  id v16 = [MEMORY[0x1E4F6C360] sharedInstance];
  if ([v16 isInternalInstall]) {
    BOOL v17 = v15 < 1;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {

    goto LABEL_13;
  }

  if ((unint64_t)v15 > 3)
  {
LABEL_13:
    if ([MEMORY[0x1E4F6EA38] isFilterUnknownSendersEnabled]
      && [(IMDFilteringController *)self _isSpamFilteringEnabled])
    {
      if (![(IMDFilteringController *)self _areAllParticipantsUnknown:v13 fromSender:v14])
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_25;
        }
        int64_t v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          int v24 = 138412290;
          v25 = v12;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: not checking sms spam, chatid %@ has known participants", (uint8_t *)&v24, 0xCu);
        }
        goto LABEL_24;
      }
      uint64_t v20 = [(IMDFilteringController *)self _numberOfRepliesFor:v12 fallbackFilterCategory:a6 fallbackFilterSubCategory:a7];
      int v21 = IMOSLoggingEnabled();
      if (v20 < 3)
      {
        if (!v21) {
          goto LABEL_12;
        }
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v24 = 138412290;
          v25 = v12;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: checking SMS spam for chatid %@", (uint8_t *)&v24, 0xCu);
        }
        goto LABEL_11;
      }
      if (v21)
      {
        int64_t v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          int v24 = 138412290;
          v25 = v12;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: not checking sms spam, chatid %@ has 3 replies or more", (uint8_t *)&v24, 0xCu);
        }
LABEL_24:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      int64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: not checking for sms spam, filter is off", (uint8_t *)&v24, 2u);
      }
      goto LABEL_24;
    }
LABEL_25:
    BOOL v19 = 0;
    goto LABEL_26;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412546;
      v25 = @"IncomingMessageAlertSpamForcedCategory";
      __int16 v26 = 2048;
      uint64_t v27 = v15;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: default %@ set, forcing category %ld", (uint8_t *)&v24, 0x16u);
    }
LABEL_11:
  }
LABEL_12:
  BOOL v19 = 1;
LABEL_26:

  return v19;
}

- (int64_t)_numberOfRepliesFor:(id)a3 fallbackFilterCategory:(int64_t *)a4 fallbackFilterSubCategory:(int64_t *)a5
{
  uint64_t v27 = a4;
  uint64_t v28 = a5;
  v47[4] = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  v47[0] = &stru_1F3398578;
  v47[1] = @"smsft";
  v47[2] = @"smsfp";
  v47[3] = @"filtered";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  id v6 = 0;
  id v7 = 0;
  int64_t v8 = 0;
  uint64_t v9 = 0;
  if (v34)
  {
    uint64_t v32 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        uint64_t v11 = v9;
        int v12 = v7;
        id v13 = v6;
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v7 = -[IMDFilteringController _createNewChatIdentifierFromChatIdentifier:andCategoryLabel:](self, "_createNewChatIdentifierFromChatIdentifier:andCategoryLabel:", v36, v14, v27, v28);

        uint64_t v15 = +[IMDChatRegistry sharedInstance];
        id v16 = [(IMDFilteringController *)self account];
        id v6 = [v15 existingChatForID:v7 account:v16];

        uint64_t v9 = v11;
        if (v6) {
          BOOL v17 = v11 == 0;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17)
        {
          if ([v14 isEqualToString:&stru_1F3398578])
          {
            uint64_t v9 = 1;
          }
          else if ([v14 isEqualToString:@"smsft"])
          {
            uint64_t v9 = 4;
          }
          else if ([v14 isEqualToString:@"smsfp"])
          {
            uint64_t v9 = 3;
          }
          else
          {
            uint64_t v9 = 2;
          }
        }
        v8 += (int)[v6 getNumberOfTimesRespondedToThread];
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v34);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v30 = [MEMORY[0x1E4F6E938] fetchSMSFilterExtensionParams];
  uint64_t v35 = [v30 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v35)
  {
    uint64_t v29 = 0;
    uint64_t v33 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(v30);
        }
        BOOL v19 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        if (objc_msgSend(v19, "subAction", v27, v28))
        {
          uint64_t v20 = [v19 label];
          uint64_t v21 = [(IMDFilteringController *)self _createNewChatIdentifierFromChatIdentifier:v36 andCategoryLabel:v20];

          int64_t v22 = +[IMDChatRegistry sharedInstance];
          uint64_t v23 = [(IMDFilteringController *)self account];
          int v24 = [v22 existingChatForID:v21 account:v23];

          if (v24) {
            BOOL v25 = v9 == 0;
          }
          else {
            BOOL v25 = 0;
          }
          if (v25)
          {
            uint64_t v9 = [v19 action];
            uint64_t v29 = [v19 subAction];
          }
          v8 += (int)[v24 getNumberOfTimesRespondedToThread];
          id v6 = v24;
          id v7 = (void *)v21;
        }
      }
      uint64_t v35 = [v30 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v35);
  }
  else
  {
    uint64_t v29 = 0;
  }

  if (v8 >= 3)
  {
    *uint64_t v27 = v9;
    *uint64_t v28 = v29;
  }

  return v8;
}

- (BOOL)_areAllParticipantsUnknown:(id)a3 fromSender:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    LOBYTE(v7) = IMDAreAllAliasesUnknown();
  }
  else
  {
    v10[0] = v5;
    int64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    uint64_t v7 = IMDAreAllAliasesUnknown();
  }
  return v7;
}

- (BOOL)_isMessageCategorized:(int64_t)a3
{
  return a3 == 4 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)account
{
  v2 = +[IMDServiceController sharedController];
  uint64_t v3 = [v2 serviceWithName:*MEMORY[0x1E4F6E1A0]];

  v4 = +[IMDAccountController sharedAccountController];
  id v5 = [v4 accountsForService:v3];
  id v6 = [v5 firstObject];

  return v6;
}

- (BOOL)_isSpamFilteringEnabled
{
  return IMGetDomainBoolForKey();
}

- (id)_getSpamExtensionID
{
  return (id)IMGetCachedDomainValueForKey();
}

- (id)_getSpamExtensionName
{
  uint64_t v2 = IMGetDomainIntForKey();
  uint64_t v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  if ([v3 isInternalInstall]) {
    BOOL v4 = v2 < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
  }
  else
  {

    if ((unint64_t)v2 < 4)
    {
      id v5 = @"DefaultsOverrideExtension";
      goto LABEL_10;
    }
  }
  IMGetCachedDomainValueForKey();
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

- (void)_checkAndUpdateFilterParamsForFilterExtension
{
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isSMSFilterSyncEnabled];

  if (v4 && (IMSharedHelperDeviceIsiPad() & 1) == 0)
  {
    BOOL v5 = [(IMDFilteringController *)self _isSpamFilteringEnabled];
    int v6 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v6)
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "SMS Filtering was enabled. Updating Filter Params", buf, 2u);
        }
      }
      [(IMDFilteringController *)self _updateFilterParamsForFilterExtension];
    }
    else
    {
      if (v6)
      {
        int64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "SMS Filtering was disabled. Clearing Filter Params", v9, 2u);
        }
      }
      [(IMDFilteringController *)self _disableSpamFilteringAndRelay];
    }
  }
}

- (void)_updateFilterParamsForFilterExtension
{
  uint64_t v3 = [(IMDFilteringController *)self _getSpamExtensionID];
  if (v3)
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2050000000;
    int v4 = (void *)qword_1EA8CA6A0;
    uint64_t v23 = qword_1EA8CA6A0;
    if (!qword_1EA8CA6A0)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = (uint64_t)sub_1D9867430;
      BOOL v17 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6B73480;
      uint64_t v18 = (void (*)(uint64_t))&v20;
      sub_1D9867430((uint64_t)buf);
      int v4 = (void *)v21[3];
    }
    BOOL v5 = v4;
    _Block_object_dispose(&v20, 8);
    id v6 = [v5 alloc];
    if (v6)
    {
      uint64_t v7 = (void *)[v6 initWithExtensionIdentifier:v3];
      *(void *)buf = 0;
      uint64_t v15 = (uint64_t)buf;
      uint64_t v16 = 0x3032000000;
      BOOL v17 = sub_1D9864430;
      uint64_t v18 = sub_1D9864440;
      id v19 = 0;
      id v19 = objc_alloc_init((Class)sub_1D9864448());
      int64_t v8 = *(void **)(v15 + 40);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      void v10[2] = sub_1D986452C;
      v10[3] = &unk_1E6B78280;
      id v11 = v3;
      int v12 = self;
      id v13 = buf;
      [v8 performCapabilitiesQueryRequest:v7 completion:v10];

      _Block_object_dispose(buf, 8);
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "IdentityLookup framework not found", buf, 2u);
      }
    }
  }
}

- (void)_checkIfMessageIsSpam:(id)a3 fromSender:(id)a4 withGuid:(id)a5 receiverISOCountryCode:(id)a6 receivedViaRelay:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = IMGetDomainIntForKey();
  BOOL v17 = [MEMORY[0x1E4F6C360] sharedInstance];
  if ([v17 isInternalInstall]) {
    BOOL v18 = v16 < 1;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
  }
  else
  {

    if ((unint64_t)v16 <= 3)
    {
      uint64_t v19 = IMGetDomainIntForKey();
      if (IMOSLoggingEnabled())
      {
        uint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = @"IncomingMessageAlertSpamForcedCategory";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2048;
          long long v41 = (uint64_t (*)(uint64_t, uint64_t))v19;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: default %@ set, forcing category %ld sub category %ld", buf, 0x20u);
        }
      }
      [(IMDFilteringController *)self _executeSpamCompletionBlockForMessageGuid:v14 category:v16 subCategory:v19 receivedViaRelay:v7];
      goto LABEL_23;
    }
  }
  if (v12 && v13)
  {
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    uint64_t v35 = sub_1D9864E70;
    id v36 = &unk_1E6B76578;
    long long v37 = self;
    id v21 = v14;
    id v38 = v21;
    BOOL v39 = v7;
    im_dispatch_after();
    uint64_t v22 = [(IMDFilteringController *)self _getSpamExtensionID];
    if (sub_1D9864E88())
    {
      uint64_t v23 = (void *)[objc_alloc((Class)sub_1D9864E88()) initWithExtensionIdentifier:v22];
      int v24 = [v12 string];
      [v23 setMessageBody:v24];

      [v23 setSender:v13];
      [v23 setReceiverISOCountryCode:v15];
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      long long v41 = sub_1D9864430;
      long long v42 = sub_1D9864440;
      id v43 = 0;
      id v43 = objc_alloc_init((Class)sub_1D9864448());
      BOOL v25 = *(void **)(*(void *)&buf[8] + 40);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = sub_1D9864F6C;
      v27[3] = &unk_1E6B782D0;
      id v28 = v22;
      uint64_t v29 = self;
      BOOL v32 = v7;
      id v30 = v21;
      v31 = buf;
      [v25 performQueryRequest:v23 completion:v27];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "IdentityLookup framework not found", buf, 2u);
        }
      }
      [(IMDFilteringController *)self _executeSpamCompletionBlockForMessageGuid:v21 category:0 subCategory:0 receivedViaRelay:v7];
    }
  }
LABEL_23:
}

- (void)_checkAndUpdateSMSSpamFilterExtensionForUnregisteredOrUpdatedPlugins:(id)a3 arePluginsRegistered:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    BOOL v19 = v4;
    if (IMOSLoggingEnabled())
    {
      BOOL v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Plugins have been deleted. Checking if current spam filter extension was deleted", buf, 2u);
      }
    }
    int64_t v8 = [(IMDFilteringController *)self _getSpamExtensionID];
    if (v8)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = [v9 objectForKey:*(void *)(*((void *)&v22 + 1) + 8 * i)];
            id v14 = [v13 objectForKey:@"NSExtensionIdentifier"];

            if (v14 && [v8 isEqualToString:v14])
            {
              int v16 = IMOSLoggingEnabled();
              if (v19)
              {
                if (v16)
                {
                  BOOL v17 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v27 = v8;
                    _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Spam extension installed matches current spam extension %@. Checking for new spam filter capabilities", buf, 0xCu);
                  }
                }
                self->_hasSpamExtensionUpdated = 1;
                [(IMDFilteringController *)self _updateFilterParamsForFilterExtension];
              }
              else
              {
                if (v16)
                {
                  BOOL v18 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v27 = v8;
                    _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Spam extension deleted matches current spam extension %@.", buf, 0xCu);
                  }
                }
                id v20 = v8;
                id v21 = v14;
                im_dispatch_after();
              }
              goto LABEL_33;
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_33:
    }
    else if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "No spam extension currently selected. Not doing anything", buf, 2u);
      }
    }
  }
}

- (void)_relaySMSFilteringSettingsForFilterState:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isSMSFilterSyncEnabled];

  if (v6 && (IMSharedHelperDeviceIsiPad() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v23 = a3;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Received request to relay SMS filtering settings for filterState: %ld", buf, 0xCu);
      }
    }
    id v8 = [(IMDFilteringController *)self _newSMSFilteringSettingsDictForFilterState:a3];
    id v9 = (void *)[v8 mutableCopy];

    [v9 setObject:@"1" forKey:@"sV"];
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v23 = (int64_t)v9;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Created SMSFilteringSettings dictionary: %@", buf, 0xCu);
      }
    }
    uint64_t v11 = JWEncodeDictionary();
    id v12 = (void *)[v11 _FTCopyGzippedData];
    id v13 = (void *)MEMORY[0x1E4F1CA60];
    id v14 = [NSNumber numberWithInteger:139];
    id v15 = [NSNumber numberWithDouble:*MEMORY[0x1E4F6B050]];
    int v16 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F6AA18], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F6AA00], v14, *MEMORY[0x1E4F6A978], v12, *MEMORY[0x1E4F6A988], v15, *MEMORY[0x1E4F6AA10], 0);

    BOOL v17 = [(IMDFilteringController *)self relayController];
    BOOL v18 = [MEMORY[0x1E4F6E660] myCTPhoneNumber];
    int v19 = [v17 sendDataToPeers:v16 forcedCallerID:v18 shouldFilterRecepients:1 requestProxySend:0 dontSendTo:0];

    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = @"NO";
        if (v19) {
          id v21 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        int64_t v23 = (int64_t)v21;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Relayed SMSFilteringSettings dictionary: %@", buf, 0xCu);
      }
    }
  }
}

- (id)_newSMSFilteringSettingsDictForFilterState:(int64_t)a3
{
  BOOL v4 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isSMSFilterSyncEnabled];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Creating SMSFilteringSettings dictionary", buf, 2u);
      }
    }
    if (a3 == 1)
    {
      id v8 = IMGetCachedDomainValueForKey();
      uint64_t v9 = [MEMORY[0x1E4F6E930] fetchSMSFilterCapabilitiesOptions];
      id v10 = v8;
      if (v10)
      {
        uint64_t v11 = v10;
        CFDictionarySetValue(v4, (const void *)SMSRelayFilteringSettingsFilterExtensionNameKey, v10);
      }
    }
    else
    {
      id v12 = [MEMORY[0x1E4F6C360] sharedInstance];
      int v13 = [v12 isInternalInstall];

      if (v13 && (unint64_t)(IMGetDomainIntForKey() - 4) >= 0xFFFFFFFFFFFFFFFDLL)
      {
        if (IMOSLoggingEnabled())
        {
          int v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)BOOL v17 = 0;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Forcing SMSFilteringSettings dict", v17, 2u);
          }
        }
        CFDictionarySetValue(v4, (const void *)SMSRelayFilteringSettingsFilterExtensionNameKey, @"DefaultsOverrideExtension");
        id v14 = [NSNumber numberWithUnsignedInteger:1];
        if (!v14)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            sub_1D99055B8();
          }
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      uint64_t v9 = 1;
    }
    id v14 = [NSNumber numberWithUnsignedInteger:v9];
    if (!v14)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        sub_1D99055B8();
      }
      goto LABEL_16;
    }
LABEL_13:
    CFDictionarySetValue(v4, (const void *)SMSRelayFilteringSettingsFilterCapabilitiesOptionsKey, v14);
LABEL_16:
  }
  return v4;
}

- (void)_processReceivedSMSFilteringSettingsDictionary:(id)a3 deviceID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v8 = [v7 isSMSFilterSyncEnabled];

  if (v8) {
    [(IMDFilteringController *)self _processReceivedSMSFilteringSettingsDictionaryInBlastDoor:v9 deviceID:v6];
  }
}

- (void)_checkAndUpdateSMSFilteringSettingsForDeviceID:(id)a3 smsFilterCapabilitiesOptions:(unint64_t)a4 filterExtensionName:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v11 = [v10 isSMSFilterSyncEnabled];

  if (!v11
    || ![v8 length]
    || ![MEMORY[0x1E4F6E938] supportsIncomingSMSRelayFiltering])
  {
    goto LABEL_24;
  }
  BOOL v12 = [(IMDFilteringController *)self _isSpamFilteringEnabled];
  if (IMOSLoggingEnabled())
  {
    int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v19 = 138413058;
      id v20 = v8;
      __int16 v21 = 2048;
      unint64_t v22 = (a4 >> 1) & 1;
      __int16 v23 = 2048;
      unint64_t v24 = a4;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Received SMSFilteringSettings from iPhone:%@ with filterState: %ld, smsFilterCapabilitiesOptions:%lu, filterExtensionName:%@. Checking if we need to update filter params.", (uint8_t *)&v19, 0x2Au);
    }
  }
  if ([MEMORY[0x1E4F6E930] isValidSMSFilterCapabilitiesOptions:a4])
  {
    if ((a4 & 2) != 0)
    {
      if (v12)
      {
        int v16 = [MEMORY[0x1E4F6E930] shouldUpdateSMSFilterSyncDeviceParamsForDeviceID:v8 smsFilterCapabilitiesOptions:a4 filterExtensionName:v9];
      }
      else
      {
        [(IMDFilteringController *)self _enableSpamFiltering];
        if (IMOSLoggingEnabled())
        {
          BOOL v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LOWORD(v19) = 0;
            _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "SMS Filtering state changed from disabled to enabled. Need to update filter params.", (uint8_t *)&v19, 2u);
          }
        }
        int v16 = 1;
      }
      if (IMOSLoggingEnabled())
      {
        BOOL v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Received values not present in SMSFilterSyncDeviceParams array. Need to update filter params.", (uint8_t *)&v19, 2u);
        }

        if ((v16 & 1) == 0) {
          goto LABEL_17;
        }
      }
      else if (!v16)
      {
        goto LABEL_17;
      }
    }
    else
    {
      if (!v12) {
        goto LABEL_24;
      }
      if (IMOSLoggingEnabled())
      {
        id v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "SMS Filtering state changed from enabled to disabled. Need to update filter params.", (uint8_t *)&v19, 2u);
        }
      }
    }
  }
  else
  {
    a4 = 0;
  }
  [MEMORY[0x1E4F6E930] updateSMSFilterCapabilitiesOptionsForDeviceID:v8 smsFilterCapabilitiesOptions:a4 filterExtensionName:v9];
LABEL_17:
  if (v12 && ([MEMORY[0x1E4F6E930] isSMSFilteringEnabledInSMSFilterCapabilitiesOptions] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "SMS Filtering state changed from enabled to disabled. Need to update filter params.", (uint8_t *)&v19, 2u);
      }
    }
    [(IMDFilteringController *)self _disableSpamFiltering];
  }
LABEL_24:
}

- (void)_enableSpamFiltering
{
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isSMSFilterSyncEnabled];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Enabling Spam Filtering", v6, 2u);
      }
    }
    [(IMDFilteringController *)self _updateSpamFilteringState:1];
  }
}

- (void)_disableSpamFilteringAndRelay
{
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isSMSFilterSyncEnabled];

  if (v4)
  {
    [(IMDFilteringController *)self _disableSpamFiltering];
    if (IMOSLoggingEnabled())
    {
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "SMS Filtering was disabled. Relaying to peers.", buf, 2u);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D9866304;
    block[3] = &unk_1E6B73268;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_disableSpamFiltering
{
  CFPreferencesSetAppValue(@"spamFilterExtensionParams", 0, @"com.apple.MobileSMS");
  CFPreferencesSetAppValue(@"spamFiltrationExtensionID", 0, @"com.apple.MobileSMS");
  CFPreferencesSetAppValue(@"spamFiltrationExtensionName", 0, @"com.apple.MobileSMS");

  [(IMDFilteringController *)self _updateSpamFilteringState:0];
}

- (void)_updateSpamFilteringState:(int64_t)a3
{
  CFPreferencesSetAppValue(@"IncomingMessageAlertSpamFiltration", (CFPropertyListRef)[NSNumber numberWithInteger:a3], @"com.apple.MobileSMS");
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isSMSFilterSyncEnabled];

  if (!v4 || [MEMORY[0x1E4F6EA38] isFilterUnknownSendersEnabled])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.IncomingMessageAlertSpamFiltration.changed", 0, 0, 1u);
  }
}

- (void)handler:(id)a3 incomingSMSFilteringSettingsMessage:(id)a4 fromToken:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v12 = [v11 isSMSFilterSyncEnabled];

  if (v12 && [MEMORY[0x1E4F6E938] supportsIncomingSMSRelayFiltering])
  {
    int v13 = [(IMDFilteringController *)self relayController];
    id v14 = [v13 enrollmentController];
    [v14 _approveSelfForSMSRelay];

    id v15 = [(IMDFilteringController *)self relayController];
    int v16 = [v15 idsDeviceFromPushToken:v10];

    if (IMOSLoggingEnabled())
    {
      BOOL v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        BOOL v18 = [v16 name];
        int v20 = 138412290;
        __int16 v21 = v18;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Incoming SMSFilteringSettings message from %@", (uint8_t *)&v20, 0xCu);
      }
    }
    int v19 = [v16 uniqueIDOverride];
    [(IMDFilteringController *)self _processReceivedSMSFilteringSettingsDictionary:v9 deviceID:v19];
  }
}

- (BOOL)_storeSpamCompletionBlock:(id)a3 forMessageGUID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 length];
  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = !v9;
  if (!v9)
  {
    int v11 = [(NSMutableDictionary *)self->_spamBlockMap objectForKey:v7];
    if (v11 && IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412546;
        id v22 = v7;
        __int16 v23 = 2112;
        unint64_t v24 = v11;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Using existing mapping mapping from %@ to %@", (uint8_t *)&v21, 0x16u);
      }
    }
    spamBlockMap = self->_spamBlockMap;
    if (!spamBlockMap)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      int v16 = self->_spamBlockMap;
      p_spamBlockMap = &self->_spamBlockMap;
      *p_spamBlockMap = (NSMutableDictionary *)Mutable;

      spamBlockMap = *p_spamBlockMap;
    }
    BOOL v17 = (void *)[v6 copy];
    [(NSMutableDictionary *)spamBlockMap setObject:v17 forKey:v7];

    if (IMOSLoggingEnabled())
    {
      BOOL v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = _Block_copy(v6);
        int v21 = 138412546;
        id v22 = v7;
        __int16 v23 = 2112;
        unint64_t v24 = v19;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Generated mapping from %@ to %@", (uint8_t *)&v21, 0x16u);
      }
    }
LABEL_23:

    goto LABEL_24;
  }
  if (IMOSLoggingEnabled())
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Cannot store completion block for guid as either guid or completion block is invalid", (uint8_t *)&v21, 2u);
    }
    goto LABEL_23;
  }
LABEL_24:

  return v10;
}

- (void)_executeSpamCompletionBlockForMessageGuid:(id)a3 category:(int64_t)a4 subCategory:(int64_t)a5 receivedViaRelay:(BOOL)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v11 = [(NSMutableDictionary *)self->_spamBlockMap objectForKey:v10];
  if (v11)
  {
    if ([(IMDFilteringController *)self _isMessageCategorized:a4])
    {
      int v12 = [(IMDFilteringController *)self _getSpamExtensionName];
    }
    else
    {
      int v12 = 0;
    }
    ((void (**)(void, int64_t, int64_t, void *))v11)[2](v11, a4, a5, v12);
    [(IMDFilteringController *)self _clearSpamMapForMessageGUID:v10];
  }
  else if (IMOSLoggingEnabled())
  {
    int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v10;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "executeSpamCompletionBlockForMessageGuid: %@ Aready ran completion block, not doing anything", (uint8_t *)&v18, 0xCu);
    }
  }
  id v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v15 = [v14 isSMSFilterSyncEnabled];

  if ((v15 & 1) == 0)
  {
    int v16 = [(IMDFilteringController *)self relayController];
    BOOL v17 = v16;
    if (a6) {
      [v16 _clearSMSRelayMapForMessageWithGUID:v10];
    }
    else {
      [v16 _executeSMSRelayBlockForMessageWithGUID:v10 category:a4 subCategory:a5];
    }
  }
}

- (void)_clearSpamMapForMessageGUID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Clearing spam block mapping for %@", (uint8_t *)&v7, 0xCu);
    }
  }
  if (v4)
  {
    [(NSMutableDictionary *)self->_spamBlockMap removeObjectForKey:v4];
    if (![(NSMutableDictionary *)self->_spamBlockMap count])
    {
      spamBlockMap = self->_spamBlockMap;
      self->_spamBlockMap = 0;
    }
  }
}

- (id)relayController
{
  return +[IMDRelayServiceController sharedInstance];
}

- (void)categorizeIncomingMessage:(id)a3 messageGUID:(id)a4 sender:(id)a5 wasRelayed:(BOOL)a6 chatIdentifier:(id)a7 participants:(id)a8 checkingForSpam:(BOOL *)a9 myReceiverISOCountryCode:(id)a10 messageBody:(id)a11 completion:(id)a12
{
  id v33 = a3;
  id v30 = a12;
  id v29 = a11;
  id v28 = a10;
  id v16 = a8;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  if (objc_msgSend(v33, "has_spamCategory")) {
    uint64_t v20 = [v33 spamCategory];
  }
  else {
    uint64_t v20 = 0;
  }
  int v21 = [v33 smsFilteringSettings];
  id v22 = [v33 originatedDeviceUniqueID];
  uint64_t v23 = [v33 filterSubCategory];
  unint64_t v24 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  unsigned __int8 v25 = [v24 isSMSFilterSyncEnabled];

  if ((v25 & ((unint64_t)(v23 - 1) < 0xC)) != 0) {
    uint64_t v26 = v23;
  }
  else {
    uint64_t v26 = 0;
  }
  LOBYTE(v27) = a6;
  [(IMDFilteringController *)self categorizeIncomingMessage:v21 deviceID:v22 category:v20 subCategory:v26 messageGUID:v19 sender:v18 wasRelayed:v27 chatIdentifier:v17 participants:v16 checkingForSpam:a9 myReceiverISOCountryCode:v28 messageBody:v29 completion:v30];
}

- (void)categorizeIncomingMessageGUID:(id)a3 sender:(id)a4 wasRelayed:(BOOL)a5 chatIdentifier:(id)a6 participants:(id)a7 checkingForSpam:(BOOL *)a8 myReceiverISOCountryCode:(id)a9 messageBody:(id)a10 completion:(id)a11
{
  LOBYTE(v11) = a5;
  [(IMDFilteringController *)self categorizeIncomingMessage:0 deviceID:0 category:0 subCategory:0 messageGUID:a3 sender:a4 wasRelayed:v11 chatIdentifier:a6 participants:a7 checkingForSpam:a8 myReceiverISOCountryCode:a9 messageBody:a10 completion:a11];
}

- (void)categorizeIncomingMessage:(id)a3 deviceID:(id)a4 category:(int64_t)a5 subCategory:(int64_t)a6 messageGUID:(id)a7 sender:(id)a8 wasRelayed:(BOOL)a9 chatIdentifier:(id)a10 participants:(id)a11 checkingForSpam:(BOOL *)a12 myReceiverISOCountryCode:(id)a13 messageBody:(id)a14 completion:(id)a15
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v19 = a4;
  id v38 = a7;
  id v20 = a8;
  id v21 = a10;
  id v22 = a11;
  id v36 = a13;
  id v23 = a14;
  unint64_t v24 = (void (**)(id, uint64_t, uint64_t, void))a15;
  if (IMOSLoggingEnabled())
  {
    unsigned __int8 v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = v38;
      __int16 v43 = 2112;
      uint64_t v44 = (uint64_t)v21;
      _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Looking at message with guid %@ for chatid %@, will check if it needs to be sent to spam extension app", buf, 0x16u);
    }
  }
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v26 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v27 = [v26 isSMSFilterSyncEnabled];

  if (!v27)
  {
    if ([(IMDFilteringController *)self _shouldCheckChatForSMSSpam:v21 participants:v22 sender:v20 fallbackFilterCategory:&v40 fallbackFilterSubCategory:&v39])
    {
LABEL_19:
      *a12 = 1;
      [(IMDFilteringController *)self _smsSpamCheck:v24 withMessageBody:v23 withGuid:v38 sender:v20 receiverISOCountryCode:v36 receivedViaRelay:a9];
      goto LABEL_29;
    }
LABEL_22:
    v24[2](v24, v40, v39, 0);
    goto LABEL_29;
  }
  if (![MEMORY[0x1E4F6E938] supportsIncomingSMSRelayFiltering])
  {
    if ([(IMDFilteringController *)self _shouldCheckChatForSMSSpam:v21 participants:v22 sender:v20 fallbackFilterCategory:&v40 fallbackFilterSubCategory:&v39])
    {
      goto LABEL_19;
    }
    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    id v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Device is iPad. Checking if we need to update filterCapbilities from relayed message", buf, 2u);
    }
  }
  uint64_t v29 = [v19 length];
  if (v37 && v29)
  {
    id v30 = [v37 filterExtensionName];
    uint64_t v31 = [v37 smsFilterCapabilitiesOptions];
    if (IMOSLoggingEnabled())
    {
      BOOL v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v42 = v30;
        __int16 v43 = 2048;
        uint64_t v44 = v31;
        __int16 v45 = 2112;
        id v46 = v19;
        _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Received filterExtensionName: %@, smsFilterCapabilitiesOptions: %lu from deviceID:%@. Checking if we need to update filterCapabilities", buf, 0x20u);
      }
    }
    [(IMDFilteringController *)self _checkAndUpdateSMSFilteringSettingsForDeviceID:v19 smsFilterCapabilitiesOptions:v31 filterExtensionName:v30];
  }
  else if (IMOSLoggingEnabled())
  {
    id v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v19;
      _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Received invalid deviceID:%@. Not checking if we need to update filterCapabilities", buf, 0xCu);
    }
  }
  [(IMDFilteringController *)self _categorizeRelayMessageWithCategory:a5 subCategory:a6 deviceID:v19 completion:v24];
LABEL_29:
}

- (void)disableFilteringIfNeeded
{
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isSMSFilterSyncEnabled];

  if (v4
    && [(IMDFilteringController *)self _isSpamFilteringEnabled]
    && ([MEMORY[0x1E4F6E930] isSMSFilteringEnabledInSMSFilterCapabilitiesOptions] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "No more relay devices available. SMS Filtering state changed from enabled to disabled. Need to update filter params.", v6, 2u);
      }
    }
    [(IMDFilteringController *)self _disableSpamFiltering];
  }
}

- (void)_relayCurrentSMSFilteringSettings
{
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isSMSFilterSyncEnabled];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Received request to relay current SMS filtering settings", v6, 2u);
      }
    }
    [(IMDFilteringController *)self _relaySMSFilteringSettingsForFilterState:[(IMDFilteringController *)self _isSpamFilteringEnabled]];
  }
}

- (BOOL)hasSpamExtensionUpdated
{
  return self->_hasSpamExtensionUpdated;
}

- (void)setHasSpamExtensionUpdated:(BOOL)a3
{
  self->_hasSpamExtensionUpdated = a3;
}

- (NSMutableDictionary)spamBlockMap
{
  return self->_spamBlockMap;
}

- (void)setSpamBlockMap:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);

  objc_storeStrong((id *)&self->_spamBlockMap, 0);
}

@end