@interface IMAccountController
+ (id)bestAccountFromAccounts:(id)a3;
+ (id)sharedInstance;
- (BOOL)_deactivateAccount:(id)a3;
- (BOOL)_deactivateAccounts:(id)a3;
- (BOOL)accountActive:(id)a3;
- (BOOL)accountConnected:(id)a3;
- (BOOL)accountConnecting:(id)a3;
- (BOOL)accountLogoutable:(id)a3;
- (BOOL)activateAccount:(id)a3;
- (BOOL)activateAccount:(id)a3 force:(BOOL)a4;
- (BOOL)activateAccount:(id)a3 force:(BOOL)a4 locally:(BOOL)a5;
- (BOOL)activateAccount:(id)a3 locally:(BOOL)a4;
- (BOOL)activateAccounts:(id)a3;
- (BOOL)activateAccounts:(id)a3 force:(BOOL)a4 locally:(BOOL)a5;
- (BOOL)activateAndHandleReconnectAccount:(id)a3;
- (BOOL)activateAndHandleReconnectAccounts:(id)a3;
- (BOOL)addAccount:(id)a3;
- (BOOL)addAccount:(id)a3 atIndex:(int)a4;
- (BOOL)addAccount:(id)a3 atIndex:(int)a4 locally:(BOOL)a5;
- (BOOL)addAccount:(id)a3 locally:(BOOL)a4;
- (BOOL)canActivateAccount:(id)a3;
- (BOOL)canActivateAccounts:(id)a3;
- (BOOL)canDeleteAccount:(id)a3;
- (BOOL)deactivateAccount:(id)a3;
- (BOOL)deactivateAccount:(id)a3 withDisable:(BOOL)a4;
- (BOOL)deactivateAccounts:(id)a3;
- (BOOL)deactivateAccounts:(id)a3 withDisable:(BOOL)a4;
- (BOOL)deleteAccount:(id)a3;
- (BOOL)deleteAccount:(id)a3 locally:(BOOL)a4;
- (BOOL)hasRelayApprovedAccount;
- (BOOL)isAccountKeyCDPSyncingOrWaitingForUser:(id)a3;
- (BOOL)metionedHandleMatchesMeCard:(id)a3;
- (BOOL)networkDataAvailable;
- (BOOL)readOnly;
- (BOOL)receiverIsMyMention:(id)a3;
- (IMAccount)activeIMessageAccount;
- (IMAccount)activeSMSAccount;
- (IMAccountController)init;
- (NSArray)accounts;
- (NSArray)activeAccounts;
- (NSArray)connectedAccounts;
- (NSArray)operationalAccounts;
- (NSMutableDictionary)accountMap;
- (id)__iCloudSystemAccountForService:(id)a3;
- (id)_bestAccountForAddresses:(id)a3;
- (id)_bestOperationalAccountForSendingForService:(id)a3;
- (id)accountAtIndex:(int)a3;
- (id)accountForUniqueID:(id)a3;
- (id)accountsForService:(id)a3;
- (id)accountsWithCapability:(unint64_t)a3;
- (id)accountsWithServiceCapability:(id)a3;
- (id)activeAccountsForService:(id)a3;
- (id)activeAccountsWithServiceCapability:(id)a3;
- (id)aimAccount;
- (id)bestAccountForService:(id)a3;
- (id)bestAccountForService:(id)a3 login:(id)a4 guid:(id)a5;
- (id)bestAccountForService:(id)a3 withLogin:(id)a4;
- (id)bestAccountForStatus;
- (id)bestAccountWithCapability:(unint64_t)a3;
- (id)bestActiveAccountForService:(id)a3;
- (id)bestActiveAccountForService:(id)a3 withLogin:(id)a4;
- (id)bestConnectedAccountForService:(id)a3;
- (id)bestConnectedAccountForService:(id)a3 withLogin:(id)a4;
- (id)bestOperationalAccountForService:(id)a3;
- (id)bestOperationalAccountForService:(id)a3 withLogin:(id)a4;
- (id)connectedAccountsForService:(id)a3;
- (id)connectedAccountsWithCapability:(unint64_t)a3;
- (id)connectedAccountsWithServiceCapability:(id)a3;
- (id)iMessageAccountForLastAddressedHandle:(id)a3 simID:(id)a4;
- (id)jabberAccount;
- (id)mostLoggedInAccount;
- (id)operationalAccountsForService:(id)a3;
- (id)operationalAccountsWithCapability:(unint64_t)a3;
- (id)senderIdentifiers;
- (int)numberOfAccounts;
- (int64_t)activeAccountsAreEligibleForAppleSMSFilter;
- (int64_t)activeAccountsAreEligibleForAppleSMSFilterSubClassification;
- (int64_t)activeAccountsAreEligibleForDefaultAppleSMSFilter;
- (int64_t)activeAccountsAreEligibleForHawking;
- (int64_t)activeAccountsAreEligibleForInternationalFiltering;
- (int64_t)activeAccountsAreEligibleForUnknownSendersFiltering;
- (int64_t)activeAccountsAreEligibleForiMessageJunk;
- (void)_accountRegistrationStatusChanged:(id)a3;
- (void)_activeAccountChanged:(id)a3;
- (void)_disableCache;
- (void)_enableCache;
- (void)_rebuildOperationalAccountsCache:(BOOL)a3;
- (void)_requestNetworkDataAvailability;
- (void)accountLoginComplete:(id)a3;
- (void)autoLogin;
- (void)dealloc;
- (void)deferredSetup;
- (void)setAccountMap:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setNetworkDataAvailable:(BOOL)a3;
- (void)setReadOnly:(BOOL)a3;
@end

@implementation IMAccountController

- (void)_requestNetworkDataAvailability
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestNetworkDataAvailability(v7, v4, v5, v6);
}

- (BOOL)accountLogoutable:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v7 = objc_msgSend_accountActive_(self, v5, (uint64_t)v4, v6);
  int isAccountKeyCDPSyncingOrWaitingForUser = objc_msgSend_isAccountKeyCDPSyncingOrWaitingForUser_(self, v8, (uint64_t)v4, v9);
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = @"NO";
      if (v7 | isAccountKeyCDPSyncingOrWaitingForUser) {
        v13 = @"YES";
      }
      else {
        v13 = @"NO";
      }
      if (v7) {
        v14 = @"YES";
      }
      else {
        v14 = @"NO";
      }
      int v16 = 138412802;
      v17 = v13;
      __int16 v18 = 2112;
      v19 = v14;
      if (isAccountKeyCDPSyncingOrWaitingForUser) {
        v12 = @"YES";
      }
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "account is logoutable: %@, account is active: %@, account is CDPSyncing Or WaitingForUser: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  return v7 | isAccountKeyCDPSyncingOrWaitingForUser;
}

- (id)bestAccountForStatus
{
  id v4 = objc_msgSend_activeAccounts(self, a2, v2, v3);
  int v7 = objc_msgSend_bestAccountFromAccounts_(IMAccountController, v5, (uint64_t)v4, v6);

  return v7;
}

- (BOOL)deactivateAccount:(id)a3 withDisable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10 = objc_msgSend_service(v6, v7, v8, v9);
  char shouldDisableDeactivation = objc_msgSend_shouldDisableDeactivation(v10, v11, v12, v13);

  if (shouldDisableDeactivation)
  {
    char v15 = 0;
  }
  else if (v6)
  {
    int v16 = IMSingleObjectArray();
    char v15 = objc_msgSend_deactivateAccounts_withDisable_(self, v17, (uint64_t)v16, v4);
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

- (BOOL)deactivateAccounts:(id)a3 withDisable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  theArray = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  Mutable = CFArrayCreateMutable(0, 0, v7);
  BOOL v73 = v4;
  if (v4 && (objc_msgSend_readOnly(self, v8, v9, v10) & 1) == 0 && IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v91 = v6;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Deactivating accounts: %@", buf, 0xCu);
    }
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v13 = v6;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v83, (uint64_t)v89, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v84 != v18) {
          objc_enumerationMutation(v13);
        }
        __int16 v20 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        if (objc_msgSend_accountLogoutable_(self, v15, (uint64_t)v20, v16))
        {
          uint64_t v22 = objc_msgSend_service(v20, v15, v21, v16);
          char shouldDisableDeactivation = objc_msgSend_shouldDisableDeactivation(v22, v23, v24, v25);

          if ((shouldDisableDeactivation & 1) == 0)
          {
            if (Mutable && v20) {
              CFArrayAppendValue(Mutable, v20);
            }
            v28 = objc_msgSend_uniqueID(v20, v15, v27, v16);
            BOOL v29 = v28 == 0;

            if (!v29 && theArray != 0)
            {
              v31 = objc_msgSend_uniqueID(v20, v15, v30, v16);
              BOOL v32 = v31 == 0;

              if (!v32)
              {
                v34 = objc_msgSend_uniqueID(v20, v15, v33, v16);
                CFArrayAppendValue(theArray, v34);
              }
            }
          }
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v83, (uint64_t)v89, 16);
    }
    while (v17);
  }

  if (objc_msgSend_count(Mutable, v35, v36, v37))
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v38 = Mutable;
    uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v79, (uint64_t)v88, 16);
    if (v43)
    {
      uint64_t v44 = *(void *)v80;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v80 != v44) {
            objc_enumerationMutation(v38);
          }
          v46 = *(void **)(*((void *)&v79 + 1) + 8 * j);
          if (objc_msgSend_isConnected(v46, v40, v41, v42)) {
            objc_msgSend_logoutAccount(v46, v40, v41, v42);
          }
        }
        uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v40, (uint64_t)&v79, (uint64_t)v88, 16);
      }
      while (v43);
    }

    if (v73 && (objc_msgSend_readOnly(self, v47, v48, v49) & 1) == 0)
    {
      v50 = objc_msgSend_sharedInstance(IMDaemonController, v47, v48, v49);
      objc_msgSend_deactivateAccounts_(v50, v51, (uint64_t)theArray, v52);
    }
    objc_msgSend_removeAllObjects(self->_serviceToActiveAccountsMap, v47, v48, v49);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v53 = v38;
    uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v75, (uint64_t)v87, 16);
    if (v58)
    {
      uint64_t v59 = *(void *)v76;
      do
      {
        for (uint64_t k = 0; k != v58; ++k)
        {
          if (*(void *)v76 != v59) {
            objc_enumerationMutation(v53);
          }
          v61 = *(void **)(*((void *)&v75 + 1) + 8 * k);
          v62 = objc_msgSend_service(v61, v55, v56, v57);
          char v66 = objc_msgSend_shouldDisableDeactivation(v62, v63, v64, v65);

          if ((v66 & 1) == 0)
          {
            objc_msgSend_setIsActive_(v61, v55, 0, v57);
            objc_msgSend_accountDidDeactivate(v61, v67, v68, v69);
          }
        }
        uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v55, (uint64_t)&v75, (uint64_t)v87, 16);
      }
      while (v58);
    }

    objc_msgSend__rebuildOperationalAccountsCache_(self, v70, 1, v71);
  }

  return 1;
}

- (IMAccount)activeIMessageAccount
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_iMessageService(IMService, a2, v2, v3);
  uint64_t v8 = objc_msgSend_accountsForService_(self, v6, (uint64_t)v5, v7);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v8;
  id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend__isUsableForSending(v17, v11, v12, v13, (void)v19))
        {
          id v14 = v17;
          goto LABEL_11;
        }
      }
      id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v19, (uint64_t)v23, 16);
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (IMAccount *)v14;
}

- (void)setNetworkDataAvailable:(BOOL)a3
{
  if (self->_networkDataAvailable != a3)
  {
    self->_networkDataAvailable = a3;
    objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, a3, v3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v5, v4, @"__kIMChatConnectivityChangedNotification", 0);
  }
}

