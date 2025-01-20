id sub_4E08(uint64_t a1)
{
  return +[NTKUtilityFaceDialFactory _renderDialForDevice:*(void *)(a1 + 32)];
}

id sub_4F24(void *a1)
{
  return +[NTKUtilityFaceDialFactory _renderNumbersForStyle:a1[5] typeface:a1[6] device:a1[4]];
}

void sub_4F90(id a1)
{
  v1 = objc_opt_new();
  id v4 = +[BSUIMappedImageCacheOptions optionsWithContainerPathProvider:v1];

  id v2 = [objc_alloc((Class)BSUIMappedImageCache) initWithUniqueIdentifier:@"com.apple.NanoTimeKit.NTKUtilityFaceView" options:v4];
  v3 = (void *)qword_16A00;
  qword_16A00 = (uint64_t)v2;
}

void sub_52FC(void *a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16B40);
  id WeakRetained = objc_loadWeakRetained(&qword_16B48);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    id v7 = objc_loadWeakRetained(&qword_16B48);
    if (v7 == obj)
    {
      id v8 = [obj version];
      uint64_t v9 = qword_16B50;

      if (v8 == (id)v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v10 = objc_storeWeak(&qword_16B48, obj);
  qword_16B50 = (uint64_t)[obj version];

  sub_6204(v11, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16B40);
  if (a2 <= 0xE)
  {
    v12 = off_105A8[a2];
    qword_16A40 = *off_10530[a2];
    qword_16AC0 = *v12;
  }
  memcpy(a3, &qword_16A08, 0x138uLL);
}

id _NTKUtilityTick(unint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7)
{
  CGFloat v13 = (float)((float)a1 * 6.0) * 0.0174532925;
  float v14 = v13;
  __float2 v15 = __sincosf_stret(v14);
  id v16 = a2;
  v17 = +[CALayer layer];
  id v18 = v16;
  id v19 = [v18 CGColor];

  [v17 setBackgroundColor:v19];
  CGAffineTransformMakeRotation(&v21, v13);
  [v17 setAffineTransform:&v21];
  objc_msgSend(v17, "setAnchorPoint:", 0.5, 0.0);
  objc_msgSend(v17, "setBounds:", 0.0, 0.0, a3, a4);
  objc_msgSend(v17, "setPosition:", a6 + a5 * v15.__sinval, a7 - a5 * v15.__cosval);

  return v17;
}

id _NTKUtilityMinuteLayer(unint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, unint64_t a7, void *a8)
{
  id v14 = a8;
  if (a1) {
    uint64_t v15 = a1;
  }
  else {
    uint64_t v15 = 60;
  }
  if (a7 <= 0xB && ((1 << a7) & 0x806) != 0)
  {
    id v16 = @"%i";
    uint64_t v17 = a7;
  }
  else
  {
    id v16 = @"%02i";
    uint64_t v17 = 0;
  }
  id v18 = _NTKUtilityNumberText(v16, v15, v17);
  if (!NTKShowIndicScriptNumerals()
    || (+[NTKSFCompactFont numericFontOfSize:a2 weight:UIFontWeightMedium], (id v19 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v19 = +[CLKFont systemFontOfSize:a2 weight:UIFontWeightMedium];
  }
  v20 = _NTKUtilityLanguageRenderingHintForUtilityFaceDialTypeface(a7);
  id v21 = objc_alloc((Class)NSAttributedString);
  v42[0] = v19;
  v41[0] = NSFontAttributeName;
  v41[1] = NSForegroundColorAttributeName;
  v22 = +[UIColor whiteColor];
  v41[2] = NSLanguageIdentifierAttributeName;
  v42[1] = v22;
  v42[2] = v20;
  v23 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];
  id v24 = [v21 initWithString:v18 attributes:v23];

  objc_msgSend(v24, "boundingRectWithSize:options:context:", 3, 0, CGSizeZero.width, CGSizeZero.height);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  if (a7 == 2)
  {
    [v19 ascender];
    double v33 = v32;
    [v19 capHeight];
    double v35 = v33 - v34;
    [v19 descender];
    double v31 = ceil(v31 + v36);
  }
  else
  {
    double v35 = v25;
  }
  float v37 = (float)((float)a1 * 6.0) * 0.0174532925;
  __float2 v38 = __sincosf_stret(v37);
  v39 = +[CATextLayer layer];
  [v39 setString:v24];
  objc_msgSend(v39, "setAnchorPoint:", 0.5, 0.5);
  [v39 setMasksToBounds:0];
  objc_msgSend(v39, "setBounds:", v27, v35, ceil(v29), v31);
  [v39 setAlignmentMode:kCAAlignmentCenter];
  objc_msgSend(v39, "setPosition:", a4 + a3 * v38.__sinval, a5 - a3 * v38.__cosval);

  return v39;
}

id _NTKUtilityHourLayer(unint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7)
{
  if (!NTKShowIndicScriptNumerals()
    || (+[NTKSFCompactFont numericFontOfSize:a2 weight:UIFontWeightMedium], (CGFloat v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    CGFloat v13 = +[CLKFont systemFontOfSize:a2 weight:UIFontWeightMedium];
  }
  if (a1) {
    uint64_t v14 = a1;
  }
  else {
    uint64_t v14 = 12;
  }
  uint64_t v15 = _NTKUtilityNumberText(@"%i", v14, a7);
  id v16 = _NTKUtilityLanguageRenderingHintForUtilityFaceDialTypeface(a7);
  id v17 = objc_alloc((Class)NSAttributedString);
  v46[0] = v13;
  v45[0] = NSFontAttributeName;
  v45[1] = NSForegroundColorAttributeName;
  id v18 = +[UIColor whiteColor];
  v45[2] = NSLanguageIdentifierAttributeName;
  v46[1] = v18;
  v46[2] = v16;
  id v19 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
  CFAttributedStringRef v20 = (const __CFAttributedString *)[v17 initWithString:v15 attributes:v19];

  id v21 = CTLineCreateWithAttributedString(v20);
  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v21, 8uLL);
  double y = BoundsWithOptions.origin.y;
  double height = BoundsWithOptions.size.height;
  CFRelease(v21);
  [v13 capHeight];
  double v25 = y + height - v24;
  -[__CFAttributedString boundingRectWithSize:options:context:](v20, "boundingRectWithSize:options:context:", 3, 0, CGSizeZero.width, CGSizeZero.height);
  double v27 = v26;
  double v29 = v28;
  [v13 ascender];
  double v31 = v30;
  [v13 capHeight];
  if (a7 && v25 > 0.4 && y >= -0.4)
  {
    [v13 ascender];
    double v34 = v33 - v25;
    double v35 = ceil(v25);
  }
  else
  {
    double v35 = floor(v31 - v32);
    if (a7 && v25 <= 0.4 && y < -0.4)
    {
      [v13 capHeight];
      double v34 = ceil(v36 - y);
    }
    else
    {
      [v13 capHeight];
      double v38 = v37;
      if (a7 == 2)
      {
        [v13 descender];
        double v34 = v38 - v39;
      }
      else
      {
        double v34 = ceil(v37) + 2.0;
      }
    }
  }
  double v40 = ceil(v29);
  double v41 = _NTKUtilityFaceRectCenterThatFitsInBoundingRadius((double)a1 * 3.14159265 / 6.0 + -1.57079633, v40, v34, a3);
  __double2 v42 = __sincos_stret((double)a1 * 3.14159265 / 6.0 + -1.57079633);
  v43 = +[CATextLayer layer];
  [v43 setString:v20];
  objc_msgSend(v43, "setBounds:", v27, v35, v40, v34);
  objc_msgSend(v43, "setAnchorPoint:", 0.5, 0.5);
  [v43 setAlignmentMode:kCAAlignmentCenter];
  [v43 setMasksToBounds:0];
  objc_msgSend(v43, "setPosition:", a4 + v41 * v42.__cosval, a5 + v41 * v42.__sinval);

  return v43;
}

double _NTKUtilityFaceRectCenterThatFitsInBoundingRadius(double a1, double a2, double a3, double a4)
{
  while (a1 < 6.28318531)
    a1 = a1 + 6.28318531;
  float v7 = a1;
  float v8 = fmodf(v7, 6.2832);
  double v9 = v8;
  if (v8 >= 1.57079633)
  {
    if (v9 >= 3.14159265)
    {
      double v11 = a3 * -0.5;
      BOOL v12 = v9 < 4.71238898;
      double v10 = 0.5;
      if (v12) {
        double v10 = -0.5;
      }
    }
    else
    {
      double v11 = a3 * 0.5;
      double v10 = -0.5;
    }
  }
  else
  {
    double v10 = 0.5;
    double v11 = a3 * 0.5;
  }
  double v13 = a2 * v10;
  __float2 v14 = __sincosf_stret(v8);
  double v15 = (v11 + v11) * v14.__sinval + (v13 + v13) * v14.__cosval;
  float v16 = v13;
  float v17 = v11;
  float v18 = (float)(v16 * v16) + (float)(v17 * v17);
  float v19 = a4;
  float v20 = (float)(v18 - (float)(v19 * v19)) * -4.0 + v15 * v15;
  return (sqrtf(v20) - v15) * 0.5;
}

id _NTKUtilityNumberText(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  v6 = +[NTKUtilityFaceTypefaceEditOption localeForTypeface:a3];
  id v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:locale:", v5, v6, a2);

  return v7;
}

uint64_t _NTKUtilityLanguageRenderingHintForUtilityFaceDialTypeface(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 0xE) {
    a1 = 0;
  }
  return _CLKLocaleRenderingHintLanguageIdentifierForNumberingSystem(a1);
}

void sub_6204(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v3 scaledValue:6.0];
  qword_16A20 = v4;
  [v3 scaledValue:3 withOverride:4.0 forSizeClass:5.0];
  qword_16A38 = v5;
  [v3 setRoundingBehavior:0];
  [v3 scaledValue:1.25];
  qword_16A30 = v6;
  [v3 scaledValue:2.25];
  qword_16A28 = v7;
  [v3 setRoundingBehavior:2];
  +[NTKAnalogUtilities dialDiameterForDevice:v2];
  uint64_t v9 = v8;

  qword_16A08 = v9;
  [v3 scaledValue:4.0];
  qword_16A18 = v10;
  [v3 constantValue:0 withOverride:0.0 forSizeClass:4.0];
  qword_16A10 = v11;
  [v3 setRoundingBehavior:1];
  [v3 scaledValue:0 withOverride:7.5 forSizeClass:6.5];
  qword_16A48 = v12;
  v50[0] = &off_11158;
  v50[1] = &off_11188;
  v51[0] = &off_11170;
  v51[1] = &off_111A0;
  double v13 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
  [v3 scaledValue:v13 withOverrides:23.0];
  qword_16AC8 = v14;

  [v3 scaledValue:8.0];
  qword_16A50 = v15;
  v48[0] = &off_11158;
  v48[1] = &off_11188;
  v49[0] = &off_11170;
  v49[1] = &off_111A0;
  float v16 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
  [v3 scaledValue:v16 withOverrides:24.0];
  qword_16AD0 = v17;

  [v3 scaledValue:9.0];
  qword_16A58 = v18;
  [v3 scaledValue:22.5];
  qword_16AD8 = v19;
  qword_16A60 = qword_16A48;
  [v3 scaledValue:19.5];
  qword_16AE0 = v20;
  qword_16A68 = qword_16A48;
  [v3 scaledValue:18.0];
  qword_16AE8 = v21;
  qword_16A70 = qword_16A48;
  [v3 scaledValue:18.0];
  qword_16AF0 = v22;
  qword_16A78 = qword_16A48;
  v46[0] = &off_11158;
  [v3 scaledValue:19.0];
  v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v46[1] = &off_11188;
  v47[0] = v23;
  [v3 scaledValue:23.75];
  double v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v47[1] = v24;
  double v25 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
  [v3 scaledValue:v25 withOverrides:21.85];
  qword_16AF8 = v26;

  qword_16A80 = qword_16A48;
  v44[0] = &off_11158;
  [v3 scaledValue:19.0];
  double v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v44[1] = &off_11188;
  v45[0] = v27;
  [v3 scaledValue:23.75];
  double v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v45[1] = v28;
  double v29 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
  [v3 scaledValue:v29 withOverrides:21.85];
  qword_16B00 = v30;

  qword_16A88 = qword_16A48;
  v42[0] = &off_11158;
  [v3 scaledValue:19.0];
  double v31 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v42[1] = &off_11188;
  v43[0] = v31;
  [v3 scaledValue:23.75];
  double v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v43[1] = v32;
  double v33 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
  [v3 scaledValue:v33 withOverrides:21.85];
  qword_16B08 = v34;

  qword_16A90 = qword_16A48;
  [v3 scaledValue:22.5];
  qword_16B10 = v35;
  qword_16A98 = qword_16A48;
  [v3 scaledValue:18.0];
  qword_16B18 = v36;
  [v3 scaledValue:0 withOverride:7.5 forSizeClass:6.5];
  qword_16AA0 = v37;
  [v3 scaledValue:22.5];
  qword_16B20 = v38;
  qword_16AA8 = qword_16A48;
  [v3 scaledValue:18.0];
  qword_16B28 = v39;
  qword_16AB0 = qword_16A48;
  [v3 scaledValue:19.0];
  qword_16B30 = v40;
  qword_16AB8 = qword_16A48;
  [v3 scaledValue:19.0];
  qword_16B38 = v41;
}

BOOL NTKUtilityFaceDialConfigEqual(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

void sub_788C(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id v3 = a1;
  uint64_t v4 = +[CLKDeviceMetrics metricsWithDevice:v3 identitySizeClass:2];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16B98);
  id WeakRetained = objc_loadWeakRetained(&qword_16BA0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_16BA0);
  if (v7 != v3)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_16BA0, v3);
    qword_16BA8 = (uint64_t)[v3 version];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_9A70;
    v13[3] = &unk_106A0;
    id v14 = v4;
    sub_9A70((uint64_t)v13);

    goto LABEL_6;
  }
  id v8 = [v3 version];
  uint64_t v9 = qword_16BA8;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16B98);
  long long v11 = *(_OWORD *)&qword_16B68;
  *a2 = xmmword_16B58;
  a2[1] = v11;
  long long v12 = *(_OWORD *)&qword_16B88;
  a2[2] = xmmword_16B78;
  a2[3] = v12;
}

