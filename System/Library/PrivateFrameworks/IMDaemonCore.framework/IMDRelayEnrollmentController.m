@interface IMDRelayEnrollmentController
- (BOOL)_areiMessageAndiCloudAccountTheSame:(id)a3;
- (BOOL)_deviceAllowedToDisableRelay:(id)a3;
- (BOOL)_isDeviceATrustedHSA2Device:(id)a3;
- (BOOL)hasBeenRemoteApproved;
- (BOOL)sendApprovalDisplayPinToDevice:(id)a3;
- (IMDRelayEnrollmentController)initWithServiceDelegate:(id)a3 dispatchDelegate:(id)a4;
- (IMDRelayEnrollmentControllerDispatchDelegate)dispatchDelegate;
- (IMDRelayEnrollmentControllerServiceDelegate)serviceDelegate;
- (NSMutableDictionary)pendingCodesToDevicesForApproval;
- (id)_allowedDevicesforSMSRelay;
- (id)_allowedIDSDevicesforSMSRelay;
- (id)_bestAccountWithAlias:(id)a3;
- (id)_challengedDevicesforSMSRelay;
- (id)_challengedIDSDevicesforSMSRelay;
- (id)_ignoredDevicesforSMSRelay;
- (id)_ignoredIDSDevicesforSMSRelay;
- (unint64_t)randomSixDigitCode;
- (void)_addDefaultPairedDeviceToAllowedSMSRelayList;
- (void)_addDeviceToAllowedSMSRelay:(id)a3 shouldSendApproval:(BOOL)a4;
- (void)_addDeviceToChallengedSMSRelay:(id)a3;
- (void)_addDeviceToIgnoredSMSRelay:(id)a3;
- (void)_addHSA2PairedDevicesToAllowedSMSRelayList;
- (void)_approveSelfForSMSRelay;
- (void)_enableSMSRelayForDevice:(id)a3;
- (void)_micEnabledStateDidChange:(id)a3;
- (void)_migrateSMSRelayForMICIfNeeded;
- (void)_noteDeviceHasMICForSMSRelay:(id)a3;
- (void)_removeDeviceFromAllowedSMSRelay:(id)a3;
- (void)_removeDeviceFromChallengedSMSRelay:(id)a3;
- (void)_removeDeviceFromIgnoredSMSRelay:(id)a3;
- (void)_removeDeviceHasMICForSMSRelay:(id)a3;
- (void)_sendPinCodeToDeviceAndPromptForResponse:(id)a3;
- (void)_shouldAutoEnableDevicesforSMSRelay:(id)a3;
- (void)dealloc;
- (void)enrollDeviceInSMSRelay:(id)a3;
- (void)enrollSelfDeviceInSMSRelay;
- (void)handler:(id)a3 incomingDisplayPinCode:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10;
- (void)handler:(id)a3 incomingEnrollMeRequest:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10;
- (void)handler:(id)a3 incomingResponseForApproval:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10;
- (void)sendApprovalEnrollMe;
- (void)sendApprovalResponseToDevice:(id)a3 enteredCorrectly:(BOOL)a4 wasCancelled:(BOOL)a5;
- (void)sendUnApproveToDevice:(id)a3 extraKeys:(id)a4;
- (void)setHasBeenRemoteApproved:(BOOL)a3;
- (void)setPendingCodesToDevicesForApproval:(id)a3;
- (void)unEnrollDeviceInSMSRelay:(id)a3;
@end

@implementation IMDRelayEnrollmentController

- (IMDRelayEnrollmentController)initWithServiceDelegate:(id)a3 dispatchDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IMDRelayEnrollmentController;
  v9 = [(IMDRelayEnrollmentController *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceDelegate, a3);
    objc_storeStrong((id *)&v10->_dispatchDelegate, a4);
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Setting up push handler", v17, 2u);
      }
    }
    v12 = +[IMDRelayPushHandler sharedInstance];
    [v12 addListener:v10];

    v13 = +[IMDRelayPushHandler sharedInstance];
    [v13 setRegistered:1];

    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "...done", v17, 2u);
      }
    }
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v10 selector:sel__micEnabledStateDidChange_ name:@"com.apple.IMDaemonCore.IMDCKUtilities.MiCEnabledStateReturned" object:0];

    [(IMDRelayEnrollmentController *)v10 _migrateSMSRelayForMICIfNeeded];
  }

  return v10;
}

- (void)dealloc
{
  v3 = +[IMDRelayPushHandler sharedInstance];
  [v3 removeListener:self];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)IMDRelayEnrollmentController;
  [(IMDRelayEnrollmentController *)&v5 dealloc];
}

- (void)enrollDeviceInSMSRelay:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "SMS Service Session Received Request To Enroll %@ Into SMS Relay ", (uint8_t *)&v11, 0xCu);
      }
    }
    id v7 = [(IMDRelayEnrollmentController *)self serviceDelegate];
    id v8 = [v7 idsDeviceFromUniqueID:v4];

    if ([v8 isHSATrusted])
    {
      if (IMOSLoggingEnabled())
      {
        v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          id v12 = v8;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Automatically enrolling HSA trusted device %@ ", (uint8_t *)&v11, 0xCu);
        }
      }
      [(IMDRelayEnrollmentController *)self _addDeviceToAllowedSMSRelay:v8 shouldSendApproval:1];
    }
    else
    {
      [(IMDRelayEnrollmentController *)self _sendPinCodeToDeviceAndPromptForResponse:v4];
    }
  }
  else if (v5)
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "empty deviceID passed in", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)unEnrollDeviceInSMSRelay:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "SMS Service Session Received Request To Un Enroll %@ Into SMS Relay ", (uint8_t *)&v11, 0xCu);
      }
    }
    id v7 = [(IMDRelayEnrollmentController *)self serviceDelegate];
    id v8 = [v7 idsDeviceFromUniqueID:v4];

    [(IMDRelayEnrollmentController *)self _removeDeviceFromAllowedSMSRelay:v8];
    [(IMDRelayEnrollmentController *)self sendUnApproveToDevice:v8 extraKeys:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.sms.smsRelayDevices.changed", 0, 0, 0);
  }
  else if (v5)
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "empty deviceID passed in", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)enrollSelfDeviceInSMSRelay
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "SMS Service Session Received Request To Enroll ourselves for SMS Relay", v4, 2u);
    }
  }
  [(IMDRelayEnrollmentController *)self sendApprovalEnrollMe];
}

