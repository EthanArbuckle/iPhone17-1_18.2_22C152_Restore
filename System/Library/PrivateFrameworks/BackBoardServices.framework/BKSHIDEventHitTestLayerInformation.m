@interface BKSHIDEventHitTestLayerInformation
+ (BKSHIDEventHitTestLayerInformation)new;
+ (id)build:(id)a3;
+ (id)protobufSchema;
- (BKSHIDEventHitTestLayerInformation)init;
- (BOOL)detectedOcclusion;
- (BOOL)hasInsecureFilter;
- (BOOL)isEqual:(id)a3;
- (CATransform3D)cumulativeContentsTransform;
- (CATransform3D)cumulativeLayerTransform;
- (CATransform3D)cumulativeTransform;
- (NSArray)maximumBackgroundColor;
- (NSArray)minimumBackgroundColor;
- (NSString)description;
- (float)backgroundAverage;
- (float)backgroundAverageContrastThreshold;
- (float)backgroundStandardDeviation;
- (float)cumulativeOpacity;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)validMask;
- (void)_initWithCopyOf:(void *)a1;
- (void)_updateCCHmacContext:(id *)a3;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation BKSHIDEventHitTestLayerInformation

- (void)_updateCCHmacContext:(id *)a3
{
  CCHmacUpdate((CCHmacContext *)a3, &self->_validMask, 8uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_cumulativeOpacity, 4uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_cumulativeLayerTransform, 0x80uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_cumulativeContentsTransform, 0x80uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_hasInsecureFilter, 1uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_detectedOcclusion, 1uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_backgroundAverage, 4uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_backgroundStandardDeviation, 4uLL);
  CCHmacUpdate((CCHmacContext *)a3, &self->_backgroundAverageContrastThreshold, 4uLL);
}

- (NSArray)maximumBackgroundColor
{
  return (NSArray *)&unk_1ED76CA60;
}

- (NSArray)minimumBackgroundColor
{
  return (NSArray *)&unk_1ED76CA48;
}

- (float)backgroundAverageContrastThreshold
{
  float result = 0.0;
  if ((self->_validMask & 8) != 0) {
    return self->_backgroundAverageContrastThreshold;
  }
  return result;
}

- (float)backgroundStandardDeviation
{
  float result = 0.0;
  if ((self->_validMask & 8) != 0) {
    return self->_backgroundStandardDeviation;
  }
  return result;
}

- (float)backgroundAverage
{
  float result = 1.0;
  if ((self->_validMask & 8) != 0) {
    return self->_backgroundAverage;
  }
  return result;
}

- (BOOL)detectedOcclusion
{
  return self->_detectedOcclusion;
}

- (BOOL)hasInsecureFilter
{
  return self->_hasInsecureFilter;
}

- (float)cumulativeOpacity
{
  float result = 1.0;
  if ((self->_validMask & 2) != 0) {
    return self->_cumulativeOpacity;
  }
  return result;
}

- (CATransform3D)cumulativeContentsTransform
{
  if ((LOBYTE(self->m12) & 0x20) != 0)
  {
    long long v3 = *(_OWORD *)&self[1].m43;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[1].m41;
    *(_OWORD *)&retstr->m33 = v3;
    long long v4 = *(_OWORD *)&self[2].m13;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[2].m11;
    *(_OWORD *)&retstr->m43 = v4;
    long long v5 = *(_OWORD *)&self[1].m23;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[1].m21;
    *(_OWORD *)&retstr->m13 = v5;
    long long v6 = *(_OWORD *)&self[1].m33;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[1].m31;
    *(_OWORD *)&retstr->m23 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->m22 = 0u;
    *(_OWORD *)&retstr->m32 = 0u;
    *(_OWORD *)&retstr->m42 = 0u;
    *(_OWORD *)&retstr->m34 = 0u;
    *(_OWORD *)&retstr->m24 = 0u;
    *(_OWORD *)&retstr->m14 = 0u;
    *(_OWORD *)&retstr->m12 = 0u;
    retstr->m11 = 1.0;
    retstr->m22 = 1.0;
    retstr->m33 = 1.0;
    retstr->m44 = 1.0;
  }
  return self;
}

