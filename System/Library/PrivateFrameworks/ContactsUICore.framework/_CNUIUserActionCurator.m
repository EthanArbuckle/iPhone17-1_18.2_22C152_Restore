@interface _CNUIUserActionCurator
- (CNContactStore)contactStore;
- (CNLSApplicationWorkspace)applicationWorkspace;
- (_CNUIUserActionCurator)initWithContactStore:(id)a3 applicationWorkspace:(id)a4;
- (id)curateUserAction:(id)a3;
- (id)curateUserAction:(id)a3 withKeysToFetch:(id)a4;
- (void)setApplicationWorkspace:(id)a3;
- (void)setContactStore:(id)a3;
@end

@implementation _CNUIUserActionCurator

- (_CNUIUserActionCurator)initWithContactStore:(id)a3 applicationWorkspace:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNUIUserActionCurator;
  v9 = [(_CNUIUserActionCurator *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_applicationWorkspace, a4);
    v11 = v10;
  }

  return v10;
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFEA68]);
    [v4 setIncludeLocalContacts:1];
    [v4 setIncludeSuggestedContacts:1];
    v5 = (CNContactStore *)[objc_alloc(MEMORY[0x263EFEA58]) initWithConfiguration:v4];
    v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (CNLSApplicationWorkspace)applicationWorkspace
{
  applicationWorkspace = self->_applicationWorkspace;
  if (!applicationWorkspace)
  {
    id v4 = objc_alloc_init(CNLSApplicationWorkspace);
    v5 = self->_applicationWorkspace;
    self->_applicationWorkspace = v4;

    applicationWorkspace = self->_applicationWorkspace;
  }
  return applicationWorkspace;
}

- (id)curateUserAction:(id)a3
{
  return [(_CNUIUserActionCurator *)self curateUserAction:a3 withKeysToFetch:MEMORY[0x263EFFA68]];
}

