@interface BKSWindowServerHitTestSecurityAnalysis
+ (BKSWindowServerHitTestSecurityAnalysis)new;
+ (id)build:(id)a3;
+ (id)protobufSchema;
+ (id)securityAnalysisFromCAHitTestDictionary:(id)a3 errorString:(id *)a4;
- (BKSWindowServerHitTestSecurityAnalysis)init;
- (BOOL)hasInsecureFilter;
- (BOOL)isEqual:(id)a3;
- (BOOL)parentsHaveInsecureLayerProperties;
- (CATransform3D)cumulativeLayerTransform;
- (NSString)description;
- (float)cumulativeOpacity;
- (float)occlusionPercentage;
- (id)_init;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)occlusionType;
- (unint64_t)hash;
- (unsigned)occlusionMask;
- (void)_initWithCopyOf:(void *)a1;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation BKSWindowServerHitTestSecurityAnalysis

+ (id)securityAnalysisFromCAHitTestDictionary:(id)a3 errorString:(id *)a4
{
  id v5 = a3;
  *a4 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  v6 = (void *)getkCAWindowServerHitTestSecurityAnalysisOcclusionTypeSymbolLoc_ptr;
  uint64_t v43 = getkCAWindowServerHitTestSecurityAnalysisOcclusionTypeSymbolLoc_ptr;
  if (!getkCAWindowServerHitTestSecurityAnalysisOcclusionTypeSymbolLoc_ptr)
  {
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __getkCAWindowServerHitTestSecurityAnalysisOcclusionTypeSymbolLoc_block_invoke;
    v38 = &unk_1E5441630;
    v39 = &v40;
    v7 = QuartzCoreLibrary_9830();
    v41[3] = (uint64_t)dlsym(v7, "kCAWindowServerHitTestSecurityAnalysisOcclusionType");
    getkCAWindowServerHitTestSecurityAnalysisOcclusionTypeSymbolLoc_ptr = *(void *)(v39[1] + 24);
    v6 = (void *)v41[3];
  }
  _Block_object_dispose(&v40, 8);
  if (!v6)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = [NSString stringWithUTF8String:"NSString *getkCAWindowServerHitTestSecurityAnalysisOcclusionType(void)"];
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"BKSWindowServerHitTestSecurityAnalysis.m", 28, @"%s", dlerror());
    goto LABEL_44;
  }
  v8 = [v5 objectForKeyedSubscript:*v6];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[v8 unsignedIntValue];
        uint64_t v40 = 0;
        v41 = &v40;
        uint64_t v42 = 0x2020000000;
        v15 = (void *)getkCAWindowServerHitTestSecurityAnalysisOcclusionPercentSymbolLoc_ptr;
        uint64_t v43 = getkCAWindowServerHitTestSecurityAnalysisOcclusionPercentSymbolLoc_ptr;
        if (!getkCAWindowServerHitTestSecurityAnalysisOcclusionPercentSymbolLoc_ptr)
        {
          uint64_t v35 = MEMORY[0x1E4F143A8];
          uint64_t v36 = 3221225472;
          v37 = __getkCAWindowServerHitTestSecurityAnalysisOcclusionPercentSymbolLoc_block_invoke;
          v38 = &unk_1E5441630;
          v39 = &v40;
          v16 = QuartzCoreLibrary_9830();
          v41[3] = (uint64_t)dlsym(v16, "kCAWindowServerHitTestSecurityAnalysisOcclusionPercent");
          getkCAWindowServerHitTestSecurityAnalysisOcclusionPercentSymbolLoc_ptr = *(void *)(v39[1] + 24);
          v15 = (void *)v41[3];
        }
        _Block_object_dispose(&v40, 8);
        if (!v15)
        {
          v28 = [MEMORY[0x1E4F28B00] currentHandler];
          v29 = [NSString stringWithUTF8String:"NSString *getkCAWindowServerHitTestSecurityAnalysisOcclusionPercent(void)"];
          objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"BKSWindowServerHitTestSecurityAnalysis.m", 29, @"%s", dlerror());
          goto LABEL_44;
        }
        v17 = [v5 objectForKeyedSubscript:*v15];
        uint64_t v18 = objc_opt_class();
        id v19 = v17;
        if (v18)
        {
          if (objc_opt_isKindOfClass()) {
            v20 = v19;
          }
          else {
            v20 = 0;
          }
        }
        else
        {
          v20 = 0;
        }
        id v25 = v20;

        if (v25)
        {
          [v25 floatValue];
          int v11 = v26;

          uint64_t v13 = 0;
          goto LABEL_33;
        }
        [NSString stringWithFormat:@"occlusionTypeMask is %X, but there is no percentage", v12];
      }
      else
      {
        [NSString stringWithFormat:@"occlusionType is unexpected class:%@", objc_opt_class()];
      }
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    v9 = (void *)getkCAWindowServerOcclusionTypeLayerSymbolLoc_ptr;
    uint64_t v43 = getkCAWindowServerOcclusionTypeLayerSymbolLoc_ptr;
    if (!getkCAWindowServerOcclusionTypeLayerSymbolLoc_ptr)
    {
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      v37 = __getkCAWindowServerOcclusionTypeLayerSymbolLoc_block_invoke;
      v38 = &unk_1E5441630;
      v39 = &v40;
      v10 = QuartzCoreLibrary_9830();
      v41[3] = (uint64_t)dlsym(v10, "kCAWindowServerOcclusionTypeLayer");
      getkCAWindowServerOcclusionTypeLayerSymbolLoc_ptr = *(void *)(v39[1] + 24);
      v9 = (void *)v41[3];
    }
    _Block_object_dispose(&v40, 8);
    if (v9)
    {
      int v11 = 0;
      if ([v8 isEqual:*v9])
      {
        LODWORD(v12) = 0;
        uint64_t v13 = 3;
LABEL_33:
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __94__BKSWindowServerHitTestSecurityAnalysis_securityAnalysisFromCAHitTestDictionary_errorString___block_invoke;
        v30[3] = &unk_1E5441608;
        uint64_t v32 = v13;
        int v33 = (int)v12;
        int v34 = v11;
        id v31 = v5;
        v14 = +[BKSWindowServerHitTestSecurityAnalysis build:v30];

        goto LABEL_36;
      }
      uint64_t v40 = 0;
      v41 = &v40;
      uint64_t v42 = 0x2020000000;
      v21 = (void *)getkCAWindowServerOcclusionTypeClippedSymbolLoc_ptr;
      uint64_t v43 = getkCAWindowServerOcclusionTypeClippedSymbolLoc_ptr;
      if (!getkCAWindowServerOcclusionTypeClippedSymbolLoc_ptr)
      {
        uint64_t v35 = MEMORY[0x1E4F143A8];
        uint64_t v36 = 3221225472;
        v37 = __getkCAWindowServerOcclusionTypeClippedSymbolLoc_block_invoke;
        v38 = &unk_1E5441630;
        v39 = &v40;
        v22 = QuartzCoreLibrary_9830();
        v41[3] = (uint64_t)dlsym(v22, "kCAWindowServerOcclusionTypeClipped");
        getkCAWindowServerOcclusionTypeClippedSymbolLoc_ptr = *(void *)(v39[1] + 24);
        v21 = (void *)v41[3];
      }
      _Block_object_dispose(&v40, 8);
      if (v21)
      {
        if ([v8 isEqual:*v21])
        {
          LODWORD(v12) = 0;
          uint64_t v13 = 2;
          goto LABEL_33;
        }
        uint64_t v40 = 0;
        v41 = &v40;
        uint64_t v42 = 0x2020000000;
        v12 = (void *)getkCAWindowServerOcclusionTypeBorderSymbolLoc_ptr;
        uint64_t v43 = getkCAWindowServerOcclusionTypeBorderSymbolLoc_ptr;
        if (!getkCAWindowServerOcclusionTypeBorderSymbolLoc_ptr)
        {
          uint64_t v35 = MEMORY[0x1E4F143A8];
          uint64_t v36 = 3221225472;
          v37 = __getkCAWindowServerOcclusionTypeBorderSymbolLoc_block_invoke;
          v38 = &unk_1E5441630;
          v39 = &v40;
          v23 = QuartzCoreLibrary_9830();
          v41[3] = (uint64_t)dlsym(v23, "kCAWindowServerOcclusionTypeBorder");
          getkCAWindowServerOcclusionTypeBorderSymbolLoc_ptr = *(void *)(v39[1] + 24);
          v12 = (void *)v41[3];
        }
        _Block_object_dispose(&v40, 8);
        if (v12)
        {
          unsigned int v24 = [v8 isEqual:*v12];
          LODWORD(v12) = 0;
          uint64_t v13 = v24;
          goto LABEL_33;
        }
        v28 = [MEMORY[0x1E4F28B00] currentHandler];
        v29 = [NSString stringWithUTF8String:"NSString *getkCAWindowServerOcclusionTypeBorder(void)"];
        objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"BKSWindowServerHitTestSecurityAnalysis.m", 27, @"%s", dlerror());
      }
      else
      {
        v28 = [MEMORY[0x1E4F28B00] currentHandler];
        v29 = [NSString stringWithUTF8String:"NSString *getkCAWindowServerOcclusionTypeClipped(void)"];
        objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"BKSWindowServerHitTestSecurityAnalysis.m", 26, @"%s", dlerror());
      }
    }
    else
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      v29 = [NSString stringWithUTF8String:"NSString *getkCAWindowServerOcclusionTypeLayer(void)"];
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"BKSWindowServerHitTestSecurityAnalysis.m", 25, @"%s", dlerror());
    }
