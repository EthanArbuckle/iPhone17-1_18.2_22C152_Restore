@interface HDRFlexRangeParameters
+ (id)flexRangeParametersFromDictionary:(id)a3;
+ (id)flexRangeParametersFromMetadata:(CGImageMetadata *)a3;
- (BOOL)isMono;
- (BOOL)useBaseColor;
- (CGColorSpace)alternateColorSpace;
- (CGImageMetadata)createFlexRangeMetadata;
- (HDRFlexRangeParameters)init;
- (__n128)channelAlternateOffsetRGB;
- (__n128)channelBaseOffsetRGB;
- (__n128)channelGammaRGB;
- (__n128)channelMaxRGB;
- (__n128)channelMinRGB;
- (float)alternateHeadroom;
- (float)baseHeadroom;
- (float)channelAlternateOffset;
- (float)channelBaseOffset;
- (float)channelGamma;
- (float)channelMax;
- (float)channelMin;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createFlexRangeDictionary;
- (id)description;
- (unint64_t)version;
- (void)setAlternateColorSpace:(CGColorSpace *)a3;
- (void)setAlternateHeadroom:(float)a3;
- (void)setBaseHeadroom:(float)a3;
- (void)setChannelAlternateOffset:(float)a3;
- (void)setChannelAlternateOffsetRGB:(HDRFlexRangeParameters *)self;
- (void)setChannelBaseOffset:(float)a3;
- (void)setChannelBaseOffsetRGB:(HDRFlexRangeParameters *)self;
- (void)setChannelGamma:(float)a3;
- (void)setChannelGammaRGB:(HDRFlexRangeParameters *)self;
- (void)setChannelMax:(float)a3;
- (void)setChannelMaxRGB:(HDRFlexRangeParameters *)self;
- (void)setChannelMin:(float)a3;
- (void)setChannelMinRGB:(HDRFlexRangeParameters *)self;
- (void)setIsMono:(BOOL)a3;
- (void)setUseBaseColor:(BOOL)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation HDRFlexRangeParameters

