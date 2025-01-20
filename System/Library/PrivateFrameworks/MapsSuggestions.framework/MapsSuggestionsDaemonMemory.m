@interface MapsSuggestionsDaemonMemory
- (BOOL)hasSourceData;
- (BOOL)removeEntries:(id)a3 sourceName:(id)a4;
- (BOOL)replaceEntries:(id)a3 sourceName:(id)a4;
- (BOOL)setETA:(id)a3 destinationKey:(id)a4;
- (BOOL)setSignalPack:(id)a3;
- (MapsSuggestionsDaemonMemory)init;
- (MapsSuggestionsDestinationGraph)destinationGraph;
- (MapsSuggestionsFullResourceDepot)resourceDepot;
- (MapsSuggestionsLocationUpdater)locationUpdater;
- (MapsSuggestionsSourceWrapper)sourceWrapper;
- (NSString)uniqueName;
- (id).cxx_construct;
- (id)entriesForSourceName:(id)a3;
- (id)getETAForDestinationKey:(id)a3;
- (id)mapsAppFeeler;
- (id)signalPack;
- (id)signalPipeline;
- (id)sourceNames;
- (void)clear;
- (void)clearETAs;
@end

@implementation MapsSuggestionsDaemonMemory

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (MapsSuggestionsDaemonMemory)init
{
  v53.receiver = self;
  v53.super_class = (Class)MapsSuggestionsDaemonMemory;
  v2 = [(MapsSuggestionsDaemonMemory *)&v53 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    sub_100014064((dispatch_queue_t *)buf, @"MapsSuggestionsDaemonMemoryQueue", v3);
    v4 = *(OS_dispatch_queue **)buf;
    *(void *)buf = 0;
    innerQueue = v2->_queue._innerQueue;
    v2->_queue._innerQueue = v4;

    v6 = v67;
    v67 = 0;
    name = v2->_queue._name;
    v2->_queue._name = v6;

    v8 = (MapsSuggestionsSelfBuildingResourceDepot *)[objc_alloc((Class)MapsSuggestionsSelfBuildingResourceDepot) initWithName:@"destinationdResourceDepot"];
    resourceDepot = v2->_resourceDepot;
    v2->_resourceDepot = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    storage = v2->_storage;
    v2->_storage = v10;

    if (GEOConfigGetBOOL())
    {
      v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Destination Graph is enabled, creating destination graph object", buf, 2u);
      }

      v13 = objc_alloc_init(MapsSuggestionsDestinationGraph);
      destinationGraph = v2->_destinationGraph;
      v2->_destinationGraph = v13;
    }
    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    etas = v2->_etas;
    v2->_etas = v15;

    v17 = (MapsSuggestionsMutableSignalPack *)objc_alloc_init((Class)MapsSuggestionsMutableSignalPack);
    signalPack = v2->_signalPack;
    v2->_signalPack = v17;

    v19 = objc_alloc_init(MapsSuggestionsLeechingLocationUpdater);
    locationUpdater = v2->_locationUpdater;
    v2->_locationUpdater = (MapsSuggestionsLocationUpdater *)v19;

    v21 = v2->_resourceDepot;
    id v52 = 0;
    v49 = v21;
    *(void *)buf = objc_opt_class();
    v67 = (NSString *)objc_opt_class();
    uint64_t v68 = objc_opt_class();
    uint64_t v69 = objc_opt_class();
    uint64_t v70 = objc_opt_class();
    uint64_t v71 = objc_opt_class();
    uint64_t v72 = objc_opt_class();
    uint64_t v73 = objc_opt_class();
    v22 = +[NSArray arrayWithObjects:buf count:8];
    id v50 = [v22 mutableCopy];

    objc_storeStrong(&v52, v2->_locationUpdater);
    v23 = [MapsSuggestionsSignalPipeline alloc];
    v24 = [(MapsSuggestionsSelfBuildingResourceDepot *)v49 oneNetworkRequester];
    v25 = [(MapsSuggestionsSignalPipeline *)v23 initWithNetworkRequester:v24];

    v51 = objc_alloc_init(MapsSuggestionsMLSignalAlgorithm);
    -[MapsSuggestionsSignalPipeline setAlgorithm:](v25, "setAlgorithm:");
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = v50;
    id v26 = [obj countByEnumeratingWithState:&v54 objects:buf count:16];
    if (v26)
    {
      uint64_t v28 = *(void *)v55;
      *(void *)&long long v27 = 138412290;
      long long v47 = v27;
      while (2)
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v55 != v28) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          if ((objc_msgSend(v30, "conformsToProtocol:", &OBJC_PROTOCOL___MapsSuggestionsFeeler, v47) & 1) == 0)
          {
            v40 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v58 = 136446978;
              v59 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipelineBuilder.hpp";
              __int16 v60 = 1024;
              int v61 = 88;
              __int16 v62 = 2082;
              v63 = "MapsSuggestionsSignalPipeline *MSg::SignalPipelineBuilder::build()";
              __int16 v64 = 2082;
              v65 = "NO == [feelerClass conformsToProtocol:@protocol(MapsSuggestionsFeeler)]";
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. This is not really a Feeler", v58, 0x26u);
            }

            v39 = 0;
            goto LABEL_35;
          }
          if ([v30 isEnabled])
          {
            if (v30 == objc_opt_class())
            {
              v33 = [_TtC12destinationd28MapsSuggestionsWeatherFeeler alloc];
              v31 = [(MapsSuggestionsWeatherFeeler *)v33 initWithDelegate:v25 locationUpdater:v52];
              [(MapsSuggestionsSignalPipeline *)v25 addFeeler:v31];
            }
            else if (v30 == objc_opt_class())
            {
              v34 = [MapsSuggestionsMapsSyncFeeler alloc];
              v35 = [(MapsSuggestionsSelfBuildingResourceDepot *)v49 oneMapsSync];
              v31 = [(MapsSuggestionsMapsSyncFeeler *)v34 initWithDelegate:v25 mapsSync:v35];

              [(MapsSuggestionsSignalPipeline *)v25 addFeeler:v31];
            }
            else if (v30 == objc_opt_class())
            {
              v36 = [MapsSuggestionsWalletFeeler alloc];
              id v37 = [objc_alloc((Class)MapsSuggestionsWallet) initFromResourceDepot:v49];
              v31 = [(MapsSuggestionsWalletFeeler *)v36 initWithDelegate:v25 wallet:v37];

              [(MapsSuggestionsSignalPipeline *)v25 addFeeler:v31];
            }
            else if (v30 == objc_opt_class())
            {
              v38 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)v58 = 0;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "@@@ bluetoothFeeler: initinalzing the feeler", v58, 2u);
              }

              v31 = [(MapsSuggestionsBaseFeeler *)[MapsSuggestionsVehicleBluetoothFeeler alloc] initWithDelegate:v25];
              [(MapsSuggestionsSignalPipeline *)v25 addFeeler:v31];
            }
            else
            {
              v31 = (MapsSuggestionsVehicleBluetoothFeeler *)[objc_alloc((Class)v30) initWithDelegate:v25];
              [(MapsSuggestionsSignalPipeline *)v25 addFeeler:v31];
            }
          }
          else
          {
            GEOFindOrCreateLog();
            v31 = (MapsSuggestionsVehicleBluetoothFeeler *)(id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v31->super.super.super, OS_LOG_TYPE_DEBUG))
            {
              v32 = [v30 description];
              *(_DWORD *)v58 = v47;
              v59 = v32;
              _os_log_impl((void *)&_mh_execute_header, &v31->super.super.super, OS_LOG_TYPE_DEBUG, "Feeler %@ is disabled", v58, 0xCu);
            }
          }
        }
        id v26 = [obj countByEnumeratingWithState:&v54 objects:buf count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    v39 = v25;
LABEL_35:

    pipeline = v2->_pipeline;
    v2->_pipeline = v39;

    v42 = [(MapsSuggestionsBaseFeeler *)[MapsSuggestionsMapsAppFeeler alloc] initWithDelegate:v2->_pipeline];
    mapsAppFeeler = v2->_mapsAppFeeler;
    v2->_mapsAppFeeler = v42;

    v44 = [[MapsSuggestionsSourceWrapper alloc] initWithMemory:v2 locationUpdater:v2->_locationUpdater];
    sourceWrapper = v2->_sourceWrapper;
    v2->_sourceWrapper = v44;

    [(MapsSuggestionsSignalPipeline *)v2->_pipeline addFeeler:v2->_mapsAppFeeler];
  }
  return v2;
}

