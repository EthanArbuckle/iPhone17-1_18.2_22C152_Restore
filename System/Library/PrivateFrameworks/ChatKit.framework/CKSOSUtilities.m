@interface CKSOSUtilities
+ (id)sharedUtilities;
- (BOOL)isMMSEnabled;
- (BOOL)isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot;
- (id)_chatForHandle:(id)a3;
- (id)_compositionsForMessage:(id)a3 withReasons:(unint64_t)a4;
- (id)_sendCompositions:(id)a3 toConversation:(id)a4 useStandalone:(BOOL)a5 shouldForceSMS:(BOOL)a6 isCritical:(BOOL)a7;
- (id)_sendMessageAndReturnGUIDs:(id)a3;
- (id)_uniqueFilePathForFilename:(id)a3;
- (id)sendComposition:(id)a3 toConversation:(id)a4 useStandalone:(BOOL)a5 shouldForceSMS:(BOOL)a6 isCritical:(BOOL)a7;
- (void)_refreshServicesForSending:(id)a3;
- (void)_sendMessageAndObserveNotification:(id)a3;
- (void)isMMSEnabled;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 location:(id)a4 recipients:(id)a5;
- (void)sendMessage:(id)a3 location:(id)a4 recipients:(id)a5 failureHandler:(id)a6;
@end

@implementation CKSOSUtilities

+ (id)sharedUtilities
{
  if (sharedUtilities_onceToken_0 != -1) {
    dispatch_once(&sharedUtilities_onceToken_0, &__block_literal_global_277);
  }
  v2 = (void *)sharedUtilities_sharedUtilities;

  return v2;
}

void __33__CKSOSUtilities_sharedUtilities__block_invoke()
{
  v0 = objc_alloc_init(CKSOSUtilities);
  v1 = (void *)sharedUtilities_sharedUtilities;
  sharedUtilities_sharedUtilities = (uint64_t)v0;
}

- (BOOL)isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__pred_MKBGetDeviceLockStateMobileKeyBag != -1) {
    dispatch_once(&isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__pred_MKBGetDeviceLockStateMobileKeyBag, &__block_literal_global_132_3);
  }
  if (isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__pred_MKBDeviceUnlockedSinceBootMobileKeyBag != -1) {
    dispatch_once(&isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__pred_MKBDeviceUnlockedSinceBootMobileKeyBag, &__block_literal_global_138_1);
  }
  int v2 = isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__MKBGetDeviceLockState(0);
  BOOL v3 = v2 == 3 || isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__MKBDeviceUnlockedSinceBoot() == 1;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315650;
      v7 = "-[CKSOSUtilities isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot]";
      __int16 v8 = 1024;
      int v9 = v2;
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "%s keybagLockState:%d mobileKeyBagDisabledOrDeviceUnlockedSinceBoot:%d", (uint8_t *)&v6, 0x18u);
    }
  }
  return v3;
}

void *__65__CKSOSUtilities_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__block_invoke()
{
  result = (void *)MEMORY[0x192FBA870]("MKBGetDeviceLockState", @"MobileKeyBag");
  isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__MKBGetDeviceLockState = result;
  return result;
}

void *__65__CKSOSUtilities_isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__block_invoke_2()
{
  result = (void *)MEMORY[0x192FBA870]("MKBDeviceUnlockedSinceBoot", @"MobileKeyBag");
  isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot__MKBDeviceUnlockedSinceBoot = result;
  return result;
}

- (BOOL)isMMSEnabled
{
  int v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[CKSOSUtilities isMMSEnabled](v2);
  }

  return 0;
}

- (void)sendMessage:(id)a3 location:(id)a4 recipients:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = [[CKSOSMessage alloc] initWithMessage:v10 recipients:v8];

  [(CKSOSMessage *)v11 setLocation:v9];
  [(CKSOSUtilities *)self sendMessage:v11];
}

- (void)sendMessage:(id)a3 location:(id)a4 recipients:(id)a5 failureHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[CKSOSMessage alloc] initWithMessage:v13 recipients:v11];

  [(CKSOSMessage *)v14 setLocation:v12];
  [(CKSOSMessage *)v14 setFailureBlock:v10];

  [(CKSOSUtilities *)self sendMessage:v14];
}

