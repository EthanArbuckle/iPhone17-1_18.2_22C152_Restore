@interface ADLocalMeCardStore
+ (id)sharedStore;
- (id)_init;
- (void)addMeCardObserver:(id)a3;
- (void)meCard:(id)a3;
- (void)removeMeCardObserver:(id)a3;
- (void)storeMeCard:(id)a3;
@end

@implementation ADLocalMeCardStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_ownerMeCard, 0);
  objc_storeStrong((id *)&self->_cachedMeCardData, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)removeMeCardObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100270504;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addMeCardObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002705B4;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)meCard:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100270664;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)storeMeCard:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002707E4;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)ADLocalMeCardStore;
  v2 = [(ADLocalMeCardStore *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("LocalMeCardStoreQueue", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100270ADC;
    block[3] = &unk_10050E138;
    v9 = v2;
    dispatch_async(v6, block);
  }
  return v2;
}

+ (id)sharedStore
{
  if (qword_100586090 != -1) {
    dispatch_once(&qword_100586090, &stru_100508520);
  }
  v2 = (void *)qword_100586088;
  return v2;
}

@end