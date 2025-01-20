@interface DOCSourceObserver
- (BOOL)hasReceivedFirstFullUpdate;
- (BOOL)isProviderNode:(id)a3;
- (BOOL)providerNodesFullyPopulated;
- (DOCSourceBuilder)sourceBuilder;
- (DOCSourceObserver)initWithUserAction:(unint64_t)a3 hostIdentifier:(id)a4;
- (FINode)providerDomainsNode;
- (FINodeObserver)providerDomainsFINodeObserver;
- (NSArray)legacyPickers;
- (NSArray)providerNodes;
- (NSArray)providers;
- (NSArray)sources;
- (NSError)legacyPickersObserverError;
- (NSError)sourcesObserverError;
- (NSMutableDictionary)sourcesSubscribers;
- (NSMutableSet)pendingChildPropertyChanges;
- (NSObject)mdmHostIdentifierDidChangeNotificationObserver;
- (OS_dispatch_queue)sourceObserverQueue;
- (_TtC11SaveToFiles16DOCActionManager)sourcesActionManager;
- (id)_addSubscriberForConfiguration:(id)a3 usingBlock:(id)a4;
- (id)_sourcesByBuildingWithSourceBuilder;
- (id)actionManagersFromSources;
- (id)addSubscriber:(id)a3;
- (id)addSubscriberForConfiguration:(id)a3 usingBlock:(id)a4;
- (id)cachedDisplayNameForSourceIdentifier:(id)a3;
- (id)consolidatedErrorIfExists;
- (id)legacyPickersObserverContext;
- (id)sourceForIdentifier:(id)a3;
- (id)startObservingLegacyPickers;
- (int)defaultSaveLocationObserverContext;
- (int)startObservingDefaultSaveLocation;
- (unint64_t)observationCount;
- (void)childChanged:(id)a3 in:(id)a4 for:(unsigned int)a5;
- (void)childrenAdded:(id)a3 to:(id)a4;
- (void)childrenDeleted:(id)a3 from:(id)a4;
- (void)dealloc;
- (void)didReceiveSourceUpdate;
- (void)domainDisplayNameForItem:(id)a3 completion:(id)a4;
- (void)nodeShouldBeReloaded:(id)a3;
- (void)notifySubscriber:(id)a3;
- (void)notifySubscribers;
- (void)openSyncCompleted:(id)a3;
- (void)providersChanged;
- (void)removeSubscriberForToken:(id)a3;
- (void)retrieveAllSourcesCompletionBlock:(id)a3;
- (void)retrieveSourcesForConfiguration:(id)a3 usingBlock:(id)a4;
- (void)setDefaultSaveLocationObserverContext:(int)a3;
- (void)setLegacyPickers:(id)a3;
- (void)setLegacyPickersObserverContext:(id)a3;
- (void)setLegacyPickersObserverError:(id)a3;
- (void)setMdmHostIdentifierDidChangeNotificationObserver:(id)a3;
- (void)setObservationCount:(unint64_t)a3;
- (void)setPendingChildPropertyChanges:(id)a3;
- (void)setProviderDomainsFINodeObserver:(id)a3;
- (void)setProviderDomainsNode:(id)a3;
- (void)setProviderNodes:(id)a3;
- (void)setProviderNodesFullyPopulated:(BOOL)a3;
- (void)setSourceBuilder:(id)a3;
- (void)setSourceObserverQueue:(id)a3;
- (void)setSources:(id)a3;
- (void)setSourcesActionManager:(id)a3;
- (void)setSourcesObserverError:(id)a3;
- (void)setSourcesSubscribers:(id)a3;
- (void)sourceObserverQueue_didReceiveSourceUpdate;
- (void)startObservingSources;
- (void)stopObservingDefaultSaveLocation;
- (void)stopObservingLegacyPickers;
- (void)stopObservingSources;
- (void)updateCachedDisplayNamesFromSources;
- (void)updateProviderNodes;
@end

@implementation DOCSourceObserver