- (MapsSuggestionsFullResourceDepot)resourceDepot
{
  return self->_resourceDepot;
}

- (BOOL)hasSourceData
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002E8A8;
  v3[3] = &unk_100071E08;
  v3[4] = self;
  return sub_100016378((NSObject **)&self->_queue, v3);
}

- (id)sourceNames
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002EA24;
  v8[3] = &unk_100071E30;
  v8[4] = self;
  v3 = v8;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10002FD70;
  v16 = sub_10002FD80;
  id v17 = 0;
  innerQueue = self->_queue._innerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FD88;
  block[3] = &unk_100071690;
  id v10 = v3;
  v11 = &v12;
  v5 = v3;
  dispatch_sync(innerQueue, block);
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (id)entriesForSourceName:(id)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002EBA4;
  v10[3] = &unk_100071E58;
  v10[4] = self;
  id v11 = a3;
  id v4 = v11;
  v5 = v10;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_10002FD70;
  v19 = sub_10002FD80;
  id v20 = 0;
  innerQueue = self->_queue._innerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FDDC;
  block[3] = &unk_100071690;
  id v13 = v5;
  uint64_t v14 = &v15;
  v7 = v5;
  dispatch_sync(innerQueue, block);
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)replaceEntries:(id)a3 sourceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsDaemonMemory.mm";
      __int16 v17 = 1024;
      int v18 = 93;
      __int16 v19 = 2082;
      id v20 = "-[MapsSuggestionsDaemonMemory replaceEntries:sourceName:]";
      __int16 v21 = 2082;
      v22 = "nil == (entries)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires zero or more entries", buf, 0x26u);
    }
    goto LABEL_9;
  }
  if (!v7)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsDaemonMemory.mm";
      __int16 v17 = 1024;
      int v18 = 94;
      __int16 v19 = 2082;
      id v20 = "-[MapsSuggestionsDaemonMemory replaceEntries:sourceName:]";
      __int16 v21 = 2082;
      v22 = "nil == (sourceName)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source name", buf, 0x26u);
    }
