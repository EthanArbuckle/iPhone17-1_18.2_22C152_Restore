@interface BDSBookWidgetDataUpdater
+ (id)predicateToExcludeLibraryAssetsWithExplicitContent;
- (BDSBookWidgetDataFile)dataFile;
- (BDSBookWidgetDataUpdater)initWithWidgetCenterManager:(id)a3 managedObjectContext:(id)a4;
- (BDSWidgetCenterManager)widgetCenterManager;
- (BOOL)_moc_updateAndMonitorProgressForWidgetDatas:(id)a3;
- (BOOL)_moc_updateWidgetDataFromWidgetInfo:(id)a3;
- (BOOL)_moc_updateWidgetDatas:(id)a3 fromAssetDetails:(id)a4;
- (BOOL)dataFileDataIsNil;
- (BOOL)isExplicitMaterialAllowed;
- (NSArray)currentWidgetDatas;
- (NSDictionary)currentWidgetDatasByAssetID;
- (NSFetchedResultsController)fetchedResultsController;
- (NSFetchedResultsController)progressFetchedResultsController;
- (NSManagedObjectContext)moc;
- (float)_roundReadingProgressLikeBooksApp:(float)a3 isFinished:(BOOL)a4;
- (id)_newWidgetInfoFetchRequest;
- (void)_handleSignificantTimeChangeNotification:(id)a3;
- (void)_moc_updateAndMonitorBookWidgetInfo;
- (void)_readCurrentWidgetDatas;
- (void)_saveCurrentWidgetDatas;
- (void)_saveWidgetDatasWithWidgetDatasHaveChanged:(BOOL)a3;
- (void)_startObserving;
- (void)_stopObserving;
- (void)controller:(id)a3 didChangeContentWithDifference:(id)a4;
- (void)dealloc;
- (void)reloadWidgetTimelines;
- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3;
- (void)resume;
- (void)setCurrentWidgetDatas:(id)a3;
- (void)setCurrentWidgetDatas:(id)a3 currentWidgetDatasByAssetID:(id)a4;
- (void)setDataFile:(id)a3;
- (void)setDataFileDataIsNil:(BOOL)a3;
- (void)setFetchedResultsController:(id)a3;
- (void)setProgressFetchedResultsController:(id)a3;
@end

@implementation BDSBookWidgetDataUpdater

- (BDSBookWidgetDataUpdater)initWithWidgetCenterManager:(id)a3 managedObjectContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BDSBookWidgetDataUpdater;
  v9 = [(BDSBookWidgetDataUpdater *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_moc, a4);
    currentWidgetDatas = v10->_currentWidgetDatas;
    v10->_currentWidgetDatas = (NSArray *)&__NSArray0__struct;

    currentWidgetDatasByAssetID = v10->_currentWidgetDatasByAssetID;
    v10->_currentWidgetDatasByAssetID = (NSDictionary *)&__NSDictionary0__struct;

    uint64_t v13 = +[BDSBookWidgetDataFile sharedInstance];
    dataFile = v10->_dataFile;
    v10->_dataFile = (BDSBookWidgetDataFile *)v13;

    v10->_dataFileDataIsNil = 0;
    v10->_dataLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_widgetCenterManager, a3);
  }

  return v10;
}

- (void)_startObserving
{
  v3 = +[BURestrictionsProvider sharedInstance];
  [v3 addObserver:self];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_handleSignificantTimeChangeNotification:" name:@"BDSNotificationForwarderSignificantTimeChangeNotification" object:0];
}

- (void)_stopObserving
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"BDSNotificationForwarderSignificantTimeChangeNotification" object:0];

  id v4 = +[BURestrictionsProvider sharedInstance];
  [v4 removeObserver:self];
}

- (NSArray)currentWidgetDatas
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_1000189FC;
  v15 = sub_100018A0C;
  id v16 = 0;
  p_dataLock = &self->_dataLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  id v7 = sub_100018A14;
  id v8 = &unk_10025F960;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_dataLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_dataLock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v4;
}

- (NSDictionary)currentWidgetDatasByAssetID
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_1000189FC;
  v15 = sub_100018A0C;
  id v16 = 0;
  p_dataLock = &self->_dataLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  id v7 = sub_100018B54;
  id v8 = &unk_10025F960;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_dataLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_dataLock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSDictionary *)v4;
}

- (void)setCurrentWidgetDatas:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "assetID", (void)v13);
        [v5 setObject:v11 forKeyedSubscript:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [(BDSBookWidgetDataUpdater *)self setCurrentWidgetDatas:v6 currentWidgetDatasByAssetID:v5];
}

