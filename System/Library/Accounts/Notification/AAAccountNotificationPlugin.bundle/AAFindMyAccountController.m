@interface AAFindMyAccountController
+ (id)_findOrphanedAccountForAccountType:(id)a3 forAppleAccount:(id)a4 withStore:(id)a5;
+ (void)addDeviceLocatorChildAccountToAppleAccount:(id)a3;
+ (void)addFMFChildAccountToAppleAccount:(id)a3;
+ (void)updateDeviceLocatorChildAccountForAppleAccount:(id)a3;
+ (void)updateFMFChildAccountForAppleAccount:(id)a3;
@end

@implementation AAFindMyAccountController

+ (void)addFMFChildAccountToAppleAccount:(id)a3
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9 = objc_msgSend_defaultStore(MEMORY[0x263EFB210], v5, v6, v7, v8);
  v13 = objc_msgSend_accountTypeWithAccountTypeIdentifier_(v9, v10, *MEMORY[0x263EFAED0], v11, v12);
  id v14 = objc_alloc(MEMORY[0x263EFB1F8]);
  v18 = objc_msgSend_initWithAccountType_(v14, v15, (uint64_t)v13, v16, v17);
  v23 = objc_msgSend_username(v4, v19, v20, v21, v22);
  v27 = objc_msgSend_aa_appleAccountWithUsername_(v9, v24, (uint64_t)v23, v25, v26);

  if (v27)
  {
    v32 = objc_msgSend__findOrphanedAccountForAccountType_forAppleAccount_withStore_(a1, v28, (uint64_t)v13, (uint64_t)v27, (uint64_t)v9);
    v75 = v13;
    if (v32)
    {
      v33 = _AALogSystem();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v79 = v32;
        _os_log_impl(&dword_240524000, v33, OS_LOG_TYPE_DEFAULT, "Looks like we found an orphaned find my friends account: %@", buf, 0xCu);
      }

      v34 = v32;
      v18 = v34;
    }
    objc_msgSend_setParentAccount_(v18, v29, (uint64_t)v27, v30, v31);
    v39 = objc_msgSend_username(v27, v35, v36, v37, v38);
    objc_msgSend_setUsername_(v18, v40, (uint64_t)v39, v41, v42);

    id v76 = v4;
    v47 = objc_msgSend_credential(v4, v43, v44, v45, v46);
    uint64_t v48 = *MEMORY[0x263EFB0A0];
    uint64_t v52 = objc_msgSend_credentialItemForKey_(v47, v49, *MEMORY[0x263EFB0A0], v50, v51);
    uint64_t v53 = *MEMORY[0x263EFB098];
    uint64_t v59 = objc_msgSend_credentialItemForKey_(v47, v54, *MEMORY[0x263EFB098], v55, v56);
    if (v52 | v59)
    {
      v60 = _AALogSystem();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = @"NO";
        if (v52) {
          v62 = @"YES";
        }
        else {
          v62 = @"NO";
        }
        if (v59) {
          v61 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v79 = v62;
        __int16 v80 = 2112;
        v81 = v61;
        _os_log_impl(&dword_240524000, v60, OS_LOG_TYPE_DEFAULT, "Got FMF (%@) or app (%@) tokens, creating FMF child account", buf, 0x16u);
      }

      id v63 = objc_alloc_init(MEMORY[0x263EFB200]);
      objc_msgSend_setCredentialItem_forKey_(v63, v64, v59, v53, v65);
      objc_msgSend_setCredentialItem_forKey_(v63, v66, v52, v48, v67);
      objc_msgSend_setCredential_(v18, v68, (uint64_t)v63, v69, v70);
    }
    id v77 = 0;
    int v71 = objc_msgSend_saveVerifiedAccount_error_(v9, v57, (uint64_t)v18, (uint64_t)&v77, v58);
    v72 = (__CFString *)v77;
    v73 = _AALogSystem();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = @"NO";
      if (v71) {
        v74 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v79 = v74;
      __int16 v80 = 2112;
      v81 = v72;
      _os_log_impl(&dword_240524000, v73, OS_LOG_TYPE_DEFAULT, "FMF child account added successfully (%@) with error: %@", buf, 0x16u);
    }

    v13 = v75;
    id v4 = v76;
  }
  else
  {
    v32 = _AALogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_24052E5E0((uint64_t)v4, v32);
    }
  }
}

