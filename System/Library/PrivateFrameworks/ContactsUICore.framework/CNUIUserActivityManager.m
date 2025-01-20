@interface CNUIUserActivityManager
+ (OS_os_log)log;
+ (id)descriptorForRequiredKeys;
- (CNContactStore)contactStore;
- (CNLSApplicationWorkspace)applicationWorkspace;
- (CNUIInteractionDonor)interactionDonor;
- (CNUIUserActivityManager)initWithApplicationWorkspace:(id)a3;
- (CNUIUserActivityManager)initWithContactStore:(id)a3;
- (CNUIUserActivityManager)initWithContactStore:(id)a3 applicationWorkspace:(id)a4;
- (CNUIUserActivityManager)initWithContactStore:(id)a3 applicationWorkspace:(id)a4 interactionDonor:(id)a5;
- (id)makeActivityAdvertisingViewingGroups;
- (id)makeActivityAdvertisingViewingList;
- (id)makeActivityAdvertisingViewingOfContact:(id)a3;
- (void)publishRequestToCreateContact:(id)a3;
- (void)publishRequestToEditContact:(id)a3;
- (void)updateUserActivityState:(id)a3 withContentsOfContact:(id)a4;
- (void)updateUserActivityState:(id)a3 withContentsOfListTopContact:(id)a4 displayedContact:(id)a5 searchString:(id)a6 isShowingGroups:(BOOL)a7;
@end

@implementation CNUIUserActivityManager

- (CNUIUserActivityManager)initWithContactStore:(id)a3 applicationWorkspace:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(CNUIInteractionDonor);
  v9 = [(CNUIUserActivityManager *)self initWithContactStore:v7 applicationWorkspace:v6 interactionDonor:v8];

  return v9;
}

- (CNUIUserActivityManager)initWithContactStore:(id)a3 applicationWorkspace:(id)a4 interactionDonor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_7 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_63);
  }
  v12 = CNGuardOSLog_cn_once_object_0_7;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreContactRefetcher initWithContactStore:contactsToRefetch:keysToFetch:](v12, v13, v14, v15, v16, v17, v18, v19);
    if (v10) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v10) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_7 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_63);
  }
  v20 = CNGuardOSLog_cn_once_object_0_7;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
    -[CNUIUserActivityManager initWithContactStore:applicationWorkspace:interactionDonor:](v20, v21, v22, v23, v24, v25, v26, v27);
  }
LABEL_10:
  if (!v11)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_63);
    }
    v28 = CNGuardOSLog_cn_once_object_0_7;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
      -[CNUIUserActivityManager initWithContactStore:applicationWorkspace:interactionDonor:](v28, v29, v30, v31, v32, v33, v34, v35);
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)CNUIUserActivityManager;
  v36 = [(CNUIUserActivityManager *)&v40 init];
  v37 = v36;
  if (v36)
  {
    objc_storeStrong((id *)&v36->_contactStore, a3);
    objc_storeStrong((id *)&v37->_applicationWorkspace, a4);
    objc_storeStrong((id *)&v37->_interactionDonor, a5);
    v38 = v37;
  }

  return v37;
}

+ (OS_os_log)log
{
  if (log_cn_once_token_1_2 != -1) {
    dispatch_once(&log_cn_once_token_1_2, &__block_literal_global_31);
  }
  v2 = (void *)log_cn_once_object_1_2;
  return (OS_os_log *)v2;
}

uint64_t __30__CNUIUserActivityManager_log__block_invoke()
{
  log_cn_once_object_1_2 = (uint64_t)os_log_create("contactsui", "activity");
  return MEMORY[0x270F9A758]();
}

+ (id)descriptorForRequiredKeys
{
  return (id)[MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
}

- (CNUIUserActivityManager)initWithContactStore:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CNLSApplicationWorkspace);
  id v6 = [(CNUIUserActivityManager *)self initWithContactStore:v4 applicationWorkspace:v5];

  return v6;
}

- (CNUIUserActivityManager)initWithApplicationWorkspace:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFEA58];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(CNUIUserActivityManager *)self initWithContactStore:v6 applicationWorkspace:v5];

  return v7;
}

- (void)publishRequestToCreateContact:(id)a3
{
  id v6 = objc_alloc_init(CNUICreateContactIntent);
  id v4 = (void *)[objc_alloc(MEMORY[0x263F0FBD8]) initWithIntent:v6 response:0];
  id v5 = [(CNUIUserActivityManager *)self interactionDonor];
  [v5 donateInteraction:v4];
}

- (void)publishRequestToEditContact:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F08D38]);
  id v6 = (void *)[v5 initWithActivityType:CNUIActivityTypeEditingContact];
  id v7 = [(CNUIUserActivityManager *)self contactStore];
  v8 = [v7 userActivityUserInfoForContact:v4];
  [v6 setUserInfo:v8];

  id v9 = [(CNUIUserActivityManager *)self applicationWorkspace];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__CNUIUserActivityManager_publishRequestToEditContact___block_invoke;
  v11[3] = &unk_264018408;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v9 openUserActivity:v6 inApplication:0 options:0 completionHandler:v11];
}

void __55__CNUIUserActivityManager_publishRequestToEditContact___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() log];
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_20B704000, v7, OS_LOG_TYPE_INFO, "opened contacts successfully", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __55__CNUIUserActivityManager_publishRequestToEditContact___block_invoke_cold_1(a1, (uint64_t)v5, v7);
  }
}

