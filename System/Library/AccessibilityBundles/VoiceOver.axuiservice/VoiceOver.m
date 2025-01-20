id sub_376C(uint64_t a1)
{
  void *v1;
  long long v2;
  _OWORD v4[3];

  v1 = *(void **)(*(void *)(a1 + 32) + 40);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

id sub_37B8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 50) = 0;
  if (*(unsigned char *)(a1 + 96))
  {
    double v1 = *(double *)(a1 + 40);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    long long v2 = *(_OWORD *)(a1 + 64);
    long long v8 = *(_OWORD *)(a1 + 48);
    long long v9 = v2;
    v6[2] = sub_38C4;
    v6[3] = &unk_3D198;
    uint64_t v7 = *(void *)(a1 + 32);
    long long v10 = *(_OWORD *)(a1 + 80);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_3910;
    v5[3] = &unk_3D1C0;
    v5[4] = v7;
    return +[UIView animateWithDuration:v6 animations:v5 completion:v1];
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    return _[v4 _updateSelectedMarker];
  }
}

id sub_38C4(uint64_t a1)
{
  double v1 = *(void **)(*(void *)(a1 + 32) + 40);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

id sub_3910(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _updateSelectedMarker];
}

void sub_3A48(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  id v3 = a2;
  [v3 setImage:v2];
  [v3 sizeToFit];
  [v3 removeFromSuperview];
}

void sub_51B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
}

uint64_t sub_51D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_51E8(uint64_t a1)
{
}

id sub_51F0(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) updateStyling];
}

id sub_5200(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "_traitCollectionDidChange:");
}

void sub_6384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_63AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleVoiceOverCaptionPanelViewController];
}

id sub_63EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _toggleVoiceOverCaptionPanelViewController];
}

id *sub_767C(id *result, int a2)
{
  if (a2) {
    return (id *)objc_msgSend(result[4], "_updateCursorWithFrame:pathData:animate:displayID:", result[5], *((unsigned __int8 *)result + 88), result[6], *((double *)result + 7), *((double *)result + 8), *((double *)result + 9), *((double *)result + 10));
  }
  return result;
}

id sub_86CC(void *a1)
{
  id v1 = a1;
  unint64_t v2 = (unint64_t)[v1 count];
  if (v2)
  {
    _AXAssert();
    id v3 = 0;
  }
  else
  {
    id v3 = +[NSMutableArray arrayWithCapacity:v2 >> 1];
    if (v2)
    {
      for (unint64_t i = 0; i < v2; i += 2)
      {
        v5 = [v1 objectAtIndexedSubscript:i];
        [v5 doubleValue];
        double v7 = v6;

        long long v8 = [v1 objectAtIndexedSubscript:i + 1];
        [v8 doubleValue];
        double v10 = v9;

        v11 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v7, v10);
        [v3 addObject:v11];
      }
    }
  }

  return v3;
}

id sub_9F94(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeCursorViewControllers];
  [*(id *)(a1 + 32) _removeScreenCurtainControllers];
  [*(id *)(a1 + 32) _removeBrailleViewController];
  [*(id *)(a1 + 32) _removeMapsExplorationViewController];
  [*(id *)(a1 + 32) _removeCaptionPanelViewControllers];
  [*(id *)(a1 + 32) _removeElementVisualizationViewController];
  [*(id *)(a1 + 32) _removeRotorViewControllers];
  [*(id *)(a1 + 32) _removeItemChooserController];
  unint64_t v2 = *(void **)(a1 + 32);

  return [v2 _handleHideVoiceOverWarning:0];
}

id sub_ADF8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:0.0];
}

void sub_AF90(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) _circleViewForDotNumber:*(void *)(a1 + 40)];
  [v2 setAlpha:0.5];

  id v3 = [*(id *)(a1 + 32) _highlightedCircleViewForDotNumber:*(void *)(a1 + 40)];
  [v3 setAlpha:0.0];
}

void sub_B158(id a1)
{
  id v1 = +[UIScreen mainScreen];
  [v1 scale];
  CGFloat v3 = v2;
  v12.width = 82.0;
  v12.height = 82.0;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v3);

  v4 = +[UIColor whiteColor];
  [v4 set];

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, 1.0);
  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0, 41.0, 41.0, 40.0, 0.0, 6.28318531);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 stroke];
  uint64_t v6 = UIGraphicsGetImageFromCurrentImageContext();
  double v7 = (void *)qword_4BE90;
  qword_4BE90 = v6;

  [v10 fill];
  uint64_t v8 = UIGraphicsGetImageFromCurrentImageContext();
  double v9 = (void *)qword_4BE98;
  qword_4BE98 = v8;

  UIGraphicsEndImageContext();
}

void sub_C8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_C95C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_4BEB0)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_CAA0;
    v3[4] = &unk_3D378;
    v3[5] = v3;
    long long v4 = off_3D360;
    uint64_t v5 = 0;
    qword_4BEB0 = _sl_dlopen();
    if (!qword_4BEB0)
    {
      abort_report_np();
LABEL_8:
      sub_27708();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AXMVisionFeature");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_4BEA8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_CAA0()
{
  uint64_t result = _sl_dlopen();
  qword_4BEB0 = result;
  return result;
}

void sub_CF58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
}

uint64_t sub_CF78(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_CF88(uint64_t a1)
{
}

id sub_CF90(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNeedsDisplay];
}

id sub_CFA0(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "_traitCollectionDidChange:");
}

id sub_D24C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_D2E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(*(void *)(a1 + 32) + 56)];
}

id sub_D524(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t sub_D538(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_DA08(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = [*(id *)(a1 + 32) layer];
  double v9 = [v8 sublayers];
  id v10 = [v9 objectAtIndexedSubscript:a3];

  v11 = [*(id *)(a1 + 32) layer];
  [v11 bounds];
  objc_msgSend(v10, "setBounds:");

  CGSize v12 = [*(id *)(a1 + 32) layer];
  [v12 bounds];
  UIRectGetCenter();
  objc_msgSend(v10, "setPosition:");

  id v28 = v7;
  objc_msgSend(v10, "setPath:", objc_msgSend(v28, "CGPath"));
  [*(id *)(a1 + 32) lineWidth];
  double v14 = 2.0;
  if (!*(unsigned char *)(a1 + 48)) {
    double v14 = 0.0;
  }
  [v10 setLineWidth:v13 + v14];
  objc_msgSend(v10, "setFillColor:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "CGColor"));
  v15 = [*(id *)(a1 + 32) traitCollection];
  if ([v15 userInterfaceStyle] == (char *)&dword_0 + 1) {
    +[UIColor whiteColor];
  }
  else {
  id v16 = +[UIColor blackColor];
  }
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v16, "CGColor"));

  v17 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 48))
  {
    v18 = [v17 objectAtIndexedSubscript:a3];
    uint64_t v19 = a3 + 1;
  }
  else
  {
    uint64_t v19 = a3 + 1;
    v18 = [v17 objectAtIndexedSubscript:v19];
  }
  v20 = [*(id *)(a1 + 32) layer];
  v21 = [v20 sublayers];
  v22 = [v21 objectAtIndexedSubscript:v19];

  v23 = [*(id *)(a1 + 32) layer];
  [v23 bounds];
  objc_msgSend(v22, "setBounds:");

  v24 = [*(id *)(a1 + 32) layer];
  [v24 bounds];
  UIRectGetCenter();
  objc_msgSend(v22, "setPosition:");

  id v25 = v18;
  objc_msgSend(v22, "setPath:", objc_msgSend(v25, "CGPath"));
  [*(id *)(a1 + 32) lineWidth];
  objc_msgSend(v22, "setLineWidth:");
  objc_msgSend(v22, "setFillColor:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "CGColor"));
  v26 = [*(id *)(a1 + 32) traitCollection];
  if ([v26 userInterfaceStyle] == (char *)&dword_0 + 1) {
    +[UIColor blackColor];
  }
  else {
  id v27 = +[UIColor whiteColor];
  }
  objc_msgSend(v22, "setStrokeColor:", objc_msgSend(v27, "CGColor"));

  *a4 = 1;
}

id sub_E8B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id sub_E8B8(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  LOBYTE(a2) = *(unsigned char *)(v3 + 33);
  uint64_t v4 = 48;
  [*(id *)(v3 + 48) setAlpha:(double)*(unint64_t *)&a2];
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = 0.0;
  if (!*(unsigned char *)(v5 + 33)) {
    double v6 = 1.0;
  }
  [*(id *)(v5 + 40) setAlpha:v6];
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v7 + 33)) {
    uint64_t v4 = 40;
  }
  [*(id *)(v7 + v4) setText:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + v4) sizeToFit];
  *(unsigned char *)(*(void *)(a1 + 32) + 33) ^= 1u;
  uint64_t v8 = *(void **)(a1 + 32);

  return [v8 layoutIfNeeded];
}

id sub_EA40(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void sub_F524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_F550(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _traitCollectionDidChange:v4];
}

void sub_10168(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSMutableAttributedString);
  if (*(void *)(a1 + 32)) {
    CFStringRef v3 = *(const __CFString **)(a1 + 32);
  }
  else {
    CFStringRef v3 = &stru_3F588;
  }
  id v8 = [v2 initWithString:v3];
  id v4 = +[UIColor whiteColor];
  objc_msgSend(v8, "addAttribute:value:range:", NSForegroundColorAttributeName, v4, 0, objc_msgSend(*(id *)(a1 + 40), "length"));

  uint64_t v5 = [*(id *)(a1 + 48) captionPanelText];
  double v6 = [v5 font];
  objc_msgSend(v8, "addAttribute:value:range:", NSFontAttributeName, v6, 0, objc_msgSend(*(id *)(a1 + 40), "length"));

  objc_msgSend(v8, "addAttribute:value:range:", NSParagraphStyleAttributeName, *(void *)(a1 + 56), 0, objc_msgSend(*(id *)(a1 + 40), "length"));
  uint64_t v7 = [*(id *)(a1 + 48) captionPanelText];
  [v7 setAttributedText:v8];
}

id sub_102B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _animateTextBack:1];
}

void sub_102C0(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) scrollView];
  objc_msgSend(v2, "setContentOffset:", v1, 0.0);
}

void sub_1056C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_105A4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) scrollView];
  objc_msgSend(v1, "setContentOffset:", 0.0, 0.0);
}

void sub_105F0(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (!a2 && WeakRetained)
  {
    double v6 = (void *)*((void *)WeakRetained + 3);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_106C8;
    v7[3] = &unk_3D288;
    objc_copyWeak(&v8, v3);
    [v6 afterDelay:v7 processBlock:1.0];
    objc_destroyWeak(&v8);
  }
}

void sub_106B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_106C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _animateTextBack:0];
}

void sub_1070C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained scrollView];
  objc_msgSend(v2, "setContentOffset:", *(double *)(a1 + 40), 0.0);
}

void sub_10E4C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) currentRotaryView];
  [v1 setAlpha:0.0];
}

void sub_10E94(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) currentLocationView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

id sub_10F00(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) currentLocationView];
  [v2 alpha];
  double v4 = v3;

  if (v4 == 0.0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_11018;
    v7[3] = &unk_3D2B0;
    void v7[4] = *(void *)(a1 + 32);
    +[UIView animateWithDuration:v7 animations:0.2];
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_11060;
  v6[3] = &unk_3D2B0;
  void v6[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v6 animations:0.2];
}

void sub_11018(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) currentLocationView];
  [v1 setAlpha:1.0];
}

void sub_11060(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) currentRotaryView];
  [v1 setAlpha:1.0];
}

id sub_11DA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.300000012];
}

id sub_11DB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.800000012];
}

void sub_11F48(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) curtainView];
  [v1 setAlpha:0.0];
}

void sub_11F90(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) curtainView];
  [v1 setAlpha:1.0];
}

void sub_12584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

id sub_1259C(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) curtainView];
  [v2 setAlpha:1.0];

  double v3 = *(void **)(a1 + 32);

  return [v3 _updateScreenCurtainForInvertColors:0];
}

uint64_t sub_125F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_12600(uint64_t a1)
{
}

void *sub_12608(void *result, uint64_t a2)
{
  if (a2 == 6)
  {
    double v2 = result;
    uint64_t result = [*(id *)(*(void *)(result[4] + 8) + 40) enabled];
    if (result)
    {
      [*(id *)(*(void *)(v2[4] + 8) + 40) setEnabled:0 animate:0];
      return (void *)AXPerformBlockOnMainThreadAfterDelay();
    }
  }
  return result;
}

id sub_126C4(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setEnabled:1 animate:1];
}

id sub_126DC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) setScreenshotActionHandlerIdentifier:a2];
}

id sub_126E8(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _updateScreenCurtainForInvertColors:0];
}

id sub_13024(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t sub_13030(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_13184(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t sub_13190(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_13F68(id a1)
{
  id v1 = +[NSBundle bundleWithPath:@"/System/Library/AccessibilityBundles/GAXClient.bundle"];
  double v2 = v1;
  if (v1)
  {
    id v16 = 0;
    unsigned __int8 v3 = [v1 loadAndReturnError:&v16];
    double v4 = v16;
    if (v3) {
      goto LABEL_14;
    }
    id v5 = +[AXSubsystemVoiceOver sharedInstance];
    unsigned __int8 v6 = [v5 ignoreLogging];

    if (v6) {
      goto LABEL_14;
    }
    uint64_t v7 = +[AXSubsystemVoiceOver identifier];
    id v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_13;
    }
    id v10 = AXColorizeFormatLog();
    v11 = _AXStringForArgs();
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_log_impl(&dword_0, v8, v9, "%{public}@", buf, 0xCu);
    }

LABEL_12:
LABEL_13:

    goto LABEL_14;
  }
  CGSize v12 = +[AXSubsystemVoiceOver sharedInstance];
  unsigned __int8 v13 = [v12 ignoreLogging];

  if ((v13 & 1) == 0)
  {
    double v14 = +[AXSubsystemVoiceOver identifier];
    double v4 = AXLoggerForFacility();

    os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
    if (!os_log_type_enabled(v4, v15))
    {
LABEL_14:

      goto LABEL_15;
    }
    id v8 = AXColorizeFormatLog();
    id v10 = _AXStringForArgs();
    if (os_log_type_enabled(v4, v15))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      _os_log_impl(&dword_0, v4, v15, "%{public}@", buf, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_15:
}

uint64_t sub_145BC(uint64_t a1)
{
  double v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "objectAtIndex:");
  uint64_t v3 = [v2 containsObject:*(void *)(a1 + 40)] ^ 1;

  return v3;
}

BOOL sub_1460C(id a1, id a2)
{
  return _[a2 isAccessibilityElement];
}

void sub_146F4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

id sub_1473C(uint64_t a1)
{
  v11[0] = @"row";
  double v2 = +[NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 112)];
  v11[1] = @"activate";
  v12[0] = v2;
  uint64_t v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 120)];
  v12[1] = v3;
  double v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  UIAccessibilityPostNotification(0x7EAu, v4);

  [*(id *)(*(void *)(a1 + 32) + 16) resignFirstResponder];
  [*(id *)(*(void *)(a1 + 32) + 16) setText:&stru_3F588];
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  uint64_t v5 = *(void *)(a1 + 32);
  unsigned __int8 v6 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = 0;

  uint64_t v7 = [*(id *)(a1 + 32) delegate];
  [v7 closeItemChooser:*(void *)(a1 + 32)];

  [*(id *)(*(void *)(a1 + 32) + 168) invalidate];
  uint64_t v8 = *(void *)(a1 + 32);
  os_log_type_t v9 = *(void **)(v8 + 168);
  *(void *)(v8 + 168) = 0;

  return [*(id *)(a1 + 32) _updateGuidedAccessWindowId:0];
}

BOOL sub_14A3C(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 lowercaseString];
  BOOL v4 = [v3 rangeOfString:*(void *)(*(void *)(a1 + 32) + 104)] == (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

void sub_14E6C(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  if ([v12 length])
  {
    uint64_t v5 = [v12 substringToIndex:1];
    unsigned __int8 v6 = [v5 uppercaseString];

    uint64_t v7 = +[NSCharacterSet letterCharacterSet];
    unsigned __int8 v8 = objc_msgSend(v7, "characterIsMember:", -[__CFString characterAtIndex:](v6, "characterAtIndex:", 0));

    if ((v8 & 1) == 0)
    {

      unsigned __int8 v6 = @"#";
    }
    id v9 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v6];
    if (!v9)
    {
      id v9 = [objc_allocWithZone((Class)NSMutableArray) init];
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:v9 forKey:v6];
    }
    id v10 = +[NSNumber numberWithInteger:a3];
    v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v12, v10, 0);
    [v9 addObject:v11];
  }
}

int64_t sub_14FD4(id a1, id a2, id a3)
{
  return (int64_t)_[a2 localizedCaseInsensitiveCompare:a3];
}

void sub_14FDC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

void sub_15024(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    double v2 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v2 localizedStringForKey:@"VoiceOverItemChooser" value:&stru_3F588 table:@"VoiceOverUIService"];

    uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v4 = [v3 localizedStringForKey:@"item.count" value:&stru_3F588 table:@"VoiceOverUIService"];
    uint64_t v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, *(void *)(a1 + 40));

    unsigned __int8 v6 = __UIAXStringForVariables();
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, *(id *)(*(void *)(a1 + 32) + 16));
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v6);
  }
}

void sub_151A8(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = +[UIColor clearColor];
  [v1 setIndexBackgroundColor:v2];
}

id sub_15388(uint64_t a1)
{
  CGRect v10 = CGRectIntegral(*(CGRect *)(a1 + 40));
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  double height = v10.size.height;
  unsigned __int8 v6 = [*(id *)(a1 + 32) view];
  objc_msgSend(v6, "setFrame:", x, y, width, height);

  CGRect v11 = CGRectIntegral(*(CGRect *)(a1 + 40));
  id v7 = *(void **)(*(void *)(a1 + 32) + 128);

  return objc_msgSend(v7, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
}

uint64_t sub_16224(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(v2 + 32) = 3;
  *(void *)(v2 + 40) = 0;
  *(void *)(v2 + 48) = 0;
  *(unsigned char *)(v2 + 56) = 0;
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 72) = 0;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  uint64_t v3 = type metadata accessor for Number();
  uint64_t v4 = swift_allocObject();
  *(_WORD *)(v4 + 32) = 257;
  *(void *)(v4 + 16) = 50;
  *(void *)(v4 + 24) = 0xE100000000000000;
  *(void *)(v4 + 40) = 0;
  *(void *)(v4 + 48) = 0;
  uint64_t v9 = v3;
  CGRect v10 = &off_3EA10;
  *(void *)&long long v8 = v4;
  type metadata accessor for LatexToMathMLTree();
  uint64_t v5 = swift_allocObject();
  sub_16A44(&qword_4ADD0);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2E0F0;
  sub_16A88(&v8, v6 + 32);
  *(void *)(v5 + 16) = v6;
  *(void *)(v2 + 48) = v5;
  swift_release();
  return v2;
}

uint64_t sub_16308()
{
  uint64_t v1 = *(void *)(v0 + 48);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 40);
    if (v2)
    {
      swift_beginAccess();
      if (*(void *)(*(void *)(v2 + 16) + 16))
      {
        swift_beginAccess();
        if (*(void *)(*(void *)(v1 + 16) + 16))
        {
          swift_retain();
          swift_retain();
          uint64_t v3 = sub_238D0();
          uint64_t v5 = sub_238D0();
          swift_beginAccess();
          uint64_t v6 = *(void *)(v3 + 16);
          if (*(void *)(v6 + 16) != 1) {
            goto LABEL_14;
          }
          sub_16B04(v6 + 32, (uint64_t)v31);
          uint64_t v8 = v32;
          uint64_t v7 = v33;
          sub_16B68(v31, v32);
          uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)(v7 + 8) + 8))(v8);
          uint64_t v11 = v10;
          uint64_t v34 = 2;
          if (v9 == sub_27D10() && v11 == v12)
          {
            swift_bridgeObjectRelease_n();
            sub_16BAC((uint64_t)v31);
          }
          else
          {
            char v14 = sub_27D20();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_16BAC((uint64_t)v31);
            if ((v14 & 1) == 0)
            {
LABEL_14:
              strcpy((char *)v35, "<mroot><mrow>");
              HIWORD(v35[1]) = -4864;
              swift_beginAccess();
              uint64_t v15 = *(void *)(v5 + 16);
              uint64_t v16 = *(void *)(v15 + 16);
              if (v16)
              {
                uint64_t v17 = v15 + 32;
                swift_bridgeObjectRetain();
                do
                {
                  sub_16B04(v17, (uint64_t)v31);
                  uint64_t v19 = v32;
                  uint64_t v18 = v33;
                  sub_16B68(v31, v32);
                  v36._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v18 + 16) + 8))(v19);
                  sub_27B80(v36);
                  swift_bridgeObjectRelease();
                  sub_16BAC((uint64_t)v31);
                  v17 += 40;
                  --v16;
                }
                while (v16);
                swift_bridgeObjectRelease();
              }
              v37._countAndFlagsBits = 0x3C3E776F726D2F3CLL;
              v37._object = (void *)0xED00003E776F726DLL;
              sub_27B80(v37);
              uint64_t v20 = *(void *)(v3 + 16);
              uint64_t v21 = *(void *)(v20 + 16);
              if (v21)
              {
                uint64_t v22 = v20 + 32;
                swift_bridgeObjectRetain();
                do
                {
                  sub_16B04(v22, (uint64_t)v31);
                  uint64_t v24 = v32;
                  uint64_t v23 = v33;
                  sub_16B68(v31, v32);
                  v38._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v23 + 16) + 8))(v24);
                  sub_27B80(v38);
                  swift_bridgeObjectRelease();
                  sub_16BAC((uint64_t)v31);
                  v22 += 40;
                  --v21;
                }
                while (v21);
                swift_bridgeObjectRelease();
              }
              v25._countAndFlagsBits = 0x3C3E776F726D2F3CLL;
              v25._object = (void *)0xEF3E746F6F726D2FLL;
LABEL_29:
              sub_27B80(v25);
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              return v35[0];
            }
          }
          strcpy((char *)v35, "<msqrt>");
          v35[1] = 0xE700000000000000;
          swift_beginAccess();
          uint64_t v26 = *(void *)(v5 + 16);
          uint64_t v27 = *(void *)(v26 + 16);
          if (v27)
          {
            uint64_t v28 = v26 + 32;
            swift_bridgeObjectRetain();
            do
            {
              sub_16B04(v28, (uint64_t)v31);
              uint64_t v30 = v32;
              uint64_t v29 = v33;
              sub_16B68(v31, v32);
              v39._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v29 + 16) + 8))(v30);
              sub_27B80(v39);
              swift_bridgeObjectRelease();
              sub_16BAC((uint64_t)v31);
              v28 += 40;
              --v27;
            }
            while (v27);
            swift_bridgeObjectRelease();
          }
          v25._countAndFlagsBits = 0x3E747271736D2F3CLL;
          v25._object = (void *)0xE800000000000000;
          goto LABEL_29;
        }
      }
    }
  }
  return 0;
}

uint64_t sub_16810()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for Radical()
{
  return self;
}

uint64_t sub_1688C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_168C0()
{
  return *(unsigned __int8 *)(*(void *)v0 + 32);
}

uint64_t sub_168CC()
{
  return *(unsigned __int8 *)(*(void *)v0 + 56);
}

uint64_t sub_168D8()
{
  return swift_retain();
}

uint64_t sub_168E4(uint64_t a1)
{
  sub_1698C(a1);

  return swift_release();
}

uint64_t sub_16920()
{
  return swift_retain();
}

uint64_t sub_1692C(uint64_t a1)
{
  sub_169E8(a1);

  return swift_release();
}

uint64_t sub_16968()
{
  return sub_16308();
}