+ (void)updateFMFChildAccountForAppleAccount:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v8 = objc_msgSend_credential(v3, v4, v5, v6, v7);
  uint64_t v9 = *MEMORY[0x263EFB0A0];
  v13 = objc_msgSend_credentialItemForKey_(v8, v10, *MEMORY[0x263EFB0A0], v11, v12);
  uint64_t v14 = *MEMORY[0x263EFB098];
  v18 = objc_msgSend_credentialItemForKey_(v8, v15, *MEMORY[0x263EFB098], v16, v17);
  uint64_t v22 = objc_msgSend_childAccountsWithAccountTypeIdentifier_(v3, v19, *MEMORY[0x263EFAED0], v20, v21);
  v27 = objc_msgSend_firstObject(v22, v23, v24, v25, v26);

  v32 = objc_msgSend_credential(v27, v28, v29, v30, v31);
  uint64_t v36 = objc_msgSend_credentialItemForKey_(v32, v33, v9, v34, v35);
  v40 = objc_msgSend_credentialItemForKey_(v32, v37, v14, v38, v39);
  if (!objc_msgSend_isEqualToString_(v36, v41, (uint64_t)v13, v42, v43)
    || (objc_msgSend_isEqualToString_(v40, v44, (uint64_t)v18, v46, v47) & 1) == 0)
  {
    uint64_t v67 = v40;
    if (objc_msgSend_isAuthenticated(v3, v44, v45, v46, v47)) {
      objc_msgSend_setAuthenticated_(v27, v48, 1, v49, v50);
    }
    uint64_t v51 = _AALogSystem();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v52 = @"YES";
      if (v13) {
        uint64_t v53 = @"YES";
      }
      else {
        uint64_t v53 = @"NO";
      }
      if (!v18) {
        uint64_t v52 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v70 = v53;
      __int16 v71 = 2112;
      v72 = v52;
      _os_log_impl(&dword_240524000, v51, OS_LOG_TYPE_DEFAULT, "Updating FMF account's FMF (%@) and app (%@) tokens", buf, 0x16u);
    }

    if (v18)
    {
      objc_msgSend_setCredentialItem_forKey_(v32, v54, (uint64_t)v18, v14, v55);
      if (!v13) {
        goto LABEL_17;
      }
    }
    else if (!v13)
    {
      uint64_t v59 = _AALogSystem();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_240524000, v59, OS_LOG_TYPE_DEFAULT, "No change to FMF child account", buf, 2u);
      }
      goto LABEL_22;
    }
    objc_msgSend_setCredentialItem_forKey_(v32, v54, (uint64_t)v13, v9, v55);
LABEL_17:
    v66 = v8;
    uint64_t v58 = v36;
    uint64_t v59 = objc_msgSend_defaultStore(MEMORY[0x263EFB210], v54, v56, v57, v55);
    id v68 = 0;
    int v62 = objc_msgSend_saveVerifiedAccount_error_(v59, v60, (uint64_t)v27, (uint64_t)&v68, v61);
    id v63 = (__CFString *)v68;
    v64 = _AALogSystem();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v65 = @"NO";
      if (v62) {
        uint64_t v65 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v70 = v65;
      __int16 v71 = 2112;
      v72 = v63;
      _os_log_impl(&dword_240524000, v64, OS_LOG_TYPE_DEFAULT, "FMF child account updated successfully (%@) with error: %@", buf, 0x16u);
    }

    uint64_t v36 = v58;
    uint64_t v8 = v66;
