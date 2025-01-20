@interface AAIDSProxyNotifier
- (BOOL)_shouldSendAccountChangeOverIDSProxy:(id)a3;
- (id)_saveOptionsForProxiedDeviceAuth;
- (void)_notifyIDSProxyOfAccount:(id)a3 store:(id)a4 withCommand:(id)a5;
- (void)_showRedirectToBridgeAlertForAccount:(id)a3;
- (void)notifyIDSProxyOfAccount:(id)a3 store:(id)a4 withCommand:(id)a5;
@end

@implementation AAIDSProxyNotifier

- (void)notifyIDSProxyOfAccount:(id)a3 store:(id)a4 withCommand:(id)a5
{
}

- (void)_notifyIDSProxyOfAccount:(id)a3 store:(id)a4 withCommand:(id)a5
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v14 = objc_msgSend__shouldSendAccountChangeOverIDSProxy_(self, v11, (uint64_t)v8, v12, v13);
  if (v10 && v14)
  {
    v15 = _AALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v111 = v10;
      _os_log_impl(&dword_240524000, v15, OS_LOG_TYPE_DEFAULT, "Sending the account through the IDS Proxy with changetype: %@", buf, 0xCu);
    }

    uint64_t v16 = *MEMORY[0x263EFB178];
    if (objc_msgSend_isEqualToString_(v10, v17, *MEMORY[0x263EFB178], v18, v19))
    {
      uint64_t v92 = v16;
      v93 = self;
      v94 = v9;
      objc_msgSend_accountsWithAccountTypeIdentifier_(v9, v20, *MEMORY[0x263EFAF00], v22, v23);
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      v24 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v106, (uint64_t)v115, 16);
      if (v26)
      {
        uint64_t v31 = v26;
        uint64_t v32 = *(void *)v107;
LABEL_8:
        uint64_t v33 = 0;
        while (1)
        {
          if (*(void *)v107 != v32) {
            objc_enumerationMutation(v24);
          }
          v34 = *(void **)(*((void *)&v106 + 1) + 8 * v33);
          v35 = objc_msgSend_aa_altDSID(v34, v27, v28, v29, v30);
          v40 = objc_msgSend_aa_altDSID(v8, v36, v37, v38, v39);
          char isEqual = objc_msgSend_isEqual_(v35, v41, (uint64_t)v40, v42, v43);

          if (isEqual) {
            break;
          }
          if (v31 == ++v33)
          {
            uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v106, (uint64_t)v115, 16);
            if (v31) {
              goto LABEL_8;
            }
            goto LABEL_14;
          }
        }
        id v51 = v34;

        if (v51) {
          goto LABEL_31;
        }
      }
      else
      {
LABEL_14:
      }
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      v52 = v24;
      uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v102, (uint64_t)v114, 16);
      if (!v54)
      {
LABEL_29:

LABEL_36:
        v84 = _AALogSystem();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v111 = v8;
          _os_log_impl(&dword_240524000, v84, OS_LOG_TYPE_DEFAULT, "No AK account matches %@.", buf, 0xCu);
        }
        id v9 = v94;
        goto LABEL_43;
      }
      uint64_t v59 = v54;
      uint64_t v60 = *(void *)v103;
      id v91 = v10;
LABEL_23:
      uint64_t v61 = 0;
      while (1)
      {
        if (*(void *)v103 != v60) {
          objc_enumerationMutation(v52);
        }
        v62 = *(void **)(*((void *)&v102 + 1) + 8 * v61);
        v63 = objc_msgSend_username(v62, v55, v56, v57, v58, v91);
        v68 = objc_msgSend_username(v8, v64, v65, v66, v67);
        char v72 = objc_msgSend_isEqual_(v63, v69, (uint64_t)v68, v70, v71);

        if (v72) {
          break;
        }
        if (v59 == ++v61)
        {
          uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v55, (uint64_t)&v102, (uint64_t)v114, 16);
          id v10 = v91;
          if (v59) {
            goto LABEL_23;
          }
          goto LABEL_29;
        }
      }
      id v51 = v62;

      id v10 = v91;
      if (!v51) {
        goto LABEL_36;
      }
