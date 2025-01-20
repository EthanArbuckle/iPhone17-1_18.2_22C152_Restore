void sub_3310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3334(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 72) = 0;
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained((id *)WeakRetained + 10);
    objc_msgSend(v2, "ntkRingsQuadDelegate_didStopAnimating");

    id WeakRetained = v3;
  }
}

void sub_3F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3F9C(void *a1, int a2)
{
  id v7 = a1;
  if (a2)
  {
    id v3 = NTKPausedGradientDarkColor();
    v26 = v3;
    v5 = NTKPausedGradientDarkColor();
    v27 = v5;
    NTKPausedGradientDarkColor();
  }
  else
  {
    id v2 = NTKMoveGradientDarkColor();
    v26 = v2;
    v4 = NTKExerciseGradientDarkColor();
    v27 = v4;
    NTKStandGradientDarkColor();
  v8 = };
  v28 = v8;
  v9 = +[NSArray arrayWithObjects:&v26 count:3];

  if (a2)
  {

    v10 = NTKPausedGradientLightColor();
    v23 = v10;
    v11 = NTKPausedGradientLightColor();
    v24 = v11;
    NTKPausedGradientLightColor();
  }
  else
  {

    v10 = NTKMoveGradientLightColor();
    v23 = v10;
    v11 = NTKExerciseGradientLightColor();
    v24 = v11;
    NTKStandGradientLightColor();
  v12 = };
  v25 = v12;
  v13 = +[NSArray arrayWithObjects:&v23 count:3];

  float v14 = ARUIRingPauseRingsOpacityValue;
  float v15 = ARUIRingEmptyOpacityValueDefault;
  if (a2) {
    float v15 = ARUIRingPauseRingsOpacityValue;
  }
  else {
    float v14 = ARUIRingOpacityValueDefault;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_99C8;
  v18[3] = &unk_20998;
  id v19 = v9;
  id v20 = v13;
  float v21 = v14;
  float v22 = v15;
  id v16 = v13;
  id v17 = v9;
  [v7 enumerateObjectsUsingBlock:v18];
}

void sub_41E8(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v4);
      v6 = *(void **)(a1 + 32);
      int v7 = *(unsigned __int8 *)(a1 + 80);
      *(_DWORD *)buf = 138412802;
      v33 = v5;
      __int16 v34 = 2112;
      v35 = v6;
      __int16 v36 = 1024;
      LODWORD(v37) = v7;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%@ rings updated with data model %@ with updateLabels:%i", buf, 0x1Cu);
    }
    v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = *(void **)(a1 + 48);
      v12 = *(void **)(a1 + 56);
      v13 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138413058;
      v33 = v10;
      __int16 v34 = 2048;
      v35 = v11;
      __int16 v36 = 2048;
      v37 = v12;
      __int16 v38 = 2048;
      v39 = v13;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%@ rings percentages update move %1.3f, exericse %1.3f, stand %1.3f", buf, 0x2Au);
    }
    if (*(unsigned char *)(a1 + 80))
    {
      v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472;
      v25 = sub_4554;
      v26 = &unk_20730;
      v27 = WeakRetained;
      uint64_t v29 = *(void *)(a1 + 72);
      id v28 = *(id *)(a1 + 32);
      char v30 = *(unsigned char *)(a1 + 81);
      __int16 v31 = *(_WORD *)(a1 + 82);
      float v14 = objc_retainBlock(&v23);
      float v15 = v14;
      if (*(unsigned char *)(a1 + 84)) {
        +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", WeakRetained, 5242880, v14, 0, 0.2, v23, v24, v25, v26, v27);
      }
      else {
        ((void (*)(void ***))v14[2])(v14);
      }
      id v16 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        id v19 = [WeakRetained[6] text];
        id v20 = [WeakRetained[7] text];
        float v21 = [WeakRetained[8] text];
        int v22 = *(unsigned __int8 *)(a1 + 85);
        *(_DWORD *)buf = 138413314;
        v33 = v18;
        __int16 v34 = 2112;
        v35 = v19;
        __int16 v36 = 2112;
        v37 = v20;
        __int16 v38 = 2112;
        v39 = v21;
        __int16 v40 = 1024;
        int v41 = v22;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%@ rings labels update move %@, exercise %@, sedentary %@ with ringsViewPropertiesChanged:%i", buf, 0x30u);
      }
    }
  }
}

void sub_4554(uint64_t a1)
{
  id v45 = [*(id *)(*(void *)(a1 + 32) + 48) text];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) text];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 64) text];
  v4 = +[NTKActivityAnalogFaceBundle localizedStringForKey:@"ACTIVITY_INVALID_DATA" comment:@"---"];
  double v5 = *(double *)(a1 + 48);
  v6 = (char *)[*(id *)(a1 + 40) activityMoveMode];
  int v7 = *(void **)(a1 + 40);
  if (v6 == (unsigned char *)&dword_0 + 2)
  {
    [v7 appleMoveTimeTotal];
    double v9 = v8;
  }
  else
  {
    v10 = [v7 activeEnergyTotal];
    v11 = +[NTKActivityFaceViewFactory userActiveEnergyUnit];
    [v10 doubleValueForUnit:v11];
    double v9 = floor(v12);
  }
  v13 = *(void **)(*(void *)(a1 + 32) + 48);
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setText:v4];
  }
  else
  {
    float v14 = +[NSNumber numberWithDouble:v5 * v9];
    float v15 = +[NSNumberFormatter localizedStringFromNumber:v14 numberStyle:0];
    [v13 setText:v15];
  }
  [*(id *)(a1 + 40) appleExerciseTimeTotal];
  id v17 = *(void **)(*(void *)(a1 + 32) + 56);
  if (*(unsigned char *)(a1 + 57))
  {
    [*(id *)(*(void *)(a1 + 32) + 56) setText:v4];
  }
  else
  {
    v18 = +[NSNumber numberWithDouble:v5 * v16];
    id v19 = +[NSNumberFormatter localizedStringFromNumber:v18 numberStyle:0];
    [v17 setText:v19];
  }
  id v20 = [*(id *)(a1 + 40) appleStandHoursTotal];
  float v21 = *(void **)(*(void *)(a1 + 32) + 64);
  if (*(unsigned char *)(a1 + 58))
  {
    [*(id *)(*(void *)(a1 + 32) + 64) setText:v4];
  }
  else
  {
    int v22 = +[NSNumber numberWithDouble:v5 * (double)(uint64_t)v20];
    v23 = +[NSNumberFormatter localizedStringFromNumber:v22 numberStyle:0];
    [v21 setText:v23];
  }
  uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 48) text];
  id v25 = [v24 length];
  id v26 = [v45 length];

  if (v25 != v26)
  {
    v27 = *(void **)(a1 + 32);
    id v28 = (void *)v27[6];
    uint64_t v29 = [v28 text];
    char v30 = objc_msgSend(v27, "_activityLabelFontForDigits:", objc_msgSend(v29, "length"));
    [v28 setFont:v30];

    [*(id *)(a1 + 32) setNeedsLayout];
  }
  __int16 v31 = [*(id *)(*(void *)(a1 + 32) + 56) text];
  id v32 = [v31 length];
  id v33 = [v2 length];

  if (v32 != v33)
  {
    __int16 v34 = *(void **)(a1 + 32);
    v35 = (void *)v34[7];
    __int16 v36 = [v35 text];
    v37 = objc_msgSend(v34, "_activityLabelFontForDigits:", objc_msgSend(v36, "length"));
    [v35 setFont:v37];

    [*(id *)(a1 + 32) setNeedsLayout];
  }
  __int16 v38 = [*(id *)(*(void *)(a1 + 32) + 64) text];
  id v39 = [v38 length];
  id v40 = [v3 length];

  if (v39 != v40)
  {
    int v41 = *(void **)(a1 + 32);
    v42 = (void *)v41[8];
    v43 = [v42 text];
    v44 = objc_msgSend(v41, "_activityLabelFontForDigits:", objc_msgSend(v43, "length"));
    [v42 setFont:v44];

    [*(id *)(a1 + 32) setNeedsLayout];
  }
}

void sub_4C8C(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_29510);
  id WeakRetained = objc_loadWeakRetained(&qword_29518);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_29518);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_29520;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_29518, obj);
  qword_29520 = (uint64_t)[obj version];

  sub_9384(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_29510);
  long long v10 = *(_OWORD *)&qword_294F8;
  *(_OWORD *)(a2 + 192) = xmmword_294E8;
  *(_OWORD *)(a2 + 208) = v10;
  *(void *)(a2 + 224) = qword_29508;
  long long v11 = *(_OWORD *)&qword_294B8;
  *(_OWORD *)(a2 + 128) = xmmword_294A8;
  *(_OWORD *)(a2 + 144) = v11;
  long long v12 = *(_OWORD *)&qword_294D8;
  *(_OWORD *)(a2 + 160) = xmmword_294C8;
  *(_OWORD *)(a2 + 176) = v12;
  long long v13 = *(_OWORD *)&qword_29478;
  *(_OWORD *)(a2 + 64) = xmmword_29468;
  *(_OWORD *)(a2 + 80) = v13;
  long long v14 = *(_OWORD *)&qword_29498;
  *(_OWORD *)(a2 + 96) = xmmword_29488;
  *(_OWORD *)(a2 + 112) = v14;
  long long v15 = *(_OWORD *)&qword_29438;
  *(_OWORD *)a2 = xmmword_29428;
  *(_OWORD *)(a2 + 16) = v15;
  long long v16 = *(_OWORD *)&qword_29458;
  *(_OWORD *)(a2 + 32) = xmmword_29448;
  *(_OWORD *)(a2 + 48) = v16;
}

