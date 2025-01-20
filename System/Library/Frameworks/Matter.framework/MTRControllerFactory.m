@interface MTRControllerFactory
+ (MTRControllerFactory)sharedInstance;
- (BOOL)isRunning;
- (BOOL)startup:(MTRControllerFactoryParams *)startupParams;
- (MTRDeviceController)startControllerOnExistingFabric:(MTRDeviceControllerStartupParams *)startupParams;
- (MTRDeviceController)startControllerOnNewFabric:(MTRDeviceControllerStartupParams *)startupParams;
- (void)shutdown;
@end

@implementation MTRControllerFactory

- (BOOL)isRunning
{
  v3 = objc_msgSend_sharedInstance(MTRDeviceControllerFactory, a2, v2);
  char isRunning = objc_msgSend_isRunning(v3, v4, v5);

  return isRunning;
}

+ (MTRControllerFactory)sharedInstance
{
  if (qword_268EBE900 != -1) {
    dispatch_once(&qword_268EBE900, &unk_26F9440A0);
  }
  uint64_t v2 = (void *)qword_268EBE8F8;

  return (MTRControllerFactory *)v2;
}

- (BOOL)startup:(MTRControllerFactoryParams *)startupParams
{
  v3 = startupParams;
  v6 = objc_msgSend_sharedInstance(MTRDeviceControllerFactory, v4, v5);
  char started = objc_msgSend_startControllerFactory_error_(v6, v7, (uint64_t)v3, 0);

  return started;
}

- (void)shutdown
{
  objc_msgSend_sharedInstance(MTRDeviceControllerFactory, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopControllerFactory(v5, v3, v4);
}

- (MTRDeviceController)startControllerOnExistingFabric:(MTRDeviceControllerStartupParams *)startupParams
{
  v3 = startupParams;
  v6 = objc_msgSend_sharedInstance(MTRDeviceControllerFactory, v4, v5);
  v8 = objc_msgSend_createControllerOnExistingFabric_error_(v6, v7, (uint64_t)v3, 0);

  return (MTRDeviceController *)v8;
}

- (MTRDeviceController)startControllerOnNewFabric:(MTRDeviceControllerStartupParams *)startupParams
{
  v3 = startupParams;
  v6 = objc_msgSend_sharedInstance(MTRDeviceControllerFactory, v4, v5);
  v8 = objc_msgSend_createControllerOnNewFabric_error_(v6, v7, (uint64_t)v3, 0);

  return (MTRDeviceController *)v8;
}

@end