@interface CAMZoomControlUtilities
+ (BOOL)shouldApplyContinuousZoomForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 zoomFactors:(id *)a7 displayZoomFactors:(id *)a8;
+ (BOOL)shouldEmulateTripleCameraZoomForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6;
+ (BOOL)shouldEmulateWideDualCameraZoomForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6;
+ (double)_baseSingleCameraDeviceForDevice:(int64_t)a3;
+ (double)_zoomControlRadiusForZoomControl:(id)a3 layoutSide:(int64_t)a4 layoutStyle:(int64_t)a5 width:(double)a6 centerOfZoomControlInContainerBounds:(CGPoint)a7 marginForZoomDiaFromEdge:(double)a8;
+ (double)appropriateSignificantZoomFactorForDevice:(int64_t)a3 fromDevice:(int64_t)a4 currentZoomFactor:(double)a5 targetZoomFactor:(double)a6 mode:(int64_t)a7;
+ (double)equivalentZoomFactor:(double)a3 forDevice:(int64_t)a4 fromDevice:(int64_t)a5;
+ (double)linearMappingForX:(double)a3 x1:(double)a4 y1:(double)a5 x2:(double)a6 y2:(double)a7 clamp:(BOOL)a8;
+ (double)piecewiseLinearMappingForX:(double)a3 fromXValues:(id)a4 toYValues:(id)a5;
+ (double)zoomControlDisplayValueForZoomFactor:(double)a3 mode:(int64_t)a4 device:(int64_t)a5 videoConfiguration:(int64_t)a6;
+ (double)zoomControlDisplayValueForZoomFactor:(double)a3 mode:(int64_t)a4 device:(int64_t)a5 videoConfiguration:(int64_t)a6 videoStabilizationStrength:(int64_t)a7;
+ (double)zoomScaleFromDevice:(int64_t)a3 toDevice:(int64_t)a4;
+ (id)exifFocalLengthsByZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 customLensGroup:(id)a7 isTrueVideo:(BOOL)a8;
+ (int64_t)deviceForEmulatingZoomFactor:(double)a3 fromDevice:(int64_t)a4 mode:(int64_t)a5 continuousZoomSupported:(BOOL)a6;
+ (void)layoutZoomControl:(CGFloat)a3 forLayoutStyle:(CGFloat)a4 bottomBarAlignmentRect:(CGFloat)a5 bottomBarTransparent:(CGFloat)a6 shutterButtonAlignmentRect:(CGFloat)a7 previewViewAlignmentRect:(CGFloat)a8;
+ (void)layoutZoomControl:(id)a3 forLayoutStyle:(int64_t)a4 bottomBar:(id)a5 previewView:(id)a6;
+ (void)layoutZoomControl:(id)a3 layoutSide:(int64_t)a4 forLayoutStyle:(int64_t)a5 width:(double)a6 marginForZoomButtonFromEdge:(double)a7 marginForZoomDialFromEdge:(double)a8 zoomDialContentMaskingHeight:(double)a9 centerOfZoomControlInContainerView:(CGPoint)a10;
@end

@implementation CAMZoomControlUtilities

+ (void)layoutZoomControl:(id)a3 forLayoutStyle:(int64_t)a4 bottomBar:(id)a5 previewView:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v48 = [v12 superview];
  BOOL v13 = [v11 backgroundStyle] == 1;
  [v11 layoutIfNeeded];
  v14 = [v11 shutterButton];
  [v14 frame];
  objc_msgSend(v14, "alignmentRectForFrame:");
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [v14 superview];
  objc_msgSend(v23, "convertRect:toView:", v48, v16, v18, v20, v22);
  double v46 = v25;
  double v47 = v24;
  double v44 = v27;
  double v45 = v26;

  [v11 bounds];
  objc_msgSend(v11, "convertRect:toView:", v48);
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  [v10 bounds];
  objc_msgSend(v10, "convertRect:toView:", v48);
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;

  objc_msgSend(a1, "layoutZoomControl:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:", v12, a4, v13, v29, v31, v33, v35, v47, v46, v45, v44, v37, v39, v41, v43);
}

+ (double)zoomControlDisplayValueForZoomFactor:(double)a3 mode:(int64_t)a4 device:(int64_t)a5 videoConfiguration:(int64_t)a6
{
  [a1 zoomControlDisplayValueForZoomFactor:a4 mode:a5 device:a6 videoConfiguration:0 videoStabilizationStrength:a3];
  return result;
}