- (HDRFlexRangeParameters)init
{
  v9.receiver = self;
  v9.super_class = (Class)HDRFlexRangeParameters;
  result = [(HDRFlexRangeParameters *)&v9 init];
  result->_version = 1;
  *(void *)&result->_baseHeadroom = 0x4000000000000000;
  *(_WORD *)&result->_isMono = 257;
  __asm { FMOV            V1.4S, #1.0 }
  *(_OWORD *)result->_channelMinRGB = 0u;
  *(_OWORD *)result->_channelMaxRGB = _Q1;
  int32x4_t v8 = vdupq_n_s32(0x38D1B717u);
  *(_OWORD *)result->_channelGammaRGB = _Q1;
  *(int32x4_t *)result->_channelBaseOffsetRGB = v8;
  *(int32x4_t *)result->_channelAlternateOffsetRGB = v8;
  return result;
}

+ (id)flexRangeParametersFromDictionary:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HDRFlexRangeParameters_flexRangeParametersFromDictionary___block_invoke_2;
  aBlock[3] = &unk_1E53C0730;
  id v17 = &__block_literal_global;
  v4 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__HDRFlexRangeParameters_flexRangeParametersFromDictionary___block_invoke_3;
  v14[3] = &unk_1E53C0758;
  id v15 = &__block_literal_global;
  v5 = (void (**)(void *, void *, void))_Block_copy(v14);
  v6 = objc_alloc_init(HDRFlexRangeParameters);
  *(float *)&double v7 = __60__HDRFlexRangeParameters_flexRangeParametersFromDictionary___block_invoke((uint64_t)v6, v3);
  *(float *)&double v8 = __60__HDRFlexRangeParameters_flexRangeParametersFromDictionary___block_invoke([(HDRFlexRangeParameters *)v6 setBaseHeadroom:v7], v3);
  [(HDRFlexRangeParameters *)v6 setAlternateHeadroom:v8];
  objc_super v9 = [v3 objectForKeyedSubscript:*(void *)gIIO_kCMPhotoMetadata_TonemapChannelMetadataKeys];
  if ([v9 count] == 1)
  {
    [(HDRFlexRangeParameters *)v6 setIsMono:1];
    v4[2](v4, v9, *(void *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMin);
    -[HDRFlexRangeParameters setChannelMin:](v6, "setChannelMin:");
    v4[2](v4, v9, *(void *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMax);
    -[HDRFlexRangeParameters setChannelMax:](v6, "setChannelMax:");
    v4[2](v4, v9, *(void *)gIIO_kCMPhotoMetadataTonemapChannel_Gamma);
    -[HDRFlexRangeParameters setChannelGamma:](v6, "setChannelGamma:");
    v4[2](v4, v9, *(void *)gIIO_kCMPhotoMetadataTonemapChannel_BaseOffset);
    -[HDRFlexRangeParameters setChannelBaseOffset:](v6, "setChannelBaseOffset:");
    v4[2](v4, v9, *(void *)gIIO_kCMPhotoMetadataTonemapChannel_AlternateOffset);
    -[HDRFlexRangeParameters setChannelAlternateOffset:](v6, "setChannelAlternateOffset:");
  }
  else
  {
    if ([v9 count] != 3)
    {
      LogError("+[HDRFlexRangeParameters flexRangeParametersFromDictionary:]", 95, "Invalid FlexRange channel count: %ld", [v9 count]);
      v12 = 0;
      goto LABEL_9;
    }
    [(HDRFlexRangeParameters *)v6 setIsMono:0];
    v5[2](v5, v9, *(void *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMin);
    -[HDRFlexRangeParameters setChannelMinRGB:](v6, "setChannelMinRGB:");
    v5[2](v5, v9, *(void *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMax);
    -[HDRFlexRangeParameters setChannelMaxRGB:](v6, "setChannelMaxRGB:");
    v5[2](v5, v9, *(void *)gIIO_kCMPhotoMetadataTonemapChannel_Gamma);
    -[HDRFlexRangeParameters setChannelGammaRGB:](v6, "setChannelGammaRGB:");
    v5[2](v5, v9, *(void *)gIIO_kCMPhotoMetadataTonemapChannel_BaseOffset);
    -[HDRFlexRangeParameters setChannelBaseOffsetRGB:](v6, "setChannelBaseOffsetRGB:");
    v5[2](v5, v9, *(void *)gIIO_kCMPhotoMetadataTonemapChannel_AlternateOffset);
    -[HDRFlexRangeParameters setChannelAlternateOffsetRGB:](v6, "setChannelAlternateOffsetRGB:");
  }
  v10 = [v3 objectForKeyedSubscript:*(void *)gIIO_kCMPhotoMetadata_TonemapBaseColorIsWorkingColor];
  v11 = v10;
  if (!v10) {
    v10 = (void *)MEMORY[0x1E4F1CC38];
  }
  -[HDRFlexRangeParameters setUseBaseColor:](v6, "setUseBaseColor:", [v10 BOOLValue]);

  [(HDRFlexRangeParameters *)v6 setVersion:1];
  v12 = v6;
LABEL_9:

  return v12;
}

float __60__HDRFlexRangeParameters_flexRangeParametersFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "objectForKeyedSubscript:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v2 count] == 2)
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    [v3 doubleValue];
    double v5 = v4;

    v6 = [v2 objectAtIndexedSubscript:1];
    [v6 doubleValue];
    double v8 = v7;

    float v9 = v5 / v8;
  }
  else
  {
    id v10 = [v2 description];
    LogError("+[HDRFlexRangeParameters flexRangeParametersFromDictionary:]_block_invoke", 57, "Invalid FlexRange value: %s", (const char *)[v10 UTF8String]);

    float v9 = 0.0;
  }

  return v9;
}

float __60__HDRFlexRangeParameters_flexRangeParametersFromDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  double v7 = [a2 objectAtIndexedSubscript:0];
  float v8 = (*(float (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);

  return v8;
}

__n128 __60__HDRFlexRangeParameters_flexRangeParametersFromDictionary___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  float v8 = [v5 objectAtIndexedSubscript:0];
  unsigned __int32 v16 = COERCE_UNSIGNED_INT64((*(double (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6));

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [v5 objectAtIndexedSubscript:1];
  unsigned __int32 v15 = COERCE_UNSIGNED_INT64((*(double (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v6));

  uint64_t v11 = *(void *)(a1 + 32);
  v12 = [v5 objectAtIndexedSubscript:2];
  unsigned __int32 v14 = COERCE_UNSIGNED_INT64((*(double (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v6));

  result.n128_u32[0] = v16;
  result.n128_u32[1] = v15;
  result.n128_u32[2] = v14;
  return result;
}

- (id)createFlexRangeDictionary
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HDRFlexRangeParameters_createFlexRangeDictionary__block_invoke_2;
  aBlock[3] = &unk_1E53C07A0;
  id v32 = &__block_literal_global_42;
  id v3 = (void (**)(void *, id, void))_Block_copy(aBlock);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __51__HDRFlexRangeParameters_createFlexRangeDictionary__block_invoke_3;
  v29[3] = &unk_1E53C07C8;
  id v30 = &__block_literal_global_42;
  double v4 = (void (**)(void *, id, void))_Block_copy(v29);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = *(void **)gIIO_kCMPhotoMetadata_TonemapBaseHDRHeadroom;
  uint64_t v7 = [(HDRFlexRangeParameters *)self baseHeadroom];
  __51__HDRFlexRangeParameters_createFlexRangeDictionary__block_invoke(v8, v7, v5, v6);
  uint64_t v9 = *(void **)gIIO_kCMPhotoMetadata_TonemapAlternateHDRHeadroom;
  uint64_t v10 = [(HDRFlexRangeParameters *)self alternateHeadroom];
  __51__HDRFlexRangeParameters_createFlexRangeDictionary__block_invoke(v11, v10, v5, v9);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(HDRFlexRangeParameters *)self isMono])
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v12 addObject:v13];

    uint64_t v14 = *(void *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMin;
    [(HDRFlexRangeParameters *)self channelMin];
    v3[2](v3, v12, v14);
    uint64_t v15 = *(void *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMax;
    [(HDRFlexRangeParameters *)self channelMax];
    v3[2](v3, v12, v15);
    uint64_t v16 = *(void *)gIIO_kCMPhotoMetadataTonemapChannel_Gamma;
    [(HDRFlexRangeParameters *)self channelGamma];
    v3[2](v3, v12, v16);
    uint64_t v17 = *(void *)gIIO_kCMPhotoMetadataTonemapChannel_BaseOffset;
    [(HDRFlexRangeParameters *)self channelBaseOffset];
    v3[2](v3, v12, v17);
    uint64_t v18 = *(void *)gIIO_kCMPhotoMetadataTonemapChannel_AlternateOffset;
    [(HDRFlexRangeParameters *)self channelAlternateOffset];
    v3[2](v3, v12, v18);
  }
  else
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v12 addObject:v19];

    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v12 addObject:v20];

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v12 addObject:v21];

    uint64_t v22 = *(void *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMin;
    [(HDRFlexRangeParameters *)self channelMinRGB];
    v4[2](v4, v12, v22);
    uint64_t v23 = *(void *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMax;
    [(HDRFlexRangeParameters *)self channelMaxRGB];
    v4[2](v4, v12, v23);
    uint64_t v24 = *(void *)gIIO_kCMPhotoMetadataTonemapChannel_Gamma;
    [(HDRFlexRangeParameters *)self channelGammaRGB];
    v4[2](v4, v12, v24);
    uint64_t v25 = *(void *)gIIO_kCMPhotoMetadataTonemapChannel_BaseOffset;
    [(HDRFlexRangeParameters *)self channelBaseOffsetRGB];
    v4[2](v4, v12, v25);
    uint64_t v26 = *(void *)gIIO_kCMPhotoMetadataTonemapChannel_AlternateOffset;
    [(HDRFlexRangeParameters *)self channelAlternateOffsetRGB];
    v4[2](v4, v12, v26);
  }
  [v5 setObject:v12 forKeyedSubscript:*(void *)gIIO_kCMPhotoMetadata_TonemapChannelMetadataKeys];
  v27 = objc_msgSend(NSNumber, "numberWithBool:", -[HDRFlexRangeParameters useBaseColor](self, "useBaseColor"));
  [v5 setObject:v27 forKeyedSubscript:*(void *)gIIO_kCMPhotoMetadata_TonemapBaseColorIsWorkingColor];

  return v5;
}

void __51__HDRFlexRangeParameters_createFlexRangeDictionary__block_invoke(float a1, uint64_t a2, void *a3, void *a4)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v19 = 0;
  float v8 = frexpf(a1, &v19);
  int v9 = (int)ldexpf(v8, 24);
  if (v19 >= -7) {
    int v10 = 24 - v19;
  }
  else {
    int v10 = 31;
  }
  if (v19 >= -7) {
    char v11 = 0;
  }
  else {
    char v11 = -7 - v19;
  }
  LODWORD(v12) = v9 >> v11;
  if (((v9 >> v11) & 1) != 0 || v10 < 1)
  {
    unsigned int v15 = v12 << -(char)v10;
    if (v10 >= 0)
    {
      uint64_t v12 = v12;
    }
    else
    {
      LOBYTE(v10) = 0;
      uint64_t v12 = v15;
    }
  }
  else
  {
    do
    {
      char v13 = v12;
      uint64_t v12 = ((int)v12 >> 1);
      BOOL v14 = v10-- != 0;
    }
    while ((v13 & 2) == 0 && v10 != 0 && v14);
  }
  uint64_t v16 = [NSNumber numberWithInt:v12];
  v20[0] = v16;
  uint64_t v17 = [NSNumber numberWithUnsignedInt:(1 << v10)];
  v20[1] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v6 setObject:v18 forKeyedSubscript:v7];
}

void __51__HDRFlexRangeParameters_createFlexRangeDictionary__block_invoke_2(uint64_t a1, void *a2, void *a3, float a4)
{
  id v9 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  float v8 = [a2 objectAtIndexedSubscript:0];
  (*(void (**)(uint64_t, void *, id, float))(v7 + 16))(v7, v8, v9, a4);
}

void __51__HDRFlexRangeParameters_createFlexRangeDictionary__block_invoke_3(uint64_t a1, void *a2, void *a3, __n128 a4)
{
  id v14 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  float v8 = [v14 objectAtIndexedSubscript:0];
  (*(void (**)(uint64_t, void *, id, __n128))(v7 + 16))(v7, v8, v6, a4);

  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = [v14 objectAtIndexedSubscript:1];
  (*(void (**)(uint64_t, void *, id, float))(v9 + 16))(v9, v10, v6, a4.n128_f32[1]);

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = [v14 objectAtIndexedSubscript:2];
  (*(void (**)(uint64_t, void *, id, float))(v11 + 16))(v11, v12, v6, a4.n128_f32[2]);
}

+ (id)flexRangeParametersFromMetadata:(CGImageMetadata *)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke;
  aBlock[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  void aBlock[4] = a3;
  id v3 = _Block_copy(aBlock);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_2;
  v28[3] = &unk_1E53C0810;
  id v4 = v3;
  id v29 = v4;
  id v5 = _Block_copy(v28);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_3;
  v26[3] = &unk_1E53C0838;
  id v6 = v4;
  id v27 = v6;
  uint64_t v7 = (uint64_t (**)(void *, __CFString *, uint64_t))_Block_copy(v26);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_4;
  v24[3] = &unk_1E53C0860;
  id v8 = v6;
  id v25 = v8;
  uint64_t v9 = (void (**)(void *, __CFString *))_Block_copy(v24);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_5;
  v22[3] = &unk_1E53C0888;
  id v10 = v5;
  id v23 = v10;
  uint64_t v11 = _Block_copy(v22);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_6;
  void v20[3] = &unk_1E53C08B0;
  id v12 = v11;
  id v21 = v12;
  char v13 = (void (**)(void *, __CFString *))_Block_copy(v20);
  id v14 = (*((void (**)(id, __CFString *))v8 + 2))(v8, @"Version");
  uint64_t v15 = [v14 integerValue];

  if (!v15)
  {
    uint64_t v18 = 0;
    goto LABEL_10;
  }
  uint64_t v16 = objc_alloc_init(HDRFlexRangeParameters);
  [(HDRFlexRangeParameters *)v16 setVersion:v15];
  (*((void (**)(id, __CFString *))v10 + 2))(v10, @"BaseHeadroom");
  -[HDRFlexRangeParameters setBaseHeadroom:](v16, "setBaseHeadroom:");
  (*((void (**)(id, __CFString *))v10 + 2))(v10, @"AlternateHeadroom");
  -[HDRFlexRangeParameters setAlternateHeadroom:](v16, "setAlternateHeadroom:");
  uint64_t v17 = v9[2](v9, @"ChannelMetadata");
  if ([v17 count] == 1)
  {
    [(HDRFlexRangeParameters *)v16 setIsMono:1];
    (*((void (**)(id, __CFString *, void))v12 + 2))(v12, @"GainMapMin", 0);
    -[HDRFlexRangeParameters setChannelMin:](v16, "setChannelMin:");
    (*((void (**)(id, __CFString *, void))v12 + 2))(v12, @"GainMapMax", 0);
    -[HDRFlexRangeParameters setChannelMax:](v16, "setChannelMax:");
    (*((void (**)(id, __CFString *, void))v12 + 2))(v12, @"Gamma", 0);
    -[HDRFlexRangeParameters setChannelGamma:](v16, "setChannelGamma:");
    (*((void (**)(id, __CFString *, void))v12 + 2))(v12, @"BaseOffset", 0);
    -[HDRFlexRangeParameters setChannelBaseOffset:](v16, "setChannelBaseOffset:");
    (*((void (**)(id, __CFString *, void))v12 + 2))(v12, @"AlternateOffset", 0);
    -[HDRFlexRangeParameters setChannelAlternateOffset:](v16, "setChannelAlternateOffset:");
  }
  else
  {
    if ([v17 count] != 3)
    {
      LogError("+[HDRFlexRangeParameters flexRangeParametersFromMetadata:]", 237, "Invalid FlexRange channel count: %ld", [v17 count]);
      uint64_t v18 = 0;
      goto LABEL_9;
    }
    [(HDRFlexRangeParameters *)v16 setIsMono:0];
    v13[2](v13, @"GainMapMin");
    -[HDRFlexRangeParameters setChannelMinRGB:](v16, "setChannelMinRGB:");
    v13[2](v13, @"GainMapMax");
    -[HDRFlexRangeParameters setChannelMaxRGB:](v16, "setChannelMaxRGB:");
    v13[2](v13, @"Gamma");
    -[HDRFlexRangeParameters setChannelGammaRGB:](v16, "setChannelGammaRGB:");
    v13[2](v13, @"BaseOffset");
    -[HDRFlexRangeParameters setChannelBaseOffsetRGB:](v16, "setChannelBaseOffsetRGB:");
    v13[2](v13, @"AlternateOffset");
    -[HDRFlexRangeParameters setChannelAlternateOffsetRGB:](v16, "setChannelAlternateOffsetRGB:");
  }
  [(HDRFlexRangeParameters *)v16 setUseBaseColor:v7[2](v7, @"BaseColorIsWorkingColor", 1)];
  uint64_t v18 = v16;
LABEL_9:

LABEL_10:

  return v18;
}

id __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [NSString stringWithFormat:@"%@:%@", @"HDRToneMap", a2];
  id v4 = CGImageMetadataCopyTagWithPath(*(CGImageMetadataRef *)(a1 + 32), 0, v3);
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)CGImageMetadataTagCopyValue(v4);
  }
  else
  {
    _cg_jpeg_mem_term("+[HDRFlexRangeParameters flexRangeParametersFromMetadata:]_block_invoke", 165, "Failed to get metadata tag: %s", (const char *)[(__CFString *)v3 UTF8String]);
    id v6 = 0;
  }

  return v6;
}

