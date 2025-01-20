void sub_3A30(id a1)
{
  uint64_t vars8;

  qword_1C480 = objc_opt_new();

  _objc_release_x1();
}

void sub_4108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_4420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_4444(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1C4C0);
  id WeakRetained = objc_loadWeakRetained(&qword_1C4C8);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_1C4C8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_1C4D0;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_1C4C8, obj);
  qword_1C4D0 = (uint64_t)[obj version];

  sub_56B4(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1C4C0);
  long long v10 = *(_OWORD *)&qword_1C4A0;
  *a2 = xmmword_1C490;
  a2[1] = v10;
  a2[2] = xmmword_1C4B0;
}

void sub_4668(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_56B4(uint64_t a1, uint64_t a2)
{
  id v8 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v8 scaledValue:86.0];
  *(void *)&xmmword_1C490 = v2;
  [v8 scaledValue:10.5];
  *((void *)&xmmword_1C490 + 1) = v3;
  [v8 scaledValue:-62.0];
  qword_1C4A0 = v4;
  [v8 scaledValue:84.5];
  qword_1C4A8 = v5;
  objc_msgSend(v8, "scaledSize:", 41.5, 14.5);
  *(void *)&xmmword_1C4B0 = v6;
  *((void *)&xmmword_1C4B0 + 1) = v7;
}

void sub_5D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5D68(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[12] returnReusableResource:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

id sub_6334()
{
  if (qword_1C4E0 != -1) {
    dispatch_once(&qword_1C4E0, &stru_14648);
  }
  v0 = (void *)qword_1C4D8;

  return v0;
}

uint64_t sub_7748(uint64_t a1)
{
  uint64_t v2 = CLKUIConvertUIImageToMTLTexture();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 128);
  *(void *)(v3 + 128) = v2;

  uint64_t v5 = CLKUIConvertUIImageToMTLTexture();
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v5;

  double v8 = *(double *)(a1 + 56);
  double v9 = *(double *)(a1 + 64);
  long long v10 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) size];
  *(void *)(*(void *)(a1 + 32) + 160) = objc_msgSend(v10, "meshForRect:maxPitch:", v8, v9, v11, v12, 10.0);

  return _objc_release_x1();
}

uint64_t sub_78DC(uint64_t a1)
{
  uint64_t v2 = CLKUIConvertUIImageToMTLTexture();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 144);
  *(void *)(v3 + 144) = v2;

  double v5 = *(double *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  uint64_t v7 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) size];
  *(void *)(*(void *)(a1 + 32) + 168) = objc_msgSend(v7, "meshForRect:maxPitch:", v5, v6, v8, v9, 10.0);

  return _objc_release_x1();
}

uint64_t sub_7A3C(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 152) = CLKUIConvertUIImageToMTLTexture();

  return _objc_release_x1();
}

void sub_8334(id a1)
{
  qword_1C4D8 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

void sub_8390(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

double sub_8CAC(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1C518);
  id WeakRetained = objc_loadWeakRetained(&qword_1C520);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_1C520);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_1C520, v1);
    qword_1C528 = (uint64_t)[v1 version];

    sub_9B40(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_1C528;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1C518);
  double v9 = *(double *)&qword_1C4F8;

  return v9;
}

void sub_9A9C(id a1)
{
  qword_1C4E8 = (uint64_t)objc_alloc_init((Class)NSCache);

  _objc_release_x1();
}

void sub_9B40(uint64_t a1, uint64_t a2)
{
  id v6 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v6 scaledValue:14.0];
  qword_1C4F8 = v2;
  [v6 scaledValue:13.0];
  qword_1C500 = v3;
  objc_msgSend(v6, "scaledSize:", 41.5, 14.5);
  qword_1C508 = v4;
  qword_1C510 = v5;
}

void sub_9FB4(_Unwind_Exception *a1)
{
  sub_A448(v1);
  _Unwind_Resume(a1);
}

