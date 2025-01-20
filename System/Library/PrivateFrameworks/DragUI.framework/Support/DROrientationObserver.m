@interface DROrientationObserver
+ (id)sharedObserver;
- (id)_init;
- (int64_t)interfaceOrientation;
- (void)_didReceiveOrientationUpdate:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation DROrientationObserver

+ (id)sharedObserver
{
  if (qword_1000645F0 != -1) {
    dispatch_once(&qword_1000645F0, &stru_100054BE0);
  }
  v2 = (void *)qword_1000645E8;
  return v2;
}

- (id)_init
{
  v14.receiver = self;
  v14.super_class = (Class)DROrientationObserver;
  v2 = [(DROrientationObserver *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableSet *)v3;

    objc_initWeak(&location, v2);
    uint64_t v5 = objc_opt_new();
    interfaceOrientationObserver = v2->_interfaceOrientationObserver;
    v2->_interfaceOrientationObserver = (FBSOrientationObserver *)v5;

    v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    v10 = sub_1000085D4;
    v11 = &unk_100054C08;
    objc_copyWeak(&v12, &location);
    [(FBSOrientationObserver *)v2->_interfaceOrientationObserver setHandler:&v8];
    v2->_interfaceOrientation = (int64_t)[(FBSOrientationObserver *)v2->_interfaceOrientationObserver activeInterfaceOrientation];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (([(NSMutableSet *)self->_observers containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_observers addObject:v4];
    interfaceOrientationObserver = self->_interfaceOrientationObserver;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000086EC;
    v6[3] = &unk_100054C30;
    id v7 = v4;
    v8 = self;
    [(FBSOrientationObserver *)interfaceOrientationObserver activeInterfaceOrientationWithCompletion:v6];
  }
}

- (void)removeObserver:(id)a3
{
}

- (void)_didReceiveOrientationUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DRLogTarget();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 orientation];
    [v4 duration];
    *(_DWORD *)buf = 134218496;
    id v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    id v16 = [v4 rotationDirection];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Got orientation change to %ld duration %g direction %ld", buf, 0x20u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008860;
  v9[3] = &unk_100054C58;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_interfaceOrientationObserver, 0);
}

@end