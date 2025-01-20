@interface DDRUIPresenter
- (BOOL)progressBarVisible;
- (DDRUIPresenter)init;
- (PUIProgressWindow)resetProgressWindow;
- (double)progress;
- (void)setProgress:(double)a3;
- (void)setProgressBarVisible:(BOOL)a3;
- (void)setResetProgressWindow:(id)a3;
- (void)show;
@end

@implementation DDRUIPresenter

- (DDRUIPresenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)DDRUIPresenter;
  result = [(DDRUIPresenter *)&v3 init];
  if (result) {
    result->_progress = 0.0;
  }
  return result;
}

- (void)setProgressBarVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting progress bar visible: %d", buf, 8u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000010B0;
  v6[3] = &unk_1000082C0;
  v6[4] = self;
  BOOL v7 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)show
{
  BOOL v3 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Show progress UI", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000121C;
  block[3] = &unk_1000082E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setProgress:(double)a3
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100001364;
  v5[3] = &unk_100008310;
  v6[1] = *(id *)&a3;
  v5[4] = self;
  objc_copyWeak(v6, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (BOOL)progressBarVisible
{
  return self->_progressBarVisible;
}

- (double)progress
{
  return self->_progress;
}

- (PUIProgressWindow)resetProgressWindow
{
  return self->_resetProgressWindow;
}

- (void)setResetProgressWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end