void sub_4DD4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v20 = a2;
  id v6 = [v5 device];
  double v7 = _SubdialEndPositionForRingAtIndex(a3, (uint64_t)v6);
  double v9 = v8;

  double v10 = v7 + *(double *)(a1 + 40);
  double v11 = v9 + *(double *)(a1 + 48);
  long long v12 = [v20 text];
  id v13 = [v12 length];
  long long v14 = [*(id *)(a1 + 32) device];
  double v15 = v11 - _ActivityLabelYOffset((uint64_t)v13, v14);

  double v16 = *(double *)(a1 + 64) + *(double *)(a1 + 72) * -2.0;
  id v17 = [*(id *)(a1 + 32) _activityLabelFontForDigits:1];
  [v17 lineHeight];
  *(float *)&double v18 = v18;
  double v19 = ceilf(*(float *)&v18);

  objc_msgSend(v20, "setBounds:", CGPointZero.x, CGPointZero.y, v16, v19);
  objc_msgSend(v20, "setCenter:", v10, v15);
}

CGFloat _SubdialEndPositionForRingAtIndex(uint64_t a1, uint64_t a2)
{
  +[NTKAnalogUtilities sceneSizeForDevice:a2];
  double x = v3 * -0.25;
  if (a1 != 1) {
    double x = CGPointZero.x;
  }
  if (a1 == 2) {
    return CGPointZero.x;
  }
  else {
    return x;
  }
}

double _ActivityLabelYOffset(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  switch(a1)
  {
    case 1:
      sub_4C8C(v3, (uint64_t)v10);
      id v5 = (double *)&v11;
      break;
    case 2:
      sub_4C8C(v3, (uint64_t)v12);
      id v5 = (double *)&v13;
      break;
    case 3:
      sub_4C8C(v3, (uint64_t)v14);
      id v5 = (double *)&v15;
      break;
    case 4:
      sub_4C8C(v3, (uint64_t)v16);
      id v5 = (double *)&v17;
      break;
    default:
      sub_4C8C(v3, (uint64_t)v8);
      id v5 = (double *)&v9;
      break;
  }
  double v6 = *v5;

  return v6;
}

void sub_59E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    v4 = [v3 superview];

    id v5 = v8;
    if (v4) {
      goto LABEL_9;
    }
    double v6 = *(void **)(a1 + 32);
    if ((id)v6[4] != v8 || (uint64_t v7 = v6[10]) == 0) {
      uint64_t v7 = v6[1];
    }
    [*(id *)(*(void *)(a1 + 32) + 40) insertSubview:v8 aboveSubview:v7];
  }
  else
  {
    [v3 removeFromSuperview];
  }
  id v5 = v8;
LABEL_9:
}

unsigned char *sub_6E14(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[96])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_6EC4;
    v3[3] = &unk_207C8;
    v3[4] = *(void *)(a1 + 40);
    result = [result _enumerateActivityLabels:v3];
    if (*(unsigned char *)(a1 + 48)) {
      return [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:*(double *)(a1 + 40)];
    }
  }
  return result;
}

id sub_6EC4(uint64_t a1, void *a2)
{
  return [a2 setAlpha:*(double *)(a1 + 32)];
}

void sub_6ED0(uint64_t a1, void *a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_6F80;
  v5[3] = &unk_20818;
  id v6 = a2;
  double v3 = *(double *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v4 = v6;
  +[ARUIRingGroup animateWithDuration:v5 animations:v3];
}

id sub_6F80(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  *(float *)&double v1 = v1;
  return [*(id *)(a1 + 32) setOpacity:v1];
}

id sub_6F94(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 32);
  *(float *)&double v2 = v2;
  return [a2 setOpacity:v2];
}

void sub_7460(uint64_t a1, void *a2, uint64_t a3)
{
  id v24 = a2;
  if (*(unsigned char *)(a1 + 288))
  {
    CLKInterpolateBetweenFloatsClipped();
    double v6 = v5;
    CLKInterpolateBetweenFloatsClipped();
    *(float *)&double v7 = v7;
    [v24 setThickness:v7];
    [v24 setTranslation:0.0];
    double v8 = *(double *)(a1 + 80)
       + -((*(double *)(a1 + 88) + *(double *)(a1 + 96)) * (double)(unint64_t)(2 * a3)) * v6;
    *(float *)&double v8 = v8;
    [v24 setGroupDiameter:v8];
    if (!*(unsigned char *)(a1 + 289)) {
      goto LABEL_7;
    }
    LODWORD(v9) = 1.0;
    [v24 setPercentage:0 ofRingAtIndex:0 animated:v9];
    double v10 = (1.0 - v6) * 3.14159265;
    *(float *)&double v10 = v10;
  }
  else
  {
    sub_7624(3 - a3, *(double *)(a1 + 40), *(double *)(a1 + 48));
    double v12 = v11;
    CLKInterpolateBetweenFloatsClipped();
    *(float *)&double v13 = v13;
    [v24 setThickness:v13];
    long long v14 = [*(id *)(a1 + 32) device];
    *(double *)&long long v15 = _SubdialEndPositionForRingAtIndex(a3, (uint64_t)v14);
    long long v22 = v16;
    long long v23 = v15;

    *(void *)&v17.f64[0] = v23;
    *(void *)&v17.f64[1] = v22;
    [v24 setTranslation:COERCE_DOUBLE(vcvt_f32_f64(v17))];
    double v18 = *(double *)(a1 + 64) - *(double *)(a1 + 72);
    [v24 thickness];
    double v20 = v18 + v19;
    *(float *)&double v20 = v20;
    [v24 setGroupDiameter:v20];
    if (!*(unsigned char *)(a1 + 289)) {
      goto LABEL_7;
    }
    *(float *)&double v21 = v12;
    [v24 setPercentage:0 ofRingAtIndex:0 animated:v21];
    double v10 = 0.0;
  }
  objc_msgSend(v24, "setZRotation:", v10, v22, v23);
LABEL_7:
}

uint64_t sub_7624(uint64_t result, double a2, double a3)
{
  double v3 = (1.0 - a2) * 0.5;
  double v4 = a2 + (1.0 - v3 * 0.5 - (v3 * 0.5 + a2)) * 0.25 * (double)result;
  if (v4 <= a3 && v3 + v4 >= a3) {
    return CLKCompressFraction();
  }
  return result;
}

void sub_7680(double *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = 3 - a3;
  double v5 = a1[5];
  double v6 = a1[6];
  id v7 = a2;
  sub_7624(v4, v5, v6);
  [v7 setAlpha:v8 * *(double *)(*((void *)a1 + 4) + 112)];
  CLKInterpolateBetweenFloatsClipped();
  CGAffineTransformMakeScale(&v10, v9, v9);
  [v7 setTransform:&v10];
}

uint64_t sub_78B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_7A18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id _CreateChronoHighlightedImageWithColors(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  sub_4C8C(v3, (uint64_t)&v16);
  double v5 = *(double *)&v29 + *((double *)&v16 + 1);
  id v6 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", *((double *)&v17 + 1) + *(double *)&v29 * 2.0, *((double *)&v17 + 1) + *(double *)&v29 * 2.0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_7B7C;
  v11[3] = &unk_20920;
  id v12 = v4;
  id v13 = v3;
  double v14 = v5;
  double v15 = v5;
  id v7 = v3;
  id v8 = v4;
  CGFloat v9 = [v6 imageWithActions:v11];

  return v9;
}

void sub_7B7C(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v3];
      [v4 setFill];
      _SubdialEndPositionForRingAtIndex(v3, *(void *)(a1 + 40));
      double v5 = [v8 format];
      [v5 bounds];
      CGRectGetMidX(v10);
      id v6 = [v8 format];
      [v6 bounds];
      CGRectGetMidY(v11);

      CLKSizeCenteredAboutPointForDevice();
      id v7 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
      [v7 fill];

      ++v3;
    }
    while (v3 < (unint64_t)[*(id *)(a1 + 32) count]);
  }
}

id sub_86B8(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 format];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = *(void **)(a1 + 32);
  if (v12) {
    objc_msgSend(v12, "drawInRect:", v5, v7, v9, v11);
  }
  objc_msgSend(*(id *)(a1 + 40), "drawInRect:", v5, v7, v9, v11);
  objc_msgSend(*(id *)(a1 + 48), "drawInRect:", v5, v7, v9, v11);
  objc_msgSend(*(id *)(a1 + 56), "drawInRect:", v5, v7, v9, v11);
  NTKCSecondHandCenterOffset();
  id v13 = *(void **)(a1 + 64);
  double v15 = v5 + v9 * 0.5 - v14;
  double v17 = v7 + v11 * 0.5 - v16;

  return objc_msgSend(v13, "drawAtPoint:", v15, v17);
}

