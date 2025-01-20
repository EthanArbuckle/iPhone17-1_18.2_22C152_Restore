@interface DOCExtensionInterface
+ (id)hostProtocol;
+ (id)vendorProtocol;
@end

@implementation DOCExtensionInterface

+ (id)hostProtocol
{
  if (hostProtocol_onceToken != -1) {
    dispatch_once(&hostProtocol_onceToken, &__block_literal_global);
  }
  v2 = (void *)hostProtocol___interface;
  return v2;
}

uint64_t __37__DOCExtensionInterface_hostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C404580];
  uint64_t v1 = hostProtocol___interface;
  hostProtocol___interface = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)vendorProtocol
{
  if (vendorProtocol_onceToken != -1) {
    dispatch_once(&vendorProtocol_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)vendorProtocol___interface;
  return v2;
}

void __39__DOCExtensionInterface_vendorProtocol__block_invoke()
{
  v46 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C435340];
  v44 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C4353A0];
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C435400];
  v45 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C435460];
  [v0 setInterface:v46 forSelector:sel_getTransitionControllerForURL_completionBlock_ argumentIndex:0 ofReply:1];
  [v0 setInterface:v46 forSelector:sel_getTransitionControllerForItem_completionBlock_ argumentIndex:0 ofReply:1];
  v47 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C415A70];
  uint64_t v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v47 setClasses:v3 forSelector:sel__didTriggerCustomActionWithIdentifier_onItemBookmarks_ argumentIndex:1 ofReply:0];

  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  [v0 setClasses:v6 forSelector:sel__setAdditionalLeadingNavigationBarButtonItems_ argumentIndex:0 ofReply:0];

  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v0 setClasses:v9 forSelector:sel__setAdditionalTrailingNavigationBarButtonItems_ argumentIndex:0 ofReply:0];

  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
  [v0 setClasses:v19 forSelector:sel__renameDocumentAtURL_newName_completion_ argumentIndex:1 ofReply:1];

  v20 = (void *)MEMORY[0x263EFFA08];
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  [v47 setClasses:v22 forSelector:sel__didPickItemBookmarks_ argumentIndex:0 ofReply:0];

  v23 = (void *)MEMORY[0x263EFFA08];
  uint64_t v24 = objc_opt_class();
  v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  [v47 setClasses:v25 forSelector:sel__updateRemoteBarButtonFrames_forUUID_ argumentIndex:0 ofReply:0];

  v26 = (void *)MEMORY[0x263EFFA08];
  uint64_t v27 = objc_opt_class();
  v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
  [v47 setClasses:v28 forSelector:sel__updateRemoteBarButtonFrames_forUUID_ argumentIndex:1 ofReply:0];

  v29 = (void *)MEMORY[0x263EFFA08];
  uint64_t v30 = objc_opt_class();
  v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
  [v47 setClasses:v31 forSelector:sel__presentActivityViewControllerForItemBookmarks_withPopoverTracker_isContentManaged_additionalActivities_activityProxy_ argumentIndex:0 ofReply:0];

  [v47 setInterface:v44 forSelector:sel__presentActivityViewControllerForItemBookmarks_withPopoverTracker_isContentManaged_additionalActivities_activityProxy_ argumentIndex:1 ofReply:0];
  v32 = (void *)MEMORY[0x263EFFA08];
  uint64_t v33 = objc_opt_class();
  v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
  [v47 setClasses:v34 forSelector:sel__presentActivityViewControllerForItemBookmarks_withPopoverTracker_isContentManaged_additionalActivities_activityProxy_ argumentIndex:3 ofReply:0];

  [v47 setInterface:v45 forSelector:sel__presentActivityViewControllerForItemBookmarks_withPopoverTracker_isContentManaged_additionalActivities_activityProxy_ argumentIndex:4 ofReply:0];
  v35 = (void *)MEMORY[0x263EFFA08];
  uint64_t v36 = objc_opt_class();
  v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
  [v45 setClasses:v37 forSelector:sel_performAction_withURLs_completionHandler_ argumentIndex:1 ofReply:0];

  v38 = (void *)MEMORY[0x263EFFA08];
  uint64_t v39 = objc_opt_class();
  v40 = objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
  [v0 setClasses:v40 forSelector:sel__setCustomActions_ argumentIndex:0 ofReply:0];

  v41 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v41 forSelector:sel__setSceneIdentifier_ argumentIndex:0 ofReply:0];

  uint64_t v42 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C4354C0];
  v43 = (void *)vendorProtocol___interface;
  vendorProtocol___interface = v42;

  [(id)vendorProtocol___interface setInterface:v0 forSelector:sel_configureAsDocumentBrowserWithHostProxy_configuration_initialUIPBrowserState_completionBlock_ argumentIndex:0 ofReply:1];
  [(id)vendorProtocol___interface setInterface:v47 forSelector:sel_configureAsDocumentBrowserWithHostProxy_configuration_initialUIPBrowserState_completionBlock_ argumentIndex:0 ofReply:0];
}

@end