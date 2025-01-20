@interface CSAutomaticVolumeEnabledMonitor
+ (id)sharedInstance;
- (CSAutomaticVolumeEnabledMonitor)init;
- (void)_didReceiveAutomaticVolumeToggled:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation CSAutomaticVolumeEnabledMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)_stopMonitoring
{
  queue = self->_queue;
  self->_queue = 0;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  p_queue = &self->_queue;
  objc_storeStrong((id *)&self->_queue, a3);
  id v6 = a3;
  v7 = *p_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BBB10;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(v7, block);
}

- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CSAutomaticVolumeEnabledMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSAutomaticVolumeEnabledMonitor:self didReceiveEnabled:v4];
  }
}

- (void)_didReceiveAutomaticVolumeToggled:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000BBCA0;
  v3[3] = &unk_1002536A8;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSAutomaticVolumeEnabledMonitor *)self enumerateObservers:v3];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v8 = v7;
  queue = self->_queue;
  if (queue)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BBD60;
    v10[3] = &unk_100253B08;
    id v11 = v7;
    v12 = self;
    dispatch_async(queue, v10);
  }
}

- (CSAutomaticVolumeEnabledMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSAutomaticVolumeEnabledMonitor;
  return [(CSAutomaticVolumeEnabledMonitor *)&v3 init];
}

+ (id)sharedInstance
{
  if (qword_1002A38B8 != -1) {
    dispatch_once(&qword_1002A38B8, &stru_100250968);
  }
  v2 = (void *)qword_1002A38B0;
  return v2;
}

@end