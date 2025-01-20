@interface CRAttestationDeviceGen2Handler
+ (BOOL)isGen2Device:(int)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
- (CRAttestationDeviceGen2Handler)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CRAttestationDeviceGen2Handler

- (CRAttestationDeviceGen2Handler)init
{
  v19.receiver = self;
  v19.super_class = (Class)CRAttestationDeviceGen2Handler;
  v5 = [(CRAttestationBaseDeviceHandler *)&v19 init];
  if (v5)
  {
    v6 = objc_msgSend_sharedSingleton(CRComponentBatteryRoswell, v2, v3, v4);
    v13 = objc_msgSend_sharedSingleton(CRComponentTsid, v7, v8, v9);
    if (v6)
    {
      v14 = objc_msgSend_componentsMapping(v5, v10, v11, v12);
      objc_msgSend_setObject_forKeyedSubscript_(v14, v15, (uint64_t)v6, @"bcrt");
    }
    if (v13)
    {
      v16 = objc_msgSend_componentsMapping(v5, v10, v11, v12);
      objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v13, @"tsid");
    }
  }
  return v5;
}

+ (BOOL)isGen2Device:(int)a3
{
  int64x2_t v3 = vdupq_n_s64(*(unint64_t *)&a3);
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D380), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D390)))) & 1 | (*(void *)&a3 == 1234705395);
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  if (objc_msgSend_isGen2Device_(CRAttestationDeviceGen2Handler, a2, *(uint64_t *)&a3, v3)) {
    uint64_t v4 = objc_alloc_init(CRAttestationDeviceGen2Handler);
  }
  else {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRAttestationDeviceGen2Handler);
}

@end