- (IMAccountController)init
{
  v21.receiver = self;
  v21.super_class = (Class)IMAccountController;
  uint64_t v2 = [(IMAccountController *)&v21 init];
  uint64_t v3 = v2;
  if (v2)
  {
    BOOL v4 = v2;
    objc_sync_enter(v4);
    accounts = v4->_accounts;
    v4->_accounts = (NSArray *)MEMORY[0x1E4F1CBF0];

    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    accountMap = v4->_accountMap;
    v4->_accountMap = (NSMutableDictionary *)Mutable;

    objc_sync_exit(v4);
    v11 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v8, v9, v10);
    objc_msgSend_addObserver_selector_name_object_(v11, v12, (uint64_t)v4, (uint64_t)sel__activeAccountChanged_, @"NotificationActiveAccountChanged", 0);

    uint64_t v16 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v13, v14, v15);
    objc_msgSend_addObserver_selector_name_object_(v16, v17, (uint64_t)v4, (uint64_t)sel__accountRegistrationStatusChanged_, @"__kIMAccountRegistrationStatusChangedNotification", 0);

    v4->_networkDataAvailable = 1;
    objc_msgSend_performSelector_withObject_afterDelay_(v4, v18, (uint64_t)sel_deferredSetup, 0, 0.0);
    long long v19 = v4;
  }

  return v3;
}

- (int64_t)activeAccountsAreEligibleForiMessageJunk
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_msgSend_activeAccounts(self, a2, v2, v3);
  if (!objc_msgSend_count(v4, v5, v6, v7))
  {
    int64_t v62 = -1;
    goto LABEL_31;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v8 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v70, (uint64_t)v75, 16);
  if (!v10)
  {
    int64_t v62 = 0;
    goto LABEL_30;
  }
  uint64_t v14 = v10;
  uint64_t v15 = *(void *)v71;
  uint64_t v16 = (uint64_t *)MEMORY[0x1E4F6E190];
  uint64_t v64 = v4;
  id v65 = v8;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v71 != v15) {
        objc_enumerationMutation(v8);
      }
      uint64_t v18 = *(void **)(*((void *)&v70 + 1) + 8 * i);
      long long v19 = objc_msgSend_serviceName(v18, v11, v12, v13, v64);
      char isEqualToString = objc_msgSend_isEqualToString_(v19, v20, *v16, v21);

      if (isEqualToString) {
        continue;
      }
      v23 = (void *)MEMORY[0x1E4F6EA38];
      uint64_t v24 = objc_msgSend_countryCode(v18, v11, v12, v13);
      if (objc_msgSend_accountCountryIsCandidateForiMessageJunk_(v23, v25, (uint64_t)v24, v26))
      {
LABEL_26:

LABEL_27:
        int64_t v62 = 1;
LABEL_28:
        BOOL v4 = v64;
        goto LABEL_30;
      }
      uint64_t v30 = v14;
      v31 = v16;
      BOOL v32 = (void *)MEMORY[0x1E4F6EA38];
      uint64_t v33 = objc_msgSend_loginIMHandle(v18, v27, v28, v29);
      uint64_t v37 = objc_msgSend_countryCode(v33, v34, v35, v36);
      LOBYTE(v32) = objc_msgSend_accountCountryIsCandidateForiMessageJunk_(v32, v38, (uint64_t)v37, v39);

      if (v32)
      {
        int64_t v62 = 1;
        id v8 = v65;
        goto LABEL_28;
      }
      uint64_t v43 = objc_msgSend_aliases(v18, v40, v41, v42);
      uint64_t v47 = objc_msgSend_count(v43, v44, v45, v46);

      uint64_t v16 = v31;
      if (v47)
      {
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        uint64_t v24 = objc_msgSend_aliases(v18, v48, v49, v50);
        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v51, (uint64_t)&v66, (uint64_t)v74, 16);
        uint64_t v14 = v30;
        if (v52)
        {
          uint64_t v55 = v52;
          uint64_t v56 = *(void *)v67;
          while (2)
          {
            for (uint64_t j = 0; j != v55; ++j)
            {
              if (*(void *)v67 != v56) {
                objc_enumerationMutation(v24);
              }
              if (objc_msgSend_receiverIsCandidateForiMessageJunk_(MEMORY[0x1E4F6EA38], v53, *(void *)(*((void *)&v66 + 1) + 8 * j), v54))
              {
                id v8 = v65;
                goto LABEL_26;
              }
            }
            uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v53, (uint64_t)&v66, (uint64_t)v74, 16);
            if (v55) {
              continue;
            }
            break;
          }
        }

        id v8 = v65;
      }
      else
      {
        uint64_t v58 = (void *)MEMORY[0x1E4F6EA38];
        uint64_t v59 = objc_msgSend_login(v18, v48, v49, v50);
        LOBYTE(v58) = objc_msgSend_receiverIsCandidateForiMessageJunk_(v58, v60, (uint64_t)v59, v61);

        id v8 = v65;
        uint64_t v14 = v30;
        if (v58) {
          goto LABEL_27;
        }
      }
    }
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v70, (uint64_t)v75, 16);
    int64_t v62 = 0;
    BOOL v4 = v64;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_30:

LABEL_31:
  return v62;
}

+ (id)sharedInstance
{
  if (qword_1EB3F2440 != -1) {
    dispatch_once(&qword_1EB3F2440, &unk_1EF8E5238);
  }
  uint64_t v2 = (void *)qword_1EB3F24A0;

  return v2;
}

- (id)accountForUniqueID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    id v8 = objc_msgSend_objectForKey_(v5->_accountMap, v6, (uint64_t)v4, v7);
    objc_sync_exit(v5);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)bestAccountForService:(id)a3 login:(id)a4 guid:(id)a5
{
  return sub_1A4B19534(self, a3, a4, a5);
}

- (id)connectedAccountsForService:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    if (self->_cachesEnabled
      && (uint64_t v9 = self->_serviceToConnectedAccountsMap,
          objc_msgSend_internalName(v4, v5, v6, v7),
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_objectForKey_(v9, v11, (uint64_t)v10, v12),
          CFMutableDictionaryRef Mutable = (__CFArray *)objc_claimAutoreleasedReturnValue(),
          v10,
          Mutable))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v56 = Mutable;
          _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Caches were enabled, cached connected accounts are %@", buf, 0xCu);
        }
      }
    }
    else
    {
      CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v17 = objc_msgSend_accountsForService_(self, v15, (uint64_t)v8, v16, 0);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v51, (uint64_t)v59, 16);
      if (v22)
      {
        uint64_t v23 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v52 != v23) {
              objc_enumerationMutation(v17);
            }
            uint64_t v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            int isConnected = objc_msgSend_isConnected(v25, v19, v20, v21);
            if (v25) {
              BOOL v27 = Mutable != 0;
            }
            else {
              BOOL v27 = 0;
            }
            if ((isConnected & v27) == 1) {
              CFArrayAppendValue(Mutable, v25);
            }
          }
          uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v51, (uint64_t)v59, 16);
        }
        while (v22);
      }

      if (!self->_serviceToConnectedAccountsMap)
      {
        uint64_t v28 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        serviceToConnectedAccountsMap = self->_serviceToConnectedAccountsMap;
        self->_serviceToConnectedAccountsMap = v28;
      }
      if (Mutable)
      {
        uint64_t v30 = self->_serviceToConnectedAccountsMap;
        v31 = Mutable;
        uint64_t v35 = (const void *)objc_msgSend_internalName(v8, v32, v33, v34);
        CFDictionarySetValue((CFMutableDictionaryRef)v30, v35, v31);
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_internalName(v8, v37, v38, v39);
          v40 = (__CFArray *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          uint64_t v56 = v40;
          __int16 v57 = 2112;
          uint64_t v58 = Mutable;
          _os_log_impl(&dword_1A4AF7000, v36, OS_LOG_TYPE_INFO, "For service %@, connected accounts are %@", buf, 0x16u);
        }
      }
    }
    uint64_t v41 = Mutable;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_connectedAccounts(self, v46, v47, v48);
        uint64_t v49 = (__CFArray *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v56 = v49;
        _os_log_impl(&dword_1A4AF7000, v45, OS_LOG_TYPE_INFO, "Service is nil, connected accounts are %@", buf, 0xCu);
      }
    }
    objc_msgSend_connectedAccounts(self, v42, v43, v44);
    uint64_t v41 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  }

  return v41;
}

- (id)accountsForService:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    serviceToAccountsMap = self->_serviceToAccountsMap;
    uint64_t v10 = objc_msgSend_internalName(v4, v5, v6, v7);
    objc_msgSend_objectForKey_(serviceToAccountsMap, v11, (uint64_t)v10, v12);
    uint64_t v13 = (__CFArray *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
      uint64_t v15 = self;
      objc_sync_enter(v15);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      obuint64_t j = v15;
      uint64_t v16 = v15->_accounts;
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v38, (uint64_t)v42, 16);
      if (v21)
      {
        uint64_t v22 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v39 != v22) {
              objc_enumerationMutation(v16);
            }
            uint64_t v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            uint64_t v25 = objc_msgSend_service(v24, v18, v19, v20);
            BOOL v26 = v25 == v8;

            if (v24) {
              BOOL v27 = Mutable != 0;
            }
            else {
              BOOL v27 = 0;
            }
            if (v26 && v27) {
              CFArrayAppendValue(Mutable, v24);
            }
          }
          uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v38, (uint64_t)v42, 16);
        }
        while (v21);
      }

      objc_sync_exit(obj);
      if (!self->_serviceToAccountsMap)
      {
        uint64_t v28 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        uint64_t v29 = self->_serviceToAccountsMap;
        self->_serviceToAccountsMap = v28;
      }
      uint64_t v13 = Mutable;
      if (v13)
      {
        uint64_t v33 = self->_serviceToAccountsMap;
        uint64_t v34 = (const void *)objc_msgSend_internalName(v8, v30, v31, v32);
        CFDictionarySetValue((CFMutableDictionaryRef)v33, v34, v13);
      }
    }
    uint64_t v35 = v13;
  }
  else
  {
    objc_msgSend_accounts(self, v5, v6, v7);
    uint64_t v35 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  }

  return v35;
}

- (id)activeAccountsForService:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    serviceToActiveAccountsMap = self->_serviceToActiveAccountsMap;
    uint64_t v10 = objc_msgSend_internalName(v4, v5, v6, v7);
    objc_msgSend_objectForKey_(serviceToActiveAccountsMap, v11, (uint64_t)v10, v12);
    uint64_t v13 = (__CFArray *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v17 = objc_msgSend_accountsForService_(self, v15, (uint64_t)v8, v16, 0);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v37, (uint64_t)v41, 16);
      if (v19)
      {
        uint64_t v22 = v19;
        uint64_t v23 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v38 != v23) {
              objc_enumerationMutation(v17);
            }
            uint64_t v25 = *(const void **)(*((void *)&v37 + 1) + 8 * i);
            if (objc_msgSend_accountActive_(self, v20, (uint64_t)v25, v21)) {
              BOOL v26 = Mutable == 0;
            }
            else {
              BOOL v26 = 1;
            }
            if (!v26 && v25 != 0) {
              CFArrayAppendValue(Mutable, v25);
            }
          }
          uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v37, (uint64_t)v41, 16);
        }
        while (v22);
      }

      if (!self->_serviceToActiveAccountsMap)
      {
        uint64_t v28 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        uint64_t v29 = self->_serviceToActiveAccountsMap;
        self->_serviceToActiveAccountsMap = v28;
      }
      uint64_t v13 = Mutable;
      if (v13)
      {
        uint64_t v33 = self->_serviceToActiveAccountsMap;
        uint64_t v34 = (const void *)objc_msgSend_internalName(v8, v30, v31, v32);
        CFDictionarySetValue((CFMutableDictionaryRef)v33, v34, v13);
      }
    }
    uint64_t v35 = v13;
  }
  else
  {
    objc_msgSend_activeAccounts(self, v5, v6, v7);
    uint64_t v35 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  }

  return v35;
}

