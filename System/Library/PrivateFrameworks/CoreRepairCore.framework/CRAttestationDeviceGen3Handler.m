@interface CRAttestationDeviceGen3Handler
+ (BOOL)isGen3Device:(int)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
- (CRAttestationDeviceGen3Handler)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CRAttestationDeviceGen3Handler

- (CRAttestationDeviceGen3Handler)init
{
  v25.receiver = self;
  v25.super_class = (Class)CRAttestationDeviceGen3Handler;
  v5 = [(CRAttestationBaseDeviceHandler *)&v25 init];
  if (v5)
  {
    v6 = objc_msgSend_sharedSingleton(CRComponentDisplayRoswell, v2, v3, v4);
    v10 = objc_msgSend_sharedSingleton(CRComponentVeridian, v7, v8, v9);
    v17 = objc_msgSend_sharedSingleton(CRComponentTsid, v11, v12, v13);
    if (v6)
    {
      v18 = objc_msgSend_componentsMapping(v5, v14, v15, v16);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v19, (uint64_t)v6, @"tcrt");
    }
    if (v10)
    {
      v20 = objc_msgSend_componentsMapping(v5, v14, v15, v16);
      objc_msgSend_setObject_forKeyedSubscript_(v20, v21, (uint64_t)v10, @"vcrt");
    }
    if (v17)
    {
      v22 = objc_msgSend_componentsMapping(v5, v14, v15, v16);
      objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v17, @"tsid");
    }
  }
  return v5;
}

+ (BOOL)isGen3Device:(int)a3
{
  int64x2_t v3 = vdupq_n_s64(*(unint64_t *)&a3);
  char v4 = vmaxvq_u8((uint8x16_t)vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D4F0), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D500)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D510), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D520))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D530), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D540)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D550), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D560))))) | vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D570), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_21FC6D580))));
  BOOL v6 = *(void *)&a3 == 2795618603 || *(void *)&a3 == 330877086;
  return v4 & 1 | (*(void *)&a3 == 574536383 || v6);
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  if (objc_msgSend_isGen3Device_(CRAttestationDeviceGen3Handler, a2, *(uint64_t *)&a3, v3)) {
    char v4 = objc_alloc_init(CRAttestationDeviceGen3Handler);
  }
  else {
    char v4 = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRAttestationDeviceGen3Handler);
}

@end