LABEL_44:

    __break(1u);
    return result;
  }
  v14 = 0;
LABEL_36:

  return v14;
}

- (void)_initWithCopyOf:(void *)a1
{
  v3 = a2;
  if (a1)
  {
    v4 = (char *)-[BKSWindowServerHitTestSecurityAnalysis _init](a1);
    a1 = v4;
    if (v4)
    {
      long long v5 = *(_OWORD *)(v3 + 8);
      long long v6 = *(_OWORD *)(v3 + 24);
      long long v7 = *(_OWORD *)(v3 + 40);
      *(_OWORD *)(v4 + 56) = *(_OWORD *)(v3 + 56);
      *(_OWORD *)(v4 + 40) = v7;
      *(_OWORD *)(v4 + 24) = v6;
      *(_OWORD *)(v4 + 8) = v5;
      long long v8 = *(_OWORD *)(v3 + 72);
      long long v9 = *(_OWORD *)(v3 + 88);
      long long v10 = *(_OWORD *)(v3 + 104);
      *(_OWORD *)(v4 + 120) = *(_OWORD *)(v3 + 120);
      *(_OWORD *)(v4 + 104) = v10;
      *(_OWORD *)(v4 + 88) = v9;
      *(_OWORD *)(v4 + 72) = v8;
      *((_DWORD *)v4 + 34) = *((_DWORD *)v3 + 34);
      v4[140] = v3[140];
      v4[141] = v3[141];
      *((_DWORD *)v4 + 36) = *((_DWORD *)v3 + 36);
      *((_DWORD *)v4 + 37) = *((_DWORD *)v3 + 37);
      *((void *)v4 + 19) = *((void *)v3 + 19);
    }
  }

  return a1;
}