- (id)operationalAccountsForService:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    if (!self->_cachesEnabled
      || (uint64_t v9 = self->_serviceToOperationalAccountsMap,
          objc_msgSend_internalName(v4, v5, v6, v7),
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_objectForKey_(v9, v11, (uint64_t)v10, v12),
          uint64_t v13 = (__CFArray *)objc_claimAutoreleasedReturnValue(),
          v10,
          !v13))
    {
      CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v17 = objc_msgSend_activeAccountsForService_(self, v15, (uint64_t)v8, v16, 0);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v38, (uint64_t)v42, 16);
      if (v19)
      {
        uint64_t v23 = v19;
        uint64_t v24 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v39 != v24) {
              objc_enumerationMutation(v17);
            }
            BOOL v26 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (objc_msgSend_isOperational(v26, v20, v21, v22)) {
              BOOL v27 = Mutable == 0;
            }
            else {
              BOOL v27 = 1;
            }
            if (!v27 && v26 != 0) {
              CFArrayAppendValue(Mutable, v26);
            }
          }
          uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v38, (uint64_t)v42, 16);
        }
        while (v23);
      }

      if (!self->_serviceToOperationalAccountsMap)
      {
        uint64_t v29 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        serviceToOperationalAccountsMap = self->_serviceToOperationalAccountsMap;
        self->_serviceToOperationalAccountsMap = v29;
      }
      uint64_t v13 = Mutable;
      if (v13)
      {
        uint64_t v34 = self->_serviceToOperationalAccountsMap;
        uint64_t v35 = (const void *)objc_msgSend_internalName(v8, v31, v32, v33);
        CFDictionarySetValue((CFMutableDictionaryRef)v34, v35, v13);
      }
    }
    uint64_t v36 = v13;
  }
  else
  {
    objc_msgSend_operationalAccounts(self, v5, v6, v7);
    uint64_t v36 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  }

  return v36;
}

- (NSArray)accounts
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (id)bestAccountForService:(id)a3
{
  return sub_1A4B19534(self, a3, 0, 0);
}

- (BOOL)activateAccounts:(id)a3 force:(BOOL)a4 locally:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v108 = a3;
  char canActivateAccounts = objc_msgSend_canActivateAccounts_(self, v7, (uint64_t)v108, v8);
  if (canActivateAccounts)
  {
    BOOL v106 = v5;
    if (!v5 && IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v133 = v108;
        _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Activating accounts: %@", buf, 0xCu);
      }
    }
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    theArray = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id v10 = v108;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v124, (uint64_t)v131, 16);
    if (v14)
    {
      uint64_t v15 = *(void *)v125;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v125 != v15) {
            objc_enumerationMutation(v10);
          }
          uint64_t v17 = *(void **)(*((void *)&v124 + 1) + 8 * i);
          if ((objc_msgSend_accountActive_(self, v12, (uint64_t)v17, v13) & 1) == 0)
          {
            if (theArray && v17) {
              CFArrayAppendValue(theArray, v17);
            }
            uint64_t v19 = objc_msgSend_uniqueID(v17, v12, v18, v13);
            BOOL v20 = v19 == 0;

            if (!v20 && Mutable != 0)
            {
              uint64_t v22 = objc_msgSend_uniqueID(v17, v12, v21, v13);
              BOOL v23 = v22 == 0;

              if (!v23)
              {
                uint64_t v25 = objc_msgSend_uniqueID(v17, v12, v24, v13);
                CFArrayAppendValue(Mutable, v25);
              }
            }
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v124, (uint64_t)v131, 16);
      }
      while (v14);
    }

    if (objc_msgSend_count(theArray, v26, v27, v28))
    {
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      obuint64_t j = theArray;
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v120, (uint64_t)v130, 16);
      if (v34)
      {
        uint64_t v35 = *(void *)v121;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v121 != v35) {
              objc_enumerationMutation(obj);
            }
            long long v37 = *(void **)(*((void *)&v120 + 1) + 8 * j);
            long long v38 = objc_msgSend_service(v37, v31, v32, v33);
            char v42 = objc_msgSend_allowsMultipleConnections(v38, v39, v40, v41);

            if ((v42 & 1) == 0)
            {
              uint64_t v43 = objc_msgSend_service(v37, v31, v32, v33);
              if (v43)
              {
                uint64_t v44 = objc_msgSend_service(v37, v31, v32, v33);
                char v47 = objc_msgSend_containsObject_(v29, v45, (uint64_t)v44, v46);

                if ((v47 & 1) == 0)
                {
                  uint64_t v48 = objc_msgSend_service(v37, v31, v32, v33);
                  objc_msgSend_addObject_(v29, v49, (uint64_t)v48, v50);
                }
              }
            }
          }
          uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v120, (uint64_t)v130, 16);
        }
        while (v34);
      }

      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v51 = v29;
      uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v116, (uint64_t)v129, 16);
      if (v55)
      {
        uint64_t v56 = *(void *)v117;
        do
        {
          for (uint64_t k = 0; k != v55; ++k)
          {
            if (*(void *)v117 != v56) {
              objc_enumerationMutation(v51);
            }
            uint64_t v58 = objc_msgSend_activeAccountsForService_(self, v53, *(void *)(*((void *)&v116 + 1) + 8 * k), v54);
            int64_t v62 = objc_msgSend___imSetFromArray(v58, v59, v60, v61);
            long long v66 = objc_msgSend_mutableCopy(v62, v63, v64, v65);

            long long v70 = objc_msgSend___imSetFromArray(v10, v67, v68, v69);
            if (objc_msgSend_count(v70, v71, v72, v73)) {
              objc_msgSend_minusSet_(v66, v74, (uint64_t)v70, v76);
            }
            if (objc_msgSend_count(v66, v74, v75, v76))
            {
              long long v80 = objc_msgSend_allObjects(v66, v77, v78, v79);
              objc_msgSend_deactivateAccounts_withDisable_(self, v81, (uint64_t)v80, 1);
            }
          }
          uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v53, (uint64_t)&v116, (uint64_t)v129, 16);
        }
        while (v55);
      }

      if (((objc_msgSend_readOnly(self, v82, v83, v84) | v106) & 1) == 0)
      {
        v88 = objc_msgSend_sharedInstance(IMDaemonController, v85, v86, v87);
        objc_msgSend_activateAccounts_(v88, v89, (uint64_t)Mutable, v90);
      }
      objc_msgSend_removeAllObjects(self->_serviceToActiveAccountsMap, v85, v86, v87);
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id v91 = obj;
      uint64_t v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v91, v92, (uint64_t)&v112, (uint64_t)v128, 16);
      if (v95)
      {
        uint64_t v96 = *(void *)v113;
        do
        {
          for (uint64_t m = 0; m != v95; ++m)
          {
            if (*(void *)v113 != v96) {
              objc_enumerationMutation(v91);
            }
            v98 = *(void **)(*((void *)&v112 + 1) + 8 * m);
            objc_msgSend_setIsActive_(v98, v93, 1, v94);
            objc_msgSend_accountDidBecomeActive(v98, v99, v100, v101);
          }
          uint64_t v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v91, v93, (uint64_t)&v112, (uint64_t)v128, 16);
        }
        while (v95);
      }

      objc_msgSend__rebuildOperationalAccountsCache_(self, v102, 1, v103);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v104 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v133 = v108;
      _os_log_impl(&dword_1A4AF7000, v104, OS_LOG_TYPE_INFO, "Accounts could not be activated: %@", buf, 0xCu);
    }
  }
  return canActivateAccounts;
}

- (void)_rebuildOperationalAccountsCache:(BOOL)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  p_operationalAccountsCache = &self->_operationalAccountsCache;
  uint64_t v6 = objc_msgSend___imSetFromArray(self->_operationalAccountsCache, a2, a3, v3);
  uint64_t v7 = *p_operationalAccountsCache;
  *p_operationalAccountsCache = 0;

  v11 = objc_msgSend_operationalAccounts(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend___imSetFromArray(v11, v12, v13, v14);

  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v32 = 138412546;
      uint64_t v33 = v6;
      __int16 v34 = 2112;
      uint64_t v35 = v15;
      _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Rebuilding operational accounts, old: (%@)  new: (%@)", (uint8_t *)&v32, 0x16u);
    }
  }
  uint64_t v20 = objc_msgSend_count(v15, v16, v17, v18);
  if (v20 != objc_msgSend_count(v6, v21, v22, v23) || (objc_msgSend_isEqualToSet_(v15, v24, (uint64_t)v6, v25) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        LOWORD(v32) = 0;
        _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, " ** Posting operational accounts changed", (uint8_t *)&v32, 2u);
      }
    }
    uint64_t v30 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v26, v27, v28);
    objc_msgSend___mainThreadPostNotificationName_object_(v30, v31, @"__kIMAccountControllerOperationalAccountsChangedNotification", 0);
  }
}

- (NSArray)operationalAccounts
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_operationalAccountsCache = &self->_operationalAccountsCache;
  operationalAccountsCache = self->_operationalAccountsCache;
  if (operationalAccountsCache)
  {
    CFMutableDictionaryRef Mutable = operationalAccountsCache;
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = objc_msgSend_activeAccounts(self, v6, v7, v8, 0);
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v22, (uint64_t)v26, 16);
    if (v11)
    {
      uint64_t v15 = v11;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v9);
          }
          uint64_t v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (objc_msgSend_isOperational(v18, v12, v13, v14)) {
            BOOL v19 = Mutable == 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (!v19 && v18 != 0) {
            CFArrayAppendValue(Mutable, v18);
          }
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v22, (uint64_t)v26, 16);
      }
      while (v15);
    }

    objc_storeStrong((id *)p_operationalAccountsCache, Mutable);
  }

  return (NSArray *)Mutable;
}

- (BOOL)canActivateAccounts:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v4;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v18, (uint64_t)v22, 16);
    if (v10)
    {
      uint64_t v13 = v10;
      uint64_t v14 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v8);
          }
          if (!objc_msgSend_canActivateAccount_(self, v11, *(void *)(*((void *)&v18 + 1) + 8 * i), v12, (void)v18))
          {
            BOOL v16 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v18, (uint64_t)v22, 16);
        if (v13) {
          continue;
        }
        break;
      }
    }
    BOOL v16 = 1;
LABEL_12:
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)canActivateAccount:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = objc_msgSend_standardControls(IMParentalControls, v5, v6, v7);
  char v11 = objc_msgSend_okToConnectAccount_(v8, v9, (uint64_t)v4, v10);

  if (v11)
  {
    if (objc_msgSend_accountActive_(self, v12, (uint64_t)v4, v13)) {
      goto LABEL_14;
    }
    uint64_t v17 = objc_msgSend_service(v4, v14, v15, v16);
    char v21 = objc_msgSend_allowsMultipleConnections(v17, v18, v19, v20);

    if ((v21 & 1) != 0
      || (objc_msgSend_service(v4, v22, v23, v24),
          long long v25 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_connectedAccountsForService_(self, v26, (uint64_t)v25, v27),
          uint64_t v28 = objc_claimAutoreleasedReturnValue(),
          uint64_t v32 = objc_msgSend_count(v28, v29, v30, v31),
          v28,
          v25,
          !v32))
    {
LABEL_14:
      BOOL v34 = 1;
      goto LABEL_15;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        int v36 = 138412290;
        id v37 = v4;
        _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "Not activating account since we already have active accounts of this type for account: %@", (uint8_t *)&v36, 0xCu);
      }
