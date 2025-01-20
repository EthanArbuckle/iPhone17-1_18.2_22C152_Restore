@interface ADAVSystemControllerLifecycleManager
+ (id)sharedManager;
- (ADAVSystemControllerLifecycleManager)init;
- (void)_flushPendingCompletions;
- (void)_setAVSystemController:(id)a3;
- (void)addObserver:(id)a3;
- (void)avSystemControllerDied:(id)a3;
- (void)fetchAVSystemControllerInBackground;
- (void)getAVSystemControllerWithTimeout:(double)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation ADAVSystemControllerLifecycleManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pendingCompletions, 0);
  objc_storeStrong((id *)&self->_avSystemController, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_flushPendingCompletions
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_pendingCompletions;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "invokeWithValue:", self->_avSystemController, (void)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_pendingCompletions removeAllObjects];
}

- (void)_setAVSystemController:(id)a3
{
  id v5 = (AVSystemController *)a3;
  avSystemController = self->_avSystemController;
  if (avSystemController != v5)
  {
    if (avSystemController)
    {
      v7 = +[NSNotificationCenter defaultCenter];
      [v7 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:self->_avSystemController];
    }
    objc_storeStrong((id *)&self->_avSystemController, a3);
    if (self->_avSystemController)
    {
      long long v8 = +[NSNotificationCenter defaultCenter];
      [v8 addObserver:self selector:"avSystemControllerDied:" name:AVSystemController_ServerConnectionDiedNotification object:self->_avSystemController];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v9 = self->_observers;
    id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "adAVSystemControllerDidChange:", self, (void)v14);
        }
        id v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)avSystemControllerDied:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v9 = "-[ADAVSystemControllerLifecycleManager avSystemControllerDied:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s notification = %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100146BAC;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
  [(ADAVSystemControllerLifecycleManager *)self fetchAVSystemControllerInBackground];
}

- (void)fetchAVSystemControllerInBackground
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100146C2C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100146DAC;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100146E50;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getAVSystemControllerWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc((Class)AFOneArgumentSafetyBlock);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100146F84;
    v14[3] = &unk_100503768;
    id v15 = v6;
    id v8 = [v7 initWithBlock:v14 defaultValue:0];
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100146F94;
    v11[3] = &unk_10050E278;
    v11[4] = self;
    id v12 = v8;
    double v13 = a3;
    id v10 = v8;
    dispatch_async(queue, v11);
  }
}

- (ADAVSystemControllerLifecycleManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)ADAVSystemControllerLifecycleManager;
  v2 = [(ADAVSystemControllerLifecycleManager *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.avsystemcontroller.lifecycle-manager", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.assistant.avsystemcontroller.access", v8);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v9;

    id v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingCompletions = v2->_pendingCompletions;
    v2->_pendingCompletions = v11;

    uint64_t v13 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v13;

    [(ADAVSystemControllerLifecycleManager *)v2 fetchAVSystemControllerInBackground];
  }
  return v2;
}

+ (id)sharedManager
{
  if (qword_100585C98 != -1) {
    dispatch_once(&qword_100585C98, &stru_100503740);
  }
  v2 = (void *)qword_100585CA0;
  return v2;
}

@end