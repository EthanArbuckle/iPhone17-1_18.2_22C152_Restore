@interface HDRImageConverter
+ (__CFUUID)createUUIDFromLumaGainHistogram:(id *)a3;
+ (id)computeToneMappingCurveFromLumaGainHistogram:(id *)a3;
+ (id)flexGTCTableDataFromCurveArray:(id)a3 min:(float)a4 max:(float)a5;
+ (id)imageConverterWithOptions:(id)a3;
- (BOOL)canProcessPixelBufferWithAttributes:(id)a3;
- (BOOL)computeLumaGainHistogram:(id *)a3 scale:(__CVBuffer *)a4 image:(id *)a5 transform:(__CVBuffer *)a6 gainMap:(id *)a7 transform:;
- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 gainMap:(__CVBuffer *)a6 transform:(id *)a7 alternate:(id *)a8 toImage:(__CVBuffer *)a9 transform:(id *)a10 gainMap:(__CVBuffer *)a11 transform:(id *)a12;
- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 toImage:(__CVBuffer *)a6 transform:(id *)a7 gainMap:(__CVBuffer *)a8 transform:(id *)a9;
- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 gainMap:(__CVBuffer *)a5 transform:(id *)a6 toImage:(__CVBuffer *)a7 transform:(id *)a8;
- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 toImage:(__CVBuffer *)a5 transform:(id *)a6;
- (BOOL)convertImage:(id)a3 toImage:(id)a4;
- (BOOL)isPixelFormatSupported:(unsigned int)a3;
- (BOOL)isYCCMatrixSupported:(id)a3;
- (id)generateToneMappingCurveForImage:(id)a3 targetHeadroom:(double)a4;
@end

@implementation HDRImageConverter

+ (id)imageConverterWithOptions:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"kCGDisableMetal"];
  char v5 = [v4 BOOLValue];

  if ((v5 & 1) != 0 || IIORestrictedDecodingEnabledFlag())
  {
    LogWarning("+[HDRImageConverter imageConverterWithOptions:]", 35, "☀️ Metal disabled, will use SIMD for image conversion");
LABEL_4:
    v6 = objc_alloc_init(HDRImageConverter_SIMD);
    goto LABEL_5;
  }
  v6 = objc_alloc_init(HDRImageConverter_Metal);
  if (!v6)
  {
    LogError("+[HDRImageConverter imageConverterWithOptions:]", 40, "☀️ Failed to initialize Metal converter, falling back to SIMD for image conversion (slow)");
    goto LABEL_4;
  }
LABEL_5:
  if ((gIIODebugFlags & 0x300000) != 0)
  {
    id v7 = [(HDRImageConverter_SIMD *)v6 description];
    ImageIOLog("☀️ Using converter: %s\n", (const char *)[v7 UTF8String]);
  }

  return v6;
}