void sub_8DB0(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  double v5 = [a3 display];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = *(void **)(a1 + 32);
    id v7 = v5;
    double v8 = [v6 faceColorPalette];
    double v9 = [v8 primaryColor];

    double v10 = [*(id *)(a1 + 32) faceColorPalette];
    if ([v10 isMulticolor]) {
      double v11 = 0.0;
    }
    else {
      double v11 = 1.0;
    }

    [*(id *)(a1 + 32) setComplicationColor:v9];
    [*(id *)(a1 + 32) setInterpolatedComplicationColor:v9];
    [v7 transitionToMonochromeWithFraction:v11];
  }
  if ([v15 isEqualToString:NTKComplicationSlotBottomCenter]
    && [v5 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    id v12 = *(void **)(a1 + 32);
    id v13 = v5;
    double v14 = [v12 faceColorPalette];
    [v13 applyFaceColorPalette:v14 units:1];
  }
}

void sub_9384(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v3 scaledValue:13.0];
  *(void *)&xmmword_29428 = v4;
  v67[0] = &off_21558;
  v67[1] = &off_21570;
  v68[0] = &off_21C50;
  v68[1] = &off_21C60;
  double v5 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
  [v3 scaledValue:v5 withOverrides:120.5];
  qword_29440 = v6;

  [v3 scaledValue:3 withOverride:11.0 forSizeClass:12.5];
  *(void *)&xmmword_29448 = v7;
  v65[0] = &off_21558;
  v65[1] = &off_21570;
  v66[0] = &off_21C70;
  v66[1] = &off_21C80;
  double v8 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
  [v3 scaledValue:v8 withOverrides:42.0];
  *((void *)&xmmword_29428 + 1) = v9;

  [v3 scaledValue:0 withOverride:7.0 forSizeClass:7.0];
  qword_29438 = v10;
  [v3 scaledValue:2.5];
  *((void *)&xmmword_29448 + 1) = v11;
  qword_29500 = 545;
  v63[0] = &off_21558;
  v63[1] = &off_21570;
  v64[0] = &off_21C90;
  v64[1] = &off_21CA0;
  id v12 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
  [v3 scaledValue:v12 withOverrides:142.0];
  qword_29458 = v13;

  +[NTKAnalogUtilities sceneSizeForDevice:v2];
  double v15 = v14;

  *(double *)&xmmword_29468 = v15 + -3.0;
  v61[0] = &off_21558;
  v61[1] = &off_21570;
  v62[0] = &off_21CB0;
  v62[1] = &off_21CC0;
  double v16 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
  [v3 scaledValue:v16 withOverrides:93.0];
  qword_29460 = v17;

  [v3 scaledValue:14.5];
  *((void *)&xmmword_29468 + 1) = v18;
  [v3 scaledValue:13.5];
  qword_29478 = v19;
  [v3 scaledValue:12.5];
  qword_29480 = v20;
  [v3 scaledValue:11.5];
  *(void *)&xmmword_29488 = v21;
  v59[0] = &off_21558;
  v59[1] = &off_21570;
  v60[0] = &off_21CD0;
  v60[1] = &off_21CE0;
  v59[2] = &off_21588;
  v59[3] = &off_215A0;
  v60[2] = &off_21CF0;
  v60[3] = &off_21D00;
  long long v22 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:4];
  [v3 scaledValue:v22 withOverrides:9.5];
  *((void *)&xmmword_29488 + 1) = v23;

  v57[0] = &off_215B8;
  v57[1] = &off_21558;
  v58[0] = &off_21D10;
  v58[1] = &off_21D10;
  v57[2] = &off_21570;
  v57[3] = &off_21588;
  v58[2] = &off_21D10;
  v58[3] = &off_21D20;
  long long v24 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:4];
  [v3 scaledValue:v24 withOverrides:1.0];
  qword_29498 = v25;

  v55[0] = &off_215B8;
  v55[1] = &off_21558;
  v56[0] = &off_21D10;
  v56[1] = &off_21D10;
  v55[2] = &off_21570;
  v56[2] = &off_21D10;
  long long v26 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:3];
  [v3 scaledValue:v26 withOverrides:1.0];
  qword_294A0 = v27;

  v53[0] = &off_215B8;
  v53[1] = &off_21558;
  v54[0] = &off_21D10;
  v54[1] = &off_21D10;
  v53[2] = &off_21570;
  v54[2] = &off_21D10;
  long long v28 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:3];
  [v3 scaledValue:v28 withOverrides:1.0];
  *(void *)&xmmword_294A8 = v29;

  v51[0] = &off_215B8;
  v51[1] = &off_21558;
  v52[0] = &off_21D10;
  v52[1] = &off_21D10;
  v51[2] = &off_21570;
  v52[2] = &off_21D10;
  uint64_t v30 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];
  [v3 scaledValue:v30 withOverrides:1.0];
  *((void *)&xmmword_294A8 + 1) = v31;

  v49[0] = &off_215B8;
  v49[1] = &off_21558;
  v50[0] = &off_21D10;
  v50[1] = &off_21D10;
  v49[2] = &off_21570;
  v49[3] = &off_21588;
  v50[2] = &off_21D10;
  v50[3] = &off_21D10;
  v49[4] = &off_215A0;
  v50[4] = &off_21D30;
  id v32 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:5];
  [v3 scaledValue:v32 withOverrides:1.0];
  qword_294B8 = v33;

  v47[0] = &off_21558;
  v47[1] = &off_215B8;
  v48[0] = &off_21D40;
  v48[1] = &off_21D50;
  v47[2] = &off_21570;
  v47[3] = &off_215D0;
  v48[2] = &off_21D10;
  v48[3] = &off_21D30;
  __int16 v34 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:4];
  [v3 scaledValue:v34 withOverrides:-0.5];
  uint64_t v36 = v35;

  qword_294C0 = 0;
  *(void *)&xmmword_294C8 = v36;
  v45[0] = &off_21558;
  v45[1] = &off_21570;
  v46[0] = &off_21D60;
  v46[1] = &off_21D10;
  v37 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
  [v3 scaledValue:v37 withOverrides:-0.5];
  uint64_t v39 = v38;

  *((void *)&xmmword_294C8 + 1) = 0;
  qword_294D8 = v39;
  v43[0] = &off_21558;
  v43[1] = &off_215B8;
  v44[0] = &off_21D30;
  v44[1] = &off_21D30;
  v43[2] = &off_21570;
  v43[3] = &off_21588;
  v44[2] = &off_21D70;
  v44[3] = &off_21D80;
  v43[4] = &off_215A0;
  v43[5] = &off_215D0;
  v44[4] = &off_21D80;
  v44[5] = &off_21CF0;
  v44[6] = &off_21D90;
  v43[6] = &off_215E8;
  v43[7] = &off_21600;
  v44[7] = &off_21CE0;
  id v40 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:8];
  [v3 scaledValue:v40 withOverrides:3.5];
  qword_294E0 = v41;

  xmmword_294E8 = xmmword_19D10;
  qword_294F8 = 0x4012000000000000;
  [v3 scaledValue:3 withOverride:34.0 forSizeClass:40.0];
  qword_29508 = v42;
}

void sub_99C8(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v10 = a2;
  uint64_t v6 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  [v10 setTopColor:v6 bottomColor:v7 ofRingAtIndex:0];

  LODWORD(v8) = *(_DWORD *)(a1 + 48);
  [v10 setTrackOpacity:0 ofRingAtIndex:v8];
  LODWORD(v9) = *(_DWORD *)(a1 + 52);
  [v10 setEmptyOpacity:0 ofRingAtIndex:v9];
}

void sub_9A80(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = +[UIColor colorWithWhite:1.0 alpha:0.250980392];
  uint64_t v4 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.250980392, v3);
  v14[1] = v4;
  double v5 = +[UIColor colorWithWhite:1.0 alpha:0.250980392];
  v14[2] = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:v14 count:3];
  uint64_t v7 = _CreateChronoHighlightedImageWithColors(v2, v6);

  double v8 = (void *)qword_29528;
  qword_29528 = v7;

  double v9 = +[NSNotificationCenter defaultCenter];
  uint64_t v10 = CLKClearCacheRequestNotification;
  uint64_t v11 = +[NSOperationQueue mainQueue];
  uint64_t v12 = [v9 addObserverForName:v10 object:0 queue:v11 usingBlock:&stru_209D8];
  uint64_t v13 = (void *)qword_29530;
  qword_29530 = v12;
}

void sub_9C14(id a1, NSNotification *a2)
{
  id v2 = (void *)qword_29528;
  qword_29528 = 0;
}

void sub_9C24(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = +[UIColor colorWithRed:0.588235294 green:0.117647059 blue:0.282352941 alpha:0.5];
  uint64_t v4 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.384313725, 0.596078431, 0.062745098, 0.5, v3);
  v14[1] = v4;
  double v5 = +[UIColor colorWithRed:0.0470588235 green:0.603921569 blue:0.588235294 alpha:0.5];
  v14[2] = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:v14 count:3];
  uint64_t v7 = _CreateChronoHighlightedImageWithColors(v2, v6);

  double v8 = (void *)qword_29550;
  qword_29550 = v7;

  double v9 = +[NSNotificationCenter defaultCenter];
  uint64_t v10 = CLKClearCacheRequestNotification;
  uint64_t v11 = +[NSOperationQueue mainQueue];
  uint64_t v12 = [v9 addObserverForName:v10 object:0 queue:v11 usingBlock:&stru_209F8];
  uint64_t v13 = (void *)qword_29558;
  qword_29558 = v12;
}

void sub_9DEC(id a1, NSNotification *a2)
{
  id v2 = (void *)qword_29550;
  qword_29550 = 0;
}

