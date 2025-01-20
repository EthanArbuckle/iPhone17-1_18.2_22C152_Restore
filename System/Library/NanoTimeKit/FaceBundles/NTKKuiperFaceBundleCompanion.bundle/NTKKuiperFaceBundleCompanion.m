double NTKKuiperMaximumTypographicSize()
{
  if (qword_17180 != -1) {
    dispatch_once(&qword_17180, &stru_10518);
  }
  return *(double *)&qword_17170;
}

void sub_34F4(id a1)
{
  qword_17170 = 0x407C200000000000;
  qword_17178 = 0x4084500000000000;
}

double NTKKuiperMaximumOverscrollTypographicSize()
{
  if (qword_17198 != -1) {
    dispatch_once(&qword_17198, &stru_10538);
  }
  return *(double *)&qword_17188;
}

void sub_3564(id a1)
{
  qword_17188 = 0x4081300000000000;
  qword_17190 = 0x4087700000000000;
}

id NTKKuiperRainbowGradientImage()
{
  if (qword_171A8 != -1) {
    dispatch_once(&qword_171A8, &stru_10558);
  }
  id v0 = [(id)qword_171A0 copy];

  return v0;
}

void sub_35E0(id a1)
{
  qword_171A0 = +[NTKKuiperFaceBundle imageWithName:@"Pride Gradient_626x626"];

  _objc_release_x1();
}

double NTKKuiperDigitRotationForDensity(uint64_t a1, uint64_t a2)
{
  double result = 0.0;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      double result = 1.0;
      if ((a2 & 1) == 0) {
        double result = 0.0;
      }
      break;
    case 2:
      unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * a2;
      unint64_t v4 = 0x5555555555555556;
      goto LABEL_8;
    case 3:
      unint64_t v3 = __ROR8__(0xAAAAAAAAAAAAAAABLL * a2, 1);
      unint64_t v4 = 0x2AAAAAAAAAAAAAABLL;
LABEL_8:
      double result = 1.0;
      if (v3 < v4) {
        double result = 0.0;
      }
      break;
    default:
      double result = 1.0;
      break;
  }
  return result;
}

void sub_56E8(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) normalComplicationDisplayWrapperForSlot:a2];
  v2 = [v5 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unint64_t v4 = [v5 display];
    [v4 transitionToMonochromeWithFraction:1.0];
  }
}

void sub_59C0(uint64_t a1, long long *a2, uint64_t a3)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5AB0;
  v5[3] = &unk_105A8;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = a3;
  long long v3 = a2[1];
  long long v6 = *a2;
  long long v7 = v3;
  long long v8 = a2[2];
  unint64_t v4 = objc_retainBlock(v5);
  ((void (*)(void *, void))v4[2])(v4, NTKComplicationSlotTopLeft);
  ((void (*)(void *, void))v4[2])(v4, NTKComplicationSlotTopRight);
  ((void (*)(void *, void))v4[2])(v4, NTKComplicationSlotBottomLeft);
  ((void (*)(void *, void))v4[2])(v4, NTKComplicationSlotBottomRight);
}

void sub_5AB0(uint64_t a1, uint64_t a2)
{
  long long v3 = [*(id *)(a1 + 32) complicationLayoutforSlot:a2];
  unint64_t v4 = [v3 defaultLayoutRuleForState:*(void *)(a1 + 40)];
  long long v5 = *(_OWORD *)(a1 + 64);
  v6[0] = *(_OWORD *)(a1 + 48);
  v6[1] = v5;
  v6[2] = *(_OWORD *)(a1 + 80);
  [v4 setContentTransform:v6];
}

id sub_60F0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 48) == a2)
  {
    id v2 = *(id *)(a1 + 32);
  }
  else
  {
    long long v3 = *(void **)(a1 + 40);
    unint64_t v4 = +[NSNumber numberWithInteger:a2];
    id v2 = [v3 objectForKeyedSubscript:v4];
  }

  return v2;
}

void sub_61EC(id a1)
{
  qword_171B0 = objc_opt_new();

  _objc_release_x1();
}

void sub_6348(id a1)
{
  v3[0] = &off_10E40;
  v3[1] = &off_10E58;
  v4[0] = NTKFaceBundleDensityDetailed;
  v4[1] = NTKFaceBundleDensityMedium;
  v3[2] = &off_10E70;
  v3[3] = &off_10E88;
  v4[2] = NTKFaceBundleDensitySimple;
  v4[3] = NTKFaceBundleDensityMinimal;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  id v2 = (void *)qword_171C0;
  qword_171C0 = v1;
}