void sub_7E58(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 display];
  [*(id *)(a1 + 32) _complicationAlphaForEditMode:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _complicationAlphaForEditMode:*(void *)(a1 + 48)];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v4, "setAlpha:");
}

void sub_8188(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 display];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView]) {
    [v4 setAccentColor:*(void *)(*(void *)(a1 + 32) + 24)];
  }
}

void sub_84E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 display];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView]) {
    [v4 setAccentColor:*(void *)(*(void *)(a1 + 32) + 24)];
  }
}

void sub_97A0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 layer];
  id v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

void sub_9A70(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v40[0] = &off_112C0;
  v40[1] = &off_112D8;
  v41[0] = &off_11720;
  v41[1] = &off_11730;
  id v3 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
  [v2 scaledValue:v3 withOverrides:52.5];
  *(void *)&xmmword_16B58 = v4;

  id v5 = *(void **)(a1 + 32);
  v38[0] = &off_112C0;
  v38[1] = &off_112D8;
  v39[0] = &off_11740;
  v39[1] = &off_11750;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
  [v5 scaledValue:v6 withOverrides:30.0];
  *((void *)&xmmword_16B58 + 1) = v7;

  id v8 = *(void **)(a1 + 32);
  v36[0] = &off_112C0;
  v36[1] = &off_112F0;
  v37[0] = &off_11760;
  v37[1] = &off_11770;
  v36[2] = &off_11308;
  v37[2] = &off_11770;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
  [v8 scaledValue:v9 withOverrides:34.5];
  qword_16B68 = v10;

  long long v11 = *(void **)(a1 + 32);
  v34[0] = &off_112C0;
  v34[1] = &off_112F0;
  v35[0] = &off_11780;
  v35[1] = &off_11790;
  v34[2] = &off_11308;
  v35[2] = &off_11790;
  long long v12 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
  [v11 scaledValue:v12 withOverrides:27.0];
  qword_16B70 = v13;

  id v14 = *(void **)(a1 + 32);
  v32[0] = &off_112C0;
  v32[1] = &off_112F0;
  v33[0] = &off_117A0;
  v33[1] = &off_117B0;
  v32[2] = &off_11308;
  v33[2] = &off_117B0;
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
  [v14 scaledValue:v15 withOverrides:28.0];
  *(void *)&xmmword_16B78 = v16;

  uint64_t v17 = *(void **)(a1 + 32);
  v30[0] = &off_112C0;
  v30[1] = &off_112F0;
  v31[0] = &off_117C0;
  v31[1] = &off_117D0;
  v30[2] = &off_11308;
  v31[2] = &off_117D0;
  uint64_t v18 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
  [v17 scaledValue:v18 withOverrides:35.5];
  *((void *)&xmmword_16B78 + 1) = v19;

  uint64_t v20 = *(void **)(a1 + 32);
  v28[0] = &off_112C0;
  v28[1] = &off_112D8;
  v29[0] = &off_117E0;
  v29[1] = &off_117F0;
  uint64_t v21 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  [v20 scaledValue:v21 withOverrides:11.0];
  qword_16B88 = v22;

  v23 = *(void **)(a1 + 32);
  v26[0] = &off_112C0;
  v26[1] = &off_112D8;
  v27[0] = &off_11800;
  v27[1] = &off_11810;
  double v24 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  [v23 scaledValue:v24 withOverrides:17.0];
  qword_16B90 = v25;
}

