@interface WFSelectPhotoAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (BOOL)selectMultiple;
- (id)pickerTypes;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFSelectPhotoAction

+ (id)userInterfaceXPCInterface
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___WFSelectPhotoAction;
  v2 = objc_msgSendSuper2(&v10, sel_userInterfaceXPCInterface);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_showWithPhotoPickerTypes_selectMultiple_completionHandler_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_showWithPhotoPickerTypes_selectMultiple_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E22B0;
}

- (BOOL)selectMultiple
{
  v2 = [(WFSelectPhotoAction *)self parameterValueForKey:@"WFSelectMultiplePhotos" ofClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)pickerTypes
{
  v2 = [(WFSelectPhotoAction *)self parameterValueForKey:@"WFPhotoPickerTypes" ofClass:objc_opt_class()];
  char v3 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v2];

  return v3;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v5 = a3;
  v6 = [(WFSelectPhotoAction *)self pickerTypes];
  BOOL v7 = [(WFSelectPhotoAction *)self selectMultiple];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__WFSelectPhotoAction_runWithRemoteUserInterface_input___block_invoke;
  v8[3] = &unk_264E5EEE8;
  v8[4] = self;
  [v5 showWithPhotoPickerTypes:v6 selectMultiple:v7 completionHandler:v8];
}

void __56__WFSelectPhotoAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v21 = a3;
  v6 = [MEMORY[0x263F33988] sharedLibrary];
  id v28 = 0;
  BOOL v7 = [v6 fetchOptionsWithError:&v28];
  id v20 = v28;

  if (v7)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v8 = (void *)getPHAssetClass_softClass_39824;
    uint64_t v33 = getPHAssetClass_softClass_39824;
    if (!getPHAssetClass_softClass_39824)
    {
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __getPHAssetClass_block_invoke_39825;
      v29[3] = &unk_264E5EC88;
      v29[4] = &v30;
      __getPHAssetClass_block_invoke_39825((uint64_t)v29);
      v8 = (void *)v31[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v30, 8);
    v19 = [v9 fetchAssetsWithLocalIdentifiers:v5 options:v7];
    objc_super v10 = objc_opt_new();
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __56__WFSelectPhotoAction_runWithRemoteUserInterface_input___block_invoke_2;
    v26[3] = &unk_264E5DAD0;
    id v11 = v10;
    id v27 = v11;
    [v19 enumerateObjectsUsingBlock:v26];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v23;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
          v17 = [*(id *)(a1 + 32) output];
          v18 = [v11 objectForKey:v16];
          [v17 addObject:v18];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v13);
    }

    [*(id *)(a1 + 32) finishRunningWithError:v21];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v20];
  }
}

void __56__WFSelectPhotoAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 localIdentifier];
  [v2 setObject:v3 forKey:v4];
}

@end