uint64_t sub_1698C(uint64_t a1)
{
  *(void *)(v1 + 64) = a1;
  swift_retain();
  uint64_t result = swift_release();
  if ((*(unsigned char *)(v1 + 56) & 1) == 0)
  {
    *(void *)(v1 + 64) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_169E8(uint64_t a1)
{
  *(void *)(v1 + 72) = a1;
  swift_retain();
  uint64_t result = swift_release();
  if ((*(unsigned char *)(v1 + 56) & 1) == 0)
  {
    *(void *)(v1 + 72) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_16A44(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_16A88(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t *sub_16AA0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_16B04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_16B68(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_16BAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t VOTNemethTranslatingError.rawValue.getter(char a1)
{
  unint64_t result = 0xD00000000000001ALL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000029;
      break;
    case 2:
      unint64_t result = 0xD000000000000025;
      break;
    case 3:
      unint64_t result = 0xD000000000000023;
      break;
    case 4:
      unint64_t result = 0xD000000000000021;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_16C9C(unsigned __int8 *a1, char *a2)
{
  return sub_16CA8(*a1, *a2);
}

uint64_t sub_16CA8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD00000000000001ALL;
  unint64_t v3 = 0x8000000000037B00;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD00000000000001ALL;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000029;
      uint64_t v6 = "An invalid configuration was encountered.";
      goto LABEL_6;
    case 2:
      unint64_t v5 = 0xD000000000000025;
      uint64_t v6 = "An invalid character was encountered.";
      goto LABEL_6;
    case 3:
      unint64_t v5 = 0xD000000000000023;
      uint64_t v6 = "An invalid command was encountered.";
      goto LABEL_6;
    case 4:
      unint64_t v5 = 0xD000000000000021;
      uint64_t v6 = "An unexpected error has occurred.";
LABEL_6:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x8000000000037B00;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000029;
      uint64_t v8 = "An invalid configuration was encountered.";
      goto LABEL_12;
    case 2:
      unint64_t v2 = 0xD000000000000025;
      uint64_t v8 = "An invalid character was encountered.";
      goto LABEL_12;
    case 3:
      unint64_t v2 = 0xD000000000000023;
      uint64_t v8 = "An invalid command was encountered.";
      goto LABEL_12;
    case 4:
      unint64_t v2 = 0xD000000000000021;
      uint64_t v8 = "An unexpected error has occurred.";
LABEL_12:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_27D20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

Swift::Int sub_16E2C()
{
  return sub_16E34();
}

Swift::Int sub_16E34()
{
  return sub_27DC0();
}

uint64_t sub_16F24()
{
  return sub_16F2C();
}

uint64_t sub_16F2C()
{
  sub_27B40();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_16FFC()
{
  return sub_17004();
}

Swift::Int sub_17004()
{
  return sub_27DC0();
}

uint64_t sub_170F0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s9VoiceOver25VOTNemethTranslatingErrorO8rawValueACSgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_17120@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = VOTNemethTranslatingError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s9VoiceOver25VOTNemethTranslatingErrorO8rawValueACSgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_3D860;
  v6._object = a2;
  unint64_t v4 = sub_27D00(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

unint64_t sub_171AC()
{
  unint64_t result = qword_4ADD8;
  if (!qword_4ADD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4ADD8);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for LatexTranslatableType(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for VOTNemethTranslatingError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for VOTNemethTranslatingError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1736CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_17394(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_173A0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for VOTNemethTranslatingError()
{
  return &type metadata for VOTNemethTranslatingError;
}

uint64_t sub_173B8()
{
  uint64_t v2 = v0[2];
  unint64_t v1 = v0[3];
  uint64_t v3 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v3 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3) {
    return 0;
  }
  if (!v0[6])
  {
    if (!v0[5])
    {
      unint64_t v38 = 0xE400000000000000;
      swift_bridgeObjectRetain();
      v46._countAndFlagsBits = v2;
      v46._object = (void *)v1;
      sub_27B80(v46);
      swift_bridgeObjectRelease();
      v47._countAndFlagsBits = 0x3E6E6D2F3CLL;
      v47._object = (void *)0xE500000000000000;
      sub_27B80(v47);
      return 1047424316;
    }
    swift_retain();
    uint64_t v4 = sub_238D0();
    uint64_t v36 = 0x3E7075736D3CLL;
    uint64_t v37 = 1047424316;
    unint64_t v38 = 0xE400000000000000;
    uint64_t v5 = v0[2];
    unsigned int v6 = (void *)v0[3];
    swift_bridgeObjectRetain();
    v41._countAndFlagsBits = v5;
    v41._object = v6;
    sub_27B80(v41);
    swift_bridgeObjectRelease();
    v42._countAndFlagsBits = 0x3E6E6D2F3CLL;
    v42._object = (void *)0xE500000000000000;
    sub_27B80(v42);
    v43._countAndFlagsBits = 1047424316;
    v43._object = (void *)0xE400000000000000;
    sub_27B80(v43);
    swift_bridgeObjectRelease();
    v44._countAndFlagsBits = 0x3E776F726D3CLL;
    v44._object = (void *)0xE600000000000000;
    sub_27B80(v44);
    swift_beginAccess();
    uint64_t v7 = *(void *)(v4 + 16);
    uint64_t v8 = *(void *)(v7 + 16);
    if (v8)
    {
      uint64_t v9 = v7 + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_16B04(v9, (uint64_t)&v37);
        uint64_t v11 = v39;
        uint64_t v10 = v40;
        sub_16B68(&v37, v39);
        v45._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v10 + 16) + 8))(v11);
        sub_27B80(v45);
        swift_bridgeObjectRelease();
        sub_16BAC((uint64_t)&v37);
        v9 += 40;
        --v8;
      }
      while (v8);
      swift_bridgeObjectRelease();
    }
    v12._countAndFlagsBits = 0x3C3E776F726D2F3CLL;
    v12._object = (void *)0x3E7075736D2FLL;
    goto LABEL_22;
  }
  if (!v0[5])
  {
    swift_retain();
    uint64_t v15 = sub_238D0();
    uint64_t v36 = 0x3E6275736D3CLL;
    uint64_t v37 = 1047424316;
    unint64_t v38 = 0xE400000000000000;
    uint64_t v16 = v0[2];
    uint64_t v17 = (void *)v0[3];
    swift_bridgeObjectRetain();
    v48._countAndFlagsBits = v16;
    v48._object = v17;
    sub_27B80(v48);
    swift_bridgeObjectRelease();
    v49._countAndFlagsBits = 0x3E6E6D2F3CLL;
    v49._object = (void *)0xE500000000000000;
    sub_27B80(v49);
    v50._countAndFlagsBits = 1047424316;
    v50._object = (void *)0xE400000000000000;
    sub_27B80(v50);
    swift_bridgeObjectRelease();
    v51._countAndFlagsBits = 0x3E776F726D3CLL;
    v51._object = (void *)0xE600000000000000;
    sub_27B80(v51);
    swift_beginAccess();
    uint64_t v18 = *(void *)(v15 + 16);
    uint64_t v19 = *(void *)(v18 + 16);
    if (v19)
    {
      uint64_t v20 = v18 + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_16B04(v20, (uint64_t)&v37);
        uint64_t v22 = v39;
        uint64_t v21 = v40;
        sub_16B68(&v37, v39);
        v52._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v21 + 16) + 8))(v22);
        sub_27B80(v52);
        swift_bridgeObjectRelease();
        sub_16BAC((uint64_t)&v37);
        v20 += 40;
        --v19;
      }
      while (v19);
      swift_bridgeObjectRelease();
    }
    v12._countAndFlagsBits = 0x3C3E776F726D2F3CLL;
    v12._object = (void *)0x3E6275736D2FLL;
LABEL_22:
    v12._object = (void *)((uint64_t)v12._object & 0xFFFFFFFFFFFFLL | 0xEE00000000000000);
    sub_27B80(v12);
    swift_release();
    swift_release();
    return v36;
  }
  swift_retain();
  swift_retain();
  uint64_t v13 = sub_238D0();
  uint64_t v23 = sub_238D0();
  uint64_t v37 = 1047424316;
  unint64_t v38 = 0xE400000000000000;
  uint64_t v24 = v0[2];
  Swift::String v25 = (void *)v0[3];
  swift_bridgeObjectRetain();
  v53._countAndFlagsBits = v24;
  v53._object = v25;
  sub_27B80(v53);
  swift_bridgeObjectRelease();
  v54._countAndFlagsBits = 0x3E6E6D2F3CLL;
  v54._object = (void *)0xE500000000000000;
  sub_27B80(v54);
  v55._countAndFlagsBits = 1047424316;
  v55._object = (void *)0xE400000000000000;
  sub_27B80(v55);
  swift_bridgeObjectRelease();
  v56._countAndFlagsBits = 0x3E776F726D3CLL;
  v56._object = (void *)0xE600000000000000;
  sub_27B80(v56);
  swift_beginAccess();
  uint64_t v26 = *(void *)(v23 + 16);
  uint64_t v27 = *(void *)(v26 + 16);
  if (v27)
  {
    uint64_t v28 = v26 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_16B04(v28, (uint64_t)&v37);
      uint64_t v30 = v39;
      uint64_t v29 = v40;
      sub_16B68(&v37, v39);
      v57._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v29 + 16) + 8))(v30);
      sub_27B80(v57);
      swift_bridgeObjectRelease();
      sub_16BAC((uint64_t)&v37);
      v28 += 40;
      --v27;
    }
    while (v27);
    swift_bridgeObjectRelease();
  }
  v58._countAndFlagsBits = 0x3C3E776F726D2F3CLL;
  v58._object = (void *)0xED00003E776F726DLL;
  sub_27B80(v58);
  swift_beginAccess();
  uint64_t v31 = *(void *)(v13 + 16);
  uint64_t v32 = *(void *)(v31 + 16);
  if (v32)
  {
    uint64_t v33 = v31 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_16B04(v33, (uint64_t)&v37);
      uint64_t v35 = v39;
      uint64_t v34 = v40;
      sub_16B68(&v37, v39);
      v59._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v34 + 16) + 8))(v35);
      sub_27B80(v59);
      swift_bridgeObjectRelease();
      sub_16BAC((uint64_t)&v37);
      v33 += 40;
      --v32;
    }
    while (v32);
    swift_bridgeObjectRelease();
  }
  v60._object = (void *)0x8000000000037C40;
  v60._countAndFlagsBits = 0xD000000000000011;
  sub_27B80(v60);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return 0x7075736275736D3CLL;
}

uint64_t sub_17AB4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for Number()
{
  return self;
}

uint64_t sub_17B20()
{
  return *(unsigned __int8 *)(*(void *)v0 + 33);
}

uint64_t sub_17B2C()
{
  return swift_retain();
}

uint64_t sub_17B38(uint64_t a1)
{
  *(void *)(*(void *)v1 + 40) = a1;
  return swift_release();
}

uint64_t sub_17B4C()
{
  return swift_retain();
}

uint64_t sub_17B58(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  return swift_release();
}

uint64_t sub_17B6C()
{
  return sub_173B8();
}

uint64_t sub_17B90()
{
  unint64_t v1 = v0[8];
  uint64_t v2 = v0[7] & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(v1) & 0xF;
  }
  if (v2)
  {
    sub_27C90(43);
    swift_bridgeObjectRelease();
    uint64_t v40 = 0x73616C6320696D3CLL;
    unint64_t v41 = 0xEB00000000223D73;
    uint64_t v3 = v0[7];
    uint64_t v4 = (void *)v0[8];
    swift_bridgeObjectRetain();
    v44._countAndFlagsBits = v3;
    v44._object = v4;
    sub_27B80(v44);
    swift_bridgeObjectRelease();
    v45._countAndFlagsBits = 0xD000000000000017;
    v45._object = (void *)0x8000000000037CA0;
    sub_27B80(v45);
LABEL_5:
    uint64_t v5 = v0[2];
    unsigned int v6 = (void *)v0[3];
    swift_bridgeObjectRetain();
    v46._countAndFlagsBits = v5;
    v46._object = v6;
    sub_27B80(v46);
    swift_bridgeObjectRelease();
    v47._countAndFlagsBits = 0x3E696D2F3CLL;
    v47._object = (void *)0xE500000000000000;
    sub_27B80(v47);
    return v40;
  }
  if (!v0[6])
  {
    if (!v0[5])
    {
      uint64_t v40 = 1047096636;
      unint64_t v41 = 0xE400000000000000;
      goto LABEL_5;
    }
    swift_retain();
    uint64_t v8 = sub_238D0();
    uint64_t v39 = 0x3E7075736D3CLL;
    uint64_t v40 = 1047096636;
    unint64_t v41 = 0xE400000000000000;
    uint64_t v9 = v0[2];
    uint64_t v10 = (void *)v0[3];
    swift_bridgeObjectRetain();
    v48._countAndFlagsBits = v9;
    v48._object = v10;
    sub_27B80(v48);
    swift_bridgeObjectRelease();
    v49._countAndFlagsBits = 0x3E696D2F3CLL;
    v49._object = (void *)0xE500000000000000;
    sub_27B80(v49);
    v50._countAndFlagsBits = 1047096636;
    v50._object = (void *)0xE400000000000000;
    sub_27B80(v50);
    swift_bridgeObjectRelease();
    v51._countAndFlagsBits = 0x3E776F726D3CLL;
    v51._object = (void *)0xE600000000000000;
    sub_27B80(v51);
    swift_beginAccess();
    uint64_t v11 = *(void *)(v8 + 16);
    uint64_t v12 = *(void *)(v11 + 16);
    if (v12)
    {
      uint64_t v13 = v11 + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_16B04(v13, (uint64_t)&v40);
        uint64_t v15 = v42;
        uint64_t v14 = v43;
        sub_16B68(&v40, v42);
        v52._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v14 + 16) + 8))(v15);
        sub_27B80(v52);
        swift_bridgeObjectRelease();
        sub_16BAC((uint64_t)&v40);
        v13 += 40;
        --v12;
      }
      while (v12);
      swift_bridgeObjectRelease();
    }
    v16._countAndFlagsBits = 0x3C3E776F726D2F3CLL;
    v16._object = (void *)0x3E7075736D2FLL;
    goto LABEL_22;
  }
  if (!v0[5])
  {
    swift_retain();
    uint64_t v18 = sub_238D0();
    uint64_t v39 = 0x3E6275736D3CLL;
    uint64_t v40 = 1047096636;
    unint64_t v41 = 0xE400000000000000;
    uint64_t v19 = v0[2];
    uint64_t v20 = (void *)v0[3];
    swift_bridgeObjectRetain();
    v53._countAndFlagsBits = v19;
    v53._object = v20;
    sub_27B80(v53);
    swift_bridgeObjectRelease();
    v54._countAndFlagsBits = 0x3E696D2F3CLL;
    v54._object = (void *)0xE500000000000000;
    sub_27B80(v54);
    v55._countAndFlagsBits = 1047096636;
    v55._object = (void *)0xE400000000000000;
    sub_27B80(v55);
    swift_bridgeObjectRelease();
    v56._countAndFlagsBits = 0x3E776F726D3CLL;
    v56._object = (void *)0xE600000000000000;
    sub_27B80(v56);
    swift_beginAccess();
    uint64_t v21 = *(void *)(v18 + 16);
    uint64_t v22 = *(void *)(v21 + 16);
    if (v22)
    {
      uint64_t v23 = v21 + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_16B04(v23, (uint64_t)&v40);
        uint64_t v25 = v42;
        uint64_t v24 = v43;
        sub_16B68(&v40, v42);
        v57._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v24 + 16) + 8))(v25);
        sub_27B80(v57);
        swift_bridgeObjectRelease();
        sub_16BAC((uint64_t)&v40);
        v23 += 40;
        --v22;
      }
      while (v22);
      swift_bridgeObjectRelease();
    }
    v16._countAndFlagsBits = 0x3C3E776F726D2F3CLL;
    v16._object = (void *)0x3E6275736D2FLL;
LABEL_22:
    v16._object = (void *)((uint64_t)v16._object & 0xFFFFFFFFFFFFLL | 0xEE00000000000000);
    sub_27B80(v16);
    swift_release();
    swift_release();
    return v39;
  }
  swift_retain();
  swift_retain();
  uint64_t v17 = sub_238D0();
  uint64_t v26 = sub_238D0();
  uint64_t v40 = 1047096636;
  unint64_t v41 = 0xE400000000000000;
  uint64_t v27 = v0[2];
  uint64_t v28 = (void *)v0[3];
  swift_bridgeObjectRetain();
  v58._countAndFlagsBits = v27;
  v58._object = v28;
  sub_27B80(v58);
  swift_bridgeObjectRelease();
  v59._countAndFlagsBits = 0x3E696D2F3CLL;
  v59._object = (void *)0xE500000000000000;
  sub_27B80(v59);
  v60._countAndFlagsBits = 1047096636;
  v60._object = (void *)0xE400000000000000;
  sub_27B80(v60);
  swift_bridgeObjectRelease();
  v61._countAndFlagsBits = 0x3E776F726D3CLL;
  v61._object = (void *)0xE600000000000000;
  sub_27B80(v61);
  swift_beginAccess();
  uint64_t v29 = *(void *)(v26 + 16);
  uint64_t v30 = *(void *)(v29 + 16);
  if (v30)
  {
    uint64_t v31 = v29 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_16B04(v31, (uint64_t)&v40);
      uint64_t v33 = v42;
      uint64_t v32 = v43;
      sub_16B68(&v40, v42);
      v62._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v32 + 16) + 8))(v33);
      sub_27B80(v62);
      swift_bridgeObjectRelease();
      sub_16BAC((uint64_t)&v40);
      v31 += 40;
      --v30;
    }
    while (v30);
    swift_bridgeObjectRelease();
  }
  v63._countAndFlagsBits = 0x3C3E776F726D2F3CLL;
  v63._object = (void *)0xED00003E776F726DLL;
  sub_27B80(v63);
  swift_beginAccess();
  uint64_t v34 = *(void *)(v17 + 16);
  uint64_t v35 = *(void *)(v34 + 16);
  if (v35)
  {
    uint64_t v36 = v34 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_16B04(v36, (uint64_t)&v40);
      uint64_t v38 = v42;
      uint64_t v37 = v43;
      sub_16B68(&v40, v42);
      v64._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v37 + 16) + 8))(v38);
      sub_27B80(v64);
      swift_bridgeObjectRelease();
      sub_16BAC((uint64_t)&v40);
      v36 += 40;
      --v35;
    }
    while (v35);
    swift_bridgeObjectRelease();
  }
  v65._object = (void *)0x8000000000037C40;
  v65._countAndFlagsBits = 0xD000000000000011;
  sub_27B80(v65);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return 0x7075736275736D3CLL;
}

uint64_t sub_18318()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for Variable()
{
  return self;
}

uint64_t sub_1838C()
{
  return sub_17B90();
}

uint64_t sub_183B0()
{
  uint64_t v39 = 0;
  unint64_t v40 = 0xE000000000000000;
  if (v0[5])
  {
    if (v0[6])
    {
      swift_retain();
      swift_retain();
      uint64_t v10 = sub_238D0();
      uint64_t v22 = sub_238D0();
      v56._countAndFlagsBits = 0x7075736275736D3CLL;
      v56._object = (void *)0xE90000000000003ELL;
      sub_27B80(v56);
      uint64_t v35 = 1047096636;
      unint64_t v36 = 0xE400000000000000;
      uint64_t v23 = v0[2];
      uint64_t v24 = (void *)v0[3];
      swift_bridgeObjectRetain();
      v57._countAndFlagsBits = v23;
      v57._object = v24;
      sub_27B80(v57);
      swift_bridgeObjectRelease();
      v58._countAndFlagsBits = 0x3E696D2F3CLL;
      v58._object = (void *)0xE500000000000000;
      sub_27B80(v58);
      v59._countAndFlagsBits = 1047096636;
      v59._object = (void *)0xE400000000000000;
      sub_27B80(v59);
      swift_bridgeObjectRelease();
      v60._countAndFlagsBits = 0x3E776F726D3CLL;
      v60._object = (void *)0xE600000000000000;
      sub_27B80(v60);
      swift_beginAccess();
      uint64_t v25 = *(void *)(v22 + 16);
      uint64_t v26 = *(void *)(v25 + 16);
      if (v26)
      {
        uint64_t v27 = v25 + 32;
        swift_bridgeObjectRetain();
        do
        {
          sub_16B04(v27, (uint64_t)&v35);
          uint64_t v29 = v37;
          uint64_t v28 = v38;
          sub_16B68(&v35, v37);
          v61._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v28 + 16) + 8))(v29);
          sub_27B80(v61);
          swift_bridgeObjectRelease();
          sub_16BAC((uint64_t)&v35);
          v27 += 40;
          --v26;
        }
        while (v26);
        swift_bridgeObjectRelease();
      }
      v62._countAndFlagsBits = 0x3C3E776F726D2F3CLL;
      v62._object = (void *)0xED00003E776F726DLL;
      sub_27B80(v62);
      swift_beginAccess();
      uint64_t v30 = *(void *)(v10 + 16);
      uint64_t v31 = *(void *)(v30 + 16);
      if (v31)
      {
        uint64_t v32 = v30 + 32;
        swift_bridgeObjectRetain();
        do
        {
          sub_16B04(v32, (uint64_t)&v35);
          uint64_t v34 = v37;
          uint64_t v33 = v38;
          sub_16B68(&v35, v37);
          v63._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v33 + 16) + 8))(v34);
          sub_27B80(v63);
          swift_bridgeObjectRelease();
          sub_16BAC((uint64_t)&v35);
          v32 += 40;
          --v31;
        }
        while (v31);
        swift_bridgeObjectRelease();
      }
      v64._countAndFlagsBits = 0xD000000000000022;
      v64._object = (void *)0x8000000000037D40;
      sub_27B80(v64);
      swift_release();
      swift_release();
      swift_release();
      goto LABEL_27;
    }
    swift_retain();
    uint64_t v14 = sub_238D0();
    v49._countAndFlagsBits = 0x3E7075736D3CLL;
    v49._object = (void *)0xE600000000000000;
    sub_27B80(v49);
    uint64_t v35 = 1047096636;
    unint64_t v36 = 0xE400000000000000;
    uint64_t v15 = v0[2];
    Swift::String v16 = (void *)v0[3];
    swift_bridgeObjectRetain();
    v50._countAndFlagsBits = v15;
    v50._object = v16;
    sub_27B80(v50);
    swift_bridgeObjectRelease();
    v51._countAndFlagsBits = 0x3E696D2F3CLL;
    v51._object = (void *)0xE500000000000000;
    sub_27B80(v51);
    v52._countAndFlagsBits = 1047096636;
    v52._object = (void *)0xE400000000000000;
    sub_27B80(v52);
    swift_bridgeObjectRelease();
    v53._countAndFlagsBits = 0x3E776F726D3CLL;
    v53._object = (void *)0xE600000000000000;
    sub_27B80(v53);
    swift_beginAccess();
    uint64_t v17 = *(void *)(v14 + 16);
    uint64_t v18 = *(void *)(v17 + 16);
    if (v18)
    {
      uint64_t v19 = v17 + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_16B04(v19, (uint64_t)&v35);
        uint64_t v21 = v37;
        uint64_t v20 = v38;
        sub_16B68(&v35, v37);
        v54._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v20 + 16) + 8))(v21);
        sub_27B80(v54);
        swift_bridgeObjectRelease();
        sub_16BAC((uint64_t)&v35);
        v19 += 40;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease();
    }
    uint64_t v9 = "</mrow></msup><mo>&#x2061;</mo>";
  }
  else
  {
    if (!v0[6])
    {
      sub_27C90(28);
      swift_bridgeObjectRelease();
      uint64_t v35 = 1047096636;
      unint64_t v36 = 0xE400000000000000;
      uint64_t v11 = v0[2];
      uint64_t v12 = (void *)v0[3];
      swift_bridgeObjectRetain();
      v47._countAndFlagsBits = v11;
      v47._object = v12;
      sub_27B80(v47);
      swift_bridgeObjectRelease();
      v48._countAndFlagsBits = 0xD000000000000016;
      v48._object = (void *)0x8000000000037CE0;
      sub_27B80(v48);
      return 1047096636;
    }
    swift_retain();
    uint64_t v1 = sub_238D0();
    v41._countAndFlagsBits = 0x3E6275736D3CLL;
    v41._object = (void *)0xE600000000000000;
    sub_27B80(v41);
    uint64_t v35 = 1047096636;
    unint64_t v36 = 0xE400000000000000;
    uint64_t v2 = v0[2];
    uint64_t v3 = (void *)v0[3];
    swift_bridgeObjectRetain();
    v42._countAndFlagsBits = v2;
    v42._object = v3;
    sub_27B80(v42);
    swift_bridgeObjectRelease();
    v43._countAndFlagsBits = 0x3E696D2F3CLL;
    v43._object = (void *)0xE500000000000000;
    sub_27B80(v43);
    v44._countAndFlagsBits = 1047096636;
    v44._object = (void *)0xE400000000000000;
    sub_27B80(v44);
    swift_bridgeObjectRelease();
    v45._countAndFlagsBits = 0x3E776F726D3CLL;
    v45._object = (void *)0xE600000000000000;
    sub_27B80(v45);
    swift_beginAccess();
    uint64_t v4 = *(void *)(v1 + 16);
    uint64_t v5 = *(void *)(v4 + 16);
    if (v5)
    {
      uint64_t v6 = v4 + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_16B04(v6, (uint64_t)&v35);
        uint64_t v8 = v37;
        uint64_t v7 = v38;
        sub_16B68(&v35, v37);
        v46._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v7 + 16) + 8))(v8);
        sub_27B80(v46);
        swift_bridgeObjectRelease();
        sub_16BAC((uint64_t)&v35);
        v6 += 40;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease();
    }
    uint64_t v9 = "</mrow></msub><mo>&#x2061;</mo>";
  }
  v55._object = (void *)((unint64_t)(v9 - 32) | 0x8000000000000000);
  v55._countAndFlagsBits = 0xD00000000000001FLL;
  sub_27B80(v55);
  swift_release();
LABEL_27:
  swift_release();
  return v39;
}

uint64_t type metadata accessor for Function()
{
  return self;
}

uint64_t sub_18AB8(uint64_t a1)
{
  sub_18B54(a1);

  return swift_release();
}

uint64_t sub_18AF4(uint64_t a1)
{
  sub_18BB0(a1);

  return swift_release();
}

uint64_t sub_18B30()
{
  return sub_183B0();
}