uint64_t sub_A03C(uint64_t a1, uint64_t a2)
{
  qword_16BB0 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);

  return _objc_release_x1();
}

void sub_A204(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v4 = _EnumValueRange();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v10 = +[NTKUtilityFaceTypefaceEditOption _localizedNameForValue:forDevice:](NTKUtilityFaceTypefaceEditOption, "_localizedNameForValue:forDevice:", [v9 unsignedIntegerValue], v2);
        [v3 setObject:v9 forKey:v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }
  long long v11 = [v3 allKeys];
  long long v12 = [v11 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];

  id v13 = objc_alloc_init((Class)NSMutableArray);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v22 + 1) + 8 * (void)j), (void)v22);
        if (v19) {
          [v13 addObject:v19];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  id v20 = [v13 copy];
  uint64_t v21 = (void *)qword_16BD0;
  qword_16BD0 = (uint64_t)v20;
}

void sub_A698(id a1)
{
  v3[0] = &off_11320;
  v3[1] = &off_11338;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  v3[2] = &off_11350;
  v3[3] = &off_11368;
  v4[2] = NTKFaceBundleStyle3;
  v4[3] = NTKFaceBundleStyle4;
  v3[4] = &off_11380;
  v3[5] = &off_11398;
  v4[4] = NTKFaceBundleStyle5;
  v4[5] = NTKFaceBundleStyle6;
  v3[6] = &off_113B0;
  v3[7] = &off_113C8;
  v4[6] = NTKFaceBundleStyle7;
  v4[7] = NTKFaceBundleStyle8;
  v3[8] = &off_113E0;
  v3[9] = &off_113F8;
  v4[8] = NTKFaceBundleStyle9;
  v4[9] = NTKFaceBundleStyle10;
  v3[10] = &off_11410;
  v3[11] = &off_11428;
  v4[10] = NTKFaceBundleStyle11;
  v4[11] = NTKFaceBundleStyle12;
  v3[12] = &off_11440;
  v3[13] = &off_11458;
  v4[12] = NTKFaceBundleStyle13;
  v4[13] = NTKFaceBundleStyle14;
  v3[14] = &off_11470;
  v4[14] = NTKFaceBundleStyle15;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:15];
  id v2 = (void *)qword_16BF0;
  qword_16BF0 = v1;
}