- (void)setCurrentWidgetDatas:(id)a3 currentWidgetDatasByAssetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018D8C;
  v11[3] = &unk_10025F770;
  p_dataLock = &self->_dataLock;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  os_unfair_lock_lock(p_dataLock);
  sub_100018D8C((uint64_t)v11);
  os_unfair_lock_unlock(p_dataLock);
}

- (void)resume
{
  v3 = (void *)os_transaction_create();
  [(BDSBookWidgetDataUpdater *)self _readCurrentWidgetDatas];
  id v4 = [(BDSBookWidgetDataUpdater *)self moc];
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_100018F44;
  id v9 = &unk_10025F988;
  id v10 = v3;
  uint64_t v11 = self;
  id v5 = v3;
  [v4 performBlock:&v6];
  [(BDSBookWidgetDataUpdater *)self _startObserving];
}

- (void)dealloc
{
  [(BDSBookWidgetDataUpdater *)self _stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)BDSBookWidgetDataUpdater;
  [(BDSBookWidgetDataUpdater *)&v3 dealloc];
}

- (void)_moc_updateAndMonitorBookWidgetInfo
{
  objc_super v3 = (void *)os_transaction_create();
  id v4 = objc_alloc((Class)NSFetchedResultsController);
  id v5 = [(BDSBookWidgetDataUpdater *)self _newWidgetInfoFetchRequest];
  id v6 = [(BDSBookWidgetDataUpdater *)self moc];
  id v7 = [v4 initWithFetchRequest:v5 managedObjectContext:v6 sectionNameKeyPath:0 cacheName:0];

  [v7 setDelegate:self];
  [(BDSBookWidgetDataUpdater *)self setFetchedResultsController:v7];
  id v20 = 0;
  unsigned int v8 = [v7 performFetch:&v20];
  id v9 = v20;
  id v10 = sub_10000D068();
  uint64_t v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Initial fetch of widget info complete.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_1001E44FC((uint64_t)v9, v11);
  }

  id v12 = [v7 fetchedObjects];
  id v13 = [v12 count];
  if ((unint64_t)v13 >= 3) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = (uint64_t)v13;
  }
  long long v15 = objc_msgSend(v12, "subarrayWithRange:", 0, v14);
  BOOL v16 = [(BDSBookWidgetDataUpdater *)self _moc_updateWidgetDataFromWidgetInfo:v15];
  if (v16 || [(BDSBookWidgetDataUpdater *)self dataFileDataIsNil])
  {
    [(BDSBookWidgetDataUpdater *)self _saveWidgetDatasWithWidgetDatasHaveChanged:v16];
  }
  else
  {
    v17 = sub_10000D068();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No changes at startup, not notifying widget.", v18, 2u);
    }
  }
}

- (id)_newWidgetInfoFetchRequest
{
  objc_super v3 = +[NSCalendar currentCalendar];
  id v4 = +[NSDate date];
  id v5 = [v3 dateByAddingUnit:16 value:-14 toDate:v4 options:0];
  id v6 = [v3 startOfDayForDate:v5];

  id v7 = +[BDSBookWidgetInfoMO fetchRequest];
  [v7 setFetchBatchSize:3];
  unsigned int v8 = +[NSSortDescriptor sortDescriptorWithKey:@"readingNowDetail.lastEngagedDate" ascending:0];
  v23[0] = v8;
  id v9 = +[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:1];
  v23[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v23 count:2];
  [v7 setSortDescriptors:v10];

  uint64_t v11 = +[NSPredicate predicateWithFormat:@"readingNowDetail.isTrackedAsRecent == YES and readingNowDetail.lastEngagedDate >= %@", v6];
  unsigned int v12 = [(BDSBookWidgetDataUpdater *)self isExplicitMaterialAllowed];
  if (v12)
  {
    id v13 = v11;
  }
  else
  {
    v22[0] = v11;
    uint64_t v14 = +[BDSBookWidgetDataUpdater predicateToExcludeLibraryAssetsWithExplicitContent];
    v22[1] = v14;
    long long v15 = +[NSArray arrayWithObjects:v22 count:2];
    id v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v15];
  }
  BOOL v16 = sub_10000D068();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v19 = v12 ^ 1;
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "WidgetDataUpdater: explicitContentRestricted %{BOOL}d predicate:%@", buf, 0x12u);
  }

  [v7 setPredicate:v13];
  return v7;
}

- (BOOL)isExplicitMaterialAllowed
{
  v2 = +[BURestrictionsProvider sharedInstance];
  unsigned __int8 v3 = [v2 isExplicitContentAllowed];

  return v3;
}

+ (id)predicateToExcludeLibraryAssetsWithExplicitContent
{
  return +[NSPredicate predicateWithFormat:@"%K == NO OR %K == NULL", @"isExplicit", @"isExplicit"];
}

