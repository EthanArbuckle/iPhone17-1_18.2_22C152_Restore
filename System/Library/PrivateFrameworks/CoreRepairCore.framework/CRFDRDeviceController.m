@interface CRFDRDeviceController
+ (id)sharedSingleton;
- (CRFDRDeviceController)init;
- (id)_init;
- (id)getHandlerForDevice;
@end

@implementation CRFDRDeviceController

- (id)getHandlerForDevice
{
  handler = self->handler;
  if (!handler)
  {
    v6 = (objc_class *)objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21FC15AF8;
    block[3] = &unk_26452A920;
    block[4] = self;
    objc_enumerateClasses(0, 0, 0, v6, block);
    handler = self->handler;
  }
  v7 = objc_msgSend_copy(handler, a2, v2, v3);
  return v7;
}

- (CRFDRDeviceController)init
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(sel_sharedSingleton);
  v9 = NSStringFromSelector(a2);
  objc_msgSend_raise_format_(v4, v10, v5, @"Use +[%@ %@] instead of -%@.", v7, v8, v9);

  return 0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)CRFDRDeviceController;
  uint64_t v2 = [(CRFDRDeviceController *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    handler = v2->handler;
    v2->handler = 0;
  }
  return v3;
}

+ (id)sharedSingleton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21FC15E18;
  block[3] = &unk_26452A940;
  block[4] = a1;
  if (qword_26AC133F0 != -1) {
    dispatch_once(&qword_26AC133F0, block);
  }
  uint64_t v2 = (void *)qword_26AC13428;
  return v2;
}

- (void).cxx_destruct
{
}

@end