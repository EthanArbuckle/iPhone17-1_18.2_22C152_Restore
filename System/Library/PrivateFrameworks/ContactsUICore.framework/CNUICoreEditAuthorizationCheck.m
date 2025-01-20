@interface CNUICoreEditAuthorizationCheck
+ (BOOL)isAuthorizationPasscodeEnabledOnDevice;
+ (id)containerProviderWithContactStore:(id)a3;
+ (id)log;
- (BOOL)authorizationPasscodeEnabledOnDevice;
- (BOOL)canPerformValidAuthorizationCheck;
- (BOOL)editAltersRestrictedInformation;
- (BOOL)ignoresParentalRestrictions;
- (BOOL)shouldBypassRestrictionsGivenAuthorizationResult:(int64_t)a3;
- (BOOL)shouldPromptForPasscodeAuthorization;
- (BOOL)shouldRespectParentalRestrictions;
- (CNContact)contact;
- (CNContainer)parentContainer;
- (CNUICoreEditAuthorizationCheck)initWithContact:(id)a3 parentContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5;
- (CNUICoreEditAuthorizationCheck)initWithContact:(id)a3 parentContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5 linkedParentContainerProvider:(id)a6;
- (CNUICoreEditAuthorizationCheck)initWithContact:(id)a3 parentContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5 screenTimePasscodeStatusCheck:(id)a6 linkedParentContainerProvider:(id)a7;
- (CNUICoreParentContainerProvider)linkedParentContainerProvider;
- (CNUICoreScreentimePasscodeCheck)screenTimePasscodeStatusCheck;
@end

@implementation CNUICoreEditAuthorizationCheck

+ (id)log
{
  if (log_cn_once_token_1_4 != -1) {
    dispatch_once(&log_cn_once_token_1_4, &__block_literal_global_63);
  }
  v2 = (void *)log_cn_once_object_1_4;
  return v2;
}

uint64_t __37__CNUICoreEditAuthorizationCheck_log__block_invoke()
{
  log_cn_once_object_1_4 = (uint64_t)os_log_create("com.apple.contactsui", "passcode");
  return MEMORY[0x270F9A758]();
}

+ (BOOL)isAuthorizationPasscodeEnabledOnDevice
{
  v2 = objc_alloc_init(CNUICoreScreentimePasscodeInspector);
  BOOL v3 = [(CNUICoreScreentimePasscodeInspector *)v2 screentimePasscodeStatus] == 2;

  return v3;
}

+ (id)containerProviderWithContactStore:(id)a3
{
  id v3 = a3;
  v4 = [[CNUICoreContactStoreProductionFacade alloc] initWithContactStore:v3];

  return v4;
}

- (CNUICoreEditAuthorizationCheck)initWithContact:(id)a3 parentContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = (objc_class *)MEMORY[0x263EFEA58];
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  v12 = objc_alloc_init(CNUICoreScreentimePasscodeInspector);
  v13 = [(id)objc_opt_class() containerProviderWithContactStore:v11];
  v14 = [(CNUICoreEditAuthorizationCheck *)self initWithContact:v10 parentContainer:v9 ignoresParentalRestrictions:v5 screenTimePasscodeStatusCheck:v12 linkedParentContainerProvider:v13];

  return v14;
}

- (CNUICoreEditAuthorizationCheck)initWithContact:(id)a3 parentContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5 linkedParentContainerProvider:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(CNUICoreScreentimePasscodeInspector);
  v14 = [(CNUICoreEditAuthorizationCheck *)self initWithContact:v12 parentContainer:v11 ignoresParentalRestrictions:v6 screenTimePasscodeStatusCheck:v13 linkedParentContainerProvider:v10];

  return v14;
}