+ (void)layoutZoomControl:(id)a3 layoutSide:(int64_t)a4 forLayoutStyle:(int64_t)a5 width:(double)a6 marginForZoomButtonFromEdge:(double)a7 marginForZoomDialFromEdge:(double)a8 zoomDialContentMaskingHeight:(double)a9 centerOfZoomControlInContainerView:(CGPoint)a10
{
  double y = a10.y;
  double x = a10.x;
  id v18 = a3;
  double v19 = (double *)MEMORY[0x263F001A8];
  double v46 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v47 = *MEMORY[0x263F834E8];
  double v44 = *(double *)(MEMORY[0x263F834E8] + 24);
  double v45 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v20 = [v18 superview];
  [v20 bounds];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat rect = v25;
  double v27 = v26;

  long long v28 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v53.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v53.c = v28;
  *(_OWORD *)&v53.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  objc_msgSend(a1, "_zoomControlRadiusForZoomControl:layoutSide:layoutStyle:width:centerOfZoomControlInContainerBounds:marginForZoomDiaFromEdge:", v18, a4, a5, a6, x, y, a8);
  double v30 = v29;
  if (a4 == 1)
  {
    double v32 = vabdd_f64(v29, fabs(x));
    double v37 = v29;
    double v39 = (a6 - v32) * 0.5;
    double v33 = a8 - v39;
    double v40 = a7;
    double v31 = v27 * 0.5 - a6 * 0.5 + v39;
    double v38 = v32 - (v40 + a8);
    CGAffineTransformMakeRotation(&v53, 1.57079633);
    [v18 setOrientation:4];
  }
  else if (a4)
  {
    double v33 = *v19;
    double v31 = v19[1];
    double v38 = 0.0;
    a6 = v19[2];
    double v32 = v19[3];
    double v37 = v29;
  }
  else
  {
    double v42 = a7;
    double v31 = y - v29;
    double v32 = v27 - (y - v29) - a8;
    double v33 = x + a6 * -0.5;
    v54.origin.double x = v22;
    double v34 = v30;
    v54.origin.double y = v24;
    v54.size.width = rect;
    v54.size.height = v27;
    double MaxY = CGRectGetMaxY(v54);
    v55.origin.double x = v33;
    v55.origin.double y = v31;
    v55.size.width = a6;
    v55.size.height = v32;
    double v36 = MaxY - CGRectGetMaxY(v55);
    double v37 = v34;
    double v38 = v32 - (v42 - v36);
  }
  objc_msgSend(v18, "setContentInsets:", v47, v46, v45, v44);
  objc_msgSend(v18, "frameForAlignmentRect:", v33, v31, a6, v32);
  long long v41 = *((_OWORD *)v19 + 1);
  long long v51 = *(_OWORD *)v19;
  long long v52 = v41;
  long long v50 = *MEMORY[0x263F00148];
  +[CAMView convertRect:toCeiledBounds:andRoundedCenter:toViewScale:](CAMView, "convertRect:toCeiledBounds:andRoundedCenter:toViewScale:", &v51, &v50, v18);
  [v18 setZoomButtonMaxYWhenContracted:v38];
  [v18 setZoomDialContentMaskingHeight:a9];
  [v18 setZoomDialRadius:v37];
  objc_msgSend(v18, "setBounds:", v51, v52);
  [v18 setCenter:v50];
  CGAffineTransform v49 = v53;
  [v18 setTransform:&v49];
}

+ (void)layoutZoomControl:(CGFloat)a3 forLayoutStyle:(CGFloat)a4 bottomBarAlignmentRect:(CGFloat)a5 bottomBarTransparent:(CGFloat)a6 shutterButtonAlignmentRect:(CGFloat)a7 previewViewAlignmentRect:(CGFloat)a8
{
  id v38 = a11;
  UIRectGetCenter();
  double v36 = v23;
  double v37 = v22;
  CGFloat v24 = [v38 superview];
  [v24 bounds];
  double v26 = v25;

  double v27 = [MEMORY[0x263F82B60] mainScreen];
  [v27 scale];
  double v35 = v28;

  if (a13)
  {
    v40.origin.double x = a5;
    v40.origin.double y = a6;
    v40.size.width = a7;
    v40.size.height = a8;
    double v29 = v26 - CGRectGetMinY(v40) + 31.0;
    double v30 = 0.0;
  }
  else
  {
    v41.origin.double x = a1;
    v41.origin.double y = a2;
    v41.size.width = a3;
    v41.size.height = a4;
    double v29 = v26 - CGRectGetMinY(v41) + 21.0;
    v42.origin.double x = a1;
    v42.origin.double y = a2;
    v42.size.width = a3;
    v42.size.height = a4;
    double v30 = v26 - CGRectGetMinY(v42);
  }
  double v31 = +[CAMCaptureCapabilities capabilities];
  int v32 = [v31 isSplitScreenSupported];

  double v33 = fmin(a3, 414.0);
  if (!v32) {
    double v33 = a3;
  }
  +[CAMZoomControlUtilities layoutZoomControl:layoutSide:forLayoutStyle:width:marginForZoomButtonFromEdge:marginForZoomDialFromEdge:zoomDialContentMaskingHeight:centerOfZoomControlInContainerView:](CAMZoomControlUtilities, "layoutZoomControl:layoutSide:forLayoutStyle:width:marginForZoomButtonFromEdge:marginForZoomDialFromEdge:zoomDialContentMaskingHeight:centerOfZoomControlInContainerView:", v38, 0, a12, v33, v29 + -1.0 / v35, v30, a4, v37, v36);
}

+ (double)_zoomControlRadiusForZoomControl:(id)a3 layoutSide:(int64_t)a4 layoutStyle:(int64_t)a5 width:(double)a6 centerOfZoomControlInContainerBounds:(CGPoint)a7 marginForZoomDiaFromEdge:(double)a8
{
  id v10 = a3;
  [v10 zoomDialBorderWidth];
  double v12 = v11;
  if (!a4)
  {
    BOOL v13 = [v10 superview];
    [v13 bounds];
  }
  if (a5 == 4 && v12 > 0.0)
  {
    v14 = [MEMORY[0x263F82B60] mainScreen];
    [v14 scale];
  }
  UIFloorToViewScale();
  double v16 = v12 + v15;

  return v16;
}