- (DOCSourceObserver)initWithUserAction:(unint64_t)a3 hostIdentifier:(id)a4
{
  id v6 = a4;
  v31.receiver = self;
  v31.super_class = (Class)DOCSourceObserver;
  v7 = [(DOCSourceObserver *)&v31 init];
  if (v7)
  {
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.DocumentManager.sources", v9);
    sourceObserverQueue = v7->_sourceObserverQueue;
    v7->_sourceObserverQueue = (OS_dispatch_queue *)v10;

    v7->_observationCount = 0;
    uint64_t v12 = +[NSMutableDictionary dictionary];
    sourcesSubscribers = v7->_sourcesSubscribers;
    v7->_sourcesSubscribers = (NSMutableDictionary *)v12;

    v14 = [[DOCSourceBuilder alloc] initWithUserAction:a3 hostIdentifier:v6];
    sourceBuilder = v7->_sourceBuilder;
    v7->_sourceBuilder = v14;

    v16 = objc_alloc_init(_TtC11SaveToFiles16DOCActionManager);
    sourcesActionManager = v7->_sourcesActionManager;
    v7->_sourcesActionManager = v16;

    StartFINode();
    uint64_t v18 = +[FINode providerDomainsContainer];
    providerDomainsNode = v7->_providerDomainsNode;
    v7->_providerDomainsNode = (FINode *)v18;

    uint64_t v20 = +[FINodeObserver observerForFINode:v7->_providerDomainsNode withObserver:v7];
    providerDomainsFINodeObserver = v7->_providerDomainsFINodeObserver;
    v7->_providerDomainsFINodeObserver = (FINodeObserver *)v20;

    objc_initWeak(&location, v7);
    v22 = +[NSNotificationCenter defaultCenter];
    v23 = +[NSOperationQueue mainQueue];
    uint64_t v24 = DOCManagedPermissionHostIdentifierDidChangeNotification;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000086F4;
    v28[3] = &unk_1005B7878;
    objc_copyWeak(&v29, &location);
    uint64_t v25 = [v22 addObserverForName:v24 object:0 queue:v23 usingBlock:v28];
    mdmHostIdentifierDidChangeNotificationObserver = v7->_mdmHostIdentifierDidChangeNotificationObserver;
    v7->_mdmHostIdentifierDidChangeNotificationObserver = v25;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v7;
}

- (void)dealloc
{
  if (self->_mdmHostIdentifierDidChangeNotificationObserver)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_mdmHostIdentifierDidChangeNotificationObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)DOCSourceObserver;
  [(DOCSourceObserver *)&v4 dealloc];
}

- (void)startObservingSources
{
  objc_initWeak(&location, self);
  v3 = [(DOCSourceObserver *)self sourceObserverQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000089D4;
  v4[3] = &unk_1005B78A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)stopObservingSources
{
  objc_initWeak(&location, self);
  v3 = [(DOCSourceObserver *)self sourceObserverQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008B64;
  v4[3] = &unk_1005B78A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)_addSubscriberForConfiguration:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(DOCSourceObserverToken);
  objc_initWeak(&location, self);
  v9 = [(DOCSourceObserver *)self sourceObserverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008D64;
  block[3] = &unk_1005B78C8;
  objc_copyWeak(&v20, &location);
  id v19 = v7;
  dispatch_queue_t v10 = v8;
  v17 = v10;
  id v18 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v9, block);

  v13 = v18;
  v14 = v10;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  return v14;
}

- (id)addSubscriberForConfiguration:(id)a3 usingBlock:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008EFC;
  v9[3] = &unk_1005B78F0;
  id v10 = a4;
  id v6 = v10;
  id v7 = [(DOCSourceObserver *)self _addSubscriberForConfiguration:a3 usingBlock:v9];

  return v7;
}

- (id)addSubscriber:(id)a3
{
  return [(DOCSourceObserver *)self addSubscriberForConfiguration:0 usingBlock:a3];
}

- (void)removeSubscriberForToken:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(DOCSourceObserver *)self sourceObserverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009014;
  block[3] = &unk_1005B7918;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)retrieveAllSourcesCompletionBlock:(id)a3
{
}

- (void)retrieveSourcesForConfiguration:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000919C;
  v10[3] = &unk_1005B7940;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v11 = v8;
  id v9 = [(DOCSourceObserver *)self _addSubscriberForConfiguration:v6 usingBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)domainDisplayNameForItem:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000932C;
  v8[3] = &unk_1005B7968;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(DOCSourceObserver *)self retrieveAllSourcesCompletionBlock:v8];
}