float __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v4 floatValue];
    float v6 = v5;
  }
  else
  {
    uint64_t v7 = (const char *)[v3 UTF8String];
    id v8 = [v4 description];
    LogError("+[HDRFlexRangeParameters flexRangeParametersFromMetadata:]_block_invoke_2", 174, "Invalid '%s' tag value: %s", v7, (const char *)[v8 UTF8String]);

    float v6 = 0.0;
  }

  return v6;
}

uint64_t __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  float v6 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      a3 = [v6 BOOLValue];
    }
    else
    {
      uint64_t v7 = (const char *)[v5 UTF8String];
      id v8 = [v6 description];
      LogError("+[HDRFlexRangeParameters flexRangeParametersFromMetadata:]_block_invoke_3", 185, "Invalid '%s' tag value: %s", v7, (const char *)[v8 UTF8String]);
    }
  }

  return a3;
}

id __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    float v6 = (const char *)[v3 UTF8String];
    id v7 = [v4 description];
    LogError("+[HDRFlexRangeParameters flexRangeParametersFromMetadata:]_block_invoke_4", 193, "Invalid '%s' tag value: %s", v6, (const char *)[v7 UTF8String]);

    id v5 = 0;
  }

  return v5;
}

float __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [NSString stringWithFormat:@"%@[%lu].%@", @"ChannelMetadata", a3, a2];
  float v5 = (*(float (**)(void))(*(void *)(a1 + 32) + 16))();

  return v5;
}