LABEL_31:
      v73 = _AALogSystem();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v111 = v51;
        __int16 v112 = 2112;
        id v113 = v8;
        _os_log_impl(&dword_240524000, v73, OS_LOG_TYPE_DEFAULT, "Using AK account %@ as match for account %@", buf, 0x16u);
      }

      id v101 = 0;
      v77 = objc_msgSend_credentialWithError_(v51, v74, (uint64_t)&v101, v75, v76);
      id v78 = v101;
      v79 = _AALogSystem();
      BOOL v80 = os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT);
      if (v77)
      {
        if (v80)
        {
          *(_WORD *)buf = 0;
          v81 = "Successfully fetched AuthKit account credential. This bodes well.";
          v82 = v79;
          uint32_t v83 = 2;
LABEL_41:
          _os_log_impl(&dword_240524000, v82, OS_LOG_TYPE_DEFAULT, v81, buf, v83);
        }
      }
      else if (v80)
      {
        *(_DWORD *)buf = 138412290;
        id v111 = v78;
        v81 = "Failed to get AuthKit account credential for transferring to paired device. Error: %@";
        v82 = v79;
        uint32_t v83 = 12;
        goto LABEL_41;
      }

      id v9 = v94;
      v89 = objc_msgSend_remoteDeviceProxy(v94, v85, v86, v87, v88);
      v95[0] = MEMORY[0x263EF8330];
      v95[1] = 3221225472;
      v95[2] = sub_24052AE34;
      v95[3] = &unk_2650BEB90;
      id v96 = v51;
      id v97 = v8;
      v98 = v93;
      id v99 = v94;
      id v100 = v10;
      v84 = v51;
      objc_msgSend_sendCommand_withAccount_completion_(v89, v90, v92, (uint64_t)v84, (uint64_t)v95);

LABEL_43:
      goto LABEL_44;
    }
    if (v8)
    {
      v24 = objc_msgSend_copy(v8, v20, v21, v22, v23);
      objc_msgSend_setDirty_forProperty_(v24, v45, 0, *MEMORY[0x263EFB128], v46);
      objc_msgSend_setDirty_forProperty_(v24, v47, 0, *MEMORY[0x263EFB130], v48);
      objc_msgSend_notifyRemoteDevicesOfModifiedAccount_withChangeType_(v9, v49, (uint64_t)v24, (uint64_t)v10, v50);
LABEL_44:
    }
  }
  else if ((v14 & 1) == 0)
  {
    v24 = _AALogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v111 = v8;
      __int16 v112 = 2112;
      id v113 = v10;
      _os_log_impl(&dword_240524000, v24, OS_LOG_TYPE_DEFAULT, "Not sending data separated account %@ through the IDS Proxy for changetype: %@", buf, 0x16u);
    }
    goto LABEL_44;
  }
}

- (BOOL)_shouldSendAccountChangeOverIDSProxy:(id)a3
{
  return objc_msgSend_isDataSeparatedAccount_(MEMORY[0x263F25908], a2, (uint64_t)a3, v3, v4) ^ 1;
}

