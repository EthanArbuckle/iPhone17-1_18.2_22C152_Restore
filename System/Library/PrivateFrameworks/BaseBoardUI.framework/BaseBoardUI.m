void ____filenameForKeyAndExtension_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t vars8;

  v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"%/"];
  v0 = [v3 invertedSet];
  v1 = [v0 copy];
  v2 = (void *)qword_1EB3A3940;
  qword_1EB3A3940 = v1;
}

void sub_1A2B0E0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B0E1DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B0E400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id _readCPBitmapImageFromPathWithOptions(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  MappedDataFromPath = (const void *)CPBitmapCreateMappedDataFromPath();
  if (MappedDataFromPath)
  {
    CFArrayRef ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
    if (ImagesFromData)
    {
      CFIndex Count = CFArrayGetCount(ImagesFromData);
      if (Count == 1) {
        goto LABEL_7;
      }
      v5 = BSLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v10 = CFArrayGetCount(ImagesFromData);
        LODWORD(valuePtr) = 67109378;
        HIDWORD(valuePtr) = v10;
        __int16 v12 = 2114;
        id v13 = v1;
        _os_log_error_impl(&dword_1A2B0C000, v5, OS_LOG_TYPE_ERROR, "BSUIMappedImageCache: unexpected imageCount=%i in CPBitmapData from path=%{public}@", (uint8_t *)&valuePtr, 0x12u);
      }

      if (Count >= 1)
      {
LABEL_7:
        double valuePtr = 1.0;
        id v6 = objc_alloc(MEMORY[0x1E4F42A80]);
        ValueAtIndex = CFArrayGetValueAtIndex(ImagesFromData, 0);
        v8 = (void *)[v6 initWithCGImage:ValueAtIndex scale:0 orientation:valuePtr];
      }
      else
      {
        v8 = 0;
      }
      CFRelease(ImagesFromData);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(MappedDataFromPath);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_1A2B0E740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __pathForKeyAndExtension(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    id v10 = v6;
    id v11 = v8;
    if (qword_1EB3A3948 != -1) {
      dispatch_once(&qword_1EB3A3948, &__block_literal_global_0);
    }
    __int16 v12 = [v10 stringByAddingPercentEncodingWithAllowedCharacters:qword_1EB3A3940];
    id v13 = [v12 stringByAppendingPathExtension:v11];

    v9 = [v5 stringByAppendingPathComponent:v13];
  }

  return v9;
}

void sub_1A2B0E894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B0E950(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A2B0F390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B0F5E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B0F66C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B0F6EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B0F824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B0F898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B0F924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B0FD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,void *a38)
{
  _Block_object_dispose((const void *)(v42 - 200), 8);
  _Block_object_dispose((const void *)(v42 - 152), 8);

  _Unwind_Resume(a1);
}

void sub_1A2B0FEE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1A2B0FF60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B10168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B10380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B107F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2B10900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1097C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B10A68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B10C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B10C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B10D28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B10D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B110D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B11338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B11500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B11574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B117D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B119DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B11AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B11BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double _BSUITransformFromOrientationToOrientation@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = MEMORY[0x1E4F1DAB8];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *a3 = *MEMORY[0x1E4F1DAB8];
  a3[1] = v5;
  long long v6 = *(_OWORD *)(v4 + 32);
  a3[2] = v6;
  if (a1 != a2)
  {
    BSDegreesToRadians();
    CGAffineTransformMakeRotation(&v10, v7);
    UIIntegralTransform();
    long long v8 = v12;
    *a3 = v11;
    a3[1] = v8;
    *(void *)&long long v6 = v13;
    a3[2] = v13;
  }
  return *(double *)&v6;
}

void sub_1A2B11DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B11E74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B12070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B12110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B12494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A2B12658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B12908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A2B129E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B12B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B12C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B12FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2B131FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B13318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B134D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B13594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B136D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

double BSUIVibrancyMapBias(double a1, double a2)
{
  double v2 = fmin(fmax(a2, 2.22044605e-16), 1.0);
  return v2 * a1 / (-(v2 - (v2 + v2) * a1) - a1 + 1.0) + 0.0;
}

