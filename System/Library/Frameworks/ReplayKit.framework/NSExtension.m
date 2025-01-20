@interface NSExtension
@end

@implementation NSExtension

void __125__NSExtension_RPExtensions__extensionsWithMatchingPointName_baseIdentifier_activationRule_unwantedActivationRule_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v29 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      uint64_t v9 = 0;
      uint64_t v30 = v7;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v32 + 1) + 8 * v9);
        v11 = [v10 extensionPointIdentifier];
        v12 = [v10 _extensionBundle];
        NSLog(&cfstr_Nsextensionpoi.isa, v11, v12);

        if (!*(void *)(a1 + 32)
          || ([v10 identifier],
              v13 = objc_claimAutoreleasedReturnValue(),
              int v14 = [v13 hasPrefix:*(void *)(a1 + 32)],
              v13,
              v14))
        {
          v15 = [v10 attributes];
          v16 = [v15 objectForKeyedSubscript:@"NSExtensionActivationRule"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = v8;
            id v18 = v16;
            v19 = v18;
            if (*(void *)(a1 + 40))
            {
              uint64_t v20 = objc_msgSend(v18, "objectForKeyedSubscript:");
              if (!v20) {
                goto LABEL_15;
              }
              v21 = (void *)v20;
              v22 = [v19 objectForKeyedSubscript:*(void *)(a1 + 40)];
              int v23 = [v22 BOOLValue];

              if (!v23) {
                goto LABEL_15;
              }
            }
            if (*(void *)(a1 + 48))
            {
              uint64_t v24 = objc_msgSend(v19, "objectForKeyedSubscript:");
              if (v24)
              {
                v25 = (void *)v24;
                v26 = [v19 objectForKeyedSubscript:*(void *)(a1 + 48)];
                char v27 = [v26 BOOLValue];

                if (v27)
                {
LABEL_15:

                  uint64_t v8 = v17;
                  uint64_t v7 = v30;
LABEL_20:

                  goto LABEL_21;
                }
              }
            }

            uint64_t v8 = v17;
            uint64_t v7 = v30;
          }
          else if (*(void *)(a1 + 40))
          {
            goto LABEL_20;
          }
          [*(id *)(a1 + 56) addObject:v10];
          goto LABEL_20;
        }
LABEL_21:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v7);
  }
  uint64_t v28 = *(void *)(a1 + 64);
  if (v28) {
    (*(void (**)(uint64_t, void, id))(v28 + 16))(v28, *(void *)(a1 + 56), v29);
  }
}

@end