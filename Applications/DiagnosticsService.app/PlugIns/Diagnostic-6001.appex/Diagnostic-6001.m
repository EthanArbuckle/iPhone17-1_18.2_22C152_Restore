id sub_1000037AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t vars8;

  v4 = *(void **)(a1 + 32);
  if (a3)
  {
    v5 = [v4 result];
    v6 = v5;
    v7 = &off_100004160;
  }
  else
  {
    v8 = [v4 readDeviceAnglesFrom:a2];
    v9 = [*(id *)(a1 + 32) result];
    [v9 setData:v8];

    v5 = [*(id *)(a1 + 32) result];
    v6 = v5;
    v7 = &off_100004178;
  }
  [v5 setStatusCode:v7];

  v10 = *(void **)(a1 + 32);

  return [v10 setFinished:1];
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_attitude(void *a1, const char *a2, ...)
{
  return [a1 attitude];
}

id objc_msgSend_isDeviceMotionAvailable(void *a1, const char *a2, ...)
{
  return [a1 isDeviceMotionAvailable];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_motionManager(void *a1, const char *a2, ...)
{
  return [a1 motionManager];
}

id objc_msgSend_pitch(void *a1, const char *a2, ...)
{
  return [a1 pitch];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_roll(void *a1, const char *a2, ...)
{
  return [a1 roll];
}

id objc_msgSend_stopDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopDeviceMotionUpdates];
}

id objc_msgSend_yaw(void *a1, const char *a2, ...)
{
  return [a1 yaw];
}