- (id)sourceForIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(DOCSourceObserver *)self sources];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 identifier];
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)childrenAdded:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(DOCSourceObserver *)self sourceObserverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009754;
  block[3] = &unk_1005B7918;
  objc_copyWeak(&v12, &location);
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)childrenDeleted:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(DOCSourceObserver *)self sourceObserverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000990C;
  block[3] = &unk_1005B7918;
  objc_copyWeak(&v12, &location);
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)childChanged:(id)a3 in:(id)a4 for:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  if ([(DOCSourceObserver *)self isProviderNode:v8])
  {
    id v10 = self;
    objc_sync_enter(v10);
    id v11 = [(DOCSourceObserver *)v10 pendingChildPropertyChanges];
    id v12 = [v11 count];
    long long v13 = +[NSNumber numberWithUnsignedInt:v5];
    if (v11)
    {
      [v11 addObject:v13];
    }
    else
    {
      id v11 = +[NSMutableSet setWithObject:v13];

      [(DOCSourceObserver *)v10 setPendingChildPropertyChanges:v11];
    }

    objc_sync_exit(v10);
    if (!v12)
    {
      objc_initWeak(&location, v10);
      long long v14 = [(DOCSourceObserver *)v10 sourceObserverQueue];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100009B88;
      v15[3] = &unk_1005B78A0;
      objc_copyWeak(&v16, &location);
      dispatch_async(v14, v15);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

- (void)openSyncCompleted:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(DOCSourceObserver *)self sourceObserverQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009D94;
  v6[3] = &unk_1005B78A0;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)nodeShouldBeReloaded:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(DOCSourceObserver *)self sourceObserverQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009EB4;
  v6[3] = &unk_1005B78A0;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (NSArray)providers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(DOCSourceObserver *)v2 providerNodes];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) fpDomain];
        if (v8) {
          [v3 addObject:v8];
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return (NSArray *)v3;
}

- (void)updateProviderNodes
{
  v3 = [(DOCSourceObserver *)self sourceObserverQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(DOCSourceObserver *)self providerDomainsNode];
  id v9 = [v4 iteratorWithOptions:0];

  -[DOCSourceObserver setProviderNodesFullyPopulated:](self, "setProviderNodesFullyPopulated:", [v9 fullyPopulated]);
  id v5 = +[NSMutableArray array];
  uint64_t v6 = [v9 first];
  if (v6)
  {
    id v7 = (void *)v6;
    do
    {
      [v5 addObject:v7];
      uint64_t v8 = [v9 next];

      id v7 = (void *)v8;
    }
    while (v8);
  }
  [(DOCSourceObserver *)self setProviderNodes:v5];
}

- (NSArray)providerNodes
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_providerNodes;
  objc_sync_exit(v2);

  return v3;
}

