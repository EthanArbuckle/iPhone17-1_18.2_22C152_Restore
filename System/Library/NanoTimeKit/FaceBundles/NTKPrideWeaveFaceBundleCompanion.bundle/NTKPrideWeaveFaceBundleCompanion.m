float spiro_computeMaxWidth(int a1, float a2)
{
  float v2;

  v2 = 3.14159265 / (double)a1 + 3.14159265 / (double)a1;
  return (float)((float)(v2 * a2) / sqrtf((float)(a2 * a2) + 1.0)) * 0.5;
}

float spiro_computeAmplitude(int a1, float a2)
{
  float v2 = 3.14159265 / (double)a1 + 3.14159265 / (double)a1;
  return (float)(a2 + a2) / sqrtf((float)((float)(a2 * -4.0) * a2) + (float)(v2 * v2));
}

double noise4x2()
{
  snoise4();
  unsigned int v3 = v0;
  snoise4();
  return COERCE_DOUBLE(__PAIR64__(v1, v3));
}

uint64_t *_NoiseConfiguration(void *a1, uint64_t a2)
{
  id v3 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2C820);
  id WeakRetained = objc_loadWeakRetained(&qword_2C828);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_2C828);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_2C828, v3);
    qword_2C830 = (uint64_t)[v3 version];

    qword_2C720[0] = 0x3FC0000041000000;
    xmmword_2C730 = (__int128)vdupq_n_s64(0x3FFCCCCCCCCCCCCDuLL);
    unk_2C740 = xmmword_1DB00;
    qword_2C750 = 0x3E19999A3E99999ALL;
    unk_2C758 = vdup_n_s32(0x3E4CCCCDu);
    qword_2C760 = 0x3F9000003FE00000;
    xmmword_2C770 = xmmword_2C730;
    unk_2C780 = xmmword_1DB00;
    __asm { FMOV            V4.2S, #0.25 }
    qword_2C790 = 0x3E19999A3E99999ALL;
    unk_2C798 = _D4;
    __asm { FMOV            V2.2S, #1.5 }
    qword_2C7A0 = _D2;
    xmmword_2C7B0 = xmmword_2C730;
    unk_2C7C0 = xmmword_1DB00;
    qword_2C7D0 = (uint64_t)vdup_n_s32(0x3E99999Au);
    unk_2C7D8 = unk_2C758;
    qword_2C7E0 = 0x3F9000003FA00000;
    xmmword_2C7F0 = xmmword_2C730;
    unk_2C800 = xmmword_1DB00;
    qword_2C810 = 0x3D4CCCCD3E99999ALL;
    unk_2C818 = _D4;
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_2C830;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2C820);

  return &qword_2C720[8 * a2];
}

id sub_5C90(uint64_t a1)
{
  float v2 = [*(id *)(a1 + 32) _generateInterpolationPositions];
  id v3 = *(void **)(a1 + 40);
  id v23 = v2;
  id v21 = objc_msgSend(v3, "newBufferWithBytes:length:options:", objc_msgSend(v23, "bytes"), objc_msgSend(v23, "length"), 0);
  v4 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:width:height:mipmapped:](MTLTextureDescriptor, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 113, (unint64_t)*(int *)(*(void *)(a1 + 32) + 104) >> 3, (int)[*(id *)(a1 + 32) numSplines], 0);
  [v4 setUsage:1];
  v22 = v4;
  id v20 = [*(id *)(a1 + 40) newTextureWithDescriptor:v4];
  v5 = [*(id *)(a1 + 32) generateVignetteTextureData];
  id v6 = *(void **)(a1 + 40);
  id v7 = v5;
  id v19 = objc_msgSend(v6, "newBufferWithBytes:length:options:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), 0);
  uint64_t v8 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:10 width:64 height:64 mipmapped:0];
  [v8 setUsage:1];
  id v9 = [*(id *)(a1 + 40) newTextureWithDescriptor:v8];
  v10 = +[CLKUIMetalResourceManager sharedCommandQueue];
  v11 = [v10 commandBuffer];
  +[CLKUIMetalResourceManager addCompletedErrorCheckToCommandBuffer:v11 forCase:@"PrideLoadTexture"];
  v12 = [v11 blitCommandEncoder];
  v13 = *(int **)(a1 + 32);
  uint64_t v14 = v13[26];
  uint64_t v15 = (int)v14 * (uint64_t)(int)[v13 numSplines];
  v16 = *(int **)(a1 + 32);
  v28[0] = (unint64_t)v16[26] >> 3;
  v28[1] = (int)[v16 numSplines];
  v28[2] = 1;
  memset(v27, 0, sizeof(v27));
  [v12 copyFromBuffer:v21 sourceOffset:0 sourceBytesPerRow:v14 sourceBytesPerImage:v15 sourceSize:v28 toTexture:v20 destinationSlice:0 destinationLevel:0 destinationOrigin:v27];
  int64x2_t v25 = vdupq_n_s64(0x40uLL);
  uint64_t v26 = 1;
  memset(v24, 0, sizeof(v24));
  [v12 copyFromBuffer:v19 sourceOffset:0 sourceBytesPerRow:64 sourceBytesPerImage:4096 sourceSize:&v25 toTexture:v9 destinationSlice:0 destinationLevel:0 destinationOrigin:v24];
  [v12 endEncoding];
  [v11 commit];
  if ([v11 status] != (char *)&dword_0 + 1) {
    [v11 waitUntilScheduled];
  }
  v29[0] = v20;
  v29[1] = v9;
  v17 = +[NSArray arrayWithObjects:v29 count:2];

  return v17;
}