- (id)_init
{
  if (result)
  {
    v1 = result;
    uint64_t v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      uint64_t v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        v4 = [MEMORY[0x1E4F28B00] currentHandler];
        [v4 handleFailureInMethod:sel__init object:v1 file:@"BKSWindowServerHitTestSecurityAnalysis.m" lineNumber:144 description:@"BKSWindowServerHitTestSecurityAnalysis cannot be subclassed"];
      }
    }
    v5.receiver = v1;
    v5.super_class = (Class)BKSWindowServerHitTestSecurityAnalysis;
    return objc_msgSendSuper2(&v5, sel_init);
  }
  return result;
}

- (int64_t)occlusionType
{
  return self->_occlusionType;
}

- (float)occlusionPercentage
{
  return self->_occlusionPercentage;
}

- (unsigned)occlusionMask
{
  return self->_occlusionMask;
}

- (BOOL)parentsHaveInsecureLayerProperties
{
  return self->_parentsHaveInsecureLayerProperties;
}

- (BOOL)hasInsecureFilter
{
  return self->_hasInsecureFilter;
}

- (float)cumulativeOpacity
{
  return self->_cumulativeOpacity;
}

- (CATransform3D)cumulativeLayerTransform
{
  long long v3 = *(_OWORD *)&self->m34;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m32;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self->m44;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self->m42;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self->m14;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m12;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self->m24;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m22;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  long long v4 = (void *)MEMORY[0x1E4F29238];
  long long v5 = *(_OWORD *)&self->_cumulativeLayerTransform.m33;
  long long v22 = *(_OWORD *)&self->_cumulativeLayerTransform.m31;
  long long v23 = v5;
  long long v6 = *(_OWORD *)&self->_cumulativeLayerTransform.m43;
  long long v24 = *(_OWORD *)&self->_cumulativeLayerTransform.m41;
  long long v25 = v6;
  long long v7 = *(_OWORD *)&self->_cumulativeLayerTransform.m13;
  long long v18 = *(_OWORD *)&self->_cumulativeLayerTransform.m11;
  long long v19 = v7;
  long long v8 = *(_OWORD *)&self->_cumulativeLayerTransform.m23;
  long long v20 = *(_OWORD *)&self->_cumulativeLayerTransform.m21;
  long long v21 = v8;
  id v9 = a3;
  long long v10 = [v4 valueWithCATransform3D:&v18];
  id v11 = (id)objc_msgSend(v9, "appendObject:withName:", v10, @"cumulativeLayerTransform", v18, v19, v20, v21, v22, v23, v24, v25);

  id v12 = (id)[v9 appendFloat:@"cumulativeOpacity" withName:self->_cumulativeOpacity];
  id v13 = (id)[v9 appendBool:self->_hasInsecureFilter withName:@"hasInsecureFilter"];
  id v14 = (id)[v9 appendBool:self->_parentsHaveInsecureLayerProperties withName:@"parentsHaveInsecureLayerProperties"];
  id v15 = (id)[v9 appendInt:self->_occlusionMask withName:@"occlusionMask"];
  id v16 = (id)[v9 appendFloat:@"occlusionPercentage" withName:self->_occlusionPercentage];
  v17 = NSStringFromBKSWindowServerHitTestOcclusionType(self->_occlusionType);
  [v9 appendString:v17 withName:@"occlusionType"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  long long v4 = [BKSMutableWindowServerHitTestSecurityAnalysis alloc];
  return -[BKSWindowServerHitTestSecurityAnalysis _initWithCopyOf:](v4, self);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v5 = (char *)v4;
    BOOL v6 = (vminvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 8), *(float64x2_t *)&self->_cumulativeLayerTransform.m11), (int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 24), *(float64x2_t *)&self->_cumulativeLayerTransform.m13)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 40), *(float64x2_t *)&self->_cumulativeLayerTransform.m21), (int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 56), *(float64x2_t *)&self->_cumulativeLayerTransform.m23))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32(
                                                                (int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 72), *(float64x2_t *)&self->_cumulativeLayerTransform.m31), (int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 88), *(float64x2_t *)&self->_cumulativeLayerTransform.m33)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 104), *(float64x2_t *)&self->_cumulativeLayerTransform.m41), (int32x4_t)vceqq_f64(*(float64x2_t *)(v5 + 120), *(float64x2_t *)&self->_cumulativeLayerTransform.m43)))), 7uLL))) & 1) != 0&& BSFloatEqualToFloat()&& v5[140] == self->_hasInsecureFilter&& v5[141] == self->_parentsHaveInsecureLayerProperties&& *((_DWORD *)v5 + 36) == self->_occlusionMask&& BSFloatEqualToFloat()&& *((void *)v5 + 19) == self->_occlusionType;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  long long v3 = *(_OWORD *)&self->_cumulativeLayerTransform.m33;
  v15[4] = *(_OWORD *)&self->_cumulativeLayerTransform.m31;
  v15[5] = v3;
  long long v4 = *(_OWORD *)&self->_cumulativeLayerTransform.m43;
  v15[6] = *(_OWORD *)&self->_cumulativeLayerTransform.m41;
  v15[7] = v4;
  long long v5 = *(_OWORD *)&self->_cumulativeLayerTransform.m13;
  v15[0] = *(_OWORD *)&self->_cumulativeLayerTransform.m11;
  v15[1] = v5;
  long long v6 = *(_OWORD *)&self->_cumulativeLayerTransform.m23;
  v15[2] = *(_OWORD *)&self->_cumulativeLayerTransform.m21;
  v15[3] = v6;
  long long v7 = [MEMORY[0x1E4F29238] valueWithBytes:v15 objCType:"{CATransform3D=dddddddddddddddd}"];
  [v7 hash];

  *(float *)&double v8 = self->_cumulativeOpacity;
  id v9 = [NSNumber numberWithFloat:v8];
  [v9 hash];

  long long v10 = [NSNumber numberWithUnsignedInt:self->_occlusionMask];
  [v10 hash];

  *(float *)&double v11 = self->_occlusionPercentage;
  id v12 = [NSNumber numberWithFloat:v11];
  [v12 hash];

  id v13 = [NSNumber numberWithInteger:self->_occlusionType];
  [v13 hash];

  return BSHashPurifyNS();
}