uint64_t sub_18B54(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  swift_retain();
  uint64_t result = swift_release();
  if ((*(unsigned char *)(v1 + 33) & 1) == 0)
  {
    *(void *)(v1 + 40) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_18BB0(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  swift_retain();
  uint64_t result = swift_release();
  if ((*(unsigned char *)(v1 + 33) & 1) == 0)
  {
    *(void *)(v1 + 40) = 0;
    uint64_t result = swift_release();
    if (*(unsigned char *)(v1 + 33) != 1)
    {
      *(void *)(v1 + 40) = 0;
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_18C24(uint64_t a1)
{
  uint64_t v2 = sub_16A44(&qword_4B400);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2, v5);
  uint64_t result = _swift_isClassOrObjCExistentialType();
  if (result)
  {
    if (v4 == 8) {
      return swift_unknownObjectRetain();
    }
    else {
      __break(1u);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
    return sub_27D30();
  }
  return result;
}

void sub_18D20(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  sub_27A40();
  *(_OWORD *)a7 = v23;
  *(void *)(a7 + 16) = v24;
  sub_27A40();
  *(_OWORD *)(a7 + 24) = v23;
  *(void *)(a7 + 40) = v24;
  sub_27A40();
  *(_OWORD *)(a7 + 48) = v23;
  *(void *)(a7 + 64) = v24;
  [objc_allocWithZone((Class)UIImage) init];
  sub_20274(0, (unint64_t *)&qword_4B508);
  sub_27A40();
  *(_OWORD *)(a7 + 72) = v23;
  sub_27A40();
  *(_OWORD *)(a7 + 88) = v23;
  *(void *)(a7 + 104) = v24;
  sub_27A40();
  *(_OWORD *)(a7 + 112) = v23;
  *(void *)(a7 + 128) = v24;
  *(unsigned char *)(a7 + 136) = sub_277A0() & 1;
  *(void *)(a7 + 144) = v11;
  *(unsigned char *)(a7 + 152) = v12 & 1;
  uint64_t v13 = (int *)type metadata accessor for VOTUINemethView();
  sub_27940();
  uint64_t v14 = (void *)(a7 + v13[12]);
  uint64_t v15 = (void *)(a7 + v13[13]);
  uint64_t v16 = v13[15];
  uint64_t v17 = (void *)(a7 + v13[14]);
  sub_27B30();
  NSString v18 = sub_27B20();
  swift_bridgeObjectRelease();
  id v19 = [self serviceForIdentifier:v18 input:0 loopback:1];

  *(void *)(a7 + v16) = v19;
  *uint64_t v14 = a1;
  v14[1] = a2;
  void *v15 = a3;
  v15[1] = a4;
  void *v17 = a5;
  v17[1] = a6;
}

uint64_t sub_18F58(uint64_t a1)
{
  uint64_t result = type metadata accessor for VOTUINemethView();
  uint64_t v3 = (uint64_t (**)(void))(a1 + *(int *)(result + 48));
  if (*v3) {
    return (*v3)();
  }
  __break(1u);
  return result;
}

uint64_t sub_18FA0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v106 = a2;
  uint64_t v101 = sub_16A44(&qword_4B430);
  uint64_t v100 = *(void *)(v101 - 8);
  uint64_t v4 = __chkstk_darwin(v101, v3);
  v99 = (char *)&v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v6);
  v98 = (char *)&v91 - v7;
  uint64_t v8 = sub_16A44(&qword_4B438);
  uint64_t v10 = __chkstk_darwin(v8 - 8, v9);
  uint64_t v115 = (uint64_t)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v12);
  v109 = (char *)&v91 - v13;
  uint64_t v14 = sub_16A44(&qword_4B440);
  __chkstk_darwin(v14 - 8, v15);
  v108 = (char *)&v91 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_16A44(&qword_4B448);
  uint64_t v105 = *(void *)(v114 - 8);
  uint64_t v18 = __chkstk_darwin(v114, v17);
  v113 = (char *)&v91 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18, v20);
  v116 = (char *)&v91 - v21;
  uint64_t v22 = type metadata accessor for VOTUINemethView();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void *)(v23 + 64);
  __chkstk_darwin(v22 - 8, v25);
  uint64_t v26 = (char *)&v91 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_16A44(&qword_4B400);
  uint64_t v103 = *(void *)(v104 - 8);
  uint64_t v28 = __chkstk_darwin(v104, v27);
  v102 = (char *)&v91 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __chkstk_darwin(v28, v30);
  v112 = (char *)&v91 - v32;
  uint64_t v34 = __chkstk_darwin(v31, v33);
  unint64_t v36 = (char *)&v91 - v35;
  __chkstk_darwin(v34, v37);
  uint64_t v39 = (char *)&v91 - v38;
  sub_1F49C(a1, (uint64_t)v26);
  unint64_t v40 = (*(unsigned __int8 *)(v23 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v41 = swift_allocObject();
  sub_1F504((uint64_t)v26, v41 + v40);
  v110 = v39;
  sub_27A80();
  sub_1F49C(a1, (uint64_t)v26);
  uint64_t v42 = swift_allocObject();
  sub_1F504((uint64_t)v26, v42 + v40);
  v111 = v36;
  sub_27A80();
  uint64_t v43 = a1;
  v107 = (void *)a1;
  uint64_t v44 = *(void *)(a1 + 72);
  uint64_t v45 = *(void *)(v43 + 80);
  uint64_t v117 = v44;
  uint64_t v118 = v45;
  uint64_t v46 = sub_16A44(&qword_4B450);
  sub_27A50();
  v120 = (void *)sub_27A20();
  sub_27800();
  v96 = "VoiceOverUIService";
  NSString v47 = sub_27B20();
  id v95 = self;
  id v48 = [v95 bundleWithIdentifier:v47];

  v94 = "square.and.arrow.up";
  sub_279A0();
  uint64_t v92 = v44;
  uint64_t v117 = v44;
  uint64_t v118 = v45;
  uint64_t v97 = v46;
  sub_27A50();
  uint64_t v117 = sub_27A20();
  unint64_t v49 = sub_1F774();
  sub_277C0();
  uint64_t v50 = sub_16A44(&qword_4B460);
  uint64_t v93 = sub_2117C(&qword_4B468, &qword_4B460);
  sub_27AC0();
  uint64_t v51 = v107[14];
  uint64_t v52 = v107[15];
  uint64_t v53 = v107[16];
  uint64_t v117 = v51;
  uint64_t v118 = v52;
  uint64_t v119 = v53;
  sub_16A44(&qword_4B3D0);
  sub_27A50();
  uint64_t v54 = (uint64_t)v120;
  unint64_t v55 = v121;
  switch(v121 >> 62)
  {
    case 1uLL:
      uint64_t v91 = v50;
      v107 = (void *)v49;
      uint64_t v56 = v45;
      sub_1DAFC((uint64_t)v120, v121);
      uint64_t v57 = (int)v54;
      uint64_t v58 = v54 >> 32;
      goto LABEL_6;
    case 2uLL:
      uint64_t v91 = v50;
      v107 = (void *)v49;
      uint64_t v56 = v45;
      uint64_t v57 = v120[2];
      uint64_t v58 = v120[3];
      sub_1DAFC((uint64_t)v120, v121);
LABEL_6:
      BOOL v59 = v57 == v58;
      uint64_t v45 = v56;
      if (!v59) {
        goto LABEL_7;
      }
      goto LABEL_10;
    case 3uLL:
      sub_1DAFC((uint64_t)v120, v121);
      goto LABEL_10;
    default:
      sub_1DAFC((uint64_t)v120, v121);
      if ((v55 & 0xFF000000000000) != 0)
      {
LABEL_7:
        uint64_t v117 = v51;
        uint64_t v118 = v52;
        uint64_t v119 = v53;
        sub_27A50();
        uint64_t v60 = (uint64_t)v120;
        unint64_t v61 = v121;
        id v62 = objc_allocWithZone((Class)PDFDocument);
        Class isa = sub_27730().super.isa;
        Swift::String v64 = [v62 initWithData:isa];
        sub_1DAFC(v60, v61);

        if (!v64)
        {
          __break(1u);
          JUMPOUT(0x19BE4);
        }
        v120 = v64;
        sub_27800();
        NSString v65 = sub_27B20();
        id v66 = [v95 bundleWithIdentifier:v65];

        sub_279A0();
        uint64_t v117 = v92;
        uint64_t v118 = v45;
        sub_27A50();
        uint64_t v117 = sub_27A20();
        sub_277C0();
        sub_20274(0, (unint64_t *)&qword_4B470);
        sub_1F7C8();
        v67 = v99;
        sub_27AC0();
        uint64_t v68 = v100;
        v69 = *(void (**)(char *, char *, uint64_t))(v100 + 32);
        v70 = v98;
        v71 = v67;
        uint64_t v72 = v101;
        v69(v98, v71, v101);
        uint64_t v73 = (uint64_t)v109;
        v69(v109, v70, v72);
        uint64_t v74 = 0;
      }
      else
      {
LABEL_10:
        uint64_t v74 = 1;
        uint64_t v73 = (uint64_t)v109;
        uint64_t v72 = v101;
        uint64_t v68 = v100;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 56))(v73, v74, 1, v72);
      uint64_t v75 = v103;
      v76 = *(void (**)(char *, char *, uint64_t))(v103 + 16);
      v77 = v112;
      uint64_t v78 = v104;
      v76(v112, v110, v104);
      v79 = v102;
      v76(v102, v111, v78);
      uint64_t v80 = v105;
      v81 = *(void (**)(char *, char *, uint64_t))(v105 + 16);
      v81(v113, v116, v114);
      sub_1F830(v73, v115, &qword_4B438);
      v82 = v106;
      v76(v106, v77, v78);
      v83 = (int *)sub_16A44(&qword_4B480);
      v76(&v82[v83[12]], v79, v78);
      v85 = v113;
      uint64_t v84 = v114;
      v81(&v82[v83[16]], v113, v114);
      uint64_t v86 = (uint64_t)&v82[v83[20]];
      uint64_t v87 = v115;
      sub_1F830(v115, v86, &qword_4B438);
      sub_1FEEC((uint64_t)v109, &qword_4B438);
      v88 = *(void (**)(char *, uint64_t))(v80 + 8);
      v88(v116, v84);
      v89 = *(void (**)(char *, uint64_t))(v75 + 8);
      v89(v111, v78);
      v89(v110, v78);
      sub_1FEEC(v87, &qword_4B438);
      v88(v85, v84);
      v89(v79, v78);
      return ((uint64_t (*)(char *, uint64_t))v89)(v112, v78);
  }
}

uint64_t sub_19BF4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for VOTUINemethView();
  uint64_t v19 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v19 + 64);
  __chkstk_darwin(v2 - 8, v4);
  uint64_t v20 = sub_16A44(&qword_4B400);
  uint64_t v5 = *(void *)(v20 - 8);
  __chkstk_darwin(v20, v6);
  uint64_t v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v9 = [self generalPasteboard];
  id v18 = v9;
  uint64_t v10 = *(void *)(a1 + 40);
  long long v21 = *(_OWORD *)(a1 + 24);
  uint64_t v22 = v10;
  sub_16A44(&qword_4B3C8);
  sub_27A50();
  NSString v11 = sub_27B20();
  swift_bridgeObjectRelease();
  [v9 setString:v11];

  UIAccessibilityNotifications v17 = UIAccessibilityScreenChangedNotification;
  sub_27800();
  sub_1F49C(a1, (uint64_t)&v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v12 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v13 = swift_allocObject();
  sub_1F504((uint64_t)&v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)], v13 + v12);
  sub_27A90();
  uint64_t v14 = (void *)sub_18C24((uint64_t)v8);
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v20);
  UIAccessibilityPostNotification(v17, v14);

  return swift_unknownObjectRelease();
}

uint64_t sub_19E88@<X0>(uint64_t a1@<X8>)
{
  return sub_19F70(a1);
}

void sub_19EA4()
{
  id v0 = [self generalPasteboard];
  sub_16A44(&qword_4B3C8);
  sub_27A50();
  NSString v1 = sub_27B20();
  swift_bridgeObjectRelease();
  [v0 setString:v1];
}

uint64_t sub_19F54@<X0>(uint64_t a1@<X8>)
{
  return sub_19F70(a1);
}

uint64_t sub_19F70@<X0>(uint64_t a1@<X8>)
{
  sub_27800();
  NSString v2 = sub_27B20();
  id v3 = [self bundleWithIdentifier:v2];

  uint64_t result = sub_279A0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v7;
  return result;
}

double sub_1A064@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_1A0A4(a1).n128_u64[0];
  return result;
}

double sub_1A080@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_1A0A4(a1).n128_u64[0];
  return result;
}

__n128 sub_1A0A4@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_277F0();
  sub_1A128((uint64_t)&v9);
  char v3 = v10;
  uint64_t v4 = v11;
  uint64_t v5 = v12;
  char v6 = v13;
  uint64_t v7 = v14;
  __n128 result = v9;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(unsigned char *)(a1 + 40) = v3;
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = v5;
  *(unsigned char *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = v7;
  return result;
}

uint64_t sub_1A128@<X0>(uint64_t a1@<X8>)
{
  sub_27800();
  uint64_t v2 = sub_279A0();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  uint64_t v9 = sub_27A30();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = v9;
  sub_1F894(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_1F8A4(v2, v4, v8);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A208@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v67 = a2;
  uint64_t v3 = type metadata accessor for VOTUINemethView();
  uint64_t v57 = *(void **)(v3 - 8);
  uint64_t v4 = v57[8];
  __chkstk_darwin(v3, v5);
  uint64_t v6 = (char *)v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_16A44(&qword_4B3A0);
  __chkstk_darwin(v7 - 8, v8);
  char v10 = (char *)v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_16A44(&qword_4B388);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_16A44(&qword_4B380);
  uint64_t v59 = *(void *)(v58 - 8);
  __chkstk_darwin(v58, v15);
  uint64_t v68 = (char *)v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_16A44(&qword_4B378);
  uint64_t v61 = *(void *)(v60 - 8);
  __chkstk_darwin(v60, v17);
  v69 = (char *)v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_16A44(&qword_4B370);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v63 = v19;
  uint64_t v64 = v20;
  __chkstk_darwin(v19, v21);
  v70 = (char *)v56 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_16A44(&qword_4B360);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v65 = v23;
  uint64_t v66 = v24;
  __chkstk_darwin(v23, v25);
  id v62 = (char *)v56 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)char v10 = sub_27810();
  *((void *)v10 + 1) = 0;
  v10[16] = 1;
  uint64_t v27 = sub_16A44(&qword_4B3C0);
  sub_1AABC((long long *)a1, &v10[*(int *)(v27 + 44)]);
  char v28 = sub_27980();
  sub_1F830((uint64_t)v10, (uint64_t)v14, &qword_4B3A0);
  uint64_t v29 = &v14[*(int *)(v11 + 36)];
  *uint64_t v29 = v28;
  *(_OWORD *)(v29 + 8) = 0u;
  *(_OWORD *)(v29 + 24) = 0u;
  v29[40] = 1;
  sub_1FEEC((uint64_t)v10, &qword_4B3A0);
  sub_16A44(&qword_4B280);
  sub_27920();
  sub_1F49C(a1, (uint64_t)v6);
  uint64_t v30 = *((unsigned __int8 *)v57 + 80);
  uint64_t v31 = ((v30 + 16) & ~v30) + v4;
  uint64_t v32 = (v30 + 16) & ~v30;
  uint64_t v33 = swift_allocObject();
  sub_1F504((uint64_t)v6, v33 + v32);
  unint64_t v34 = sub_1F3A8();
  sub_27A10();
  swift_release();
  sub_1FEEC((uint64_t)v14, &qword_4B388);
  uint64_t v35 = a1;
  unint64_t v36 = *(void *)(a1 + 16);
  long long v72 = *(_OWORD *)a1;
  unint64_t v73 = v36;
  v56[0] = sub_16A44(&qword_4B3C8);
  sub_27A50();
  sub_1F49C(a1, (uint64_t)v6);
  v56[1] = v31;
  uint64_t v37 = swift_allocObject() + v32;
  uint64_t v38 = v32;
  sub_1F504((uint64_t)v6, v37);
  *(void *)&long long v72 = v11;
  *((void *)&v72 + 1) = &type metadata for Bool;
  unint64_t v73 = v34;
  uint64_t v74 = &protocol witness table for Bool;
  uint64_t v57 = &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v40 = v68;
  uint64_t v41 = v58;
  sub_27A00();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v40, v41);
  unint64_t v42 = *(void *)(v35 + 40);
  long long v72 = *(_OWORD *)(v35 + 24);
  unint64_t v73 = v42;
  sub_27A50();
  sub_1F49C(v35, (uint64_t)v6);
  uint64_t v43 = swift_allocObject();
  sub_1F504((uint64_t)v6, v43 + v38);
  *(void *)&long long v72 = v41;
  *((void *)&v72 + 1) = &type metadata for String;
  unint64_t v73 = OpaqueTypeConformance2;
  uint64_t v74 = &protocol witness table for String;
  uint64_t v44 = swift_getOpaqueTypeConformance2();
  uint64_t v45 = v60;
  uint64_t v46 = v69;
  sub_27A00();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v46, v45);
  unint64_t v47 = *(void *)(v35 + 104);
  long long v72 = *(_OWORD *)(v35 + 88);
  unint64_t v73 = v47;
  sub_16A44(&qword_4B3D0);
  sub_27A50();
  sub_1F49C(v35, (uint64_t)v6);
  uint64_t v48 = swift_allocObject();
  sub_1F504((uint64_t)v6, v48 + v38);
  *(void *)&long long v72 = v45;
  *((void *)&v72 + 1) = &type metadata for String;
  unint64_t v73 = v44;
  uint64_t v74 = &protocol witness table for String;
  uint64_t v49 = swift_getOpaqueTypeConformance2();
  unint64_t v50 = sub_1F448();
  uint64_t v52 = v62;
  uint64_t v51 = v63;
  uint64_t v53 = v70;
  sub_27A10();
  swift_release();
  sub_1DAFC(v75, v76);
  (*(void (**)(char *, uint64_t))(v64 + 8))(v53, v51);
  uint64_t v71 = v35;
  sub_16A44(&qword_4B368);
  *(void *)&long long v72 = v51;
  *((void *)&v72 + 1) = &type metadata for Data;
  unint64_t v73 = v49;
  uint64_t v74 = (void *)v50;
  swift_getOpaqueTypeConformance2();
  sub_2117C(&qword_4B3B0, &qword_4B368);
  uint64_t v54 = v65;
  sub_279F0();
  return (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v52, v54);
}

uint64_t sub_1AABC@<X0>(long long *a1@<X0>, char *a2@<X8>)
{
  uint64_t v59 = a2;
  uint64_t v58 = sub_16A44(&qword_4B4D0);
  uint64_t v60 = *(void *)(v58 - 8);
  __chkstk_darwin(v58, v3);
  uint64_t v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_16A44(&qword_4B4D8);
  uint64_t v62 = *(void *)(v6 - 8);
  uint64_t v63 = v6;
  uint64_t v8 = __chkstk_darwin(v6, v7);
  uint64_t v64 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v10);
  uint64_t v61 = (char *)&v48 - v11;
  uint64_t v12 = sub_27800();
  uint64_t v55 = v13;
  uint64_t v56 = v12;
  LODWORD(v53) = v14;
  uint64_t v54 = v15;
  uint64_t v16 = *((void *)a1 + 2);
  long long v65 = *a1;
  uint64_t v66 = v16;
  uint64_t v57 = sub_16A44(&qword_4B3C8);
  sub_27A70();
  uint64_t v52 = v67;
  unint64_t v51 = v70;
  sub_27800();
  NSString v17 = sub_27B20();
  id v18 = [self bundleWithIdentifier:v17];

  sub_279A0();
  sub_27AD0();
  type metadata accessor for VOTUINemethView();
  sub_16A44(&qword_4B280);
  sub_27930();
  sub_2117C(&qword_4B4E0, &qword_4B4D0);
  uint64_t v19 = v64;
  uint64_t v20 = v58;
  sub_279E0();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v5, v20);
  uint64_t v21 = v61;
  uint64_t v22 = v62;
  uint64_t v23 = v63;
  (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v61, v19, v63);
  uint64_t v24 = *((void *)a1 + 8);
  long long v65 = a1[3];
  uint64_t v66 = v24;
  sub_27A70();
  uint64_t v25 = v67;
  uint64_t v57 = v68;
  uint64_t v58 = v69;
  uint64_t v56 = v70;
  uint64_t v26 = *((void *)a1 + 13);
  long long v65 = *(long long *)((char *)a1 + 88);
  uint64_t v66 = v26;
  sub_16A44(&qword_4B3D0);
  sub_27A70();
  uint64_t v27 = v67;
  uint64_t v60 = v68;
  uint64_t v52 = v69;
  unint64_t v51 = v70;
  uint64_t v28 = *((void *)a1 + 16);
  long long v65 = a1[7];
  uint64_t v66 = v28;
  sub_27A70();
  uint64_t v29 = v67;
  uint64_t v49 = v68;
  uint64_t v30 = v69;
  unint64_t v50 = v70;
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  uint64_t v32 = v64;
  v31(v64, v21, v23);
  uint64_t v33 = v59;
  v31(v59, v32, v23);
  unint64_t v34 = (uint64_t *)&v33[*(int *)(sub_16A44(&qword_4B4E8) + 48)];
  uint64_t v55 = v25;
  uint64_t v36 = v57;
  uint64_t v35 = v58;
  *unint64_t v34 = v25;
  v34[1] = v36;
  uint64_t v37 = v56;
  v34[2] = v35;
  v34[3] = v37;
  uint64_t v53 = v27;
  uint64_t v38 = v60;
  v34[4] = v27;
  v34[5] = v38;
  uint64_t v39 = v52;
  unint64_t v40 = v51;
  v34[6] = v52;
  v34[7] = v40;
  uint64_t v54 = v29;
  uint64_t v41 = v49;
  v34[8] = v29;
  v34[9] = v41;
  uint64_t v42 = v30;
  v34[10] = v30;
  unint64_t v43 = v50;
  v34[11] = v50;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v44 = v39;
  sub_1D914(v39, v40);
  swift_retain();
  swift_retain();
  sub_1D914(v42, v43);
  uint64_t v45 = *(void (**)(char *, uint64_t))(v62 + 8);
  uint64_t v46 = v63;
  v45(v61, v63);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1DAFC(v44, v40);
  swift_release();
  swift_release();
  sub_1DAFC(v42, v43);
  return ((uint64_t (*)(char *, uint64_t))v45)(v64, v46);
}

uint64_t sub_1B080(uint64_t a1)
{
  sub_20274(0, &qword_4B4C8);
  uint64_t v2 = (void *)sub_27C40();
  sub_27C30();
  sub_27790();

  uint64_t v3 = type metadata accessor for VOTUINemethView();
  sub_16A44(&qword_4B280);
  uint64_t result = sub_27920();
  if (v6 == 1)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t))(a1 + *(int *)(v3 + 52));
    if (v5) {
      return v5(result);
    }
    __break(1u);
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t))(a1 + *(int *)(v3 + 56));
  if (v5) {
    return v5(result);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B16C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for VOTUINemethView();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5 - 8, v8);
  uint64_t v9 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_16A44(&qword_4B498);
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *a2;
  uint64_t v14 = a2[1];
  uint64_t v16 = sub_27C10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  sub_1F49C(a3, (uint64_t)v9);
  sub_27BF0();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_27BE0();
  unint64_t v18 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v19 = (v7 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v17;
  *(void *)(v20 + 24) = &protocol witness table for MainActor;
  sub_1F504((uint64_t)v9, v20 + v18);
  uint64_t v21 = (void *)(v20 + v19);
  void *v21 = v15;
  v21[1] = v14;
  sub_1BA9C((uint64_t)v13, (uint64_t)&unk_4B4A8, v20);
  return swift_release();
}

uint64_t sub_1B344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[7] = a4;
  v6[8] = sub_27BF0();
  v6[9] = sub_27BE0();
  uint64_t v10 = (void *)swift_task_alloc();
  v6[10] = v10;
  *uint64_t v10 = v6;
  v10[1] = sub_1B420;
  v10[20] = a6;
  v10[21] = a4;
  v10[19] = a5;
  return _swift_task_switch(sub_1B630, 0, 0);
}

uint64_t sub_1B420(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 88) = a1;
  *(void *)(v3 + 96) = a2;
  swift_task_dealloc();
  uint64_t v5 = sub_27BD0();
  return _swift_task_switch(sub_1B564, v5, v4);
}

uint64_t sub_1B564()
{
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 56);
  swift_release();
  uint64_t v4 = *(void *)(v3 + 40);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v3 + 24);
  *(void *)(v0 + 32) = v4;
  *(void *)(v0 + 40) = v2;
  *(void *)(v0 + 48) = v1;
  sub_16A44(&qword_4B3C8);
  sub_27A60();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1B60C(uint64_t a1, uint64_t a2)
{
  v3[20] = a2;
  v3[21] = v2;
  v3[19] = a1;
  return _swift_task_switch(sub_1B630, 0, 0);
}

uint64_t sub_1B630()
{
  id v1 = objc_allocWithZone((Class)BRLTTranslationParameters);
  NSString v2 = sub_27B20();
  *(void *)(v0 + 176) = objc_msgSend(v1, "initWithLanguage:mode:partial:useTechnicalTable:textPositionsRange:textFormattingRanges:", v2, 4, 0, 1, 0x7FFFFFFFFFFFFFFFLL, 0, 0);

  *(_DWORD *)(v0 + 208) = *(_DWORD *)(type metadata accessor for VOTUINemethView() + 60);
  sub_27BF0();
  *(void *)(v0 + 184) = sub_27BE0();
  uint64_t v4 = sub_27BD0();
  return _swift_task_switch(sub_1B738, v4, v3);
}

uint64_t sub_1B738()
{
  uint64_t v1 = *(int *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 168);
  swift_release();
  uint64_t v3 = *(void **)(v2 + v1);
  *(void *)(v0 + 192) = v3;
  id v4 = v3;
  return _swift_task_switch(sub_1B7B8, 0, 0);
}

uint64_t sub_1B7B8()
{
  uint64_t v1 = (void *)v0[24];
  if (v1)
  {
    uint64_t v2 = v0[22];
    NSString v3 = sub_27B20();
    v0[25] = v3;
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_1B924;
    uint64_t v4 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_1C500;
    v0[13] = &unk_3ED70;
    v0[14] = v4;
    [v1 textForBraille:v3 parameters:v2 withReply:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {

    uint64_t v5 = (uint64_t (*)(void, unint64_t))v0[1];
    return v5(0, 0xE000000000000000);
  }
}

uint64_t sub_1B924()
{
  return _swift_task_switch(sub_1BA04, 0, 0);
}

uint64_t sub_1BA04()
{
  uint64_t v1 = (void *)v0[24];
  uint64_t v2 = (void *)v0[25];
  NSString v3 = (void *)v0[22];
  uint64_t v4 = v0[15];
  unint64_t v5 = v0[16];
  sub_2020C(v0[17], v0[18]);

  if (v5) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0;
  }
  if (v5) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = 0xE000000000000000;
  }
  uint64_t v8 = (uint64_t (*)(uint64_t, unint64_t))v0[1];
  return v8(v6, v7);
}

uint64_t sub_1BA9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_27C10();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_27C00();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1FEEC(a1, &qword_4B498);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_27BD0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1BC48()
{
  sub_16A44(&qword_4B3C8);
  sub_27A50();
  sub_1FB3C();
  sub_27C80();
  sub_27C80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_24484(0, 0, 0);
  uint64_t result = swift_bridgeObjectRelease();
  if (v0)
  {
    sub_23604();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_27A60();
    swift_release();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

void sub_1BECC(uint64_t a1)
{
  long long v4 = *(_OWORD *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 104);
  sub_16A44(&qword_4B3D0);
  sub_27A50();
  id v1 = objc_allocWithZone((Class)UIImage);
  Class isa = sub_27730().super.isa;
  id v3 = objc_msgSend(v1, "initWithData:", isa, v4, v5);
  sub_1DAFC(v6, v7);

  if (v3)
  {
    sub_16A44(&qword_4B450);
    sub_27A60();
  }
}

uint64_t sub_1BFA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v23 = sub_16A44(&qword_4B3D8);
  __chkstk_darwin(v23, v3);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_16A44(&qword_4B3E0);
  uint64_t v6 = *(void *)(v22 - 8);
  __chkstk_darwin(v22, v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_27910();
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v12 = sub_16A44(&qword_4B3E8);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_27900();
  uint64_t v26 = a1;
  sub_16A44(&qword_4B3F0);
  sub_2117C(&qword_4B3F8, &qword_4B3F0);
  sub_277B0();
  sub_278F0();
  uint64_t v25 = a1;
  sub_16A44(&qword_4B400);
  sub_2117C(&qword_4B408, &qword_4B400);
  sub_277B0();
  uint64_t v17 = &v5[*(int *)(v23 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v5, v16, v12);
  unint64_t v18 = v17;
  uint64_t v19 = v22;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v18, v9, v22);
  sub_27820();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v12);
}

uint64_t sub_1C2EC()
{
  return sub_27990();
}

uint64_t sub_1C37C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_27A30();
  *a1 = result;
  return result;
}

