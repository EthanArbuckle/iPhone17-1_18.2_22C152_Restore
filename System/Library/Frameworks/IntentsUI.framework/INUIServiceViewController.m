@interface INUIServiceViewController
@end

@implementation INUIServiceViewController

uint64_t __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(result + 16))(result, a2, a3, 0);
  }
  return result;
}

uint64_t __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(result + 16))(result, a2, a3, 0);
  }
  return result;
}

void __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_3(uint64_t a1, double a2, double a3)
{
  if (*(void *)(a1 + 48))
  {
    if (a2 == *MEMORY[0x263F001B0] && a3 == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      v7 = [MEMORY[0x263F087E8] errorWithDomain:@"INUIRemoteViewControllerErrorDomain" code:2 userInfo:0];
    }
    else
    {
      v7 = 0;
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_4;
    v12[3] = &unk_263FD6A08;
    v8 = *(void **)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v15 = v7;
    id v16 = v9;
    uint64_t v10 = *(void *)(a1 + 32);
    double v17 = a2;
    double v18 = a3;
    uint64_t v14 = v10;
    id v11 = v7;
    [v8 queryRepresentedPropertiesWithCompletion:v12];
  }
}

void __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v27 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v28 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v8 = [v7 rangeOfString:@"."];
        if (v8 == 0x7FFFFFFFFFFFFFFFLL && v9 == 0)
        {
          id v16 = 0;
          id v15 = 0;
        }
        else
        {
          uint64_t v11 = v8;
          uint64_t v12 = v9;
          id v13 = NSString;
          uint64_t v14 = [v7 substringToIndex:v8];
          id v15 = [v13 stringWithFormat:@"IN%@", v14];

          id v16 = [v7 substringFromIndex:v11 + v12];
        }
        double v17 = [*(id *)(a1 + 32) intent];
        double v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        if ([v15 isEqualToString:v19])
        {
        }
        else
        {
          v20 = [*(id *)(a1 + 32) intentResponse];
          v21 = (objc_class *)objc_opt_class();
          v22 = NSStringFromClass(v21);
          int v23 = [v15 isEqualToString:v22];

          if (!v23) {
            goto LABEL_16;
          }
        }
        v24 = [MEMORY[0x263F0FCE0] parameterForClass:NSClassFromString((NSString *)v15) keyPath:v16];
        [v27 addObject:v24];

LABEL_16:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v5);
  }

  uint64_t v25 = *(void *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "_constrainedSizeForDesiredSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  (*(void (**)(uint64_t, uint64_t, id, void))(v25 + 16))(v25, 1, v27, *(void *)(a1 + 48));
}

@end