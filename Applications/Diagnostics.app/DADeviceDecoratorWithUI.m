@interface DADeviceDecoratorWithUI
+ (id)decorateWithDevice:(id)a3;
- (BOOL)ignoreButtonEvents;
- (BOOL)isKindOfClass:(Class)a3;
- (DADeviceDecoratorWithUI)initWithDevice:(id)a3;
- (DADeviceMaterialized)original;
- (DADeviceWithUIDelegate)delegate;
- (DKBrightnessResponder)brightnessResponder;
- (DKStatusBarResponder)statusBarResponder;
- (DKUserAlertResponder)userAlertResponder;
- (DKViewControllerDelegate)viewControllerDelegate;
- (DKVolumeHUDResponder)volumeHUDResponder;
- (DSHardwareButtonEventMonitor)buttonEventMonitor;
- (float)originalScreenBrightness;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_reset;
- (void)_startInterceptingButtonEvents;
- (void)connect;
- (void)end;
- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)forwardInvocation:(id)a3;
- (void)handleButtonEvent:(unint64_t)a3;
- (void)idle;
- (void)requestSuiteFinishWithCompletionHandler:(id)a3;
- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4;
- (void)resumeTests;
- (void)setBrightnessResponder:(id)a3;
- (void)setButtonEventMonitor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIgnoreButtonEvents:(BOOL)a3;
- (void)setOriginal:(id)a3;
- (void)setOriginalScreenBrightness:(float)a3;
- (void)setStatusBarResponder:(id)a3;
- (void)setUserAlertResponder:(id)a3;
- (void)setViewControllerDelegate:(id)a3;
- (void)setVolumeHUDResponder:(id)a3;
- (void)start;
- (void)suspendTests;
- (void)testViewPresented:(id)a3;
@end

@implementation DADeviceDecoratorWithUI

+ (id)decorateWithDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDevice:v4];

  return v5;
}

- (DADeviceDecoratorWithUI)initWithDevice:(id)a3
{
  objc_storeStrong((id *)&self->_original, a3);
  id v5 = a3;
  v6 = +[DATestQueue testQueueWithDelegate:self];
  [(DADeviceMaterialized *)self->_original setTestQueue:v6];

  v7 = (DSHardwareButtonEventMonitor *)objc_opt_new();
  buttonEventMonitor = self->_buttonEventMonitor;
  self->_buttonEventMonitor = v7;

  self->_ignoreButtonEvents = 0;
  return self;
}

- (DADeviceWithUIDelegate)delegate
{
  v2 = [(DADeviceDecoratorWithUI *)self original];
  v3 = [v2 delegate];

  return (DADeviceWithUIDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(DADeviceDecoratorWithUI *)self original];
  [v5 setDelegate:v4];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a3);
    v7 = [(DADeviceDecoratorWithUI *)self original];
    int v12 = 138412546;
    v13 = v6;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fast forwarding %@ to %@", (uint8_t *)&v12, 0x16u);
  }
  v8 = [(DADeviceDecoratorWithUI *)self original];
  if (objc_opt_respondsToSelector()) {
    v9 = v8;
  }
  else {
    v9 = self;
  }
  v10 = v9;

  return v10;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  id v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector((SEL)[v4 selector]);
    v7 = [(DADeviceDecoratorWithUI *)self original];
    int v9 = 138412546;
    v10 = v6;
    __int16 v11 = 2112;
    int v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Slow forwarding %@ to %@", (uint8_t *)&v9, 0x16u);
  }
  v8 = [(DADeviceDecoratorWithUI *)self original];
  [v4 invokeWithTarget:v8];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DADeviceDecoratorWithUI;
  id v5 = -[DADeviceDecoratorWithUI methodSignatureForSelector:](&v8, "methodSignatureForSelector:");
  if (!v5)
  {
    v6 = [(DADeviceDecoratorWithUI *)self original];
    id v5 = [v6 methodSignatureForSelector:a3];
  }

  return v5;
}