uint64_t sub_1C3BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for VOTUINemethView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8, v5);
  sub_27800();
  sub_1F49C(a1, (uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  sub_1F504((uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  return sub_27A90();
}

uint64_t sub_1C500(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v5 = sub_27B30();
    uint64_t v7 = v6;
    if (v3)
    {
LABEL_3:
      id v8 = v3;
      uint64_t v3 = (void *)sub_27740();
      unint64_t v10 = v9;

      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  unint64_t v10 = 0xF000000000000000;
LABEL_6:
  uint64_t v11 = *(uint64_t **)(*(void *)(v4 + 64) + 40);
  uint64_t *v11 = v5;
  v11[1] = v7;
  void v11[2] = (uint64_t)v3;
  v11[3] = v10;

  return _swift_continuation_resume(v4);
}

uint64_t sub_1C5B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v2 = sub_16A44(&qword_4B350);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = v1;
  uint64_t v26 = sub_16A44(&qword_4B358);
  uint64_t v25 = sub_1F360(&qword_4B360);
  uint64_t v7 = sub_1F360(&qword_4B368);
  uint64_t v8 = sub_1F360(&qword_4B370);
  uint64_t v9 = sub_1F360(&qword_4B378);
  uint64_t v10 = sub_1F360(&qword_4B380);
  uint64_t v11 = sub_1F360(&qword_4B388);
  unint64_t v12 = sub_1F3A8();
  uint64_t v29 = v11;
  uint64_t v30 = &type metadata for Bool;
  unint64_t v31 = v12;
  uint64_t v32 = &protocol witness table for Bool;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v29 = v10;
  uint64_t v30 = &type metadata for String;
  unint64_t v31 = OpaqueTypeConformance2;
  uint64_t v32 = &protocol witness table for String;
  uint64_t v14 = swift_getOpaqueTypeConformance2();
  uint64_t v29 = v9;
  uint64_t v30 = &type metadata for String;
  unint64_t v31 = v14;
  uint64_t v32 = &protocol witness table for String;
  uint64_t v15 = swift_getOpaqueTypeConformance2();
  unint64_t v16 = sub_1F448();
  uint64_t v29 = v8;
  uint64_t v30 = &type metadata for Data;
  unint64_t v31 = v15;
  uint64_t v32 = (void *)v16;
  uint64_t v17 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = sub_2117C(&qword_4B3B0, &qword_4B368);
  uint64_t v29 = v25;
  uint64_t v30 = (void *)v7;
  unint64_t v31 = v17;
  uint64_t v32 = (void *)v18;
  swift_getOpaqueTypeConformance2();
  sub_277D0();
  uint64_t v19 = sub_277E0();
  char v20 = sub_27980();
  uint64_t v21 = v27;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(v27, v6, v2);
  uint64_t v22 = v21 + *(int *)(sub_16A44(&qword_4B3B8) + 36);
  *(void *)uint64_t v22 = v19;
  *(unsigned char *)(v22 + 8) = v20;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_1C91C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[17] = a4;
  v5[18] = a5;
  sub_27BF0();
  v5[19] = sub_27BE0();
  uint64_t v7 = sub_27BD0();
  v5[20] = v7;
  v5[21] = v6;
  return _swift_task_switch(sub_1C9B4, v7, v6);
}

uint64_t sub_1C9B4()
{
  uint64_t v1 = (void *)v0[17];
  id v2 = [objc_allocWithZone((Class)WKSnapshotConfiguration) init];
  v0[22] = v2;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_1CAE0;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_1CD80;
  v0[13] = &unk_3EE00;
  v0[14] = v3;
  [v1 takeSnapshotWithConfiguration:v2 completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1CAE0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 184) = v2;
  uint64_t v3 = *(void *)(v1 + 168);
  uint64_t v4 = *(void *)(v1 + 160);
  if (v2) {
    uint64_t v5 = sub_1CD08;
  }
  else {
    uint64_t v5 = sub_1CC10;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_1CC10()
{
  uint64_t v1 = *(void **)(v0 + 176);
  swift_release();
  uint64_t v2 = *(UIImage **)(v0 + 120);
  uint64_t v3 = UIImageJPEGRepresentation(v2, 1.0);

  if (v3)
  {
    uint64_t v4 = *(void *)(v0 + 144);
    uint64_t v5 = sub_27740();
    uint64_t v7 = v6;

    uint64_t v8 = *(void *)(v4 + OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent + 40);
    long long v9 = *(_OWORD *)(v4 + OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent + 48);
    *(void *)(v0 + 80) = *(void *)(v4 + OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent + 32);
    *(void *)(v0 + 88) = v8;
    *(_OWORD *)(v0 + 96) = v9;
    *(void *)(v0 + 120) = v5;
    *(void *)(v0 + 128) = v7;
    sub_16A44(&qword_4B538);
    sub_27AB0();
  }
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_1CD08()
{
  uint64_t v1 = *(void **)(v0 + 176);
  swift_release();
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1CD80(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_16A44(&qword_4B540);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t sub_1CE40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_27C10();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_27C00();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_1FEEC(a1, &qword_4B498);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_27BD0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1CFC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_27BF0();
  v5[4] = sub_27BE0();
  uint64_t v7 = sub_27BD0();
  return _swift_task_switch(sub_1D060, v7, v6);
}

uint64_t sub_1D060()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_release();
  *(void *)(swift_allocObject() + 16) = v1;
  id v2 = objc_allocWithZone((Class)WKPDFConfiguration);
  id v3 = v1;
  id v4 = [v2 init];
  sub_27C50();
  swift_release();

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

void sub_1D138(uint64_t a1, unint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    swift_errorRetain();
    os_log_type_t v7 = sub_27C20();
    sub_20274(0, &qword_4B4C8);
    swift_errorRetain();
    swift_errorRetain();
    id v8 = sub_27C40();
    os_log_type_t v9 = v7;
    if (os_log_type_enabled(v8, v7))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      v13[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      swift_getErrorValue();
      uint64_t v11 = sub_27D40();
      sub_202B0(v11, v12, v13);
      sub_27C60();
      swift_bridgeObjectRelease();
      sub_210CC(a1, a2, 1);
      sub_210CC(a1, a2, 1);
      _os_log_impl(&dword_0, v8, v9, "Error creating PDF... %s", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      sub_210CC(a1, a2, 1);
    }
    else
    {
      sub_210CC(a1, a2, 1);

      sub_210CC(a1, a2, 1);
      sub_210CC(a1, a2, 1);
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a4 + OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent + 72);
    v13[0] = *(void *)(a4 + OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent + 64);
    v13[1] = v6;
    long long v14 = *(_OWORD *)(a4 + OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent + 80);
    sub_1D914(a1, a2);
    sub_16A44(&qword_4B538);
    sub_27AB0();
  }
}

id sub_1D4C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NemethView.Coordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NemethView.Coordinator()
{
  return self;
}

uint64_t sub_1D5F4(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *(void *)a1 = *a2;
    a1 = v22 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    uint64_t v10 = (void *)a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v10;
    uint64_t v11 = a2[11];
    *(void *)(a1 + 80) = a2[10];
    unint64_t v41 = a2[12];
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    id v12 = v10;
    swift_retain();
    sub_1D914(v11, v41);
    *(void *)(a1 + 88) = v11;
    *(void *)(a1 + 96) = v41;
    uint64_t v13 = a2[14];
    *(void *)(a1 + 104) = a2[13];
    unint64_t v14 = a2[15];
    swift_retain();
    sub_1D914(v13, v14);
    *(void *)(a1 + 112) = v13;
    *(void *)(a1 + 120) = v14;
    *(void *)(a1 + 128) = a2[16];
    *(unsigned char *)(a1 + 136) = *((unsigned char *)a2 + 136);
    *(void *)(a1 + 144) = a2[18];
    uint64_t v15 = a3[11];
    unint64_t v16 = (char *)(a1 + v15);
    uint64_t v17 = (char *)a2 + v15;
    *(unsigned char *)(a1 + 152) = *((unsigned char *)a2 + 152);
    uint64_t v18 = sub_27960();
    uint64_t v19 = *(void *)(v18 - 8);
    char v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
    swift_retain();
    swift_retain();
    if (v20(v17, 1, v18))
    {
      uint64_t v21 = sub_16A44(&qword_4B278);
      memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
    uint64_t v23 = (int *)sub_16A44(&qword_4B280);
    v16[v23[9]] = v17[v23[9]];
    *(void *)&v16[v23[10]] = *(void *)&v17[v23[10]];
    v16[v23[11]] = v17[v23[11]];
    uint64_t v24 = a3[12];
    uint64_t v25 = (void *)(a1 + v24);
    uint64_t v26 = (uint64_t)a2 + v24;
    uint64_t v27 = *(uint64_t *)((char *)a2 + v24);
    swift_retain();
    if (v27)
    {
      uint64_t v28 = *(void *)(v26 + 8);
      *uint64_t v25 = v27;
      v25[1] = v28;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
    }
    uint64_t v29 = a3[13];
    uint64_t v30 = (void *)(a1 + v29);
    unint64_t v31 = (uint64_t *)((char *)a2 + v29);
    if (*v31)
    {
      uint64_t v32 = v31[1];
      *uint64_t v30 = *v31;
      v30[1] = v32;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
    }
    uint64_t v33 = a3[14];
    unint64_t v34 = (void *)(a1 + v33);
    uint64_t v35 = (uint64_t *)((char *)a2 + v33);
    if (*v35)
    {
      uint64_t v36 = v35[1];
      *unint64_t v34 = *v35;
      v34[1] = v36;
      swift_retain();
    }
    else
    {
      *(_OWORD *)unint64_t v34 = *(_OWORD *)v35;
    }
    uint64_t v37 = a3[15];
    uint64_t v38 = *(void **)((char *)a2 + v37);
    *(void *)(a1 + v37) = v38;
    id v39 = v38;
  }
  return a1;
}

uint64_t sub_1D914(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

void sub_1D96C(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  sub_1DAFC(*(void *)(a1 + 88), *(void *)(a1 + 96));
  swift_release();
  sub_1DAFC(*(void *)(a1 + 112), *(void *)(a1 + 120));
  swift_release();
  swift_release();
  uint64_t v4 = a1 + a2[11];
  uint64_t v5 = sub_27960();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  sub_16A44(&qword_4B280);
  swift_release();
  if (*(void *)(a1 + a2[12])) {
    swift_release();
  }
  if (*(void *)(a1 + a2[13])) {
    swift_release();
  }
  if (*(void *)(a1 + a2[14])) {
    swift_release();
  }
  uint64_t v7 = *(void **)(a1 + a2[15]);
}

uint64_t sub_1DAFC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_1DB54(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = *(void **)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  unint64_t v39 = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  id v11 = v9;
  swift_retain();
  sub_1D914(v10, v39);
  *(void *)(a1 + 88) = v10;
  *(void *)(a1 + 96) = v39;
  uint64_t v12 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  unint64_t v13 = *(void *)(a2 + 120);
  swift_retain();
  sub_1D914(v12, v13);
  *(void *)(a1 + 112) = v12;
  *(void *)(a1 + 120) = v13;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  uint64_t v14 = a3[11];
  uint64_t v15 = (char *)(a1 + v14);
  unint64_t v16 = (char *)(a2 + v14);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  uint64_t v17 = sub_27960();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  swift_retain();
  swift_retain();
  if (v19(v16, 1, v17))
  {
    uint64_t v20 = sub_16A44(&qword_4B278);
    memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  uint64_t v21 = (int *)sub_16A44(&qword_4B280);
  v15[v21[9]] = v16[v21[9]];
  *(void *)&v15[v21[10]] = *(void *)&v16[v21[10]];
  v15[v21[11]] = v16[v21[11]];
  uint64_t v22 = a3[12];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = a2 + v22;
  uint64_t v25 = *(void *)(a2 + v22);
  swift_retain();
  if (v25)
  {
    uint64_t v26 = *(void *)(v24 + 8);
    void *v23 = v25;
    v23[1] = v26;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  }
  uint64_t v27 = a3[13];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  if (*v29)
  {
    uint64_t v30 = v29[1];
    *uint64_t v28 = *v29;
    v28[1] = v30;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
  }
  uint64_t v31 = a3[14];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)(a2 + v31);
  if (*v33)
  {
    uint64_t v34 = v33[1];
    *uint64_t v32 = *v33;
    v32[1] = v34;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
  }
  uint64_t v35 = a3[15];
  uint64_t v36 = *(void **)(a2 + v35);
  *(void *)(a1 + v35) = v36;
  id v37 = v36;
  return a1;
}

uint64_t sub_1DE28(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  uint64_t v6 = *(void **)(a2 + 72);
  uint64_t v7 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v6;
  id v8 = v6;

  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  uint64_t v9 = *(void *)(a2 + 88);
  unint64_t v10 = *(void *)(a2 + 96);
  sub_1D914(v9, v10);
  uint64_t v11 = *(void *)(a1 + 88);
  unint64_t v12 = *(void *)(a1 + 96);
  *(void *)(a1 + 88) = v9;
  *(void *)(a1 + 96) = v10;
  sub_1DAFC(v11, v12);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  uint64_t v13 = *(void *)(a2 + 112);
  unint64_t v14 = *(void *)(a2 + 120);
  sub_1D914(v13, v14);
  uint64_t v15 = *(void *)(a1 + 112);
  unint64_t v16 = *(void *)(a1 + 120);
  *(void *)(a1 + 112) = v13;
  *(void *)(a1 + 120) = v14;
  sub_1DAFC(v15, v16);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  uint64_t v17 = a3[11];
  uint64_t v18 = (char *)(a1 + v17);
  uint64_t v19 = (char *)(a2 + v17);
  uint64_t v20 = sub_27960();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  int v23 = v22(v18, 1, v20);
  int v24 = v22(v19, 1, v20);
  if (v23)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v24)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
LABEL_6:
    uint64_t v25 = sub_16A44(&qword_4B278);
    memcpy(v18, v19, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 24))(v18, v19, v20);
LABEL_7:
  uint64_t v26 = (int *)sub_16A44(&qword_4B280);
  v18[v26[9]] = v19[v26[9]];
  *(void *)&v18[v26[10]] = *(void *)&v19[v26[10]];
  swift_retain();
  swift_release();
  v18[v26[11]] = v19[v26[11]];
  uint64_t v27 = a3[12];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = a2 + v27;
  uint64_t v30 = *(void *)(a1 + v27);
  uint64_t v31 = *(void *)(a2 + v27);
  if (v30)
  {
    if (v31)
    {
      uint64_t v32 = *(void *)(v29 + 8);
      *uint64_t v28 = v31;
      v28[1] = v32;
      swift_retain();
      swift_release();
      goto LABEL_14;
    }
    swift_release();
  }
  else if (v31)
  {
    uint64_t v33 = *(void *)(v29 + 8);
    *uint64_t v28 = v31;
    v28[1] = v33;
    swift_retain();
    goto LABEL_14;
  }
  *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
LABEL_14:
  uint64_t v34 = a3[13];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = a2 + v34;
  uint64_t v37 = *(void *)(a1 + v34);
  uint64_t v38 = *(void *)(a2 + v34);
  if (v37)
  {
    if (v38)
    {
      uint64_t v39 = *(void *)(v36 + 8);
      *uint64_t v35 = v38;
      v35[1] = v39;
      swift_retain();
      swift_release();
      goto LABEL_21;
    }
    swift_release();
  }
  else if (v38)
  {
    uint64_t v40 = *(void *)(v36 + 8);
    *uint64_t v35 = v38;
    v35[1] = v40;
    swift_retain();
    goto LABEL_21;
  }
  *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
LABEL_21:
  uint64_t v41 = a3[14];
  uint64_t v42 = (void *)(a1 + v41);
  uint64_t v43 = a2 + v41;
  uint64_t v44 = *(void *)(a1 + v41);
  uint64_t v45 = *(void *)(a2 + v41);
  if (!v44)
  {
    if (v45)
    {
      uint64_t v47 = *(void *)(v43 + 8);
      *uint64_t v42 = v45;
      v42[1] = v47;
      swift_retain();
      goto LABEL_28;
    }
LABEL_27:
    *(_OWORD *)uint64_t v42 = *(_OWORD *)v43;
    goto LABEL_28;
  }
  if (!v45)
  {
    swift_release();
    goto LABEL_27;
  }
  uint64_t v46 = *(void *)(v43 + 8);
  *uint64_t v42 = v45;
  v42[1] = v46;
  swift_retain();
  swift_release();
LABEL_28:
  uint64_t v48 = a3[15];
  uint64_t v49 = *(void **)(a1 + v48);
  unint64_t v50 = *(void **)(a2 + v48);
  *(void *)(a1 + v48) = v50;
  id v51 = v50;

  return a1;
}

uint64_t sub_1E27C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  uint64_t v6 = a3[11];
  uint64_t v7 = (char *)(a1 + v6);
  id v8 = (char *)(a2 + v6);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  uint64_t v9 = sub_27960();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_16A44(&qword_4B278);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  unint64_t v12 = (int *)sub_16A44(&qword_4B280);
  v7[v12[9]] = v8[v12[9]];
  *(void *)&v7[v12[10]] = *(void *)&v8[v12[10]];
  v7[v12[11]] = v8[v12[11]];
  uint64_t v13 = a3[12];
  unint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v16 = *v15;
  if (*v15)
  {
    uint64_t v17 = v15[1];
    *unint64_t v14 = v16;
    v14[1] = v17;
  }
  else
  {
    *(_OWORD *)unint64_t v14 = *(_OWORD *)v15;
  }
  uint64_t v18 = a3[13];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v21 = *v20;
  if (*v20)
  {
    uint64_t v22 = v20[1];
    *uint64_t v19 = v21;
    v19[1] = v22;
  }
  else
  {
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  }
  uint64_t v23 = a3[14];
  int v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v26 = *v25;
  if (*v25)
  {
    uint64_t v27 = v25[1];
    void *v24 = v26;
    v24[1] = v27;
  }
  else
  {
    *(_OWORD *)int v24 = *(_OWORD *)v25;
  }
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  return a1;
}

uint64_t sub_1E4B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  uint64_t v9 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);

  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  uint64_t v10 = *(void *)(a1 + 88);
  unint64_t v11 = *(void *)(a1 + 96);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  sub_1DAFC(v10, v11);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_release();
  uint64_t v12 = *(void *)(a1 + 112);
  unint64_t v13 = *(void *)(a1 + 120);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  sub_1DAFC(v12, v13);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_release();
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_release();
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  uint64_t v14 = a3[11];
  uint64_t v15 = (char *)(a1 + v14);
  uint64_t v16 = (char *)(a2 + v14);
  uint64_t v17 = sub_27960();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  int v20 = v19(v15, 1, v17);
  int v21 = v19(v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
LABEL_6:
    uint64_t v22 = sub_16A44(&qword_4B278);
    memcpy(v15, v16, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v15, v16, v17);
LABEL_7:
  uint64_t v23 = (int *)sub_16A44(&qword_4B280);
  v15[v23[9]] = v16[v23[9]];
  *(void *)&v15[v23[10]] = *(void *)&v16[v23[10]];
  swift_release();
  v15[v23[11]] = v16[v23[11]];
  uint64_t v24 = a3[12];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = a2 + v24;
  uint64_t v27 = *(void *)(a1 + v24);
  uint64_t v28 = *(void *)(a2 + v24);
  if (v27)
  {
    if (v28)
    {
      uint64_t v29 = *(void *)(v26 + 8);
      *uint64_t v25 = v28;
      v25[1] = v29;
      swift_release();
      goto LABEL_14;
    }
    swift_release();
  }
  else if (v28)
  {
    uint64_t v30 = *(void *)(v26 + 8);
    *uint64_t v25 = v28;
    v25[1] = v30;
    goto LABEL_14;
  }
  *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
LABEL_14:
  uint64_t v31 = a3[13];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = a2 + v31;
  uint64_t v34 = *(void *)(a1 + v31);
  uint64_t v35 = *(void *)(a2 + v31);
  if (v34)
  {
    if (v35)
    {
      uint64_t v36 = *(void *)(v33 + 8);
      *uint64_t v32 = v35;
      v32[1] = v36;
      swift_release();
      goto LABEL_21;
    }
    swift_release();
  }
  else if (v35)
  {
    uint64_t v37 = *(void *)(v33 + 8);
    *uint64_t v32 = v35;
    v32[1] = v37;
    goto LABEL_21;
  }
  *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
LABEL_21:
  uint64_t v38 = a3[14];
  uint64_t v39 = (void *)(a1 + v38);
  uint64_t v40 = a2 + v38;
  uint64_t v41 = *(void *)(a1 + v38);
  uint64_t v42 = *(void *)(a2 + v38);
  if (!v41)
  {
    if (v42)
    {
      uint64_t v44 = *(void *)(v40 + 8);
      *uint64_t v39 = v42;
      v39[1] = v44;
      goto LABEL_28;
    }
LABEL_27:
    *(_OWORD *)uint64_t v39 = *(_OWORD *)v40;
    goto LABEL_28;
  }
  if (!v42)
  {
    swift_release();
    goto LABEL_27;
  }
  uint64_t v43 = *(void *)(v40 + 8);
  *uint64_t v39 = v42;
  v39[1] = v43;
  swift_release();
LABEL_28:
  uint64_t v45 = a3[15];
  uint64_t v46 = *(void **)(a1 + v45);
  *(void *)(a1 + v45) = *(void *)(a2 + v45);

  return a1;
}

uint64_t sub_1E854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1E868);
}

uint64_t sub_1E868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_16A44(&qword_4B280);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 44);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1E91C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1E930);
}

uint64_t sub_1E930(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_16A44(&qword_4B280);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 44);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for VOTUINemethView()
{
  uint64_t result = qword_4B2E0;
  if (!qword_4B2E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1EA28()
{
  sub_1EAFC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1EAFC()
{
  if (!qword_4B2F0)
  {
    unint64_t v0 = sub_27950();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_4B2F0);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for NemethView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for NemethView(void *a1)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1DAFC(a1[6], a1[7]);
  swift_release();
  swift_release();
  uint64_t v2 = a1[10];
  unint64_t v3 = a1[11];

  return sub_1DAFC(v2, v3);
}

void *initializeWithCopy for NemethView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = a2[6];
  unint64_t v8 = a2[7];
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1D914(v7, v8);
  a1[6] = v7;
  a1[7] = v8;
  uint64_t v9 = a2[9];
  a1[8] = a2[8];
  a1[9] = v9;
  uint64_t v11 = a2[10];
  unint64_t v10 = a2[11];
  swift_retain();
  swift_retain();
  sub_1D914(v11, v10);
  a1[10] = v11;
  a1[11] = v10;
  return a1;
}

void *assignWithCopy for NemethView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  uint64_t v4 = a2[6];
  unint64_t v5 = a2[7];
  sub_1D914(v4, v5);
  uint64_t v6 = a1[6];
  unint64_t v7 = a1[7];
  a1[6] = v4;
  a1[7] = v5;
  sub_1DAFC(v6, v7);
  a1[8] = a2[8];
  swift_retain();
  swift_release();
  a1[9] = a2[9];
  swift_retain();
  swift_release();
  uint64_t v9 = a2[10];
  unint64_t v8 = a2[11];
  sub_1D914(v9, v8);
  uint64_t v10 = a1[10];
  unint64_t v11 = a1[11];
  a1[10] = v9;
  a1[11] = v8;
  sub_1DAFC(v10, v11);
  return a1;
}

__n128 initializeWithTake for NemethView(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for NemethView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  uint64_t v4 = *(void *)(a1 + 48);
  unint64_t v5 = *(void *)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  sub_1DAFC(v4, v5);
  swift_release();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  uint64_t v6 = *(void *)(a1 + 80);
  unint64_t v7 = *(void *)(a1 + 88);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  sub_1DAFC(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for NemethView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NemethView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NemethView()
{
  return &type metadata for NemethView;
}

void *sub_1EF48()
{
  return &protocol witness table for Never;
}

void sub_1EF54(void *a1)
{
  sub_16A44(&qword_4B4F0);
  sub_27970();
  [a1 setNavigationDelegate:v4];

  long long v5 = *v1;
  long long v6 = v1[1];
  sub_16A44(&qword_4B4F8);
  sub_27AA0();
  NSString v3 = sub_27B20();
  swift_bridgeObjectRelease();
}

id sub_1F01C()
{
  id v0 = objc_allocWithZone((Class)WKWebView);

  return [v0 init];
}

id sub_1F060@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[5];
  uint64_t v15 = v1[4];
  uint64_t v6 = v1[6];
  unint64_t v16 = v1[7];
  uint64_t v17 = v1[2];
  uint64_t v7 = v1[8];
  uint64_t v14 = v1[9];
  uint64_t v9 = v1[10];
  unint64_t v8 = v1[11];
  uint64_t v18 = (objc_class *)type metadata accessor for NemethView.Coordinator();
  uint64_t v10 = (char *)objc_allocWithZone(v18);
  unint64_t v11 = &v10[OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator__htmlString];
  *(void *)unint64_t v11 = 0;
  *((void *)v11 + 1) = 0xE000000000000000;
  uint64_t v12 = &v10[OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent];
  *(void *)uint64_t v12 = v2;
  *((void *)v12 + 1) = v3;
  *((void *)v12 + 2) = v17;
  *((void *)v12 + 3) = v4;
  *((void *)v12 + 4) = v15;
  *((void *)v12 + 5) = v5;
  *((void *)v12 + 6) = v6;
  *((void *)v12 + 7) = v16;
  *((void *)v12 + 8) = v7;
  *((void *)v12 + 9) = v14;
  *((void *)v12 + 10) = v9;
  *((void *)v12 + 11) = v8;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1D914(v6, v16);
  swift_retain();
  swift_retain();
  sub_1D914(v9, v8);
  v20.receiver = v10;
  v20.super_class = v18;
  id result = objc_msgSendSuper2(&v20, "init");
  *a1 = result;
  return result;
}

uint64_t sub_1F194()
{
  return sub_27860();
}

uint64_t sub_1F1D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_20220();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1F23C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_20220();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1F2A0()
{
  return sub_279D0();
}

void sub_1F2BC()
{
}

unint64_t sub_1F2E8()
{
  unint64_t result = qword_4B348;
  if (!qword_4B348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4B348);
  }
  return result;
}

uint64_t sub_1F33C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1F358@<X0>(uint64_t a1@<X8>)
{
  return sub_1A208(*(void *)(v1 + 16), a1);
}

uint64_t sub_1F360(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1F3A8()
{
  unint64_t result = qword_4B390;
  if (!qword_4B390)
  {
    sub_1F360(&qword_4B388);
    sub_2117C(&qword_4B398, &qword_4B3A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4B390);
  }
  return result;
}

unint64_t sub_1F448()
{
  unint64_t result = qword_4B3A8;
  if (!qword_4B3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4B3A8);
  }
  return result;
}

uint64_t sub_1F49C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VOTUINemethView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1F504(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VOTUINemethView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1F568()
{
  return sub_1FAC8(sub_1B080);
}

uint64_t sub_1F584(uint64_t a1, uint64_t a2)
{
  return sub_1F5B8(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1B16C);
}

uint64_t sub_1F5A0(uint64_t a1, uint64_t a2)
{
  return sub_1F5B8(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1BC48);
}

uint64_t sub_1F5B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(type metadata accessor for VOTUINemethView() - 8);
  uint64_t v7 = v3 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return a3(a1, a2, v7);
}

uint64_t sub_1F650()
{
  return sub_1FAC8((uint64_t (*)(uint64_t))sub_1BECC);
}

uint64_t sub_1F668@<X0>(uint64_t a1@<X8>)
{
  return sub_1BFA4(*(void *)(v1 + 16), a1);
}

uint64_t sub_1F670()
{
  return sub_1C2EC();
}

uint64_t sub_1F678()
{
  return sub_1C3BC(*(void *)(v0 + 16));
}

uint64_t sub_1F684()
{
  return sub_1FAC8(sub_18F58);
}

uint64_t sub_1F69C@<X0>(char *a1@<X8>)
{
  return sub_18FA0(*(void *)(v1 + 16), a1);
}

unint64_t sub_1F6A4()
{
  unint64_t result = qword_4B418;
  if (!qword_4B418)
  {
    sub_1F360(&qword_4B410);
    sub_2117C(&qword_4B420, &qword_4B428);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4B418);
  }
  return result;
}

uint64_t sub_1F740()
{
  return sub_1FAC8(sub_19BF4);
}

uint64_t sub_1F75C()
{
  return sub_1FAC8((uint64_t (*)(uint64_t))sub_19EA4);
}

unint64_t sub_1F774()
{
  unint64_t result = qword_4B458;
  if (!qword_4B458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4B458);
  }
  return result;
}

unint64_t sub_1F7C8()
{
  unint64_t result = qword_4B478;
  if (!qword_4B478)
  {
    sub_20274(255, (unint64_t *)&qword_4B470);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4B478);
  }
  return result;
}

