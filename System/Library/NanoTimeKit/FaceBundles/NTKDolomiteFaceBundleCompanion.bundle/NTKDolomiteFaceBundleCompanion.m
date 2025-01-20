void sub_1640(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGContext *v13;
  id v14;
  uint64_t vars8;
  CGRect v16;

  v3 = a2;
  v4 = [v3 format];
  [v4 bounds];
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  [*(id *)(a1 + 32) setFill];
  v13 = (CGContext *)[v3 CGContext];

  v16.origin.x = v6;
  v16.origin.y = v8;
  v16.size.width = v10;
  v16.size.height = v12;
  CGContextFillEllipseInRect(v13, v16);
  CLKRectGetCenter();
  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  [v14 closePath];
  [*(id *)(a1 + 40) setFill];
  [v14 fill];
}

id sub_1B28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && (v3 = (void *)*((void *)WeakRetained + 5)) != 0)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NTKDate faceDate];
  }
  v5 = v4;

  return v5;
}

id sub_1B98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && (v3 = (void *)*((void *)WeakRetained + 4)) != 0)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NTKDate faceDate];
  }
  v5 = v4;

  return v5;
}

void sub_1F64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 faceViewDidChangeWantsStatusBarIconShadow];

    id WeakRetained = v3;
  }
}

uint64_t sub_2E50(uint64_t a1)
{
  id v2 = +[NTKSwatchRenderer renderSwatchForView:size:device:key:using:](NTKSwatchRenderer, "renderSwatchForView:size:device:key:using:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), 0, *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

void sub_32F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
}

id sub_3314(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained overrideDate];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[CLKClockTimer now];
  }
  v5 = v4;

  return v5;
}

void sub_36AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_36D0(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDate];
}

void sub_3734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_3748(id a1)
{
  return (NSString *)@"NTKDolomitePicayuneView Minute Updates";
}

void sub_3968(uint64_t a1, uint64_t a2)
{
  id v3 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v3 valueCompact:0.0 regular:0.0 luxoCompact:61.0 luxoRegular:63.5 aloeCompact:63.5 aloeRegular:66.5 agave:74.5 avoniaCompact:63.5 avoniaRegular:0x4050A00000000000];
  *(double *)&qword_D5E7B0 = v2 + (0.0833333333 + 0.0833333333) * v2;
}

id sub_3DA0()
{
  if (qword_D5E7D8 != -1) {
    dispatch_once(&qword_D5E7D8, &stru_D58518);
  }
  v0 = (void *)qword_D5E7D0;

  return v0;
}

id sub_46DC()
{
  CLKUIConvertLABtoRGB();
  id v4 = +[UIColor colorWithRed:v3 green:v0 blue:v1 alpha:v2];
  id v5 = [v4 CGColor];

  return v5;
}

_UNKNOWN **sub_494C(int a1, int a2, uint64_t a3)
{
  int v3 = a1 + 660;
  if (a3 == 1)
  {
    v7 = &NTKDolomiteTimeInstances12_ArabicIndic + 6 * (v3 % 720);
    if (a2) {
      return &NTKDolomiteTimeInstances24_ArabicIndic + 6 * a1;
    }
    else {
      return v7;
    }
  }
  else
  {
    id v4 = &NTKDolomiteTimeInstances12_Devanagari + 6 * (v3 % 720);
    if (a2) {
      id v4 = &NTKDolomiteTimeInstances24_Devanagari + 6 * a1;
    }
    id v5 = &NTKDolomiteTimeInstances12_Arabic + 6 * (v3 % 720);
    if (a2) {
      id v5 = &NTKDolomiteTimeInstances24_Arabic + 6 * a1;
    }
    if (a3 == 2) {
      return v4;
    }
    else {
      return v5;
    }
  }
}