void sub_66CC(id a1)
{
  v3[0] = &off_10EA0;
  v3[1] = &off_10EB8;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  v3[2] = &off_10ED0;
  v3[3] = &off_10EE8;
  v4[2] = NTKFaceBundleStyle3;
  v4[3] = NTKFaceBundleStyle4;
  void v3[4] = &off_10F00;
  void v4[4] = NTKFaceBundleStyle5;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5];
  id v2 = (void *)qword_171D0;
  qword_171D0 = v1;
}

void sub_6860(id a1)
{
  LODWORD(v1) = 1061997773;
  LODWORD(v2) = 1.0;
  uint64_t v3 = +[CAMediaTimingFunction functionWithControlPoints:0.0 :0.0 :v1 :v2];
  unint64_t v4 = (void *)qword_171E0;
  qword_171E0 = v3;

  LODWORD(v5) = 1045220557;
  LODWORD(v6) = 1.0;
  LODWORD(v7) = 1.0;
  qword_171E8 = +[CAMediaTimingFunction functionWithControlPoints:0.0 :v5 :v6 :v7];

  _objc_release_x1();
}

id sub_6BF4()
{
  id v0 = objc_opt_new();
  id v1 = +[UIColor whiteColor];
  objc_msgSend(v0, "setBackgroundColor:", objc_msgSend(v1, "CGColor"));

  double v2 = sub_6C7C();
  [v0 setActions:v2];

  return v0;
}

id sub_6C7C()
{
  if (qword_17200 != -1) {
    dispatch_once(&qword_17200, &stru_106D8);
  }
  id v0 = (void *)qword_171F8;

  return v0;
}

id sub_6CD0(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = objc_opt_new();
  [v3 setFillMode:kCAFillModeBoth];
  [v3 setInstanceCount:a2];
  id v4 = +[UIColor whiteColor];
  objc_msgSend(v3, "setInstanceColor:", objc_msgSend(v4, "CGColor"));

  CATransform3DMakeRotation(&v6, 6.28318531 / (double)a2, 0.0, 0.0, 1.0);
  [v3 setInstanceTransform:&v6];

  return v3;
}

void sub_6D9C(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_17238);
  id WeakRetained = objc_loadWeakRetained(&qword_17240);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_17240);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_17248;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_17240, obj);
  qword_17248 = (uint64_t)[obj version];

  sub_8394(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_17238);
  long long v10 = *(_OWORD *)&qword_17218;
  *a2 = xmmword_17208;
  a2[1] = v10;
  a2[2] = xmmword_17228;
}

id sub_7208(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

void sub_72E4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 layer];
  objc_msgSend(v6, "setAnchorPoint:", 0.5, 1.0);

  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeRotation(&v15, ((double)((a3 + 7) % 0xCuLL) / 12.0 + (double)((a3 + 7) % 0xCuLL) / 12.0) * 3.14159265);
  double v8 = *(double *)(a1 + 32);
  double v7 = *(double *)(a1 + 40);
  if (v7 != 0.0)
  {
    CGFloat v9 = v7 * 10.0 + 1.0;
    CGAffineTransform v13 = v15;
    CGAffineTransformScale(&v14, &v13, 1.0 - v7 * 10.0, v9);
    CGAffineTransform v15 = v14;
    double v8 = v8 / v9;
  }
  CGAffineTransform v13 = v15;
  CGAffineTransformTranslate(&v14, &v13, 0.0, v8);
  CGAffineTransform v15 = v14;
  CGAffineTransform v12 = v14;
  long long v10 = [v5 layer];

  CGAffineTransform v11 = v12;
  [v10 setAffineTransform:&v11];
}

void sub_8278(id a1)
{
  id v1 = +[NSNull null];
  v4[0] = @"affineTransform";
  v4[1] = @"backgroundColor";
  v5[0] = v1;
  v5[1] = v1;
  v4[2] = @"bounds";
  v4[3] = @"contentsMultiplyColor";
  v5[2] = v1;
  v5[3] = v1;
  void v4[4] = @"hidden";
  void v4[5] = @"instanceCount";
  v5[4] = v1;
  v5[5] = v1;
  v4[6] = @"instanceDelay";
  v4[7] = @"instanceTransform";
  void v5[6] = v1;
  v5[7] = v1;
  v4[8] = @"opacity";
  v4[9] = @"position";
  v5[8] = v1;
  v5[9] = v1;
  v4[10] = @"transform";
  v5[10] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:11];
  uint64_t v3 = (void *)qword_171F8;
  qword_171F8 = v2;
}

