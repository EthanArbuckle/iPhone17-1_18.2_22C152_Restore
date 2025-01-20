uint64_t sub_3400()
{
  uint64_t vars8;

  qword_2A9A0 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_3548(uint64_t a1)
{
  v2 = +[NSMutableDictionary dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_opt_class();
  v4 = [*(id *)(a1 + 32) device];
  v5 = [v3 _orderedValuesForDevice:v4];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"style %lu", [v10 unsignedIntValue]);
        [v2 setObject:v11 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v12 = (void *)qword_2A9C0;
  qword_2A9C0 = (uint64_t)v2;
}

void sub_38EC(uint64_t a1)
{
  v2 = +[NSMutableDictionary dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_opt_class();
  v4 = [*(id *)(a1 + 32) device];
  v5 = [v3 _orderedValuesForDevice:v4];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"light %lu", [v10 unsignedIntValue]);
        [v2 setObject:v11 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v12 = (void *)qword_2A9F0;
  qword_2A9F0 = (uint64_t)v2;
}

double sub_41D4(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2AA20);
  id WeakRetained = objc_loadWeakRetained(&qword_2AA28);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_2AA28);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_2AA28, v1);
    qword_2AA30 = (uint64_t)[v1 version];

    sub_6BC4(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_2AA30;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2AA20);

  return 0.0;
}

void sub_4908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_492C(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDateOverrideAnimationWithStopTime:*(double *)(a1 + 40)];
}

void sub_499C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_49B0(id a1)
{
  return (NSString *)@"Gladius date-override animation";
}

void sub_518C(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) layoutRuleForComplicationState:a2 layoutOverride:0];
  long long v5 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v5;
  v6[2] = *(_OWORD *)(a1 + 72);
  [v4 setContentTransform:v6];
  [*(id *)(a1 + 32) setDefaultLayoutRule:v4 forState:a2];
}

void sub_6944(id a1)
{
  qword_2AA00 = (uint64_t)objc_alloc_init((Class)NSCache);

  _objc_release_x1();
}

void sub_6980(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  [v4 bounds];
  objc_msgSend(v3, "drawInRect:");
  id v7 = [*(id *)(a1 + 40) layer];
  id v6 = [v5 CGContext];

  [v7 renderInContext:v6];
}

void sub_6BC4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v9 = +[CLKUIAnalogHandConfiguration defaultHourConfigurationForDevice:v2];
  [v9 pegRadius];
  double v4 = v3;
  [v9 pegStrokeWidth];
  double v6 = (v4 + v5) * 0.5;
  +[NTKGladiusDialView longHourTickRadiusForDevice:v2];
  double v8 = v7;

  *(double *)&qword_2AA10 = v6 + (v8 - v6) * 0.5;
  qword_2AA18 = 0x3FECCCCCCCCCCCCDLL;
}

void sub_7524(void *a1@<X0>, void *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2B480);
  id WeakRetained = objc_loadWeakRetained(&qword_2B488);
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_2B488);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_2B490;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_2B488, obj);
  qword_2B490 = (uint64_t)[obj version];

  sub_8CD4(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2B480);
  memcpy(a2, xmmword_2AA40, 0xA40uLL);
}

void sub_891C(id *a1, void *a2, uint64_t a3)
{
  id v5 = (void *)*((void *)a1[4] + 1);
  id v6 = a2;
  sub_7524(v5, v13);
  [a1[4] _hourTickLengthAtIndex:a3 forStyle:*((void *)a1[4] + 6)];
  CLKInterpolateBetweenFloatsClipped();
  id v8 = +[UIColor colorWithWhite:1.0 alpha:v7];
  uint64_t v9 = [*((id *)a1[4] + 7) hourTickDay];
  v10 = NTKInterpolateBetweenColors();

  [a1[5] addObject:v10];
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(a1[6], "CGColor"));
  id v11 = v10;
  v14[0] = [v11 CGColor];
  v14[1] = [a1[7] CGColor];
  v12 = +[NSArray arrayWithObjects:v14 count:2];
  [v6 setColors:v12];
}

void sub_8CD4(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  xmmword_2AA40[0] = xmmword_18550;
  [v3 scaledValue:7.0];
  qword_2AA50 = v4;
  [v2 screenBounds];
  CLKRectGetCenter();
  double v30 = v6;
  double v31 = v5;
  [v2 screenBounds];
  CGRectGetMidY(v38);
  v36[0] = &off_21538;
  v36[1] = &off_21550;
  v37[0] = &off_216E8;
  v37[1] = &off_216F8;
  v36[2] = &off_21568;
  v36[3] = &off_21580;
  v37[2] = &off_21708;
  v37[3] = &off_21718;
  double v7 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
  [v3 scaledValue:v7 withOverrides:87.0];

  v34[0] = &off_21538;
  v34[1] = &off_21550;
  v35[0] = &off_216F8;
  v35[1] = &off_21728;
  v34[2] = &off_21568;
  v34[3] = &off_21580;
  v35[2] = &off_21738;
  v35[3] = &off_21748;
  id v8 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
  [v3 scaledValue:v8 withOverrides:84.0];

  v32[0] = &off_21538;
  v32[1] = &off_21550;
  v33[0] = &off_21758;
  v33[1] = &off_21768;
  v32[2] = &off_21568;
  v32[3] = &off_21580;
  v33[2] = &off_21778;
  v33[3] = &off_21788;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];
  [v3 scaledValue:v9 withOverrides:55.5];

  unint64_t v10 = 0;
  uint64_t v11 = &stru_1F8.sectname[8];
  do
  {
    NTKScreenRadiusAtAngleWithInset();
    double v13 = v12;
    NTKScreenRadiusAtAngleWithInset();
    double v15 = v13 - v14;
    double v16 = v13 + (v13 - v14) * -0.5;
    __double2 v17 = __sincos_stret((double)v10 * 0.104719755 + -1.57079633);
    v18 = (double *)xmmword_2AA40 + v10;
    v18[3] = (double)v10 * 0.104719755 + -1.57079633;
    v18[183] = v15;
    v19 = (double *)((char *)xmmword_2AA40 + v11);
    *(v19 - 1) = v31 + v16 * v17.__cosval;
    double *v19 = v30 + v16 * v17.__sinval;
    unsigned int v20 = v10 / 5u;
    if (!(v10 % 5u))
    {
      NTKScreenRadiusAtAngleWithInset();
      double v22 = v21;
      double v23 = v13 - v21;
      double v24 = v13 - v23 * 0.5;
      v25 = (double *)xmmword_2AA40 + v20;
      v25[303] = v23;
      v26 = (double *)&xmmword_2AA40[v20];
      v26[279] = v31 + v24 * v17.__cosval;
      v26[280] = v30 + v24 * v17.__sinval;
      v25[315] = v22;
      NTKScreenRadiusAtAngleWithInset();
      double v28 = v27 - v22;
      double v29 = v27 - (v27 - v22) * 0.5;
      v25[267] = v28;
      v26[243] = v31 + v29 * v17.__cosval;
      v26[244] = v30 + v29 * v17.__sinval;
    }
    ++v10;
    v11 += 16;
  }
  while (v11 != 1472);
  qword_2B478 = 0x4008000000000000;
}

double sub_9F2C(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2B4B0);
  id WeakRetained = objc_loadWeakRetained(&qword_2B4B8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_2B4B8);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_2B4B8, v1);
    qword_2B4C0 = (uint64_t)[v1 version];

    sub_AB70(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_2B4C0;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2B4B0);
  double v9 = *(double *)&qword_2B498;

  return v9;
}

void sub_A734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_A758(uint64_t a1, void *a2, id *a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained lightingDelegate];
  [v6 lowFrequencyLightingTimerFired];
}

void sub_A7D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_A7E8(id a1)
{
  return (NSString *)@"Gladius low-frequency light spill";
}

void sub_AB70(uint64_t a1, uint64_t a2)
{
  id v5 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v5 scaledValue:6.0];
  qword_2B498 = v2;
  [v5 scaledValue:35.5];
  qword_2B4A0 = v3;
  [v5 scaledValue:65.0];
  qword_2B4A8 = v4;
}

uint64_t initializeBufferWithCopyOfBuffer for NTKGladiusLightSpillCoordinator.DialColors(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_AC34(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_AC48(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 36)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_AC68(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 36) = v3;
  return result;
}

void type metadata accessor for LightingLayoutConstants(uint64_t a1)
{
}

void type metadata accessor for MTLPixelFormat(uint64_t a1)
{
}

__n128 sub_ACC0(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_ACCC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_ACEC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

unint64_t sub_AD28(int32x2_t a1, int32x2_t a2, int32x2_t a3, int32x2_t a4)
{
  float32x2_t v4 = vsub_f32((float32x2_t)vzip1_s32(a4, a2), (float32x2_t)vzip1_s32(a3, a1));
  float32x2_t v5 = vsub_f32((float32x2_t)vzip2_s32(a4, a2), (float32x2_t)vzip2_s32(a3, a1));
  float32x2_t v6 = vmul_f32(v5, (float32x2_t)vrev64_s32((int32x2_t)v4));
  int32x2_t v7 = (int32x2_t)vsub_f32(v6, (float32x2_t)vdup_lane_s32((int32x2_t)v6, 1));
  if (fabsf(*(float *)v7.i32) >= 0.000000001)
  {
    float32x2_t v10 = vsub_f32((float32x2_t)a1, (float32x2_t)a3);
    *(float32x2_t *)v11.f32 = vdiv_f32(vsub_f32(vmul_lane_f32(v4, v10, 1), vmul_n_f32(v5, v10.f32[0])), (float32x2_t)vdup_lane_s32(v7, 0));
    uint64_t v8 = v11.u32[0];
    v11.i64[1] = v11.i64[0];
    v12.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_185A0, v11)).u32[0];
    v12.i32[1] = vmovn_s32(vcgtq_f32(v11, (float32x4_t)xmmword_185A0)).i32[1];
    char v9 = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v12, 0xFuLL))) ^ 1;
    if ((~vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)v12), 0x1FuLL)), (int8x16_t)xmmword_185B0)) & 0xF) != 0)uint64_t v8 = 0; {
  }
    }
  else
  {
    uint64_t v8 = 0;
    char v9 = 1;
  }
  return v8 | ((unint64_t)(v9 & 1) << 32);
}

unint64_t sub_AE0C(uint64_t a1, double a2, double a3, float a4, int32x2_t a5, int32x2_t a6)
{
  float32x2_t v7 = vsub_f32(*(float32x2_t *)&a3, *(float32x2_t *)&a2);
  float v8 = *((float *)&a3 + 1);
  float v9 = *((float *)&a2 + 1);
  float v10 = sqrtf(vmul_f32(v7, v7).f32[0]+ (float)((float)(*((float *)&a3 + 1) - *((float *)&a2 + 1)) * (float)(*((float *)&a3 + 1) - *((float *)&a2 + 1))));
  float v11 = v7.f32[0] / v10;
  float v72 = a4;
  float v73 = v10;
  float v12 = (float)(*((float *)&a3 + 1) - *((float *)&a2 + 1)) / v10;
  if ((a1 & 0x100000000) == 0) {
    a4 = *(float *)&a1;
  }
  float v13 = v12;
  float v14 = v12 * a4;
  float v74 = v11;
  float v15 = a4;
  float v16 = -(float)(v11 * a4);
  *(float *)v17.i32 = *(float *)&a2 + (float)(v12 * a4);
  *(float *)&v17.i32[1] = *((float *)&a2 + 1) + v16;
  *(float *)v18.i32 = *(float *)&a3 + v14;
  *(float *)&v18.i32[1] = *((float *)&a3 + 1) + v16;
  float32x2_t v19 = (float32x2_t)a5;
  unint64_t v21 = sub_AD28(a5, a6, v17, v18);
  if ((v21 & 0x100000000) != 0)
  {
    double v23 = (char *)&_swiftEmptyArrayStorage;
  }
  else
  {
    int v22 = v21;
    double v23 = sub_BC04(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
    unint64_t v25 = *((void *)v23 + 2);
    unint64_t v24 = *((void *)v23 + 3);
    if (v25 >= v24 >> 1) {
      double v23 = sub_BC04((char *)(v24 > 1), v25 + 1, 1, v23);
    }
    *((void *)v23 + 2) = v25 + 1;
    *(_DWORD *)&v23[4 * v25 + 32] = v22;
  }
  *(float *)v26.i32 = *(float *)&a2 - v14;
  *(float *)&v26.i32[1] = v9 - v16;
  *(float *)v27.i32 = *(float *)&a3 - v14;
  *(float *)&v27.i32[1] = v8 - v16;
  unint64_t v28 = sub_AD28((int32x2_t)v19, a6, v26, v27);
  if ((v28 & 0x100000000) != 0)
  {
    float v30 = v13;
    float v31 = v72;
  }
  else
  {
    int v29 = v28;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      double v23 = sub_BC04(0, *((void *)v23 + 2) + 1, 1, v23);
    }
    float v30 = v13;
    float v31 = v72;
    unint64_t v33 = *((void *)v23 + 2);
    unint64_t v32 = *((void *)v23 + 3);
    if (v33 >= v32 >> 1) {
      double v23 = sub_BC04((char *)(v32 > 1), v33 + 1, 1, v23);
    }
    *((void *)v23 + 2) = v33 + 1;
    *(_DWORD *)&v23[4 * v33 + 32] = v29;
  }
  unint64_t v34 = sub_B42C(*(float32x2_t *)&a2, v31, v19, (float32x2_t)a6);
  if (v35 != -1)
  {
    unint64_t v36 = v34;
    if (v35)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        double v23 = sub_BC04(0, *((void *)v23 + 2) + 1, 1, v23);
      }
      unint64_t v41 = *((void *)v23 + 2);
      unint64_t v40 = *((void *)v23 + 3);
      int64_t v42 = v40 >> 1;
      unint64_t v38 = v41 + 1;
      if (v40 >> 1 <= v41)
      {
        double v23 = sub_BC04((char *)(v40 > 1), v41 + 1, 1, v23);
        unint64_t v40 = *((void *)v23 + 3);
        int64_t v42 = v40 >> 1;
      }
      *((void *)v23 + 2) = v38;
      *(_DWORD *)&v23[4 * v41 + 32] = v36;
      int64_t v39 = v41 + 2;
      if (v42 < v39) {
        double v23 = sub_BC04((char *)(v40 > 1), v39, 1, v23);
      }
      v36 >>= 32;
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        double v23 = sub_BC04(0, *((void *)v23 + 2) + 1, 1, v23);
      }
      unint64_t v38 = *((void *)v23 + 2);
      unint64_t v37 = *((void *)v23 + 3);
      int64_t v39 = v38 + 1;
      if (v38 >= v37 >> 1) {
        double v23 = sub_BC04((char *)(v37 > 1), v38 + 1, 1, v23);
      }
    }
    *((void *)v23 + 2) = v39;
    *(_DWORD *)&v23[4 * v38 + 32] = v36;
  }
  unint64_t v43 = sub_B42C(*(float32x2_t *)&a3, v31, v19, (float32x2_t)a6);
  if (v44 == -1)
  {
    float v46 = v73;
  }
  else
  {
    unint64_t v45 = v43;
    float v46 = v73;
    if (v44)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        double v23 = sub_BC04(0, *((void *)v23 + 2) + 1, 1, v23);
      }
      unint64_t v51 = *((void *)v23 + 2);
      unint64_t v50 = *((void *)v23 + 3);
      int64_t v52 = v50 >> 1;
      unint64_t v48 = v51 + 1;
      if (v50 >> 1 <= v51)
      {
        double v23 = sub_BC04((char *)(v50 > 1), v51 + 1, 1, v23);
        unint64_t v50 = *((void *)v23 + 3);
        int64_t v52 = v50 >> 1;
      }
      *((void *)v23 + 2) = v48;
      *(_DWORD *)&v23[4 * v51 + 32] = v45;
      int64_t v49 = v51 + 2;
      if (v52 < v49) {
        double v23 = sub_BC04((char *)(v50 > 1), v49, 1, v23);
      }
      v45 >>= 32;
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        double v23 = sub_BC04(0, *((void *)v23 + 2) + 1, 1, v23);
      }
      unint64_t v48 = *((void *)v23 + 2);
      unint64_t v47 = *((void *)v23 + 3);
      int64_t v49 = v48 + 1;
      if (v48 >= v47 >> 1) {
        double v23 = sub_BC04((char *)(v47 > 1), v48 + 1, 1, v23);
      }
    }
    *((void *)v23 + 2) = v49;
    *(_DWORD *)&v23[4 * v48 + 32] = v45;
  }
  float32x2_t v53 = vsub_f32(v19, *(float32x2_t *)&a2);
  float v54 = (float)(v74 * v53.f32[0]) + vmuls_lane_f32(v30, v53, 1);
  BOOL v55 = v54 > 0.0 && v54 < v46;
  float v56 = vabds_f32(v53.f32[0] * v30, v53.f32[1] * v74);
  if (v55 && v56 < v15)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      double v23 = sub_BC04(0, *((void *)v23 + 2) + 1, 1, v23);
    }
    unint64_t v59 = *((void *)v23 + 2);
    unint64_t v58 = *((void *)v23 + 3);
    if (v59 >= v58 >> 1) {
      double v23 = sub_BC04((char *)(v58 > 1), v59 + 1, 1, v23);
    }
    *((void *)v23 + 2) = v59 + 1;
    *(_DWORD *)&v23[4 * v59 + 32] = 0;
  }
  float32x2_t v60 = vsub_f32((float32x2_t)a6, *(float32x2_t *)&a2);
  float v61 = (float)(v74 * v60.f32[0]) + vmuls_lane_f32(v30, v60, 1);
  BOOL v62 = v61 > 0.0 && v61 < v46;
  float v63 = vabds_f32(v60.f32[0] * v30, v74 * v60.f32[1]);
  if (!v62 || v63 >= v15)
  {
    uint64_t v65 = *((void *)v23 + 2);
    if (v65) {
      goto LABEL_65;
    }
LABEL_75:
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    double v23 = sub_BC04(0, *((void *)v23 + 2) + 1, 1, v23);
  }
  unint64_t v71 = *((void *)v23 + 2);
  unint64_t v70 = *((void *)v23 + 3);
  if (v71 >= v70 >> 1) {
    double v23 = sub_BC04((char *)(v70 > 1), v71 + 1, 1, v23);
  }
  *((void *)v23 + 2) = v71 + 1;
  *(_DWORD *)&v23[4 * v71 + 32] = 1065353216;
  uint64_t v65 = *((void *)v23 + 2);
  if (!v65) {
    goto LABEL_75;
  }
