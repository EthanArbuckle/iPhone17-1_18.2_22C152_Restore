@interface CDPAccountNotificationPlugin
- (BOOL)_isPrimaryAccount:(id)a3;
- (unint64_t)_calculateCDPSOSCompatibilityTypeWithAccount:(id)a3;
- (void)_clearFollowUpsOnAccountDeletionWithController:(id)a3;
- (void)_processAppleAcocuntChange:(id)a3;
- (void)_processAuthKitAccountChange:(id)a3 oldAccount:(id)a4;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation CDPAccountNotificationPlugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v14 = a6;
  if (a4 == 2)
  {
    v20 = objc_msgSend_accountType(v10, v12, v13);
    v23 = objc_msgSend_identifier(v20, v21, v22);
    uint64_t v25 = objc_msgSend_compare_options_(v23, v24, *MEMORY[0x263EFAF00], 4);

    if (v25) {
      objc_msgSend__processAppleAcocuntChange_(self, v26, (uint64_t)v10);
    }
    else {
      objc_msgSend__processAuthKitAccountChange_oldAccount_(self, v26, (uint64_t)v10, v14);
    }
  }
  else if (a4 == 3 && objc_msgSend__isPrimaryAccount_(self, v12, (uint64_t)v14))
  {
    v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v14;
      _os_log_impl(&dword_240574000, v15, OS_LOG_TYPE_DEFAULT, "Primary iCloud account deletion detected, clearing follow ups for %@", (uint8_t *)&v27, 0xCu);
    }

    id v16 = objc_alloc_init(MEMORY[0x263F34390]);
    objc_msgSend__clearFollowUpsOnAccountDeletionWithController_(self, v17, (uint64_t)v16);
    v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_240574000, v18, OS_LOG_TYPE_DEFAULT, "Primary iCloud account deletion detected, post local walrus state change notification.", (uint8_t *)&v27, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"_CDPWalrusStateChangeDarwinNotification", 0, 0, 1u);
  }
}

- (BOOL)_isPrimaryAccount:(id)a3
{
  return MEMORY[0x270F9A6D0](a3, sel_aa_isAccountClass_, *MEMORY[0x263F25618]);
}

- (void)_clearFollowUpsOnAccountDeletionWithController:(id)a3
{
  v3 = (void *)MEMORY[0x263F34388];
  id v4 = a3;
  v7 = objc_msgSend_contextForStateRepair(v3, v5, v6);
  objc_msgSend_clearFollowUpWithContext_error_(v4, v8, (uint64_t)v7, 0);

  id v11 = objc_msgSend_contextForOfflinePasscodeChange(MEMORY[0x263F34388], v9, v10);
  objc_msgSend_clearFollowUpWithContext_error_(v4, v12, (uint64_t)v11, 0);

  v15 = objc_msgSend_contextForConfirmExistingSecret(MEMORY[0x263F34388], v13, v14);
  objc_msgSend_clearFollowUpWithContext_error_(v4, v16, (uint64_t)v15, 0);

  v19 = objc_msgSend_contextForRecoveryKeyRepair(MEMORY[0x263F34388], v17, v18);
  objc_msgSend_clearFollowUpWithContext_error_(v4, v20, (uint64_t)v19, 0);

  uint64_t v22 = objc_msgSend_contextForWalrusCreatePasscodeWithCDPContext_(MEMORY[0x263F34388], v21, 0);
  objc_msgSend_clearFollowUpWithContext_error_(v4, v23, (uint64_t)v22, 0);

  v26 = objc_msgSend_contextForSOSCompatibilityMode(MEMORY[0x263F34388], v24, v25);
  objc_msgSend_clearFollowUpWithContext_error_(v4, v27, (uint64_t)v26, 0);

  v30 = objc_msgSend_contextForRecoveryKeyMismatchHealing(MEMORY[0x263F34388], v28, v29);
  objc_msgSend_clearFollowUpWithContext_error_(v4, v31, (uint64_t)v30, 0);

  v34 = objc_msgSend_contextForADPStateHealing(MEMORY[0x263F34388], v32, v33);
  objc_msgSend_clearFollowUpWithContext_error_(v4, v35, (uint64_t)v34, 0);

  v38 = objc_msgSend_contextForEDPStateRepair(MEMORY[0x263F34388], v36, v37);
  objc_msgSend_clearFollowUpWithContext_error_(v4, v39, (uint64_t)v38, 0);

  objc_msgSend_contextForCDPEDPStateRepair(MEMORY[0x263F34388], v40, v41);
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearFollowUpWithContext_error_(v4, v42, (uint64_t)v43, 0);
}

