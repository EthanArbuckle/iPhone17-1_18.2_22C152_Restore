@interface CRAttestationDeviceGen4Handler
+ (BOOL)isGen4Device:(int)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
- (CRAttestationDeviceGen4Handler)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CRAttestationDeviceGen4Handler

- (CRAttestationDeviceGen4Handler)init
{
  v19.receiver = self;
  v19.super_class = (Class)CRAttestationDeviceGen4Handler;
  v5 = [(CRAttestationBaseDeviceHandler *)&v19 init];
  if (v5)
  {
    v6 = objc_msgSend_sharedSingleton(CRComponentVeridian, v2, v3, v4);
    v13 = objc_msgSend_sharedSingleton(CRComponentTsid, v7, v8, v9);
    if (v6)
    {
      v14 = objc_msgSend_componentsMapping(v5, v10, v11, v12);
      objc_msgSend_setObject_forKeyedSubscript_(v14, v15, (uint64_t)v6, @"vcrt");
    }
    if (v13)
    {
      v16 = objc_msgSend_componentsMapping(v5, v10, v11, v12);
      objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v13, @"tsid");
    }
  }
  return v5;
}

+ (BOOL)isGen4Device:(int)a3
{
  return *(void *)&a3 == 2078329141;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  if (objc_msgSend_isGen4Device_(CRAttestationDeviceGen4Handler, a2, *(uint64_t *)&a3, v3)) {
    uint64_t v4 = objc_alloc_init(CRAttestationDeviceGen4Handler);
  }
  else {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRAttestationDeviceGen4Handler);
}

@end