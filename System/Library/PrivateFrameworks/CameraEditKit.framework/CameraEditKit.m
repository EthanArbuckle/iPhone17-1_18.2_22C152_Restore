double CEKInterpolate(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double CEKInterpolateClamped(double a1, double a2, double a3)
{
  return fmax(fmin(fmax(a1, a2), a1 + (a2 - a1) * a3), fmin(a1, a2));
}

double CEKRectWithSize()
{
  return 0.0;
}

double CEKClamp(double a1, double a2, double a3)
{
  return fmax(fmin(fmax(a2, a3), a1), fmin(a2, a3));
}

double CEKProgressClamped(double a1, double a2, double a3)
{
  double v3 = 0.0;
  if (a3 != a2) {
    double v3 = (a1 - a2) / (a3 - a2);
  }
  return fmax(fmin(v3, 1.0), 0.0);
}

double CEKSizeScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

double CEKSizeMax(double a1, double a2, double a3)
{
  return fmax(a1, a3);
}

uint64_t CEKIsSFCameraSupportedForLocale(void *a1)
{
  uint64_t v1 = CEKIsSFCameraSupportedForLocale_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&CEKIsSFCameraSupportedForLocale_onceToken, &__block_literal_global_2_0);
  }
  double v3 = (void *)CEKIsSFCameraSupportedForLocale_sfCameraLanguageCodes;
  v4 = [v2 languageCode];

  uint64_t v5 = [v3 containsObject:v4];
  return v5;
}

void __CEKIsSmallPhone_block_invoke()
{
  id v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 _referenceBounds];
  BOOL v1 = v0 == 568.0;
  if (v2 != 320.0) {
    BOOL v1 = 0;
  }
  CEKIsSmallPhone_isSmallPhone = v1;
}

uint64_t CEKIsSmallPhone()
{
  if (CEKIsSmallPhone_onceToken != -1) {
    dispatch_once(&CEKIsSmallPhone_onceToken, &__block_literal_global_2);
  }
  return CEKIsSmallPhone_isSmallPhone;
}

void sub_1BEE2FC48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t CEKIsPadLayoutForView(void *a1)
{
  id v1 = a1;
  double v2 = [v1 window];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [v1 window];
  v8 = [v7 screen];
  [v8 _referenceBounds];
  double v10 = v9;
  double v12 = v11;
  v13 = [v1 traitCollection];

  uint64_t v14 = [v13 userInterfaceIdiom];
  uint64_t v15 = v14 == 1;
  if (v4 * v6 != 0.0 && v14 == 1)
  {
    BOOL v17 = fmin(v4, v6) >= fmin(v10, v12) * 0.8;
    if (fmax(v4, v6) < fmax(v10, v12) * 0.8) {
      BOOL v17 = 0;
    }
    uint64_t v15 = v4 >= v6 || v17;
  }

  return v15;
}

uint64_t CEKIsViewInMultitask(void *a1)
{
  id v1 = [a1 window];
  uint64_t v2 = [v1 screen];
  double v3 = (void *)v2;
  if (v1)
  {
    [v1 bounds];
    double v7 = v6;
    double v9 = v8;
    if (!v3) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v4 = *MEMORY[0x1E4F1DB28];
    uint64_t v5 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    if (!v2)
    {
LABEL_6:
      uint64_t v12 = 0;
      goto LABEL_10;
    }
  }
  double v10 = v7;
  double v11 = v9;
  if (CGRectIsEmpty(*(CGRect *)&v4)) {
    goto LABEL_6;
  }
  [v3 _referenceBounds];
  BOOL v14 = fmin(v7, v9) != v13;
  uint64_t v12 = fmax(v7, v9) != v15 || v14;
LABEL_10:

  return v12;
}

void CEKExpandNormalizedRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
}

double CEKExpandNormalizedPoint(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v14.origin.x = a3;
  v14.origin.y = a4;
  v14.size.width = a5;
  v14.size.height = a6;
  double MinX = CGRectGetMinX(v14);
  v15.origin.x = a3;
  v15.origin.y = a4;
  v15.size.width = a5;
  v15.size.height = a6;
  double v12 = MinX + (CGRectGetMaxX(v15) - MinX) * a1;
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  CGRectGetMinY(v16);
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  CGRectGetMaxY(v17);
  return v12;
}

double CEKSizeCeilToScale()
{
  UICeilToScale();
  double v1 = v0;
  UICeilToScale();
  return v1;
}

id CEKFontOfSizeWeightStyle(uint64_t a1, CGFloat a2, double a3)
{
  if (a1 == 1)
  {
    uint64_t v5 = _CEKSFCameraFontOfSizeAndWeight(a2, a3);
    double v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      CEKFontOfSizeAndStyle(a2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v4 = v7;
  }
  else if (a1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1798], "systemFontOfSize:weight:design:", *MEMORY[0x1E4FB28B0], a2);
  }
  return v4;
}

CTFontRef _CEKSFCameraFontOfSizeAndWeight(CGFloat a1, double a2)
{
  if (UIAccessibilityIsBoldTextEnabled())
  {
    CTFontGetAccessibilityBoldWeightOfWeight();
    a2 = v4;
  }
  _CEKSFCameraFontNameForWeight(a2);
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CTFontRef v6 = CTFontCreateWithNameAndOptions(v5, a1, 0, 0x400uLL);

  return v6;
}

__CFString *_CEKSFCameraFontNameForWeight(double a1)
{
  if (*MEMORY[0x1E4FB29E8] == a1) {
    return @".SFCamera-Ultralight";
  }
  if (*MEMORY[0x1E4FB29D8] == a1) {
    return @".SFCamera-Thin";
  }
  if (*MEMORY[0x1E4FB29B8] == a1) {
    return @".SFCamera-Light";
  }
  if (*MEMORY[0x1E4FB29C8] == a1) {
    return @".SFCamera-Regular";
  }
  if (*MEMORY[0x1E4FB29C0] == a1) {
    return @".SFCamera-Medium";
  }
  if (*MEMORY[0x1E4FB29D0] == a1) {
    return @".SFCamera-Semibold";
  }
  if (*MEMORY[0x1E4FB29A8] == a1) {
    return @".SFCamera-Bold";
  }
  if (*MEMORY[0x1E4FB29A0] == a1 || *MEMORY[0x1E4FB29B0] == a1) {
    return @".SFCamera-Heavy";
  }
  else {
    return 0;
  }
}

double CEKPortraitOrientedSize(double a1, double a2)
{
  return fmin(a1, a2);
}

id CEKSmartStyleRepresentativeColorForCastType(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v1 = CEKSmartStylePaletteColorsForCastType(a1);
  double v20 = 0.0;
  double v21 = 0.0;
  double v22 = 0.0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v1);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        if ([v7 getRed:&v16 green:&v17 blue:&v18 alpha:0])
        {
          for (uint64_t j = 0; j != 24; j += 8)
            *(double *)((char *)&v20 + j) = *(double *)((char *)&v16 + j) + *(double *)((char *)&v20 + j);
          ++v4;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v19 count:16];
    }
    while (v3);
    if (v4 >= 1)
    {
      for (uint64_t k = 0; k != 24; k += 8)
        *(double *)((char *)&v20 + k) = *(double *)((char *)&v20 + k) / (double)v4;
    }
  }
  double v10 = [MEMORY[0x1E4FB1618] colorWithRed:v20 green:v21 blue:v22 alpha:1.0];

  return v10;
}

id CEKSmartStylePaletteColorsForCastType(uint64_t a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  switch(a1)
  {
    case 6:
      double v1 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.266666667 green:0.549019608 blue:0.796078431 alpha:1.0];
      uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.780392157 green:0.698039216 blue:0.6 alpha:1.0];
      uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.6 green:0.525490196 blue:0.458823529 alpha:1.0];
      uint64_t v4 = (void *)MEMORY[0x1E4FB1618];
      double v5 = 0.509803922;
      double v6 = 0.792156863;
      double v7 = 0.611764706;
      goto LABEL_10;
    case 7:
      double v1 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:1.0 green:0.796078431 blue:0.698039216 alpha:1.0];
      uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:1.0 green:0.898039216 blue:0.643137255 alpha:1.0];
      uint64_t v9 = 0x3FEB3B3B3B3B3B3BLL;
      uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.819607843 green:0.850980392 blue:0.584313725 alpha:1.0];
      uint64_t v4 = (void *)MEMORY[0x1E4FB1618];
      double v5 = 0.694117647;
      double v7 = 0.901960784;
      goto LABEL_12;
    case 8:
      double v1 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.960784314 green:0.960784314 blue:0.960784314 alpha:1.0];
      uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.835294118 green:0.835294118 blue:0.835294118 alpha:1.0];
      uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.57254902 green:0.57254902 blue:0.57254902 alpha:1.0];
      uint64_t v4 = (void *)MEMORY[0x1E4FB1618];
      double v5 = 0.368627451;
      goto LABEL_14;
    case 9:
      double v1 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.792156863 green:0.564705882 blue:0.580392157 alpha:1.0];
      uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.384313725 green:0.00784313725 blue:0.0117647059 alpha:1.0];
      uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:1.0 green:0.807843137 blue:0.439215686 alpha:1.0];
      uint64_t v4 = (void *)MEMORY[0x1E4FB1618];
      double v5 = 0.392156863;
      double v6 = 0.376470588;
      double v7 = 0.235294118;
      goto LABEL_10;
    case 10:
      double v1 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.964705882 green:0.8 blue:0.949019608 alpha:1.0];
      uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.984313725 green:0.890196078 blue:0.890196078 alpha:1.0];
      uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.854901961 green:0.980392157 blue:0.866666667 alpha:1.0];
      uint64_t v4 = (void *)MEMORY[0x1E4FB1618];
      double v5 = 0.811764706;
      double v6 = 0.992156863;
      double v10 = 1.0;
      double v7 = 0.992156863;
      goto LABEL_15;
    case 11:
      double v1 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.474509804 green:0.0980392157 blue:0.0823529412 alpha:1.0];
      uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.88627451 green:0.490196078 blue:0.290196078 alpha:1.0];
      uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.235294118 green:0.498039216 blue:0.380392157 alpha:1.0];
      uint64_t v4 = (void *)MEMORY[0x1E4FB1618];
      double v5 = 0.305882353;
      double v6 = 0.764705882;
      double v7 = 0.862745098;
      goto LABEL_10;
    case 12:
      double v1 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.964705882 green:0.776470588 blue:0.819607843 alpha:1.0];
      uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.968627451 green:0.815686275 blue:0.768627451 alpha:1.0];
      uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.784313725 green:0.921568627 blue:0.77254902 alpha:1.0];
      uint64_t v4 = (void *)MEMORY[0x1E4FB1618];
      double v5 = 0.725490196;
      double v6 = 0.866666667;
      double v7 = 0.949019608;
LABEL_10:
      double v10 = 1.0;
      goto LABEL_15;
    case 13:
      double v1 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.937254902 green:0.48627451 blue:0.501960784 alpha:1.0];
      uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.898039216 green:0.792156863 blue:0.341176471 alpha:1.0];
      uint64_t v9 = 0x3FE6565656565656;
      uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.698039216 green:0.784313725 blue:0.278431373 alpha:1.0];
      uint64_t v4 = (void *)MEMORY[0x1E4FB1618];
      double v5 = 0.345098039;
      double v7 = 0.690196078;
LABEL_12:
      double v10 = 1.0;
      double v6 = *(double *)&v9;
      goto LABEL_15;
    case 14:
      double v1 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.8 green:0.8 blue:0.8 alpha:1.0];
      uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.631372549 green:0.631372549 blue:0.631372549 alpha:1.0];
      uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.388235294 green:0.388235294 blue:0.388235294 alpha:1.0];
      uint64_t v4 = (void *)MEMORY[0x1E4FB1618];
      double v5 = 0.274509804;
LABEL_14:
      double v10 = 1.0;
      double v6 = v5;
      double v7 = v5;
LABEL_15:
      double v8 = [v4 colorWithDisplayP3Red:v5 green:v6 blue:v7 alpha:v10];
      break;
    default:
      double v1 = 0;
      uint64_t v2 = 0;
      uint64_t v3 = 0;
      double v8 = 0;
      break;
  }
  double v11 = (void *)MEMORY[0x1E4F1CBF0];
  if (v1 && v2 && v3 && v8)
  {
    v13[0] = v1;
    v13[1] = v2;
    v13[2] = v3;
    v13[3] = v8;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  }

  return v11;
}

uint64_t __CEKIsSFCameraSupportedForLocale_block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"en", @"fr", @"es", @"de", @"pt", @"it", @"nl", @"sv", @"da", @"fi", @"no", @"tr", @"id", @"ms", @"hu", @"pl", @"cs",
    @"sk",
    @"ca",
    @"ro",
    @"hr",
  CEKIsSFCameraSupportedForLocale_sfCameraLanguageCodes = 0);
  return MEMORY[0x1F41817F8]();
}

double Rotation(float a1, float a2, float a3)
{
  unint64_t v3 = __PAIR64__(LODWORD(a3), LODWORD(a2));
  int32x4_t v4 = (int32x4_t)vmulq_f32((float32x4_t)v3, (float32x4_t)v3);
  v4.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v4, 2), vadd_f32(*(float32x2_t *)v4.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v4.i8, 1))).u32[0];
  float32x2_t v5 = vrsqrte_f32((float32x2_t)v4.u32[0]);
  float32x2_t v6 = vmul_f32(v5, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v5, v5)));
  float32x4_t v26 = vmulq_n_f32((float32x4_t)v3, vmul_f32(v6, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v6, v6))).f32[0]);
  __float2 v7 = __sincosf_stret(a1);
  _Q19 = v26;
  _S5 = (float)(1.0 - v7.__cosval) * v26.f32[0];
  __asm
  {
    FMLA            S7, S5, V19.S[1]
    FMLA            S16, S5, V19.S[2]
  }
  double v16 = COERCE_DOUBLE(__PAIR64__(_S7, COERCE_UNSIGNED_INT(vmlas_n_f32(v7.__cosval, _S5, v26.f32[0]))));
  __asm { FMLA            S6, S5, V19.S[1] }
  _S7 = vmuls_lane_f32(1.0 - v7.__cosval, *(float32x2_t *)v26.f32, 1);
  __asm
  {
    FMLA            S16, S7, V19.S[1]
    FMLA            S17, S7, V19.S[2]
    FMLA            S6, S5, V19.S[2]
    FMLA            S0, S7, V19.S[2]
  }
  _S3 = vmuls_lane_f32(1.0 - v7.__cosval, v26, 2);
  __asm { FMLA            S1, S3, V19.S[2] }
  return v16;
}

CGAffineTransform *CubePoints(uint64_t a1, uint64_t a2, float64x2_t *a3, uint64_t *a4, uint64_t a5, CGFloat a6, CGFloat a7)
{
  memset(&v18, 0, sizeof(v18));
  result = CGAffineTransformMakeScale(&v18, a6, a7);
  if (a5 >= 1)
  {
    float64x2_t v13 = *(float64x2_t *)&v18.a;
    float64x2_t v14 = *(float64x2_t *)&v18.c;
    float64x2_t v15 = *(float64x2_t *)&v18.tx;
    do
    {
      uint64_t v16 = *a4++;
      uint64_t v17 = (double *)(a1 + 16 * *(void *)(a2 + 8 * v16));
      *a3++ = vaddq_f64(v15, vmlaq_n_f64(vmulq_n_f64(v14, v17[1]), v13, *v17));
      --a5;
    }
    while (a5);
  }
  return result;
}

CGPath *CreateRoundedPathForConvexPolygon(double *a1, uint64_t a2, double a3)
{
  Mutable = CGPathCreateMutable();
  __float2 v7 = Mutable;
  double v8 = a1[2];
  double v9 = a1[3];
  double v10 = *a1 - v8;
  double v11 = a1[1] - v9;
  double v12 = sqrt(v11 * v11 + v10 * v10);
  double v13 = v10 / v12;
  BOOL v14 = v12 == 0.0;
  if (v12 == 0.0) {
    double v13 = 0.0;
  }
  double v15 = v11 / v12;
  if (v14) {
    double v15 = 0.0;
  }
  CGPathMoveToPoint(Mutable, 0, v8 + v10 - v13 * a3, v9 + v11 - v15 * a3);
  if (a2 >= 1)
  {
    uint64_t v16 = 0;
    uint64_t v17 = a1 + 1;
    do
    {
      if (a2 - 1 == v16) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = v16 + 1;
      }
      v19 = &a1[2 * v18];
      double v20 = &a1[2 * ((v16 + 2) % a2)];
      double v21 = *v19;
      double v22 = v19[1];
      double v23 = *(v17 - 1);
      double v25 = *v20;
      double v24 = v20[1];
      double v26 = *v19 - v23;
      double v27 = v22 - *v17;
      double v28 = sqrt(v27 * v27 + v26 * v26);
      double v29 = v26 / v28;
      BOOL v30 = v28 == 0.0;
      if (v28 == 0.0) {
        double v29 = 0.0;
      }
      double v31 = v27 / v28;
      if (v30) {
        double v31 = 0.0;
      }
      CGPathAddLineToPoint(v7, 0, v23 + v26 - v29 * a3, *v17 + v27 - v31 * a3);
      if (a3 > 0.0)
      {
        double v32 = v21 - v25;
        double v33 = v22 - v24;
        double v34 = sqrt(v33 * v33 + v32 * v32);
        double v35 = (v21 - v25) / v34;
        BOOL v36 = v34 == 0.0;
        if (v34 == 0.0) {
          double v35 = 0.0;
        }
        double v37 = v33 / v34;
        if (v36) {
          double v37 = 0.0;
        }
        CGPathAddQuadCurveToPoint(v7, 0, v21, v22, v25 + v32 - v35 * a3, v24 + v33 - v37 * a3);
      }
      ++v16;
      v17 += 2;
    }
    while (a2 != v16);
  }
  return v7;
}

void sub_1BEE37DD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BEE37ED0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

double convertDampingRatioAndResponseToTensionAndFriction(double *a1, double *a2, double result, double a4)
{
  double v4 = 6.28318531 / a4 * (6.28318531 / a4);
  if (a1) {
    *a1 = v4;
  }
  if (a2)
  {
    double v5 = sqrt(v4);
    result = (v5 + v5) * result;
    *a2 = result;
  }
  return result;
}

double convertTensionAndFrictionToDampingRatioAndResponse(double *a1, double *a2, double a3, double a4)
{
  double result = sqrt(a3);
  if (a1) {
    *a1 = a4 / (result + result);
  }
  if (a2)
  {
    double result = 6.28318531 / result;
    *a2 = result;
  }
  return result;
}

double convertDampingMassAndStiffnessToDampingRatioAndResponse(double *a1, double *a2, double result, double a4, double a5)
{
  double v5 = sqrt(a5 / a4);
  if (a1)
  {
    double result = result / a4 / (v5 + v5);
    *a1 = result;
  }
  if (a2)
  {
    double result = 6.28318531 / v5;
    *a2 = 6.28318531 / v5;
  }
  return result;
}

uint64_t CEKHapticsAllowed()
{
  if (CEKHapticsAllowed_onceToken != -1) {
    dispatch_once(&CEKHapticsAllowed_onceToken, &__block_literal_global_0);
  }
  return CEKHapticsAllowed_allowsHaptics;
}

uint64_t __CEKHapticsAllowed_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  CEKHapticsAllowed_allowsHaptics = result;
  return result;
}

void sub_1BEE405C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CGColorRef CreateStrokeColor()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v3[0] = xmmword_1BEE749C0;
  v3[1] = unk_1BEE749D0;
  CGColorRef v1 = CGColorCreate(DeviceRGB, (const CGFloat *)v3);
  CGColorSpaceRelease(DeviceRGB);
  return v1;
}

CGGradientRef CreateBackgroundGradient()
{
  v37[11] = *MEMORY[0x1E4F143B8];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  __asm { FMOV            V0.2D, #1.0 }
  long long v18 = _Q0;
  *(_OWORD *)components = _Q0;
  CGColorRef v19 = CGColorCreate(DeviceGray, components);
  v37[0] = v19;
  *(_OWORD *)double v35 = v18;
  *(void *)&long long v18 = CGColorCreate(DeviceGray, v35);
  v37[1] = v18;
  *(_OWORD *)double v34 = xmmword_1BEE748A0;
  CGColorRef v17 = CGColorCreate(DeviceGray, v34);
  v37[2] = v17;
  *(_OWORD *)double v33 = xmmword_1BEE748B0;
  CGColorRef v6 = CGColorCreate(DeviceGray, v33);
  v37[3] = v6;
  *(_OWORD *)double v32 = xmmword_1BEE748C0;
  CGColorRef v7 = CGColorCreate(DeviceGray, v32);
  v37[4] = v7;
  *(_OWORD *)double v31 = xmmword_1BEE748D0;
  CGColorRef v8 = CGColorCreate(DeviceGray, v31);
  v37[5] = v8;
  *(_OWORD *)BOOL v30 = xmmword_1BEE748E0;
  CGColorRef v9 = CGColorCreate(DeviceGray, v30);
  v37[6] = v9;
  *(_OWORD *)double v29 = xmmword_1BEE748F0;
  CGColorRef v10 = CGColorCreate(DeviceGray, v29);
  v37[7] = v10;
  *(_OWORD *)double v28 = xmmword_1BEE74900;
  CGColorRef v11 = CGColorCreate(DeviceGray, v28);
  v37[8] = v11;
  *(_OWORD *)double v27 = xmmword_1BEE74910;
  CGColorRef v12 = CGColorCreate(DeviceGray, v27);
  v37[9] = v12;
  *(_OWORD *)double v26 = xmmword_1BEE74920;
  CGColorRef v13 = CGColorCreate(DeviceGray, v26);
  v37[10] = v13;
  *(_OWORD *)locations = xmmword_1BEE74930;
  long long v21 = xmmword_1BEE74940;
  long long v22 = xmmword_1BEE74950;
  long long v23 = xmmword_1BEE74960;
  long long v24 = xmmword_1BEE74970;
  uint64_t v25 = 0x3FF0000000000000;
  BOOL v14 = CGGradientCreateWithColors(DeviceGray, (CFArrayRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:11], locations);

  CGGradientRef CopyWithAlpha = CubeGradientCreateCopyWithAlpha();
  CGGradientRelease(v14);
  CGColorSpaceRelease(DeviceGray);
  return CopyWithAlpha;
}

CGColorRef CreateFillColor()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)CGColorRef v8 = _Q0;
  CGColorRef v6 = CGColorCreate(DeviceGray, v8);
  CGColorSpaceRelease(DeviceGray);
  return v6;
}

CGGradientRef CreateGlowGradient()
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)components = xmmword_1BEE749E0;
  long long v23 = unk_1BEE749F0;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGColorRef v1 = CGColorCreate(DeviceRGB, components);
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(v1, 1.0);
  v21[0] = CopyWithAlpha;
  CGColorRef v13 = CGColorCreateCopyWithAlpha(v1, 0.872);
  v21[1] = v13;
  CGColorRef v12 = CGColorCreateCopyWithAlpha(v1, 0.697);
  v21[2] = v12;
  CGColorRef v11 = CGColorCreateCopyWithAlpha(v1, 0.536);
  v21[3] = v11;
  CGColorRef v2 = CGColorCreateCopyWithAlpha(v1, 0.392);
  v21[4] = v2;
  CGColorRef v3 = CGColorCreateCopyWithAlpha(v1, 0.268);
  v21[5] = v3;
  CGColorRef v4 = CGColorCreateCopyWithAlpha(v1, 0.18);
  v21[6] = v4;
  CGColorRef v5 = CGColorCreateCopyWithAlpha(v1, 0.119);
  v21[7] = v5;
  CGColorRef v6 = CGColorCreateCopyWithAlpha(v1, 0.079);
  v21[8] = v6;
  CGColorRef v7 = CGColorCreateCopyWithAlpha(v1, 0.059);
  v21[9] = v7;
  CGColorRef v8 = CGColorCreateCopyWithAlpha(v1, 0.0);
  v21[10] = v8;
  uint64_t v20 = 0x3FF0000000000000;
  long long v17 = xmmword_1BEE74A20;
  long long v18 = unk_1BEE74A30;
  long long v19 = xmmword_1BEE74A40;
  *(_OWORD *)locations = xmmword_1BEE74A00;
  long long v16 = unk_1BEE74A10;
  CGGradientRef v9 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:11], locations);

  CGColorRelease(v1);
  CGColorSpaceRelease(DeviceRGB);
  return v9;
}

CGGradientRef CreateMaskGradient(CGFloat a1, CGFloat a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  components[0] = 1.0;
  components[1] = a1;
  CGColorRef v5 = CGColorCreate(DeviceGray, components);
  v12[0] = v5;
  v10[0] = 1.0;
  v10[1] = a2;
  CGColorRef v6 = CGColorCreate(DeviceGray, v10);
  v12[1] = v6;
  long long v9 = xmmword_1BEE74980;
  CGGradientRef v7 = CGGradientCreateWithColors(DeviceGray, (CFArrayRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2], (const CGFloat *)&v9);

  CGColorSpaceRelease(DeviceGray);
  return v7;
}

CGGradientRef CubeGradientCreateCopyWithAlpha()
{
  ColorSpace = (CGColorSpace *)CGGradientGetColorSpace();
  size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
  size_t LocationCount = CGGradientGetLocationCount();
  CGColorRef v5 = (CGFloat *)malloc_type_calloc(8 * NumberOfComponents + 8, LocationCount, 0xDF3CE48AuLL);
  CGColorRef v6 = (CGFloat *)malloc_type_calloc(8uLL, LocationCount, 0x53B41BBEuLL);
  CGGradientApply();
  CGGradientRef v3 = CGGradientCreateWithColorComponents(ColorSpace, v5, v6, LocationCount);
  free(v6);
  free(v5);
  return v3;
}

uint64_t _CubeGradientCreateCopyWithAlphaApplier(uint64_t result, uint64_t *a2, double a3)
{
  uint64_t v3 = *(void *)(result + 32);
  uint64_t v4 = *(void *)(result + 8);
  uint64_t v5 = *(void *)(result + 16);
  if (v4)
  {
    CGColorRef v6 = (void *)(v5 + 8 * v3 * (v4 + 1));
    CGGradientRef v7 = a2;
    uint64_t v8 = *(void *)(result + 8);
    do
    {
      uint64_t v9 = *v7++;
      *v6++ = v9;
      --v8;
    }
    while (v8);
  }
  *(double *)(v5 + 8 * ((v4 + 1) * v3 + v4)) = *(double *)&a2[v4] * *(double *)result;
  *(double *)(*(void *)(result + 24) + 8 * v3) = a3;
  *(void *)(result + 32) = v3 + 1;
  return result;
}

