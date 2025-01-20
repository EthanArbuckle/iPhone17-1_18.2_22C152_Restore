@interface BLTDebugObserverHolder
+ (void)startWithWKAppList:(id)a3;
- (BLTDebugObserverHolder)init;
- (BLTDebugObserverHolder)initWithWKAppList:(id)a3;
- (void)dealloc;
- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7;
@end

@implementation BLTDebugObserverHolder

+ (void)startWithWKAppList:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__BLTDebugObserverHolder_startWithWKAppList___block_invoke;
  v7[3] = &unk_2646840C0;
  id v8 = v4;
  id v9 = a1;
  uint64_t v5 = startWithWKAppList__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&startWithWKAppList__onceToken, v7);
  }
}

uint64_t __45__BLTDebugObserverHolder_startWithWKAppList___block_invoke(uint64_t a1)
{
  uint64_t result = BLTIsDebugOrInternalBuild();
  if (result)
  {
    startWithWKAppList____sharedInstance = [objc_alloc(*(Class *)(a1 + 40)) initWithWKAppList:*(void *)(a1 + 32)];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (BLTDebugObserverHolder)init
{
  return [(BLTDebugObserverHolder *)self initWithWKAppList:0];
}

- (BLTDebugObserverHolder)initWithWKAppList:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BLTDebugObserverHolder;
  uint64_t v5 = [(BLTDebugObserverHolder *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_wkAppList, v4);
    v7 = BLTWorkQueue();
    id v8 = BLTWorkQueue();
    uint64_t v9 = +[BLTBBObserver surrogateWithQueue:v7 calloutQueue:v8];
    observer = v6->_observer;
    v6->_observer = (BBObserver *)v9;

    [(BBObserver *)v6->_observer setDelegate:v6];
    [(BBObserver *)v6->_observer setObserverFeed:32878];
  }

  return v6;
}

- (void)dealloc
{
  [(BBObserver *)self->_observer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BLTDebugObserverHolder;
  [(BLTDebugObserverHolder *)&v3 dealloc];
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7
{
  BOOL v8 = a6;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v11 = a4;
  objc_super v12 = (void (**)(id, void))a7;
  v13 = blt_general_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [v11 sectionID];
    [v11 publisherMatchID];
    v25 = id v24 = v11;
    if (v8) {
      v15 = "YES";
    }
    else {
      v15 = "NO";
    }
    v16 = +[BLTPairedSyncCoordinator syncState];
    if ([v16 isInitialSyncComplete]) {
      v17 = "YES";
    }
    else {
      v17 = "NO";
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_wkAppList);
    *(_DWORD *)buf = 138413570;
    if ([WeakRetained isLoaded]) {
      v19 = "YES";
    }
    else {
      v19 = "NO";
    }
    v27 = v14;
    __int16 v28 = 2112;
    v29 = v25;
    __int16 v30 = 2048;
    unint64_t v31 = a5;
    __int16 v32 = 2080;
    v33 = v15;
    id v11 = v24;
    __int16 v34 = 2080;
    v35 = v17;
    __int16 v36 = 2080;
    v37 = v19;
    _os_log_impl(&dword_222F4C000, v13, OS_LOG_TYPE_INFO, "Bulletin in section %@ with matchID %@ sent to observers now on feed %lu with lightsandsirens: %s initSyncComplete: %s wkAppsLoaded: %s", buf, 0x3Eu);
  }
  v12[2](v12, 0);

  v20 = [MEMORY[0x263EFF910] date];
  if ((a5 & 0x806E) != 0)
  {
    kdebug_trace();
    if (v8)
    {
      v21 = blt_general_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = [v11 publishDate];
        [v20 timeIntervalSinceDate:v22];
        *(_DWORD *)buf = 134217984;
        v27 = v23;
        _os_log_impl(&dword_222F4C000, v21, OS_LOG_TYPE_INFO, "Bulletin raised after %f seconds from 'publish' date", buf, 0xCu);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wkAppList);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end