void sub_8394(uint64_t a1, uint64_t a2)
{
  id v6 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v6 scaledValue:2.0];
  *(void *)&xmmword_17208 = v2;
  [v6 scaledValue:60.0];
  *((void *)&xmmword_17208 + 1) = v3;
  [v6 scaledValue:7.0];
  qword_17218 = 0x3FF0000000000000;
  qword_17220 = v4;
  [v6 scaledValue:2.75];
  *(void *)&xmmword_17228 = 0x3FF0000000000000;
  *((void *)&xmmword_17228 + 1) = v5;
}

void sub_843C(id a1)
{
  id v1 = (void *)qword_17250;
  qword_17250 = @"12";
}

void sub_8454(id a1)
{
  id v1 = (void *)qword_17260;
  qword_17260 = @"I";
}

void sub_8594(id a1)
{
  qword_17270 = (uint64_t)[objc_alloc((Class)NTKCornerComplicationConfiguration) initWithTopLeftComplication:43 topRightComplication:10 bottomLeftComplication:3 bottomRightComplication:7];

  _objc_release_x1();
}

void sub_8EA8(uint64_t a1, CFAttributedStringRef attrString)
{
  uint64_t v3 = CTLineCreateWithAttributedString(attrString);
  double TypographicBounds = CTLineGetTypographicBounds(v3, 0, 0, 0);
  CGContextSetTextPosition(*(CGContextRef *)(a1 + 48), (*(double *)(a1 + 32) - TypographicBounds) * 0.5, *(CGFloat *)(a1 + 56));
  CTLineDraw(v3, *(CGContextRef *)(a1 + 48));

  CFRelease(v3);
}

id sub_8F20(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  double v8 = objc_opt_new();
  [v8 setObject:v5 forKey:NSForegroundColorAttributeName];

  [v8 setObject:v6 forKey:NSFontAttributeName];
  id v9 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v7];

  objc_msgSend(v9, "setAttributes:range:", v8, 0, objc_msgSend(v9, "length"));

  return v9;
}

void sub_915C(uint64_t a1, uint64_t a2)
{
  id v3 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v3 scaledValue:4.5];
  qword_17280 = v2;
}