void sub_63BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

float sub_63D4(float32x2_t *a1, float a2, float32x2_t a3)
{
  float32x2_t v4 = vsub_f32(a1[5], a3);
  float result = (float)(a1[6].f32[0] - (float)(sqrtf(vaddv_f32(vmul_f32(v4, v4))) / a1[6].f32[1])) - a2;
  if (result < 0.0 && result > -0.2)
  {
    double v6 = result * 15.7079633;
LABEL_10:
    float v8 = v6;
    float v9 = cosf(v8);
    uint64_t v10 = *(void *)(*(void *)&a1[4] + 8);
    float result = v9 * 0.5 + 0.5 + *(float *)(v10 + 24);
    *(float *)(v10 + 24) = result;
    return result;
  }
  if (result >= 0.0 && result < 1.5)
  {
    double v6 = result * 2.0943951;
    goto LABEL_10;
  }
  return result;
}

uint64_t sub_65C8(uint64_t a1)
{
  [*(id *)(a1 + 32) contents];
  [*(id *)(a1 + 40) currentComputeBufferWidth];
  float v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void frameBufferReleaseCallback(int a1, void *a2)
{
}

id sub_6BB8(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 52)) {
    [*(id *)(a1 + 32) generateControlPointsForSpline:a2];
  }
  id result = [*(id *)(a1 + 32) numControlPointsPerSpline];
  if ((int)result >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      float v6 = *(float *)(a1 + 48);
      [*(id *)(a1 + 32) computeAmplitudeForControlPoint:v5 inSpline:a2 atTime:*(double *)(a1 + 40)];
      float v8 = *(float **)(a1 + 32);
      *(float *)&double v9 = (float)(v6 + v7) * v8[43];
      [v8 setAmplitude:v5 forControlPoint:a2 ofSpline:v9];
      uint64_t v5 = (v5 + 1);
      id result = [*(id *)(a1 + 32) numControlPointsPerSpline];
    }
    while ((int)v5 < (int)result);
  }
  return result;
}

id sub_6C64(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 48) numControlPointsPerSpline];
  if ((int)result >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      [*(id *)(a1 + 48) noiseSamplePositionForControlPoint:v5 inSpline:a2];
      [*(id *)(a1 + 48) ampltiudeForControlPoint:v5 ofSpline:a2];
      uint64_t v14 = v6;
      *(float32x2_t *)&long long v7 = vmul_n_f32(*(float32x2_t *)(*(void *)(a1 + 56) + 56), *(float *)&v6);
      long long v11 = v7;
      long long v12 = *(_OWORD *)(a1 + 32);
      snoise4();
      unsigned int v13 = v8;
      snoise4();
      objc_msgSend(*(id *)(a1 + 48), "setNoise:forControlPoint:inSpline:", v5, a2, COERCE_DOUBLE(vmul_f32((float32x2_t)__PAIR64__(v9, v13), *(float32x2_t *)(*(void *)(a1 + 56) + 48))), v11, v12);
      HIDWORD(v10) = HIDWORD(v14);
      *(float *)&double v10 = fminf(*(float *)&v14, 2.5);
      [*(id *)(a1 + 48) setAmplitude:v5 forControlPoint:a2 ofSpline:v10];
      uint64_t v5 = (v5 + 1);
      id result = [*(id *)(a1 + 48) numControlPointsPerSpline];
    }
    while ((int)v5 < (int)result);
  }
  return result;
}

uint64_t sub_7040(uint64_t a1)
{
  return _NSRequestConcreteImplementation(v2, v1, a1);
}

uint64_t sub_705C()
{
  return objc_opt_class();
}

uint64_t sub_7074()
{
  return v0;
}

void sub_7198(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock(&stru_2C87C);
  id WeakRetained = objc_loadWeakRetained(&qword_2C880);
  if (WeakRetained)
  {
    float32x2_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_2C880);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_2C888;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_2C880, obj);
  qword_2C888 = (uint64_t)[obj version];

  sub_8A94(v9, obj);
LABEL_6:
  os_unfair_lock_unlock(&stru_2C87C);
  long long v10 = *(_OWORD *)&dword_2C858;
  *(_OWORD *)a2 = xmmword_2C848;
  *(_OWORD *)(a2 + 16) = v10;
  *(_OWORD *)(a2 + 32) = xmmword_2C868;
  *(_DWORD *)(a2 + 48) = dword_2C878;
}

void sub_7D88(id a1)
{
  qword_2C838 = objc_opt_new();

  _objc_release_x1();
}

void sub_88F8(uint64_t a1, uint64_t a2, float32x4_t *a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 272) + 320 * (int)a2;
  id v9 = *(id *)(v8 + 240);
  float v10 = *(float *)(v8 + 280);
  float32x4_t v18 = *(float32x4_t *)(v8 + 288);
  float32x4_t v19 = *(float32x4_t *)(v8 + 256);
  int v11 = *(_DWORD *)(v8 + 304);
  int v12 = *(_DWORD *)(v8 + 308);
  [*(id *)(a1 + 32) processSpline:a2];
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  [v9 getControlPoints:&v21 processedPoints:&v20];
  if (*(int *)(a1 + 44) >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v15 = v20;
    uint64_t v14 = v21;
    do
    {
      *(void *)&long long v16 = *(void *)(v14 + 8 * v13);
      *((void *)&v16 + 1) = *(void *)(v15 + 8 * v13);
      *(_OWORD *)(a4 + 16 * v13++) = v16;
    }
    while (v13 < *(int *)(a1 + 44));
  }
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v17 = v17;
  a3->i32[1] = LODWORD(v17);
  a3[2] = vmlaq_n_f32(v19, vsubq_f32(v18, v19), *(float *)(a1 + 92));
  a3->i32[0] = *(_DWORD *)(a1 + 96);
  if (fabsf(*(float *)(*(void *)(a1 + 32) + 288)) < 0.00000011921)
  {
    if (v12 < 1) {
      a3->f32[1] = v10 * (float)v11;
    }
    else {
      a3->i32[0] = 0;
    }
  }
  a3->i32[2] = 1065353216;
  a3->i32[3] = *(_DWORD *)(a1 + 48);
  a3[3].i16[0] = a2;
}