LABEL_22:
    v40 = v67;
  }
}

+ (id)_findOrphanedAccountForAccountType:(id)a3 forAppleAccount:(id)a4 withStore:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  v13 = objc_msgSend_accountsWithAccountType_(a5, v10, (uint64_t)v9, v11, v12);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_240529CF8;
  v21[3] = &unk_2650BEB40;
  id v22 = v8;
  id v23 = v9;
  id v14 = v8;
  id v15 = v9;
  v19 = objc_msgSend_aaf_firstObjectPassingTest_(v13, v16, (uint64_t)v21, v17, v18);

  return v19;
}

+ (void)addDeviceLocatorChildAccountToAppleAccount:(id)a3
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v9 = objc_msgSend_defaultStore(MEMORY[0x263EFB210], v5, v6, v7, v8);
  v13 = objc_msgSend_accountTypeWithAccountTypeIdentifier_(v9, v10, *MEMORY[0x263EFAEA8], v11, v12);
  id v14 = objc_alloc(MEMORY[0x263EFB1F8]);
  uint64_t v18 = objc_msgSend_initWithAccountType_(v14, v15, (uint64_t)v13, v16, v17);
  id v23 = objc_msgSend_username(v4, v19, v20, v21, v22);
  v27 = objc_msgSend_aa_appleAccountWithUsername_(v9, v24, (uint64_t)v23, v25, v26);

  if (v27)
  {
    uint64_t v29 = objc_msgSend__findOrphanedAccountForAccountType_forAppleAccount_withStore_(a1, v28, (uint64_t)v13, (uint64_t)v27, (uint64_t)v9);
    v104 = v29;
    v105 = v13;
    if (v29)
    {
      v33 = (__CFString *)v29;
      uint64_t v34 = _AALogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v109 = v33;
        _os_log_impl(&dword_240524000, v34, OS_LOG_TYPE_DEFAULT, "Looks like we found an orphaned device locator account: %@", buf, 0xCu);
      }

      uint64_t v35 = v33;
      uint64_t v18 = v35;
    }
    objc_msgSend_setParentAccount_(v18, v30, (uint64_t)v27, v31, v32);
    v40 = objc_msgSend_username(v27, v36, v37, v38, v39);
    objc_msgSend_setUsername_(v18, v41, (uint64_t)v40, v42, v43);

    uint64_t v48 = objc_msgSend_credential(v4, v44, v45, v46, v47);
    id v49 = objc_alloc_init(MEMORY[0x263EFB200]);
    uint64_t v57 = objc_msgSend_findMyiPhoneToken(v48, v50, v51, v52, v53);
    if (v57)
    {
      uint64_t v58 = _AALogSystem();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_240524000, v58, OS_LOG_TYPE_DEFAULT, "Got an FMIP token, creating device locator child account", buf, 2u);
      }

      objc_msgSend_setToken_(v49, v59, v57, v60, v61);
    }
    uint64_t v62 = *MEMORY[0x263EFB0B0];
    uint64_t v63 = objc_msgSend_credentialItemForKey_(v48, v54, *MEMORY[0x263EFB0B0], v55, v56);
    v64 = _AALogSystem();
    BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
    uint64_t v101 = v63;
    if (v63)
    {
      if (v65)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_240524000, v64, OS_LOG_TYPE_DEFAULT, "Setting FMIP Siri token...", buf, 2u);
      }

      objc_msgSend_setCredentialItem_forKey_(v49, v66, v63, v62, v67, v63);
    }
    else
    {
      if (v65)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_240524000, v64, OS_LOG_TYPE_DEFAULT, "No FMIP Siri token was found!", buf, 2u);
      }
    }
    uint64_t v72 = *MEMORY[0x263EFB1D8];
    uint64_t v73 = objc_msgSend_credentialItemForKey_(v48, v68, *MEMORY[0x263EFB1D8], v69, v70, v101);
    v74 = _AALogSystem();
    BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);
    v106 = v4;
    if (v73)
    {
      if (v75)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_240524000, v74, OS_LOG_TYPE_DEFAULT, "Setting SearchParty token...", buf, 2u);
      }

      objc_msgSend_setCredentialItem_forKey_(v49, v76, (uint64_t)v73, v72, v77);
    }
    else
    {
      if (v75)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_240524000, v74, OS_LOG_TYPE_DEFAULT, "No SearchParty token was found!", buf, 2u);
      }
    }
    uint64_t v81 = *MEMORY[0x263EFB0A8];
    uint64_t v82 = objc_msgSend_credentialItemForKey_(v48, v78, *MEMORY[0x263EFB0A8], v79, v80);
    v83 = _AALogSystem();
    BOOL v84 = os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT);
    v103 = (void *)v57;
    if (v82)
    {
      if (v84)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_240524000, v83, OS_LOG_TYPE_DEFAULT, "Setting FMIP App token...", buf, 2u);
      }

      objc_msgSend_setCredentialItem_forKey_(v49, v85, (uint64_t)v82, v81, v86);
    }
    else
    {
      if (v84)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_240524000, v83, OS_LOG_TYPE_DEFAULT, "No FMIP App token was found!", buf, 2u);
      }
    }
    objc_msgSend_setCredential_(v18, v87, (uint64_t)v49, v88, v89);
    if (objc_msgSend_isAuthenticated(v106, v90, v91, v92, v93)) {
      objc_msgSend_setAuthenticated_(v18, v94, 1, v95, v96);
    }
    id v107 = 0;
    int v97 = objc_msgSend_saveVerifiedAccount_error_(v9, v94, (uint64_t)v18, (uint64_t)&v107, v96);
    id v98 = v107;
    v99 = _AALogSystem();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      v100 = @"NO";
      if (v97) {
        v100 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v109 = v100;
      __int16 v110 = 2112;
      id v111 = v98;
      _os_log_impl(&dword_240524000, v99, OS_LOG_TYPE_DEFAULT, "Device locator child account added successfully (%@) with error: %@", buf, 0x16u);
    }

    v13 = v105;
    id v4 = v106;
    __int16 v71 = v104;
  }
  else
  {
    __int16 v71 = _AALogSystem();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
      sub_24052E5E0((uint64_t)v4, v71);
    }
  }
}