void sub_1A2B13838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B138CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B13BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float32x4_t _lerpColorMatrices(uint64_t a1, float32x2_t *a2, float32x4_t *a3, double a4)
{
  if (a4 == 0.0)
  {
    long long v4 = *(_OWORD *)a2[6].f32;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)a2[4].f32;
    *(_OWORD *)(a1 + 48) = v4;
    *(_OWORD *)(a1 + 64) = *(_OWORD *)a2[8].f32;
    float32x4_t v6 = *(float32x4_t *)a2->f32;
    float32x4_t result = *(float32x4_t *)a2[2].f32;
LABEL_5:
    *(float32x4_t *)a1 = v6;
    *(float32x4_t *)(a1 + 16) = result;
    return result;
  }
  if (a4 == 1.0)
  {
    float32x4_t v7 = a3[3];
    *(float32x4_t *)(a1 + 32) = a3[2];
    *(float32x4_t *)(a1 + 48) = v7;
    *(float32x4_t *)(a1 + 64) = a3[4];
    float32x4_t v6 = *a3;
    float32x4_t result = a3[1];
    goto LABEL_5;
  }
  float v8 = a4;
  double v9 = 1.0 - v8;
  float32x4_t v10 = vmulq_n_f32(*a3, v8);
  float32x4_t v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)v10.f32), vcvtq_f64_f32(*a2), v9)), vmlaq_n_f64(vcvt_hight_f64_f32(v10), vcvt_hight_f64_f32(*(float32x4_t *)a2->f32), v9));
  float32x4_t v12 = vmulq_n_f32(a3[1], v8);
  float32x4_t v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)v12.f32), vcvtq_f64_f32(a2[2]), v9)), vmlaq_n_f64(vcvt_hight_f64_f32(v12), vcvt_hight_f64_f32(*(float32x4_t *)a2[2].f32), v9));
  *(float32x4_t *)a1 = v11;
  *(float32x4_t *)(a1 + 16) = v13;
  float32x4_t v14 = vmulq_n_f32(a3[2], v8);
  float32x4_t v15 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)v14.f32), vcvtq_f64_f32(a2[4]), v9)), vmlaq_n_f64(vcvt_hight_f64_f32(v14), vcvt_hight_f64_f32(*(float32x4_t *)a2[4].f32), v9));
  float32x4_t v16 = vmulq_n_f32(a3[3], v8);
  float32x4_t v17 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)v16.f32), vcvtq_f64_f32(a2[6]), v9)), vmlaq_n_f64(vcvt_hight_f64_f32(v16), vcvt_hight_f64_f32(*(float32x4_t *)a2[6].f32), v9));
  *(float32x4_t *)(a1 + 32) = v15;
  *(float32x4_t *)(a1 + 48) = v17;
  float32x4_t v18 = vmulq_n_f32(a3[4], v8);
  float32x4_t result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)v18.f32), vcvtq_f64_f32(a2[8]), v9)), vmlaq_n_f64(vcvt_hight_f64_f32(v18), vcvt_hight_f64_f32(*(float32x4_t *)a2[8].f32), v9));
  *(float32x4_t *)(a1 + 64) = result;
  return result;
}

unint64_t _colorMatrixHash(float *a1)
{
  return (unint64_t)fabs((float)(a1[4]+ (float)((float)((float)((float)(a1[1] * 0.2) + (float)(*a1 * 0.1))+ (float)(a1[2] * 0.3))+ (float)(a1[3] * 0.4)))+ (float)(a1[9]+ (float)((float)((float)((float)(a1[6] * 0.2) + (float)(a1[5] * 0.1))+ (float)(a1[7] * 0.3))+ (float)(a1[8] * 0.4)))* 100.0+ (float)(a1[14]+ (float)((float)((float)((float)(a1[11] * 0.2) + (float)(a1[10] * 0.1))+ (float)(a1[12] * 0.3))+ (float)(a1[13] * 0.4)))* 10000.0+ (float)(a1[19]+ (float)((float)((float)((float)(a1[16] * 0.2) + (float)(a1[15] * 0.1))+ (float)(a1[17] * 0.3))+ (float)(a1[18] * 0.4)))* 1000000.0);
}

void sub_1A2B13E78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _transformUIColor(void *a1, float *a2)
{
  double v11 = 0.0;
  double v12 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  [a1 getRed:&v12 green:&v11 blue:&v10 alpha:&v9];
  float v3 = v12;
  float v4 = v11;
  float v5 = v10;
  float v6 = v9;
  float32x4_t v7 = [MEMORY[0x1E4F428B8] colorWithRed:(float)(a2[4]+ (float)((float)((float)((float)(a2[1] * v4) + (float)(v3 * *a2)) + (float)(v5 * a2[2])) + (float)(v6 * a2[3]))) green:(float)(a2[9]+ (float)((float)((float)((float)(a2[6] * v4) + (float)(v3 * a2[5])) + (float)(v5 * a2[7]))+ (float)(v6 * a2[8]))) blue:(float)(a2[14]+ (float)((float)((float)((float)(a2[11] * v4) + (float)(v3 * a2[10])) + (float)(v5 * a2[12]))+ (float)(v6 * a2[13]))) alpha:(float)(a2[19]+ (float)((float)((float)((float)(a2[16] * v4) + (float)(v3 * a2[15])) + (float)(v5 * a2[17]))+ (float)(v6 * a2[18])))];

  return v7;
}

void sub_1A2B13FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B14118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B142A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B146EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float _curve(double a1, float a2, double a3, __n128 a4)
{
  unsigned __int32 v4 = a4.n128_u32[0];
  float v6 = *(float *)&a3 - a2;
  float v7 = fminf(fmaxf((float)(*(float *)&a1 - a4.n128_f32[1]) / (float)(*(float *)&a3 - a4.n128_f32[1]), 0.0), 1.0);
  LODWORD(a3) = a4.n128_u32[2];
  a4.n128_u32[0] = a4.n128_u32[3];
  LODWORD(a1) = v4;
  float v8 = [MEMORY[0x1E4F39C10] functionWithControlPoints:a1 :COERCE_DOUBLE((unint64_t)a4.n128_u32[1]) :a3 :a4.n128_f64[0]];
  *(float *)&double v9 = v7;
  [v8 _solveForInput:v9];
  float v11 = a2 + (float)(v6 * v10);

  return v11;
}