- (id)_allowedDevicesforSMSRelay
{
  v2 = IMGetCachedDomainValueForKey();
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (id)_allowedIDSDevicesforSMSRelay
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v20 = IMGetCachedDomainValueForKey();
  if (v20)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v3 = [(IMDRelayEnrollmentController *)self serviceDelegate];
    id v4 = [v3 peerDevices];

    obuint64_t j = v4;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v10 = v20;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v22;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v22 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * j);
                v16 = [v9 uniqueID];
                LODWORD(v15) = [v16 isEqualToString:v15];

                if (v15)
                {
                  [v19 addObject:v9];
                  goto LABEL_17;
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)_ignoredDevicesforSMSRelay
{
  v2 = IMGetCachedDomainValueForKey();
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (id)_ignoredIDSDevicesforSMSRelay
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v20 = IMGetCachedDomainValueForKey();
  if (v20)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v3 = [(IMDRelayEnrollmentController *)self serviceDelegate];
    id v4 = [v3 peerDevices];

    obuint64_t j = v4;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v10 = v20;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v22;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v22 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * j);
                v16 = [v9 uniqueID];
                LODWORD(v15) = [v16 isEqualToString:v15];

                if (v15)
                {
                  [v19 addObject:v9];
                  goto LABEL_17;
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)_challengedDevicesforSMSRelay
{
  v2 = IMGetCachedDomainValueForKey();
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (id)_challengedIDSDevicesforSMSRelay
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v20 = IMGetCachedDomainValueForKey();
  if (v20)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v3 = [(IMDRelayEnrollmentController *)self serviceDelegate];
    id v4 = [v3 peerDevices];

    obuint64_t j = v4;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v10 = v20;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v22;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v22 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * j);
                v16 = [v9 uniqueID];
                LODWORD(v15) = [v16 isEqualToString:v15];

                if (v15)
                {
                  [v19 addObject:v9];
                  goto LABEL_17;
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (void)_noteDeviceHasMICForSMSRelay:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = IMGetCachedDomainValueForKey();
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
  if (v5)
  {
    uint64_t v6 = [v3 uniqueID];
    if ([v5 containsObject:v6])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Told to add an item but we already have its ID, ignoring and moving on.", (uint8_t *)v11, 2u);
        }
      }
    }
    else
    {
      [v5 addObject:v6];
      unint64_t v8 = [v5 count];
      if (v8 < [v4 count] && IMOSLoggingEnabled())
      {
        v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v11[0] = 67109376;
          v11[1] = [v5 count];
          __int16 v12 = 1024;
          int v13 = [v4 count];
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", (uint8_t *)v11, 0xEu);
        }
      }
      if (![v5 count] && IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", (uint8_t *)v11, 2u);
        }
      }
      IMSetDomainValueForKey();
      IMSyncronizeAppPreferences();
    }
  }
}

- (void)_removeDeviceHasMICForSMSRelay:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v3 = IMGetCachedDomainValueForKey();
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithArray:v3];
  if (v4)
  {
    uint64_t v5 = [v16 uniqueID];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v10 isEqualToString:v5])
          {
            [v6 removeObject:v10];
            unint64_t v11 = [v6 count];
            if (v11 < [v3 count] && IMOSLoggingEnabled())
            {
              __int16 v12 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                int v13 = [v6 count];
                int v14 = [v3 count];
                *(_DWORD *)buf = 67109376;
                int v22 = v13;
                __int16 v23 = 1024;
                int v24 = v14;
                _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "_removeDeviceFromMICSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", buf, 0xEu);
              }
            }
            if (![v6 count] && IMOSLoggingEnabled())
            {
              uint64_t v15 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "_removeDeviceFromMICSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", buf, 2u);
              }
            }
            IMSetDomainValueForKey();
            IMSyncronizeAppPreferences();
            goto LABEL_22;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
}

- (void)_addDeviceToAllowedSMSRelay:(id)a3 shouldSendApproval:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = IMGetCachedDomainValueForKey();
  uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithArray:v7];
  if (v8)
  {
    v9 = [v6 uniqueID];
    if ([v8 containsObject:v9])
    {
      if (IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18[0]) = 0;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Told to add an item but we allready have its ID, moving on", (uint8_t *)v18, 2u);
        }
      }
    }
    else
    {
      [v8 addObject:v9];
      unint64_t v11 = [v8 count];
      if (v11 < [v7 count] && IMOSLoggingEnabled())
      {
        __int16 v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v18[0] = 67109376;
          v18[1] = [v8 count];
          __int16 v19 = 1024;
          int v20 = [v7 count];
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", (uint8_t *)v18, 0xEu);
        }
      }
      if (![v8 count] && IMOSLoggingEnabled())
      {
        int v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18[0]) = 0;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", (uint8_t *)v18, 2u);
        }
      }
      IMSetDomainValueForKey();
      IMSyncronizeAppPreferences();
      int v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v15 = [v14 isSMSFilterSyncEnabled];

      if (v15
        && objc_msgSend(MEMORY[0x1E4F6E938], "IDSDeviceSupportsIncomingSMSRelayFilteringForDeviceType:", objc_msgSend(v6, "deviceType")))
      {
        if (IMOSLoggingEnabled())
        {
          id v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            LOWORD(v18[0]) = 0;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Added device for relay. Relaying current SMS Filtering settings.", (uint8_t *)v18, 2u);
          }
        }
        long long v17 = +[IMDFilteringController sharedInstance];
        [v17 _relayCurrentSMSFilteringSettings];
      }
    }
  }
  if (v4) {
    [(IMDRelayEnrollmentController *)self sendApprovalResponseToDevice:v6 enteredCorrectly:1 wasCancelled:0];
  }
}

