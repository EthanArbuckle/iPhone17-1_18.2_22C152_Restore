@interface NEHotspotHelper
+ (BOOL)logoff:(NEHotspotNetwork *)network;
+ (BOOL)registerWithOptions:(NSDictionary *)options queue:(dispatch_queue_t)queue handler:(NEHotspotHelperHandler)handler;
+ (NSArray)supportedNetworkInterfaces;
@end

@implementation NEHotspotHelper

+ (NSArray)supportedNetworkInterfaces
{
  if (MEMORY[0x1E4F57E08] && (CFArrayRef v2 = (const __CFArray *)CNPluginCopySupportedInterfaces()) != 0)
  {
    CFArrayRef v3 = v2;
    v4 = createHotspotNetworkArray(v2);
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

+ (BOOL)logoff:(NEHotspotNetwork *)network
{
  CFArrayRef v3 = network;
  if (MEMORY[0x1E4F57E10]) {
    BOOL v4 = CNPluginLogoffNetwork() != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (BOOL)registerWithOptions:(NSDictionary *)options queue:(dispatch_queue_t)queue handler:(NEHotspotHelperHandler)handler
{
  v7 = options;
  v8 = queue;
  if (registerWithOptions_queue_handler__S_handler)
  {
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v10 = [handler copy];
    v11 = (void *)registerWithOptions_queue_handler__S_handler;
    registerWithOptions_queue_handler__S_handler = v10;

    if (!MEMORY[0x1E4F57E18] || (int v12 = CNPluginRegister()) == 0)
    {
      v13 = (void *)registerWithOptions_queue_handler__S_handler;
      registerWithOptions_queue_handler__S_handler = 0;

      int v12 = 0;
    }
    BOOL v9 = v12 != 0;
  }

  return v9;
}

void __53__NEHotspotHelper_registerWithOptions_queue_handler___block_invoke(uint64_t a1, const void *a2)
{
  CFArrayRef v3 = [NEHotspotHelperCommand alloc];
  if (v3)
  {
    v9.receiver = v3;
    v9.super_class = (Class)NEHotspotHelperCommand;
    BOOL v4 = objc_msgSendSuper2(&v9, sel_init);
    v5 = v4;
    if (v4)
    {
      v7 = v4;
      if (a2)
      {
        CFRetain(a2);
        v5 = v7;
      }
      v6 = (const void *)v5[1];
      if (v6)
      {
        CFRelease(v6);
        v5 = v7;
      }
      v5[1] = a2;
    }
  }
  else
  {
    v5 = 0;
  }
  id v8 = v5;
  (*(void (**)(void))(registerWithOptions_queue_handler__S_handler + 16))();
}

@end