void sub_8A70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8A94(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = (char *)[v2 deviceCategory];
  [v2 screenBounds];
  double v5 = v4;
  [v2 screenScale];
  double v7 = v6;
  if (v3 == (unsigned char *)&dword_0 + 1) {
    int v8 = 30;
  }
  else {
    int v8 = 40;
  }
  LODWORD(xmmword_2C848) = v8;
  dword_2C860 = 5;
  unint64_t v9 = (unint64_t)[v2 sizeClass];

  if (v9 > 7)
  {
    float v10 = 23.0;
    float v11 = 45.0;
  }
  else
  {
    float v10 = flt_1DC80[v9];
    float v11 = flt_1DCA0[v9];
  }
  float v12 = v7 * v5;
  *(float *)&dword_2C858 = v11 / v12;
  unk_2C85C = v10 / v12;
  float32_t v13 = 1.0 / (double)(int)xmmword_2C848;
  float v14 = v13 + -2.8 / v12;
  dword_2C864 = LODWORD(v13);
  *(float *)&xmmword_2C868 = v14;
  v15.f32[0] = (float)(xmmword_2C848 - 1);
  *((float *)&xmmword_2C868 + 1) = (float)(v10 / v12) / (float)dword_2C860;
  v15.f32[1] = v11 / v12;
  __asm { FMOV            V0.2S, #5.0 }
  _D0.f32[0] = v13;
  *((float32x2_t *)&xmmword_2C868 + 1) = vsub_f32((float32x2_t)0x3F0000003F000000, vmul_f32(vmul_f32(v15, _D0), (float32x2_t)0x3F0000003F000000));
  LOBYTE(dword_2C878) = 0;
  *((float *)&xmmword_2C848 + 2) = 2.0 / v12;
  if (v3 == (unsigned char *)&dword_0 + 1) {
    int v21 = 8;
  }
  else {
    int v21 = 12;
  }
  DWORD1(xmmword_2C848) = v21;
  if (v3 == (unsigned char *)&dword_0 + 1) {
    int v22 = 102;
  }
  else {
    int v22 = 152;
  }
  HIDWORD(xmmword_2C848) = v22;
}

void sub_8C54(id a1)
{
  qword_2C890 = (uint64_t)[objc_alloc((Class)NTKCornerComplicationConfiguration) initWithTopLeftComplication:43 topRightComplication:10 bottomLeftComplication:3 bottomRightComplication:7];

  _objc_release_x1();
}

void sub_9D5C(id a1)
{
  qword_2C8A0 = objc_opt_new();

  _objc_release_x1();
}

void sub_BB84(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40) + a3;
  id v5 = a2;
  id v6 = objc_alloc((Class)NTKFaceBundleSortableGalleryFace);
  double v7 = [v5 face];

  id v9 = [v6 initWithFace:v7 priority:v4];
  int v8 = v9;
  if (v9)
  {
    [*(id *)(a1 + 32) addObject:v9];
    int v8 = v9;
  }
}

uint64_t sub_BFCC()
{
  qword_2C8B0 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_C0EC(id a1)
{
  v3[0] = &off_25840;
  v3[1] = &off_25858;
  v4[0] = NTKFaceBundlePrideStyleBanded;
  v4[1] = NTKFaceBundlePrideStyleFabric;
  v3[2] = &off_25870;
  v4[2] = NTKFaceBundlePrideStyleRibbon;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  id v2 = (void *)qword_2C8D0;
  qword_2C8D0 = v1;
}

void sub_CF8C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v3, "setAlpha:");
}

id sub_D1FC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) handleScreenOff];
}

void sub_D450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_D468(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_D478(uint64_t a1)
{
}

uint64_t sub_D480(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if ([v7 tapEnabled])
  {
    id v5 = [v7 display];
    [v5 bounds];
    objc_msgSend(v5, "convertRect:toView:", *(void *)(a1 + 32));
    CGRect v10 = CGRectInset(v9, -10.0, -10.0);
    if (CGRectContainsPoint(v10, *(CGPoint *)(a1 + 48))) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    }
  }

  return _objc_release_x1();
}

uint64_t sub_E764(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 prideFacesForDevice:*(void *)(a1 + 32)];
  if (v3) {
    [*(id *)(a1 + 40) addObjectsFromArray:v3];
  }

  return _objc_release_x1();
}

id *sub_EDD8(id *result, uint64_t a2)
{
  if (a2) {
    return (id *)[result[4] addObject:a2];
  }
  return result;
}

id *sub_F274(id *result, uint64_t a2)
{
  if (a2) {
    return (id *)[result[4] addObject:a2];
  }
  return result;
}

id *sub_F6F8(id *result, uint64_t a2)
{
  if (a2) {
    return (id *)[result[4] addObject:a2];
  }
  return result;
}

void sub_FBA0(id a1)
{
  qword_2C8E0 = [[NTKPrideSwatchMappedImageCache alloc] _init];

  _objc_release_x1();
}