- (BOOL)_moc_updateWidgetDataFromWidgetInfo:(id)a3
{
  id v4 = a3;
  v27 = +[NSMutableArray array];
  id v5 = [(BDSBookWidgetDataUpdater *)self currentWidgetDatas];
  id v6 = [v4 count];
  v23 = v5;
  unsigned __int8 v31 = v6 != [v5 count];
  v22 = self;
  v26 = [(BDSBookWidgetDataUpdater *)self currentWidgetDatasByAssetID];
  id v7 = +[NSMutableDictionary dictionary];
  if ([v4 count])
  {
    unint64_t v8 = 0;
    v24 = v4;
    v25 = v7;
    do
    {
      id v9 = [v4 objectAtIndexedSubscript:v8];
      id v10 = [v9 assetID];
      uint64_t v11 = [v26 objectForKeyedSubscript:v10];
      v30 = [BDSBookWidgetData alloc];
      v29 = [v9 title];
      unsigned int v12 = [v9 pageProgressionDirection];
      id v13 = [v9 coverURL];
      v28 = v11;
      uint64_t v14 = [v11 readingProgress];
      long long v15 = [v9 totalDuration];
      BOOL v16 = [v9 cloudAssetType];
      v17 = [v9 libraryContentAssetType];
      v18 = [(BDSBookWidgetData *)v30 initWithAssetID:v10 title:v29 pageProgressionDirection:v12 coverURL:v13 readingProgress:v14 totalDuration:v15 cloudAssetType:v16 libraryAssetType:v17];

      id v7 = v25;
      [v27 addObject:v18];
      [v25 setObject:v18 forKeyedSubscript:v10];
      if ((v31 & 1) != 0 || v8 >= (unint64_t)[v23 count])
      {
        unsigned __int8 v31 = 1;
      }
      else
      {
        int v19 = [v23 objectAtIndexedSubscript:v8];
        unsigned __int8 v31 = [(BDSBookWidgetData *)v18 hasSignificantDifferenceWith:v19];
      }
      id v4 = v24;

      ++v8;
    }
    while (v8 < (unint64_t)[v24 count]);
  }
  char v20 = [(BDSBookWidgetDataUpdater *)v22 _moc_updateAndMonitorProgressForWidgetDatas:v7] | v31;
  if (v20) {
    [(BDSBookWidgetDataUpdater *)v22 setCurrentWidgetDatas:v27 currentWidgetDatasByAssetID:v7];
  }

  return v20;
}

- (void)_saveWidgetDatasWithWidgetDatasHaveChanged:(BOOL)a3
{
  BOOL v3 = a3;
  [(BDSBookWidgetDataUpdater *)self _saveCurrentWidgetDatas];
  if (v3)
  {
    id v5 = sub_10000D068();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will notify widget of changes", v6, 2u);
    }

    [(BDSBookWidgetDataUpdater *)self reloadWidgetTimelines];
  }
}

- (void)reloadWidgetTimelines
{
  id v4 = [(BDSBookWidgetDataUpdater *)self widgetCenterManager];
  BOOL v3 = [(BDSBookWidgetDataUpdater *)self currentWidgetDatas];
  objc_msgSend(v4, "reloadWidgetTimelinesWithShouldDonateRelevance:", objc_msgSend(v3, "count") != 0);
}

- (void)_readCurrentWidgetDatas
{
  BOOL v3 = [(BDSBookWidgetDataUpdater *)self dataFile];
  id v4 = [v3 load];

  if (v4) {
    [(BDSBookWidgetDataUpdater *)self setCurrentWidgetDatas:v4];
  }
  else {
    [(BDSBookWidgetDataUpdater *)self setDataFileDataIsNil:1];
  }
}

- (void)_saveCurrentWidgetDatas
{
  BOOL v3 = [(BDSBookWidgetDataUpdater *)self dataFile];
  id v4 = [(BDSBookWidgetDataUpdater *)self currentWidgetDatas];
  [v3 save:v4];

  [(BDSBookWidgetDataUpdater *)self setDataFileDataIsNil:0];
}

- (float)_roundReadingProgressLikeBooksApp:(float)a3 isFinished:(BOOL)a4
{
  float v4 = 0.0;
  if (a3 > 0.0)
  {
    float v5 = 0.99;
    if (a4) {
      float v5 = 1.0;
    }
    if (v5 >= a3)
    {
      float v5 = a3;
      if (a3 < 0.01) {
        float v5 = 0.01;
      }
    }
    return (double)(uint64_t)llround((float)(v5 * 100.0)) / 100.0;
  }
  return v4;
}