LABEL_9:

    char v9 = 0;
    goto LABEL_10;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002EE6C;
  v12[3] = &unk_100071E80;
  v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  char v9 = sub_100016378((NSObject **)&self->_queue, v12);

LABEL_10:
  return v9;
}

- (BOOL)removeEntries:(id)a3 sourceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      int v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsDaemonMemory.mm";
      __int16 v19 = 1024;
      int v20 = 105;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsDaemonMemory removeEntries:sourceName:]";
      __int16 v23 = 2082;
      v24 = "nil == (entries)";
      id v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires zero or more entries";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, v11, buf, 0x26u);
    }
LABEL_9:
    char v9 = 0;
    goto LABEL_10;
  }
  if (!v7)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      int v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsDaemonMemory.mm";
      __int16 v19 = 1024;
      int v20 = 106;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsDaemonMemory removeEntries:sourceName:]";
      __int16 v23 = 2082;
      v24 = "nil == (sourceName)";
      id v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source name";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002F124;
  v13[3] = &unk_100071E80;
  id v14 = v6;
  uint64_t v15 = self;
  id v16 = v8;
  char v9 = sub_100016378((NSObject **)&self->_queue, v13);

  id v10 = v14;
LABEL_10:

  return v9;
}

- (BOOL)setETA:(id)a3 destinationKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [v6 copy];
    p_queue = (NSObject **)&self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002F444;
    v13[3] = &unk_100071E80;
    void v13[4] = self;
    id v14 = v7;
    id v15 = v8;
    id v10 = v8;
    char v11 = sub_100016378(p_queue, v13);
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsDaemonMemory.mm";
      __int16 v18 = 1024;
      int v19 = 119;
      __int16 v20 = 2082;
      __int16 v21 = "-[MapsSuggestionsDaemonMemory setETA:destinationKey:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (destinationKey)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destinationd key", buf, 0x26u);
    }
    char v11 = 0;
  }

  return v11;
}