- (CNUICoreEditAuthorizationCheck)initWithContact:(id)a3 parentContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5 screenTimePasscodeStatusCheck:(id)a6 linkedParentContainerProvider:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CNUICoreEditAuthorizationCheck;
  v17 = [(CNUICoreEditAuthorizationCheck *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contact, a3);
    objc_storeStrong((id *)&v18->_parentContainer, a4);
    v18->_ignoresParentalRestrictions = a5;
    objc_storeStrong((id *)&v18->_screenTimePasscodeStatusCheck, a6);
    objc_storeStrong((id *)&v18->_linkedParentContainerProvider, a7);
    v19 = v18;
  }

  return v18;
}

- (BOOL)shouldPromptForPasscodeAuthorization
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_20B704000, v3, OS_LOG_TYPE_INFO, "- will check if editing contact requires passcode authorization -", (uint8_t *)v13, 2u);
  }

  if (![(CNUICoreEditAuthorizationCheck *)self canPerformValidAuthorizationCheck])
  {
    v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      id v9 = "- can't determine if editing contact requires passcode authorization -";
      id v10 = v7;
      uint32_t v11 = 2;
LABEL_13:
      _os_log_impl(&dword_20B704000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)v13, v11);
    }
LABEL_14:
    BOOL v8 = 0;
    goto LABEL_15;
  }
  BOOL v4 = [(CNUICoreEditAuthorizationCheck *)self shouldRespectParentalRestrictions];
  BOOL v5 = [(CNUICoreEditAuthorizationCheck *)self editAltersRestrictedInformation];
  BOOL v6 = v5;
  if (!v4
    || !v5
    || ![(CNUICoreEditAuthorizationCheck *)self authorizationPasscodeEnabledOnDevice])
  {
    v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109632;
      v13[1] = v4;
      __int16 v14 = 1024;
      BOOL v15 = v6;
      __int16 v16 = 1024;
      int v17 = 0;
      id v9 = "- should not show authorization prompt (%hhd,%hhd,%hhd) -";
      id v10 = v7;
      uint32_t v11 = 20;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v7 = [(id)objc_opt_class() log];
  BOOL v8 = 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_20B704000, v7, OS_LOG_TYPE_INFO, "- should show authorization prompt -", (uint8_t *)v13, 2u);
  }
LABEL_15:

  return v8;
}

- (BOOL)shouldBypassRestrictionsGivenAuthorizationResult:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl(&dword_20B704000, v5, OS_LOG_TYPE_INFO, "- will check if should bypass restrictions when saving -", (uint8_t *)v12, 2u);
  }

  if (![(CNUICoreEditAuthorizationCheck *)self canPerformValidAuthorizationCheck])
  {
    BOOL v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12[0]) = 0;
      id v9 = "- can't determine if bypass of restrictions should be allowed -";
      goto LABEL_14;
    }
LABEL_15:
    BOOL v10 = 0;
    goto LABEL_16;
  }
  if (![(CNUICoreEditAuthorizationCheck *)self editAltersRestrictedInformation])
  {
    BOOL v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12[0]) = 0;
      id v9 = "- should not bypass restrictions when saving because info isn't restricted-";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  int v6 = 0;
  int v7 = ![(CNUICoreEditAuthorizationCheck *)self shouldRespectParentalRestrictions];
  if (a3 != 2 && (v7 & 1) == 0)
  {
    if ([(CNUICoreEditAuthorizationCheck *)self authorizationPasscodeEnabledOnDevice])
    {
      BOOL v8 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12[0]) = 0;
        id v9 = "- should not bypass restrictions when saving -";
LABEL_14:
        _os_log_impl(&dword_20B704000, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)v12, 2u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    int v6 = 1;
  }
  BOOL v8 = [(id)objc_opt_class() log];
  BOOL v10 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12[0] = 67109632;
    v12[1] = v7;
    __int16 v13 = 1024;
    BOOL v14 = a3 == 2;
    __int16 v15 = 1024;
    int v16 = v6;
    _os_log_impl(&dword_20B704000, v8, OS_LOG_TYPE_INFO, "- should bypass restrictions when saving (%hhd,%hhd,%hhd) -", (uint8_t *)v12, 0x14u);
  }
LABEL_16:

  return v10;
}