- (void)sendMessage:(id)a3
{
  id v4 = a3;
  id v5 = (id)*MEMORY[0x1E4F6DAD0];
  id v6 = (id)*MEMORY[0x1E4F6DAC8];
  v7 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v7 trackEvent:v5 withDictionary:&unk_1EDF17C58];

  id v8 = [v4 failureBlock];
  id v9 = (void *)[v8 copy];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __30__CKSOSUtilities_sendMessage___block_invoke;
  v18[3] = &unk_1E5622BA8;
  id v10 = v6;
  id v19 = v10;
  id v20 = &unk_1EDF17C58;
  id v11 = v9;
  id v21 = v11;
  [v4 setFailureBlock:v18];
  [(CKSOSUtilities *)self _refreshServicesForSending:v4];
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "sendMessage: Waiting for registration check before sending", buf, 2u);
    }
  }
  dispatch_time_t v13 = dispatch_time(0, 4000000000);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __30__CKSOSUtilities_sendMessage___block_invoke_148;
  v15[3] = &unk_1E5620AF8;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  dispatch_after(v13, MEMORY[0x1E4F14428], v15);
}

uint64_t __30__CKSOSUtilities_sendMessage___block_invoke(void *a1)
{
  int v2 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v2 trackEvent:a1[4] withDictionary:a1[5]];

  uint64_t result = a1[6];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __30__CKSOSUtilities_sendMessage___block_invoke_148(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessageAndObserveNotification:*(void *)(a1 + 40)];
}

- (void)_refreshServicesForSending:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [a3 recipients];
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v7, 0);
        id v9 = [MEMORY[0x1E4F6BDB8] smsService];
        id v10 = CKMakeHandlesFromRecipientsWithFallbackService(v8, v9);

        if ([v10 count])
        {
          id v11 = [v10 firstObject];

          if (v11)
          {
            id v12 = [v10 firstObject];
            dispatch_time_t v13 = [(CKSOSUtilities *)self _chatForHandle:v12];
            id v14 = IMLogHandleForCategory();
            BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
            if (v13)
            {
              if (v15)
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v23 = v7;
                __int16 v24 = 2112;
                v25 = v13;
                _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "refreshServiceForSending for recipient:%@ chat:%@", buf, 0x16u);
              }

              [v13 refreshServiceForSending];
            }
            else
            {
              if (v15)
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v23 = v7;
                _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Can't refreshServiceForSending for recipient:%@ (no chat)", buf, 0xCu);
              }
            }
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v4);
  }
}

- (void)_sendMessageAndObserveNotification:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 recipients];
  id v6 = [v4 failureBlock];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  __int16 v24 = __Block_byref_object_copy__80;
  v25 = __Block_byref_object_dispose__80;
  id v26 = 0;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Trying to send SOS message with recipients:%@", buf, 0xCu);
    }
  }
  uint64_t v8 = [(CKSOSUtilities *)self _sendMessageAndReturnGUIDs:v4];
  id v9 = (void *)v8;
  if (v6 && v8)
  {
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v11 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v12 = *MEMORY[0x1E4F6B9B0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__CKSOSUtilities__sendMessageAndObserveNotification___block_invoke;
    v17[3] = &unk_1E562CDF0;
    id v18 = v9;
    id v19 = v6;
    long long v20 = &v21;
    uint64_t v13 = [v10 addObserverForName:v12 object:0 queue:v11 usingBlock:v17];
    id v14 = (void *)v22[5];
    v22[5] = v13;
  }
  dispatch_time_t v15 = dispatch_time(0, 600000000000);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__CKSOSUtilities__sendMessageAndObserveNotification___block_invoke_2;
  v16[3] = &unk_1E5620B90;
  v16[4] = &v21;
  dispatch_after(v15, MEMORY[0x1E4F14428], v16);
  _Block_object_dispose(&v21, 8);
}

void __53__CKSOSUtilities__sendMessageAndObserveNotification___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 userInfo];
  id v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F6BA98]];

  id v4 = (void *)a1[4];
  uint64_t v5 = [v9 guid];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    (*(void (**)(void))(a1[5] + 16))();
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:*(void *)(*(void *)(a1[6] + 8) + 40)];

    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

void __53__CKSOSUtilities__sendMessageAndObserveNotification___block_invoke_2(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (id)_compositionsForMessage:(id)a3 withReasons:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [CKComposition alloc];
  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v8 = [v5 messageForReasons:a4];
  id v9 = (void *)[v7 initWithString:v8];
  id v10 = [(CKComposition *)v6 initWithText:v9 subject:0];

  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v10, 0);
  uint64_t v12 = [v5 locationURL];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    id v14 = [CKComposition alloc];
    id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v16 = [v5 locationURL];
    v17 = (void *)[v15 initWithString:v16];
    id v18 = [(CKComposition *)v14 initWithText:v17 subject:0];

    [v11 addObject:v18];