id sub_9FD8(uint64_t a1, void *a2, double *a3)
{
  id v5 = a2;
  id v6 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v6 setAlignment:1];
  v55 = v6;
  v56 = v5;
  if (v5)
  {
    v59[0] = NSFontAttributeName;
    v59[1] = NSParagraphStyleAttributeName;
    v60[0] = v5;
    v60[1] = v6;
    id v7 = (id *)v60;
    uint64_t v8 = (NSAttributedStringKey *)v59;
    uint64_t v9 = 2;
  }
  else
  {
    NSAttributedStringKey v57 = NSParagraphStyleAttributeName;
    id v58 = v6;
    id v7 = &v58;
    uint64_t v8 = &v57;
    uint64_t v9 = 1;
  }
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v8 count:v9];
  CFAttributedStringRef v11 = (const __CFAttributedString *)[objc_alloc((Class)NSAttributedString) initWithString:*(void *)(a1 + 32) attributes:v10];
  v54 = (void *)v10;
  CFAttributedStringRef v12 = (const __CFAttributedString *)[objc_alloc((Class)NSAttributedString) initWithString:*(void *)(a1 + 40) attributes:v10];
  v13 = CTFramesetterCreateWithAttributedString(v11);
  v14 = CTFramesetterCreateWithAttributedString(v12);
  v62.length = (CFIndex)[(__CFAttributedString *)v11 length];
  v62.location = 0;
  v66.width = 1.79769313e308;
  v66.double height = 1.79769313e308;
  CGSize v15 = CTFramesetterSuggestFrameSizeWithConstraints(v13, v62, 0, v66, 0);
  v63.length = (CFIndex)[(__CFAttributedString *)v12 length];
  v63.location = 0;
  v67.width = 1.79769313e308;
  v67.double height = 1.79769313e308;
  CGSize v16 = CTFramesetterSuggestFrameSizeWithConstraints(v14, v63, 0, v67, 0);
  double v17 = *(double *)(a1 + 48);
  double v18 = *(double *)(a1 + 56);
  if (v15.width + v17 * 2.0 >= v16.width + v17 * 2.0) {
    double v19 = v15.width + v17 * 2.0;
  }
  else {
    double v19 = v16.width + v17 * 2.0;
  }
  if (v15.height >= v16.height + v18) {
    double height = v15.height;
  }
  else {
    double height = v16.height + v18;
  }
  CGFloat y = CGPointZero.y;
  v68.origin.x = CGPointZero.x;
  v68.origin.CGFloat y = y;
  v68.size.width = v19;
  v68.size.double height = height;
  size_t v22 = (unint64_t)(CGRectGetMaxX(v68) * *(double *)(a1 + 64));
  v69.origin.x = CGPointZero.x;
  v69.origin.CGFloat y = y;
  v69.size.width = v19;
  v69.size.double height = height;
  size_t v23 = (unint64_t)(CGRectGetMaxY(v69) * *(double *)(a1 + 64));
  DeviceGraCGFloat y = CGColorSpaceCreateDeviceGray();
  v25 = CGBitmapContextCreate(0, v22, v23, 8uLL, v22, DeviceGray, 7u);
  CGContextScaleCTM(v25, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 64));
  Mutable = CGPathCreateMutable();
  v70.origin.CGFloat y = height - v15.height;
  v70.origin.x = 0.0;
  v70.size.width = v19;
  v70.size.double height = v15.height;
  CGPathAddRect(Mutable, 0, v70);
  v64.length = (CFIndex)[(__CFAttributedString *)v11 length];
  cf = v13;
  v64.location = 0;
  Frame = CTFramesetterCreateFrame(v13, v64, Mutable, 0);
  v28 = CGPathCreateMutable();
  v71.origin.CGFloat y = height - v16.height - *(double *)(a1 + 56);
  v71.origin.x = 0.0;
  v71.size.width = v19;
  v71.size.double height = v16.height;
  CGPathAddRect(v28, 0, v71);
  v65.length = (CFIndex)[(__CFAttributedString *)v12 length];
  v53 = v14;
  v65.location = 0;
  v29 = CTFramesetterCreateFrame(v14, v65, v28, 0);
  if (a3)
  {
    [*(id *)(a1 + 72) _opticalBoundsFromFrame:v29 context:v25];
    double v31 = v30;
    CGFloat v50 = v33;
    CGFloat v51 = v32;
    CGFloat v35 = v34;
    [*(id *)(a1 + 72) _opticalBoundsFromFrame:Frame context:v25];
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    if (v31 >= v36) {
      double v44 = v36;
    }
    else {
      double v44 = v31;
    }
    v72.origin.x = v31;
    v72.size.width = v50;
    v72.origin.CGFloat y = v51;
    v72.size.double height = v35;
    double MaxX = CGRectGetMaxX(v72);
    v73.origin.x = v37;
    v73.origin.CGFloat y = v39;
    v73.size.width = v41;
    v73.size.double height = v43;
    double v46 = CGRectGetMaxX(v73);
    if (MaxX >= v46) {
      double v46 = MaxX;
    }
    *a3 = v19 * 0.5 - (v44 + (v46 - v44) * 0.5);
  }
  CTFrameDraw(Frame, v25);
  CTFrameDraw(v29, v25);
  Image = CGBitmapContextCreateImage(v25);
  v48 = +[UIImage imageWithCGImage:Image scale:0 orientation:*(double *)(a1 + 64)];
  CGImageRelease(Image);
  CGContextRelease(v25);
  CGColorSpaceRelease(DeviceGray);
  CFRelease(Frame);
  CFRelease(cf);
  CGPathRelease(Mutable);
  CFRelease(v29);
  CFRelease(v53);
  CGPathRelease(v28);

  return v48;
}