- (BKSWindowServerHitTestSecurityAnalysis)init
{
  long long v3 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v4 = [NSString stringWithUTF8String:"-[BKSWindowServerHitTestSecurityAnalysis init]"];
  [v3 handleFailureInFunction:v4 file:@"BKSWindowServerHitTestSecurityAnalysis.m" lineNumber:133 description:@"cannot directly allocate BKSWindowServerHitTestSecurityAnalysis"];

  return 0;
}

+ (id)protobufSchema
{
  return (id)[MEMORY[0x1E4F4F808] buildSchemaForClass:a1 builder:&__block_literal_global_9821];
}

void __56__BKSWindowServerHitTestSecurityAnalysis_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_cumulativeLayerTransform"];
  [v2 addField:"_cumulativeOpacity"];
  [v2 addField:"_hasInsecureFilter"];
  [v2 addField:"_parentsHaveInsecureLayerProperties"];
  [v2 addField:"_occlusionMask"];
  [v2 addField:"_occlusionPercentage"];
  [v2 addField:"_occlusionType"];
}

+ (BKSWindowServerHitTestSecurityAnalysis)new
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"+[BKSWindowServerHitTestSecurityAnalysis new]"];
  [v2 handleFailureInFunction:v3 file:@"BKSWindowServerHitTestSecurityAnalysis.m" lineNumber:138 description:@"cannot directly allocate BKSWindowServerHitTestSecurityAnalysis"];

  return 0;
}