void sub_9824(id a1)
{
  qword_172A0 = +[NTKFontLoader fontDescriptorForSectName:@"__KuiperFont" fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_99F4(id a1)
{
  v3[0] = UIFontFeatureTypeIdentifierKey;
  v3[1] = UIFontFeatureSelectorIdentifierKey;
  v4[0] = &off_10F60;
  v4[1] = &off_10F78;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  uint64_t v2 = (void *)qword_172B0;
  qword_172B0 = v1;
}

void sub_9A98(id a1)
{
  v3[0] = UIFontFeatureTypeIdentifierKey;
  v3[1] = UIFontFeatureSelectorIdentifierKey;
  v4[0] = &off_10F60;
  v4[1] = &off_10F90;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  uint64_t v2 = (void *)qword_172C0;
  qword_172C0 = v1;
}

void sub_9B3C(id a1)
{
  v3[0] = UIFontFeatureTypeIdentifierKey;
  v3[1] = UIFontFeatureSelectorIdentifierKey;
  v4[0] = &off_10F60;
  v4[1] = &off_10FA8;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  uint64_t v2 = (void *)qword_172D0;
  qword_172D0 = v1;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
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

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetAllowsFontSmoothing(CGContextRef c, BOOL allowsFontSmoothing)
{
}

void CGContextSetAllowsFontSubpixelPositioning(CGContextRef c, BOOL allowsFontSubpixelPositioning)
{
}

void CGContextSetAllowsFontSubpixelQuantization(CGContextRef c, BOOL allowsFontSubpixelQuantization)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
}

void CGContextSetShouldSubpixelPositionFonts(CGContextRef c, BOOL shouldSubpixelPositionFonts)
{
}

void CGContextSetShouldSubpixelQuantizeFonts(CGContextRef c, BOOL shouldSubpixelQuantizeFonts)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithEllipseInRect(rect, transform);
}

void CGPathRelease(CGPathRef path)
{
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CLKContrastRatioForColors()
{
  return _CLKContrastRatioForColors();
}

uint64_t CLKSizeCenteredInRectForDevice()
{
  return _CLKSizeCenteredInRectForDevice();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return _CTLineCreateWithAttributedString(attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  return _CTLineGetTypographicBounds(line, ascent, descent, leading);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKColorByApplyingBlackOverlay()
{
  return _NTKColorByApplyingBlackOverlay();
}

uint64_t NTKColorByApplyingWhiteOverlay()
{
  return _NTKColorByApplyingWhiteOverlay();
}

uint64_t NTKDefaultCornerComplicationScaleForFullscreenOpaqueFaceForDevice()
{
  return _NTKDefaultCornerComplicationScaleForFullscreenOpaqueFaceForDevice();
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

uint64_t TextToFourCharCode()
{
  return _TextToFourCharCode();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void objc_destroyWeak(id *location)
{
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

id objc_msgSend__addMulticolorCircularGradientLayer(void *a1, const char *a2, ...)
{
  return [a1 _addMulticolorCircularGradientLayer];
}

id objc_msgSend__addMulticolorFullscreenGradientLayer(void *a1, const char *a2, ...)
{
  return [a1 _addMulticolorFullscreenGradientLayer];
}

id objc_msgSend__applyBreathingAndRubberbanding(void *a1, const char *a2, ...)
{
  return [a1 _applyBreathingAndRubberbanding];
}

id objc_msgSend__applyColorPalette(void *a1, const char *a2, ...)
{
  return [a1 _applyColorPalette];
}

id objc_msgSend__applyCurrentColorPalette(void *a1, const char *a2, ...)
{
  return [a1 _applyCurrentColorPalette];
}

id objc_msgSend__applyDialLayout(void *a1, const char *a2, ...)
{
  return [a1 _applyDialLayout];
}

id objc_msgSend__background(void *a1, const char *a2, ...)
{
  return [a1 _background];
}

id objc_msgSend__baseBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 _baseBackgroundColor];
}

id objc_msgSend__isCloudBlueColor(void *a1, const char *a2, ...)
{
  return [a1 _isCloudBlueColor];
}

id objc_msgSend__isGrayColor(void *a1, const char *a2, ...)
{
  return [a1 _isGrayColor];
}

id objc_msgSend__isLightColor(void *a1, const char *a2, ...)
{
  return [a1 _isLightColor];
}

id objc_msgSend__isRainbowColor(void *a1, const char *a2, ...)
{
  return [a1 _isRainbowColor];
}

id objc_msgSend__isWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 _isWhiteColor];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__loadTypographicSizeConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _loadTypographicSizeConfiguration];
}

id objc_msgSend__removeMulticolorCircularGradientLayer(void *a1, const char *a2, ...)
{
  return [a1 _removeMulticolorCircularGradientLayer];
}

id objc_msgSend__removeMulticolorFullscreenGradientLayer(void *a1, const char *a2, ...)
{
  return [a1 _removeMulticolorFullscreenGradientLayer];
}

id objc_msgSend__useBrightnessOffsetForBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 _useBrightnessOffsetForBackgroundColor];
}