CGColorRef CubeColorCreateInterpolated(CGColorRef color, CGColorRef a2, double a3)
{
  if (!((unint64_t)color | (unint64_t)a2)) {
    return 0;
  }
  if (color)
  {
    if (a2)
    {
      ColorSpace = CGColorGetColorSpace(color);
      uint64_t v8 = CGColorGetColorSpace(a2);
      CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
      if (Model != CGColorSpaceGetModel(v8)) {
        abort();
      }
      size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
      Components = CGColorGetComponents(color);
      CGColorRef v12 = CGColorGetComponents(a2);
      size_t v13 = NumberOfComponents + 1;
      BOOL v14 = NumberOfComponents == -1;
      double v15 = (const CGFloat *)malloc_type_calloc(8 * (NumberOfComponents + 1), 1uLL, 0xCA02327DuLL);
      long long v16 = (CGFloat *)v15;
      if (!v14)
      {
        long long v17 = (double *)v15;
        do
        {
          double v18 = *Components++;
          double v19 = v18;
          double v20 = *v12++;
          *v17++ = v19 + (v20 - v19) * a3;
          --v13;
        }
        while (v13);
      }
      CGColorRef v21 = CGColorCreate(ColorSpace, v15);
      free(v16);
      return v21;
    }
    double v22 = (1.0 - a3) * CGColorGetAlpha(color);
    long long v23 = color;
  }
  else
  {
    double v22 = CGColorGetAlpha(a2) * a3;
    long long v23 = a2;
  }
  return CGColorCreateCopyWithAlpha(v23, v22);
}

CGGradientRef CubeGradientCreateInterpolated(uint64_t a1, uint64_t a2, double a3)
{
  if (!(a1 | a2)) {
    return 0;
  }
  if (a1 && a2)
  {
    uint64_t LocationCount = CGGradientGetLocationCount();
    if (LocationCount != CGGradientGetLocationCount()
      || (size_t v6 = CGGradientGetLocationCount(),
          ColorSpace = (CGColorSpace *)CGGradientGetColorSpace(),
          uint64_t v8 = (CGColorSpace *)CGGradientGetColorSpace(),
          CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace),
          Model != CGColorSpaceGetModel(v8)))
    {
      abort();
    }
    space = ColorSpace;
    size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
    size_t v11 = 8 * (NumberOfComponents + 1);
    double v29 = (double *)malloc_type_calloc(v11, v6, 0xEA2BD2E0uLL);
    CGColorRef v12 = (double *)malloc_type_calloc(v11, v6, 0x75F3B625uLL);
    BOOL v30 = (CGFloat *)malloc_type_calloc(v11, v6, 0x9607E606uLL);
    size_t v13 = (double *)malloc_type_calloc(8uLL, v6, 0x1A021E2FuLL);
    BOOL v14 = (double *)malloc_type_calloc(8uLL, v6, 0x316EA296uLL);
    double v15 = (CGFloat *)malloc_type_calloc(8uLL, v6, 0x51DF049DuLL);
    CGGradientApply();
    CGGradientApply();
    if (v6)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 8 * NumberOfComponents + 8;
      double v18 = v30;
      double v19 = v12;
      double v20 = v29;
      do
      {
        v15[v16] = v13[v16] + (v14[v16] - v13[v16]) * a3;
        CGColorRef v21 = v18;
        double v22 = v19;
        long long v23 = v20;
        size_t v24 = NumberOfComponents + 1;
        if (NumberOfComponents != -1)
        {
          do
          {
            double v25 = *v23++;
            double v26 = v25;
            double v27 = *v22++;
            *v21++ = v26 + (v27 - v26) * a3;
            --v24;
          }
          while (v24);
        }
        ++v16;
        double v20 = (double *)((char *)v20 + v17);
        double v19 = (double *)((char *)v19 + v17);
        double v18 = (double *)((char *)v18 + v17);
      }
      while (v16 != v6);
    }
    CGGradientRef v3 = CGGradientCreateWithColorComponents(space, v30, v15, v6);
    free(v13);
    free(v14);
    free(v15);
    free(v29);
    free(v12);
    free(v30);
    return v3;
  }
  return CubeGradientCreateCopyWithAlpha();
}

void *_CubeGradientCreateInterpolatedApplier(void *result, uint64_t *a2, double a3)
{
  uint64_t v3 = result[3];
  uint64_t v4 = *result + 1;
  if (*result != -1)
  {
    uint64_t v5 = (void *)(result[1] + 8 * v3 * v4);
    do
    {
      uint64_t v6 = *a2++;
      *v5++ = v6;
      --v4;
    }
    while (v4);
  }
  *(double *)(result[2] + 8 * v3) = a3;
  result[3] = v3 + 1;
  return result;
}

double CEKPixelWidthForView(void *a1)
{
  CGColorRef v1 = [a1 traitCollection];
  [v1 displayScale];
  double v3 = 1.0 / v2;

  return v3;
}

uint64_t CEKIsPadLayoutForWindowSizeInScreenSize(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t result = a1 == 1;
  if (a2 * a3 != 0.0 && a1 == 1)
  {
    BOOL v8 = fmin(a2, a3) >= fmin(a4, a5) * 0.8;
    if (fmax(a2, a3) < fmax(a4, a5) * 0.8) {
      BOOL v8 = 0;
    }
    return a2 >= a3 || v8;
  }
  return result;
}

double CEKScrollableDistanceInScrollView(void *a1)
{
  id v1 = a1;
  [v1 contentInset];
  double v3 = v2;
  double v5 = v4;
  [v1 contentSize];
  double v7 = v6 + v3 + v5;
  [v1 bounds];
  double v9 = v8;

  return fmax(v7 - v9, 0.0);
}

BOOL CEKEdgeInsetsEqualToInsets(double a1, double a2, double a3, double a4)
{
  return a2 == a4 && a1 == a3;
}

id CEKFontOfSizeAndStyle(uint64_t a1, CGFloat a2)
{
  return CEKFontOfSizeWeightStyle(a1, a2, *MEMORY[0x1E4FB29C8]);
}

id CEKMonospacedStylisticNumeralFontOfSizeAndStyle(uint64_t a1, CGFloat a2)
{
  v24[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4FB2888];
  v22[0] = *MEMORY[0x1E4FB2898];
  uint64_t v4 = v22[0];
  v22[1] = v5;
  v23[0] = &unk_1F1A0FA78;
  v23[1] = &unk_1F1A0FA90;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v24[0] = v6;
  v20[0] = v4;
  v20[1] = v5;
  v21[0] = &unk_1F1A0FAA8;
  v21[1] = &unk_1F1A0FAC0;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v24[1] = v7;
  v18[0] = v4;
  v18[1] = v5;
  v19[0] = &unk_1F1A0FAA8;
  v19[1] = &unk_1F1A0FAD8;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v24[2] = v8;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];

  CGColorRef v10 = CEKFontOfSizeWeightStyle(a1, a2, *MEMORY[0x1E4FB29C8]);
  size_t v11 = [v10 fontDescriptor];
  uint64_t v16 = *MEMORY[0x1E4FB2868];
  uint64_t v17 = v9;
  CGColorRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  size_t v13 = [v11 fontDescriptorByAddingAttributes:v12];

  BOOL v14 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v13 size:a2];

  return v14;
}

uint64_t CEKIsCustomKerningSupportedForLocale(void *a1)
{
  id v1 = [a1 languageCode];
  int v2 = [v1 isEqualToString:@"ar"];

  return v2 ^ 1u;
}

double CEKProgress(double a1, double a2, double a3)
{
  double result = 0.0;
  if (a3 != a2) {
    return (a1 - a2) / (a3 - a2);
  }
  return result;
}

double CEKNormalizePoint(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v15.origin.x = a3;
  v15.origin.y = a4;
  v15.size.width = a5;
  v15.size.height = a6;
  double MinX = CGRectGetMinX(v15);
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  double MaxX = CGRectGetMaxX(v16);
  double v13 = 0.0;
  if (MaxX != MinX) {
    double v13 = (a1 - MinX) / (MaxX - MinX);
  }
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  CGRectGetMinY(v17);
  v18.origin.x = a3;
  v18.origin.y = a4;
  v18.size.width = a5;
  v18.size.height = a6;
  CGRectGetMaxY(v18);
  return v13;
}

double CEKNormalizeSize(double a1, double a2, double a3)
{
  double result = a1 / a3;
  if (a3 == 0.0) {
    return 0.0;
  }
  return result;
}

void CEKNormalizeRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
}

double CEKExpandNormalizedSize(double a1, double a2, double a3)
{
  return a3 * a1 + 0.0;
}

double CEKExpandNormalizedContactPoint(double a1, double a2)
{
  if (CEKExpandNormalizedContactPoint_onceToken != -1) {
    dispatch_once(&CEKExpandNormalizedContactPoint_onceToken, &__block_literal_global_105);
  }
  CGFloat v4 = *(double *)&CEKExpandNormalizedContactPoint_contactFrame_2;
  CGFloat v5 = *(double *)&CEKExpandNormalizedContactPoint_contactFrame_3;
  return CEKExpandNormalizedPoint(a1, a2, 0.0, 0.0, v4, v5);
}

void __CEKExpandNormalizedContactPoint_block_invoke()
{
  double v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v0 _referenceBounds];
  CGFloat v18 = v1;
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  [v0 scale];
  double v8 = (void *)MGCopyAnswer();
  double v9 = v8;
  if (v8)
  {
    CGColorRef v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", objc_msgSend(objc_retainAutorelease(v8), "bytes"), "{CGRect={CGPoint=dd}{CGSize=dd}}");
    [v10 CGRectValue];
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    CGRect v15 = os_log_create("com.apple.camera", "CameraEditKit");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEE2D000, v15, OS_LOG_TYPE_DEFAULT, "No data found for CameraButton MG query", buf, 2u);
    }

    double v12 = 0.0;
    double v14 = 0.610402524;
  }
  CEKExpandNormalizedPoint(v12, v14, v18, v3, v5, v7);
  UIRectRoundToScale();
  CEKExpandNormalizedContactPoint_contactFrame_2 = v16;
  CEKExpandNormalizedContactPoint_contactFrame_3 = v17;
}

double CEKSizeAdd(double a1, double a2, double a3)
{
  return a1 + a3;
}

double CEKSizeSubtract(double a1, double a2, double a3)
{
  return a1 - a3;
}

double CEKSizeInvert(double a1, double a2)
{
  return a2;
}

double CEKSizeMin(double a1, double a2, double a3)
{
  return fmin(a1, a3);
}

CGFloat CEKRectInsetsInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGFloat v18 = a2 - a6;
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  CGRectGetMaxY(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  CGRectGetMaxY(v20);
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  CGRectGetMaxX(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  CGRectGetMaxX(v22);
  return v18;
}

id CEKDisplayStringForSemanticStyleMakerPreset(unint64_t a1)
{
  if (a1 > 9)
  {
    double v2 = 0;
  }
  else
  {
    double v2 = CEKLocalizedFrameworkString(off_1E63CD828[a1], 0);
  }
  return v2;
}

id CEKLocalizedFrameworkString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3032000000;
  double v14 = __Block_byref_object_copy_;
  CGRect v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __CEKLocalizedFrameworkString_block_invoke;
  CGFloat v8[3] = &unk_1E63CD808;
  CGColorRef v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [&unk_1F1A0FF08 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_1BEE4773C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CEKFrameworkBundle()
{
  double v0 = (void *)__CEKFrameworkBundle;
  if (!__CEKFrameworkBundle)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B50] bundleForClass:NSClassFromString(&cfstr_Ceklightingeff.isa)];
    double v2 = (void *)__CEKFrameworkBundle;
    __CEKFrameworkBundle = v1;

    double v0 = (void *)__CEKFrameworkBundle;
  }
  return v0;
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

uint64_t __CEKLocalizedFrameworkString_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  CGFloat v7 = CEKFrameworkBundle();
  uint64_t v8 = [v7 localizedStringForKey:*(void *)(a1 + 32) value:&stru_1F1A048B0 table:v6];

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  CGColorRef v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToString:*(void *)(a1 + 32)];
  if ((result & 1) == 0) {
    *a4 = 1;
  }
  return result;
}

CGImage *CreateMask(int a1, void *a2, double a3, double a4, CGFloat a5)
{
  uint64_t v9 = a2;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  uint64_t v11 = CGBitmapContextCreate(0, (unint64_t)(a3 * a5), (unint64_t)(a4 * a5), 8uLL, (unint64_t)(a3 * a5), DeviceGray, 0);
  CGContextScaleCTM(v11, a5, a5);
  CGContextTranslateCTM(v11, a3 * 0.5, a4 * 0.5);
  v9[2](v9, v11);

  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  CGColorSpaceRelease(DeviceGray);
  if (!a1) {
    return Image;
  }
  size_t Width = CGImageGetWidth(Image);
  size_t Height = CGImageGetHeight(Image);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(Image);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(Image);
  size_t BytesPerRow = CGImageGetBytesPerRow(Image);
  DataProvider = CGImageGetDataProvider(Image);
  CGImageRef v19 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, 0, 0);
  CGImageRelease(Image);
  return v19;
}

void DrawPlaneGlow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, double a7, double a8, double a9, double a10, double a11)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __DrawPlaneGlow_block_invoke;
  aBlock[3] = &__block_descriptor_104_e47_v56__0_CGPoint_dd_8_CGPoint_dd_24_CGPoint_dd_40l;
  *(double *)&aBlock[4] = a7;
  aBlock[5] = a5;
  aBlock[6] = a1;
  aBlock[7] = a4;
  *(double *)&aBlock[8] = a8;
  *(double *)&aBlock[9] = a9;
  *(double *)&aBlock[10] = a10;
  *(double *)&aBlock[11] = a11;
  aBlock[12] = a3;
  CGRect v22 = (void (**)(void, double, double, double, double, double, double))_Block_copy(aBlock);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  CGFloat v30[2] = __DrawPlaneGlow_block_invoke_2;
  v30[3] = &__block_descriptor_104_e61_v72__0_CGPoint_dd_8_CGPoint_dd_24_CGPoint_dd_40_CGPoint_dd_56l;
  *(double *)&v30[4] = a7;
  v30[5] = a5;
  v30[6] = a1;
  v30[7] = a4;
  *(double *)&v30[8] = a8;
  *(double *)&v30[9] = a9;
  *(double *)&v30[10] = a10;
  *(double *)&v30[11] = a11;
  v30[12] = a3;
  long long v23 = (void (**)(void, double, double, double, double, double, double, double, double))_Block_copy(v30);
  uint64_t v24 = 0;
  do
  {
    if (((1 << v24) & a6) != 0)
    {
      ++v24;
    }
    else
    {
      uint64_t v25 = v24 + 1;
      v23[2](v23, *(double *)(a2 + 16 * v24), *(double *)(a2 + 16 * v24 + 8), *(double *)(a2 + 16 * ((v24 + 1) & 3)), *(double *)(a2 + 16 * ((v24 + 1) & 3) + 8), *(double *)(a2 + 16 * (((_BYTE)v24 - 1) & 3)), *(double *)(a2 + 16 * (((_BYTE)v24 - 1) & 3) + 8), *(double *)(a2 + 16 * (((_BYTE)v24 + 2) & 3)), *(double *)(a2 + 16 * (((_BYTE)v24 + 2) & 3) + 8));
      uint64_t v24 = v25;
    }
  }
  while (v24 != 4);
  if (a7 > 0.0)
  {
    uint64_t v26 = 0;
    double v27 = (double *)(a2 + 8);
    do
    {
      uint64_t v28 = v26 + 1;
      if (((1 << v26) & a6) == 0)
      {
        double v29 = (double *)(a2 + 16 * (((_BYTE)v26 - 1) & 3));
        v22[2](v22, *v29, v29[1], *(v27 - 1), *v27, *(double *)(a2 + 16 * (v28 & 3)), *(double *)(a2 + 16 * (v28 & 3) + 8));
      }
      v27 += 2;
      uint64_t v26 = v28;
    }
    while (v28 != 4);
  }
}

void DrawPlaneFill(CGContext *a1, CGFloat *a2, CGColor *a3, CGImage *a4, const CGPath *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, *a2, a2[1]);
  for (uint64_t i = 0; i != 6; i += 2)
    CGPathAddLineToPoint(Mutable, 0, a2[i + 2], a2[i + 3]);
  CGPathCloseSubpath(Mutable);
  CGContextSetFillColorWithColor(a1, a3);
  if (a4)
  {
    v21.origin.x = a6;
    v21.origin.y = a7;
    v21.size.width = a8;
    v21.size.height = a9;
    CGContextClipToMask(a1, v21, a4);
  }
  if (a5)
  {
    CGContextAddPath(a1, a5);
    CGContextClip(a1);
    CGContextBeginPath(a1);
  }
  CGContextAddPath(a1, Mutable);
  CGContextFillPath(a1);
  CGContextBeginPath(a1);
  CGContextResetClip(a1);
  CGPathRelease(Mutable);
}

void __DrawPlaneGlow_block_invoke(uint64_t a1, double a2, double a3, CGFloat a4, CGFloat a5, double a6, double a7)
{
  double v12 = atan2(a5 - a3, a4 - a2) + -1.57079633;
  double v13 = atan2(a5 - a7, a4 - a6) + 1.57079633;
  __double2 v14 = __sincos_stret(v12);
  double v15 = *(double *)(a1 + 32);
  __double2 v16 = __sincos_stret(v13);
  double v17 = v15 * v16.__cosval;
  double v18 = v15 * v16.__sinval;
  CGFloat v19 = a4 + v14.__cosval * v15;
  CGFloat v20 = a5 + v14.__sinval * v15;
  CGFloat v21 = a4 + v17;
  CGFloat v22 = a5 + v18;
  CGFloat v23 = v19 + v17;
  CGFloat v24 = v20 + v18;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, a4, a5);
  CGPathAddLineToPoint(Mutable, 0, v19, v20);
  CGPathAddLineToPoint(Mutable, 0, v23, v24);
  CGPathAddLineToPoint(Mutable, 0, v21, v22);
  CGPathCloseSubpath(Mutable);
  uint64_t v26 = *(const CGPath **)(a1 + 40);
  if (v26)
  {
    CGContextAddPath(*(CGContextRef *)(a1 + 48), v26);
    CGContextClip(*(CGContextRef *)(a1 + 48));
    CGContextBeginPath(*(CGContextRef *)(a1 + 48));
  }
  double v27 = *(CGImage **)(a1 + 56);
  if (v27) {
    CGContextClipToMask(*(CGContextRef *)(a1 + 48), *(CGRect *)(a1 + 64), v27);
  }
  CGContextAddPath(*(CGContextRef *)(a1 + 48), Mutable);
  CGContextClip(*(CGContextRef *)(a1 + 48));
  CGContextBeginPath(*(CGContextRef *)(a1 + 48));
  v29.x = a4;
  v29.y = a5;
  v30.x = a4;
  v30.y = a5;
  CGContextDrawRadialGradient(*(CGContextRef *)(a1 + 48), *(CGGradientRef *)(a1 + 96), v29, 0.0, v30, *(CGFloat *)(a1 + 32), 0);
  CGContextResetClip(*(CGContextRef *)(a1 + 48));
  CGPathRelease(Mutable);
}

void __DrawPlaneGlow_block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7, double a8, double a9)
{
  double v17 = atan2(a5 - a3, a4 - a2) + -1.57079633;
  double v18 = *(double *)(a1 + 32);
  double v35 = v17;
  if (v18 <= 0.0)
  {
    double v23 = atan2(a3 - a7, a2 - a6);
    double v24 = atan2(a5 - a9, a4 - a8);
    __double2 v25 = __sincos_stret(v23);
    double xa = a2 + v25.__cosval * v18;
    double v22 = a3 + v25.__sinval * v18;
    __double2 v26 = __sincos_stret(v24);
    double cosval = v26.__cosval;
    double sinval = v26.__sinval;
  }
  else
  {
    __double2 v21 = __sincos_stret(v17);
    double cosval = v21.__cosval;
    double sinval = v21.__sinval;
    double xa = a2 + v21.__cosval * v18;
    double v22 = a3 + v21.__sinval * v18;
  }
  CGFloat v27 = a4 + cosval * v18;
  CGFloat v28 = a5 + sinval * v18;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, a2, a3);
  CGPathAddLineToPoint(Mutable, 0, a4, a5);
  CGPathAddLineToPoint(Mutable, 0, v27, v28);
  CGPathAddLineToPoint(Mutable, 0, xa, v22);
  CGPathCloseSubpath(Mutable);
  CGPoint v30 = *(const CGPath **)(a1 + 40);
  if (v30)
  {
    CGContextAddPath(*(CGContextRef *)(a1 + 48), v30);
    CGContextClip(*(CGContextRef *)(a1 + 48));
    CGContextBeginPath(*(CGContextRef *)(a1 + 48));
  }
  double v31 = *(CGImage **)(a1 + 56);
  if (v31) {
    CGContextClipToMask(*(CGContextRef *)(a1 + 48), *(CGRect *)(a1 + 64), v31);
  }
  __double2 v32 = __sincos_stret(v35);
  CGContextAddPath(*(CGContextRef *)(a1 + 48), Mutable);
  CGContextClip(*(CGContextRef *)(a1 + 48));
  CGContextBeginPath(*(CGContextRef *)(a1 + 48));
  v37.x = (a2 + a4) * 0.5;
  v37.y = (a3 + a5) * 0.5;
  v38.x = v37.x + v32.__cosval * v18;
  v38.y = v37.y + v32.__sinval * v18;
  CGContextDrawLinearGradient(*(CGContextRef *)(a1 + 48), *(CGGradientRef *)(a1 + 96), v37, v38, 0);
  CGContextResetClip(*(CGContextRef *)(a1 + 48));
  CGPathRelease(Mutable);
}

__CFString *CEKStringFromAnimationUpdateMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"Unspecified";
  }
  else {
    return off_1E63CD9C8[a1 - 1];
  }
}

id _CEKModifyFrameRateForAnimationBlockFromSettings(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = _Block_copy(v3);
  [v4 frameRateRange];
  float v7 = v6;
  float v9 = v8;
  float v11 = v10;
  int v12 = [v4 highFrameRateReason];

  v23.minimum = v7;
  v23.maximum = v9;
  v23.preferred = v11;
  if (!CAFrameRateRangeIsEqualToRange(v23, *MEMORY[0x1E4F39AF0]))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = ___CEKModifyFrameRateForAnimationBlockFromSettings_block_invoke;
    aBlock[3] = &unk_1E63CD930;
    float v18 = v7;
    float v19 = v9;
    float v20 = v11;
    int v21 = v12;
    id v17 = v3;
    double v13 = _Block_copy(aBlock);

    id v5 = v13;
  }
  __double2 v14 = _Block_copy(v5);

  return v14;
}

void sub_1BEE4B730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEE4BB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEE4BD90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEE50498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1BEE54054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CEKDefaultSliderPositionDriver()
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"systemOverlay.alternateScrollModel", @"com.apple.camera", 0);
  uint64_t v1 = &off_1E63CD1F8;
  if (AppBooleanValue) {
    uint64_t v1 = off_1E63CD1F0;
  }
  id v2 = objc_alloc_init(*v1);
  return v2;
}

void *CEKSmartStyleAllPresetTypes()
{
  return &unk_1F1A0FF50;
}

void *CEKSmartStyleSystemStylePresetTypes()
{
  return &unk_1F1A0FF68;
}

void *CEKSmartStyleCreativeStylePresetTypes()
{
  return &unk_1F1A0FF80;
}

__CFString *CEKDebugStringForSmartStylePresetType(unint64_t a1)
{
  if (a1 > 0xF) {
    return 0;
  }
  else {
    return off_1E63CDDF0[a1];
  }
}

__CFString *CEKDebugStringForSmartStyleCastType(unint64_t a1)
{
  if (a1 > 0xE) {
    return 0;
  }
  else {
    return off_1E63CDC78[a1];
  }
}

id CEKSmartStyleIntensitySliderGradientColorsForCastType(uint64_t a1)
{
  CGFloat v28[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.741 green:0.784 blue:0.812 alpha:1.0];
  v28[0] = v2;
  id v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.741 green:0.784 blue:0.812 alpha:1.0];
  v28[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];

  switch(a1)
  {
    case 1:
      id v5 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.851 blue:0.784 alpha:1.0];
      v27[0] = v5;
      float v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.894 green:0.675 blue:0.529 alpha:1.0];
      v27[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.557 blue:0.235 alpha:1.0];
      CGFloat v27[2] = v7;
      float v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = v27;
      goto LABEL_15;
    case 2:
      id v5 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.91 blue:0.91 alpha:1.0];
      v26[0] = v5;
      float v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.965 green:0.784 blue:0.71 alpha:1.0];
      v26[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.941 green:0.553 blue:0.608 alpha:1.0];
      CGFloat v26[2] = v7;
      float v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = v26;
      goto LABEL_15;
    case 3:
      id v5 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.859 blue:0.569 alpha:1.0];
      v25[0] = v5;
      float v6 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.675 blue:0.329 alpha:1.0];
      v25[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.867 green:0.596 blue:0.227 alpha:1.0];
      v25[2] = v7;
      float v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = v25;
      goto LABEL_15;
    case 4:
      id v5 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.867 blue:0.929 alpha:1.0];
      v24[0] = v5;
      float v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.675 green:0.855 blue:0.988 alpha:1.0];
      v24[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.588 green:0.745 blue:0.859 alpha:1.0];
      v24[2] = v7;
      float v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = v24;
      goto LABEL_15;
    case 5:
      id v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.953 green:0.804 blue:0.651 alpha:1.0];
      v23[0] = v5;
      float v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.718 green:0.761 blue:0.882 alpha:1.0];
      v23[1] = v6;
      float v10 = (void *)MEMORY[0x1E4F1C978];
      float v11 = v23;
      goto LABEL_17;
    case 6:
      id v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.953 green:0.961 blue:0.98 alpha:1.0];
      v22[0] = v5;
      float v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.718 green:0.761 blue:0.882 alpha:1.0];
      v22[1] = v6;
      float v10 = (void *)MEMORY[0x1E4F1C978];
      float v11 = v22;
      goto LABEL_17;
    case 7:
      id v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.584 green:0.784 blue:0.706 alpha:1.0];
      v21[0] = v5;
      float v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.953 green:0.804 blue:0.651 alpha:1.0];
      v21[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.953 green:0.906 blue:0.631 alpha:1.0];
      void v21[2] = v7;
      float v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = v21;
      goto LABEL_15;
    case 8:
      id v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.086 green:0.086 blue:0.086 alpha:1.0];
      v20[0] = v5;
      float v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.667 green:0.667 blue:0.667 alpha:1.0];
      v20[1] = v6;
      float v10 = (void *)MEMORY[0x1E4F1C978];
      float v11 = v20;
      goto LABEL_17;
    case 9:
      id v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.137 green:0.729 blue:1.0 alpha:1.0];
      v19[0] = v5;
      float v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.988 green:0.745 blue:0.435 alpha:1.0];
      v19[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.996 green:0.306 blue:0.451 alpha:1.0];
      void v19[2] = v7;
      float v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = v19;
      goto LABEL_15;
    case 10:
      id v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.584 green:0.784 blue:0.706 alpha:1.0];
      v18[0] = v5;
      float v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.816 green:0.745 blue:0.855 alpha:1.0];
      v18[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.953 green:0.804 blue:0.651 alpha:1.0];
      void v18[2] = v7;
      float v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = v18;
      goto LABEL_15;
    case 11:
      id v5 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.749 blue:0.557 alpha:1.0];
      v17[0] = v5;
      float v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.757 green:0.875 blue:0.878 alpha:1.0];
      v17[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.012 green:0.792 blue:1.0 alpha:1.0];
      v17[2] = v7;
      float v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = v17;
      goto LABEL_15;
    case 12:
      id v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.718 green:0.824 blue:0.898 alpha:1.0];
      v16[0] = v5;
      float v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.882 green:0.725 blue:0.6 alpha:1.0];
      v16[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.941 green:0.435 blue:0.341 alpha:1.0];
      v16[2] = v7;
      float v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = v16;
      goto LABEL_15;
    case 13:
      id v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.953 green:0.839 blue:0.886 alpha:1.0];
      v15[0] = v5;
      float v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.816 green:0.745 blue:0.855 alpha:1.0];
      v15[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.6 green:0.765 blue:0.878 alpha:1.0];
      v15[2] = v7;
      float v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = v15;