void sub_A448(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

double NTKMagmaReduceMotionMultiplier()
{
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  double result = 1.0;
  if (IsReduceMotionEnabled) {
    return 0.5;
  }
  return result;
}

intptr_t sub_AF38(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
}

double sub_B0B0(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

float32x2_t sub_B124(uint64_t a1)
{
  uint32_t v2 = arc4random();
  float32x2_t v3 = vcvt_f32_s32((int32x2_t)__PAIR64__(arc4random(), v2));
  float32x2_t v4 = vmul_f32(v3, v3);
  v4.i32[0] = vadd_f32(v4, (float32x2_t)vdup_lane_s32((int32x2_t)v4, 1)).u32[0];
  float32x2_t v5 = vrsqrte_f32((float32x2_t)v4.u32[0]);
  float32x2_t v6 = vmul_f32(v5, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v5, v5)));
  return vmul_n_f32(vmul_n_f32(v3, vmul_f32(v6, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v6, v6))).f32[0]), *(float *)(a1 + 32));
}

float32x2_t sub_B23C(float32x2_t *a1, double a2, float32x2_t a3)
{
  float32x2_t v3 = vadd_f32(a3, (float32x2_t)0xBF000000BF000000);
  float32x2_t v4 = vmul_f32(vadd_f32(v3, v3), a1[4]);
  float32x2_t v5 = vadd_f32(v4, (float32x2_t)vdup_lane_s32((int32x2_t)v4, 1));
  float32x2_t v6 = vmul_f32(v5, v5);
  double v7 = 1.0 - sqrtf(vadd_f32(v6, v6).f32[0]);
  if (v7 < 0.0) {
    double v7 = 0.0;
  }
  float v8 = v7;
  return vmul_n_f32(a1[5], v8);
}

float32x2_t sub_B34C(float32x2_t *a1, double a2, float32x2_t a3)
{
  float32x2_t v3 = vadd_f32(a3, (float32x2_t)0xBF000000BF000000);
  float32x2_t v4 = vmul_f32(vadd_f32(v3, v3), a1[4]);
  float32x2_t v5 = vadd_f32(v4, (float32x2_t)vdup_lane_s32((int32x2_t)v4, 1));
  float32x2_t v6 = vmul_f32(v5, v5);
  double v7 = 1.0 - vadd_f32(v6, v6).f32[0];
  if (v7 < 0.0) {
    double v7 = 0.0;
  }
  float v8 = v7;
  return vmul_n_f32(a1[5], v8);
}