void sub_9DFC(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_4C8C(v2, (uint64_t)v9);
  double v3 = v10;
  sub_4C8C(v2, (uint64_t)v7);

  id v6 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", v3 + v8, v3 + v8);
  uint64_t v4 = [v6 imageWithActions:&stru_20A38];
  double v5 = (void *)qword_29578;
  qword_29578 = v4;
}

void sub_9EA4(id a1, UIGraphicsImageRendererContext *a2)
{
  id v2 = a2;
  double v3 = +[UIColor colorWithWhite:1.0 alpha:0.250980392];
  [v3 setFill];

  id v5 = [(UIGraphicsImageRendererContext *)v2 format];

  [v5 bounds];
  uint64_t v4 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
  [v4 fill];
}

void sub_9F4C(id a1)
{
  id v5 = +[NSNotificationCenter defaultCenter];
  uint64_t v1 = CLKClearCacheRequestNotification;
  id v2 = +[NSOperationQueue mainQueue];
  uint64_t v3 = [v5 addObserverForName:v1 object:0 queue:v2 usingBlock:&stru_20A98];
  uint64_t v4 = (void *)qword_29598;
  qword_29598 = v3;
}

void sub_9FEC(id a1, NSNotification *a2)
{
  id v2 = (void *)qword_29578;
  qword_29578 = 0;
}

id NTKIsWheelchairUser()
{
  if (qword_295D0 != -1) {
    dispatch_once(&qword_295D0, &stru_20AB8);
  }
  v0 = (void *)qword_295C8;

  return [v0 isWheelchairUser];
}

void sub_AB24(id a1)
{
  id v3 = +[HKHealthStore fiui_sharedHealthStoreForCarousel];
  id v1 = [objc_alloc((Class)_HKWheelchairUseCharacteristicCache) initWithHealthStore:v3];
  id v2 = (void *)qword_295C8;
  qword_295C8 = (uint64_t)v1;
}

void sub_AC34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double sub_AE48(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_29630);
  id WeakRetained = objc_loadWeakRetained(&qword_29638);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_29638);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_29638, v1);
    qword_29640 = (uint64_t)[v1 version];

    sub_D564(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_29640;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_29630);
  double v9 = *(double *)&qword_29618;

  return v9;
}

void sub_AF54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _loadCurrentDataModelForce:1];
}

id _LastGoodDataModel()
{
  return (id)__LastGoodDataModel;
}

id _IsDataModelWithinToday(void *a1)
{
  id v1 = a1;
  id v2 = +[NSCalendar currentCalendar];
  id v3 = [v1 date];

  id v4 = [v2 isDateInToday:v3];
  return v4;
}

void _ClearLastGoodDataModel()
{
  v0 = (void *)__LastGoodDataModel;
  __LastGoodDataModel = 0;
}

void _SetLastGoodDataModel(id obj)
{
}

id sub_B224(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);

  return [v2 _updateRingsForCurrentDataModelAnimated:1];
}

void sub_B318(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_B3B4;
  v5[3] = &unk_20B08;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

id sub_B3B4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 51) = 0;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);

  return [v2 _updateRingsForCurrentDataModelAnimated:1];
}

void sub_BF9C(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _keylinePaddingForState:a2];
  double v5 = v4;
  id v6 = [*(id *)(a1 + 40) complicationLayoutforSlot:NTKComplicationSlotTopLeft];
  double v7 = *(double *)(a1 + 72) * 0.5 - *(double *)(a1 + 88);
  double v8 = *(double *)(a1 + 80) * 0.5 - *(double *)(a1 + 96);
  double v9 = *(double *)(a1 + 104);
  uint64_t v10 = *(void *)(a1 + 48);
  long long v11 = *(_OWORD *)(a1 + 128);
  long long v30 = *(_OWORD *)(a1 + 112);
  long long v31 = v11;
  long long v32 = *(_OWORD *)(a1 + 144);
  uint64_t v12 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:", v10, 3, 3, 0, &v30, v7 - v9 * 0.5, v8 - v9 * 0.5, v9, v9, v5, v5, v5, v5);
  [v6 setDefaultLayoutRule:v12 forState:a2];
  double v13 = *(double *)(a1 + 160);
  uint64_t v14 = *(void *)(a1 + 48);
  long long v15 = *(_OWORD *)(a1 + 184);
  long long v30 = *(_OWORD *)(a1 + 168);
  long long v31 = v15;
  long long v32 = *(_OWORD *)(a1 + 200);
  double v16 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:", v14, 3, 3, 0, &v30, v7 - v13 * 0.5, v8 - v13 * 0.5, v13, v13, v5, v5, v5, v5);

  [v6 setOverrideLayoutRule:v16 forState:a2 layoutOverride:4];
  uint64_t v17 = [*(id *)(a1 + 40) complicationLayoutforSlot:NTKComplicationSlotTopRight];

  double v18 = *(double *)(a1 + 72) * 0.5 + *(double *)(a1 + 88);
  [*(id *)(a1 + 32) _lisaGapForState:a2];
  double v20 = v18 - v19;
  double v21 = *(double *)(a1 + 104);
  double v22 = *(double *)(a1 + 80) * 0.5 - *(double *)(a1 + 96);
  uint64_t v23 = *(void *)(a1 + 48);
  long long v24 = *(_OWORD *)(a1 + 128);
  long long v30 = *(_OWORD *)(a1 + 112);
  long long v31 = v24;
  long long v32 = *(_OWORD *)(a1 + 144);
  uint64_t v25 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:", v23, 3, 3, 1, &v30, v20 - v21 * 0.5, v22 - v21 * 0.5, v21, v21, v5, v5, v5, v5);

  [v17 setDefaultLayoutRule:v25 forState:a2];
  double v26 = *(double *)(a1 + 160);
  uint64_t v27 = *(void *)(a1 + 48);
  long long v28 = *(_OWORD *)(a1 + 184);
  long long v30 = *(_OWORD *)(a1 + 168);
  long long v31 = v28;
  long long v32 = *(_OWORD *)(a1 + 200);
  uint64_t v29 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:", v27, 3, 3, 0, &v30, v20 - v26 * 0.5, v22 - v26 * 0.5, v26, v26, v5, v5, v5, v5);

  [v17 setOverrideLayoutRule:v29 forState:a2 layoutOverride:4];
}

void sub_C244(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _keylinePaddingForState:a2];
  double v5 = v4;
  [*(id *)(a1 + 32) _edgeGapForState:a2];
  double v7 = v5 + v6;
  NTKCircularSmallComplicationDiameter();
  double v9 = v8;
  NTKCircularSmallComplicationDiameter();
  double v11 = v10;
  uint64_t v12 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", *(void *)(a1 + 40), 3, 3, v7, v7, v9, v10, v5, v5, v5, v5);
  double v13 = [*(id *)(a1 + 48) complicationLayoutforSlot:NTKComplicationSlotTopLeft];
  [v13 setDefaultLayoutRule:v12 forState:a2];

  double v14 = *(double *)(a1 + 72) - v9 - v7;
  [*(id *)(a1 + 32) _lisaGapForState:a2];
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", *(void *)(a1 + 40), 3, 3, v14 - v15, v7, v9, v11, v5, v5, v5, v5);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  double v16 = [*(id *)(a1 + 48) complicationLayoutforSlot:NTKComplicationSlotTopRight];
  [v16 setDefaultLayoutRule:v17 forState:a2];
}

void sub_D030(id a1)
{
  uint64_t v3 = NTKComplicationSlotBottomCenter;
  uint64_t v1 = +[NSArray arrayWithObjects:&v3 count:1];
  id v2 = (void *)qword_295E0;
  qword_295E0 = v1;
}

void sub_D104(id a1)
{
  v3[0] = NTKComplicationSlotTopLeft;
  v3[1] = NTKComplicationSlotTopRight;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:2];
  id v2 = (void *)qword_295F0;
  qword_295F0 = v1;
}

void sub_D224(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _utilityComplicationSlots];
  id v2 = [*(id *)(a1 + 32) _colorComplicationSlots];
  uint64_t v3 = [v5 arrayByAddingObjectsFromArray:v2];
  double v4 = (void *)qword_29600;
  qword_29600 = v3;
}

void sub_D564(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  v16[0] = &off_216D8;
  v16[1] = &off_216F0;
  v17[0] = &off_21DA0;
  v17[1] = &off_21DA0;
  v16[2] = &off_21708;
  v16[3] = &off_21720;
  v17[2] = &off_21DC0;
  v17[3] = &off_21DD0;
  v16[4] = &off_21738;
  v16[5] = &off_21750;
  v17[4] = &off_21DE0;
  v17[5] = &off_21DF0;
  v16[6] = &off_21768;
  v16[7] = &off_21780;
  v17[6] = &off_21E00;
  v17[7] = &off_21E10;
  double v4 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:8];
  [v3 scaledValue:v4 withOverrides:6.0];
  qword_29610 = v5;

  [v2 screenBounds];
  double v7 = v6;

  *(double *)&qword_29618 = v7 + *(double *)&qword_29610 * -2.0;
  v14[0] = &off_21708;
  v14[1] = &off_21720;
  v15[0] = &off_21E20;
  v15[1] = &off_21E30;
  v14[2] = &off_21738;
  void v14[3] = &off_21750;
  v15[2] = &off_21E40;
  v15[3] = &off_21E50;
  v14[4] = &off_21768;
  v15[4] = &off_21E60;
  double v8 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];
  [v3 scaledValue:v8 withOverrides:60.0];
  qword_29628 = v9;

  v12[0] = &off_21708;
  v12[1] = &off_21720;
  v13[0] = &off_21E70;
  v13[1] = &off_21E80;
  v12[2] = &off_21738;
  v12[3] = &off_21750;
  v13[2] = &off_21E90;
  v13[3] = &off_21EA0;
  v12[4] = &off_21780;
  v13[4] = &off_21EA0;
  double v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
  [v3 scaledValue:v10 withOverrides:77.5];
  qword_29620 = v11;
}