- (CATransform3D)cumulativeLayerTransform
{
  if ((LOBYTE(self->m12) & 0x10) != 0)
  {
    long long v3 = *(_OWORD *)&self->m43;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m41;
    *(_OWORD *)&retstr->m33 = v3;
    long long v4 = *(_OWORD *)&self[1].m13;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m11;
    *(_OWORD *)&retstr->m43 = v4;
    long long v5 = *(_OWORD *)&self->m23;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m21;
    *(_OWORD *)&retstr->m13 = v5;
    long long v6 = *(_OWORD *)&self->m33;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m31;
    *(_OWORD *)&retstr->m23 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->m22 = 0u;
    *(_OWORD *)&retstr->m32 = 0u;
    *(_OWORD *)&retstr->m42 = 0u;
    *(_OWORD *)&retstr->m34 = 0u;
    *(_OWORD *)&retstr->m24 = 0u;
    *(_OWORD *)&retstr->m14 = 0u;
    *(_OWORD *)&retstr->m12 = 0u;
    retstr->m11 = 1.0;
    retstr->m22 = 1.0;
    retstr->m33 = 1.0;
    retstr->m44 = 1.0;
  }
  return self;
}

- (CATransform3D)cumulativeTransform
{
  *(_OWORD *)&retstr->m22 = 0u;
  *(_OWORD *)&retstr->m32 = 0u;
  *(_OWORD *)&retstr->m42 = 0u;
  *(_OWORD *)&retstr->m34 = 0u;
  *(_OWORD *)&retstr->m24 = 0u;
  *(_OWORD *)&retstr->m14 = 0u;
  *(_OWORD *)&retstr->m12 = 0u;
  retstr->m11 = 1.0;
  retstr->m22 = 1.0;
  retstr->m33 = 1.0;
  retstr->m44 = 1.0;
  return self;
}

- (unint64_t)validMask
{
  return self->_validMask;
}

- (id)_init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    uint64_t v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      uint64_t v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        long long v4 = [NSString stringWithFormat:@"BKSHIDEventHitTestLayerInformation cannot be subclassed"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          long long v5 = NSStringFromSelector(sel__init);
          long long v6 = (objc_class *)objc_opt_class();
          v7 = NSStringFromClass(v6);
          *(_DWORD *)buf = 138544642;
          v10 = v5;
          __int16 v11 = 2114;
          v12 = v7;
          __int16 v13 = 2048;
          v14 = v1;
          __int16 v15 = 2114;
          v16 = @"BKSHIDEventHitTestLayerInformation.m";
          __int16 v17 = 1024;
          int v18 = 83;
          __int16 v19 = 2114;
          v20 = v4;
          _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v4 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18AA5C8CCLL);
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)BKSHIDEventHitTestLayerInformation;
    return objc_msgSendSuper2(&v8, sel_init);
  }
  return result;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__BKSHIDEventHitTestLayerInformation_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E5441BB0;
  id v7 = v4;
  objc_super v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