LABEL_65:
  if (v65 == 1)
  {
    uint64_t v66 = *((unsigned int *)v23 + 8);
    swift_bridgeObjectRelease();
    return v66;
  }
  unint64_t result = sub_B528((uint64_t)v23);
  if ((result & 0x100000000) != 0)
  {
    __break(1u);
  }
  else
  {
    unsigned int v68 = result;
    unint64_t result = sub_B580((uint64_t)v23);
    if ((result & 0x100000000) == 0)
    {
      unsigned int v69 = result;
      swift_bridgeObjectRelease();
      return v68 | ((unint64_t)v69 << 32);
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_B42C(float32x2_t a1, float a2, float32x2_t a3, float32x2_t a4)
{
  float32x2_t v4 = vsub_f32(a4, a3);
  float v5 = sqrtf(vaddv_f32(vmul_f32(v4, v4)));
  float32x2_t v6 = vsub_f32(a1, a3);
  float32x2_t v7 = (float32x2_t)vrev64_s32((int32x2_t)v6);
  v8.i32[1] = v7.i32[1];
  v8.f32[0] = v4.f32[1] / v5;
  v4.i32[1] = v6.i32[1];
  v4.f32[0] = v4.f32[0] / v5;
  float32x2_t v9 = vadd_f32(vmul_f32(v6, v4), vmul_f32(v7, v8));
  float v10 = vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v9, 1), vmul_f32(v9, v9)).f32[0];
  float v11 = a2 * a2;
  unint64_t result = 0;
  if (v11 >= v10)
  {
    float v13 = sqrtf(v11 - v10);
    float v14 = v9.f32[0] - v13;
    if (v5 >= (float)(v9.f32[0] - v13))
    {
      float v15 = v9.f32[0] + v13;
      if (v15 >= 0.0)
      {
        float v16 = v14 / v5;
        if (v16 <= 0.0) {
          float v16 = 0.0;
        }
        float v17 = v15 / v5;
        if (v17 > 1.0) {
          float v17 = 1.0;
        }
        return LODWORD(v16) | ((unint64_t)LODWORD(v17) << 32);
      }
    }
  }
  return result;
}

BOOL sub_B4E8(float32x2_t a1, float32x2_t a2, float32x2_t a3, float a4, float a5)
{
  float32x2_t v5 = vsub_f32(a1, a2);
  float v6 = vaddv_f32(vmul_f32(v5, a3));
  if (v6 <= 0.0 || v6 >= a4) {
    return 0;
  }
  float32x2_t v9 = vmul_f32(v5, (float32x2_t)vrev64_s32((int32x2_t)a3));
  return fabsf(vsub_f32(v9, (float32x2_t)vdup_lane_s32((int32x2_t)v9, 1)).f32[0]) < a5;
}

unint64_t sub_B528(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    float v2 = *(float *)(a1 + 32);
    uint64_t v3 = v1 - 1;
    if (v1 != 1)
    {
      float32x2_t v4 = (float *)(a1 + 36);
      do
      {
        float v5 = *v4++;
        float v6 = v5;
        if (v5 < v2) {
          float v2 = v6;
        }
        --v3;
      }
      while (v3);
    }
    uint64_t v7 = LODWORD(v2);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7 | ((unint64_t)(v1 == 0) << 32);
}

unint64_t sub_B580(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    float v2 = *(float *)(a1 + 32);
    uint64_t v3 = v1 - 1;
    if (v1 != 1)
    {
      float32x2_t v4 = (float *)(a1 + 36);
      do
      {
        float v5 = *v4++;
        float v6 = v5;
        if (v2 < v5) {
          float v2 = v6;
        }
        --v3;
      }
      while (v3);
    }
    uint64_t v7 = LODWORD(v2);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7 | ((unint64_t)(v1 == 0) << 32);
}

uint64_t sub_B5D8(float32x2_t a1, float a2, float a3, float a4, double a5, float a6)
{
  float v8 = a2;
  float32x2_t v9 = a1;
  float32x2_t v10 = vmul_n_f32(a1, a2);
  float v11 = vmuls_lane_f32(*(float *)&a5, a1, 1);
  float v12 = vmuls_lane_f32(v9.f32[0], *(float32x2_t *)&a5, 1);
  float v13 = v11 - v12;
  float v14 = a3 / a6;
  if ((float)(v11 - v12) != 0.0)
  {
    if ((float)(v11 - v12) <= 0.0) {
      float v15 = -a4;
    }
    else {
      float v15 = a4;
    }
    v16.i32[1] = v9.i32[1];
    v16.f32[0] = -v9.f32[0];
    float32x2_t v17 = (float32x2_t)vrev64_s32((int32x2_t)vmul_n_f32(v16, v15));
    float32x2_t v30 = v9;
    double v31 = a5;
    float v29 = v8;
    unint64_t v18 = sub_AD28(0, (int32x2_t)vmul_n_f32(*(float32x2_t *)&a5, a6), (int32x2_t)v17, (int32x2_t)vadd_f32(v10, v17));
    float v8 = v29;
    float32x2_t v9 = v30;
    a5 = v31;
    float v19 = *(float *)&v18;
    if (v14 > *(float *)&v18) {
      float v19 = v14;
    }
    if ((v18 & 0x100000000) == 0) {
      float v14 = v19;
    }
  }
  float32x2_t v20 = vmul_f32(v10, *(float32x2_t *)&a5);
  float32x2_t v21 = vadd_f32(v20, (float32x2_t)vdup_lane_s32((int32x2_t)v20, 1));
  float v22 = (float)(v8 * v8) - vmul_f32(v21, v21).f32[0];
  if (v22 >= (float)(a3 * a3)) {
    return LODWORD(v14) | 0x3F80000000000000;
  }
  float v23 = v21.f32[0] - sqrtf((float)(a3 * a3) - v22);
  uint64_t v24 = v23 <= a6 ? COERCE_UNSIGNED_INT(fminf(v23 / a6, 1.0)) : 1065353216;
  if ((float)(vmul_f32(v9, *(float32x2_t *)&a5).f32[0] + (float)(v9.f32[1] * *((float *)&a5 + 1))) < 0.0) {
    return LODWORD(v14) | 0x3F80000000000000;
  }
  float v26 = *(float *)&v24;
  float v27 = fabsf(v13) * (float)(*(float *)&v24 * a6);
  unint64_t v28 = LODWORD(v14) | (unint64_t)(v24 << 32);
  if (v27 <= a4) {
    unint64_t v28 = 0;
  }
  if (v14 < v26) {
    return v28;
  }
  else {
    return 0;
  }
}

