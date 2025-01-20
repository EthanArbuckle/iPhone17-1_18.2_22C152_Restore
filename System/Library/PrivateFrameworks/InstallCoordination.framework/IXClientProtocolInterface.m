@interface IXClientProtocolInterface
+ (id)interface;
+ (id)interfaceProtocol;
+ (id)new;
+ (void)configureInterface:(id)a3;
- (IXClientProtocolInterface)init;
@end

@implementation IXClientProtocolInterface

- (IXClientProtocolInterface)init
{
  result = (IXClientProtocolInterface *)_os_crash();
  __break(1u);
  return result;
}

+ (id)new
{
  id result = (id)_os_crash();
  __break(1u);
  return result;
}

+ (id)interface
{
  id v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&interface_weakInterface_0);
  if (!WeakRetained)
  {
    v4 = (void *)MEMORY[0x1E4F29280];
    v5 = [v2 interfaceProtocol];
    WeakRetained = [v4 interfaceWithProtocol:v5];

    [v2 configureInterface:WeakRetained];
    objc_storeWeak(&interface_weakInterface_0, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)interfaceProtocol
{
  return &unk_1EFE13478;
}

+ (void)configureInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel__remote_fetchSeedsForCoordinatorsWithIntent_completion_ argumentIndex:0 ofReply:1];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v4 setClasses:v9 forSelector:sel__remote_registerObserverMachServiceName_forClientIdentifiers_respondingToSelectors_ argumentIndex:1 ofReply:0];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v4 setClasses:v12 forSelector:sel__remote_registerTransientObserver_forClientIdentifiers_respondingToSelectors_ argumentIndex:1 ofReply:0];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  [v4 setClasses:v15 forSelector:sel__remote_addObserversForCoordinatorsWithUUIDs_fireObserverMethods_ argumentIndex:0 ofReply:0];

  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  [v4 setClasses:v18 forSelector:sel__remote_addObserversForDataPromisesWithUUIDs_ argumentIndex:0 ofReply:0];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  [v4 setClasses:v21 forSelector:sel__remote_IXSCoordinatedAppInstall_setInitialODRAssetPromiseUUIDs_completion_ argumentIndex:1 ofReply:0];

  v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  [v4 setClasses:v24 forSelector:sel__remote_IXSCoordinatedAppInstall_setEssentialAssetPromiseUUIDs_completion_ argumentIndex:1 ofReply:0];

  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  v28 = objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
  [v4 setClasses:v28 forSelector:sel__remote_IXSCoordinatedAppInstall_getInitialODRAssetPromises_ argumentIndex:0 ofReply:1];

  v29 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  v32 = objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0);
  [v4 setClasses:v32 forSelector:sel__remote_IXSCoordinatedAppInstall_getEssentialAssetPromises_ argumentIndex:0 ofReply:1];

  v33 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v34 = objc_opt_class();
  v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  [v4 setClasses:v35 forSelector:sel__remote_IXSPlaceholder_setAppExtensionPlaceholderPromiseUUIDs_completion_ argumentIndex:1 ofReply:0];

  v36 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v37 = objc_opt_class();
  v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
  [v4 setClasses:v38 forSelector:sel__remote_IXSPlaceholder_getAppExtensionPlaceholderPromises_ argumentIndex:0 ofReply:1];

  v39 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  objc_msgSend(v39, "setWithObjects:", v40, v41, objc_opt_class(), 0);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v42 forSelector:sel__remote_removabilityDataWithCompletion_ argumentIndex:0 ofReply:1];
}

@end