__n128 __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int32 v7 = COERCE_UNSIGNED_INT64((*(double (**)(void))(*(void *)(a1 + 32) + 16))());
  unsigned __int32 v6 = COERCE_UNSIGNED_INT64((*(double (**)(void))(*(void *)(a1 + 32) + 16))());
  unsigned __int32 v5 = COERCE_UNSIGNED_INT64((*(double (**)(void))(*(void *)(a1 + 32) + 16))());

  result.n128_u32[0] = v7;
  result.n128_u32[1] = v6;
  result.n128_u32[2] = v5;
  return result;
}

- (CGImageMetadata)createFlexRangeMetadata
{
  CGMutableImageMetadataRef Mutable = CGImageMetadataCreateMutable();
  if (CGImageMetadataRegisterNamespaceForPrefix(Mutable, @"http://ns.apple.com/HDRToneMap/1.0/", @"HDRToneMap", 0))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke;
    aBlock[3] = &unk_1E53C08D8;
    id v4 = Mutable;
    id v29 = v4;
    unsigned __int32 v5 = _Block_copy(aBlock);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_2;
    v26[3] = &unk_1E53C0900;
    id v6 = v5;
    id v27 = v6;
    unsigned __int32 v7 = _Block_copy(v26);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_3;
    v24[3] = &unk_1E53C0928;
    id v8 = v6;
    id v25 = v8;
    uint64_t v9 = (void (**)(void *, __CFString *, BOOL))_Block_copy(v24);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_4;
    v22[3] = &unk_1E53C0950;
    id v10 = v8;
    id v23 = v10;
    uint64_t v11 = (void (**)(void *, __CFString *, unint64_t))_Block_copy(v22);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_5;
    void v20[3] = &unk_1E53C0978;
    id v12 = v7;
    id v21 = v12;
    char v13 = _Block_copy(v20);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_6;
    v18[3] = &unk_1E53C09A0;
    id v14 = v13;
    id v19 = v14;
    uint64_t v15 = (void (**)(void *, __CFString *))_Block_copy(v18);
    [(HDRFlexRangeParameters *)self baseHeadroom];
    (*((void (**)(id, __CFString *))v12 + 2))(v12, @"BaseHeadroom");
    [(HDRFlexRangeParameters *)self alternateHeadroom];
    (*((void (**)(id, __CFString *))v12 + 2))(v12, @"AlternateHeadroom");
    if ([(HDRFlexRangeParameters *)self isMono])
    {
      [(HDRFlexRangeParameters *)self channelMin];
      (*((void (**)(id, __CFString *, void))v14 + 2))(v14, @"GainMapMin", 0);
      [(HDRFlexRangeParameters *)self channelMax];
      (*((void (**)(id, __CFString *, void))v14 + 2))(v14, @"GainMapMax", 0);
      [(HDRFlexRangeParameters *)self channelGamma];
      (*((void (**)(id, __CFString *, void))v14 + 2))(v14, @"Gamma", 0);
      [(HDRFlexRangeParameters *)self channelBaseOffset];
      (*((void (**)(id, __CFString *, void))v14 + 2))(v14, @"BaseOffset", 0);
      [(HDRFlexRangeParameters *)self channelAlternateOffset];
      (*((void (**)(id, __CFString *, void))v14 + 2))(v14, @"AlternateOffset", 0);
    }
    else
    {
      [(HDRFlexRangeParameters *)self channelMinRGB];
      v15[2](v15, @"GainMapMin");
      [(HDRFlexRangeParameters *)self channelMaxRGB];
      v15[2](v15, @"GainMapMax");
      [(HDRFlexRangeParameters *)self channelGammaRGB];
      v15[2](v15, @"Gamma");
      [(HDRFlexRangeParameters *)self channelBaseOffsetRGB];
      v15[2](v15, @"BaseOffset");
      [(HDRFlexRangeParameters *)self channelAlternateOffsetRGB];
      v15[2](v15, @"AlternateOffset");
    }
    v9[2](v9, @"BaseColorIsWorkingColor", [(HDRFlexRangeParameters *)self useBaseColor]);
    v11[2](v11, @"Version", [(HDRFlexRangeParameters *)self version]);
    uint64_t v16 = v4;
  }
  else
  {
    LogError("-[HDRFlexRangeParameters createFlexRangeMetadata]", 250, "Failed to register HDRFlexRange metadata tag!");
    uint64_t v16 = 0;
  }

  return v16;
}