+ (int64_t)deviceForEmulatingZoomFactor:(double)a3 fromDevice:(int64_t)a4 mode:(int64_t)a5 continuousZoomSupported:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = +[CAMCaptureCapabilities capabilities];
  double v11 = v10;
  if ((unint64_t)(a4 - 1) > 0xA) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = qword_209C78E80[a4 - 1];
  }
  [v10 superWideToWideZoomFactorForDevicePosition:v12];
  double v14 = v13;
  [v11 wideToTelephotoZoomFactorForDevicePosition:v12];
  double v16 = v15;
  double v17 = 1.0;
  if (!v6)
  {
    id v18 = [v11 significantZoomFactorsForMode:a5 device:6];
    double v19 = [v18 lastObject];
    [v19 floatValue];
    double v17 = v20 / v14;
  }
  double v21 = v14 * v16;
  if (a4 == 6 && v21 <= a3)
  {
    int64_t v22 = 4;
    double v23 = v11;
    int64_t v24 = a5;
    uint64_t v25 = 4;
  }
  else
  {
    if (a4 != 4 || v17 <= a3)
    {
      if (a4 == 5 && v21 <= a3 && ([v11 isBackTelephotoSupported] & 1) != 0) {
        goto LABEL_25;
      }
      if (a4 == 5 && v14 <= a3)
      {
        int64_t v22 = 2;
        goto LABEL_36;
      }
      if (a4 == 10 && v14 <= a3)
      {
        int64_t v22 = 8;
        goto LABEL_36;
      }
      if (a4 == 2 && v16 <= a3 && ([v11 isBackTelephotoSupported] & 1) != 0)
      {
LABEL_25:
        int64_t v22 = 3;
        goto LABEL_36;
      }
      BOOL v26 = a3 < 1.0;
      if (a3 < 1.0 && a4 == 2 && v6)
      {
        if ([v11 isBackSuperWideSupported]) {
          goto LABEL_32;
        }
      }
      else
      {
        if (a3 >= 1.0 || a4 != 8 || !v6) {
          goto LABEL_14;
        }
        if ([v11 isFrontSuperWideSupported]) {
          goto LABEL_21;
        }
      }
      BOOL v26 = 1;
      goto LABEL_14;
    }
    int64_t v22 = 6;
    double v23 = v11;
    int64_t v24 = a5;
    uint64_t v25 = 6;
  }
  if ([v23 isSupportedMode:v24 withDevice:v25]) {
    goto LABEL_36;
  }
  BOOL v26 = a3 < 1.0;
LABEL_14:
  double v27 = 1.0 / v14;
  if (a4 == 2 && v27 >= a3 && !v6) {
    goto LABEL_31;
  }
  if (a4 == 8 && v27 >= a3 && !v6)
  {
    if ([v11 isFrontSuperWideSupported])
    {
LABEL_21:
      int64_t v22 = 10;
      goto LABEL_36;
    }
    goto LABEL_33;
  }
  if (a4 == 3 && 1.0 / v16 > a3)
  {
LABEL_31:
    if ([v11 isBackSuperWideSupported])
    {
LABEL_32:
      int64_t v22 = 5;
      goto LABEL_36;
    }
  }
LABEL_33:
  if (v26 && a4 == 3) {
    int64_t v22 = 2;
  }
  else {
    int64_t v22 = a4;
  }
LABEL_36:

  return v22;
}

+ (double)_baseSingleCameraDeviceForDevice:(int64_t)a3
{
  int64_t v3 = 2;
  if (a3 != 4) {
    int64_t v3 = a3;
  }
  if ((unint64_t)(a3 - 6) >= 2) {
    return (double)v3;
  }
  else {
    return (double)5;
  }
}

+ (double)equivalentZoomFactor:(double)a3 forDevice:(int64_t)a4 fromDevice:(int64_t)a5
{
  if (a5 != a4)
  {
    [a1 zoomScaleFromDevice:a5 toDevice:a4];
    return v6 * a3;
  }
  return a3;
}

+ (double)zoomScaleFromDevice:(int64_t)a3 toDevice:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v7 = +[CAMCaptureCapabilities capabilities];
  v8 = v7;
  if ((unint64_t)(a3 - 1) > 0xA) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = qword_209C78E80[a3 - 1];
  }
  if ((unint64_t)(a4 - 1) > 0xA) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = qword_209C78E80[a4 - 1];
  }
  if (v9 == v10)
  {
    [v7 superWideToWideZoomFactorForDevicePosition:v9];
    double v12 = v11;
    [v8 wideToTelephotoZoomFactorForDevicePosition:v9];
    double v14 = v13;
    [a1 _baseSingleCameraDeviceForDevice:a3];
    uint64_t v16 = (uint64_t)v15;
    [a1 _baseSingleCameraDeviceForDevice:a4];
    uint64_t v18 = (uint64_t)v17;
    double v19 = 1.0;
    switch(v16)
    {
      case 2:
      case 8:
        if (v18 == 3)
        {
          double v19 = 1.0 / v14;
          goto LABEL_23;
        }
        if (v16 == 8) {
          goto LABEL_35;
        }
        if (v16 == 3)
        {
LABEL_38:
          double v19 = v12 * v14;
          switch(v18)
          {
            case 2:
            case 8:
              double v19 = v14;
              break;
            case 5:
            case 10:
              goto LABEL_23;
            default:
              goto LABEL_22;
          }
          goto LABEL_23;
        }
        if (v16 != 2) {
          goto LABEL_23;
        }
        goto LABEL_35;
      case 3:
        goto LABEL_38;
      case 4:
      case 6:
      case 7:
      case 9:
        goto LABEL_23;
      case 5:
      case 10:
        if (v18 == 3)
        {
          double v19 = 1.0 / (v12 * v14);
          goto LABEL_23;
        }
        if (v16 == 10) {
          goto LABEL_31;
        }
        if (v16 != 8)
        {
          if (v16 == 5)
          {
LABEL_31:
            if (v18 == 8 || v18 == 2) {
              double v19 = 1.0 / v12;
            }
          }
          goto LABEL_23;
        }
LABEL_35:
        double v19 = v12;
        if (v18 == 5 || v18 == 10) {
          goto LABEL_23;
        }
        break;
      default:
        break;
    }
  }
  else
  {
    float v20 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 0xB) {
        double v21 = 0;
      }
      else {
        double v21 = off_263FA0800[a3];
      }
      if ((unint64_t)a4 > 0xB) {
        int64_t v22 = 0;
      }
      else {
        int64_t v22 = off_263FA0800[a4];
      }
      int v24 = 138543618;
      uint64_t v25 = v21;
      __int16 v26 = 2114;
      double v27 = v22;
      _os_log_impl(&dword_2099F8000, v20, OS_LOG_TYPE_DEFAULT, "Cannot calculate relative zoom between front and back devices: %{public}@, %{public}@", (uint8_t *)&v24, 0x16u);
    }
  }