LABEL_3:

    goto LABEL_4;
  }
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "cannot send location URL as none was provided", buf, 2u);
    }
    goto LABEL_3;
  }
LABEL_4:

  return v11;
}

- (id)_sendMessageAndReturnGUIDs:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v37 = [MEMORY[0x1E4F1CA48] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [v3 recipients];
  uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v4)
  {
    uint64_t v39 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v42 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v6, 0);
        uint64_t v8 = [MEMORY[0x1E4F6BDB8] smsService];
        id v9 = CKMakeHandlesFromRecipientsWithFallbackService(v7, v8);

        if ([v9 count])
        {
          id v10 = [v9 firstObject];
          BOOL v11 = v10 == 0;

          if (!v11)
          {
            uint64_t v12 = [v9 firstObject];
            uint64_t v13 = [(CKSOSUtilities *)self _chatForHandle:v12];
            if (IMOSLoggingEnabled())
            {
              id v14 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                id v15 = [v13 guid];
                *(_DWORD *)buf = 138412802;
                id v46 = v3;
                __int16 v47 = 2112;
                v48 = v12;
                __int16 v49 = 2112;
                v50 = v15;
                _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "_sendMessageAndReturnGUIDs:%@, handle %@, chat guid %@.", buf, 0x20u);
              }
            }
            id v16 = [[CKConversation alloc] initWithChat:v13];
            v17 = [v3 recipientReasons];
            id v18 = [v17 objectForKeyedSubscript:v6];
            uint64_t v19 = [v18 integerValue];

            long long v20 = [v12 ID];
            LODWORD(v18) = IMStringIsEmail();

            if (v18)
            {
              if (IMOSLoggingEnabled())
              {
                uint64_t v21 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v46 = v3;
                  _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "[Alerting] sending SOS messages over iMessage to Zelkova email handle. %@", buf, 0xCu);
                }
              }
              v22 = [(CKSOSUtilities *)self _compositionsForMessage:v3 withReasons:v19];
              uint64_t v23 = -[CKSOSUtilities _sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:](self, "_sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:", v22, v16, [v3 useStandalone], 0, objc_msgSend(v3, "isCritical"));
              goto LABEL_36;
            }
            __int16 v24 = [(CKConversation *)v16 lastAddressedHandle];
            int IsEmail = IMStringIsEmail();

            if (IsEmail)
            {
              if ((v19 & 2) != 0)
              {
                if (IMOSLoggingEnabled())
                {
                  id v26 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v46 = v3;
                    _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "[Alerting] sending SOS messages over iMessage to Zelkova phone number handle from email handle. %@", buf, 0xCu);
                  }
                }
                uint64_t v27 = [(CKSOSUtilities *)self _compositionsForMessage:v3 withReasons:2];
                v28 = -[CKSOSUtilities _sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:](self, "_sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:", v27, v16, [v3 useStandalone], 0, objc_msgSend(v3, "isCritical"));
                [v37 addObjectsFromArray:v28];
              }
              if (v19)
              {
                if (IMOSLoggingEnabled())
                {
                  uint64_t v29 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v46 = v3;
                    _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "[Alerting] sending SOS messages to EC over SMS. %@", buf, 0xCu);
                  }
                }
                v22 = [(CKSOSUtilities *)self _compositionsForMessage:v3 withReasons:1];
                uint64_t v23 = -[CKSOSUtilities _sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:](self, "_sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:", v22, v16, [v3 useStandalone], 1, objc_msgSend(v3, "isCritical"));
                goto LABEL_36;
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                v30 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v46 = v3;
                  _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "[Alerting] sending SOS messages over SMS. %@", buf, 0xCu);
                }
              }
              v22 = [(CKSOSUtilities *)self _compositionsForMessage:v3 withReasons:v19];
              uint64_t v23 = -[CKSOSUtilities _sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:](self, "_sendCompositions:toConversation:useStandalone:shouldForceSMS:isCritical:", v22, v16, [v3 useStandalone], 1, objc_msgSend(v3, "isCritical"));
LABEL_36:
              v31 = (void *)v23;
              [v37 addObjectsFromArray:v23];
            }
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v4);
  }

  if (![v37 count])
  {
    v32 = [v3 failureBlock];
    BOOL v33 = v32 == 0;

    if (!v33)
    {
      v34 = IMLogHandleForCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[CKSOSUtilities _sendMessageAndReturnGUIDs:]((uint64_t)v3, v34);
      }

      v35 = [v3 failureBlock];
      v35[2]();
    }
  }

  return v37;
}

