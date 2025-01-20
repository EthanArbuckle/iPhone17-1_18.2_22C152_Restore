@interface WFiTunesStoreCountrySubstitutableState
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFiTunesStoreCountrySubstitutableState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __99__WFiTunesStoreCountrySubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v11[3] = &unk_264E5B5E8;
  id v12 = v8;
  v10.receiver = self;
  v10.super_class = (Class)WFiTunesStoreCountrySubstitutableState;
  id v9 = v8;
  [(WFVariableSubstitutableParameterState *)&v10 processWithContext:a3 userInputRequiredHandler:a4 valueHandler:v11];
}

void __99__WFiTunesStoreCountrySubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    uint64_t v17 = a1;
    id v18 = v6;
    id v8 = [MEMORY[0x263EFF960] currentLocale];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = [MEMORY[0x263EFF960] ISOCountryCodes];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      uint64_t v13 = *MEMORY[0x263EFF4D0];
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v15 = [v8 displayNameForKey:v13 value:*(void *)(*((void *)&v19 + 1) + 8 * v14)];
          int v16 = [v5 isEqualToString:v15];

          if (v16)
          {
            v7 = v18;
            (*(void (**)(void))(*(void *)(v17 + 32) + 16))();

            goto LABEL_12;
          }
          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    v7 = v18;
    (*(void (**)(void))(*(void *)(v17 + 32) + 16))();
LABEL_12:
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end