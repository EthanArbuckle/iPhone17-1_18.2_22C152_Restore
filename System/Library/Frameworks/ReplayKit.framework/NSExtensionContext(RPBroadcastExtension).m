@interface NSExtensionContext(RPBroadcastExtension)
- (void)completeRequestWithBroadcastURL:()RPBroadcastExtension broadcastConfiguration:setupInfo:;
- (void)completeRequestWithBroadcastURL:()RPBroadcastExtension setupInfo:;
- (void)loadBroadcastingApplicationInfoWithCompletion:()RPBroadcastExtension;
@end

@implementation NSExtensionContext(RPBroadcastExtension)

- (void)completeRequestWithBroadcastURL:()RPBroadcastExtension setupInfo:
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(RPBroadcastConfiguration);
  [a1 completeRequestWithBroadcastURL:v7 broadcastConfiguration:v8 setupInfo:v6];
}

- (void)completeRequestWithBroadcastURL:()RPBroadcastExtension broadcastConfiguration:setupInfo:
{
  v46[1] = *MEMORY[0x263EF8340];
  id v7 = (objc_class *)MEMORY[0x263F08810];
  id v8 = a5;
  id v40 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  id v11 = objc_alloc(MEMORY[0x263F086A0]);
  v12 = [NSString _rpLocalizationNotNeeded:@"kRPBroadcastExtensionKeyExtensionServiceURL"];
  v13 = (void *)[v11 initWithString:v12];
  [v10 setAttributedTitle:v13];

  id v14 = objc_alloc(MEMORY[0x263F088E0]);
  uint64_t v15 = *MEMORY[0x263F01A08];
  v16 = (void *)[v14 initWithItem:v9 typeIdentifier:*MEMORY[0x263F01A08]];

  v46[0] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:1];
  [v10 setAttachments:v17];

  id v18 = objc_alloc_init(MEMORY[0x263F08810]);
  id v19 = objc_alloc(MEMORY[0x263F086A0]);
  v20 = [NSString _rpLocalizationNotNeeded:@"RPBroadcastExtensionKeyExtensionUserInfo"];
  v21 = (void *)[v19 initWithString:v20];
  [v18 setAttributedTitle:v21];

  v22 = (void *)[objc_alloc(MEMORY[0x263F088E0]) initWithItem:v8 typeIdentifier:v15];
  v45 = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
  [v18 setAttachments:v23];

  v24 = [MEMORY[0x263F086E0] mainBundle];
  v25 = [v24 bundleIdentifier];

  id v26 = objc_alloc_init(MEMORY[0x263F08810]);
  id v27 = objc_alloc(MEMORY[0x263F086A0]);
  v28 = [NSString _rpLocalizationNotNeeded:@"RPBroadcastExtensionKeyExtensionBundleIdentifier"];
  v29 = (void *)[v27 initWithString:v28];
  [v26 setAttributedTitle:v29];

  v30 = (void *)[objc_alloc(MEMORY[0x263F088E0]) initWithItem:v25 typeIdentifier:v15];
  v44 = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
  [v26 setAttachments:v31];

  v32 = [MEMORY[0x263F08910] archivedDataWithRootObject:v40];

  id v33 = objc_alloc_init(MEMORY[0x263F08810]);
  id v34 = objc_alloc(MEMORY[0x263F086A0]);
  v35 = [NSString _rpLocalizationNotNeeded:@"RPBroadcastExtensionKeyBroadcastConfiguration"];
  v36 = (void *)[v34 initWithString:v35];
  [v33 setAttributedTitle:v36];

  v37 = (void *)[objc_alloc(MEMORY[0x263F088E0]) initWithItem:v32 typeIdentifier:v15];
  v43 = v37;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
  [v33 setAttachments:v38];

  v42[0] = v18;
  v42[1] = v26;
  v42[2] = v33;
  v42[3] = v10;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
  [a1 completeRequestReturningItems:v39 completionHandler:0];
}

- (void)loadBroadcastingApplicationInfoWithCompletion:()RPBroadcastExtension
{
  id v4 = a3;
  id v5 = (id)*MEMORY[0x263F01A08];
  id v6 = [a1 inputItems];
  id v7 = [v6 firstObject];

  id v8 = [v7 attachments];
  id v9 = [v8 firstObject];

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__0;
  v13[4] = __Block_byref_object_dispose__0;
  id v14 = 0;
  if ([v9 hasItemConformingToTypeIdentifier:v5])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __90__NSExtensionContext_RPBroadcastExtension__loadBroadcastingApplicationInfoWithCompletion___block_invoke;
    v10[3] = &unk_26451DDD8;
    v12 = v13;
    id v11 = v4;
    [v9 loadItemForTypeIdentifier:v5 options:0 completionHandler:v10];
  }
  _Block_object_dispose(v13, 8);
}

@end