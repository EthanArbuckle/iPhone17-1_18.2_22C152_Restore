@interface DRLockObserver
- (BOOL)isLocked;
- (DRLockObserver)initWithLockHandler:(id)a3;
- (void)dealloc;
@end

@implementation DRLockObserver

- (DRLockObserver)initWithLockHandler:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DRLockObserver;
  v5 = [(DRLockObserver *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_notifyToken = -1;
    p_notifyToken = &v5->_notifyToken;
    id v8 = objc_retainBlock(v4);
    id lockHandler = v6->_lockHandler;
    v6->_id lockHandler = v8;

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100031B50;
    v12[3] = &unk_1000564B8;
    v13 = v6;
    v10 = objc_retainBlock(v12);
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v6->_notifyToken, (dispatch_queue_t)&_dispatch_main_q, v10);
    ((void (*)(void *, void))v10[2])(v10, *p_notifyToken);
  }
  return v6;
}

- (void)dealloc
{
  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)DRLockObserver;
  [(DRLockObserver *)&v3 dealloc];
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void).cxx_destruct
{
}

@end