- (void)_removeDeviceFromAllowedSMSRelay:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = IMGetCachedDomainValueForKey();
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
  if (v5)
  {
    id v6 = [v3 uniqueID];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          unint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToString:", v6, (void)v17))
          {
            [v7 removeObject:v11];
            unint64_t v12 = [v7 count];
            if (v12 < [v4 count] && IMOSLoggingEnabled())
            {
              int v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                int v14 = [v7 count];
                int v15 = [v4 count];
                *(_DWORD *)buf = 67109376;
                int v22 = v14;
                __int16 v23 = 1024;
                int v24 = v15;
                _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "_removeDeviceFromAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", buf, 0xEu);
              }
            }
            if (![v7 count] && IMOSLoggingEnabled())
            {
              id v16 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "_removeDeviceFromAllowedSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", buf, 2u);
              }
            }
            IMSetDomainValueForKey();
            IMSyncronizeAppPreferences();
            goto LABEL_22;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
}

- (void)_addDeviceToIgnoredSMSRelay:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = IMGetCachedDomainValueForKey();
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
  if (v5)
  {
    id v6 = [v3 uniqueID];
    if ([v5 containsObject:v6])
    {
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Told to add an iteam but we allready have its ID, moving on", (uint8_t *)v11, 2u);
        }
      }
    }
    else
    {
      [v5 addObject:v6];
      unint64_t v8 = [v5 count];
      if (v8 < [v4 count] && IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v11[0] = 67109376;
          v11[1] = [v5 count];
          __int16 v12 = 1024;
          int v13 = [v4 count];
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newIgnoredDeviceUUIDs count: %d ignoredDeviceUUIDs count: %d", (uint8_t *)v11, 0xEu);
        }
      }
      if (![v5 count] && IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "_addDeviceToIgnoredSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", (uint8_t *)v11, 2u);
        }
      }
      IMSetDomainValueForKey();
      IMSyncronizeAppPreferences();
    }
  }
}

- (void)_removeDeviceFromIgnoredSMSRelay:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = IMGetCachedDomainValueForKey();
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
  if (v5)
  {
    id v6 = [v3 uniqueID];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          unint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToString:", v6, (void)v17))
          {
            [v7 removeObject:v11];
            unint64_t v12 = [v7 count];
            if (v12 < [v4 count] && IMOSLoggingEnabled())
            {
              int v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                int v14 = [v7 count];
                int v15 = [v4 count];
                *(_DWORD *)buf = 67109376;
                int v22 = v14;
                __int16 v23 = 1024;
                int v24 = v15;
                _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "_removeDeviceFromIgnoredSMSRelay: newIgnoredDeviceUUIDs count: %d ignoredDeviceUUIDs count: %d", buf, 0xEu);
              }
            }
            if (![v7 count] && IMOSLoggingEnabled())
            {
              id v16 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "_removeDeviceFromIgnoredSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", buf, 2u);
              }
            }
            IMSetDomainValueForKey();
            IMSyncronizeAppPreferences();
            goto LABEL_22;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
}

- (void)_addDefaultPairedDeviceToAllowedSMSRelayList
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Trying to add default paired device to allowed list", buf, 2u);
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = [(IMDRelayEnrollmentController *)self serviceDelegate];
  uint64_t v5 = [v4 peerDevices];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v14;
    *(void *)&long long v7 = 138412290;
    long long v12 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isDefaultPairedDevice", v12))
        {
          [(IMDRelayEnrollmentController *)self _addDeviceToAllowedSMSRelay:v10 shouldSendApproval:0];
          if (IMOSLoggingEnabled())
          {
            unint64_t v11 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v12;
              long long v18 = v10;
              _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Added to paired list %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)_addDeviceToChallengedSMSRelay:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = IMGetCachedDomainValueForKey();
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
  if (v5)
  {
    uint64_t v6 = [v3 uniqueID];
    if ([v5 containsObject:v6])
    {
      if (IMOSLoggingEnabled())
      {
        long long v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Told to add an iteam but we allready have its ID, moving on", (uint8_t *)v11, 2u);
        }
      }
    }
    else
    {
      [v5 addObject:v6];
      unint64_t v8 = [v5 count];
      if (v8 < [v4 count] && IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v11[0] = 67109376;
          v11[1] = [v5 count];
          __int16 v12 = 1024;
          int v13 = [v4 count];
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", (uint8_t *)v11, 0xEu);
        }
      }
      if (![v5 count] && IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "_addDeviceToIgnoredSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", (uint8_t *)v11, 2u);
        }
      }
      IMSetDomainValueForKey();
      IMSyncronizeAppPreferences();
    }
  }
}

- (void)_removeDeviceFromChallengedSMSRelay:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = IMGetCachedDomainValueForKey();
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
  if (v5)
  {
    uint64_t v6 = [v3 uniqueID];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          unint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToString:", v6, (void)v17))
          {
            [v7 removeObject:v11];
            unint64_t v12 = [v7 count];
            if (v12 < [v4 count] && IMOSLoggingEnabled())
            {
              int v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                int v14 = [v7 count];
                int v15 = [v4 count];
                *(_DWORD *)buf = 67109376;
                int v22 = v14;
                __int16 v23 = 1024;
                int v24 = v15;
                _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", buf, 0xEu);
              }
            }
            if (![v7 count] && IMOSLoggingEnabled())
            {
              long long v16 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "_addDeviceToIgnoredSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", buf, 2u);
              }
            }
            IMSetDomainValueForKey();
            IMSyncronizeAppPreferences();
            goto LABEL_22;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
}