CGPath *sub_4A20(unsigned int a1, int a2, float64_t a3, float64_t a4, double a5)
{
  id v19 = 0;
  int v9 = sub_7350(a1, &v19);
  id v10 = v19;
  v11 = (float32x2_t *)[v10 bytes];
  if (v9 < 1)
  {
    int v14 = 0;
    LOBYTE(v13) = 0;
  }
  else
  {
    uint64_t v12 = 0;
    int v13 = 0;
    int v14 = 0;
    do
    {
      if (v11[5 * v12 + 4].i32[0] == 2)
      {
        float v15 = a4;
        v13 |= sub_752C((uint64_t)&v11[5 * v14], (int)v12++ - v14, a2, v15, a5);
        int v14 = v12;
      }
      else
      {
        ++v12;
      }
    }
    while (v12 != v9);
  }
  float v16 = a4;
  if (sub_752C((uint64_t)&v11[5 * v14], v9 - v14, a2, v16, a5) & 1) != 0 || (v13) {
    v17 = sub_78DC(v11, v9, a3, a4);
  }
  else {
    v17 = 0;
  }

  return v17;
}

id sub_609C(int a1, uint64_t a2, int a3, uint64_t a4, float64_t a5, float64_t a6)
{
  int v9 = (unsigned int *)sub_494C(a1, a3, a4);
  id v10 = v9;
  if (a2)
  {
    if (a2 == 2) {
      id v10 = v9 + 8;
    }
    else {
      id v10 = v9 + 4;
    }
  }
  if (*v10) {
    Mutable = sub_7A20(*v10, a5, a6);
  }
  else {
    Mutable = CGPathCreateMutable();
  }
  uint64_t v12 = Mutable;
  unsigned int v13 = v10[1];
  if (v13) {
    int v14 = sub_7A20(v13, a5, a6);
  }
  else {
    int v14 = CGPathCreateMutable();
  }
  float v15 = v14;
  unsigned int v16 = v10[2];
  if (v16) {
    v17 = sub_7A20(v16, a5, a6);
  }
  else {
    v17 = CGPathCreateMutable();
  }
  v18 = v17;
  unsigned int v19 = v10[3];
  if (v19) {
    v20 = sub_7A20(v19, a5, a6);
  }
  else {
    v20 = CGPathCreateMutable();
  }
  v21 = v20;
  v24[0] = v12;
  v24[1] = v15;
  v24[2] = v18;
  v24[3] = v20;
  v22 = +[NSArray arrayWithObjects:v24 count:4];

  return v22;
}

id sub_669C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, double a6, double a7)
{
  id v13 = a5;
  int v14 = objc_opt_new();
  [v14 setKeyPath:@"path"];
  v17[0] = a1;
  v17[1] = a2;
  v17[2] = a3;
  v17[3] = a4;
  float v15 = +[NSArray arrayWithObjects:v17 count:4];
  [v14 setValues:v15];

  [v14 setKeyTimes:&off_D58F68];
  [v14 setDuration:a7];
  [v14 setTimingFunction:v13];

  [v14 setFillMode:kCAFillModeForwards];
  [v14 setRemovedOnCompletion:0];
  [v14 setBeginTime:CACurrentMediaTime() + a6];

  return v14;
}

void sub_71FC(id a1)
{
  float v1 = +[NSNull null];
  v4[0] = @"instanceTransform";
  v4[1] = @"contentsMultiplyColor";
  v5[0] = v1;
  v5[1] = v1;
  v4[2] = @"transform";
  v4[3] = @"hidden";
  v5[2] = v1;
  v5[3] = v1;
  v4[4] = @"position";
  v4[5] = @"opacity";
  v5[4] = v1;
  v5[5] = v1;
  v4[6] = @"instanceCount";
  v4[7] = @"instanceDelay";
  v5[6] = v1;
  v5[7] = v1;
  v4[8] = @"backgroundColor";
  v4[9] = @"path";
  v5[8] = v1;
  v5[9] = v1;
  v4[10] = @"bounds";
  v4[11] = @"contents";
  v5[10] = v1;
  v5[11] = v1;
  v4[12] = @"sublayers";
  v4[13] = @"string";
  v5[12] = v1;
  v5[13] = v1;
  v4[14] = @"fillColor";
  v4[15] = @"strokeColor";
  v5[14] = v1;
  v5[15] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:16];
  int v3 = (void *)qword_D5E7D0;
  qword_D5E7D0 = v2;
}

