@interface AAAccountNotificationFollowUpController
+ (id)_secondaryAccountTypes;
- (AAAccountNotificationFollowUpController)init;
- (BOOL)_didAddAccount:(id)a3 oldAccount:(id)a4;
- (BOOL)_didDeleteAccount:(id)a3 oldAccount:(id)a4;
- (void)_dismissStartUsingFollowUp;
- (void)_updateStartUsingiCloudFollowupForAccountStore:(id)a3 account:(id)a4 oldAccount:(id)a5;
- (void)_updateVerifyTermsFollowupForAccountStore:(id)a3 account:(id)a4 oldAccount:(id)a5;
- (void)dismissAllFollowupsForAccount:(id)a3;
- (void)updateStartUsingiCloudFollowupForAccountStore:(id)a3 account:(id)a4 oldAccount:(id)a5;
- (void)updateVerifyTermsFollowupForAccountStore:(id)a3 account:(id)a4 oldAccount:(id)a5;
@end

@implementation AAAccountNotificationFollowUpController

- (AAAccountNotificationFollowUpController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AAAccountNotificationFollowUpController;
  v2 = [(AAAccountNotificationFollowUpController *)&v6 init];
  if (v2)
  {
    v3 = (AAFollowUpController *)objc_alloc_init(MEMORY[0x263F25868]);
    followUpController = v2->_followUpController;
    v2->_followUpController = v3;
  }
  return v2;
}

- (void)updateStartUsingiCloudFollowupForAccountStore:(id)a3 account:(id)a4 oldAccount:(id)a5
{
}

- (void)updateVerifyTermsFollowupForAccountStore:(id)a3 account:(id)a4 oldAccount:(id)a5
{
}

- (void)dismissAllFollowupsForAccount:(id)a3
{
}

- (void)_updateStartUsingiCloudFollowupForAccountStore:(id)a3 account:(id)a4 oldAccount:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15 = v10;
  if (v9) {
    id v10 = v9;
  }
  v16 = objc_msgSend_accountType(v10, v11, v12, v13, v14);
  v21 = objc_msgSend_identifier(v16, v17, v18, v19, v20);

  uint64_t v22 = *MEMORY[0x263F25618];
  if (objc_msgSend_aa_isAccountClass_(v9, v23, *MEMORY[0x263F25618], v24, v25)
    && (objc_msgSend_aa_isAccountClass_(v15, v26, v22, v27, v28) & 1) == 0)
  {
    v29 = _AALogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_240524000, v29, OS_LOG_TYPE_DEFAULT, "Notification Plugin (didChangeWithType): iCloud account added or became primary", buf, 2u);
    }

    objc_msgSend__dismissStartUsingFollowUp(self, v30, v31, v32, v33);
  }
  if (objc_msgSend__didAddAccount_oldAccount_(self, v26, (uint64_t)v9, (uint64_t)v15, v28))
  {
    v36 = objc_opt_class();
    v41 = objc_msgSend__secondaryAccountTypes(v36, v37, v38, v39, v40);
    int v45 = objc_msgSend_containsObject_(v41, v42, (uint64_t)v21, v43, v44);

    if (v45)
    {
      v46 = _AALogSystem();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_240524000, v46, OS_LOG_TYPE_DEFAULT, "Spyglass account type added, looking for primary apple account...", buf, 2u);
      }

      v75[0] = MEMORY[0x263EF8330];
      v75[1] = 3221225472;
      v75[2] = sub_24052DBE8;
      v75[3] = &unk_2650BED70;
      v75[4] = self;
      objc_msgSend_aa_primaryAppleAccountWithCompletion_(v8, v47, (uint64_t)v75, v48, v49);
    }
  }
  if (objc_msgSend__didDeleteAccount_oldAccount_(self, v34, (uint64_t)v9, (uint64_t)v15, v35))
  {
    v50 = objc_opt_class();
    v55 = objc_msgSend__secondaryAccountTypes(v50, v51, v52, v53, v54);
    int v59 = objc_msgSend_containsObject_(v55, v56, (uint64_t)v21, v57, v58);

    if (v59)
    {
      v60 = _AALogSystem();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_240524000, v60, OS_LOG_TYPE_DEFAULT, "Detected secondary account deletion, determining if we should remove StartUsing follow up...", buf, 2u);
      }

      v61 = objc_opt_class();
      v66 = objc_msgSend__secondaryAccountTypes(v61, v62, v63, v64, v65);
      v71 = objc_msgSend_allObjects(v66, v67, v68, v69, v70);
      v74[0] = MEMORY[0x263EF8330];
      v74[1] = 3221225472;
      v74[2] = sub_24052DD0C;
      v74[3] = &unk_2650BED98;
      v74[4] = self;
      objc_msgSend_accountsWithAccountTypeIdentifiers_completion_(v8, v72, (uint64_t)v71, (uint64_t)v74, v73);
    }
  }
}