LABEL_12:
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      int v36 = 138412290;
      id v37 = v4;
      _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "Parental controls disabled account: %@   not allowed to activate", (uint8_t *)&v36, 0xCu);
    }
    goto LABEL_12;
  }
  BOOL v34 = 0;
LABEL_15:

  return v34;
}

- (BOOL)addAccount:(id)a3 locally:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_service(v6, v7, v8, v9);
  int isPersistent = objc_msgSend_isPersistent(v10, v11, v12, v13);

  if (isPersistent
    && (objc_msgSend_service(v6, v15, v16, v17),
        long long v18 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_accountsForService_(self, v19, (uint64_t)v18, v20),
        char v21 = objc_claimAutoreleasedReturnValue(),
        uint64_t v25 = objc_msgSend_count(v21, v22, v23, v24),
        v21,
        v18,
        v25))
  {
    BOOL v26 = 0;
  }
  else
  {
    uint64_t v27 = self;
    objc_sync_enter(v27);
    char v30 = objc_msgSend_containsObjectIdenticalTo_(v27->_accounts, v28, (uint64_t)v6, v29);
    objc_sync_exit(v27);

    if ((v30 & 1) == 0)
    {
      if (!v4 && IMOSLoggingEnabled())
      {
        uint64_t v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          int v98 = 138412290;
          id v99 = v6;
          _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "Adding account: %@", (uint8_t *)&v98, 0xCu);
        }
      }
      uint64_t v32 = v27;
      objc_sync_enter(v32);
      uint64_t v35 = objc_msgSend_arrayByAddingObject_(v27->_accounts, v33, (uint64_t)v6, v34);
      objc_msgSend_setAccounts_(v32, v36, (uint64_t)v35, v37);

      id v38 = v6;
      char v42 = v38;
      if (v38)
      {
        accountMap = (__CFDictionary *)v32->_accountMap;
        uint64_t v44 = (const void *)objc_msgSend_uniqueID(v38, v39, v40, v41);
        CFDictionarySetValue(accountMap, v44, v42);
      }

      objc_msgSend_removeAllObjects(v32->_serviceToAccountsMap, v45, v46, v47);
      objc_msgSend_removeAllObjects(v32->_serviceToActiveAccountsMap, v48, v49, v50);
      objc_sync_exit(v32);

      if (((objc_msgSend_readOnly(v32, v51, v52, v53) | v4) & 1) == 0)
      {
        __int16 v57 = objc_msgSend_sharedInstance(IMDaemonController, v54, v55, v56);
        uint64_t v61 = objc_msgSend_uniqueID(v42, v58, v59, v60);
        uint64_t v65 = objc_msgSend_dictionary(v42, v62, v63, v64);
        uint64_t v69 = objc_msgSend_service(v42, v66, v67, v68);
        uint64_t v73 = objc_msgSend_internalName(v69, v70, v71, v72);
        objc_msgSend_addAccount_defaults_service_(v57, v74, (uint64_t)v61, (uint64_t)v65, v73);
      }
      uint64_t v75 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v54, v55, v56);
      objc_msgSend___mainThreadPostNotificationName_object_(v75, v76, @"__k_IMAccountControllerUpdatedNotification", (uint64_t)v42);

      long long v80 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v77, v78, v79);
      objc_msgSend___mainThreadPostNotificationName_object_(v80, v81, @"__kIMAccountControllerUpdatedNotification", (uint64_t)v42);

      long long v85 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v82, v83, v84);
      objc_msgSend___mainThreadPostNotificationName_object_(v85, v86, @"__kIMAccountControllerAccountAddedNotification", (uint64_t)v42);

      objc_msgSend__rebuildOperationalAccountsCache_(v32, v87, 1, v88);
      uint64_t v92 = objc_msgSend_standardControls(IMParentalControls, v89, v90, v91);
      char v95 = objc_msgSend_okToConnectAccount_(v92, v93, (uint64_t)v42, v94);

      if ((v95 & 1) == 0) {
        objc_msgSend_deactivateAccount_withDisable_(v32, v96, (uint64_t)v42, 1);
      }
    }
    BOOL v26 = 1;
  }

  return v26;
}

- (BOOL)readOnly
{
  return self->_isReadOnly;
}

- (void)setAccounts:(id)a3
{
}

- (BOOL)activateAccount:(id)a3 locally:(BOOL)a4
{
  return MEMORY[0x1F4181798](self, sel_activateAccount_force_locally_, a3, 0);
}

- (BOOL)activateAccount:(id)a3 force:(BOOL)a4 locally:(BOOL)a5
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = a5;
  BOOL v6 = a4;
  uint64_t v8 = IMSingleObjectArray();
  LOBYTE(v5) = objc_msgSend_activateAccounts_force_locally_(self, v9, (uint64_t)v8, v6, v5);

  return v5;
}

+ (id)bestAccountFromAccounts:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v58, (uint64_t)v62, 16);
  if (!v5)
  {
    id v10 = 0;
    goto LABEL_22;
  }
  uint64_t v9 = v5;
  id v10 = 0;
  uint64_t v11 = *(void *)v59;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v59 != v11) {
        objc_enumerationMutation(v3);
      }
      uint64_t v13 = *(void **)(*((void *)&v58 + 1) + 8 * i);
      if (!v10)
      {
        id v10 = v13;
        continue;
      }
      uint64_t v14 = objc_msgSend_sharedInstance(IMAccountController, v6, v7, v8);
      if (objc_msgSend_accountActive_(v14, v15, (uint64_t)v10, v16))
      {
      }
      else
      {
        uint64_t v23 = objc_msgSend_sharedInstance(IMAccountController, v17, v18, v19);
        int v26 = objc_msgSend_accountActive_(v23, v24, (uint64_t)v13, v25);

        if (v26) {
          goto LABEL_17;
        }
      }
      if ((objc_msgSend_isConnected(v10, v20, v21, v22) & 1) == 0
        && objc_msgSend_isConnected(v13, v27, v28, v29))
      {
        goto LABEL_17;
      }
      char v30 = objc_msgSend_sharedInstance(IMAccountController, v27, v28, v29);
      int v33 = objc_msgSend_accountActive_(v30, v31, (uint64_t)v10, v32);
      uint64_t v37 = objc_msgSend_sharedInstance(IMAccountController, v34, v35, v36);
      if (v33 != objc_msgSend_accountActive_(v37, v38, (uint64_t)v13, v39)
        || (int isConnected = objc_msgSend_isConnected(v10, v40, v41, v42),
            isConnected != objc_msgSend_isConnected(v13, v44, v45, v46)))
      {

        continue;
      }
      IMPersonStatus v50 = objc_msgSend_myStatus(v10, v47, v48, v49);
      IMPersonStatus v54 = objc_msgSend_myStatus(v13, v51, v52, v53);
      NSComparisonResult v55 = IMComparePersonStatus(v50, v54);

      if (v55 == NSOrderedAscending)
      {
LABEL_17:
        id v56 = v13;

        id v10 = v56;
        continue;
      }
    }
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v58, (uint64_t)v62, 16);
  }
  while (v9);
LABEL_22:

  return v10;
}

- (NSArray)activeAccounts
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v4 = self->_accounts;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(const void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend_accountActive_(self, v7, (uint64_t)v12, v8, (void)v16)) {
          BOOL v13 = Mutable == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13 && v12 != 0) {
          CFArrayAppendValue(Mutable, v12);
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v9);
  }

  return (NSArray *)Mutable;
}

- (BOOL)accountActive:(id)a3
{
  return objc_msgSend_isActive(a3, a2, (uint64_t)a3, v3);
}

- (BOOL)isAccountKeyCDPSyncingOrWaitingForUser:(id)a3
{
  return (objc_msgSend_registrationFailureReason(a3, a2, (uint64_t)a3, v3) & 0xFFFFFFFELL) == 28;
}

- (void)deferredSetup
{
  if (objc_msgSend__shouldPerformDeferredSetup(self, a2, v2, v3))
  {
    MEMORY[0x1F4181798](self, sel__requestNetworkDataAvailability, v5, v6);
  }
}

- (IMAccount)activeSMSAccount
{
  BOOL v4 = objc_msgSend_sharedInstance(IMAccountController, a2, v2, v3);
  uint64_t v8 = objc_msgSend_smsService(IMServiceImpl, v5, v6, v7);
  uint64_t v11 = objc_msgSend_activeAccountsForService_(v4, v9, (uint64_t)v8, v10);
  uint64_t v15 = objc_msgSend_firstObject(v11, v12, v13, v14);

  if (v15
    && ((objc_msgSend_allowsSMSRelay(v15, v16, v17, v18) & 1) != 0
     || objc_msgSend_allowsMMSRelay(v15, v19, v20, v21)))
  {
    id v22 = v15;
  }
  else
  {
    id v22 = 0;
  }

  return (IMAccount *)v22;
}

- (void)autoLogin
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = self->_accounts;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v4)
  {
    uint64_t v8 = v4;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v2);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend_autoLogin(v11, v5, v6, v7, (void)v12)
          && (objc_msgSend_isConnected(v11, v5, v6, v7) & 1) == 0)
        {
          objc_msgSend_loginAccount(v11, v5, v6, v7);
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v12, (uint64_t)v16, 16);
    }
    while (v8);
  }
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, 0, 0);

  uint64_t v7 = self;
  objc_sync_enter(v7);
  accounts = v7->_accounts;
  v7->_accounts = 0;

  accountMap = v7->_accountMap;
  v7->_accountMap = 0;

  objc_sync_exit(v7);
  v10.receiver = v7;
  v10.super_class = (Class)IMAccountController;
  [(IMAccountController *)&v10 dealloc];
}

- (void)accountLoginComplete:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v4, v5, v6);
  objc_msgSend___mainThreadPostNotificationName_object_(v7, v8, @"__kIMAccountControllerUpdatedNotification", (uint64_t)v3);
}

- (id)accountAtIndex:(int)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_accounts, a2, a3, v3);
}

- (int)numberOfAccounts
{
  return objc_msgSend_count(self->_accounts, a2, v2, v3);
}

- (NSArray)connectedAccounts
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = self->_accounts;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v4);
        }
        long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend_isConnected(v13, v7, v8, v9, (void)v17)) {
          BOOL v14 = Mutable == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14 && v13 != 0) {
          CFArrayAppendValue(Mutable, v13);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v10);
  }

  return (NSArray *)Mutable;
}

- (id)accountsWithServiceCapability:(id)a3
{
  id v4 = a3;
  accounts = self->_accounts;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A4B775C0;
  v11[3] = &unk_1E5B7BF20;
  id v12 = v4;
  id v6 = v4;
  uint64_t v9 = objc_msgSend___imArrayByFilteringWithBlock_(accounts, v7, (uint64_t)v11, v8);

  return v9;
}

- (id)activeAccountsWithServiceCapability:(id)a3
{
  id v4 = a3;
  accounts = self->_accounts;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A4B776B8;
  v11[3] = &unk_1E5B7BF48;
  void v11[4] = self;
  id v12 = v4;
  id v6 = v4;
  uint64_t v9 = objc_msgSend___imArrayByFilteringWithBlock_(accounts, v7, (uint64_t)v11, v8);

  return v9;
}

- (id)connectedAccountsWithServiceCapability:(id)a3
{
  id v4 = objc_msgSend_accountsWithServiceCapability_(self, a2, (uint64_t)a3, v3);
  uint64_t v7 = objc_msgSend___imArrayByFilteringWithBlock_(v4, v5, (uint64_t)&unk_1EF8E5EF8, v6);

  return v7;
}

