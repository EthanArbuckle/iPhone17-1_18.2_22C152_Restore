@interface HFSymptomFixManager
+ (id)sharedManager;
- (BOOL)anySymptomIsBeingFixedForFixableObject:(id)a3;
- (HFSymptomFixManager)init;
- (NSMutableSet)items;
- (id)_itemForFixSession:(id)a3;
- (id)_itemForSymptom:(id)a3 accessory:(id)a4;
- (int64_t)fixStateForSymptom:(id)a3 accessory:(id)a4;
- (void)fixSession:(id)a3 didChangeState:(int64_t)a4;
- (void)fixSymptom:(id)a3 forFixableObject:(id)a4 presentingViewController:(id)a5;
@end

@implementation HFSymptomFixManager

- (BOOL)anySymptomIsBeingFixedForFixableObject:(id)a3
{
  id v4 = a3;
  v5 = [(HFSymptomFixManager *)self items];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__HFSymptomFixManager_anySymptomIsBeingFixedForFixableObject___block_invoke;
  v9[3] = &unk_264093BA8;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (NSMutableSet)items
{
  return self->_items;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__HFSymptomFixManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26AB2F038 != -1) {
    dispatch_once(&qword_26AB2F038, block);
  }
  v2 = (void *)_MergedGlobals_247;
  return v2;
}

uint64_t __36__HFSymptomFixManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = _MergedGlobals_247;
  _MergedGlobals_247 = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (HFSymptomFixManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFSymptomFixManager;
  uint64_t v2 = [(HFSymptomFixManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    items = v2->_items;
    v2->_items = (NSMutableSet *)v3;
  }
  return v2;
}

uint64_t __62__HFSymptomFixManager_anySymptomIsBeingFixedForFixableObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessories];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__HFSymptomFixManager_anySymptomIsBeingFixedForFixableObject___block_invoke_2;
  v8[3] = &unk_26408D968;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __62__HFSymptomFixManager_anySymptomIsBeingFixedForFixableObject___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 accessory];
  uint64_t v5 = [v4 isEqual:v3];

  return v5;
}

- (int64_t)fixStateForSymptom:(id)a3 accessory:(id)a4
{
  id v4 = [(HFSymptomFixManager *)self _itemForSymptom:a3 accessory:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 fixSession];
    int64_t v7 = [v6 state];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)fixSymptom:(id)a3 forFixableObject:(id)a4 presentingViewController:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v8 = (HFSymptomFixManagerItem *)a3;
  id v9 = (HFSymptomFixManagerItem *)a4;
  id v37 = a5;
  id v10 = HFLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v46 = v8;
    __int16 v47 = 2112;
    v48 = v9;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Starting fix for symptom %@ on fixable object %@", buf, 0x16u);
  }

  if (!+[HFUtilities isInternalInstall]
    || ![(HFSymptomFixManagerItem *)v8 hf_generatedByHomeAppForDebuggingPurposes])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v17 = [(HFSymptomFixManagerItem *)v9 accessories];
    uint64_t v18 = [(HFSymptomFixManagerItem *)v17 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      v34 = v9;
      uint64_t v20 = *(void *)v39;
      uint64_t v35 = *(void *)v39;
      v36 = v17;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(HFSymptomFixManagerItem **)(*((void *)&v38 + 1) + 8 * i);
          v23 = [(HFSymptomFixManager *)self _itemForSymptom:v8 accessory:v22];
          if (v23)
          {
            v24 = HFLogForCategory(0);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v46 = v22;
              __int16 v47 = 2112;
              v48 = v23;
              _os_log_impl(&dword_20B986000, v24, OS_LOG_TYPE_DEFAULT, "Not fixing accessory %@ because it is currently being fixed: %@", buf, 0x16u);
            }
          }
          else
          {
            v25 = [(HFSymptomFixManagerItem *)v22 symptomsHandler];
            v24 = [v25 newFixSessionForSymptom:v8];

            if (v24)
            {
              v26 = v8;
              v27 = [[HFSymptomFixManagerItem alloc] initWithSymptom:v8 fixSession:v24 accessory:v22];
              v28 = [(HFSymptomFixManager *)self items];
              [v28 addObject:v27];

              v29 = HFLogForCategory(0);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v27;
                _os_log_error_impl(&dword_20B986000, v29, OS_LOG_TYPE_ERROR, "Now Posting HFSymptomFixManagerStartSessionNotification for item  %@", buf, 0xCu);
              }

              v30 = [MEMORY[0x263F08A00] defaultCenter];
              v42 = @"symptomItemIdentifier";
              v31 = [(HFSymptomFixManagerItem *)v27 identifier];
              v43 = v31;
              v32 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
              [v30 postNotificationName:@"HFSymptomFixManagerStartSessionNotification" object:0 userInfo:v32];

              v33 = HFLogForCategory(0);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v27;
                _os_log_impl(&dword_20B986000, v33, OS_LOG_TYPE_DEFAULT, "Starting fix session for item: %@", buf, 0xCu);
              }

              [v24 setDelegate:self];
              [v24 setPresentingViewController:v37];
              [v24 start];
              v8 = v26;
              uint64_t v20 = v35;
              v17 = v36;
            }
            else
            {
              HFLogForCategory(0);
              v27 = (HFSymptomFixManagerItem *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v27->super, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v46 = v8;
                __int16 v47 = 2112;
                v48 = v22;
                _os_log_error_impl(&dword_20B986000, &v27->super, OS_LOG_TYPE_ERROR, "Could not create fix session for symptom: %@ accessory: %@", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v19 = [(HFSymptomFixManagerItem *)v17 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v19);
      id v9 = v34;
    }
    goto LABEL_37;
  }
  v11 = HFLogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Updating symptom UI for debugging purposes", buf, 2u);
  }

  if ([(HFSymptomFixManagerItem *)v8 type] == 11)
  {
    objc_opt_class();
    v12 = v9;
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    v14 = v13;

    [(HFSymptomFixManagerItem *)v14 hf_setFakeWiFiMismatchSymptom:0];
  }
  if ([(HFSymptomFixManagerItem *)v8 type] == 19)
  {
    objc_opt_class();
    v15 = v9;
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    v17 = v16;

    [(HFSymptomFixManagerItem *)v17 hf_setFakeCaptiveLeaseRenewalSymptom:0];
LABEL_37:
  }
}