void __67__BKSHIDEventHitTestLayerInformation_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = NSStringFromBKSHIDEventHitTestLayerInformationMask(*(void *)(*(void *)(a1 + 40) + 8));
  [v2 appendString:v3 withName:@"validMask"];

  id v4 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 289) withName:@"detectedOcclusion"];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v5 + 8);
  if ((v6 & 0x10) != 0)
  {
    v10 = *(void **)(a1 + 32);
    long long v11 = *(_OWORD *)(v5 + 112);
    long long v30 = *(_OWORD *)(v5 + 96);
    long long v31 = v11;
    long long v12 = *(_OWORD *)(v5 + 144);
    long long v32 = *(_OWORD *)(v5 + 128);
    long long v33 = v12;
    long long v13 = *(_OWORD *)(v5 + 48);
    long long v26 = *(_OWORD *)(v5 + 32);
    long long v27 = v13;
    long long v14 = *(_OWORD *)(v5 + 80);
    long long v28 = *(_OWORD *)(v5 + 64);
    long long v29 = v14;
    __int16 v15 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v26];
    id v16 = (id)[v10 appendObject:v15 withName:@"cumulativeLayerTransform"];

    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(v5 + 8);
    if ((v6 & 0x20) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  __int16 v17 = *(void **)(a1 + 32);
  long long v18 = *(_OWORD *)(v5 + 240);
  long long v30 = *(_OWORD *)(v5 + 224);
  long long v31 = v18;
  long long v19 = *(_OWORD *)(v5 + 272);
  long long v32 = *(_OWORD *)(v5 + 256);
  long long v33 = v19;
  long long v20 = *(_OWORD *)(v5 + 176);
  long long v26 = *(_OWORD *)(v5 + 160);
  long long v27 = v20;
  long long v21 = *(_OWORD *)(v5 + 208);
  long long v28 = *(_OWORD *)(v5 + 192);
  long long v29 = v21;
  v22 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v26];
  id v23 = (id)[v17 appendObject:v22 withName:@"cumulativeContentsTransform"];

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v5 + 8);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  id v24 = (id)[*(id *)(a1 + 32) appendFloat:@"cumulativeOpacity" withName:*(float *)(v5 + 16)];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v5 + 8);
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      return;
    }
    goto LABEL_6;
  }
LABEL_11:
  id v25 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(v5 + 288) withName:@"hasInsecureFilter"];
  uint64_t v5 = *(void *)(a1 + 40);
  if ((*(void *)(v5 + 8) & 8) == 0) {
    return;
  }
LABEL_6:
  id v7 = (id)[*(id *)(a1 + 32) appendFloat:@"backgroundAverage" withName:*(float *)(v5 + 20)];
  id v8 = (id)[*(id *)(a1 + 32) appendFloat:@"backgroundStandardDeviation" withName:*(float *)(*(void *)(a1 + 40) + 24)];
  id v9 = (id)[*(id *)(a1 + 32) appendFloat:@"backgroundAverageContrastThreshold" withName:*(float *)(*(void *)(a1 + 40) + 28)];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [BKSMutableHIDEventHitTestLayerInformation alloc];
  return -[BKSHIDEventHitTestLayerInformation _initWithCopyOf:](v4, self);
}