uint64_t sub_FD6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_FD7C(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [*(id *)(a1 + 40) removeImageForKey:v3];
}

int64_t sub_10000(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a2 compare:a3];
}

BOOL sub_10014(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = NTKBuildVersion();
  unsigned __int8 v4 = [(NSString *)v2 hasSuffix:v3];

  return v4 ^ 1;
}

void sub_1033C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10364(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = +[CLKDevice currentDevice];
    id v3 = [WeakRetained screenEdgeTextureForDevice:v2 named:@"RectSDF"];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

float computePhaseShift(float a1, float a2, float a3)
{
  float32_t v3 = a2 * a3;
  __asm { FMOV            V2.2S, #1.0 }
  _D2.f32[0] = v3;
  *(float *)&unsigned int v9 = (float)(v3 * v3) + 1.0;
  float32x2_t v10 = vrsqrte_f32((float32x2_t)v9);
  float32x2_t v11 = vmul_f32(v10, vrsqrts_f32((float32x2_t)v9, vmul_f32(v10, v10)));
  int32x2_t v12 = (int32x2_t)vmul_n_f32(_D2, vmul_f32(v11, vrsqrts_f32((float32x2_t)v9, vmul_f32(v11, v11))).f32[0]);
  _D2.f32[0] = -*(float *)&v12.i32[1];
  return (float)(a1 * a1)
       / vaddv_f32(vmul_f32(vmul_n_f32((float32x2_t)vzip1_s32((int32x2_t)_D2, v12), a1), (float32x2_t)0x3F80000000000000));
}

float computeMaxWidth(int a1, float a2, float a3)
{
  float v3 = 3.14159265 / (double)a1 + 3.14159265 / (double)a1;
  return (float)((float)(v3 * a2) / sqrtf((float)((float)((float)(a2 * a2) * a3) * a3) + 1.0)) * 0.5;
}

float computeMaxPeriod(int a1, float a2, float a3)
{
  double v3 = a2;
  double v4 = v3 * 3.14159265 / (float)((float)a1 * a3);
  return sqrt(v4 * v4 + -1.0) / v3;
}

void sub_119AC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_11AE8(id a1)
{
  qword_2C8F0 = objc_opt_new();

  _objc_release_x1();
}

id sub_11EB0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) computeShaderName];
  id v4 = [v2 newFunctionWithName:v3];

  [v4 setLabel:@"pride_compute_cubic_coefficients"];
  id v5 = *(void **)(a1 + 48);
  id v12 = 0;
  id v6 = [v5 newComputePipelineStateWithFunction:v4 error:&v12];
  id v7 = v12;
  if (!v6)
  {
    int v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      uint64_t v10 = [v4 name];
      uint64_t v11 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      float v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_fault_impl(&dword_0, v8, OS_LOG_TYPE_FAULT, "Pride Metal compilation failure: Shader=%@ Device=%@ Error=%@", buf, 0x20u);
    }
  }

  return v6;
}

id sub_12018(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) vertexShaderName];
  double v3 = [*(id *)(a1 + 32) fragmentShaderName];
  id v4 = [*(id *)(a1 + 40) newFunctionWithName:v3];
  id v5 = [*(id *)(a1 + 40) newFunctionWithName:v2];
  id v6 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  id v7 = [*(id *)(a1 + 32) renderPipelineName];
  [v6 setLabel:v7];

  [v6 setVertexFunction:v5];
  [v6 setFragmentFunction:v4];
  id v8 = [*(id *)(a1 + 48) colorPixelFormat];
  unsigned int v9 = [v6 colorAttachments];
  uint64_t v10 = [v9 objectAtIndexedSubscript:0];
  [v10 setPixelFormat:v8];

  id v11 = [*(id *)(a1 + 32) additiveBlendingEnabled];
  id v12 = [v6 colorAttachments];
  float32_t v13 = [v12 objectAtIndexedSubscript:0];
  [v13 setBlendingEnabled:v11];

  float v14 = [v6 colorAttachments];
  __int16 v15 = [v14 objectAtIndexedSubscript:0];
  [v15 setRgbBlendOperation:0];

  uint64_t v16 = [v6 colorAttachments];
  __int16 v17 = [v16 objectAtIndexedSubscript:0];
  [v17 setAlphaBlendOperation:0];

  id v18 = [v6 colorAttachments];
  float32x4_t v19 = [v18 objectAtIndexedSubscript:0];
  [v19 setSourceRGBBlendFactor:1];

  uint64_t v20 = [v6 colorAttachments];
  int v21 = [v20 objectAtIndexedSubscript:0];
  [v21 setSourceAlphaBlendFactor:1];

  int v22 = [v6 colorAttachments];
  id v23 = [v22 objectAtIndexedSubscript:0];
  [v23 setDestinationRGBBlendFactor:1];

  v24 = [v6 colorAttachments];
  int64x2_t v25 = [v24 objectAtIndexedSubscript:0];
  [v25 setDestinationAlphaBlendFactor:1];

  uint64_t v26 = *(void **)(a1 + 56);
  id v33 = 0;
  id v27 = [v26 newRenderPipelineStateWithDescriptor:v6 error:&v33];
  id v28 = v33;
  if (!v27)
  {
    v29 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      v31 = [v4 name];
      uint64_t v32 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412802;
      v35 = v31;
      __int16 v36 = 2112;
      uint64_t v37 = v32;
      __int16 v38 = 2112;
      id v39 = v28;
      _os_log_fault_impl(&dword_0, v29, OS_LOG_TYPE_FAULT, "Pride Metal compilation failure: Shader=%@ Device=%@ Error=%@", buf, 0x20u);
    }
  }

  return v27;
}