LABEL_22:
  double v19 = 1.0;
LABEL_23:

  return v19;
}

+ (BOOL)shouldEmulateTripleCameraZoomForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  int64_t v8 = a4;
  if ((unint64_t)(a4 - 1) > 0xA) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = qword_209C78E80[a4 - 1];
  }
  double v11 = +[CAMCaptureCapabilities capabilities];
  if ([v11 isTripleCameraSupportedForMode:a3 devicePosition:v10 videoConfiguration:a5 videoStabilizationStrength:a6])
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    int v12 = objc_msgSend(v11, "isZoomAllowedForMode:device:videoConfiguration:videoStabilizationStrength:", a3, objc_msgSend(v11, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", v8, a3, a5, a6, 0), a5, a6);
    LOBYTE(v8) = 0;
    if (v12)
    {
      int v13 = [v11 isSuperWideSupportedForMode:a3 devicePosition:v10 videoConfiguration:a5];
      int v14 = [v11 isWideSupportedForMode:a3 devicePosition:v10 videoConfiguration:a5];
      char v15 = [v11 isTelephotoSupportedForMode:a3 devicePosition:v10 videoConfiguration:a5];
      if (v13 && v14 && (v15 & 1) != 0)
      {
        LOBYTE(v8) = 1;
      }
      else
      {
        int v16 = [v11 isDualSupportedForMode:a3 devicePosition:v10 videoConfiguration:a5 videoStabilizationStrength:a6];
        LODWORD(v8) = v16 & [v11 isWideDualSupportedForMode:a3 devicePosition:v10 videoConfiguration:a5 videoStabilizationStrength:a6];
      }
    }
  }

  return v8;
}

+ (BOOL)shouldEmulateWideDualCameraZoomForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  if ((unint64_t)(a4 - 8) < 3 || a4 == 11 || a4 == 1)
  {
    char v11 = 0;
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = 0;
    char v11 = 1;
  }
  int v13 = +[CAMCaptureCapabilities capabilities];
  uint64_t v14 = [v13 resolvedDeviceForDesiredDevice:a4 mode:a3 videoConfiguration:a5 videoStabilizationStrength:a6 spatialVideoEnabled:0];
  char v15 = [a1 shouldEmulateTripleCameraZoomForMode:a3 device:v14 videoConfiguration:a5 videoStabilizationStrength:a6];
  BOOL v16 = 0;
  if ((v15 & 1) == 0)
  {
    if (([v13 isTripleCameraSupportedForMode:a3 devicePosition:v12 videoConfiguration:a5 videoStabilizationStrength:a6] & 1) != 0|| (objc_msgSend(v13, "isWideDualSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a3, v12, a5, a6) & 1) != 0|| !objc_msgSend(v13, "isZoomAllowedForMode:device:videoConfiguration:videoStabilizationStrength:", a3, v14, a5,
                          a6))
    {
      goto LABEL_17;
    }
    int v17 = [v13 isSuperWideSupportedForMode:a3 devicePosition:v12 videoConfiguration:a5];
    int v18 = [v13 isWideSupportedForMode:a3 devicePosition:v12 videoConfiguration:a5];
    int v19 = v18;
    if (v11)
    {
      if ((v17 & v18 & 1) == 0)
      {
LABEL_17:
        BOOL v16 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      float v20 = +[CAMCaptureCapabilities capabilities];
      uint64_t v21 = [v20 frontZoomBehaviorForCaptureMode:a3];

      if (unint64_t)(v21 - 1) < 2 || ((v17 ^ 1) & 1) != 0 || ((v19 ^ 1)) {
        goto LABEL_17;
      }
    }
    BOOL v16 = 1;
  }
LABEL_18:

  return v16;
}

+ (BOOL)shouldApplyContinuousZoomForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 zoomFactors:(id *)a7 displayZoomFactors:(id *)a8
{
  v151[4] = *MEMORY[0x263EF8340];
  uint64_t v12 = +[CAMCaptureCapabilities capabilities];
  int v13 = v12;
  if ((unint64_t)(a4 - 8) < 3) {
    goto LABEL_4;
  }
  if (a4 == 11)
  {
    uint64_t v15 = 1;
    int v14 = 1;
  }
  else
  {
    if (a4 == 1)
    {
LABEL_4:
      int v14 = 1;
      uint64_t v15 = 1;
      goto LABEL_5;
    }
    int v14 = 0;
    uint64_t v15 = 0;
  }
LABEL_5:
  unint64_t v16 = [v12 resolvedDeviceForDesiredDevice:a4 mode:a3 videoConfiguration:a5 videoStabilizationStrength:a6 spatialVideoEnabled:0];
  int v17 = [v13 isZoomAllowedForMode:a3 device:v16 videoConfiguration:a5 videoStabilizationStrength:a6];
  unsigned int v18 = (0x420u >> v16) & 1;
  if (v16 > 0xA) {
    unsigned int v18 = 0;
  }
  unsigned int v122 = v18;
  BOOL v19 = v16 <= 0xA && (v16 & 0x7FF) == 4;
  BOOL v125 = v19;
  BOOL v20 = v16 <= 0xA && (v16 & 0x7FF) == 6;
  BOOL v21 = v16 <= 0xA && (v16 & 0x7FF) == 3;
  BOOL v124 = v21;
  BOOL v22 = v16 <= 0xA && (v16 & 0x7FF) == 7;
  BOOL v23 = v16 <= 0xA && (v16 & 0x7FF) == 2;
  BOOL v126 = v23;
  int v129 = [v13 isQuadraWideZoomButtonSupportedForMode:a3 devicePosition:v15 videoConfiguration:a5];
  [v13 quadraWideDisplayZoomFactor];
  double v25 = v24;
  [v13 quadraWideRelativeZoomFactor];
  double v27 = v26;
  [v13 superWideDisplayZoomFactor];
  double v29 = v28;
  [v13 wideDisplayZoomFactor];
  double v31 = v30;
  [v13 telephotoDisplayZoomFactor];
  if ((v14 | v17 ^ 1)) {
    goto LABEL_23;
  }
  double v36 = v32;
  [v13 maximumZoomFactorForMode:a3 device:v16 videoConfiguration:a5 videoStabilizationStrength:a6];
  double v38 = v37;
  BOOL v39 = +[CAMZoomControlUtilities shouldEmulateTripleCameraZoomForMode:a3 device:v16 videoConfiguration:a5 videoStabilizationStrength:a6];
  BOOL v40 = +[CAMZoomControlUtilities shouldEmulateWideDualCameraZoomForMode:a3 device:v16 videoConfiguration:a5 videoStabilizationStrength:a6];
  if (v22)
  {
    double v123 = v25;
    [v13 tripleCameraSwitchOverZoomFactorsForDevicePosition:v15];
    double v42 = v41;
    double v44 = v43;
    double v45 = v38 / v41;
    if ([v13 isDualDeviceDisparitySupportedForMode:a3 devicePosition:v15])
    {
      double v46 = [NSNumber numberWithDouble:v31];
      v149[0] = v46;
      double v47 = [NSNumber numberWithDouble:v36];
      v149[1] = v47;
      id v48 = [NSNumber numberWithDouble:v45];
      v149[2] = v48;
      id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v149 count:3];

      CGAffineTransform v49 = [NSNumber numberWithDouble:v42];
      v148[0] = v49;
      long long v50 = [NSNumber numberWithDouble:v44];
      v148[1] = v50;
      long long v51 = [NSNumber numberWithDouble:v38];
      v148[2] = v51;
      double v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v148 count:3];

      if (v129)
      {
        double v27 = v27 * v42;
        uint64_t v52 = 1;
LABEL_41:
        double v25 = v123;
LABEL_42:
        v76 = (void *)[v35 mutableCopy];
        v77 = (void *)[v34 mutableCopy];
        v78 = [NSNumber numberWithDouble:v25];
        [v76 insertObject:v78 atIndex:v52];

        v79 = [NSNumber numberWithDouble:v27];
        [v77 insertObject:v79 atIndex:v52];

LABEL_43:
        id v35 = v76;
        double v34 = v77;
        goto LABEL_44;
      }
      goto LABEL_44;
    }
    v69 = [NSNumber numberWithDouble:v29];
    v151[0] = v69;
    v70 = [NSNumber numberWithDouble:v31];
    v151[1] = v70;
    v71 = [NSNumber numberWithDouble:v36];
    v151[2] = v71;
    v72 = [NSNumber numberWithDouble:v45];
    v151[3] = v72;
    id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v151 count:4];

    v150[0] = &unk_26BDDF188;
    v73 = [NSNumber numberWithDouble:v42];
    v150[1] = v73;
    v74 = [NSNumber numberWithDouble:v44];
    v150[2] = v74;
    v75 = [NSNumber numberWithDouble:v38];
    v150[3] = v75;
    double v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v150 count:4];

    if ((v129 & 1) == 0) {
      goto LABEL_44;
    }
    double v27 = v27 * v42;