float32x2_t sub_B404(uint64_t a1, double a2, double a3, float32x2_t a4)
{
  [*(id *)(a1 + 32) size];
  float64_t v16 = v6;
  [*(id *)(a1 + 32) size];
  v7.f64[0] = v16;
  v7.f64[1] = v8;
  __asm { FMOV            V0.2D, #0.5 }
  *(float32x2_t *)&_Q0.f64[0] = vcvt_f32_f64(vsubq_f64(vmulq_f64(v7, _Q0), vcvtq_f64_f32(a4)));
  float32x2_t v14 = vmul_f32(*(float32x2_t *)&_Q0.f64[0], *(float32x2_t *)&_Q0.f64[0]);
  v14.i32[0] = vadd_f32(v14, (float32x2_t)vdup_lane_s32((int32x2_t)v14, 1)).u32[0];
  *(float32x2_t *)&v7.f64[0] = vrsqrte_f32((float32x2_t)v14.u32[0]);
  *(float32x2_t *)&v7.f64[0] = vmul_f32(*(float32x2_t *)&v7.f64[0], vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)&v7.f64[0], *(float32x2_t *)&v7.f64[0])));
  *(float32x2_t *)&_Q0.f64[0] = vmul_n_f32(*(float32x2_t *)&_Q0.f64[0], vmul_f32(*(float32x2_t *)&v7.f64[0], vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)&v7.f64[0], *(float32x2_t *)&v7.f64[0]))).f32[0]);
  *(float *)v7.f64 = -*((float *)_Q0.f64 + 1);
  return vmul_n_f32((float32x2_t)vzip1_s32(*(int32x2_t *)&v7.f64[0], *(int32x2_t *)&_Q0.f64[0]), *(float *)(a1 + 40));
}

float32x2_t sub_B554(uint64_t a1, double a2, double a3, float32x2_t a4)
{
  float v4 = *(double *)(a1 + 40);
  float32x2_t v5 = vmul_n_f32(vsub_f32(a4, *(float32x2_t *)(a1 + 32)), v4);
  float32x2_t v6 = vmul_f32(v5, v5);
  unsigned __int32 v7 = vadd_f32(v6, (float32x2_t)vdup_lane_s32((int32x2_t)v6, 1)).u32[0];
  float v8 = *(float *)(a1 + 48) / vaddv_f32(v6);
  if (v8 >= *(float *)(a1 + 52)) {
    float v8 = *(float *)(a1 + 52);
  }
  float32x2_t v9 = vrsqrte_f32((float32x2_t)v7);
  float32x2_t v10 = vmul_f32(v9, vrsqrts_f32((float32x2_t)v7, vmul_f32(v9, v9)));
  return vmul_n_f32(vmul_n_f32(v5, vmul_f32(v10, vrsqrts_f32((float32x2_t)v7, vmul_f32(v10, v10))).f32[0]), v8);
}

float32x2_t sub_B664(uint64_t a1, double a2, double a3, float32x2_t a4)
{
  float v4 = *(double *)(a1 + 40);
  float32x2_t v5 = vmul_n_f32(vsub_f32(a4, *(float32x2_t *)(a1 + 32)), v4);
  float32x2_t v6 = vmul_f32(v5, v5);
  unsigned __int32 v7 = vadd_f32(v6, (float32x2_t)vdup_lane_s32((int32x2_t)v6, 1)).u32[0];
  double v8 = vaddv_f32(v6);
  float v9 = 0.0;
  if (*(double *)(a1 + 48) >= v8) {
    float v9 = *(float *)(a1 + 56);
  }
  float32x2_t v10 = vrsqrte_f32((float32x2_t)v7);
  float32x2_t v11 = vmul_f32(v10, vrsqrts_f32((float32x2_t)v7, vmul_f32(v10, v10)));
  return vmul_n_f32(vmul_n_f32(v5, vmul_f32(v11, vrsqrts_f32((float32x2_t)v7, vmul_f32(v11, v11))).f32[0]), v9);
}

float32x2_t sub_B77C(uint64_t a1, double a2, double a3, float32x2_t a4)
{
  float v4 = *(double *)(a1 + 40);
  float32x2_t v5 = vmul_n_f32(vsub_f32(a4, *(float32x2_t *)(a1 + 32)), v4);
  float32x2_t v6 = vmul_f32(v5, v5);
  unsigned __int32 v7 = vadd_f32(v6, (float32x2_t)vdup_lane_s32((int32x2_t)v6, 1)).u32[0];
  double v8 = vaddv_f32(v6);
  double v9 = *(double *)(a1 + 48);
  double v10 = 0.0;
  if (v9 >= v8) {
    double v10 = *(float *)(a1 + 56);
  }
  float v11 = v8 / v9 * v10;
  float32x2_t v12 = vrsqrte_f32((float32x2_t)v7);
  float32x2_t v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v7, vmul_f32(v12, v12)));
  return vmul_n_f32(vmul_n_f32(v5, vmul_f32(v13, vrsqrts_f32((float32x2_t)v7, vmul_f32(v13, v13))).f32[0]), v11);
}

