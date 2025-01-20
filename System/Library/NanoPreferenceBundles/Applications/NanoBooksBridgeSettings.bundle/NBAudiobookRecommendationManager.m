@interface NBAudiobookRecommendationManager
+ (id)sharedManager;
- (BDSNBPinningManager)pinningManager;
- (BOOL)hasFetchedInitialRecommendations;
- (NBAudiobookRecommendationManager)init;
- (NSArray)recommendations;
- (OS_dispatch_queue)queue;
- (void)_BCCloudCollectionMemberManagerChanged:(id)a3;
- (void)_BCCloudReadingNowDetailManagerChanged:(id)a3;
- (void)_notifyAudiobookRecommendationsDidUpdateNotification;
- (void)_pinningManager:(id)a3 updateWantToRead:(BOOL)a4 updateReadingNow:(BOOL)a5 completion:(id)a6;
- (void)_reloadRecommendationsFromDefaultsWithCompletion:(id)a3;
- (void)dealloc;
- (void)fetchRecommendationsWithQueue:(id)a3 completion:(id)a4;
- (void)persistRecommendationsSelections:(id)a3;
- (void)reloadRecommendationsIfNeeded:(id)a3;
- (void)setHasFetchedInitialRecommendations:(BOOL)a3;
- (void)setPinningManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecommendations:(id)a3;
- (void)updateBitRateForAdamID:(id)a3;
- (void)updatePinningManager;
- (void)updatePinningManagerForWantToRead:(BOOL)a3 forReadingNow:(BOOL)a4;
@end

@implementation NBAudiobookRecommendationManager

+ (id)sharedManager
{
  if (qword_28128 != -1) {
    dispatch_once(&qword_28128, &stru_20C40);
  }
  v2 = (void *)qword_28120;

  return v2;
}

- (NBAudiobookRecommendationManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)NBAudiobookRecommendationManager;
  v2 = [(NBAudiobookRecommendationManager *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoBooks.NBAudiobookRecommendationManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (BDSNBPinningManager *)objc_alloc_init((Class)BDSNBPinningManager);
    pinningManager = v2->_pinningManager;
    v2->_pinningManager = v6;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_handleMediaLibraryEntitiesAddedOrRemovedNotification:" name:MPMediaLibraryEntitiesAddedOrRemovedNotification object:0];
    [(NBAudiobookRecommendationManager *)v2 fetchRecommendationsWithQueue:0 completion:0];
    v9 = +[NSDistributedNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_BCCloudReadingNowDetailManagerChanged:" name:BCCloudReadingNowDetailManagerChanged object:0];

    v10 = +[NSDistributedNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_BCCloudCollectionMemberManagerChanged:" name:BCCloudCollectionMemberManagerChanged object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self name:BCCloudReadingNowDetailManagerChanged object:0];

  dispatch_queue_t v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 removeObserver:self name:BCCloudCollectionMemberManagerChanged object:0];

  v5.receiver = self;
  v5.super_class = (Class)NBAudiobookRecommendationManager;
  [(NBAudiobookRecommendationManager *)&v5 dealloc];
}

- (void)updatePinningManager
{
}

- (void)updatePinningManagerForWantToRead:(BOOL)a3 forReadingNow:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = NBRecommendationsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_13C04(v7);
  }

  objc_initWeak(&location, self);
  v8 = [(NBAudiobookRecommendationManager *)self pinningManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_113D8;
  v9[3] = &unk_20C68;
  objc_copyWeak(&v10, &location);
  [(NBAudiobookRecommendationManager *)self _pinningManager:v8 updateWantToRead:v5 updateReadingNow:v4 completion:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_pinningManager:(id)a3 updateWantToRead:(BOOL)a4 updateReadingNow:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v13 = a3;
  id v9 = a6;
  if (v8 && v7)
  {
    id v10 = [v13 updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful:1 completion:v9];
  }
  else if (v8)
  {
    id v11 = [v13 updateWantToReadWithCompletion:v9];
  }
  else if (v7)
  {
    id v12 = [v13 updateReadingNowWithCompletion:v9];
  }
}

- (void)reloadRecommendationsIfNeeded:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NBAudiobookRecommendationManager *)self queue];
  objc_initWeak(&location, self);
  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_11604;
    block[3] = &unk_20CB8;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
  }
  objc_destroyWeak(&location);
}

- (void)updateBitRateForAdamID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NBAudiobookRecommendationManager *)self pinningManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_11804;
  v7[3] = &unk_20CE0;
  id v8 = v4;
  id v6 = v4;
  [v5 updateBitrateForItemWithAdamID:v6 completion:v7];
}

- (void)fetchRecommendationsWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSUUID UUID];
  id v9 = NBRecommendationsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = objc_retainBlock(v7);
    *(_DWORD *)buf = 138412802;
    v21 = v8;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Will fetch recommendations for request: %@, on queue: %@, completion: %@", buf, 0x20u);
  }
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_11A04;
  v15[3] = &unk_20D58;
  id v16 = v6;
  v17 = self;
  id v18 = v8;
  id v19 = v7;
  id v12 = v7;
  id v13 = v8;
  id v14 = v6;
  dispatch_async(queue, v15);
}