- (void)_updateVerifyTermsFollowupForAccountStore:(id)a3 account:(id)a4 oldAccount:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v50 = MEMORY[0x263EF8330];
  uint64_t v51 = 3221225472;
  uint64_t v52 = sub_24052E250;
  uint64_t v53 = &unk_2650BECB8;
  id v11 = v8;
  id v54 = v11;
  v55 = self;
  uint64_t v12 = (void (**)(void))MEMORY[0x2455EA840](&v50);
  if (objc_msgSend_aa_needsToVerifyTerms(v9, v13, v14, v15, v16, v50, v51, v52, v53)) {
    int v21 = objc_msgSend_aa_needsToVerifyTerms(v10, v17, v18, v19, v20) ^ 1;
  }
  else {
    int v21 = 0;
  }
  if (objc_msgSend_aa_hasOptionalTerms(v9, v17, v18, v19, v20)) {
    int v26 = objc_msgSend_aa_hasOptionalTerms(v10, v22, v23, v24, v25) ^ 1;
  }
  else {
    int v26 = 0;
  }
  if ((v21 | v26) == 1)
  {
    uint64_t v27 = _AALogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_240524000, v27, OS_LOG_TYPE_DEFAULT, "Notification Plugin (didChangeWithType): needs to verify terms", buf, 2u);
    }

    objc_msgSend_postFollowUpWithIdentifier_forAccount_userInfo_completion_(self->_followUpController, v28, *MEMORY[0x263F256A0], (uint64_t)v9, 0, 0);
  }
  if (objc_msgSend_aa_needsToVerifyTerms(v9, v22, v23, v24, v25)) {
    int hasOptionalTerms = 1;
  }
  else {
    int hasOptionalTerms = objc_msgSend_aa_hasOptionalTerms(v9, v29, v30, v31, v32);
  }
  if (objc_msgSend_aa_needsToVerifyTerms(v10, v29, v30, v31, v32))
  {
    int v38 = 1;
    if (!v9) {
      goto LABEL_27;
    }
  }
  else
  {
    int v38 = objc_msgSend_aa_hasOptionalTerms(v10, v34, v35, v36, v37);
    if (!v9) {
      goto LABEL_27;
    }
  }
  if (hasOptionalTerms != v38)
  {
    uint64_t v39 = _AALogSystem();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v44 = objc_msgSend_username(v9, v40, v41, v42, v43);
      int v45 = (void *)v44;
      v46 = @"NO";
      if (v38) {
        v47 = @"YES";
      }
      else {
        v47 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v57 = v44;
      int v59 = v47;
      __int16 v58 = 2112;
      if (hasOptionalTerms) {
        v46 = @"YES";
      }
      __int16 v60 = 2112;
      v61 = v46;
      _os_log_impl(&dword_240524000, v39, OS_LOG_TYPE_DEFAULT, "Terms changed for %@ from %@ to %@", buf, 0x20u);
    }
  }
LABEL_27:
  if (((v38 ^ 1 | hasOptionalTerms) & 1) == 0)
  {
    uint64_t v48 = _AALogSystem();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_240524000, v48, OS_LOG_TYPE_DEFAULT, "Notification Plugin (didChangeWithType): terms verified", buf, 2u);
    }

    v12[2](v12);
  }
  if (objc_msgSend__didDeleteAccount_oldAccount_(self, v34, (uint64_t)v9, (uint64_t)v10, v37))
  {
    uint64_t v49 = _AALogSystem();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_240524000, v49, OS_LOG_TYPE_DEFAULT, "Notification Plugin (didChangeWithType): did delete account", buf, 2u);
    }

    v12[2](v12);
  }
}

- (void)_dismissStartUsingFollowUp
{
  objc_msgSend_dismissFollowUpWithIdentifier_completion_(self->_followUpController, a2, *MEMORY[0x263F25698], 0, v2);
  MEMORY[0x270F9A6D0](AABridgeFollowUpController, sel_dismissBridgeAppleIDFollowUp, v3, v4, v5);
}

+ (id)_secondaryAccountTypes
{
  if (qword_268C87C10 != -1) {
    dispatch_once(&qword_268C87C10, &unk_26F49ECA8);
  }
  uint64_t v2 = (void *)qword_268C87C08;
  return v2;
}

- (BOOL)_didAddAccount:(id)a3 oldAccount:(id)a4
{
  id v5 = a4;
  if (objc_msgSend_isActive(a3, v6, v7, v8, v9)) {
    int v14 = objc_msgSend_isActive(v5, v10, v11, v12, v13) ^ 1;
  }
  else {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (BOOL)_didDeleteAccount:(id)a3 oldAccount:(id)a4
{
  id v5 = a4;
  if (objc_msgSend_isActive(a3, v6, v7, v8, v9)) {
    char isActive = 0;
  }
  else {
    char isActive = objc_msgSend_isActive(v5, v10, v11, v12, v13);
  }

  return isActive;
}

- (void).cxx_destruct
{
}

@end