- (BOOL)convertImage:(id)a3 toImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 headroom];
  float v9 = v8;
  [v7 headroom];
  float v11 = fminf(v9, v10);
  *(float *)&double v12 = v11;
  v13 = [v7 outputTransformFromEDR:v12];
  v14 = v13;
  if (v13)
  {
    v37 = self;
    if ([v13 flags])
    {
      if (([v14 flags] & 2) != 0) {
        float v25 = 1.0;
      }
      else {
        float v25 = v11;
      }
      *(float *)&double v24 = v25;
      v17 = [v6 inputTransformToEDR:v24];
      if (([v14 flags] & 2) != 0) {
        float v27 = v11;
      }
      else {
        float v27 = 1.0;
      }
      *(float *)&double v26 = v27;
      uint64_t v28 = [v6 inputTransformToEDR:v26];
      v22 = (void *)v28;
      if (v17) {
        BOOL v29 = v28 == 0;
      }
      else {
        BOOL v29 = 1;
      }
      BOOL v18 = !v29;
      if ((gIIODebugFlags & 0x300000) != 0)
      {
        id v36 = [v17 description];
        v30 = (const char *)[v36 UTF8String];
        id v31 = [v22 description];
        v32 = (const char *)[v31 UTF8String];
        id v33 = [v14 description];
        ImageIOLog("☀️ HDRImageConverter::convertImageToImage SRC x ALT => DST\nSRC[EDR=%g] => %s\nALT[EDR=%g] => %s\nDST[EDR=%g] => %s", v25, v30, v27, v32, v11, (const char *)[v33 UTF8String]);

        if (v18) {
          goto LABEL_24;
        }
LABEL_21:
        BOOL v23 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      *(float *)&double v15 = v11;
      v16 = [v6 inputTransformToEDR:v15];
      v17 = v16;
      BOOL v18 = v16 != 0;
      if ((gIIODebugFlags & 0x300000) != 0)
      {
        id v19 = [v16 description];
        v20 = (const char *)[v19 UTF8String];
        id v21 = [v14 description];
        ImageIOLog("☀️ HDRImageConverter::convertImageToImage SRC => DST\nSRC[EDR=%g] => %s\nDST[EDR=%g] => %s", v11, v20, v11, (const char *)[v21 UTF8String]);

        v22 = 0;
        if (!v17)
        {
          BOOL v23 = 0;
          v17 = 0;
LABEL_33:

          goto LABEL_34;
        }
LABEL_24:
        if ([v14 flags])
        {
          if ([v17 flags] & 1) != 0 || (objc_msgSend(v22, "flags")) {
            BOOL v34 = -[HDRImageConverter convertImage:transform:alternate:gainMap:transform:alternate:toImage:transform:gainMap:transform:](v37, "convertImage:transform:alternate:gainMap:transform:alternate:toImage:transform:gainMap:transform:", [v6 imageBuffer], objc_msgSend(v17, "image"), objc_msgSend(v22, "image"), objc_msgSend(v6, "gainMapBuffer"), objc_msgSend(v17, "gainMap"), objc_msgSend(v22, "gainMap"), objc_msgSend(v7, "imageBuffer"), objc_msgSend(v14, "image"), objc_msgSend(v7, "gainMapBuffer"), objc_msgSend(v14, "gainMap"));
          }
          else {
            BOOL v34 = -[HDRImageConverter convertImage:transform:alternate:toImage:transform:gainMap:transform:](v37, "convertImage:transform:alternate:toImage:transform:gainMap:transform:", [v6 imageBuffer], objc_msgSend(v17, "image"), objc_msgSend(v22, "image"), objc_msgSend(v7, "imageBuffer"), objc_msgSend(v14, "image"), objc_msgSend(v7, "gainMapBuffer"), objc_msgSend(v14, "gainMap"));
          }
        }
        else if ([v17 flags])
        {
          BOOL v34 = -[HDRImageConverter convertImage:transform:gainMap:transform:toImage:transform:](v37, "convertImage:transform:gainMap:transform:toImage:transform:", [v6 imageBuffer], objc_msgSend(v17, "image"), objc_msgSend(v6, "gainMapBuffer"), objc_msgSend(v17, "gainMap"), objc_msgSend(v7, "imageBuffer"), objc_msgSend(v14, "image"));
        }
        else
        {
          BOOL v34 = -[HDRImageConverter convertImage:transform:toImage:transform:](v37, "convertImage:transform:toImage:transform:", [v6 imageBuffer], objc_msgSend(v17, "image"), objc_msgSend(v7, "imageBuffer"), objc_msgSend(v14, "image"));
        }
        BOOL v23 = v34;
        goto LABEL_33;
      }
      v22 = 0;
    }
    if (v18) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  BOOL v23 = 0;
LABEL_34:

  return v23;
}

- (id)generateToneMappingCurveForImage:(id)a3 targetHeadroom:(double)a4
{
  uint64_t v4 = MEMORY[0x1F4188790](self, a2);
  double v6 = v5;
  id v7 = (void *)v4;
  id v41 = v8;
  [v41 headroom];
  double v10 = fmin((float)(v9 + -0.000001), v6);
  float v11 = v10;
  *(float *)&double v10 = v11;
  v42 = [v41 inputTransformToEDR:v10];
  if ((gIIODebugFlags & 0x300000) != 0)
  {
    id v12 = [v42 description];
    ImageIOLog("☀️ HDRImageConverter::generateToneMappingCurve SRC => GTC\nSRC[EDR=%g] => %s", v11, (const char *)[v12 UTF8String]);
  }
  if (!v42) {
    goto LABEL_18;
  }
  if (([v42 flags] & 1) == 0)
  {
    id v13 = [v41 description];
    LogError("-[HDRImageConverter generateToneMappingCurveForImage:targetHeadroom:]", 118, "Missing gain map: %s", (const char *)[v13 UTF8String]);

LABEL_18:
    v38 = 0;
    goto LABEL_19;
  }
  bzero(v43, 0x1000uLL);
  uint64_t v14 = [v41 imageBuffer];
  uint64_t v15 = [v42 image];
  uint64_t v16 = [v41 gainMapBuffer];
  uint64_t v17 = [v42 gainMap];
  __asm { FMOV            V0.2S, #1.0 }
  *(float *)&_D0 = 1.0 / v11;
  if (([v7 computeLumaGainHistogram:v43 scale:v14 image:v15 transform:v16 gainMap:v17 transform:_D0] & 1) == 0)
  {
    LogError("-[HDRImageConverter generateToneMappingCurveForImage:targetHeadroom:]", 130, "Failed to compute luma-gain histogram");
    goto LABEL_18;
  }
  BOOL v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32];
  id v24 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v25 = 1;
  do
  {
    double v26 = [NSNumber numberWithInt:v25];
    [v23 addObject:v26];

    uint64_t v25 = (v25 + 1);
  }
  while (v25 != 33);
  float v27 = [v23 componentsJoinedByString:@","];
  [v24 appendFormat:@"lxg,%@\n", v27];

  uint64_t v28 = 0;
  BOOL v29 = v43;
  do
  {
    [v23 removeAllObjects];
    for (uint64_t i = 0; i != 128; i += 4)
    {
      id v31 = objc_msgSend(NSString, "stringWithFormat:", @"%u", *(unsigned int *)&v29[i]);
      [v23 addObject:v31];
    }
    v32 = [v23 componentsJoinedByString:@","];
    [v24 appendFormat:@"%d,%@\n", ++v28, v32];

    v29 += 128;
  }
  while (v28 != 32);
  id v33 = v24;
  _cg_jpeg_mem_term("-[HDRImageConverter generateToneMappingCurveForImage:targetHeadroom:]", 149, "Luma-Gain Histogram Data: (32x32)\n%s", (const char *)[v33 UTF8String]);
  BOOL v34 = [(id)objc_opt_class() computeToneMappingCurveFromLumaGainHistogram:v43];
  if (v34)
  {
    v35 = (void *)[(id)objc_opt_class() createUUIDFromLumaGainHistogram:v43];
    if (v35)
    {
      *(float *)&double v36 = v6;
      v37 = [v41 flexGTCInfoWithCurveData:v34 headroom:v35 identifier:v36];
      v38 = v37;
      if (v37) {
        id v39 = v37;
      }
      else {
        LogError("-[HDRImageConverter generateToneMappingCurveForImage:targetHeadroom:]", 168, "Failed to compute tone mapping curve from luma gain histogram");
      }
    }
    else
    {
      LogError("-[HDRImageConverter generateToneMappingCurveForImage:targetHeadroom:]", 161, "Failed to compute tone mapping curve from luma gain histogram");
      v38 = 0;
    }
  }
  else
  {
    LogError("-[HDRImageConverter generateToneMappingCurveForImage:targetHeadroom:]", 155, "Failed to compute tone mapping curve from luma gain histogram");
    v38 = 0;
  }

LABEL_19:

  return v38;
}

- (BOOL)canProcessPixelBufferWithAttributes:(id)a3
{
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:*(void *)gIIO_kCVImageBufferCGColorSpaceKey];

  if (!v5)
  {
    id v6 = [v4 description];
    LogError("-[HDRImageConverter canProcessPixelBufferWithAttributes:]", 179, "Missing color space attribute: %s", (const char *)[v6 UTF8String]);
    goto LABEL_38;
  }
  if (CGColorSpaceUsesITUR_2100TF((CGColorSpaceRef)v5))
  {
    if (!CGColorSpaceIsPQBased((CGColorSpaceRef)v5) && !CGColorSpaceIsHLGBased((CGColorSpaceRef)v5))
    {
      id v6 = [v5 description];
      LogError("-[HDRImageConverter canProcessPixelBufferWithAttributes:]", 186, "Unsupported HDR color space: %s", (const char *)[v6 UTF8String]);
LABEL_38:
      BOOL v9 = 0;
      goto LABEL_39;
    }
  }
  else if (!+[HDRImage supportsSourceColorSpace:v5])
  {
    id v6 = [v5 description];
    LogError("-[HDRImageConverter canProcessPixelBufferWithAttributes:]", 192, "Unsupported SDR color space: %s", (const char *)[v6 UTF8String]);
    goto LABEL_38;
  }
  id v7 = [v4 objectForKeyedSubscript:*(void *)gIIO_kCVPixelBufferPixelFormatTypeKey];
  id v6 = v7;
  if (!v7)
  {
    id v10 = [v4 description];
    LogError("-[HDRImageConverter canProcessPixelBufferWithAttributes:]", 200, "Missing pixel format attribute: %s", (const char *)[v10 UTF8String]);

    goto LABEL_38;
  }
  uint64_t v8 = [v7 unsignedIntValue];
  if (![(HDRImageConverter *)self isPixelFormatSupported:v8])
  {
    unsigned int v11 = (int)v8 >> 24;
    uint64_t v12 = MEMORY[0x1E4F14390];
    if ((v8 & 0x80000000) != 0) {
      int v13 = __maskrune((int)v8 >> 24, 0x40000uLL);
    }
    else {
      int v13 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v11 + 60) & 0x40000;
    }
    if (v13) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = 46;
    }
    unsigned int v15 = (int)(v8 << 8) >> 24;
    if (((v8 << 8) & 0x80000000) != 0) {
      int v16 = __maskrune((int)(v8 << 8) >> 24, 0x40000uLL);
    }
    else {
      int v16 = *(_DWORD *)(v12 + 4 * v15 + 60) & 0x40000;
    }
    if (v16) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = 46;
    }
    unsigned int v18 = (__int16)v8 >> 8;
    if (((v8 << 16) & 0x80000000) != 0) {
      int v19 = __maskrune((__int16)v8 >> 8, 0x40000uLL);
    }
    else {
      int v19 = *(_DWORD *)(v12 + 4 * v18 + 60) & 0x40000;
    }
    if (v8 << 24 <= 0x7F000000u) {
      int v20 = *(_DWORD *)(v12 + 4 * (char)v8 + 60) & 0x40000;
    }
    else {
      int v20 = __maskrune((char)v8, 0x40000uLL);
    }
    if (v19) {
      uint64_t v21 = v18;
    }
    else {
      uint64_t v21 = 46;
    }
    if (v20) {
      uint64_t v22 = (char)v8;
    }
    else {
      uint64_t v22 = 46;
    }
    LogError("-[HDRImageConverter canProcessPixelBufferWithAttributes:]", 206, "Unsupported pixel format: '%c%c%c%c'", v14, v17, v21, v22);
    goto LABEL_38;
  }
  BOOL v9 = 1;