LABEL_15:
      uint64_t v12 = [v8 arrayWithObjects:v9 count:3];

      id v4 = (void *)v7;
      goto LABEL_18;
    case 14:
      id v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.502 green:0.502 blue:0.502 alpha:1.0];
      v14[0] = v5;
      float v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.922 green:0.922 blue:0.922 alpha:1.0];
      v14[1] = v6;
      float v10 = (void *)MEMORY[0x1E4F1C978];
      float v11 = v14;
LABEL_17:
      uint64_t v12 = [v10 arrayWithObjects:v11 count:2];
LABEL_18:

      id v4 = (void *)v12;
      break;
    default:
      break;
  }
  return v4;
}

void sub_1BEE5C010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEE5C28C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEE5CBAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEE60ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1BEE6211C(void *a1)
{
  id v3 = objc_msgSend(a1, sel__contact);
  if (v3)
  {
    id v11 = v3;
    double v4 = 0.0;
    if (((unint64_t)objc_msgSend(v3, sel_touchPositionHints) & 0x18) == 0)
    {
      objc_msgSend(v11, sel_positionDelta);
      CEKExpandNormalizedContactPoint(v5, v6);
      double v4 = -v7;
    }
    if (qword_1EA136338 != -1) {
      swift_once();
    }
    double v8 = v4 * *(double *)&qword_1EA1369E0;
    *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceTraveled) = v8 + *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceTraveled);
    if (qword_1EA136350 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1BEE6EC68();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EA1369F8);
    objc_msgSend(a1, sel__timestamp);
    sub_1BEE63CAC(v10, SLOBYTE(v8), 0, 1u);
  }
}

uint64_t sub_1BEE622E4(void *a1)
{
  uint64_t v3 = sub_1BEE6EC68();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790]();
  double v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v7 = 0.0;
  double v8 = 0.0;
  if (a1)
  {
    id v9 = objc_msgSend(a1, sel__contact);
    if (v9)
    {
      uint64_t v10 = v9;
      objc_msgSend(v9, sel_positionDelta);
      CEKExpandNormalizedContactPoint(0.0, v11);
      double v13 = v12;

      double v8 = -v13;
    }
  }
  *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_liftoffVelocity) = v8;
  if (fabs(v8) > 0.6)
  {
    double v14 = -(v8 * 0.001 - dbl_1BEE750F0[v8 * 0.001 < 0.0]) / log(*MEMORY[0x1E4FB2EE8]);
    if (qword_1EA136340 != -1) {
      swift_once();
    }
    double v7 = v14 * *(double *)&qword_1EA1369E8;
  }
  uint64_t v15 = OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceToDecelerate;
  *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceToDecelerate) = v7;
  if (qword_1EA136350 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v3, (uint64_t)qword_1EA1369F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v16, v3);
  if (a1)
  {
    objc_msgSend(a1, sel__timestamp);
    uint64_t v18 = v17;
  }
  else
  {
    uint64_t v18 = 0;
  }
  sub_1BEE63CAC(v18, a1 == 0, *(void *)(v1 + v15), 2u);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

id sub_1BEE62610()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HIDPassthroughSliderPositionDriver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HIDPassthroughSliderPositionDriver()
{
  return self;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void type metadata accessor for CGColor()
{
  if (!qword_1EA1363E0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EA1363E0);
    }
  }
}

id sub_1BEE626F8(uint64_t a1)
{
  return sub_1BEE6278C(a1, (SEL *)&selRef_whiteColor, &qword_1EA1364B0);
}

void sub_1BEE6270C()
{
  id v0 = objc_msgSend(self, sel_secondaryLabelColor);
  id v1 = objc_msgSend(v0, sel_colorWithAlphaComponent_, 0.4);

  qword_1EA1364B8 = (uint64_t)v1;
}

id sub_1BEE62778(uint64_t a1)
{
  return sub_1BEE6278C(a1, (SEL *)&selRef_darkGrayColor, &qword_1EA1364C0);
}

id sub_1BEE6278C(uint64_t a1, SEL *a2, void *a3)
{
  id result = [self *a2];
  *a3 = result;
  return result;
}

uint64_t CEKColoredPaletteSlider.colors.getter()
{
  return swift_bridgeObjectRetain();
}

void CEKColoredPaletteSlider.colors.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___CEKColoredPaletteSlider_colors);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_bridgeObjectRelease();
  sub_1BEE62AC4();
}

void sub_1BEE629BC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_colors);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_1BEE63BF4(0, &qword_1EA1364F0);
    uint64_t v5 = sub_1BEE6ECC8();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_1BEE62A3C(void *a1, void **a2)
{
  objc_super v2 = *a2;
  if (*a1)
  {
    sub_1BEE63BF4(0, &qword_1EA1364F0);
    uint64_t v3 = sub_1BEE6ECB8();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setColors_);
}

void sub_1BEE62AC4()
{
  uint64_t v1 = OBJC_IVAR___CEKColoredPaletteSlider_trackLayer;
  objc_msgSend(*(id *)&v0[OBJC_IVAR___CEKColoredPaletteSlider_trackLayer], sel_removeFromSuperlayer);
  objc_super v2 = &v0[OBJC_IVAR___CEKColoredPaletteSlider_colors];
  swift_beginAccess();
  unint64_t v3 = *(void *)v2;
  if (*(void *)v2)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      int64_t v4 = sub_1BEE6EE18();
      if (v4 >= 2)
      {
LABEL_4:
        uint64_t v22 = v1;
        CAFrameRateRange v23 = v0;
        id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39BD0]), sel_init);
        objc_msgSend(v5, sel_setStartPoint_, 0.0, 0.5);
        objc_msgSend(v5, sel_setEndPoint_, 1.0, 0.5);
        uint64_t v26 = MEMORY[0x1E4FBC860];
        sub_1BEE65CA0(0, v4, 0);
        uint64_t v6 = 0;
        uint64_t v7 = v26;
        do
        {
          if ((v3 & 0xC000000000000001) != 0) {
            id v8 = (id)MEMORY[0x1C189D5C0](v6, v3);
          }
          else {
            id v8 = *(id *)(v3 + 8 * v6 + 32);
          }
          id v9 = v8;
          id v10 = objc_msgSend(v8, sel_CGColor, v22, v23, (void)v24);
          type metadata accessor for CGColor();
          uint64_t v25 = v11;

          *(void *)&long long v24 = v10;
          uint64_t v26 = v7;
          unint64_t v13 = *(void *)(v7 + 16);
          unint64_t v12 = *(void *)(v7 + 24);
          if (v13 >= v12 >> 1)
          {
            sub_1BEE65CA0(v12 > 1, v13 + 1, 1);
            uint64_t v7 = v26;
          }
          ++v6;
          *(void *)(v7 + 16) = v13 + 1;
          sub_1BEE63C9C(&v24, (_OWORD *)(v7 + 32 * v13 + 32));
        }
        while (v4 != v6);
        swift_bridgeObjectRelease();
        id v14 = (id)sub_1BEE6ECB8();
        swift_bridgeObjectRelease();
        objc_msgSend(v5, sel_setColors_, v14);
        uint64_t v1 = v22;
        id v0 = v23;
        goto LABEL_26;
      }
    }
    else
    {
      int64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v4 >= 2) {
        goto LABEL_4;
      }
    }
    swift_bridgeObjectRelease();
  }
  if (qword_1EA136330 != -1) {
    swift_once();
  }
  id v14 = objc_msgSend((id)qword_1EA1364C0, sel_CGColor);
  unint64_t v15 = *(void *)v2;
  if (!*(void *)v2)
  {
LABEL_25:
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39BE8]), sel_init);
    objc_msgSend(v5, sel_setBackgroundColor_, v14);
LABEL_26:

    uint64_t v20 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v5;

    id v21 = objc_msgSend(v0, sel_layer);
    objc_msgSend(v21, sel_insertSublayer_atIndex_, *(void *)&v0[v1], 1);

    return;
  }
  if (!(v15 >> 62))
  {
    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v16) {
      goto LABEL_19;
    }
LABEL_24:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  if (!sub_1BEE6EE18()) {
    goto LABEL_24;
  }
LABEL_19:
  if ((v15 & 0xC000000000000001) != 0)
  {
    id v17 = (id)MEMORY[0x1C189D5C0](0, v15);
    goto LABEL_22;
  }
  if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v17 = *(id *)(v15 + 32);
LABEL_22:
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();
    id v19 = objc_msgSend(v18, sel_CGColor);

    id v14 = v19;
    goto LABEL_25;
  }
  __break(1u);
}

char *sub_1BEE62E64(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR___CEKColoredPaletteSlider_colors] = 0;
  *(void *)&v4[OBJC_IVAR___CEKColoredPaletteSlider_boundsHeight] = 0;
  uint64_t v9 = OBJC_IVAR___CEKColoredPaletteSlider_backgroundLayer;
  id v10 = objc_allocWithZone(MEMORY[0x1E4F39BE8]);
  uint64_t v11 = v4;
  *(void *)&v4[v9] = objc_msgSend(v10, sel_init);
  uint64_t v12 = OBJC_IVAR___CEKColoredPaletteSlider_trackLayer;
  *(void *)&v11[v12] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39BE8]), sel_init);

  v27.receiver = v11;
  v27.super_class = (Class)CEKColoredPaletteSlider;
  unint64_t v13 = (char *)objc_msgSendSuper2(&v27, sel_initWithFrame_, a1, a2, a3, a4);
  sub_1BEE6313C();
  objc_msgSend(v13, sel_addTarget_action_forControlEvents_, v13, sel_valueChanged_, 4096);
  uint64_t v14 = OBJC_IVAR___CEKColoredPaletteSlider_backgroundLayer;
  uint64_t v15 = qword_1EA136328;
  id v16 = *(id *)&v13[OBJC_IVAR___CEKColoredPaletteSlider_backgroundLayer];
  if (v15 != -1) {
    swift_once();
  }
  id v17 = objc_msgSend((id)qword_1EA1364B8, sel_CGColor);
  objc_msgSend(v16, sel_setBackgroundColor_, v17);

  id v18 = objc_msgSend(v13, sel_layer);
  objc_msgSend(v18, sel_insertSublayer_atIndex_, *(void *)&v13[v14], 0);

  uint64_t v19 = OBJC_IVAR___CEKColoredPaletteSlider_trackLayer;
  uint64_t v20 = qword_1EA136330;
  id v21 = *(id *)&v13[OBJC_IVAR___CEKColoredPaletteSlider_trackLayer];
  if (v20 != -1) {
    swift_once();
  }
  id v22 = objc_msgSend((id)qword_1EA1364C0, sel_CGColor);
  objc_msgSend(v21, sel_setBackgroundColor_, v22);

  id v23 = objc_msgSend(v13, sel_layer);
  objc_msgSend(v23, sel_insertSublayer_atIndex_, *(void *)&v13[v19], 1);

  long long v24 = (void *)sub_1BEE6329C(0);
  uint64_t v25 = (void *)sub_1BEE6329C(1);
  objc_msgSend(v13, sel_setThumbImage_forState_, v24, 0);
  objc_msgSend(v13, sel_setThumbImage_forState_, v25, 1);
  objc_msgSend(v13, sel_setThumbImage_forState_, v25, 4);

  return v13;
}

void sub_1BEE6313C()
{
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_clearColor);
  objc_msgSend(v0, sel_setTintColor_, v2);

  id v3 = objc_msgSend(v1, sel_clearColor);
  objc_msgSend(v0, sel_setMaximumTrackTintColor_, v3);

  id v4 = objc_msgSend(v1, sel_clearColor);
  objc_msgSend(v0, sel_setMinimumTrackTintColor_, v4);

  id v5 = objc_msgSend(v1, sel_clearColor);
  objc_msgSend(v0, sel_setBackgroundColor_, v5);

  id v6 = objc_msgSend(v1, sel_clearColor);
  objc_msgSend(v0, sel_setThumbTintColor_, v6);
}

uint64_t sub_1BEE6329C(char a1)
{
  id v2 = v1;
  objc_msgSend(v2, sel_bounds);
  double Height = CGRectGetHeight(v15);
  if (a1) {
    double v5 = 4.0;
  }
  else {
    double v5 = -4.0;
  }
  if (a1) {
    double v6 = Height + 4.0;
  }
  else {
    double v6 = Height;
  }
  objc_msgSend(v2, sel_bounds);
  CGFloat v7 = CGRectGetHeight(v16) + v5;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB17D8]), sel_initWithSize_, v6, v6);
  uint64_t v9 = swift_allocObject();
  *(unsigned char *)(v9 + 16) = a1;
  *(CGFloat *)(v9 + 24) = v7;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_1BEE63C40;
  *(void *)(v10 + 24) = v9;
  v14[4] = sub_1BEE63C5C;
  v14[5] = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  void v14[2] = sub_1BEE63580;
  v14[3] = &block_descriptor;
  uint64_t v11 = _Block_copy(v14);
  swift_retain();
  swift_release();
  id v12 = objc_msgSend(v8, sel_imageWithActions_, v11);

  _Block_release(v11);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v8 & 1) == 0) {
    return (uint64_t)v12;
  }
  __break(1u);
  return result;
}

void sub_1BEE63474(void *a1, char a2, CGFloat a3)
{
  double v6 = (CGContext *)objc_msgSend(a1, sel_CGContext);
  if (qword_1EA136320 != -1) {
    swift_once();
  }
  if (a2) {
    double v7 = 0.0;
  }
  else {
    double v7 = 2.0;
  }
  id v8 = (CGColor *)objc_msgSend((id)qword_1EA1364B0, sel_CGColor);
  CGContextSetFillColorWithColor(v6, v8);

  uint64_t v9 = (CGContext *)objc_msgSend(a1, sel_CGContext);
  v11.origin.x = v7;
  v11.origin.y = v7;
  v11.size.width = a3;
  v11.size.height = a3;
  CGContextFillEllipseInRect(v9, v11);
}

void sub_1BEE63580(uint64_t a1, void *a2)
{
  id v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

Swift::Void __swiftcall CEKColoredPaletteSlider.layoutSubviews()()
{
  uint64_t v1 = OBJC_IVAR___CEKColoredPaletteSlider_boundsHeight;
  double v2 = *(double *)&v0[OBJC_IVAR___CEKColoredPaletteSlider_boundsHeight];
  objc_msgSend(v0, sel_bounds);
  if (v2 != CGRectGetHeight(v44))
  {
    id v3 = (void *)sub_1BEE6329C(0);
    id v4 = (void *)sub_1BEE6329C(1);
    objc_msgSend(v0, sel_setThumbImage_forState_, v3, 0);
    objc_msgSend(v0, sel_setThumbImage_forState_, v4, 1);
    objc_msgSend(v0, sel_setThumbImage_forState_, v4, 4);

    objc_msgSend(v0, sel_bounds);
    *(CGFloat *)&v0[v1] = CGRectGetHeight(v45);
  }
  v43.receiver = v0;
  v43.super_class = (Class)CEKColoredPaletteSlider;
  objc_msgSendSuper2(&v43, sel_layoutSubviews);
  double v5 = *(void **)&v0[OBJC_IVAR___CEKColoredPaletteSlider_backgroundLayer];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v5, sel_setFrame_);
  objc_msgSend(v5, sel_bounds);
  objc_msgSend(v5, sel_setCornerRadius_, CGRectGetHeight(v46) * 0.5);
  uint64_t v6 = OBJC_IVAR___CEKColoredPaletteSlider_trackLayer;
  id v7 = *(id *)&v0[OBJC_IVAR___CEKColoredPaletteSlider_trackLayer];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v7, sel_setCornerRadius_, CGRectGetHeight(v47) * 0.5);

  id v8 = self;
  objc_msgSend(v8, sel_begin);
  objc_msgSend(v8, sel_setDisableActions_, 1);
  objc_msgSend(v0, sel_bounds);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v0, sel_trackRectForBounds_);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  objc_msgSend(v0, sel_value);
  LODWORD(v42) = v25;
  objc_msgSend(v0, sel_thumbRectForBounds_trackRect_value_, v10, v12, v14, v16, v18, v20, v22, v24, v42);
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  id v34 = *(id *)&v0[v6];
  v48.origin.x = v27;
  v48.origin.y = v29;
  v48.size.width = v31;
  v48.size.height = v33;
  double MidX = CGRectGetMidX(v48);
  objc_msgSend(v0, sel_bounds);
  double v36 = MidX + CGRectGetHeight(v49) * 0.5;
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v34, sel_setFrame_, 0.0, 0.0, v36, CGRectGetHeight(v50));

  CGPoint v37 = *(void **)&v0[v6];
  self;
  uint64_t v38 = swift_dynamicCastObjCClass();
  if (v38)
  {
    v39 = (void *)v38;
    id v40 = v37;
    objc_msgSend(v0, sel_bounds);
    double Width = CGRectGetWidth(v51);
    v52.origin.x = v27;
    v52.origin.y = v29;
    v52.size.width = v31;
    v52.size.height = v33;
    objc_msgSend(v39, sel_setEndPoint_, Width / CGRectGetMidX(v52), 0.5);
  }
  objc_msgSend(v8, sel_commit);
}

Swift::Bool __swiftcall CEKColoredPaletteSlider.point(inside:with:)(CGPoint inside, UIEvent_optional with)
{
  CGFloat y = inside.y;
  CGFloat x = inside.x;
  objc_msgSend(v2, sel_bounds);
  CGRect v8 = CGRectInset(v7, -10.0, -10.0);
  v6.CGFloat x = x;
  v6.CGFloat y = y;
  return CGRectContainsPoint(v8, v6);
}

void __swiftcall CEKColoredPaletteSlider.init(coder:)(CEKColoredPaletteSlider_optional *__return_ptr retstr, NSCoder coder)
{
}

void _sSo23CEKColoredPaletteSliderC13CameraEditKitE5coderABSgSo7NSCoderC_tcfc_0()
{
  *(void *)&v0[OBJC_IVAR___CEKColoredPaletteSlider_colors] = 0;
  *(void *)&v0[OBJC_IVAR___CEKColoredPaletteSlider_boundsHeight] = 0;
  uint64_t v1 = OBJC_IVAR___CEKColoredPaletteSlider_backgroundLayer;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39BE8]), sel_init);
  uint64_t v2 = OBJC_IVAR___CEKColoredPaletteSlider_trackLayer;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39BE8]), sel_init);

  sub_1BEE6EE08();
  __break(1u);
}

char *keypath_get_selector_colors()
{
  return sel_colors;
}

uint64_t type metadata accessor for CEKColoredPaletteSlider(uint64_t a1)
{
  return sub_1BEE63BF4(a1, &qword_1EA1364E8);
}

uint64_t sub_1BEE63BF4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1BEE63C30()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BEE63C40(void *a1)
{
  sub_1BEE63474(a1, *(unsigned char *)(v1 + 16), *(CGFloat *)(v1 + 24));
}

uint64_t sub_1BEE63C4C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BEE63C5C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

_OWORD *sub_1BEE63C9C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1BEE63CAC(uint64_t a1, char a2, uint64_t a3, unsigned __int8 a4)
{
  if (qword_1EA136358 != -1) {
    swift_once();
  }
  if (byte_1EA136A10 == 1)
  {
    uint64_t v19 = 0x3A22657361685022;
    unint64_t v20 = 0xE900000000000022;
    sub_1BEE6EC98();
    swift_bridgeObjectRelease();
    sub_1BEE6EC98();
    sub_1BEE6EC98();
    if (a4 < 2u || (a2 & 1) == 0) {
      sub_1BEE6ED08();
    }
    sub_1BEE6EC98();
    swift_bridgeObjectRelease();
    sub_1BEE6EC98();
    swift_bridgeObjectRelease();
    uint64_t v7 = v19;
    unint64_t v6 = v20;
    if (!a4)
    {
      swift_bridgeObjectRetain();
      CGRect v8 = sub_1BEE6EC48();
      os_log_type_t v13 = sub_1BEE6ED28();
      if (os_log_type_enabled(v8, v13))
      {
        uint64_t v10 = swift_slowAlloc();
        uint64_t v14 = swift_slowAlloc();
        uint64_t v19 = v14;
        *(_DWORD *)uint64_t v10 = 136446210;
        swift_bridgeObjectRetain();
        sub_1BEE6462C(v7, v6, &v19);
        sub_1BEE6ED38();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1BEE2D000, v8, v13, "{%{public}s)}", (uint8_t *)v10, 0xCu);
        swift_arrayDestroy();
        uint64_t v12 = v14;
        goto LABEL_13;
      }
      goto LABEL_16;
    }
    if (a4 == 1)
    {
      swift_bridgeObjectRetain();
      sub_1BEE64624();
      CGRect v8 = sub_1BEE6EC48();
      os_log_type_t v9 = sub_1BEE6ED28();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = swift_slowAlloc();
        uint64_t v11 = swift_slowAlloc();
        uint64_t v19 = v11;
        *(_DWORD *)uint64_t v10 = 136446722;
        swift_bridgeObjectRetain();
        sub_1BEE6462C(v7, v6, &v19);
        sub_1BEE6ED38();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v10 + 12) = 1040;
        sub_1BEE6ED38();
        *(_WORD *)(v10 + 18) = 2050;
        sub_1BEE6ED38();
        _os_log_impl(&dword_1BEE2D000, v8, v9, "{%{public}s), \"ScrollTravel\": %{public}+.*f)}", (uint8_t *)v10, 0x1Cu);
        swift_arrayDestroy();
        uint64_t v12 = v11;
LABEL_13:
        MEMORY[0x1C189E5F0](v12, -1, -1);
        MEMORY[0x1C189E5F0](v10, -1, -1);

        return;
      }
LABEL_16:
      swift_bridgeObjectRelease_n();

      return;
    }
    swift_bridgeObjectRetain();
    sub_1BEE64624();
    double v15 = sub_1BEE6EC48();
    os_log_type_t v16 = sub_1BEE6ED28();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = v18;
      *(_DWORD *)uint64_t v17 = 136446722;
      swift_bridgeObjectRetain();
      sub_1BEE6462C(v7, v6, &v19);
      sub_1BEE6ED38();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v17 + 12) = 1040;
      sub_1BEE6ED38();
      *(_WORD *)(v17 + 18) = 2050;
      sub_1BEE6ED38();
      _os_log_impl(&dword_1BEE2D000, v15, v16, "{%{public}s), \"DecelerationDistance\": %{public}+.*f)}", (uint8_t *)v17, 0x1Cu);
      swift_arrayDestroy();
      MEMORY[0x1C189E5F0](v18, -1, -1);
      MEMORY[0x1C189E5F0](v17, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
  }
}

void sub_1BEE64234(uint64_t a1)
{
}

uint64_t sub_1BEE64258()
{
  uint64_t v1 = (void *)sub_1BEE6EC88();
  id v2 = objc_msgSend(v0, sel_objectForKey_, v1);

  if (v2)
  {
    sub_1BEE6ED58();
    swift_unknownObjectRelease();
    sub_1BEE64464((uint64_t)v7);
    id v3 = (void *)sub_1BEE6EC88();
    objc_msgSend(v0, sel_doubleForKey_, v3);
    uint64_t v5 = v4;

    return v5;
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    sub_1BEE64464((uint64_t)v7);
    return 0;
  }
}

void sub_1BEE64338(uint64_t a1)
{
}

void sub_1BEE6435C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (qword_1EA136348 != -1) {
    swift_once();
  }
  uint64_t v5 = 0x3FF999999999999ALL;
  if (qword_1EA1369F0)
  {
    uint64_t v6 = sub_1BEE64258();
    if ((v7 & 1) == 0) {
      uint64_t v5 = v6;
    }
  }
  *a4 = v5;
}

void sub_1BEE643F4()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  uint64_t v1 = (void *)sub_1BEE6EC88();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_1EA1369F0 = (uint64_t)v2;
}