- (id)makeActivityAdvertisingViewingOfContact:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CNUIUserActivityManager *)self contactStore];
  id v6 = [v5 userActivityUserInfoForContact:v4];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F08D38]);
    v8 = (void *)[v7 initWithActivityType:CNUIActivityTypeViewingContact];
    [v8 setEligibleForSearch:1];
    [v8 setEligibleForPublicIndexing:1];
    [v8 setEligibleForHandoff:1];
    [v8 _setEligibleForPrediction:0];
    id v9 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_20B704000, v9, OS_LOG_TYPE_INFO, "activity continuity - %@ needs to save the user activity", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    id v9 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CNUIUserActivityManager makeActivityAdvertisingViewingOfContact:]((uint64_t)v4, v9);
    }
    v8 = 0;
  }

  return v8;
}

- (void)updateUserActivityState:(id)a3 withContentsOfListTopContact:(id)a4 displayedContact:(id)a5 searchString:(id)a6 isShowingGroups:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v13
    && ([MEMORY[0x263EFEA20] stringFromContact:v13 style:0],
        (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v17 = (void *)v16;
    [v12 setTitle:v16];
    id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  else
  {
    uint64_t v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"NO_NAME" value:&stru_26BFC7668 table:@"Localized"];
    [v12 setTitle:v20];

    id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (!v13) {
      goto LABEL_6;
    }
  }
  uint64_t v21 = [(CNUIUserActivityManager *)self contactStore];
  uint64_t v22 = [v21 userActivityUserInfoForContact:v13];
  [v18 setObject:v22 forKeyedSubscript:CNUIActivityUserInformationListTopContactKey];

LABEL_6:
  if (v14)
  {
    uint64_t v23 = [(CNUIUserActivityManager *)self contactStore];
    uint64_t v24 = [v23 userActivityUserInfoForContact:v14];
    [v18 setObject:v24 forKeyedSubscript:CNUIActivityUserInformationDisplayedContactKey];
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334E8] + 16))()) {
    [v18 setObject:v15 forKeyedSubscript:CNUIActivityUserInformationSearchStringKey];
  }
  uint64_t v25 = [NSNumber numberWithBool:v7];
  [v18 setObject:v25 forKeyedSubscript:CNUIActivityUserInformationIsShowingGroupsKey];

  [v12 setUserInfo:v18];
  uint64_t v26 = (void *)MEMORY[0x263EFFA08];
  uint64_t v27 = [v12 userInfo];
  v28 = [v27 allKeys];
  uint64_t v29 = [v26 setWithArray:v28];
  [v12 setRequiredUserInfoKeys:v29];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v30 = [v13 searchableItemAttributeSetForUserActivity];
    [v12 setContentAttributeSet:v30];
  }
  uint64_t v31 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    uint64_t v32 = [v12 title];
    uint64_t v33 = [v12 userInfo];
    int v34 = 138412802;
    id v35 = v12;
    __int16 v36 = 2112;
    v37 = v32;
    __int16 v38 = 2112;
    v39 = v33;
    _os_log_impl(&dword_20B704000, v31, OS_LOG_TYPE_INFO, "activity continuity - updated %@ with title %@, userInfo %@", (uint8_t *)&v34, 0x20u);
  }
}

- (void)updateUserActivityState:(id)a3 withContentsOfContact:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263EFEA20] stringFromContact:v7 style:0];
  if (v8)
  {
    [v6 setTitle:v8];
  }
  else
  {
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"NO_NAME" value:&stru_26BFC7668 table:@"Localized"];
    [v6 setTitle:v10];
  }
  int v11 = [(CNUIUserActivityManager *)self contactStore];
  id v12 = [v11 userActivityUserInfoForContact:v7];
  [v6 setUserInfo:v12];

  id v13 = (void *)MEMORY[0x263EFFA08];
  id v14 = [v6 userInfo];
  id v15 = [v14 allKeys];
  uint64_t v16 = [v13 setWithArray:v15];
  [v6 setRequiredUserInfoKeys:v16];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = [v7 searchableItemAttributeSetForUserActivity];
    [v6 setContentAttributeSet:v17];
  }
  id v18 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = [v6 title];
    v20 = [v6 userInfo];
    int v21 = 138412802;
    id v22 = v6;
    __int16 v23 = 2112;
    uint64_t v24 = v19;
    __int16 v25 = 2112;
    uint64_t v26 = v20;
    _os_log_impl(&dword_20B704000, v18, OS_LOG_TYPE_INFO, "activity continuity - updated %@ with title %@, userInfo %@", (uint8_t *)&v21, 0x20u);
  }
}

- (id)makeActivityAdvertisingViewingList
{
  id v2 = objc_alloc(MEMORY[0x263F08D38]);
  v3 = (void *)[v2 initWithActivityType:CNUIActivityTypeViewingList];
  return v3;
}

- (id)makeActivityAdvertisingViewingGroups
{
  id v2 = objc_alloc(MEMORY[0x263F08D38]);
  v3 = (void *)[v2 initWithActivityType:CNUIActivityTypeViewingGroups];
  return v3;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNLSApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (CNUIInteractionDonor)interactionDonor
{
  return self->_interactionDonor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionDonor, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)initWithContactStore:(uint64_t)a3 applicationWorkspace:(uint64_t)a4 interactionDonor:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithContactStore:(uint64_t)a3 applicationWorkspace:(uint64_t)a4 interactionDonor:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__CNUIUserActivityManager_publishRequestToEditContact___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_20B704000, log, OS_LOG_TYPE_ERROR, "error opening contacts to edit mode for contact: %@, error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)makeActivityAdvertisingViewingOfContact:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20B704000, a2, OS_LOG_TYPE_DEBUG, "activity continuity - %@ has no user activity", (uint8_t *)&v2, 0xCu);
}

@end