- (void)_sendPinCodeToDeviceAndPromptForResponse:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  BOOL v4 = [(IMDRelayEnrollmentController *)self serviceDelegate];
  uint64_t v5 = [v4 idsDeviceFromUniqueID:v25];

  if (!v5 && IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v25;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Tried to enroll a device that doesnt excist in our set of devices or was nil %@", buf, 0xCu);
    }
  }
  if ([(IMDRelayEnrollmentController *)self sendApprovalDisplayPinToDevice:v5])
  {
    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v8 = (void *)MEMORY[0x1E4F6C320];
    uint64_t v9 = [v5 modelIdentifier];
    int v24 = [v8 marketingNameForModel:v9];

    __int16 v23 = [v5 name];
    int v22 = [v7 localizedStringForKey:@"ENTER_THE_CODE_SHOWN_ON_YOUR_DEVICE_FOR_SMS_RELAY" value:&stru_1F3398578 table:@"DaemonCoreLocalizable"];
    uint64_t v21 = [v7 localizedStringForKey:@"Text Message Forwarding" value:&stru_1F3398578 table:@"DaemonCoreLocalizable"];
    id v10 = [v7 localizedStringForKey:@"Allow" value:&stru_1F3398578 table:@"DaemonCoreLocalizable"];
    unint64_t v11 = [v7 localizedStringForKey:@"Cancel" value:&stru_1F3398578 table:@"DaemonCoreLocalizable"];
    unint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    int v13 = objc_msgSend(NSString, "stringWithFormat:", v22, v24, v23);
    int v14 = [MEMORY[0x1E4F1C978] arrayWithObject:&stru_1F3398578];
    int v15 = [MEMORY[0x1E4F1C978] arrayWithObject:&stru_1F3398578];
    long long v16 = [NSNumber numberWithInt:5];
    long long v17 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v21, *MEMORY[0x1E4F6C308], v13, *MEMORY[0x1E4F6C2E8], v14, *MEMORY[0x1E4F6C300], v15, *MEMORY[0x1E4F6C2F8], v10, *MEMORY[0x1E4F6C2D8], v11, *MEMORY[0x1E4F6C2C8], v16, *MEMORY[0x1E4F1D9F0], 0);

    long long v18 = [MEMORY[0x1E4F6C410] userNotificationWithIdentifier:@"SMSRelayCodeInput" timeout:3 alertLevel:0 displayFlags:v17 displayInformation:0.0];
    long long v19 = [MEMORY[0x1E4F6C418] sharedInstance];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1D96F1304;
    v26[3] = &unk_1E6B743E0;
    v26[4] = self;
    id v27 = v5;
    [v19 addUserNotification:v18 listener:0 completionHandler:v26];
  }
  else if (IMOSLoggingEnabled())
  {
    long long v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "We were unable to send the PIN to the other device to be displayed, Sorry", buf, 2u);
    }
  }
}

- (BOOL)sendApprovalDisplayPinToDevice:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(IMDRelayEnrollmentController *)self randomSixDigitCode];
  if (!self->_pendingCodesToDevicesForApproval)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    pendingCodesToDevicesForApproval = self->_pendingCodesToDevicesForApproval;
    self->_pendingCodesToDevicesForApproval = Mutable;
  }
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v5];
  if (v8)
  {
    uint64_t v9 = self->_pendingCodesToDevicesForApproval;
    id v10 = [v4 uniqueID];
    CFDictionarySetValue((CFMutableDictionaryRef)v9, v10, v8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1D98FFBBC(v4);
  }

  unint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
  unint64_t v12 = [NSNumber numberWithUnsignedInteger:v5];
  int v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, IMDRelayApprovalKeyKey, 0);

  int v14 = JWEncodeDictionary();
  int v15 = (void *)[v14 _FTCopyGzippedData];
  long long v16 = (void *)MEMORY[0x1E4F1CA60];
  long long v17 = [NSNumber numberWithInteger:142];
  long long v18 = StringGUID();
  long long v19 = IDSGetUUIDData();
  long long v20 = [NSNumber numberWithDouble:*MEMORY[0x1E4F6B050]];
  uint64_t v21 = objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F6AA18], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F6AA00], MEMORY[0x1E4F1CC28], *MEMORY[0x1E4F6A990], v17, *MEMORY[0x1E4F6A978], v19, *MEMORY[0x1E4F6AA20], v15, *MEMORY[0x1E4F6A988], v20, *MEMORY[0x1E4F6AA10], 0);

  if (IMOSLoggingEnabled())
  {
    int v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = [v4 name];
      *(_DWORD *)buf = 138412290;
      long long v28 = v23;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Sending a Pin Code To Device %@  to display to enroll them into SMS Relay", buf, 0xCu);
    }
  }
  int v24 = [(IMDRelayEnrollmentController *)self dispatchDelegate];
  char v25 = [v24 sendEnrollmentRelatedMessageOverIDS:v21 deviceToSendTo:v4];

  return v25;
}