uint64_t sub_1BEE64464(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1364F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1BEE64508()
{
  uint64_t v0 = sub_1BEE6EC68();
  __swift_allocate_value_buffer(v0, qword_1EA1369F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA1369F8);
  return sub_1BEE6EC58();
}

void sub_1BEE64588()
{
  if (qword_1EA136348 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EA1369F0;
  if (qword_1EA1369F0)
  {
    uint64_t v1 = (void *)sub_1BEE6EC88();
    LOBYTE(v0) = objc_msgSend(v0, sel_BOOLForKey_, v1);
  }
  byte_1EA136A10 = (char)v0;
}

uint64_t sub_1BEE64624()
{
  return 0;
}

uint64_t sub_1BEE6462C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1BEE64700(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1BEE64CD4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1BEE64CD4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1BEE64700(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1BEE6ED48();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1BEE648BC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1BEE6EDE8();
  if (!v8)
  {
    sub_1BEE6EDF8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1BEE6EE58();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1BEE648BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1BEE64954(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1BEE64B34(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1BEE64B34(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1BEE64954(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1BEE64ACC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1BEE6EDC8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1BEE6EDF8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1BEE6ECA8();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1BEE6EE58();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1BEE6EDF8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1BEE64ACC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_1EA136500);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1BEE64B34(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_30;
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1EA136500);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1BEE6EE58();
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1BEE64CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1BEE64D9C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BEE64DF4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 80);
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = MEMORY[0x1C189D4C0](v4, v3);
  swift_bridgeObjectRelease();
  if (v5 < 1) {
    return sub_1BEE6ED78();
  }
  sub_1BEE6ED88();
  sub_1BEE6ECE8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1365D0);
  swift_getWitnessTable();
  sub_1BEE6622C(&qword_1EA1365D8, &qword_1EA1365D0);
  sub_1BEE6EC78();
  uint64_t v7 = v1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1365E0);
  sub_1BEE6622C(&qword_1EA1365E8, &qword_1EA1365E0);
  sub_1BEE6EC78();
  swift_getWitnessTable();
  sub_1BEE6ED18();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v7;
}

uint64_t sub_1BEE65014()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t type metadata accessor for OverwritingRingBuffer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BEE65064()
{
  sub_1BEE64DF4();
  uint64_t v0 = sub_1BEE6ED68();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_1BEE650C4()
{
  return sub_1BEE65064();
}

id sub_1BEE650E8()
{
  *(void *)&v0[OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_translation] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_decelerationTarget] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1365C8);
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = MEMORY[0x1E4FBC860];
  *(void *)(v1 + 16) = MEMORY[0x1E4FBC860];
  *(_OWORD *)(v1 + 24) = xmmword_1BEE75170;
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = v0;
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v1 + 16) = v3;
  if (!isUniquelyReferenced_nonNull_native || v3[3] <= 0x1BuLL)
  {
    if (v3[2] <= 0xEuLL) {
      int64_t v6 = 14;
    }
    else {
      int64_t v6 = v3[2];
    }
    uint64_t v3 = sub_1BEE6D238(isUniquelyReferenced_nonNull_native, v6, 0, v3);
  }
  uint64_t v7 = OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_allSamples;
  *(void *)(v1 + 16) = v3;
  swift_endAccess();
  *(void *)&v4[v7] = v1;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v2;
  *(_OWORD *)(v8 + 24) = xmmword_1BEE75180;
  swift_beginAccess();
  int64_t v9 = *(void **)(v8 + 16);
  uint64_t v10 = (void *)swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v8 + 16) = v9;
  if (!v10 || v9[3] <= 0xBuLL)
  {
    if (v9[2] <= 6uLL) {
      int64_t v11 = 6;
    }
    else {
      int64_t v11 = v9[2];
    }
    int64_t v9 = sub_1BEE6D238(v10, v11, 0, v9);
  }
  uint64_t v12 = OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_validSamples;
  *(void *)(v8 + 16) = v9;
  swift_endAccess();
  *(void *)&v4[v12] = v8;
  *(void *)&v4[OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_lastUpdateTime] = 0x10000000000000;

  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for BetterSliderPositionDriver();
  return objc_msgSendSuper2(&v14, sel_init);
}

id sub_1BEE652D0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BetterSliderPositionDriver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BetterSliderPositionDriver()
{
  return self;
}

uint64_t sub_1BEE653D0()
{
  double v0 = CACurrentMediaTime();
  swift_retain();
  sub_1BEE68124();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  unint64_t v6 = v5;
  uint64_t result = swift_release();
  int64_t v8 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v4))
  {
    __break(1u);
  }
  else
  {
    if ((uint64_t)((v6 >> 1) - v4) < 1) {
      return swift_unknownObjectRelease();
    }
    double v9 = 0.0;
    if (v4 == v8) {
      return swift_unknownObjectRelease();
    }
    if (v4 < v8)
    {
      uint64_t v10 = (double *)(v2 + 24 * v4 + 16);
      uint64_t v11 = (v6 >> 1) - v4;
      do
      {
        double v12 = *(v10 - 2);
        double v13 = *v10;
        double v14 = v0 - *(v10 - 1);
        double v15 = 0.0;
        if (v14 < 0.18) {
          double v15 = pow(v14 / -0.18 + 1.0, 6.0);
        }
        double v9 = v9 + v12 / v13 * v15 * 0.83;
        v10 += 3;
        --v11;
      }
      while (v11);
      return swift_unknownObjectRelease();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1BEE6557C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t result = (uint64_t)objc_msgSend(a1, sel__contact);
  if (result)
  {
    uint64_t v4 = (void *)result;
    unsigned __int8 v5 = objc_msgSend((id)result, sel_touchPositionHints);
    if ((v5 & 8) != 0 || (v5 & 0x10) != 0)
    {

      double v10 = 0.0;
    }
    else
    {
      objc_msgSend(v4, sel_positionDelta);
      CEKExpandNormalizedContactPoint(v6, v7);
      double v9 = v8;

      double v10 = -v9;
    }
    *(double *)(v2 + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_translation) = v10 * 2.58
                                                                                              + *(double *)(v2 + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_translation);
    double v11 = CACurrentMediaTime();
    uint64_t v12 = OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_lastUpdateTime;
    double v13 = v11 - *(double *)(v2 + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_lastUpdateTime);
    swift_retain();
    sub_1BEE67CDC(v10, v11, v13);
    swift_release();
    uint64_t result = BSFloatIsZero();
    if ((result & 1) == 0)
    {
      swift_retain();
      sub_1BEE67CDC(v10, v11, v13);
      uint64_t result = swift_release();
    }
    *(double *)(v2 + v12) = v11;
  }
  return result;
}

uint64_t sub_1BEE65718()
{
  swift_retain();
  sub_1BEE68124();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  uint64_t result = swift_release();
  int64_t v7 = v5 >> 1;
  if (__OFSUB__(v5 >> 1, v3))
  {
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if ((uint64_t)((v5 >> 1) - v3) < 1)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  if (__OFSUB__(v3, v7)) {
    goto LABEL_38;
  }
  if ((unint64_t)(v3 - v7 + 5) >= 6) {
    uint64_t v8 = v7 - 6;
  }
  else {
    uint64_t v8 = v3;
  }
  if (v7 < v8) {
    goto LABEL_39;
  }
  if (v8 < v3)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v9 = v7 - v8;
  if (v7 == v8)
  {
    swift_unknownObjectRetain();
    uint64_t v10 = MEMORY[0x1E4FBC860];
    goto LABEL_11;
  }
  if (v7 <= v8)
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  swift_unknownObjectRetain();
  uint64_t v12 = (void *)(v1 + 24 * v8 + 16);
  uint64_t v10 = MEMORY[0x1E4FBC860];
  do
  {
    uint64_t v16 = *v12;
    long long v34 = *((_OWORD *)v12 - 1);
    if ((BSFloatIsZero() & 1) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_1BEE65CC0(0, *(void *)(v10 + 16) + 1, 1);
      }
      unint64_t v14 = *(void *)(v10 + 16);
      unint64_t v13 = *(void *)(v10 + 24);
      if (v14 >= v13 >> 1) {
        sub_1BEE65CC0(v13 > 1, v14 + 1, 1);
      }
      *(void *)(v10 + 16) = v14 + 1;
      uint64_t v15 = v10 + 24 * v14;
      *(_OWORD *)(v15 + 32) = v34;
      *(void *)(v15 + 48) = v16;
    }
    v12 += 3;
    --v9;
  }
  while (v9);
LABEL_11:
  unint64_t v11 = *(void *)(v10 + 16);
  swift_release();
  if (!v11)
  {
    swift_unknownObjectRelease_n();
    return 1;
  }
  if (v11 > 2)
  {
    swift_unknownObjectRelease_n();
    return 0;
  }
  double v17 = CACurrentMediaTime();
  swift_retain();
  sub_1BEE68124();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  unint64_t v23 = v22;
  uint64_t result = swift_release();
  int64_t v24 = v23 >> 1;
  uint64_t v25 = (v23 >> 1) - v21;
  if (__OFSUB__(v23 >> 1, v21)) {
    goto LABEL_42;
  }
  if (v25 < 1)
  {
    swift_unknownObjectRelease();
    double v27 = 0.0;
    goto LABEL_31;
  }
  double v26 = 0.0;
  if (v21 == v24)
  {
LABEL_29:
    swift_unknownObjectRelease();
    double v27 = v26 / (double)v25;
LABEL_31:
    swift_unknownObjectRelease_n();
    return CGFAbs(v27) <= 90.0;
  }
  if (v21 < v24)
  {
    double v28 = (double *)(v19 + 24 * v21 + 16);
    uint64_t v29 = (v23 >> 1) - v21;
    do
    {
      double v30 = *(v28 - 2);
      double v31 = *v28;
      double v32 = v17 - *(v28 - 1);
      double v33 = 0.0;
      if (v32 < 0.18) {
        double v33 = pow(v32 / -0.18 + 1.0, 6.0);
      }
      double v26 = v26 + v30 / v31 * v33 * 0.83;
      v28 += 3;
      --v29;
    }
    while (v29);
    goto LABEL_29;
  }
LABEL_43:
  __break(1u);
  return result;
}

void sub_1BEE65A40()
{
  double v0 = CACurrentMediaTime();
  swift_retain();
  sub_1BEE68124();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  unint64_t v6 = v5;
  swift_release();
  int64_t v7 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v4))
  {
    __break(1u);
  }
  else
  {
    if ((uint64_t)((v6 >> 1) - v4) < 1 || (double v8 = 0.0, v4 == v7))
    {
LABEL_4:
      swift_unknownObjectRelease();
      log(*MEMORY[0x1E4FB2EE8]);
      return;
    }
    if (v4 < v7)
    {
      uint64_t v9 = (double *)(v2 + 24 * v4 + 16);
      uint64_t v10 = (v6 >> 1) - v4;
      do
      {
        double v11 = *(v9 - 2);
        double v12 = *v9;
        double v13 = v0 - *(v9 - 1);
        double v14 = 0.0;
        if (v13 < 0.18) {
          double v14 = pow(v13 / -0.18 + 1.0, 6.0);
        }
        double v8 = v8 + v11 / v12 * v14 * 0.83;
        v9 += 3;
        --v10;
      }
      while (v10);
      goto LABEL_4;
    }
  }
  __break(1u);
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for BetterSliderPositionDriver.DeltaSample(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for BetterSliderPositionDriver.DeltaSample(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for BetterSliderPositionDriver.DeltaSample()
{
  return &type metadata for BetterSliderPositionDriver.DeltaSample;
}

uint64_t sub_1BEE65CA0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1BEE65CE0(a1, a2, a3, *v3);
  *char v3 = (char *)result;
  return result;
}

uint64_t sub_1BEE65CC0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1BEE65E50(a1, a2, a3, *v3);
  *char v3 = (char *)result;
  return result;
}

uint64_t sub_1BEE65CE0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA1365F0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  double v13 = v10 + 32;
  double v14 = a4 + 32;
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
  uint64_t result = sub_1BEE6EE58();
  __break(1u);
  return result;
}

uint64_t sub_1BEE65E50(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1365C0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  double v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    memcpy(v12, v13, 24 * v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1BEE6EE58();
  __break(1u);
  return result;
}

void sub_1BEE65FCC()
{
  uint64_t v1 = v0;
  *(void *)(v0 + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_translation) = 0;
  swift_retain();
  sub_1BEE68050();
  swift_release();
  swift_retain();
  sub_1BEE68050();
  swift_release();
  CFTimeInterval v2 = CACurrentMediaTime();
  uint64_t v3 = OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_lastUpdateTime;
  *(CFTimeInterval *)(v1 + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_lastUpdateTime) = v2;
  *(CFTimeInterval *)(v1 + v3) = CACurrentMediaTime();
}

void sub_1BEE66050()
{
  double v1 = CACurrentMediaTime();
  swift_retain();
  sub_1BEE68124();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v7 = v6;
  swift_release();
  int64_t v8 = v7 >> 1;
  uint64_t v9 = (v7 >> 1) - v5;
  if (__OFSUB__(v7 >> 1, v5))
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v9 < 1)
  {
    swift_unknownObjectRelease();
    double v11 = 0.0;
    goto LABEL_6;
  }
  double v10 = 0.0;
  if (v5 != v8)
  {
    if (v5 < v8)
    {
      double v14 = (double *)(v3 + 24 * v5 + 16);
      uint64_t v15 = (v7 >> 1) - v5;
      do
      {
        double v16 = *(v14 - 2);
        double v17 = *v14;
        double v18 = v1 - *(v14 - 1);
        double v19 = 0.0;
        if (v18 < 0.18) {
          double v19 = pow(v18 / -0.18 + 1.0, 6.0);
        }
        double v10 = v10 + v16 / v17 * v19 * 0.83;
        v14 += 3;
        --v15;
      }
      while (v15);
      goto LABEL_4;
    }
LABEL_16:
    __break(1u);
    return;
  }
LABEL_4:
  swift_unknownObjectRelease();
  double v11 = v10 / (double)v9;
LABEL_6:
  char v12 = sub_1BEE65718();
  uint64_t v13 = 0;
  if ((v12 & 1) == 0 && fabs(v11) > 0.6) {
    sub_1BEE65A40();
  }
  *(void *)(v0 + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_decelerationTarget) = v13;
}

double CGFAbs(double a1)
{
  return fabs(a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1BEE6622C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

unint64_t sub_1BEE662A0(uint64_t a1)
{
  unint64_t result = sub_1BEE662C8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1BEE662C8()
{
  unint64_t result = qword_1EA136600;
  if (!qword_1EA136600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA136600);
  }
  return result;
}

void *sub_1BEE66500(void *result, double a2)
{
  double v3 = *(double *)(v2 + *result);
  *(double *)(v2 + *result) = a2;
  if (v3 != a2)
  {
    unint64_t result = (void *)MEMORY[0x1C189E660](v2 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_delegate);
    if (result)
    {
      objc_msgSend(result, sel_tickMarksModelDidChangeWidthForTickMarkCountWithModel_, v2);
      return (void *)swift_unknownObjectRelease();
    }
  }
  return result;
}

void *sub_1BEE66650(void *result, void *a2)
{
  double v3 = *(void **)(v2 + *a2);
  *(void *)(v2 + *a2) = result;
  if (v3 != result)
  {
    unint64_t result = (void *)MEMORY[0x1C189E660](v2 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_delegate);
    if (result)
    {
      objc_msgSend(result, sel_tickMarksModelDidChangeWidthForTickMarkCountWithModel_, v2);
      return (void *)swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1BEE66824(uint64_t result, void *a2, SEL *a3)
{
  int v4 = *(unsigned __int8 *)(v3 + *a2);
  *(unsigned char *)(v3 + *a2) = result;
  if (v4 != (result & 1))
  {
    unint64_t result = MEMORY[0x1C189E660](v3 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_delegate);
    if (result)
    {
      objc_msgSend((id)result, *a3, v3);
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

id sub_1BEE668F0()
{
  double v1 = *(void **)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__primaryTickMarkColor);
  if (v1)
  {
    id v2 = *(id *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__primaryTickMarkColor);
  }
  else if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_useTickMarkLegibilityShadows) == 1)
  {
    id v2 = objc_msgSend(self, sel_labelColor);
  }
  else
  {
    id v3 = objc_allocWithZone(MEMORY[0x1E4FB1618]);
    v7[4] = sub_1BEE66CDC;
    v7[5] = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 1107296256;
    _OWORD v7[2] = sub_1BEE6763C;
    v7[3] = &block_descriptor_7;
    int v4 = _Block_copy(v7);
    id v2 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
    _Block_release(v4);
    swift_release();
  }
  id v5 = v1;
  return v2;
}

id sub_1BEE66AB4()
{
  double v1 = *(void **)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__secondaryTickMarkColor);
  if (v1)
  {
    id v2 = *(id *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__secondaryTickMarkColor);
  }
  else if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_useTickMarkLegibilityShadows) == 1)
  {
    id v3 = objc_msgSend(self, sel_labelColor);
    id v2 = objc_msgSend(v3, sel_colorWithAlphaComponent_, 0.6);
  }
  else
  {
    id v4 = objc_allocWithZone(MEMORY[0x1E4FB1618]);
    void v8[4] = sub_1BEE66CEC;
    v8[5] = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 1107296256;
    v8[2] = sub_1BEE6763C;
    CGFloat v8[3] = &block_descriptor_0;
    id v5 = _Block_copy(v8);
    id v2 = objc_msgSend(v4, sel_initWithDynamicProvider_, v5);
    _Block_release(v5);
    swift_release();
  }
  id v6 = v1;
  return v2;
}

void sub_1BEE66C5C(void *a1, void *a2)
{
  id v3 = *(void **)(v2 + *a2);
  *(void *)(v2 + *a2) = a1;
  id v5 = a1;

  id v4 = (void *)MEMORY[0x1C189E660](v2 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_delegate);
  if (v4)
  {
    objc_msgSend(v4, sel_tickMarksModelDidChangeAppearanceWithModel_, v2);
    swift_unknownObjectRelease();
  }
}

id sub_1BEE66CDC(void *a1)
{
  return sub_1BEE66D00(a1, (SEL *)&selRef_secondaryLabelColor, 0.75);
}

id sub_1BEE66CEC(void *a1)
{
  return sub_1BEE66D00(a1, (SEL *)&selRef_quaternaryLabelColor, 0.4);
}

id sub_1BEE66D00(void *a1, SEL *a2, double a3)
{
  if (objc_msgSend(a1, sel_userInterfaceStyle) == (id)2)
  {
    id v5 = objc_allocWithZone(MEMORY[0x1E4FB1618]);
    return objc_msgSend(v5, sel_initWithWhite_alpha_, a3, 1.0);
  }
  else
  {
    id v7 = [self *a2];
    return v7;
  }
}

double sub_1BEE66DC4()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) != 1) {
    return *(double *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth)
  }
         + *(double *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing)
         * ((double)*(unint64_t *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount) + -1.0);
  sub_1BEE66E18();
  return result;
}

void sub_1BEE66E18()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
  if (v1)
  {
    unint64_t v2 = v1 - 1;
    if (v2) {
      log10(1.0 / (double)v2 * 9.0 + 1.0);
    }
  }
}

void sub_1BEE66EA0(unint64_t a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) == 1)
  {
    uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
    if (v2)
    {
      unint64_t v3 = v2 - 1;
      if (v3) {
        log10((double)a1 / (double)v3 * 9.0 + 1.0);
      }
      sub_1BEE66E18();
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x1C189E660](v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v4)
    {
      objc_msgSend(v4, sel_alignmentRectInsets);
      swift_unknownObjectRelease();
    }
  }
}

long double sub_1BEE66FE0(long double a1)
{
  unint64_t v3 = (void *)MEMORY[0x1C189E660](v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
  if (v3)
  {
    objc_msgSend(v3, sel_alignmentRectInsets);
    double v5 = v4;
    swift_unknownObjectRelease();
  }
  else
  {
    double v5 = 0.0;
  }
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic))
  {
    sub_1BEE66E18();
    double v7 = v6;
    double v8 = *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
    if (a1 >= 0.0) {
      a1 = log10(a1 * 9.0 + 1.0);
    }
    else {
      a1 = 0.0;
    }
  }
  else
  {
    double v8 = *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
    double v7 = v8
       + *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing)
       * ((double)*(unint64_t *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount) + -1.0);
  }
  return v5 + a1 * (v7 - v8);
}

double sub_1BEE67120(double a1, double a2)
{
  int v4 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic);
  double v5 = CEKClamp(a1, 0.0, 1.0);
  if (v4 == 1) {
    double v5 = (__exp10(v5) + -1.0) / 9.0;
  }
  return v5 * a2;
}

void sub_1BEE671CC(double a1)
{
  uint64_t v3 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic;
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) == 1)
  {
    sub_1BEE66E18();
    double v5 = *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
  }
  else
  {
    double v5 = *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
    double v4 = v5
       + *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing)
       * ((double)*(unint64_t *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount) + -1.0);
  }
  double v6 = v4 - v5;
  if (v4 - v5 > 0.0)
  {
    double v7 = (void *)MEMORY[0x1C189E660](v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v7)
    {
      objc_msgSend(v7, sel_alignmentRectInsets);
      double v9 = v8;
      swift_unknownObjectRelease();
    }
    else
    {
      double v9 = 0.0;
    }
    uint64_t v10 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount;
    uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
    unint64_t v12 = v11 - 1;
    if (!v11)
    {
      __break(1u);
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    int v13 = *(unsigned __int8 *)(v1 + v3);
    double v14 = CEKClamp((a1 - v9) / v6, 0.0, 1.0);
    if (v13 == 1) {
      double v14 = (__exp10(v14) + -1.0) / 9.0;
    }
    uint64_t v15 = *(void *)(v1 + v10);
    BOOL v16 = v15 != 0;
    unint64_t v17 = v15 - 1;
    if (!v16) {
      goto LABEL_19;
    }
    double v18 = CEKClamp(v14 * (double)v12, 0.0, (double)v17);
    if ((~*(void *)&v18 & 0x7FF0000000000000) == 0)
    {
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    if (v18 <= -1.0)
    {
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
    if (v18 >= 1.84467441e19) {
LABEL_22:
    }
      __break(1u);
  }
}

BOOL sub_1BEE6739C(BOOL result)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_endTickMarksProminent) == 1)
  {
    if (!result) {
      return 1;
    }
    uint64_t v2 = result + 1;
    if (__OFADD__(result, 1)) {
      goto LABEL_16;
    }
    if ((v2 & 0x8000000000000000) == 0
      && v2 == *(void *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount))
    {
      return 1;
    }
  }
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkOffset);
  BOOL v4 = __OFADD__(result, v3);
  uint64_t v5 = result + v3;
  if (v4)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkInterval);
  if (!v6)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v5 != 0x8000000000000000 || v6 != -1) {
    return v5 % v6 == 0;
  }
LABEL_17:
  __break(1u);
  return result;
}

id sub_1BEE67460()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing] = 0x402E000000000000;
  *(void *)&v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth] = 0x3FF0000000000000;
  *(void *)&v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkInterval] = 3;
  *(void *)&v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkOffset] = 0;
  v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic] = 0;
  v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_endTickMarksProminent] = 0;
  v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_useTickMarkLegibilityShadows] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__primaryTickMarkColor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__secondaryTickMarkColor] = 0;
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_1BEE67574()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TickMarksModel()
{
  return self;
}

id sub_1BEE6763C(uint64_t a1, void *a2)
{
  objc_super v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1BEE676BC(uint64_t a1)
{
  return a1;
}

double sub_1BEE67750()
{
  uint64_t v1 = (double *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample);
  double result = 0.0;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample + 24) & 1) == 0)
  {
    double v3 = v1[2];
    if (v3 <= 0.0025) {
      double v3 = 0.0025;
    }
    double result = *v1 / v3;
  }
  id v4 = (double *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample);
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample + 24) & 1) == 0)
  {
    double v5 = v4[2];
    if (v5 <= 0.0025) {
      double v5 = 0.0025;
    }
    return result * 0.2 + *v4 / v5 * 0.8;
  }
  return result;
}

void sub_1BEE67830(void *a1)
{
  id v2 = objc_msgSend(a1, sel__contact);
  if (v2)
  {
    id v13 = v2;
    double v3 = 0.0;
    if (((unint64_t)objc_msgSend(v2, sel_touchPositionHints) & 0x18) == 0)
    {
      objc_msgSend(v13, sel_positionDelta);
      CEKExpandNormalizedContactPoint(v4, v5);
      double v3 = -v6;
    }
    *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceTraveled) = v3 + *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceTraveled);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v8 = v1 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample;
    char v9 = *(unsigned char *)(v1 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample + 24);
    uint64_t v10 = v1 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample;
    long long v11 = *(_OWORD *)(v1 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample + 8);
    double v12 = Current - *(double *)&v11;
    if (v9) {
      double v12 = 0.0;
    }
    *(void *)uint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample);
    *(_OWORD *)(v10 + 8) = v11;
    *(unsigned char *)(v10 + 24) = v9;
    *(double *)uint64_t v8 = v3;
    *(double *)(v8 + 8) = Current;
    *(double *)(v8 + 16) = v12;
    *(unsigned char *)(v8 + 24) = 0;
  }
}

long double sub_1BEE679B4()
{
  uint64_t v1 = (double *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample);
  double v2 = 0.0;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample + 24) & 1) == 0)
  {
    double v3 = v1[2];
    if (v3 <= 0.0025) {
      double v3 = 0.0025;
    }
    double v2 = *v1 / v3;
  }
  double v4 = (double *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample);
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample + 24) & 1) == 0)
  {
    double v5 = v4[2];
    if (v5 <= 0.0025) {
      double v5 = 0.0025;
    }
    double v2 = v2 * 0.2 + *v4 / v5 * 0.8;
  }
  return -(v2 * 0.001 - dbl_1BEE750F0[v2 * 0.001 < 0.0]) / log(*MEMORY[0x1E4FB2EE8]);
}

id sub_1BEE67B14()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BasicSliderPositionDriver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BasicSliderPositionDriver()
{
  return self;
}

ValueMetadata *type metadata accessor for BasicSliderPositionDriver.VelocitySample()
{
  return &type metadata for BasicSliderPositionDriver.VelocitySample;
}

void sub_1BEE67B7C()
{
  *(void *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceTraveled) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceToDecelerate) = 0;
  uint64_t v1 = v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample;
  *(void *)(v1 + 8) = 0;
  *(void *)(v1 + 16) = 0;
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 24) = 1;
  uint64_t v2 = v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample;
  *(void *)(v2 + 8) = 0;
  *(void *)(v2 + 16) = 0;
  *(void *)uint64_t v2 = 0;
  *(unsigned char *)(v2 + 24) = 1;
  double Current = CFAbsoluteTimeGetCurrent();
  char v4 = *(unsigned char *)(v1 + 24);
  long long v5 = *(_OWORD *)(v1 + 8);
  double v6 = Current - *(double *)&v5;
  if (v4) {
    double v6 = 0.0;
  }
  *(void *)uint64_t v2 = *(void *)v1;
  *(_OWORD *)(v2 + 8) = v5;
  *(unsigned char *)(v2 + 24) = v4;
  *(void *)uint64_t v1 = 0;
  *(double *)(v1 + 8) = Current;
  *(double *)(v1 + 16) = v6;
  *(unsigned char *)(v1 + 24) = 0;
}

void sub_1BEE67C20()
{
  uint64_t v1 = (double *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample);
  double v2 = 0.0;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample + 24) & 1) == 0)
  {
    double v3 = v1[2];
    if (v3 <= 0.0025) {
      double v3 = 0.0025;
    }
    double v2 = *v1 / v3;
  }
  char v4 = (double *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample);
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample + 24) & 1) == 0)
  {
    double v5 = v4[2];
    if (v5 <= 0.0025) {
      double v5 = 0.0025;
    }
    double v2 = v2 * 0.2 + *v4 / v5 * 0.8;
  }
  double v6 = fabs(v2);
  double v7 = 0.0;
  if (v6 > 0.6) {
    double v7 = sub_1BEE679B4();
  }
  *(double *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceToDecelerate) = v7;
}

