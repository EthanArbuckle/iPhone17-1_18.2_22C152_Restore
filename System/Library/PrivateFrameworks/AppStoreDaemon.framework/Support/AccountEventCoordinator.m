@interface AccountEventCoordinator
- (AccountEventCoordinator)init;
- (id)description;
- (void)_handleAppleIDDidChangeNotification:(id)a3;
@end

@implementation AccountEventCoordinator

- (AccountEventCoordinator)init
{
  v14.receiver = self;
  v14.super_class = (Class)AccountEventCoordinator;
  v2 = [(AccountEventCoordinator *)&v14 init];
  v3 = v2;
  if (v2)
  {
    id v4 = sub_1002181F4((uint64_t)v2);
    uint64_t v5 = objc_opt_new();
    accountsForWeekCache = v3->_accountsForWeekCache;
    v3->_accountsForWeekCache = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.appstored.AccountEventCoordinator.dispatch", v7);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v8;

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v3 selector:"_handleAppleIDDidChangeNotification:" name:@"com.apple.appstored.ASDItunesAccountDidChangeNotification" object:0];

    v11 = +[NSDate date];
    [v11 timeIntervalSinceReferenceDate];
    v3->_lastCacheReset = v12;
  }
  return v3;
}

- (void)_handleAppleIDDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100219380;
  block[3] = &unk_100521388;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, block);
}

- (id)description
{
  v2 = sub_10021911C((uint64_t)self);
  v3 = [v2 componentsJoinedByString:@",\n"];
  id v4 = +[NSString stringWithFormat:@"{ events : [\n %@ \n] }", v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_accountsForWeekCache, 0);
}

@end