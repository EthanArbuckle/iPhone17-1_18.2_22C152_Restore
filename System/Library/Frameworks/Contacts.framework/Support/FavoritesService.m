@interface FavoritesService
+ (id)sharedInstance;
- (CNCoalescingTimer)coalescingTimer;
- (CNFavorites)mockFavorites;
- (CNInhibitor)coalescingInhibitor;
- (CNScheduler)workQueue;
- (FavoritesService)init;
- (FavoritesService)initWithMockFavorites:(id)a3 schedulerProvider:(id)a4;
- (id)favorites;
- (id)interestedNotifications;
- (unint64_t)favoritesMatchingOptions;
- (void)handleNotificationName:(id)a3;
- (void)setCoalescingInhibitor:(id)a3;
- (void)setCoalescingTimer:(id)a3;
- (void)setFavoritesMatchingOptions:(unint64_t)a3;
@end

@implementation FavoritesService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F56C;
  block[3] = &unk_100024B30;
  block[4] = a1;
  if (qword_10002CB08 != -1) {
    dispatch_once(&qword_10002CB08, block);
  }
  v2 = (void *)qword_10002CB10;

  return v2;
}

- (FavoritesService)init
{
  v3 = +[CNSchedulerProvider defaultProvider];
  v4 = [(FavoritesService *)self initWithMockFavorites:0 schedulerProvider:v3];

  return v4;
}

- (FavoritesService)initWithMockFavorites:(id)a3 schedulerProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)FavoritesService;
  v9 = [(FavoritesService *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mockFavorites, a3);
    id v11 = objc_alloc((Class)CNQualityOfServiceSchedulerDecorator);
    id v12 = [v8 newSerialSchedulerWithName:@"com.apple.contactsd.FavoritesService"];
    v13 = (CNScheduler *)[v11 initWithScheduler:v12 qualityOfService:2];
    workQueue = v10->_workQueue;
    v10->_workQueue = v13;

    objc_initWeak(&location, v10);
    id v15 = objc_alloc((Class)CNCoalescingTimer);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000F798;
    v20[3] = &unk_100024F10;
    objc_copyWeak(&v21, &location);
    v16 = (CNCoalescingTimer *)[v15 initWithDelay:0 options:v20 block:v8 schedulerProvider:v10->_workQueue downstreamScheduler:5.0];
    coalescingTimer = v10->_coalescingTimer;
    v10->_coalescingTimer = v16;

    v18 = v10;
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)interestedNotifications
{
  v4[0] = @"__ABDataBaseChangedByOtherProcessNotification";
  v4[1] = @"com.apple.contacts.clientDidDisplayFavorites";
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (void)handleNotificationName:(id)a3
{
  id v4 = a3;
  BOOL v5 = ([v4 isEqualToString:@"__ABDataBaseChangedByOtherProcessNotification"] & 1) != 0
    || [v4 isEqualToString:@"com.apple.datamigrator.migrationDidFinish"];
  if ([v4 isEqualToString:@"com.apple.contacts.clientDidDisplayFavorites"]) {
    uint64_t v6 = v5 | 2;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v6)
  {
    id v7 = [(FavoritesService *)self workQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000F9B8;
    v8[3] = &unk_100024F38;
    v8[4] = self;
    v8[5] = v6;
    [v7 performBlock:v8];
  }
}

- (id)favorites
{
  mockFavorites = self->_mockFavorites;
  if (mockFavorites)
  {
    v3 = mockFavorites;
  }
  else
  {
    id v4 = objc_alloc((Class)CNFavorites);
    BOOL v5 = +[CNEnvironment currentEnvironment];
    uint64_t v6 = [v5 contactStore];
    v3 = (CNFavorites *)[v4 initWithContactStore:v6];
  }

  return v3;
}

- (CNFavorites)mockFavorites
{
  return self->_mockFavorites;
}

- (CNCoalescingTimer)coalescingTimer
{
  return self->_coalescingTimer;
}

- (void)setCoalescingTimer:(id)a3
{
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNInhibitor)coalescingInhibitor
{
  return self->_coalescingInhibitor;
}

- (void)setCoalescingInhibitor:(id)a3
{
}

- (unint64_t)favoritesMatchingOptions
{
  return self->_favoritesMatchingOptions;
}

- (void)setFavoritesMatchingOptions:(unint64_t)a3
{
  self->_favoritesMatchingOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingInhibitor, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);

  objc_storeStrong((id *)&self->_mockFavorites, 0);
}

@end