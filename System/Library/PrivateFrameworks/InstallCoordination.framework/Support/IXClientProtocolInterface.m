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
  WeakRetained = objc_loadWeakRetained(&qword_100109FD0);
  if (!WeakRetained)
  {
    v4 = [v2 interfaceProtocol];
    WeakRetained = +[NSXPCInterface interfaceWithProtocol:v4];

    [v2 configureInterface:WeakRetained];
    objc_storeWeak(&qword_100109FD0, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)interfaceProtocol
{
  return &OBJC_PROTOCOL___IXClientProtocol;
}

+ (void)configureInterface:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, objc_opt_class(), 0);
  [v3 setClasses:v5 forSelector:"_remote_fetchSeedsForCoordinatorsWithIntent:completion:" argumentIndex:0 ofReply:1];

  uint64_t v6 = objc_opt_class();
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
  [v3 setClasses:v7 forSelector:"_remote_registerObserverMachServiceName:forClientIdentifiers:respondingToSelectors:" argumentIndex:1 ofReply:0];

  uint64_t v8 = objc_opt_class();
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
  [v3 setClasses:v9 forSelector:"_remote_registerTransientObserver:forClientIdentifiers:respondingToSelectors:" argumentIndex:1 ofReply:0];

  uint64_t v10 = objc_opt_class();
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
  [v3 setClasses:v11 forSelector:"_remote_addObserversForCoordinatorsWithUUIDs:fireObserverMethods:" argumentIndex:0 ofReply:0];

  uint64_t v12 = objc_opt_class();
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
  [v3 setClasses:v13 forSelector:"_remote_addObserversForDataPromisesWithUUIDs:" argumentIndex:0 ofReply:0];

  uint64_t v14 = objc_opt_class();
  v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, objc_opt_class(), 0);
  [v3 setClasses:v15 forSelector:"_remote_IXSCoordinatedAppInstall:setInitialODRAssetPromiseUUIDs:completion:" argumentIndex:1 ofReply:0];

  uint64_t v16 = objc_opt_class();
  v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(), 0);
  [v3 setClasses:v17 forSelector:"_remote_IXSCoordinatedAppInstall:setEssentialAssetPromiseUUIDs:completion:" argumentIndex:1 ofReply:0];

  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, v19, objc_opt_class(), 0);
  [v3 setClasses:v20 forSelector:"_remote_IXSCoordinatedAppInstall:getInitialODRAssetPromises:" argumentIndex:0 ofReply:1];

  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, v22, objc_opt_class(), 0);
  [v3 setClasses:v23 forSelector:"_remote_IXSCoordinatedAppInstall:getEssentialAssetPromises:" argumentIndex:0 ofReply:1];

  uint64_t v24 = objc_opt_class();
  v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v24, objc_opt_class(), 0);
  [v3 setClasses:v25 forSelector:"_remote_IXSPlaceholder:setAppExtensionPlaceholderPromiseUUIDs:completion:" argumentIndex:1 ofReply:0];

  uint64_t v26 = objc_opt_class();
  v27 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v26, objc_opt_class(), 0);
  [v3 setClasses:v27 forSelector:"_remote_IXSPlaceholder:getAppExtensionPlaceholderPromises:" argumentIndex:0 ofReply:1];

  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v28, v29, objc_opt_class(), 0);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setClasses:v30 forSelector:"_remote_removabilityDataWithCompletion:" argumentIndex:0 ofReply:1];
}

@end