- (id)_itemForSymptom:(id)a3 accessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HFSymptomFixManager *)self items];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__HFSymptomFixManager__itemForSymptom_accessory___block_invoke;
  v13[3] = &unk_264093BD0;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = objc_msgSend(v8, "na_firstObjectPassingTest:", v13);

  return v11;
}

uint64_t __49__HFSymptomFixManager__itemForSymptom_accessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 symptom];
  if ([v4 isEqual:*(void *)(a1 + 32)])
  {
    uint64_t v5 = [v3 accessory];
    uint64_t v6 = [v5 isEqual:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_itemForFixSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFSymptomFixManager *)self items];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__HFSymptomFixManager__itemForFixSession___block_invoke;
  v9[3] = &unk_264093BA8;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __42__HFSymptomFixManager__itemForFixSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 fixSession];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)fixSession:(id)a3 didChangeState:(int64_t)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = HFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromHMSymptomFixSessionState(a4);
    *(_DWORD *)buf = 138412546;
    v27 = v6;
    __int16 v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "HFSymptomFixManager fixSession:%@ didChangeState:%@", buf, 0x16u);
  }
  id v9 = [(HFSymptomFixManager *)self _itemForFixSession:v6];
  if (v9)
  {
    id v10 = +[HFHomeKitDispatcher sharedDispatcher];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __49__HFSymptomFixManager_fixSession_didChangeState___block_invoke;
    v22[3] = &unk_264093BF8;
    v11 = v9;
    v23 = v11;
    [v10 dispatchSymptomFixSessionObserverMessage:v22 sender:0];

    if (a4 == 2)
    {
      v12 = HFLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v11;
        _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "Now Posting HFSymptomFixManagerEndSessionNotification for item  %@", buf, 0xCu);
      }

      v13 = [MEMORY[0x263F08A00] defaultCenter];
      v24 = @"symptomItemIdentifier";
      id v14 = [v11 identifier];
      v25 = v14;
      id v15 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      [v13 postNotificationName:@"HFSymptomFixManagerEndSessionNotification" object:0 userInfo:v15];

      v16 = [(HFSymptomFixManager *)self items];
      [v16 removeObject:v11];

      v17 = [v6 error];

      if (v17)
      {
        uint64_t v18 = HFLogForCategory(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v21 = [v6 error];
          *(_DWORD *)buf = 138412546;
          v27 = v6;
          __int16 v28 = 2112;
          v29 = v21;
          _os_log_error_impl(&dword_20B986000, v18, OS_LOG_TYPE_ERROR, "Error with Fix Session: %@ error: %@", buf, 0x16u);
        }
      }
    }
    uint64_t v19 = v23;
  }
  else
  {
    uint64_t v19 = HFLogForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [(HFSymptomFixManager *)self items];
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      __int16 v28 = 2112;
      v29 = v20;
      _os_log_error_impl(&dword_20B986000, v19, OS_LOG_TYPE_ERROR, "HFSymptomFixManager received fix session callback for unknown session %@. All items: %@", buf, 0x16u);
    }
  }
}

void __49__HFSymptomFixManager_fixSession_didChangeState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 accessory];
  [v3 fixSessionDidChangeForAccessory:v4];
}

- (void).cxx_destruct
{
}

@end