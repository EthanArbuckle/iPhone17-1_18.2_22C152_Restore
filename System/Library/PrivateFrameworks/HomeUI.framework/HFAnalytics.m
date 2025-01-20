@interface HFAnalytics
@end

@implementation HFAnalytics

void __113__HFAnalytics_HUAdditions__logAndSendTileInteractionEventOfType_withPresentationContext_presentationCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    v7 = @"NotEmpty";
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v6) {
        objc_enumerationMutation(v3);
      }
      v9 = [*(id *)(*((void *)&v17 + 1) + 8 * v8) accessories];
      uint64_t v10 = [v9 count];

      if (v10) {
        break;
      }
      if (v5 == ++v8)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v5) {
          goto LABEL_3;
        }
        v7 = @"Empty";
        break;
      }
    }
  }
  else
  {
    v7 = @"Empty";
  }

  v11 = NSString;
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  uint64_t v14 = [v11 stringWithFormat:@"%@-%@", v13, v7, (void)v17];
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  objc_msgSend(*(id *)(a1 + 40), "na_safeSetObject:forKey:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *MEMORY[0x1E4F681C0]);
  [MEMORY[0x1E4F68EE0] sendEvent:13 withData:*(void *)(a1 + 40)];
}

@end