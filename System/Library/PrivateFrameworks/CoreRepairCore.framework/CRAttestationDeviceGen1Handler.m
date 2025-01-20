@interface CRAttestationDeviceGen1Handler
+ (BOOL)isGen1Device:(int)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
- (CRAttestationDeviceGen1Handler)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CRAttestationDeviceGen1Handler

- (CRAttestationDeviceGen1Handler)init
{
  v13.receiver = self;
  v13.super_class = (Class)CRAttestationDeviceGen1Handler;
  v5 = [(CRAttestationBaseDeviceHandler *)&v13 init];
  if (v5)
  {
    v9 = objc_msgSend_sharedSingleton(CRComponentTsid, v2, v3, v4);
    if (v9)
    {
      v10 = objc_msgSend_componentsMapping(v5, v6, v7, v8);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v11, (uint64_t)v9, @"tsid");
    }
  }
  return v5;
}

+ (BOOL)isGen1Device:(int)a3
{
  int64x2_t v3 = vdupq_n_s64(*(unint64_t *)&a3);
  return vmaxvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vorrq_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D450), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D440)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D430), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D420))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D410), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D400)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D3F0), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D3E0)))), vuzp1q_s8((int8x16_t)vuzp1q_s16(
                                                    (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D4D0), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D4C0)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D4B0), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D4A0))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D490), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D480)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D470), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D460))))), 7uLL))) & 1 | (*(void *)&a3 == 2566016329) | (*(void *)&a3 == 2959111092);
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  if (objc_msgSend_isGen1Device_(CRAttestationDeviceGen1Handler, a2, *(uint64_t *)&a3, v3)) {
    uint64_t v4 = objc_alloc_init(CRAttestationDeviceGen1Handler);
  }
  else {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRAttestationDeviceGen1Handler);
}

@end