char *sub_B75C(float32x2_t a1, float a2, float a3, float a4, float a5, double a6, float a7, float a8)
{
  double v13 = COERCE_DOUBLE(vmul_n_f32(a1, a4 - a5));
  double v14 = COERCE_DOUBLE(vmul_n_f32(a1, a4));
  float v70 = a4 - a5;
  unint64_t v15 = sub_AE0C(0x100000000, v13, v14, a2, (int32x2_t)vmul_n_f32(*(float32x2_t *)&a6, -(float)(a4 - a5)), (int32x2_t)vmul_n_f32(*(float32x2_t *)&a6, -a8));
  if (v16 == -1 || (v16 & 1) == 0)
  {
    unint64_t v18 = sub_BD14(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
    unint64_t v20 = *((void *)v18 + 2);
    unint64_t v19 = *((void *)v18 + 3);
    unint64_t v21 = v20 + 1;
    if (v20 >= v19 >> 1) {
      unint64_t v18 = sub_BD14((char *)(v19 > 1), v20 + 1, 1, v18);
    }
    float v22 = v70;
    float v23 = v70 - a8;
    float v24 = (float)(v70 - a8) * 0.0;
  }
  else
  {
    float v25 = *((float *)&v15 + 1);
    float v26 = sub_BD14(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
    unint64_t v18 = v26;
    unint64_t v20 = *((void *)v26 + 2);
    unint64_t v27 = *((void *)v26 + 3);
    unint64_t v21 = v20 + 1;
    if (v20 >= v27 >> 1) {
      unint64_t v18 = sub_BD14((char *)(v27 > 1), v20 + 1, 1, v26);
    }
    float v22 = v70;
    float v23 = v70 - a8;
    float v24 = (float)(v70 - a8) * v25;
  }
  *((void *)v18 + 2) = v21;
  unint64_t v28 = &v18[12 * v20];
  *((void *)v28 + 4) = COERCE_UNSIGNED_INT(v24 - v22) | ((unint64_t)COERCE_UNSIGNED_INT(v23 - v22) << 32);
  v28[40] = 1;
  uint64_t v29 = sub_B5D8(a1, v22, a2, a3, COERCE_DOUBLE(vsub_f32(0, *(float32x2_t *)&a6)), v22);
  uint64_t v31 = v29;
  if (v30 == -1)
  {
    unint64_t v39 = *((void *)v18 + 3);
    if (v21 >= v39 >> 1) {
      unint64_t v18 = sub_BD14((char *)(v39 > 1), v21 + 1, 1, v18);
    }
    *((void *)v18 + 2) = v21 + 1;
    unint64_t v40 = &v18[12 * v21];
    *((void *)v40 + 4) = v31;
    unint64_t v38 = v40 + 32;
    char v34 = -1;
    float v36 = v70;
  }
  else
  {
    float v32 = 0.0 - (float)(v70 * *(float *)&v29);
    if (v30) {
      unint64_t v33 = LODWORD(v32) | ((unint64_t)COERCE_UNSIGNED_INT(0.0 - (float)(v70 * *((float *)&v29 + 1))) << 32);
    }
    else {
      unint64_t v33 = LODWORD(v32);
    }
    char v34 = (v30 & 1) != 0;
    unint64_t v35 = *((void *)v18 + 3);
    if (v21 >= v35 >> 1)
    {
      v67 = sub_BD14((char *)(v35 > 1), v21 + 1, 1, v18);
      float v36 = v70;
      unint64_t v18 = v67;
    }
    else
    {
      float v36 = v70;
    }
    *((void *)v18 + 2) = v21 + 1;
    unint64_t v37 = &v18[12 * v21];
    *((void *)v37 + 4) = v33;
    unint64_t v38 = v37 + 32;
  }
  v38[8] = v34;
  uint64_t v41 = sub_B5D8(a1, v36, a2, a3, a6, v36);
  uint64_t v43 = v41;
  if (v42 == -1)
  {
    unint64_t v53 = *((void *)v18 + 2);
    unint64_t v52 = *((void *)v18 + 3);
    if (v53 >= v52 >> 1) {
      unint64_t v18 = sub_BD14((char *)(v52 > 1), v53 + 1, 1, v18);
    }
    *((void *)v18 + 2) = v53 + 1;
    float v54 = &v18[12 * v53];
    *((void *)v54 + 4) = v43;
    unint64_t v51 = v54 + 32;
    char v46 = -1;
    float v49 = v70;
  }
  else
  {
    float v44 = (float)(v70 * *(float *)&v41) + 0.0;
    if (v42) {
      unint64_t v45 = LODWORD(v44) | ((unint64_t)COERCE_UNSIGNED_INT((float)(v70 * *((float *)&v41 + 1)) + 0.0) << 32);
    }
    else {
      unint64_t v45 = LODWORD(v44);
    }
    char v46 = (v42 & 1) != 0;
    unint64_t v48 = *((void *)v18 + 2);
    unint64_t v47 = *((void *)v18 + 3);
    if (v48 >= v47 >> 1)
    {
      unsigned int v68 = sub_BD14((char *)(v47 > 1), v48 + 1, 1, v18);
      float v49 = v70;
      unint64_t v18 = v68;
    }
    else
    {
      float v49 = v70;
    }
    *((void *)v18 + 2) = v48 + 1;
    unint64_t v50 = &v18[12 * v48];
    *((void *)v50 + 4) = v45;
    unint64_t v51 = v50 + 32;
  }
  v51[8] = v46;
  unint64_t v55 = sub_AE0C(0x100000000, v13, v14, a2, (int32x2_t)vmul_n_f32(*(float32x2_t *)&a6, v49), (int32x2_t)vmul_n_f32(*(float32x2_t *)&a6, a7));
  if (v56 == -1 || (v56 & 1) == 0)
  {
    unint64_t v59 = *((void *)v18 + 2);
    unint64_t v64 = *((void *)v18 + 3);
    unint64_t v60 = v59 + 1;
    if (v59 >= v64 >> 1) {
      unint64_t v18 = sub_BD14((char *)(v64 > 1), v59 + 1, 1, v18);
    }
    float v61 = v70;
    float v62 = a7 - v70;
    float v63 = (float)(a7 - v70) * 0.0;
  }
  else
  {
    float v57 = *((float *)&v55 + 1);
    unint64_t v59 = *((void *)v18 + 2);
    unint64_t v58 = *((void *)v18 + 3);
    unint64_t v60 = v59 + 1;
    if (v59 >= v58 >> 1) {
      unint64_t v18 = sub_BD14((char *)(v58 > 1), v59 + 1, 1, v18);
    }
    float v61 = v70;
    float v62 = a7 - v70;
    float v63 = (float)(a7 - v70) * v57;
  }
  *((void *)v18 + 2) = v60;
  uint64_t v65 = &v18[12 * v59];
  *((void *)v65 + 4) = COERCE_UNSIGNED_INT(v61 + v63) | ((unint64_t)COERCE_UNSIGNED_INT(v61 + v62) << 32);
  v65[40] = 1;
  return v18;
}

char *sub_BC04(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_BE38(&qword_2A318);
      float32x2_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      double v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      float32x2_t v10 = (char *)&_swiftEmptyArrayStorage;
      double v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_BF8C(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_BD14(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_BE38(&qword_2A310);
      float32x2_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 12);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[12 * v8 + 32]) {
          memmove(v12, a4 + 32, 12 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      float32x2_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_C078(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_BE38(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_BE7C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_BE38(&qword_2A320);
      float32x2_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      double v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      float32x2_t v10 = _swiftEmptyArrayStorage;
      double v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_C16C(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_BF8C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_14FF0();
  __break(1u);
  return result;
}

char *sub_C078(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 12 * a1 + 32);
    size_t v6 = 12 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_14FF0();
  __break(1u);
  return result;
}

char *sub_C16C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_14FF0();
  __break(1u);
  return result;
}

void type metadata accessor for CGColor(uint64_t a1)
{
}

void sub_C26C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for LineIntersection(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for LineIntersection(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LineIntersection(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_C354(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_C360(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LineIntersection()
{
  return &type metadata for LineIntersection;
}

uint64_t sub_C37C()
{
  uint64_t v0 = sub_14EE0();
  sub_C400(v0, qword_2B4C8);
  sub_C464(v0, (uint64_t)qword_2B4C8);
  return sub_14ED0();
}

uint64_t *sub_C400(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_C464(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

float sub_C620(void *a1)
{
  double v10 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  uint64_t v7 = 0;
  [a1 getRed:&v10 green:&v9 blue:&v8 alpha:&v7];
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad_renderer);
  if (v3)
  {
    *(float *)&unsigned int v4 = v10;
    *(float *)&unsigned int v5 = v9;
    *(void *)&long long v6 = __PAIR64__(v5, v4);
    float result = v8;
    *((void *)&v6 + 1) = LODWORD(result);
    *(_OWORD *)(v3 + 112) = v6;
  }
  return result;
}

id sub_CA80()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NTKGladiusQuad();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_CB10()
{
  return type metadata accessor for NTKGladiusQuad();
}

uint64_t type metadata accessor for NTKGladiusQuad()
{
  uint64_t result = qword_2A3D8;
  if (!qword_2A3D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_CB64()
{
  sub_CC14();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_CC14()
{
  if (!qword_2A590)
  {
    type metadata accessor for GladiusUtilities.DateOverride();
    unint64_t v0 = sub_14F60();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2A590);
    }
  }
}

id sub_CC6C()
{
  uint64_t v1 = v0;
  id v2 = [self currentDevice];
  uint64_t v3 = self;
  id result = [v3 defaultHourConfigurationForDevice:v2];
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  unsigned int v5 = result;
  id result = [v3 defaultMinuteConfigurationForDevice:v2];
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  long long v6 = result;
  id result = [v3 defaultSecondConfigurationForDevice:v2];
  if (!result)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v7 = result;
  [v5 handWidth];
  double v9 = v8;
  [v5 armLength];
  float v11 = v9 + v10;
  [v5 handLength];
  float v13 = v12 - v9;
  [v6 handLength];
  *(float *)&double v9 = v14 - v9;
  [v5 handWidth];
  *(float *)&double v15 = v15 * 0.5;
  float v16 = *(float *)&v15 + -2.0;
  [v5 armWidth];
  float v18 = v17 * 0.5;
  [v7 handLength];
  float v20 = v19;
  [v7 tailLength];
  *(float *)&double v21 = v21;
  double v22 = *(double *)(v1 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad_screenSize);
  float v23 = *(double *)(v1 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad_screenSize + 8) / v22;
  *(float *)float v25 = v11;
  *(float *)&v25[1] = v13;
  v25[2] = LODWORD(v9);
  *(float *)&v25[3] = v16;
  *(float *)&v25[4] = v18;
  *(float *)&v25[5] = v20;
  *(float *)&double v22 = v22 * 0.5;
  v25[6] = LODWORD(v21);
  *(float *)&v25[7] = v23;
  v25[8] = LODWORD(v22);
  type metadata accessor for GladiusRenderer();
  swift_allocObject();
  sub_14600((uint64_t)v25);
  *(void *)(v1 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad_renderer) = v24;

  return (id)swift_release();
}

uint64_t sub_CEB0()
{
  uint64_t v1 = sub_BE38((uint64_t *)&unk_2A5A0);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  unsigned int v4 = &v22[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  long long v6 = &v22[-v5];
  uint64_t v7 = *(float **)(v0 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad_renderer);
  if (!v7) {
    return v7 != 0;
  }
  uint64_t v8 = v0 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad_dateOverride;
  swift_beginAccess();
  sub_D0FC(v8, (uint64_t)v4, (uint64_t *)&unk_2A5A0);
  swift_retain();
  sub_E49C((uint64_t)v6, (uint64_t)v4);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  sub_D160((uint64_t)v4, (uint64_t *)&unk_2A5A0);
  sub_D0FC((uint64_t)v6, (uint64_t)v4, (uint64_t *)&unk_2A5A0);
  swift_beginAccess();
  sub_D094((uint64_t)v4, v8);
  swift_endAccess();
  float v15 = v10;
  float v16 = v12;
  v7[16] = 1.5708 - v15;
  v7[17] = 1.5708 - v16;
  float v17 = v14;
  v7[18] = 1.5708 - v17;
  uint64_t result = swift_unknownObjectUnownedLoadStrong();
  if (result)
  {
    double v19 = (void *)result;
    sub_14104(v14);
    double v21 = v20;

    *(float *)&double v21 = v21;
    sub_D160((uint64_t)v6, (uint64_t *)&unk_2A5A0);
    v7[24] = *(float *)&v21 * 1.5;
    swift_release();
    return v7 != 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_D094(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_BE38((uint64_t *)&unk_2A5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_D0FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_BE38(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_D160(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_BE38(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

ValueMetadata *type metadata accessor for GladiusUtilities()
{
  return &type metadata for GladiusUtilities;
}

void *sub_D1CC(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (void *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v7 = sub_14E60();
    uint64_t v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    if (EnumCaseMultiPayload == 1)
    {
      double v9 = (int *)sub_BE38(&qword_2A3F0);
      v8((void *)((char *)a1 + v9[12]), (void *)((char *)a2 + v9[12]), v7);
      *(void *)((char *)a1 + v9[16]) = *(void *)((char *)a2 + v9[16]);
      *(void *)((char *)a1 + v9[20]) = *(void *)((char *)a2 + v9[20]);
      *((unsigned char *)a1 + v9[24]) = *((unsigned char *)a2 + v9[24]);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_D328(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v3 = sub_14E60();
  long long v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  uint64_t result = v6(a1, v3);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = a1 + *(int *)(sub_BE38(&qword_2A3F0) + 48);
    return v6(v5, v3);
  }
  return result;
}

uint64_t sub_D3F0(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = sub_14E60();
  long long v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  v6(a1, a2, v5);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = (int *)sub_BE38(&qword_2A3F0);
    v6(a1 + v7[12], a2 + v7[12], v5);
    *(void *)(a1 + v7[16]) = *(void *)(a2 + v7[16]);
    *(void *)(a1 + v7[20]) = *(void *)(a2 + v7[20]);
    *(unsigned char *)(a1 + v7[24]) = *(unsigned char *)(a2 + v7[24]);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_D4F4(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_D608(a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v5 = sub_14E60();
    long long v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
    v6(a1, a2, v5);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = (int *)sub_BE38(&qword_2A3F0);
      v6(a1 + v7[12], a2 + v7[12], v5);
      *(void *)(a1 + v7[16]) = *(void *)(a2 + v7[16]);
      *(void *)(a1 + v7[20]) = *(void *)(a2 + v7[20]);
      *(unsigned char *)(a1 + v7[24]) = *(unsigned char *)(a2 + v7[24]);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_D608(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GladiusUtilities.DateOverride();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for GladiusUtilities.DateOverride()
{
  uint64_t result = qword_2A468;
  if (!qword_2A468) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_D6B0(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = sub_14E60();
  long long v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);
  v6(a1, a2, v5);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = (int *)sub_BE38(&qword_2A3F0);
    v6(a1 + v7[12], a2 + v7[12], v5);
    *(void *)(a1 + v7[16]) = *(void *)(a2 + v7[16]);
    *(void *)(a1 + v7[20]) = *(void *)(a2 + v7[20]);
    *(unsigned char *)(a1 + v7[24]) = *(unsigned char *)(a2 + v7[24]);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_D7B4(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_D608(a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v5 = sub_14E60();
    long long v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);
    v6(a1, a2, v5);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = (int *)sub_BE38(&qword_2A3F0);
      v6(a1 + v7[12], a2 + v7[12], v5);
      *(void *)(a1 + v7[16]) = *(void *)(a2 + v7[16]);
      *(void *)(a1 + v7[20]) = *(void *)(a2 + v7[20]);
      *(unsigned char *)(a1 + v7[24]) = *(unsigned char *)(a2 + v7[24]);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_D8C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_D8F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_D91C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_D92C()
{
  uint64_t result = sub_14E60();
  if (v1 <= 0x3F)
  {
    uint64_t v3 = *(void *)(result - 8) + 64;
    swift_getTupleTypeLayout();
    uint64_t v4 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_D9F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v111 = a2;
  uint64_t v112 = a1;
  uint64_t v109 = a3;
  sub_BE38((uint64_t *)&unk_2A5A0);
  ((void (*)(void))__chkstk_darwin)();
  v106 = (uint64_t *)((char *)&v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_BE38(&qword_2A3E8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v103 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  v101 = (char *)&v92 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v102 = (uint64_t)&v92 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  v105 = (char *)&v92 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v104 = (int *)((char *)&v92 - v15);
  __chkstk_darwin(v14);
  float v17 = (char *)&v92 - v16;
  uint64_t v18 = sub_14E60();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v110 = v19;
  uint64_t v20 = __chkstk_darwin(v18);
  double v22 = (char *)&v92 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v20);
  float v25 = (char *)&v92 - v24;
  uint64_t v26 = __chkstk_darwin(v23);
  unint64_t v28 = (char *)&v92 - v27;
  __chkstk_darwin(v26);
  char v30 = (char *)&v92 - v29;
  uint64_t v31 = type metadata accessor for GladiusUtilities.DateOverride();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v34 = __chkstk_darwin(v33);
  uint64_t v35 = __chkstk_darwin(v34);
  unint64_t v37 = (char *)&v92 - v36;
  __chkstk_darwin(v35);
  v107 = (char *)&v92 - v40;
  uint64_t v108 = v32;
  if (a4 == 0.0)
  {
    sub_D160(v112, (uint64_t *)&unk_2A5A0);
    sub_ED38(v111, (uint64_t)v17, &qword_2A3E8);
    uint64_t v41 = v110;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v110 + 48))(v17, 1, v18) == 1)
    {
      uint64_t v42 = v109;
LABEL_14:
      sub_D160((uint64_t)v17, &qword_2A3E8);
      uint64_t v58 = 1;
      uint64_t v59 = v108;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56))(v42, v58, 1, v31);
    }
    unint64_t v50 = *(void (**)(char *, char *, uint64_t))(v41 + 32);
    v50(v30, v17, v18);
    uint64_t v51 = (uint64_t)v107;
    v50(v107, v30, v18);
    swift_storeEnumTagMultiPayload();
    goto LABEL_18;
  }
  uint64_t v43 = v104;
  float v17 = v105;
  uint64_t v97 = v38;
  uint64_t v98 = v19;
  uint64_t v95 = v39;
  v96 = v28;
  v99 = v25;
  v100 = v22;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  unint64_t v45 = (void (*)(void, void, void, void))v106;
  sub_D0FC(v112, (uint64_t)v106, (uint64_t *)&unk_2A5A0);
  if ((*(unsigned int (**)(void (*)(void, void, void, void), uint64_t, uint64_t))(v32 + 48))(v45, 1, v31) == 1)
  {
    sub_D160((uint64_t)v45, (uint64_t *)&unk_2A5A0);
    uint64_t v46 = v110;
    uint64_t v47 = (uint64_t)v43;
    uint64_t v48 = v18;
    v106 = *(void **)(v110 + 56);
    ((void (*)(int *, uint64_t, uint64_t, uint64_t))v106)(v43, 1, 1, v18);
    float v49 = v100;
LABEL_12:
    sub_D160(v47, &qword_2A3E8);
    uint64_t v56 = v111;
    sub_D0FC(v111, (uint64_t)v17, &qword_2A3E8);
    float v57 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48);
    if (v57(v17, 1, v48) == 1)
    {
      sub_D160(v112, (uint64_t *)&unk_2A5A0);
      sub_D160(v56, &qword_2A3E8);
      uint64_t v42 = v109;
      goto LABEL_14;
    }
    uint64_t v60 = v48;
    uint64_t v94 = v31;
    uint64_t v48 = v46 + 32;
    float v61 = *(void (**)(char *, char *, uint64_t))(v46 + 32);
    v61(v99, v17, v60);
    id v62 = [self faceDate];
    if (v62)
    {
      float v63 = v62;
      sub_14E50();

      unint64_t v64 = v49;
      uint64_t v65 = v103;
      v61(v103, v64, v60);
      ((void (*)(char *, void, uint64_t, uint64_t))v106)(v65, 0, 1, v60);
      if (v57(v65, 1, v60) != 1)
      {
        uint64_t v66 = (int *)sub_BE38(&qword_2A3F0);
        uint64_t v67 = v95;
        uint64_t v68 = v95 + v66[12];
        uint64_t v69 = v66[16];
        uint64_t v70 = v66[20];
        uint64_t v71 = v66[24];
        sub_D160(v112, (uint64_t *)&unk_2A5A0);
        v61((char *)v67, v65, v60);
        v61((char *)v68, v99, v60);
        *(CFAbsoluteTime *)(v67 + v69) = Current;
        *(double *)(v67 + v70) = a4;
        sub_D160(v56, &qword_2A3E8);
        *(unsigned char *)(v67 + v71) = 1;
        uint64_t v31 = v94;
        swift_storeEnumTagMultiPayload();
        uint64_t v72 = v67;
        uint64_t v51 = (uint64_t)v107;
        sub_EC70(v72, (uint64_t)v107);
LABEL_18:
        uint64_t v59 = v108;
        uint64_t v42 = v109;
LABEL_19:
        sub_EC70(v51, v42);
        uint64_t v58 = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56))(v42, v58, 1, v31);
      }
    }
    else
    {
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v106)(v103, 1, 1, v60);
    }
    __break(1u);
    goto LABEL_29;
  }
  sub_ECD4((uint64_t)v45, (uint64_t)v37);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v48 = v18;
  unint64_t v53 = v100;
  if (EnumCaseMultiPayload == 1)
  {
    float v54 = &v37[*(int *)(sub_BE38(&qword_2A3F0) + 48)];
    uint64_t v46 = v110;
    v93 = *(void (**)(int *, char *, uint64_t))(v110 + 32);
    v93(v43, v54, v48);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v37, v48);
  }
  else
  {
    uint64_t v46 = v110;
    v93 = *(void (**)(int *, char *, uint64_t))(v110 + 32);
    v93(v43, v37, v48);
  }
  sub_D608((uint64_t)v45);
  v106 = *(void **)(v46 + 56);
  ((void (*)(int *, void, uint64_t, uint64_t))v106)(v43, 0, 1, v48);
  uint64_t v47 = (uint64_t)v43;
  unint64_t v55 = *(unsigned int (**)(int *, uint64_t, uint64_t))(v46 + 48);
  if (v55(v43, 1, v48) == 1)
  {
    float v49 = v53;
    goto LABEL_12;
  }
  float v74 = v96;
  v75 = (void (*)(char *, uint64_t, uint64_t))v93;
  v93((int *)v96, (char *)v47, v48);
  v104 = (int *)sub_BE38(&qword_2A3F0);
  v105 = (char *)(v97 + v104[12]);
  (*(void (**)(void))(v46 + 16))();
  uint64_t v76 = v102;
  sub_D0FC(v111, v102, &qword_2A3E8);
  unsigned int v77 = v55((int *)v76, 1, v48);
  uint64_t v94 = v31;
  if (v77 != 1)
  {
    v84 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v55;
    sub_D160(v112, (uint64_t *)&unk_2A5A0);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v74, v48);
    v75(v105, v76, v48);
    goto LABEL_26;
  }
  v78 = (void (*)(char *, char *, uint64_t))v75;
  id v79 = [self faceDate];
  if (!v79)
  {
LABEL_29:
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v106)(v101, 1, 1, v48);
    goto LABEL_30;
  }
  v80 = v79;
  v81 = v100;
  sub_14E50();

  v82 = v101;
  v78(v101, v81, v48);
  ((void (*)(char *, void, uint64_t, uint64_t))v106)(v82, 0, 1, v48);
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v55)(v82, 1, v48);
  v83 = v96;
  if (result != 1)
  {
    v84 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v55;
    sub_14E40();
    sub_D160(v112, (uint64_t *)&unk_2A5A0);
    v85 = *(void (**)(char *, uint64_t))(v110 + 8);
    v85(v83, v48);
    v85(v82, v48);
    sub_D160(v102, &qword_2A3E8);
LABEL_26:
    uint64_t v59 = v108;
    uint64_t v42 = v109;
    uint64_t v86 = v111;
    uint64_t v51 = (uint64_t)v107;
    v87 = v104;
    uint64_t v88 = v104[20];
    uint64_t v89 = v97;
    *(CFAbsoluteTime *)(v97 + v104[16]) = Current;
    *(double *)(v89 + v88) = a4;
    BOOL v90 = v84(v86, 1, v48) != 1;
    uint64_t v91 = v87[24];
    sub_D160(v86, &qword_2A3E8);
    *(unsigned char *)(v89 + v91) = v90;
    uint64_t v31 = v94;
    swift_storeEnumTagMultiPayload();
    sub_EC70(v89, v51);
    goto LABEL_19;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_E49C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_BE38(&qword_2A3E8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v51[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_14E60();
  uint64_t v58 = *(void *)(v7 - 8);
  uint64_t v59 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  float v57 = &v51[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v56 = &v51[-v11];
  __chkstk_darwin(v10);
  uint64_t v13 = &v51[-v12];
  uint64_t v14 = sub_BE38((uint64_t *)&unk_2A5A0);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  float v54 = &v51[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v15);
  uint64_t v18 = &v51[-v17];
  uint64_t v19 = type metadata accessor for GladiusUtilities.DateOverride();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v23 = &v51[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v21);
  float v25 = &v51[-v24];
  uint64_t v55 = a1;
  sub_D0FC(a2, a1, (uint64_t *)&unk_2A5A0);
  sub_D0FC(a2, (uint64_t)v18, (uint64_t *)&unk_2A5A0);
  uint64_t v53 = v20;
  uint64_t v26 = v20;
  uint64_t v27 = v19;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v26 + 48))(v18, 1, v19) == 1)
  {
    sub_D160((uint64_t)v18, (uint64_t *)&unk_2A5A0);
    id v28 = [self faceDate];
    if (v28)
    {
      uint64_t v29 = v28;
      sub_14E50();

      uint64_t v31 = v58;
      uint64_t v30 = v59;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v58 + 32))(v6, v13, v59);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v31 + 56))(v6, 0, 1, v30);
      uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v31 + 48))(v6, 1, v30);
      if (result != 1)
      {
        sub_EB30();
        return (*(uint64_t (**)(unsigned char *, uint64_t))(v31 + 8))(v6, v30);
      }
    }
    else
    {
      uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v58 + 56))(v6, 1, 1, v59);
    }
    __break(1u);
  }
  else
  {
    sub_EC70((uint64_t)v18, (uint64_t)v25);
    sub_ECD4((uint64_t)v25, (uint64_t)v23);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v33 = (int *)sub_BE38(&qword_2A3F0);
      uint64_t v34 = &v23[v33[12]];
      double v35 = *(double *)&v23[v33[16]];
      double v36 = *(double *)&v23[v33[20]];
      int v52 = v23[v33[24]];
      uint64_t v37 = v58;
      uint64_t v38 = v59;
      uint64_t v39 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v58 + 32);
      uint64_t v40 = v56;
      v39(v56, v23, v59);
      uint64_t v41 = v57;
      v39(v57, v34, v38);
      sub_EB30();
      sub_EB30();
      id v42 = [self functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
      CFAbsoluteTime v44 = (CFAbsoluteTimeGetCurrent() - v35) / v36;
      float v43 = v44;
      *(float *)&CFAbsoluteTime v44 = fminf(v43, 1.0);
      if (*(float *)&v44 < 0.0) {
        *(float *)&CFAbsoluteTime v44 = 0.0;
      }
      [v42 _solveForInput:v44];
      CLKInterpolateShortestPathBetweenAnglesUnclipped();
      CLKInterpolateShortestPathBetweenAnglesUnclipped();
      CLKInterpolateShortestPathBetweenAnglesUnclipped();

      unint64_t v45 = *(void (**)(unsigned char *, uint64_t))(v37 + 8);
      v45(v40, v38);
      sub_D608((uint64_t)v25);
      if (v43 >= 1.0)
      {
        uint64_t v48 = v55;
        sub_D160(v55, (uint64_t *)&unk_2A5A0);
        if (v52)
        {
          uint64_t v49 = (uint64_t)v54;
          v39(v54, v57, v38);
          swift_storeEnumTagMultiPayload();
          uint64_t v50 = 0;
        }
        else
        {
          v45(v57, v38);
          uint64_t v50 = 1;
          uint64_t v49 = (uint64_t)v54;
        }
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v53 + 56))(v49, v50, 1, v27);
        return sub_ED38(v49, v48, (uint64_t *)&unk_2A5A0);
      }
      else
      {
        return ((uint64_t (*)(unsigned char *, uint64_t))v45)(v41, v38);
      }
    }
    else
    {
      uint64_t v47 = v58;
      uint64_t v46 = v59;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v58 + 32))(v13, v23, v59);
      sub_EB30();
      (*(void (**)(unsigned char *, uint64_t))(v47 + 8))(v13, v46);
      return sub_D608((uint64_t)v25);
    }
  }
  return result;
}

double sub_EB30()
{
  uint64_t v0 = sub_14EA0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7[1] = 0;
  double v8 = 0.0;
  v7[0] = 0;
  Class isa = sub_14E30().super.isa;
  sub_14E80();
  Class v5 = sub_14E70().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  NTKHourMinuteSecondAnglesForTime();

  return v8;
}

uint64_t sub_EC70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GladiusUtilities.DateOverride();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_ECD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GladiusUtilities.DateOverride();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_ED38(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_BE38(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

Class sub_EDF0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  sub_14068(0, a4);
  swift_bridgeObjectRetain();
  v4.super.Class isa = sub_14F10().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

uint64_t sub_EE74(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, void *a6)
{
  sub_14068(0, a4);
  *(void *)(a1 + *a6) = sub_14F20();

  return swift_bridgeObjectRelease();
}

uint64_t sub_EF98(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v41 = a5;
  uint64_t v10 = sub_14E60();
  uint64_t v42 = *(void *)(v10 - 8);
  uint64_t v43 = v10;
  __chkstk_darwin(v10);
  uint64_t v38 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_BE38(&qword_2A3E8);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v40 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v39 = (char *)&v38 - v15;
  uint64_t v16 = (void *)(v5
                 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors);
  uint64_t v18 = *(void *)(v5
                  + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors);
  uint64_t v17 = *(void **)(v5
                 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors
                 + 8);
  uint64_t v19 = *(void **)(v5
                 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors
                 + 16);
  uint64_t v20 = *(void **)(v5
                 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors
                 + 24);
  uint64_t v21 = *(void **)(v5
                 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors
                 + 32);
  *uint64_t v16 = a1;
  v16[1] = a2;
  v16[2] = a3;
  v16[3] = a4;
  uint64_t v22 = v41;
  v16[4] = v41;
  swift_bridgeObjectRetain();
  id v23 = a2;
  id v24 = a3;
  id v25 = a4;
  id v26 = v22;
  sub_14000(v18, v17, v19, v20, v21);
  if (*(unsigned char *)(v5
                + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_hasActiveTimeAnimations) != 1)
    goto LABEL_5;
  id v27 = [self faceDate];
  if (!v27)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56))(v39, 1, 1, v43);
    goto LABEL_9;
  }
  id v28 = v27;
  uint64_t v29 = v38;
  sub_14E50();

  uint64_t v30 = v42;
  uint64_t v31 = (uint64_t)v39;
  uint64_t v32 = v29;
  uint64_t v33 = v43;
  (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v39, v32, v43);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v30 + 56))(v31, 0, 1, v33);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v31, 1, v33);
  if (result == 1)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  sub_F39C(v31);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v31, v33);
LABEL_5:
  sub_11264();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    double v35 = (void *)result;
    uint64_t v36 = (uint64_t)v40;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56))(v40, 1, 1, v43);
    double v37 = sub_12990(v36);
    sub_D160(v36, &qword_2A3E8);
    [v35 lightSpillCoordinator:v5 wantsUpdateForAngle:v37];
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_F39C(uint64_t a1)
{
  uint64_t v3 = sub_BE38(&qword_2A3E8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v126 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (void *)(v1 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors);
  uint64_t v7 = *(void *)(v1
                 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors);
  if (!v7)
  {
LABEL_21:
    os_log_t v144 = (os_log_t)sub_14EC0();
    os_log_type_t v51 = sub_14F40();
    if (os_log_type_enabled(v144, v51))
    {
      int v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v52 = 0;
      _os_log_impl(&dword_0, v144, v51, "trying to start ticks animation with no palette!", v52, 2u);
      swift_slowDealloc();
    }
    os_log_t v53 = v144;

    return;
  }
  uint64_t v9 = (void *)v6[3];
  double v8 = (void *)v6[4];
  uint64_t v11 = (void *)v6[1];
  uint64_t v10 = (void *)v6[2];
  uint64_t v12 = sub_14E60();
  uint64_t v141 = v1;
  uint64_t v138 = v7;
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, a1, v12);
  uint64_t v15 = v13;
  uint64_t v16 = v138;
  uint64_t v17 = v141;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v15);
  swift_bridgeObjectRetain();
  id v142 = v11;
  os_log_t v144 = v10;
  id v18 = v9;
  id v19 = v8;
  double v20 = sub_12990((uint64_t)v5);
  sub_D160((uint64_t)v5, &qword_2A3E8);
  unint64_t v21 = *(void *)(v17
                  + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_majorHourLayers);
  if (v21 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v22 = (char *)sub_14FE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = *(char **)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
  }
  id v143 = v18;
  id v127 = v19;
  if (v22)
  {
    if ((uint64_t)v22 < 1)
    {
      __break(1u);
    }
    else
    {
      id v23 = *(void **)(v17
                     + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_fadeAnimationKey);
      uint64_t v135 = *(void *)(v17
                       + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_fadeAnimationKey
                       + 8);
      id v136 = v23;
      id v137 = (id)(v16 & 0xC000000000000001);
      if ((v16 & 0xC000000000000001) != 0
        || (unint64_t)(v22 - 1) < *(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFFF8)))
      {
        id v134 = self;
        uint64_t v24 = 0;
        unint64_t v133 = v21 & 0xC000000000000001;
        uint64_t v132 = OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_tickOverlayBrightness;
        double v25 = CLKUIAnalogHandsDurationForSecondsAnimation;
        v129 = (char *)&type metadata for Any + 8;
        id v131 = (id)v21;
        id v130 = v22;
        while (1)
        {
          id v35 = v133 ? (id)sub_14F80() : *(id *)(v21 + 8 * v24 + 32);
          id v140 = v35;
          NSString v36 = sub_14F00();
          id v37 = [v134 animationWithKeyPath:v36];

          [v37 setDuration:v25];
          LODWORD(v38) = 15.0;
          LODWORD(v39) = 30.0;
          LODWORD(v40) = 15.0;
          objc_msgSend(v37, "setPreferredFrameRateRange:", v38, v39, v40);
          sub_13BA0(v20, (double)v24 * 3.14159265 / 6.0);
          id v139 = v41;
          id v42 = v137 ? (id)sub_14F80() : *(id *)(v138 + 8 * v24 + 32);
          uint64_t v43 = v42;
          sub_14068(0, &qword_2A5B8);
          char v44 = sub_14F50();
          unint64_t v45 = self;
          id v46 = [v45 whiteColor];
          id v47 = (id)NTKInterpolateBetweenColors();

          if (!v47) {
            goto LABEL_66;
          }
          id v48 = v47;
          uint64_t v49 = v48;
          if (v44)
          {
            id v26 = v48;
            id v27 = v26;
          }
          else
          {
            id v50 = [v45 whiteColor];
            id v27 = (id)NTKInterpolateBetweenColors();

            if (!v27)
            {
              __break(1u);
              goto LABEL_21;
            }
          }
          ++v24;
          __chkstk_darwin(v26);
          v126[-6] = v43;
          v126[-5] = v49;
          LOBYTE(v126[-4]) = v44 & 1;
          v126[-3] = v28;
          v126[-2] = v27;
          uint64_t v29 = swift_bridgeObjectRetain();
          uint64_t v30 = sub_13DE0(v29, (uint64_t (*)(uint64_t, double))sub_13DDC);

          swift_bridgeObjectRelease_n();
          sub_104EC((uint64_t)v30);
          swift_bridgeObjectRelease();
          Class isa = sub_14F10().super.isa;
          swift_bridgeObjectRelease();
          [v37 setValues:isa];

          sub_14068(0, &qword_2A5C0);
          Class v32 = sub_14F10().super.isa;
          swift_bridgeObjectRelease();
          [v37 setKeyTimes:v32];

          NSString v33 = sub_14F00();
          id v34 = v140;
          [v140 addAnimation:v37 forKey:v33];

          unint64_t v21 = (unint64_t)v131;
          if (v130 == (id)v24) {
            goto LABEL_26;
          }
        }
      }
    }
    __break(1u);
    goto LABEL_64;
  }