void sub_DFB4(void *a1@<X0>, void *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_297B8);
  id WeakRetained = objc_loadWeakRetained(&qword_297C0);
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_297C0);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_297C8;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_297C0, obj);
  qword_297C8 = (uint64_t)[obj version];

  sub_12288(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_297B8);
  memcpy(a2, &qword_29680, 0x138uLL);
}

void sub_E2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_E2D4(uint64_t a1)
{
  double v2 = *(double *)(a1 + 72) - *(double *)(a1 + 88) * 5.2;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  CLKRoundForDevice();
  objc_msgSend(v3, "ntk_setBoundsAndPositionFromFrame:", v2, v4, *(double *)(a1 + 88) * 5.2, *(double *)(a1 + 104));
  [*(id *)(*(void *)(a1 + 32) + 32) origin];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5 + *(double *)(a1 + 112);
  double v6 = *(double *)(a1 + 72) - *(double *)(a1 + 88) * 3.2;
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 40);
  CLKRoundForDevice();
  objc_msgSend(v7, "ntk_setBoundsAndPositionFromFrame:", v6, v8, *(double *)(a1 + 88) * 3.2, *(double *)(a1 + 104));
  [*(id *)(*(void *)(a1 + 32) + 40) origin];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9 + *(double *)(a1 + 112);
  double v10 = *(void **)(*(void *)(a1 + 32) + 48);
  double v11 = *(double *)(a1 + 72) - *(double *)(a1 + 88) * 2.2;
  CLKRoundForDevice();
  double v13 = *(double *)(a1 + 88) * 2.2;
  double v14 = *(double *)(a1 + 104);

  return objc_msgSend(v10, "ntk_setBoundsAndPositionFromFrame:", v11, v12, v13, v14);
}

id sub_E79C(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_297D8);
  id WeakRetained = objc_loadWeakRetained(&qword_297E0);
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    id v8 = objc_loadWeakRetained(&qword_297E0);
    if (v8 == v5)
    {
      id v9 = [v5 version];
      uint64_t v10 = qword_297E8;

      if (v9 == (id)v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v11 = objc_storeWeak(&qword_297E0, v5);
  qword_297E8 = (uint64_t)[v5 version];

  sub_129D4();
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_297D8);
  if (qword_297F8 != -1) {
    dispatch_once(&qword_297F8, &stru_20CA0);
  }
  double v12 = *(double *)(a1 + 16) + a3 * 2.0;
  double v13 = +[NSNumber numberWithDouble:floor(v12)];
  double v14 = [(id)qword_297D0 objectForKeyedSubscript:v13];
  if (!v14)
  {
    id v15 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", v12, v12);
    double v14 = [v15 imageWithActions:&stru_20CE0];
    [(id)qword_297D0 setObject:v14 forKeyedSubscript:v13];
  }

  return v14;
}

id sub_F280(uint64_t a1, uint64_t a2)
{
  double v4 = [*(id *)(a1 + 32) device];
  id v5 = +[NTKDigitalTimeLabel labelWithOptions:0 forDevice:v4];

  [v5 setUserInteractionEnabled:0];
  double v6 = +[NTKTimeOffsetManager sharedManager];
  [v6 timeOffset];
  objc_msgSend(v5, "setTimeOffset:");

  uint64_t v7 = [*(id *)(a1 + 32) _labelFontMonospaced:0];
  [v5 setFont:v7];

  [v5 setShowSeconds:a2];
  [v5 setOverrideDate:*(void *)(*(void *)(a1 + 32) + 80) duration:0.0];
  [*(id *)(*(void *)(a1 + 32) + 72) bounds];
  double v9 = v8;
  [v5 bounds];
  double v11 = v9 - v10 * 0.5;
  [*(id *)(*(void *)(a1 + 32) + 72) bounds];
  objc_msgSend(v5, "setCenter:", v11, v12 * 0.5);
  double v13 = [*(id *)(a1 + 32) timeView];
  double v14 = [v13 color];
  [v5 setColor:v14];

  id v15 = objc_opt_new();
  [v15 addSubview:v5];

  return v15;
}

id sub_F64C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  void v3[2] = sub_F6C4;
  v3[3] = &unk_207C8;
  v3[4] = *(void *)(a1 + 40);
  return [v1 _enumerateActivityLabels:v3];
}

id sub_F6C4(uint64_t a1, void *a2)
{
  return [a2 setAlpha:*(double *)(a1 + 32)];
}

void sub_F6D0(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) ringGroups];
  double v2 = [v4 objectAtIndexedSubscript:0];
  *(float *)&double v3 = v1;
  [v2 setOpacity:v3];
}

void sub_10ABC(void *a1, int a2)
{
  id v7 = a1;
  if (a2)
  {
    double v3 = NTKPausedGradientDarkColor();
    double v26 = v3;
    id v5 = NTKPausedGradientDarkColor();
    uint64_t v27 = v5;
    NTKPausedGradientDarkColor();
  }
  else
  {
    double v2 = NTKStandGradientDarkColor();
    double v26 = v2;
    id v4 = NTKExerciseGradientDarkColor();
    uint64_t v27 = v4;
    NTKMoveGradientDarkColor();
  double v8 = };
  long long v28 = v8;
  double v9 = +[NSArray arrayWithObjects:&v26 count:3];

  if (a2)
  {

    double v10 = NTKPausedGradientLightColor();
    uint64_t v23 = v10;
    double v11 = NTKPausedGradientLightColor();
    long long v24 = v11;
    NTKPausedGradientLightColor();
  }
  else
  {

    double v10 = NTKStandGradientLightColor();
    uint64_t v23 = v10;
    double v11 = NTKExerciseGradientLightColor();
    long long v24 = v11;
    NTKMoveGradientLightColor();
  double v12 = };
  uint64_t v25 = v12;
  double v13 = +[NSArray arrayWithObjects:&v23 count:3];

  float v14 = ARUIRingPauseRingsOpacityValue;
  float v15 = ARUIRingEmptyOpacityValueDefault;
  if (a2) {
    float v15 = ARUIRingPauseRingsOpacityValue;
  }
  else {
    float v14 = ARUIRingOpacityValueDefault;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_12920;
  v18[3] = &unk_20C80;
  id v19 = v9;
  id v20 = v13;
  float v21 = v14;
  float v22 = v15;
  id v16 = v13;
  id v17 = v9;
  [v7 enumerateObjectsUsingBlock:v18];
}

void sub_10D08(uint64_t a1)
{
  v37 = [*(id *)(*(void *)(a1 + 32) + 32) text];
  uint64_t v36 = [*(id *)(*(void *)(a1 + 32) + 40) text];
  uint64_t v35 = [*(id *)(*(void *)(a1 + 32) + 48) text];
  double v2 = _ActivityLabelNumberFormatter();
  double v3 = *(void **)(a1 + 32);
  if (v3)
  {
    [v3 _layoutConstants];
    uint64_t v4 = v38;
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = +[NTKActivityDigitalFaceBundle localizedStringForKey:@"ACTIVITY_INVALID_DATA" comment:@"---"];
  double v6 = *(double *)(a1 + 48);
  id v7 = (char *)[*(id *)(a1 + 40) activityMoveMode];
  double v8 = *(void **)(a1 + 40);
  if (v7 == (unsigned char *)&dword_0 + 2)
  {
    [v8 appleMoveTimeTotal];
    double v10 = v9;
  }
  else
  {
    double v11 = [v8 activeEnergyTotal];
    double v12 = +[NTKActivityFaceViewFactory userActiveEnergyUnit];
    [v11 doubleValueForUnit:v12];
    double v10 = floor(v13);
  }
  float v14 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(*(void *)(a1 + 32) + 32) setText:v5];
  }
  else
  {
    float v15 = +[NSNumber numberWithDouble:v6 * v10];
    id v16 = [v2 stringFromNumber:v15];
    [v14 setText:v16];
  }
  uint64_t v17 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    *(void *)(v17 + 168) = v4;
  }
  else
  {
    double v18 = [*(id *)(v17 + 32) text];
    *(void *)(*(void *)(a1 + 32) + 168) = [v18 length];
  }
  [*(id *)(a1 + 40) appleExerciseTimeTotal];
  id v20 = *(void **)(*(void *)(a1 + 32) + 40);
  if (*(unsigned char *)(a1 + 57))
  {
    [*(id *)(*(void *)(a1 + 32) + 40) setText:v5];
  }
  else
  {
    float v21 = +[NSNumber numberWithDouble:v6 * v19];
    float v22 = [v2 stringFromNumber:v21];
    [v20 setText:v22];
  }
  uint64_t v23 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 57))
  {
    *(void *)(v23 + 176) = v4;
  }
  else
  {
    long long v24 = [*(id *)(v23 + 40) text];
    *(void *)(*(void *)(a1 + 32) + 176) = [v24 length];
  }
  id v25 = [*(id *)(a1 + 40) appleStandHoursTotal];
  double v26 = *(void **)(*(void *)(a1 + 32) + 48);
  if (*(unsigned char *)(a1 + 58))
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setText:v5];
  }
  else
  {
    uint64_t v27 = +[NSNumber numberWithDouble:v6 * (double)(uint64_t)v25];
    long long v28 = [v2 stringFromNumber:v27];
    [v26 setText:v28];
  }
  uint64_t v29 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 58))
  {
    *(void *)(v29 + 184) = v4;
  }
  else
  {
    long long v30 = [*(id *)(v29 + 48) text];
    *(void *)(*(void *)(a1 + 32) + 184) = [v30 length];
  }
  id v31 = *(id *)(*(void *)(a1 + 32) + 168);
  if (v31 != [v37 length]
    || (id v32 = *(id *)(*(void *)(a1 + 32) + 176), v32 != [v36 length])
    || (id v33 = *(id *)(*(void *)(a1 + 32) + 184), v33 != [v35 length]))
  {
    __int16 v34 = [*(id *)(a1 + 32) foregroundContainerView];
    [v34 setNeedsLayout];
  }
}

