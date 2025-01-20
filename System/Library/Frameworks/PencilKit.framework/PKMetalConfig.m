@interface PKMetalConfig
- (PKMetalConfig)init;
- (_BYTE)initWithPrivateResourceHandler:(unsigned char *)result;
- (id)device;
- (id)renderQueue;
- (id)resourceHandler;
@end

@implementation PKMetalConfig

- (_BYTE)initWithPrivateResourceHandler:(unsigned char *)result
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)PKMetalConfig;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result) {
      result[8] = a2;
    }
  }
  return result;
}

- (PKMetalConfig)init
{
  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)PKMetalConfig;
    self = [(PKMetalConfig *)&v2 init];
    if (self) {
      self->_privateResourceHandler = 0;
    }
  }
  return self;
}

- (id)device
{
  if (a1)
  {
    id v2 = a1;
    os_unfair_lock_lock((os_unfair_lock_t)&lock);
    if (!*((void *)v2 + 4))
    {
      uint64_t v3 = +[PKMetalUtility defaultDevice];
      v4 = (void *)*((void *)v2 + 4);
      *((void *)v2 + 4) = v3;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
    a1 = *((id *)v2 + 4);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)renderQueue
{
  if (a1)
  {
    id v2 = a1;
    os_unfair_lock_lock((os_unfair_lock_t)&lock);
    if (!*((void *)v2 + 3))
    {
      uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);

      dispatch_queue_t v5 = dispatch_queue_create("com.apple.pencilkit.renderer", v4);
      v6 = (void *)*((void *)v2 + 3);
      *((void *)v2 + 3) = v5;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
    a1 = *((id *)v2 + 3);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)resourceHandler
{
  id v1 = a1;
  if (a1)
  {
    id v2 = -[PKMetalConfig device](a1);
    os_unfair_lock_lock((os_unfair_lock_t)&lock);
    if (!*((void *)v1 + 2))
    {
      if (*((unsigned char *)v1 + 8))
      {
        uint64_t v3 = (uint64_t)-[PKMetalResourceHandler initWithDevice:]([PKMetalResourceHandler alloc], v2);
      }
      else
      {
        uint64_t v3 = +[PKMetalResourceHandler sharedResourceHandlerWithDevice:]((uint64_t)PKMetalResourceHandler, v2);
      }
      v4 = (void *)*((void *)v1 + 2);
      *((void *)v1 + 2) = v3;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
    id v1 = *((id *)v1 + 2);
  }

  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);

  objc_storeStrong((id *)&self->_resourceHandler, 0);
}

@end