LABEL_40:
    uint64_t v52 = 2;
    goto LABEL_41;
  }
  if (v39)
  {
    double v123 = v25;
    [v13 superWideToWideZoomFactorForDevicePosition:v15];
    double v54 = v53;
    [v13 wideToTelephotoZoomFactorForDevicePosition:v15];
    double v56 = v55;
    [v13 maximumZoomFactorForMode:a3 device:7 videoConfiguration:0 videoStabilizationStrength:a6 shouldResolveDevice:0];
    double v58 = v57;
    double v59 = 1.0 / (v54 * v56);
    if (!v124) {
      double v59 = 1.0;
    }
    if (v125 || v126) {
      double v60 = 1.0 / v54;
    }
    else {
      double v60 = v59;
    }
    v61 = [NSNumber numberWithDouble:v29];
    v147[0] = v61;
    v62 = [NSNumber numberWithDouble:v31];
    v147[1] = v62;
    v63 = [NSNumber numberWithDouble:v36];
    v147[2] = v63;
    v64 = [NSNumber numberWithDouble:v58 / v54];
    v147[3] = v64;
    id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v147 count:4];

    v65 = [NSNumber numberWithDouble:v60];
    v146[0] = v65;
    v66 = [NSNumber numberWithDouble:v54 * v60];
    v146[1] = v66;
    v67 = [NSNumber numberWithDouble:v56 * (v54 * v60)];
    v146[2] = v67;
    v68 = [NSNumber numberWithDouble:v58 * v60];
    v146[3] = v68;
    double v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v146 count:4];

    if ((v129 & 1) == 0) {
      goto LABEL_44;
    }
    double v27 = v27 * (v54 * v60);
    goto LABEL_40;
  }
  if (v40)
  {
    double v81 = v27;
    [v13 superWideToWideZoomFactorForDevicePosition:v15];
    double v83 = v82;
    [v13 maximumZoomFactorForMode:a3 device:6 videoConfiguration:0 videoStabilizationStrength:a6 shouldResolveDevice:0];
    double v85 = v84;
    double v86 = v84 / v83;
    if (v126) {
      double v87 = 1.0 / v83;
    }
    else {
      double v87 = 1.0;
    }
    v88 = [NSNumber numberWithDouble:v29];
    v145[0] = v88;
    v89 = [NSNumber numberWithDouble:v31];
    v145[1] = v89;
    v90 = [NSNumber numberWithDouble:v86];
    v145[2] = v90;
    id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v145 count:3];

    v91 = [NSNumber numberWithDouble:v87];
    v144[0] = v91;
    double v92 = v83 * v87;
    v93 = [NSNumber numberWithDouble:v92];
    v144[1] = v93;
    v94 = [NSNumber numberWithDouble:v85 * v87];
    v144[2] = v94;
    double v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v144 count:3];

    if (v129)
    {
      double v27 = v81 * v92;
      uint64_t v52 = 2;
      goto LABEL_42;
    }
  }
  else
  {
    if (v125)
    {
      [v13 wideToTelephotoZoomFactorForDevicePosition:v15];
      v143[0] = &unk_26BDDF188;
      v95 = objc_msgSend(NSNumber, "numberWithDouble:");
      v143[1] = v95;
      v96 = [NSNumber numberWithDouble:v38];
      v143[2] = v96;
      v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:v143 count:3];

      double v34 = [NSNumber numberWithDouble:v31];
      v142[0] = v34;
      id v35 = [NSNumber numberWithDouble:v36];
      v142[1] = v35;
      v97 = [NSNumber numberWithDouble:v38];
      v142[2] = v97;
      v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:v142 count:3];

      goto LABEL_43;
    }
    if (!v20)
    {
      if (v124)
      {
        [v13 wideToTelephotoZoomFactorForDevicePosition:v15];
        double v106 = v105;
        v137[0] = &unk_26BDDF188;
        v107 = [NSNumber numberWithDouble:v38];
        v137[1] = v107;
        v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:v137 count:2];

        double v34 = [NSNumber numberWithDouble:v36];
        v136[0] = v34;
        id v35 = [NSNumber numberWithDouble:v38 * v106];
        v136[1] = v35;
        v108 = (void *)MEMORY[0x263EFF8C0];
        v109 = v136;
      }
      else
      {
        if (!v122)
        {
          char v116 = !v126;
          if (a3 == 6) {
            char v116 = 1;
          }
          if (v116)
          {
LABEL_23:
            BOOL v33 = 0;
            double v34 = 0;
            id v35 = 0;
            goto LABEL_51;
          }
          if (![v13 isFrontSuperWideSupported]
            || ([v13 isBackDualSupported] & 1) != 0
            || ([v13 isBackWideDualSupported] & 1) != 0
            || ([v13 isBackTripleCameraSupported] & 1) != 0)
          {
            v131[0] = &unk_26BDDF188;
            v117 = [NSNumber numberWithDouble:v38];
            v131[1] = v117;
            double v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v131 count:2];

            v118 = [NSNumber numberWithDouble:v31];
            v130[0] = v118;
            v119 = [NSNumber numberWithDouble:v38];
            v130[1] = v119;
            id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v130 count:2];
          }
          else
          {
            v133[0] = &unk_26BDDF188;
            v133[1] = &unk_26BDDF198;
            v120 = [NSNumber numberWithDouble:v38];
            v133[2] = v120;
            double v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v133 count:3];

            v118 = [NSNumber numberWithDouble:v31];
            v132[0] = v118;
            v119 = [NSNumber numberWithDouble:v31 + v31];
            v132[1] = v119;
            v121 = [NSNumber numberWithDouble:v38];
            v132[2] = v121;
            id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v132 count:3];
          }
          if (v129)
          {
            uint64_t v52 = 1;
            goto LABEL_42;
          }
          goto LABEL_44;
        }
        [v13 superWideToWideZoomFactorForDevicePosition:v15];
        double v114 = v113;
        v135[0] = &unk_26BDDF188;
        v115 = [NSNumber numberWithDouble:v38];
        v135[1] = v115;
        v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:v135 count:2];

        double v34 = [NSNumber numberWithDouble:v29];
        v134[0] = v34;
        id v35 = [NSNumber numberWithDouble:v38 / v114];
        v134[1] = v35;
        v108 = (void *)MEMORY[0x263EFF8C0];
        v109 = v134;
      }
      v76 = [v108 arrayWithObjects:v109 count:2];
      goto LABEL_43;
    }
    [v13 superWideToWideZoomFactorForDevicePosition:v15];
    double v99 = v98;
    double v100 = v38 / v98;
    if ([v13 isDualDeviceDisparitySupportedForMode:a3 devicePosition:v15])
    {
      v101 = [NSNumber numberWithDouble:v31];
      v139[0] = v101;
      v102 = [NSNumber numberWithDouble:v100];
      v139[1] = v102;
      id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v139 count:2];

      v103 = [NSNumber numberWithDouble:v99];
      v138[0] = v103;
      v104 = [NSNumber numberWithDouble:v38];
      v138[1] = v104;
      double v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:2];
      uint64_t v52 = 1;
    }
    else
    {
      v110 = [NSNumber numberWithDouble:v29];
      v141[0] = v110;
      v111 = [NSNumber numberWithDouble:v31];
      v141[1] = v111;
      v112 = [NSNumber numberWithDouble:v100];
      v141[2] = v112;
      id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v141 count:3];

      v140[0] = &unk_26BDDF188;
      v103 = [NSNumber numberWithDouble:v99];
      v140[1] = v103;
      v104 = [NSNumber numberWithDouble:v38];
      v140[2] = v104;
      double v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v140 count:3];
      uint64_t v52 = 2;
    }

    if (v129)
    {
      double v27 = v27 * v99;
      goto LABEL_42;
    }
  }