- (BOOL)canPerformValidAuthorizationCheck
{
  id v3 = [(CNUICoreEditAuthorizationCheck *)self contact];

  BOOL v4 = [(CNUICoreEditAuthorizationCheck *)self parentContainer];

  if (v4)
  {
    BOOL v5 = [(CNUICoreEditAuthorizationCheck *)self parentContainer];
    LOBYTE(v6) = v5 != 0;
  }
  else
  {
    uint64_t v7 = *MEMORY[0x263F334B0];
    BOOL v5 = [(CNUICoreEditAuthorizationCheck *)self contact];
    BOOL v8 = [v5 linkedContacts];
    int v6 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8) ^ 1;
  }
  if (v3) {
    return v6;
  }
  else {
    return 0;
  }
}

- (BOOL)shouldRespectParentalRestrictions
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v2 = [(CNUICoreEditAuthorizationCheck *)self ignoresParentalRestrictions];
  id v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL v4 = @"restrictions will be enforced";
    if (v2) {
      BOOL v4 = @"restrictions will be ignored";
    }
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_20B704000, v3, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v6, 0xCu);
  }

  return !v2;
}

- (BOOL)editAltersRestrictedInformation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFEA88];
  BOOL v4 = [(CNUICoreEditAuthorizationCheck *)self contact];
  LODWORD(v3) = [v3 isWhitelistedContact:v4];

  BOOL v5 = [(CNUICoreEditAuthorizationCheck *)self parentContainer];
  int v6 = [v5 isGuardianRestricted];

  uint64_t v7 = [(CNUICoreEditAuthorizationCheck *)self contact];
  uint64_t v8 = [v7 linkedContacts];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__CNUICoreEditAuthorizationCheck_editAltersRestrictedInformation__block_invoke;
  v17[3] = &unk_2640176E0;
  v17[4] = self;
  int v9 = objc_msgSend(v8, "_cn_any:", v17);

  unsigned int v10 = v3 | v6 | v9;
  uint32_t v11 = [(id)objc_opt_class() log];
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10 == 1)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      __int16 v13 = "editing is permitted";
      BOOL v14 = v11;
      uint32_t v15 = 2;
LABEL_6:
      _os_log_impl(&dword_20B704000, v14, OS_LOG_TYPE_INFO, v13, buf, v15);
    }
  }
  else if (v12)
  {
    *(_DWORD *)buf = 67109632;
    int v19 = 0;
    __int16 v20 = 1024;
    int v21 = 0;
    __int16 v22 = 1024;
    int v23 = 0;
    __int16 v13 = "editing is restricted (%hhd,%hhd,%hhd)";
    BOOL v14 = v11;
    uint32_t v15 = 20;
    goto LABEL_6;
  }

  return v10;
}

uint64_t __65__CNUICoreEditAuthorizationCheck_editAltersRestrictedInformation__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 linkedParentContainerProvider];
  BOOL v5 = [v4 containerForContact:v3];

  uint64_t v6 = [v5 isGuardianRestricted];
  return v6;
}

- (BOOL)authorizationPasscodeEnabledOnDevice
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v2 = [(CNUICoreEditAuthorizationCheck *)self screenTimePasscodeStatusCheck];
  uint64_t v3 = [v2 screentimePasscodeStatus];

  BOOL v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = @"passcode is disabled";
    if (v3 == 2) {
      BOOL v5 = @"passode is enabled";
    }
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_20B704000, v4, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v7, 0xCu);
  }

  return v3 == 2;
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (BOOL)ignoresParentalRestrictions
{
  return self->_ignoresParentalRestrictions;
}

- (CNUICoreScreentimePasscodeCheck)screenTimePasscodeStatusCheck
{
  return self->_screenTimePasscodeStatusCheck;
}

- (CNUICoreParentContainerProvider)linkedParentContainerProvider
{
  return self->_linkedParentContainerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedParentContainerProvider, 0);
  objc_storeStrong((id *)&self->_screenTimePasscodeStatusCheck, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end