uint64_t sub_12824(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock(&stru_2C91C);
  id WeakRetained = objc_loadWeakRetained(&qword_2C920);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_2C920);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_2C920, v1);
    qword_2C928 = (uint64_t)[v1 version];

    sub_13128(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_2C928;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock(&stru_2C91C);
  uint64_t v9 = qword_2C910;

  return v9;
}

void sub_129C0(id a1)
{
  qword_2C900 = objc_opt_new();

  _objc_release_x1();
}

__n128 sub_13028(uint64_t a1, int a2, __n128 *a3)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __n128 result = *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 321) + 32 * a2);
  a3[2] = result;
  return result;
}

float sub_13128(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 screenBounds];
  double v4 = v3;
  [v2 screenScale];
  double v6 = v5;

  float v7 = v6 * v4;
  qword_2C910 = 12;
  float result = 2.0 / v7;
  dword_2C918 = LODWORD(result);
  return result;
}

uint64_t sub_132F4(uint64_t a1, void *a2)
{
  [a2 deviceCategory];
  qword_2C930 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_13430(id a1)
{
  v3[0] = &off_25918;
  v3[1] = &off_25930;
  v4[0] = NTKFaceBundlePrideAnalogStyleDial;
  v4[1] = NTKFaceBundlePrideAnalogStyleFullscreen;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  id v2 = (void *)qword_2C950;
  qword_2C950 = v1;
}

void sub_13554(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock(&stru_2C98C);
  id WeakRetained = objc_loadWeakRetained(&qword_2C990);
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_2C990);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_2C998;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_2C990, obj);
  qword_2C998 = (uint64_t)[obj version];

  sub_1527C(v9, obj);
LABEL_6:
  os_unfair_lock_unlock(&stru_2C98C);
  *a2 = xmmword_2C970;
  *(_OWORD *)((char *)a2 + 12) = *(long long *)((char *)&xmmword_2C970 + 12);
}

uint64_t sub_13CEC(uint64_t result, int a2, __n128 a3)
{
  *(__n128 *)(*(void *)(*(void *)(result + 32) + 176) + 704 * a2 + 656) = a3;
  return result;
}

uint64_t sub_13D0C(uint64_t result, int a2, __n128 a3)
{
  *(__n128 *)(*(void *)(*(void *)(result + 32) + 176) + 704 * a2 + 672) = a3;
  return result;
}

void sub_144D0(id a1)
{
  qword_2C960 = objc_opt_new();

  _objc_release_x1();
}

void sub_14F2C(uint64_t a1, uint64_t a2, float32x4_t *a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 176) + 704 * (int)a2;
  id v9 = *(id *)(v8 + 640);
  float32x4_t v27 = *(float32x4_t *)(v8 + 672);
  float32x4_t v28 = *(float32x4_t *)(v8 + 656);
  [*(id *)(a1 + 32) processSpline:a2];
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  [v9 getControlPoints:&v30 processedPoints:&v29];
  if (*(int *)(a1 + 44) >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v12 = v29;
    uint64_t v11 = v30;
    do
    {
      *(void *)&long long v13 = *(void *)(v11 + 8 * v10);
      *((void *)&v13 + 1) = *(void *)(v12 + 8 * v10);
      *(_OWORD *)(a4 + 16 * v10++) = v13;
    }
    while (v10 < *(int *)(a1 + 44));
  }
  [*(id *)(a1 + 32) currentSplineWidth];
  float v15 = v14;
  a3->f32[1] = v14;
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v16 = v15 * 0.5 / v16;
  a3[3].i32[1] = LODWORD(v16);
  [*(id *)(a1 + 32) splineColorTransitionFraction];
  *(float *)&double v17 = v17;
  a3[2] = vmlaq_n_f32(v28, vsubq_f32(v27, v28), *(float *)&v17);
  CLKInterpolateBetweenFloatsClipped();
  double v19 = v18;
  uint64_t v20 = *(float **)(a1 + 32);
  float v21 = v20[47];
  [v20 fadeMultiplier];
  float v23 = v19;
  float v24 = fminf((float)(v21 - v23) + (float)(v21 - v23), 1.0);
  if (v24 < 0.0) {
    float v24 = 0.0;
  }
  float v25 = pow(*(float *)(*(void *)(a1 + 32) + 188) * 0.8 + 0.2, 6.0) * (float)(v22 * v24);
  a3->f32[0] = v25;
  float32_t v26 = *(float *)(*(void *)(a1 + 32) + 188) * 0.15 + 0.85;
  a3->f32[2] = v26;
  a3->i32[3] = *(_DWORD *)(a1 + 48);
  a3[3].i16[0] = a2;
  a3[1].i32[0] = *(_DWORD *)(a1 + 64);
  if (*(_DWORD *)(a1 + 40) - 2 == a2) {
    *(float *)(*(void *)(a1 + 32) + 236) = v25;
  }
}

void sub_15168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float sub_1527C(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 screenBounds];
  double v4 = v3;
  [v2 screenScale];
  double v6 = v5;
  LODWORD(xmmword_2C970) = 20;
  if ([v2 deviceCategory] == (char *)&dword_0 + 1) {
    int v7 = 12;
  }
  else {
    int v7 = 32;
  }
  DWORD1(xmmword_2C970) = v7;
  HIDWORD(xmmword_2C970) = 1032805417;
  unint64_t v8 = (unint64_t)[v2 sizeClass];

  if (v8 > 8) {
    int v9 = 1064011039;
  }
  else {
    int v9 = dword_1E338[v8];
  }
  dword_2C980 = v9;
  float v10 = v6 * v4;
  float result = 2.0 / v10;
  dword_2C988 = LODWORD(result);
  dword_2C984 = 1065353216;
  *((float *)&xmmword_2C970 + 2) = result;
  return result;
}