LABEL_44:
  BOOL v33 = 0;
  if (v34 && v35)
  {
    if (a7) {
      *a7 = v34;
    }
    if (a8)
    {
      id v35 = v35;
      *a8 = v35;
    }
    BOOL v33 = 1;
  }
LABEL_51:

  return v33;
}

+ (double)zoomControlDisplayValueForZoomFactor:(double)a3 mode:(int64_t)a4 device:(int64_t)a5 videoConfiguration:(int64_t)a6 videoStabilizationStrength:(int64_t)a7
{
  int v14 = +[CAMCaptureCapabilities capabilities];
  uint64_t v15 = v14;
  if ((unint64_t)(a5 - 1) > 0xA) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = qword_209C78E80[a5 - 1];
  }
  int v17 = [v14 isZoomAllowedForMode:a4 device:a5 videoConfiguration:a6 videoStabilizationStrength:a7];
  int v18 = [v15 shouldAllowCameraToggleForMode:a4 devicePosition:v16 videoConfiguration:a6 videoStabilizationStrength:a7];
  unint64_t v19 = [v15 resolvedDeviceForDesiredDevice:a5 mode:a4 videoConfiguration:a6 videoStabilizationStrength:a7 spatialVideoEnabled:0];
  [v15 superWideDisplayZoomFactor];
  double v21 = v20;
  [v15 wideDisplayZoomFactor];
  double v23 = v22;
  [v15 telephotoDisplayZoomFactor];
  if (v17)
  {
    id v41 = 0;
    id v42 = 0;
    int v25 = [a1 shouldApplyContinuousZoomForMode:a4 device:v19 videoConfiguration:a6 videoStabilizationStrength:a7 zoomFactors:&v42 displayZoomFactors:&v41];
    id v26 = v42;
    id v27 = v41;
    if (v25)
    {
      [a1 piecewiseLinearMappingForX:v26 fromXValues:v27 toYValues:a3];
      a3 = v28;
    }

    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    double v21 = a3;
    goto LABEL_14;
  }
  double v29 = v24;
  int v30 = [v15 isDualDeviceDisparitySupportedForMode:a4 devicePosition:v16];
  int v31 = [v15 isQuadraWideZoomButtonSupportedForMode:a4 devicePosition:v16 videoConfiguration:a6];
  [v15 quadraWideDisplayZoomFactor];
  double v33 = v32;
  [v15 quadraWideRelativeZoomFactor];
  double v35 = v34;
  switch(v19)
  {
    case 0uLL:
    case 1uLL:
    case 7uLL:
    case 9uLL:
      double v36 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        +[CAMZoomControlUtilities zoomControlDisplayValueForZoomFactor:mode:device:videoConfiguration:videoStabilizationStrength:](a2, v19, v36);
      }

      double v21 = v23;
      break;
    case 2uLL:
    case 8uLL:
    case 0xBuLL:
      BOOL v38 = v34 == a3;
      goto LABEL_16;
    case 3uLL:
      double v21 = v29;
      break;
    case 4uLL:
      if (v30) {
        double v21 = v29;
      }
      else {
        double v21 = v23;
      }
      break;
    case 5uLL:
    case 0xAuLL:
      break;
    case 6uLL:
      if (v30)
      {
        [v15 superWideToWideZoomFactorForDevicePosition:0];
        BOOL v38 = v35 * v40 == a3;
LABEL_16:
        int v39 = v38;
        if ((v31 & v39) != 0) {
          double v21 = v33;
        }
        else {
          double v21 = v23;
        }
      }
      break;
    default:
      double v21 = 0.0;
      break;
  }