uint64_t sub_7350(unsigned int a1, void *a2)
{
  uint64_t v2 = NTKDolomiteTimeIndices[a1];
  if ((int)v2 < 1) {
    return 0;
  }
  id v5 = [objc_alloc((Class)NSMutableData) initWithLength:40 * v2];
  id v6 = (float32x2_t *)[v5 mutableBytes];
  unsigned int v9 = a1 + 1;
  id v10 = v6 + 4;
  float32x2_t v11 = 0;
  uint64_t v12 = v2;
  char v13 = 1;
  do
  {
    if (v13)
    {
      unsigned int v14 = NTKDolomiteTimeIndices[v9++];
      v7.i32[0] = v14;
      v7.i32[0] = vshr_n_u32(v7, 0x10uLL).u32[0];
      v7.i32[1] = vdup_n_s32(v14).u16[2];
      float32x2_t v11 = vdiv_f32(vcvt_f32_u32(v7), (float32x2_t)0x477FFF0046FFFE00);
    }
    unsigned int v15 = v9 + 1;
    unsigned int v16 = NTKDolomiteTimeIndices[v9];
    v10[-4] = v11;
    switch(v16)
    {
      case 0xFFFFFFFF:
        v10->i32[0] = 2;
        char v13 = 1;
        break;
      case 0xFFFFFFFE:
        char v13 = 0;
        v10->i32[0] = 1;
        unsigned int v20 = NTKDolomiteTimeIndices[v15];
        v7.i32[0] = v20;
        v7.i32[0] = vshr_n_u32(v7, 0x10uLL).u32[0];
        v7.i32[1] = vdup_n_s32(v20).u16[2];
        float32x2_t v11 = vdiv_f32(vcvt_f32_u32(v7), (float32x2_t)0x477FFF0046FFFE00);
        v10[-3] = v11;
        unsigned int v15 = v9 + 2;
        break;
      case 0xFFFFFFFD:
        char v13 = 0;
        v10->i32[0] = 0;
        unsigned int v17 = NTKDolomiteTimeIndices[v15];
        v7.i32[0] = v17;
        v18.i32[0] = vshl_u32(v7, (uint32x2_t)0xFFFF0001FFFFFFF0).u32[0];
        v18.i32[1] = vdup_n_s32(v17).u16[2];
        float32x2_t v11 = vdiv_f32(vcvt_f32_u32(v18), (float32x2_t)0x477FFF0046FFFE00);
        v10[-3] = v11;
        v8.i32[0] = NTKDolomiteTimeIndices[v9 + 2];
        v19.i32[0] = vshl_u32(v8, (uint32x2_t)0xFFFF0001FFFFFFF0).u32[0];
        v19.i32[1] = vdup_n_s32(*(NTKDolomiteTimeIndices + 4 * (v9 + 2))).u16[2];
        v10[-2] = vdiv_f32(vcvt_f32_u32(v19), (float32x2_t)0x477FFF0046FFFE00);
        unsigned int v15 = v9 + 4;
        v19.i32[0] = NTKDolomiteTimeIndices[v9 + 3];
        v8.i32[0] = vshl_u32(v19, (uint32x2_t)0xFFFF0001FFFFFFF0).u32[0];
        v8.i32[1] = vdup_n_s32(*(NTKDolomiteTimeIndices + 4 * (v9 + 3))).u16[2];
        uint32x2_t v7 = (uint32x2_t)vdiv_f32(vcvt_f32_u32(v8), (float32x2_t)0x477FFF0046FFFE00);
        v10[-1] = (float32x2_t)v7;
        break;
      default:
        char v13 = 0;
        break;
    }
    v10 += 5;
    unsigned int v9 = v15;
    --v12;
  }
  while (v12);
  id v21 = v5;
  *a2 = v21;

  return v2;
}

