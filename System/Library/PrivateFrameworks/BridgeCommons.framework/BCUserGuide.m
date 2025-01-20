@interface BCUserGuide
- (BCUserGuide)init;
- (id)getUserGuideViewWithTitle:(id)a3;
@end

@implementation BCUserGuide

- (BCUserGuide)init
{
  v3.receiver = self;
  v3.super_class = (Class)BCUserGuide;
  return [(BCUserGuide *)&v3 init];
}

- (id)getUserGuideViewWithTitle:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  v4 = (id *)getHLPHelpViewControllerVersionLatestSymbolLoc_ptr;
  uint64_t v22 = getHLPHelpViewControllerVersionLatestSymbolLoc_ptr;
  if (!getHLPHelpViewControllerVersionLatestSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getHLPHelpViewControllerVersionLatestSymbolLoc_block_invoke;
    v24 = &unk_264937028;
    v25 = &v19;
    v5 = (void *)HelpKitLibrary();
    v6 = dlsym(v5, "HLPHelpViewControllerVersionLatest");
    *(void *)(v25[1] + 24) = v6;
    getHLPHelpViewControllerVersionLatestSymbolLoc_ptr = *(void *)(v25[1] + 24);
    v4 = (id *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v4)
  {
    -[BCUserGuide getUserGuideViewWithTitle:]();
    __break(1u);
  }
  id v7 = *v4;
  v8 = objc_msgSend(MEMORY[0x263F57730], "sharedInstance", v19);
  v9 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  v10 = [v8 getAllDevicesWithArchivedAltAccountDevicesMatching:v9];
  v11 = [v10 firstObject];

  if (v11)
  {
    uint64_t v12 = [v11 valueForProperty:*MEMORY[0x263F57668]];

    id v7 = (id)v12;
  }
  v13 = pbb_bridge_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = @"watch";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_22CE99000, v13, OS_LOG_TYPE_DEFAULT, "Asking HelpKit for %@ user guide, version: %@", buf, 0x16u);
  }

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v14 = (void *)getHLPHelpViewControllerClass_softClass;
  uint64_t v22 = getHLPHelpViewControllerClass_softClass;
  if (!getHLPHelpViewControllerClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getHLPHelpViewControllerClass_block_invoke;
    v24 = &unk_264937028;
    v25 = &v19;
    __getHLPHelpViewControllerClass_block_invoke((uint64_t)buf);
    v14 = (void *)v20[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v19, 8);
  v16 = objc_msgSend(v15, "helpViewControllerWithTitle:identifier:version:", v3, @"watch", v7, v19);
  [v16 setShowTopicViewOnLoad:1];
  v17 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v16];

  return v17;
}

- (uint64_t)getUserGuideViewWithTitle:.cold.1()
{
  return __getHLPHelpViewControllerClass_block_invoke_cold_1();
}

@end