void __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id value = a3;
  unsigned __int32 v5 = [NSString stringWithFormat:@"%@:%@", @"HDRToneMap", a2];
  if (!CGImageMetadataSetValueWithPath(*(CGMutableImageMetadataRef *)(a1 + 32), 0, v5, value)) {
    LogError("-[HDRFlexRangeParameters createFlexRangeMetadata]_block_invoke", 256, "Failed to set metadata tag: %s", (const char *)[(__CFString *)v5 UTF8String]);
  }
}

void __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_2(uint64_t a1, void *a2, float a3)
{
  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  *(float *)&double v6 = a3;
  unsigned __int32 v7 = [NSNumber numberWithFloat:v6];
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v8, v7);
}

void __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = [NSNumber numberWithBool:a3];
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);
}

void __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = [NSNumber numberWithUnsignedInteger:a3];
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);
}

void __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  id v6 = [NSString stringWithFormat:@"%@[%lu].%@", @"ChannelMetadata", a3, a2];
  (*(void (**)(float))(*(void *)(a1 + 32) + 16))(a4);
}

void __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_6(uint64_t a1, void *a2, __n128 a3)
{
  id v4 = a2;
  (*(void (**)(__n128))(*(void *)(a1 + 32) + 16))(a3);
  (*(void (**)(float))(*(void *)(a1 + 32) + 16))(a3.n128_f32[1]);
  (*(void (**)(float))(*(void *)(a1 + 32) + 16))(a3.n128_f32[2]);
}