LABEL_39:

  return v9;
}

- (BOOL)isPixelFormatSupported:(unsigned int)a3
{
  return 0;
}

- (BOOL)isYCCMatrixSupported:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*(void *)gIIO_kCVImageBufferYCbCrMatrix_ITU_R_601_4] & 1) != 0
    || ([v3 isEqualToString:*(void *)gIIO_kCVImageBufferYCbCrMatrix_ITU_R_709_2] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:*(void *)gIIO_kCVImageBufferYCbCrMatrix_ITU_R_2020];
  }

  return v4;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 toImage:(__CVBuffer *)a5 transform:(id *)a6
{
  return 0;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 gainMap:(__CVBuffer *)a5 transform:(id *)a6 toImage:(__CVBuffer *)a7 transform:(id *)a8
{
  return 0;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 toImage:(__CVBuffer *)a6 transform:(id *)a7 gainMap:(__CVBuffer *)a8 transform:(id *)a9
{
  return 0;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 gainMap:(__CVBuffer *)a6 transform:(id *)a7 alternate:(id *)a8 toImage:(__CVBuffer *)a9 transform:(id *)a10 gainMap:(__CVBuffer *)a11 transform:(id *)a12
{
  return 0;
}

- (BOOL)computeLumaGainHistogram:(id *)a3 scale:(__CVBuffer *)a4 image:(id *)a5 transform:(__CVBuffer *)a6 gainMap:(id *)a7 transform:
{
  return 0;
}

+ (id)computeToneMappingCurveFromLumaGainHistogram:(id *)a3
{
  v53[559] = *MEMORY[0x1E4F143B8];
  bzero(v52, 0x1180uLL);
  uint64_t v4 = 0;
  v5.i64[0] = 0x3F0000003F000000;
  v5.i64[1] = 0x3F0000003F000000;
  v6.i64[0] = 0x3D0000003D000000;
  v6.i64[1] = 0x3D0000003D000000;
  v7.i64[0] = 0x400000004;
  v7.i64[1] = 0x400000004;
  uint64_t v8 = a3;
  do
  {
    uint64_t v9 = 0;
    int32x4_t v10 = 0uLL;
    do
    {
      int32x4_t v10 = vaddq_s32(*(int32x4_t *)&v8->var0[0][v9], v10);
      v9 += 4;
    }
    while (v9 != 32);
    uint64_t v11 = 0;
    int v12 = vaddvq_s32(v10);
    v52[35 * v4] = v12;
    unsigned int v13 = v12;
    int32x2_t v14 = 0;
    int32x4_t v15 = (int32x4_t)xmmword_18898C3A0;
    do
    {
      float32x4_t v16 = vmulq_f32(vmulq_f32(vaddq_f32(vcvtq_f32_s32(v15), v5), v6), vcvtq_f32_u32(*(uint32x4_t *)&v8->var0[0][v11]));
      *(float *)v14.i32 = (float)((float)((float)(*(float *)v14.i32 + v16.f32[0]) + v16.f32[1]) + v16.f32[2])
                        + v16.f32[3];
      int32x4_t v15 = vaddq_s32(v15, v7);
      v11 += 4;
    }
    while (v11 != 32);
    uint64_t v17 = 0;
    *(float *)v14.i32 = *(float *)v14.i32 / (float)v13;
    v52[35 * v4 + 1] = v14.i32[0];
    float32x4_t v18 = (float32x4_t)vdupq_lane_s32(v14, 0);
    float v19 = 0.0;
    int32x4_t v20 = (int32x4_t)xmmword_18898C3A0;
    do
    {
      float32x4_t v21 = vsubq_f32(vmulq_f32(vaddq_f32(vcvtq_f32_s32(v20), v5), v6), v18);
      float32x4_t v22 = vmulq_f32(vmulq_f32(v21, vcvtq_f32_u32(*(uint32x4_t *)&v8->var0[0][v17])), v21);
      float v19 = (float)((float)((float)(v19 + v22.f32[0]) + v22.f32[1]) + v22.f32[2]) + v22.f32[3];
      int32x4_t v20 = vaddq_s32(v20, v7);
      v17 += 4;
    }
    while (v17 != 32);
    BOOL v23 = &v52[35 * v4];
    *((float *)v23 + 2) = sqrtf(v19 / (float)v13);
    id v24 = a3->var0[v4];
    long long v25 = *((_OWORD *)v24 + 5);
    *(_OWORD *)(v23 + 19) = *((_OWORD *)v24 + 4);
    *(_OWORD *)(v23 + 23) = v25;
    long long v26 = *((_OWORD *)v24 + 7);
    *(_OWORD *)(v23 + 27) = *((_OWORD *)v24 + 6);
    *(_OWORD *)(v23 + 31) = v26;
    long long v27 = *((_OWORD *)v24 + 1);
    *(_OWORD *)(v23 + 3) = *(_OWORD *)v24;
    *(_OWORD *)(v23 + 7) = v27;
    long long v28 = *((_OWORD *)v24 + 3);
    *(_OWORD *)(v23 + 11) = *((_OWORD *)v24 + 2);
    *(_OWORD *)(v23 + 15) = v28;
    ++v4;
    uint64_t v8 = (const $1FF2F8D2599020761ACEFF31D93EEB84 *)((char *)v8 + 128);
  }
  while (v4 != 32);
  if (HDRFlexGTC_fillGaps((uint64_t)v52, 0x424800003C03126FLL, 1))
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    [v29 appendString:@"Bin,N,gM,gSD\n"];
    uint64_t v30 = 0;
    id v31 = (float *)v53;
    do
    {
      objc_msgSend(v29, "appendFormat:", @"%d,%u,%f,%f\n", v30, *((unsigned int *)v31 - 2), *(v31 - 1), *v31);
      v31 += 35;
      ++v30;
    }
    while (v30 != 32);
    id v46 = v29;
    _cg_jpeg_mem_term("+[HDRImageConverter computeToneMappingCurveFromLumaGainHistogram:]", 312, "Luma-Gain Bins Data: (32x32)\n%s", (const char *)[v46 UTF8String]);
    bzero(v50, 0x380uLL);
    int v48 = 0;
    HDRFlexGTC_curveFit((uint64_t)v52, 0x424800003C03126FLL, 1, (uint64_t)v50, &v48);
    if (v48)
    {
      id v47 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      [v47 appendString:@"cubic,x,y,slope\n"];
      if (v48 >= 1)
      {
        uint64_t v32 = 0;
        id v33 = (float *)v51;
        do
        {
          objc_msgSend(v47, "appendFormat:", @"%d,%f,%f,%f\n", v32++, *(v33 - 2), *(v33 - 1), *v33);
          v33 += 7;
        }
        while (v32 < v48);
      }
      id v45 = v47;
      _cg_jpeg_mem_term("+[HDRImageConverter computeToneMappingCurveFromLumaGainHistogram:]", 329, "Luma-Gain Cubic Points: \n%s", (const char *)[v45 UTF8String]);
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (v48 >= 1)
      {
        uint64_t v36 = 0;
        v37 = v51;
        do
        {
          LODWORD(v35) = *(v37 - 2);
          v38 = [NSNumber numberWithFloat:v35];
          v49[0] = v38;
          LODWORD(v39) = *(v37 - 1);
          v40 = [NSNumber numberWithFloat:v39];
          v49[1] = v40;
          LODWORD(v41) = *v37;
          v42 = [NSNumber numberWithFloat:v41];
          v49[2] = v42;
          v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
          [v34 addObject:v43];

          ++v36;
          v37 += 7;
        }
        while (v36 < v48);
      }
    }
    else
    {
      LogError("+[HDRImageConverter computeToneMappingCurveFromLumaGainHistogram:]", 319, "Failed to fit curve");
      id v34 = 0;
    }
  }
  else
  {
    LogError("+[HDRImageConverter computeToneMappingCurveFromLumaGainHistogram:]", 301, "Failed to fill gaps");
    id v34 = 0;
  }

  return v34;
}

+ (__CFUUID)createUUIDFromLumaGainHistogram:(id *)a3
{
  CGGetMD5DigestOfBytes();
  *(void *)&v4.byte0 = 0;
  *(void *)&v4.byte8 = 0;
  return CFUUIDCreateFromUUIDBytes(0, v4);
}

+ (id)flexGTCTableDataFromCurveArray:(id)a3 min:(float)a4 max:(float)a5
{
  id v7 = a3;
  if ((unint64_t)[v7 count] >= 2 && (unint64_t)objc_msgSend(v7, "count") < 0x21)
  {
    int v10 = [v7 count];
    uint64_t v11 = (char *)malloc_type_calloc(v10, 0x1CuLL, 0x100004027586B93uLL);
    int v12 = (float *)v11;
    if (v10 < 1)
    {
LABEL_17:
      id v9 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:2048];
      uint64_t v27 = [v9 mutableBytes];
      long long v28 = (float *)malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
      HDRFlexGTC_fillTable(v12, v10, (uint64_t)v28, 1024, v29);
      float v30 = exp2f(a5);
      uint64_t v31 = 0;
      float v32 = a5 - a4;
      float v33 = -1.0;
      do
      {
        _S0 = exp2f(a4 + (float)(v32 * v28[v31]));
        float v35 = (float)(int)v31 / 1023.0;
        float v36 = (float)(v35 * _S0) / v30;
        if (v36 < v33)
        {
          _S0 = v30 * (float)(v33 / v35);
          float v36 = v33;
        }
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v27 + 2 * v31++) = _H0;
        float v33 = v36 + 0.00035;
      }
      while (v31 != 1024);
      free(v28);
    }
    else
    {
      uint64_t v13 = 0;
      int v43 = v10;
      v44 = (float *)v11;
      uint64_t v14 = v10 - 1;
      int32x4_t v15 = v11 + 8;
      char v16 = 1;
      do
      {
        uint64_t v17 = [v7 objectAtIndexedSubscript:v13];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || [v17 count] != 3)
        {
          id v41 = [v17 description];
          int v12 = v44;
          LogError("+[HDRImageConverter flexGTCTableDataFromCurveArray:min:max:]", 378, "Invalid GTC data: %s", (const char *)[v41 UTF8String]);

          goto LABEL_23;
        }
        float32x4_t v18 = [v17 objectAtIndexedSubscript:0];
        float v19 = [v17 objectAtIndexedSubscript:1];
        int32x4_t v20 = [v17 objectAtIndexedSubscript:2];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          [v18 floatValue];
          *(v15 - 2) = v21;
          [v19 floatValue];
          *(v15 - 1) = v22;
          [v20 floatValue];
          char v23 = 0;
          *int32x4_t v15 = v24;
        }
        else
        {
          id v25 = [v17 description];
          LogError("+[HDRImageConverter flexGTCTableDataFromCurveArray:min:max:]", 373, "Invalid GTC data: %s", (const char *)[v25 UTF8String]);

          char v16 = 0;
          char v23 = 1;
        }

        if (v23) {
          break;
        }
        v15 += 7;
      }
      while (v14 != v13++);
      int v10 = v43;
      int v12 = v44;
      if (v16) {
        goto LABEL_17;
      }
LABEL_23:
      id v9 = 0;
    }
    free(v12);
  }
  else
  {
    id v8 = [v7 description];
    LogError("+[HDRImageConverter flexGTCTableDataFromCurveArray:min:max:]", 354, "Invalid GTC data: %s", (const char *)[v8 UTF8String]);

    id v9 = 0;
  }

  return v9;
}

uint64_t __38__HDRImageConverter_Metal_metalDevice__block_invoke(uint64_t a1)
{
  +[HDRImageConverter_Metal metalDevice]::s_device = [*(id *)(a1 + 32) selectMetalDevice];

  return MEMORY[0x1F41817F8]();
}

void __55__HDRImageConverter_Metal_commitAndWaitUntilCompleted___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 status] != 4)
  {
    id v3 = [v5 error];
    id v4 = [v3 debugDescription];
    LogError("-[HDRImageConverter_Metal commitAndWaitUntilCompleted:]_block_invoke", 374, "☀️ CommandBuffer %p failed '%s'", v5, (const char *)[v4 UTF8String]);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

@end