float32x2_t sub_B8A4(uint64_t a1, double a2, double a3, float32x2_t a4)
{
  float v4 = *(double *)(a1 + 40);
  float32x2_t v5 = vmul_n_f32(vsub_f32(a4, *(float32x2_t *)(a1 + 32)), v4);
  float32x2_t v6 = vmul_f32(v5, v5);
  unsigned __int32 v7 = vadd_f32(v6, (float32x2_t)vdup_lane_s32((int32x2_t)v6, 1)).u32[0];
  double v8 = vaddv_f32(v6) / *(double *)(a1 + 48);
  double v9 = 1.0 - v8;
  BOOL v10 = v8 < 1.0;
  double v11 = 0.0;
  if (v10) {
    double v11 = v9;
  }
  float v12 = v11 * *(float *)(a1 + 56);
  float32x2_t v13 = vrsqrte_f32((float32x2_t)v7);
  float32x2_t v14 = vmul_f32(v13, vrsqrts_f32((float32x2_t)v7, vmul_f32(v13, v13)));
  return vmul_n_f32(vmul_n_f32(v5, vmul_f32(v14, vrsqrts_f32((float32x2_t)v7, vmul_f32(v14, v14))).f32[0]), v12);
}

float32x2_t sub_B9D0(uint64_t a1, double a2, double a3, float32x2_t a4)
{
  float v4 = *(double *)(a1 + 40);
  float32x2_t v5 = vmul_n_f32(vsub_f32(a4, *(float32x2_t *)(a1 + 32)), v4);
  double v6 = vaddv_f32(vmul_f32(v5, v5)) / *(double *)(a1 + 48);
  BOOL v7 = v6 < 1.0;
  double v8 = 1.0 - v6;
  if (!v7) {
    double v8 = 0.0;
  }
  float v9 = v8;
  return vmul_n_f32(*(float32x2_t *)(a1 + 56), v9);
}

void sub_BEE0(id a1)
{
  qword_1C530 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

void sub_BF3C()
{
  sub_83AC();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Failed to create pipeline state, error %@", v1, 0xCu);
}

void sub_BFB0()
{
  sub_83AC();
  sub_8390(&dword_0, v0, v1, "Failed to load from binary archive: %@", v2, v3, v4, v5, v6);
}

void sub_C018()
{
  sub_83AC();
  sub_8390(&dword_0, v0, v1, "Failed to created pipeline state, error %@", v2, v3, v4, v5, v6);
}

void sub_C080()
{
  sub_83AC();
  sub_8390(&dword_0, v0, v1, "Magma Collision Texture Load Failure: Magma collision texture (%@) data is nil", v2, v3, v4, v5, v6);
}

void sub_C0E8()
{
  sub_83AC();
  sub_8390(&dword_0, v0, v1, "Magma Collision Texture Load Failure: Magma collision texture (%@) data.bytes is nil", v2, v3, v4, v5, v6);
}

void sub_C150()
{
  sub_83AC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_0, v1, OS_LOG_TYPE_FAULT, "Magma Collision Texture Load Error: Magma collision texture (%@) error loading: %@", v2, 0x16u);
}

void sub_C1D4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "+[NTKMagmaTimeRenderer renderTimeWithHour:minute:fontSize:lineSpacing:]";
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "%s Victory Tritium font is nil", (uint8_t *)&v1, 0xCu);
}

void sub_C258(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "+[NTKMagmaTimeRenderer renderTimeWithHour:minute:fontSize:lineSpacing:]";
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "%s Victory font is nil", (uint8_t *)&v1, 0xCu);
}

void sub_C2DC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "NTKMagmaQuad timed out in prepareForTime", v1, 2u);
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return _CGColorSpaceCreateDeviceGray();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

void CGPathRelease(CGPathRef path)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

uint64_t CLKPointRoundForDevice()
{
  return _CLKPointRoundForDevice();
}

uint64_t CLKRoundForDevice()
{
  return _CLKRoundForDevice();
}

uint64_t CLKUIConvertToRGBfFromUIColor()
{
  return _CLKUIConvertToRGBfFromUIColor();
}