id sub_15DB8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) handleScreenOff];
  id v2 = *(void **)(a1 + 32);

  return [v2 _updateComplicationColors];
}

void sub_160AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_160C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_160D4(uint64_t a1)
{
}

uint64_t sub_160DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if ([v7 tapEnabled])
  {
    double v5 = [v7 display];
    [v5 bounds];
    objc_msgSend(v5, "convertRect:toView:", *(void *)(a1 + 32));
    CGRect v10 = CGRectInset(v9, -10.0, -10.0);
    if (CGRectContainsPoint(v10, *(CGPoint *)(a1 + 48))) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    }
  }

  return _objc_release_x1();
}

void sub_170B0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 display];
  [*(id *)(a1 + 32) _updateComplicationColorsForView:v4 foregroundColor:*(void *)(a1 + 40) platterColor:*(void *)(a1 + 48)];
}

void sub_17F4C(void *a1, NSObject *a2)
{
  double v3 = [a1 description];
  int v4 = 138412290;
  double v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to create pride weave render pipeline with error: %@", (uint8_t *)&v4, 0xCu);
}

void sub_18244()
{
}

void sub_18270()
{
}

void sub_1829C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to force render to snapshot pride face", v1, 2u);
}

void sub_182E0(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_119CC();
  sub_119AC(&dword_0, v2, v3, "Failed to create pride weave sort pipeline with error: %@", v4, v5, v6, v7, v8);
}

void sub_18364(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_119CC();
  sub_119AC(&dword_0, v2, v3, "Failed to create pride weave intersections pipeline with error: %@", v4, v5, v6, v7, v8);
}

void sub_183E8(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_119CC();
  sub_119AC(&dword_0, v2, v3, "Failed to create pride weave circles pipeline with error: %@", v4, v5, v6, v7, v8);
}

