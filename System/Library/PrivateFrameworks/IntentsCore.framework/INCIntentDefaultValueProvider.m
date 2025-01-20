@interface INCIntentDefaultValueProvider
- (BOOL)isExpectedDefaultValueError:(id)a3;
- (INCIntentDefaultValueProvider)initWithIntent:(id)a3;
- (INIntent)intent;
- (OS_dispatch_queue)completionHandlingQueue;
- (void)loadDefaultValuesWithAttributes:(id)a3 extensionProxy:(id)a4 completionHandler:(id)a5;
- (void)loadDefaultValuesWithCompletionHandler:(id)a3;
@end

@implementation INCIntentDefaultValueProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlingQueue, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

- (OS_dispatch_queue)completionHandlingQueue
{
  return self->_completionHandlingQueue;
}

- (INIntent)intent
{
  return self->_intent;
}

- (BOOL)isExpectedDefaultValueError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F30898]]) {
    BOOL v5 = [v3 code] == 1003;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)loadDefaultValuesWithAttributes:(id)a3 extensionProxy:(id)a4 completionHandler:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v34 = a4;
  id v32 = a5;
  v33 = self;
  v9 = [(INCIntentDefaultValueProvider *)self intent];
  group = dispatch_group_create();
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__634;
  v50[4] = __Block_byref_object_dispose__635;
  id v51 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v14 = [v13 relationship];
        v15 = [v14 parentCodableAttribute];

        if (!v15) {
          goto LABEL_27;
        }
        v16 = [v13 relationship];
        BOOL v17 = [v16 relation] == 0;

        if (v17) {
          goto LABEL_27;
        }
        uint64_t v18 = [v15 propertyName];
        v19 = [v9 valueForKey:v18];

        v20 = [v13 relationship];
        LOBYTE(v18) = [v20 compareValue:v19];

        if (v18)
        {
LABEL_27:
          if ([v13 supportsDynamicEnumeration])
          {
            dispatch_group_enter(group);
            v21 = [v13 propertyName];
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __98__INCIntentDefaultValueProvider_loadDefaultValuesWithAttributes_extensionProxy_completionHandler___block_invoke;
            v41[3] = &unk_1E62BB718;
            v41[4] = v33;
            v45 = v50;
            v42 = group;
            id v43 = v9;
            v44 = v13;
            [v34 getDefaultValueForParameterNamed:v21 completionHandler:v41];
          }
          else
          {
            id v22 = [v13 metadata];
            v23 = v22;
            if (v22)
            {
              if ([v22 conformsToProtocol:&unk_1F1637FE8]) {
                v24 = v23;
              }
              else {
                v24 = 0;
              }
            }
            else
            {
              v24 = 0;
            }
            id v25 = v24;

            v26 = [v25 defaultValueForIntentDefaultValueProvider];
            if (v26)
            {
              if (![v13 modifier])
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObject:v26];

                  v26 = (void *)v27;
                }
              }
              v28 = [v13 propertyName];
              [v9 setValue:v26 forKey:v28];
            }
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v10);
  }

  v29 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__INCIntentDefaultValueProvider_loadDefaultValuesWithAttributes_extensionProxy_completionHandler___block_invoke_2;
  block[3] = &unk_1E62BB740;
  id v39 = v32;
  v40 = v50;
  id v38 = v9;
  id v30 = v9;
  id v31 = v32;
  dispatch_group_notify(group, v29, block);

  _Block_object_dispose(v50, 8);
}

void __98__INCIntentDefaultValueProvider_loadDefaultValuesWithAttributes_extensionProxy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v5 && ([*(id *)(a1 + 32) isExpectedDefaultValueError:v5] & 1) == 0)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = v5;
    v7 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    if (!v10) {
      goto LABEL_7;
    }
    v6 = *(void **)(a1 + 48);
    v7 = [*(id *)(a1 + 56) propertyName];
    [v6 setValue:v10 forKey:v7];
  }

LABEL_7:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __98__INCIntentDefaultValueProvider_loadDefaultValuesWithAttributes_extensionProxy_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = a1 + 40;
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(*(void *)(*(void *)(v3 + 8) + 8) + 40)) {
    return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32));
  }
}

- (void)loadDefaultValuesWithCompletionHandler:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(INCIntentDefaultValueProvider *)self intent];
  v6 = [(INCIntentDefaultValueProvider *)self intent];
  v7 = [v6 _codableDescription];
  uint64_t v8 = [v7 displayOrderedAttributes];
  id v9 = [v8 array];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v34;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v33 + 1) + 8 * v13) supportsDynamicEnumeration])
        {

          if (MKBDeviceUnlockedSinceBoot())
          {
            v14 = [[INCExtensionConnection alloc] initWithIntent:v5];
            [(INCExtensionConnection *)v14 setRequiresTCC:0];
            v31[0] = 0;
            v31[1] = v31;
            v31[2] = 0x2020000000;
            char v32 = 0;
            objc_initWeak(&location, v14);
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke;
            v26[3] = &unk_1E62BB6A0;
            v26[4] = self;
            v28 = v31;
            objc_copyWeak(&v29, &location);
            id v27 = v4;
            v15 = (void *)MEMORY[0x1C1872DC0](v26);
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_3;
            v24[3] = &unk_1E62BB6C8;
            id v16 = v15;
            id v25 = v16;
            [(INCExtensionConnection *)v14 setInterruptionHandler:v24];
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_4;
            v21[3] = &unk_1E62BB6F0;
            id v17 = v16;
            id v23 = v17;
            v21[4] = self;
            id v22 = v10;
            [(INCExtensionConnection *)v14 resumeWithCompletionHandler:v21];

            objc_destroyWeak(&v29);
            objc_destroyWeak(&location);
            _Block_object_dispose(v31, 8);
          }
          else
          {
            uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v37 = *MEMORY[0x1E4F28568];
            id v38 = @"Loading default values from an intent handler requires that the device be unlocked at least once";
            v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
            v20 = [v18 errorWithDomain:@"INCExtensionErrorDomain" code:1310 userInfo:v19];
            (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v20);
          }
          goto LABEL_13;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  [(INCIntentDefaultValueProvider *)self loadDefaultValuesWithAttributes:v10 extensionProxy:0 completionHandler:v4];
LABEL_13:
}

void __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) completionHandlingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E62BB678;
  uint64_t v15 = *(void *)(a1 + 48);
  objc_copyWeak(&v16, (id *)(a1 + 56));
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v16);
}

uint64_t __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_5;
    v6[3] = &unk_1E62BBBF0;
    id v7 = *(id *)(a1 + 48);
    [v3 loadDefaultValuesWithAttributes:v4 extensionProxy:a2 completionHandler:v6];
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

uint64_t __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained reset];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (INCIntentDefaultValueProvider)initWithIntent:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INCIntentDefaultValueProvider;
  id v5 = [(INCIntentDefaultValueProvider *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    intent = v5->_intent;
    v5->_intent = (INIntent *)v6;

    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.Intents.IntentDefaultValueProvider.Completion", v9);
    completionHandlingQueue = v5->_completionHandlingQueue;
    v5->_completionHandlingQueue = (OS_dispatch_queue *)v10;

    id v12 = v5;
  }

  return v5;
}

@end