- (void)sendApprovalEnrollMe
{
  v37[1] = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "SMS Service session received request to enroll ourselves into SMS Relay", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "SMS Service session received request to enroll ourselves into SMS Relay", buf, 2u);
    }
  }
  unint64_t v5 = [(IMDRelayEnrollmentController *)self serviceDelegate];
  uint64_t v6 = [v5 dominentPhoneNumberAlias];

  id v7 = [(IMDRelayEnrollmentController *)self serviceDelegate];
  uint64_t v8 = [v7 _callerIDForRelay];

  if ([v8 _appearsToBePhoneNumber]
    && ([(IMDRelayEnrollmentController *)self serviceDelegate],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isAliasRelayCapable:v8],
        v9,
        v10))
  {
    if (IMOSLoggingEnabled())
    {
      unint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "This device has a callerID set to a phone number, That phone number is SMS Relay enabled, we should use that ", buf, 2u);
      }
    }
    id v12 = v8;
    if (!v12)
    {
LABEL_46:
      if (IMOSLoggingEnabled())
      {
        v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "We are unable to send any request for enabling SMS Relay for ourselves, we know of no phone with an alias we can use!!!!!", buf, 2u);
        }
      }
      id v12 = 0;
      goto LABEL_51;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "This device does not have a callerID set, so we are going to use the Dominent phone number one if possible ", buf, 2u);
      }
    }
    if (!v6) {
      goto LABEL_46;
    }
    id v12 = v6;
    if (IMOSLoggingEnabled())
    {
      int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "It is possible to use the Dominent phone number alias, thats awesome, lets go for it", buf, 2u);
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "We have an alias, we know where to send this request, lets go for it", buf, 2u);
    }
  }
  long long v16 = +[IMDCKUtilities sharedInstance];
  int v17 = [v16 cloudKitSyncingEnabled];

  if (v17)
  {
    if (IMOSLoggingEnabled())
    {
      long long v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "MOC is ON including in this enrollment payload", buf, 2u);
      }
    }
    v36 = IMDRelayMICStateKey;
    v37[0] = &unk_1F33C5730;
    long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    long long v20 = JWEncodeDictionary();
    uint64_t v21 = (void *)[v20 _FTCopyGzippedData];
  }
  else
  {
    uint64_t v21 = 0;
  }
  int v22 = (void *)MEMORY[0x1E4F1CA60];
  __int16 v23 = [NSNumber numberWithInteger:148];
  int v24 = StringGUID();
  char v25 = IDSGetUUIDData();
  uint64_t v26 = [NSNumber numberWithDouble:*MEMORY[0x1E4F6B050]];
  objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F6AA18], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F6AA00], MEMORY[0x1E4F1CC28], *MEMORY[0x1E4F6A990], v23, *MEMORY[0x1E4F6A978], v25, *MEMORY[0x1E4F6AA20], v26, *MEMORY[0x1E4F6AA10], 0);
  id v27 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (v21) {
    CFDictionarySetValue(v27, (const void *)*MEMORY[0x1E4F6A988], v21);
  }
  long long v28 = [(IMDRelayEnrollmentController *)self serviceDelegate];
  uint64_t v29 = [v28 _deviceForCallerID:v12];

  if (v29)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = [v29 name];
        *(_DWORD *)buf = 138412290;
        v35 = v31;
        _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Asking for device %@  to enroll me into SMS Relay", buf, 0xCu);
      }
    }
    v32 = [(IMDRelayEnrollmentController *)self dispatchDelegate];
    [v32 sendEnrollmentRelatedMessageOverIDS:v27 deviceToSendTo:v29];
  }
LABEL_51:
}

- (void)sendApprovalResponseToDevice:(id)a3 enteredCorrectly:(BOOL)a4 wasCancelled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
  int v10 = [NSNumber numberWithBool:v6];
  unint64_t v11 = IMDRelayApprovalResponseKey;
  id v12 = [NSNumber numberWithBool:v5];
  int v13 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, v11, v12, IMDRelayApprovalWasCancelledKey, 0);

  int v14 = JWEncodeDictionary();
  int v15 = (void *)[v14 _FTCopyGzippedData];
  long long v16 = StringGUID();
  int v17 = (void *)MEMORY[0x1E4F1CA60];
  long long v18 = [NSNumber numberWithInteger:145];
  long long v19 = IDSGetUUIDData();
  long long v20 = [NSNumber numberWithDouble:*MEMORY[0x1E4F6B050]];
  uint64_t v21 = objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F6AA18], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F6AA00], MEMORY[0x1E4F1CC28], *MEMORY[0x1E4F6A990], v18, *MEMORY[0x1E4F6A978], v19, *MEMORY[0x1E4F6AA20], v15, *MEMORY[0x1E4F6A988], v20, *MEMORY[0x1E4F6AA10], 0);

  if (IMOSLoggingEnabled())
  {
    int v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = [v8 name];
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v23;
      __int16 v27 = 2112;
      long long v28 = v16;
      __int16 v29 = 2112;
      uint64_t v30 = v13;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Sending an Approval response message to device %@ message guid %@ with information %@ ", buf, 0x20u);
    }
  }
  int v24 = [(IMDRelayEnrollmentController *)self dispatchDelegate];
  [v24 sendEnrollmentRelatedMessageOverIDS:v21 deviceToSendTo:v8];
}

- (void)sendUnApproveToDevice:(id)a3 extraKeys:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v5 = a4;
  uint64_t v6 = MEMORY[0x1E4F1CC38];
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], IMDRelayAuthorizationRevokedKey, 0);
  id v7 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
  CFMutableDictionaryRef v8 = v7;
  if (v5)
  {
    CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[(__CFDictionary *)v7 mutableCopy];
    if (!Mutable) {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    [(__CFDictionary *)Mutable addEntriesFromDictionary:v5];

    CFMutableDictionaryRef v8 = Mutable;
  }
  int v10 = JWEncodeDictionary();
  unint64_t v11 = (void *)[v10 _FTCopyGzippedData];
  id v12 = StringGUID();
  int v13 = (void *)MEMORY[0x1E4F1CA60];
  int v14 = [NSNumber numberWithInteger:145];
  int v15 = IDSGetUUIDData();
  long long v16 = [NSNumber numberWithDouble:*MEMORY[0x1E4F6B050]];
  int v17 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x1E4F6AA18], v6, *MEMORY[0x1E4F6AA00], MEMORY[0x1E4F1CC28], *MEMORY[0x1E4F6A990], v14, *MEMORY[0x1E4F6A978], v15, *MEMORY[0x1E4F6AA20], v11, *MEMORY[0x1E4F6A988], v16, *MEMORY[0x1E4F6AA10], 0);

  if (IMOSLoggingEnabled())
  {
    long long v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      long long v19 = [v22 name];
      *(_DWORD *)buf = 138412546;
      int v24 = v19;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Sending an Un-Approve message to device %@ message guid %@", buf, 0x16u);
    }
  }
  long long v20 = [(IMDRelayEnrollmentController *)self dispatchDelegate];
  [v20 sendEnrollmentRelatedMessageOverIDS:v17 deviceToSendTo:v22];
}