- (float)channelMin
{
  return *(float *)self->_channelMinRGB;
}

- (void)setChannelMin:(float)a3
{
  *(int32x4_t *)self->_channelMinRGB = vdupq_lane_s32(*(int32x2_t *)&a3, 0);
}

- (float)channelMax
{
  return *(float *)self->_channelMaxRGB;
}

- (void)setChannelMax:(float)a3
{
  *(int32x4_t *)self->_channelMaxRGB = vdupq_lane_s32(*(int32x2_t *)&a3, 0);
}

- (float)channelGamma
{
  return *(float *)self->_channelGammaRGB;
}

- (void)setChannelGamma:(float)a3
{
  *(int32x4_t *)self->_channelGammaRGB = vdupq_lane_s32(*(int32x2_t *)&a3, 0);
}

- (float)channelBaseOffset
{
  return *(float *)self->_channelBaseOffsetRGB;
}

- (void)setChannelBaseOffset:(float)a3
{
  *(int32x4_t *)self->_channelBaseOffsetRGB = vdupq_lane_s32(*(int32x2_t *)&a3, 0);
}

- (float)channelAlternateOffset
{
  return *(float *)self->_channelAlternateOffsetRGB;
}

- (void)setChannelAlternateOffset:(float)a3
{
  *(int32x4_t *)self->_channelAlternateOffsetRGB = vdupq_lane_s32(*(int32x2_t *)&a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  *((void *)result + 3) = self->_version;
  *((_DWORD *)result + 3) = LODWORD(self->_baseHeadroom);
  *((_DWORD *)result + 4) = LODWORD(self->_alternateHeadroom);
  *((unsigned char *)result + 8) = self->_isMono;
  *((_OWORD *)result + 3) = *(_OWORD *)self->_channelMinRGB;
  *((_OWORD *)result + 4) = *(_OWORD *)self->_channelMaxRGB;
  *((_OWORD *)result + 5) = *(_OWORD *)self->_channelGammaRGB;
  *((_OWORD *)result + 6) = *(_OWORD *)self->_channelBaseOffsetRGB;
  *((_OWORD *)result + 7) = *(_OWORD *)self->_channelAlternateOffsetRGB;
  *((unsigned char *)result + 9) = self->_useBaseColor;
  *((void *)result + 4) = self->_alternateColorSpace;
  return result;
}

- (id)description
{
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = [(HDRFlexRangeParameters *)self version];
  [(HDRFlexRangeParameters *)self baseHeadroom];
  float v8 = v7;
  [(HDRFlexRangeParameters *)self baseHeadroom];
  float v10 = exp2f(v9);
  [(HDRFlexRangeParameters *)self alternateHeadroom];
  float v12 = v11;
  [(HDRFlexRangeParameters *)self alternateHeadroom];
  float v14 = exp2f(v13);
  if ([(HDRFlexRangeParameters *)self isMono]) {
    uint64_t v15 = @"Yes";
  }
  else {
    uint64_t v15 = @"No";
  }
  if ([(HDRFlexRangeParameters *)self useBaseColor]) {
    uint64_t v16 = @"base";
  }
  else {
    uint64_t v16 = @"alternate";
  }
  [(HDRFlexRangeParameters *)self channelMinRGB];
  float v52 = v17;
  [(HDRFlexRangeParameters *)self channelMinRGB];
  float v51 = v18;
  [(HDRFlexRangeParameters *)self channelMinRGB];
  float v50 = v19;
  [(HDRFlexRangeParameters *)self channelMaxRGB];
  float v49 = v20;
  [(HDRFlexRangeParameters *)self channelMaxRGB];
  float v48 = v21;
  [(HDRFlexRangeParameters *)self channelMaxRGB];
  float v47 = v22;
  [(HDRFlexRangeParameters *)self channelGammaRGB];
  float v46 = v23;
  [(HDRFlexRangeParameters *)self channelGammaRGB];
  float v45 = v24;
  [(HDRFlexRangeParameters *)self channelGammaRGB];
  float v44 = v25;
  [(HDRFlexRangeParameters *)self channelBaseOffsetRGB];
  float v43 = v26;
  [(HDRFlexRangeParameters *)self channelBaseOffsetRGB];
  float v42 = v27;
  [(HDRFlexRangeParameters *)self channelBaseOffsetRGB];
  float v41 = v28;
  [(HDRFlexRangeParameters *)self channelAlternateOffsetRGB];
  float v40 = v29;
  [(HDRFlexRangeParameters *)self channelAlternateOffsetRGB];
  float v39 = v30;
  [(HDRFlexRangeParameters *)self channelAlternateOffsetRGB];
  float v38 = v31;
  id v32 = [(HDRFlexRangeParameters *)self alternateColorSpace];
  if (v32)
  {
    CFStringRef v33 = CGColorSpaceCopyName([(HDRFlexRangeParameters *)self alternateColorSpace]);
    if (v33)
    {
      v2 = (__CFString *)v33;
      int v34 = 0;
      v35 = (__CFString *)v33;
    }
    else
    {
      v35 = (__CFString *)CFCopyDescription([(HDRFlexRangeParameters *)self alternateColorSpace]);
      v2 = 0;
      int v34 = 1;
    }
  }
  else
  {
    int v34 = 0;
    v35 = @"n/a";
  }
  objc_msgSend(v4, "stringWithFormat:", @"<%@:%p version:%ld base:%0.2f(%0.2f) alt:%0.2f(%0.2f) mono:%@ color:%@ min=(%0.3f,%0.3f,%0.3f) max=(%0.3f,%0.3f,%0.3f) g=(%0.3f,%0.3f,%0.3f) kB=(%0.3f,%0.3f,%0.3f) kA=(%0.3f,%0.3f,%0.3f) alt space: %@>", v5, self, v6, v8, v10, v12, v14, v15, v16, v52, v51, v50, v49, v48, v47, v46,
    v45,
    v44,
    v43,
    v42,
    v41,
    v40,
    v39,
    v38,
  v36 = v35);
  if (v34) {

  }
  if (v32) {

  }
  return v36;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (float)baseHeadroom
{
  return self->_baseHeadroom;
}

- (void)setBaseHeadroom:(float)a3
{
  self->_baseHeadroom = a3;
}

- (float)alternateHeadroom
{
  return self->_alternateHeadroom;
}

- (void)setAlternateHeadroom:(float)a3
{
  self->_alternateHeadroom = a3;
}

- (BOOL)isMono
{
  return self->_isMono;
}

- (void)setIsMono:(BOOL)a3
{
  self->_isMono = a3;
}

- (__n128)channelMinRGB
{
  return a1[3];
}

- (void)setChannelMinRGB:(HDRFlexRangeParameters *)self
{
  *(_OWORD *)self->_channelMinRGB = v2;
}

- (__n128)channelMaxRGB
{
  return a1[4];
}

- (void)setChannelMaxRGB:(HDRFlexRangeParameters *)self
{
  *(_OWORD *)self->_channelMaxRGB = v2;
}

- (__n128)channelGammaRGB
{
  return a1[5];
}

- (void)setChannelGammaRGB:(HDRFlexRangeParameters *)self
{
  *(_OWORD *)self->_channelGammaRGB = v2;
}

- (__n128)channelBaseOffsetRGB
{
  return a1[6];
}

- (void)setChannelBaseOffsetRGB:(HDRFlexRangeParameters *)self
{
  *(_OWORD *)self->_channelBaseOffsetRGB = v2;
}

- (__n128)channelAlternateOffsetRGB
{
  return a1[7];
}

- (void)setChannelAlternateOffsetRGB:(HDRFlexRangeParameters *)self
{
  *(_OWORD *)self->_channelAlternateOffsetRGB = v2;
}

- (BOOL)useBaseColor
{
  return self->_useBaseColor;
}

- (void)setUseBaseColor:(BOOL)a3
{
  self->_useBaseColor = a3;
}

- (CGColorSpace)alternateColorSpace
{
  return self->_alternateColorSpace;
}

- (void)setAlternateColorSpace:(CGColorSpace *)a3
{
  self->_alternateColorSpace = a3;
}

@end