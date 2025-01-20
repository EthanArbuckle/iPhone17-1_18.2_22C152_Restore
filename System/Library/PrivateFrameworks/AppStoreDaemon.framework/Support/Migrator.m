@interface Migrator
- (Migrator)init;
- (void)_handleMonitorStateDidChangeNotification:(id)a3;
- (void)_handleNetworkStateDidChangeNotification:(id)a3;
- (void)dealloc;
@end

@implementation Migrator

- (Migrator)init
{
  v12.receiver = self;
  v12.super_class = (Class)Migrator;
  v2 = [(Migrator *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.Migrator", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(MigratorConfigurationStore);
    configurationStore = v2->_configurationStore;
    v2->_configurationStore = v6;

    v8 = v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100309350;
    block[3] = &unk_100521388;
    v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  dispatch_queue_t v4 = sub_100259614();
  [v3 removeObserver:self name:@"NetworkStateDidChangeNotification" object:v4];

  v5.receiver = self;
  v5.super_class = (Class)Migrator;
  [(Migrator *)&v5 dealloc];
}

- (void)_handleNetworkStateDidChangeNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10030A16C;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleMonitorStateDidChangeNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10030A7A4;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrations, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_configurationStore, 0);
}

@end