uint64_t sub_752C(uint64_t a1, int a2, int a3, float a4, double a5)
{
  if (a2 < 3) {
    return 0;
  }
  uint64_t v5 = 0;
  char v6 = 0;
  double v7 = round(a4 * a5 * (double)a3 / 60.0) / a5 / a4;
  uint64_t v8 = a2;
  uint64_t v9 = a1 + 4;
LABEL_3:
  id v10 = (float *)(a1 + 32 + 40 * v5++);
  do
  {
    if (*(_DWORD *)v10 == 1)
    {
      float v11 = *(v10 - 7);
      BOOL v16 = vabds_f32(v11, *(v10 - 5)) < 0.000001;
      float v12 = v11 * 60.0;
      unsigned int v13 = llroundf(v12);
      BOOL v14 = v16 && v13 == a3;
      float v15 = vabds_f32((float)a3, v12);
      BOOL v16 = v14 && v15 < 0.5;
      if (v16)
      {
        *(_DWORD *)id v10 = 3;
        char v6 = 1;
        if (v5 != a2) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
    ++v5;
    v10 += 10;
  }
  while (v5 - a2 != 1);
  if ((v6 & 1) == 0) {
    return 0;
  }
LABEL_17:
  uint64_t v17 = 0;
  float v18 = v7;
  int v19 = a2 - 1;
  do
  {
    if (*(_DWORD *)(a1 + 40 * v17 + 32) == 3)
    {
      unsigned int v20 = (float *)(v9 + 40 * v17);
      float v21 = *v20;
      float v22 = v18 - *v20;
      float *v20 = v18;
      v20[2] = v18;
      int v23 = 1;
      while (1)
      {
        unsigned int v24 = ((int)v17 + v23) % a2;
        int v25 = *(_DWORD *)(a1 + 40 * v24 + 32);
        if (v25 == 1) {
          break;
        }
        if (v25 == 3)
        {
          if (v23 < 2) {
            goto LABEL_32;
          }
          --v23;
          break;
        }
        if (vabds_f32(*(float *)(v9 + 40 * v24), v18) <= 0.1 && ++v23 != 6) {
          continue;
        }
        break;
      }
      int v26 = (v23 + (int)v17) % a2;
      float v27 = *(float *)(v9 + 40 * v26 + 8);
      if (v27 != v21)
      {
        float v28 = v27 + flt_D554F8[v27 > v21];
        if (v28 != v21)
        {
          float v29 = v22 / vabds_f32(v28, v21);
          v30 = (float *)(v9 + 40 * v26);
          float *v30 = *v30 + (float)(vabds_f32(v28, *v30) * v29);
          v30[4] = v30[4] + (float)(vabds_f32(v28, v30[4]) * v29);
          if (v23 >= 2)
          {
            for (int i = 1; i != v23; ++i)
            {
              v32 = (float *)(v9 + 40 * (((int)v17 + i) % a2));
              float v33 = v32[2];
              float *v32 = *v32 + (float)(vabds_f32(v28, *v32) * v29);
              v32[2] = v33 + (float)(vabds_f32(v28, v33) * v29);
              v32[4] = v32[4] + (float)(vabds_f32(v28, v32[4]) * v29);
              v32[6] = v32[6] + (float)(vabds_f32(v28, v32[6]) * v29);
            }
          }
        }
      }
LABEL_32:
      int v34 = 1;
      int v35 = v19;
      while (1)
      {
        int v36 = *(_DWORD *)(a1 + 40 * (v35 % a2) + 32);
        if (v36 == 1) {
          break;
        }
        if (v36 == 3)
        {
          if (v34 < 2) {
            goto LABEL_45;
          }
          --v34;
          break;
        }
        if (vabds_f32(*(float *)(v9 + 40 * (v35 % a2) + 8), v18) <= 0.1)
        {
          ++v34;
          --v35;
          if (v34 != 6) {
            continue;
          }
        }
        break;
      }
      int v37 = ((int)v17 + a2 - v34) % a2;
      float v38 = *(float *)(v9 + 40 * v37);
      if (v38 != v21)
      {
        float v39 = v38 + flt_D554F8[v38 > v21];
        if (v39 != v21)
        {
          float v40 = v22 / vabds_f32(v39, v21);
          uint64_t v41 = v9 + 40 * v37;
          *(float *)(v41 + 8) = *(float *)(v41 + 8) + (float)(vabds_f32(v39, *(float *)(v41 + 8)) * v40);
          *(float *)(v41 + 24) = *(float *)(v41 + 24) + (float)(vabds_f32(v39, *(float *)(v41 + 24)) * v40);
          if (v34 >= 2)
          {
            int v42 = 0;
            int v43 = 1 - v34;
            do
            {
              v44 = (float *)(v9 + 40 * ((v19 + v42) % a2));
              float v45 = v44[2];
              float *v44 = *v44 + (float)(vabds_f32(v39, *v44) * v40);
              v44[2] = v45 + (float)(vabds_f32(v39, v45) * v40);
              v44[4] = v44[4] + (float)(vabds_f32(v39, v44[4]) * v40);
              v44[6] = v44[6] + (float)(vabds_f32(v39, v44[6]) * v40);
              --v42;
            }
            while (v43 != v42);
          }
        }
      }
    }
LABEL_45:
    ++v17;
    ++v19;
  }
  while (v17 != a2);
  v46 = (_DWORD *)(a1 + 32);
  do
  {
    if (*v46 == 3) {
      _DWORD *v46 = 1;
    }
    v46 += 10;
    --v8;
  }
  while (v8);
  return 1;
}

CGPath *sub_78DC(float32x2_t *a1, int a2, float64_t a3, float64_t a4)
{
  if (a2 < 1) {
    return 0;
  }
  LODWORD(v8) = a2;
  Mutable = CGPathCreateMutable();
  v6.f64[0] = a3;
  v6.f64[1] = a4;
  float32x2_t v7 = vcvt_f32_f64(v6);
  uint64_t v8 = v8;
  uint64_t v9 = a1 + 2;
  BOOL v10 = 1;
  do
  {
    __int32 v11 = v9[2].i32[0];
    if (v11 == 2)
    {
      CGPathCloseSubpath(Mutable);
    }
    else
    {
      float32x2_t v13 = v9[-1];
      float32x2_t v12 = *v9;
      float32x2_t v14 = v9[1];
      if (v10)
      {
        float32x2_t v15 = vmul_f32(v9[-2], v7);
        CGPathMoveToPoint(Mutable, 0, v15.f32[0], v15.f32[1]);
      }
      float32x2_t v16 = vmul_f32(v13, v7);
      if (v11 == 1)
      {
        CGPathAddLineToPoint(Mutable, 0, v16.f32[0], v16.f32[1]);
      }
      else
      {
        float32x2_t v17 = vmul_f32(v14, v7);
        float32x2_t v18 = vmul_f32(v12, v7);
        CGPathAddCurveToPoint(Mutable, 0, v18.f32[0], v18.f32[1], v17.f32[0], v17.f32[1], v16.f32[0], v16.f32[1]);
      }
    }
    v9 += 5;
    BOOL v10 = v11 == 2;
    --v8;
  }
  while (v8);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

CGPath *sub_7A20(unsigned int a1, float64_t a2, float64_t a3)
{
  id v9 = 0;
  int v5 = sub_7350(a1, &v9);
  id v6 = v9;
  float32x2_t v7 = sub_78DC((float32x2_t *)[v6 bytes], v5, a2, a3);

  return v7;
}

void sub_7E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  for (uint64_t i = 184; i != -8; i -= 16)

  _Unwind_Resume(a1);
}

uint64_t sub_8110()
{
  qword_D5E7E0 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_81C4(id a1)
{
  v3[0] = &off_D58E20;
  v3[1] = &off_D58E38;
  v4[0] = @"arabic";
  v4[1] = @"arabic-indic";
  v3[2] = &off_D58E50;
  v4[2] = @"devanagari";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  uint64_t v2 = (void *)qword_D5E800;
  qword_D5E800 = v1;
}

uint64_t sub_8484()
{
  qword_D5E810 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_85C0(id a1)
{
  v3[0] = &off_D58E68;
  v3[1] = &off_D58E80;
  v4[0] = @"filled";
  v4[1] = @"outline";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  uint64_t v2 = (void *)qword_D5E830;
  qword_D5E830 = v1;
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return _CGColorGetComponents(color);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithRect(rect, transform);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CLKInterpolateBetweenFloatsUnclipped()
{
  return _CLKInterpolateBetweenFloatsUnclipped();
}

uint64_t CLKLocaleCurrentNumberSystem()
{
  return _CLKLocaleCurrentNumberSystem();
}

uint64_t CLKLocaleIs24HourMode()
{
  return _CLKLocaleIs24HourMode();
}

uint64_t CLKMapFractionIntoRange()
{
  return _CLKMapFractionIntoRange();
}

uint64_t CLKRectGetCenter()
{
  return _CLKRectGetCenter();
}

uint64_t CLKUIConvertLABtoRGB()
{
  return _CLKUIConvertLABtoRGB();
}

uint64_t CLKUIConvertRGBtoLAB()
{
  return _CLKUIConvertRGBtoLAB();
}

uint64_t NTKEnableAOD1hzTimeline()
{
  return _NTKEnableAOD1hzTimeline();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t _EnumValueRange()
{
  return __EnumValueRange();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return [a1 CGContext];
}

id objc_msgSend__applyPauseStateToActiveContentViewIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _applyPauseStateToActiveContentViewIfNecessary];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__hideTritiumStrips(void *a1, const char *a2, ...)
{
  return [a1 _hideTritiumStrips];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__palette(void *a1, const char *a2, ...)
{
  return [a1 _palette];
}

id objc_msgSend__startTimer(void *a1, const char *a2, ...)
{
  return [a1 _startTimer];
}

id objc_msgSend__stopTimer(void *a1, const char *a2, ...)
{
  return [a1 _stopTimer];
}

id objc_msgSend__updateDate(void *a1, const char *a2, ...)
{
  return [a1 _updateDate];
}

id objc_msgSend_activeAppearance(void *a1, const char *a2, ...)
{
  return [a1 activeAppearance];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_autoupdatingCurrentCalendar(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentCalendar];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_clockTimer(void *a1, const char *a2, ...)
{
  return [a1 clockTimer];
}

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return [a1 closePath];
}

id objc_msgSend_colorOption(void *a1, const char *a2, ...)
{
  return [a1 colorOption];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_dayOfYear(void *a1, const char *a2, ...)
{
  return [a1 dayOfYear];
}

id objc_msgSend_defaultColorPalette(void *a1, const char *a2, ...)
{
  return [a1 defaultColorPalette];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_digitNorthColor(void *a1, const char *a2, ...)
{
  return [a1 digitNorthColor];
}

id objc_msgSend_digitSouthColor(void *a1, const char *a2, ...)
{
  return [a1 digitSouthColor];
}

id objc_msgSend_dynamicPercent(void *a1, const char *a2, ...)
{
  return [a1 dynamicPercent];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return [a1 fill];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isDynamic(void *a1, const char *a2, ...)
{
  return [a1 isDynamic];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_isHardwareColor(void *a1, const char *a2, ...)
{
  return [a1 isHardwareColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_northColor(void *a1, const char *a2, ...)
{
  return [a1 northColor];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numeral(void *a1, const char *a2, ...)
{
  return [a1 numeral];
}

id objc_msgSend_overrideDate(void *a1, const char *a2, ...)
{
  return [a1 overrideDate];
}

id objc_msgSend_palette(void *a1, const char *a2, ...)
{
  return [a1 palette];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_southColor(void *a1, const char *a2, ...)
{
  return [a1 southColor];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_swatchStyle(void *a1, const char *a2, ...)
{
  return [a1 swatchStyle];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_updateDate(void *a1, const char *a2, ...)
{
  return [a1 updateDate];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}