uint64_t sub_1F830(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_16A44(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1F894(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1F8A4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1F8B8()
{
  uint64_t v1 = (int *)type metadata accessor for VOTUINemethView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  sub_1DAFC(*(void *)(v5 + 88), *(void *)(v5 + 96));
  swift_release();
  sub_1DAFC(*(void *)(v5 + 112), *(void *)(v5 + 120));
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[11];
  uint64_t v7 = sub_27960();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  sub_16A44(&qword_4B280);
  swift_release();
  if (*(void *)(v5 + v1[12])) {
    swift_release();
  }
  if (*(void *)(v5 + v1[13])) {
    swift_release();
  }
  if (*(void *)(v5 + v1[14])) {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1FAC8(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for VOTUINemethView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

unint64_t sub_1FB3C()
{
  unint64_t result = qword_4B488;
  if (!qword_4B488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4B488);
  }
  return result;
}

uint64_t sub_1FB90()
{
  uint64_t v1 = (int *)type metadata accessor for VOTUINemethView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_unknownObjectRelease();
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  sub_1DAFC(*(void *)(v5 + 88), *(void *)(v5 + 96));
  swift_release();
  sub_1DAFC(*(void *)(v5 + 112), *(void *)(v5 + 120));
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[11];
  uint64_t v7 = sub_27960();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  sub_16A44(&qword_4B280);
  swift_release();
  if (*(void *)(v5 + v1[12])) {
    swift_release();
  }
  if (*(void *)(v5 + v1[13])) {
    swift_release();
  }
  if (*(void *)(v5 + v1[14])) {
    swift_release();
  }

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

uint64_t sub_1FDC0(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for VOTUINemethView() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = (uint64_t *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_211C0;
  return sub_1B344(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_1FEEC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_16A44(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1FF48(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_20024;
  return v6(a1);
}

uint64_t sub_20024()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2011C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_20154(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_211C0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_4B4B0 + dword_4B4B0);
  return v6(a1, v4);
}

uint64_t sub_2020C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1DAFC(a1, a2);
  }
  return a1;
}

unint64_t sub_20220()
{
  unint64_t result = qword_4B500;
  if (!qword_4B500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4B500);
  }
  return result;
}

uint64_t sub_20274(uint64_t a1, unint64_t *a2)
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

uint64_t sub_202B0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_20384(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_20D64((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_20D64((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_16BAC((uint64_t)v12);
  return v7;
}

uint64_t sub_20384(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_27C70();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_20540(a5, a6);
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
  uint64_t v8 = sub_27CB0();
  if (!v8)
  {
    sub_27CC0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_27CF0();
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

uint64_t sub_20540(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_205D8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_207B8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_207B8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_205D8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_20750(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_27CA0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_27CC0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_27B90();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_27CF0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_27CC0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_20750(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_16A44(&qword_4B510);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  _OWORD v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_207B8(char a1, int64_t a2, char a3, char *a4)
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
    sub_16A44(&qword_4B510);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_27CF0();
  __break(1u);
  return result;
}

uint64_t sub_20908(void *a1)
{
  uint64_t v3 = sub_16A44(&qword_4B498);
  __chkstk_darwin(v3 - 8, v4);
  unint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v7 = &v1[OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator__htmlString];
  uint64_t v9 = *(void *)&v1[OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator__htmlString];
  uint64_t v8 = *(void *)&v1[OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator__htmlString + 8];
  uint64_t v10 = &v1[OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent];
  uint64_t v11 = *(void *)&v1[OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent + 16];
  uint64_t v12 = *(void *)&v1[OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent + 24];
  long long v30 = *(_OWORD *)&v1[OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent];
  uint64_t v31 = v11;
  uint64_t v32 = v12;
  swift_bridgeObjectRetain();
  sub_16A44(&qword_4B4F8);
  sub_27AA0();
  if (v9 == v33 && v8 == v34)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v14 = sub_27D20();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v14) {
      return result;
    }
    uint64_t v16 = sub_27C10();
    uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
    v29(v6, 1, 1, v16);
    sub_27BF0();
    id v17 = a1;
    uint64_t v18 = v1;
    uint64_t v19 = sub_27BE0();
    objc_super v20 = (void *)swift_allocObject();
    v20[2] = v19;
    v20[3] = &protocol witness table for MainActor;
    v20[4] = v17;
    v20[5] = v18;
    sub_1CE40((uint64_t)v6, (uint64_t)&unk_4B520, (uint64_t)v20);
    swift_release();
    v29(v6, 1, 1, v16);
    id v21 = v17;
    uint64_t v22 = v18;
    uint64_t v23 = sub_27BE0();
    uint64_t v24 = (void *)swift_allocObject();
    v24[2] = v23;
    v24[3] = &protocol witness table for MainActor;
    v24[4] = v21;
    v24[5] = v22;
    sub_1BA9C((uint64_t)v6, (uint64_t)&unk_4B530, (uint64_t)v24);
    swift_release();
    uint64_t v25 = *((void *)v10 + 2);
    uint64_t v26 = *((void *)v10 + 3);
    long long v30 = *(_OWORD *)v10;
    uint64_t v31 = v25;
    uint64_t v32 = v26;
    sub_27AA0();
    uint64_t v27 = v34;
    *(void *)int64_t v7 = v33;
    *((void *)v7 + 1) = v27;
  }
  return swift_bridgeObjectRelease();
}

void sub_20B98(uint64_t a1, const char *a2)
{
  os_log_type_t v3 = sub_27C20();
  sub_20274(0, &qword_4B4C8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = sub_27C40();
  os_log_type_t v5 = v3;
  if (os_log_type_enabled(v4, v3))
  {
    unint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)unint64_t v6 = 136315138;
    swift_getErrorValue();
    uint64_t v7 = sub_27D40();
    sub_202B0(v7, v8, &v9);
    sub_27C60();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v4, v5, a2, v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
}

uint64_t sub_20D64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_20DC8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *unint64_t v8 = v2;
  v8[1] = sub_20E88;
  return sub_1C91C(a1, v4, v5, v7, v6);
}

uint64_t sub_20E88()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_20F80()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_20FC8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *unint64_t v8 = v2;
  v8[1] = sub_20E88;
  return sub_1CFC8(a1, v4, v5, v7, v6);
}

uint64_t sub_21088()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_210C0(uint64_t a1, unint64_t a2, char a3)
{
  sub_1D138(a1, a2, a3 & 1, *(void *)(v3 + 16));
}

uint64_t sub_210CC(uint64_t a1, unint64_t a2, char a3)
{
  if (a3) {
    return swift_errorRelease();
  }
  else {
    return sub_1DAFC(a1, a2);
  }
}

unint64_t sub_210DC()
{
  unint64_t result = qword_4B548;
  if (!qword_4B548)
  {
    sub_1F360(&qword_4B3B8);
    sub_2117C((unint64_t *)&unk_4B550, &qword_4B350);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4B548);
  }
  return result;
}

uint64_t sub_2117C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1F360(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_211C8()
{
  uint64_t v1 = *(void *)(v0 + 56);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(v0 + 64);
  if (!v2) {
    return 0;
  }
  swift_beginAccess();
  if (!*(void *)(*(void *)(v1 + 16) + 16)) {
    return 0;
  }
  swift_beginAccess();
  if (!*(void *)(*(void *)(v2 + 16) + 16)) {
    return 0;
  }
  swift_retain();
  swift_retain();
  uint64_t v3 = sub_238D0();
  uint64_t v5 = sub_238D0();
  unint64_t v19 = 0xD000000000000029;
  unint64_t v20 = 0x80000000000381A0;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v3 + 16);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v8 = v6 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_16B04(v8, (uint64_t)v16);
      uint64_t v10 = v17;
      uint64_t v9 = v18;
      sub_16B68(v16, v17);
      v21._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v9 + 16) + 8))(v10);
      sub_27B80(v21);
      swift_bridgeObjectRelease();
      sub_16BAC((uint64_t)v16);
      v8 += 40;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  v22._countAndFlagsBits = 0x3C3E776F726D2F3CLL;
  v22._object = (void *)0xED00003E776F726DLL;
  sub_27B80(v22);
  swift_beginAccess();
  uint64_t v11 = *(void *)(v5 + 16);
  uint64_t v12 = *(void *)(v11 + 16);
  if (v12)
  {
    uint64_t v13 = v11 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_16B04(v13, (uint64_t)v16);
      uint64_t v15 = v17;
      uint64_t v14 = v18;
      sub_16B68(v16, v17);
      v23._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v14 + 16) + 8))(v15);
      sub_27B80(v23);
      swift_bridgeObjectRelease();
      sub_16BAC((uint64_t)v16);
      v13 += 40;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
  }
  v24._object = (void *)0x80000000000381D0;
  v24._countAndFlagsBits = 0xD000000000000018;
  sub_27B80(v24);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v19;
}

uint64_t sub_21524()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for Fraction()
{
  return self;
}

uint64_t sub_215A0(uint64_t a1)
{
  sub_21600(a1);

  return swift_release();
}

unint64_t sub_215DC()
{
  return sub_211C8();
}

uint64_t sub_21600(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  swift_retain();
  uint64_t result = swift_release();
  if ((*(unsigned char *)(v1 + 33) & 1) == 0)
  {
    *(void *)(v1 + 48) = 0;
    return swift_release();
  }
  return result;
}

uint64_t static PDFDocument.transferRepresentation.getter()
{
  uint64_t v0 = sub_27780();
  __chkstk_darwin(v0 - 8, v1);
  sub_27760();
  sub_217DC();
  sub_1F7C8();
  return sub_27750();
}

uint64_t sub_21710(void *a1)
{
  *(void *)(v1 + 16) = *a1;
  return _swift_task_switch(sub_21734, 0, 0);
}

uint64_t sub_21734()
{
  id v1 = [*(id *)(v0 + 16) dataRepresentation];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_27740();
    unint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v5 = 0xC000000000000000;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
  return v6(v3, v5);
}

unint64_t sub_217DC()
{
  unint64_t result = qword_4B470;
  if (!qword_4B470)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_4B470);
  }
  return result;
}

uint64_t sub_2181C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21838()
{
  uint64_t v0 = sub_27780();
  __chkstk_darwin(v0 - 8, v1);
  sub_27760();
  sub_217DC();
  return sub_27750();
}

unint64_t sub_218EC()
{
  unint64_t result = qword_4B750;
  if (!qword_4B750)
  {
    sub_1F360(&qword_4B758);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4B750);
  }
  return result;
}

unint64_t sub_21948()
{
  unint64_t result = sub_21970((uint64_t)&off_3D8F8);
  qword_4C450 = result;
  return result;
}

unint64_t sub_21970(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_16A44((uint64_t *)&unk_4B760);
  uint64_t v2 = (void *)sub_27CE0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_222D8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21A94()
{
  unint64_t result = sub_21970((uint64_t)&off_3DED8);
  qword_4C458 = result;
  return result;
}

unint64_t sub_21ABC()
{
  unint64_t result = sub_21970((uint64_t)&off_3E3B8);
  qword_4C460 = result;
  return result;
}

unint64_t sub_21AE4()
{
  unint64_t result = sub_21970((uint64_t)&off_3E5D8);
  qword_4C468 = result;
  return result;
}

unint64_t sub_21B0C()
{
  unint64_t result = sub_21970((uint64_t)&off_3E758);
  qword_4C470 = result;
  return result;
}

uint64_t sub_21B34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  BOOL v6 = a1 == 45250 && a2 == 0xA200000000000000;
  if (v6 || (sub_27D20() & 1) != 0)
  {
    uint64_t v7 = type metadata accessor for Variable();
    uint64_t v8 = swift_allocObject();
    *(_WORD *)(v8 + 32) = 258;
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 24) = a2;
    *(void *)(v8 + 56) = 0x552D4C4D6874614DLL;
    *(void *)(v8 + 64) = 0xEB0000000074696ELL;
LABEL_7:
    *(void *)(v8 + 40) = 0;
    *(void *)(v8 + 48) = 0;
    uint64_t v9 = &off_3EAA8;
LABEL_15:
    a3[3] = v7;
    a3[4] = (uint64_t)v9;
    *a3 = v8;
    return swift_bridgeObjectRetain();
  }
  if (a1 == 8554722 && a2 == 0xA300000000000000 || (sub_27D20() & 1) != 0) {
    goto LABEL_14;
  }
  if (sub_27AF0())
  {
    uint64_t v7 = type metadata accessor for Variable();
    uint64_t v8 = swift_allocObject();
    *(_WORD *)(v8 + 32) = 258;
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 24) = a2;
    *(void *)(v8 + 56) = 0;
    *(void *)(v8 + 64) = 0xE000000000000000;
    goto LABEL_7;
  }
  if (sub_27B00())
  {
LABEL_14:
    uint64_t v7 = type metadata accessor for Number();
    uint64_t v8 = swift_allocObject();
    *(_WORD *)(v8 + 32) = 257;
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 24) = a2;
    *(void *)(v8 + 40) = 0;
    *(void *)(v8 + 48) = 0;
    uint64_t v9 = &off_3EA10;
    goto LABEL_15;
  }
  if (sub_27AE0())
  {
    char v11 = sub_21D88(a1, a2, &off_3E7F8);
    swift_arrayDestroy();
    uint64_t v7 = type metadata accessor for Operator();
    uint64_t v8 = swift_allocObject();
    *(unsigned char *)(v8 + 32) = 0;
    *(void *)(v8 + 40) = 0;
    *(void *)(v8 + 48) = 0;
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 24) = a2;
    *(unsigned char *)(v8 + 33) = v11 & 1;
    *(unsigned char *)(v8 + 34) = 1;
    uint64_t v9 = &off_3F178;
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  sub_21E50(a1, a2, (uint64_t)a3);

  return swift_bridgeObjectRelease();
}