uint64_t BSCurrentUserDirectory()
{
  return _BSCurrentUserDirectory();
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKLocaleCurrentNumberSystem()
{
  return _CLKLocaleCurrentNumberSystem();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return _CTLineCreateWithAttributedString(attrString);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  return _CTLineGetBoundsWithOptions(line, options);
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKAllUtilityLargeComplicationTypes()
{
  return _NTKAllUtilityLargeComplicationTypes();
}

uint64_t NTKAllUtilitySmallComplicationTypes()
{
  return _NTKAllUtilitySmallComplicationTypes();
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

uint64_t NTKDefaultFaceColorForDeviceCollection()
{
  return _NTKDefaultFaceColorForDeviceCollection();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKMultiFamilyComplicationSlotDescriptor()
{
  return _NTKMultiFamilyComplicationSlotDescriptor();
}

uint64_t NTKShowBlueRidgeUI()
{
  return _NTKShowBlueRidgeUI();
}

uint64_t NTKShowIndicScriptNumerals()
{
  return _NTKShowIndicScriptNumerals();
}

uint64_t NTKWrappedDateComplicationType()
{
  return _NTKWrappedDateComplicationType();
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

uint64_t _EnumValueRange()
{
  return __EnumValueRange();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

void objc_enumerationMutation(id obj)
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

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return [a1 CGContext];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__getImageCache(void *a1, const char *a2, ...)
{
  return [a1 _getImageCache];
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return [a1 _setupViews];
}

id objc_msgSend__updateDateComplicationPositionIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _updateDateComplicationPositionIfNecessary];
}

id objc_msgSend__utilityComplicationSlots(void *a1, const char *a2, ...)
{
  return [a1 _utilityComplicationSlots];
}

id objc_msgSend_accentColor(void *a1, const char *a2, ...)
{
  return [a1 accentColor];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_complicationFactory(void *a1, const char *a2, ...)
{
  return [a1 complicationFactory];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_dateStyle(void *a1, const char *a2, ...)
{
  return [a1 dateStyle];
}

id objc_msgSend_defaultPath(void *a1, const char *a2, ...)
{
  return [a1 defaultPath];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_density(void *a1, const char *a2, ...)
{
  return [a1 density];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return [a1 descender];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_faceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 faceColorPalette];
}

id objc_msgSend_faceViewWantsComplicationKeylineFramesReloaded(void *a1, const char *a2, ...)
{
  return [a1 faceViewWantsComplicationKeylineFramesReloaded];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutComplicationViews(void *a1, const char *a2, ...)
{
  return [a1 layoutComplicationViews];
}

id objc_msgSend_libraryPath(void *a1, const char *a2, ...)
{
  return [a1 libraryPath];
}

id objc_msgSend_maxDateWidthLeavingRoomForKeylines(void *a1, const char *a2, ...)
{
  return [a1 maxDateWidthLeavingRoomForKeylines];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_referenceFrame(void *a1, const char *a2, ...)
{
  return [a1 referenceFrame];
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

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_tickColor(void *a1, const char *a2, ...)
{
  return [a1 tickColor];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_typeface(void *a1, const char *a2, ...)
{
  return [a1 typeface];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}