- (void)persistRecommendationsSelections:(id)a3
{
  id v3 = a3;
  id v4 = NBRecommendationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Saving recommendations for %@", buf, 0xCu);
  }

  BOOL v5 = +[NMSMediaPinningManager sharedManager];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v19;
    *(void *)&long long v8 = 134218242;
    long long v17 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = (char *)objc_msgSend(v12, "type", v17, (void)v18);
        if (v13 == (unsigned char *)&dword_0 + 1)
        {
          objc_msgSend(v5, "setWantToReadEnabled:", objc_msgSend(v12, "isSelected"));
        }
        else if (v13)
        {
          id v14 = NBRecommendationsLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            id v15 = [v12 type];
            id v16 = [v12 title];
            *(_DWORD *)buf = v17;
            id v23 = v15;
            __int16 v24 = 2112;
            id v25 = v16;
            _os_log_error_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "Attempt to save Recommendation of unknown type %ld (%@)", buf, 0x16u);
          }
        }
        else
        {
          objc_msgSend(v5, "setReadingNowEnabled:", objc_msgSend(v12, "isSelected"));
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v9);
  }
}

- (void)_reloadRecommendationsFromDefaultsWithCompletion:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = objc_opt_new();
  id v7 = +[NMSMediaPinningManager sharedManager];
  long long v8 = [v7 readingNowAudiobooks];
  id v9 = [v8 array];

  uint64_t v10 = [[NBAudiobookRecommendation alloc] initWithAdamIDs:v9 type:0];
  -[NBAudiobookRecommendation setSelected:](v10, "setSelected:", [v7 isReadingNowEnabled]);
  [v6 addObject:v10];
  id v11 = [v7 wantToReadAudiobooks];
  id v12 = [v11 array];

  id v13 = [[NBAudiobookRecommendation alloc] initWithAdamIDs:v12 type:1];
  -[NBAudiobookRecommendation setSelected:](v13, "setSelected:", [v7 isWantToReadEnabled]);
  [v6 addObject:v13];
  unsigned int v14 = [(NSArray *)self->_recommendations isEqualToArray:v6];
  if (v14)
  {
    id v15 = NBRecommendationsLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    LOWORD(v21) = 0;
    id v16 = "Recommendations have not changed";
    long long v17 = v15;
    uint32_t v18 = 2;
  }
  else
  {
    [(NBAudiobookRecommendationManager *)self setRecommendations:v6];
    id v15 = NBRecommendationsLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    recommendations = self->_recommendations;
    int v21 = 138412290;
    __int16 v22 = recommendations;
    id v16 = "Recommendations contents updated: %@";
    long long v17 = v15;
    uint32_t v18 = 12;
  }
  _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v21, v18);
LABEL_7:

  long long v20 = (void (**)(id, void))objc_retainBlock(v5);
  if (v20) {
    v20[2](v20, v14 ^ 1);
  }
}

- (void)_notifyAudiobookRecommendationsDidUpdateNotification
{
  id v3 = NBRecommendationsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Notifying clients about updated recommendations", v5, 2u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"NBAudiobookRecommendationsDidUpdateNotification" object:self];
}

- (void)_BCCloudReadingNowDetailManagerChanged:(id)a3
{
  id v4 = NBRecommendationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "BCCloudReadingNowManagerChanged notification received", v6, 2u);
  }

  id v5 = +[NMSMediaPinningManager sharedManager];
  if (([v5 isReadingNowEnabled] & 1) == 0) {
    [(NBAudiobookRecommendationManager *)self updatePinningManagerForWantToRead:0 forReadingNow:1];
  }
}

- (void)_BCCloudCollectionMemberManagerChanged:(id)a3
{
  id v4 = NBRecommendationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "BCCloudCollectionMemberManagerChanged notification received", v6, 2u);
  }

  id v5 = +[NMSMediaPinningManager sharedManager];
  if (([v5 isWantToReadEnabled] & 1) == 0) {
    [(NBAudiobookRecommendationManager *)self updatePinningManagerForWantToRead:1 forReadingNow:0];
  }
}

- (NSArray)recommendations
{
  return self->_recommendations;
}

- (void)setRecommendations:(id)a3
{
}

- (BOOL)hasFetchedInitialRecommendations
{
  return self->_hasFetchedInitialRecommendations;
}

- (void)setHasFetchedInitialRecommendations:(BOOL)a3
{
  self->_hasFetchedInitialRecommendations = a3;
}

- (BDSNBPinningManager)pinningManager
{
  return self->_pinningManager;
}

- (void)setPinningManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinningManager, 0);
  objc_storeStrong((id *)&self->_recommendations, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end