LABEL_14:

  return v21;
}

+ (double)piecewiseLinearMappingForX:(double)a3 fromXValues:(id)a4 toYValues:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 count];
  uint64_t v18 = 0;
  unint64_t v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  double v21 = a3;
  if (v9)
  {
    uint64_t v10 = v9;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __76__CAMZoomControlUtilities_piecewiseLinearMappingForX_fromXValues_toYValues___block_invoke;
    v12[3] = &unk_263FA07B8;
    double v16 = a3;
    id v13 = v8;
    uint64_t v15 = &v18;
    id v14 = v7;
    uint64_t v17 = v10;
    [v14 enumerateObjectsUsingBlock:v12];

    a3 = v19[3];
  }
  _Block_object_dispose(&v18, 8);

  return a3;
}

void __76__CAMZoomControlUtilities_piecewiseLinearMappingForX_fromXValues_toYValues___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 doubleValue];
  double v8 = v7;
  uint64_t v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v9 doubleValue];
  double v11 = v10;

  if (*(double *)(a1 + 56) <= v8)
  {
    if (a3)
    {
      uint64_t v12 = a3 - 1;
      id v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v12];
      [v13 doubleValue];
      double v15 = v14;

      double v16 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v12];
      [v16 doubleValue];
      double v18 = v17;

      +[CAMZoomControlUtilities linearMappingForX:1 x1:*(double *)(a1 + 56) y1:v15 x2:v18 y2:v8 clamp:v11];
      double v11 = v19;
    }
    goto LABEL_6;
  }
  if (*(void *)(a1 + 64) - 1 == a3)
  {
LABEL_6:
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
    *a4 = 1;
  }
}

+ (double)linearMappingForX:(double)a3 x1:(double)a4 y1:(double)a5 x2:(double)a6 y2:(double)a7 clamp:(BOOL)a8
{
  if (a3 == a4) {
    return a5;
  }
  if (a3 == a6) {
    return a7;
  }
  if (a6 == a4) {
    return a5;
  }
  if (!a8) {
    return a5 + (a3 - a4) / (a6 - a4) * (a7 - a5);
  }
  if (a4 <= a6)
  {
    double v9 = a7;
    double v10 = a6;
    a7 = a5;
    a6 = a4;
  }
  else
  {
    double v9 = a5;
    double v10 = a4;
  }
  if (a6 >= a3) {
    return a7;
  }
  if (v10 <= a3) {
    return v9;
  }
  return a7 + (a3 - a6) / (v10 - a6) * (v9 - a7);
}

