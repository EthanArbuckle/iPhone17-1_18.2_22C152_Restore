@interface CSOpportuneSpeakBehaviorMonitor
+ (id)sharedInstance;
- (CSOpportuneSpeakBehaviorMonitor)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (void)notifyDidStartStreamWithContext:(id)a3 audioProviderUUID:(id)a4 successfully:(BOOL)a5 option:(id)a6;
- (void)notifyDidStopStream:(id)a3;
- (void)notifyWillStartStreamWithContext:(id)a3 audioProviderUUID:(id)a4 option:(id)a5;
- (void)notifyWillStopStream:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSOpportuneSpeakBehaviorMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)notifyDidStopStream:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013BEC4;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)notifyWillStopStream:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013C0AC;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)notifyDidStartStreamWithContext:(id)a3 audioProviderUUID:(id)a4 successfully:(BOOL)a5 option:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013C2F0;
  block[3] = &unk_100252620;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

- (void)notifyWillStartStreamWithContext:(id)a3 audioProviderUUID:(id)a4 option:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10013C52C;
  v15[3] = &unk_100252E18;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013C718;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013C804;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSOpportuneSpeakBehaviorMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSOpportuneSpeakBehaviorMonitor;
  v2 = [(CSOpportuneSpeakBehaviorMonitor *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSOpportuneSpeakBehaviorMonitor", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1002A3B40 != -1) {
    dispatch_once(&qword_1002A3B40, &stru_1002525F8);
  }
  v2 = (void *)qword_1002A3B38;
  return v2;
}

@end