void sub_1A2B14794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B148AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B14DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B14E70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B14FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t BSIntervalInterpolatorUIRubberBanding_block_invoke()
{
  BSIntervalMin();
  BSIntervalMax();
  uint64_t result = BSFloatIsZero();
  if ((result & 1) == 0) {
    return BSIntervalMin();
  }
  return result;
}

uint64_t BSIntervalInterpolatorInvertUIRubberBanding_block_invoke_2()
{
  BSIntervalMin();
  BSIntervalMax();
  uint64_t result = BSFloatIsZero();
  if ((result & 1) == 0) {
    return BSIntervalMin();
  }
  return result;
}

uint64_t BSUIConstrainValueWithRubberBand()
{
  return BSIntervalInterpolate();
}

double BSUIConstrainValueToIntervalWithRubberBand(double a1)
{
  BSIntervalMin();
  double v3 = v2;
  BSIntervalMax();
  if (v3 <= a1)
  {
    double v6 = v4;
    if (v4 < a1)
    {
      BSIntervalInterpolate();
      return v6 + v7;
    }
  }
  else
  {
    BSIntervalInterpolate();
    return v3 - v5;
  }
  return a1;
}

uint64_t BSUIInvertRubberBandValue()
{
  return BSIntervalInterpolate();
}

double BSUIInvertRubberBandValueForInterval(double a1)
{
  BSIntervalMin();
  double v3 = v2;
  BSIntervalMax();
  if (v3 <= a1)
  {
    double v6 = v4;
    if (v4 < a1)
    {
      BSIntervalInterpolate();
      return v6 + v7;
    }
  }
  else
  {
    BSIntervalInterpolate();
    return v3 - v5;
  }
  return a1;
}

void sub_1A2B156DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B15744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSUIFontDescriptorSymbolicTraitForHIFontStyle(unsigned int a1)
{
  return (a1 << 12) & 0x18000 | (a1 >> 1) & 3;
}

