@interface ProgressCache
- (LibraryCatalogObserver)observer;
- (ProgressCache)init;
- (void)executeQuery:(id)a3 excludingBundleIDs:(id)a4 usingBlock:(id)a5;
- (void)executeQueryForUpdatesReloadingFromServer:(BOOL)a3 logKey:(id)a4 usingBlock:(id)a5;
- (void)setObserver:(id)a3;
@end

@implementation ProgressCache

- (void)executeQuery:(id)a3 excludingBundleIDs:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000140C0;
  v15[3] = &unk_100522420;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(dispatchQueue, v15);
}

- (void)executeQueryForUpdatesReloadingFromServer:(BOOL)a3 logKey:(id)a4 usingBlock:(id)a5
{
}

- (ProgressCache)init
{
  v3 = sub_10001A0C8();
  id v4 = v3;
  if (self)
  {
    v14.receiver = self;
    v14.super_class = (Class)ProgressCache;
    v5 = [(ProgressCache *)&v14 init];
    self = v5;
    if (v5)
    {
      objc_storeStrong((id *)&v5->_notificationCenter, v3);
      v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.appstored.ProgressCache", v6);
      dispatchQueue = self->_dispatchQueue;
      self->_dispatchQueue = v7;

      id v9 = (NSMutableDictionary *)objc_opt_new();
      placeholders = self->_placeholders;
      self->_placeholders = v9;

      v11 = (NSMutableDictionary *)objc_opt_new();
      progressStore = self->_progressStore;
      self->_progressStore = v11;
    }
  }

  return self;
}

- (LibraryCatalogObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (LibraryCatalogObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyProgressItems, 0);
  objc_storeStrong((id *)&self->_progressStore, 0);
  objc_storeStrong((id *)&self->_placeholders, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end