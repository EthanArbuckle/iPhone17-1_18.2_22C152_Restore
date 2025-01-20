@interface HUCCOpenURLHandler
- (CCUIContentModuleContext)context;
- (HUCCOpenURLHandler)initWithCCModuleContext:(id)a3;
- (id)openURL:(id)a3;
@end

@implementation HUCCOpenURLHandler

- (HUCCOpenURLHandler)initWithCCModuleContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUCCOpenURLHandler;
  v6 = [(HUCCOpenURLHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (id)openURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F58190];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2406623B0;
  v10[3] = &unk_2650CC098;
  v10[4] = self;
  id v11 = v4;
  id v6 = v4;
  v8 = objc_msgSend_futureWithErrorOnlyHandlerAdapterBlock_(v5, v7, (uint64_t)v10);

  return v8;
}

- (CCUIContentModuleContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
}

@end