LABEL_26:
  swift_bridgeObjectRelease();
  unint64_t v54 = *(void *)(v141
                  + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_minorMinuteLayers);
  if (v54 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v55 = (void *)sub_14FE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v55 = *(void **)((char *)&dword_10 + (v54 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
  }
  id v56 = v143;
  if (v55)
  {
    id v137 = self;
    id v136 = self;
    if ((uint64_t)v55 >= 1)
    {
      float v57 = 0;
      uint64_t v135 = *(void *)(v141 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_device);
      id v130 = *(id *)(v141
                   + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_fadeAnimationKey);
      v129 = *(char **)(v141
                      + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_fadeAnimationKey
                      + 8);
      id v134 = (id)(v54 & 0xC000000000000001);
      unint64_t v133 = OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_tickOverlayBrightness;
      double v58 = CLKUIAnalogHandsDurationForSecondsAnimation;
      v128 = (char *)&type metadata for Any + 8;
      id v131 = v55;
      uint64_t v132 = v54;
      while (1)
      {
        if (v134) {
          id v68 = (id)sub_14F80();
        }
        else {
          id v68 = *(id *)(v54 + 8 * (void)v57 + 32);
        }
        id v140 = v68;
        NSString v69 = sub_14F00();
        id v56 = [v137 animationWithKeyPath:v69];

        [v56 setDuration:v58];
        LODWORD(v70) = 15.0;
        LODWORD(v71) = 30.0;
        LODWORD(v72) = 15.0;
        objc_msgSend(v56, "setPreferredFrameRateRange:", v70, v71, v72);
        [v136 minorMinuteAngleAtIndex:v57 device:v135];
        sub_13BA0(v20, v73);
        id v139 = v74;
        sub_14068(0, &qword_2A5B8);
        char v75 = sub_14F50();
        uint64_t v76 = self;
        id v77 = [v76 whiteColor];
        id v78 = (id)NTKInterpolateBetweenColors();

        if (!v78) {
          goto LABEL_67;
        }
        id v79 = v78;
        v80 = v79;
        if (v75)
        {
          id v59 = v79;
          id v60 = v59;
          os_log_t v61 = v144;
        }
        else
        {
          id v81 = [v76 whiteColor];
          os_log_t v61 = v144;
          id v60 = (id)NTKInterpolateBetweenColors();

          if (!v60)
          {
            __break(1u);
            goto LABEL_40;
          }
        }
        float v57 = (char *)v57 + 1;
        __chkstk_darwin(v59);
        v126[-6] = v142;
        v126[-5] = v80;
        LOBYTE(v126[-4]) = v75 & 1;
        v126[-3] = v61;
        v126[-2] = v60;
        uint64_t v62 = swift_bridgeObjectRetain();
        float v63 = sub_13DE0(v62, (uint64_t (*)(uint64_t, double))sub_13DDC);

        swift_bridgeObjectRelease_n();
        sub_104EC((uint64_t)v63);
        swift_bridgeObjectRelease();
        Class v64 = sub_14F10().super.isa;
        swift_bridgeObjectRelease();
        [v56 setValues:v64];

        sub_14068(0, &qword_2A5C0);
        Class v65 = sub_14F10().super.isa;
        swift_bridgeObjectRelease();
        [v56 setKeyTimes:v65];

        NSString v66 = sub_14F00();
        id v67 = v140;
        [v140 addAnimation:v56 forKey:v66];

        id v56 = v143;
        unint64_t v54 = v132;
        if (v131 == v57) {
          goto LABEL_40;
        }
      }
    }
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
LABEL_40:
  swift_bridgeObjectRelease();
  v82 = self;
  id v83 = v127;
  id v127 = v82;
  id v84 = [v82 whiteColor];
  uint64_t v85 = v141;
  id v130 = (id)NTKInterpolateBetweenColors();
  id v131 = v83;

  unint64_t v86 = *(void *)(v85
                  + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_minorHourLayers);
  if (!(v86 >> 62))
  {
    uint64_t v87 = *(void *)((char *)&dword_10 + (v86 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    os_log_t v88 = v144;
    if (v87) {
      goto LABEL_42;
    }
LABEL_61:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(unsigned char *)(v141
             + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_hasActiveTimeAnimations) = 1;
    return;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v87 = sub_14FE0();
  swift_bridgeObjectRelease();
  os_log_t v88 = v144;
  if (!v87) {
    goto LABEL_61;
  }
LABEL_42:
  id v136 = self;
  if (v87 >= 1)
  {
    id v89 = 0;
    uint64_t v132 = v141 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_fadeAnimationKey;
    uint64_t v135 = *(void *)(v141 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_device);
    id v134 = (id)(v86 & 0xC000000000000001);
    double v90 = CLKUIAnalogHandsDurationForSecondsAnimation;
    v126[1] = (char *)&type metadata for Any + 8;
    v128 = (char *)0x8000000000019250;
    unint64_t v133 = v87;
    v129 = (char *)v86;
    while (1)
    {
      if (v134) {
        id v108 = (id)sub_14F80();
      }
      else {
        id v108 = *(id *)(v86 + 8 * (void)v89 + 32);
      }
      uint64_t v109 = v108;
      [v136 minorHourAngleAtIndex:v89 device:v135];
      uint64_t v111 = sub_13BA0(v20, v110);
      v113 = v112;
      self;
      if (swift_dynamicCastObjCClass())
      {
        id v139 = v109;
        id v140 = v89;
        id v137 = v113;
        NSString v91 = sub_14F00();
        id v92 = [self animationWithKeyPath:v91];

        id v93 = v131;
        swift_bridgeObjectRetain();
        id v94 = v142;
        uint64_t v95 = v88;
        id v96 = v56;
        id v97 = v130;
        id v98 = v92;
        v99 = sub_13EF8(v111);
        swift_bridgeObjectRelease();

        id v56 = v143;
        swift_bridgeObjectRelease();

        sub_1061C((unint64_t)v99);
        swift_bridgeObjectRelease();
        v100.super.Class isa = sub_14F10().super.isa;
        unint64_t v86 = (unint64_t)v129;
      }
      else
      {
        self;
        if (!swift_dynamicCastObjCClass())
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_46;
        }
        id v140 = v89;
        NSString v114 = sub_14F00();
        id v115 = [self animationWithKeyPath:v114];

        sub_14068(0, &qword_2A5B8);
        id v98 = v115;
        char v116 = sub_14F50();
        id v117 = [v127 whiteColor];
        id v118 = (id)NTKInterpolateBetweenColors();

        if (!v118) {
          goto LABEL_68;
        }
        id v137 = v113;
        id v119 = v118;
        v120 = v119;
        id v139 = v109;
        if (v116)
        {
          id v121 = v119;
          id v122 = v121;
        }
        else
        {
          id v123 = [v127 whiteColor];
          id v122 = (id)NTKInterpolateBetweenColors();

          if (!v122) {
            goto LABEL_69;
          }
        }
        __chkstk_darwin(v121);
        v126[-6] = v56;
        v126[-5] = v120;
        LOBYTE(v126[-4]) = v116 & 1;
        v126[-3] = v56;
        v126[-2] = v122;
        uint64_t v124 = swift_bridgeObjectRetain();
        v125 = sub_13DE0(v124, (uint64_t (*)(uint64_t, double))sub_13DDC);

        swift_bridgeObjectRelease_n();
        sub_104EC((uint64_t)v125);
        swift_bridgeObjectRelease();
        v100.super.Class isa = sub_14F10().super.isa;
      }
      swift_bridgeObjectRelease();
      [v98 setValues:v100.super.isa];

      [v98 setDuration:v90];
      LODWORD(v101) = 15.0;
      LODWORD(v102) = 30.0;
      LODWORD(v103) = 15.0;
      objc_msgSend(v98, "setPreferredFrameRateRange:", v101, v102, v103);
      sub_14068(0, &qword_2A5C0);
      Class v104 = sub_14F10().super.isa;
      swift_bridgeObjectRelease();
      [v98 setKeyTimes:v104];

      id v105 = v98;
      NSString v106 = sub_14F00();
      id v107 = v139;
      [v139 addAnimation:v105 forKey:v106];

      os_log_t v88 = v144;
      uint64_t v87 = v133;
      id v89 = v140;
LABEL_46:
      id v89 = (char *)v89 + 1;
      if ((id)v87 == v89) {
        goto LABEL_61;
      }
    }
  }
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
}

void *sub_104EC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v9 = &_swiftEmptyArrayStorage;
    sub_136E0(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = &_swiftEmptyArrayStorage;
    do
    {
      swift_bridgeObjectRetain();
      sub_BE38(&qword_2A5D0);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_136E0(0, v2[2] + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_136E0(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v2[2] = v6 + 1;
      sub_13FF0(&v8, &v2[4 * v6 + 4]);
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1061C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_14FE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  uint64_t v13 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_136E0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_14F80();
        type metadata accessor for CGColor(0);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_136E0(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_136E0(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_13FF0(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      long long v8 = (id *)(a1 + 32);
      type metadata accessor for CGColor(0);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_136E0(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_136E0(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_13FF0(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_10938()
{
  uint64_t v1 = sub_BE38(&qword_2A3E8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for GladiusUtilities.DateOverride();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  long long v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = sub_BE38((uint64_t *)&unk_2A5A0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v0 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_dateOverride;
  swift_beginAccess();
  sub_D0FC(v14, (uint64_t)v13, (uint64_t *)&unk_2A5A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4))
  {
    sub_D160((uint64_t)v13, (uint64_t *)&unk_2A5A0);
LABEL_3:
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      uint64_t v16 = (void *)result;
      uint64_t v17 = sub_14E60();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v3, 1, 1, v17);
      double v18 = sub_12990((uint64_t)v3);
      sub_D160((uint64_t)v3, &qword_2A3E8);
      [v16 lightSpillCoordinator:v0 wantsUpdateForAngle:v18];
      return swift_unknownObjectRelease();
    }
    return result;
  }
  sub_ECD4((uint64_t)v13, (uint64_t)v10);
  sub_D160((uint64_t)v13, (uint64_t *)&unk_2A5A0);
  sub_ECD4((uint64_t)v10, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_D608((uint64_t)v8);
    return sub_D608((uint64_t)v10);
  }
  id v19 = (int *)sub_BE38(&qword_2A3F0);
  double v20 = v19;
  if (v8[v19[24]])
  {
    BOOL v21 = 1;
  }
  else
  {
    double v22 = *(double *)&v8[v19[20]];
    double v23 = *(double *)&v8[v19[16]];
    BOOL v21 = CFAbsoluteTimeGetCurrent() < v22 + v23;
  }
  uint64_t v24 = &v8[v20[12]];
  uint64_t v25 = sub_14E60();
  id v26 = *(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8);
  v26(v24, v25);
  v26(v8, v25);
  uint64_t result = sub_D608((uint64_t)v10);
  if (!v21) {
    goto LABEL_3;
  }
  return result;
}

uint64_t sub_10CE8()
{
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_majorHourLayers);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_14FE0();
    uint64_t v2 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = swift_bridgeObjectRetain_n();
    if (!v2) {
      goto LABEL_10;
    }
  }
  if (v2 < 1)
  {
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v4 = 0;
  do
  {
    if ((v1 & 0xC000000000000001) != 0) {
      id v5 = (id)sub_14F80();
    }
    else {
      id v5 = *(id *)(v1 + 8 * v4 + 32);
    }
    uint64_t v6 = v5;
    ++v4;
    NSString v7 = sub_14F00();
    [v6 removeAnimationForKey:v7];
  }
  while (v2 != v4);
LABEL_10:
  swift_bridgeObjectRelease_n();
  unint64_t v8 = *(void *)(v0
                 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_minorMinuteLayers);
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_14FE0();
    uint64_t v9 = result;
    if (!result) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = swift_bridgeObjectRetain_n();
    if (!v9) {
      goto LABEL_19;
    }
  }
  if (v9 < 1)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v10 = 0;
  do
  {
    if ((v8 & 0xC000000000000001) != 0) {
      id v11 = (id)sub_14F80();
    }
    else {
      id v11 = *(id *)(v8 + 8 * v10 + 32);
    }
    uint64_t v12 = v11;
    ++v10;
    NSString v13 = sub_14F00();
    [v12 removeAnimationForKey:v13];
  }
  while (v9 != v10);
LABEL_19:
  swift_bridgeObjectRelease_n();
  unint64_t v14 = *(void *)(v0 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_minorHourLayers);
  if (!(v14 >> 62))
  {
    uint64_t v15 = *(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v15) {
      goto LABEL_21;
    }
LABEL_28:
    uint64_t result = swift_bridgeObjectRelease_n();
    *(unsigned char *)(v0
             + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_hasActiveTimeAnimations) = 0;
    return result;
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_14FE0();
  uint64_t v15 = result;
  if (!result) {
    goto LABEL_28;
  }
LABEL_21:
  if (v15 >= 1)
  {
    uint64_t v16 = 0;
    do
    {
      if ((v14 & 0xC000000000000001) != 0) {
        id v17 = (id)sub_14F80();
      }
      else {
        id v17 = *(id *)(v14 + 8 * v16 + 32);
      }
      double v18 = v17;
      ++v16;
      NSString v19 = sub_14F00();
      [v18 removeAnimationForKey:v19];
    }
    while (v15 != v16);
    goto LABEL_28;
  }
LABEL_31:
  __break(1u);
  return result;
}

void sub_11264()
{
  uint64_t v1 = sub_BE38(&qword_2A3E8);
  __chkstk_darwin(v1 - 8);
  double v40 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for GladiusUtilities.DateOverride();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  NSString v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v35 - v8;
  uint64_t v10 = sub_BE38((uint64_t *)&unk_2A5A0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  NSString v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v35 - v15;
  __chkstk_darwin(v14);
  double v18 = (char *)&v35 - v17;
  uint64_t v19 = v0 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_dateOverride;
  swift_beginAccess();
  sub_D0FC(v19, (uint64_t)v18, (uint64_t *)&unk_2A5A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v18, 1, v3))
  {
    sub_D160((uint64_t)v18, (uint64_t *)&unk_2A5A0);
LABEL_3:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v13, 1, 1, v3);
    swift_beginAccess();
    sub_D094((uint64_t)v13, v19);
    swift_endAccess();
    sub_12334();
    return;
  }
  double v39 = v16;
  sub_ECD4((uint64_t)v18, (uint64_t)v9);
  sub_D160((uint64_t)v18, (uint64_t *)&unk_2A5A0);
  sub_ECD4((uint64_t)v9, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    double v20 = (int *)sub_BE38(&qword_2A3F0);
    BOOL v21 = v20;
    if (v7[v20[24]])
    {
      BOOL v22 = 1;
    }
    else
    {
      double v23 = *(double *)&v7[v20[20]];
      double v24 = *(double *)&v7[v20[16]];
      BOOL v22 = CFAbsoluteTimeGetCurrent() < v23 + v24;
    }
    BOOL v37 = v22;
    NSString v36 = &v7[v21[12]];
    uint64_t v25 = sub_14E60();
    id v26 = *(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8);
    uint64_t v38 = v0;
    v26(v36, v25);
    v26(v7, v25);
    uint64_t v0 = v38;
    sub_D608((uint64_t)v9);
    if (!v37) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_D608((uint64_t)v7);
    sub_D608((uint64_t)v9);
  }
  sub_D0FC(v19, (uint64_t)v13, (uint64_t *)&unk_2A5A0);
  uint64_t v27 = (uint64_t)v39;
  sub_E49C((uint64_t)v39, (uint64_t)v13);
  double v29 = v28;
  sub_D160((uint64_t)v13, (uint64_t *)&unk_2A5A0);
  sub_D0FC(v27, (uint64_t)v13, (uint64_t *)&unk_2A5A0);
  swift_beginAccess();
  sub_D094((uint64_t)v13, v19);
  swift_endAccess();
  sub_11870(v29);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v31 = (void *)Strong;
    uint64_t v32 = sub_14E60();
    uint64_t v33 = (uint64_t)v40;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v40, 1, 1, v32);
    double v34 = sub_12990(v33);
    sub_D160(v33, &qword_2A3E8);
    [v31 lightSpillCoordinator:v0 wantsUpdateForAngle:v34];
    swift_unknownObjectRelease();
  }
  sub_D160(v27, (uint64_t *)&unk_2A5A0);
}

id sub_1174C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  id result = (id)NTKInterpolateBetweenColors();
  if (result)
  {
    id v6 = result;
    NSString v7 = v6;
    if (a4)
    {
      id v8 = v6;
LABEL_5:
      sub_BE38((uint64_t *)&unk_2A5D8);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_18770;
      id v10 = [v7 CGColor];

      *(void *)(v9 + 32) = v10;
      *(void *)(v9 + 40) = [v8 CGColor];
      sub_14F30();

      return (id)v9;
    }
    id result = (id)NTKInterpolateBetweenColors();
    id v8 = result;
    if (result) {
      goto LABEL_5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_11870(double a1)
{
  uint64_t v2 = &v1[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors];
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors];
  if (!v3)
  {
LABEL_33:
    osloga = sub_14EC0();
    os_log_type_t v58 = sub_14F40();
    if (os_log_type_enabled(osloga, v58))
    {
      id v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v59 = 0;
      _os_log_impl(&dword_0, osloga, v58, "trying to apply instantaneous tick lighting with no palette!", v59, 2u);
      swift_slowDealloc();
    }
    goto LABEL_52;
  }
  uint64_t v4 = (void *)*((void *)v2 + 3);
  uint64_t v5 = (void *)*((void *)v2 + 4);
  NSString v7 = (void *)*((void *)v2 + 1);
  id v6 = (void *)*((void *)v2 + 2);
  id v8 = self;
  id v83 = v7;
  id v84 = v6;
  uint64_t v87 = v5;
  sub_13658(v3, v7, v6, v4, v5);
  id v9 = v4;
  id v100 = v8;
  id v10 = [v8 whiteColor];
  id v98 = (id)NTKInterpolateBetweenColors();
  v99 = v9;

  os_log_t v88 = v1;
  unint64_t v11 = *(void *)&v1[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_majorHourLayers];
  id v94 = (id *)v3;
  if (v11 >> 62) {
    goto LABEL_38;
  }
  uint64_t v12 = *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v12)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    id v33 = v87;
    id v34 = [v100 whiteColor];
    id v86 = (id)NTKInterpolateBetweenColors();
    uint64_t v87 = v33;

    unint64_t v35 = *(void *)&v88[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_minorHourLayers];
    if (v35 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_14FE0();
      if (v36) {
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v36 = *(void *)((char *)&dword_10 + (v35 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (v36)
      {
LABEL_19:
        id v92 = self;
        uint64_t v91 = *(void *)&v88[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_device];
        uint64_t v37 = 4;
        do
        {
          if ((v35 & 0xC000000000000001) != 0) {
            id v44 = (id)sub_14F80();
          }
          else {
            id v44 = *(id *)(v35 + 8 * v37);
          }
          unint64_t v11 = (unint64_t)v44;
          uint64_t v45 = v37 - 3;
          if (__OFADD__(v37 - 4, 1)) {
            goto LABEL_36;
          }
          [v92 minorHourAngleAtIndex:v37 - 4 device:v91];
          fmod(a1 / 6.28318531 - (v46 / 6.28318531 + -1.0), 1.0);
          self;
          uint64_t v47 = swift_dynamicCastObjCClass();
          if (v47)
          {
            id v48 = (void *)v47;
            id v49 = (id)v11;
            id v50 = [v100 whiteColor];
            id v51 = [v50 CGColor];

            [v48 setForegroundColor:v51];
            v43.super.Class isa = (Class)v49;
            id v52 = (id)NTKInterpolateBetweenColors();
            if (!v52) {
              goto LABEL_62;
            }
            os_log_t v53 = v52;
            id v42 = [v52 CGColor];

            [v48 setContentsMultiplyColor:v42];
          }
          else
          {
            self;
            uint64_t v54 = swift_dynamicCastObjCClass();
            if (!v54) {
              goto LABEL_22;
            }
            uint64_t v55 = (void *)v54;
            id v56 = (id)v11;
            id v57 = (id)NTKInterpolateBetweenColors();
            if (!v57)
            {
              __break(1u);
              goto LABEL_33;
            }
            uint64_t v38 = v57;
            id v39 = [v57 CGColor];

            sub_BE38(&qword_2A5B0);
            uint64_t v40 = swift_allocObject();
            *(_OWORD *)(v40 + 16) = xmmword_18780;
            type metadata accessor for CGColor(0);
            *(void *)(v40 + 32) = v39;
            *(void *)(v40 + 88) = v41;
            *(void *)(v40 + 56) = v41;
            *(void *)(v40 + 64) = v39;
            id v42 = v39;
            v43.super.Class isa = sub_14F10().super.isa;
            swift_bridgeObjectRelease();
            [v55 setColors:v43.super.isa];
          }

LABEL_22:
          ++v37;
        }
        while (v45 != v36);
      }
    }
    swift_bridgeObjectRelease();
    id v60 = v83;
    id v61 = [v100 whiteColor];
    osloga = (id)NTKInterpolateBetweenColors();
    id v93 = v60;

    id v62 = v84;
    id v63 = [v100 whiteColor];
    id v95 = (id)NTKInterpolateBetweenColors();
    id v101 = v62;

    Class v64 = v88;
    unint64_t v65 = *(void *)&v88[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_minorMinuteLayers];
    if (v65 >> 62) {
      goto LABEL_56;
    }
    uint64_t v66 = *(void *)((char *)&dword_10 + (v65 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    for (; v66; uint64_t v66 = sub_14FE0())
    {
      double v90 = self;
      uint64_t v89 = *(void *)&v64[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_device];
      uint64_t v67 = 4;
      Class v64 = (char *)&type metadata for Any + 8;
      while (1)
      {
        id v68 = (v65 & 0xC000000000000001) != 0 ? (id)sub_14F80() : *(id *)(v65 + 8 * v67);
        NSString v69 = v68;
        uint64_t v70 = v67 - 3;
        if (__OFADD__(v67 - 4, 1)) {
          break;
        }
        [v90 minorMinuteAngleAtIndex:v67 - 4 device:v89];
        fmod(a1 / 6.28318531 - (v71 / 6.28318531 + -1.0), 1.0);
        id v72 = (id)NTKInterpolateBetweenColors();
        if (!v72) {
          goto LABEL_60;
        }
        double v73 = v72;
        id v74 = [v72 CGColor];

        id v75 = (id)NTKInterpolateBetweenColors();
        if (!v75) {
          goto LABEL_61;
        }
        uint64_t v76 = v75;
        id v77 = [v75 CGColor];

        sub_BE38(&qword_2A5B0);
        uint64_t v78 = swift_allocObject();
        *(_OWORD *)(v78 + 16) = xmmword_18780;
        type metadata accessor for CGColor(0);
        *(void *)(v78 + 32) = v74;
        *(void *)(v78 + 88) = v79;
        *(void *)(v78 + 56) = v79;
        *(void *)(v78 + 64) = v77;
        id v80 = v74;
        id v81 = v77;
        Class isa = sub_14F10().super.isa;
        swift_bridgeObjectRelease();
        [v69 setColors:isa];

        ++v67;
        if (v70 == v66) {
          goto LABEL_51;
        }
      }
      __break(1u);
LABEL_56:
      swift_bridgeObjectRetain();
    }
LABEL_51:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

LABEL_52:

    return;
  }
LABEL_4:
  os_log_t oslog = (os_log_t)(v11 & 0xC000000000000001);
  uint64_t v13 = 4;
  unint64_t v14 = v11;
  while (1)
  {
    uint64_t v15 = v13 - 4;
    if (oslog) {
      id v16 = (id)sub_14F80();
    }
    else {
      id v16 = *(id *)(v11 + 8 * v13);
    }
    uint64_t v17 = v16;
    unint64_t v11 = v13 - 3;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_14FE0();
      if (!v12) {
        goto LABEL_17;
      }
      goto LABEL_4;
    }
    fmod(a1 / 6.28318531 - ((double)v15 * 3.14159265 / 6.0 / 6.28318531 + -1.0), 1.0);
    if (((unint64_t)v94 & 0xC000000000000001) != 0)
    {
      id v18 = (id)sub_14F80();
    }
    else
    {
      if ((unint64_t)v15 >= *(void *)((char *)&dword_10 + ((unint64_t)v94 & 0xFFFFFFFFFFFFFF8))) {
        goto LABEL_37;
      }
      id v18 = v94[v13];
    }
    uint64_t v19 = v18;
    sub_BE38(&qword_2A5B0);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_18780;
    id v21 = v19;
    id v22 = [v100 whiteColor];
    id v23 = (id)NTKInterpolateBetweenColors();

    id v24 = (id)NTKInterpolateBetweenColors();
    if (!v24) {
      break;
    }
    id v25 = [v24 CGColor];

    type metadata accessor for CGColor(0);
    uint64_t v27 = v26;
    *(void *)(v20 + 56) = v26;
    *(void *)(v20 + 32) = v25;
    id v28 = (id)NTKInterpolateBetweenColors();
    if (!v28) {
      goto LABEL_59;
    }
    double v29 = v28;
    id v30 = [v28 CGColor];

    *(void *)(v20 + 88) = v27;
    *(void *)(v20 + 64) = v30;
    Class v31 = sub_14F10().super.isa;
    swift_bridgeObjectRelease();
    [v17 setColors:v31];

    ++v13;
    BOOL v32 = v11 == v12;
    unint64_t v11 = v14;
    if (v32) {
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
}

void sub_12334()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors);
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors);
  if (v2)
  {
    uint64_t v3 = (void *)v1[1];
    uint64_t v4 = (void *)v1[2];
    uint64_t v5 = (void *)v1[3];
    id v6 = (void *)v1[4];
    unint64_t v7 = *(void *)(v0
                   + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_majorHourLayers);
    id v60 = v4;
    uint64_t v61 = *(void *)(v0
                    + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors);
    uint64_t v55 = v3;
    id v62 = v5;
    id v58 = v6;
    if (v7 >> 62)
    {
      sub_13658(v2, v3, v4, v5, v6);
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_14FE0();
      if (!v8) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8));
      sub_13658(v2, v3, v4, v5, v6);
      swift_bridgeObjectRetain();
      if (!v8) {
        goto LABEL_21;
      }
    }
    if (v8 < 1)
    {
      __break(1u);
    }
    else if ((v61 & 0xC000000000000001) != 0 {
           || (unint64_t)(v8 - 1) < *(void *)((char *)&dword_10 + (v61 & 0xFFFFFFFFFFFFFF8)))
    }
    {
      uint64_t v9 = 0;
      unint64_t v10 = v7 & 0xC000000000000001;
      unint64_t v11 = v7;
      do
      {
        if (v10) {
          id v19 = (id)sub_14F80();
        }
        else {
          id v19 = *(id *)(v7 + 8 * v9 + 32);
        }
        uint64_t v20 = v19;
        sub_BE38(&qword_2A5B0);
        uint64_t v21 = swift_allocObject();
        *(_OWORD *)(v21 + 16) = xmmword_18780;
        if ((v61 & 0xC000000000000001) != 0) {
          id v12 = (id)sub_14F80();
        }
        else {
          id v12 = *(id *)(v61 + 8 * v9 + 32);
        }
        uint64_t v13 = v12;
        ++v9;
        id v14 = [v12 CGColor];

        type metadata accessor for CGColor(0);
        uint64_t v16 = v15;
        *(void *)(v21 + 56) = v15;
        *(void *)(v21 + 32) = v14;
        id v17 = [v62 CGColor];
        *(void *)(v21 + 88) = v16;
        *(void *)(v21 + 64) = v17;
        Class isa = sub_14F10().super.isa;
        swift_bridgeObjectRelease();
        [v20 setColors:isa];

        unint64_t v7 = v11;
      }
      while (v8 != v9);
LABEL_21:
      swift_bridgeObjectRelease();
      unint64_t v24 = *(void *)(v56
                      + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_minorHourLayers);
      if (v24 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_14FE0();
        if (v25)
        {
LABEL_23:
          if (v25 >= 1)
          {
            uint64_t v26 = 0;
            unint64_t v27 = v24 & 0xC000000000000001;
            id v28 = &_s10Foundation22_convertNSErrorToErrorys0E0_pSo0C0CSgF_ptr;
            uint64_t v57 = v25;
            double v29 = &selRef_defaultHourConfigurationForDevice_;
            unint64_t v59 = v24;
            while (1)
            {
              if (v27) {
                id v34 = (id)sub_14F80();
              }
              else {
                id v34 = *(id *)(v24 + 8 * v26 + 32);
              }
              id v33 = v34;
              self;
              uint64_t v35 = swift_dynamicCastObjCClass();
              if (v35)
              {
                id v30 = (void *)v35;
                Class v31 = v33;
                id v32 = [v58 CGColor];
                objc_msgSend(v30, v29[124], v32);
              }
              else
              {
                self;
                uint64_t v36 = swift_dynamicCastObjCClass();
                if (!v36) {
                  goto LABEL_27;
                }
                uint64_t v37 = (void *)v36;
                id v32 = v33;
                uint64_t v38 = v28;
                id v39 = [v62 CGColor];
                sub_BE38(&qword_2A5B0);
                uint64_t v40 = v29;
                unint64_t v41 = v27;
                uint64_t v42 = swift_allocObject();
                *(_OWORD *)(v42 + 16) = xmmword_18780;
                type metadata accessor for CGColor(0);
                *(void *)(v42 + 32) = v39;
                *(void *)(v42 + 88) = v43;
                *(void *)(v42 + 56) = v43;
                *(void *)(v42 + 64) = v39;
                id v44 = v39;
                Class v31 = sub_14F10().super.isa;
                unint64_t v27 = v41;
                double v29 = v40;
                swift_bridgeObjectRelease();
                [v37 setColors:v31];

                id v28 = v38;
                uint64_t v25 = v57;
                unint64_t v24 = v59;
              }

              id v33 = v32;
LABEL_27:
              ++v26;

              if (v25 == v26) {
                goto LABEL_35;
              }
            }
          }
          goto LABEL_49;
        }
      }
      else
      {
        uint64_t v25 = *(void *)((char *)&dword_10 + (v24 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain();
        if (v25) {
          goto LABEL_23;
        }
      }
LABEL_35:
      swift_bridgeObjectRelease();
      unint64_t v45 = *(void *)(v56
                      + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_minorMinuteLayers);
      if (v45 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v46 = sub_14FE0();
        if (v46) {
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t v46 = *(void *)((char *)&dword_10 + (v45 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain();
        if (v46)
        {
LABEL_37:
          if (v46 < 1)
          {
LABEL_50:
            __break(1u);
            return;
          }
          uint64_t v47 = 0;
          do
          {
            if ((v45 & 0xC000000000000001) != 0) {
              id v48 = (id)sub_14F80();
            }
            else {
              id v48 = *(id *)(v45 + 8 * v47 + 32);
            }
            id v49 = v48;
            ++v47;
            id v50 = [v60 CGColor];
            sub_BE38(&qword_2A5B0);
            uint64_t v51 = swift_allocObject();
            *(_OWORD *)(v51 + 16) = xmmword_18780;
            type metadata accessor for CGColor(0);
            *(void *)(v51 + 32) = v50;
            *(void *)(v51 + 88) = v52;
            *(void *)(v51 + 56) = v52;
            *(void *)(v51 + 64) = v50;
            id v53 = v50;
            Class v54 = sub_14F10().super.isa;
            swift_bridgeObjectRelease();
            [v49 setColors:v54];
          }
          while (v46 != v47);
        }
      }
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  id v63 = sub_14EC0();
  os_log_type_t v22 = sub_14F40();
  if (os_log_type_enabled(v63, v22))
  {
    id v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v23 = 0;
    _os_log_impl(&dword_0, v63, v22, "trying to clear instantaneous tick lighting with no palette!", v23, 2u);
    swift_slowDealloc();
  }
}

double sub_12990(uint64_t a1)
{
  uint64_t v2 = sub_14EA0();
  uint64_t v64 = *(void *)(v2 - 8);
  uint64_t v65 = v2;
  __chkstk_darwin(v2);
  id v63 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_BE38(&qword_2A3E8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v61 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  unint64_t v59 = (char *)&v54 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  unint64_t v11 = (char *)&v54 - v10;
  __chkstk_darwin(v9);
  id v62 = (char *)&v54 - v12;
  uint64_t v13 = type metadata accessor for GladiusUtilities.DateOverride();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  id v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v58 = (uint64_t)&v54 - v18;
  uint64_t v19 = sub_BE38((uint64_t *)&unk_2A5A0);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v57 = (uint64_t)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v56 = (uint64_t)&v54 - v23;
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v54 - v24;
  double v68 = 0.0;
  uint64_t v26 = sub_14E60();
  uint64_t v27 = *(void *)(v26 - 8);
  id v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48);
  if (v28(a1, 1, v26) != 1) {
    goto LABEL_4;
  }
  uint64_t v55 = v28;
  uint64_t v29 = v60 + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_dateOverride;
  swift_beginAccess();
  sub_D0FC(v29, (uint64_t)v25, (uint64_t *)&unk_2A5A0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v25, 1, v13))
  {
    uint64_t v60 = v29;
    uint64_t v36 = v58;
    sub_ECD4((uint64_t)v25, v58);
    sub_D160((uint64_t)v25, (uint64_t *)&unk_2A5A0);
    sub_ECD4(v36, (uint64_t)v17);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v37 = (int *)sub_BE38(&qword_2A3F0);
      uint64_t v38 = v37;
      if ((v17[v37[24]] & 1) == 0)
      {
        double v49 = *(double *)&v17[v37[20]];
        double v50 = *(double *)&v17[v37[16]];
        double Current = CFAbsoluteTimeGetCurrent();
        uint64_t v52 = v36;
        id v53 = *(void (**)(char *, uint64_t))(v27 + 8);
        v53(&v17[v38[12]], v26);
        v53(v17, v26);
        sub_D608(v52);
        uint64_t v45 = v60;
        id v28 = v55;
        if (Current >= v49 + v50) {
          goto LABEL_4;
        }
LABEL_19:
        uint64_t v46 = v57;
        sub_D0FC(v45, v57, (uint64_t *)&unk_2A5A0);
        uint64_t v47 = v56;
        sub_E49C(v56, v46);
        double v43 = v48;
        sub_D160(v46, (uint64_t *)&unk_2A5A0);
        sub_D160(v47, (uint64_t *)&unk_2A5A0);
        return v43;
      }
      id v39 = *(void (**)(char *, uint64_t))(v27 + 8);
      v39(&v17[v37[12]], v26);
      v39(v17, v26);
    }
    else
    {
      sub_D608((uint64_t)v17);
    }
    sub_D608(v36);
    uint64_t v45 = v60;
    goto LABEL_19;
  }
  sub_D160((uint64_t)v25, (uint64_t *)&unk_2A5A0);
  id v28 = v55;
LABEL_4:
  sub_D0FC(a1, (uint64_t)v11, &qword_2A3E8);
  if (v28((uint64_t)v11, 1, v26) == 1)
  {
    id v30 = [self faceDate];
    uint64_t v31 = (uint64_t)v62;
    if (v30)
    {
      id v32 = v30;
      uint64_t v33 = (uint64_t)v59;
      sub_14E50();

      uint64_t v34 = 0;
      uint64_t v35 = (uint64_t)v61;
    }
    else
    {
      uint64_t v34 = 1;
      uint64_t v35 = (uint64_t)v61;
      uint64_t v33 = (uint64_t)v59;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v33, v34, 1, v26);
    sub_135F0(v33, v31);
    sub_D160((uint64_t)v11, &qword_2A3E8);
  }
  else
  {
    uint64_t v31 = (uint64_t)v62;
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v62, v11, v26);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v27 + 56))(v31, 0, 1, v26);
    uint64_t v35 = (uint64_t)v61;
  }
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  sub_D0FC(v31, v35, &qword_2A3E8);
  Class isa = 0;
  if (v28(v35, 1, v26) != 1)
  {
    Class isa = sub_14E30().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v35, v26);
  }
  unint64_t v41 = v63;
  sub_14E90();
  Class v42 = sub_14E70().super.isa;
  (*(void (**)(char *, uint64_t))(v64 + 8))(v41, v65);
  CLKHourMinuteSecondAnglesForTime();

  sub_D160(v31, &qword_2A3E8);
  return v68;
}

id sub_130BC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NTKGladiusLightSpillCoordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1320C()
{
  return type metadata accessor for NTKGladiusLightSpillCoordinator();
}

uint64_t type metadata accessor for NTKGladiusLightSpillCoordinator()
{
  uint64_t result = qword_2A580;
  if (!qword_2A580) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_13260()
{
  sub_CC14();
  if (v0 <= 0x3F)
  {
    sub_14EE0();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void destroy for NTKGladiusLightSpillCoordinator.DialColors(uint64_t a1)
{
  swift_bridgeObjectRelease();

  objc_super v2 = *(void **)(a1 + 32);
}

void *initializeWithCopy for NTKGladiusLightSpillCoordinator.DialColors(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a2[3];
  a1[2] = v4;
  a1[3] = v5;
  uint64_t v6 = (void *)a2[4];
  a1[4] = v6;
  swift_bridgeObjectRetain();
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  id v10 = v6;
  return a1;
}

void *assignWithCopy for NTKGladiusLightSpillCoordinator.DialColors(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[1];
  uint64_t v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  id v7 = (void *)a2[2];
  id v8 = (void *)a1[2];
  a1[2] = v7;
  id v9 = v7;

  id v10 = (void *)a2[3];
  unint64_t v11 = (void *)a1[3];
  a1[3] = v10;
  id v12 = v10;

  uint64_t v13 = (void *)a2[4];
  uint64_t v14 = (void *)a1[4];
  a1[4] = v13;
  id v15 = v13;

  return a1;
}

__n128 initializeWithTake for NTKGladiusLightSpillCoordinator.DialColors(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for NTKGladiusLightSpillCoordinator.DialColors(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for NTKGladiusLightSpillCoordinator.DialColors(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NTKGladiusLightSpillCoordinator.DialColors(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NTKGladiusLightSpillCoordinator.DialColors()
{
  return &type metadata for NTKGladiusLightSpillCoordinator.DialColors;
}

uint64_t sub_135F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_BE38(&qword_2A3E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_13658(id result, void *a2, void *a3, void *a4, void *a5)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    id v8 = a2;
    id v9 = a3;
    id v10 = a4;
    return a5;
  }
  return result;
}

uint64_t sub_136C0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_13700(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_136E0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1388C(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_13700(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_BE38(&qword_2A5C8);
    id v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    id v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_BE38(&qword_2A5D0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_14FF0();
  __break(1u);
  return result;
}

uint64_t sub_1388C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_BE38(&qword_2A5B0);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_14FF0();
  __break(1u);
  return result;
}

id sub_139FC(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_minorMinuteLayers] = &_swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_minorHourLayers] = &_swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_majorHourLayers] = &_swiftEmptyArrayStorage;
  long long v3 = &v1[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_dateOverride];
  uint64_t v4 = type metadata accessor for GladiusUtilities.DateOverride();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(void *)&v1[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_dateOverrideAnimationTimer] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = &v1[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors];
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v1[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_hasActiveTimeAnimations] = 0;
  sub_14068(0, &qword_2A5F0);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  int64_t v7 = v1;
  id v8 = [ObjCClassFromMetadata logObject];
  sub_14EF0();
  uint64_t v9 = &v7[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_fadeAnimationKey];
  *(void *)uint64_t v9 = 0x65646146656D6974;
  *((void *)v9 + 1) = 0xE800000000000000;
  *(void *)&v7[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_tickOverlayBrightness] = 0x3FF0000000000000;
  *(void *)&v7[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_device] = a1;
  id v10 = a1;

  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for NTKGladiusLightSpillCoordinator();
  return objc_msgSendSuper2(&v12, "init");
}

uint64_t sub_13BA0(double a1, double a2)
{
  double v2 = fmod(a1 / 6.28318531 - (a2 / 6.28318531 + -1.0), 1.0);
  if (1.0 - v2 / 0.4 < 0.0) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0 - v2 / 0.4;
  }
  sub_BE38(&qword_2A320);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_18790;
  *(double *)(v4 + 32) = v3;
  *(void *)(v4 + 40) = 0;
  *(void *)(v4 + 48) = 0;
  *(void *)(v4 + 56) = 0x3FF0000000000000;
  *(double *)(v4 + 64) = v3;
  sub_14FB0();
  sub_14EB0();
  sub_14F90();
  sub_14FC0();
  sub_14FD0();
  sub_14FA0();
  sub_14EB0();
  sub_14F90();
  sub_14FC0();
  sub_14FD0();
  sub_14FA0();
  sub_14EB0();
  sub_14F90();
  sub_14FC0();
  sub_14FD0();
  sub_14FA0();
  sub_14EB0();
  sub_14F90();
  sub_14FC0();
  sub_14FD0();
  sub_14FA0();
  sub_14EB0();
  sub_14F90();
  sub_14FC0();
  sub_14FD0();
  sub_14FA0();
  return v4;
}

void *sub_13DE0(uint64_t a1, uint64_t (*a2)(uint64_t, double))
{
  sub_136C0(0, 0, 0);
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a1 + 32;
    do
    {
      uint64_t v7 = a2(v5, *(double *)(v6 + 8 * v5));
      unint64_t v9 = _swiftEmptyArrayStorage[2];
      unint64_t v8 = _swiftEmptyArrayStorage[3];
      if (v9 >= v8 >> 1) {
        sub_136C0(v8 > 1, v9 + 1, 1);
      }
      ++v5;
      _swiftEmptyArrayStorage[2] = v9 + 1;
      _swiftEmptyArrayStorage[v9 + 4] = v7;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

id sub_13EE8(uint64_t a1)
{
  return sub_1174C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32));
}

void *sub_13EF8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = _swiftEmptyArrayStorage;
  if (v2)
  {
    sub_14FB0();
    for (uint64_t i = a1 + 32; ; i += 8)
    {
      uint64_t result = (id)NTKInterpolateBetweenColors();
      if (!result) {
        break;
      }
      uint64_t v5 = result;
      id v6 = [result CGColor];

      sub_14F90();
      sub_14FC0();
      sub_14FD0();
      sub_14FA0();
      if (!--v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  return result;
}

_OWORD *sub_13FF0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_14000(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  if (a1)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_14068(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_140A4(uint64_t a1)
{
  return a1;
}

void sub_14104(double a1)
{
  if (a1 <= 0.0) {
    double v2 = ceil(a1 / -6.28318531) * 6.28318531 + a1;
  }
  else {
    double v2 = a1 - floor(a1 / 6.28318531) * 6.28318531;
  }
  double v3 = floor(v2 / 6.28318531 * 120.0);
  if ((~*(void *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v3 >= 9.22337204e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  unint64_t v4 = (uint64_t)v3 % 120;
  unsigned int v5 = (v4 + 1 + ((-119 * (char)(v4 + 1)) >> 8)) & 0x80;
  if ((v4 & 0x8000000000000000) == 0
    && ((char)(v4 + 1 - 120 * (((char)((unsigned __int16)(137 * (char)(v4 + 1)) >> 8) >> 6) + (v5 >> 7))) & 0x80000000) == 0)
  {
    unint64_t v6 = *(void *)(*(void *)(v1
                               + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion32NTKGladiusStretchySecondHandData_samples)
                   + 16);
    if (v4 < v6)
    {
      if (v6 > (char)(v4 + 1 - 120 * (((char)((unsigned __int16)(137 * (char)(v4 + 1)) >> 8) >> 6) + (v5 >> 7))))
      {
        CLKInterpolateBetweenFloatsUnclipped();
        return;
      }
      goto LABEL_20;
    }
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (qword_2A2F0 != -1) {
LABEL_21:
  }
    swift_once();
  uint64_t v7 = sub_14EE0();
  sub_C464(v7, (uint64_t)qword_2B4C8);
  unint64_t v8 = sub_14EC0();
  os_log_type_t v9 = sub_14F40();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134218496;
    sub_14F70();
    *(_WORD *)(v10 + 12) = 2048;
    sub_14F70();
    *(_WORD *)(v10 + 22) = 2048;
    sub_14F70();
    _os_log_impl(&dword_0, v8, v9, "Invalid sample index for angle: %f, baseIndex: %ld, nextIndex: %ld", (uint8_t *)v10, 0x20u);
    swift_slowDealloc();
  }
}

id sub_14428()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NTKGladiusStretchySecondHandData();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NTKGladiusStretchySecondHandData()
{
  return self;
}

uint64_t sub_14490(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

id sub_144A0(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion32NTKGladiusStretchySecondHandData_sampleCount] = 120;
  double v3 = v1;
  [a1 screenBounds];
  *(CGFloat *)&v3[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion32NTKGladiusStretchySecondHandData_baseRadius] = CGRectGetWidth(v12) * 0.5;
  unint64_t v4 = sub_BE7C(0, 120, 0, _swiftEmptyArrayStorage);
  for (uint64_t i = 0; i != 120; ++i)
  {
    NTKScreenRadiusAtAngleWithInset();
    uint64_t v7 = v6;
    unint64_t v9 = v4[2];
    unint64_t v8 = v4[3];
    if (v9 >= v8 >> 1) {
      unint64_t v4 = sub_BE7C((void *)(v8 > 1), v9 + 1, 1, v4);
    }
    v4[2] = v9 + 1;
    v4[v9 + 4] = v7;
  }
  *(void *)&v3[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion32NTKGladiusStretchySecondHandData_samples] = v4;

  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for NTKGladiusStretchySecondHandData();
  return objc_msgSendSuper2(&v11, "init");
}

void sub_14600(uint64_t a1)
{
  *(void *)(v1 + 16) = 81;
  *(unsigned char *)(v1 + 24) = 0;
  *(CFAbsoluteTime *)(v1 + 48) = CFAbsoluteTimeGetCurrent();
  *(void *)(v1 + 64) = 0x3F800000C0200000;
  *(_OWORD *)(v1 + 112) = xmmword_188D0;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 76) = *(_OWORD *)a1;
  *(_DWORD *)(v1 + 72) = 1064388153;
  *(_DWORD *)(v1 + 128) = 1065353216;
  *(_OWORD *)(v1 + 92) = v3;
  *(_DWORD *)(v1 + 108) = *(_DWORD *)(a1 + 32);
  id v4 = MTLCreateSystemDefaultDevice();
  if (!v4) {
    goto LABEL_16;
  }
  unsigned int v5 = v4;
  id v6 = [v4 newCommandQueue];
  if (!v6)
  {
LABEL_15:
    swift_unknownObjectRelease();
LABEL_16:
    type metadata accessor for GladiusRenderer();
    swift_deallocPartialClassInstance();
    return;
  }
  uint64_t v7 = v6;
  *(void *)(v1 + 32) = v5;
  swift_unknownObjectRetain();
  NSString v8 = sub_14F00();
  [v7 setLabel:v8];

  *(void *)(v1 + 40) = v7;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v10 = self;
  swift_unknownObjectRetain();
  id v11 = [v10 bundleForClass:ObjCClassFromMetadata];
  id v26 = 0;
  id v12 = [v5 newDefaultLibraryWithBundle:v11 error:&v26];

  if (!v12)
  {
    id v24 = v26;
    sub_14E20();

    swift_willThrow();
    swift_unknownObjectRelease();
    swift_errorRelease();
LABEL_13:
    swift_unknownObjectRelease();
LABEL_14:
    swift_unknownObjectRelease();
    goto LABEL_15;
  }
  id v13 = v26;
  NSString v14 = sub_14F00();
  id v15 = [v12 newFunctionWithName:v14];

  if (!v15)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_13;
  }
  NSString v16 = sub_14F00();
  id v17 = [v12 newFunctionWithName:v16];

  if (!v17)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_13;
  }
  id v18 = [objc_allocWithZone((Class)MTLRenderPipelineDescriptor) init];
  [v18 setVertexFunction:v15];
  [v18 setFragmentFunction:v17];
  id v19 = [v18 colorAttachments];
  id v20 = [v19 objectAtIndexedSubscript:0];

  if (v20)
  {
    [v20 setPixelFormat:*(void *)(v1 + 16)];
    [v20 setBlendingEnabled:0];
    id v26 = 0;
    id v21 = [v5 newRenderPipelineStateWithDescriptor:v18 error:&v26];
    if (v21)
    {
      id v22 = v21;
      id v23 = v26;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();

      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      *(void *)(v1 + 56) = v22;
      return;
    }
    id v25 = v26;
    sub_14E20();

    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_errorRelease();
    goto LABEL_14;
  }
  __break(1u);
}

id sub_14A6C(void *a1)
{
  [a1 setRenderPipelineState:*(void *)(v1 + 56)];
  float v3 = *(float *)(v1 + 68);
  int v48 = *(_DWORD *)(v1 + 128);
  long long v46 = *(_OWORD *)(v1 + 112);
  float v4 = *(float *)(v1 + 72);
  float v5 = *(float *)(v1 + 76);
  float v7 = *(float *)(v1 + 80);
  float v6 = *(float *)(v1 + 84);
  float v8 = *(float *)(v1 + 88);
  float v9 = *(float *)(v1 + 92);
  float v10 = *(float *)(v1 + 96);
  uint64_t v49 = *(void *)(v1 + 100);
  int v45 = *(_DWORD *)(v1 + 108);
  __float2 v11 = __sincosf_stret(*(float *)(v1 + 64));
  __float2 v12 = __sincosf_stret(v3);
  __float2 v13 = __sincosf_stret(v4);
  float v14 = v5 + v7;
  float v47 = v7;
  float v15 = v7;
  float v16 = v6;
  id v17 = sub_B75C((float32x2_t)__PAIR64__(LODWORD(v11.__sinval), LODWORD(v11.__cosval)), v8, v9, v14, v15, COERCE_DOUBLE(__PAIR64__(LODWORD(v13.__sinval), LODWORD(v13.__cosval))), v10, *(float *)&v49);
  id v18 = sub_B75C((float32x2_t)__PAIR64__(LODWORD(v12.__sinval), LODWORD(v12.__cosval)), v8, v9, v5 + v6, v6, COERCE_DOUBLE(__PAIR64__(LODWORD(v13.__sinval), LODWORD(v13.__cosval))), v10, *(float *)&v49);
  if (*((void *)v17 + 2) < 4uLL) {
    goto LABEL_38;
  }
  float v44 = v5;
  unint64_t v19 = 0;
  int8x8_t v20 = 0;
  int8x8_t v21 = 0;
  int8x8_t v22 = 0;
LABEL_3:
  uint64_t v23 = 12 * v19;
  int8x8_t v24 = v22;
  while (2)
  {
    unint64_t v25 = v19;
    int8x8_t v22 = v24;
    id v26 = &v17[v23];
    int v27 = v17[v23 + 40];
    int8x8_t v24 = (int8x8_t)0x7F0000007FLL;
    if (v27 == 255 || (v27 & 1) == 0) {
      goto LABEL_33;
    }
    float v29 = *((float *)v26 + 8);
    float v30 = *((float *)v26 + 9);
    if (v30 >= v29) {
      float v31 = *((float *)v26 + 8);
    }
    else {
      float v31 = *((float *)v26 + 9);
    }
    if (v29 > v30) {
      float v30 = *((float *)v26 + 8);
    }
    if (v25 >= *((void *)v18 + 2))
    {
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
    }
    id v32 = &v18[v23];
    int v33 = v18[v23 + 40];
    float32x2_t v34 = (float32x2_t)0x7F0000007FLL;
    if (v33 != 255 && (v33 & 1) != 0)
    {
      float v36 = *((float *)v32 + 8);
      float v37 = *((float *)v32 + 9);
      if (v37 >= v36) {
        v34.i32[0] = *((_DWORD *)v32 + 8);
      }
      else {
        v34.i32[0] = *((_DWORD *)v32 + 9);
      }
      if (v31 > v34.f32[0]) {
        v34.f32[0] = v31;
      }
      if (v36 > v37) {
        float v38 = *((float *)v32 + 8);
      }
      else {
        float v38 = *((float *)v32 + 9);
      }
      if (v38 < v30) {
        float v30 = v38;
      }
      v34.f32[1] = v30;
    }
    float32x2_t v39 = vabs_f32(v34);
    unsigned __int8 v40 = vcgt_f32(v39, (float32x2_t)vdup_lane_s32((int32x2_t)v39, 1)).u8[0];
    int8x8_t v41 = (int8x8_t)vrev64_s32((int32x2_t)v34);
    if (v40) {
      unsigned int v42 = -1;
    }
    else {
      unsigned int v42 = 0;
    }
    int8x8_t v24 = vbsl_s8((int8x8_t)vdup_n_s32(v42), v41, (int8x8_t)v34);
LABEL_33:
    v23 += 12;
    unint64_t v19 = v25 + 1;
    switch(v25)
    {
      case 0uLL:
        continue;
      case 1uLL:
        int8x8_t v21 = v24;
        goto LABEL_3;
      case 2uLL:
        int8x8_t v20 = v24;
        goto LABEL_3;
      case 3uLL:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v50[0] = v22;
        v50[1] = v21;
        v50[2] = v20;
        v50[3] = v24;
        v50[4] = __PAIR64__(LODWORD(v11.__sinval), LODWORD(v11.__cosval));
        v50[5] = __PAIR64__(LODWORD(v12.__sinval), LODWORD(v12.__cosval));
        v50[6] = __PAIR64__(LODWORD(v13.__sinval), LODWORD(v13.__cosval));
        long long v51 = v46;
        int v52 = v48;
        float v53 = v44;
        float v54 = v47;
        float v55 = v16;
        float v56 = v8;
        float v57 = v9;
        float v58 = v10;
        uint64_t v59 = v49;
        int v60 = v45;
        [a1 setFragmentBytes:v50 length:128 atIndex:0];
        return [a1 drawPrimitives:3 vertexStart:0 vertexCount:3];
      default:
        goto LABEL_39;
    }
  }
}

uint64_t sub_14D70()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return _swift_deallocClassInstance(v0, 132, 15);
}

uint64_t type metadata accessor for GladiusRenderer()
{
  return self;
}

ValueMetadata *type metadata accessor for GladiusRenderer.GradientColors()
{
  return &type metadata for GladiusRenderer.GradientColors;
}

uint64_t sub_14DEC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_14E20()
{
  return _convertNSErrorToError(_:)();
}

NSDate sub_14E30()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_14E40()
{
  return static Date.+ infix(_:_:)();
}

uint64_t sub_14E50()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_14E60()
{
  return type metadata accessor for Date();
}

NSCalendar sub_14E70()
{
  return Calendar._bridgeToObjectiveC()();
}

uint64_t sub_14E80()
{
  return static Calendar.autoupdatingCurrent.getter();
}

uint64_t sub_14E90()
{
  return static Calendar.current.getter();
}

uint64_t sub_14EA0()
{
  return type metadata accessor for Calendar();
}

NSNumber sub_14EB0()
{
  return CGFloat._bridgeToObjectiveC()();
}

uint64_t sub_14EC0()
{
  return Logger.logObject.getter();
}

uint64_t sub_14ED0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_14EE0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_14EF0()
{
  return Logger.init(_:)();
}

NSString sub_14F00()
{
  return String._bridgeToObjectiveC()();
}

NSArray sub_14F10()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_14F20()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_14F30()
{
  return specialized Array._endMutation()();
}

uint64_t sub_14F40()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_14F50()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_14F60()
{
  return type metadata accessor for Optional();
}

uint64_t sub_14F70()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_14F80()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_14F90()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_14FA0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_14FB0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_14FC0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_14FD0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_14FE0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_14FF0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DMakeTranslation(retstr, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CLKContrastRatioForColors()
{
  return _CLKContrastRatioForColors();
}

uint64_t CLKHourMinuteSecondAnglesForTime()
{
  return _CLKHourMinuteSecondAnglesForTime();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenFloatsUnclipped()
{
  return _CLKInterpolateBetweenFloatsUnclipped();
}

uint64_t CLKInterpolateShortestPathBetweenAnglesUnclipped()
{
  return _CLKInterpolateShortestPathBetweenAnglesUnclipped();
}

uint64_t CLKMapFractionIntoRange()
{
  return _CLKMapFractionIntoRange();
}

uint64_t CLKRectGetCenter()
{
  return _CLKRectGetCenter();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

uint64_t NTKAllSignatureCircularTypes()
{
  return _NTKAllSignatureCircularTypes();
}

uint64_t NTKAllSimpleTextComplicationTypes()
{
  return _NTKAllSimpleTextComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKColorByApplyingWhiteOverlay()
{
  return _NTKColorByApplyingWhiteOverlay();
}

uint64_t NTKColorByModifyingHSB()
{
  return _NTKColorByModifyingHSB();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKEnumerateComplicationStates()
{
  return _NTKEnumerateComplicationStates();
}

uint64_t NTKHourMinuteSecondAnglesForTime()
{
  return _NTKHourMinuteSecondAnglesForTime();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKScreenRadiusAtAngleWithInset()
{
  return _NTKScreenRadiusAtAngleWithInset();
}

uint64_t _EnumValueRange()
{
  return __EnumValueRange();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
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

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

long double cos(long double __x)
{
  return _cos(__x);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout()
{
  return _swift_getTupleTypeLayout();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return _[a1 CGContext];
}

id objc_msgSend_CLKFontWithAlternativePunctuation(void *a1, const char *a2, ...)
{
  return _[a1 CLKFontWithAlternativePunctuation];
}

id objc_msgSend__applyBreathingAndRubberbanding(void *a1, const char *a2, ...)
{
  return _[a1 _applyBreathingAndRubberbanding];
}

id objc_msgSend__applyNightFraction(void *a1, const char *a2, ...)
{
  return _[a1 _applyNightFraction];
}

id objc_msgSend__applyPalette_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyPalette:");
}

id objc_msgSend__canRunTimeAnimation(void *a1, const char *a2, ...)
{
  return _[a1 _canRunTimeAnimation];
}

id objc_msgSend__colorFractionForNightFraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_colorFractionForNightFraction:");
}

id objc_msgSend__contentViewAlphaForEditMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentViewAlphaForEditMode:");
}

id objc_msgSend__createMajorHourLayers(void *a1, const char *a2, ...)
{
  return _[a1 _createMajorHourLayers];
}

id objc_msgSend__createMinorHourLayers(void *a1, const char *a2, ...)
{
  return _[a1 _createMinorHourLayers];
}

id objc_msgSend__createMinorMinuteLayers(void *a1, const char *a2, ...)
{
  return _[a1 _createMinorMinuteLayers];
}

id objc_msgSend__editingFractionForEditMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_editingFractionForEditMode:");
}

id objc_msgSend__getComplicationColorsTop_bottom_palette_nightFraction_editingFraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getComplicationColorsTop:bottom:palette:nightFraction:editingFraction:");
}

id objc_msgSend__getComplicationColorsTop_bottom_palette_nightFraction_editingFraction_secondHandAngle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getComplicationColorsTop:bottom:palette:nightFraction:editingFraction:secondHandAngle:");
}

id objc_msgSend__hourMinuteHandStrokeColorForLight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hourMinuteHandStrokeColorForLight:");
}

id objc_msgSend__hourTickLengthAtIndex_forStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hourTickLengthAtIndex:forStyle:");
}

id objc_msgSend__hourTickPositionAtIndex_forStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hourTickPositionAtIndex:forStyle:");
}

id objc_msgSend__isLightColor(void *a1, const char *a2, ...)
{
  return _[a1 _isLightColor];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return _[a1 _loadSnapshotContentViews];
}

id objc_msgSend__nightFractionForLight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nightFractionForLight:");
}

id objc_msgSend__optionClassForCustomEditMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_optionClassForCustomEditMode:");
}

id objc_msgSend__orderedValuesForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_orderedValuesForDevice:");
}

id objc_msgSend__secondHandColorForLight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_secondHandColorForLight:");
}

id objc_msgSend__swatchForStyleOption_lightOption_colorOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_swatchForStyleOption:lightOption:colorOption:");
}

id objc_msgSend__textLayerWithText_position_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textLayerWithText:position:");
}

id objc_msgSend__tickWithLength_width_position_angle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tickWithLength:width:position:angle:");
}

id objc_msgSend__timeAnimationFramesPerSecondForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timeAnimationFramesPerSecondForDevice:");
}

id objc_msgSend__updateBottomComplicationWithColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateBottomComplicationWithColor:");
}

id objc_msgSend__updateDateOverrideAnimationWithStopTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDateOverrideAnimationWithStopTime:");
}

id objc_msgSend__updateMajorHourTickAtIndex_forStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMajorHourTickAtIndex:forStyle:");
}

id objc_msgSend__updateNightFraction(void *a1, const char *a2, ...)
{
  return _[a1 _updateNightFraction];
}

id objc_msgSend__updateSolarCurveData(void *a1, const char *a2, ...)
{
  return _[a1 _updateSolarCurveData];
}

id objc_msgSend__updateTopComplicationWithColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTopComplicationWithColor:");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addQuad_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addQuad:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_affineTransform(void *a1, const char *a2, ...)
{
  return _[a1 affineTransform];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_altitudeAtPercentage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "altitudeAtPercentage:");
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 analyticsIdentifier];
}

id objc_msgSend_anchorPoint(void *a1, const char *a2, ...)
{
  return _[a1 anchorPoint];
}

id objc_msgSend_animationKeys(void *a1, const char *a2, ...)
{
  return _[a1 animationKeys];
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_anyLocation(void *a1, const char *a2, ...)
{
  return _[a1 anyLocation];
}

id objc_msgSend_applyHourMinuteHandsStrokeColor_fillColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyHourMinuteHandsStrokeColor:fillColor:");
}

id objc_msgSend_applyInstantaneousSecondHandTransformForAngle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyInstantaneousSecondHandTransformForAngle:");
}

id objc_msgSend_applySecondHandColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applySecondHandColor:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return _[a1 background];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_bottomComplicationDay(void *a1, const char *a2, ...)
{
  return _[a1 bottomComplicationDay];
}

id objc_msgSend_bottomComplicationNight(void *a1, const char *a2, ...)
{
  return _[a1 bottomComplicationNight];
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bundledFaceWithIdentifier_analyticsIdentifier_forDevice_initCustomization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundledFaceWithIdentifier:analyticsIdentifier:forDevice:initCustomization:");
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return _[a1 calendar];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_colorPalette(void *a1, const char *a2, ...)
{
  return _[a1 colorPalette];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_compactSoftFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compactSoftFontOfSize:weight:");
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return _[a1 complicationContainerView];
}

id objc_msgSend_complicationLayoutforSlot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "complicationLayoutforSlot:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentDisplayDate(void *a1, const char *a2, ...)
{
  return _[a1 currentDisplayDate];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_defaultFaceForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultFaceForDevice:");
}

id objc_msgSend_defaultHourConfigurationForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultHourConfigurationForDevice:");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return _[a1 deviceCategory];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return _[a1 display];
}

id objc_msgSend_displayTime(void *a1, const char *a2, ...)
{
  return _[a1 displayTime];
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return _[a1 editing];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return _[a1 faceDate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValueForFraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValueForFraction:");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_frameInterval(void *a1, const char *a2, ...)
{
  return _[a1 frameInterval];
}

id objc_msgSend_fullname(void *a1, const char *a2, ...)
{
  return _[a1 fullname];
}

id objc_msgSend_handImageView(void *a1, const char *a2, ...)
{
  return _[a1 handImageView];
}

id objc_msgSend_handLength(void *a1, const char *a2, ...)
{
  return _[a1 handLength];
}

id objc_msgSend_handleDialPaletteChangeWithHourStartColors_minuteStartColor_minuteEndColor_hourEndColor_hourTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDialPaletteChangeWithHourStartColors:minuteStartColor:minuteEndColor:hourEndColor:hourTextColor:");
}

id objc_msgSend_hourMinuteHandInlay(void *a1, const char *a2, ...)
{
  return _[a1 hourMinuteHandInlay];
}

id objc_msgSend_hourMinuteHandStrokeDay(void *a1, const char *a2, ...)
{
  return _[a1 hourMinuteHandStrokeDay];
}

id objc_msgSend_hourMinuteHandStrokeNight(void *a1, const char *a2, ...)
{
  return _[a1 hourMinuteHandStrokeNight];
}

id objc_msgSend_hourTickDay(void *a1, const char *a2, ...)
{
  return _[a1 hourTickDay];
}

id objc_msgSend_hourTickEndDay(void *a1, const char *a2, ...)
{
  return _[a1 hourTickEndDay];
}

id objc_msgSend_hourTickEndNight(void *a1, const char *a2, ...)
{
  return _[a1 hourTickEndNight];
}

id objc_msgSend_hourTickNight(void *a1, const char *a2, ...)
{
  return _[a1 hourTickNight];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageWithActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithActions:");
}

id objc_msgSend_includesDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "includesDate:");
}

id objc_msgSend_indexOfOption_forDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfOption:forDevice:");
}