- (unint64_t)_calculateCDPSOSCompatibilityTypeWithAccount:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_sharedInstance(MEMORY[0x263F290F0], v4, v5);
  v8 = objc_msgSend_hasSOSActiveDeviceForAccount_(v6, v7, (uint64_t)v3);
  unsigned int v11 = objc_msgSend_BOOLValue(v8, v9, v10);

  unint64_t v12 = v11;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = objc_msgSend_isSOSNeededForAccount_(v6, v13, (uint64_t)v3);
    int v17 = objc_msgSend_BOOLValue(v14, v15, v16);

    if (v17) {
      v12 |= 2uLL;
    }
  }

  return v12;
}

- (void)_processAuthKitAccountChange:(id)a3 oldAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F343F0]);
  unsigned int v11 = objc_msgSend_sharedInstance(MEMORY[0x263F290F0], v9, v10);
  uint64_t v13 = objc_msgSend_altDSIDForAccount_(v11, v12, (uint64_t)v6);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v15 = objc_msgSend__calculateCDPSOSCompatibilityTypeWithAccount_(self, v14, (uint64_t)v6);
    if (v15 != objc_msgSend__calculateCDPSOSCompatibilityTypeWithAccount_(self, v16, (uint64_t)v7)) {
      objc_msgSend_setKeyChainSyncCompatibilityState_withAltDSID_(v8, v17, v15, v13);
    }
  }
  else
  {
    uint64_t v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_240575E2C(v18);
    }
  }
}

- (void)_processAppleAcocuntChange:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v6 = objc_msgSend_accountType(v3, v4, v5);
  v9 = objc_msgSend_identifier(v6, v7, v8);
  uint64_t v11 = objc_msgSend_compare_options_(v9, v10, *MEMORY[0x263EFAE58], 4);

  if (v11)
  {
    uint64_t v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_240575EFC(v14);
    }
  }
  else
  {
    uint64_t v14 = objc_msgSend_aa_altDSID(v3, v12, v13);
    uint64_t v16 = objc_msgSend_setWithObjects_(MEMORY[0x263EFFA08], v15, *MEMORY[0x263EFB158], *MEMORY[0x263EFB138], *MEMORY[0x263EFB148], 0);
    v19 = objc_msgSend_dirtyProperties(v3, v17, v18);
    char v21 = objc_msgSend_intersectsSet_(v19, v20, (uint64_t)v16);
    uint64_t v22 = _CDPLogSystem();
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 141558274;
        uint64_t v27 = 1752392040;
        __int16 v28 = 2112;
        uint64_t v29 = v14;
        _os_log_impl(&dword_240574000, v23, OS_LOG_TYPE_DEFAULT, "Updating keychain sync state in response to dataclass changes for %{mask.hash}@", buf, 0x16u);
      }

      v23 = objc_msgSend_contextForAccountWithAltDSID_(MEMORY[0x263F34350], v24, (uint64_t)v14);
      objc_msgSend_synchronizeKeychainSyncForContext_withCompletion_(MEMORY[0x263F343A0], v25, (uint64_t)v23, &unk_26F4A6468);
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      sub_240575E70((uint64_t)v14, v23);
    }
  }
}

@end