- (BOOL)_moc_updateWidgetDatas:(id)a3 fromAssetDetails:(id)a4
{
  id v6 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = a4;
  id v7 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v7)
  {
    id v8 = v7;
    char v25 = 0;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        unsigned int v12 = [v11 assetID];
        id v13 = [v6 objectForKeyedSubscript:v12];

        uint64_t v14 = sub_10000D068();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          long long v15 = [v13 title];
          [v11 readingProgress];
          *(_DWORD *)buf = 138412546;
          v32 = v15;
          __int16 v33 = 2048;
          double v34 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Reading progress for %@ is %f", buf, 0x16u);
        }
        [v11 readingProgress];
        int v18 = v17;
        id v19 = [v11 isFinished];
        LODWORD(v20) = v18;
        [(BDSBookWidgetDataUpdater *)self _roundReadingProgressLikeBooksApp:v19 isFinished:v20];
        id v21 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        if (v21)
        {
          v22 = [v13 readingProgress];
          unsigned __int8 v23 = [v22 isEqualToNumber:v21];

          if ((v23 & 1) == 0)
          {
            [v13 setReadingProgress:v21];
            char v25 = 1;
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v8);
  }
  else
  {
    char v25 = 0;
  }

  return v25 & 1;
}

- (BOOL)_moc_updateAndMonitorProgressForWidgetDatas:(id)a3
{
  id v4 = a3;
  float v5 = [v4 allKeys];
  id v6 = +[BCAssetDetail fetchRequest];
  id v7 = +[NSPredicate predicateWithFormat:@"%K in %@", @"assetID", v5];
  [v6 setPredicate:v7];

  v24[0] = @"assetID";
  v24[1] = @"readingProgress";
  id v8 = +[NSArray arrayWithObjects:v24 count:2];
  [v6 setPropertiesToFetch:v8];

  uint64_t v9 = +[NSSortDescriptor sortDescriptorWithKey:@"assetID" ascending:1];
  unsigned __int8 v23 = v9;
  id v10 = +[NSArray arrayWithObjects:&v23 count:1];
  [v6 setSortDescriptors:v10];

  id v11 = objc_alloc((Class)NSFetchedResultsController);
  unsigned int v12 = [(BDSBookWidgetDataUpdater *)self moc];
  id v13 = [v11 initWithFetchRequest:v6 managedObjectContext:v12 sectionNameKeyPath:0 cacheName:0];

  [v13 setDelegate:self];
  [(BDSBookWidgetDataUpdater *)self setProgressFetchedResultsController:v13];
  id v20 = 0;
  unsigned int v14 = [v13 performFetch:&v20];
  id v15 = v20;
  float v16 = sub_10000D068();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Started monitoring reading progress for assetIDs %@", buf, 0xCu);
    }

    float v16 = [v13 fetchedObjects];
    BOOL v18 = [(BDSBookWidgetDataUpdater *)self _moc_updateWidgetDatas:v4 fromAssetDetails:v16];
  }
  else
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Error starting FRC to monitor reading progress: %@", buf, 0xCu);
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (void)controller:(id)a3 didChangeContentWithDifference:(id)a4
{
  id v5 = a3;
  id v6 = (void *)os_transaction_create();
  id v7 = [(BDSBookWidgetDataUpdater *)self moc];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100019F98;
  v9[3] = &unk_10025F988;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  [v7 performBlockAndWait:v9];
}

- (void)_handleSignificantTimeChangeNotification:(id)a3
{
  id v4 = (void *)os_transaction_create();
  id v5 = sub_10000D068();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received significant time change. Refreshing book widget info", buf, 2u);
  }

  id v6 = [(BDSBookWidgetDataUpdater *)self moc];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001A2D4;
  v8[3] = &unk_10025F988;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [v6 performBlock:v8];
}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = sub_10000D068();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received explicit content change:%{BOOL}d. Refreshing book widget info", buf, 8u);
  }

  id v7 = [(BDSBookWidgetDataUpdater *)self moc];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001A45C;
  v9[3] = &unk_10025F988;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  [v7 performBlock:v9];
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (NSFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (void)setFetchedResultsController:(id)a3
{
}

- (NSFetchedResultsController)progressFetchedResultsController
{
  return self->_progressFetchedResultsController;
}

- (void)setProgressFetchedResultsController:(id)a3
{
}

- (BDSBookWidgetDataFile)dataFile
{
  return self->_dataFile;
}

- (void)setDataFile:(id)a3
{
}

- (BOOL)dataFileDataIsNil
{
  return self->_dataFileDataIsNil;
}

- (void)setDataFileDataIsNil:(BOOL)a3
{
  self->_dataFileDataIsNil = a3;
}

- (BDSWidgetCenterManager)widgetCenterManager
{
  return self->_widgetCenterManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetCenterManager, 0);
  objc_storeStrong((id *)&self->_dataFile, 0);
  objc_storeStrong((id *)&self->_progressFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_currentWidgetDatasByAssetID, 0);
  objc_storeStrong((id *)&self->_currentWidgetDatas, 0);
}

@end