id objc_msgSend_initForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForDevice:");
}

id objc_msgSend_initWithBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBounds:");
}

id objc_msgSend_initWithBounds_solarTimeModel_verticallyFitsPathToBounds_usePlaceholderData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBounds:solarTimeModel:verticallyFitsPathToBounds:usePlaceholderData:");
}

id objc_msgSend_initWithConfiguration_forDevice_maskedShadow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:forDevice:maskedShadow:");
}

id objc_msgSend_initWithDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:");
}

id objc_msgSend_initWithDevice_stretchySecondHandData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:stretchySecondHandData:");
}

id objc_msgSend_initWithDevice_style_palette_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:style:palette:");
}

id objc_msgSend_initWithFace_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFace:priority:");
}

id objc_msgSend_initWithFaceClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFaceClass:");
}

id objc_msgSend_initWithFaceStyle_forDevice_clientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFaceStyle:forDevice:clientIdentifier:");
}

id objc_msgSend_initWithFloatCurveElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFloatCurveElements:");
}

id objc_msgSend_initWithFloatValue_fraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFloatValue:fraction:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_forDeviceCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:forDeviceCornerRadius:");
}

id objc_msgSend_initWithFrame_identifier_options_colorSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:identifier:options:colorSpace:");
}

id objc_msgSend_initWithReferenceDate_referenceLocation_twilightType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReferenceDate:referenceLocation:twilightType:");
}

