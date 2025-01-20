void sub_36E8(uint64_t a1)
{
  id WeakRetained;
  uint64_t vars8;

  WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + OBJC_IVAR___PSBundleController__parent));
  [WeakRetained presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void NSLog(NSString *format, ...)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_msgSend__createOnsiteProfileInstallationSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _createOnsiteProfileInstallationSpecifier];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_dataManager(void *a1, const char *a2, ...)
{
  return [a1 dataManager];
}

id objc_msgSend_isDeviceManagementHidden(void *a1, const char *a2, ...)
{
  return [a1 isDeviceManagementHidden];
}

id objc_msgSend_isOnsiteProfileInstallation(void *a1, const char *a2, ...)
{
  return [a1 isOnsiteProfileInstallation];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_thisDeviceType(void *a1, const char *a2, ...)
{
  return [a1 thisDeviceType];
}