- (id)accountsWithCapability:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  uint64_t v6 = self;
  objc_sync_enter(v6);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = v6->_accounts;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v7);
        }
        BOOL v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int hasCapability = objc_msgSend_hasCapability_(v14, v9, a3, v10, (void)v19);
        if (Mutable) {
          BOOL v16 = v14 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (v16) {
          int v17 = 0;
        }
        else {
          int v17 = hasCapability;
        }
        if (v17 == 1) {
          CFArrayAppendValue(Mutable, v14);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v11);
  }

  objc_sync_exit(v6);

  return Mutable;
}

- (id)operationalAccountsWithCapability:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  uint64_t v6 = self;
  objc_sync_enter(v6);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = objc_msgSend_accountsWithCapability_(v6, v7, a3, v8, 0);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v9);
        }
        int v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend_isOperational(v17, v11, v12, v13))
        {
          int isActive = objc_msgSend_isActive(v17, v11, v12, v13);
          BOOL v19 = !Mutable || v17 == 0;
          int v20 = v19 ? 0 : isActive;
          if (v20 == 1) {
            CFArrayAppendValue(Mutable, v17);
          }
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v14);
  }

  objc_sync_exit(v6);

  return Mutable;
}

- (id)connectedAccountsWithCapability:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = objc_msgSend_accountsWithCapability_(self, v6, a3, v7, 0);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v10)
  {
    uint64_t v14 = v10;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v8);
        }
        int v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend_isConnected(v17, v11, v12, v13)) {
          BOOL v18 = Mutable == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18 && v17 != 0) {
          CFArrayAppendValue(Mutable, v17);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v14);
  }

  return Mutable;
}

- (BOOL)canDeleteAccount:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_service(v3, v4, v5, v6);
  if (objc_msgSend_isPersistent(v7, v8, v9, v10) & 1) != 0 || (objc_msgSend_isManaged(v3, v11, v12, v13))
  {
    LOBYTE(v17) = 0;
  }
  else
  {
    BOOL v18 = objc_msgSend_service(v3, v14, v15, v16);
    int v17 = objc_msgSend_shouldDisableDeactivation(v18, v19, v20, v21) ^ 1;
  }
  return v17;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_isReadOnly = a3;
}

- (void)_activeAccountChanged:(id)a3
{
  objc_msgSend__rebuildOperationalAccountsCache_(self, a2, 1, v3);
}

- (void)_accountRegistrationStatusChanged:(id)a3
{
  objc_msgSend__rebuildOperationalAccountsCache_(self, a2, 1, v3);
}

- (BOOL)addAccount:(id)a3
{
  return objc_msgSend_addAccount_locally_(self, a2, (uint64_t)a3, 0);
}

- (BOOL)addAccount:(id)a3 atIndex:(int)a4
{
  return objc_msgSend_addAccount_locally_(self, a2, (uint64_t)a3, 0);
}

- (BOOL)addAccount:(id)a3 atIndex:(int)a4 locally:(BOOL)a5
{
  return objc_msgSend_addAccount_locally_(self, a2, (uint64_t)a3, a5);
}

- (BOOL)deleteAccount:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Client request to delete account: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  char v7 = objc_msgSend_deleteAccount_locally_(self, v5, (uint64_t)v4, 0);

  return v7;
}

- (BOOL)deleteAccount:(id)a3 locally:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v10 = objc_msgSend_service(v6, v7, v8, v9);
  int shouldDisableDeactivation = objc_msgSend_shouldDisableDeactivation(v10, v11, v12, v13);

  if (shouldDisableDeactivation)
  {
    if (!IMOSLoggingEnabled())
    {
LABEL_26:
      BOOL v82 = 0;
      goto LABEL_27;
    }
    BOOL v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v86 = 138412290;
      id v87 = v6;
      _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Someone tried to delete an account that can't be deactivated, you can't do this (%@)", (uint8_t *)&v86, 0xCu);
    }
LABEL_5:

    goto LABEL_26;
  }
  if (!v4)
  {
    if (objc_msgSend_supportsRegistration(v6, v15, v16, v17)
      && objc_msgSend_accountType(v6, v19, v20, v21) == 2)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_26;
      }
      BOOL v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v86) = 0;
        _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Someone tried to delete a phone account, you can't do this", (uint8_t *)&v86, 2u);
      }
      goto LABEL_5;
    }
    if (IMOSLoggingEnabled())
    {
      long long v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v86 = 138412546;
        id v87 = v6;
        __int16 v88 = 2112;
        v89 = @"NO";
        _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "Deleting account: %@  (Locally: %@)", (uint8_t *)&v86, 0x16u);
      }
    }
  }
  if (objc_msgSend_isConnected(v6, v15, v16, v17)) {
    objc_msgSend_logoutAccount(v6, v23, v24, v25);
  }
  if (objc_msgSend_accountActive_(self, v23, (uint64_t)v6, v25)
    && !objc_msgSend_deactivateAccount_(self, v26, (uint64_t)v6, v28))
  {
    goto LABEL_26;
  }
  uint64_t v29 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v26, v27, v28);
  objc_msgSend___mainThreadPostNotificationName_object_(v29, v30, @"__kIMAccountControllerAccountWillBeRemovedNotification", (uint64_t)v6);

  objc_msgSend_accountWillBeRemoved(v6, v31, v32, v33);
  uint64_t v34 = self;
  objc_sync_enter(v34);
  id v38 = objc_msgSend_mutableCopy(v34->_accounts, v35, v36, v37);
  objc_msgSend_removeObject_(v38, v39, (uint64_t)v6, v40);
  objc_msgSend_setAccounts_(v34, v41, (uint64_t)v38, v42);
  uint64_t v46 = objc_msgSend_uniqueID(v6, v43, v44, v45);

  if (v46)
  {
    accountMap = v34->_accountMap;
    id v51 = objc_msgSend_uniqueID(v6, v47, v48, v49);
    objc_msgSend_removeObjectForKey_(accountMap, v52, (uint64_t)v51, v53);
  }
  objc_msgSend_removeAllObjects(v34->_serviceToAccountsMap, v47, v48, v49);
  objc_msgSend_removeAllObjects(v34->_serviceToActiveAccountsMap, v54, v55, v56);

  objc_sync_exit(v34);
  if (((objc_msgSend_readOnly(v34, v57, v58, v59) | v4) & 1) == 0)
  {
    uint64_t v63 = objc_msgSend_sharedInstance(IMDaemonController, v60, v61, v62);
    uint64_t v67 = objc_msgSend_uniqueID(v6, v64, v65, v66);
    objc_msgSend_removeAccount_(v63, v68, (uint64_t)v67, v69);
  }
  long long v70 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v60, v61, v62);
  objc_msgSend___mainThreadPostNotificationName_object_(v70, v71, @"__k_IMAccountControllerUpdatedNotification", (uint64_t)v6);

  uint64_t v75 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v72, v73, v74);
  objc_msgSend___mainThreadPostNotificationName_object_(v75, v76, @"__kIMAccountControllerUpdatedNotification", 0);

  long long v80 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v77, v78, v79);
  objc_msgSend___mainThreadPostNotificationName_object_(v80, v81, @"__kIMAccountControllerAccountRemovedNotification", (uint64_t)v6);

  BOOL v82 = 1;
  objc_msgSend__rebuildOperationalAccountsCache_(v34, v83, 1, v84);
LABEL_27:

  return v82;
}

- (BOOL)_deactivateAccount:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_service(v4, v5, v6, v7);
  char shouldDisableDeactivation = objc_msgSend_shouldDisableDeactivation(v8, v9, v10, v11);

  if (shouldDisableDeactivation) {
    char v14 = 0;
  }
  else {
    char v14 = objc_msgSend_deactivateAccount_withDisable_(self, v13, (uint64_t)v4, 1);
  }

  return v14;
}

- (BOOL)deactivateAccount:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Client request to deactivate account: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  char v8 = objc_msgSend__deactivateAccount_(self, v5, (uint64_t)v4, v6);

  return v8;
}

- (BOOL)_deactivateAccounts:(id)a3
{
  return objc_msgSend_deactivateAccounts_withDisable_(self, a2, (uint64_t)a3, 1);
}

- (BOOL)deactivateAccounts:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Client request to deactivate accounts: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  char v8 = objc_msgSend__deactivateAccounts_(self, v5, (uint64_t)v4, v6);

  return v8;
}

- (BOOL)activateAccounts:(id)a3
{
  return objc_msgSend_activateAccounts_force_locally_(self, a2, (uint64_t)a3, 0, 0);
}

- (BOOL)activateAccount:(id)a3
{
  return MEMORY[0x1F4181798](self, sel_activateAccount_force_locally_, a3, 0);
}

- (BOOL)activateAccount:(id)a3 force:(BOOL)a4
{
  return MEMORY[0x1F4181798](self, sel_activateAccount_force_locally_, a3, a4);
}

- (BOOL)activateAndHandleReconnectAccounts:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v8 = objc_msgSend_activeAccounts(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_count(v8, v9, v10, v11);

  int v17 = objc_msgSend_activateAccounts_force_locally_(self, v13, (uint64_t)v4, 1, 0);
  if (v17)
  {
    if (!v12) {
      goto LABEL_4;
    }
    BOOL v18 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
    long long v22 = objc_msgSend_listener(v18, v19, v20, v21);
    unint64_t v26 = objc_msgSend_myStatus(v22, v23, v24, v25);
    BOOL IsOnline = IMPersonStatusIsOnline(v26);

    if (IsOnline)
    {
LABEL_4:
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v28 = v4;
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v38, (uint64_t)v42, 16);
      if (v30)
      {
        uint64_t v34 = v30;
        uint64_t v35 = *(void *)v39;
        do
        {
          uint64_t v36 = 0;
          do
          {
            if (*(void *)v39 != v35) {
              objc_enumerationMutation(v28);
            }
            objc_msgSend_loginAccount(*(void **)(*((void *)&v38 + 1) + 8 * v36++), v31, v32, v33, (void)v38);
          }
          while (v34 != v36);
          uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v38, (uint64_t)v42, 16);
        }
        while (v34);
      }
    }
  }

  return v17;
}

- (BOOL)activateAndHandleReconnectAccount:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = IMSingleObjectArray();
  LOBYTE(self) = objc_msgSend_activateAndHandleReconnectAccounts_(self, v5, (uint64_t)v4, v6);

  return (char)self;
}

- (BOOL)accountConnecting:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_accountActive_(self, v5, (uint64_t)v4, v6)
    && objc_msgSend_isConnecting(v4, v7, v8, v9))
  {
    int v13 = objc_msgSend_isConnected(v4, v10, v11, v12) ^ 1;
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)accountConnected:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_accountActive_(self, v5, (uint64_t)v4, v6)) {
    char isConnected = objc_msgSend_isConnected(v4, v7, v8, v9);
  }
  else {
    char isConnected = 0;
  }

  return isConnected;
}

- (id)bestAccountForService:(id)a3 withLogin:(id)a4
{
  return sub_1A4B19534(self, a3, a4, 0);
}

- (id)bestOperationalAccountForService:(id)a3 withLogin:(id)a4
{
  return sub_1A4B21248(self, a3, a4, 0);
}

- (id)iMessageAccountForLastAddressedHandle:(id)a3 simID:(id)a4
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v79 = a4;
  if (objc_msgSend_length(v79, v7, v8, v9))
  {
    int v13 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E668], v10, v11, v12);
    int v17 = objc_msgSend_ctSubscriptionInfo(v13, v14, v15, v16);
    long long v77 = objc_msgSend___im_subscriptionContextForForSimID_(v17, v18, (uint64_t)v79, v19);

    if (!objc_msgSend_length(v6, v20, v21, v22))
    {
      long long v23 = objc_msgSend_phoneNumber(v77, v10, v11, v12);

      id v6 = v23;
      uint64_t v27 = objc_msgSend_length(v23, v24, v25, v26, v77);
      goto LABEL_6;
    }
  }
  else
  {
    long long v77 = 0;
  }
  uint64_t v27 = objc_msgSend_length(v6, v10, v11, v12, v77);