- (BOOL)isKindOfClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v4 = [(DADeviceDecoratorWithUI *)self original];
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)setViewControllerDelegate:(id)a3
{
  p_viewControllerDelegate = &self->_viewControllerDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_viewControllerDelegate, v5);
  id v6 = [(DADeviceDecoratorWithUI *)self diagnosticsManager];
  [v6 setViewControllerDelegate:v5];
}

- (void)setVolumeHUDResponder:(id)a3
{
  p_volumeHUDResponder = &self->_volumeHUDResponder;
  id v5 = a3;
  objc_storeWeak((id *)p_volumeHUDResponder, v5);
  id v6 = [(DADeviceDecoratorWithUI *)self diagnosticsManager];
  [v6 setVolumeHUDResponder:v5];
}

- (void)setBrightnessResponder:(id)a3
{
  p_brightnessResponder = &self->_brightnessResponder;
  id v5 = a3;
  objc_storeWeak((id *)p_brightnessResponder, v5);
  id v6 = [(DADeviceDecoratorWithUI *)self diagnosticsManager];
  [v6 setBrightnessResponder:v5];
}

- (void)setUserAlertResponder:(id)a3
{
  p_userAlertResponder = &self->_userAlertResponder;
  id v5 = a3;
  objc_storeWeak((id *)p_userAlertResponder, v5);
  id v6 = [(DADeviceDecoratorWithUI *)self diagnosticsManager];
  [v6 setUserAlertResponder:v5];
}

- (void)setStatusBarResponder:(id)a3
{
  p_statusBarResponder = &self->_statusBarResponder;
  id v5 = a3;
  objc_storeWeak((id *)p_statusBarResponder, v5);
  id v6 = [(DADeviceDecoratorWithUI *)self diagnosticsManager];
  [v6 setStatusBarResponder:v5];
}

- (void)connect
{
  id v2 = [(DADeviceDecoratorWithUI *)self original];
  [v2 connect];
}

- (void)start
{
  BKSDisplayBrightnessGetCurrent();
  -[DADeviceDecoratorWithUI setOriginalScreenBrightness:](self, "setOriginalScreenBrightness:");
  v3 = [(DADeviceDecoratorWithUI *)self buttonEventMonitor];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)DSHardwareButtonEventMonitor);
    [(DADeviceDecoratorWithUI *)self setButtonEventMonitor:v4];
  }
  id v5 = [(DADeviceDecoratorWithUI *)self original];
  [v5 start];
}

- (void)idle
{
  id v2 = [(DADeviceDecoratorWithUI *)self original];
  [v2 idle];
}

- (void)suspendTests
{
  id v2 = [(DADeviceDecoratorWithUI *)self original];
  [v2 suspendTests];
}

- (void)resumeTests
{
  id v2 = [(DADeviceDecoratorWithUI *)self original];
  [v2 resumeTests];
}

- (void)end
{
  v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003104C;
  block[3] = &unk_10014B0D8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(DADeviceDecoratorWithUI *)self original];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(DADeviceDecoratorWithUI *)self original];
    [v9 requestSuiteStart:v10 completionHandler:v6];
  }
}

- (void)requestSuiteFinishWithCompletionHandler:(id)a3
{
  id v7 = a3;
  id v4 = [(DADeviceDecoratorWithUI *)self original];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DADeviceDecoratorWithUI *)self original];
    [v6 requestSuiteFinishWithCompletionHandler:v7];
  }
}

- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[DADeviceDecoratorWithUI executeTestWithTestAttributes:parameters:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  int v12 = [(DADeviceDecoratorWithUI *)self delegate];
  v13 = [v8 identifier];
  unsigned int v14 = [v8 isHeadless];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000313EC;
  v18[3] = &unk_10014C3E8;
  objc_copyWeak(&v22, (id *)buf);
  v18[4] = self;
  id v15 = v8;
  id v19 = v15;
  id v16 = v9;
  id v20 = v16;
  id v17 = v10;
  id v21 = v17;
  [v12 device:self shouldStartTestWithTestId:v13 fullscreen:v14 ^ 1 response:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

- (void)testViewPresented:(id)a3
{
}

- (void)handleButtonEvent:(unint64_t)a3
{
  if (![(DADeviceDecoratorWithUI *)self ignoreButtonEvents])
  {
    if ((uint64_t)a3 >= 0x8000)
    {
      if ((uint64_t)a3 >= 0x200000)
      {
        if ((uint64_t)a3 > 0x7FFFFFF)
        {
          if (a3 == 0x20000000) {
            goto LABEL_25;
          }
          uint64_t v5 = 0x8000000;
        }
        else
        {
          if (a3 == 0x200000) {
            goto LABEL_25;
          }
          uint64_t v5 = 0x2000000;
        }
        if (a3 != v5) {
          return;
        }
LABEL_25:
        objc_initWeak(&location, self);
        id v6 = dispatch_get_global_queue(0, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000317E8;
        block[3] = &unk_10014C410;
        block[4] = self;
        objc_copyWeak(&v8, &location);
        dispatch_async(v6, block);

        objc_destroyWeak(&v8);
        objc_destroyWeak(&location);
        return;
      }
      if (a3 == 0x8000 || a3 == 0x20000 || a3 == 0x80000) {
        goto LABEL_25;
      }
    }
    else
    {
      if ((uint64_t)a3 <= 127)
      {
        if (a3 > 0x20 || ((1 << a3) & 0x100000114) == 0) {
          return;
        }
        goto LABEL_25;
      }
      if ((uint64_t)a3 > 2047)
      {
        if (a3 == 2048 || a3 == 0x2000) {
          goto LABEL_25;
        }
      }
      else if (a3 == 128 || a3 == 512)
      {
        goto LABEL_25;
      }
    }
  }
}

- (void)_startInterceptingButtonEvents
{
  objc_initWeak(&location, self);
  v3 = [(DADeviceDecoratorWithUI *)self buttonEventMonitor];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100031A14;
  v4[3] = &unk_10014B1F0;
  objc_copyWeak(&v5, &location);
  [v3 startWithPriority:26 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_reset
{
  v3 = [(DADeviceDecoratorWithUI *)self buttonEventMonitor];

  if (v3)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:@"com.apple.Diagnostics.DKViewControllerPresented" object:0];

    id v5 = [(DADeviceDecoratorWithUI *)self buttonEventMonitor];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100031BB8;
    v7[3] = &unk_10014B0D8;
    v7[4] = self;
    [v5 stopWithCompletion:v7];
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100031C0C;
  v6[3] = &unk_10014B0D8;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (DKVolumeHUDResponder)volumeHUDResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_volumeHUDResponder);

  return (DKVolumeHUDResponder *)WeakRetained;
}

- (DKBrightnessResponder)brightnessResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_brightnessResponder);

  return (DKBrightnessResponder *)WeakRetained;
}

- (DKUserAlertResponder)userAlertResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userAlertResponder);

  return (DKUserAlertResponder *)WeakRetained;
}

- (DKStatusBarResponder)statusBarResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarResponder);

  return (DKStatusBarResponder *)WeakRetained;
}

- (DKViewControllerDelegate)viewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerDelegate);

  return (DKViewControllerDelegate *)WeakRetained;
}

- (float)originalScreenBrightness
{
  return self->_originalScreenBrightness;
}

- (void)setOriginalScreenBrightness:(float)a3
{
  self->_originalScreenBrightness = a3;
}

- (DSHardwareButtonEventMonitor)buttonEventMonitor
{
  return self->_buttonEventMonitor;
}

- (void)setButtonEventMonitor:(id)a3
{
}

- (DADeviceMaterialized)original
{
  return self->_original;
}

- (void)setOriginal:(id)a3
{
}

- (BOOL)ignoreButtonEvents
{
  return self->_ignoreButtonEvents;
}

- (void)setIgnoreButtonEvents:(BOOL)a3
{
  self->_ignoreButtonEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_original, 0);
  objc_storeStrong((id *)&self->_buttonEventMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_viewControllerDelegate);
  objc_destroyWeak((id *)&self->_statusBarResponder);
  objc_destroyWeak((id *)&self->_userAlertResponder);
  objc_destroyWeak((id *)&self->_brightnessResponder);

  objc_destroyWeak((id *)&self->_volumeHUDResponder);
}

@end