uint64_t sub_1BEE67CDC(double a1, double a2, double a3)
{
  double v7 = v3 + 2;
  swift_beginAccess();
  if (*(void *)(v3[2] + 16) >= v3[4])
  {
    unint64_t v13 = v3[3];
    swift_beginAccess();
    uint64_t v8 = (void *)v3[2];
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    _OWORD v3[2] = v8;
    if (result)
    {
      if ((v13 & 0x8000000000000000) == 0) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t result = (uint64_t)sub_1BEE6D580(v8);
      uint64_t v8 = (void *)result;
      uint64_t *v7 = result;
      if ((v13 & 0x8000000000000000) == 0)
      {
LABEL_8:
        if (v13 < v8[2])
        {
          double v12 = (double *)&v8[3 * v13];
          goto LABEL_10;
        }
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  swift_beginAccess();
  uint64_t v8 = (void *)*v7;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v7 = (uint64_t)v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_17;
  }
  while (1)
  {
    unint64_t v11 = v8[2];
    unint64_t v10 = v8[3];
    if (v11 >= v10 >> 1)
    {
      uint64_t v8 = sub_1BEE6D238((void *)(v10 > 1), v11 + 1, 1, v8);
      uint64_t *v7 = (uint64_t)v8;
    }
    v8[2] = v11 + 1;
    double v12 = (double *)&v8[3 * v11];
LABEL_10:
    v12[4] = a1;
    v12[5] = a2;
    v12[6] = a3;
    uint64_t result = swift_endAccess();
    uint64_t v15 = v3[3];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16)
    {
      __break(1u);
      goto LABEL_16;
    }
    uint64_t v18 = v3[4];
    if (v18) {
      break;
    }
LABEL_16:
    __break(1u);
LABEL_17:
    uint64_t v8 = sub_1BEE6D238(0, v8[2] + 1, 1, v8);
    uint64_t *v7 = (uint64_t)v8;
  }
  if (v17 != 0x8000000000000000 || v18 != -1)
  {
    v3[3] = v17 % v18;
    return result;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_1BEE67E98(double a1, double a2, double a3, double a4)
{
  char v9 = v4 + 2;
  swift_beginAccess();
  if (*(void *)(v4[2] + 16) >= v4[4])
  {
    unint64_t v15 = v4[3];
    swift_beginAccess();
    unint64_t v10 = (void *)v4[2];
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    v4[2] = v10;
    if (result)
    {
      if ((v15 & 0x8000000000000000) == 0) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t result = (uint64_t)sub_1BEE6D594(v10);
      unint64_t v10 = (void *)result;
      *char v9 = result;
      if ((v15 & 0x8000000000000000) == 0)
      {
LABEL_8:
        if (v15 < v10[2])
        {
          double v14 = (double *)&v10[4 * v15];
          goto LABEL_10;
        }
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  swift_beginAccess();
  unint64_t v10 = (void *)*v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *char v9 = (uint64_t)v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_17;
  }
  while (1)
  {
    unint64_t v13 = v10[2];
    unint64_t v12 = v10[3];
    if (v13 >= v12 >> 1)
    {
      unint64_t v10 = sub_1BEE6D360((void *)(v12 > 1), v13 + 1, 1, v10);
      *char v9 = (uint64_t)v10;
    }
    CGFloat v10[2] = v13 + 1;
    double v14 = (double *)&v10[4 * v13];
LABEL_10:
    v14[4] = a1;
    v14[5] = a2;
    void v14[6] = a3;
    v14[7] = a4;
    uint64_t result = swift_endAccess();
    uint64_t v17 = v4[3];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18)
    {
      __break(1u);
      goto LABEL_16;
    }
    uint64_t v20 = v4[4];
    if (v20) {
      break;
    }
LABEL_16:
    __break(1u);
LABEL_17:
    unint64_t v10 = sub_1BEE6D360(0, v10[2] + 1, 1, v10);
    *char v9 = (uint64_t)v10;
  }
  if (v19 != 0x8000000000000000 || v20 != -1)
  {
    v4[3] = v19 % v20;
    return result;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_1BEE68050()
{
  return sub_1BEE6807C((void (*)(void, void))sub_1BEE6A4F4, (uint64_t (*)(void, void))sub_1BEE691E4);
}

uint64_t sub_1BEE6807C(void (*a1)(void, void), uint64_t (*a2)(void, void))
{
  uint64_t v5 = v2;
  double v6 = (void *)(v2 + 16);
  swift_beginAccess();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *(void *)(v5 + 16);
  if (isUniquelyReferenced_nonNull_native)
  {
    a1(0, *(void *)(v8 + 16));
  }
  else
  {
    *double v6 = a2(0, *(void *)(v8 + 24) >> 1);
    swift_bridgeObjectRelease();
  }
  uint64_t result = swift_endAccess();
  *(void *)(v5 + 24) = 0;
  return result;
}

uint64_t sub_1BEE68124()
{
  return sub_1BEE6813C((void (*)(uint64_t, uint64_t, void, uint64_t))sub_1BEE6ABEC);
}

uint64_t sub_1BEE6813C(void (*a1)(uint64_t, uint64_t, void, uint64_t))
{
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v6 = *(void *)(v1 + 24);
  if (v5 < v6)
  {
    __break(1u);
  }
  else if ((v6 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(v1 + 16);
    uint64_t v7 = (2 * v6) | 1;
    swift_bridgeObjectRetain_n();
    a1(v4, v4 + 32, 0, v7);
    swift_bridgeObjectRelease();
    return v8;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BEE68214@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  uint64_t v4 = v1[2];
  unint64_t v5 = *(void *)(v4 + 16);
  if (!v5)
  {
    long long v13 = 0uLL;
    long long v14 = 0uLL;
    goto LABEL_10;
  }
  uint64_t v6 = v1[3];
  uint64_t v7 = v6 - 1;
  if (__OFSUB__(v6, 1))
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v8 = v1[4];
  BOOL v9 = __OFADD__(v7, v8);
  uint64_t v10 = v7 + v8;
  if (v9)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!v8)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v8 == -1 && v10 == 0x8000000000000000) {
    goto LABEL_15;
  }
  unint64_t v11 = v10 % v8;
  if (v11 < v5)
  {
    uint64_t v12 = v4 + 32 * v11;
    long long v13 = *(_OWORD *)(v12 + 32);
    long long v14 = *(_OWORD *)(v12 + 48);
LABEL_10:
    *(_OWORD *)a1 = v13;
    *(_OWORD *)(a1 + 16) = v14;
    *(unsigned char *)(a1 + 32) = v5 == 0;
    return result;
  }
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_1BEE682D4()
{
  return 0;
}

uint64_t sub_1BEE68420()
{
  return sub_1BEE682D4();
}

void sub_1BEE684A8(void *a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceTraveled) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceToDecelerate) = 0;
  sub_1BEE6807C((void (*)(void, void))sub_1BEE6A658, (uint64_t (*)(void, void))sub_1BEE6926C);
  uint64_t v3 = v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_deadZoneSample;
  *(_OWORD *)uint64_t v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(unsigned char *)(v3 + 32) = 1;
  id v4 = objc_msgSend(a1, sel__contact);
  if (v4)
  {
    unint64_t v5 = v4;
    objc_msgSend(v4, sel_position);
    double v8 = CEKExpandNormalizedContactPoint(v6, v7);
    double v10 = -v9;
    objc_msgSend(a1, sel__timestamp, v8);
    double v12 = v11;
    sub_1BEE68214((uint64_t)v16);
    sub_1BEE6B5D4((uint64_t)v16, (uint64_t)v17);
    if (v19) {
      double v13 = 0.0;
    }
    else {
      double v13 = v12 - v18;
    }
    sub_1BEE67E98(v10, 0.0, v12, v13);
    if (qword_1EA136350 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1BEE6EC68();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EA1369F8);
    objc_msgSend(a1, sel__timestamp);
    sub_1BEE63CAC(v15, 0, 0, 0);
  }
}

void sub_1BEE686A4(void *a1)
{
  id v3 = objc_msgSend(a1, sel__contact);
  if (!v3) {
    return;
  }
  id v35 = v3;
  double v4 = 0.0;
  if (((unint64_t)objc_msgSend(v3, sel_touchPositionHints) & 0x18) == 0)
  {
    objc_msgSend(v35, sel_positionDelta);
    CEKExpandNormalizedContactPoint(v5, v6);
    double v4 = -v7;
  }
  if (qword_1EA136338 != -1) {
    swift_once();
  }
  double v8 = v4 * *(double *)&qword_1EA1369E0;
  objc_msgSend(a1, sel__timestamp);
  double v10 = v9;
  uint64_t v11 = OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceTraveled;
  *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceTraveled) = v8 + *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceTraveled);
  if (qword_1EA136350 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1BEE6EC68();
  __swift_project_value_buffer(v12, (uint64_t)qword_1EA1369F8);
  sub_1BEE63CAC(*(uint64_t *)&v10, SLOBYTE(v8), 0, 1u);
  if (*(double *)(v1 + v11) == 0.0)
  {

    return;
  }
  sub_1BEE68214((uint64_t)v36);
  sub_1BEE6B5D4((uint64_t)v36, (uint64_t)v41);
  if (v42 == 1) {
    goto LABEL_36;
  }
  double v13 = *(double *)v41;
  double v14 = *(double *)&v41[2];
  objc_msgSend(v35, sel_position);
  CEKExpandNormalizedContactPoint(v15, v16);
  double v18 = -v17;
  sub_1BEE68E78();
  double v20 = v19;
  uint64_t v21 = v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_deadZoneSample;
  int v22 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_deadZoneSample + 32);
  if (((unint64_t)objc_msgSend(v35, sel_touchPositionHints) & 0x18) != 0
    || (((unint64_t)objc_msgSend(v35, sel_touchPositionHints) & 4) == 0 ? (char v23 = 1) : (char v23 = v22), (v23 & 1) == 0))
  {
    sub_1BEE68D90();
    double v27 = 0.0;
  }
  else
  {
    double v24 = v18 - v13;
    unsigned int v25 = v22 & (objc_msgSend(v35, sel_touchPositionHints) >> 2);
    double v26 = (v10 - v14) * v20;
    if (fabs(v26) >= fabs(v24)) {
      double v26 = v24;
    }
    if (v25 == 1) {
      double v27 = v26;
    }
    else {
      double v27 = v24;
    }
  }
  sub_1BEE68214((uint64_t)v37);
  sub_1BEE6B5D4((uint64_t)v37, (uint64_t)v38);
  if (v40) {
    double v28 = 0.0;
  }
  else {
    double v28 = v10 - v39;
  }
  sub_1BEE67E98(v18, v27, v10, v28);
  double v29 = 0.00001;
  if (v28 > 0.00001) {
    double v29 = v28;
  }
  double v30 = v27 / v29;
  if (fabs(v30) < 50.0 || v20 * v30 < 0.0)
  {
    if ((v22 & 1) == 0)
    {
LABEL_36:
      double v31 = v35;
LABEL_37:

      return;
    }
LABEL_35:
    *(double *)uint64_t v21 = v18;
    *(double *)(v21 + 8) = v27;
    *(double *)(v21 + 16) = v10;
    *(double *)(v21 + 24) = v28;
    *(unsigned char *)(v21 + 32) = 0;
    sub_1BEE68D90();
    goto LABEL_36;
  }
  if (objc_msgSend(a1, sel__stage) == (id)4)
  {
    if (!v22) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  double v31 = v35;
  if (v22) {
    goto LABEL_37;
  }
  double v32 = *(double *)v21;
  double v33 = *(double *)(v21 + 16);
  char v34 = *(unsigned char *)(v21 + 32);

  if ((v34 & 1) == 0 && v10 - v33 > 0.05 && vabdd_f64(v18, v32) > 10.0)
  {
    *(_OWORD *)uint64_t v21 = 0u;
    *(_OWORD *)(v21 + 16) = 0u;
    *(unsigned char *)(v21 + 32) = 1;
  }
}

uint64_t sub_1BEE68AA4(void *a1)
{
  uint64_t v3 = sub_1BEE6EC68();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790]();
  double v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(a1, sel__contact);
  double v8 = v7;
  if (v7)
  {
    unsigned __int8 v9 = objc_msgSend(v7, sel_touchPositionHints);
    BOOL v10 = (v9 & 8) == 0 && (v9 & 0x10) == 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  sub_1BEE68E78();
  double v12 = 0.0;
  if (v10
    && fabs(v11) > 0.6
    && *(unsigned char *)(v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_deadZoneSample + 32) == 1)
  {
    double v13 = log(*MEMORY[0x1E4FB2EE8]);
    sub_1BEE68E78();
    double v15 = -(v14 * 0.001 - dbl_1BEE750F0[v14 * 0.001 < 0.0]) / v13;
    if (qword_1EA136340 != -1) {
      swift_once();
    }
    double v12 = v15 * *(double *)&qword_1EA1369E8;
  }
  uint64_t v16 = OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceToDecelerate;
  *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceToDecelerate) = v12;
  if (qword_1EA136350 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v3, (uint64_t)qword_1EA1369F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v17, v3);
  if (a1)
  {
    objc_msgSend(a1, sel__timestamp);
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v19 = 0;
  }
  sub_1BEE63CAC(v19, a1 == 0, *(void *)(v1 + v16), 2u);

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1BEE68D90()
{
  sub_1BEE6813C((void (*)(uint64_t, uint64_t, void, uint64_t))sub_1BEE6B2F8);
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  uint64_t result = sub_1BEE6807C((void (*)(void, void))sub_1BEE6A658, (uint64_t (*)(void, void))sub_1BEE6926C);
  BOOL v7 = __OFSUB__(v5 >> 1, v3);
  uint64_t v8 = (v5 >> 1) - v3;
  if (v8)
  {
    if ((v8 < 0) ^ v7 | (v8 == 0))
    {
      __break(1u);
      return result;
    }
    swift_unknownObjectRetain();
    unsigned __int8 v9 = (double *)(v1 + 32 * v3 + 24);
    do
    {
      sub_1BEE67E98(*(v9 - 3), 0.0, *(v9 - 1), *v9);
      v9 += 4;
      --v8;
    }
    while (v8);
    swift_unknownObjectRelease();
  }
  return swift_unknownObjectRelease();
}

uint64_t sub_1BEE68E78()
{
  uint64_t result = sub_1BEE6813C((void (*)(uint64_t, uint64_t, void, uint64_t))sub_1BEE6B2F8);
  uint64_t v4 = v2;
  unint64_t v5 = v3 >> 1;
  double v6 = 0.0;
  unint64_t v7 = (v3 >> 1) - v2;
  if (v3 >> 1 == v2) {
    goto LABEL_16;
  }
  if ((uint64_t)(v3 >> 1) <= v2)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  if (v7 < 2)
  {
    uint64_t v8 = v2;
LABEL_12:
    uint64_t v13 = v5 - v8;
    double v14 = (double *)(v1 + 32 * v8 + 24);
    do
    {
      double v15 = *(v14 - 2);
      double v16 = *v14;
      v14 += 4;
      double v17 = v16;
      if (v16 <= 0.00001) {
        double v17 = 0.00001;
      }
      double v6 = v6 + v15 / v17;
      --v13;
    }
    while (v13);
    goto LABEL_16;
  }
  uint64_t v8 = v2 + (v7 & 0xFFFFFFFFFFFFFFFELL);
  unsigned __int8 v9 = (double *)(v1 + 32 * v2 + 40);
  unint64_t v10 = v7 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    double v11 = *(v9 - 2);
    double v12 = v9[2];
    if (v11 <= 0.00001) {
      double v11 = 0.00001;
    }
    if (v12 <= 0.00001) {
      double v12 = 0.00001;
    }
    double v6 = v6 + *(v9 - 4) / v11 + *v9 / v12;
    v9 += 8;
    v10 -= 2;
  }
  while (v10);
  if (v7 != (v7 & 0xFFFFFFFFFFFFFFFELL)) {
    goto LABEL_12;
  }
LABEL_16:
  uint64_t result = swift_unknownObjectRelease();
  if (__OFSUB__(v5, v4))
  {
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

id sub_1BEE68F94()
{
  *(void *)&v0[OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceTraveled] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceToDecelerate] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136728);
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = MEMORY[0x1E4FBC860];
  *(_OWORD *)(v1 + 24) = xmmword_1BEE75180;
  swift_beginAccess();
  uint64_t v2 = *(void **)(v1 + 16);
  unint64_t v3 = v0;
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v1 + 16) = v2;
  if (!isUniquelyReferenced_nonNull_native || v2[3] <= 0xBuLL)
  {
    if (v2[2] <= 6uLL) {
      int64_t v5 = 6;
    }
    else {
      int64_t v5 = v2[2];
    }
    uint64_t v2 = sub_1BEE6D360(isUniquelyReferenced_nonNull_native, v5, 0, v2);
  }
  uint64_t v6 = OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_samples;
  *(void *)(v1 + 16) = v2;
  swift_endAccess();
  *(void *)&v3[v6] = v1;
  unint64_t v7 = &v3[OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_deadZoneSample];
  *(_OWORD *)unint64_t v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[32] = 1;

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for ContactAwareSliderPositionDriver();
  return objc_msgSendSuper2(&v9, sel_init);
}

id sub_1BEE690E0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContactAwareSliderPositionDriver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ContactAwareSliderPositionDriver()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for ContactAwareSliderPositionDriver.VelocitySample(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for ContactAwareSliderPositionDriver.VelocitySample(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ContactAwareSliderPositionDriver.VelocitySample(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ContactAwareSliderPositionDriver.VelocitySample()
{
  return &type metadata for ContactAwareSliderPositionDriver.VelocitySample;
}

void *sub_1BEE691E4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1365C0);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * ((uint64_t)(v5 - 32) / 24);
  return v4;
}

void *sub_1BEE6926C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136718);
  uint64_t v4 = (void *)swift_allocObject();
  int64_t v5 = _swift_stdlib_malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 1;
  }
  v4[2] = a1;
  v4[3] = 2 * (v6 >> 5);
  return v4;
}

size_t sub_1BEE692E4(size_t result)
{
  int64_t v2 = result;
  unint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void **)v1;
  int64_t v5 = v3 >> 1;
  if ((v3 & 1) == 0 || (result = swift_isUniquelyReferenced_nonNull(), *(void *)uint64_t v1 = v4, (result & 1) == 0))
  {
    objc_super v9 = v4;
    goto LABEL_9;
  }
  uint64_t v6 = *(void *)(v1 + 16);
  int64_t v7 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v8 = *(void *)(v1 + 8);
  sub_1BEE6EE68();
  swift_unknownObjectRetain();
  __n128 result = swift_dynamicCastClass();
  if (!result)
  {
    swift_unknownObjectRelease();
    __n128 result = MEMORY[0x1E4FBC860];
  }
  objc_super v9 = *(void **)(result + 16);
  if (v8 + 24 * v6 + 24 * v7 == result + 24 * (void)v9 + 32) {
    goto LABEL_29;
  }
  __n128 result = swift_release();
  while (1)
  {
    if (v7 >= v2) {
      goto LABEL_26;
    }
    objc_super v9 = *(void **)v1;
LABEL_9:
    int64_t v7 = *(void *)(v1 + 16);
    int64_t v10 = v5 - v7;
    if (__OFSUB__(v5, v7))
    {
      __break(1u);
      goto LABEL_33;
    }
    uint64_t v11 = *(void *)(v1 + 8);
    if (!(v10 <= v2 ? v2 : v5 - v7)) {
      break;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1365C0);
    uint64_t v4 = (void *)swift_allocObject();
    __n128 result = _swift_stdlib_malloc_size(v4);
    v4[2] = v10;
    v4[3] = 2 * ((uint64_t)(result - 32) / 24);
    if (v5 >= v7) {
      goto LABEL_15;
    }
LABEL_28:
    __break(1u);
LABEL_29:
    unint64_t v18 = *(void *)(result + 24);
    __n128 result = swift_release();
    unint64_t v19 = (v18 >> 1) - (void)v9;
    BOOL v20 = __OFADD__(v7, v19);
    v7 += v19;
    if (v20) {
      goto LABEL_38;
    }
  }
  uint64_t v4 = (void *)MEMORY[0x1E4FBC860];
  if (v5 < v7) {
    goto LABEL_28;
  }