void sub_1A2B15B58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B15CD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B160EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, objc_super a13)
{
  a13.super_class = (Class)BSUIMappedImageCache;
  [(_Unwind_Exception *)&a13 dealloc];
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id _workBlockGenerator(void *a1, void *a2, char a3, void *a4, uint64_t a5, int a6, void *a7, void *a8, void *a9, void *a10, void *a11, void *a12)
{
  id v17 = a1;
  id v18 = a2;
  id v19 = a4;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v67 = a11;
  v24 = v20;
  v65 = v19;
  id v66 = a12;
  v68 = v17;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    id v36 = v21;
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    v38 = objc_msgSend(NSString, "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
    [v37 handleFailureInFunction:v38, @"BSUIMappedImageCache.m", 369, @"Invalid parameter not satisfying: %@", @"future" file lineNumber description];

    id v21 = v36;
    if (v18)
    {
LABEL_3:
      if (v19) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  id v39 = v21;
  v40 = [MEMORY[0x1E4F28B00] currentHandler];
  v41 = objc_msgSend(NSString, "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
  [v40 handleFailureInFunction:v41, @"BSUIMappedImageCache.m", 370, @"Invalid parameter not satisfying: %@", @"image" file lineNumber description];

  id v21 = v39;
  if (v19)
  {
LABEL_4:
    if (v24) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  id v42 = v21;
  v43 = [MEMORY[0x1E4F28B00] currentHandler];
  v44 = objc_msgSend(NSString, "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
  [v43 handleFailureInFunction:v44, @"BSUIMappedImageCache.m", 371, @"Invalid parameter not satisfying: %@", @"key" file lineNumber description];

  id v21 = v42;
  if (v24)
  {
LABEL_5:
    if (v21) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  id v45 = v21;
  v46 = [MEMORY[0x1E4F28B00] currentHandler];
  v47 = objc_msgSend(NSString, "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
  [v46 handleFailureInFunction:v47, @"BSUIMappedImageCache.m", 372, @"Invalid parameter not satisfying: %@", @"tmp_dir_path" file lineNumber description];

  id v21 = v45;
  if (v45)
  {
LABEL_6:
    if (v23) {
      goto LABEL_7;
    }
LABEL_18:
    id v51 = v21;
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    v53 = objc_msgSend(NSString, "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
    [v52 handleFailureInFunction:v53, @"BSUIMappedImageCache.m", 374, @"Invalid parameter not satisfying: %@", @"completion_queue" file lineNumber description];

    id v21 = v51;
    if (v22) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_17:
  id v48 = v21;
  v49 = [MEMORY[0x1E4F28B00] currentHandler];
  v50 = objc_msgSend(NSString, "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
  [v49 handleFailureInFunction:v50, @"BSUIMappedImageCache.m", 373, @"Invalid parameter not satisfying: %@", @"local_path" file lineNumber description];

  id v21 = v48;
  if (!v23) {
    goto LABEL_18;
  }
LABEL_7:
  if (v22) {
    goto LABEL_8;
  }
LABEL_19:
  id v54 = v21;
  v55 = [MEMORY[0x1E4F28B00] currentHandler];
  v56 = objc_msgSend(NSString, "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
  [v55 handleFailureInFunction:v56, @"BSUIMappedImageCache.m", 375, @"Invalid parameter not satisfying: %@", @"local_queue" file lineNumber description];

  id v21 = v54;
LABEL_8:
  v25 = v67;
  if (!v67)
  {
    id v57 = v21;
    v58 = [MEMORY[0x1E4F28B00] currentHandler];
    v59 = objc_msgSend(NSString, "stringWithUTF8String:", "BSUIMappedImageCacheFutureWorkBlock _workBlockGenerator(BSUIMappedImageCacheFuture *__strong, UIImage *__strong, BOOL, NSString *__strong, BSUIMappedImageCachePersistenceOptions, CPBitmapReadFlags, NSString *__strong, NSString *__strong, __strong dispatch_queue_t, __strong dispatch_queue_t, NSMutableDictionary<NSString *,id> *__strong, __strong BSUIMappedImageCachePersistenceCompletion)");
    [v58 handleFailureInFunction:v59, @"BSUIMappedImageCache.m", 376, @"Invalid parameter not satisfying: %@", @"local_queue_keysToImagesOrFutures" file lineNumber description];

    id v21 = v57;
    v25 = 0;
  }
  v26 = [MEMORY[0x1E4F4F880] referenceWithObject:v17];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = ___workBlockGenerator_block_invoke;
  v69[3] = &unk_1E5ABD508;
  id v70 = v26;
  int v80 = a6;
  id v60 = v18;
  id v71 = v60;
  uint64_t v79 = a5;
  id v27 = v24;
  id v72 = v27;
  id v28 = v65;
  id v73 = v28;
  id v29 = v22;
  id v74 = v29;
  id v30 = v25;
  id v75 = v30;
  id v31 = v21;
  id v76 = v31;
  id v32 = v66;
  id v78 = v32;
  id v33 = v23;
  id v77 = v33;
  char v81 = a3;
  id v64 = v26;
  v34 = (void *)MEMORY[0x1A623AF30](v69);
  id v62 = (id)[v34 copy];

  return v62;
}

void sub_1A2B16790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1A2B16904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B16AD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B16BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2B16DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B16EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B17108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B171F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B173B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B17464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B174DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1756C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B175C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B177C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B17954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B17B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B17C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___workBlockGenerator_block_invoke(uint64_t a1, void *a2)
{
  v39[5] = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  double v3 = [*(id *)(a1 + 32) object];
  if (v3)
  {
    if ([*(id *)(a1 + 40) ioSurface])
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = ___workBlockGenerator_block_invoke_2;
      v38[3] = &unk_1E5ABD448;
      v39[0] = *(id *)(a1 + 40);
      id v18 = (void *)MEMORY[0x1A623AF30](v38);
      double v4 = (id *)v39;
      double v5 = v37;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      double v6 = @"surface";
      double v7 = ___workBlockGenerator_block_invoke_3;
    }
    else
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = ___workBlockGenerator_block_invoke_4;
      v35[3] = &unk_1E5ABD490;
      id v8 = *(id *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 104);
      v36[0] = v8;
      v36[1] = v9;
      id v18 = (void *)MEMORY[0x1A623AF30](v35);
      double v4 = (id *)v36;
      double v5 = v34;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      double v6 = @"cpbitmap";
      double v7 = ___workBlockGenerator_block_invoke_5;
    }
    v5[2] = v7;
    v5[3] = &__block_descriptor_36_e27___UIImage_16__0__NSString_8l;
    *((_DWORD *)v5 + 8) = *(_DWORD *)(a1 + 112);
    float v10 = (void *)MEMORY[0x1A623AF30]();

    int v33 = -1;
    float v11 = __pathForKeyAndExtension(*(void **)(a1 + 48), *(void **)(a1 + 56), v6);
    double v12 = BSTemporaryFileAtPath();

    id v13 = *(id *)(a1 + 40);
    v19[2](v19, v13);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___workBlockGenerator_block_invoke_236;
    block[3] = &unk_1E5ABD4E0;
    float32x4_t v14 = *(NSObject **)(a1 + 64);
    id v21 = *(id *)(a1 + 72);
    id v22 = *(id *)(a1 + 56);
    id v23 = v3;
    id v24 = v13;
    id v25 = 0;
    id v26 = *(id *)(a1 + 80);
    id v27 = v6;
    id v28 = v12;
    int v31 = -1;
    id v30 = *(id *)(a1 + 96);
    id v29 = *(id *)(a1 + 88);
    char v32 = *(unsigned char *)(a1 + 116);
    id v15 = v12;
    id v16 = 0;
    id v17 = v13;
    dispatch_async(v14, block);
  }
}

void sub_1A2B181AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

BOOL ___workBlockGenerator_block_invoke_2(uint64_t a1, int a2)
{
  return +[BSUIMappedSurfaceImage writeSurfaceImage:toFileDescriptor:]((uint64_t)BSUIMappedSurfaceImage, *(void **)(a1 + 32), a2);
}

id ___workBlockGenerator_block_invoke_3(uint64_t a1, void *a2)
{
  double v2 = +[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]((uint64_t)BSUIMappedSurfaceImage, a2, (*(_DWORD *)(a1 + 32) >> 1) & 1);

  return v2;
}

uint64_t ___workBlockGenerator_block_invoke_4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  double v3 = (CGImage *)[v2 CGImage];
  double v4 = v3;
  if (v3)
  {
    if ((v1 & 4) == 0 && (v1 & 8) == 0 && !CGImageIsMask(v3) && (CGImageHasAlpha() & 1) == 0)
    {
      ColorSpace = CGImageGetColorSpace(v4);
      if (CGColorSpaceGetNumberOfComponents(ColorSpace) >= 3) {
        CGImageGetBitsPerComponent(v4);
      }
    }
    [v2 scale];
    uint64_t valuePtr = v7;
    if (BSFloatIsOne()) {
      CFNumberRef v8 = 0;
    }
    else {
      CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberCGFloatType, &valuePtr);
    }
    uint64_t v9 = (const void *)CPBitmapWriterCreateWithFileDescriptor();
    if (v9)
    {
      uint64_t v6 = CPBitmapWriterAddImage();
      CPBitmapWriterFinalize();
      CFRelease(v9);
      if (!v8) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    uint64_t v6 = 0;
    if (v8) {
LABEL_16:
    }
      CFRelease(v8);
  }
  else
  {
    double v5 = BSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A2B0C000, v5, OS_LOG_TYPE_ERROR, "BSUIMappedImageCache: error serializing non-CGImage to CPBitmap", buf, 2u);
    }

    uint64_t v6 = 0;
  }
LABEL_17:

  return v6;
}

void sub_1A2B185D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___workBlockGenerator_block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = _readCPBitmapImageFromPathWithOptions(a2);

  return v2;
}

void ___workBlockGenerator_block_invoke_236(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  double v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 56);
  if (v2 == *(void *)(a1 + 48) || (BOOL v5 = v2 == v4, v4 = v2, v5))
  {
    [*(id *)(a1 + 32) setObject:v4 forKey:*(void *)(a1 + 40)];
    if (*(void *)(a1 + 64) == *(void *)(a1 + 56))
    {
      uint64_t v7 = __pathForKeyAndExtension(*(void **)(a1 + 72), *(void **)(a1 + 40), *(void **)(a1 + 80));
      CFNumberRef v8 = (const std::__fs::filesystem::path *)[*(id *)(a1 + 88) fileSystemRepresentation];
      uint64_t v6 = v7;
      uint64_t v9 = (const std::__fs::filesystem::path *)[v6 fileSystemRepresentation];
      rename(v8, v9, v10);
      if (v11)
      {
        unlink((const char *)[*(id *)(a1 + 88) fileSystemRepresentation]);
        double v12 = BSLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = *(void *)(a1 + 88);
          *(_DWORD *)buf = 138543618;
          uint64_t v25 = v19;
          __int16 v26 = 2114;
          id v27 = v6;
          _os_log_error_impl(&dword_1A2B0C000, v12, OS_LOG_TYPE_ERROR, " **** failed to move item at tempPath=%{public}@ to path=%{public}@ : leaving in cache but it won't survive process termination", buf, 0x16u);
        }
      }
    }
    else
    {
      if (*(_DWORD *)(a1 + 112) == -1) {
        goto LABEL_15;
      }
      unlink((const char *)[*(id *)(a1 + 88) fileSystemRepresentation]);
      uint64_t v6 = BSLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 88);
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v18;
        _os_log_error_impl(&dword_1A2B0C000, v6, OS_LOG_TYPE_ERROR, " **** failed to write item at tempPath=%{public}@", buf, 0xCu);
      }
    }
  }
  else if (*(_DWORD *)(a1 + 112) != -1)
  {
    unlink((const char *)[*(id *)(a1 + 88) fileSystemRepresentation]);
  }
LABEL_15:
  int v13 = *(_DWORD *)(a1 + 112);
  if (v13 == -1)
  {
    uint64_t v14 = BSLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 88);
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v17;
      _os_log_error_impl(&dword_1A2B0C000, v14, OS_LOG_TYPE_ERROR, " **** failed to open fd at tempPath=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    close(v13);
  }
  id v15 = *(void **)(a1 + 104);
  if (v15)
  {
    id v16 = *(NSObject **)(a1 + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___workBlockGenerator_block_invoke_237;
    block[3] = &unk_1E5ABD4B8;
    id v22 = v15;
    char v23 = *(unsigned char *)(a1 + 116);
    id v21 = *(id *)(a1 + 64);
    dispatch_async(v16, block);
  }
}

void sub_1A2B18940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___workBlockGenerator_block_invoke_237(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

id BSUISurfaceWithColorSpaceAndDrawBlock(uint64_t a1, CGColorSpace *a2, void *a3, double a4, double a5, double a6)
{
  id v11 = a3;
  if (!v11)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v26 = objc_msgSend(NSString, "stringWithUTF8String:", "IOSurface *BSUISurfaceWithColorSpaceAndDrawBlock(CGSize, CGFloat, BSIOSurfaceOptions, CGColorSpaceRef, __strong BSBlock)");
    [v25 handleFailureInFunction:v26, @"BSUIImageUtilities.m", 104, @"Invalid parameter not satisfying: %@", @"drawBlock", 0 file lineNumber description];
  }
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__0;
  unint64_t v12 = vcvtpd_u64_f64(a4 * a6);
  unint64_t v13 = vcvtpd_u64_f64(a5 * a6);
  id v45 = __Block_byref_object_dispose__0;
  id v46 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v35 = __BSUISurfaceWithColorSpaceAndDrawBlock_block_invoke;
  id v36 = &unk_1E5ABD530;
  double v38 = a4;
  double v39 = a5;
  double v40 = a6;
  id v14 = v11;
  id v37 = v14;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  int v31 = __BSUISurfaceWithColorSpaceAndDrawBlock_block_invoke_2;
  char v32 = &unk_1E5ABD558;
  int v33 = &v41;
  id v29 = v34;
  uint64_t v28 = v30;
  uint64_t v47 = a1;
  id v15 = objc_msgSend(MEMORY[0x1E4F2EF78], "bs_IOSurfaceWithWidth:height:options:", v12, v13, &v47);
  if (v15)
  {
    space = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    if ((v47 & 2) != 0) {
      CGColorSpaceRef v16 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
    }
    else {
      CGColorSpaceRef v16 = CGColorSpaceRetain(space);
    }
    uint64_t v17 = v16;
    if (a2)
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      if (CGColorSpaceEqualToColorSpace()) {
        a2 = space;
      }
      CGColorSpaceRelease(DeviceRGB);
    }
    if (!a2) {
      a2 = v17;
    }
    if (v17)
    {
      uint64_t v19 = (CGContext *)CGIOSurfaceContextCreate();
      id v20 = v19;
      if (v19)
      {
        if (a1)
        {
          CGContextSaveGState(v19);
          id v21 = [MEMORY[0x1E4F428B8] blackColor];
          CGContextSetFillColorWithColor(v20, (CGColorRef)[v21 CGColor]);

          v49.size.width = (double)v12;
          v49.size.height = (double)v13;
          v49.origin.x = 0.0;
          v49.origin.y = 0.0;
          CGContextFillRect(v20, v49);
          CGContextRestoreGState(v20);
        }
        v35((uint64_t)v29, v20);
        if (CGColorSpaceEqualToColorSpace()) {
          id v22 = 0;
        }
        else {
          id v22 = a2;
        }
        v31((uint64_t)v28, (uint64_t)v20, v22);
        CGContextRelease(v20);
      }
      CGColorSpaceRelease(v17);
    }
    CGColorSpaceRelease(space);
  }

  id v23 = (id)v42[5];
  _Block_object_dispose(&v41, 8);

  return v23;
}

void sub_1A2B18D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __BSUISurfaceWithColorSpaceAndDrawBlock_block_invoke(uint64_t a1, CGContext *a2)
{
  double v4 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  BOOL v5 = (void (**)(void))*(id *)(a1 + 32);
  uint64_t v6 = v5;
  if (!a2)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    CFNumberRef v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void __BSUIImagePerformUIDrawBlock(CGContextRef, CGSize, CGFloat, __strong BSBlock)");
    [v7 handleFailureInFunction:v8, @"BSUIImageUtilities.m", 74, @"Invalid parameter not satisfying: %@", @"context" file lineNumber description];

    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    float v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void __BSUIImagePerformUIDrawBlock(CGContextRef, CGSize, CGFloat, __strong BSBlock)");
    [v9 handleFailureInFunction:v10, @"BSUIImageUtilities.m", 75, @"Invalid parameter not satisfying: %@", @"drawBlock" file lineNumber description];

    goto LABEL_3;
  }
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  CGContextSaveGState(a2);
  CGContextTranslateCTM(a2, 0.0, v3 * v4);
  CGContextScaleCTM(a2, v3, -v3);
  CGContextGetCTM(&v11, a2);
  CGContextSetBaseCTM();
  UIGraphicsPushContext(a2);
  v6[2](v6);
  UIGraphicsPopContext();
  CGContextRestoreGState(a2);
}

void sub_1A2B18F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __BSUISurfaceWithColorSpaceAndDrawBlock_block_invoke_2(uint64_t a1, uint64_t a2, CGColorSpace *a3)
{
  Surface = (const void *)CGIOSurfaceContextGetSurface();
  if (!Surface) {
    return;
  }
  uint64_t v6 = Surface;
  CFRetain(Surface);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  CFNumberRef v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  buffer = (__IOSurface *)*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (buffer)
  {
    if (a3) {
      goto LABEL_4;
    }
  }
  else
  {
    float v10 = [MEMORY[0x1E4F28B00] currentHandler];
    CGAffineTransform v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void __BSUIIOSurfaceSetColorSpace(IOSurface *__strong, CGColorSpaceRef)");
    [v10 handleFailureInFunction:v11, @"BSUIImageUtilities.m", 92, @"Invalid parameter not satisfying: %@", @"surface" file lineNumber description];

    if (a3)
    {
LABEL_4:
      CFPropertyListRef v9 = CGColorSpaceCopyPropertyList(a3);
      if (v9)
      {
        IOSurfaceSetValue(buffer, (CFStringRef)*MEMORY[0x1E4F2F068], v9);
        CFRelease(v9);
      }
    }
  }
}

void sub_1A2B190D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id BSUISurfaceImageWithColorSpaceAndDrawBlock(uint64_t a1, CGColorSpace *a2, void *a3, double a4, double a5, double a6)
{
  id v11 = a3;
  BSUISurfaceWithColorSpaceAndDrawBlock(a1, a2, v11, a4, a5, a6);
  unint64_t v12 = (const void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) _initWithIOSurface:v12 scale:0 orientation:a6];
    CFRelease(v12);
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

void sub_1A2B191D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B19300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1940C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B196C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B19974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B19A74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B19BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSLutIdentifierForName(void *a1, int a2)
{
  id v3 = a1;
  double v4 = v3;
  if (a2)
  {
    id v5 = [@"luminance_reduced_" stringByAppendingString:v3];
  }
  else
  {
    id v5 = v3;
  }
  uint64_t v6 = v5;

  return v6;
}

void sub_1A2B19CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B19D4C(_Unwind_Exception *a1)
{
  double v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A2B19F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1A020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1A184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1A2A4(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A2B1A3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1A4E4(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A2B1A60C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1A780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1A7F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)BSUIRelativeDateLabel;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A2B1AE04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1AF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1B034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1B13C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1B3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1B508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1B634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1B708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1BC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

BOOL __writeDataToFileDescriptor(int __fd, uint64_t a2, unint64_t a3)
{
  if (!a3) {
    return 1;
  }
  for (unint64_t i = 0; i < a3; i += v7 & ~(v7 >> 63))
  {
    ssize_t v7 = write(__fd, (const void *)(a2 + i), a3 - i);
    if (v7 < 0) {
      break;
    }
  }
  return v7 >= 0;
}

void sub_1A2B1C614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1C9F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1CD24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A2B1CE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1D28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1A2B1D458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1D540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1D6A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1D734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  float v10 = v9;

  a9.super_class = (Class)BSUIDateLabelFactory;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A2B1D8E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1DAD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1DB80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _BSUI_Private_IsN84()
{
  if (qword_1EB3A3968 != -1) {
    dispatch_once(&qword_1EB3A3968, &__block_literal_global_3);
  }
  return _MergedGlobals_11;
}

void sub_1A2B1DC68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1DCFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1DD78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1DDE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1DE58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1DEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1DF38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1DFA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1E018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1E088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1E110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1E1D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1E2B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1E360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1E418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1E4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1E5D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1E670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1E76C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1E884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1EB60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1EC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1ED9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1EE20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1F04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1F138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1F274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1F304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1F39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1F444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1F4CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1F55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1F5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  float v10 = v9;

  a9.super_class = (Class)BSUIScrollView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A2B1F7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1F988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1FAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  objc_destroyWeak(v13);
  objc_destroyWeak((id *)(v15 - 56));
  _Unwind_Resume(a1);
}

void sub_1A2B1FB50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1FC64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1FD4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1FEB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B1FFBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B200D0(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A2B201E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B2032C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B20480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B20598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B20648(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1A2B206DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1A2B208CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B20A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B20B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B20CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B20E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B20FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B211DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B21374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B21460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)BSUIMappedImageCacheFuture;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A2B21668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B217EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B21BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2B21E28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B22060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B220D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  float v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSUIDefaultDateLabel;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A2B224B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1A2B22588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B22620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B226BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B22768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B22880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B228BC()
{
}

void sub_1A2B22958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B22B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B22DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B237DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1A2B23A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B23C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B2410C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B241D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B247D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B2493C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B24B90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B24E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B24FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B2506C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B2510C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B252B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B25374(_Unwind_Exception *a1)
{
  double v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A2B25594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B25B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void _setLayerFilters(void *a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v36 = a1;
  id v33 = a2;
  if (qword_1EB3A39A8 != -1) {
    dispatch_once(&qword_1EB3A39A8, &__block_literal_global_164);
  }
  id v34 = (id)qword_1EB3A39A0;
  id v30 = [v36 filters];
  uint64_t v3 = [v30 count];
  if (v3 != [v33 count]) {
    goto LABEL_12;
  }
  unint64_t v4 = 0;
  char v5 = 0;
  while (v4 < [v33 count])
  {
    uint64_t v6 = [v30 objectAtIndexedSubscript:v4];
    ssize_t v7 = [v33 objectAtIndexedSubscript:v4];
    CFNumberRef v8 = [v7 name];

    if (!v8) {
      goto LABEL_11;
    }
    CFPropertyListRef v9 = [v6 name];
    float v10 = [v7 name];
    int v11 = BSEqualObjects();

    if (!v11
      || ([v6 type],
          unint64_t v12 = objc_claimAutoreleasedReturnValue(),
          [v7 type],
          unint64_t v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = BSEqualObjects(),
          v13,
          v12,
          !v14))
    {
LABEL_11:

      goto LABEL_12;
    }
    uint64_t v15 = [v7 type];
    CGColorSpaceRef v16 = [v34 objectForKeyedSubscript:v15];

    ++v4;
    char v5 = 1;
    if (!v16) {
      goto LABEL_12;
    }
  }
  if (v5)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = v33;
    uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v42 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v18 = [v17 type];
          uint64_t v19 = [v34 objectForKeyedSubscript:v18];

          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v20 = v19;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v38;
            do
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v38 != v22) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8 * j);
                uint64_t v25 = NSString;
                __int16 v26 = [v17 name];
                id v27 = [v25 stringWithFormat:@"filters.%@.%@", v26, v24];

                uint64_t v28 = [v17 valueForKey:v24];
                [v36 setValue:v28 forKeyPath:v27];
              }
              uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v21);
          }
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v32);
    }
  }
  else
  {
LABEL_12:
    [v36 setFilters:v33];
  }
}