- (unint64_t)randomSixDigitCode
{
  return (int)(arc4random_uniform(0xDBB9Fu) + 100000);
}

- (void)_approveSelfForSMSRelay
{
  if (![(IMDRelayEnrollmentController *)self hasBeenRemoteApproved])
  {
    [(IMDRelayEnrollmentController *)self setHasBeenRemoteApproved:1];
    IMSyncronizeAppPreferences();
    id v3 = [(IMDRelayEnrollmentController *)self serviceDelegate];
    [v3 updateRelayStatus];
  }
}

- (void)_micEnabledStateDidChange:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "MIC State has changed, checking next steps for SMS Relay", v6, 2u);
    }
  }
  [(IMDRelayEnrollmentController *)self enrollSelfDeviceInSMSRelay];
}

- (void)_migrateSMSRelayForMICIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Checking if we need to enroll as an SMS relay device.", (uint8_t *)&v14, 2u);
    }
  }
  id v4 = IMGetCachedDomainValueForKey();
  id v5 = [MEMORY[0x1E4F61740] sharedInstance];
  uint64_t v6 = [v5 productVersion];

  char v7 = [v6 isEqualToString:v4];
  if (IMOSLoggingEnabled())
  {
    CFMutableDictionaryRef v8 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      int v15 = v4;
      __int16 v16 = 2112;
      int v17 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "> Last migration was for {%@}, currently {%@}.", (uint8_t *)&v14, 0x16u);
    }
  }
  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "> We have already completed SMS MiC relay migration.", (uint8_t *)&v14, 2u);
      }
LABEL_23:
    }
  }
  else
  {
    IMSetDomainValueForKey();
    IMSyncronizeAppPreferences();
    int v10 = +[IMDCKUtilities sharedInstance];
    int v11 = [v10 cloudKitSyncingEnabled];

    int v12 = IMOSLoggingEnabled();
    if (v11)
    {
      if (v12)
      {
        int v13 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "> Beginning flow to enroll device in SMS relay.", (uint8_t *)&v14, 2u);
        }
      }
      [(IMDRelayEnrollmentController *)self enrollSelfDeviceInSMSRelay];
    }
    else if (v12)
    {
      uint64_t v9 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "> MiC is disabled, so no need to enroll device for SMS relay.", (uint8_t *)&v14, 2u);
      }
      goto LABEL_23;
    }
  }
}

- (BOOL)_areiMessageAndiCloudAccountTheSame:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(IMDRelayEnrollmentController *)self serviceDelegate];
  uint64_t v6 = [v5 accounts];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 accountType] == 1 && objc_msgSend(v10, "isActive"))
        {
          int v11 = [v10 profileID];
          int v12 = [NSString stringWithFormat:@"D:%@", v4];
          if (IMOSLoggingEnabled())
          {
            int v13 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v21 = v12;
              __int16 v22 = 2112;
              __int16 v23 = v11;
              _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "iCloud DSID is %@, imessage DSID is %@", buf, 0x16u);
            }
          }
          char v14 = [v11 isEqualToString:v12];

          if (v14)
          {
            LOBYTE(v7) = 1;
            goto LABEL_17;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v7;
}

- (BOOL)_isDeviceATrustedHSA2Device:(id)a3
{
  return 1;
}

- (void)_enableSMSRelayForDevice:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = IMGetCachedDomainValueForKey();
  uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithArray:v5];
  uint64_t v7 = [v4 uniqueID];
  if (![(IMDRelayEnrollmentController *)self _isDeviceATrustedHSA2Device:v4])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_16;
    }
    uint64_t v8 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Device is not on HSA2 trusted list, not approving it for SMS relay %@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_6;
  }
  if ([v5 containsObject:v7])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "(HSA2 Trusted) Already added device to paired list once %@", (uint8_t *)&v10, 0xCu);
      }
LABEL_6:
    }
  }
  else
  {
    [(IMDRelayEnrollmentController *)self _addDeviceToAllowedSMSRelay:v4 shouldSendApproval:1];
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "(HSA2 Trusted) Added to paired list %@", (uint8_t *)&v10, 0xCu);
      }
    }
    [v6 addObject:v7];
    IMSetDomainValueForKey();
    IMSyncronizeAppPreferences();
  }
LABEL_16:
}

- (void)_shouldAutoEnableDevicesforSMSRelay:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[IMDCKUtilities sharedInstance];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1D96F31EC;
    v6[3] = &unk_1E6B74430;
    v6[4] = self;
    id v7 = v4;
    [v5 fetchCloudKitAccountStatusWithCompletion:v6];
  }
}

- (void)_addHSA2PairedDevicesToAllowedSMSRelayList
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Trying to add HSA2 paired devices to allowed list", buf, 2u);
    }
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1D96F34B4;
  v4[3] = &unk_1E6B73F78;
  v4[4] = self;
  [(IMDRelayEnrollmentController *)self _shouldAutoEnableDevicesforSMSRelay:v4];
}

- (BOOL)hasBeenRemoteApproved
{
  return IMGetDomainBoolForKey();
}

- (void)setHasBeenRemoteApproved:(BOOL)a3
{
  IMSetDomainBoolForKey();

  IMSyncronizeAppPreferences();
}

- (IMDRelayEnrollmentControllerServiceDelegate)serviceDelegate
{
  return self->_serviceDelegate;
}

- (IMDRelayEnrollmentControllerDispatchDelegate)dispatchDelegate
{
  return self->_dispatchDelegate;
}

- (NSMutableDictionary)pendingCodesToDevicesForApproval
{
  return self->_pendingCodesToDevicesForApproval;
}

