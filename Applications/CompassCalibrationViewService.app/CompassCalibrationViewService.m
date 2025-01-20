int main(int argc, const char **argv, const char **envp)
{
  void *v5;

  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, 0, 0);
  return (int)argv;
}

void sub_100001F08(id a1, int a2)
{
}

void sub_10000212C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002154(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[1] setMotion:v5];
    if ([v4[1] circleIsCompleted]) {
      [v4 finishedCalibrating];
    }
  }
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return [a1 animation];
}

id objc_msgSend_calibrationViewController(void *a1, const char *a2, ...)
{
  return [a1 calibrationViewController];
}

id objc_msgSend_circleIsCompleted(void *a1, const char *a2, ...)
{
  return [a1 circleIsCompleted];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_dismissCalibrationAlert(void *a1, const char *a2, ...)
{
  return [a1 dismissCalibrationAlert];
}

id objc_msgSend_finishedCalibrating(void *a1, const char *a2, ...)
{
  return [a1 finishedCalibrating];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return [a1 locationManager];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_maximumTimer(void *a1, const char *a2, ...)
{
  return [a1 maximumTimer];
}

id objc_msgSend_minimumTimer(void *a1, const char *a2, ...)
{
  return [a1 minimumTimer];
}

id objc_msgSend_motionManager(void *a1, const char *a2, ...)
{
  return [a1 motionManager];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_setNeedsUpdateOfSupportedInterfaceOrientations(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateOfSupportedInterfaceOrientations];
}

id objc_msgSend_startUpdatingHeading(void *a1, const char *a2, ...)
{
  return [a1 startUpdatingHeading];
}

id objc_msgSend_stopDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopDeviceMotionUpdates];
}

id objc_msgSend_stopUpdatingHeading(void *a1, const char *a2, ...)
{
  return [a1 stopUpdatingHeading];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}