- (void)_initWithCopyOf:(void *)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    id v4 = -[BKSHIDEventHitTestLayerInformation _init](a1);
    a1 = v4;
    if (v4)
    {
      *((void *)v4 + 1) = v3[1];
      long long v5 = *((_OWORD *)v3 + 2);
      long long v6 = *((_OWORD *)v3 + 3);
      long long v7 = *((_OWORD *)v3 + 5);
      *((_OWORD *)v4 + 4) = *((_OWORD *)v3 + 4);
      *((_OWORD *)v4 + 5) = v7;
      *((_OWORD *)v4 + 2) = v5;
      *((_OWORD *)v4 + 3) = v6;
      long long v8 = *((_OWORD *)v3 + 6);
      long long v9 = *((_OWORD *)v3 + 7);
      long long v10 = *((_OWORD *)v3 + 9);
      *((_OWORD *)v4 + 8) = *((_OWORD *)v3 + 8);
      *((_OWORD *)v4 + 9) = v10;
      *((_OWORD *)v4 + 6) = v8;
      *((_OWORD *)v4 + 7) = v9;
      long long v11 = *((_OWORD *)v3 + 17);
      long long v13 = *((_OWORD *)v3 + 14);
      long long v12 = *((_OWORD *)v3 + 15);
      *((_OWORD *)v4 + 16) = *((_OWORD *)v3 + 16);
      *((_OWORD *)v4 + 17) = v11;
      *((_OWORD *)v4 + 14) = v13;
      *((_OWORD *)v4 + 15) = v12;
      long long v14 = *((_OWORD *)v3 + 10);
      long long v15 = *((_OWORD *)v3 + 11);
      long long v16 = *((_OWORD *)v3 + 13);
      *((_OWORD *)v4 + 12) = *((_OWORD *)v3 + 12);
      *((_OWORD *)v4 + 13) = v16;
      *((_OWORD *)v4 + 10) = v14;
      *((_OWORD *)v4 + 11) = v15;
      *((_DWORD *)v4 + 4) = *((_DWORD *)v3 + 4);
      *((unsigned char *)v4 + 288) = *((unsigned char *)v3 + 288);
      *((unsigned char *)v4 + 289) = *((unsigned char *)v3 + 289);
      *((_DWORD *)v4 + 5) = *((_DWORD *)v3 + 5);
      *((_DWORD *)v4 + 6) = *((_DWORD *)v3 + 6);
      *((_DWORD *)v4 + 7) = *((_DWORD *)v3 + 7);
    }
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BKSHIDEventHitTestLayerInformation alloc];
  return -[BKSHIDEventHitTestLayerInformation _initWithCopyOf:](v4, self);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && *((void *)v4 + 1) == self->_validMask
    && (vminvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 2), *(float64x2_t *)&self->_cumulativeLayerTransform.m11), (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 3), *(float64x2_t *)&self->_cumulativeLayerTransform.m13)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 4), *(float64x2_t *)&self->_cumulativeLayerTransform.m21), (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 5), *(float64x2_t *)&self->_cumulativeLayerTransform.m23))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32(
                                                              (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 6), *(float64x2_t *)&self->_cumulativeLayerTransform.m31), (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 7), *(float64x2_t *)&self->_cumulativeLayerTransform.m33)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 8), *(float64x2_t *)&self->_cumulativeLayerTransform.m41), (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 9), *(float64x2_t *)&self->_cumulativeLayerTransform.m43)))), 7uLL))) & 1) != 0&& (vminvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(
                                                                           *((float64x2_t *)v4 + 10),
                                                                           *(float64x2_t *)&self->_cumulativeContentsTransform.m11),
                                                              (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 11), *(float64x2_t *)&self->_cumulativeContentsTransform.m13)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 12), *(float64x2_t *)&self->_cumulativeContentsTransform.m21), (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 13), *(float64x2_t *)&self->_cumulativeContentsTransform.m23))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 14), *(float64x2_t *)&self->_cumulativeContentsTransform.m31), (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 15), *(float64x2_t *)&self->_cumulativeContentsTransform.m33)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(
                                                                           *((float64x2_t *)v4 + 16),
                                                                           *(float64x2_t *)&self->_cumulativeContentsTransform.m41),
                                                              (int32x4_t)vceqq_f64(*((float64x2_t *)v4 + 17), *(float64x2_t *)&self->_cumulativeContentsTransform.m43)))), 7uLL))) & 1) != 0&& *((float *)v4 + 4) == self->_cumulativeOpacity&& v4[288] == self->_hasInsecureFilter&& v4[289] == self->_detectedOcclusion&& *((float *)v4 + 5) == self->_backgroundAverage&& *((float *)v4 + 6) == self->_backgroundStandardDeviation&& *((float *)v4 + 7) == self->_backgroundAverageContrastThreshold;

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:self->_validMask];
  uint64_t v4 = [v3 hash];

  long long v5 = *(_OWORD *)&self->_cumulativeLayerTransform.m33;
  v35[4] = *(_OWORD *)&self->_cumulativeLayerTransform.m31;
  v35[5] = v5;
  long long v6 = *(_OWORD *)&self->_cumulativeLayerTransform.m43;
  v35[6] = *(_OWORD *)&self->_cumulativeLayerTransform.m41;
  v35[7] = v6;
  long long v7 = *(_OWORD *)&self->_cumulativeLayerTransform.m13;
  v35[0] = *(_OWORD *)&self->_cumulativeLayerTransform.m11;
  v35[1] = v7;
  long long v8 = *(_OWORD *)&self->_cumulativeLayerTransform.m23;
  v35[2] = *(_OWORD *)&self->_cumulativeLayerTransform.m21;
  v35[3] = v8;
  long long v9 = [MEMORY[0x1E4F29238] valueWithBytes:v35 objCType:"{CATransform3D=dddddddddddddddd}"];
  uint64_t v10 = [v9 hash] ^ v4;

  long long v11 = *(_OWORD *)&self->_cumulativeContentsTransform.m33;
  v34[4] = *(_OWORD *)&self->_cumulativeContentsTransform.m31;
  v34[5] = v11;
  long long v12 = *(_OWORD *)&self->_cumulativeContentsTransform.m43;
  v34[6] = *(_OWORD *)&self->_cumulativeContentsTransform.m41;
  v34[7] = v12;
  long long v13 = *(_OWORD *)&self->_cumulativeContentsTransform.m13;
  v34[0] = *(_OWORD *)&self->_cumulativeContentsTransform.m11;
  v34[1] = v13;
  long long v14 = *(_OWORD *)&self->_cumulativeContentsTransform.m23;
  v34[2] = *(_OWORD *)&self->_cumulativeContentsTransform.m21;
  v34[3] = v14;
  long long v15 = [MEMORY[0x1E4F29238] valueWithBytes:v34 objCType:"{CATransform3D=dddddddddddddddd}"];
  uint64_t v16 = [v15 hash];

  *(float *)&double v17 = self->_cumulativeOpacity;
  long long v18 = [NSNumber numberWithFloat:v17];
  uint64_t v19 = v10 ^ v16 ^ [v18 hash];

  long long v20 = [NSNumber numberWithBool:self->_hasInsecureFilter];
  uint64_t v21 = [v20 hash];

  v22 = [NSNumber numberWithBool:self->_detectedOcclusion];
  uint64_t v23 = v21 ^ [v22 hash];

  *(float *)&double v24 = self->_backgroundAverage;
  id v25 = [NSNumber numberWithFloat:v24];
  uint64_t v26 = v19 ^ v23 ^ [v25 hash];

  *(float *)&double v27 = self->_backgroundStandardDeviation;
  long long v28 = [NSNumber numberWithFloat:v27];
  uint64_t v29 = [v28 hash];

  *(float *)&double v30 = self->_backgroundAverageContrastThreshold;
  long long v31 = [NSNumber numberWithFloat:v30];
  unint64_t v32 = v26 ^ v29 ^ [v31 hash];

  return v32;
}