LABEL_6:
  if (v27)
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    uint64_t v32 = objc_msgSend_iMessageService(IMServiceImpl, v29, v30, v31);
    uint64_t v35 = objc_msgSend_operationalAccountsForService_(self, v33, (uint64_t)v32, v34);

    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v94, (uint64_t)v107, 16);
    if (v40)
    {
      uint64_t v41 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v95 != v41) {
            objc_enumerationMutation(v35);
          }
          uint64_t v43 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          if (objc_msgSend__isUsableForSending(v43, v37, v38, v39)) {
            objc_msgSend_addObject_(v28, v37, (uint64_t)v43, v39);
          }
        }
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v37, (uint64_t)&v94, (uint64_t)v107, 16);
      }
      while (v40);
    }

    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    obuint64_t j = v28;
    uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v90, (uint64_t)v106, 16);
    if (v48)
    {
      id v81 = 0;
      uint64_t v49 = *(void *)v91;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v91 != v49) {
            objc_enumerationMutation(obj);
          }
          id v51 = *(void **)(*((void *)&v90 + 1) + 8 * j);
          if (objc_msgSend_accountType(v51, v45, v46, v47) == 2)
          {
            long long v88 = 0u;
            long long v89 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            uint64_t v52 = objc_msgSend_aliases(v51, v45, v46, v47);
            uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v86, (uint64_t)v105, 16);
            if (v55)
            {
              uint64_t v56 = *(void *)v87;
              while (2)
              {
                for (uint64_t k = 0; k != v55; ++k)
                {
                  if (*(void *)v87 != v56) {
                    objc_enumerationMutation(v52);
                  }
                  if (objc_msgSend_isPhoneNumber_equivalentToExistingPhoneNumber_(MEMORY[0x1E4F6B3E8], v54, (uint64_t)v6, *(void *)(*((void *)&v86 + 1) + 8 * k)))
                  {
                    if (IMOSLoggingEnabled())
                    {
                      uint64_t v58 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412546;
                        id v99 = v6;
                        __int16 v100 = 2112;
                        id v101 = v51;
                        _os_log_impl(&dword_1A4AF7000, v58, OS_LOG_TYPE_INFO, "Alias %@  matched phone based iMessage account: %@, selecting it", buf, 0x16u);
                      }
                    }
                    id v59 = v51;

                    id v81 = v59;
                    goto LABEL_36;
                  }
                }
                uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v54, (uint64_t)&v86, (uint64_t)v105, 16);
                if (v55) {
                  continue;
                }
                break;
              }
            }
LABEL_36:
          }
        }
        uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v90, (uint64_t)v106, 16);
      }
      while (v48);

      if (v81) {
        goto LABEL_62;
      }
    }
    else
    {
    }
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v61 = obj;
    uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v62, (uint64_t)&v82, (uint64_t)v104, 16);
    if (!v66)
    {
LABEL_56:

LABEL_66:
      id v81 = 0;
      goto LABEL_67;
    }
    uint64_t v67 = *(void *)v83;
LABEL_49:
    uint64_t v68 = 0;
    while (1)
    {
      if (*(void *)v83 != v67) {
        objc_enumerationMutation(v61);
      }
      uint64_t v69 = *(void **)(*((void *)&v82 + 1) + 8 * v68);
      if (objc_msgSend_accountType(v69, v63, v64, v65) != 2)
      {
        long long v70 = objc_msgSend_aliases(v69, v63, v64, v65);
        int v73 = objc_msgSend_containsObject_(v70, v71, (uint64_t)v6, v72);

        if (v73) {
          break;
        }
      }
      if (v66 == ++v68)
      {
        uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v63, (uint64_t)&v82, (uint64_t)v104, 16);
        if (v66) {
          goto LABEL_49;
        }
        goto LABEL_56;
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v74 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v99 = v6;
        __int16 v100 = 2112;
        id v101 = v69;
        _os_log_impl(&dword_1A4AF7000, v74, OS_LOG_TYPE_INFO, "Alias %@  matched account: %@, selecting it", buf, 0x16u);
      }
    }
    id v81 = v69;

    if (!v81) {
      goto LABEL_66;
    }
LABEL_62:
    if (IMOSLoggingEnabled())
    {
      uint64_t v75 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v99 = v81;
        __int16 v100 = 2112;
        id v101 = v6;
        __int16 v102 = 2112;
        id v103 = v79;
        _os_log_impl(&dword_1A4AF7000, v75, OS_LOG_TYPE_INFO, "Returning iMessage account %@ for lastAddressedHandle %@ and context %@", buf, 0x20u);
      }
    }
LABEL_67:

    goto LABEL_68;
  }
  if (IMOSLoggingEnabled())
  {
    long long v60 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v99 = v79;
      __int16 v100 = 2112;
      id v101 = v78;
      _os_log_impl(&dword_1A4AF7000, v60, OS_LOG_TYPE_INFO, "Returning nil account because senderLastAddressedHandle is nil for simID %@ and context %@", buf, 0x16u);
    }
  }
  id v81 = 0;
LABEL_68:

  return v81;
}

- (id)bestActiveAccountForService:(id)a3 withLogin:(id)a4
{
  return sub_1A4B21034(self, a3, a4, 0);
}

- (id)bestConnectedAccountForService:(id)a3 withLogin:(id)a4
{
  return sub_1A4B20E20(self, a3, a4, 0);
}

- (id)bestOperationalAccountForService:(id)a3
{
  return sub_1A4B21248(self, a3, 0, 0);
}

- (id)bestActiveAccountForService:(id)a3
{
  return sub_1A4B21034(self, a3, 0, 0);
}

- (id)bestConnectedAccountForService:(id)a3
{
  return sub_1A4B20E20(self, a3, 0, 0);
}

- (id)bestAccountWithCapability:(unint64_t)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend_operationalAccountsWithCapability_(self, a2, a3, v3);
  if (objc_msgSend_count(v6, v7, v8, v9))
  {
    uint64_t v12 = objc_msgSend_bestAccountFromAccounts_(IMAccountController, v10, (uint64_t)v6, v11);
LABEL_8:

    goto LABEL_9;
  }
  int v13 = objc_msgSend_connectedAccountsWithCapability_(self, v10, a3, v11);
  if (objc_msgSend_count(v13, v14, v15, v16))
  {
    uint64_t v12 = objc_msgSend_bestAccountFromAccounts_(IMAccountController, v17, (uint64_t)v13, v18);
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v19 = objc_msgSend_accountsWithCapability_(self, v17, a3, v18);
  if (objc_msgSend_count(v19, v20, v21, v22))
  {
    uint64_t v12 = objc_msgSend_bestAccountFromAccounts_(IMAccountController, v23, (uint64_t)v19, v24);

    goto LABEL_7;
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v6 = objc_msgSend_servicesWithCapability_(IMServiceImpl, v26, a3, v27, 0);
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v28, (uint64_t)&v56, (uint64_t)v60, 16);
  if (!v29) {
    goto LABEL_22;
  }
  uint64_t v32 = v29;
  uint64_t v33 = *(void *)v57;
  while (2)
  {
    for (uint64_t i = 0; i != v32; ++i)
    {
      if (*(void *)v57 != v33) {
        objc_enumerationMutation(v6);
      }
      uint64_t v35 = *(void *)(*((void *)&v56 + 1) + 8 * i);
      uint64_t v36 = objc_msgSend_operationalAccountsForService_(self, v30, v35, v31);
      if (objc_msgSend_count(v36, v37, v38, v39))
      {
        uint64_t v12 = objc_msgSend_bestAccountFromAccounts_(IMAccountController, v40, (uint64_t)v36, v41);
LABEL_27:

        goto LABEL_8;
      }
      uint64_t v42 = objc_msgSend_connectedAccountsForService_(self, v40, v35, v41);
      if (objc_msgSend_count(v42, v43, v44, v45))
      {
        uint64_t v12 = objc_msgSend_bestAccountFromAccounts_(IMAccountController, v46, (uint64_t)v42, v47);
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v48 = objc_msgSend_accountsForService_(self, v46, v35, v47);
      if (objc_msgSend_count(v48, v49, v50, v51))
      {
        uint64_t v12 = objc_msgSend_bestAccountFromAccounts_(IMAccountController, v52, (uint64_t)v48, v53);

        goto LABEL_26;
      }
    }
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v30, (uint64_t)&v56, (uint64_t)v60, 16);
    if (v32) {
      continue;
    }
    break;
  }
LABEL_22:

  uint64_t v12 = objc_msgSend_bestActiveAccountForService_(self, v54, 0, v55);
LABEL_9:

  return v12;
}

- (id)mostLoggedInAccount
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = objc_msgSend_accounts(self, a2, v2, v3, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v4);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unint64_t v16 = objc_msgSend_loginStatus(v15, v7, v8, v9);
        if (v16 > v12)
        {
          unint64_t v17 = v16;
          id v18 = v15;

          uint64_t v11 = v18;
          unint64_t v12 = v17;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)aimAccount
{
  uint64_t v5 = objc_msgSend_aimService(IMServiceImpl, a2, v2, v3);
  uint64_t v8 = objc_msgSend_bestAccountForService_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (id)jabberAccount
{
  uint64_t v5 = objc_msgSend_jabberService(IMServiceImpl, a2, v2, v3);
  uint64_t v8 = objc_msgSend_bestAccountForService_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (void)_enableCache
{
  self->_cachesEnabled = 1;
}

- (void)_disableCache
{
  self->_cachesEnabled = 0;
  serviceToConnectedAccountsMap = self->_serviceToConnectedAccountsMap;
  self->_serviceToConnectedAccountsMap = 0;

  serviceToOperationalAccountsMap = self->_serviceToOperationalAccountsMap;
  self->_serviceToOperationalAccountsMap = 0;
}

- (BOOL)hasRelayApprovedAccount
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend_accounts(self, a2, v2, v3, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend_isSMSRelayCapable(*(void **)(*((void *)&v13 + 1) + 8 * i), v6, v7, v8))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v13, (uint64_t)v17, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)senderIdentifiers
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_set(MEMORY[0x1E4F1CA80], a2, v2, v3);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v9 = objc_msgSend_accounts(self, v6, v7, v8);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v34, (uint64_t)v39, 16);
  if (v11)
  {
    uint64_t v15 = v11;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v9);
        }
        uint64_t v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v19 = objc_msgSend_vettedAliases(v18, v12, v13, v14, 0);
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v30, (uint64_t)v38, 16);
        if (v21)
        {
          uint64_t v25 = v21;
          uint64_t v26 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v31 != v26) {
                objc_enumerationMutation(v19);
              }
              id v28 = *(void **)(*((void *)&v30 + 1) + 8 * j);
              if (objc_msgSend_length(v28, v22, v23, v24)) {
                objc_msgSend_addObject_(v5, v22, (uint64_t)v28, v24);
              }
            }
            uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v30, (uint64_t)v38, 16);
          }
          while (v25);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v34, (uint64_t)v39, 16);
    }
    while (v15);
  }

  return v5;
}

- (BOOL)networkDataAvailable
{
  return self->_networkDataAvailable;
}