id _ActivityLabelNumberFormatter()
{
  if (qword_29678 != -1) {
    dispatch_once(&qword_29678, &stru_20C58);
  }
  v0 = (void *)qword_29670;

  return v0;
}

void sub_11D4C(id a1)
{
  uint64_t v1 = objc_opt_new();
  double v2 = (void *)qword_29670;
  qword_29670 = v1;

  double v3 = (void *)qword_29670;
  uint64_t v4 = +[NSLocale autoupdatingCurrentLocale];
  [v3 setLocale:v4];

  [(id)qword_29670 setNumberStyle:0];
  id v5 = (void *)qword_29670;

  [v5 setMinimumIntegerDigits:2];
}

void sub_12288(uint64_t a1, uint64_t a2)
{
  double v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v65[0] = &off_21798;
  v65[1] = &off_217B0;
  v66[0] = &off_21EB0;
  v66[1] = &off_21EC0;
  void v65[2] = &off_217C8;
  void v66[2] = &off_21ED0;
  double v3 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];
  [v2 scaledValue:v3 withOverrides:69.0];
  qword_29680 = v4;

  v63[0] = &off_21798;
  v63[1] = &off_217B0;
  v64[0] = &off_21EE0;
  v64[1] = &off_21EF0;
  void v63[2] = &off_217C8;
  void v64[2] = &off_21F00;
  id v5 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:3];
  [v2 scaledValue:v5 withOverrides:31.0];
  qword_29688 = v6;

  v61[0] = &off_21798;
  v61[1] = &off_217B0;
  v62[0] = &off_21F10;
  v62[1] = &off_21F20;
  void v61[2] = &off_217C8;
  void v62[2] = &off_21F30;
  id v7 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:3];
  [v2 scaledValue:v7 withOverrides:36.0];
  qword_29690 = v8;

  unk_29698 = xmmword_19DE0;
  unk_296A8 = xmmword_19DF0;
  unk_296B8 = xmmword_19DE0;
  unk_296C8 = xmmword_19DF0;
  unk_296D8 = xmmword_19E00;
  unk_296E8 = xmmword_19E00;
  unk_29708 = xmmword_19E10;
  v59[0] = &off_21798;
  v59[1] = &off_217C8;
  v60[0] = &off_21F40;
  v60[1] = &off_21F50;
  double v9 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
  [v2 scaledValue:v9 withOverrides:49.0];
  uint64_t v11 = v10;

  v57[0] = &off_21798;
  v57[1] = &off_217C8;
  v58[0] = &off_21F60;
  v58[1] = &off_21F70;
  double v12 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
  [v2 scaledValue:v12 withOverrides:99.5];
  uint64_t v14 = v13;

  qword_296F8 = v14;
  unk_29700 = v11;
  v55[0] = &off_21798;
  v55[1] = &off_217C8;
  v56[0] = &off_21F80;
  v56[1] = &off_21F90;
  float v15 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
  [v2 scaledValue:v15 withOverrides:4.0];
  qword_29718 = v16;

  v54[0] = &off_21FA0;
  v54[1] = &off_21FB0;
  xmmword_29720 = xmmword_19E20;
  v53[2] = &off_217C8;
  void v53[3] = &off_217E0;
  v54[2] = &off_21FC0;
  void v54[3] = &off_21F30;
  v53[0] = &off_21798;
  v53[1] = &off_217B0;
  v53[4] = &off_217F8;
  v53[5] = &off_21810;
  v54[4] = &off_21FD0;
  v54[5] = &off_21FD0;
  v53[6] = &off_21828;
  v53[7] = &off_21840;
  v54[6] = &off_21FE0;
  v54[7] = &off_21FF0;
  uint64_t v17 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:8];
  [v2 scaledValue:v17 withOverrides:30.5];
  uint64_t v19 = v18;

  qword_29740 = v19;
  qword_29748 = 0x3FF8000000000000;
  v51[0] = &off_21798;
  v51[1] = &off_217B0;
  v52[0] = &off_22000;
  v52[1] = &off_22010;
  v51[2] = &off_217C8;
  v52[2] = &off_22020;
  id v20 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];
  [v2 scaledValue:v20 withOverrides:86.0];
  qword_29750 = v21;

  v49[0] = &off_21798;
  v49[1] = &off_217B0;
  v50[0] = &off_22030;
  v50[1] = &off_22040;
  v49[2] = &off_217C8;
  v50[2] = &off_22050;
  float v22 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];
  [v2 scaledValue:v22 withOverrides:9.5];
  qword_29758 = v23;

  v47[0] = &off_21798;
  v47[1] = &off_217C8;
  v48[0] = &off_21F80;
  v48[1] = &off_22060;
  long long v24 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
  [v2 scaledValue:v24 withOverrides:2.5];
  qword_29760 = v25;

  qword_29768 = v19;
  qword_29770 = 0x3FF8000000000000;
  v45[0] = &off_21798;
  v45[1] = &off_217B0;
  v46[0] = &off_22070;
  v46[1] = &off_22080;
  void v45[2] = &off_217C8;
  void v46[2] = &off_22010;
  double v26 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
  [v2 scaledValue:v26 withOverrides:80.5];
  qword_29778 = v27;

  [v2 scaledValue:0 withOverride:9.0 forSizeClass:7.5];
  qword_29780 = v28;
  v43[0] = &off_21798;
  v43[1] = &off_217B0;
  v44[0] = &off_22090;
  v44[1] = &off_22090;
  v43[2] = &off_217C8;
  v44[2] = &off_22060;
  uint64_t v29 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];
  [v2 scaledValue:v29 withOverrides:2.0];
  qword_29788 = v30;

  qword_29790 = v19;
  qword_29798 = 0x3FF8000000000000;
  v41[0] = &off_21798;
  v41[1] = &off_217B0;
  v42[0] = &off_220A0;
  v42[1] = &off_21EC0;
  v41[2] = &off_217C8;
  v42[2] = &off_220B0;
  id v31 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];
  [v2 scaledValue:v31 withOverrides:67.5];
  qword_297A0 = v32;

  v39[0] = &off_21798;
  v39[1] = &off_217B0;
  v40[0] = &off_220C0;
  v40[1] = &off_220D0;
  id v33 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
  [v2 scaledValue:v33 withOverrides:7.5];
  qword_297A8 = v34;

  v37[0] = &off_21798;
  v37[1] = &off_217B0;
  v38[0] = &off_22090;
  v38[1] = &off_22090;
  uint64_t v35 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  [v2 scaledValue:v35 withOverrides:2.0];
  qword_297B0 = v36;

  qword_29730 = 0x3FF8000000000000;
  unk_29738 = 2;
}

void sub_12920(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v10 = a2;
  uint64_t v6 = [v5 objectAtIndexedSubscript:a3];
  [v10 setTopColor:v6];

  id v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  [v10 setBottomColor:v7];

  LODWORD(v8) = *(_DWORD *)(a1 + 48);
  [v10 setTrackOpacity:v8];
  LODWORD(v9) = *(_DWORD *)(a1 + 52);
  [v10 setEmptyOpacity:v9];
}

id sub_129D4()
{
  v0 = (void *)qword_297D0;
  if (qword_297D0)
  {
    return [v0 removeAllObjects];
  }
  else
  {
    qword_297D0 = +[NSMutableDictionary dictionary];
    return (id)_objc_release_x1();
  }
}

void sub_12A40(id a1)
{
  if (!qword_297F0)
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    uint64_t v1 = CLKClearCacheRequestNotification;
    double v2 = +[NSOperationQueue mainQueue];
    uint64_t v3 = [v5 addObserverForName:v1 object:0 queue:v2 usingBlock:&stru_20CC0];
    uint64_t v4 = (void *)qword_297F0;
    qword_297F0 = v3;
  }
}

void sub_12B04(id a1, NSNotification *a2)
{
}

void sub_12B10(id a1, UIGraphicsImageRendererContext *a2)
{
  double v2 = a2;
  uint64_t v3 = +[UIColor colorWithWhite:1.0 alpha:0.250980392];
  [v3 setFill];

  id v5 = [(UIGraphicsImageRendererContext *)v2 format];

  [v5 bounds];
  uint64_t v4 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
  [v4 fill];
}