id objc_msgSend__usesRedContrastSecondHandColor(void *a1, const char *a2, ...)
{
  return [a1 _usesRedContrastSecondHandColor];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_applyFont(void *a1, const char *a2, ...)
{
  return [a1 applyFont];
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return [a1 background];
}

id objc_msgSend_backgroundBlack(void *a1, const char *a2, ...)
{
  return [a1 backgroundBlack];
}

id objc_msgSend_backgroundDefault(void *a1, const char *a2, ...)
{
  return [a1 backgroundDefault];
}

id objc_msgSend_backgroundLight(void *a1, const char *a2, ...)
{
  return [a1 backgroundLight];
}

id objc_msgSend_backgroundMedium(void *a1, const char *a2, ...)
{
  return [a1 backgroundMedium];
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

id objc_msgSend_colorFraction(void *a1, const char *a2, ...)
{
  return [a1 colorFraction];
}

id objc_msgSend_colorPalette(void *a1, const char *a2, ...)
{
  return [a1 colorPalette];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_complicationBackground(void *a1, const char *a2, ...)
{
  return [a1 complicationBackground];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_complicationPrimary(void *a1, const char *a2, ...)
{
  return [a1 complicationPrimary];
}

id objc_msgSend_complicationPrimaryDark(void *a1, const char *a2, ...)
{
  return [a1 complicationPrimaryDark];
}

id objc_msgSend_complicationPrimaryDefault(void *a1, const char *a2, ...)
{
  return [a1 complicationPrimaryDefault];
}

id objc_msgSend_complicationPrimaryMedium(void *a1, const char *a2, ...)
{
  return [a1 complicationPrimaryMedium];
}

id objc_msgSend_complicationSecondary(void *a1, const char *a2, ...)
{
  return [a1 complicationSecondary];
}

id objc_msgSend_complicationSecondaryDarkBackground(void *a1, const char *a2, ...)
{
  return [a1 complicationSecondaryDarkBackground];
}

id objc_msgSend_complicationSecondaryDefault(void *a1, const char *a2, ...)
{
  return [a1 complicationSecondaryDefault];
}

id objc_msgSend_complicationSecondaryLightBackground(void *a1, const char *a2, ...)
{
  return [a1 complicationSecondaryLightBackground];
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

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentTypographicStyleKey(void *a1, const char *a2, ...)
{
  return [a1 currentTypographicStyleKey];
}

id objc_msgSend_darkBackgroundComplicationSecondary(void *a1, const char *a2, ...)
{
  return [a1 darkBackgroundComplicationSecondary];
}

id objc_msgSend_darkDialDigit(void *a1, const char *a2, ...)
{
  return [a1 darkDialDigit];
}

id objc_msgSend_darkDialHourTick(void *a1, const char *a2, ...)
{
  return [a1 darkDialHourTick];
}

id objc_msgSend_darkDialSecondHand(void *a1, const char *a2, ...)
{
  return [a1 darkDialSecondHand];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_density(void *a1, const char *a2, ...)
{
  return [a1 density];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_dial(void *a1, const char *a2, ...)
{
  return [a1 dial];
}

id objc_msgSend_dialBackground(void *a1, const char *a2, ...)
{
  return [a1 dialBackground];
}

id objc_msgSend_dialBackgroundDark(void *a1, const char *a2, ...)
{
  return [a1 dialBackgroundDark];
}

id objc_msgSend_dialBackgroundMedium(void *a1, const char *a2, ...)
{
  return [a1 dialBackgroundMedium];
}

id objc_msgSend_dialFrame(void *a1, const char *a2, ...)
{
  return [a1 dialFrame];
}

id objc_msgSend_digit(void *a1, const char *a2, ...)
{
  return [a1 digit];
}

id objc_msgSend_digitRotationAnimation(void *a1, const char *a2, ...)
{
  return [a1 digitRotationAnimation];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fontForMaximumOverscrollTypographicSize(void *a1, const char *a2, ...)
{
  return [a1 fontForMaximumOverscrollTypographicSize];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fromDensity(void *a1, const char *a2, ...)
{
  return [a1 fromDensity];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_fullname(void *a1, const char *a2, ...)
{
  return [a1 fullname];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return [a1 grayColor];
}

id objc_msgSend_handDot(void *a1, const char *a2, ...)
{
  return [a1 handDot];
}

id objc_msgSend_handLength(void *a1, const char *a2, ...)
{
  return [a1 handLength];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_hourMinuteHandInlay(void *a1, const char *a2, ...)
{
  return [a1 hourMinuteHandInlay];
}

id objc_msgSend_hourMinuteHandStroke(void *a1, const char *a2, ...)
{
  return [a1 hourMinuteHandStroke];
}

id objc_msgSend_hourTick(void *a1, const char *a2, ...)
{
  return [a1 hourTick];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isRainbowColor(void *a1, const char *a2, ...)
{
  return [a1 isRainbowColor];
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

id objc_msgSend_lightDialBackground(void *a1, const char *a2, ...)
{
  return [a1 lightDialBackground];
}

id objc_msgSend_lightDialDigit(void *a1, const char *a2, ...)
{
  return [a1 lightDialDigit];
}

id objc_msgSend_lightDialHourTick(void *a1, const char *a2, ...)
{
  return [a1 lightDialHourTick];
}

id objc_msgSend_lightDialMinuteTick(void *a1, const char *a2, ...)
{
  return [a1 lightDialMinuteTick];
}

id objc_msgSend_lightDialSecondHand(void *a1, const char *a2, ...)
{
  return [a1 lightDialSecondHand];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_minuteTick(void *a1, const char *a2, ...)
{
  return [a1 minuteTick];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_randomTypographicStyleFraction(void *a1, const char *a2, ...)
{
  return [a1 randomTypographicStyleFraction];
}

id objc_msgSend_redContrastSecondHand(void *a1, const char *a2, ...)
{
  return [a1 redContrastSecondHand];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_rubberbanding(void *a1, const char *a2, ...)
{
  return [a1 rubberbanding];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_secondHand(void *a1, const char *a2, ...)
{
  return [a1 secondHand];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toDensity(void *a1, const char *a2, ...)
{
  return [a1 toDensity];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_typographicSize(void *a1, const char *a2, ...)
{
  return [a1 typographicSize];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}