id objc_msgSend_initWithType_solarTimeModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:solarTimeModel:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return _[a1 interpolatedColorPalette];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isSeasonalCollection(void *a1, const char *a2, ...)
{
  return _[a1 isSeasonalCollection];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutRuleForComplicationState_layoutOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutRuleForComplicationState:layoutOverride:");
}

id objc_msgSend_light(void *a1, const char *a2, ...)
{
  return _[a1 light];
}

id objc_msgSend_lightingDelegate(void *a1, const char *a2, ...)
{
  return _[a1 lightingDelegate];
}

id objc_msgSend_localizedStringForKey_comment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:comment:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_logObject(void *a1, const char *a2, ...)
{
  return _[a1 logObject];
}

id objc_msgSend_longHourTickRadiusForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longHourTickRadiusForDevice:");
}

id objc_msgSend_lowFrequencyLightingTimerFired(void *a1, const char *a2, ...)
{
  return _[a1 lowFrequencyLightingTimerFired];
}

id objc_msgSend_metricsWithDevice_identitySizeClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsWithDevice:identitySizeClass:");
}

id objc_msgSend_minuteTickDay(void *a1, const char *a2, ...)
{
  return _[a1 minuteTickDay];
}

id objc_msgSend_minuteTickEnd(void *a1, const char *a2, ...)
{
  return _[a1 minuteTickEnd];
}

