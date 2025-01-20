@interface CRAttestationDeviceiPad1Handler
+ (BOOL)isiPad1ProductType:(int)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
- (CRAttestationDeviceiPad1Handler)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CRAttestationDeviceiPad1Handler

- (CRAttestationDeviceiPad1Handler)init
{
  v13.receiver = self;
  v13.super_class = (Class)CRAttestationDeviceiPad1Handler;
  v5 = [(CRAttestationBaseDeviceHandler *)&v13 init];
  if (v5)
  {
    v9 = objc_msgSend_sharedSingleton(CRComponentDisplayRoswell, v2, v3, v4);
    if (v9)
    {
      v10 = objc_msgSend_componentsMapping(v5, v6, v7, v8);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v11, (uint64_t)v9, @"tcrt");
    }
  }
  return v5;
}

+ (BOOL)isiPad1ProductType:(int)a3
{
  BOOL result = 1;
  if (*(uint64_t *)&a3 > 2619317133)
  {
    if (*(void *)&a3 == 2619317134) {
      return result;
    }
    uint64_t v4 = 3241053352;
  }
  else
  {
    if (*(void *)&a3 == 555503454) {
      return result;
    }
    uint64_t v4 = 2487868872;
  }
  if (*(void *)&a3 != v4) {
    return 0;
  }
  return result;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  if (objc_msgSend_isiPad1ProductType_(CRAttestationDeviceiPad1Handler, a2, *(uint64_t *)&a3, v3))uint64_t v4 = objc_alloc_init(CRAttestationDeviceiPad1Handler); {
  else
  }
    uint64_t v4 = 0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRAttestationDeviceiPad1Handler);
}

@end