LABEL_15:
  if ((v10 & 0x8000000000000000) == 0)
  {
    unint64_t v13 = (unint64_t)(v4 + 4);
    double v14 = (void *)(v11 + 24 * v7);
    if (v14 >= &v4[3 * v10 + 4] || v13 >= (unint64_t)&v14[3 * v10])
    {
      memcpy(v4 + 4, v14, 24 * v10);
      if (!__OFSUB__(0, v7))
      {
        uint64_t v16 = v4[2];
        int64_t v17 = v7 + v16;
        if (!__OFADD__(v7, v16))
        {
          if (v17 >= v7)
          {
            __n128 result = swift_unknownObjectRelease();
            if ((v17 & 0x8000000000000000) == 0)
            {
              *(void *)(v1 + 8) = v13 - 24 * v7;
              *(void *)(v1 + 16) = v7;
              *(void *)(v1 + 24) = (2 * v17) | 1;
LABEL_26:
              *(void *)uint64_t v1 = v4;
              return result;
            }
            goto LABEL_36;
          }
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
LABEL_39:
  __n128 result = sub_1BEE6EE58();
  __break(1u);
  return result;
}

uint64_t sub_1BEE69574(uint64_t result)
{
  uint64_t v2 = result;
  unint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void **)v1;
  int64_t v5 = v3 >> 1;
  if ((v3 & 1) == 0 || (result = swift_isUniquelyReferenced_nonNull(), *(void *)uint64_t v1 = v4, (result & 1) == 0))
  {
    objc_super v9 = v4;
    goto LABEL_9;
  }
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v8 = *(void *)(v1 + 8);
  sub_1BEE6EE68();
  swift_unknownObjectRetain();
  __n128 result = swift_dynamicCastClass();
  if (!result)
  {
    swift_unknownObjectRelease();
    __n128 result = MEMORY[0x1E4FBC860];
  }
  objc_super v9 = *(void **)(result + 16);
  if (v8 + 32 * v6 + 32 * v7 == result + 32 * (void)v9 + 32) {
    goto LABEL_31;
  }
  __n128 result = swift_release();
  while (1)
  {
    if (v7 >= v2) {
      goto LABEL_28;
    }
    objc_super v9 = *(void **)v1;
LABEL_9:
    uint64_t v7 = *(void *)(v1 + 16);
    uint64_t v10 = v5 - v7;
    if (__OFSUB__(v5, v7))
    {
      __break(1u);
      goto LABEL_35;
    }
    uint64_t v11 = *(void *)(v1 + 8);
    if (v10 <= v2 ? v2 : v5 - v7) {
      break;
    }
    uint64_t v4 = (void *)MEMORY[0x1E4FBC860];
    if (v5 >= v7) {
      goto LABEL_17;
    }
LABEL_30:
    __break(1u);
LABEL_31:
    unint64_t v19 = *(void *)(result + 24);
    __n128 result = swift_release();
    unint64_t v20 = (v19 >> 1) - (void)v9;
    BOOL v21 = __OFADD__(v7, v20);
    v7 += v20;
    if (v21) {
      goto LABEL_40;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136718);
  uint64_t v4 = (void *)swift_allocObject();
  __n128 result = _swift_stdlib_malloc_size(v4);
  uint64_t v13 = result - 32;
  if (result < 32) {
    uint64_t v13 = result - 1;
  }
  v4[2] = v10;
  v4[3] = 2 * (v13 >> 5);
  if (v5 < v7) {
    goto LABEL_30;
  }
LABEL_17:
  if ((v10 & 0x8000000000000000) == 0)
  {
    unint64_t v14 = (unint64_t)(v4 + 4);
    double v15 = (void *)(v11 + 32 * v7);
    if (v15 >= &v4[4 * v10 + 4] || v14 >= (unint64_t)&v15[4 * v10])
    {
      memcpy(v4 + 4, v15, 32 * v10);
      if (!__OFSUB__(0, v7))
      {
        uint64_t v17 = v4[2];
        uint64_t v18 = v7 + v17;
        if (!__OFADD__(v7, v17))
        {
          if (v18 >= v7)
          {
            __n128 result = swift_unknownObjectRelease();
            if ((v18 & 0x8000000000000000) == 0)
            {
              *(void *)(v1 + 8) = v14 - 32 * v7;
              *(void *)(v1 + 16) = v7;
              *(void *)(v1 + 24) = (2 * v18) | 1;
LABEL_28:
              *(void *)uint64_t v1 = v4;
              return result;
            }
            goto LABEL_38;
          }
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
LABEL_41:
  __n128 result = sub_1BEE6EE58();
  __break(1u);
  return result;
}

uint64_t sub_1BEE697E4(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = v4[2];
  uint64_t v7 = v4[3] >> 1;
  uint64_t v8 = v7 - v6;
  if (__OFSUB__(v7, v6))
  {
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v10 = *a1;
  uint64_t v11 = *(void *)(*a1 + 16);
  BOOL v30 = __OFSUB__(v11, a2);
  uint64_t v12 = v11 - a2;
  if (v30)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v14 = v12 - a3;
  if (__OFSUB__(v12, a3))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v15 = v8 - a2;
  if (__OFSUB__(v8, a2))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  BOOL v30 = __OFSUB__(v15, v14);
  uint64_t v16 = v15 - v14;
  if (v30)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v38 = v16;
  __dst = (char *)(v10 + 32);
  uint64_t v18 = sub_1BEE6A200(v8);
  CGPoint v37 = (char *)(v10 + 32 + 24 * a2 + 24 * a3);
  if (v18)
  {
    double v36 = a4;
    if (a2 < 0) {
      goto LABEL_46;
    }
    uint64_t v19 = v18;
    uint64_t v20 = v4[2];
    BOOL v21 = (char *)(v4[1] + 24 * v20);
    int v22 = &v21[24 * a2];
    if (__dst != v21 || __dst >= v22) {
      memmove(__dst, v21, 24 * a2);
    }
    v36(v10 + 32 + 24 * a2, a3);
    if (v14 < 0) {
      goto LABEL_46;
    }
    char v23 = &v22[24 * v38];
    if (v37 != v23 || v37 >= &v23[24 * v14]) {
      memmove(v37, v23, 24 * v14);
    }
    *(void *)(v19 + 16) = 0;
    swift_release();
LABEL_26:
    swift_retain();
    uint64_t result = swift_unknownObjectRelease();
    if (!__OFSUB__(0, v20))
    {
      uint64_t v34 = *(void *)(v10 + 16);
      BOOL v30 = __OFADD__(v20, v34);
      uint64_t v35 = v20 + v34;
      if (!v30)
      {
        if (v35 >= v20)
        {
          if ((v35 & 0x8000000000000000) == 0)
          {
            void *v4 = v10;
            v4[1] = &__dst[-24 * v20];
            v4[2] = v20;
            v4[3] = (2 * v35) | 1;
            return result;
          }
          goto LABEL_39;
        }
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        goto LABEL_40;
      }
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  unsigned int v25 = (void (*)(char *, uint64_t))a4;
  uint64_t v20 = v4[2];
  uint64_t v26 = v20 + a2;
  if (__OFADD__(v20, a2))
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v26 < v20)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (__OFSUB__(v26, v20))
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v27 = v4[1];
  memcpy(__dst, (const void *)(v27 + 24 * v20), 24 * a2);
  v25(&__dst[24 * a2], a3);
  uint64_t v28 = v26 + v38;
  if (__OFADD__(v26, v38))
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  uint64_t v29 = v4[3] >> 1;
  BOOL v30 = __OFSUB__(v29, v28);
  BOOL v31 = v29 < v28;
  uint64_t v32 = v29 - v28;
  if (v31)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (!v30)
  {
    memcpy(v37, (const void *)(v27 + 24 * v28), 24 * v32);
    goto LABEL_26;
  }
LABEL_45:
  __break(1u);
LABEL_46:
  uint64_t result = sub_1BEE6EE58();
  __break(1u);
  return result;
}

uint64_t sub_1BEE69A88(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = v4[2];
  uint64_t v7 = v4[3] >> 1;
  uint64_t v8 = v7 - v6;
  if (__OFSUB__(v7, v6))
  {
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v10 = *a1;
  uint64_t v11 = *(void *)(*a1 + 16);
  BOOL v30 = __OFSUB__(v11, a2);
  uint64_t v12 = v11 - a2;
  if (v30)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v14 = v12 - a3;
  if (__OFSUB__(v12, a3))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v15 = v8 - a2;
  if (__OFSUB__(v8, a2))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  BOOL v30 = __OFSUB__(v15, v14);
  uint64_t v16 = v15 - v14;
  if (v30)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v38 = v16;
  __dst = (char *)(v10 + 32);
  uint64_t v18 = sub_1BEE6A384(v8);
  CGPoint v37 = (char *)(v10 + 32 + 32 * a2 + 32 * a3);
  if (v18)
  {
    double v36 = a4;
    if (a2 < 0) {
      goto LABEL_46;
    }
    uint64_t v19 = v18;
    uint64_t v20 = v4[2];
    BOOL v21 = (char *)(v4[1] + 32 * v20);
    int v22 = &v21[32 * a2];
    if (__dst != v21 || __dst >= v22) {
      memmove(__dst, v21, 32 * a2);
    }
    v36(v10 + 32 + 32 * a2, a3);
    if (v14 < 0) {
      goto LABEL_46;
    }
    char v23 = &v22[32 * v38];
    if (v37 != v23 || v37 >= &v23[32 * v14]) {
      memmove(v37, v23, 32 * v14);
    }
    *(void *)(v19 + 16) = 0;
    swift_release();
LABEL_26:
    swift_retain();
    uint64_t result = swift_unknownObjectRelease();
    if (!__OFSUB__(0, v20))
    {
      uint64_t v34 = *(void *)(v10 + 16);
      BOOL v30 = __OFADD__(v20, v34);
      uint64_t v35 = v20 + v34;
      if (!v30)
      {
        if (v35 >= v20)
        {
          if ((v35 & 0x8000000000000000) == 0)
          {
            void *v4 = v10;
            v4[1] = &__dst[-32 * v20];
            v4[2] = v20;
            v4[3] = (2 * v35) | 1;
            return result;
          }
          goto LABEL_39;
        }
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        goto LABEL_40;
      }
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  unsigned int v25 = (void (*)(char *, uint64_t))a4;
  uint64_t v20 = v4[2];
  uint64_t v26 = v20 + a2;
  if (__OFADD__(v20, a2))
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v26 < v20)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (__OFSUB__(v26, v20))
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v27 = v4[1];
  memcpy(__dst, (const void *)(v27 + 32 * v20), 32 * a2);
  v25(&__dst[32 * a2], a3);
  uint64_t v28 = v26 + v38;
  if (__OFADD__(v26, v38))
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  uint64_t v29 = v4[3] >> 1;
  BOOL v30 = __OFSUB__(v29, v28);
  BOOL v31 = v29 < v28;
  uint64_t v32 = v29 - v28;
  if (v31)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (!v30)
  {
    memcpy(v37, (const void *)(v27 + 32 * v28), 32 * v32);
    goto LABEL_26;
  }
LABEL_45:
  __break(1u);
LABEL_46:
  uint64_t result = sub_1BEE6EE58();
  __break(1u);
  return result;
}

uint64_t sub_1BEE69D04(uint64_t result)
{
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  unint64_t v4 = v3 >> 1;
  BOOL v5 = __OFSUB__(v3 >> 1, v2);
  uint64_t v6 = (v3 >> 1) - v2;
  if (v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v7 = result - v6;
  if (__OFSUB__(result, v6))
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!v7) {
    return result;
  }
  sub_1BEE6EE68();
  swift_unknownObjectRetain();
  uint64_t result = swift_dynamicCastClass();
  if (!result)
  {
    swift_unknownObjectRelease();
    uint64_t result = MEMORY[0x1E4FBC860];
  }
  uint64_t v8 = *(void *)(result + 16);
  BOOL v5 = __OFADD__(v8, v7);
  uint64_t v9 = v8 + v7;
  if (v5) {
    goto LABEL_13;
  }
  *(void *)(result + 16) = v9;
  uint64_t result = swift_release();
  uint64_t v10 = v4 + v7;
  if (__OFADD__(v4, v7))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v10 < 0)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  *(void *)(v1 + 24) = v3 & 1 | (2 * v10);
  return result;
}

uint64_t sub_1BEE69DBC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
  {
    __break(1u);
LABEL_32:
    if (v8 >= v7) {
      goto LABEL_21;
    }
LABEL_18:
    if (v8 + 0x4000000000000000 >= 0)
    {
      v8 *= 2;
      goto LABEL_21;
    }
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v7 = a2;
  uint64_t v6 = result;
  if ((a6 & 1) == 0) {
    goto LABEL_32;
  }
  sub_1BEE6EE68();
  swift_unknownObjectRetain();
  uint64_t v11 = swift_dynamicCastClass();
  if (!v11)
  {
    swift_unknownObjectRelease();
    uint64_t v11 = MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = *(void *)(v11 + 16);
  uint64_t v13 = a4 + 24 * a5 + 24 * v8;
  if (v13 == v11 + 24 * v12 + 32)
  {
    unint64_t v15 = *(void *)(v11 + 24);
    uint64_t result = swift_release();
    uint64_t v16 = (v15 >> 1) - v12;
    uint64_t v14 = v8 + v16;
    if (__OFADD__(v8, v16))
    {
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
  else
  {
    swift_release();
    uint64_t v14 = v8;
  }
  swift_unknownObjectRetain();
  uint64_t v17 = swift_dynamicCastClass();
  if (v14 < v7)
  {
    if (!v17)
    {
      swift_unknownObjectRelease();
      uint64_t v17 = MEMORY[0x1E4FBC860];
    }
    uint64_t v18 = *(void *)(v17 + 16);
    if (v13 == v17 + 24 * v18 + 32)
    {
      unint64_t v20 = *(void *)(v17 + 24);
      uint64_t result = swift_release();
      uint64_t v21 = (v20 >> 1) - v18;
      BOOL v22 = __OFADD__(v8, v21);
      v8 += v21;
      if (v22)
      {
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t result = swift_release();
    }
    goto LABEL_18;
  }
  if (!v17)
  {
    swift_unknownObjectRelease();
    uint64_t v17 = MEMORY[0x1E4FBC860];
  }
  uint64_t v19 = *(void *)(v17 + 16);
  if (v13 == v17 + 24 * v19 + 32)
  {
    unint64_t v23 = *(void *)(v17 + 24);
    uint64_t result = swift_release();
    uint64_t v24 = (v23 >> 1) - v19;
    BOOL v22 = __OFADD__(v8, v24);
    v8 += v24;
    if (!v22) {
      goto LABEL_21;
    }
LABEL_37:
    __break(1u);
    return result;
  }
  swift_release();
LABEL_21:
  if (v8 <= v7) {
    uint64_t v25 = v7;
  }
  else {
    uint64_t v25 = v8;
  }
  if (v25 <= v6) {
    uint64_t v26 = v6;
  }
  else {
    uint64_t v26 = v25;
  }
  if (!v26) {
    return MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1365C0);
  uint64_t v27 = (void *)swift_allocObject();
  size_t v28 = _swift_stdlib_malloc_size(v27);
  CGFloat v27[2] = v6;
  void v27[3] = 2 * ((uint64_t)(v28 - 32) / 24);
  return (uint64_t)v27;
}

uint64_t sub_1BEE69FDC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
  {
    __break(1u);
LABEL_34:
    if (v8 >= v7) {
      goto LABEL_21;
    }
LABEL_18:
    if (v8 + 0x4000000000000000 >= 0)
    {
      v8 *= 2;
      goto LABEL_21;
    }
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v7 = a2;
  uint64_t v6 = result;
  if ((a6 & 1) == 0) {
    goto LABEL_34;
  }
  sub_1BEE6EE68();
  swift_unknownObjectRetain();
  uint64_t v11 = swift_dynamicCastClass();
  if (!v11)
  {
    swift_unknownObjectRelease();
    uint64_t v11 = MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = *(void *)(v11 + 16);
  uint64_t v13 = a4 + 32 * a5 + 32 * v8;
  if (v13 == v11 + 32 * v12 + 32)
  {
    unint64_t v15 = *(void *)(v11 + 24);
    uint64_t result = swift_release();
    uint64_t v16 = (v15 >> 1) - v12;
    uint64_t v14 = v8 + v16;
    if (__OFADD__(v8, v16))
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
  }
  else
  {
    swift_release();
    uint64_t v14 = v8;
  }
  swift_unknownObjectRetain();
  uint64_t v17 = swift_dynamicCastClass();
  if (v14 < v7)
  {
    if (!v17)
    {
      swift_unknownObjectRelease();
      uint64_t v17 = MEMORY[0x1E4FBC860];
    }
    uint64_t v18 = *(void *)(v17 + 16);
    if (v13 == v17 + 32 * v18 + 32)
    {
      unint64_t v20 = *(void *)(v17 + 24);
      uint64_t result = swift_release();
      uint64_t v21 = (v20 >> 1) - v18;
      BOOL v22 = __OFADD__(v8, v21);
      v8 += v21;
      if (v22)
      {
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t result = swift_release();
    }
    goto LABEL_18;
  }
  if (!v17)
  {
    swift_unknownObjectRelease();
    uint64_t v17 = MEMORY[0x1E4FBC860];
  }
  uint64_t v19 = *(void *)(v17 + 16);
  if (v13 == v17 + 32 * v19 + 32)
  {
    unint64_t v23 = *(void *)(v17 + 24);
    uint64_t result = swift_release();
    uint64_t v24 = (v23 >> 1) - v19;
    BOOL v22 = __OFADD__(v8, v24);
    v8 += v24;
    if (!v22) {
      goto LABEL_21;
    }
LABEL_39:
    __break(1u);
    return result;
  }
  swift_release();
LABEL_21:
  if (v8 <= v7) {
    uint64_t v25 = v7;
  }
  else {
    uint64_t v25 = v8;
  }
  if (v25 <= v6) {
    uint64_t v26 = v6;
  }
  else {
    uint64_t v26 = v25;
  }
  if (!v26) {
    return MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136718);
  uint64_t v27 = (void *)swift_allocObject();
  int64_t v28 = _swift_stdlib_malloc_size(v27);
  uint64_t v29 = v28 - 32;
  if (v28 < 32) {
    uint64_t v29 = v28 - 1;
  }
  CGFloat v27[2] = v6;
  void v27[3] = 2 * (v29 >> 5);
  return (uint64_t)v27;
}

uint64_t (*sub_1BEE6A1E0())()
{
  return nullsub_1;
}

uint64_t sub_1BEE6A200(uint64_t a1)
{
  int64_t isUniquelyReferenced_nonNull = swift_isUniquelyReferenced_nonNull();
  if (!isUniquelyReferenced_nonNull) {
    return 0;
  }
  uint64_t v6 = v1[2];
  unint64_t v5 = v1[3];
  uint64_t v7 = (v5 >> 1) - v6;
  if (__OFSUB__(v5 >> 1, v6))
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v8 = v1[1];
  if ((v5 & 1) == 0) {
    goto LABEL_8;
  }
  sub_1BEE6EE68();
  swift_unknownObjectRetain();
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = MEMORY[0x1E4FBC860];
  }
  uint64_t v10 = *(void *)(v9 + 16);
  if (v8 + 24 * v6 + 24 * v7 != v9 + 24 * v10 + 32)
  {
    swift_release();
LABEL_8:
    uint64_t v11 = v7;
    goto LABEL_10;
  }
  unint64_t v12 = *(void *)(v9 + 24);
  uint64_t result = swift_release();
  uint64_t v14 = (v12 >> 1) - v10;
  BOOL v15 = __OFADD__(v7, v14);
  uint64_t v11 = v7 + v14;
  if (!v15)
  {
LABEL_10:
    if (v11 < a1) {
      return 0;
    }
    sub_1BEE6EE68();
    swift_unknownObjectRetain();
    a1 = swift_dynamicCastClass();
    if (!a1)
    {
      swift_unknownObjectRelease();
      a1 = MEMORY[0x1E4FBC860];
    }
    uint64_t v16 = (v8 + 24 * v6 - a1 - 32) / 24;
    int64_t isUniquelyReferenced_nonNull = v7 + v16;
    if (!__OFADD__(v7, v16))
    {
      uint64_t v4 = *(void *)(a1 + 16);
      if (isUniquelyReferenced_nonNull >= v4) {
        return a1;
      }
LABEL_19:
      sub_1BEE6A7B4(isUniquelyReferenced_nonNull, v4, 0);
      return a1;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BEE6A384(uint64_t a1)
{
  int64_t isUniquelyReferenced_nonNull = swift_isUniquelyReferenced_nonNull();
  if (!isUniquelyReferenced_nonNull) {
    return 0;
  }
  uint64_t v6 = v1[2];
  unint64_t v5 = v1[3];
  uint64_t v7 = (v5 >> 1) - v6;
  if (__OFSUB__(v5 >> 1, v6))
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v8 = v1[1];
  if ((v5 & 1) == 0) {
    goto LABEL_8;
  }
  sub_1BEE6EE68();
  swift_unknownObjectRetain();
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = MEMORY[0x1E4FBC860];
  }
  uint64_t v10 = *(void *)(v9 + 16);
  if (v8 + 32 * v6 + 32 * v7 != v9 + 32 * v10 + 32)
  {
    swift_release();
LABEL_8:
    uint64_t v11 = v7;
    goto LABEL_10;
  }
  unint64_t v12 = *(void *)(v9 + 24);
  uint64_t result = swift_release();
  uint64_t v14 = (v12 >> 1) - v10;
  BOOL v15 = __OFADD__(v7, v14);
  uint64_t v11 = v7 + v14;
  if (!v15)
  {
LABEL_10:
    if (v11 < a1) {
      return 0;
    }
    sub_1BEE6EE68();
    swift_unknownObjectRetain();
    a1 = swift_dynamicCastClass();
    if (!a1)
    {
      swift_unknownObjectRelease();
      a1 = MEMORY[0x1E4FBC860];
    }
    uint64_t v16 = v8 + 32 * v6 - a1;
    uint64_t v17 = v16 - 32;
    uint64_t v18 = v16 - 1;
    if (v17 >= 0) {
      uint64_t v18 = v17;
    }
    int64_t isUniquelyReferenced_nonNull = v7 + (v18 >> 5);
    if (!__OFADD__(v7, v18 >> 5))
    {
      uint64_t v4 = *(void *)(a1 + 16);
      if (isUniquelyReferenced_nonNull >= v4) {
        return a1;
      }
LABEL_21:
      sub_1BEE6AEDC(isUniquelyReferenced_nonNull, v4, 0);
      return a1;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

char *sub_1BEE6A4F4(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *((void *)v4 + 3) >> 1)
  {
    if (!v8) {
      goto LABEL_21;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t result = (char *)sub_1BEE6D238(result, v11, 1, v4);
    uint64_t v4 = result;
    if (!v8) {
      goto LABEL_21;
    }
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_27;
  }
  if ((v14 & 0x8000000000000000) == 0)
  {
    uint64_t result = &v4[24 * a1 + 32];
    BOOL v15 = &v4[24 * a2 + 32];
    if (a1 != a2 || result >= &v15[24 * v14]) {
      uint64_t result = (char *)memmove(result, v15, 24 * v14);
    }
    uint64_t v16 = *((void *)v4 + 2);
    BOOL v13 = __OFADD__(v16, v8);
    uint64_t v17 = v16 + v8;
    if (!v13)
    {
      *((void *)v4 + 2) = v17;
LABEL_21:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  uint64_t result = (char *)sub_1BEE6EE58();
  __break(1u);
  return result;
}

char *sub_1BEE6A658(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *((void *)v4 + 3) >> 1)
  {
    if (!v8) {
      goto LABEL_21;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t result = (char *)sub_1BEE6D360(result, v11, 1, v4);
    uint64_t v4 = result;
    if (!v8) {
      goto LABEL_21;
    }
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_27;
  }
  if ((v14 & 0x8000000000000000) == 0)
  {
    uint64_t result = &v4[32 * a1 + 32];
    BOOL v15 = &v4[32 * a2 + 32];
    if (a1 != a2 || result >= &v15[32 * v14]) {
      uint64_t result = (char *)memmove(result, v15, 32 * v14);
    }
    uint64_t v16 = *((void *)v4 + 2);
    BOOL v13 = __OFADD__(v16, v8);
    uint64_t v17 = v16 + v8;
    if (!v13)
    {
      *((void *)v4 + 2) = v17;
LABEL_21:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  uint64_t result = (char *)sub_1BEE6EE58();
  __break(1u);
  return result;
}

unint64_t sub_1BEE6A7B4(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = a3 - v4;
  if (__OFSUB__(a3, v4))
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = *v3;
  uint64_t v8 = *(void *)(v7 + 16);
  BOOL v9 = __OFSUB__(v8, a2);
  uint64_t v10 = v8 - a2;
  if (v9) {
    goto LABEL_18;
  }
  if (v10 < 0)
  {
LABEL_21:
    uint64_t result = sub_1BEE6EE58();
    __break(1u);
    return result;
  }
  uint64_t result = v7 + 32 + 24 * result + 24 * a3;
  int64_t v11 = (const void *)(v7 + 32 + 24 * a2);
  if ((const void *)result != v11 || result >= (unint64_t)v11 + 24 * v10) {
    uint64_t result = (unint64_t)memmove((void *)result, v11, 24 * v10);
  }
  uint64_t v13 = *(void *)(v7 + 16);
  BOOL v9 = __OFADD__(v13, v6);
  uint64_t v14 = v13 + v6;
  if (v9) {
    goto LABEL_19;
  }
  *(void *)(v7 + 16) = v14;
LABEL_14:
  if (a3 > 0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

void *sub_1BEE6A8B4(void *result)
{
  uint64_t v3 = v1[2];
  unint64_t v2 = v1[3];
  uint64_t v4 = (v2 >> 1) - v3;
  if (__OFSUB__(v2 >> 1, v3)) {
    goto LABEL_48;
  }
  uint64_t v5 = result[4];
  uint64_t v31 = result[3] >> 1;
  if (v5 == v31) {
    return result;
  }
  if (v5 < result[2] || v5 >= v31) {
    goto LABEL_49;
  }
  uint64_t v30 = result[2];
  uint64_t v7 = v5 + 1;
  uint64_t v29 = result[1];
  uint64_t v8 = (long long *)(v29 + 24 * v5);
  uint64_t v32 = *((void *)v8 + 2);
  long long v33 = *v8;
  while (!__OFADD__(v4, 1))
  {
    uint64_t v35 = sub_1BEE69DBC(v4, v4 + 1, *v1, v1[1], v3, v2);
    BOOL v9 = sub_1BEE6A1E0();
    sub_1BEE697E4(&v35, v4, 0, (void (*)(uint64_t, uint64_t))v9);
    swift_release();
    uint64_t result = (void *)swift_release();
    uint64_t v3 = v1[2];
    unint64_t v2 = v1[3];
    uint64_t v10 = (v2 >> 1) - v3;
    if (__OFSUB__(v2 >> 1, v3)) {
      goto LABEL_42;
    }
    uint64_t v11 = v1[1];
    unint64_t v34 = v2 >> 1;
    if (v2)
    {
      sub_1BEE6EE68();
      swift_unknownObjectRetain();
      uint64_t v12 = swift_dynamicCastClass();
      if (!v12)
      {
        swift_unknownObjectRelease();
        uint64_t v12 = MEMORY[0x1E4FBC860];
      }
      uint64_t v13 = *(void *)(v12 + 16);
      if (v11 + 24 * v3 + 24 * v10 != v12 + 24 * v13 + 32)
      {
        uint64_t result = (void *)swift_release();
        uint64_t v14 = (v2 >> 1) - v3;
        if (v4 >= v10) {
          goto LABEL_23;
        }
        goto LABEL_19;
      }
      unint64_t v17 = *(void *)(v12 + 24);
      uint64_t result = (void *)swift_release();
      uint64_t v18 = (v17 >> 1) - v13;
      BOOL v19 = __OFADD__(v10, v18);
      uint64_t v14 = v10 + v18;
      if (v19) {
        goto LABEL_47;
      }
    }
    else
    {
      uint64_t v14 = (v2 >> 1) - v3;
    }
    if (v4 >= v14)
    {
LABEL_23:
      char v16 = 0;
      goto LABEL_31;
    }
LABEL_19:
    uint64_t v15 = v11 + 24 * v3 + 24 * v4;
    *(_OWORD *)uint64_t v15 = v33;
    *(void *)(v15 + 16) = v32;
    long long v33 = 0u;
    if (v7 != v31)
    {
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = v29 + 24 * v7;
      while (v7 >= v30 && v7 + v21 < v31)
      {
        uint64_t v23 = *(void *)(v22 + v20 + 16);
        if (~v4 + v14 == v21)
        {
          char v16 = 0;
          uint64_t v32 = *(void *)(v22 + v20 + 16);
          v7 += v21 + 1;
          uint64_t v4 = v14;
          long long v33 = *(_OWORD *)(v22 + v20);
          goto LABEL_31;
        }
        uint64_t v24 = v11 + 24 * v3 + 24 * v4 + v20;
        *(_OWORD *)(v24 + 24) = *(_OWORD *)(v22 + v20);
        *(void *)(v24 + 40) = v23;
        ++v21;
        v20 += 24;
        if (!(v7 - v31 + v21))
        {
          uint64_t v32 = 0;
          v4 += 1 + v21;
          uint64_t v7 = v31;
          char v16 = 1;
          goto LABEL_31;
        }
      }
      __break(1u);
      break;
    }
    uint64_t v32 = 0;
    uint64_t v7 = v31;
    char v16 = 1;
    ++v4;
LABEL_31:
    uint64_t v25 = v4 - v10;
    if (__OFSUB__(v4, v10)) {
      goto LABEL_43;
    }
    if (v25)
    {
      sub_1BEE6EE68();
      swift_unknownObjectRetain();
      uint64_t result = (void *)swift_dynamicCastClass();
      if (!result)
      {
        swift_unknownObjectRelease();
        uint64_t result = (void *)MEMORY[0x1E4FBC860];
      }
      uint64_t v26 = result[2];
      BOOL v19 = __OFADD__(v26, v25);
      uint64_t v27 = v26 + v25;
      if (v19) {
        goto LABEL_44;
      }
      result[2] = v27;
      uint64_t result = (void *)swift_release();
      unint64_t v28 = v34 + v25;
      if (__OFADD__(v34, v25)) {
        goto LABEL_45;
      }
      if ((v28 & 0x8000000000000000) != 0) {
        goto LABEL_46;
      }
      unint64_t v2 = v2 & 1 | (2 * v28);
      v1[3] = v2;
    }
    if (v16) {
      return result;
    }
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

void *sub_1BEE6ABEC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v8 = v4[2];
  unint64_t v7 = v4[3];
  int64_t v9 = (v7 >> 1) - v8;
  if (__OFSUB__(v7 >> 1, v8))
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if ((v7 & 1) == 0)
  {
LABEL_8:
    int64_t v15 = v9;
    goto LABEL_10;
  }
  uint64_t v12 = v4[1];
  sub_1BEE6EE68();
  swift_unknownObjectRetain();
  uint64_t v13 = swift_dynamicCastClass();
  if (!v13)
  {
    swift_unknownObjectRelease();
    uint64_t v13 = MEMORY[0x1E4FBC860];
  }
  uint64_t v14 = *(void *)(v13 + 16);
  if (v12 + 24 * v8 + 24 * v9 != v13 + 24 * v14 + 32)
  {
    swift_release();
    goto LABEL_8;
  }
  unint64_t v16 = *(void *)(v13 + 24);
  swift_release();
  uint64_t v17 = (v16 >> 1) - v14;
  BOOL v18 = __OFADD__(v9, v17);
  int64_t v15 = v9 + v17;
  if (v18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
LABEL_10:
  int64_t v19 = v9 + v6;
  if (__OFADD__(v9, v6))
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v15 < v19)
  {
    if (v15 + 0x4000000000000000 < 0)
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    uint64_t v20 = 2 * v15;
    if (v20 > v19) {
      int64_t v19 = v20;
    }
  }
  uint64_t result = (void *)sub_1BEE692E4(v19);
  uint64_t v23 = v4[2];
  unint64_t v22 = v4[3];
  uint64_t v24 = (v22 >> 1) - v23;
  if (__OFSUB__(v22 >> 1, v23)) {
    goto LABEL_40;
  }
  uint64_t v25 = (char *)(v4[1] + 24 * v23 + 24 * v24);
  if ((v22 & 1) == 0)
  {
LABEL_21:
    uint64_t v28 = v24;
    goto LABEL_23;
  }
  sub_1BEE6EE68();
  swift_unknownObjectRetain();
  uint64_t v26 = swift_dynamicCastClass();
  if (!v26)
  {
    swift_unknownObjectRelease();
    uint64_t v26 = MEMORY[0x1E4FBC860];
  }
  uint64_t v27 = *(void *)(v26 + 16);
  if (v25 != (char *)(v26 + 24 * v27 + 32))
  {
    uint64_t result = (void *)swift_release();
    goto LABEL_21;
  }
  unint64_t v29 = *(void *)(v26 + 24);
  uint64_t result = (void *)swift_release();
  uint64_t v30 = (v29 >> 1) - v27;
  BOOL v18 = __OFADD__(v24, v30);
  uint64_t v28 = v24 + v30;
  if (v18)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
LABEL_23:
  uint64_t v31 = v28 - v24;
  if (__OFSUB__(v28, v24))
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v5 == a3)
  {
    if (v6 <= 0)
    {
      uint64_t v6 = 0;
      unint64_t v5 = a3;
      goto LABEL_34;
    }
    goto LABEL_42;
  }
  if (v31 < v6)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (v6 < 0) {
    goto LABEL_48;
  }
  uint64_t v32 = (char *)(a2 + 24 * a3);
  size_t v33 = 24 * v6;
  if (v32 < &v25[24 * v6] && v25 < &v32[v33]) {
    goto LABEL_48;
  }
  uint64_t result = memcpy(v25, v32, v33);
  if (v6)
  {
    if (__OFADD__(v24, v6))
    {
LABEL_47:
      __break(1u);
LABEL_48:
      uint64_t result = (void *)sub_1BEE6EE58();
      __break(1u);
      return result;
    }
    uint64_t result = (void *)sub_1BEE69D04(v24 + v6);
  }
LABEL_34:
  if (v6 == v31)
  {
    v36[0] = a1;
    v36[1] = a2;
    v36[2] = a3;
    v36[3] = a4;
    v36[4] = v5;
    return sub_1BEE6A8B4(v36);
  }
  return result;
}

unint64_t sub_1BEE6AEDC(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = a3 - v4;
  if (__OFSUB__(a3, v4))
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = *v3;
  uint64_t v8 = *(void *)(v7 + 16);
  BOOL v9 = __OFSUB__(v8, a2);
  uint64_t v10 = v8 - a2;
  if (v9) {
    goto LABEL_18;
  }
  if (v10 < 0)
  {
LABEL_21:
    uint64_t result = sub_1BEE6EE58();
    __break(1u);
    return result;
  }
  uint64_t result = v7 + 32 + 32 * result + 32 * a3;
  uint64_t v11 = (const void *)(v7 + 32 + 32 * a2);
  if ((const void *)result != v11 || result >= (unint64_t)v11 + 32 * v10) {
    uint64_t result = (unint64_t)memmove((void *)result, v11, 32 * v10);
  }
  uint64_t v13 = *(void *)(v7 + 16);
  BOOL v9 = __OFADD__(v13, v6);
  uint64_t v14 = v13 + v6;
  if (v9) {
    goto LABEL_19;
  }
  *(void *)(v7 + 16) = v14;
LABEL_14:
  if (a3 > 0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

void *sub_1BEE6AFD0(void *result)
{
  uint64_t v3 = *(void *)(v1 + 16);
  unint64_t v2 = *(void *)(v1 + 24);
  uint64_t v4 = (v2 >> 1) - v3;
  if (__OFSUB__(v2 >> 1, v3)) {
    goto LABEL_54;
  }
  uint64_t v5 = result[4];
  uint64_t v35 = result[3] >> 1;
  if (v5 != v35)
  {
    if (v5 < result[2] || v5 >= v35) {
      goto LABEL_55;
    }
    uint64_t v7 = (uint64_t *)v1;
    uint64_t v34 = result[2];
    uint64_t v8 = v5 + 1;
    BOOL v9 = (long long *)(result[1] + 32 * v5);
    long long v10 = *v9;
    long long v11 = v9[1];
    uint64_t v33 = result[1];
    while (!__OFADD__(v4, 1))
    {
      long long v37 = v11;
      long long v39 = v10;
      uint64_t v41 = sub_1BEE69FDC(v4, v4 + 1, *v7, v7[1], v3, v2);
      uint64_t v12 = sub_1BEE6A1E0();
      uint64_t v13 = v7;
      sub_1BEE69A88(&v41, v4, 0, (void (*)(uint64_t, uint64_t))v12);
      swift_release();
      uint64_t result = (void *)swift_release();
      uint64_t v3 = v7[2];
      unint64_t v2 = v7[3];
      unint64_t v14 = v2 >> 1;
      unint64_t v15 = (v2 >> 1) - v3;
      if (__OFSUB__(v2 >> 1, v3)) {
        goto LABEL_48;
      }
      uint64_t v16 = v7[1];
      if (v2)
      {
        unint64_t v36 = v7[3];
        sub_1BEE6EE68();
        swift_unknownObjectRetain();
        uint64_t v17 = swift_dynamicCastClass();
        if (!v17)
        {
          swift_unknownObjectRelease();
          uint64_t v17 = MEMORY[0x1E4FBC860];
        }
        uint64_t v18 = *(void *)(v17 + 16);
        if (v16 + 32 * v3 + 32 * v15 == v17 + 32 * v18 + 32)
        {
          unint64_t v20 = *(void *)(v17 + 24);
          uint64_t result = (void *)swift_release();
          uint64_t v21 = (v20 >> 1) - v18;
          BOOL v22 = __OFADD__(v15, v21);
          int64_t v19 = v15 + v21;
          if (v22) {
            goto LABEL_53;
          }
          uint64_t v7 = v13;
        }
        else
        {
          uint64_t result = (void *)swift_release();
          int64_t v19 = v15;
        }
        unint64_t v2 = v36;
      }
      else
      {
        int64_t v19 = (v2 >> 1) - v3;
      }
      long long v11 = v37;
      long long v10 = v39;
      if (v4 >= v19)
      {
        char v24 = 0;
        unint64_t v25 = v4 - v15;
        if (__OFSUB__(v4, v15)) {
          goto LABEL_49;
        }
      }
      else
      {
        uint64_t v23 = (_OWORD *)(v16 + 32 * v3 + 32 * v4);
        *uint64_t v23 = v39;
        v23[1] = v37;
        if (v8 == v35)
        {
          long long v10 = 0uLL;
          uint64_t v8 = v35;
          char v24 = 1;
          ++v4;
LABEL_34:
          long long v11 = 0uLL;
          unint64_t v25 = v4 - v15;
          if (__OFSUB__(v4, v15)) {
            goto LABEL_49;
          }
        }
        else
        {
          uint64_t v26 = 0;
          uint64_t v27 = (_OWORD *)(v16 + 32 * v4 + 32 * v3 + 48);
          while (1)
          {
            if (v8 < v34 || v8 + v26 >= v35)
            {
              __break(1u);
              goto LABEL_47;
            }
            uint64_t v28 = (long long *)(v33 + 32 * v8 + 32 * v26);
            long long v10 = *v28;
            long long v11 = v28[1];
            if (~v4 + v19 == v26) {
              break;
            }
            *(v27 - 1) = v10;
            *uint64_t v27 = v11;
            ++v26;
            v27 += 2;
            if (!(v8 - v35 + v26))
            {
              v4 += 1 + v26;
              long long v10 = 0uLL;
              uint64_t v8 = v35;
              char v24 = 1;
              goto LABEL_34;
            }
          }
          char v24 = 0;
          v8 += v26 + 1;
          uint64_t v4 = v19;
          unint64_t v25 = v19 - v15;
          if (__OFSUB__(v19, v15)) {
            goto LABEL_49;
          }
        }
      }
      if (v25)
      {
        char v29 = v2;
        long long v38 = v11;
        long long v40 = v10;
        sub_1BEE6EE68();
        swift_unknownObjectRetain();
        uint64_t result = (void *)swift_dynamicCastClass();
        if (!result)
        {
          swift_unknownObjectRelease();
          uint64_t result = (void *)MEMORY[0x1E4FBC860];
        }
        uint64_t v30 = result[2];
        BOOL v22 = __OFADD__(v30, v25);
        uint64_t v31 = v30 + v25;
        if (v22) {
          goto LABEL_50;
        }
        result[2] = v31;
        uint64_t result = (void *)swift_release();
        unint64_t v32 = v14 + v25;
        if (__OFADD__(v14, v25)) {
          goto LABEL_51;
        }
        if ((v32 & 0x8000000000000000) != 0) {
          goto LABEL_52;
        }
        unint64_t v2 = v29 & 1 | (2 * v32);
        v7[3] = v2;
        long long v11 = v38;
        long long v10 = v40;
      }
      if (v24) {
        return result;
      }
    }
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
  }
  return result;
}

void *sub_1BEE6B2F8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v8 = v4[2];
  unint64_t v7 = v4[3];
  uint64_t v9 = (v7 >> 1) - v8;
  if (__OFSUB__(v7 >> 1, v8))
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if ((v7 & 1) == 0)
  {
LABEL_8:
    uint64_t v15 = v9;
    goto LABEL_10;
  }
  uint64_t v12 = v4[1];
  sub_1BEE6EE68();
  swift_unknownObjectRetain();
  uint64_t v13 = swift_dynamicCastClass();
  if (!v13)
  {
    swift_unknownObjectRelease();
    uint64_t v13 = MEMORY[0x1E4FBC860];
  }
  uint64_t v14 = *(void *)(v13 + 16);
  if (v12 + 32 * v8 + 32 * v9 != v13 + 32 * v14 + 32)
  {
    swift_release();
    goto LABEL_8;
  }
  unint64_t v16 = *(void *)(v13 + 24);
  swift_release();
  uint64_t v17 = (v16 >> 1) - v14;
  BOOL v18 = __OFADD__(v9, v17);
  uint64_t v15 = v9 + v17;
  if (v18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
LABEL_10:
  uint64_t v19 = v9 + v6;
  if (__OFADD__(v9, v6))
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v15 < v19)
  {
    if (v15 + 0x4000000000000000 < 0)
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    uint64_t v20 = 2 * v15;
    if (v20 > v19) {
      uint64_t v19 = v20;
    }
  }
  uint64_t result = (void *)sub_1BEE69574(v19);
  uint64_t v23 = v4[2];
  unint64_t v22 = v4[3];
  uint64_t v24 = (v22 >> 1) - v23;
  if (__OFSUB__(v22 >> 1, v23)) {
    goto LABEL_40;
  }
  unint64_t v25 = (char *)(v4[1] + 32 * v23 + 32 * v24);
  if ((v22 & 1) == 0)
  {
LABEL_21:
    uint64_t v28 = v24;
    goto LABEL_23;
  }
  sub_1BEE6EE68();
  swift_unknownObjectRetain();
  uint64_t v26 = swift_dynamicCastClass();
  if (!v26)
  {
    swift_unknownObjectRelease();
    uint64_t v26 = MEMORY[0x1E4FBC860];
  }
  uint64_t v27 = *(void *)(v26 + 16);
  if (v25 != (char *)(v26 + 32 * v27 + 32))
  {
    uint64_t result = (void *)swift_release();
    goto LABEL_21;
  }
  unint64_t v29 = *(void *)(v26 + 24);
  uint64_t result = (void *)swift_release();
  uint64_t v30 = (v29 >> 1) - v27;
  BOOL v18 = __OFADD__(v24, v30);
  uint64_t v28 = v24 + v30;
  if (v18)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
LABEL_23:
  uint64_t v31 = v28 - v24;
  if (__OFSUB__(v28, v24))
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v5 == a3)
  {
    if (v6 <= 0)
    {
      uint64_t v6 = 0;
      unint64_t v5 = a3;
      goto LABEL_34;
    }
    goto LABEL_42;
  }
  if (v31 < v6)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (v6 < 0) {
    goto LABEL_48;
  }
  unint64_t v32 = (char *)(a2 + 32 * a3);
  size_t v33 = 32 * v6;
  if (v32 < &v25[32 * v6] && v25 < &v32[v33]) {
    goto LABEL_48;
  }
  uint64_t result = memcpy(v25, v32, v33);
  if (v6)
  {
    if (__OFADD__(v24, v6))
    {
LABEL_47:
      __break(1u);
LABEL_48:
      uint64_t result = (void *)sub_1BEE6EE58();
      __break(1u);
      return result;
    }
    uint64_t result = (void *)sub_1BEE69D04(v24 + v6);
  }
LABEL_34:
  if (v6 == v31)
  {
    v36[0] = a1;
    v36[1] = a2;
    v36[2] = a3;
    v36[3] = a4;
    v36[4] = v5;
    return sub_1BEE6AFD0(v36);
  }
  return result;
}

uint64_t sub_1BEE6B5D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136720);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BEE6B6F0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_model);
  uint64_t v2 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount;
  if (!*(void *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount)) {
    return;
  }
  uint64_t v3 = (void *)(v0 + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_overlappingSections);
  swift_beginAccess();
  *uint64_t v3 = MEMORY[0x1E4FBC870];
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)(v0 + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_visibleSectionIndices);
  swift_beginAccess();
  void *v4 = MEMORY[0x1E4FBC868];
  swift_bridgeObjectRelease();
  unint64_t v5 = *(void *)(v1 + v2);
  unint64_t v6 = v5 - 1;
  if (v5 == 1) {
    return;
  }
  if (!v5) {
    goto LABEL_60;
  }
  unint64_t v7 = 0;
  unint64_t v42 = 0;
  char v8 = 0;
  uint64_t v9 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_endTickMarksProminent;
  uint64_t v10 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkOffset;
  uint64_t v11 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkInterval;
  uint64_t v47 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic;
  uint64_t v44 = v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource;
  uint64_t v46 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing;
  uint64_t v45 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth;
  uint64_t v12 = 1;
  uint64_t v43 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkOffset;
LABEL_5:
  unint64_t v13 = v7;
  double v14 = (double)v7;
  unint64_t v7 = v12;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (*(unsigned char *)(v1 + v9) == 1)
    {
      if (__OFADD__(v7, 1)) {
        goto LABEL_58;
      }
      if (v7 + 1 == *(void *)(v1 + v2))
      {
LABEL_44:
        if (v8)
        {
          if (v7 < v42) {
            goto LABEL_61;
          }
          swift_beginAccess();
          sub_1BEE6D69C(&v48, v42, v7);
          swift_endAccess();
          uint64_t v10 = v43;
          if (v6 == v7) {
            return;
          }
        }
        else if (v6 == v7)
        {
          return;
        }
        char v8 = 0;
        unint64_t v42 = v7;
LABEL_52:
        uint64_t v12 = v7 + 1;
        if (v7 + 1 < v5) {
          goto LABEL_5;
        }
LABEL_53:
        __break(1u);
        return;
      }
    }
    uint64_t v15 = *(void *)(v1 + v10);
    BOOL v16 = __OFADD__(v7, v15);
    uint64_t v17 = v7 + v15;
    if (v16) {
      goto LABEL_56;
    }
    uint64_t v18 = *(void *)(v1 + v11);
    if (!v18) {
      goto LABEL_57;
    }
    if (v17 == 0x8000000000000000 && v18 == -1) {
      goto LABEL_59;
    }
    if (!(v17 % v18)) {
      goto LABEL_44;
    }
    if (v13 != v7)
    {
      if (v13 >= v7) {
        goto LABEL_48;
      }
      if (*(unsigned char *)(v1 + v47) == 1)
      {
        uint64_t v20 = *(void *)(v1 + v2);
        if (!v20)
        {
          double v31 = 0.0;
          double v32 = *(double *)(v1 + v45) + 0.0;
          goto LABEL_40;
        }
        unint64_t v21 = v20 - 1;
        if (v21)
        {
          double v22 = (double)v21;
          double v23 = log10(v14 / (double)v21 * 9.0 + 1.0);
          double v24 = *(double *)(v1 + v46);
          long double v25 = v24 / log10(1.0 / v22 * 9.0 + 1.0);
          double v26 = *(double *)(v1 + v45);
          double v27 = v25 + v26;
        }
        else
        {
          double v27 = *(double *)(v1 + v45);
          double v23 = 0.0;
          double v26 = v27;
        }
        double v32 = v23 * (v27 - v26) + v26;
        uint64_t v33 = *(void *)(v1 + v2);
        if (v33)
        {
LABEL_34:
          unint64_t v37 = v33 - 1;
          if (v37)
          {
            double v38 = (double)v37;
            double v39 = log10((double)v7 / (double)v37 * 9.0 + 1.0);
            double v40 = *(double *)(v1 + v46);
            double v41 = v26 + v40 / log10(1.0 / v38 * 9.0 + 1.0);
          }
          else
          {
            double v39 = 0.0;
            double v41 = v26;
          }
          double v31 = v39 * (v41 - v26);
          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v28 = (void *)MEMORY[0x1C189E660](v44);
        if (v28)
        {
          objc_msgSend(v28, sel_alignmentRectInsets);
          double v30 = v29;
          swift_unknownObjectRelease();
        }
        else
        {
          double v30 = 0.0;
        }
        double v26 = *(double *)(v1 + v45);
        double v32 = v30 + *(double *)(v1 + v46) * v14 + v26;
        if (*(unsigned char *)(v1 + v47) != 1)
        {
          uint64_t v34 = (void *)MEMORY[0x1C189E660](v44);
          if (v34)
          {
            objc_msgSend(v34, sel_alignmentRectInsets);
            double v36 = v35;
            swift_unknownObjectRelease();
          }
          else
          {
            double v36 = 0.0;
          }
          uint64_t v10 = v43;
          double v31 = v36 + *(double *)(v1 + v46) * (double)v7;
LABEL_40:
          if (v31 > v32 + 0.6666667)
          {
LABEL_48:
            if (v6 == v7) {
              return;
            }
            goto LABEL_52;
          }
          goto LABEL_41;
        }
        uint64_t v10 = v43;
        uint64_t v33 = *(void *)(v1 + v2);
        if (v33) {
          goto LABEL_34;
        }
      }
      double v31 = 0.0;
      goto LABEL_40;
    }
LABEL_41:
    if (v6 == v7) {
      return;
    }
    ++v7;
    char v8 = 1;
    if (v7 >= v5) {
      goto LABEL_53;
    }
  }
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
}

uint64_t sub_1BEE6BB84(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_needsRebuild;
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_needsRebuild) == 1)
  {
    sub_1BEE6B6F0();
    *(unsigned char *)(v1 + v4) = 0;
  }
  uint64_t v5 = v1 + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_overlappingSections;
  uint64_t result = swift_beginAccess();
  int64_t v7 = 0;
  uint64_t v8 = *(void *)v5 + 56;
  uint64_t v9 = 1 << *(unsigned char *)(*(void *)v5 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(*(void *)v5 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (v11)
  {
    unint64_t v13 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    unint64_t v14 = v13 | (v7 << 6);
LABEL_7:
    uint64_t v15 = (unint64_t *)(*(void *)(*(void *)v5 + 48) + 16 * v14);
    unint64_t v16 = *v15;
    unint64_t v17 = v15[1];
    if (*v15 <= a1 && v17 > a1)
    {
      if (v16 == a1)
      {
LABEL_31:
        char v22 = 0;
      }
      else
      {
        double v23 = (uint64_t *)(v2 + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_visibleSectionIndices);
        swift_beginAccess();
        uint64_t v24 = *v23;
        if (*(void *)(*v23 + 16) && (unint64_t v25 = sub_1BEE6D5BC(v16), (v26 & 1) != 0))
        {
          uint64_t v27 = *(void *)(*(void *)(v24 + 56) + 8 * v25);
          swift_endAccess();
          char v22 = sub_1BEE6BEE0(a1, v27) ^ 1;
        }
        else
        {
          swift_endAccess();
          sub_1BEE6BF44(v16, v17);
          if (v16)
          {
            sub_1BEE6C6BC(v16, v17, v28);
            uint64_t v30 = v29;
            swift_beginAccess();
            swift_bridgeObjectRetain();
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v35 = *v23;
            *double v23 = 0x8000000000000000;
            sub_1BEE6E30C(v30, v16, isUniquelyReferenced_nonNull_native);
            *double v23 = v35;
            swift_bridgeObjectRelease();
            swift_endAccess();
            char v32 = sub_1BEE6BEE0(a1, v30);
            swift_bridgeObjectRelease();
            char v22 = v32 ^ 1;
          }
          else
          {
            unint64_t v33 = sub_1BEE6C2D8(0, v17);
            swift_beginAccess();
            swift_bridgeObjectRetain();
            char v34 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v36 = *v23;
            *double v23 = 0x8000000000000000;
            sub_1BEE6E30C(v33, 0, v34);
            *double v23 = v36;
            swift_bridgeObjectRelease();
            swift_endAccess();
            char v22 = sub_1BEE6BEE0(a1, v33);
            swift_bridgeObjectRelease();
          }
        }
      }
      return v22 & 1;
    }
  }
  int64_t v19 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_40;
  }
  if (v19 >= v12) {
    goto LABEL_31;
  }
  unint64_t v20 = *(void *)(v8 + 8 * v19);
  ++v7;
  if (v20) {
    goto LABEL_29;
  }
  int64_t v7 = v19 + 1;
  if (v19 + 1 >= v12) {
    goto LABEL_31;
  }
  unint64_t v20 = *(void *)(v8 + 8 * v7);
  if (v20) {
    goto LABEL_29;
  }
  int64_t v7 = v19 + 2;
  if (v19 + 2 >= v12) {
    goto LABEL_31;
  }
  unint64_t v20 = *(void *)(v8 + 8 * v7);
  if (v20) {
    goto LABEL_29;
  }
  int64_t v7 = v19 + 3;
  if (v19 + 3 >= v12) {
    goto LABEL_31;
  }
  unint64_t v20 = *(void *)(v8 + 8 * v7);
  if (v20) {
    goto LABEL_29;
  }
  int64_t v7 = v19 + 4;
  if (v19 + 4 >= v12) {
    goto LABEL_31;
  }
  unint64_t v20 = *(void *)(v8 + 8 * v7);
  if (v20)
  {
LABEL_29:
    unint64_t v11 = (v20 - 1) & v20;
    unint64_t v14 = __clz(__rbit64(v20)) + (v7 << 6);
    goto LABEL_7;
  }
  int64_t v21 = v19 + 5;
  if (v21 >= v12) {
    goto LABEL_31;
  }
  unint64_t v20 = *(void *)(v8 + 8 * v21);
  if (v20)
  {
    int64_t v7 = v21;
    goto LABEL_29;
  }
  while (1)
  {
    int64_t v7 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v7 >= v12) {
      goto LABEL_31;
    }
    unint64_t v20 = *(void *)(v8 + 8 * v7);
    ++v21;
    if (v20) {
      goto LABEL_29;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1BEE6BEE0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

void sub_1BEE6BF44(unint64_t a1, unint64_t a2)
{
  if (a1 == a2) {
    return;
  }
  unint64_t v4 = a1;
  if (a2 < a1)
  {
LABEL_42:
    __break(1u);
    return;
  }
  uint64_t v5 = 0;
  uint64_t v6 = OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_model;
  unint64_t v7 = a1;
  uint64_t v35 = v2;
  do
  {
    if (v4 >= a2)
    {
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v4 == v7) {
      goto LABEL_5;
    }
    if (!v4 || v7 >= v4)
    {
LABEL_4:
      if (__CFADD__(v5++, 1)) {
        goto LABEL_41;
      }
LABEL_5:
      unint64_t v7 = v4;
      goto LABEL_6;
    }
    uint64_t v9 = *(void *)(v2 + v6);
    uint64_t v10 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic;
    if (*(unsigned char *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) == 1)
    {
      uint64_t v11 = *(void *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
      if (v11)
      {
        unint64_t v12 = v11 - 1;
        if (v12)
        {
          double v13 = (double)v12;
          double v14 = log10((double)v7 / (double)v12 * 9.0 + 1.0);
          double v15 = *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
          long double v16 = log10(1.0 / v13 * 9.0 + 1.0);
          double v17 = *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
          double v18 = v15 / v16 + v17;
        }
        else
        {
          double v18 = *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
          double v14 = 0.0;
          double v17 = v18;
        }
        double v22 = v14 * (v18 - v17);
      }
      else
      {
        double v22 = 0.0;
      }
      double v23 = *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
      double v24 = v22 + v23;
      goto LABEL_26;
    }
    int64_t v19 = (void *)MEMORY[0x1C189E660](v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v19)
    {
      objc_msgSend(v19, sel_alignmentRectInsets);
      double v21 = v20;
      swift_unknownObjectRelease();
    }
    else
    {
      double v21 = 0.0;
    }
    double v23 = *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
    double v24 = v21 + *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing) * (double)v7 + v23;
    if (*(unsigned char *)(v9 + v10) == 1)
    {
      uint64_t v2 = v35;
LABEL_26:
      uint64_t v28 = *(void *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
      if (v28)
      {
        unint64_t v29 = v28 - 1;
        if (v29)
        {
          double v30 = (double)v29;
          double v31 = log10((double)v4 / (double)v29 * 9.0 + 1.0);
          double v32 = *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
          double v33 = v23 + v32 / log10(1.0 / v30 * 9.0 + 1.0);
        }
        else
        {
          double v31 = 0.0;
          double v33 = v23;
        }
        double v34 = v31 * (v33 - v23);
      }
      else
      {
        double v34 = 0.0;
      }
      goto LABEL_34;
    }
    unint64_t v25 = (void *)MEMORY[0x1C189E660](v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v25)
    {
      objc_msgSend(v25, sel_alignmentRectInsets);
      double v27 = v26;
      swift_unknownObjectRelease();
    }
    else
    {
      double v27 = 0.0;
    }
    double v34 = v27 + *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing) * (double)v4;
    uint64_t v2 = v35;
LABEL_34:
    if (v34 > v24 + 0.6666667) {
      goto LABEL_4;
    }
LABEL_6:
    ++v4;
  }
  while (a2 != v4);
  if (v7 != a2 && v7 < a2)
  {
    sub_1BEE66EA0(v7);
    sub_1BEE66EA0(a2);
  }
}

unint64_t sub_1BEE6C2D8(unint64_t result, unint64_t a2)
{
  unint64_t v3 = result;
  BOOL v4 = (uint64_t)(a2 - result) < 0;
  if (a2 < result)
  {
    BOOL v4 = (uint64_t)(result - a2) < 0;
    if ((uint64_t)(result - a2) >= 0) {
      return MEMORY[0x1E4FBC860];
    }
    __break(1u);
  }
  if (v4)
  {
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (a2 == result) {
    return MEMORY[0x1E4FBC860];
  }
  unint64_t v5 = a2 - 1;
  if (!a2) {
    goto LABEL_51;
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_52:
    __break(1u);
    return result;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4FBC860];
  if (v5 > result && a2 - 2 >= result)
  {
    uint64_t v7 = OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_model;
    unint64_t v8 = a2 - 3;
    while (1)
    {
      uint64_t v9 = v8 + 1;
      if (v8 + 1 != v5) {
        break;
      }
LABEL_42:
      unint64_t v5 = v8 + 1;
LABEL_43:
      if (v8 >= v3 && v9 >= 1 && (uint64_t)v5 >= 1)
      {
        --v8;
        if (v5 > v3) {
          continue;
        }
      }
      goto LABEL_47;
    }
    if (v8 + 1 >= v5)
    {
LABEL_37:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v6 = sub_1BEE6D470(0, v6[2] + 1, 1, v6);
      }
      unint64_t v37 = v6[2];
      unint64_t v36 = v6[3];
      if (v37 >= v36 >> 1) {
        uint64_t v6 = sub_1BEE6D470((void *)(v36 > 1), v37 + 1, 1, v6);
      }
      v6[2] = v37 + 1;
      v6[v37 + 4] = v5;
      goto LABEL_42;
    }
    uint64_t v10 = *(void *)(v2 + v7);
    uint64_t v11 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic;
    if (*(unsigned char *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) == 1)
    {
      uint64_t v12 = *(void *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
      if (v12)
      {
        unint64_t v13 = v12 - 1;
        if (v13)
        {
          double v14 = (double)v13;
          double v15 = log10((double)(unint64_t)v9 / (double)v13 * 9.0 + 1.0);
          double v16 = *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
          long double v17 = log10(1.0 / v14 * 9.0 + 1.0);
          double v18 = *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
          double v19 = v16 / v17 + v18;
        }
        else
        {
          double v19 = *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
          double v15 = 0.0;
          double v18 = v19;
        }
        double v23 = v15 * (v19 - v18);
      }
      else
      {
        double v23 = 0.0;
      }
      double v24 = *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
      double v25 = v23 + v24;
    }
    else
    {
      double v20 = (void *)MEMORY[0x1C189E660](v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
      if (v20)
      {
        objc_msgSend(v20, sel_alignmentRectInsets);
        double v22 = v21;
        swift_unknownObjectRelease();
      }
      else
      {
        double v22 = 0.0;
      }
      double v24 = *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
      double v25 = v22
          + *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing)
          * (double)(unint64_t)v9
          + v24;
      if (*(unsigned char *)(v10 + v11) != 1)
      {
        double v26 = (void *)MEMORY[0x1C189E660](v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
        if (v26)
        {
          objc_msgSend(v26, sel_alignmentRectInsets);
          double v28 = v27;
          swift_unknownObjectRelease();
        }
        else
        {
          double v28 = 0.0;
        }
        double v35 = v28 + *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing) * (double)v5;
LABEL_36:
        if (v35 <= v25 + 0.6666667) {
          goto LABEL_43;
        }
        goto LABEL_37;
      }
    }
    uint64_t v29 = *(void *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
    if (v29)
    {
      unint64_t v30 = v29 - 1;
      if (v30)
      {
        double v31 = (double)v30;
        double v32 = log10((double)v5 / (double)v30 * 9.0 + 1.0);
        double v33 = *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
        double v34 = v24 + v33 / log10(1.0 / v31 * 9.0 + 1.0);
      }
      else
      {
        double v32 = 0.0;
        double v34 = v24;
      }
      double v35 = v32 * (v34 - v24);
    }
    else
    {
      double v35 = 0.0;
    }
    goto LABEL_36;
  }
LABEL_47:
  return sub_1BEE6D17C((uint64_t)v6);
}

void sub_1BEE6C6BC(unint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!a3) {
    return;
  }
  unint64_t v4 = a1;
  uint64_t v5 = a2 - a1;
  if (a2 >= a1)
  {
    if ((uint64_t)(a2 - a1) < 0)
    {
LABEL_154:
      __break(1u);
      goto LABEL_155;
    }
    if (v5 == 10)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136760);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_1BEE753B0;
      if (v4 < 0xFFFFFFFFFFFFFFFELL)
      {
        *(void *)(v6 + 32) = v4 + 2;
        if (v4 < 0xFFFFFFFFFFFFFFFCLL)
        {
          *(void *)(v6 + 40) = v4 + 4;
          if (v4 < 0xFFFFFFFFFFFFFFFALL)
          {
            *(void *)(v6 + 48) = v4 + 6;
            if (v4 < 0xFFFFFFFFFFFFFFF8)
            {
              *(void *)(v6 + 56) = v4 + 8;
              return;
            }
LABEL_158:
            __break(1u);
            return;
          }
LABEL_157:
          __break(1u);
          goto LABEL_158;
        }
LABEL_156:
        __break(1u);
        goto LABEL_157;
      }
LABEL_155:
      __break(1u);
      goto LABEL_156;
    }
  }
  else
  {
    if ((uint64_t)(a1 - a2) < 0)
    {
LABEL_153:
      __break(1u);
      goto LABEL_154;
    }
    uint64_t v5 = a2 - a1;
  }
  unint64_t v7 = a3 + 1;
  if (a3 == -1)
  {
LABEL_152:
    __break(1u);
    goto LABEL_153;
  }
  if (v7 < 2)
  {
LABEL_147:
    __break(1u);
LABEL_148:
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
LABEL_151:
    __break(1u);
    goto LABEL_152;
  }
  char v8 = 0;
  double v86 = (double)v5 / ((double)a3 + 1.0);
  double v87 = (double)a1;
  uint64_t v89 = OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_model;
  v83 = (void *)MEMORY[0x1E4FBC860];
  unint64_t v9 = 1;
  double v10 = -1.0;
  uint64_t v84 = v3;
  unint64_t v85 = a3 + 1;
LABEL_20:
  double v12 = (double)v4;
  while (1)
  {
    double v13 = v86 * (double)v9 + v87;
    double v14 = floor(v13);
    if ((~*(void *)&v14 & 0x7FF0000000000000) == 0)
    {
      __break(1u);
LABEL_146:
      __break(1u);
      goto LABEL_147;
    }
    if (v14 <= v10) {
      goto LABEL_146;
    }
    if (v14 >= 1.84467441e19) {
      goto LABEL_148;
    }
    double v15 = ceil(v13);
    if ((~*(void *)&v15 & 0x7FF0000000000000) == 0) {
      goto LABEL_149;
    }
    if (v15 <= v10) {
      goto LABEL_150;
    }
    if (v15 >= 1.84467441e19) {
      goto LABEL_151;
    }
    unint64_t v11 = (unint64_t)v14;
    unint64_t v16 = (unint64_t)v15;
    if (v4 == (unint64_t)v14)
    {
      if (v4 == v16)
      {
        unint64_t v11 = v4;
        goto LABEL_18;
      }
      if (!v16)
      {
        if (v4)
        {
          if (v8) {
            goto LABEL_126;
          }
          if (a3 == v9) {
            return;
          }
          char v8 = 0;
          goto LABEL_19;
        }
        unint64_t v11 = 0;
        goto LABEL_18;
      }
      if (v4 >= v16)
      {
        if (v8) {
          goto LABEL_128;
        }
LABEL_135:
        if (a3 == v9) {
          return;
        }
        char v8 = 0;
        goto LABEL_19;
      }
      BOOL v17 = 1;
      goto LABEL_69;
    }
    if (v11 && v4 < v11) {
      break;
    }
    if (v4 == v16)
    {
      if ((v8 & 1) == 0) {
        goto LABEL_137;
      }
      if (a3 == v9) {
        return;
      }
      char v8 = 1;
      goto LABEL_19;
    }
    if (!v16)
    {
      if (v11)
      {
        if ((v8 & 1) == 0) {
          goto LABEL_137;
        }
LABEL_126:
        unint64_t v16 = 0;
LABEL_128:
        v77 = v83;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v77 = sub_1BEE6D470(0, v83[2] + 1, 1, v83);
        }
        unint64_t v79 = v77[2];
        unint64_t v78 = v77[3];
        if (v79 >= v78 >> 1) {
          v77 = sub_1BEE6D470((void *)(v78 > 1), v79 + 1, 1, v77);
        }
        v77[2] = v79 + 1;
        v83 = v77;
        v77[v79 + 4] = v16;
        if (a3 == v9) {
          return;
        }
        char v8 = 0;
        unint64_t v4 = v16;
LABEL_19:
        if (++v9 >= v7) {
          goto LABEL_147;
        }
        goto LABEL_20;
      }
LABEL_117:
      v74 = v83;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v74 = sub_1BEE6D470(0, v83[2] + 1, 1, v83);
      }
      unint64_t v76 = v74[2];
      unint64_t v75 = v74[3];
      if (v76 >= v75 >> 1) {
        v74 = sub_1BEE6D470((void *)(v75 > 1), v76 + 1, 1, v74);
      }
      v74[2] = v76 + 1;
      v83 = v74;
      v74[v76 + 4] = v11;
      uint64_t v3 = v84;
      unint64_t v7 = v85;
LABEL_18:
      unint64_t v4 = v11;
      if (a3 == v9) {
        return;
      }
      goto LABEL_19;
    }
    if (v4 >= v16)
    {
      if (v11 != v16)
      {
        if ((v8 & 1) == 0) {
          goto LABEL_137;
        }
        goto LABEL_128;
      }
      goto LABEL_117;
    }
    BOOL v17 = 0;
LABEL_69:
    uint64_t v47 = *(void *)(v3 + v89);
    uint64_t v48 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic;
    if (*(unsigned char *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) == 1)
    {
      uint64_t v49 = *(void *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
      if (v49)
      {
        unint64_t v50 = v49 - 1;
        if (v50)
        {
          double v51 = (double)v50;
          double v52 = log10(v12 / (double)v50 * 9.0 + 1.0);
          double v53 = *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
          long double v54 = log10(1.0 / v51 * 9.0 + 1.0);
          double v55 = *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
          double v56 = v53 / v54 + v55;
        }
        else
        {
          double v56 = *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
          double v52 = 0.0;
          double v55 = v56;
        }
        double v60 = v52 * (v56 - v55);
      }
      else
      {
        double v60 = 0.0;
      }
      double v61 = *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
      double v62 = v60 + v61;
LABEL_84:
      uint64_t v66 = *(void *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
      if (v66)
      {
        unint64_t v67 = v66 - 1;
        if (v67)
        {
          double v68 = (double)v67;
          double v69 = log10((double)v16 / (double)v67 * 9.0 + 1.0);
          double v70 = *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
          long double v71 = v70 / log10(1.0 / v68 * 9.0 + 1.0);
          double v10 = -1.0;
          double v72 = v61 + v71;
        }
        else
        {
          double v69 = 0.0;
          double v72 = v61;
        }
        double v73 = v69 * (v72 - v61);
        if (v11 == v16) {
          goto LABEL_116;
        }
      }
      else
      {
        double v73 = 0.0;
        if (v11 == v16) {
          goto LABEL_116;
        }
      }
      goto LABEL_94;
    }
    v57 = (void *)MEMORY[0x1C189E660](v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v57)
    {
      objc_msgSend(v57, sel_alignmentRectInsets);
      double v59 = v58;
      swift_unknownObjectRelease();
    }
    else
    {
      double v59 = 0.0;
    }
    double v61 = *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
    double v62 = v59 + *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing) * v12 + v61;
    if (*(unsigned char *)(v47 + v48) == 1)
    {
      uint64_t v3 = v84;
      unint64_t v7 = v85;
      goto LABEL_84;
    }
    v63 = (void *)MEMORY[0x1C189E660](v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v63)
    {
      objc_msgSend(v63, sel_alignmentRectInsets);
      double v65 = v64;
      swift_unknownObjectRelease();
    }
    else
    {
      double v65 = 0.0;
    }
    uint64_t v3 = v84;
    unint64_t v7 = v85;
    double v73 = v65 + *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing) * (double)v16;
    if (v11 == v16)
    {
LABEL_116:
      if (!v17) {
        goto LABEL_117;
      }
      unint64_t v11 = v4;
      goto LABEL_18;
    }
LABEL_94:
    if (v8)
    {
      if (v73 > v62 + 0.6666667) {
        goto LABEL_128;
      }
    }
    else if (!v17)
    {
      goto LABEL_137;
    }
    if (a3 == v9) {
      return;
    }
    if (++v9 >= v7) {
      goto LABEL_147;
    }
  }
  uint64_t v19 = *(void *)(v3 + v89);
  uint64_t v20 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic;
  if (*(unsigned char *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) == 1)
  {
    uint64_t v21 = *(void *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
    if (v21)
    {
      unint64_t v22 = v21 - 1;
      if (v22)
      {
        double v23 = (double)v22;
        double v24 = log10(v12 / (double)v22 * 9.0 + 1.0);
        double v25 = *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
        long double v26 = log10(1.0 / v23 * 9.0 + 1.0);
        double v27 = *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
        double v28 = v25 / v26 + v27;
      }
      else
      {
        double v28 = *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
        double v24 = 0.0;
        double v27 = v28;
      }
      double v32 = v24 * (v28 - v27);
    }
    else
    {
      double v32 = 0.0;
    }
    double v33 = *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
    double v34 = v32 + v33;
LABEL_56:
    uint64_t v38 = *(void *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
    if (v38)
    {
      unint64_t v39 = v38 - 1;
      if (v39)
      {
        double v40 = (double)v39;
        double v41 = log10((double)v11 / (double)v39 * 9.0 + 1.0);
        double v42 = *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
        double v43 = 1.0 / v40;
        double v10 = -1.0;
        double v44 = v33 + v42 / log10(v43 * 9.0 + 1.0);
      }
      else
      {
        double v41 = 0.0;
        double v44 = v33;
      }
      double v45 = v41 * (v44 - v33);
    }
    else
    {
      double v45 = 0.0;
    }
  }
  else
  {
    uint64_t v29 = (void *)MEMORY[0x1C189E660](v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v29)
    {
      objc_msgSend(v29, sel_alignmentRectInsets);
      double v31 = v30;
      swift_unknownObjectRelease();
    }
    else
    {
      double v31 = 0.0;
    }
    double v33 = *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
    double v34 = v31 + *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing) * v12 + v33;
    if (*(unsigned char *)(v19 + v20) == 1)
    {
      uint64_t v3 = v84;
      unint64_t v7 = v85;
      goto LABEL_56;
    }
    double v35 = (void *)MEMORY[0x1C189E660](v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v35)
    {
      objc_msgSend(v35, sel_alignmentRectInsets);
      double v37 = v36;
      swift_unknownObjectRelease();
    }
    else
    {
      double v37 = 0.0;
    }
    uint64_t v3 = v84;
    unint64_t v7 = v85;
    double v45 = v37 + *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing) * (double)v11;
  }
  BOOL v17 = v45 <= v34 + 0.6666667;
  if (v4 == v16)
  {
    if ((v8 & 1) == 0) {
      goto LABEL_134;
    }
    if (a3 == v9) {
      return;
    }
    char v8 = 1;
    goto LABEL_19;
  }
  if (v16) {
    BOOL v46 = v4 >= v16;
  }
  else {
    BOOL v46 = 1;
  }
  if (!v46) {
    goto LABEL_69;
  }
  if (v11 == v16) {
    goto LABEL_116;
  }
  if (v8) {
    goto LABEL_128;
  }
LABEL_134:
  if (v45 <= v34 + 0.6666667) {
    goto LABEL_135;
  }
LABEL_137:
  v80 = v83;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v80 = sub_1BEE6D470(0, v83[2] + 1, 1, v83);
  }
  unint64_t v82 = v80[2];
  unint64_t v81 = v80[3];
  if (v82 >= v81 >> 1) {
    v80 = sub_1BEE6D470((void *)(v81 > 1), v82 + 1, 1, v80);
  }
  v80[2] = v82 + 1;
  v83 = v80;
  v80[v82 + 4] = v11;
  if (a3 != v9)
  {
    char v8 = 1;
    unint64_t v4 = v11;
    unint64_t v7 = v85;
    goto LABEL_19;
  }
}

uint64_t type metadata accessor for TickMarksVisibilityModel()
{
  return self;
}

uint64_t sub_1BEE6D17C(uint64_t result)
{
  uint64_t v1 = (void *)result;
  unint64_t v2 = *(void *)(result + 16);
  if (v2 < 2) {
    return (uint64_t)v1;
  }
  unint64_t v3 = 0;
  unint64_t v4 = v2 >> 1;
  for (unint64_t i = v2 + 3; ; --i)
  {
    if (v3 == i - 4) {
      goto LABEL_5;
    }
    unint64_t v6 = v1[2];
    if (v3 >= v6) {
      break;
    }
    if (i - 4 >= v6) {
      goto LABEL_12;
    }
    uint64_t v7 = v1[v3 + 4];
    uint64_t v8 = v1[i];
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_1BEE6D5A8(v1);
      uint64_t v1 = (void *)result;
    }
    v1[v3 + 4] = v8;
    v1[i] = v7;
LABEL_5:
    if (v4 == ++v3) {
      return (uint64_t)v1;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

void *sub_1BEE6D238(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1365C0);
      double v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      CGFloat v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      double v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      double v10 = (void *)MEMORY[0x1E4FBC860];
      double v12 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1BEE6E5EC(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1BEE6D360(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136718);
      double v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      CGFloat v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      double v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      double v10 = (void *)MEMORY[0x1E4FBC860];
      double v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1BEE6E6DC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1BEE6D470(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136760);
      double v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      CGFloat v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      double v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      double v10 = (void *)MEMORY[0x1E4FBC860];
      double v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
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
    sub_1BEE6E8C8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1BEE6D580(void *a1)
{
  return sub_1BEE6D238(0, a1[2], 0, a1);
}

void *sub_1BEE6D594(void *a1)
{
  return sub_1BEE6D360(0, a1[2], 0, a1);
}

void *sub_1BEE6D5A8(void *a1)
{
  return sub_1BEE6D470(0, a1[2], 0, a1);
}

unint64_t sub_1BEE6D5BC(uint64_t a1)
{
  uint64_t v2 = sub_1BEE6EE98();
  return sub_1BEE6D600(a1, v2);
}

unint64_t sub_1BEE6D600(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1BEE6D69C(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1BEE6EEA8();
  sub_1BEE6EEB8();
  sub_1BEE6EEB8();
  uint64_t v8 = sub_1BEE6EEC8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    while (1)
    {
      uint64_t v12 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v10);
      uint64_t v14 = *v12;
      uint64_t v13 = v12[1];
      if (v14 == a2 && v13 == a3) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_8;
      }
    }
    uint64_t result = 0;
    long long v17 = *(_OWORD *)(*(void *)(*v3 + 48) + 16 * v10);
  }
  else
  {
LABEL_8:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    sub_1BEE6DAB4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v19;
    swift_bridgeObjectRelease();
    *(void *)&long long v17 = a2;
    *((void *)&v17 + 1) = a3;
    uint64_t result = 1;
  }
  *a1 = v17;
  return result;
}

uint64_t sub_1BEE6D7DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136758);
  uint64_t result = sub_1BEE6EDA8();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v29 = (void *)(v2 + 56);
    uint64_t v6 = 1 << *(unsigned char *)(v2 + 32);
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v6 + 63) >> 6;
    uint64_t v10 = result + 56;
    while (1)
    {
      if (v8)
      {
        unint64_t v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v9) {
          goto LABEL_33;
        }
        unint64_t v16 = v29[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v16 = v29[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v16 = v29[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v9)
              {
LABEL_33:
                uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
                if (v28 > 63) {
                  bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v29 = -1 << v28;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v29[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v29[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      double v18 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v14);
      uint64_t v19 = *v18;
      uint64_t v20 = v18[1];
      sub_1BEE6EEA8();
      sub_1BEE6EEB8();
      sub_1BEE6EEB8();
      uint64_t result = sub_1BEE6EEC8();
      uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v11 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      uint64_t v12 = (void *)(*(void *)(v4 + 48) + 16 * v11);
      *uint64_t v12 = v19;
      v12[1] = v20;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1BEE6DAB4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v7 = result;
  unint64_t v8 = *(void *)(*v4 + 16);
  unint64_t v9 = *(void *)(*v4 + 24);
  if (v9 > v8 && (a4 & 1) != 0) {
    goto LABEL_15;
  }
  if (a4)
  {
    sub_1BEE6D7DC();
  }
  else
  {
    if (v9 > v8)
    {
      uint64_t result = (uint64_t)sub_1BEE6DC18();
      goto LABEL_15;
    }
    sub_1BEE6DDB0();
  }
  uint64_t v10 = *v4;
  sub_1BEE6EEA8();
  sub_1BEE6EEB8();
  sub_1BEE6EEB8();
  uint64_t result = sub_1BEE6EEC8();
  uint64_t v11 = -1 << *(unsigned char *)(v10 + 32);
  a3 = result & ~v11;
  if ((*(void *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v12 = ~v11;
    do
    {
      unint64_t v13 = (uint64_t *)(*(void *)(v10 + 48) + 16 * a3);
      uint64_t v15 = *v13;
      uint64_t v14 = v13[1];
      if (v15 == v7 && v14 == a2) {
        goto LABEL_18;
      }
      a3 = (a3 + 1) & v12;
    }
    while (((*(void *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
  }
LABEL_15:
  uint64_t v17 = *v4;
  *(void *)(*v4 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  double v18 = (uint64_t *)(*(void *)(v17 + 48) + 16 * a3);
  *double v18 = v7;
  v18[1] = a2;
  uint64_t v19 = *(void *)(v17 + 16);
  BOOL v20 = __OFADD__(v19, 1);
  uint64_t v21 = v19 + 1;
  if (!v20)
  {
    *(void *)(v17 + 16) = v21;
    return result;
  }
  __break(1u);
LABEL_18:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136750);
  uint64_t result = sub_1BEE6EE78();
  __break(1u);
  return result;
}

void *sub_1BEE6DC18()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136758);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BEE6ED98();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_OWORD *)(*(void *)(v4 + 48) + 16 * v15) = *(_OWORD *)(*(void *)(v2 + 48) + 16 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1BEE6DDB0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136758);
  uint64_t result = sub_1BEE6EDA8();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v28 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v10 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v28) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v28) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v28) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    int64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v14);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    sub_1BEE6EEA8();
    sub_1BEE6EEB8();
    sub_1BEE6EEB8();
    uint64_t result = sub_1BEE6EEC8();
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v11 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    unint64_t v12 = (void *)(*(void *)(v4 + 48) + 16 * v11);
    *unint64_t v12 = v19;
    v12[1] = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v28)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v28) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1BEE6E054(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136768);
  uint64_t result = sub_1BEE6EE38();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    unint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  *unint64_t v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_1BEE6EE98();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BEE6E30C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_1BEE6D5BC(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1BEE6E448();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_1BEE6E054(result, a3 & 1);
  uint64_t result = sub_1BEE6D5BC(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_1BEE6EE88();
  __break(1u);
  return result;
}

void *sub_1BEE6E448()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136768);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BEE6EE28();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_1BEE6E5EC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 24 * a1 + 32);
    size_t v6 = 24 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_1BEE6EE58();
  __break(1u);
  return result;
}

char *sub_1BEE6E6DC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 32 * a1 + 32);
    size_t v6 = 32 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_1BEE6EE58();
  __break(1u);
  return result;
}

unint64_t sub_1BEE6E7C8(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x1E4FBC868];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA136768);
  uint64_t v3 = (void *)sub_1BEE6EE48();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_1BEE6D5BC(v5);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    _OWORD v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    int64_t v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1BEE6D5BC(v5);
    uint64_t v8 = v13;
    uint64_t v4 = v14;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

char *sub_1BEE6E8C8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    char v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  unint64_t result = (char *)sub_1BEE6EE58();
  __break(1u);
  return result;
}

uint64_t sub_1BEE6E9B4()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1BEE6EC48()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1BEE6EC58()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1BEE6EC68()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1BEE6EC78()
{
  return MEMORY[0x1F41837A8]();
}

uint64_t sub_1BEE6EC88()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BEE6EC98()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1BEE6ECA8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1BEE6ECB8()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1BEE6ECC8()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1BEE6ECD8()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1BEE6ECE8()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1BEE6ECF8()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1BEE6ED08()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1BEE6ED18()
{
  return MEMORY[0x1F41844F0]();
}

uint64_t sub_1BEE6ED28()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1BEE6ED38()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1BEE6ED48()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1BEE6ED58()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1BEE6ED68()
{
  return MEMORY[0x1F41849E0]();
}

uint64_t sub_1BEE6ED78()
{
  return MEMORY[0x1F4184A38]();
}

uint64_t sub_1BEE6ED88()
{
  return MEMORY[0x1F4184A40]();
}

uint64_t sub_1BEE6ED98()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1BEE6EDA8()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1BEE6EDB8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1BEE6EDC8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1BEE6EDD8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1BEE6EDE8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1BEE6EDF8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1BEE6EE08()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1BEE6EE18()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1BEE6EE28()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1BEE6EE38()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1BEE6EE48()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1BEE6EE58()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1BEE6EE68()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1BEE6EE78()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1BEE6EE88()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1BEE6EE98()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1BEE6EEA8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BEE6EEB8()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1BEE6EEC8()
{
  return MEMORY[0x1F4185EF8]();
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x1F40D4E10](inFileURL, outSystemSoundID);
}

OSStatus AudioServicesDisposeSystemSoundID(SystemSoundID inSystemSoundID)
{
  return MEMORY[0x1F40D4E28](*(void *)&inSystemSoundID);
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x1F410C310]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F410C328]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1F410C350]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1F410C360]();
}

uint64_t BSUIConstrainValueToIntervalWithRubberBand()
{
  return MEMORY[0x1F410C6F8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x1F40F4AC0](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1F40F4CD8](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x1F40F4CF8](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D9988](color, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextResetClip(CGContextRef c)
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

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

uint64_t CGGradientApply()
{
  return MEMORY[0x1F40DA758]();
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x1F40DA768](space, components, locations, count);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1F40DA778](space, colors, locations);
}

uint64_t CGGradientGetColorSpace()
{
  return MEMORY[0x1F40DA788]();
}

uint64_t CGGradientGetLocationCount()
{
  return MEMORY[0x1F40DA7A0]();
}

void CGGradientRelease(CGGradientRef gradient)
{
}

CGGradientRef CGGradientRetain(CGGradientRef gradient)
{
  return (CGGradientRef)MEMORY[0x1F40DA7B0](gradient);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x1F40DA928](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

BOOL CGImageGetShouldInterpolate(CGImageRef image)
{
  return MEMORY[0x1F40DA990](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1F40DA9E8](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB048](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x1F40DF398](name, matrix, options, size);
}

uint64_t CTFontGetAccessibilityBoldWeightOfWeight()
{
  return MEMORY[0x1F40DF498]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t PLTransformForImageOrientation()
{
  return MEMORY[0x1F4140478]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1F4166B00]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4166B70]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x1F4166B88]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1F4166B90]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1F4166BB8]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1F4166CD8]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x1F4166E00]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1F4166E10]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1F4166E38]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1F4166E48]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1F4166E88]();
}

uint64_t UIRectRoundToScale()
{
  return MEMORY[0x1F4166EA8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4166EB8]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1F4166EC0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
}

uint64_t UISizeCeilToScale()
{
  return MEMORY[0x1F4166EE0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UIUpdateRequestActivate()
{
  return MEMORY[0x1F41670E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__double cosval = v2;
  result.__double sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__double cosval = v2;
  result.__double sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void abort(void)
{
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x1F41866F0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}