void sub_1A2B26030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1A2B263CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B265F4(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A2B26668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B266C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B26730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B267A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2B26850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B26A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B26B6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B26C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2B26CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___filterPropertyKeysByType_block_invoke()
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = *MEMORY[0x1E4F3A038];
  uint64_t v9 = *MEMORY[0x1E4F3A168];
  uint64_t v0 = v9;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v11[0] = v1;
  v10[1] = *MEMORY[0x1E4F3A350];
  uint64_t v8 = v0;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  v11[1] = v2;
  v10[2] = *MEMORY[0x1E4F3A0D0];
  uint64_t v3 = *MEMORY[0x1E4F3A1A0];
  v7[0] = *MEMORY[0x1E4F3A1D8];
  v7[1] = v3;
  unint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  v11[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v6 = (void *)qword_1EB3A39A0;
  qword_1EB3A39A0 = v5;
}

void sub_1A2B26E44(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t BSDateAtStartOfDay()
{
  return MEMORY[0x1F410C1F0]();
}

uint64_t BSDegreesToRadians()
{
  return MEMORY[0x1F410C1F8]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1F410C270]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSDispatchQueueAssertNot()
{
  return MEMORY[0x1F410C290]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1F410C2B8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F410C328]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1F410C348]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1F410C350]();
}

