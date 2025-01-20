@interface CSAccessorySiriClientBehaviorMonitor
+ (id)sharedInstance;
- (CSAccessorySiriClientBehaviorMonitor)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (void)_init;
- (void)notifyDidStartStreamWithContext:(id)a3 successfully:(BOOL)a4 option:(id)a5 withEventUUID:(id)a6 forAccessory:(id)a7;
- (void)notifyDidStopStream:(id)a3 reason:(unint64_t)a4 withEventUUID:(id)a5 forAccessory:(id)a6;
- (void)notifyWillStartStreamWithContext:(id)a3 option:(id)a4 forAccessory:(id)a5;
- (void)notifyWillStopStream:(id)a3 reason:(unint64_t)a4 forAccessory:(id)a5;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSAccessorySiriClientBehaviorMonitor

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

- (void)notifyDidStopStream:(id)a3 reason:(unint64_t)a4 withEventUUID:(id)a5 forAccessory:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DD9B4;
  block[3] = &unk_100253418;
  id v18 = v12;
  v19 = self;
  id v21 = v11;
  unint64_t v22 = a4;
  id v20 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(queue, block);
}

- (void)notifyWillStopStream:(id)a3 reason:(unint64_t)a4 forAccessory:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000DDBF4;
  v13[3] = &unk_1002511C0;
  id v14 = v9;
  id v15 = self;
  id v16 = v8;
  unint64_t v17 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, v13);
}

- (void)notifyDidStartStreamWithContext:(id)a3 successfully:(BOOL)a4 option:(id)a5 withEventUUID:(id)a6 forAccessory:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000DDE80;
  v21[3] = &unk_100251198;
  id v22 = v15;
  v23 = self;
  BOOL v27 = a4;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  dispatch_async(queue, v21);
}

- (void)notifyWillStartStreamWithContext:(id)a3 option:(id)a4 forAccessory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000DE0E0;
  v15[3] = &unk_100252E18;
  id v16 = v10;
  id v17 = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000DE2F0;
    v7[3] = &unk_100253B08;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000DE3EC;
    v7[3] = &unk_100253B08;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (CSAccessorySiriClientBehaviorMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSAccessorySiriClientBehaviorMonitor;
  v2 = [(CSAccessorySiriClientBehaviorMonitor *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CSAccessorySiriClientBehaviorMonitor *)v2 _init];
  }
  return v3;
}

- (void)_init
{
  v3 = +[NSHashTable weakObjectsHashTable];
  observers = self->_observers;
  self->_observers = v3;

  dispatch_get_global_queue(33, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v5 = +[CSUtils getSerialQueue:@"com.apple.corespeech.CSAccessorySiriClientBehaviourMonitor" withQualityOfService:33 andTargetQueue:v7];
  queue = self->_queue;
  self->_queue = v5;
}

+ (id)sharedInstance
{
  if (qword_1002A3988 != -1) {
    dispatch_once(&qword_1002A3988, &stru_100251170);
  }
  v2 = (void *)qword_1002A3980;
  return v2;
}

@end