void sub_1330C(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_29828);
  id WeakRetained = objc_loadWeakRetained(&qword_29830);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_29830);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_29838;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_29830, obj);
  qword_29838 = (uint64_t)[obj version];

  sub_1402C(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_29828);
  long long v10 = unk_29810;
  *(_OWORD *)a2 = xmmword_29800;
  *(_OWORD *)(a2 + 16) = v10;
  *(void *)(a2 + 32) = qword_29820;
}

void sub_13560(uint64_t a1, void *a2, unint64_t a3)
{
  double v4 = *(double *)(a1 + 56);
  double v5 = (double)a3 / *(double *)(a1 + 48);
  double v6 = v5 - v4;
  double v7 = *(double *)(a1 + 64);
  double v8 = 0.0;
  if (v7 > v5 - v4)
  {
    double v9 = v5 + v4;
    double v8 = 1.0;
    if (v7 < v9) {
      double v8 = (v7 - v6) / (v9 - v6);
    }
  }
  double v10 = 1.0 - v8;
  if (v8 <= 0.5) {
    double v10 = v8;
  }
  double v11 = (v10 + v10) * *(double *)(a1 + 96) + 1.0;
  id v12 = a2;
  [v12 setTickScale:v11];
  id v13 = +[NTKFaceColorScheme interpolationFrom:*(void *)(a1 + 32) to:*(void *)(a1 + 40) fraction:512 brightenUnits:v8];
  [v12 setColorScheme:v13];
}

double _RelativeFractionFromOverallFraction(double a1, double a2, double a3)
{
  double result = 0.0;
  if (a1 > a2)
  {
    double result = 1.0;
    if (a1 < a3) {
      return (a1 - a2) / (a3 - a2);
    }
  }
  return result;
}

id sub_13738(uint64_t a1, void *a2)
{
  return [a2 setColorScheme:*(void *)(a1 + 32)];
}

void sub_1402C(uint64_t a1, uint64_t a2)
{
  id v3 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v3 scaledValue:8.0];
  *(void *)&xmmword_29800 = v2;
  *((void *)&xmmword_29800 + 1) = 0x4000000000000000;
  unk_29810 = 12;
  unk_29818 = xmmword_19E40;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return _CATransform3DConcat(retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

uint64_t CLKCompressFraction()
{
  return _CLKCompressFraction();
}

uint64_t CLKFloatEqualsFloat()
{
  return _CLKFloatEqualsFloat();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenFloatsUnclipped()
{
  return _CLKInterpolateBetweenFloatsUnclipped();
}

uint64_t CLKLocaleCurrentNumberSystem()
{
  return _CLKLocaleCurrentNumberSystem();
}

uint64_t CLKLocaleNumberSystemPrefix()
{
  return _CLKLocaleNumberSystemPrefix();
}

uint64_t CLKPixelAlignRectForDevice()
{
  return _CLKPixelAlignRectForDevice();
}

uint64_t CLKRoundForDevice()
{
  return _CLKRoundForDevice();
}

uint64_t CLKSizeCenteredAboutPointForDevice()
{
  return _CLKSizeCenteredAboutPointForDevice();
}

uint64_t CLKSizeIsEmpty()
{
  return _CLKSizeIsEmpty();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NTKActivityBackgroundPlatterColor()
{
  return _NTKActivityBackgroundPlatterColor();
}

uint64_t NTKAllSignatureCircularTypes()
{
  return _NTKAllSignatureCircularTypes();
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKAllSmallComplicationTypes()
{
  return _NTKAllSmallComplicationTypes();
}

uint64_t NTKAllUtilityLargeComplicationTypes()
{
  return _NTKAllUtilityLargeComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKCSecondHandCenterOffset()
{
  return _NTKCSecondHandCenterOffset();
}

uint64_t NTKCircularSmallComplicationDiameter()
{
  return _NTKCircularSmallComplicationDiameter();
}

uint64_t NTKColorFaceViewDeselectedKeylineInnerPadding()
{
  return _NTKColorFaceViewDeselectedKeylineInnerPadding();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKDebugActivityWristRaiseTimeout()
{
  return _NTKDebugActivityWristRaiseTimeout();
}

uint64_t NTKDefaultAppLaunchLocation()
{
  return _NTKDefaultAppLaunchLocation();
}

uint64_t NTKEnumerateComplicationStates()
{
  return _NTKEnumerateComplicationStates();
}

uint64_t NTKExerciseGradientDarkColor()
{
  return _NTKExerciseGradientDarkColor();
}

uint64_t NTKExerciseGradientLightColor()
{
  return _NTKExerciseGradientLightColor();
}

uint64_t NTKExerciseNonGradientTextColor()
{
  return _NTKExerciseNonGradientTextColor();
}

uint64_t NTKGraphicCircularScaledComplicationDiameter()
{
  return _NTKGraphicCircularScaledComplicationDiameter();
}

uint64_t NTKImageNamed()
{
  return _NTKImageNamed();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKIsScreenOn()
{
  return _NTKIsScreenOn();
}

uint64_t NTKKeylineCornerRadiusLarge()
{
  return _NTKKeylineCornerRadiusLarge();
}

uint64_t NTKKeylineCornerRadiusSmall()
{
  return _NTKKeylineCornerRadiusSmall();
}

uint64_t NTKKeylineViewWithContinuousCurveCornerRadius()
{
  return _NTKKeylineViewWithContinuousCurveCornerRadius();
}

uint64_t NTKKeylineWidth()
{
  return _NTKKeylineWidth();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKLaunchApp()
{
  return _NTKLaunchApp();
}

uint64_t NTKMoveGradientDarkColor()
{
  return _NTKMoveGradientDarkColor();
}

uint64_t NTKMoveGradientLightColor()
{
  return _NTKMoveGradientLightColor();
}

uint64_t NTKMoveNonGradientTextColor()
{
  return _NTKMoveNonGradientTextColor();
}

uint64_t NTKMultiFamilyComplicationSlotDescriptor()
{
  return _NTKMultiFamilyComplicationSlotDescriptor();
}

uint64_t NTKPausedGradientDarkColor()
{
  return _NTKPausedGradientDarkColor();
}

uint64_t NTKPausedGradientLightColor()
{
  return _NTKPausedGradientLightColor();
}

uint64_t NTKPausedNonGradientTextColor()
{
  return _NTKPausedNonGradientTextColor();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKShowBlueRidgeUI()
{
  return _NTKShowBlueRidgeUI();
}

uint64_t NTKStandGradientDarkColor()
{
  return _NTKStandGradientDarkColor();
}

uint64_t NTKStandGradientLightColor()
{
  return _NTKStandGradientLightColor();
}

uint64_t NTKStandNonGradientTextColor()
{
  return _NTKStandNonGradientTextColor();
}

uint64_t NTKUtilityComplicationHighlightCornerRadius()
{
  return _NTKUtilityComplicationHighlightCornerRadius();
}

uint64_t NTKUtilityComplicationHighlightPadding()
{
  return _NTKUtilityComplicationHighlightPadding();
}

uint64_t NTKWhistlerSubdialComplicationContentDiameter()
{
  return _NTKWhistlerSubdialComplicationContentDiameter();
}

uint64_t NTKWhistlerSubdialComplicationDiameter()
{
  return _NTKWhistlerSubdialComplicationDiameter();
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

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
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

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

float asinf(float a1)
{
  return _asinf(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

id objc_msgSend_CLKFontWithMonospacedNumbers(void *a1, const char *a2, ...)
{
  return [a1 CLKFontWithMonospacedNumbers];
}

id objc_msgSend__activate(void *a1, const char *a2, ...)
{
  return [a1 _activate];
}

id objc_msgSend__addOrRemoveChronoViewsIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _addOrRemoveChronoViewsIfNecessary];
}

id objc_msgSend__allRings(void *a1, const char *a2, ...)
{
  return [a1 _allRings];
}

id objc_msgSend__applyCurrentRingLayout(void *a1, const char *a2, ...)
{
  return [a1 _applyCurrentRingLayout];
}

id objc_msgSend__canonicalDataModel(void *a1, const char *a2, ...)
{
  return [a1 _canonicalDataModel];
}

id objc_msgSend__cleanUpAfterDetailEditing(void *a1, const char *a2, ...)
{
  return [a1 _cleanUpAfterDetailEditing];
}

id objc_msgSend__colorComplicationSlots(void *a1, const char *a2, ...)
{
  return [a1 _colorComplicationSlots];
}

id objc_msgSend__computeArcFrame(void *a1, const char *a2, ...)
{
  return [a1 _computeArcFrame];
}

id objc_msgSend__configureAppropriateChronoDetail(void *a1, const char *a2, ...)
{
  return [a1 _configureAppropriateChronoDetail];
}

id objc_msgSend__configureForDetailEditing(void *a1, const char *a2, ...)
{
  return [a1 _configureForDetailEditing];
}

id objc_msgSend__createActivityRelatedUIs(void *a1, const char *a2, ...)
{
  return [a1 _createActivityRelatedUIs];
}

id objc_msgSend__createTimeViewIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _createTimeViewIfNecessary];
}

id objc_msgSend__dateLabelFont(void *a1, const char *a2, ...)
{
  return [a1 _dateLabelFont];
}

id objc_msgSend__deactivate(void *a1, const char *a2, ...)
{
  return [a1 _deactivate];
}

id objc_msgSend__highlightImage(void *a1, const char *a2, ...)
{
  return [a1 _highlightImage];
}

id objc_msgSend__layoutConstants(void *a1, const char *a2, ...)
{
  return [a1 _layoutConstants];
}

id objc_msgSend__loadChronoViewsIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _loadChronoViewsIfNecessary];
}

id objc_msgSend__loadCurrentDataModel(void *a1, const char *a2, ...)
{
  return [a1 _loadCurrentDataModel];
}

id objc_msgSend__loadDialIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _loadDialIfNecessary];
}

id objc_msgSend__loadRingsViewIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _loadRingsViewIfNecessary];
}

id objc_msgSend__newActivityLabelSubview(void *a1, const char *a2, ...)
{
  return [a1 _newActivityLabelSubview];
}

id objc_msgSend__newRingsQuad(void *a1, const char *a2, ...)
{
  return [a1 _newRingsQuad];
}

id objc_msgSend__removeActivityRelatedUIs(void *a1, const char *a2, ...)
{
  return [a1 _removeActivityRelatedUIs];
}

id objc_msgSend__resetWristRaiseAnimationTimeout(void *a1, const char *a2, ...)
{
  return [a1 _resetWristRaiseAnimationTimeout];
}

id objc_msgSend__updateCurrentRingLayoutIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _updateCurrentRingLayoutIfNecessary];
}

