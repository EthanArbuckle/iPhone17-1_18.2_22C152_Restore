@interface DBDashboardWorkspaceStateResolver
- (DBAppPolicyProviding)policyProvider;
- (DBDashboardWorkspaceStateResolver)initWithPolicyProvider:(id)a3;
- (id)computeNewStateFromState:(id)a3 andRequest:(id)a4;
- (void)setPolicyProvider:(id)a3;
@end

@implementation DBDashboardWorkspaceStateResolver

- (DBDashboardWorkspaceStateResolver)initWithPolicyProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DBDashboardWorkspaceStateResolver;
  v5 = [(DBDashboardWorkspaceStateResolver *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_policyProvider, v4);
  }

  return v6;
}

- (id)computeNewStateFromState:(id)a3 andRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)[v6 mutableCopy];
  v34 = objc_alloc_init(DBDashboardWorkspaceStateResolution);
  [(DBDashboardWorkspaceStateResolution *)v34 setState:v8];
  v9 = [v6 baseEntity];
  v10 = [v6 stackedEntity];
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__2;
  v71 = __Block_byref_object_dispose__2;
  id v72 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__2;
  v65 = __Block_byref_object_dispose__2;
  id v66 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__2;
  v59 = __Block_byref_object_dispose__2;
  id v60 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__2;
  v53 = __Block_byref_object_dispose__2;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__2;
  v47 = __Block_byref_object_dispose__2;
  id v48 = 0;
  v33 = v7;
  v11 = [v7 changeItems];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __73__DBDashboardWorkspaceStateResolver_computeNewStateFromState_andRequest___block_invoke;
  v35[3] = &unk_2649B5128;
  v35[4] = self;
  v38 = &v43;
  v39 = &v67;
  v40 = &v55;
  id v12 = v9;
  id v36 = v12;
  v41 = &v61;
  id v13 = v10;
  id v37 = v13;
  v42 = &v49;
  [v11 enumerateObjectsUsingBlock:v35];

  v14 = (void *)v68[5];
  if (v14)
  {
    if (v62[5])
    {
      v15 = [v14 identifier];
      v16 = [(id)v62[5] identifier];
      int v17 = [v15 isEqualToString:v16];

      if (v17)
      {
        v18 = (void *)v68[5];
        v68[5] = 0;

        v19 = (void *)v62[5];
        v62[5] = 0;
      }
    }
  }
  v20 = (void *)v56[5];
  if (v20)
  {
    if (v50[5])
    {
      v21 = [v20 identifier];
      v22 = [(id)v50[5] identifier];
      int v23 = [v21 isEqualToString:v22];

      if (v23)
      {
        v24 = (void *)v56[5];
        v56[5] = 0;

        v25 = (void *)v50[5];
        v50[5] = 0;
      }
    }
  }
  if (v62[5])
  {
    v26 = +[DBDashboardHomescreenEntity entity];

    v27 = objc_msgSend((id)v62[5], "_sr_associatedChangeItem");
    objc_msgSend(v26, "_setSR_associatedChangeItem:", v27);
  }
  else
  {
    v26 = v12;
  }
  v28 = (void *)v68[5];
  if (v28)
  {
    id v29 = v28;

    id v13 = 0;
    v26 = v29;
  }
  if (v50[5])
  {

    id v13 = 0;
  }
  v30 = (void *)v56[5];
  if (v30)
  {
    id v31 = v30;

    id v13 = v31;
  }
  [v8 setBaseEntity:v26];
  [v8 setStackedEntity:v13];
  [(DBDashboardWorkspaceStateResolution *)v34 setActivateSuspendedEntity:v44[5]];

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
  return v34;
}

void __73__DBDashboardWorkspaceStateResolver_computeNewStateFromState_andRequest___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  uint64_t v3 = [v15 changeType];
  if (!([v15 presentationPreference] | v3)) {
    [v15 setPresentationPreference:1];
  }
  id v4 = [*(id *)(a1 + 32) policyProvider];
  v5 = (void *)[v15 _newEntityFromChangeItemWithPolicyProvider:v4];

  objc_msgSend(v5, "_setSR_associatedChangeItem:", v15);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v15 activationSettings],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isSuspended],
        v6,
        v7))
  {
    uint64_t v8 = *(void *)(a1 + 56);
  }
  else if (v3)
  {
    v9 = [v5 identifier];
    v10 = [*(id *)(a1 + 40) identifier];
    int v11 = BSEqualObjects();

    if (v11)
    {
      uint64_t v8 = *(void *)(a1 + 80);
    }
    else
    {
      id v12 = [v5 identifier];
      id v13 = [*(id *)(a1 + 48) identifier];
      int v14 = BSEqualObjects();

      if (!v14) {
        goto LABEL_15;
      }
      uint64_t v8 = *(void *)(a1 + 88);
    }
  }
  else if ([v15 presentationPreference] == 1)
  {
    uint64_t v8 = *(void *)(a1 + 64);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 72);
  }
  objc_storeStrong((id *)(*(void *)(v8 + 8) + 40), v5);
LABEL_15:
}

- (DBAppPolicyProviding)policyProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_policyProvider);
  return (DBAppPolicyProviding *)WeakRetained;
}

- (void)setPolicyProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end