- (id)curateUserAction:(id)a3 withKeysToFetch:(id)a4
{
  v102[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 contactProperty];
  id v8 = [v7 contact];
  char v9 = [v8 hasBeenPersisted];

  if ((v9 & 1) == 0)
  {
    v22 = +[CNUICoreLogProvider actions_os_log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[_CNUIUserActionCurator curateUserAction:withKeysToFetch:].cold.5(v5);
    }
    goto LABEL_23;
  }
  if ([v5 isSuggested])
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFEB58]);
    v11 = [v5 contactProperty];
    v12 = [v11 labeledValue];
    [v10 confirmSuggestion:v12];

    objc_super v13 = [(_CNUIUserActionCurator *)self contactStore];
    id v92 = 0;
    char v14 = [v13 executeSaveRequest:v10 error:&v92];
    id v15 = v92;

    if ((v14 & 1) == 0)
    {
      v16 = +[CNUICoreLogProvider actions_os_log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[_CNUIUserActionCurator curateUserAction:withKeysToFetch:].cold.4((uint64_t)v15, v5, v16);
      }
    }
  }
  v17 = [v7 contact];
  uint64_t v18 = *MEMORY[0x263EFE110];
  int v19 = [v17 isKeyAvailable:*MEMORY[0x263EFE110]];

  v20 = [v7 contact];
  v21 = v20;
  if (v19)
  {
    v22 = [v20 mutableCopy];
  }
  else
  {
    v23 = [v20 identifier];

    if (!v23) {
      goto LABEL_21;
    }
    v21 = [(_CNUIUserActionCurator *)self contactStore];
    v24 = [v7 contact];
    v25 = [v24 identifier];
    v102[0] = v18;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v102 count:1];
    [v21 unifiedContactWithIdentifier:v25 keysToFetch:v26 error:0];
    id v27 = v6;
    uint64_t v28 = v18;
    v30 = v29 = v7;
    v22 = [v30 mutableCopy];

    id v7 = v29;
    uint64_t v18 = v28;
    id v6 = v27;
  }
  if (!v22)
  {
LABEL_21:
    v22 = +[CNUICoreLogProvider actions_os_log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[_CNUIUserActionCurator curateUserAction:withKeysToFetch:](v5);
    }
LABEL_23:
    v38 = 0;
    goto LABEL_44;
  }
  if ([v5 isSuggested])
  {
    objc_opt_class();
    v31 = [v5 contactProperty];
    v32 = [v31 labeledValue];
    v33 = [v32 value];
    if (objc_opt_isKindOfClass()) {
      v34 = v33;
    }
    else {
      v34 = 0;
    }
    id v35 = v34;

    if (v35)
    {
      uint64_t v36 = [v35 userIdentifier];
      uint64_t v37 = [v35 service];
      v85 = [v35 displayname];
    }
    else
    {
      uint64_t v37 = 0;
      v85 = 0;
      uint64_t v36 = 0;
    }
  }
  else
  {
    uint64_t v37 = 0;
    v85 = 0;
    uint64_t v36 = 0;
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334E0] + 16))())
  {
    uint64_t v39 = *MEMORY[0x263F334E8];
    v40 = [v5 bundleIdentifier];
    LODWORD(v39) = (*(uint64_t (**)(uint64_t, void *))(v39 + 16))(v39, v40);

    if (v39)
    {
      v41 = [(_CNUIUserActionCurator *)self applicationWorkspace];
      v42 = [v5 bundleIdentifier];
      [v41 applicationForBundleIdentifier:v42];
      v44 = uint64_t v43 = v36;
      uint64_t v45 = [v44 localizedName];
      v46 = (void *)v37;
      uint64_t v37 = v45;

      uint64_t v36 = v43;
    }
  }
  v47 = [v5 bundleIdentifier];
  id v86 = v6;
  uint64_t v83 = v18;
  v84 = v7;
  if (v47)
  {
    v48 = [v5 bundleIdentifier];
    v101 = v48;
    uint64_t v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v101 count:1];
  }
  else
  {
    uint64_t v49 = MEMORY[0x263EFFA68];
  }

  id v50 = objc_alloc(MEMORY[0x263EFEB20]);
  v51 = [v5 targetHandle];
  uint64_t v52 = MEMORY[0x263F334F8];
  v82 = (void *)v36;
  v53 = (*(void (**)(void))(*MEMORY[0x263F334F8] + 16))();
  (*(void (**)(void))(*(void *)v52 + 16))();
  v55 = v54 = (void *)v37;
  v56 = (*(void (**)(void))(*(void *)v52 + 16))();
  v57 = [v5 teamIdentifier];
  v80 = (void *)v49;
  v58 = (void *)[v50 initWithUrlString:0 username:v51 userIdentifier:v53 service:v55 displayname:v56 teamIdentifier:v57 bundleIdentifiers:v49];

  v81 = v54;
  v59 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:v54 value:v58];
  v60 = [v22 socialProfiles];
  uint64_t v61 = [v60 arrayByAddingObject:v59];
  [v22 setSocialProfiles:v61];

  id v62 = objc_alloc_init(MEMORY[0x263EFEB48]);
  [v62 updateContact:v22];
  v63 = [(_CNUIUserActionCurator *)self contactStore];
  id v91 = 0;
  LOBYTE(v61) = [v63 executeSaveRequest:v62 error:&v91];
  id v64 = v91;

  if ((v61 & 1) == 0)
  {
    v65 = +[CNUICoreLogProvider actions_os_log];
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    {
      v78 = [v5 type];
      *(_DWORD *)buf = 138544130;
      id v94 = v64;
      __int16 v95 = 2112;
      v96 = v22;
      __int16 v97 = 2114;
      v98 = v78;
      __int16 v99 = 2112;
      id v100 = v5;
      _os_log_debug_impl(&dword_20B704000, v65, OS_LOG_TYPE_DEBUG, "[User Action Curator] cannot save mutable contact with curated action, error = %{public}@\n mutable contact = %@\n user action = %{public}@: %@", buf, 0x2Au);
    }
  }
  v79 = v64;
  v66 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v83, 0);
  [v66 addObjectsFromArray:v86];
  v67 = [(_CNUIUserActionCurator *)self contactStore];
  v68 = [v22 identifier];
  v69 = [v67 unifiedContactWithIdentifier:v68 keysToFetch:v66 error:0];

  v70 = [v69 socialProfiles];
  v88[0] = MEMORY[0x263EF8330];
  v88[1] = 3221225472;
  v88[2] = __59___CNUIUserActionCurator_curateUserAction_withKeysToFetch___block_invoke;
  v88[3] = &unk_264019568;
  id v89 = v59;
  id v71 = v58;
  id v90 = v71;
  v72 = objc_msgSend(v70, "_cn_firstObjectPassingTest:", v88);

  if (v72)
  {
    v73 = (void *)MEMORY[0x263EFEA30];
    v74 = [v72 identifier];
    uint64_t v75 = [v73 contactPropertyWithContactNoCopy:v69 propertyKey:v83 identifier:v74];

    v38 = [[CNUIUserActionItem alloc] initWithItem:v5 contactProperty:v75];
    v76 = +[CNUICoreLogProvider actions_os_log];
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
      -[_CNUIUserActionCurator curateUserAction:withKeysToFetch:](v38);
    }
  }
  else
  {
    uint64_t v75 = (uint64_t)v84;
    v76 = +[CNUICoreLogProvider actions_os_log];
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
      -[_CNUIUserActionCurator curateUserAction:withKeysToFetch:](v69);
    }
    v38 = 0;
  }

  id v6 = v86;
  id v7 = (void *)v75;
LABEL_44:

  return v38;
}

- (void)setContactStore:(id)a3
{
}

- (void)setApplicationWorkspace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)curateUserAction:(void *)a1 withKeysToFetch:.cold.1(void *a1)
{
  v1 = [a1 type];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_20B704000, v2, v3, "[User Action Curator] cannot get mutable contact to curate action %{public}@: %@", v4, v5, v6, v7, v8);
}

- (void)curateUserAction:(void *)a1 withKeysToFetch:.cold.2(void *a1)
{
  uint64_t v7 = [a1 socialProfiles];
  OUTLINED_FUNCTION_2_0(&dword_20B704000, v1, v2, "[User Action Curator] could not find curated labeled value %@ saved in %@", v3, v4, v5, v6, 2u);
}

- (void)curateUserAction:(void *)a1 withKeysToFetch:.cold.3(void *a1)
{
  uint64_t v1 = [a1 type];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_20B704000, v2, v3, "[User Action Curator] curated action %{public}@: %@", v4, v5, v6, v7, v8);
}

- (void)curateUserAction:(NSObject *)a3 withKeysToFetch:.cold.4(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a2 type];
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  id v10 = v6;
  __int16 v11 = 2112;
  v12 = a2;
  _os_log_error_impl(&dword_20B704000, a3, OS_LOG_TYPE_ERROR, "[User Action Curator] cannot confirm suggestion, error = %{public}@\n user action = %{public}@: %@", (uint8_t *)&v7, 0x20u);
}

- (void)curateUserAction:(void *)a1 withKeysToFetch:.cold.5(void *a1)
{
  uint64_t v1 = [a1 type];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_20B704000, v2, v3, "[User Action Curator] cannot curate action to a contact not in database %@: %@", v4, v5, v6, v7, v8);
}

@end