id objc_msgSend__updatePausedState(void *a1, const char *a2, ...)
{
  return [a1 _updatePausedState];
}

id objc_msgSend__updateTimeViewSecondsDisplayState(void *a1, const char *a2, ...)
{
  return [a1 _updateTimeViewSecondsDisplayState];
}

id objc_msgSend__updateTransform(void *a1, const char *a2, ...)
{
  return [a1 _updateTransform];
}

id objc_msgSend__utilityComplicationSlots(void *a1, const char *a2, ...)
{
  return [a1 _utilityComplicationSlots];
}

id objc_msgSend_accuracy(void *a1, const char *a2, ...)
{
  return [a1 accuracy];
}

id objc_msgSend_activeEnergyCompletionPercentage(void *a1, const char *a2, ...)
{
  return [a1 activeEnergyCompletionPercentage];
}

id objc_msgSend_activeEnergyGoal(void *a1, const char *a2, ...)
{
  return [a1 activeEnergyGoal];
}

id objc_msgSend_activeEnergyTotal(void *a1, const char *a2, ...)
{
  return [a1 activeEnergyTotal];
}

id objc_msgSend_activityMoveMode(void *a1, const char *a2, ...)
{
  return [a1 activityMoveMode];
}

id objc_msgSend_activityTickColor(void *a1, const char *a2, ...)
{
  return [a1 activityTickColor];
}

id objc_msgSend_animating(void *a1, const char *a2, ...)
{
  return [a1 animating];
}

id objc_msgSend_appleExerciseTimeCompletionPercentage(void *a1, const char *a2, ...)
{
  return [a1 appleExerciseTimeCompletionPercentage];
}

id objc_msgSend_appleExerciseTimeGoal(void *a1, const char *a2, ...)
{
  return [a1 appleExerciseTimeGoal];
}

id objc_msgSend_appleExerciseTimeTotal(void *a1, const char *a2, ...)
{
  return [a1 appleExerciseTimeTotal];
}

id objc_msgSend_appleMoveTimeCompletionPercentage(void *a1, const char *a2, ...)
{
  return [a1 appleMoveTimeCompletionPercentage];
}

id objc_msgSend_appleMoveTimeTotal(void *a1, const char *a2, ...)
{
  return [a1 appleMoveTimeTotal];
}

id objc_msgSend_appleStandHourCompletionPercentage(void *a1, const char *a2, ...)
{
  return [a1 appleStandHourCompletionPercentage];
}

id objc_msgSend_appleStandHoursGoal(void *a1, const char *a2, ...)
{
  return [a1 appleStandHoursGoal];
}

id objc_msgSend_appleStandHoursTotal(void *a1, const char *a2, ...)
{
  return [a1 appleStandHoursTotal];
}

id objc_msgSend_arcLayer(void *a1, const char *a2, ...)
{
  return [a1 arcLayer];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentLocale];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clearSharedCaches(void *a1, const char *a2, ...)
{
  return [a1 clearSharedCaches];
}

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return [a1 closePath];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_complicationFactory(void *a1, const char *a2, ...)
{
  return [a1 complicationFactory];
}

id objc_msgSend_complicationType(void *a1, const char *a2, ...)
{
  return [a1 complicationType];
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

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDataModel(void *a1, const char *a2, ...)
{
  return [a1 currentDataModel];
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

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
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

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_drawableSize(void *a1, const char *a2, ...)
{
  return [a1 drawableSize];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_faceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 faceColorPalette];
}

id objc_msgSend_faceViewFactory(void *a1, const char *a2, ...)
{
  return [a1 faceViewFactory];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return [a1 fill];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_foregroundColor(void *a1, const char *a2, ...)
{
  return [a1 foregroundColor];
}

id objc_msgSend_foregroundContainerView(void *a1, const char *a2, ...)
{
  return [a1 foregroundContainerView];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_formattingManager(void *a1, const char *a2, ...)
{
  return [a1 formattingManager];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_hasTapAction(void *a1, const char *a2, ...)
{
  return [a1 hasTapAction];
}

id objc_msgSend_highlightImageView(void *a1, const char *a2, ...)
{
  return [a1 highlightImageView];
}

id objc_msgSend_idealizedModel(void *a1, const char *a2, ...)
{
  return [a1 idealizedModel];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isMulticolor(void *a1, const char *a2, ...)
{
  return [a1 isMulticolor];
}

id objc_msgSend_isWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 isWhiteColor];
}

id objc_msgSend_keylinePadding(void *a1, const char *a2, ...)
{
  return [a1 keylinePadding];
}

id objc_msgSend_kilocalorieUnit(void *a1, const char *a2, ...)
{
  return [a1 kilocalorieUnit];
}

id objc_msgSend_launchActivityApp(void *a1, const char *a2, ...)
{
  return [a1 launchActivityApp];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return [a1 lineHeight];
}

id objc_msgSend_lockedModel(void *a1, const char *a2, ...)
{
  return [a1 lockedModel];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_origin(void *a1, const char *a2, ...)
{
  return [a1 origin];
}

id objc_msgSend_paused(void *a1, const char *a2, ...)
{
  return [a1 paused];
}

id objc_msgSend_performWristRaiseAnimation(void *a1, const char *a2, ...)
{
  return [a1 performWristRaiseAnimation];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_prelaunchApplicationIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 prelaunchApplicationIdentifiers];
}

id objc_msgSend_prepareWristRaiseAnimation(void *a1, const char *a2, ...)
{
  return [a1 prepareWristRaiseAnimation];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_primaryShiftedColor(void *a1, const char *a2, ...)
{
  return [a1 primaryShiftedColor];
}

id objc_msgSend_punctuationCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 punctuationCharacterSet];
}

id objc_msgSend_referenceFrame(void *a1, const char *a2, ...)
{
  return [a1 referenceFrame];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_rightTimeViewInset(void *a1, const char *a2, ...)
{
  return [a1 rightTimeViewInset];
}

id objc_msgSend_ringGroups(void *a1, const char *a2, ...)
{
  return [a1 ringGroups];
}

id objc_msgSend_rings(void *a1, const char *a2, ...)
{
  return [a1 rings];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
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

id objc_msgSend_sharedModel(void *a1, const char *a2, ...)
{
  return [a1 sharedModel];
}

id objc_msgSend_sharedRingsViewRenderer(void *a1, const char *a2, ...)
{
  return [a1 sharedRingsViewRenderer];
}

id objc_msgSend_shiftedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 shiftedBackgroundColor];
}

id objc_msgSend_shiftedForegroundColor(void *a1, const char *a2, ...)
{
  return [a1 shiftedForegroundColor];
}

id objc_msgSend_shouldPerformFromZeroWristRaise(void *a1, const char *a2, ...)
{
  return [a1 shouldPerformFromZeroWristRaise];
}

id objc_msgSend_showSeconds(void *a1, const char *a2, ...)
{
  return [a1 showSeconds];
}

id objc_msgSend_showsCanonicalContent(void *a1, const char *a2, ...)
{
  return [a1 showsCanonicalContent];
}

id objc_msgSend_showsLockedContent(void *a1, const char *a2, ...)
{
  return [a1 showsLockedContent];
}

id objc_msgSend_showsLockedUI(void *a1, const char *a2, ...)
{
  return [a1 showsLockedUI];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return [a1 systemOrangeColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_thickness(void *a1, const char *a2, ...)
{
  return [a1 thickness];
}

id objc_msgSend_tickLayer(void *a1, const char *a2, ...)
{
  return [a1 tickLayer];
}

id objc_msgSend_timeOffset(void *a1, const char *a2, ...)
{
  return [a1 timeOffset];
}

id objc_msgSend_timeScrubbing(void *a1, const char *a2, ...)
{
  return [a1 timeScrubbing];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return [a1 uniqueId];
}

id objc_msgSend_unitManager(void *a1, const char *a2, ...)
{
  return [a1 unitManager];
}

id objc_msgSend_userActiveEnergyBurnedUnit(void *a1, const char *a2, ...)
{
  return [a1 userActiveEnergyBurnedUnit];
}

id objc_msgSend_userActiveEnergyIsCalories(void *a1, const char *a2, ...)
{
  return [a1 userActiveEnergyIsCalories];
}

id objc_msgSend_userActiveEnergyUnit(void *a1, const char *a2, ...)
{
  return [a1 userActiveEnergyUnit];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}