+ (id)build:(id)a3
{
  long long v3 = (void (**)(id, id))a3;
  id v4 = -[BKSWindowServerHitTestSecurityAnalysis _init]([BKSMutableWindowServerHitTestSecurityAnalysis alloc]);
  v3[2](v3, v4);

  long long v5 = (void *)[v4 copy];
  return v5;
}

void __94__BKSWindowServerHitTestSecurityAnalysis_securityAnalysisFromCAHitTestDictionary_errorString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setOcclusionType:*(void *)(a1 + 40)];
  [v3 setOcclusionMask:*(unsigned int *)(a1 + 48)];
  LODWORD(v4) = *(_DWORD *)(a1 + 52);
  [v3 setOcclusionPercentage:v4];
  long long v5 = *(void **)(a1 + 32);
  uint64_t v33 = 0;
  int v34 = &v33;
  uint64_t v35 = 0x2020000000;
  long long v6 = (void *)getkCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransformSymbolLoc_ptr;
  uint64_t v36 = getkCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransformSymbolLoc_ptr;
  if (!getkCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransformSymbolLoc_ptr)
  {
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __getkCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransformSymbolLoc_block_invoke;
    id v31 = &unk_1E5441630;
    uint64_t v32 = &v33;
    long long v7 = QuartzCoreLibrary_9830();
    v34[3] = (uint64_t)dlsym(v7, "kCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransform");
    getkCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransformSymbolLoc_ptr = *(void *)(v32[1] + 24);
    long long v6 = (void *)v34[3];
  }
  _Block_object_dispose(&v33, 8);
  if (v6)
  {
    double v8 = [v5 objectForKeyedSubscript:*v6];
    id v9 = v8;
    if (v8) {
      [v8 CATransform3DValue];
    }
    else {
      memset(v27, 0, sizeof(v27));
    }
    [v3 setCumulativeLayerTransform:v27];
    long long v10 = *(void **)(a1 + 32);
    uint64_t v33 = 0;
    int v34 = &v33;
    uint64_t v35 = 0x2020000000;
    double v11 = (void *)getkCAWindowServerHitTestSecurityAnalysisCumulativeOpacitySymbolLoc_ptr;
    uint64_t v36 = getkCAWindowServerHitTestSecurityAnalysisCumulativeOpacitySymbolLoc_ptr;
    if (!getkCAWindowServerHitTestSecurityAnalysisCumulativeOpacitySymbolLoc_ptr)
    {
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      v30 = __getkCAWindowServerHitTestSecurityAnalysisCumulativeOpacitySymbolLoc_block_invoke;
      id v31 = &unk_1E5441630;
      uint64_t v32 = &v33;
      id v12 = QuartzCoreLibrary_9830();
      id v13 = dlsym(v12, "kCAWindowServerHitTestSecurityAnalysisCumulativeOpacity");
      *(void *)(v32[1] + 24) = v13;
      getkCAWindowServerHitTestSecurityAnalysisCumulativeOpacitySymbolLoc_ptr = *(void *)(v32[1] + 24);
      double v11 = (void *)v34[3];
    }
    _Block_object_dispose(&v33, 8);
    if (v11)
    {
      id v14 = [v10 objectForKeyedSubscript:*v11];
      [v14 floatValue];
      objc_msgSend(v3, "setCumulativeOpacity:");

      id v15 = *(void **)(a1 + 32);
      uint64_t v33 = 0;
      int v34 = &v33;
      uint64_t v35 = 0x2020000000;
      id v16 = (void *)getkCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerPropertiesSymbolLoc_ptr;
      uint64_t v36 = getkCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerPropertiesSymbolLoc_ptr;
      if (!getkCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerPropertiesSymbolLoc_ptr)
      {
        uint64_t v28 = MEMORY[0x1E4F143A8];
        uint64_t v29 = 3221225472;
        v30 = __getkCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerPropertiesSymbolLoc_block_invoke;
        id v31 = &unk_1E5441630;
        uint64_t v32 = &v33;
        v17 = QuartzCoreLibrary_9830();
        long long v18 = dlsym(v17, "kCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerProperties");
        *(void *)(v32[1] + 24) = v18;
        getkCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerPropertiesSymbolLoc_ptr = *(void *)(v32[1] + 24);
        id v16 = (void *)v34[3];
      }
      _Block_object_dispose(&v33, 8);
      if (v16)
      {
        long long v19 = [v15 objectForKeyedSubscript:*v16];
        objc_msgSend(v3, "setParentsHaveInsecureLayerProperties:", objc_msgSend(v19, "BOOLValue"));

        long long v20 = *(void **)(a1 + 32);
        uint64_t v33 = 0;
        int v34 = &v33;
        uint64_t v35 = 0x2020000000;
        long long v21 = (void *)getkCAWindowServerHitTestSecurityAnalysisIsInsecureFilteredSymbolLoc_ptr;
        uint64_t v36 = getkCAWindowServerHitTestSecurityAnalysisIsInsecureFilteredSymbolLoc_ptr;
        if (!getkCAWindowServerHitTestSecurityAnalysisIsInsecureFilteredSymbolLoc_ptr)
        {
          uint64_t v28 = MEMORY[0x1E4F143A8];
          uint64_t v29 = 3221225472;
          v30 = __getkCAWindowServerHitTestSecurityAnalysisIsInsecureFilteredSymbolLoc_block_invoke;
          id v31 = &unk_1E5441630;
          uint64_t v32 = &v33;
          long long v22 = QuartzCoreLibrary_9830();
          long long v23 = dlsym(v22, "kCAWindowServerHitTestSecurityAnalysisIsInsecureFiltered");
          *(void *)(v32[1] + 24) = v23;
          getkCAWindowServerHitTestSecurityAnalysisIsInsecureFilteredSymbolLoc_ptr = *(void *)(v32[1] + 24);
          long long v21 = (void *)v34[3];
        }
        _Block_object_dispose(&v33, 8);
        if (v21)
        {
          long long v24 = [v20 objectForKeyedSubscript:*v21];
          objc_msgSend(v3, "setHasInsecureFilter:", objc_msgSend(v24, "BOOLValue"));

          return;
        }
        long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
        int v26 = [NSString stringWithUTF8String:"NSString *getkCAWindowServerHitTestSecurityAnalysisIsInsecureFiltered(void)"];
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"BKSWindowServerHitTestSecurityAnalysis.m", 33, @"%s", dlerror());
      }
      else
      {
        long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
        int v26 = [NSString stringWithUTF8String:"NSString *getkCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerProperties(void)"];
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"BKSWindowServerHitTestSecurityAnalysis.m", 32, @"%s", dlerror());
      }
    }
    else
    {
      long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
      int v26 = [NSString stringWithUTF8String:"NSString *getkCAWindowServerHitTestSecurityAnalysisCumulativeOpacity(void)"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"BKSWindowServerHitTestSecurityAnalysis.m", 31, @"%s", dlerror());
    }
  }
  else
  {
    long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
    int v26 = [NSString stringWithUTF8String:"NSString *getkCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransform(void)"];
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"BKSWindowServerHitTestSecurityAnalysis.m", 30, @"%s", dlerror());
  }

  __break(1u);
}

@end