@interface NSExtensionContext
@end

@implementation NSExtensionContext

void __90__NSExtensionContext_RPBroadcastExtension__loadBroadcastingApplicationInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v22[2] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = v7;
    NSLog(&cfstr_Loadbroadcasti.isa, v7);
LABEL_9:

    goto LABEL_10;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (void *)MEMORY[0x263F08928];
    v10 = (void *)MEMORY[0x263EFFA08];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v21 = 0;
    v14 = [v9 unarchivedObjectOfClasses:v12 fromData:v13 error:&v21];
    id v8 = v21;

    if (v8) {
      NSLog(&cfstr_Loadbroadcasti_0.isa, v8);
    }
    v15 = [v14 objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoAppIcon"];

    if (v15)
    {
      v16 = (void *)MEMORY[0x263F1C6B0];
      v17 = [v14 objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoAppIcon"];
      v15 = [v16 imageWithData:v17];
    }
    uint64_t v18 = *(void *)(a1 + 32);
    v19 = [v14 objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoBundleID"];
    v20 = [v14 objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoAppName"];
    (*(void (**)(uint64_t, void *, void *, void *))(v18 + 16))(v18, v19, v20, v15);

    goto LABEL_9;
  }
LABEL_10:
}

@end