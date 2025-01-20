@interface CRAttestationHandler
+ (id)sharedInstance;
- (id)_init;
- (id)getHandlerForDevice;
- (void)challengeComponentsWith:(id)a3 withReply:(id)a4;
- (void)getStrongComponentsWithReply:(id)a3;
@end

@implementation CRAttestationHandler

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)CRAttestationHandler;
  v2 = [(CRAttestationHandler *)&v10 init];
  v6 = v2;
  if (v2)
  {
    uint64_t v7 = objc_msgSend_getHandlerForDevice(v2, v3, v4, v5);
    handle = v6->handle;
    v6->handle = (CRAttestationBaseDeviceHandler *)v7;
  }
  return v6;
}

+ (id)sharedInstance
{
  if (qword_267EF8208 != -1) {
    dispatch_once(&qword_267EF8208, &unk_26D157B68);
  }
  v2 = (void *)qword_267EF8200;
  return v2;
}

- (void)challengeComponentsWith:(id)a3 withReply:(id)a4
{
}

- (void)getStrongComponentsWithReply:(id)a3
{
  objc_msgSend_getStrongComponentsWithReply_(self->handle, a2, (uint64_t)a3, v3);
}

- (id)getHandlerForDevice
{
  handle = self->handle;
  if (!handle)
  {
    v6 = (objc_class *)objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21FC42C70;
    block[3] = &unk_26452A920;
    block[4] = self;
    objc_enumerateClasses(0, 0, 0, v6, block);
    handle = self->handle;
    if (!handle)
    {
      uint64_t v7 = handleForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_21FBF2000, v7, OS_LOG_TYPE_DEFAULT, "Legacy device:", v12, 2u);
      }

      v8 = objc_alloc_init(CRAttestationBaseDeviceHandler);
      v9 = self->handle;
      self->handle = v8;

      handle = self->handle;
    }
  }
  objc_super v10 = objc_msgSend_copy(handle, a2, v2, v3);
  return v10;
}

- (void).cxx_destruct
{
}

@end