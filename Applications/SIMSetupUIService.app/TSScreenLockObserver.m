@interface TSScreenLockObserver
- (TSScreenLockObserver)initWithDelegate:(id)a3;
- (TSScreenLockObserverDelegate)delegate;
- (void)registerForLockNotifications;
- (void)setDelegate:(id)a3;
- (void)unregisterFromLockNotifications;
@end

@implementation TSScreenLockObserver

- (TSScreenLockObserver)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TSScreenLockObserver;
  v5 = [(TSScreenLockObserver *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(TSScreenLockObserver *)v5 setDelegate:v4];
    v6->_notifyToken = -1;
  }

  return v6;
}

- (void)registerForLockNotifications
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006584;
  v6[3] = &unk_1000206F8;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  p_notifyToken = &self->_notifyToken;
  if (notify_register_dispatch(kSBSLockStateNotifyKey, p_notifyToken, (dispatch_queue_t)&_dispatch_main_q, v3))
  {
    v5 = sub_100010734();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000130EC(v5);
    }

    int *p_notifyToken = -1;
  }
}

- (void)unregisterFromLockNotifications
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
  }
}

- (TSScreenLockObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TSScreenLockObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end