+ (double)appropriateSignificantZoomFactorForDevice:(int64_t)a3 fromDevice:(int64_t)a4 currentZoomFactor:(double)a5 targetZoomFactor:(double)a6 mode:(int64_t)a7
{
  id v13 = +[CAMCaptureCapabilities capabilities];
  double v14 = [v13 significantZoomFactorsForMode:a7 device:a3];

  if ([v14 count] == 2)
  {
    [a1 zoomScaleFromDevice:a4 toDevice:a3];
    double v16 = v15 * a5;
    double v17 = v15 * a6;
    double v18 = [v14 firstObject];
    [v18 doubleValue];
    double v20 = v19;

    double v21 = [v14 lastObject];
    [v21 doubleValue];
    double v23 = v22;

    BOOL v24 = v16 < v23 || v17 > v20;
    double v25 = v20;
    if (v24)
    {
      BOOL v26 = v16 > v20 || v17 < v23;
      double v25 = v23;
      if (v26)
      {
        if (a3 == a4)
        {
          double v25 = v16;
        }
        else if (v16 < (v20 + v23) * 0.5)
        {
          double v25 = v20;
        }
        else
        {
          double v25 = v23;
        }
      }
    }
  }
  else
  {
    if ((unint64_t)[v14 count] >= 3)
    {
      id v27 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        +[CAMZoomControlUtilities appropriateSignificantZoomFactorForDevice:fromDevice:currentZoomFactor:targetZoomFactor:mode:]((uint64_t)v14, v27);
      }
    }
    double v28 = [v14 firstObject];
    [v28 doubleValue];
    double v25 = v29;
  }
  return v25;
}

+ (id)exifFocalLengthsByZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 customLensGroup:(id)a7 isTrueVideo:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v13 = a7;
  double v14 = +[CAMCaptureCapabilities capabilities];
  if ([v14 isCustomLensSupportedForMode:a3 device:a4 isTrueVideo:v8])
  {
    id v46 = 0;
    id v45 = 0;
    BOOL v15 = +[CAMZoomControlUtilities shouldApplyContinuousZoomForMode:a3 device:a4 videoConfiguration:a5 videoStabilizationStrength:a6 zoomFactors:&v46 displayZoomFactors:&v45];
    id v16 = v46;
    id v17 = v45;
    double v35 = v16;
    if (v15)
    {
      id v34 = v17;
      double v18 = +[CAMZoomPoint zoomPointsWithFactors:v16 displayZoomFactors:v17 customLensGroup:v13];
      uint64_t v41 = 0;
      id v42 = &v41;
      uint64_t v43 = 0x2020000000;
      uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v37 = 0;
      BOOL v38 = &v37;
      uint64_t v39 = 0x2020000000;
      uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __144__CAMZoomControlUtilities_exifFocalLengthsByZoomFactorForMode_device_videoConfiguration_videoStabilizationStrength_customLensGroup_isTrueVideo___block_invoke;
      v36[3] = &unk_263FA07E0;
      v36[4] = &v41;
      v36[5] = &v37;
      [v18 enumerateObjectsUsingBlock:v36];
      if (v42[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        double v19 = 0;
      }
      else
      {
        double v19 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v20 = v42[3];
        uint64_t v21 = v38[3];
        uint64_t v22 = [v18 count];
        if (v20) {
          unint64_t v24 = v20 - 1;
        }
        else {
          unint64_t v24 = 0;
        }
        if (v21 + 1 < (unint64_t)(v22 - 1)) {
          unint64_t v25 = v21 + 1;
        }
        else {
          unint64_t v25 = v22 - 1;
        }
        if (v24 <= v25)
        {
          *(void *)&long long v23 = 138543362;
          long long v33 = v23;
          do
          {
            id v27 = objc_msgSend(v18, "objectAtIndexedSubscript:", v24, v33);
            [v27 zoomFactor];
            double v29 = v28;
            [v27 displayFocalLength];
            if (v30 == 0.0)
            {
              int v31 = os_log_create("com.apple.camera", "Camera");
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v33;
                id v48 = v27;
                _os_log_error_impl(&dword_2099F8000, v31, OS_LOG_TYPE_ERROR, "Failed to determine focal length for zoomPoint: %{public}@, skipping it.", buf, 0xCu);
              }
            }
            else
            {
              int v31 = objc_msgSend(NSNumber, "numberWithDouble:");
              double v32 = [NSNumber numberWithDouble:v29];
              [v19 setObject:v31 forKeyedSubscript:v32];
            }
            ++v24;
          }
          while (v24 <= v25);
        }
      }
      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v41, 8);

      id v17 = v34;
    }
    else
    {
      double v19 = 0;
    }
  }
  else
  {
    double v19 = 0;
  }

  return v19;
}

uint64_t __144__CAMZoomControlUtilities_exifFocalLengthsByZoomFactorForMode_device_videoConfiguration_videoStabilizationStrength_customLensGroup_isTrueVideo___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 customLens];
  if (result)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v8 + 24) == 0x7FFFFFFFFFFFFFFFLL) {
      *(void *)(v8 + 24) = a3;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *a4 = 1;
  }
  return result;
}

+ (void)zoomControlDisplayValueForZoomFactor:(NSObject *)a3 mode:device:videoConfiguration:videoStabilizationStrength:.cold.1(const char *a1, unint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = NSStringFromSelector(a1);
  double v6 = CAMDebugStringForCaptureDevice(a2);
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  double v10 = v6;
  _os_log_error_impl(&dword_2099F8000, a3, OS_LOG_TYPE_ERROR, "Unhandled case for zoom button toggle/selection in %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

+ (void)appropriateSignificantZoomFactorForDevice:(uint64_t)a1 fromDevice:(NSObject *)a2 currentZoomFactor:targetZoomFactor:mode:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Cannot handle more than 2 significant zoom factors at this time: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end