id objc_msgSend_minuteTickNight(void *a1, const char *a2, ...)
{
  return _[a1 minuteTickNight];
}

id objc_msgSend_minuteTickStart(void *a1, const char *a2, ...)
{
  return _[a1 minuteTickStart];
}

id objc_msgSend_normalComplicationDisplayWrapperForSlot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalComplicationDisplayWrapperForSlot:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberOfOptionsForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfOptionsForDevice:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_optionAtIndex_forDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionAtIndex:forDevice:");
}

id objc_msgSend_optionWithLight_forDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionWithLight:forDevice:");
}

id objc_msgSend_optionWithStyle_forDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionWithStyle:forDevice:");
}

id objc_msgSend_outerEdgeInsetForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outerEdgeInsetForDevice:");
}

id objc_msgSend_pegRadius(void *a1, const char *a2, ...)
{
  return _[a1 pegRadius];
}

id objc_msgSend_pegStrokeWidth(void *a1, const char *a2, ...)
{
  return _[a1 pegStrokeWidth];
}

id objc_msgSend_percentageThroughPeriodForWaypointDate(void *a1, const char *a2, ...)
{
  return _[a1 percentageThroughPeriodForWaypointDate];
}

id objc_msgSend_percentageThroughPeriodInCurrentSolarDayForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "percentageThroughPeriodInCurrentSolarDayForDate:");
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return _[a1 pigmentEditOption];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return _[a1 primaryColor];
}