uint64_t CLKUIConvertUIImageToMTLTexture()
{
  return _CLKUIConvertUIImageToMTLTexture();
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  return _CTFontGetAscent(font);
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return _CTFrameGetLines(frame);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return _CTFramesetterCreateFrame(framesetter, stringRange, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return _CTFramesetterCreateWithAttributedString(attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  CGSize v7 = _CTFramesetterSuggestFrameSizeWithConstraints(framesetter, stringRange, frameAttributes, constraints, fitRange);
  double height = v7.height;
  double width = v7.width;
  result.double height = height;
  result.double width = width;
  return result;
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  return _CTLineGetImageBounds(line, context);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKImageNamed()
{
  return _NTKImageNamed();
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

uint64_t NTKSensitivityForVictoryFaces()
{
  return _NTKSensitivityForVictoryFaces();
}

uint64_t NTKShowVictoryFaces()
{
  return _NTKShowVictoryFaces();
}

uint64_t NTKSwatchTwoColorGradientImage()
{
  return _NTKSwatchTwoColorGradientImage();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

uint32_t arc4random(void)
{
  return _arc4random();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend__binaryArchives(void *a1, const char *a2, ...)
{
  return [a1 _binaryArchives];
}

id objc_msgSend__buttonColor(void *a1, const char *a2, ...)
{
  return [a1 _buttonColor];
}

id objc_msgSend__createBackgroundQuad(void *a1, const char *a2, ...)
{
  return [a1 _createBackgroundQuad];
}

id objc_msgSend__createMesh(void *a1, const char *a2, ...)
{
  return [a1 _createMesh];
}

id objc_msgSend__createMeshBackgroundIndices(void *a1, const char *a2, ...)
{
  return [a1 _createMeshBackgroundIndices];
}

id objc_msgSend__createMeshVertices(void *a1, const char *a2, ...)
{
  return [a1 _createMeshVertices];
}

id objc_msgSend__createPhysicsBuffers(void *a1, const char *a2, ...)
{
  return [a1 _createPhysicsBuffers];
}

id objc_msgSend__loadBackgroundIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _loadBackgroundIfNeeded];
}

id objc_msgSend__loadCollisionTexture(void *a1, const char *a2, ...)
{
  return [a1 _loadCollisionTexture];
}

id objc_msgSend__loadCornerOverlayView(void *a1, const char *a2, ...)
{
  return [a1 _loadCornerOverlayView];
}

id objc_msgSend__loadEffectsView(void *a1, const char *a2, ...)
{
  return [a1 _loadEffectsView];
}

id objc_msgSend__loadLogoView(void *a1, const char *a2, ...)
{
  return [a1 _loadLogoView];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__loadSwoosh(void *a1, const char *a2, ...)
{
  return [a1 _loadSwoosh];
}

id objc_msgSend__setupQuadView(void *a1, const char *a2, ...)
{
  return [a1 _setupQuadView];
}

id objc_msgSend__triggerTimeChangeAnimation(void *a1, const char *a2, ...)
{
  return [a1 _triggerTimeChangeAnimation];
}

id objc_msgSend__unloadCornerOverlayView(void *a1, const char *a2, ...)
{
  return [a1 _unloadCornerOverlayView];
}

id objc_msgSend__unloadEffectsView(void *a1, const char *a2, ...)
{
  return [a1 _unloadEffectsView];
}

id objc_msgSend__unloadLogoView(void *a1, const char *a2, ...)
{
  return [a1 _unloadLogoView];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_backgroundEnd(void *a1, const char *a2, ...)
{
  return [a1 backgroundEnd];
}

id objc_msgSend_backgroundMask(void *a1, const char *a2, ...)
{
  return [a1 backgroundMask];
}

id objc_msgSend_backgroundStart(void *a1, const char *a2, ...)
{
  return [a1 backgroundStart];
}

id objc_msgSend_backgroundStyle(void *a1, const char *a2, ...)
{
  return [a1 backgroundStyle];
}

id objc_msgSend_backgroundTextureAlpha(void *a1, const char *a2, ...)
{
  return [a1 backgroundTextureAlpha];
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

id objc_msgSend_collectionName(void *a1, const char *a2, ...)
{
  return [a1 collectionName];
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return [a1 colorAttachments];
}

id objc_msgSend_colorPalette(void *a1, const char *a2, ...)
{
  return [a1 colorPalette];
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return [a1 colorPixelFormat];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dequeueAndPreparePhysicsInputBuffer(void *a1, const char *a2, ...)
{
  return [a1 dequeueAndPreparePhysicsInputBuffer];
}

id objc_msgSend_dequeueReusableResource(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableResource];
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

id objc_msgSend_digits(void *a1, const char *a2, ...)
{
  return [a1 digits];
}

id objc_msgSend_digitsBackgroundOff(void *a1, const char *a2, ...)
{
  return [a1 digitsBackgroundOff];
}

id objc_msgSend_digitsBackgroundOn(void *a1, const char *a2, ...)
{
  return [a1 digitsBackgroundOn];
}

id objc_msgSend_digitsOutline(void *a1, const char *a2, ...)
{
  return [a1 digitsOutline];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_indexCt(void *a1, const char *a2, ...)
{
  return [a1 indexCt];
}

id objc_msgSend_indices(void *a1, const char *a2, ...)
{
  return [a1 indices];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return [a1 isComplete];
}

id objc_msgSend_isCompositePalette(void *a1, const char *a2, ...)
{
  return [a1 isCompositePalette];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return [a1 isHighlighted];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isRainbowColor(void *a1, const char *a2, ...)
{
  return [a1 isRainbowColor];
}

id objc_msgSend_isSpecialColor(void *a1, const char *a2, ...)
{
  return [a1 isSpecialColor];
}

id objc_msgSend_isTritium(void *a1, const char *a2, ...)
{
  return [a1 isTritium];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_logo(void *a1, const char *a2, ...)
{
  return [a1 logo];
}

id objc_msgSend_logoBackgroundOff(void *a1, const char *a2, ...)
{
  return [a1 logoBackgroundOff];
}

id objc_msgSend_maskedBackgroundEnd(void *a1, const char *a2, ...)
{
  return [a1 maskedBackgroundEnd];
}

id objc_msgSend_maskedBackgroundOffEnd(void *a1, const char *a2, ...)
{
  return [a1 maskedBackgroundOffEnd];
}

id objc_msgSend_maskedBackgroundOffStart(void *a1, const char *a2, ...)
{
  return [a1 maskedBackgroundOffStart];
}

id objc_msgSend_maskedBackgroundOnEnd(void *a1, const char *a2, ...)
{
  return [a1 maskedBackgroundOnEnd];
}

id objc_msgSend_maskedBackgroundOnStart(void *a1, const char *a2, ...)
{
  return [a1 maskedBackgroundOnStart];
}

id objc_msgSend_maskedBackgroundStart(void *a1, const char *a2, ...)
{
  return [a1 maskedBackgroundStart];
}

id objc_msgSend_maxTotalThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerThreadgroup];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_overrideDate(void *a1, const char *a2, ...)
{
  return [a1 overrideDate];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_primaryBackgroundEnd(void *a1, const char *a2, ...)
{
  return [a1 primaryBackgroundEnd];
}

id objc_msgSend_primaryBackgroundStart(void *a1, const char *a2, ...)
{
  return [a1 primaryBackgroundStart];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_quadView(void *a1, const char *a2, ...)
{
  return [a1 quadView];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_rotationRate(void *a1, const char *a2, ...)
{
  return [a1 rotationRate];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedDevice(void *a1, const char *a2, ...)
{
  return [a1 sharedDevice];
}

id objc_msgSend_sharedRenderingContext(void *a1, const char *a2, ...)
{
  return [a1 sharedRenderingContext];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_supportsVictoryFaces(void *a1, const char *a2, ...)
{
  return [a1 supportsVictoryFaces];
}

id objc_msgSend_swatchStyle(void *a1, const char *a2, ...)
{
  return [a1 swatchStyle];
}

id objc_msgSend_swoosh(void *a1, const char *a2, ...)
{
  return [a1 swoosh];
}

id objc_msgSend_threadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 threadExecutionWidth];
}

id objc_msgSend_timeSubstringFromSeparatorText(void *a1, const char *a2, ...)
{
  return [a1 timeSubstringFromSeparatorText];
}

id objc_msgSend_timeSubstringToSeparatorText(void *a1, const char *a2, ...)
{
  return [a1 timeSubstringToSeparatorText];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_transitionFraction(void *a1, const char *a2, ...)
{
  return [a1 transitionFraction];
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return [a1 uniqueId];
}

id objc_msgSend_userAcceleration(void *a1, const char *a2, ...)
{
  return [a1 userAcceleration];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_vertices(void *a1, const char *a2, ...)
{
  return [a1 vertices];
}

id objc_msgSend_victoryFontWithSize_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "victoryFontWithSize:style:");
}