- (id)_chatForHandle:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F6E668] sharedInstance];
  id v5 = [v4 ctSubscriptionInfo];
  uint64_t v6 = [v5 preferredOrDefaultSubscriptionContext];

  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "If no chat is found, new chat will be created with subscription %@", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v8 = [v6 phoneNumber];
  id v9 = [v6 labelID];
  id v10 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  BOOL v11 = [v3 ID];
  uint64_t v12 = [v10 existingChatWithChatIdentifier:v11];

  if (!v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    uint64_t v12 = [v13 chatWithHandle:v3 lastAddressedHandle:v8 lastAddressedSIMID:v9];
  }

  return v12;
}

- (id)_uniqueFilePathForFilename:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  uint64_t v6 = [NSString stringGUID];
  id v7 = NSTemporaryDirectory();
  uint64_t v8 = [v5 createUniqueDirectoryWithName:v6 atPath:v7 ofType:0];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = [v4 lastPathComponent];
  BOOL v11 = [v10 stringByDeletingPathExtension];
  uint64_t v12 = [v4 pathExtension];

  uint64_t v13 = [v9 uniqueFilename:v11 atPath:v8 ofType:v12];

  return v13;
}

- (id)_sendCompositions:(id)a3 toConversation:(id)a4 useStandalone:(BOOL)a5 shouldForceSMS:(BOOL)a6 isCritical:(BOOL)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = -[CKSOSUtilities sendComposition:toConversation:useStandalone:shouldForceSMS:isCritical:](self, "sendComposition:toConversation:useStandalone:shouldForceSMS:isCritical:", *(void *)(*((void *)&v22 + 1) + 8 * i), v13, v9, v8, a7, (void)v22);
        [v14 addObjectsFromArray:v20];

        a7 = 0;
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      a7 = 0;
    }
    while (v17);
  }

  return v14;
}

- (id)sendComposition:(id)a3 toConversation:(id)a4 useStandalone:(BOOL)a5 shouldForceSMS:(BOOL)a6 isCritical:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v39 = 0;
  v34 = v11;
  int v13 = [v12 canSendComposition:v11 error:&v39];
  id v33 = v39;
  if (v13)
  {
    [v12 resetCaches];
    id v14 = [v12 messagesFromComposition:v11];
    [v12 setUnsentComposition:0];
    objc_msgSend(v14, "__imArrayByApplyingBlock:", &__block_literal_global_162_0);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          [v19 setUseStandalone:v9];
          long long v20 = objc_msgSend(v19, "__ck_sosMessage");
          uint64_t v21 = v20;
          if (v7)
          {
            uint64_t v22 = objc_msgSend(v20, "__ck_criticalMessage");

            uint64_t v21 = (void *)v22;
          }
          if (v8)
          {
            long long v23 = [MEMORY[0x1E4F6BDB8] smsService];
            [v12 sendMessage:v21 onService:v23 newComposition:0];
          }
          else
          {
            [v12 sendMessage:v21 newComposition:0];
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v16);
    }

    [v12 setIgnoringTypingUpdates:0];
    [v12 setLocalUserIsTyping:0];
    long long v24 = +[CKConversationList sharedConversationList];
    [v24 unpendConversation];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v33;
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Failed to send SOS to conversation with error: %@", buf, 0xCu);
      }
    }
    id v32 = 0;
  }
  id v26 = [MEMORY[0x1E4F6E890] sharedInstance];
  v40[0] = @"markedCritical";
  uint64_t v27 = [NSNumber numberWithBool:v7];
  v41[0] = v27;
  v40[1] = @"usingStandalone";
  v28 = [NSNumber numberWithBool:v9];
  v41[1] = v28;
  v40[2] = @"forcedSMS";
  uint64_t v29 = [NSNumber numberWithBool:v8];
  v41[2] = v29;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
  [v26 trackEvent:*MEMORY[0x1E4F6DAE8] withDictionary:v30];

  return v32;
}

uint64_t __89__CKSOSUtilities_sendComposition_toConversation_useStandalone_shouldForceSMS_isCritical___block_invoke(uint64_t a1, void *a2)
{
  return [a2 guid];
}

- (void)isMMSEnabled
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "isMMSEnabled is deprecated and should not be used.", v1, 2u);
}

- (void)_sendMessageAndReturnGUIDs:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Failed to send message %@", (uint8_t *)&v2, 0xCu);
}

@end