- (NSMutableDictionary)accountMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccountMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountMap, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_serviceToOperationalAccountsMap, 0);
  objc_storeStrong((id *)&self->_serviceToConnectedAccountsMap, 0);
  objc_storeStrong((id *)&self->_serviceToAccountsMap, 0);
  objc_storeStrong((id *)&self->_serviceToActiveAccountsMap, 0);

  objc_storeStrong((id *)&self->_operationalAccountsCache, 0);
}

- (id)_bestOperationalAccountForSendingForService:(id)a3
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v93 = v4;
  uint64_t v9 = objc_msgSend_operationalAccountsForService_(self, v7, (uint64_t)v4, v8);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v107, (uint64_t)v118, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v108;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v108 != v15) {
          objc_enumerationMutation(v9);
        }
        unint64_t v17 = *(void **)(*((void *)&v107 + 1) + 8 * i);
        if (objc_msgSend__isUsableForSending(v17, v11, v12, v13)) {
          objc_msgSend_addObject_(v6, v11, (uint64_t)v17, v13);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v107, (uint64_t)v118, 16);
    }
    while (v14);
  }

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v18 = v6;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v103, (uint64_t)v117, 16);
  if (v23)
  {
    uint64_t v24 = *(void *)v104;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v104 != v24) {
          objc_enumerationMutation(v18);
        }
        uint64_t v26 = *(void **)(*((void *)&v103 + 1) + 8 * j);
        uint64_t v27 = objc_msgSend_aliases(v26, v20, v21, v22);
        BOOL v31 = objc_msgSend_count(v27, v28, v29, v30) == 0;

        if (!v31)
        {
          long long v32 = objc_msgSend_aliases(v26, v20, v21, v22);
          objc_msgSend_addObjectsFromArray_(v5, v33, (uint64_t)v32, v34);
        }
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v103, (uint64_t)v117, 16);
    }
    while (v23);
  }

  uint64_t v38 = objc_msgSend_allObjects(v5, v35, v36, v37);
  long long v94 = (void *)_IDSCopyOrderedAliasStrings();

  if (!objc_msgSend_count(v94, v39, v40, v41)) {
    goto LABEL_54;
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v45 = v18;
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v99, (uint64_t)v116, 16);
  if (v50)
  {
    uint64_t v51 = *(void *)v100;
LABEL_22:
    uint64_t v52 = 0;
    while (1)
    {
      if (*(void *)v100 != v51) {
        objc_enumerationMutation(v45);
      }
      uint64_t v53 = *(void **)(*((void *)&v99 + 1) + 8 * v52);
      if (objc_msgSend_accountType(v53, v47, v48, v49) == 2)
      {
        IMPersonStatus v54 = objc_msgSend_aliases(v53, v47, v48, v49);
        long long v58 = objc_msgSend_firstObject(v94, v55, v56, v57);
        int v61 = objc_msgSend_containsObject_(v54, v59, (uint64_t)v58, v60);

        if (v61) {
          break;
        }
      }
      if (v50 == ++v52)
      {
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v47, (uint64_t)&v99, (uint64_t)v116, 16);
        if (v50) {
          goto LABEL_22;
        }
        goto LABEL_29;
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v62 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        uint64_t v66 = objc_msgSend_firstObject(v94, v63, v64, v65);
        *(_DWORD *)buf = 138412546;
        id v113 = v66;
        __int16 v114 = 2112;
        long long v115 = v53;
        _os_log_impl(&dword_1A4AF7000, v62, OS_LOG_TYPE_INFO, "Alias %@  matched phone based account: %@, selecting it", buf, 0x16u);
      }
    }
    id v67 = v53;

    if (v67) {
      goto LABEL_50;
    }
  }
  else
  {
LABEL_29:
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v68 = v45;
  uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v95, (uint64_t)v111, 16);
  if (!v73)
  {
LABEL_44:

LABEL_54:
    objc_msgSend_anyObject(v18, v42, v43, v44);
    id v67 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_55;
  }
  uint64_t v74 = *(void *)v96;
LABEL_37:
  uint64_t v75 = 0;
  while (1)
  {
    if (*(void *)v96 != v74) {
      objc_enumerationMutation(v68);
    }
    uint64_t v76 = *(void **)(*((void *)&v95 + 1) + 8 * v75);
    if (objc_msgSend_accountType(v76, v70, v71, v72) != 2)
    {
      long long v77 = objc_msgSend_aliases(v76, v70, v71, v72);
      id v81 = objc_msgSend_firstObject(v94, v78, v79, v80);
      int v84 = objc_msgSend_containsObject_(v77, v82, (uint64_t)v81, v83);

      if (v84) {
        break;
      }
    }
    if (v73 == ++v75)
    {
      uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v70, (uint64_t)&v95, (uint64_t)v111, 16);
      if (v73) {
        goto LABEL_37;
      }
      goto LABEL_44;
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v85 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      long long v89 = objc_msgSend_firstObject(v94, v86, v87, v88);
      *(_DWORD *)buf = 138412546;
      id v113 = v89;
      __int16 v114 = 2112;
      long long v115 = v76;
      _os_log_impl(&dword_1A4AF7000, v85, OS_LOG_TYPE_INFO, "Alias %@  matched account: %@, selecting it", buf, 0x16u);
    }
  }
  id v67 = v76;

  if (!v67) {
    goto LABEL_54;
  }
LABEL_50:
  if (IMOSLoggingEnabled())
  {
    long long v90 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v113 = v67;
      _os_log_impl(&dword_1A4AF7000, v90, OS_LOG_TYPE_INFO, "Returning selected best account: %@", buf, 0xCu);
    }
  }
LABEL_55:
  id v91 = v67;

  return v91;
}

- (id)__iCloudSystemAccountForService:(id)a3
{
  return 0;
}

- (id)_bestAccountForAddresses:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_iMessageService(IMServiceImpl, v5, v6, v7);
  uint64_t v9 = IMPreferredSendingAccountForAddressesWantsGroupWithFallbackService(v4, 1, v8);

  if ((objc_msgSend__isUsableForSending(v9, v10, v11, v12) & 1) == 0)
  {
    id v18 = objc_msgSend_smsService(IMServiceImpl, v13, v14, v15);
    if (v18)
    {
      uint64_t v19 = objc_msgSend_accountsForService_(self, v16, (uint64_t)v18, v17);
      uint64_t v23 = objc_msgSend___imFirstObject(v19, v20, v21, v22);

      uint64_t v9 = (void *)v23;
    }
  }

  return v9;
}

- (BOOL)receiverIsMyMention:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v8 = IMChatCanonicalIDSIDsForAddress();
    uint64_t v9 = MEMORY[0x1A62639E0]();

    if (objc_msgSend_length(v9, v10, v11, v12))
    {
      objc_msgSend_connectedAccountsWithServiceCapability_(self, v13, *MEMORY[0x1E4F6E078], v14);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v28, (uint64_t)v32, 16);
      if (v20)
      {
        uint64_t v21 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v15);
            }
            uint64_t v23 = objc_msgSend_aliases(*(void **)(*((void *)&v28 + 1) + 8 * i), v17, v18, v19, (void)v28);
            char v26 = objc_msgSend_containsObject_(v23, v24, (uint64_t)v9, v25);

            if (v26)
            {
              LOBYTE(v20) = 1;
              goto LABEL_14;
            }
          }
          uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v28, (uint64_t)v32, 16);
          if (v20) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    else
    {
      LOBYTE(v20) = 0;
    }
  }
  else
  {
    LOBYTE(v20) = 0;
  }

  return v20;
}

- (BOOL)metionedHandleMatchesMeCard:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_receiverIsMyMention_(self, v5, (uint64_t)v4, v6))
  {
    char v7 = 1;
  }
  else
  {
    if (MEMORY[0x1A62639B0](v4))
    {
      IMNormalizePhoneNumber();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = v4;
    }
    uint64_t v12 = v8;
    uint64_t v13 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v9, v10, v11);
    uint64_t v14 = IMMentionContactKeysForMe();
    uint64_t v17 = objc_msgSend_fetchMeContactWithKeys_(v13, v15, (uint64_t)v14, v16);

    uint64_t v18 = IMMentionMeTokensForContact();
    char v7 = objc_msgSend_containsObject_(v18, v19, (uint64_t)v12, v20);
  }
  return v7;
}

- (int64_t)activeAccountsAreEligibleForUnknownSendersFiltering
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_activeAccounts(self, a2, v2, v3);
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v8 = v4;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v110, (uint64_t)v116, 16);
    if (v10)
    {
      uint64_t v14 = v10;
      uint64_t v15 = *(void *)v111;
      uint64_t v16 = (uint64_t *)MEMORY[0x1E4F6E190];
      long long v100 = v4;
      uint64_t v101 = *(void *)v111;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v111 != v15) {
            objc_enumerationMutation(v8);
          }
          uint64_t v18 = *(void **)(*((void *)&v110 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend_serviceName(v18, v11, v12, v13, v100);
          char isEqualToString = objc_msgSend_isEqualToString_(v19, v20, *v16, v21);

          if ((isEqualToString & 1) == 0)
          {
            uint64_t v23 = (void *)MEMORY[0x1E4F6EA38];
            uint64_t v24 = objc_msgSend_countryCode(v18, v11, v12, v13);
            if (objc_msgSend_accountCountryIsCandidateForHawking_(v23, v25, (uint64_t)v24, v26))
            {
              int IsCandidateForHawking = 1;
            }
            else
            {
              long long v31 = (void *)MEMORY[0x1E4F6EA38];
              long long v32 = objc_msgSend_loginIMHandle(v18, v27, v28, v29);
              uint64_t v36 = objc_msgSend_countryCode(v32, v33, v34, v35);
              int IsCandidateForHawking = objc_msgSend_accountCountryIsCandidateForHawking_(v31, v37, (uint64_t)v36, v38);
            }
            uint64_t v39 = (void *)MEMORY[0x1E4F6EA38];
            objc_msgSend_countryCode(v18, v40, v41, v42);
            id v43 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_receiverIsCandidateForDefaultAppleSMSFilter_(v39, v44, (uint64_t)v43, v45)) {
              goto LABEL_39;
            }
            uint64_t v49 = (void *)MEMORY[0x1E4F6EA38];
            uint64_t v50 = objc_msgSend_loginIMHandle(v18, v46, v47, v48);
            IMPersonStatus v54 = objc_msgSend_countryCode(v50, v51, v52, v53);
            LODWORD(v49) = objc_msgSend_receiverIsCandidateForDefaultAppleSMSFilter_(v49, v55, (uint64_t)v54, v56);

            if ((IsCandidateForHawking | v49)) {
              goto LABEL_43;
            }
            uint64_t v60 = objc_msgSend_aliases(v18, v57, v58, v59);
            uint64_t v64 = objc_msgSend_count(v60, v61, v62, v63);

            if (v64)
            {
              long long v108 = 0u;
              long long v109 = 0u;
              long long v106 = 0u;
              long long v107 = 0u;
              objc_msgSend_aliases(v18, v65, v66, v67);
              id v43 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v68, (uint64_t)&v106, (uint64_t)v115, 16);
              if (v69)
              {
                uint64_t v72 = v69;
                uint64_t v73 = *(void *)v107;
LABEL_16:
                uint64_t v74 = 0;
                while (1)
                {
                  if (*(void *)v107 != v73) {
                    objc_enumerationMutation(v43);
                  }
                  uint64_t v75 = *(void *)(*((void *)&v106 + 1) + 8 * v74);
                  if ((objc_msgSend_receiverIsCandidateForHawking_(MEMORY[0x1E4F6EA38], v70, v75, v71) & 1) != 0
                    || (objc_msgSend_receiverIsCandidateForDefaultAppleSMSFilter_(MEMORY[0x1E4F6EA38], v76, v75, v77) & 1) != 0)
                  {
                    break;
                  }
                  if (v72 == ++v74)
                  {
                    uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v70, (uint64_t)&v106, (uint64_t)v115, 16);
                    if (v72) {
                      goto LABEL_16;
                    }
                    goto LABEL_23;
                  }
                }
LABEL_39:
                id v4 = v100;
                int64_t v97 = 1;
                goto LABEL_40;
              }
LABEL_23:

              uint64_t v15 = v101;
              uint64_t v16 = (uint64_t *)MEMORY[0x1E4F6E190];
            }
            else
            {
              uint64_t v78 = (void *)MEMORY[0x1E4F6EA38];
              objc_msgSend_login(v18, v65, v66, v67);
              id v43 = (id)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_receiverIsCandidateForHawking_(v78, v79, (uint64_t)v43, v80)) {
                goto LABEL_39;
              }
              int v84 = (void *)MEMORY[0x1E4F6EA38];
              long long v85 = objc_msgSend_login(v18, v81, v82, v83);
              LOBYTE(v84) = objc_msgSend_receiverIsCandidateForDefaultAppleSMSFilter_(v84, v86, (uint64_t)v85, v87);

              uint64_t v15 = v101;
              uint64_t v16 = (uint64_t *)MEMORY[0x1E4F6E190];
              if (v84)
              {
LABEL_43:
                id v4 = v100;
                int64_t v97 = 1;
                goto LABEL_41;
              }
            }
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v110, (uint64_t)v116, 16);
        id v4 = v100;
        if (v14) {
          continue;
        }
        break;
      }
    }

    objc_msgSend_IMPhoneNumbersEnabledForMultipleSubscriptionDevice(MEMORY[0x1E4F6E660], v88, v89, v90);
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v91, (uint64_t)&v102, (uint64_t)v114, 16);
    if (v92)
    {
      uint64_t v95 = v92;
      uint64_t v96 = *(void *)v103;
      int64_t v97 = 1;
LABEL_30:
      uint64_t v98 = 0;
      while (1)
      {
        if (*(void *)v103 != v96) {
          objc_enumerationMutation(v43);
        }
        if (objc_msgSend_receiverIsCandidateForDefaultAppleSMSFilter_(MEMORY[0x1E4F6EA38], v93, *(void *)(*((void *)&v102 + 1) + 8 * v98), v94))break; {
        if (v95 == ++v98)
        }
        {
          uint64_t v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v93, (uint64_t)&v102, (uint64_t)v114, 16);
          if (v95) {
            goto LABEL_30;
          }
          goto LABEL_36;
        }
      }
    }
    else
    {
LABEL_36:
      int64_t v97 = 0;
    }
    id v8 = v43;