id objc_msgSend_registerFactory_forSlot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerFactory:forSlot:");
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _[a1 removeAllAnimations];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAllQuads(void *a1, const char *a2, ...)
{
  return _[a1 removeAllQuads];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_renderInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderInContext:");
}

id objc_msgSend_renderSynchronouslyWithImageQueueDiscard_inGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderSynchronouslyWithImageQueueDiscard:inGroup:");
}

id objc_msgSend_sampleAtAngle_includeBaseRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sampleAtAngle:includeBaseRadius:");
}

id objc_msgSend_scaledValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledValue:");
}

id objc_msgSend_scaledValue_withOverrides_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledValue:withOverrides:");
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return _[a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return _[a1 screenScale];
}

id objc_msgSend_secondHandConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 secondHandConfiguration];
}

id objc_msgSend_secondHandDay(void *a1, const char *a2, ...)
{
  return _[a1 secondHandDay];
}

id objc_msgSend_secondHandNight(void *a1, const char *a2, ...)
{
  return _[a1 secondHandNight];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return _[a1 secondHandView];
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActions:");
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAffineTransform:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlpha_faceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:faceView:");
}

id objc_msgSend_setAnchorPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnchorPoint:");
}

id objc_msgSend_setArmLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArmLength:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setCircularComplicationDistanceFromCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCircularComplicationDistanceFromCenter:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setColorFraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColorFraction:");
}

id objc_msgSend_setColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColors:");
}

id objc_msgSend_setComplicationColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setComplicationColor:");
}

id objc_msgSend_setComplicationFactory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setComplicationFactory:");
}

id objc_msgSend_setContentTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentTransform:");
}

id objc_msgSend_setContentsCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsCenter:");
}

id objc_msgSend_setContentsMultiplyColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsMultiplyColor:");
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsScale:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setDefaultLayoutRule_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultLayoutRule:forState:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableActions:");
}

id objc_msgSend_setDropShadowOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDropShadowOpacity:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEndPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndPoint:");
}

id objc_msgSend_setFaceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaceView:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFontSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFontSize:");
}

id objc_msgSend_setForegroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForegroundColor:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFrameInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrameInterval:");
}

id objc_msgSend_setHandDotColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandDotColor:");
}

id objc_msgSend_setHandLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandLength:");
}

id objc_msgSend_setHandWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandWidth:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setInterpolatedComplicationColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterpolatedComplicationColor:");
}

id objc_msgSend_setKeyTimes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyTimes:");
}

id objc_msgSend_setLightSpillCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLightSpillCoordinator:");
}

id objc_msgSend_setLightingDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLightingDelegate:");
}

id objc_msgSend_setMajorHourLayers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMajorHourLayers:");
}

id objc_msgSend_setMinorHourLayers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinorHourLayers:");
}

id objc_msgSend_setMinorMinuteLayers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinorMinuteLayers:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOption_forCustomEditMode_slot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOption:forCustomEditMode:slot:");
}

id objc_msgSend_setOverrideDate_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideDate:duration:");
}

id objc_msgSend_setPalette_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPalette:");
}

id objc_msgSend_setPaused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaused:");
}

id objc_msgSend_setPlatterColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlatterColor:");
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPosition:");
}

id objc_msgSend_setPreferredFramesPerSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredFramesPerSecond:");
}

id objc_msgSend_setRadialShadowOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRadialShadowOpacity:");
}

id objc_msgSend_setReferenceLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReferenceLocation:");
}

id objc_msgSend_setSecondHandDotDiameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondHandDotDiameter:");
}

id objc_msgSend_setShadowDensity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowDensity:");
}

id objc_msgSend_setStartPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartPoint:");
}

id objc_msgSend_setStretchySecondHandData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStretchySecondHandData:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintedFraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintedFraction:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setUpdateDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateDelegate:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedLocationManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedLocationManager];
}

id objc_msgSend_snapshotInRect_scale_time_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotInRect:scale:time:");
}

id objc_msgSend_startSecondHandLightingAnimationAtDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSecondHandLightingAnimationAtDate:");
}

id objc_msgSend_startUpdatesWithUpdateFrequency_withHandler_identificationLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:");
}

id objc_msgSend_stopSecondHandLightingAnimation(void *a1, const char *a2, ...)
{
  return _[a1 stopSecondHandLightingAnimation];
}

id objc_msgSend_stopUpdatesForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopUpdatesForToken:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_supportsCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsCapability:");
}

id objc_msgSend_switcherSnapshotView(void *a1, const char *a2, ...)
{
  return _[a1 switcherSnapshotView];
}

id objc_msgSend_systemFontOfSize_weight_design_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:weight:design:");
}

id objc_msgSend_tailLength(void *a1, const char *a2, ...)
{
  return _[a1 tailLength];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return _[a1 timeView];
}

id objc_msgSend_topComplicationDay(void *a1, const char *a2, ...)
{
  return _[a1 topComplicationDay];
}

id objc_msgSend_topComplicationNight(void *a1, const char *a2, ...)
{
  return _[a1 topComplicationNight];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_updateDependentValues(void *a1, const char *a2, ...)
{
  return _[a1 updateDependentValues];
}

id objc_msgSend_updateModelWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateModelWithDate:");
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return _[a1 updateMonochromeColor];
}

id objc_msgSend_updateNightFractionForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateNightFractionForDate:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}