uint64_t BSInterfaceOrientationDescription()
{
  return MEMORY[0x1F410C398]();
}

uint64_t BSIntervalClip()
{
  return MEMORY[0x1F410C3C8]();
}

uint64_t BSIntervalInterpolate()
{
  return MEMORY[0x1F410C3D8]();
}

uint64_t BSIntervalMax()
{
  return MEMORY[0x1F410C3E8]();
}

uint64_t BSIntervalMin()
{
  return MEMORY[0x1F410C3F0]();
}

uint64_t BSIntervalValueForFraction()
{
  return MEMORY[0x1F410C408]();
}

uint64_t BSLogCommon()
{
  return MEMORY[0x1F410C428]();
}

uint64_t BSPointEqualToPoint()
{
  return MEMORY[0x1F410C4D0]();
}

uint64_t BSTemporaryFileAtPath()
{
  return MEMORY[0x1F410C690]();
}

uint64_t CAColorMatrixConcat()
{
  return MEMORY[0x1F40F4A48]();
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x1F40F4AC0](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x1F4113C70]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1F40D7AB8](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1F40D9AC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1F40D9B78]();
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9C50](space);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1F40DA0D8]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

uint64_t CGIOSurfaceContextCreate()
{
  return MEMORY[0x1F40DA7C0]();
}