LABEL_40:

LABEL_41:
  }
  else
  {
    int64_t v97 = -1;
  }

  return v97;
}

- (int64_t)activeAccountsAreEligibleForInternationalFiltering
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  objc_msgSend_activeAccounts(self, a2, v2, v3);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v60, (uint64_t)v65, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v61;
    uint64_t v12 = (uint64_t *)MEMORY[0x1E4F6E190];
    id v53 = v4;
    uint64_t v54 = *(void *)v61;
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v55 = v10;
      do
      {
        if (*(void *)v61 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = *(void **)(*((void *)&v60 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend_serviceName(v14, v7, v8, v9);
        char isEqualToString = objc_msgSend_isEqualToString_(v15, v16, *v12, v17);

        if ((isEqualToString & 1) == 0)
        {
          uint64_t v19 = objc_msgSend_countryCode(v14, v7, v8, v9);
          uint64_t v23 = objc_msgSend_loginIMHandle(v14, v20, v21, v22);
          uint64_t v27 = objc_msgSend_countryCode(v23, v24, v25, v26);

          if (objc_msgSend_accountCountryIsCandidateForInternationalFiltering_(MEMORY[0x1E4F6EAB0], v28, (uint64_t)v19, v29) & 1) != 0|| (objc_msgSend_accountCountryIsCandidateForInternationalFiltering_(MEMORY[0x1E4F6EAB0], v30, (uint64_t)v27, v31))
          {

LABEL_29:
            int64_t v51 = 1;
            goto LABEL_30;
          }
          uint64_t v35 = objc_msgSend_regionID(v14, v32, v33, v34);
          if (objc_msgSend_accountRegionIsCandidateForInternationalFiltering_(MEMORY[0x1E4F6EAB0], v36, (uint64_t)v35, v37))
          {
            int v41 = 1;
          }
          else
          {
            uint64_t v42 = objc_msgSend_aliases(v14, v38, v39, v40);
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            id v43 = v42;
            uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v56, (uint64_t)v64, 16);
            if (v45)
            {
              uint64_t v48 = v45;
              uint64_t v49 = *(void *)v57;
              while (2)
              {
                for (uint64_t i = 0; i != v48; ++i)
                {
                  if (*(void *)v57 != v49) {
                    objc_enumerationMutation(v43);
                  }
                  if (objc_msgSend_receiverIsCandidateForInternationalFiltering_(MEMORY[0x1E4F6EAB0], v46, *(void *)(*((void *)&v56 + 1) + 8 * i), v47))
                  {
                    int v41 = 1;
                    goto LABEL_21;
                  }
                }
                uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v56, (uint64_t)v64, 16);
                if (v48) {
                  continue;
                }
                break;
              }
              int v41 = 0;
LABEL_21:
              id v4 = v53;
            }
            else
            {
              int v41 = 0;
            }

            uint64_t v11 = v54;
          }

          uint64_t v10 = v55;
          if (v41) {
            goto LABEL_29;
          }
        }
        ++v13;
      }
      while (v13 != v10);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v60, (uint64_t)v65, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
  int64_t v51 = 0;
LABEL_30:

  return v51;
}

- (int64_t)activeAccountsAreEligibleForHawking
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_activeAccounts(self, a2, v2, v3);
  if (!objc_msgSend_count(v4, v5, v6, v7))
  {
    int64_t v62 = -1;
    goto LABEL_31;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v8 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v70, (uint64_t)v75, 16);
  if (!v10)
  {
    int64_t v62 = 0;
    goto LABEL_30;
  }
  uint64_t v14 = v10;
  uint64_t v15 = *(void *)v71;
  uint64_t v16 = (uint64_t *)MEMORY[0x1E4F6E190];
  uint64_t v64 = v4;
  id v65 = v8;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v71 != v15) {
        objc_enumerationMutation(v8);
      }
      uint64_t v18 = *(void **)(*((void *)&v70 + 1) + 8 * i);
      uint64_t v19 = objc_msgSend_serviceName(v18, v11, v12, v13, v64);
      char isEqualToString = objc_msgSend_isEqualToString_(v19, v20, *v16, v21);

      if (isEqualToString) {
        continue;
      }
      uint64_t v23 = (void *)MEMORY[0x1E4F6EA38];
      uint64_t v24 = objc_msgSend_countryCode(v18, v11, v12, v13);
      if (objc_msgSend_accountCountryIsCandidateForHawking_(v23, v25, (uint64_t)v24, v26))
      {
LABEL_26:

LABEL_27:
        int64_t v62 = 1;
LABEL_28:
        id v4 = v64;
        goto LABEL_30;
      }
      uint64_t v30 = v14;
      uint64_t v31 = v16;
      long long v32 = (void *)MEMORY[0x1E4F6EA38];
      uint64_t v33 = objc_msgSend_loginIMHandle(v18, v27, v28, v29);
      uint64_t v37 = objc_msgSend_countryCode(v33, v34, v35, v36);
      LOBYTE(v32) = objc_msgSend_accountCountryIsCandidateForHawking_(v32, v38, (uint64_t)v37, v39);

      if (v32)
      {
        int64_t v62 = 1;
        id v8 = v65;
        goto LABEL_28;
      }
      id v43 = objc_msgSend_aliases(v18, v40, v41, v42);
      uint64_t v47 = objc_msgSend_count(v43, v44, v45, v46);

      uint64_t v16 = v31;
      if (v47)
      {
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        uint64_t v24 = objc_msgSend_aliases(v18, v48, v49, v50);
        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v51, (uint64_t)&v66, (uint64_t)v74, 16);
        uint64_t v14 = v30;
        if (v52)
        {
          uint64_t v55 = v52;
          uint64_t v56 = *(void *)v67;
          while (2)
          {
            for (uint64_t j = 0; j != v55; ++j)
            {
              if (*(void *)v67 != v56) {
                objc_enumerationMutation(v24);
              }
              if (objc_msgSend_receiverIsCandidateForHawking_(MEMORY[0x1E4F6EA38], v53, *(void *)(*((void *)&v66 + 1) + 8 * j), v54))
              {
                id v8 = v65;
                goto LABEL_26;
              }
            }
            uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v53, (uint64_t)&v66, (uint64_t)v74, 16);
            if (v55) {
              continue;
            }
            break;
          }
        }

        id v8 = v65;
      }
      else
      {
        long long v58 = (void *)MEMORY[0x1E4F6EA38];
        long long v59 = objc_msgSend_login(v18, v48, v49, v50);
        LOBYTE(v58) = objc_msgSend_receiverIsCandidateForHawking_(v58, v60, (uint64_t)v59, v61);

        id v8 = v65;
        uint64_t v14 = v30;
        if (v58) {
          goto LABEL_27;
        }
      }
    }
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v70, (uint64_t)v75, 16);
    int64_t v62 = 0;
    id v4 = v64;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_30:

LABEL_31:
  return v62;
}

- (int64_t)activeAccountsAreEligibleForAppleSMSFilter
{
  BOOL v3 = 1;
  if (objc_msgSend_receiverIsCandidateForSMSFilterWithSimSlot_(MEMORY[0x1E4F6EA38], a2, 1, v2))
  {
LABEL_6:
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Account is eligible for showing SMS Filter.", v10, 2u);
      }
    }
  }
  else
  {
    unint64_t v6 = 0;
    while (v6 != 1)
    {
      int IsCandidateForSMSFilterWithSimSlot = objc_msgSend_receiverIsCandidateForSMSFilterWithSimSlot_(MEMORY[0x1E4F6EA38], v4, v6 + 2, v5);
      ++v6;
      if (IsCandidateForSMSFilterWithSimSlot)
      {
        BOOL v3 = v6 < 2;
        goto LABEL_6;
      }
    }
    return 0;
  }
  return v3;
}

- (int64_t)activeAccountsAreEligibleForDefaultAppleSMSFilter
{
  uint64_t v3 = 1;
  while (!objc_msgSend_receiverIsCandidateForDefaultAppleSMSFilterWithSimSlot_(MEMORY[0x1E4F6EA38], a2, v3, v2))
  {
    if (++v3 == 3)
    {
      if (IMOSLoggingEnabled())
      {
        id v4 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v7 = 0;
          _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "Account is not eligible for enabling SMS Filter by default.", v7, 2u);
        }
      }
      return 0;
    }
  }
  if (IMOSLoggingEnabled())
  {
    unint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Account is eligible for enabling SMS Filter by default.", buf, 2u);
    }
  }
  return 1;
}

- (int64_t)activeAccountsAreEligibleForAppleSMSFilterSubClassification
{
  uint64_t v3 = 1;
  while (!objc_msgSend_receiverIsCandidateForAppleSMSFilterSubClassificationWithSimSlot_(MEMORY[0x1E4F6EA38], a2, v3, v2))
  {
    if (++v3 == 3)
    {
      if (IMOSLoggingEnabled())
      {
        id v4 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v7 = 0;
          _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "Account is not eligible for enabling SMS SubClassification.", v7, 2u);
        }
      }
      return 0;
    }
  }
  if (IMOSLoggingEnabled())
  {
    unint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Account is eligible for enabling SMS SubClassification.", buf, 2u);
    }
  }
  return 1;
}

@end