- (void)setPendingCodesToDevicesForApproval:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCodesToDevicesForApproval, 0);
  objc_storeStrong((id *)&self->_dispatchDelegate, 0);

  objc_storeStrong((id *)&self->_serviceDelegate, 0);
}

- (id)_bestAccountWithAlias:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[IMDServiceController sharedController];
  id v5 = [v4 serviceWithName:*MEMORY[0x1E4F6E1A0]];

  uint64_t v6 = +[IMDAccountController sharedInstance];
  id v7 = [v6 accountsForService:v5];

  uint64_t v8 = [v7 firstObject];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v15 = objc_msgSend(v14, "aliases", (void)v19);
        int v16 = [v15 containsObject:v3];

        if (v16)
        {
          id v17 = v14;

          uint64_t v8 = v17;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)handler:(id)a3 incomingDisplayPinCode:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v16 = a4;
  id v41 = a5;
  id v42 = a6;
  id v43 = a7;
  id v38 = a8;
  id v39 = a9;
  id v40 = a10;
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v45 = v42;
      __int16 v46 = 2112;
      id v47 = v41;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "SMS Service Session Received an incomming approval request from:%@ to:%@", buf, 0x16u);
    }
  }
  v37 = v16;
  long long v18 = [v16 _numberForKey:IMDRelayApprovalKeyKey];
  long long v19 = [(IMDRelayEnrollmentController *)self serviceDelegate];
  long long v20 = [v19 idsDeviceFromPushToken:v43];

  if ([v20 supportsSMSRelay])
  {
    long long v21 = [v20 linkedUserURIs];
    long long v22 = [v21 firstObject];
    __int16 v23 = [v22 _stripFZIDPrefix];

    uint64_t v24 = IMFormattedDisplayStringForID();
    uint64_t v25 = [v24 stringWithLTREmbedding];

    uint64_t v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v27 = [v26 localizedStringForKey:@"Cancel" value:&stru_1F3398578 table:@"DaemonCoreLocalizable"];
    long long v28 = [v26 localizedStringForKey:@"TO_SEND_AND_RECEIVE_YOUR_IPHONE_TEXT_MESSAGES" value:&stru_1F3398578 table:@"DaemonCoreLocalizable"];
    __int16 v29 = (void *)MEMORY[0x1E4F6C410];
    uint64_t v30 = [v20 uniqueID];
    uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", v28, v25, v18, v36);
    v32 = [v29 userNotificationWithIdentifier:v30 title:v31 message:0 defaultButton:v27 alternateButton:0 otherButton:0];

    if (v32)
    {
      [v32 setUsesNotificationCenter:0];
      [v32 setRepresentedApplicationBundle:*MEMORY[0x1E4F6C440]];
      v33 = [MEMORY[0x1E4F6C418] sharedInstance];
      [v33 addUserNotification:v32 listener:0 completionHandler:&unk_1F3390B80];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "********** We received an imcomming pin code alert from a non SMS Device", buf, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v20;
        _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "The device that sent this request was %@", buf, 0xCu);
      }
    }
  }
}

- (void)handler:(id)a3 incomingEnrollMeRequest:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v43 = a8;
  id v44 = a9;
  id v45 = a10;
  if (IMOSLoggingEnabled())
  {
    long long v20 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v47 = v18;
      __int16 v48 = 2112;
      id v49 = v17;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "SMS Service Session Received a request to enroll a device into SMS Relay from:%@ to:%@", buf, 0x16u);
    }
  }
  long long v21 = objc_msgSend(v16, "_numberForKey:", IMDRelayMICStateKey, v41);
  if (IMOSLoggingEnabled())
  {
    long long v22 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = @"YES";
      *(_DWORD *)buf = 138412802;
      id v47 = v18;
      __int16 v48 = 2112;
      if (!v21) {
        __int16 v23 = @"NO";
      }
      id v49 = v17;
      __int16 v50 = 2112;
      v51 = v23;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "SMS Service Session Received a request to enroll a device into SMS Relay from:%@ to:%@, micIsOn:%@", buf, 0x20u);
    }
  }
  uint64_t v24 = [(IMDRelayEnrollmentController *)self serviceDelegate];
  uint64_t v25 = [v24 idsDeviceFromPushToken:v19];

  if (v25)
  {
    uint64_t v26 = [(IMDRelayEnrollmentController *)self _allowedDevicesforSMSRelay];
    uint64_t v27 = [v25 uniqueID];
    int v28 = [v26 containsObject:v27];

    if (v28)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Received request to enroll a device into SMS Relay, However we already have this device in our allowed list ", buf, 2u);
        }
      }
      if (!v21)
      {
        [(IMDRelayEnrollmentController *)self _removeDeviceHasMICForSMSRelay:v25];
        goto LABEL_49;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Received request to enroll a device into SMS Relay, However this is just an update for its MIC State to YES, Saving that down", buf, 2u);
        }
      }
      goto LABEL_42;
    }
    v33 = [(IMDRelayEnrollmentController *)self _challengedDevicesforSMSRelay];
    v34 = [v25 uniqueID];
    int v35 = [v33 containsObject:v34];

    if (v35)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_49;
      }
      v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Received request to enroll a device into SMS Relay, However this device has requested to be enrolled before, Not allowing it to try again", buf, 2u);
      }
      goto LABEL_30;
    }
    int v36 = [v25 isHSATrusted];
    int v37 = IMOSLoggingEnabled();
    if (v36)
    {
      if (v37)
      {
        id v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v47 = v25;
          _os_log_impl(&dword_1D967A000, v38, OS_LOG_TYPE_INFO, "Automatically enrolling for SMS relay with requesting device: %@", buf, 0xCu);
        }
      }
      [(IMDRelayEnrollmentController *)self _addDeviceToAllowedSMSRelay:v25 shouldSendApproval:1];
      if (v21) {
LABEL_42:
      }
        [(IMDRelayEnrollmentController *)self _noteDeviceHasMICForSMSRelay:v25];
    }
    else
    {
      if (v37)
      {
        id v39 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "Received request to enroll a device into SMS Relay, This is your first time trying, You only get 1 chance", buf, 2u);
        }
      }
      [(IMDRelayEnrollmentController *)self _addDeviceToChallengedSMSRelay:v25];
      id v40 = [v25 uniqueID];
      [(IMDRelayEnrollmentController *)self _sendPinCodeToDeviceAndPromptForResponse:v40];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "********** We received an Enroll me Request from a device that we do not recognize", buf, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = 0;
        _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "The device that sent this request was %@", buf, 0xCu);
      }