+ (void)updateDeviceLocatorChildAccountForAppleAccount:(id)a3
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_childAccountsWithAccountTypeIdentifier_(v3, v4, *MEMORY[0x263EFAEA8], v5, v6);
  objc_msgSend_firstObject(v7, v8, v9, v10, v11);
  uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v87 = v3;
  uint64_t v17 = objc_msgSend_credential(v3, v13, v14, v15, v16);
  uint64_t v18 = *MEMORY[0x263EFB0B8];
  uint64_t v22 = objc_msgSend_credentialItemForKey_(v17, v19, *MEMORY[0x263EFB0B8], v20, v21);
  uint64_t v23 = *MEMORY[0x263EFB0A8];
  v27 = objc_msgSend_credentialItemForKey_(v17, v24, *MEMORY[0x263EFB0A8], v25, v26);
  uint64_t v28 = *MEMORY[0x263EFB0B0];
  uint64_t v32 = objc_msgSend_credentialItemForKey_(v17, v29, *MEMORY[0x263EFB0B0], v30, v31);
  uint64_t v33 = *MEMORY[0x263EFB1D8];
  uint64_t v37 = objc_msgSend_credentialItemForKey_(v17, v34, *MEMORY[0x263EFB1D8], v35, v36);
  uint64_t v88 = v12;
  uint64_t v42 = objc_msgSend_credential(v12, v38, v39, v40, v41);
  uint64_t v46 = objc_msgSend_credentialItemForKey_(v42, v43, v18, v44, v45);
  uint64_t v86 = objc_msgSend_credentialItemForKey_(v42, v47, v23, v48, v49);
  v85 = objc_msgSend_credentialItemForKey_(v42, v50, v28, v51, v52);
  BOOL v84 = objc_msgSend_credentialItemForKey_(v42, v53, v33, v54, v55);
  if (!objc_msgSend_isEqualToString_(v46, v56, (uint64_t)v22, v57, v58)
    || !objc_msgSend_isEqualToString_(v86, v59, (uint64_t)v27, v61, v62)
    || !objc_msgSend_isEqualToString_(v85, v59, (uint64_t)v32, v61, v62)
    || (objc_msgSend_isEqualToString_(v84, v59, (uint64_t)v37, v61, v62) & 1) == 0)
  {
    v83 = v46;
    if (objc_msgSend_isAuthenticated(v87, v59, v60, v61, v62)) {
      objc_msgSend_setAuthenticated_(v88, v63, 1, v64, v65);
    }
    v66 = _AALogSystem();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v67 = @"YES";
      if (v22) {
        id v68 = @"YES";
      }
      else {
        id v68 = @"NO";
      }
      *(_DWORD *)buf = 138413314;
      uint64_t v91 = v88;
      if (v27) {
        uint64_t v69 = @"YES";
      }
      else {
        uint64_t v69 = @"NO";
      }
      __int16 v92 = 2112;
      uint64_t v93 = v68;
      if (v32) {
        uint64_t v70 = @"YES";
      }
      else {
        uint64_t v70 = @"NO";
      }
      __int16 v94 = 2112;
      uint64_t v95 = v69;
      if (!v37) {
        uint64_t v67 = @"NO";
      }
      __int16 v96 = 2112;
      int v97 = v70;
      __int16 v98 = 2112;
      v99 = v67;
      _os_log_impl(&dword_240524000, v66, OS_LOG_TYPE_DEFAULT, "Updating device locator account (%@) tokens FMIP (%@), app (%@), Siri (%@), and SearchParty (%@) tokens", buf, 0x34u);
    }

    BOOL v75 = v22 != 0;
    if (v22) {
      objc_msgSend_setToken_(v42, v71, (uint64_t)v22, v73, v74);
    }
    if (v27)
    {
      objc_msgSend_setCredentialItem_forKey_(v42, v71, (uint64_t)v27, v23, v74);
      BOOL v75 = 1;
    }
    if (v32)
    {
      objc_msgSend_setCredentialItem_forKey_(v42, v71, (uint64_t)v32, v28, v74);
      if (!v37) {
        goto LABEL_29;
      }
    }
    else if (!v37)
    {
      if (!v75)
      {
        id v76 = _AALogSystem();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_240524000, v76, OS_LOG_TYPE_DEFAULT, "No change to device locator account", buf, 2u);
        }
        goto LABEL_34;
      }
LABEL_29:
      id v76 = objc_msgSend_defaultStore(MEMORY[0x263EFB210], v71, v72, v73, v74);
      id v89 = 0;
      int v79 = objc_msgSend_saveVerifiedAccount_error_(v76, v77, (uint64_t)v88, (uint64_t)&v89, v78);
      uint64_t v80 = (__CFString *)v89;
      uint64_t v81 = _AALogSystem();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v82 = @"NO";
        if (v79) {
          uint64_t v82 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v91 = v82;
        __int16 v92 = 2112;
        uint64_t v93 = v80;
        _os_log_impl(&dword_240524000, v81, OS_LOG_TYPE_DEFAULT, "Device locator child account updated successfully (%@) with error: %@", buf, 0x16u);
      }

LABEL_34:
      uint64_t v46 = v83;

      goto LABEL_35;
    }
    objc_msgSend_setCredentialItem_forKey_(v42, v71, (uint64_t)v37, v33, v74);
    goto LABEL_29;
  }
LABEL_35:
}

@end