- (id)_saveOptionsForProxiedDeviceAuth
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F29108]);
  id v61 = 0;
  v6 = objc_msgSend_anisetteDataWithError_(v2, v3, (uint64_t)&v61, v4, v5);
  id v7 = v61;
  id v8 = _AALogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_240524000, v8, OS_LOG_TYPE_DEFAULT, "Creating parameterized Anisette data...", buf, 2u);
    }

    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v15 = objc_msgSend_machineID(v6, v11, v12, v13, v14);
    objc_msgSend_setObject_forKeyedSubscript_(v10, v16, (uint64_t)v15, *MEMORY[0x263F25B98], v17);

    uint64_t v22 = objc_msgSend_oneTimePassword(v6, v18, v19, v20, v21);
    objc_msgSend_setObject_forKeyedSubscript_(v10, v23, (uint64_t)v22, *MEMORY[0x263F25BA0], v24);

    v25 = NSNumber;
    uint64_t v30 = objc_msgSend_routingInfo(v6, v26, v27, v28, v29);
    v34 = objc_msgSend_numberWithUnsignedLongLong_(v25, v31, v30, v32, v33);
    objc_msgSend_setObject_forKeyedSubscript_(v10, v35, (uint64_t)v34, *MEMORY[0x263F25BA8], v36);

    v41 = objc_msgSend_currentDevice(MEMORY[0x263F291C0], v37, v38, v39, v40);
    uint64_t v46 = objc_msgSend_uniqueDeviceIdentifier(v41, v42, v43, v44, v45);
    objc_msgSend_setObject_forKeyedSubscript_(v10, v47, (uint64_t)v46, *MEMORY[0x263F25BB8], v48);

    id v8 = objc_msgSend_currentDevice(MEMORY[0x263F291C0], v49, v50, v51, v52);
    uint64_t v57 = objc_msgSend_serverFriendlyDescription(v8, v53, v54, v55, v56);
    objc_msgSend_setObject_forKeyedSubscript_(v10, v58, (uint64_t)v57, *MEMORY[0x263F25BB0], v59);
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v7;
      _os_log_impl(&dword_240524000, v8, OS_LOG_TYPE_DEFAULT, "Failed to fetch Anisette data! Error: %@", buf, 0xCu);
    }
    id v10 = 0;
  }

  return v10;
}

- (void)_showRedirectToBridgeAlertForAccount:(id)a3
{
  uint64_t v3 = NSString;
  uint64_t v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v10 = objc_msgSend_bundleForClass_(v4, v7, v6, v8, v9);
  uint64_t v12 = objc_msgSend_localizedStringForKey_value_table_(v10, v11, @"BRIDGE_LOGIN_ALERT_TITLE", (uint64_t)&stru_26F49EF88, @"Localizable");
  uint64_t v17 = objc_msgSend_username(v5, v13, v14, v15, v16);
  objc_msgSend_stringWithFormat_(v3, v18, (uint64_t)v12, v19, v20, v17);
  id v57 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v21 = NSString;
  uint64_t v22 = (void *)MEMORY[0x263F086E0];
  uint64_t v23 = objc_opt_class();
  uint64_t v27 = objc_msgSend_bundleForClass_(v22, v24, v23, v25, v26);
  uint64_t v29 = objc_msgSend_localizedStringForKey_value_table_(v27, v28, @"BRIDGE_LOGIN_ALERT_MESSAGE", (uint64_t)&stru_26F49EF88, @"Localizable");
  v34 = objc_msgSend_username(v5, v30, v31, v32, v33);

  uint64_t v38 = objc_msgSend_stringWithFormat_(v21, v35, (uint64_t)v29, v36, v37, v34);

  uint64_t v39 = (void *)MEMORY[0x263F259E0];
  uint64_t v40 = (void *)MEMORY[0x263F086E0];
  uint64_t v41 = objc_opt_class();
  uint64_t v45 = objc_msgSend_bundleForClass_(v40, v42, v41, v43, v44);
  v47 = objc_msgSend_localizedStringForKey_value_table_(v45, v46, @"BRIDGE_LOGIN_ALERT_CANCEL", (uint64_t)&stru_26F49EF88, @"Localizable");
  uint64_t v48 = (void *)MEMORY[0x263F086E0];
  uint64_t v49 = objc_opt_class();
  v53 = objc_msgSend_bundleForClass_(v48, v50, v49, v51, v52);
  uint64_t v55 = objc_msgSend_localizedStringForKey_value_table_(v53, v54, @"BRIDGE_LOGIN_ALERT_OK", (uint64_t)&stru_26F49EF88, @"Localizable");
  objc_msgSend_showUserNotificationWithTitle_message_cancelButtonTitle_otherButtonTitle_withCompletionBlock_(v39, v56, (uint64_t)v57, (uint64_t)v38, (uint64_t)v47, v55, &unk_26F49EC28);
}

@end