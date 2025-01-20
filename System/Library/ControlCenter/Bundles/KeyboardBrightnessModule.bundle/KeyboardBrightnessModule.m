uint64_t sub_2406872B4(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](a2, sel_performSelectorOnMainThread_withObject_waitUntilDone_, sel_hardwareKeyboardAvailabilityChanged, 0, 0);
}

void sub_2406874D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_240687590;
  v6[3] = &unk_2650CDA68;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);

  objc_destroyWeak(&v8);
}

uint64_t sub_240687590(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v19 = WeakRetained;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = objc_msgSend_sliderView(v19, (const char *)v19, v3, v4, v5);
      char isTracking = objc_msgSend_isTracking(v6, v7, v8, v9, v10);

      if ((isTracking & 1) == 0)
      {
        objc_msgSend_floatValue(*(void **)(a1 + 32), (const char *)v19, v12, v13, v14);
        objc_msgSend_updateControlsForValue_animated_(v19, v15, 1, v16, v17);
      }
    }
  }

  return MEMORY[0x270F9A758]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x270F30618]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}