uint64_t sub_21D88(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_27D20();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_27D20() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

double sub_21E50@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (qword_4AC20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v6 = qword_4C450;
  if (*(void *)(qword_4C450 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_222D8(a1, a2);
    if (v8)
    {
      uint64_t v9 = (uint64_t *)(*(void *)(v6 + 56) + 16 * v7);
      uint64_t v11 = *v9;
      uint64_t v10 = v9[1];
      swift_endAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v12 = type metadata accessor for Variable();
      uint64_t v13 = swift_allocObject();
      *(_WORD *)(v13 + 32) = 258;
      *(void *)(v13 + 16) = v11;
      *(void *)(v13 + 24) = v10;
      *(void *)(v13 + 56) = 0;
      *(void *)(v13 + 64) = 0xE000000000000000;
      *(void *)(v13 + 40) = 0;
      *(void *)(v13 + 48) = 0;
      uint64_t v15 = &off_3EAA8;
LABEL_31:
      *(void *)(a3 + 24) = v12;
      *(void *)(a3 + 32) = v15;
      *(void *)a3 = v13;
      return result;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  if (qword_4AC28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v16 = qword_4C458;
  if (*(void *)(qword_4C458 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v17 = sub_222D8(a1, a2);
    if (v18)
    {
      unint64_t v19 = (uint64_t *)(*(void *)(v16 + 56) + 16 * v17);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      swift_endAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v12 = type metadata accessor for Operator();
      uint64_t v13 = swift_allocObject();
      *(unsigned char *)(v13 + 32) = 0;
      *(void *)(v13 + 40) = 0;
      *(void *)(v13 + 48) = 0;
      *(void *)(v13 + 16) = v21;
      *(void *)(v13 + 24) = v20;
      __int16 v22 = 256;
LABEL_18:
      *(_WORD *)(v13 + 33) = v22;
      uint64_t v15 = &off_3F178;
      goto LABEL_31;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  if (qword_4AC30 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v23 = qword_4C460;
  if (*(void *)(qword_4C460 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v24 = sub_222D8(a1, a2);
    if (v25)
    {
      uint64_t v26 = (uint64_t *)(*(void *)(v23 + 56) + 16 * v24);
      uint64_t v28 = *v26;
      uint64_t v27 = v26[1];
      swift_endAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v12 = type metadata accessor for Operator();
      uint64_t v13 = swift_allocObject();
      *(unsigned char *)(v13 + 32) = 0;
      *(void *)(v13 + 40) = 0;
      *(void *)(v13 + 48) = 0;
      *(void *)(v13 + 16) = v28;
      *(void *)(v13 + 24) = v27;
      __int16 v22 = 257;
      goto LABEL_18;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  if (qword_4AC38 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v29 = qword_4C468;
  if (*(void *)(qword_4C468 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v30 = sub_222D8(a1, a2);
    if (v31)
    {
      uint64_t v32 = (uint64_t *)(*(void *)(v29 + 56) + 16 * v30);
      uint64_t v34 = *v32;
      uint64_t v33 = v32[1];
      swift_endAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v12 = type metadata accessor for Function();
      uint64_t v13 = swift_allocObject();
      *(_WORD *)(v13 + 32) = 261;
      *(void *)(v13 + 40) = 0;
      *(void *)(v13 + 48) = 0;
      *(void *)(v13 + 16) = v34;
      *(void *)(v13 + 24) = v33;
      uint64_t v15 = &off_3EB40;
      goto LABEL_31;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  if (qword_4AC40 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v35 = qword_4C470;
  if (*(void *)(qword_4C470 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v36 = sub_222D8(a1, a2);
    if (v37)
    {
      uint64_t v38 = (uint64_t *)(*(void *)(v35 + 56) + 16 * v36);
      uint64_t v40 = *v38;
      uint64_t v39 = v38[1];
      swift_endAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v12 = type metadata accessor for Number();
      uint64_t v13 = swift_allocObject();
      *(_WORD *)(v13 + 32) = 257;
      *(void *)(v13 + 16) = v40;
      *(void *)(v13 + 24) = v39;
      *(void *)(v13 + 40) = 0;
      *(void *)(v13 + 48) = 0;
      uint64_t v15 = &off_3EA10;
      goto LABEL_31;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  *(void *)(a3 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  return result;
}

unint64_t sub_222D8(uint64_t a1, uint64_t a2)
{
  sub_27DA0();
  sub_27B40();
  Swift::Int v4 = sub_27DC0();

  return sub_22350(a1, a2, v4);
}

unint64_t sub_22350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_27D20() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_27D20() & 1) == 0);
    }
  }
  return v6;
}

uint64_t type metadata accessor for VOTUINemethVC()
{
  uint64_t result = qword_4B780;
  if (!qword_4B780) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22480()
{
  return swift_initClassMetadata2();
}

void sub_224C0()
{
}

uint64_t sub_2251C()
{
  return 0;
}

void sub_22524()
{
}

void sub_22554()
{
}

id sub_22584()
{
  return sub_22EB4(0, type metadata accessor for VOTUINemethVC);
}

uint64_t sub_225A0()
{
  return type metadata accessor for VOTUINemethVC();
}

id sub_22790(uint64_t a1)
{
  return sub_22EB4(a1, type metadata accessor for VOTUINemethViewFactory);
}

uint64_t type metadata accessor for VOTUINemethViewFactory()
{
  return self;
}

void sub_2299C(char a1)
{
  uint64_t v3 = type metadata accessor for VOTUINemethView();
  __chkstk_darwin(v3 - 8, v4);
  unint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = (objc_class *)type metadata accessor for VOTUINemethController();
  v21.receiver = v1;
  v21.super_class = v7;
  objc_msgSendSuper2(&v21, "viewDidAppear:", a1 & 1);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v1;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v1;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v1;
  objc_allocWithZone((Class)type metadata accessor for VOTUINemethVC());
  id v11 = v1;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_18D20((uint64_t)sub_23148, v8, (uint64_t)sub_23150, v9, (uint64_t)sub_2315C, v10, (uint64_t)v6);
  uint64_t v12 = (void *)sub_27830();
  swift_release();
  swift_release();
  swift_release();
  [v12 setTransitioningDelegate:v11];
  [v12 setModalInPresentation:1];
  [v12 setModalPresentationStyle:2];
  [v12 setAccessibilityViewIsModal:1];
  id v13 = [v12 view];
  if (v13)
  {
    BOOL v14 = v13;
    [v13 setAccessibilityViewIsModal:1];

    [v11 setAccessibilityViewIsModal:1];
    id v15 = [v11 view];
    if (v15)
    {
      uint64_t v16 = v15;
      [v15 setAccessibilityViewIsModal:1];

      [v12 didMoveToParentViewController:v11];
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = v12;
      aBlock[4] = sub_231B8;
      aBlock[5] = v17;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_22D38;
      aBlock[3] = &unk_3EF50;
      char v18 = _Block_copy(aBlock);
      id v19 = v12;
      swift_release();
      [v11 presentViewController:v19 animated:1 completion:v18];
      _Block_release(v18);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_22CD0(char *a1)
{
  [a1 dismissViewControllerAnimated:1 completion:0];
  uint64_t v2 = *(void (**)(uint64_t))&a1[OBJC_IVAR___VOTUINemethController_dismissAction];
  uint64_t v3 = swift_retain();
  v2(v3);

  return swift_release();
}

uint64_t sub_22D38(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_22E9C(uint64_t a1)
{
  return sub_22EB4(a1, type metadata accessor for VOTUINemethController);
}

id sub_22EB4(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for VOTUINemethController()
{
  return self;
}

id sub_22F78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v4 = [objc_allocWithZone((Class)UISheetPresentationController) initWithPresentedViewController:a1 presentingViewController:a2];
  sub_16A44(&qword_4B8F8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2E710;
  unint64_t v6 = self;
  *(void *)(v5 + 32) = [v6 mediumDetent];
  *(void *)(v5 + 40) = [v6 largeDetent];
  sub_27BC0();
  sub_230D0();
  Class isa = sub_27BB0().super.isa;
  swift_bridgeObjectRelease();
  [v4 setDetents:isa];

  [v4 setLargestUndimmedDetentIdentifier:UISheetPresentationControllerDetentIdentifierMedium];
  [v4 setPrefersGrabberVisible:1];
  [v4 setDelegate:v3];
  return v4;
}

unint64_t sub_230D0()
{
  unint64_t result = qword_4B900;
  if (!qword_4B900)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_4B900);
  }
  return result;
}

uint64_t sub_23110()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_23148()
{
  return sub_22CD0(*(char **)(v0 + 16));
}

uint64_t sub_23150()
{
  return sub_23168(&OBJC_IVAR___VOTUINemethController_setBrailleUnicodeTable);
}

uint64_t sub_2315C()
{
  return sub_23168(&OBJC_IVAR___VOTUINemethController_unsetBrailleUnicodeTable);
}

uint64_t sub_23168(void *a1)
{
  uint64_t v2 = *(void (**)(uint64_t))(*(void *)(v1 + 16) + *a1);
  uint64_t v3 = swift_retain();
  v2(v3);

  return swift_release();
}

void sub_231B8()
{
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, *(id *)(v0 + 16));
}

uint64_t sub_231CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_231DC()
{
  return swift_release();
}

uint64_t sub_231E4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_2321C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

BOOL sub_23250(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_23264()
{
  Swift::UInt v1 = *v0;
  sub_27DA0();
  sub_27DB0(v1);
  return sub_27DC0();
}

void sub_232AC()
{
  sub_27DB0(*v0);
}

Swift::Int sub_232D8()
{
  Swift::UInt v1 = *v0;
  sub_27DA0();
  sub_27DB0(v1);
  return sub_27DC0();
}

uint64_t sub_2331C(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_25888(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[40 * v9 + 32];
  if (a1 + 32 < v10 + 40 * v8 && v10 < a1 + 32 + 40 * v8) {
    goto LABEL_24;
  }
  sub_16A44(&qword_4BA88);
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *Swift::UInt v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_27CF0();
  __break(1u);
  return result;
}

uint64_t sub_23494(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_259AC(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[16 * v9 + 32];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  sub_16A44(&qword_4BAB0);
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *Swift::UInt v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_27CF0();
  __break(1u);
  return result;
}

unint64_t sub_23604()
{
  uint64_t v0 = sub_238D0();
  unint64_t v21 = 0xD0000000000000F2;
  unint64_t v22 = 0x80000000000384B0;
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  int64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    uint64_t v20 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_25ABC(0, v2, 0);
    uint64_t v4 = v1 + 32;
    uint64_t v3 = &_swiftEmptyArrayStorage;
    do
    {
      sub_16B04(v4, (uint64_t)v17);
      uint64_t v6 = v18;
      uint64_t v5 = v19;
      sub_16B68(v17, v18);
      uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)(v5 + 16) + 8))(v6);
      uint64_t v9 = v8;
      sub_16BAC((uint64_t)v17);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25ABC(0, v3[2] + 1, 1);
        uint64_t v3 = v20;
      }
      unint64_t v11 = v3[2];
      unint64_t v10 = v3[3];
      if (v11 >= v10 >> 1)
      {
        sub_25ABC(v10 > 1, v11 + 1, 1);
        uint64_t v3 = v20;
      }
      v3[2] = v11 + 1;
      uint64_t v12 = (char *)&v3[2 * v11];
      *((void *)v12 + 4) = v7;
      *((void *)v12 + 5) = v9;
      v4 += 40;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  v17[0] = v3;
  sub_16A44(&qword_4BA90);
  sub_26164();
  uint64_t v13 = sub_27B10();
  int64_t v15 = v14;
  swift_bridgeObjectRelease();
  v23._countAndFlagsBits = v13;
  v23._object = v15;
  sub_27B80(v23);
  swift_bridgeObjectRelease();
  v24._object = (void *)0x80000000000385B0;
  v24._countAndFlagsBits = 0xD000000000000015;
  sub_27B80(v24);
  swift_release();
  return v21;
}

uint64_t sub_238D0()
{
  uint64_t v2 = v1;
  v82 = (uint64_t *)(v0 + 16);
  swift_beginAccess();
  uint64_t v3 = *(void *)(v0 + 16);
  v91[0] = (uint64_t *)&_swiftEmptyArrayStorage;
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = (char *)(v3 + 32);
    swift_bridgeObjectRetain_n();
    do
    {
      sub_26F20(v91, v5);
      if (v2) {
        goto LABEL_69;
      }
      uint64_t v2 = 0;
      v5 += 40;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease_n();
    uint64_t v6 = v91[0];
  }
  else
  {
    uint64_t v6 = (uint64_t *)&_swiftEmptyArrayStorage;
  }
  type metadata accessor for LatexToMathMLTree();
  uint64_t v7 = swift_allocObject();
  uint64_t v75 = v7;
  *(void *)(v7 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v74 = v7 + 16;
  v94 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v81 = v6[2];
  if (!v81)
  {
    swift_bridgeObjectRelease();
LABEL_55:
    swift_beginAccess();
    uint64_t v71 = swift_bridgeObjectRetain();
    sub_2331C(v71);
    swift_endAccess();
    swift_bridgeObjectRelease();
    return v75;
  }
  unint64_t v8 = 0;
  unint64_t v9 = 0;
  uint64_t v80 = v6 + 4;
  v79 = v6;
  while (1)
  {
    if (v9 >= v6[2]) {
      goto LABEL_61;
    }
    uint64_t v12 = &v80[2 * v9];
    uint64_t v13 = *v12;
    uint64_t v84 = v12[1];
    if (v13 == 1)
    {
      if ((v8 & 0x8000000000000000) != 0) {
        goto LABEL_62;
      }
      if (v8 >= *(void *)(*v82 + 16)) {
        goto LABEL_64;
      }
      unint64_t v14 = v8;
      sub_16B04(*v82 + 40 * v8 + 32, (uint64_t)v91);
      int64_t v15 = v94;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        int64_t v15 = sub_25888(0, *((void *)v15 + 2) + 1, 1, v15);
        v94 = v15;
      }
      unint64_t v16 = v9;
      unint64_t v18 = *((void *)v15 + 2);
      unint64_t v17 = *((void *)v15 + 3);
      if (v18 >= v17 >> 1) {
        v94 = sub_25888((char *)(v17 > 1), v18 + 1, 1, v15);
      }
      uint64_t v19 = v92;
      uint64_t v20 = v93;
      uint64_t v21 = sub_25EF8((uint64_t)v91, v92);
      __chkstk_darwin(v21, v21);
      Swift::String v23 = (char *)&v74 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v24 + 16))(v23);
      sub_25C48(v18, (uint64_t)v23, (uint64_t *)&v94, v19, v20);
      sub_16BAC((uint64_t)v91);
      swift_bridgeObjectRelease();
      unint64_t v8 = v14 + 1;
      unint64_t v11 = v16;
      goto LABEL_11;
    }
    uint64_t v25 = v8 + v13;
    if (__OFADD__(v8, v13)) {
      goto LABEL_63;
    }
    if (v25 < (uint64_t)v8) {
      goto LABEL_65;
    }
    if ((v8 & 0x8000000000000000) != 0) {
      goto LABEL_66;
    }
    uint64_t v26 = *v82;
    unint64_t v27 = *(void *)(*v82 + 16);
    if (v27 < v8 || (uint64_t)v27 < v25) {
      goto LABEL_67;
    }
    unint64_t v76 = v8 + v13;
    unint64_t v77 = v8;
    uint64_t v83 = v26;
    unint64_t v78 = v9;
    if (v25 != v8) {
      break;
    }
    uint64_t v29 = v84;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v30 = (uint64_t *)&_swiftEmptyArrayStorage;
LABEL_39:
    v91[0] = v30;
    sub_16A44(&qword_4BA90);
    sub_26164();
    uint64_t v40 = sub_27B10();
    uint64_t v42 = v41;
    swift_bridgeObjectRelease();
    uint64_t v43 = *(void *)(v29 + 16);
    if (!v43)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_58:
      sub_25EA4();
      swift_allocError();
      *long long v72 = 4;
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_release();
      return v75;
    }
    sub_16B04(v29 + 32, (uint64_t)v91);
    sub_16B04(v29 + 32 + 40 * v43 - 40, (uint64_t)v88);
    uint64_t v45 = v92;
    uint64_t v44 = v93;
    sub_16B68(v91, v92);
    int v46 = (*(unsigned __int8 (**)(uint64_t))(*(void *)(v44 + 8) + 32))(v45);
    uint64_t v48 = v89;
    uint64_t v47 = v90;
    sub_16B68(v88, v89);
    if (v46 != (*(unsigned __int8 (**)(uint64_t))(*(void *)(v47 + 8) + 32))(v48))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_16BAC((uint64_t)v88);
      sub_16BAC((uint64_t)v91);
      goto LABEL_58;
    }
    uint64_t v50 = v92;
    uint64_t v49 = v93;
    sub_16B68(v91, v92);
    int v51 = (*(unsigned __int8 (**)(uint64_t))(*(void *)(v49 + 8) + 32))(v50);
    if (v51 == 2)
    {
      uint64_t v65 = v89;
      uint64_t v64 = v90;
      sub_16B68(v88, v89);
      uint64_t v66 = (*(uint64_t (**)(uint64_t))(*(void *)(v64 + 8) + 88))(v65);
      uint64_t v68 = v89;
      uint64_t v67 = v90;
      sub_16B68(v88, v89);
      uint64_t v69 = (*(uint64_t (**)(uint64_t))(*(void *)(v67 + 8) + 64))(v68);
      uint64_t v58 = type metadata accessor for Variable();
      uint64_t v59 = swift_allocObject();
      *(_WORD *)(v59 + 32) = 258;
      *(void *)(v59 + 16) = v40;
      *(void *)(v59 + 24) = v42;
      *(void *)(v59 + 56) = 0;
      *(void *)(v59 + 64) = 0xE000000000000000;
      *(void *)(v59 + 40) = v69;
      *(void *)(v59 + 48) = v66;
      swift_release();
      uint64_t v60 = v94;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v60 = sub_25888(0, *((void *)v60 + 2) + 1, 1, v60);
      }
      unint64_t v62 = *((void *)v60 + 2);
      unint64_t v70 = *((void *)v60 + 3);
      unint64_t v63 = v62 + 1;
      if (v62 >= v70 >> 1) {
        uint64_t v60 = sub_25888((char *)(v70 > 1), v62 + 1, 1, v60);
      }
      unint64_t v10 = &off_3EAA8;
    }
    else
    {
      if (v51 != 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_16BAC((uint64_t)v88);
        sub_16BAC((uint64_t)v91);
        unint64_t v11 = v78;
        unint64_t v8 = v77;
        goto LABEL_11;
      }
      uint64_t v53 = v89;
      uint64_t v52 = v90;
      sub_16B68(v88, v89);
      uint64_t v54 = (*(uint64_t (**)(uint64_t))(*(void *)(v52 + 8) + 88))(v53);
      uint64_t v56 = v89;
      uint64_t v55 = v90;
      sub_16B68(v88, v89);
      uint64_t v57 = (*(uint64_t (**)(uint64_t))(*(void *)(v55 + 8) + 64))(v56);
      uint64_t v58 = type metadata accessor for Number();
      uint64_t v59 = swift_allocObject();
      *(_WORD *)(v59 + 32) = 257;
      *(void *)(v59 + 16) = v40;
      *(void *)(v59 + 24) = v42;
      *(void *)(v59 + 40) = v57;
      *(void *)(v59 + 48) = v54;
      swift_release();
      uint64_t v60 = v94;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v60 = sub_25888(0, *((void *)v60 + 2) + 1, 1, v60);
      }
      unint64_t v62 = *((void *)v60 + 2);
      unint64_t v61 = *((void *)v60 + 3);
      unint64_t v63 = v62 + 1;
      if (v62 >= v61 >> 1) {
        uint64_t v60 = sub_25888((char *)(v61 > 1), v62 + 1, 1, v60);
      }
      unint64_t v10 = &off_3EA10;
    }
    uint64_t v86 = v58;
    uint64_t v87 = v10;
    *(void *)&long long v85 = v59;
    *((void *)v60 + 2) = v63;
    sub_16A88(&v85, (uint64_t)&v60[40 * v62 + 32]);
    swift_bridgeObjectRelease();
    v94 = v60;
    sub_16BAC((uint64_t)v88);
    sub_16BAC((uint64_t)v91);
    swift_bridgeObjectRelease();
    unint64_t v8 = v76;
    unint64_t v11 = v78;
LABEL_11:
    unint64_t v9 = v11 + 1;
    uint64_t v6 = v79;
    if (v9 == v81)
    {
      swift_bridgeObjectRelease();
      goto LABEL_55;
    }
  }
  v88[0] = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25ABC(0, v13 & ~(v13 >> 63), 0);
  if ((v13 & 0x8000000000000000) == 0)
  {
    uint64_t v31 = v26 + 40 * v77 + 32;
    while (v13)
    {
      sub_16B04(v31, (uint64_t)v91);
      uint64_t v33 = v92;
      uint64_t v32 = v93;
      sub_16B68(v91, v92);
      uint64_t v34 = (*(uint64_t (**)(uint64_t))(*(void *)(v32 + 8) + 8))(v33);
      uint64_t v36 = v35;
      sub_16BAC((uint64_t)v91);
      unint64_t v30 = (uint64_t *)v88[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25ABC(0, v30[2] + 1, 1);
        unint64_t v30 = (uint64_t *)v88[0];
      }
      unint64_t v38 = v30[2];
      unint64_t v37 = v30[3];
      if (v38 >= v37 >> 1)
      {
        sub_25ABC(v37 > 1, v38 + 1, 1);
        unint64_t v30 = (uint64_t *)v88[0];
      }
      v30[2] = v38 + 1;
      uint64_t v39 = &v30[2 * v38];
      v39[4] = v34;
      v39[5] = v36;
      v31 += 40;
      if (!--v13)
      {
        uint64_t v29 = v84;
        goto LABEL_39;
      }
    }
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
  }
  __break(1u);
LABEL_69:
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2423C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for LatexToMathMLTree()
{
  return self;
}

uint64_t getEnumTagSinglePayload for LatexTranslatableType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LatexTranslatableType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x243F4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LatexTranslatableType()
{
  return &type metadata for LatexTranslatableType;
}

unint64_t sub_24430()
{
  unint64_t result = qword_4BA70;
  if (!qword_4BA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4BA70);
  }
  return result;
}

uint64_t sub_24484(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v96 = a2;
  type metadata accessor for LatexToMathMLTree();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v8;
  *(void *)(v8 + 16) = &_swiftEmptyArrayStorage;
  int v84 = a1;
  if ((a1 & 1) != 0 && a3)
  {
    sub_25EA4();
    swift_allocError();
    *unint64_t v10 = 1;
    swift_willThrow();
    swift_release();
    return v9;
  }
  uint64_t v95 = 0;
  long long v93 = 0u;
  long long v94 = 0u;
  unint64_t v11 = v5[1];
  uint64_t v12 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0) {
    uint64_t v12 = *v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v5[2] >> 14 >= (unint64_t)(4 * v12))
  {
LABEL_96:
    sub_25174((uint64_t)&v93);
    return v9;
  }
  uint64_t v83 = (char **)(v8 + 16);
  while (1)
  {
    uint64_t v92 = 0;
    memset(v91, 0, sizeof(v91));
    uint64_t v13 = sub_27BA0();
    uint64_t v15 = v14;
    uint64_t v16 = sub_27B50();
    v5[2] = v16;
    if (v84)
    {
      if ((unint64_t v17 = v16, v13 == 94) && v15 == 0xE100000000000000
        || (sub_27D20() & 1) != 0
        || v13 == 125 && v15 == 0xE100000000000000
        || (sub_27D20() & 1) != 0
        || v13 == 95 && v15 == 0xE100000000000000
        || (sub_27D20() & 1) != 0
        || v13 == 38 && v15 == 0xE100000000000000
        || (sub_27D20() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        if (v17 >= 0x4000) {
          v5[2] = sub_27B60();
        }
        sub_25174((uint64_t)v91);
        goto LABEL_96;
      }
    }
    if (a3 && (v13 == v96 && v15 == a3 || (sub_27D20() & 1) != 0))
    {
      sub_25174((uint64_t)v91);
      swift_bridgeObjectRelease();
      goto LABEL_96;
    }
    if (v13 == 94 && v15 == 0xE100000000000000 || (sub_27D20() & 1) != 0) {
      break;
    }
    if (v13 == 95 && v15 == 0xE100000000000000 || (sub_27D20() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      sub_2523C((uint64_t)&v93, (uint64_t)&v88);
      uint64_t v39 = *((void *)&v89 + 1);
      uint64_t result = sub_25174((uint64_t)&v88);
      if (!v39) {
        goto LABEL_51;
      }
      uint64_t v40 = *((void *)&v94 + 1);
      if (!*((void *)&v94 + 1)) {
        goto LABEL_107;
      }
      uint64_t v41 = v95;
      sub_16B68(&v93, *((uint64_t *)&v94 + 1));
      uint64_t v42 = (*(uint64_t (**)(uint64_t))(*(void *)(v41 + 8) + 88))(v40);
      uint64_t result = swift_release();
      if (v42) {
        goto LABEL_51;
      }
      uint64_t v43 = *((void *)&v94 + 1);
      if (!*((void *)&v94 + 1)) {
        goto LABEL_108;
      }
      uint64_t v44 = v95;
      uint64_t v45 = sub_16B68(&v93, *((uint64_t *)&v94 + 1));
      uint64_t v46 = *(void *)(v43 - 8);
      __chkstk_darwin(v45, v45);
      uint64_t v48 = (char *)&v81 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v46 + 16))(v48);
      LOBYTE(v44) = (*(uint64_t (**)(uint64_t))(*(void *)(v44 + 8) + 56))(v43);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v48, v43);
      if ((v44 & 1) == 0)
      {
LABEL_51:
        uint64_t v49 = type metadata accessor for Number();
        uint64_t v50 = swift_allocObject();
        *(_WORD *)(v50 + 32) = 257;
        *(void *)(v50 + 16) = 0;
        *(void *)(v50 + 24) = 0xE000000000000000;
        *(void *)(v50 + 40) = 0;
        *(void *)(v50 + 48) = 0;
        swift_release();
        *((void *)&v89 + 1) = v49;
        uint64_t v90 = &off_3EA10;
        *(void *)&long long v88 = v50;
        sub_252A4((uint64_t)&v88, (uint64_t)&v93);
        uint64_t result = sub_2523C((uint64_t)&v93, (uint64_t)&v88);
        uint64_t v51 = *((void *)&v89 + 1);
        if (!*((void *)&v89 + 1)) {
          goto LABEL_106;
        }
        uint64_t v52 = (uint64_t)v90;
        uint64_t v53 = sub_16B68(&v88, *((uint64_t *)&v89 + 1));
        sub_25CE0((uint64_t)v53, v9, v51, v52);
        sub_16BAC((uint64_t)&v88);
      }
      uint64_t result = sub_24484(1, 0, 0);
      if (v4)
      {
LABEL_98:
        sub_25174((uint64_t)v91);
        swift_release();
        goto LABEL_96;
      }
      uint64_t v54 = *((void *)&v94 + 1);
      if (!*((void *)&v94 + 1)) {
        goto LABEL_104;
      }
      uint64_t v55 = result;
      uint64_t v56 = v95;
      sub_25EF8((uint64_t)&v93, *((uint64_t *)&v94 + 1));
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v56 + 8) + 96))(v55, v54);
      goto LABEL_38;
    }
    if (v13 == 123 && v15 == 0xE100000000000000 || (sub_27D20() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v57 = sub_24484(0, 125, 0xE100000000000000);
      if (v4) {
        goto LABEL_98;
      }
      uint64_t v58 = v57;
      if (!v57) {
        goto LABEL_38;
      }
      swift_beginAccess();
      uint64_t v59 = *(void *)(v58 + 16);
      uint64_t v60 = *(void *)(v59 + 16);
      if (v60)
      {
        sub_16B04(v59 + 40 * v60 - 8, (uint64_t)&v88);
      }
      else
      {
        uint64_t v90 = 0;
        long long v88 = 0u;
        long long v89 = 0u;
      }
      sub_252A4((uint64_t)&v88, (uint64_t)&v93);
      swift_beginAccess();
      uint64_t v61 = swift_bridgeObjectRetain();
      sub_2331C(v61);
      swift_endAccess();
      swift_release();
      sub_25174((uint64_t)v91);
LABEL_68:
      if (v84) {
        goto LABEL_96;
      }
      goto LABEL_39;
    }
    if ((v13 != 40 || v15 != 0xE100000000000000) && (sub_27D20() & 1) == 0)
    {
      if ((v13 != 92 || v15 != 0xE100000000000000) && (sub_27D20() & 1) == 0)
      {
        if (v13 == 38 && v15 == 0xE100000000000000 || (sub_27D20() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          sub_25EA4();
          swift_allocError();
          *uint64_t v80 = 2;
          swift_willThrow();
          swift_release();
          sub_25174((uint64_t)v91);
          goto LABEL_96;
        }
        sub_21B34(v13, v15, (uint64_t *)&v88);
        swift_bridgeObjectRelease();
        sub_25174((uint64_t)v91);
        sub_251D4((uint64_t)&v88, (uint64_t)v91);
        sub_2523C((uint64_t)v91, (uint64_t)&v88);
        uint64_t v79 = *((void *)&v89 + 1);
        sub_25174((uint64_t)&v88);
        if (v79) {
          goto LABEL_83;
        }
        goto LABEL_38;
      }
      swift_bridgeObjectRelease();
      uint64_t v74 = sub_2530C();
      sub_25408(v74, v75, (uint64_t)&v88);
      if (v4)
      {
        sub_25174((uint64_t)v91);
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_96;
      }
      sub_25174((uint64_t)v91);
      swift_bridgeObjectRelease();
      sub_251D4((uint64_t)&v88, (uint64_t)v91);
LABEL_83:
      sub_2523C((uint64_t)v91, (uint64_t)&v85);
      if (v86)
      {
        sub_16A88(&v85, (uint64_t)&v88);
        uint64_t v76 = *((void *)&v89 + 1);
        uint64_t v77 = (uint64_t)v90;
        unint64_t v78 = sub_16B68(&v88, *((uint64_t *)&v89 + 1));
        sub_25CE0((uint64_t)v78, v9, v76, v77);
        sub_16BAC((uint64_t)&v88);
      }
      else
      {
        sub_25174((uint64_t)&v85);
      }
      sub_252A4((uint64_t)v91, (uint64_t)&v93);
      goto LABEL_68;
    }
    swift_bridgeObjectRelease();
    uint64_t v62 = sub_24484(0, 41, 0xE100000000000000);
    if (v4) {
      goto LABEL_98;
    }
    uint64_t v63 = v62;
    if (v62)
    {
      uint64_t v64 = type metadata accessor for Operator();
      uint64_t v65 = swift_allocObject();
      *(unsigned char *)(v65 + 32) = 0;
      *(void *)(v65 + 40) = 0;
      *(void *)(v65 + 48) = 0;
      *(void *)(v65 + 16) = 40;
      *(void *)(v65 + 24) = 0xE100000000000000;
      *(_WORD *)(v65 + 33) = 256;
      *((void *)&v89 + 1) = v64;
      uint64_t v90 = &off_3F178;
      *(void *)&long long v88 = v65;
      uint64_t v66 = swift_allocObject();
      *(unsigned char *)(v66 + 32) = 0;
      *(void *)(v66 + 40) = 0;
      *(void *)(v66 + 48) = 0;
      *(void *)(v66 + 16) = 41;
      *(void *)(v66 + 24) = 0xE100000000000000;
      *(_WORD *)(v66 + 33) = 256;
      uint64_t v86 = v64;
      uint64_t v87 = &off_3F178;
      *(void *)&long long v85 = v66;
      uint64_t v67 = type metadata accessor for FencedGroup();
      uint64_t v68 = swift_allocObject();
      *(_WORD *)(v68 + 32) = 6;
      *(void *)(v68 + 40) = 0;
      *(void *)(v68 + 48) = 0;
      *(void *)(v68 + 16) = 0;
      *(void *)(v68 + 24) = 0xE000000000000000;
      sub_16A88(&v88, v68 + 56);
      sub_16A88(&v85, v68 + 96);
      *(void *)(v68 + 136) = v63;
      uint64_t v69 = v83;
      swift_beginAccess();
      unint64_t v70 = *v69;
      swift_retain();
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v82 = v67;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        unint64_t v70 = sub_25888(0, *((void *)v70 + 2) + 1, 1, v70);
      }
      unint64_t v73 = *((void *)v70 + 2);
      unint64_t v72 = *((void *)v70 + 3);
      if (v73 >= v72 >> 1) {
        unint64_t v70 = sub_25888((char *)(v72 > 1), v73 + 1, 1, v70);
      }
      *((void *)&v89 + 1) = v82;
      uint64_t v90 = &off_3F210;
      *(void *)&long long v88 = v68;
      *((void *)v70 + 2) = v73 + 1;
      sub_16A88(&v88, (uint64_t)&v70[40 * v73 + 32]);
      int *v83 = v70;
      swift_endAccess();
      swift_release();
      sub_25174((uint64_t)v91);
      swift_release();
      goto LABEL_39;
    }
LABEL_38:
    sub_25174((uint64_t)v91);
LABEL_39:
    unint64_t v37 = v5[1];
    uint64_t v38 = HIBYTE(v37) & 0xF;
    if ((v37 & 0x2000000000000000) == 0) {
      uint64_t v38 = *v5 & 0xFFFFFFFFFFFFLL;
    }
    if (v5[2] >> 14 >= (unint64_t)(4 * v38)) {
      goto LABEL_96;
    }
  }
  swift_bridgeObjectRelease();
  sub_2523C((uint64_t)&v93, (uint64_t)&v88);
  uint64_t v18 = *((void *)&v89 + 1);
  uint64_t result = sub_25174((uint64_t)&v88);
  if (!v18) {
    goto LABEL_33;
  }
  uint64_t v20 = *((void *)&v94 + 1);
  if (!*((void *)&v94 + 1)) {
    goto LABEL_103;
  }
  uint64_t v21 = v95;
  sub_16B68(&v93, *((uint64_t *)&v94 + 1));
  uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)(v21 + 8) + 64))(v20);
  uint64_t result = swift_release();
  if (v22) {
    goto LABEL_33;
  }
  uint64_t v23 = *((void *)&v94 + 1);
  if (!*((void *)&v94 + 1)) {
    goto LABEL_105;
  }
  uint64_t v24 = v95;
  uint64_t v25 = sub_16B68(&v93, *((uint64_t *)&v94 + 1));
  uint64_t v26 = *(void *)(v23 - 8);
  __chkstk_darwin(v25, v25);
  uint64_t v28 = (char *)&v81 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v26 + 16))(v28);
  LOBYTE(v24) = (*(uint64_t (**)(uint64_t))(*(void *)(v24 + 8) + 56))(v23);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v23);
  if ((v24 & 1) == 0)
  {
LABEL_33:
    uint64_t v29 = type metadata accessor for Number();
    uint64_t v30 = swift_allocObject();
    *(_WORD *)(v30 + 32) = 257;
    *(void *)(v30 + 16) = 0;
    *(void *)(v30 + 24) = 0xE000000000000000;
    *(void *)(v30 + 40) = 0;
    *(void *)(v30 + 48) = 0;
    swift_release();
    *((void *)&v89 + 1) = v29;
    uint64_t v90 = &off_3EA10;
    *(void *)&long long v88 = v30;
    sub_252A4((uint64_t)&v88, (uint64_t)&v93);
    uint64_t result = sub_2523C((uint64_t)&v93, (uint64_t)&v88);
    uint64_t v31 = *((void *)&v89 + 1);
    if (!*((void *)&v89 + 1)) {
      goto LABEL_102;
    }
    uint64_t v32 = (uint64_t)v90;
    uint64_t v33 = sub_16B68(&v88, *((uint64_t *)&v89 + 1));
    sub_25CE0((uint64_t)v33, v9, v31, v32);
    sub_16BAC((uint64_t)&v88);
  }
  uint64_t result = sub_24484(1, 0, 0);
  if (v4) {
    goto LABEL_98;
  }
  uint64_t v34 = *((void *)&v94 + 1);
  if (*((void *)&v94 + 1))
  {
    uint64_t v35 = result;
    uint64_t v36 = v95;
    sub_25EF8((uint64_t)&v93, *((uint64_t *)&v94 + 1));
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v36 + 8) + 72))(v35, v34);
    goto LABEL_38;
  }
  __break(1u);
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
LABEL_105:
  __break(1u);
LABEL_106:
  __break(1u);
LABEL_107:
  __break(1u);
LABEL_108:
  __break(1u);
  return result;
}