LABEL_30:
    }
  }
LABEL_49:
}

- (BOOL)_deviceAllowedToDisableRelay:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(IMDRelayEnrollmentController *)self serviceDelegate];
  uint64_t v6 = [v5 peerDevices];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) uniqueID];
        uint64_t v11 = [v4 uniqueID];
        int v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          if ([v4 supportsSMSRelay]) {
            char v15 = 1;
          }
          else {
            char v15 = [v4 supportsMMSRelay];
          }

          goto LABEL_18;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      char v14 = [v4 name];
      *(_DWORD *)buf = 138412290;
      long long v22 = v14;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Device %@ was not found in our relay service!", buf, 0xCu);
    }
  }
  char v15 = 0;
LABEL_18:

  return v15;
}

- (void)handler:(id)a3 incomingResponseForApproval:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v16 = a4;
  long long v17 = (__CFString *)a5;
  long long v18 = (__CFString *)a6;
  id v19 = a7;
  id v54 = a8;
  id v55 = a9;
  id v20 = a10;
  if (IMOSLoggingEnabled())
  {
    long long v21 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v57 = v18;
      __int16 v58 = 2112;
      v59 = v17;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "SMS Service Session Received an incomming approval response from:%@ to:%@", buf, 0x16u);
    }
  }
  long long v22 = [(IMDRelayEnrollmentController *)self serviceDelegate];
  __int16 v23 = [v22 idsDeviceFromPushToken:v19];

  uint64_t v24 = [v16 objectForKey:IMDRelayAuthorizationRevokedKey];
  int v25 = [v24 BOOLValue];

  uint64_t v26 = [v16 objectForKey:IMDRelayAuthorizationUnauthorizedDeviceKey];
  int v27 = [v26 BOOLValue];

  if (v25)
  {
    BOOL v28 = [(IMDRelayEnrollmentController *)self _deviceAllowedToDisableRelay:v23];
    int v29 = IMOSLoggingEnabled();
    if (v28)
    {
      if (v29)
      {
        uint64_t v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          uint64_t v31 = [v23 name];
          *(_DWORD *)buf = 138412290;
          v57 = v31;
          _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Device %@ Told us that they have turned off SMS Relay for us, revoking them now ", buf, 0xCu);
        }
      }
      IMSetDomainBoolForKey();
      [(IMDRelayEnrollmentController *)self setHasBeenRemoteApproved:0];
      if (v27)
      {
        if (IMOSLoggingEnabled())
        {
          v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "This response indicated to us that we tried to send when we shouldnt have tried to send, Pulling out the guid and marking that message as a failure ", buf, 2u);
          }
        }
        v33 = [v16 _stringForKey:IMDRelayMessageDictionaryGUIDKey];
        if (v33)
        {
          if (IMOSLoggingEnabled())
          {
            v34 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v57 = v33;
              _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "Telling message GUID %@ that it's a failure", buf, 0xCu);
            }
          }
          int v35 = [(IMDRelayEnrollmentController *)self serviceDelegate];
          [v35 didReceiveMessageError:v33];
        }
      }
      int v36 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v37 = [v36 isSMSFilterSyncEnabled];

      if (v37)
      {
        id v38 = +[IMDFilteringController sharedInstance];
        id v39 = [v23 uniqueIDOverride];
        [v38 _checkAndUpdateSMSFilteringSettingsForDeviceID:v39 smsFilterCapabilitiesOptions:0 filterExtensionName:0];
      }
      id v40 = [(IMDRelayEnrollmentController *)self serviceDelegate];
      [v40 updateRelayStatus];
    }
    else if (v29)
    {
      v51 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        uint64_t v52 = [v23 name];
        *(_DWORD *)buf = 138412290;
        v57 = v52;
        _os_log_impl(&dword_1D967A000, v51, OS_LOG_TYPE_INFO, "Device %@ Told us that they have turned off SMS Relay for us, but we determined they are not allowed to. Ignoring!", buf, 0xCu);
      }
    }
  }
  else
  {
    id v41 = [v16 objectForKey:IMDRelayApprovalResponseKey];
    uint64_t v42 = [v41 BOOLValue];

    id v43 = [v16 objectForKey:IMDRelayApprovalWasCancelledKey];
    int v44 = [v43 BOOLValue];

    if (IMOSLoggingEnabled())
    {
      id v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        __int16 v46 = @"NO";
        if (v42) {
          id v47 = @"YES";
        }
        else {
          id v47 = @"NO";
        }
        if (v44) {
          __int16 v46 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v57 = v47;
        __int16 v58 = 2112;
        v59 = v46;
        _os_log_impl(&dword_1D967A000, v45, OS_LOG_TYPE_INFO, "The response was %@ Was it a cancelation/revokation? %@ ", buf, 0x16u);
      }
    }
    [(IMDRelayEnrollmentController *)self setHasBeenRemoteApproved:v42];
    __int16 v48 = [(IMDRelayEnrollmentController *)self serviceDelegate];
    [v48 updateRelayStatus];

    id v49 = [MEMORY[0x1E4F6C418] sharedInstance];
    __int16 v50 = [v23 uniqueID];
    [v49 removeNotificationsForServiceIdentifier:v50];
  }
}

@end