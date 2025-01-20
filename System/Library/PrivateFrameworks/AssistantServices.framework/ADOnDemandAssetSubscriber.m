@interface ADOnDemandAssetSubscriber
- (ADOnDemandAssetSubscriber)initWithPreferences:(id)a3 invalidationHandler:(id)a4;
- (void)_invalidate;
- (void)_setupIfNecessary;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
@end

@implementation ADOnDemandAssetSubscriber

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_invalidate
{
  v3 = +[ADRequestLifecycleObserver sharedObserver];
  [v3 removeListener:self];

  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;
  }
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F3FC;
  block[3] = &unk_1004FFAF8;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a5;
  id v15 = v10;
  id v16 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(queue, block);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

- (void)_setupIfNecessary
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006F608;
  v4[3] = &unk_10050B790;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (ADOnDemandAssetSubscriber)initWithPreferences:(id)a3 invalidationHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ADOnDemandAssetSubscriber;
  id v9 = [(ADOnDemandAssetSubscriber *)&v16 init];
  if (v9)
  {
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("ADOnDemandAssetSubscriber", v10);

    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    id v13 = objc_retainBlock(v8);
    id invalidationHandler = v9->_invalidationHandler;
    v9->_id invalidationHandler = v13;

    objc_storeStrong((id *)&v9->_preferences, a3);
    [(ADOnDemandAssetSubscriber *)v9 _setupIfNecessary];
  }

  return v9;
}

@end