uint64_t sub_25174(uint64_t a1)
{
  uint64_t v2 = sub_16A44(&qword_4BA78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_251D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_16A44(&qword_4BA78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2523C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_16A44(&qword_4BA78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_252A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_16A44(&qword_4BA78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2530C()
{
  uint64_t v1 = v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v4 = 4 * v3;
  if ((unint64_t)(4 * v3) > v0[2] >> 14)
  {
    while (1)
    {
      uint64_t v5 = sub_27BA0();
      BOOL v7 = v6;
      unint64_t v8 = sub_27B50();
      v1[2] = v8;
      if ((sub_27AF0() & 1) == 0) {
        break;
      }
      v10._countAndFlagsBits = v5;
      v10._object = v7;
      sub_27B70(v10);
      swift_bridgeObjectRelease();
      if (v4 <= v1[2] >> 14) {
        return 0;
      }
    }
    swift_bridgeObjectRelease();
    if (v8 >= 0x4000) {
      v1[2] = sub_27B60();
    }
  }
  return 0;
}

uint64_t sub_25408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3;
  sub_21E50(a1, a2, (uint64_t)&v31);
  if (v32)
  {
    sub_16A88(&v31, (uint64_t)v33);
    return sub_16A88(v33, a3);
  }
  sub_25174((uint64_t)&v31);
  if ((a1 != 1667330662 || a2 != 0xE400000000000000) && (sub_27D20() & 1) == 0)
  {
    if ((a1 != 1953657203 || a2 != 0xE400000000000000) && (sub_27D20() & 1) == 0)
    {
      sub_25EA4();
      swift_allocError();
      unsigned char *v24 = 3;
      return swift_willThrow();
    }
    uint64_t v17 = type metadata accessor for Radical();
    swift_allocObject();
    uint64_t v11 = sub_16224(0, 0xE000000000000000);
    unint64_t v18 = v5[1];
    uint64_t v19 = HIBYTE(v18) & 0xF;
    if ((v18 & 0x2000000000000000) == 0) {
      uint64_t v19 = *v5 & 0xFFFFFFFFFFFFLL;
    }
    if (v5[2] >> 14 >= (unint64_t)(4 * v19))
    {
      *(void *)(a3 + 32) = 0;
      long long v12 = 0uLL;
      goto LABEL_12;
    }
    uint64_t v30 = v17;
    uint64_t v20 = sub_27BA0();
    uint64_t v22 = v21;
    unint64_t v23 = sub_27B50();
    v5[2] = v23;
    if (v20 == 32 && v22 == 0xE100000000000000)
    {
      uint64_t v34 = v11;
    }
    else
    {
      if ((sub_27D20() & 1) == 0) {
        goto LABEL_31;
      }
      uint64_t v34 = v11;
    }
    do
    {
      do
      {
        swift_bridgeObjectRelease();
        uint64_t v20 = sub_27BA0();
        uint64_t v22 = v25;
        unint64_t v23 = sub_27B50();
      }
      while (v20 == 32 && v22 == 0xE100000000000000);
    }
    while ((sub_27D20() & 1) != 0);
    v5[2] = v23;
    uint64_t v11 = v34;
LABEL_31:
    if (v20 == 91 && v22 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v26 = sub_27D20();
      swift_bridgeObjectRelease();
      if ((v26 & 1) == 0)
      {
        if (v23 >= 0x4000) {
          v5[2] = sub_27B60();
        }
        uint64_t v29 = sub_24484(1, 0, 0);
        uint64_t v28 = v30;
        if (v4) {
          return swift_release();
        }
        *(void *)(v11 + 40) = v29;
        goto LABEL_41;
      }
    }
    uint64_t v27 = sub_24484(0, 93, 0xE100000000000000);
    if (v4) {
      return swift_release();
    }
    *(void *)(v11 + 48) = v27;
    swift_release();
    *(void *)(v11 + 40) = sub_24484(1, 0, 0);
    uint64_t v28 = v30;
LABEL_41:
    uint64_t result = swift_release();
    uint64_t v16 = &off_3E8E8;
    *(void *)(a3 + 24) = v28;
    goto LABEL_42;
  }
  uint64_t v10 = type metadata accessor for Fraction();
  uint64_t v11 = swift_allocObject();
  *(_WORD *)(v11 + 32) = 4;
  long long v12 = 0uLL;
  *(_OWORD *)(v11 + 40) = 0u;
  *(_OWORD *)(v11 + 56) = 0u;
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0xE000000000000000;
  unint64_t v13 = v5[1];
  uint64_t v14 = *v5 & 0xFFFFFFFFFFFFLL;
  if ((v13 & 0x2000000000000000) != 0) {
    uint64_t v14 = HIBYTE(v13) & 0xF;
  }
  if (v5[2] >> 14 >= (unint64_t)(4 * v14))
  {
    *(void *)(a3 + 32) = 0;
LABEL_12:
    *(_OWORD *)a3 = v12;
    *(_OWORD *)(a3 + 16) = v12;
    return swift_release();
  }
  uint64_t v15 = sub_24484(1, 0, 0);
  if (v4) {
    return swift_release();
  }
  *(void *)(v11 + 56) = v15;
  swift_release();
  *(void *)(v11 + 64) = sub_24484(1, 0, 0);
  uint64_t result = swift_release();
  uint64_t v16 = &off_3EE98;
  *(void *)(a3 + 24) = v10;
LABEL_42:
  *(void *)(a3 + 32) = v16;
  *(void *)a3 = v11;
  return result;
}

char *sub_25888(char *result, int64_t a2, char a3, char *a4)
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
      sub_16A44(&qword_4ADD0);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
      long long v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[40 * v8 + 32]) {
          memmove(v12, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      long long v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_26054(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_259AC(char *result, int64_t a2, char a3, char *a4)
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
      sub_16A44(&qword_4BAA8);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_25F48(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25ABC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25ADC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25ADC(char a1, int64_t a2, char a3, char *a4)
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
    sub_16A44(&qword_4BAA0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_27CF0();
  __break(1u);
  return result;
}

uint64_t sub_25C48(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  uint64_t v9 = sub_16AA0((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(v9, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_16A88(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_25CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  uint64_t v8 = __chkstk_darwin(a1, a1);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v11);
  uint64_t v13 = (char *)&v21 - v12;
  uint64_t v14 = *(void (**)(char *))(v7 + 16);
  v14((char *)&v21 - v12);
  uint64_t v15 = (uint64_t *)(a2 + 16);
  swift_beginAccess();
  uint64_t v16 = *(char **)(a2 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a2 + 16) = v16;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v16 = sub_25888(0, *((void *)v16 + 2) + 1, 1, v16);
    uint64_t *v15 = (uint64_t)v16;
  }
  unint64_t v19 = *((void *)v16 + 2);
  unint64_t v18 = *((void *)v16 + 3);
  if (v19 >= v18 >> 1) {
    uint64_t *v15 = (uint64_t)sub_25888((char *)(v18 > 1), v19 + 1, 1, v16);
  }
  ((void (*)(char *, char *, uint64_t))v14)(v10, v13, a3);
  sub_25C48(v19, (uint64_t)v10, v15, a3, a4);
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v13, a3);
}

unint64_t sub_25EA4()
{
  unint64_t result = qword_4BA80;
  if (!qword_4BA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4BA80);
  }
  return result;
}

uint64_t sub_25EF8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_25F48(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      sub_16A44(&qword_4BAB0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_27CF0();
  __break(1u);
  return result;
}

uint64_t sub_26054(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_16A44(&qword_4BA88);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_27CF0();
  __break(1u);
  return result;
}

unint64_t sub_26164()
{
  unint64_t result = qword_4BA98;
  if (!qword_4BA98)
  {
    sub_1F360(&qword_4BA90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4BA98);
  }
  return result;
}

unint64_t sub_261C0()
{
  if ((*(unsigned char *)(v0 + 33) & 1) == 0)
  {
    unint64_t v48 = 1047489852;
    unint64_t v49 = 0xE400000000000000;
    uint64_t v6 = *(void *)(v0 + 16);
    uint64_t v1 = *(void **)(v0 + 24);
    swift_bridgeObjectRetain();
    v7._countAndFlagsBits = v6;
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  BOOL v3 = v2 == 7170412 && v1 == (void *)0xE300000000000000;
  if (v3 || (sub_27D20() & 1) != 0)
  {
    uint64_t v46 = 0x3E7265646E756D3CLL;
    sub_27C90(32);
    swift_bridgeObjectRelease();
    unint64_t v48 = 0xD000000000000019;
    unint64_t v49 = 0x8000000000038650;
    uint64_t v4 = *(void *)(v0 + 16);
    unint64_t v5 = *(void **)(v0 + 24);
    swift_bridgeObjectRetain();
    v52._countAndFlagsBits = v4;
    v52._object = v5;
    sub_27B80(v52);
    swift_bridgeObjectRelease();
    v53._countAndFlagsBits = 0x3E6F6D2F3CLL;
    v53._object = (void *)0xE500000000000000;
    sub_27B80(v53);
    v54._countAndFlagsBits = 0xD000000000000019;
    v54._object = (void *)0x8000000000038650;
    sub_27B80(v54);
    swift_bridgeObjectRelease();
    if (*(void *)(v0 + 48))
    {
      swift_retain();
      uint64_t v9 = sub_238D0();
      v56._countAndFlagsBits = 0x3E776F726D3CLL;
      v56._object = (void *)0xE600000000000000;
      sub_27B80(v56);
      swift_beginAccess();
      uint64_t v10 = *(void *)(v9 + 16);
      uint64_t v11 = *(void *)(v10 + 16);
      if (v11)
      {
        uint64_t v12 = v10 + 32;
        swift_bridgeObjectRetain();
        do
        {
          sub_16B04(v12, (uint64_t)&v48);
          uint64_t v14 = v50;
          uint64_t v13 = v51;
          sub_16B68(&v48, v50);
          v57._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v13 + 16) + 8))(v14);
          sub_27B80(v57);
          swift_bridgeObjectRelease();
          sub_16BAC((uint64_t)&v48);
          v12 += 40;
          --v11;
        }
        while (v11);
        swift_bridgeObjectRelease();
      }
      v58._countAndFlagsBits = 0x3E776F726D2F3CLL;
      v58._object = (void *)0xE700000000000000;
      sub_27B80(v58);
      swift_release();
      swift_release();
    }
    v59._countAndFlagsBits = 0x7265646E756D2F3CLL;
    v59._object = (void *)0xE90000000000003ELL;
    sub_27B80(v59);
    return v46;
  }
  if (!*(void *)(v0 + 48))
  {
    if (*(void *)(v0 + 40))
    {
      swift_retain();
      uint64_t v15 = sub_238D0();
      uint64_t v46 = 0x3E7265766F6D3CLL;
      unint64_t v48 = 1047489852;
      unint64_t v49 = 0xE400000000000000;
      uint64_t v16 = *(void *)(v0 + 16);
      uint64_t v17 = *(void **)(v0 + 24);
      swift_bridgeObjectRetain();
      v60._countAndFlagsBits = v16;
      v60._object = v17;
      sub_27B80(v60);
      swift_bridgeObjectRelease();
      v61._countAndFlagsBits = 0x3E6F6D2F3CLL;
      v61._object = (void *)0xE500000000000000;
      sub_27B80(v61);
      v62._countAndFlagsBits = 1047489852;
      v62._object = (void *)0xE400000000000000;
      sub_27B80(v62);
      swift_bridgeObjectRelease();
      v63._countAndFlagsBits = 0x3E776F726D3CLL;
      v63._object = (void *)0xE600000000000000;
      sub_27B80(v63);
      swift_beginAccess();
      uint64_t v18 = *(void *)(v15 + 16);
      uint64_t v19 = *(void *)(v18 + 16);
      if (v19)
      {
        uint64_t v20 = v18 + 32;
        swift_bridgeObjectRetain();
        do
        {
          sub_16B04(v20, (uint64_t)&v48);
          uint64_t v22 = v50;
          uint64_t v21 = v51;
          sub_16B68(&v48, v50);
          v64._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v21 + 16) + 8))(v22);
          sub_27B80(v64);
          swift_bridgeObjectRelease();
          sub_16BAC((uint64_t)&v48);
          v20 += 40;
          --v19;
        }
        while (v19);
        swift_bridgeObjectRelease();
      }
      v23._countAndFlagsBits = 0x3C3E776F726D2F3CLL;
      v23._object = (void *)0xEF3E7265766F6D2FLL;
      goto LABEL_34;
    }
    unint64_t v48 = 1047489852;
    unint64_t v49 = 0xE400000000000000;
    swift_bridgeObjectRetain();
    v7._countAndFlagsBits = v2;
LABEL_10:
    v7._object = v1;
    sub_27B80(v7);
    swift_bridgeObjectRelease();
    v55._countAndFlagsBits = 0x3E6F6D2F3CLL;
    v55._object = (void *)0xE500000000000000;
    sub_27B80(v55);
    return v48;
  }
  if (!*(void *)(v0 + 40))
  {
    swift_retain();
    uint64_t v25 = sub_238D0();
    uint64_t v46 = 0x3E7265646E756D3CLL;
    unint64_t v48 = 1047489852;
    unint64_t v49 = 0xE400000000000000;
    uint64_t v26 = *(void *)(v0 + 16);
    uint64_t v27 = *(void **)(v0 + 24);
    swift_bridgeObjectRetain();
    v65._countAndFlagsBits = v26;
    v65._object = v27;
    sub_27B80(v65);
    swift_bridgeObjectRelease();
    v66._countAndFlagsBits = 0x3E6F6D2F3CLL;
    v66._object = (void *)0xE500000000000000;
    sub_27B80(v66);
    v67._countAndFlagsBits = 1047489852;
    v67._object = (void *)0xE400000000000000;
    sub_27B80(v67);
    swift_bridgeObjectRelease();
    v68._countAndFlagsBits = 0x3E776F726D3CLL;
    v68._object = (void *)0xE600000000000000;
    sub_27B80(v68);
    swift_beginAccess();
    uint64_t v28 = *(void *)(v25 + 16);
    uint64_t v29 = *(void *)(v28 + 16);
    if (v29)
    {
      uint64_t v30 = v28 + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_16B04(v30, (uint64_t)&v48);
        uint64_t v32 = v50;
        uint64_t v31 = v51;
        sub_16B68(&v48, v50);
        v69._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v31 + 16) + 8))(v32);
        sub_27B80(v69);
        swift_bridgeObjectRelease();
        sub_16BAC((uint64_t)&v48);
        v30 += 40;
        --v29;
      }
      while (v29);
      swift_bridgeObjectRelease();
    }
    v23._object = (void *)0x8000000000038610;
    v23._countAndFlagsBits = 0xD000000000000010;
LABEL_34:
    sub_27B80(v23);
    swift_release();
    swift_release();
    return v46;
  }
  swift_retain();
  swift_retain();
  uint64_t v24 = sub_238D0();
  uint64_t v33 = sub_238D0();
  strcpy((char *)v47, "<munderover>");
  BYTE5(v47[1]) = 0;
  HIWORD(v47[1]) = -5120;
  unint64_t v48 = 1047489852;
  unint64_t v49 = 0xE400000000000000;
  uint64_t v34 = *(void *)(v0 + 16);
  uint64_t v35 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain();
  v70._countAndFlagsBits = v34;
  v70._object = v35;
  sub_27B80(v70);
  swift_bridgeObjectRelease();
  v71._countAndFlagsBits = 0x3E6F6D2F3CLL;
  v71._object = (void *)0xE500000000000000;
  sub_27B80(v71);
  v72._countAndFlagsBits = 1047489852;
  v72._object = (void *)0xE400000000000000;
  sub_27B80(v72);
  swift_bridgeObjectRelease();
  v73._countAndFlagsBits = 0x3E776F726D3CLL;
  v73._object = (void *)0xE600000000000000;
  sub_27B80(v73);
  swift_beginAccess();
  uint64_t v36 = *(void *)(v24 + 16);
  uint64_t v37 = *(void *)(v36 + 16);
  if (v37)
  {
    uint64_t v38 = v36 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_16B04(v38, (uint64_t)&v48);
      uint64_t v40 = v50;
      uint64_t v39 = v51;
      sub_16B68(&v48, v50);
      v74._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v39 + 16) + 8))(v40);
      sub_27B80(v74);
      swift_bridgeObjectRelease();
      sub_16BAC((uint64_t)&v48);
      v38 += 40;
      --v37;
    }
    while (v37);
    swift_bridgeObjectRelease();
  }
  v75._countAndFlagsBits = 0x3C3E776F726D2F3CLL;
  v75._object = (void *)0xED00003E776F726DLL;
  sub_27B80(v75);
  swift_beginAccess();
  uint64_t v41 = *(void *)(v33 + 16);
  uint64_t v42 = *(void *)(v41 + 16);
  if (v42)
  {
    uint64_t v43 = v41 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_16B04(v43, (uint64_t)&v48);
      uint64_t v45 = v50;
      uint64_t v44 = v51;
      sub_16B68(&v48, v50);
      v76._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v44 + 16) + 8))(v45);
      sub_27B80(v76);
      swift_bridgeObjectRelease();
      sub_16BAC((uint64_t)&v48);
      v43 += 40;
      --v42;
    }
    while (v42);
    swift_bridgeObjectRelease();
  }
  v77._countAndFlagsBits = 0xD000000000000014;
  v77._object = (void *)0x8000000000038630;
  sub_27B80(v77);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v47[0];
}

uint64_t type metadata accessor for Operator()
{
  return self;
}

uint64_t sub_26B28()
{
  return *(unsigned __int8 *)(*(void *)v0 + 34);
}

uint64_t sub_26B34(uint64_t a1)
{
  sub_26BD0(a1);

  return swift_release();
}

uint64_t sub_26B70(uint64_t a1)
{
  sub_26C2C(a1);

  return swift_release();
}

unint64_t sub_26BAC()
{
  return sub_261C0();
}

uint64_t sub_26BD0(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  swift_retain();
  uint64_t result = swift_release();
  if ((*(unsigned char *)(v1 + 34) & 1) == 0)
  {
    *(void *)(v1 + 40) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_26C2C(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  swift_retain();
  uint64_t result = swift_release();
  if ((*(unsigned char *)(v1 + 34) & 1) == 0)
  {
    *(void *)(v1 + 48) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_26C88()
{
  swift_retain();
  uint64_t v0 = sub_238D0();
  swift_release();
  uint64_t v10 = 0x6465636E65666D3CLL;
  unint64_t v11 = 0xEF3E776F726D3C3ELL;
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_16B04(v3, (uint64_t)v7);
      uint64_t v5 = v8;
      uint64_t v4 = v9;
      sub_16B68(v7, v8);
      v12._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8))(v5);
      sub_27B80(v12);
      swift_bridgeObjectRelease();
      sub_16BAC((uint64_t)v7);
      v3 += 40;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  v13._object = (void *)0x80000000000386E0;
  v13._countAndFlagsBits = 0xD000000000000011;
  sub_27B80(v13);
  swift_release();
  return v10;
}

uint64_t sub_26E78()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_16BAC(v0 + 56);
  sub_16BAC(v0 + 96);
  swift_release();

  return _swift_deallocClassInstance(v0, 144, 7);
}

uint64_t type metadata accessor for FencedGroup()
{
  return self;
}

uint64_t sub_26EFC()
{
  return sub_26C88();
}

uint64_t sub_26F20(uint64_t **a1, char *a2)
{
  uint64_t v4 = (*a1)[2];
  if (!v4) {
    goto LABEL_20;
  }
  uint64_t v5 = (*a1)[2 * v4 + 3];
  uint64_t v6 = *(void *)(v5 + 16);
  if (!v6) {
    goto LABEL_20;
  }
  sub_16B04(v5 + 40 * v6 - 8, (uint64_t)v48);
  uint64_t v8 = v49;
  uint64_t v7 = v50;
  sub_16B68(v48, v49);
  int v9 = (*(unsigned __int8 (**)(uint64_t))(*(void *)(v7 + 8) + 32))(v8);
  uint64_t v11 = *((void *)a2 + 3);
  uint64_t v10 = *((void *)a2 + 4);
  sub_16B68(a2, v11);
  LOBYTE(v10) = (*(uint64_t (**)(uint64_t))(*(void *)(v10 + 8) + 32))(v11);
  sub_16B04((uint64_t)a2, (uint64_t)v45);
  if (v9 != v10)
  {
    sub_16BAC((uint64_t)v45);
    sub_16B04((uint64_t)v48, (uint64_t)v42);
    goto LABEL_17;
  }
  uint64_t v13 = v46;
  uint64_t v12 = v47;
  sub_16B68(v45, v46);
  LODWORD(v12) = (*(unsigned __int8 (**)(uint64_t))(*(void *)(v12 + 8) + 32))(v13);
  sub_16BAC((uint64_t)v45);
  sub_16B04((uint64_t)v48, (uint64_t)v42);
  if (v12 != 1)
  {
LABEL_17:
    sub_16BAC((uint64_t)v42);
    sub_16B04((uint64_t)v48, (uint64_t)v39);
    goto LABEL_18;
  }
  uint64_t v15 = v43;
  uint64_t v14 = v44;
  sub_16B68(v42, v43);
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)(v14 + 8) + 88))(v15);
  swift_release();
  sub_16BAC((uint64_t)v42);
  sub_16B04((uint64_t)v48, (uint64_t)v39);
  if (v16)
  {
LABEL_18:
    sub_16BAC((uint64_t)v39);
    goto LABEL_19;
  }
  uint64_t v18 = v40;
  uint64_t v17 = v41;
  sub_16B68(v39, v40);
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)(v17 + 8) + 64))(v18);
  swift_release();
  sub_16BAC((uint64_t)v39);
  if (v19)
  {
LABEL_19:
    sub_16BAC((uint64_t)v48);
LABEL_20:
    sub_16A44(&qword_4BAA8);
    uint64_t inited = swift_initStackObject();
    long long v38 = xmmword_2E0F0;
    *(_OWORD *)(inited + 16) = xmmword_2E0F0;
    *(void *)(inited + 32) = 1;
    sub_16A44(&qword_4ADD0);
    uint64_t v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = v38;
    sub_16B04((uint64_t)a2, v37 + 32);
    *(void *)(inited + 40) = v37;
    return sub_23494(inited);
  }
  uint64_t v20 = *a1;
  unint64_t v21 = (*a1)[2];
  if (swift_isUniquelyReferenced_nonNull_native())
  {
    if (v21) {
      goto LABEL_9;
    }
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v20 = (uint64_t *)sub_27384((uint64_t)v20);
  if (!v21) {
    goto LABEL_22;
  }
LABEL_9:
  if (v21 > v20[2])
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v22 = &v20[2 * v21 + 2];
  if (__OFADD__(*v22, 1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  ++*v22;
  uint64_t v23 = v20[2];
  sub_16B04((uint64_t)a2, (uint64_t)v45);
  *a1 = v20;
  if (!v23)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v24 = (uint64_t)&v20[2 * v23 + 4];
  uint64_t v25 = *(char **)(v24 - 8);
  uint64_t v20 = (uint64_t *)(v24 - 8);
  a2 = v25;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v20 = (uint64_t)v25;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_26:
    a2 = sub_25888(0, *((void *)a2 + 2) + 1, 1, a2);
    uint64_t *v20 = (uint64_t)a2;
  }
  unint64_t v28 = *((void *)a2 + 2);
  unint64_t v27 = *((void *)a2 + 3);
  if (v28 >= v27 >> 1) {
    uint64_t *v20 = (uint64_t)sub_25888((char *)(v27 > 1), v28 + 1, 1, a2);
  }
  uint64_t v29 = v46;
  uint64_t v30 = v47;
  uint64_t v31 = sub_25EF8((uint64_t)v45, v46);
  __chkstk_darwin(v31, v31);
  uint64_t v33 = (char *)v39 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0) + 40;
  (*(void (**)(char *))(v34 + 16))(v33);
  sub_25C48(v28, (uint64_t)v33, v20, v29, v30);
  sub_16BAC((uint64_t)v45);
  return sub_16BAC((uint64_t)v48);
}

char *sub_27384(uint64_t a1)
{
  return sub_259AC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t static UIImage.transferRepresentation.getter()
{
  uint64_t v0 = sub_27780();
  __chkstk_darwin(v0 - 8, v1);
  sub_27770();
  sub_27510();
  sub_27550();
  return sub_27750();
}

uint64_t sub_2744C(void *a1)
{
  *(void *)(v1 + 16) = *a1;
  return _swift_task_switch(sub_27470, 0, 0);
}

uint64_t sub_27470()
{
  uint64_t v1 = UIImagePNGRepresentation(*(UIImage **)(v0 + 16));
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_27740();
    unint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v5 = 0xC000000000000000;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
  return v6(v3, v5);
}

unint64_t sub_27510()
{
  unint64_t result = qword_4B508;
  if (!qword_4B508)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_4B508);
  }
  return result;
}

unint64_t sub_27550()
{
  unint64_t result = qword_4BDD0;
  if (!qword_4BDD0)
  {
    sub_27510();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4BDD0);
  }
  return result;
}

uint64_t sub_275A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_275C4()
{
  uint64_t v0 = sub_27780();
  __chkstk_darwin(v0 - 8, v1);
  sub_27770();
  sub_27510();
  return sub_27750();
}

unint64_t sub_27678()
{
  unint64_t result = qword_4BDD8;
  if (!qword_4BDD8)
  {
    sub_1F360(&qword_4BDE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4BDD8);
  }
  return result;
}

uint64_t sub_276D4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_27708()
{
}

NSData sub_27730()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_27740()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_27750()
{
  return DataRepresentation.init(exportedContentType:exporting:)();
}

uint64_t sub_27760()
{
  return static UTType.pdf.getter();
}

uint64_t sub_27770()
{
  return static UTType.png.getter();
}

uint64_t sub_27780()
{
  return type metadata accessor for UTType();
}

uint64_t sub_27790()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_277A0()
{
  return FocusState.init<>()();
}

uint64_t sub_277B0()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t sub_277C0()
{
  return SharePreview<>.init(_:image:)();
}

uint64_t sub_277D0()
{
  return NavigationStack.init<>(root:)();
}

uint64_t sub_277E0()
{
  return static SafeAreaRegions.keyboard.getter();
}

uint64_t sub_277F0()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_27800()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_27810()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_27820()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t sub_27830()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_27840()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t sub_27850()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t sub_27860()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_27880()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t sub_27890()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_278A0()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t sub_278B0()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t sub_278C0()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t sub_278D0()
{
  return UIViewRepresentable.body.getter();
}

uint64_t sub_278F0()
{
  return static ToolbarItemPlacement.topBarLeading.getter();
}

uint64_t sub_27900()
{
  return static ToolbarItemPlacement.topBarTrailing.getter();
}

uint64_t sub_27910()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t sub_27920()
{
  return AccessibilityFocusState.wrappedValue.getter();
}

uint64_t sub_27930()
{
  return AccessibilityFocusState.projectedValue.getter();
}

uint64_t sub_27940()
{
  return AccessibilityFocusState.init<>()();
}

uint64_t sub_27950()
{
  return type metadata accessor for AccessibilityFocusState();
}

uint64_t sub_27960()
{
  return type metadata accessor for AccessibilityTechnologies();
}

uint64_t sub_27970()
{
  return UIViewRepresentableContext.coordinator.getter();
}

uint64_t sub_27980()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_27990()
{
  return Menu.init(content:label:)();
}

uint64_t sub_279A0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_279B0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_279C0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_279D0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_279E0()
{
  return View.accessibilityFocused(_:)();
}

uint64_t sub_279F0()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_27A00()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_27A10()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_27A20()
{
  return Image.init(uiImage:)();
}

uint64_t sub_27A30()
{
  return Image.init(systemName:)();
}

uint64_t sub_27A40()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_27A50()
{
  return State.wrappedValue.getter();
}

uint64_t sub_27A60()
{
  return State.wrappedValue.setter();
}

uint64_t sub_27A70()
{
  return State.projectedValue.getter();
}

uint64_t sub_27A80()
{
  return Button.init(action:label:)();
}

uint64_t sub_27A90()
{
  return Button<>.init(_:action:)();
}

uint64_t sub_27AA0()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_27AB0()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_27AC0()
{
  return ShareLink.init<A>(item:subject:message:preview:label:)();
}

uint64_t sub_27AD0()
{
  return TextField<>.init(_:text:prompt:)();
}

uint64_t sub_27AE0()
{
  return Character.isMathSymbol.getter();
}

uint64_t sub_27AF0()
{
  return Character.isLetter.getter();
}

uint64_t sub_27B00()
{
  return Character.isNumber.getter();
}

uint64_t sub_27B10()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_27B20()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_27B30()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_27B40()
{
  return String.hash(into:)();
}

uint64_t sub_27B50()
{
  return String.index(after:)();
}

uint64_t sub_27B60()
{
  return String.index(before:)();
}

void sub_27B70(Swift::String a1)
{
}

void sub_27B80(Swift::String a1)
{
}

Swift::Int sub_27B90()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_27BA0()
{
  return String.subscript.getter();
}

NSArray sub_27BB0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_27BC0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_27BD0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_27BE0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_27BF0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_27C00()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_27C10()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_27C20()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_27C30()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_27C40()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_27C50()
{
  return WKWebView.createPDF(configuration:completionHandler:)();
}

uint64_t sub_27C60()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_27C70()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_27C80()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

void sub_27C90(Swift::Int a1)
{
}

uint64_t sub_27CA0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_27CB0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_27CC0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_27CD0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_27CE0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_27CF0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_27D00(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_27D10()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_27D20()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_27D30()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_27D40()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_27D50()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_27D60()
{
  return Error._code.getter();
}

uint64_t sub_27D70()
{
  return Error._domain.getter();
}

uint64_t sub_27D80()
{
  return Error._userInfo.getter();
}

uint64_t sub_27D90()
{
  return print(_:separator:terminator:)();
}

uint64_t sub_27DA0()
{
  return Hasher.init(_seed:)();
}

void sub_27DB0(Swift::UInt a1)
{
}

Swift::Int sub_27DC0()
{
  return Hasher._finalize()();
}

uint64_t AXColorizeFormatLog()
{
  return _AXColorizeFormatLog();
}

uint64_t AXDeviceHasHomeButton()
{
  return _AXDeviceHasHomeButton();
}

uint64_t AXFormatInteger()
{
  return _AXFormatInteger();
}

uint64_t AXFormatNumber()
{
  return _AXFormatNumber();
}

uint64_t AXIsInternalInstall()
{
  return _AXIsInternalInstall();
}

uint64_t AXLocStringKeyForHomeButtonAndExclusiveModel()
{
  return _AXLocStringKeyForHomeButtonAndExclusiveModel();
}

uint64_t AXLoggerForFacility()
{
  return _AXLoggerForFacility();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return _AXOSLogLevelFromAXLogLevel();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return _AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t AXPerformSafeBlock()
{
  return _AXPerformSafeBlock();
}

uint64_t AXSafeClassFromString()
{
  return _AXSafeClassFromString();
}

uint64_t AXUIRectForZoomFocusChangeNotification()
{
  return _AXUIRectForZoomFocusChangeNotification();
}

uint64_t AX_CGPathCreateWithDataRepresentation()
{
  return _AX_CGPathCreateWithDataRepresentation();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return _CGGradientCreateWithColors(space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  return _CGPathGetBoundingBox(path);
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return _CGPathIsEmpty(path);
}

CGPoint CGPointFromString(NSString *string)
{
  CGPoint v3 = _CGPointFromString(string);
  double y = v3.y;
  double x = v3.x;
  result.double y = y;
  result.double x = x;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGRect CGRectFromString(NSString *string)
{
  return _CGRectFromString(string);
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

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return _GSEventIsHardwareKeyboardAttached();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSIntersectionRange(range1, range2);
  NSUInteger length = v4.length;
  NSUInteger location = v4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

NSRange NSRangeFromString(NSString *aString)
{
  NSRange v3 = _NSRangeFromString(aString);
  NSUInteger length = v3.length;
  NSUInteger location = v3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return _NSStringFromCGPoint(point);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return _NSStringFromRect(aRect);
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return _UIAccessibilityIsInvertColorsEnabled();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

uint64_t UIAccessibilityPathForAccessibilityPath()
{
  return _UIAccessibilityPathForAccessibilityPath();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAccessibilitySceneReferencePathToScreenPathWithView()
{
  return _UIAccessibilitySceneReferencePathToScreenPathWithView();
}

void UIAccessibilityZoomFocusChanged(UIAccessibilityZoomType type, CGRect frame, UIView *view)
{
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

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t UIRectCenteredIntegralRect()
{
  return _UIRectCenteredIntegralRect();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRectGetCenter()
{
  return _UIRectGetCenter();
}

uint64_t UIRectInset()
{
  return _UIRectInset();
}

uint64_t VOTLogCommon()
{
  return _VOTLogCommon();
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXSGuidedAccessEnabled()
{
  return __AXSGuidedAccessEnabled();
}

uint64_t _AXStringForArgs()
{
  return __AXStringForArgs();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UIAccessibilityBlockPostingOfNotification()
{
  return __UIAccessibilityBlockPostingOfNotification();
}

uint64_t _UIAccessibilityUnblockPostingOfNotification()
{
  return __UIAccessibilityUnblockPostingOfNotification();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAXStringForVariables()
{
  return ___UIAXStringForVariables();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return __swift_isClassOrObjCExistentialType();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

float cosf(float a1)
{
  return _cosf(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

float tanf(float a1)
{
  return _tanf(a1);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return _[a1 CGPath];
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return _[a1 CGPointValue];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _[a1 CGRectValue];
}

id objc_msgSend__accessibilityFindDescendant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityFindDescendant:");
}

id objc_msgSend__accessibilityLoadInvertColors(void *a1, const char *a2, ...)
{
  return _[a1 _accessibilityLoadInvertColors];
}

id objc_msgSend__addBrailleViewControllerWithOrientation_dotNumberPositions_typingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addBrailleViewControllerWithOrientation:dotNumberPositions:typingMode:");
}

id objc_msgSend__addMapsExplorationViewController(void *a1, const char *a2, ...)
{
  return _[a1 _addMapsExplorationViewController];
}

id objc_msgSend__addSubviews(void *a1, const char *a2, ...)
{
  return _[a1 _addSubviews];
}

id objc_msgSend__animateTextBack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateTextBack:");
}

id objc_msgSend__captionTextBottomInset(void *a1, const char *a2, ...)
{
  return _[a1 _captionTextBottomInset];
}

id objc_msgSend__circleViewForDotNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_circleViewForDotNumber:");
}

id objc_msgSend__constraintsToCenterItem_withItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_constraintsToCenterItem:withItem:");
}

id objc_msgSend__constraintsToPositionItem_identicallyToItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_constraintsToPositionItem:identicallyToItem:");
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return _[a1 _contextId];
}

id objc_msgSend__convertRectFromSceneReferenceSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertRectFromSceneReferenceSpace:");
}

id objc_msgSend__displayWithList_fromRotorSwitch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_displayWithList:fromRotorSwitch:");
}

id objc_msgSend__dotCircleImageFilled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dotCircleImageFilled:");
}

id objc_msgSend__generateAndStoreConstraintsForDotNumbers(void *a1, const char *a2, ...)
{
  return _[a1 _generateAndStoreConstraintsForDotNumbers];
}

id objc_msgSend__generateAndStoreTypingModeConstraintsForInsertedTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 _generateAndStoreTypingModeConstraintsForInsertedTextLabel];
}

id objc_msgSend__guidedAccessItemChooserDidShow(void *a1, const char *a2, ...)
{
  return _[a1 _guidedAccessItemChooserDidShow];
}

id objc_msgSend__handleBeginSonificationPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleBeginSonificationPlayback:");
}

id objc_msgSend__handleConvertFrameMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleConvertFrameMessage:");
}

id objc_msgSend__handleConvertFramesMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleConvertFramesMessage:");
}

id objc_msgSend__handleDisplayUIServerBasedItemChooser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDisplayUIServerBasedItemChooser:");
}