- (BKSHIDEventHitTestLayerInformation)init
{
  uint64_t v4 = [NSString stringWithFormat:@"cannot directly allocate BKSHIDEventHitTestLayerInformation"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v5 = NSStringFromSelector(a2);
    long long v6 = (objc_class *)objc_opt_class();
    long long v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    long long v12 = v7;
    __int16 v13 = 2048;
    long long v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"BKSHIDEventHitTestLayerInformation.m";
    __int16 v17 = 1024;
    int v18 = 72;
    __int16 v19 = 2114;
    long long v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  float result = (BKSHIDEventHitTestLayerInformation *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)protobufSchema
{
  return (id)[MEMORY[0x1E4F4F808] buildSchemaForClass:a1 builder:&__block_literal_global_8777];
}

void __52__BKSHIDEventHitTestLayerInformation_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_validMask"];
  [v2 addField:"_cumulativeLayerTransform"];
  [v2 addField:"_cumulativeContentsTransform"];
  [v2 addField:"_cumulativeOpacity"];
  [v2 addField:"_hasInsecureFilter"];
  [v2 addField:"_detectedOcclusion"];
  [v2 addField:"_backgroundAverage"];
  [v2 addField:"_backgroundStandardDeviation"];
  [v2 addField:"_backgroundAverageContrastThreshold"];
}

+ (BKSHIDEventHitTestLayerInformation)new
{
  uint64_t v4 = [NSString stringWithFormat:@"cannot directly allocate BKSHIDEventHitTestLayerInformation"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v5 = NSStringFromSelector(a2);
    long long v6 = (objc_class *)objc_opt_class();
    long long v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    long long v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    uint64_t v16 = @"BKSHIDEventHitTestLayerInformation.m";
    __int16 v17 = 1024;
    int v18 = 77;
    __int16 v19 = 2114;
    long long v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  float result = (BKSHIDEventHitTestLayerInformation *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)build:(id)a3
{
  uint64_t v3 = (void (**)(id, id))a3;
  id v4 = -[BKSHIDEventHitTestLayerInformation _init]([BKSMutableHIDEventHitTestLayerInformation alloc]);
  v3[2](v3, v4);

  long long v5 = (void *)[v4 copy];
  return v5;
}

@end