- (id)getETAForDestinationKey:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002F8F0;
    v12[3] = &unk_100071EA8;
    v12[4] = self;
    id v13 = v4;
    id v6 = v12;
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = sub_10002FD70;
    *(void *)&buf[32] = sub_10002FD80;
    id v18 = 0;
    innerQueue = self->_queue._innerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002FE30;
    block[3] = &unk_100071690;
    id v15 = v6;
    id v16 = buf;
    id v8 = v6;
    dispatch_sync(innerQueue, block);
    id v9 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsDaemonMemory.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 146;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsDaemonMemory getETAForDestinationKey:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (destinationKey)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destinationd key", buf, 0x26u);
    }

    id v9 = 0;
  }

  return v9;
}

- (void)clearETAs
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Clearing all donated ETAs", v10, 2u);
  }

  id v4 = self;
  v5 = &stru_100071EE8;
  if (v4)
  {
    id v6 = v4;
    innerQueue = v4->_queue._innerQueue;
    *(void *)id v10 = _NSConcreteStackBlock;
    *(void *)&v10[8] = 3221225472;
    *(void *)&v10[16] = sub_10002FE84;
    *(void *)&v10[24] = &unk_100071910;
    *(void *)&v10[32] = v6;
    id v8 = &stru_100071EE8;
    char v11 = &stru_100071EE8;
    dispatch_async(innerQueue, v10);

    id v9 = *(NSObject **)&v10[32];
  }
  else
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id v10 = 136446978;
      *(void *)&v10[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsQueue.hpp";
      *(_WORD *)&v10[12] = 1024;
      *(_DWORD *)&v10[14] = 208;
      *(_WORD *)&v10[18] = 2082;
      *(void *)&v10[20] = "void MSg::Queue::async(S *, void (^__strong)(S *)) const [S = MapsSuggestionsDaemonMemory]";
      *(_WORD *)&v10[28] = 2082;
      *(void *)&v10[30] = "nil == (callerSelf)";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires self", v10, 0x26u);
    }
  }
}

- (id)signalPipeline
{
  return self->_pipeline;
}

- (BOOL)setSignalPack:(id)a3
{
  id v4 = self;
  id v5 = a3;
  objc_sync_enter(v4);
  id v6 = [v5 copy];

  LOBYTE(v5) = [v6 mergeIntoSignalPack:v4->_signalPack];
  objc_sync_exit(v4);

  return (char)v5;
}

- (id)signalPack
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MapsSuggestionsMutableSignalPack *)v2->_signalPack copy];
  objc_sync_exit(v2);

  return v3;
}

- (id)mapsAppFeeler
{
  return self->_mapsAppFeeler;
}

- (void)clear
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FC9C;
  block[3] = &unk_100071F10;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, block);
}

- (MapsSuggestionsLocationUpdater)locationUpdater
{
  return self->_locationUpdater;
}

- (MapsSuggestionsSourceWrapper)sourceWrapper
{
  return self->_sourceWrapper;
}

- (MapsSuggestionsDestinationGraph)destinationGraph
{
  return self->_destinationGraph;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationGraph, 0);
  objc_storeStrong((id *)&self->_sourceWrapper, 0);
  objc_storeStrong((id *)&self->_locationUpdater, 0);
  objc_storeStrong((id *)&self->_mapsAppFeeler, 0);
  objc_storeStrong((id *)&self->_signalPack, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_storeStrong((id *)&self->_etas, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_resourceDepot, 0);

  innerQueue = self->_queue._innerQueue;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end