- (void)setProviderNodes:(id)a3
{
  id v8 = a3;
  id v4 = [(DOCSourceObserver *)self sourceObserverQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = self;
  objc_sync_enter(v5);
  if ([(NSArray *)v5->_providerNodes isEqualToArray:v8])
  {
    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v6 = (NSArray *)[v8 copy];
    providerNodes = v5->_providerNodes;
    v5->_providerNodes = v6;

    objc_sync_exit(v5);
    [(DOCSourceObserver *)v5 providersChanged];
    [(DOCSourceObserver *)v5 sourceObserverQueue_didReceiveSourceUpdate];
  }
}

- (void)providersChanged
{
  v3 = [(DOCSourceObserver *)self sourceObserverQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(DOCSourceObserver *)self providers];
  id v5 = +[NSMutableDictionary dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "identifier", (void)v14);
        [v5 setObject:v11 forKeyedSubscript:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  +[FPProviderDomain setDomainCache:v5];
  long long v13 = +[DOCManagedPermission defaultPermission];
  [v13 cachePersonaStringForProviders:v6];
}

- (BOOL)isProviderNode:(id)a3
{
  id v4 = a3;
  id v5 = [(DOCSourceObserver *)self providerNodes];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (id)startObservingLegacyPickers
{
  objc_initWeak(&location, self);
  uint64_t v8 = NSExtensionPointName;
  CFStringRef v9 = @"com.apple.fileprovider-ui";
  v2 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A5C8;
  v5[3] = &unk_1005B79B8;
  objc_copyWeak(&v6, &location);
  v3 = +[NSExtension beginMatchingExtensionsWithAttributes:v2 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (void)stopObservingLegacyPickers
{
  v3 = [(DOCSourceObserver *)self legacyPickersObserverContext];

  if (v3)
  {
    id v4 = [(DOCSourceObserver *)self legacyPickersObserverContext];
    +[NSExtension endMatchingExtensions:v4];

    [(DOCSourceObserver *)self setLegacyPickersObserverContext:0];
  }
}

- (int)startObservingDefaultSaveLocation
{
  int out_token = 0;
  objc_initWeak(&location, self);
  v2 = (const char *)DOCDefaultSaveLocationDidChangeNotification;
  id v3 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000A8CC;
  handler[3] = &unk_1005B79E0;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch(v2, &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

  LODWORD(v2) = out_token;
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return (int)v2;
}

- (void)stopObservingDefaultSaveLocation
{
  if ([(DOCSourceObserver *)self defaultSaveLocationObserverContext])
  {
    notify_cancel([(DOCSourceObserver *)self defaultSaveLocationObserverContext]);
    [(DOCSourceObserver *)self setDefaultSaveLocationObserverContext:0];
  }
}

- (void)didReceiveSourceUpdate
{
  objc_initWeak(&location, self);
  id v3 = [(DOCSourceObserver *)self sourceObserverQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000AA30;
  v4[3] = &unk_1005B78A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)_sourcesByBuildingWithSourceBuilder
{
  id v3 = [(DOCSourceObserver *)self sourceBuilder];
  id v4 = [(DOCSourceObserver *)self providers];
  id v5 = [(DOCSourceObserver *)self legacyPickers];
  id v6 = [v3 buildSourcesProviders:v4 legacyWebViewFileProviders:v5];

  return v6;
}

- (void)sourceObserverQueue_didReceiveSourceUpdate
{
  id v3 = [(DOCSourceObserver *)self sourceObserverQueue];
  dispatch_assert_queue_V2(v3);

  if ([(DOCSourceObserver *)self hasReceivedFirstFullUpdate])
  {
    id v4 = [(DOCSourceObserver *)self _sourcesByBuildingWithSourceBuilder];
    [(DOCSourceObserver *)self setSources:v4];

    [(DOCSourceObserver *)self updateCachedDisplayNamesFromSources];
    id v5 = [(DOCSourceObserver *)self consolidatedErrorIfExists];
    [(DOCSourceObserver *)self setSourcesObserverError:v5];

    id v6 = [(DOCSourceObserver *)self actionManagersFromSources];
    id v7 = [(DOCSourceObserver *)self sourcesActionManager];
    [v7 setAssociatedActionManagers:v6];

    [(DOCSourceObserver *)self notifySubscribers];
  }
}

- (void)notifySubscribers
{
  id v3 = [(DOCSourceObserver *)self sourceObserverQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(DOCSourceObserver *)self sources];

  if (!v4)
  {
    id v5 = [(DOCSourceObserver *)self _sourcesByBuildingWithSourceBuilder];
    [(DOCSourceObserver *)self setSources:v5];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(DOCSourceObserver *)self sourcesSubscribers];
  id v7 = [v6 allValues];

  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(DOCSourceObserver *)self notifySubscriber:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11)];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)notifySubscriber:(id)a3
{
  id v4 = a3;
  id v5 = [v4 configuration];

  if (v5)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000AEF8;
    v17[3] = &unk_1005B7A08;
    id v6 = v4;
    id v18 = v6;
    id v7 = +[NSPredicate predicateWithBlock:v17];
    id v8 = [(DOCSourceObserver *)self sources];
    id v9 = [v8 filteredArrayUsingPredicate:v7];

    uint64_t v10 = [v6 block];
    long long v11 = [v6 token];
    long long v12 = [(DOCSourceObserver *)self sourcesObserverError];
    ((void (**)(void, void *, void *, void *))v10)[2](v10, v11, v9, v12);
  }
  else
  {
    long long v13 = [v4 block];
    long long v14 = [v4 token];
    long long v15 = [(DOCSourceObserver *)self sources];
    long long v16 = [(DOCSourceObserver *)self sourcesObserverError];
    ((void (**)(void, void *, void *, void *))v13)[2](v13, v14, v15, v16);
  }
}

- (id)consolidatedErrorIfExists
{
  id v3 = +[NSMutableArray array];
  id v4 = [(DOCSourceObserver *)self legacyPickersObserverError];

  if (v4)
  {
    id v5 = [(DOCSourceObserver *)self legacyPickersObserverError];
    [v3 addObject:v5];
  }
  if ([v3 count])
  {
    id v6 = +[NSError observerErrorWithUnderlyingErrors:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)hasReceivedFirstFullUpdate
{
  id v3 = [(DOCSourceObserver *)self legacyPickers];
  if (v3)
  {
  }
  else
  {
    id v4 = [(DOCSourceObserver *)self legacyPickersObserverError];

    if (!v4) {
      return 0;
    }
  }
  return [(DOCSourceObserver *)self providerNodesFullyPopulated];
}

- (id)actionManagersFromSources
{
  id v3 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(DOCSourceObserver *)self sources];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = [v9 actionManager];
          [v3 addObject:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v11 = [v3 copy];
  return v11;
}

- (void)updateCachedDisplayNamesFromSources
{
  id v3 = [(DOCSourceObserver *)self sourceBuilder];
  id v4 = [v3 userAction];

  if (!v4)
  {
    id v5 = objc_alloc((Class)NSUserDefaults);
    id v6 = [v5 initWithSuiteName:DOCDefaultsSuiteName];
    uint64_t v7 = DOCUserDefaultsCachedDisplayNamesBySourceIdentifier;
    id v8 = [v6 dictionaryForKey:DOCUserDefaultsCachedDisplayNamesBySourceIdentifier];
    id v9 = [(DOCSourceObserver *)self sources];
    uint64_t v10 = v9;
    if (v8)
    {
      id v11 = [v8 mutableCopy];
    }
    else
    {
      +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v9 count]);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    long long v12 = v11;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v10;
    id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v19 = objc_msgSend(v18, "displayName", (void)v21);
          id v20 = [v18 identifier];
          [v12 setObject:v19 forKeyedSubscript:v20];
        }
        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }

    if (([v8 isEqualToDictionary:v12] & 1) == 0) {
      [v6 setObject:v12 forKey:v7];
    }
  }
}

- (id)cachedDisplayNameForSourceIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSUserDefaults);
  id v5 = [v4 initWithSuiteName:DOCDefaultsSuiteName];
  id v6 = [v5 dictionaryForKey:DOCUserDefaultsCachedDisplayNamesBySourceIdentifier];
  uint64_t v7 = [v6 objectForKeyedSubscript:v3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v7 = 0;
  }

  return v7;
}

- (_TtC11SaveToFiles16DOCActionManager)sourcesActionManager
{
  return self->_sourcesActionManager;
}

- (void)setSourcesActionManager:(id)a3
{
}

- (OS_dispatch_queue)sourceObserverQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSourceObserverQueue:(id)a3
{
}

- (unint64_t)observationCount
{
  return self->_observationCount;
}

- (void)setObservationCount:(unint64_t)a3
{
  self->_observationCount = a3;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
}

- (NSError)sourcesObserverError
{
  return (NSError *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSourcesObserverError:(id)a3
{
}

- (NSMutableDictionary)sourcesSubscribers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSourcesSubscribers:(id)a3
{
}

- (BOOL)providerNodesFullyPopulated
{
  return self->_providerNodesFullyPopulated;
}

- (void)setProviderNodesFullyPopulated:(BOOL)a3
{
  self->_providerNodesFullyPopulated = a3;
}

- (NSMutableSet)pendingChildPropertyChanges
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPendingChildPropertyChanges:(id)a3
{
}

- (FINode)providerDomainsNode
{
  return (FINode *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProviderDomainsNode:(id)a3
{
}

- (FINodeObserver)providerDomainsFINodeObserver
{
  return (FINodeObserver *)objc_getProperty(self, a2, 88, 1);
}

- (void)setProviderDomainsFINodeObserver:(id)a3
{
}

- (NSArray)legacyPickers
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLegacyPickers:(id)a3
{
}

- (NSError)legacyPickersObserverError
{
  return (NSError *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLegacyPickersObserverError:(id)a3
{
}

- (id)legacyPickersObserverContext
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setLegacyPickersObserverContext:(id)a3
{
}

- (int)defaultSaveLocationObserverContext
{
  return self->_defaultSaveLocationObserverContext;
}

- (void)setDefaultSaveLocationObserverContext:(int)a3
{
  self->_defaultSaveLocationObserverContext = a3;
}

- (DOCSourceBuilder)sourceBuilder
{
  return (DOCSourceBuilder *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSourceBuilder:(id)a3
{
}

- (NSObject)mdmHostIdentifierDidChangeNotificationObserver
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setMdmHostIdentifierDidChangeNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdmHostIdentifierDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_sourceBuilder, 0);
  objc_storeStrong(&self->_legacyPickersObserverContext, 0);
  objc_storeStrong((id *)&self->_legacyPickersObserverError, 0);
  objc_storeStrong((id *)&self->_legacyPickers, 0);
  objc_storeStrong((id *)&self->_providerDomainsFINodeObserver, 0);
  objc_storeStrong((id *)&self->_providerDomainsNode, 0);
  objc_storeStrong((id *)&self->_pendingChildPropertyChanges, 0);
  objc_storeStrong((id *)&self->_sourcesSubscribers, 0);
  objc_storeStrong((id *)&self->_sourcesObserverError, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_sourceObserverQueue, 0);
  objc_storeStrong((id *)&self->_sourcesActionManager, 0);
  objc_storeStrong((id *)&self->_providerNodes, 0);
}

@end