id objc_msgSend__handleFlashBrailleInsertedTextMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFlashBrailleInsertedTextMessage:");
}

id objc_msgSend__handleHideBrailleUIMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleHideBrailleUIMessage:");
}

id objc_msgSend__handleHideMapsExplorationUIMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleHideMapsExplorationUIMessage:");
}

id objc_msgSend__handleHideVoiceOverWarning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleHideVoiceOverWarning:");
}

id objc_msgSend__handleHighlightBrailleDotsMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleHighlightBrailleDotsMessage:");
}

id objc_msgSend__handleHighlightMapsExplorationSegmentMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleHighlightMapsExplorationSegmentMessage:");
}

id objc_msgSend__handleMoveSystemPointerToPointWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMoveSystemPointerToPointWithMessage:");
}

id objc_msgSend__handlePauseSonificationPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePauseSonificationPlayback:");
}

id objc_msgSend__handleRegisterForSystemPointerEventsWithMessage_clientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRegisterForSystemPointerEventsWithMessage:clientIdentifier:");
}

id objc_msgSend__handleScreenCurtainEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleScreenCurtainEnabled:");
}

id objc_msgSend__handleSendFocusChangeToZoom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSendFocusChangeToZoom:");
}

id objc_msgSend__handleSetCursorFrameMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSetCursorFrameMessage:");
}

id objc_msgSend__handleSetElementVisualizationFramesMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSetElementVisualizationFramesMessage:");
}

id objc_msgSend__handleSetSonificationPlayheadPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSetSonificationPlayheadPosition:");
}

id objc_msgSend__handleShowBrailleUIMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleShowBrailleUIMessage:");
}

id objc_msgSend__handleShowMapsExplorationUIMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleShowMapsExplorationUIMessage:");
}

id objc_msgSend__handleShowVoiceOverWarning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleShowVoiceOverWarning:");
}

id objc_msgSend__handleToggleElementLabeler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleToggleElementLabeler:");
}

id objc_msgSend__handleToggleQuickSettings(void *a1, const char *a2, ...)
{
  return _[a1 _handleToggleQuickSettings];
}

id objc_msgSend__handleUpdateBrailleUIMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleUpdateBrailleUIMessage:");
}

id objc_msgSend__handleUpdateMapsExplorationCurrentCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleUpdateMapsExplorationCurrentCenter:");
}

id objc_msgSend__handleUpdateMapsExplorationUIWithCurrentLocationMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleUpdateMapsExplorationUIWithCurrentLocationMessage:");
}

id objc_msgSend__handleUpdateVisualRotor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleUpdateVisualRotor:");
}

id objc_msgSend__handleVoiceOverCaptionPanelEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleVoiceOverCaptionPanelEnabled:");
}

id objc_msgSend__highlightedCircleViewForDotNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_highlightedCircleViewForDotNumber:");
}

id objc_msgSend__hostContextId(void *a1, const char *a2, ...)
{
  return _[a1 _hostContextId];
}

id objc_msgSend__isEightDotBraille(void *a1, const char *a2, ...)
{
  return _[a1 _isEightDotBraille];
}

id objc_msgSend__isTV(void *a1, const char *a2, ...)
{
  return _[a1 _isTV];
}

id objc_msgSend__layoutMarkerAtPosition_withCircleLocation_withImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutMarkerAtPosition:withCircleLocation:withImageView:");
}

id objc_msgSend__layoutTrackMarks(void *a1, const char *a2, ...)
{
  return _[a1 _layoutTrackMarks];
}

id objc_msgSend__layoutTrackMarks_placements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutTrackMarks:placements:");
}

id objc_msgSend__loadGuidedAccessBundle(void *a1, const char *a2, ...)
{
  return _[a1 _loadGuidedAccessBundle];
}

id objc_msgSend__numberOfDots(void *a1, const char *a2, ...)
{
  return _[a1 _numberOfDots];
}

id objc_msgSend__positionAccountingForKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_positionAccountingForKeyboard:");
}

id objc_msgSend__removeBrailleViewController(void *a1, const char *a2, ...)
{
  return _[a1 _removeBrailleViewController];
}

id objc_msgSend__removeCaptionPanelViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 _removeCaptionPanelViewControllers];
}

id objc_msgSend__removeCursorViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 _removeCursorViewControllers];
}

id objc_msgSend__removeElementVisualizationViewController(void *a1, const char *a2, ...)
{
  return _[a1 _removeElementVisualizationViewController];
}

id objc_msgSend__removeItemChooserController(void *a1, const char *a2, ...)
{
  return _[a1 _removeItemChooserController];
}

id objc_msgSend__removeMapsExplorationViewController(void *a1, const char *a2, ...)
{
  return _[a1 _removeMapsExplorationViewController];
}

id objc_msgSend__removeRotorViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 _removeRotorViewControllers];
}

id objc_msgSend__removeScreenCurtainControllers(void *a1, const char *a2, ...)
{
  return _[a1 _removeScreenCurtainControllers];
}

id objc_msgSend__removeSonificationViewController(void *a1, const char *a2, ...)
{
  return _[a1 _removeSonificationViewController];
}

id objc_msgSend__retrieveBezierPaths_usingRealPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_retrieveBezierPaths:usingRealPaths:");
}

id objc_msgSend__retrieveFrameBezierPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_retrieveFrameBezierPath:");
}

id objc_msgSend__retrievePathBezierPaths(void *a1, const char *a2, ...)
{
  return _[a1 _retrievePathBezierPaths];
}

id objc_msgSend__segmentImageFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_segmentImageFrom:to:");
}

id objc_msgSend__setAccessibilityServesAsFirstElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAccessibilityServesAsFirstElement:");
}

id objc_msgSend__setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOverrideUserInterfaceStyle:");
}

id objc_msgSend__setSectionIndexColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSectionIndexColor:");
}

id objc_msgSend__thinSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_thinSystemFontOfSize:");
}

id objc_msgSend__toggleVoiceOverCaptionPanelViewController(void *a1, const char *a2, ...)
{
  return _[a1 _toggleVoiceOverCaptionPanelViewController];
}

id objc_msgSend__trackPointForPlacement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trackPointForPlacement:");
}

id objc_msgSend__traitCollectionDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_traitCollectionDidChange:");
}

id objc_msgSend__unhostContextId(void *a1, const char *a2, ...)
{
  return _[a1 _unhostContextId];
}

id objc_msgSend__updateCaptionPanelHeight(void *a1, const char *a2, ...)
{
  return _[a1 _updateCaptionPanelHeight];
}

id objc_msgSend__updateConstantsForDotNumberConstraints(void *a1, const char *a2, ...)
{
  return _[a1 _updateConstantsForDotNumberConstraints];
}

id objc_msgSend__updateCursorWithFrame_pathData_animate_displayID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCursorWithFrame:pathData:animate:displayID:");
}

id objc_msgSend__updateDotsSevenAndEightVisibility(void *a1, const char *a2, ...)
{
  return _[a1 _updateDotsSevenAndEightVisibility];
}

id objc_msgSend__updateGuidedAccessWindowId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateGuidedAccessWindowId:");
}

id objc_msgSend__updatePositionForKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePositionForKeyboard:");
}

id objc_msgSend__updateScreenCurtainForInvertColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateScreenCurtainForInvertColors:");
}

id objc_msgSend__updateSelectedRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSelectedRow:");
}

id objc_msgSend_accessibilityElementAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityElementAtIndex:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addAnimations_delayFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimations:delayFactor:");
}

id objc_msgSend_addArcWithCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addArcWithCenter:radius:startAngle:endAngle:clockwise:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addClip(void *a1, const char *a2, ...)
{
  return _[a1 addClip];
}

id objc_msgSend_addCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCompletion:");
}

id objc_msgSend_addConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConstraints:");
}

id objc_msgSend_addContentViewController_withUserInteractionEnabled_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContentViewController:withUserInteractionEnabled:forService:");
}

id objc_msgSend_addContentViewController_withUserInteractionEnabled_forService_forSceneClientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:");
}

id objc_msgSend_addContentViewController_withUserInteractionEnabled_forService_forSceneClientIdentifier_context_userInterfaceStyle_forWindowScene_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:completion:");
}

id objc_msgSend_addContentViewController_withUserInteractionEnabled_forService_forSceneClientIdentifier_context_userInterfaceStyle_forWindowScene_spatialConfiguration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterfaceStyle:forWindowScene:spatialConfiguration:completion:");
}

id objc_msgSend_addLineToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLineToPoint:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addSubviewsFromExplorationSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubviewsFromExplorationSegments:");
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToRunLoop:forMode:");
}

id objc_msgSend_afterDelay_processBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afterDelay:processBlock:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 areAnimationsEnabled];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_autoresizesSubviews(void *a1, const char *a2, ...)
{
  return _[a1 autoresizesSubviews];
}

id objc_msgSend_bannerView(void *a1, const char *a2, ...)
{
  return _[a1 bannerView];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_becomeKeyWindow(void *a1, const char *a2, ...)
{
  return _[a1 becomeKeyWindow];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginConsumingPressesForButtonKind_eventConsumer_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginConsumingPressesForButtonKind:eventConsumer:priority:");
}

id objc_msgSend_beginningOfDocument(void *a1, const char *a2, ...)
{
  return _[a1 beginningOfDocument];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return _[a1 bezierPath];
}

id objc_msgSend_bezierPathWithArcCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:");
}

id objc_msgSend_bezierPathWithCGPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithCGPath:");
}

id objc_msgSend_bezierPathWithRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRect:");
}

id objc_msgSend_bezierPathWithRoundedRect_byRoundingCorners_cornerRadii_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_brailleViewController(void *a1, const char *a2, ...)
{
  return _[a1 brailleViewController];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_captionPanelHeight(void *a1, const char *a2, ...)
{
  return _[a1 captionPanelHeight];
}

id objc_msgSend_captionPanelText(void *a1, const char *a2, ...)
{
  return _[a1 captionPanelText];
}

id objc_msgSend_captionPanelViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 captionPanelViewControllers];
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_classicInvertColors(void *a1, const char *a2, ...)
{
  return _[a1 classicInvertColors];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clientMessengerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientMessengerWithIdentifier:");
}

id objc_msgSend_closeItemChooser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeItemChooser:");
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_colorWithHue_saturation_brightness_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithHue:saturation:brightness:alpha:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:multiplier:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _[a1 contentOffset];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_contextId(void *a1, const char *a2, ...)
{
  return _[a1 contextId];
}

id objc_msgSend_convertFrameToCursorSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertFrameToCursorSpace:");
}

id objc_msgSend_convertFrameToViewSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertFrameToViewSpace:");
}

id objc_msgSend_convertPoint_fromContextId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:fromContextId:");
}

id objc_msgSend_convertPoint_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:fromView:");
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromView:");
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toView:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 cornerRadius];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentIndex(void *a1, const char *a2, ...)
{
  return _[a1 currentIndex];
}

id objc_msgSend_currentLocation(void *a1, const char *a2, ...)
{
  return _[a1 currentLocation];
}

id objc_msgSend_currentLocationView(void *a1, const char *a2, ...)
{
  return _[a1 currentLocationView];
}

id objc_msgSend_currentRotaryView(void *a1, const char *a2, ...)
{
  return _[a1 currentRotaryView];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_cursorHidden(void *a1, const char *a2, ...)
{
  return _[a1 cursorHidden];
}

id objc_msgSend_cursorView(void *a1, const char *a2, ...)
{
  return _[a1 cursorView];
}

id objc_msgSend_cursorViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 cursorViewControllers];
}

id objc_msgSend_curtainView(void *a1, const char *a2, ...)
{
  return _[a1 curtainView];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_displayID(void *a1, const char *a2, ...)
{
  return _[a1 displayID];
}

id objc_msgSend_displayIdentity(void *a1, const char *a2, ...)
{
  return _[a1 displayIdentity];
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayLinkWithTarget:selector:");
}

id objc_msgSend_dotNumberPositions(void *a1, const char *a2, ...)
{
  return _[a1 dotNumberPositions];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_drawTextInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawTextInRect:");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_elementVisualizationViewController(void *a1, const char *a2, ...)
{
  return _[a1 elementVisualizationViewController];
}

id objc_msgSend_enableVoiceOverCaptions(void *a1, const char *a2, ...)
{
  return _[a1 enableVoiceOverCaptions];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return _[a1 enabled];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_externalWindowScenes(void *a1, const char *a2, ...)
{
  return _[a1 externalWindowScenes];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return _[a1 fill];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstRectForRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstRectForRange:");
}

id objc_msgSend_flashInsertedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flashInsertedText:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_handleHighlightChangeWithLastIndex_andNewIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleHighlightChangeWithLastIndex:andNewIndex:");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_hide(void *a1, const char *a2, ...)
{
  return _[a1 hide];
}

id objc_msgSend_hideAlertWithIdentifier_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideAlertWithIdentifier:forService:");
}

id objc_msgSend_hideItemChooser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideItemChooser:");
}

id objc_msgSend_highlightBrailleDots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highlightBrailleDots:");
}

id objc_msgSend_highlightExplorationSegmentWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highlightExplorationSegmentWithIndex:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_ignoreLogging(void *a1, const char *a2, ...)
{
  return _[a1 ignoreLogging];
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:");
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initWithAXUIService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAXUIService:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithContextId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContextId:");
}

id objc_msgSend_initWithDotNumberPositions_typingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDotNumberPositions:typingMode:");
}

id objc_msgSend_initWithDuration_curve_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDuration:curve:animations:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_atCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:atCenter:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithOrientation_dotNumberPositions_typingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOrientation:dotNumberPositions:typingMode:");
}

id objc_msgSend_initWithPoint_contextID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPoint:contextID:");
}

id objc_msgSend_initWithPrivateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrivateStyle:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTargetSerialQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTargetSerialQueue:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 isFirstResponder];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isPlayheadHidden(void *a1, const char *a2, ...)
{
  return _[a1 isPlayheadHidden];
}

id objc_msgSend_itemChooserController(void *a1, const char *a2, ...)
{
  return _[a1 itemChooserController];
}

id objc_msgSend_largeCursorEnabled(void *a1, const char *a2, ...)
{
  return _[a1 largeCursorEnabled];
}

id objc_msgSend_laserEnabled(void *a1, const char *a2, ...)
{
  return _[a1 laserEnabled];
}

id objc_msgSend_lastIndex(void *a1, const char *a2, ...)
{
  return _[a1 lastIndex];
}

id objc_msgSend_lastLocation(void *a1, const char *a2, ...)
{
  return _[a1 lastLocation];
}

id objc_msgSend_lastPointerEventPoint(void *a1, const char *a2, ...)
{
  return _[a1 lastPointerEventPoint];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leftAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_letterCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 letterCharacterSet];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 lightGrayColor];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return _[a1 lineHeight];
}

id objc_msgSend_lineWidth(void *a1, const char *a2, ...)
{
  return _[a1 lineWidth];
}

id objc_msgSend_loadAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadAndReturnError:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_mapsExplorationViewController(void *a1, const char *a2, ...)
{
  return _[a1 mapsExplorationViewController];
}

id objc_msgSend_marqueeEnableDelay(void *a1, const char *a2, ...)
{
  return _[a1 marqueeEnableDelay];
}

id objc_msgSend_movePointerToPoint_contextId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "movePointerToPoint:contextId:");
}

id objc_msgSend_moveToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveToPoint:");
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopyWithZone:");
}

id objc_msgSend_notifyZoomFocusDidChangeWithType_rect_contextId_keyboardFrame_displayId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyZoomFocusDidChangeWithType:rect:contextId:keyboardFrame:displayId:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return _[a1 orientation];
}

id objc_msgSend_parseMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseMessage:");
}

id objc_msgSend_pausePlayback(void *a1, const char *a2, ...)
{
  return _[a1 pausePlayback];
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_playbackBounds(void *a1, const char *a2, ...)
{
  return _[a1 playbackBounds];
}

id objc_msgSend_playbackDuration(void *a1, const char *a2, ...)
{
  return _[a1 playbackDuration];
}

id objc_msgSend_playbackStartTime(void *a1, const char *a2, ...)
{
  return _[a1 playbackStartTime];
}

id objc_msgSend_playheadFrameFromPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playheadFrameFromPosition:");
}

id objc_msgSend_playheadProgress(void *a1, const char *a2, ...)
{
  return _[a1 playheadProgress];
}

id objc_msgSend_playheadUpdateDisplayLink(void *a1, const char *a2, ...)
{
  return _[a1 playheadUpdateDisplayLink];
}

id objc_msgSend_playheadView(void *a1, const char *a2, ...)
{
  return _[a1 playheadView];
}

id objc_msgSend_pointerControllerInfo(void *a1, const char *a2, ...)
{
  return _[a1 pointerControllerInfo];
}

id objc_msgSend_pointerIsAbsolute(void *a1, const char *a2, ...)
{
  return _[a1 pointerIsAbsolute];
}

id objc_msgSend_pointerX(void *a1, const char *a2, ...)
{
  return _[a1 pointerX];
}

id objc_msgSend_pointerY(void *a1, const char *a2, ...)
{
  return _[a1 pointerY];
}

id objc_msgSend_positionFromPosition_offset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "positionFromPosition:offset:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:compatibleWithTraitCollection:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _[a1 redColor];
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_registerEventHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerEventHandler:");
}

id objc_msgSend_registerForTraitChanges_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTraitChanges:withHandler:");
}

id objc_msgSend_registerSpringBoardActionHandler_withIdentifierCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerSpringBoardActionHandler:withIdentifierCallback:");
}

id objc_msgSend_registerUpdateBlock_forRetrieveSelector_withListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerUpdateBlock:forRetrieveSelector:withListener:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_removeActionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeActionHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConstraints:");
}

id objc_msgSend_removeContentViewController_withUserInteractionEnabled_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeContentViewController:withUserInteractionEnabled:forService:");
}

id objc_msgSend_removeContentViewController_withUserInteractionEnabled_forService_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeContentViewController:withUserInteractionEnabled:forService:context:completion:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_requestGlobalMouseEventsForDisplay_targetContextID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestGlobalMouseEventsForDisplay:targetContextID:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_resizeFrameForDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resizeFrameForDisplay:");
}

id objc_msgSend_resizeFrameForWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resizeFrameForWindow:");
}

id objc_msgSend_resumePlaybackFromPosition_startTime_totalDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumePlaybackFromPosition:startTime:totalDuration:");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 rightAnchor];
}

id objc_msgSend_rotationRadian(void *a1, const char *a2, ...)
{
  return _[a1 rotationRadian];
}

id objc_msgSend_rotorViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 rotorViewControllers];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_safeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safeValueForKey:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return _[a1 screen];
}

id objc_msgSend_screenCurtainViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 screenCurtainViewControllers];
}

id objc_msgSend_screenshotActionHandlerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 screenshotActionHandlerIdentifier];
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _[a1 scrollView];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_segmentViews(void *a1, const char *a2, ...)
{
  return _[a1 segmentViews];
}

id objc_msgSend_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:");
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return _[a1 server];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessibilityElementsHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityElementsHidden:");
}

id objc_msgSend_setAccessibilityHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityHint:");
}

id objc_msgSend_setAccessibilityIgnoresInvertColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIgnoresInvertColors:");
}

id objc_msgSend_setAccessibilityTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityTraits:");
}

id objc_msgSend_setAccessibilityViewIsModal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityViewIsModal:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAnimationsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationsEnabled:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocapitalizationType:");
}

id objc_msgSend_setAutocorrectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionType:");
}

id objc_msgSend_setAutomaticallyCancelPendingBlockUponSchedulingNewBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setBannerLabelView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBannerLabelView:");
}

id objc_msgSend_setBannerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBannerView:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setBrailleViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBrailleViewController:");
}

id objc_msgSend_setCaptionPanelContextId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaptionPanelContextId:");
}

id objc_msgSend_setCaptionPanelHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaptionPanelHeight:");
}

id objc_msgSend_setCaptionPanelText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaptionPanelText:");
}

id objc_msgSend_setCaptionPanelViewControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaptionPanelViewControllers:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:animated:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setContextRelativePointerPosition_onDisplay_withAnimationParameters_restrictingToPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextRelativePointerPosition:onDisplay:withAnimationParameters:restrictingToPID:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCurrentCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentCenter:");
}

id objc_msgSend_setCurrentIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentIndex:");
}

id objc_msgSend_setCurrentLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentLocation:");
}

id objc_msgSend_setCursorFrame_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCursorFrame:animated:");
}

id objc_msgSend_setCursorHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCursorHidden:");
}

id objc_msgSend_setCursorPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCursorPath:");
}

id objc_msgSend_setCursorView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCursorView:");
}

id objc_msgSend_setCursorViewControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCursorViewControllers:");
}

id objc_msgSend_setCurtainView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurtainView:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDotNumberPositions_typingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDotNumberPositions:typingMode:");
}

id objc_msgSend_setEffectView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffectView:");
}

id objc_msgSend_setElementFrames_labels_uiClasses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementFrames:labels:uiClasses:");
}

id objc_msgSend_setElementVisualizationViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementVisualizationViewController:");
}

id objc_msgSend_setEnabled_animate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:animate:");
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEstimatedRowHeight:");
}

id objc_msgSend_setExternalWindowScenes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExternalWindowScenes:");
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillColor:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFramesHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFramesHidden:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setIndexBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndexBackgroundColor:");
}

id objc_msgSend_setIsAccessibilityElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsAccessibilityElement:");
}

id objc_msgSend_setItemChooserController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemChooserController:");
}

id objc_msgSend_setLastIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastIndex:");
}

id objc_msgSend_setLastPointerEventPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPointerEventPoint:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineWidth:");
}

id objc_msgSend_setMapsExplorationViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMapsExplorationViewController:");
}

id objc_msgSend_setMarqueeEnableDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMarqueeEnableDelay:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
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

id objc_msgSend_setOrientation_dotNumberPositions_typingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrientation:dotNumberPositions:typingMode:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPlaybackBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackBounds:");
}

id objc_msgSend_setPlaybackDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackDuration:");
}

id objc_msgSend_setPlaybackStartPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackStartPosition:");
}

id objc_msgSend_setPlaybackStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackStartTime:");
}

id objc_msgSend_setPlayheadHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayheadHidden:");
}

id objc_msgSend_setPlayheadProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayheadProgress:");
}

id objc_msgSend_setPlayheadUpdateDisplayLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayheadUpdateDisplayLink:");
}

id objc_msgSend_setPlayheadView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayheadView:");
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPosition:");
}

id objc_msgSend_setReturnKeyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnKeyType:");
}

id objc_msgSend_setRotationRadian_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotationRadian:");
}

id objc_msgSend_setRotorHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotorHidden:");
}

id objc_msgSend_setRotorItemCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotorItemCount:");
}

id objc_msgSend_setRotorViewControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotorViewControllers:");
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRowHeight:");
}

id objc_msgSend_setScreenCurtainViewControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenCurtainViewControllers:");
}

id objc_msgSend_setScrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollView:");
}

id objc_msgSend_setSegmentViews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSegmentViews:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowColor:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOpacity:");
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowRadius:");
}

id objc_msgSend_setSonificationViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSonificationViewController:");
}

id objc_msgSend_setSpellCheckingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpellCheckingType:");
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStrokeColor:");
}

id objc_msgSend_setSystemPointerController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemPointerController:");
}

id objc_msgSend_setSystemPointerRegistrants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemPointerRegistrants:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setTypingModeConstraintsForInsertedTextLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypingModeConstraintsForInsertedTextLabel:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setVoiceOverWarningIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVoiceOverWarningIdentifier:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setXConstraintsForDotNumbers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXConstraintsForDotNumbers:");
}

id objc_msgSend_setYConstraintsForDotNumbers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setYConstraintsForDotNumbers:");
}

id objc_msgSend_setupConstraintsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 setupConstraintsIfNecessary];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedDisplayManager];
}

id objc_msgSend_sharedEventManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedEventManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_show(void *a1, const char *a2, ...)
{
  return _[a1 show];
}

id objc_msgSend_showAlertWithText_subtitleText_iconImage_type_priority_duration_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAlertWithText:subtitleText:iconImage:type:priority:duration:forService:");
}

id objc_msgSend_showItemChooser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showItemChooser:");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sonificationViewController(void *a1, const char *a2, ...)
{
  return _[a1 sonificationViewController];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_startAnimationAfterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAnimationAfterDelay:");
}

id objc_msgSend_stopAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAnimation:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stroke(void *a1, const char *a2, ...)
{
  return _[a1 stroke];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return _[a1 sublayers];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemPointerController(void *a1, const char *a2, ...)
{
  return _[a1 systemPointerController];
}

id objc_msgSend_systemPointerController_pointerDidMoveToGlobalPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemPointerController:pointerDidMoveToGlobalPoint:");
}

id objc_msgSend_systemPointerRegistrants(void *a1, const char *a2, ...)
{
  return _[a1 systemPointerRegistrants];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _[a1 systemWhiteColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_textRangeFromPosition_toPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textRangeFromPosition:toPosition:");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollectionWithPreferredContentSizeCategory:");
}

id objc_msgSend_typingMode(void *a1, const char *a2, ...)
{
  return _[a1 typingMode];
}

id objc_msgSend_typingModeConstraintsForInsertedTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 typingModeConstraintsForInsertedTextLabel];
}

id objc_msgSend_uiClassForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiClassForName:");
}

id objc_msgSend_unregisterEventHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterEventHandler:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_updateRotorPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRotorPosition:");
}

id objc_msgSend_updateStyling(void *a1, const char *a2, ...)
{
  return _[a1 updateStyling];
}

id objc_msgSend_updateUIWithCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUIWithCenter:");
}

id objc_msgSend_updateUIWithCenter_andExplorationSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUIWithCenter:andExplorationSegments:");
}

id objc_msgSend_updateUIWithCurrentLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUIWithCurrentLocation:");
}

id objc_msgSend_updateVisualRotor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateVisualRotor:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_valueWithCGPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGPoint:");
}

id objc_msgSend_valueWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithRange:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_voiceOverItemChooserDidShow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voiceOverItemChooserDidShow:");
}

id objc_msgSend_voiceOverLargeCursorEnabled(void *a1, const char *a2, ...)
{
  return _[a1 voiceOverLargeCursorEnabled];
}

id objc_msgSend_voiceOverWarningIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 voiceOverWarningIdentifier];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_xConstraintsForDotNumbers(void *a1, const char *a2, ...)
{
  return _[a1 xConstraintsForDotNumbers];
}

id objc_msgSend_yConstraintsForDotNumbers(void *a1, const char *a2, ...)
{
  return _[a1 yConstraintsForDotNumbers];
}

id objc_msgSend_yellowColor(void *a1, const char *a2, ...)
{
  return _[a1 yellowColor];
}