uint64_t CGIOSurfaceContextGetSurface()
{
  return MEMORY[0x1F40DA7E0]();
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x1F40DA9C0]();
}

BOOL CGImageIsMask(CGImageRef image)
{
  return MEMORY[0x1F40DA9D0](image);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CPBitmapCreateImagesFromData()
{
  return MEMORY[0x1F4109250]();
}

uint64_t CPBitmapCreateMappedDataFromPath()
{
  return MEMORY[0x1F4109260]();
}

uint64_t CPBitmapWriterAddImage()
{
  return MEMORY[0x1F4109270]();
}

uint64_t CPBitmapWriterCreateWithFileDescriptor()
{
  return MEMORY[0x1F4109280]();
}

uint64_t CPBitmapWriterFinalize()
{
  return MEMORY[0x1F4109290]();
}

CFDictionaryRef IOSurfaceCopyAllValues(IOSurfaceRef buffer)
{
  return (CFDictionaryRef)MEMORY[0x1F40E92F8](buffer);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9350](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40E9380](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerElementOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E93A0](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E93B8](buffer, planeIndex);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E9450](buffer, planeIndex);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9480](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9488](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E9508](buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1F4102C98]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
}

uint64_t _dirhelper_relative()
{
  return MEMORY[0x1F40C9D58]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCB08](a1, a2, *(void *)&a3);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}