void sub_1846C(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_119CC();
  sub_119AC(&dword_0, v2, v3, "Failed to create pride weave render pipeline with error: %@", v4, v5, v6, v7, v8);
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return _CGColorCreate(space, components);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenFloatsUnclipped()
{
  return _CLKInterpolateBetweenFloatsUnclipped();
}

uint64_t CLKUIConvertToRGBfFromSRGB8_fast()
{
  return _CLKUIConvertToRGBfFromSRGB8_fast();
}

uint64_t CLKUIConvertToRGBfFromSRGBf_fast()
{
  return _CLKUIConvertToRGBfFromSRGBf_fast();
}

uint64_t CLKUIConvertToRGBfFromXRSRGBf()
{
  return _CLKUIConvertToRGBfFromXRSRGBf();
}

uint64_t CLKUIConvertToSRGBfFromRGBf_fast()
{
  return _CLKUIConvertToSRGBfFromRGBf_fast();
}

uint64_t CLKUIConvertToXRSRGBfFromRGBf()
{
  return _CLKUIConvertToXRSRGBfFromRGBf();
}

uint64_t CLKUIConvertUIImageToMTLTexture()
{
  return _CLKUIConvertUIImageToMTLTexture();
}

uint64_t CLKUIMonochromeFiltersForStyleWithTintedBackground()
{
  return _CLKUIMonochromeFiltersForStyleWithTintedBackground();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKAllSmallComplicationTypes()
{
  return _NTKAllSmallComplicationTypes();
}

uint64_t NTKAllUtilityLargeNarrowComplicationTypes()
{
  return _NTKAllUtilityLargeNarrowComplicationTypes();
}

uint64_t NTKAllUtilitySmallFlatComplicationTypes()
{
  return _NTKAllUtilitySmallFlatComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKBuildVersion()
{
  return _NTKBuildVersion();
}

uint64_t NTKClockFaceLocalizedString()
{
  return _NTKClockFaceLocalizedString();
}

uint64_t NTKCompanionClockFaceLocalizedString()
{
  return _NTKCompanionClockFaceLocalizedString();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKDesatMonochromeFilter()
{
  return _NTKDesatMonochromeFilter();
}

uint64_t NTKDesatMonochromeFilterOpaque()
{
  return _NTKDesatMonochromeFilterOpaque();
}

uint64_t NTKDigitalTimeLabelStyleWideRightSideMargin()
{
  return _NTKDigitalTimeLabelStyleWideRightSideMargin();
}

uint64_t NTKFaceStyleDescription()
{
  return _NTKFaceStyleDescription();
}

uint64_t NTKFaceStyleIsAvailable()
{
  return _NTKFaceStyleIsAvailable();
}

uint64_t NTKFlatMonochromeFilter()
{
  return _NTKFlatMonochromeFilter();
}

uint64_t NTKFlatMonochromeFilterOpaque()
{
  return _NTKFlatMonochromeFilterOpaque();
}

uint64_t NTKGizmoOrCompanionAreRussian()
{
  return _NTKGizmoOrCompanionAreRussian();
}

uint64_t NTKHighPriorityApply()
{
  return _NTKHighPriorityApply();
}

uint64_t NTKIsDaemonOrFaceSnapshotService()
{
  return _NTKIsDaemonOrFaceSnapshotService();
}

uint64_t NTKIsScreenOn()
{
  return _NTKIsScreenOn();
}

uint64_t NTKMultiFamilyComplicationSlotDescriptor()
{
  return _NTKMultiFamilyComplicationSlotDescriptor();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKShowBlueRidgeUI()
{
  return _NTKShowBlueRidgeUI();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _EnumValueRange()
{
  return __EnumValueRange();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

float cosf(float a1)
{
  return _cosf(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

long double ldexp(long double __x, int __e)
{
  return _ldexp(__x, __e);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

int rand(void)
{
  return _rand();
}

uint64_t snoise4()
{
  return _snoise4();
}

id objc_msgSend__cleanCache(void *a1, const char *a2, ...)
{
  return [a1 _cleanCache];
}

id objc_msgSend__digitalTimeLabelStyle(void *a1, const char *a2, ...)
{
  return [a1 _digitalTimeLabelStyle];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__generateControlPointDampingCoefficients(void *a1, const char *a2, ...)
{
  return [a1 _generateControlPointDampingCoefficients];
}

id objc_msgSend__generateInterpolationPositions(void *a1, const char *a2, ...)
{
  return [a1 _generateInterpolationPositions];
}

id objc_msgSend__generateSplineColors(void *a1, const char *a2, ...)
{
  return [a1 _generateSplineColors];
}

id objc_msgSend__generateSplinePositions(void *a1, const char *a2, ...)
{
  return [a1 _generateSplinePositions];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__initializePerSplineData(void *a1, const char *a2, ...)
{
  return [a1 _initializePerSplineData];
}

id objc_msgSend__innerComplicationColors(void *a1, const char *a2, ...)
{
  return [a1 _innerComplicationColors];
}

id objc_msgSend__isActiveFace(void *a1, const char *a2, ...)
{
  return [a1 _isActiveFace];
}

id objc_msgSend__loadBackgroundViews(void *a1, const char *a2, ...)
{
  return [a1 _loadBackgroundViews];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__outerComplicationColors(void *a1, const char *a2, ...)
{
  return [a1 _outerComplicationColors];
}

id objc_msgSend__unloadBackgroundViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadBackgroundViews];
}

id objc_msgSend__updateComplicationColors(void *a1, const char *a2, ...)
{
  return [a1 _updateComplicationColors];
}

id objc_msgSend__updatePausedState(void *a1, const char *a2, ...)
{
  return [a1 _updatePausedState];
}

id objc_msgSend_activeQuad(void *a1, const char *a2, ...)
{
  return [a1 activeQuad];
}

id objc_msgSend_additiveBlendingEnabled(void *a1, const char *a2, ...)
{
  return [a1 additiveBlendingEnabled];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blitCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 blitCommandEncoder];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_clearWaves(void *a1, const char *a2, ...)
{
  return [a1 clearWaves];
}

id objc_msgSend_clkDevice(void *a1, const char *a2, ...)
{
  return [a1 clkDevice];
}

id objc_msgSend_collectionType(void *a1, const char *a2, ...)
{
  return [a1 collectionType];
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return [a1 colorAttachments];
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return [a1 colorPixelFormat];
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return [a1 commandBuffer];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_complicationBrightness(void *a1, const char *a2, ...)
{
  return [a1 complicationBrightness];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_complicationTypesBySlot(void *a1, const char *a2, ...)
{
  return [a1 complicationTypesBySlot];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_computePipelineManager(void *a1, const char *a2, ...)
{
  return [a1 computePipelineManager];
}

id objc_msgSend_computeShaderName(void *a1, const char *a2, ...)
{
  return [a1 computeShaderName];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_controlPointsBuffer(void *a1, const char *a2, ...)
{
  return [a1 controlPointsBuffer];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentComputeBuffer(void *a1, const char *a2, ...)
{
  return [a1 currentComputeBuffer];
}

id objc_msgSend_currentComputeBufferWidth(void *a1, const char *a2, ...)
{
  return [a1 currentComputeBufferWidth];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentSplineWidth(void *a1, const char *a2, ...)
{
  return [a1 currentSplineWidth];
}

id objc_msgSend_currentSplinesBuffer(void *a1, const char *a2, ...)
{
  return [a1 currentSplinesBuffer];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return [a1 currentTime];
}

id objc_msgSend_dailySnapshotKey(void *a1, const char *a2, ...)
{
  return [a1 dailySnapshotKey];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_dialShape(void *a1, const char *a2, ...)
{
  return [a1 dialShape];
}

id objc_msgSend_discardContents(void *a1, const char *a2, ...)
{
  return [a1 discardContents];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_face(void *a1, const char *a2, ...)
{
  return [a1 face];
}

id objc_msgSend_faceClass(void *a1, const char *a2, ...)
{
  return [a1 faceClass];
}

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_fadeMultiplier(void *a1, const char *a2, ...)
{
  return [a1 fadeMultiplier];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_forceRender(void *a1, const char *a2, ...)
{
  return [a1 forceRender];
}

id objc_msgSend_forceRenderOnce(void *a1, const char *a2, ...)
{
  return [a1 forceRenderOnce];
}

id objc_msgSend_fragmentShaderName(void *a1, const char *a2, ...)
{
  return [a1 fragmentShaderName];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_frameNum(void *a1, const char *a2, ...)
{
  return [a1 frameNum];
}

id objc_msgSend_generateVignetteTextureData(void *a1, const char *a2, ...)
{
  return [a1 generateVignetteTextureData];
}

id objc_msgSend_getNTKPrideSplineDefinitionFiller(void *a1, const char *a2, ...)
{
  return [a1 getNTKPrideSplineDefinitionFiller];
}

id objc_msgSend_handleOrdinaryScreenWake(void *a1, const char *a2, ...)
{
  return [a1 handleOrdinaryScreenWake];
}

id objc_msgSend_handleScreenOff(void *a1, const char *a2, ...)
{
  return [a1 handleScreenOff];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idleRotation(void *a1, const char *a2, ...)
{
  return [a1 idleRotation];
}

id objc_msgSend_initializePerSplineData(void *a1, const char *a2, ...)
{
  return [a1 initializePerSplineData];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_isLuxo(void *a1, const char *a2, ...)
{
  return [a1 isLuxo];
}

id objc_msgSend_isRunningGloryFOrLater(void *a1, const char *a2, ...)
{
  return [a1 isRunningGloryFOrLater];
}

id objc_msgSend_isSlow(void *a1, const char *a2, ...)
{
  return [a1 isSlow];
}

id objc_msgSend_isSnapshotting(void *a1, const char *a2, ...)
{
  return [a1 isSnapshotting];
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return [a1 layoutSubviews];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_maxTotalThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerThreadgroup];
}

id objc_msgSend_maxVertsPerSpline(void *a1, const char *a2, ...)
{
  return [a1 maxVertsPerSpline];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nativeScale(void *a1, const char *a2, ...)
{
  return [a1 nativeScale];
}

id objc_msgSend_noiseConfiguration(void *a1, const char *a2, ...)
{
  return [a1 noiseConfiguration];
}

id objc_msgSend_nrDeviceVersion(void *a1, const char *a2, ...)
{
  return [a1 nrDeviceVersion];
}

id objc_msgSend_numControlPointsPerSpline(void *a1, const char *a2, ...)
{
  return [a1 numControlPointsPerSpline];
}

id objc_msgSend_numSplines(void *a1, const char *a2, ...)
{
  return [a1 numSplines];
}

id objc_msgSend_numSplinesToDraw(void *a1, const char *a2, ...)
{
  return [a1 numSplinesToDraw];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_performTap(void *a1, const char *a2, ...)
{
  return [a1 performTap];
}

id objc_msgSend_performWristRaiseAnimation(void *a1, const char *a2, ...)
{
  return [a1 performWristRaiseAnimation];
}

id objc_msgSend_pipeline(void *a1, const char *a2, ...)
{
  return [a1 pipeline];
}

id objc_msgSend_prepareWristRaiseAnimation(void *a1, const char *a2, ...)
{
  return [a1 prepareWristRaiseAnimation];
}

id objc_msgSend_quadView(void *a1, const char *a2, ...)
{
  return [a1 quadView];
}

id objc_msgSend_randomizeSplineColors(void *a1, const char *a2, ...)
{
  return [a1 randomizeSplineColors];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_renderPassDescriptor(void *a1, const char *a2, ...)
{
  return [a1 renderPassDescriptor];
}

id objc_msgSend_renderPipelineManager(void *a1, const char *a2, ...)
{
  return [a1 renderPipelineManager];
}

id objc_msgSend_renderPipelineName(void *a1, const char *a2, ...)
{
  return [a1 renderPipelineName];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_setAnalogHandsColor(void *a1, const char *a2, ...)
{
  return [a1 setAnalogHandsColor];
}

id objc_msgSend_setBandedMode(void *a1, const char *a2, ...)
{
  return [a1 setBandedMode];
}

id objc_msgSend_setControlPointsNeedUpdate(void *a1, const char *a2, ...)
{
  return [a1 setControlPointsNeedUpdate];
}

id objc_msgSend_setDefaultSplineColors(void *a1, const char *a2, ...)
{
  return [a1 setDefaultSplineColors];
}

id objc_msgSend_setDialMode(void *a1, const char *a2, ...)
{
  return [a1 setDialMode];
}

id objc_msgSend_setFabricMode(void *a1, const char *a2, ...)
{
  return [a1 setFabricMode];
}

id objc_msgSend_setFrameUsingCurrentStyle(void *a1, const char *a2, ...)
{
  return [a1 setFrameUsingCurrentStyle];
}

id objc_msgSend_setFullscreenMode(void *a1, const char *a2, ...)
{
  return [a1 setFullscreenMode];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedCache(void *a1, const char *a2, ...)
{
  return [a1 sharedCache];
}

id objc_msgSend_sharedCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 sharedCommandQueue];
}

id objc_msgSend_sharedDevice(void *a1, const char *a2, ...)
{
  return [a1 sharedDevice];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shouldForceRender(void *a1, const char *a2, ...)
{
  return [a1 shouldForceRender];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_softness(void *a1, const char *a2, ...)
{
  return [a1 softness];
}

id objc_msgSend_splineColorTransitionFraction(void *a1, const char *a2, ...)
{
  return [a1 splineColorTransitionFraction];
}

id objc_msgSend_startLoop(void *a1, const char *a2, ...)
{
  return [a1 startLoop];
}

id objc_msgSend_startWavesAtNextRender(void *a1, const char *a2, ...)
{
  return [a1 startWavesAtNextRender];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_tapEnabled(void *a1, const char *a2, ...)
{
  return [a1 tapEnabled];
}

id objc_msgSend_threadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 threadExecutionWidth];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_touchCrownHandler(void *a1, const char *a2, ...)
{
  return [a1 touchCrownHandler];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_useXRsRGB(void *a1, const char *a2, ...)
{
  return [a1 useXRsRGB];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_vertexShaderName(void *a1, const char *a2, ...)
{
  return [a1 vertexShaderName];
}

id objc_msgSend_vignetteAmount(void *a1, const char *a2, ...)
{
  return [a1 vignetteAmount];
}

id objc_msgSend_waitUntilScheduled(void *a1, const char *a2, ...)
{
  return [a1 waitUntilScheduled];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_winding(void *a1, const char *a2, ...)
{
  return [a1 winding];
}