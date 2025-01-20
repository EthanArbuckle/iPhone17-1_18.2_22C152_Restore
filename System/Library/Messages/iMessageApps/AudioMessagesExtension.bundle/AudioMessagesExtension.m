void sub_66B8(uint64_t a1, void *a2, void *a3, int a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9)
{
  id v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double MidX;
  double MidY;
  double Width;
  double Height;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  double v54;
  void *v55;
  void v56[3];
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v17 = a2;
  v18 = a3;
  if (v18)
  {
    v19 = [v17 animationForKey:v18];
    if (v19) {
      goto LABEL_9;
    }
  }
  else
  {
    v19 = 0;
  }
  if (!a4)
  {
    if (*(unsigned char *)(a1 + 56)
      && ([v17 superlayer], v20 = objc_claimAutoreleasedReturnValue(), v20, v20))
    {
      v21 = 1;
    }
    else
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      [v17 removeAllAnimations];
      v21 = 0;
    }
    objc_msgSend(v17, "setFrame:", a5, a6, a7, a8);
    *(float *)&v48 = a9;
    [v17 setOpacity:v48];
    v49 = [v17 superlayer];

    if (v49)
    {
      if (v21) {
        goto LABEL_25;
      }
    }
    else
    {
      v50 = [*(id *)(a1 + 32) layer];
      [v50 addSublayer:v17];

      if (v21) {
        goto LABEL_25;
      }
    }
    +[CATransaction commit];
    goto LABEL_25;
  }
LABEL_9:
  v22 = [v17 superlayer];

  if (!v22)
  {
    v23 = [*(id *)(a1 + 32) layer];
    [v23 addSublayer:v17];
  }
  v54 = a9;
  v24 = *(double *)(a1 + 40);
  if (v24 * 0.25 >= *(double *)(a1 + 48)) {
    v25 = v24 * 0.25;
  }
  else {
    v25 = *(double *)(a1 + 48);
  }
  if (v19)
  {
    v26 = CACurrentMediaTime();
    [v19 beginTime];
    v28 = v27;
    [v19 duration];
    v30 = v26 - (v28 + v29);
    if (v30 > 0.1) {
      v25 = v30;
    }
    else {
      v25 = 0.1;
    }
  }
  v31 = v17;
  v53 = v18;
  v32 = [v31 presentationLayer];
  v33 = [v32 valueForKeyPath:@"position"];

  v34 = [v31 presentationLayer];
  v35 = [v34 valueForKeyPath:@"bounds"];

  v36 = [v31 presentationLayer];
  v37 = [v36 valueForKey:@"opacity"];

  v57.origin.x = a5;
  v57.origin.y = a6;
  v57.size.width = a7;
  v57.size.height = a8;
  MidX = CGRectGetMidX(v57);
  v58.origin.x = a5;
  v58.origin.y = a6;
  v58.size.width = a7;
  v58.size.height = a8;
  MidY = CGRectGetMidY(v58);
  v59.origin.x = a5;
  v59.origin.y = a6;
  v59.size.width = a7;
  v59.size.height = a8;
  Width = CGRectGetWidth(v59);
  v60.origin.x = a5;
  v60.origin.y = a6;
  v60.size.width = a7;
  v60.size.height = a8;
  Height = CGRectGetHeight(v60);
  objc_msgSend(v31, "setPosition:", MidX, MidY);
  objc_msgSend(v31, "setBounds:", 0.0, 0.0, Width, Height);
  HIDWORD(v42) = HIDWORD(v54);
  *(float *)&v42 = v54;
  [v31 setOpacity:v42];
  v43 = +[CABasicAnimation animationWithKeyPath:@"position"];
  v55 = (void *)v33;
  [v43 setFromValue:v33];
  v44 = +[CABasicAnimation animationWithKeyPath:@"bounds"];
  v52 = (void *)v35;
  [v44 setFromValue:v35];
  v45 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v45 setFromValue:v37];
  v46 = objc_alloc_init((Class)CAAnimationGroup);
  v56[0] = v43;
  v56[1] = v44;
  v56[2] = v45;
  v47 = +[NSArray arrayWithObjects:v56 count:3];
  [v46 setAnimations:v47];

  if (v25 >= 0.0) {
    [v46 setDuration:v25];
  }
  objc_msgSend(v46, "setRemovedOnCompletion:", 1, v18);
  [v31 addAnimation:v46 forKey:v53];

  v18 = v51;
LABEL_25:
}

BOOL sub_6D88(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  [v7 opacity];
  if (v8 < 1.0 || ([v7 isHidden] & 1) != 0)
  {
    BOOL v9 = 0;
  }
  else
  {
    v10 = [*(id *)(a1 + 32) layer];
    [v7 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = [v7 superlayer];
    objc_msgSend(v10, "convertRect:fromLayer:", v19, v12, v14, v16, v18);
    double v21 = v20;
    CGFloat v23 = v22;
    double v25 = v24;
    CGFloat v27 = v26;

    v29.origin.x = v21 - a3;
    v29.size.width = a3 + a4 + v25;
    v29.origin.y = v23;
    v29.size.height = v27;
    BOOL v9 = CGRectContainsPoint(v29, *(CGPoint *)(a1 + 40));
  }

  return v9;
}

void sub_73F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 224), 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Unwind_Resume(a1);
}

double sub_7470(id a1, double result, double a3, double a4, double a5, int a6)
{
  double v6 = a3 - result;
  if (a6 <= 0) {
    double v6 = result - a3;
  }
  double v7 = fmax(v6, 0.0);
  int v8 = -a6;
  BOOL v9 = v7 >= a4 || a4 <= 0.0;
  double v10 = a3 + (double)v8 * a4;
  if (!v9) {
    result = v10;
  }
  BOOL v11 = v7 <= a5 || a5 <= 0.0;
  double v12 = a3 + (double)v8 * a5;
  if (!v11) {
    return v12;
  }
  return result;
}

void sub_74B4(uint64_t a1, void *a2)
{
  id v28 = a2;
  [v28 updateTrackingInfo];
  v3 = (char *)[v28 selectionBarType];
  if (v3 == (unsigned char *)&def_3AC7C + 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
    double v21 = [v28 touch];
    double v22 = [*(id *)(a1 + 32) superview];
    [v21 locationInView:v22];
    double v24 = v23;

    if (([*(id *)(a1 + 32) enableTimeTrackingInView] & 1) == 0)
    {
      [v28 trackingOffset];
      double v24 = v24 + v25;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
    [WeakRetained waveformSelectionOverlay:*(void *)(a1 + 32) timeForOffset:v24];
    *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v27;

    v4 = v28;
  }
  else
  {
    if (v3 == (unsigned char *)&def_3AC7C + 1)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      double v14 = [v28 touch];
      double v15 = [*(id *)(a1 + 32) superview];
      [v14 locationInView:v15];
      double v17 = v16;
      [v28 trackingOffset];
      *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v17 + v18;

      id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
      [v19 waveformSelectionOverlay:*(void *)(a1 + 32) timeForOffset:*(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v20;

      (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(double *)(*(void *)(a1 + 32) + 168), *(double *)(*(void *)(a1 + 32) + 176));
      v4 = v28;
      uint64_t v13 = *(void *)(a1 + 72);
    }
    else
    {
      v4 = v28;
      if (v3) {
        goto LABEL_10;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      v5 = [v28 touch];
      double v6 = [*(id *)(a1 + 32) superview];
      [v5 locationInView:v6];
      double v8 = v7;
      [v28 trackingOffset];
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8 + v9;

      id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
      [v10 waveformSelectionOverlay:*(void *)(a1 + 32) timeForOffset:*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v11;

      (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), *(double *)(*(void *)(a1 + 32) + 168), *(double *)(*(void *)(a1 + 32) + 176));
      v4 = v28;
      uint64_t v13 = *(void *)(a1 + 64);
    }
    *(void *)(*(void *)(v13 + 8) + 24) = v12;
  }
LABEL_10:
}

void sub_789C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  v5 = [a3 touch];

  if (!v5) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

id sub_7D88(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(a2, "pointerValue"));
  *a4 = (_BYTE)result;
  return result;
}

id sub_AB54(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)CALayer);
  objc_msgSend(v2, "setBounds:", 0.0, 0.0, *(double *)(a1 + 56), *(double *)(a1 + 40) + *(double *)(a1 + 48) * -4.0);
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(*(id *)(a1 + 32), "CGColor"));
  [v2 setOpaque:1];

  return v2;
}

id sub_ABD8(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)CALayer);
  objc_msgSend(v2, "setBounds:", 0.0, 0.0, *(double *)(a1 + 40) + *(double *)(a1 + 40), *(double *)(a1 + 40) + *(double *)(a1 + 40));
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(*(id *)(a1 + 32), "CGColor"));
  [v2 setCornerRadius:*(double *)(a1 + 40)];
  [v2 setOpaque:1];

  return v2;
}

void sub_B28C(id a1)
{
  v1 = objc_alloc_init(RCNoAnimateLayerHelper);
  id v2 = (void *)qword_82DA0;
  qword_82DA0 = (uint64_t)v1;
}

void sub_B384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_B420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_B608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_B690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_B7E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_BA28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)RCWaveformRenderer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_BAC0(void *a1)
{
}

void sub_BB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_BD10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_BDD0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 142) = 1;
  v1 = *(void **)(a1 + 32);
  [v1 _duration];

  return objc_msgSend(v1, "_renderVisibleTimeRangeWithDuration:");
}

void sub_BEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_BF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void *sub_BF70(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearRenderingState];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 152);
  if (v3)
  {
    objc_msgSend(v3, "removeObserver:");
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(void *)(v2 + 32) = 0;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 152), *(id *)(a1 + 40));
  id result = *(void **)(a1 + 32);
  if (result[19])
  {
    [result _updateOverviewUnitsPerSecond];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "addObserver:");
    *(unsigned char *)(*(void *)(a1 + 32) + 142) = 1;
    [*(id *)(a1 + 32) _setNeedsVisibleTimeRangeRendering];
    id result = [*(id *)(*(void *)(a1 + 32) + 152) duration];
    if (v5 > 0.0)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 143) = 1;
      id result = objc_msgSend(*(id *)(a1 + 32), "_renderVisibleTimeRangeWithDuration:");
      *(unsigned char *)(*(void *)(a1 + 32) + 143) = 0;
    }
  }
  return result;
}

void sub_C208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C31C(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_C3E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C6D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_C858(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[140])
  {
    if (v2[137])
    {
      [*(id *)(a1 + 40) timeRange];
      double v4 = v3;
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
      [WeakRetained currentTime];
      double v7 = vabdd_f64(v4, v6);

      if (v7 > 0.25) {
        *(unsigned char *)(*(void *)(a1 + 32) + 146) = 1;
      }
      uint64_t v2 = *(unsigned char **)(a1 + 32);
    }
  }
  else if (v2[137])
  {
    goto LABEL_8;
  }
  v2[142] = 1;
LABEL_8:
  double v8 = *(void **)(a1 + 32);

  return [v8 _setNeedsVisibleTimeRangeRendering];
}

void sub_C924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_C9A4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 142) = 1;
  return [*(id *)(a1 + 32) _setNeedsVisibleTimeRangeRendering];
}

unsigned char *sub_CAD0(uint64_t a1)
{
  id result = *(unsigned char **)(a1 + 32);
  if (!result[144] && !result[8]) {
    return [result _startRendering];
  }
  return result;
}

void sub_CC10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CC7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CDC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_CE7C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 184);
  *(void *)(v2 + 184) = 0;

  *(_OWORD *)(*(void *)(a1 + 32) + 16) = RCTimeRangeZero;
  *(unsigned char *)(*(void *)(a1 + 32) + 142) = 1;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v4 = objc_msgSend(*(id *)(a1 + 32), "waveformSlices", 0);
  double v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v8) sliceLayer];
        [v9 removeFromSuperlayer];

        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  id v10 = objc_opt_new();
  [*(id *)(a1 + 32) setWaveformSlices:v10];

  uint64_t v11 = objc_opt_new();
  [*(id *)(a1 + 32) setWaveformSliceIndexes:v11];

  uint64_t v13 = *(void **)(a1 + 32);
  uint64_t v12 = (id *)(a1 + 32);
  [v13 setWaveformAmpSlicesForRendering:&__NSArray0__struct];
  *((_OWORD *)*v12 + 3) = RCTimeRangeZero;
  double v14 = (char *)*v12 + 64;
  *double v14 = 0;
  v14[1] = 0;
  *((unsigned char *)*v12 + 80) = 0;
  [*v12 _setNeedsVisibleTimeRangeRendering];
  return [*v12 _setNeedsRendering];
}

void sub_D07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_DC9C(_Unwind_Exception *a1)
{
}

void sub_DDF4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) renderingQueueIsBusy]) {
    return;
  }
  [*(id *)(a1 + 32) setFailedFirstRenderCalculationAttempt:0];
  [*(id *)(a1 + 32) setRenderingQueueIsBusy:1];
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "waveformSegmentsIntersectingTimeRange:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v3 = [*(id *)(a1 + 32) waveformSliceIndexes];
  id v4 = [v3 mutableCopy];
  double v5 = v4;
  uint64_t v6 = 3;
  if (*(uint64_t *)(a1 + 56) > 3) {
    uint64_t v6 = *(void *)(a1 + 56);
  }
  uint64_t v7 = v6 - 3;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 140)) {
    uint64_t v8 = *(void *)(a1 + 56);
  }
  else {
    uint64_t v8 = v7;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 140)) {
    uint64_t v9 = *(void *)(a1 + 64);
  }
  else {
    uint64_t v9 = *(void *)(a1 + 64) + 6;
  }
  objc_msgSend(v4, "removeIndexesInRange:", v8, v9);
  id v10 = [v2 objectEnumerator];
  uint64_t v11 = [v10 nextObject];
  uint64_t v12 = [*(id *)(a1 + 32) waveformSlices];
  v57 = v3;
  v56 = v2;
  uint64_t v13 = *(void *)(a1 + 56);
  if (v13 >= (unint64_t)(*(void *)(a1 + 64) + v13)) {
    goto LABEL_58;
  }
  do
  {
    unint64_t v14 = v13 + 1;
    double v15 = RCTimeRangeMake(*(double *)(a1 + 72) * (double)v13, *(double *)(a1 + 72) * (double)(v13 + 1));
    double v17 = v16;
    long long v18 = +[NSNumber numberWithInteger:v13];
    long long v19 = [v12 objectForKeyedSubscript:v18];

    if (v19)
    {
      int v20 = *(unsigned __int8 *)(a1 + 120);
      [v5 removeIndex:v13];
      BOOL v21 = v20 != 0;
      if (v20 || !*(unsigned char *)(a1 + 121)) {
        goto LABEL_25;
      }
      if (!*(unsigned char *)(*(void *)(a1 + 32) + 140) && !*(unsigned char *)(a1 + 122))
      {
        double v22 = *(double *)(a1 + 96);
        int v23 = (v15 - v22 <= 0.0) & ~RCTimeRangeEqualToTimeRange(*(double *)(a1 + 88), v22, 1.79769313e308, -1.79769313e308);
        if (v15 - v22 > -0.5) {
          BOOL v21 = v23;
        }
        else {
          BOOL v21 = 0;
        }
        goto LABEL_25;
      }
    }
    else
    {
      if ([v5 count]
        && (id v24 = [v5 firstIndex],
            +[NSNumber numberWithUnsignedInteger:v24],
            double v25 = objc_claimAutoreleasedReturnValue(),
            [v12 objectForKeyedSubscript:v25],
            long long v19 = objc_claimAutoreleasedReturnValue(),
            v25,
            v19))
      {
        double v26 = +[NSNumber numberWithUnsignedInteger:v24];
        [v12 setObject:0 forKeyedSubscript:v26];

        [v57 removeIndex:v24];
        [v5 removeIndex:v24];
        uint64_t v27 = +[NSNumber numberWithInteger:v13];
        [v12 setObject:v19 forKeyedSubscript:v27];

        [v57 addIndex:v13];
      }
      else
      {
        uint64_t v28 = objc_opt_new();
        CGRect v29 = +[NSNumber numberWithInteger:v13];
        [v12 setObject:v28 forKeyedSubscript:v29];

        long long v19 = (void *)v28;
        [v57 addIndex:v13];
      }
      [v19 setAmplitude:*(double *)(a1 + 80)];
      [v19 setVisualAmplitudeHeightInterpolatingFrames:0];
      [v19 setVisualAmplitudeHeight:RCOnePixelInPoints()];
      [v19 setSliceIndex:v13];
      [v19 setHasProcessedSegments:0];
    }
    BOOL v21 = 1;
LABEL_25:
    if (!v11) {
      [v19 setHasProcessedSegments:0];
    }
    if (!v21 && ([v19 hasProcessedSegments] & 1) != 0) {
      goto LABEL_57;
    }
    if (!v11)
    {
      v30 = 0;
      double v31 = -3.40282347e38;
      goto LABEL_49;
    }
    v30 = v11;
    double v31 = -3.40282347e38;
    while (1)
    {
      id v32 = [v30 averagePowerLevelsCount];
      v33 = (float *)[v30 averagePowerLevels];
      [v30 timeRange];
      double v35 = v34;
      double v37 = v36;
      if (RCTimeRangeIntersectsRange(v15, v17, v34, v36)) {
        break;
      }
      if (v37 >= v15)
      {
        if (v35 > v17) {
          goto LABEL_49;
        }
        goto LABEL_46;
      }
LABEL_44:
      uint64_t v42 = [v10 nextObject];

      v30 = (void *)v42;
LABEL_46:
      if (!v30) {
        goto LABEL_49;
      }
    }
    if ((uint64_t)v32 < 1) {
      goto LABEL_44;
    }
    uint64_t v38 = 0;
    double v39 = v37 - v35;
    while (1)
    {
      double v40 = v35 + v39 * (float)((float)v38 / (float)(uint64_t)v32);
      if (v40 > v17) {
        break;
      }
      if (v40 >= v15 && v40 <= v17)
      {
        [v19 setHasProcessedSegments:1];
        if (v31 < v33[v38]) {
          double v31 = v33[v38];
        }
      }
      if (v32 == (id)++v38) {
        goto LABEL_44;
      }
    }
LABEL_49:
    v43 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v43 minimumDecibelDisplayRange];
    double v45 = v44;

    if (v31 >= v45) {
      double v46 = v31;
    }
    else {
      double v46 = -3.40282347e38;
    }
    float v47 = v46;
    double v48 = RCNormalizedDecibelValue(v47);
    if (v48 > *(double *)&qword_82E10) {
      double v48 = *(double *)&qword_82E10;
    }
    double v49 = *(double *)&qword_82E20 * sqrt(v48);
    if (v49 < *(double *)(a1 + 80)) {
      double v49 = *(double *)(a1 + 80);
    }
    [v19 setAmplitude:v49];
    uint64_t v11 = v30;
LABEL_57:

    uint64_t v13 = v14;
  }
  while (v14 < *(void *)(a1 + 64) + *(void *)(a1 + 56));
LABEL_58:
  if (*(unsigned char *)(a1 + 123))
  {
    v50 = [v12 allValues];
    id v51 = [v50 count];

    if (!v51)
    {
      [*(id *)(a1 + 32) setFailedFirstRenderCalculationAttempt:1];
      v52 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
        sub_45F0C(v52);
      }
    }
  }
  v53 = [v12 allValues];
  [*(id *)(a1 + 32) setWaveformAmpSlicesForRendering:v53];

  *(_OWORD *)(*(void *)(a1 + 32) + 48) = *(_OWORD *)(a1 + 104);
  *(_OWORD *)(*(void *)(a1 + 32) + 64) = *(_OWORD *)(a1 + 56);
  if (*(unsigned char *)(a1 + 122)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 80) = 1;
  }
  v54 = [*(id *)(a1 + 32) nextRenderBlock];
  v55 = *(void **)(a1 + 32);
  if (v54)
  {
    [v55 setNextRenderBlock:0];
    dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 88), v54);
    if (([*(id *)(a1 + 32) waitForFinalCalc] & 1) == 0)
    {
      v55 = *(void **)(a1 + 32);
      goto LABEL_68;
    }
  }
  else
  {
LABEL_68:
    [v55 setRenderReadyForDraw:1];
  }
  [*(id *)(a1 + 32) setRenderingQueueIsBusy:0];
}

void sub_E464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id sub_E578(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    double v16 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
    double v12 = 0.0;
    uint64_t v13 = 0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v9 = 0.0;
    [v4 getRed:&v16 green:&v15 blue:&v14 alpha:&v13];
    [v5 getRed:&v12 green:&v11 blue:&v10 alpha:&v9];
    id v6 = +[UIColor colorWithRed:(1.0 - v9) * v16 + v9 * v12 green:(1.0 - v9) * v15 + v9 * v11 blue:(1.0 - v9) * v14 + v9 * v10 alpha:1.0];
  }
  else
  {
    id v6 = v4;
  }
  uint64_t v7 = v6;

  return v7;
}

void sub_E674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E68C(uint64_t a1, void *a2, void *a3, double a4)
{
  id v49 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
  if ([WeakRetained isZooming]) {
    uint64_t v9 = a1 + 48;
  }
  else {
    uint64_t v9 = *(void *)(a1 + 32) + 216;
  }
  double v11 = *(double *)v9;
  double v10 = *(double *)(v9 + 8);

  double v12 = *(double *)(a1 + 64);
  double v13 = RCTimeRangeDelta(v11, v10);
  double v14 = 0.0;
  if (v13 > 0.0) {
    double v14 = v11 * (v12 / v13);
  }
  objc_msgSend(v7, "bounds", v49);
  [v7 setBounds:v14];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v15 = v50;
  id v16 = [v15 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v52;
    double v18 = -v14;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(v15);
        }
        int v20 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        BOOL v21 = (char *)[v20 sliceIndex];
        unint64_t v22 = *(void *)(*(void *)(a1 + 32) + 64);
        BOOL v24 = (unint64_t)v21 >= v22;
        int v23 = &v21[-v22];
        BOOL v24 = !v24 || (unint64_t)v23 >= *(void *)(*(void *)(a1 + 32) + 72);
        if (v24 || ([v20 amplitude], objc_msgSend(v20, "amplitude"), fabs(v25) == INFINITY))
        {
          [v20 setHidden:1];
          continue;
        }
        double v26 = [v20 sliceLayer];
        if (!v26)
        {
          double v26 = +[CALayer layer];
          uint64_t v27 = +[RCNoAnimateLayerHelper sharedNoAnimationHelper];
          [v26 setDelegate:v27];

          [v26 setOpaque:1];
          [v20 setSliceLayer:v26];
        }
        id v28 = [v20 sliceIndex];
        double v29 = *(double *)(a1 + 72);
        unsigned int v30 = [v20 hasProcessedSegments];
        double v31 = 0.0;
        if (v30)
        {
          objc_msgSend(v20, "amplitude", 0.0);
          double v31 = fmax(v32, 0.0);
        }
        double v33 = v31 * *(double *)(a1 + 80);
        if (v33 < *(double *)(a1 + 88)) {
          double v34 = v33;
        }
        else {
          double v34 = *(double *)(a1 + 88);
        }
        [v20 setVisualAmplitudeHeight:v34];
        double v35 = RCOnePixelInPoints();
        [v20 visualAmplitudeHeight];
        double v37 = v29 * (double)(uint64_t)v28;
        if (v35 < v36) {
          double v35 = v36;
        }
        uint64_t v38 = [v20 sliceLayer];
        id v39 = [v38 superlayer];
        BOOL v40 = v39 == v7;

        if (!v40)
        {
          v41 = [v20 sliceLayer];
          [v7 addSublayer:v41];
        }
        [v20 setHidden:0];
        double v42 = RCRoundCoord(v37);
        double v43 = *(double *)(a1 + 80);
        double v44 = RCRoundCoord(a4);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          [v20 setColor:0];
        }
        if (([*(id *)(a1 + 32) isOverview] & 1) == 0)
        {
          double v46 = *(unsigned char **)(a1 + 32);
          if (!v46[41] || !v46[137] || [v46 isPlayBarOnlyMode])
          {
            if (RCTimeRangeEqualToTimeRange(*(double *)(a1 + 96), *(double *)(a1 + 104), 1.79769313e308, -1.79769313e308)|| (unint64_t)[v20 sliceIndex] >= *(void *)(a1 + 112)&& (unint64_t)objc_msgSend(v20, "sliceIndex") <= *(void *)(a1 + 120))
            {
              if (v18 + (double)(uint64_t)[v20 sliceIndex] * *(double *)(a1 + 72) < *(double *)(a1 + 64)
                                                                                                 * 0.5)
                uint64_t v45 = 1;
              else {
                uint64_t v45 = 2;
              }
              goto LABEL_46;
            }
LABEL_45:
            uint64_t v45 = 2;
            goto LABEL_46;
          }
        }
        if (!RCTimeRangeEqualToTimeRange(*(double *)(a1 + 96), *(double *)(a1 + 104), 1.79769313e308, -1.79769313e308)
          && ((unint64_t)[v20 sliceIndex] < *(void *)(a1 + 112)
           || (unint64_t)[v20 sliceIndex] > *(void *)(a1 + 120)))
        {
          goto LABEL_45;
        }
        uint64_t v45 = 1;
LABEL_46:
        [v20 setColor:v45];
        if (([v20 hasProcessedSegments] & 1) == 0)
        {
          if (*(unsigned char *)(*(void *)(a1 + 32) + 137))
          {
            if ([v20 color] != (char *)&def_3AC7C + 1) {
              [v20 setHidden:1];
            }
          }
          else
          {
            float v47 = [v20 uiColorDimmed];
            [v20 setColor:0];
            id v48 = v47;
            objc_msgSend(v26, "setBackgroundColor:", objc_msgSend(v48, "CGColor"));
          }
        }
        objc_msgSend(v20, "setFrame:", v42, v43 - v35, v44, v35 + v35);
      }
      id v16 = [v15 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v16);
  }
}

void sub_EBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_ED50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EEEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EFC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_F45C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_F4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_F5B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F6FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FA4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FC4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FD70(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

id OSLogForCategory(void *a1)
{
  id v1 = a1;
  id v2 = &_os_log_default;
  if (qword_82E38 == -1)
  {
    if (v1) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_82E38, &stru_6D120);
    if (v1)
    {
LABEL_3:
      double v3 = [(id)qword_82E30 objectForKey:v1];

      if (v3) {
        goto LABEL_15;
      }
      if ((unint64_t)[(id)qword_82E30 count] > 0xA)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
LABEL_12:
          double v3 = &_os_log_default;
          id v8 = &_os_log_default;
          goto LABEL_15;
        }
        __int16 v10 = 0;
        id v6 = "ERROR | Too many categories defined, use default";
        id v7 = (uint8_t *)&v10;
      }
      else
      {
        id v4 = v1;
        os_log_t v5 = os_log_create("com.apple.VoiceMemos", (const char *)[v4 UTF8String]);
        if (v5)
        {
          double v3 = v5;
          [(id)qword_82E30 setObject:v5 forKey:v4];
          goto LABEL_15;
        }
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        id v6 = "ERROR | Failed os_log_create, use default";
        id v7 = buf;
      }
      _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_12;
    }
  }
  double v3 = &_os_log_default;
LABEL_15:

  return v3;
}

void sub_FFDC(id a1)
{
  id v1 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
  id v2 = (void *)qword_82E30;
  qword_82E30 = (uint64_t)v1;
}

uint64_t RCShouldAssertWarnings()
{
  uint64_t result = MSVDeviceOSIsInternalInstall();
  if (result) {
    return RCDebugAssertsDisabled() ^ 1;
  }
  return result;
}

void sub_103D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1044C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_104F8(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 48) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 48);
    return [v4 addObject:v3];
  }
  return result;
}

void sub_10610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10620(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

id sub_106A0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_flushRemainingData");
}

uint64_t sub_106F0(void *a1, const char *a2)
{
  id v3 = a1;
  id v4 = (char *)[v3 state];
  os_log_t v5 = v4;
  if (v4 == (unsigned char *)&def_3AC7C + 3 || !v4) {
    sub_10E4C(@"loading samples", (unint64_t)v4, a2);
  }
  if (v5) {
    BOOL v6 = v5 == (unsigned char *)&def_3AC7C + 3;
  }
  else {
    BOOL v6 = 1;
  }
  uint64_t v7 = !v6;

  return v7;
}

void sub_1075C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_107C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_108C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10B18(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8) == 0;
  return result;
}

uint64_t sub_10BE0(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8) == 3;
  return result;
}

uint64_t sub_10CA8(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (v1) {
    BOOL v2 = v1 == 3;
  }
  else {
    BOOL v2 = 1;
  }
  char v3 = v2;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v3;
  return result;
}

void sub_10D68(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    int64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v3 >= 2) {
      sub_10E4C(@"begin loading", v3, *(const char **)(a1 + 48));
    }
  }
  else
  {
    *(void *)(v2 + 8) = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    os_log_t v5 = *(void **)(v4 + 216);
    *(void *)(v4 + 216) = 0;

    BOOL v6 = *(void **)(a1 + 32);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10F90;
    v7[3] = &unk_6D170;
    v7[4] = v6;
    objc_msgSend(v6, "_onQueue_performObserversBlock:", v7);
  }
}

void sub_10E4C(void *a1, unint64_t a2, const char *a3)
{
  id v5 = a1;
  BOOL v6 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = NSStringFromSelector(a3);
    id v8 = (void *)v7;
    if (a2 > 3) {
      CFStringRef v9 = @"unknown RCWaveformGeneratorState";
    }
    else {
      CFStringRef v9 = *(&off_6D400 + a2);
    }
    int v10 = 136315906;
    double v11 = "_assertInvalidStateMessage";
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    CFStringRef v17 = v9;
    _os_log_error_impl(&def_3AC7C, v6, OS_LOG_TYPE_ERROR, "%s -- WARNING: %@ (%@) is disallowed when generator state is '%@'  ignoring, instead of asserting.", (uint8_t *)&v10, 0x2Au);
  }
}

void sub_10F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10F90(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 waveformGeneratorWillBeginLoading:*(void *)(a1 + 32)];
  }
}

void sub_10FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1107C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 224);
  if (*(unsigned char *)(a1 + 40))
  {
    *(void *)(v1 + 224) = v2 + 1;
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(void *)(v3 + 224) == 1)
    {
      uint64_t v4 = *(NSObject **)(v3 + 16);
      dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else if (v2)
  {
    *(void *)(v1 + 224) = v2 - 1;
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    dispatch_semaphore_signal(v5);
  }
  else
  {
    BOOL v6 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "-[RCWaveformGenerator setPaused:]_block_invoke";
      _os_log_impl(&def_3AC7C, v6, OS_LOG_TYPE_INFO, "%s -- WARNING: Unbalanced setPaused: detected", (uint8_t *)&v7, 0xCu);
    }
  }
}

uint64_t sub_1128C(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 224) == 0;
  return result;
}

void sub_11388(uint64_t a1)
{
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_116B0;
  v27[4] = sub_116C0;
  id v28 = *(id *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8) == 3)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, BOOL, void))(v3 + 16))(v3, *(unsigned char *)(v2 + 232) == 0, *(void *)(v2 + 216));
    }
  }
  else
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    id v5 = +[NSUUID UUID];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_116C8;
    v22[3] = &unk_6D1E8;
    double v26 = v27;
    id v25 = *(id *)(a1 + 40);
    id v6 = v5;
    id v23 = v6;
    int v7 = v4;
    BOOL v24 = v7;
    id v8 = [v22 copy];
    [*(id *)(*(void *)(a1 + 32) + 56) addObject:v6];
    CFStringRef v9 = *(void **)(*(void *)(a1 + 32) + 64);
    id v10 = objc_retainBlock(v8);
    [v9 addObject:v10];

    uint64_t v11 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v11 + 232)) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = *(unsigned char *)(a1 + 64) != 0;
    }
    *(unsigned char *)(v11 + 232) = v12;
    uint64_t v13 = *(void *)(a1 + 32);
    if (*(void *)(v13 + 8) != 2)
    {
      *(void *)(v13 + 8) = 2;
      if (sub_106F0(*(void **)(a1 + 32), *(const char **)(a1 + 48)))
      {
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_flushRemainingData");
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_performInternalFinishedLoadingBlocksAndFinishObservers");
      }
    }
    __int16 v14 = dispatch_get_global_queue(0, 0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_11714;
    v17[3] = &unk_6D210;
    char v21 = *(unsigned char *)(a1 + 64);
    double v18 = v7;
    id v19 = v8;
    uint64_t v20 = *(void *)(a1 + 56);
    uint64_t v15 = v7;
    id v16 = v8;
    dispatch_async(v14, v17);
  }
  _Block_object_dispose(v27, 8);
}

void sub_11648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Unwind_Resume(a1);
}

uint64_t sub_116B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_116C0(uint64_t a1)
{
}

intptr_t sub_116C8(void *a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "_onQueue_performLoadingFinishedBlock:internalBlockUUID:isTimeout:", a1[6], a1[4], a2);
  uint64_t v3 = a1[5];

  return dispatch_semaphore_signal(v3);
}

intptr_t sub_11714(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    intptr_t result = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), *(void *)(a1 + 48));
    if (!result) {
      return result;
    }
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }

  return v2();
}

void sub_11914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11B18(id a1, id a2)
{
}

void sub_11C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_11CD8(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return _objc_msgSend(*(id *)(a1 + 32), "_onQueue_pushAveragePowerLevel:", a2);
}

void sub_11E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_11E7C(void *result)
{
  uint64_t v1 = (_DWORD *)result[5];
  if (*v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      intptr_t result = objc_msgSend((id)v2[4], "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", *(void *)&v1[v3 + 4], v1[v3 + 2] * (v1[v3 + 3] / (*(_DWORD *)(v2[6] + 16) / *(_DWORD *)(v2[6] + 20))));
      ++v4;
      uint64_t v1 = (_DWORD *)v2[5];
      v3 += 4;
    }
    while (v4 < *v1);
  }
  return result;
}

void sub_11F94(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)[*(id *)(a1 + 40) floatChannelData];
  unsigned int v4 = [*(id *)(a1 + 40) frameLength];
  id v5 = [*(id *)(a1 + 40) format];
  objc_msgSend(v2, "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", v3, v4, objc_msgSend(v5, "streamDescription"), 0);
}

void sub_1201C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_12368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12408(uint64_t a1)
{
}

void sub_12414(uint64_t a1)
{
  id v2 = objc_alloc((Class)AVAudioPCMBuffer);
  uint64_t v3 = [*(id *)(a1 + 32) processingFormat];
  id v4 = [v2 initWithPCMFormat:v3 frameCapacity:4096];

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v5 = 0;
    while (1)
    {
      id v6 = v5;
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 16), 0xFFFFFFFFFFFFFFFFLL);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 16));
      int v7 = *(void **)(a1 + 32);
      id v21 = v5;
      unsigned int v8 = [v7 readIntoBuffer:v4 error:&v21];
      id v5 = v21;

      if (!v8) {
        break;
      }
      unsigned int v9 = [v4 frameLength];
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += *(void *)(a1 + 80) * v9;
      id v10 = *(unsigned char **)(a1 + 40);
      if (v10[232])
      {
        uint64_t v19 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:0];
        uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
        double v18 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;
        goto LABEL_14;
      }
      if (!v9)
      {
        objc_msgSend(*(id *)(a1 + 40), "_onQueue_flushRemainingData");
        goto LABEL_16;
      }
      uint64_t v11 = *(void *)[v4 floatChannelData];
      unsigned int v12 = [v4 frameLength];
      uint64_t v13 = [v4 format];
      objc_msgSend(v10, "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", v11, v12, objc_msgSend(v13, "streamDescription"), 0);

      if (*(void *)(a1 + 48))
      {
        float v14 = floor((double)*(unint64_t *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)/ (double)*(unint64_t *)(a1 + 88)* 1000.0)/ 1000.0;
        uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
        if (*(float *)(v15 + 24) != v14)
        {
          *(float *)(v15 + 24) = v14;
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
        goto LABEL_16;
      }
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    id v17 = v5;
    double v18 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v17;
LABEL_14:

    goto LABEL_16;
  }
  id v5 = 0;
LABEL_16:
}

void sub_12660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_12748(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_onQueue_appendAveragePowerLevelsByDigestingTimeRange:inAudioFile:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void sub_12814(uint64_t a1)
{
  if (sub_106F0(*(void **)(a1 + 32), *(const char **)(a1 + 48)))
  {
    unint64_t v2 = (unint64_t)[*(id *)(a1 + 40) framePosition];
    if ((v2 & 0x8000000000000000) == 0)
    {
      unint64_t v3 = v2;
      uint64_t v27 = [*(id *)(a1 + 40) processingFormat];
      [v27 sampleRate];
      double v5 = v4;
      double v6 = *(double *)(a1 + 56);
      double v7 = v6 + -10.0;
      if (v6 + -10.0 < 0.0) {
        double v7 = 0.0;
      }
      uint64_t v8 = (uint64_t)(v5 * v7);
      int v9 = vcvtd_n_s64_f64(fmod((double)v8 * 0.000244140625, 1.0), 0xCuLL);
      objc_msgSend(*(id *)(a1 + 40), "setFramePosition:", (uint64_t)fmaxf((float)(v8 - v9), 0.0));
      id v10 = [objc_alloc((Class)AVAudioPCMBuffer) initWithPCMFormat:v27 frameCapacity:4096];
      if (v9 >= 1)
      {
        do
        {
          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL);
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16));
          if (*(unsigned char *)(*(void *)(a1 + 32) + 232)) {
            break;
          }
          uint64_t v11 = *(void **)(a1 + 40);
          if (v9 >= 0x1000) {
            uint64_t v12 = 4096;
          }
          else {
            uint64_t v12 = v9;
          }
          id v29 = 0;
          unsigned int v13 = [v11 readIntoBuffer:v10 frameCount:v12 error:&v29];
          id v14 = v29;
          if (!v13 || (unsigned int v15 = [v10 frameLength]) == 0)
          {

            break;
          }
          uint64_t v16 = *(void **)(a1 + 32);
          uint64_t v17 = *(void *)[v10 floatChannelData];
          double v18 = [v10 format];
          objc_msgSend(v16, "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", v17, v15, objc_msgSend(v18, "streamDescription"), 1);
          v9 -= v15;
        }
        while (v9 > 0);
      }
      [*(id *)(a1 + 40) setFramePosition:(uint64_t)(v5 * v6)];
      *(void *)(*(void *)(a1 + 32) + 32) = 0;
      *(void *)(*(void *)(a1 + 32) + 192) = 0;
      while (1)
      {
        double v19 = *(double *)(*(void *)(a1 + 32) + 40);
        if (v19 >= RCTimeRangeDeltaWithExactPrecision(*(double *)(a1 + 56), *(double *)(a1 + 64))) {
          break;
        }
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL);
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16));
        if (*(unsigned char *)(*(void *)(a1 + 32) + 232)) {
          break;
        }
        uint64_t v20 = *(void **)(a1 + 40);
        id v28 = 0;
        unsigned int v21 = [v20 readIntoBuffer:v10 frameCount:4096 error:&v28];
        id v22 = v28;
        if (!v21 || (unsigned int v23 = [v10 frameLength]) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "_onQueue_flushRemainingData");

          break;
        }
        BOOL v24 = *(void **)(a1 + 32);
        uint64_t v25 = *(void *)[v10 floatChannelData];
        double v26 = [v10 format];
        objc_msgSend(v24, "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", v25, v23, objc_msgSend(v26, "streamDescription"), 0);
      }
      [*(id *)(a1 + 40) setFramePosition:v3];
    }
  }
}

void sub_12AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_12DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_12E78(uint64_t a1)
{
}

void sub_12E8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 copyWithTimeRangeOffsetByTimeOffset:*(double *)(a1 + 40)];

  objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void sub_12EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_13008(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
LABEL_3:
    double v5 = 0;
    while (1)
    {
      if (*(void *)v9 != v4) {
        objc_enumerationMutation(v2);
      }
      double v6 = *(unsigned char **)(a1 + 40);
      if (v6[232]) {
        break;
      }
      objc_msgSend(v6, "_onQueue_appendSegment:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v5), (void)v8);
      double v5 = (char *)v5 + 1;
      if (v3 == v5)
      {
        id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id result = objc_msgSend(*(id *)(a1 + 40), "_onQueue_flushRemainingData");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

void sub_1311C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    *(unsigned char *)(*(void *)(*(void *)(v2 + 48) + 8) + 24) = 0;
    objc_end_catch();
    JUMPOUT(0x130E8);
  }
  _Unwind_Resume(a1);
}

void sub_132B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

id sub_132E0(uint64_t a1, void *a2)
{
  return _[a2 waveformGenerator:*(void *)(a1 + 32) didLoadWaveformSegment:*(void *)(a1 + 40)];
}

void sub_1349C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_134BC(uint64_t a1, void *a2)
{
  return _[a2 waveformGenerator:*(void *)(a1 + 32) didLoadWaveformSegment:*(void *)(a1 + 40)];
}

void sub_1376C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_13CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  long long v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)RCWaveformSegmentAccumulator;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_13E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

intptr_t sub_13E80(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_13EFC()
{
}

void sub_13F14(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_13F70(exception, a1);
}

void sub_13F5C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_13F70(std::logic_error *a1, const char *a2)
{
  id result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_13FA4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_13FDC();
  }
  return operator new(4 * a2);
}

void sub_13FDC()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

double sub_14028(void *a1)
{
  *a1 = 0;
  a1[2] = 0x3F789374BC6A7EFALL;
  a1[4] = 0x3F90624DD2F1A9FCLL;
  a1[6] = 0;
  *(void *)((char *)a1 + 54) = 0;
  *(void *)&double result = 0xFFFFFFFFLL;
  a1[5] = 0xFFFFFFFFLL;
  return result;
}

double sub_14068(void *a1)
{
  *(void *)((char *)a1 + 54) = 0;
  a1[6] = 0;
  *(void *)&double result = 0xFFFFFFFFLL;
  a1[5] = 0xFFFFFFFFLL;
  return result;
}

uint64_t sub_1407C(uint64_t result)
{
  *(_WORD *)(result + 60) = 0;
  *(_DWORD *)(result + 56) = 0;
  return result;
}

void sub_14088(uint64_t a1, double a2)
{
  *(double *)a1 = a2;
  double v4 = a2 * 2.5;
  long double v5 = 0.0;
  BOOL v6 = a2 * 2.5 < 0.00001;
  double v7 = 0.0;
  if (!v6) {
    double v7 = exp(-6.90775528 / v4);
  }
  *(double *)(a1 + 8) = v7;
  if (a2 * 1.24 >= 0.00001) {
    long double v5 = exp(-6.90775528 / (a2 * 1.24));
  }
  *(long double *)(a1 + 24) = v5;
}

uint64_t sub_1411C(uint64_t result)
{
  *(void *)(result + 48) = 0;
  *(_DWORD *)(result + 44) = 0;
  return result;
}

void sub_14128(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 40) != a2)
  {
    if (*(double *)a1 == 0.0)
    {
      *(_OWORD *)a1 = xmmword_62A60;
      *(void *)(a1 + 24) = 0x3FEFFEF71A09F35FLL;
      long double v4 = 0.999937347;
      long double v5 = 0.999873687;
    }
    else
    {
      long double v4 = *(double *)(a1 + 8);
      long double v5 = *(double *)(a1 + 24);
    }
    *(long double *)(a1 + 16) = 1.0 - pow(v4, (double)a2);
    *(long double *)(a1 + 32) = 1.0 - pow(v5, (double)a2);
    *(_DWORD *)(a1 + 40) = a2;
  }
}

void sub_141E0(uint64_t a1, float *a2, int a3, int a4)
{
  BOOL v6 = a2;
  uint64_t v17 = a2;
  float v15 = 0.0;
  int v16 = a4;
  float v8 = 0.0;
  int v9 = a4;
  if ((a2 & 0xF) == 0)
  {
    sub_142D8(a1, (const float **)&v17, &v16, &v15);
    int v9 = v16;
    float v8 = v15;
  }
  if (v9 >= 1)
  {
    int v10 = v9 + 1;
    do
    {
      float v11 = *v6;
      if (*v6 < 0.0) {
        float v11 = -*v6;
      }
      if (v11 > v8) {
        float v8 = v11;
      }
      --v10;
      v6 += a3;
    }
    while (v10 > 1);
  }
  if (v8 > *(float *)(a1 + 56)) {
    *(float *)(a1 + 56) = v8;
  }
  *(_DWORD *)(a1 + 44) += a4;
  double v12 = v8;
  if (*(double *)(a1 + 48) > v12) {
    double v12 = *(double *)(a1 + 48);
  }
  double v13 = fabs(v12);
  if (v13 >= 1.0e15 || v13 <= 1.0e-15) {
    double v12 = 0.0;
  }
  *(double *)(a1 + 48) = v12;
}

void sub_142D8(int a1, const float **a2, int *a3, float *__C)
{
  memset(__A, 0, sizeof(__A));
  v13[0] = xmmword_62A70;
  v13[1] = unk_62A80;
  v13[2] = xmmword_62A90;
  v13[3] = unk_62AA0;
  int v6 = *a3;
  if ((*a3 + 15) >= 0x1F)
  {
    double v7 = *a2;
    if (v6 < 0) {
      int v6 = *a3 + 15;
    }
    int v8 = v6 >> 4;
    do
    {
      --v8;
      vDSP_vsq(v7, 1, __Ca, 1, 4uLL);
      vDSP_vabs(v7, 1, __B, 1, 4uLL);
      vDSP_vmax((const float *)__A, 1, __B, 1, (float *)__A, 1, 4uLL);
      vDSP_vma(__Ca, 1, (const float *)v13, 1, __D, 1, __D, 1, 4uLL);
      v7 += 16;
    }
    while (v8);
  }
  vDSP_maxv((const float *)__A, 1, __C, 0x10uLL);
  int v9 = *a3 & 0xF;
  if (*a3 <= 0) {
    int v9 = -(-*a3 & 0xF);
  }
  *a3 = v9;
}

BOOL RCTimeRangeContainsRange(double a1, double a2, double a3, double a4)
{
  return a2 >= a4 && a1 <= a3;
}

BOOL RCTimeRangeContainsTime(double a1, double a2, double a3)
{
  return a2 >= a3 && a1 <= a3;
}

BOOL RCTimeRangeIntersectsRange(double a1, double a2, double a3, double a4)
{
  return a3 <= a2 && a1 <= a4;
}

BOOL RCTimeRangeEqualToTimeRange(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) <= 0.00000011920929;
  return vabdd_f64(a2, a4) <= 0.00000011920929 && v4;
}

double RCTimeRangeByConvertingToValidRange(double a1, double a2, double a3)
{
  double v3 = fabs(a2 + 1.79769313e308);
  if (fabs(a1 + -1.79769313e308) > 0.00000011920929 || v3 > 0.00000011920929)
  {
    double v5 = fabs(a2 + -1.79769313e308);
    if (fabs(a1 + 1.79769313e308) > 0.00000011920929 || v5 > 0.00000011920929) {
      return a1;
    }
  }
  return a3;
}

double RCTimeRangeDelta(double a1, double a2)
{
  double v2 = a2 - a1;
  double v3 = __exp10(4.0);
  float v4 = v2 * v3;
  return roundf(v4) / v3;
}

double RCTimeRangeDeltaWithFractionalPrecision(uint64_t a1, double a2, double a3)
{
  double v3 = a3 - a2;
  if (a1 >= 1)
  {
    double v4 = __exp10((double)a1);
    float v5 = v3 * v4;
    return roundf(v5) / v4;
  }
  return v3;
}

double RCTimeRangeGetMidTime(double a1, double a2)
{
  double v3 = a2 - a1;
  double v4 = __exp10(4.0);
  float v5 = v3 * v4;
  return a1 + roundf(v5) / v4 * 0.5;
}

double RCTimeRangeDeltaWithUIPrecision(double a1, double a2)
{
  double v2 = a2 - a1;
  double v3 = __exp10(4.0);
  float v4 = v2 * v3;
  return roundf(v4) / v3;
}

double RCTimeRangeDeltaWithExactPrecision(double a1, double a2)
{
  return a2 - a1;
}

double RCTimeRangeConstrainTime(double result, double a2, double a3)
{
  if (a2 >= a3) {
    a2 = a3;
  }
  if (result < a2) {
    return a2;
  }
  return result;
}

double RCTimeRangeShift(double a1, double a2, double a3)
{
  return a1 + a3;
}

double RCTimeRangeInset(double a1, double a2, double a3)
{
  return a1 + a3;
}

double RCTimeRangeIntersectTimeRange(double result, double a2, double a3, double a4)
{
  if (result < a3) {
    double result = a3;
  }
  if (a2 >= a4) {
    a2 = a4;
  }
  if (a2 < result) {
    return 1.79769313e308;
  }
  return result;
}

id NSStringFromRCTimeRange(double a1, double a2)
{
  uint64_t v7 = 0;
  if (a2 == 1.79769313e308)
  {
    double v3 = @"MAX";
  }
  else if (a2 == -1.79769313e308)
  {
    double v3 = @"-MAX";
  }
  else
  {
    sub_147C0(&v7, a2);
    double v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (a1 == 1.79769313e308)
  {
    float v4 = @"MAX";
  }
  else if (a1 == -1.79769313e308)
  {
    float v4 = @"-MAX";
  }
  else
  {
    sub_147C0(&v7, a1);
    float v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  float v5 = +[NSString stringWithFormat:@"[%@ - %@]", v4, v3];

  return v5;
}

id sub_147C0(void *a1, double a2)
{
  int v2 = (int)a2;
  double v3 = a2 - (double)(60 * ((int)a2 / 60));
  uint64_t v4 = (v2 / 3600);
  uint64_t v5 = (v2 / 60 - 60 * v4);
  if (v2 > 3599)
  {
    if (!a1) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (!a1)
  {
    if ((int)v5 <= 0) {
      goto LABEL_17;
    }
LABEL_16:
    +[NSString stringWithFormat:@"%02d:%05.2f", v5, *(void *)&v3, v10];
    goto LABEL_18;
  }
  if (*a1 == 3)
  {
LABEL_6:
    *a1 = 3;
LABEL_7:
    +[NSString stringWithFormat:@"%02d:%02d:%05.2f", v4, v5, *(void *)&v3];
    goto LABEL_18;
  }
  if ((int)v5 > 0 || *a1 == 2)
  {
    *a1 = 2;
    goto LABEL_16;
  }
  *a1 = 1;
LABEL_17:
  +[NSString stringWithFormat:@"%g", *(void *)&v3, v9, v10];
  uint64_t v7 = LABEL_18:;

  return v7;
}

void RCTimeRangeEncodeWithKey(void *a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  id v8 = a1;
  uint64_t v9 = [v7 stringByAppendingString:@".beginTime"];
  [v8 encodeDouble:v9 forKey:a3];

  id v10 = [v7 stringByAppendingString:@".endTime"];

  [v8 encodeDouble:v10 forKey:a4];
}

double RCTimeRangeDecodeWithKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v3 stringByAppendingString:@".beginTime"];
  [v4 decodeDoubleForKey:v5];
  double v7 = v6;

  id v8 = [v3 stringByAppendingString:@".endTime"];

  [v4 decodeDoubleForKey:v8];
  return v7;
}

CMTimeRange *CMTimeRangeFromRCTimeRange@<X0>(CMTimeRange *a1@<X8>, Float64 a2@<D0>, double a3@<D1>)
{
  CMTimeMakeWithSeconds(&start, a2, kCMDefaultTimeScale);
  double v6 = __exp10(4.0);
  float v7 = (a3 - a2) * v6;
  CMTimeMakeWithSeconds(&v9, roundf(v7) / v6, kCMDefaultTimeScale);
  return CMTimeRangeMake(a1, &start, &v9);
}

double RCTimeRangeFromCMTimeRange(uint64_t a1)
{
  CMTime v4 = *(CMTime *)a1;
  double Seconds = CMTimeGetSeconds(&v4);
  CMTime v4 = *(CMTime *)(a1 + 24);
  CMTimeGetSeconds(&v4);
  return Seconds;
}

void sub_14D04(id a1)
{
  uint64_t v1 = objc_opt_new();
  int v2 = (void *)qword_82E40;
  qword_82E40 = v1;

  id v3 = (void *)qword_82E40;

  objc_msgSend(v3, "set_horizontalSizeClassFromSplitView:", 0);
}

void sub_17888(id a1)
{
  uint64_t v1 = +[UIColor colorWithRed:1.0 green:0.231372549 blue:0.188235294 alpha:1.0];
  int v2 = (void *)qword_82E50;
  qword_82E50 = v1;
}

id sub_19CB4(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 64) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    CMTime v4 = *(void **)(*(void *)(a1 + 32) + 64);
    return [v4 addObject:v3];
  }
  return result;
}

void sub_19DA0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  uint64_t v3 = *(void *)(a1 + 32);
  CMTime v4 = *(NSObject **)(v3 + 48);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_19E3C;
  block[3] = &unk_6D490;
  block[4] = v3;
  dispatch_after(v2, v4, block);
}

id sub_19E3C(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 64) count];
  if (!result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
    return [v3 terminateLoadingImmediately];
  }
  return result;
}

void sub_19FFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A020(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained saveGeneratedWaveformIfNecessary];

  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1A108;
  v10[3] = &unk_6D4B8;
  id v8 = *(id *)(a1 + 32);
  char v13 = a2;
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  [v7 _performOnObserversBlock:v10];
}

uint64_t sub_1A108(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

intptr_t sub_1A1F0(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1A324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A33C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1A34C(uint64_t a1)
{
}

void sub_1A354(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) segments];
  uint64_t v2 = [v5 lastObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  CMTime v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1A4E4(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) accumulatorWaveform];
  uint64_t v2 = objc_msgSend(v5, "segmentsByClippingToTimeRange:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  CMTime v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1A644(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) accumulatorWaveform];
  uint64_t v2 = objc_msgSend(v5, "segmentsIntersectingTimeRange:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  CMTime v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

double sub_1A784(uint64_t a1)
{
  double result = (double)(unint64_t)[*(id *)(*(void *)(a1 + 32) + 8) averagePowerLevelsRate];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_1AACC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 waveformDataSourceRequiresUpdate:*(void *)(a1 + 32)];
  }
}

void sub_1AC78(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) segments];
  id v3 = +[RCWaveformSegment segmentsByMergingSegments:v2 preferredSegmentDuration:*(double *)(a1 + 40) beforeTime:*(double *)(a1 + 48) andThenUsePreferredSegmentDuration:*(double *)(a1 + 56)];

  if ([v3 count]) {
    [*(id *)(*(void *)(a1 + 32) + 8) setSegments:v3];
  }
}

void sub_1ADAC(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 8) setSegments:v2];
}

id sub_1B028(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 8) removeAllSegments];
}

id sub_1B034(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginLoading];
}

id sub_1B03C(uint64_t a1, void *a2)
{
  return _[a2 waveformDataSourceDidFinishLoading:*(void *)(a1 + 32)];
}

id sub_1B168(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 8) addSegment:*(void *)(a1 + 40)];
}

id sub_1B174(uint64_t a1, void *a2)
{
  return _[a2 waveformDataSource:*(void *)(a1 + 32) didLoadWaveformSegment:*(void *)(a1 + 40)];
}

void sub_1B348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B370(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  CMTime v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_1C2CC(void *a1)
{
  id v1 = a1;

  return v1;
}

id sub_1C3C4(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) appendString:a2];
}

id RCDisplayStringForString(void *a1)
{
  id v1 = a1;
  if (qword_82E60 != -1) {
    dispatch_once(&qword_82E60, &stru_6D640);
  }
  if (byte_82E68)
  {
    uint64_t v2 = [v1 stringByAppendingString:v1];
    id v3 = [v2 mutableCopy];

    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"@", &stru_6F520, 0, 0, objc_msgSend(v3, "length"));
  }
  else
  {
    id v3 = v1;
  }

  return v3;
}

void sub_1C514(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults];
  byte_82E68 = [v1 BOOLForKey:@"NSDoubleLocalizedStrings"];
}

double UIMainScreenScale()
{
  if (qword_82E78 != -1) {
    dispatch_once(&qword_82E78, &stru_6D660);
  }
  return *(double *)&qword_82E70;
}

void sub_1C5B0(id a1)
{
  id v2 = +[UIScreen mainScreen];
  [v2 scale];
  qword_82E70 = v1;
}

double RCRoundCoord(double a1)
{
  if (qword_82E78 != -1) {
    dispatch_once(&qword_82E78, &stru_6D660);
  }
  double v2 = a1 + 2.22044605e-16;
  if (a1 >= 0.0) {
    double v2 = a1;
  }
  return round(v2 * *(double *)&qword_82E70) / *(double *)&qword_82E70;
}

double RCCeilCoord(double a1)
{
  if (qword_82E78 != -1) {
    dispatch_once(&qword_82E78, &stru_6D660);
  }
  return ceil(*(double *)&qword_82E70 * a1) / *(double *)&qword_82E70;
}

double RCFloorCoord(double a1)
{
  if (qword_82E78 != -1) {
    dispatch_once(&qword_82E78, &stru_6D660);
  }
  return floor(*(double *)&qword_82E70 * a1) / *(double *)&qword_82E70;
}

double RCOnePixelInPoints()
{
  if (qword_82E78 != -1) {
    dispatch_once(&qword_82E78, &stru_6D660);
  }
  return 1.0 / *(double *)&qword_82E70;
}

void sub_1C7F4(id a1)
{
  uint64_t v1 = objc_opt_new();
  double v2 = (void *)qword_82E80;
  qword_82E80 = v1;
}

void sub_1D0E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D3A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D9C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E2C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E4A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E5FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E9AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1EC00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1EEE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1F0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1F10C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadLocalizedFormatStrings];
}

void sub_1F1A0(id a1)
{
  uint64_t v1 = objc_alloc_init(RCDurationFormatter);
  double v2 = (void *)qword_82E98;
  qword_82E98 = (uint64_t)v1;
}

uint64_t sub_1F2D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1F2E4(uint64_t a1)
{
}

void sub_1F2EC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _onQueueStringFromDuration:*(void *)(a1 + 56) byReplacingDigitsWithDigit:0 hideComponentOptions:*(void *)(a1 + 64) style:*(double *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  CMTime v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1F43C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _onQueueStringFromDuration:-1 byReplacingDigitsWithDigit:*(void *)(a1 + 56) hideComponentOptions:*(void *)(a1 + 64) style:*(double *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  CMTime v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1F58C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _onQueueStringFromDuration:*(void *)(a1 + 56) style:*(double *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  CMTime v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_1F654(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _onQueueReloadLocalizedFormatStrings];
}

id sub_1FBF8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) appendString:@"−"];
}

void sub_1FF1C(id a1)
{
  v3[0] = &off_70320;
  v3[1] = &off_70338;
  v4[0] = @"HHmmssSS";
  v4[1] = @"HHmmss";
  v3[2] = &off_70350;
  v3[3] = &off_70368;
  v4[2] = @"HHmmss";
  v4[3] = @"mmssSS";
  v3[4] = &off_70380;
  v3[5] = &off_70398;
  v4[4] = @"mmss";
  v4[5] = @"sSS";
  v3[6] = &off_703B0;
  v4[6] = @"s";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:7];
  uint64_t v2 = (void *)qword_82EA0;
  qword_82EA0 = v1;
}

CFStringRef NSStringFromRCDurationFormattingStyle(unint64_t a1)
{
  if (a1 > 6) {
    return @"RCDurationFormattingStyle_???";
  }
  else {
    return *(&off_6D730 + a1);
  }
}

void sub_202D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20524(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2073C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_20830(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_208B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20D74()
{
}

void sub_20E18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20EDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_21078(id a1, RCWaveformSegment *a2, RCWaveformSegment *a3)
{
  CMTime v4 = a3;
  [(RCWaveformSegment *)a2 timeRange];
  double v6 = v5;
  double v8 = v7;
  [(RCWaveformSegment *)v4 timeRange];
  if (v10 < v8) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = -1;
  }
  if (v9 <= v6) {
    int64_t v12 = 1;
  }
  else {
    int64_t v12 = v11;
  }

  return v12;
}

void sub_210D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_211A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_212C0(_Unwind_Exception *a1)
{
  double v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2141C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_215E0(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) objectAtIndex:a2];
  CMTime v4 = objc_msgSend(v6, "segmentByClippingToTimeRange:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v5 = *(void **)(a1 + 32);
  if (v4) {
    [v5 replaceObjectAtIndex:a2 withObject:v4];
  }
  else {
    [v5 removeObjectAtIndex:a2];
  }
}

void sub_21670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2179C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v13 = v12;

  _Unwind_Resume(a1);
}

void sub_21A20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int64_t v12 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_21CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int64_t v12 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_21D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int64_t v12 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_21DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  uint64_t v11 = v10;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id sub_22FD0(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  [v2[4] currentDuration];
  objc_msgSend(v2, "setDuration:");
  id result = [*(id *)(a1 + 32) currentTime];
  if (v4 < 0.0)
  {
    double v5 = *(void **)(a1 + 32);
    return [v5 setCurrentTime:0.0];
  }
  return result;
}

id sub_23A9C(uint64_t a1)
{
  [*(id *)(a1 + 32) setDuration:*(double *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 48);

  return [v2 _updateCurrentTimeForCapturedInputAtTime:v3];
}

id sub_23C14(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentTime:*(double *)(a1 + 40)];
  uint64_t v2 = *(id **)(a1 + 32);
  [v2[8] duration];

  return objc_msgSend(v2, "setDuration:");
}

id sub_2414C(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelectionOverlayShouldUseInsertMode:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setSelectedTimeRangeEditingEnabled:1];
}

void sub_24190(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _selectionOverlay];
  uint64_t v2 = [v1 accessibilityElements];
  id argument = [v2 firstObject];

  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, argument);
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, argument);
}

id sub_24404(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isOverview]) {
    [*(id *)(a1 + 32) updateVisibleTimeRangeToFullDuration];
  }
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = RCTimeRangeMake(*(double *)(a1 + 40), *(double *)(a1 + 40));

  return objc_msgSend(v2, "setSelectedTimeRange:animationDuration:", v3);
}

uint64_t sub_24460(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_24900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_24924(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

void sub_279CC(uint64_t a1, void *a2)
{
  id v5 = a2;
  double v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  double v4 = [v3 timelinePlaybackBackgroundColor:*(unsigned __int8 *)(a1 + 32)];
  [v5 setBackgroundColor:v4];

  [v5 setNeedsDisplay];
}

id sub_27F10(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateVisibleAreaWithAnimationDuration:*(double *)(a1 + 48)];
  [*(id *)(a1 + 32) _updateSelectionOverlayWithAnimationDuration:*(double *)(a1 + 48)];
  [*(id *)(a1 + 32) _updateBackgroundWaveformHighlight];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

uint64_t sub_27F68(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t sub_282AC(uint64_t a1, void *a2, uint64_t a3, int a4, int a5, double a6)
{
  id v11 = a2;
  if (!a5 || a3 != 1 && a5 > 0)
  {
    uint64_t v12 = 0;
    goto LABEL_5;
  }
  uint64_t v12 = 0;
  if (a5 >= 0 || a3 == -1)
  {
    double v15 = fmax(a6 / *(double *)(a1 + 40), 0.0);
    if (v15 < 0.25)
    {
      uint64_t v16 = *(void *)(a1 + 32);
      double v17 = *(double *)(v16 + 240);
      double v18 = *(double *)(v16 + 272);
      double v19 = *(double *)(v16 + 280);
      double v20 = ((1.0 - v15 * 4.0) * 0.025 + v15 * 4.0 * 0.0125)
          * (*(double *)(v16 + 128)
           * (double)a5
           * *(double *)(v16 + 120));
      [*(id *)(v16 + 24) selectedTimeRangeMinimumDuration];
      double v22 = v18 + v21;
      if (v18 + v21 < v19 + v20) {
        double v22 = v19 + v20;
      }
      double v23 = v19 - v21;
      if (v23 >= v18 + v20) {
        double v23 = v18 + v20;
      }
      if (a4) {
        double v24 = v22;
      }
      else {
        double v24 = v19;
      }
      if (a4) {
        double v23 = v18;
      }
      double v25 = fmax(v23, 0.0);
      uint64_t v26 = *(void *)(a1 + 32);
      double v27 = *(double *)(v26 + 224);
      if (v27 >= v24) {
        double v28 = v24;
      }
      else {
        double v28 = *(double *)(v26 + 224);
      }
      double v29 = v25 - v23;
      double v30 = v28 - v24;
      if (a4) {
        double v31 = v30;
      }
      else {
        double v31 = v29;
      }
      double v32 = RCTimeRangeMake(0.0, v27);
      uint64_t v34 = *(void *)(a1 + 32);
      double v35 = *(double *)(v34 + 232);
      if (v35 > 0.0)
      {
        double v36 = *(double *)(v34 + 224);
        if (v35 < v36)
        {
          if (a3 == -1)
          {
            double v32 = RCTimeRangeMake(fmax(v28 - v35, 0.0), v28);
            if (v25 < v32)
            {
              uint64_t v38 = *(double **)(a1 + 32);
              double v28 = v25 + v38[29];
              goto LABEL_47;
            }
          }
          else
          {
            if (v36 >= v25 + v35) {
              double v37 = v25 + v35;
            }
            else {
              double v37 = *(double *)(v34 + 224);
            }
            double v32 = RCTimeRangeMake(v25, v37);
            if (v28 > v33)
            {
              uint64_t v38 = *(double **)(a1 + 32);
              double v25 = v28 - v38[29];
LABEL_47:
              double v41 = v17 + v20 + v31;
              objc_msgSend(v38, "_setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:", 0, 0, 1, v25, v28, 0.0);
              uint64_t v42 = *(void *)(a1 + 32);
              double v43 = 1.0;
              if (v15 < 0.125) {
                double v43 = *(double *)(v42 + 120) * 1.1;
              }
              *(double *)(v42 + 120) = v43;
              double v44 = v41 + *(double *)(a1 + 40) * 0.5;
              id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
              [WeakRetained waveformViewController:*(void *)(a1 + 32) didScrubToTime:0 finished:v44];

              uint64_t v12 = 1;
              goto LABEL_5;
            }
          }
        }
      }
      uint64_t v12 = 0;
      if (v25 < v32) {
        goto LABEL_5;
      }
      BOOL v39 = v28 >= v32 && v25 <= v33;
      if (!v39 || v28 > v33) {
        goto LABEL_5;
      }
      uint64_t v38 = *(double **)(a1 + 32);
      goto LABEL_47;
    }
  }
LABEL_5:

  return v12;
}

void sub_286B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(void **)(a1 + 32);
  id v6 = v3;
  id v5 = [v3 superview];

  if (v4 != v5)
  {
    [*(id *)(a1 + 32) addSubview:v6];
    [*(id *)(a1 + 32) sendSubviewToBack:v6];
    [v6 frame];
    objc_msgSend(v6, "setFrame:");
  }
}

id sub_28744(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 64);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_287C8;
  v3[3] = &unk_6D958;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

id sub_287C8(uint64_t a1, void *a2)
{
  return [a2 setAlpha:*(double *)(a1 + 32)];
}

id sub_28C04(id result)
{
  uint64_t v1 = *((void *)result + 4);
  if (!*(unsigned char *)(v1 + 81))
  {
    uint64_t v2 = (id *)result;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v3 = *(id *)(v1 + 64);
    id v4 = [v3 countByEnumeratingWithState:&v56 objects:v61 count:16];
    id v49 = v2;
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v57;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v57 != v6) {
            objc_enumerationMutation(v3);
          }
          double v8 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          objc_msgSend(v8, "setIsPlayback:", objc_msgSend(v49[4], "isPlayback"));
          if ([*((id *)v49[4] + 3) isRecording]) {
            BOOL v9 = *((unsigned char *)v49[4] + 190) == 0;
          }
          else {
            BOOL v9 = 0;
          }
          [v8 setShouldOnlyRenderOnScreenTimeLabels:v9];
          [v49[4] _frameForTimeMarkerView:v8];
          CGFloat v11 = v10;
          CGFloat v13 = v12;
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          [v8 frame];
          v63.origin.x = v18;
          v63.origin.y = v19;
          v63.size.width = v20;
          v63.size.height = v21;
          v62.origin.x = v11;
          v62.origin.y = v13;
          v62.size.width = v15;
          v62.size.height = v17;
          if (!CGRectEqualToRect(v62, v63))
          {
            uint64_t v2 = v49;
            [v49[4] _setTimeMarkerViewsNeedInitialLayout:1];
            goto LABEL_15;
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v56 objects:v61 count:16];
        uint64_t v2 = v49;
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    double v22 = (id *)v2[4];
    if (*((unsigned char *)v22 + 80))
    {
      return [v22 _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange];
    }
    else
    {
      uint64_t result = [v22[8] count];
      if (result)
      {
        double v23 = &v48 - 2 * (void)[*((id *)v2[4] + 8) count];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v24 = *((id *)v2[4] + 8);
        id v25 = [v24 countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v48 = (uint64_t)&v48;
          unint64_t v27 = 0;
          uint64_t v28 = *(void *)v53;
          id v50 = v24;
          uint64_t v51 = v28;
          do
          {
            for (j = 0; j != v26; j = (char *)j + 1)
            {
              if (*(void *)v53 != v51) {
                objc_enumerationMutation(v50);
              }
              double v30 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
              if (v27)
              {
                uint64_t v31 = 0;
                unsigned int v32 = 1;
                while (1)
                {
                  double v33 = (double *)&v23[2 * v31];
                  double v35 = *v33;
                  double v34 = v33[1];
                  objc_msgSend(v30, "visibleTimeRange", v48);
                  double v37 = vabdd_f64(v35, v36);
                  [v30 visibleTimeRange];
                  if (v37 <= 0.00000011920929)
                  {
                    double *v33 = v38;
                    goto LABEL_32;
                  }
                  if (vabdd_f64(v34, v38) <= 0.00000011920929) {
                    break;
                  }
                  uint64_t v31 = v32;
                  BOOL v39 = v27 > v32++;
                  if (!v39)
                  {
                    ++v27;
                    BOOL v40 = &v23[2 * v27];
                    [v30 visibleTimeRange];
                    *BOOL v40 = v41;
                    v40[1] = v42;
                    goto LABEL_32;
                  }
                }
                [v30 visibleTimeRange];
                v23[2 * v31 + 1] = v45;
              }
              else
              {
                objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * (void)j), "visibleTimeRange", v48);
                *double v23 = v43;
                v23[1] = v44;
                unint64_t v27 = 1;
              }
LABEL_32:
              ;
            }
            id v26 = [v50 countByEnumeratingWithState:&v52 objects:v60 count:16];
          }
          while (v26);

          uint64_t v46 = 0;
          unsigned int v47 = 1;
          uint64_t v2 = v49;
          while (1)
          {
            uint64_t result = (id)RCTimeRangeContainsRange(*(double *)&v23[2 * v46], *(double *)&v23[2 * v46 + 1], *((double *)v2[4] + 30), *((double *)v2[4] + 31));
            if (result) {
              break;
            }
            uint64_t v46 = v47;
            BOOL v39 = v27 > v47++;
            if (!v39) {
              return [v2[4] _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange];
            }
          }
        }
        else
        {

          return [v2[4] _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange];
        }
      }
    }
  }
  return result;
}

id sub_291D4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void sub_29584(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(v2 + 112);
  if ([*(id *)(v2 + 24) isHidden]) {
    LOBYTE(v4) = 1;
  }
  else {
    unsigned int v4 = [*(id *)(*(void *)(a1 + 32) + 24) isEditingEnabled] ^ 1;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 187))
  {
    double v6 = *(double *)(v5 + 224);
LABEL_9:
    double v8 = v3 + v3;
    goto LABEL_10;
  }
  char v7 = v4 ^ 1;
  double v6 = *(double *)(v5 + 224);
  double v8 = 0.0;
  if (*(unsigned char *)(v5 + 184)) {
    char v7 = 1;
  }
  if ((v7 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_10:
  double v9 = RCTimeRangeMake(0.0, v6 + v8);
  double v11 = v10;
  uint64_t v12 = *(void *)(a1 + 32);
  double v14 = *(double *)(v12 + 240);
  double v13 = *(double *)(v12 + 248);
  CGFloat v15 = [*(id *)(v12 + 64) objectAtIndexedSubscript:0];
  [v15 setDebugID:0];
  objc_msgSend(v15, "setVisibleTimeRange:", RCTimeRangeMake(v14 - v3, v14));
  objc_msgSend(v15, "setMarkerClippingRange:", v9, v11);
  [*(id *)(a1 + 32) _frameForTimeMarkerView:v15];
  objc_msgSend(v15, "setFrame:");
  double v16 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndexedSubscript:1];

  [v16 setDebugID:1];
  objc_msgSend(v16, "setVisibleTimeRange:", v14, v13);
  objc_msgSend(v16, "setMarkerClippingRange:", v9, v11);
  [*(id *)(a1 + 32) _frameForTimeMarkerView:v16];
  objc_msgSend(v16, "setFrame:");
  id v17 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndexedSubscript:2];

  [v17 setDebugID:2];
  objc_msgSend(v17, "setVisibleTimeRange:", RCTimeRangeMake(v13, v3 + v13));
  objc_msgSend(v17, "setMarkerClippingRange:", v9, v11);
  [*(id *)(a1 + 32) _frameForTimeMarkerView:v17];
  objc_msgSend(v17, "setFrame:");
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
}

BOOL sub_29954(RCWaveformViewController *self, SEL a2)
{
  return self->_selectedTimeRangeScrubbingEnabled;
}

void sub_2A704(id a1)
{
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)qword_82EC0;
  qword_82EC0 = v1;
}

void sub_2ACB0(id a1)
{
  uint64_t v1 = +[NSSet setWithArray:&off_703D8];
  uint64_t v2 = (void *)qword_82ED0;
  qword_82ED0 = v1;
}

id RCGenericError()
{
  id v0 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.VoiceMemos.ErrorDomain" code:-1 userInfo:0];

  return v0;
}

id RCErrorWithTypeAndDescription(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
  id v9 = v3;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  id v6 = [v4 initWithDomain:@"com.apple.VoiceMemos.ErrorDomain" code:a1 userInfo:v5];

  return v6;
}

id RCGenericErrorWithUnderlyingError(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    NSErrorUserInfoKey v6 = NSUnderlyingErrorKey;
    id v7 = v1;
    id v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  }
  else
  {
    id v3 = 0;
  }
  id v4 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.VoiceMemos.ErrorDomain" code:-1 userInfo:v3];

  return v4;
}

double RCNormalizedDecibelValue(float a1)
{
  return __exp10f(a1 / 12.0);
}

long double RCScalarDecibelValue(float a1)
{
  return log10(a1) * 12.0;
}

BOOL RCFloatsAlmostEqual(float a1, float a2)
{
  return vabds_f32(a1, a2) < 0.01;
}

BOOL RCEqualFloatsWithTolerance(float a1, float a2, float a3)
{
  return vabds_f32(a1, a2) < a3;
}

id RCLocalizedDurationWithStyleAndSizingDigit(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v5 = 2;
  if (!(unint64_t)(a3 / 3600.0)) {
    uint64_t v5 = 4;
  }
  if (a2 == 1) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 1;
  }
  id v7 = +[RCDurationFormatter sharedFormatter];
  NSErrorUserInfoKey v8 = [v7 stringFromDuration:a1 replacingDigitsWithDigit:v6 style:a3];

  return v8;
}

id RCLocalizedDurationWithStyle(uint64_t a1, double a2)
{
  uint64_t v3 = 2;
  if (!(unint64_t)(a2 / 3600.0)) {
    uint64_t v3 = 4;
  }
  if (a1 == 1) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 1;
  }
  uint64_t v5 = +[RCDurationFormatter sharedFormatter];
  uint64_t v6 = [v5 stringFromDuration:v4 style:a2];

  return v6;
}

id RCLocalizedRecordingDuration(int a1, double a2)
{
  if ((uint64_t)(floor(a2) / 3600.0) >= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 4;
  }
  uint64_t v5 = +[RCDurationFormatter sharedFormatter];
  uint64_t v6 = [v5 stringFromDuration:v4 style:a2];

  if (a1) {
    id v7 = @"RECORDING_PAUSED_STATUS_BAR_FORMAT";
  }
  else {
    id v7 = @"RECORDING_STATUS_BAR_FORMAT";
  }
  NSErrorUserInfoKey v8 = RCLocalizedFrameworkString(v7);
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6);

  return v9;
}

id RCLocalizedFrameworkString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSBundle bundleWithIdentifier:@"com.apple.VoiceMemos.framework"];
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:0];

  return v3;
}

id RCLocalizedRecordingDateWithOptions(void *a1, unint64_t a2)
{
  id v3 = a1;
  if (a2 <= 1) {
    char v4 = 1;
  }
  else {
    char v4 = a2;
  }
  if ((~v4 & 3) != 0)
  {
    if (v4)
    {
      uint64_t v5 = &qword_82EE8;
      id v6 = (id)qword_82EE8;
      if (!qword_82EE8)
      {
        uint64_t v7 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      if ((v4 & 2) == 0)
      {
        NSErrorUserInfoKey v8 = 0;
        goto LABEL_15;
      }
      uint64_t v5 = &qword_82EF0;
      id v6 = (id)qword_82EF0;
      if (!qword_82EF0)
      {
        uint64_t v9 = 0;
        uint64_t v7 = 1;
        goto LABEL_13;
      }
    }
  }
  else
  {
    uint64_t v5 = &qword_82EE0;
    id v6 = (id)qword_82EE0;
    if (!qword_82EE0)
    {
      uint64_t v7 = 1;
LABEL_12:
      uint64_t v9 = 1;
LABEL_13:
      id v10 = objc_alloc_init((Class)NSDateFormatter);
      id v11 = (id)*v5;
      uint64_t *v5 = (uint64_t)v10;

      [(id)*v5 setDateStyle:v7];
      [(id)*v5 setTimeStyle:v9];
      id v6 = (id)*v5;
    }
  }
  uint64_t v12 = [v6 stringFromDate:v3];
  NSErrorUserInfoKey v8 = RCDisplayStringForString(v12);

LABEL_15:

  return v8;
}

id RCLocalizedPlaybackTimeWithMinimumComponents(unint64_t a1, double a2, double a3)
{
  return RCLocalizedPlaybackTimeWithMinimumAndHiddenComponents(a1, 0, a2, a3);
}

id RCLocalizedPlaybackTimeWithMinimumAndHiddenComponents(unint64_t a1, uint64_t a2, double a3, double a4)
{
  unint64_t v5 = (unint64_t)(floor(a4) / 60.0);
  double v6 = fmax(a3, 0.0);
  unint64_t v7 = 2;
  if (v5) {
    unint64_t v7 = 3;
  }
  BOOL v8 = v5 >= 0x3C;
  uint64_t v9 = 4;
  if (v8) {
    unint64_t v7 = 4;
  }
  if (v7 <= a1) {
    unint64_t v7 = a1;
  }
  if (v7 < 4) {
    uint64_t v9 = v7;
  }
  switch(v9)
  {
    case 4:
      id v10 = +[RCDurationFormatter sharedFormatter];
      id v11 = v10;
      double v12 = v6;
      uint64_t v13 = a2;
      uint64_t v14 = 0;
      goto LABEL_16;
    case 3:
      id v10 = +[RCDurationFormatter sharedFormatter];
      id v11 = v10;
      double v12 = v6;
      uint64_t v13 = a2;
      uint64_t v14 = 3;
      goto LABEL_16;
    case 2:
      id v10 = +[RCDurationFormatter sharedFormatter];
      id v11 = v10;
      double v12 = v6;
      uint64_t v13 = a2;
      uint64_t v14 = 5;
LABEL_16:
      CGFloat v15 = [v10 stringFromDuration:v13 hideComponentOptions:v14 style:v12];

      goto LABEL_18;
  }
  CGFloat v15 = 0;
LABEL_18:

  return v15;
}

id RCLocalizedInteger(uint64_t a1, int a2)
{
  if (a2 == 2)
  {
    if (qword_82F78 != -1) {
      dispatch_once(&qword_82F78, &stru_6DA98);
    }
    char v4 = (void *)qword_82F80;
    goto LABEL_9;
  }
  if (a2 == 1)
  {
    if (qword_82F68 != -1) {
      dispatch_once(&qword_82F68, &stru_6DA78);
    }
    char v4 = (void *)qword_82F70;
LABEL_9:
    unint64_t v5 = +[NSNumber numberWithInteger:a1];
    double v6 = [v4 stringFromNumber:v5];
    goto LABEL_13;
  }
  id v7 = objc_alloc_init((Class)NSNumberFormatter);
  unint64_t v5 = v7;
  if (a2 >= 1) {
    [v7 setMinimumIntegerDigits:a2];
  }
  BOOL v8 = +[NSNumber numberWithInteger:a1];
  double v6 = [v5 stringFromNumber:v8];

LABEL_13:

  return v6;
}

uint64_t RCNumberOfDigitsInInteger(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  if (a1 >= 0) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = -a1;
  }
  uint64_t v2 = +[NSString stringWithFormat:@"%ld", v1];
  id v3 = [v2 length];

  return (uint64_t)v3;
}

uint64_t RCAvailableDiskSpaceForRecording()
{
  int64_t valuePtr = 0;
  CFDictionaryRef v0 = (const __CFDictionary *)MGCopyAnswer();
  if (!v0)
  {
    id v3 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_464D8(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    goto LABEL_11;
  }
  CFDictionaryRef v1 = v0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v0, kMGQDiskUsageAmountDataAvailable);
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  }
  else
  {
    id v11 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_46550(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  CFRelease(v1);
  int64_t v19 = valuePtr;
  if (!valuePtr)
  {
LABEL_11:
    memset(&v32, 0, 512);
    id v20 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Media"];
    int v21 = statfs((const char *)[v20 fileSystemRepresentation], &v32);

    if (v21)
    {
      double v22 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_46460(v22, v23, v24, v25, v26, v27, v28, v29);
      }

      int64_t v19 = valuePtr;
    }
    else
    {
      int64_t v19 = v32.f_bavail * v32.f_bsize;
    }
  }
  return (uint64_t)fmax((double)(v19 / 2) + -5242880.0, 0.0);
}

BOOL RCHasEnoughDiskSpaceToRecord()
{
  uint64_t v0 = RCAvailableDiskSpaceForRecording();
  if (v0 < 5242880)
  {
    CFDictionaryRef v1 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_465C8(v0, v1);
    }
  }
  return v0 >= 5242880;
}

id RCDiskCacheDirectory()
{
  uint64_t v0 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  CFDictionaryRef v1 = [v0 lastObject];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"com.apple.voicememos"];

  return v2;
}

id RCApplicationSupportDirectory()
{
  uint64_t v0 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  CFDictionaryRef v1 = [v0 lastObject];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"com.apple.voicememos"];

  return v2;
}

id RCIsVoiceMemosApplication()
{
  uint64_t v0 = +[NSBundle mainBundle];
  CFDictionaryRef v1 = [v0 bundleIdentifier];
  id v2 = [v1 isEqualToString:@"com.apple.VoiceMemos"];

  return v2;
}

id RCIsVoiceMemosApplicationInstalled()
{
  uint64_t v0 = +[LSApplicationWorkspace defaultWorkspace];
  id v1 = [v0 applicationIsInstalled:@"com.apple.VoiceMemos"];

  return v1;
}

id RCLegacyRecordingsDirectoryURL()
{
  if (qword_82F00 != -1) {
    dispatch_once(&qword_82F00, &stru_6D9C8);
  }
  uint64_t v0 = (void *)qword_82EF8;

  return v0;
}

void sub_2BA18(id a1)
{
  uint64_t v1 = sub_2BA50();
  id v2 = (void *)qword_82EF8;
  qword_82EF8 = v1;
}

id sub_2BA50()
{
  v4[0] = CPSharedResourcesDirectory();
  v4[1] = @"Media";
  v4[2] = @"Recordings";
  uint64_t v0 = +[NSArray arrayWithObjects:v4 count:3];
  uint64_t v1 = +[NSString pathWithComponents:v0];
  id v2 = +[NSURL fileURLWithPath:v1];

  return v2;
}

id RCRecordingsDirectoryURL()
{
  if (qword_82F10 != -1) {
    dispatch_once(&qword_82F10, &stru_6D9E8);
  }
  uint64_t v0 = (void *)qword_82F08;

  return v0;
}

void sub_2BB88(id a1)
{
  v5[0] = CPSharedResourcesDirectory();
  v5[1] = @"Library";
  v5[2] = @"Recordings";
  uint64_t v1 = +[NSArray arrayWithObjects:v5 count:3];
  id v2 = +[NSString pathWithComponents:v1];
  uint64_t v3 = +[NSURL fileURLWithPath:v2];

  uint64_t v4 = (void *)qword_82F08;
  qword_82F08 = v3;
}

id RCStockRecordingsURL()
{
  uint64_t v0 = sub_2BA50();
  uint64_t v1 = [v0 URLByDeletingLastPathComponent];
  id v2 = [v1 URLByAppendingPathComponent:@"StockRecordings"];

  return v2;
}

id RCLogsDirectoryURL()
{
  v4[0] = CPSharedResourcesDirectory();
  v4[1] = @"Library";
  v4[2] = @"Logs";
  void v4[3] = @"com.apple.voicememos";
  uint64_t v0 = +[NSArray arrayWithObjects:v4 count:4];
  uint64_t v1 = +[NSString pathWithComponents:v0];
  id v2 = +[NSURL fileURLWithPath:v1];

  return v2;
}

void RCDispatchNoSoonerThan(void *a1, void *a2, void *a3)
{
  queue = a2;
  id v5 = a3;
  [a1 timeIntervalSinceReferenceDate];
  double v7 = v6;
  +[NSDate timeIntervalSinceReferenceDate];
  double v9 = v7 - v8;
  if (v9 <= 0.0)
  {
    dispatch_async(queue, v5);
  }
  else
  {
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    dispatch_after(v10, queue, v5);
  }
}

id RCObserveChangesToKeyPaths(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  dispatch_time_t v10 = objc_opt_new();
  [v10 setObject:v7];
  id v11 = [v8 copy];
  [v10 setKeyPaths:v11];

  [v10 setObserver:v9];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v10, *(void *)(*((void *)&v18 + 1) + 8 * i), a3, &unk_82F18, (void)v18);
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  return v10;
}

id RCObserveChangesToKeyPath(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = sub_2C454;
  long long v21 = sub_2C464;
  id v22 = 0;
  uint64_t v23 = a2;
  id v6 = a2;
  id v7 = a1;
  id v8 = +[NSArray arrayWithObjects:&v23 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_2C46C;
  v14[3] = &unk_6DA10;
  id v15 = v5;
  uint64_t v16 = &v17;
  id v9 = v5;
  uint64_t v10 = RCObserveChangesToKeyPaths(v7, v8, 3, v14);

  id v11 = (void *)v18[5];
  v18[5] = v10;

  id v12 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v12;
}

uint64_t sub_2C454(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2C464(uint64_t a1)
{
}

void sub_2C46C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*a5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

id RCComputeFileDigest(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSMutableData) initWithLength:32];
  if (v6 && v6[2](v6, v5, v7))
  {
    id v8 = v7;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x8810000000;
    long long v18 = &unk_6116F;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v25 = 0;
    id v9 = [objc_alloc((Class)NSData) initWithContentsOfURL:v5 options:1 error:a2];
    if (v9)
    {
      CC_SHA256_Init((CC_SHA256_CTX *)(v16 + 4));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_2C6D4;
      v14[3] = &unk_6DA38;
      void v14[4] = &v15;
      [v9 enumerateByteRangesUsingBlock:v14];
      id v10 = v7;
      id v11 = (unsigned __int8 *)[v10 mutableBytes];
      CC_SHA256_Final(v11, (CC_SHA256_CTX *)(v16 + 4));
      id v8 = v10;
    }
    else
    {
      id v12 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_46654((uint64_t)v5, v12);
      }

      id v8 = 0;
    }

    _Block_object_dispose(&v15, 8);
  }

  return v8;
}

void sub_2C6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2C6D4(uint64_t a1, const void *a2, int a3, CC_LONG len)
{
  return CC_SHA256_Update((CC_SHA256_CTX *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), a2, len);
}

void sub_2C6E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = objc_alloc((Class)NSString);
  id v11 = +[NSString stringWithUTF8String:a1];
  id v12 = [v10 initWithFormat:v11 arguments:&a9];

  NSLog(@"%@", v12);
}

uint64_t RCIsBeingDebugged()
{
  return 0;
}

BOOL RCIsBeingUnitTested()
{
  return NSClassFromString(@"XCTestCase") != 0;
}

id RCDebugAssertsDisabled()
{
  uint64_t v0 = +[NSUserDefaults standardUserDefaults];
  id v1 = [v0 BOOLForKey:@"RCDebugAssertsDisabled"];

  return v1;
}

uint64_t RCTestEditInTrimSheetAllowedGetDefaultOption()
{
  return qword_82508;
}

void RCTestEditInTrimSheetAllowedSetDefaultOption(uint64_t a1)
{
  if (qword_82F88 != -1) {
    dispatch_once(&qword_82F88, &stru_6DAB8);
  }
  if (byte_82F31) {
    qword_82508 = a1;
  }
}

uint64_t RCTestEditInTrimSheetAllowed()
{
  if (qword_82F88 != -1) {
    dispatch_once(&qword_82F88, &stru_6DAB8);
  }
  return byte_82F31;
}

double RCTestSlowMessageServiceSleepAmount()
{
  if (qword_82F88 != -1) {
    dispatch_once(&qword_82F88, &stru_6DAB8);
  }
  return *(double *)&qword_82F20;
}

double RCTestSlowMessageExportSeconds()
{
  if (qword_82F88 != -1) {
    dispatch_once(&qword_82F88, &stru_6DAB8);
  }
  return *(double *)&qword_82F28;
}

uint64_t RCTestAlwaysShowLockScreenPlugin()
{
  if (qword_82F88 != -1) {
    dispatch_once(&qword_82F88, &stru_6DAB8);
  }
  return byte_82F30;
}

uint64_t RCTestResetSyncs()
{
  if (qword_82F88 != -1) {
    dispatch_once(&qword_82F88, &stru_6DAB8);
  }
  return byte_82F32;
}

uint64_t RCTestResetSyncsAlwaysResetSync()
{
  if (qword_82F88 != -1) {
    dispatch_once(&qword_82F88, &stru_6DAB8);
  }
  return byte_82F33;
}

double RCTestBeginPreviewDelay()
{
  if (qword_82F88 != -1) {
    dispatch_once(&qword_82F88, &stru_6DAB8);
  }
  return *(double *)&qword_82F38;
}

double RCTestAudioTrimmingProgressWithDuration()
{
  if (qword_82F88 != -1) {
    dispatch_once(&qword_82F88, &stru_6DAB8);
  }
  return *(double *)&qword_82F40;
}

uint64_t RCTestAutoSelectedRecordingIndex()
{
  if (qword_82F88 != -1) {
    dispatch_once(&qword_82F88, &stru_6DAB8);
  }
  return qword_82510;
}

uint64_t RCTestRunningAutomatedUITests()
{
  if (qword_82F88 != -1) {
    dispatch_once(&qword_82F88, &stru_6DAB8);
  }
  return byte_82F48;
}

double RCTestResetNavigationStateThresholdSeconds()
{
  if (qword_82F88 != -1) {
    dispatch_once(&qword_82F88, &stru_6DAB8);
  }
  return *(double *)&qword_82F50;
}

uint64_t RCTestDebugAutolayout_Show()
{
  if (qword_82F88 != -1) {
    dispatch_once(&qword_82F88, &stru_6DAB8);
  }
  return byte_82F58;
}

uint64_t RCTestDebugAutolayout_Logging()
{
  if (qword_82F88 != -1) {
    dispatch_once(&qword_82F88, &stru_6DAB8);
  }
  return byte_82F59;
}

uint64_t RCRunningInSavedRecordingDaemon()
{
  if (qword_82F60 != -1) {
    dispatch_once(&qword_82F60, &stru_6DA58);
  }
  return byte_82F5A;
}

void sub_2CC08(id a1)
{
  byte_82F5A = NSClassFromString(@"SavedRecordingService") != 0;
}

id RCLocalizationNotNeeded(void *a1)
{
  id v1 = a1;

  return v1;
}

void sub_2CC60(id a1)
{
  id v1 = objc_alloc_init((Class)NSNumberFormatter);
  id v2 = (void *)qword_82F70;
  qword_82F70 = (uint64_t)v1;

  uint64_t v3 = (void *)qword_82F70;

  [v3 setMinimumIntegerDigits:1];
}

void sub_2CCB0(id a1)
{
  id v1 = objc_alloc_init((Class)NSNumberFormatter);
  id v2 = (void *)qword_82F80;
  qword_82F80 = (uint64_t)v1;

  uint64_t v3 = (void *)qword_82F80;

  [v3 setMinimumIntegerDigits:2];
}

void sub_2CD00(id a1)
{
  id v34 = +[NSUserDefaults standardUserDefaults];
  id v1 = [v34 objectForKey:@"RCTestSlowMessageServiceSleepAmount"];

  if (v1)
  {
    id v2 = [v34 objectForKey:@"RCTestSlowMessageServiceSleepAmount"];
    [v2 doubleValue];
    qword_82F20 = v3;
  }
  uint64_t v4 = [v34 objectForKey:@"RCTestSlowMessageExportSeconds"];

  if (v4)
  {
    id v5 = [v34 objectForKey:@"RCTestSlowMessageExportSeconds"];
    [v5 doubleValue];
    qword_82F28 = v6;
  }
  id v7 = [v34 objectForKey:@"RCTestAlwaysShowLockScreenPlugin"];

  if (v7)
  {
    id v8 = [v34 objectForKey:@"RCTestAlwaysShowLockScreenPlugin"];
    byte_82F30 = [v8 BOOLValue];
  }
  id v9 = [v34 objectForKey:@"RCTestEditInTrimSheetAllowed"];

  if (v9)
  {
    id v10 = [v34 objectForKey:@"RCTestEditInTrimSheetAllowed"];
    byte_82F31 = [v10 BOOLValue];
  }
  id v11 = [v34 objectForKey:@"RCTestResetSyncs"];

  if (v11)
  {
    id v12 = [v34 objectForKey:@"RCTestResetSyncs"];
    byte_82F32 = [v12 BOOLValue];
  }
  id v13 = [v34 objectForKey:@"RCTestResetSyncsAlwaysResetSync"];

  if (v13)
  {
    id v14 = [v34 objectForKey:@"RCTestResetSyncsAlwaysResetSync"];
    byte_82F33 = [v14 BOOLValue];
  }
  uint64_t v15 = [v34 objectForKey:@"RCTestBeginPreviewDelay"];

  if (v15)
  {
    uint64_t v16 = [v34 objectForKey:@"RCTestBeginPreviewDelay"];
    [v16 doubleValue];
    qword_82F38 = v17;
  }
  long long v18 = [v34 objectForKey:@"RCTestAudioTrimmingProgressWithDuration"];

  if (v18)
  {
    long long v19 = [v34 objectForKey:@"RCTestAudioTrimmingProgressWithDuration"];
    [v19 doubleValue];
    qword_82F40 = v20;
  }
  long long v21 = [v34 objectForKey:@"RCTestAutoSelectedRecordingIndex"];

  if (v21)
  {
    long long v22 = [v34 objectForKey:@"RCTestAutoSelectedRecordingIndex"];
    qword_82510 = (uint64_t)[v22 integerValue];
  }
  long long v23 = [v34 objectForKey:@"RCTestDebugAutolayout"];

  if (v23)
  {
    long long v24 = [v34 objectForKey:@"RCTestDebugAutolayout"];
    byte_82F90 = [v24 BOOLValue];
  }
  uint64_t v25 = [v34 objectForKey:@"RCTestDebugAutolayout_Show"];

  if (v25)
  {
    uint64_t v26 = [v34 objectForKey:@"RCTestDebugAutolayout_Show"];
    byte_82F58 = [v26 BOOLValue];
  }
  uint64_t v27 = [v34 objectForKey:@"RCTestDebugAutolayout_Logging"];

  if (v27)
  {
    uint64_t v28 = [v34 objectForKey:@"RCTestDebugAutolayout_Logging"];
    byte_82F59 = [v28 BOOLValue];
  }
  uint64_t v29 = [v34 objectForKey:@"RCTestRunningAutomatedUITests"];

  if (v29)
  {
    double v30 = [v34 objectForKey:@"RCTestRunningAutomatedUITests"];
    byte_82F48 = [v30 BOOLValue];
  }
  uint64_t v31 = [v34 objectForKey:@"RCTestResetNavigationStateThresholdSeconds"];

  if (v31)
  {
    statfs v32 = [v34 objectForKey:@"RCTestResetNavigationStateThresholdSeconds"];
    [v32 doubleValue];
    qword_82F50 = v33;
  }
  byte_82F58 = (byte_82F58 | byte_82F90) != 0;
  byte_82F59 = (byte_82F59 | byte_82F90) != 0;
  if (byte_82F48)
  {
    byte_82F31 = 1;
    qword_82F40 = fmax(*(double *)&qword_82F40, 5.0);
  }
}

void sub_2D19C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2D1B8()
{
  id v1 = v0;
  swift_getObjectType();
  v42.receiver = v0;
  v42.super_class = (Class)type metadata accessor for AMMessagesMainViewController(0);
  objc_msgSendSuper2(&v42, "viewDidLoad");
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v4 = sub_467A0();
  id v5 = [v3 objectForInfoDictionaryKey:v4];

  if (!v5)
  {
    __break(1u);
    goto LABEL_15;
  }
  sub_46910();
  swift_unknownObjectRelease();
  sub_31A84(&v40, v41);
  swift_dynamicCast();
  id v6 = v3;
  NSString v7 = sub_467A0();
  swift_bridgeObjectRelease();
  id v8 = [self storyboardWithName:v7 bundle:v6];

  type metadata accessor for AMMessagesViewController(0);
  uint64_t v9 = sub_46880();
  uint64_t v10 = OBJC_IVAR___AMMessagesMainViewController_messagesViewController;
  id v11 = *(void **)&v1[OBJC_IVAR___AMMessagesMainViewController_messagesViewController];
  *(void *)&v1[OBJC_IVAR___AMMessagesMainViewController_messagesViewController] = v9;

  if (!*(void *)&v1[v10])
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  swift_unknownObjectWeakAssign();
  if (!*(void *)&v1[v10])
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  objc_msgSend(v1, "addChildViewController:");
  id v12 = *(void **)&v1[v10];
  if (!v12)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v13 = [v12 view];
  if (!v13)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v14 = v13;
  id v15 = [v1 view];
  if (!v15)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v16 = v15;
  [v15 frame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  objc_msgSend(v14, "setFrame:", v18, v20, v22, v24);
  id v25 = [v1 view];
  if (!v25)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v26 = v25;
  uint64_t v27 = *(void **)&v1[v10];
  if (!v27)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v28 = [v27 view];
  if (!v28)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v29 = v28;
  [v26 addSubview:v28];

  double v30 = *(void **)&v1[v10];
  if (!v30)
  {
LABEL_23:
    __break(1u);
    return;
  }
  [v30 didMoveToParentViewController:v1];
  uint64_t v31 = v1;
  statfs v32 = sub_46710();
  os_log_type_t v33 = sub_468A0();
  if (os_log_type_enabled(v32, v33))
  {
    BOOL v39 = v6;
    uint64_t v34 = swift_slowAlloc();
    double v35 = (void *)swift_slowAlloc();
    v41[0].receiver = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v34 = 138412546;
    *(void *)&long long v40 = v31;
    double v36 = v31;
    sub_468F0();
    *double v35 = v1;

    *(_WORD *)(v34 + 12) = 2080;
    *(void *)&long long v40 = *(void *)&v1[v10];
    sub_305B8(&qword_826A0);
    uint64_t v37 = sub_468E0();
    *(void *)&long long v40 = sub_30CB4(v37, v38, (uint64_t *)v41);
    sub_468F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&def_3AC7C, v32, v33, "%@ loaded child view controller %s", (uint8_t *)v34, 0x16u);
    sub_305B8(&qword_82690);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_2D6FC()
{
  uint64_t v1 = OBJC_IVAR___AMMessagesMainViewController_messagesViewController;
  id v2 = *(void **)(v0 + OBJC_IVAR___AMMessagesMainViewController_messagesViewController);
  if (!v2)
  {
    __break(1u);
    goto LABEL_9;
  }
  [v2 willMoveToParentViewController:0];
  id v3 = *(void **)(v0 + v1);
  if (!v3)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  id v4 = [v3 view];
  if (!v4)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v5 = v4;
  [v4 removeFromSuperview];

  id v6 = *(void **)(v0 + v1);
  if (!v6)
  {
LABEL_11:
    __break(1u);
    return;
  }
  [v6 removeFromParentViewController];
  NSString v7 = *(void **)(v0 + v1);
  *(void *)(v0 + v1) = 0;
}

id sub_2D7B0()
{
  id v1 = v0;
  id v2 = sub_46710();
  os_log_type_t v3 = sub_468A0();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    id v5 = (void *)swift_slowAlloc();
    *(_DWORD *)id v4 = 138412290;
    id v6 = v1;
    sub_468F0();
    void *v5 = v1;

    _os_log_impl(&def_3AC7C, v2, v3, "%@ released from memory", v4, 0xCu);
    sub_305B8(&qword_82690);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for AMMessagesMainViewController(0);
  return objc_msgSendSuper2(&v8, "dealloc");
}

void sub_2D9E4(void *a1)
{
  id v2 = v1;
  swift_getObjectType();
  uint64_t v4 = OBJC_IVAR___AMMessagesMainViewController_messagesViewController;
  id v5 = *(void **)&v1[OBJC_IVAR___AMMessagesMainViewController_messagesViewController];
  if (!v5)
  {
    __break(1u);
    goto LABEL_25;
  }
  id v6 = v5;
  id v7 = sub_2E48C();
  unsigned __int8 v8 = [v7 audioMessageRecordingAvailable];

  if (v8)
  {
LABEL_6:
    id v13 = *(void **)&v2[v4];
    if (v13)
    {
      id v14 = [v13 view];
      if (v14)
      {
        id v15 = v14;
        [v14 setHidden:0];

        uint64_t v16 = *(void **)&v2[v4];
        if (v16)
        {
          [v16 willBecomeActiveWithConversation:a1];
          return;
        }
        goto LABEL_27;
      }
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v9 = *(void **)&v2[v4];
  if (!v9)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  id v10 = v9;
  id v11 = sub_2E48C();
  id v12 = [v11 powerLevels];

  if (v12)
  {

    goto LABEL_6;
  }
  sub_2D6FC();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v18 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v19 = sub_467A0();
  id v46 = [self storyboardWithName:v19 bundle:v18];

  type metadata accessor for AMUnavailableViewController();
  uint64_t v20 = sub_46880();
  uint64_t v21 = OBJC_IVAR___AMMessagesMainViewController_unavailabelViewController;
  double v22 = *(void **)&v2[OBJC_IVAR___AMMessagesMainViewController_unavailabelViewController];
  *(void *)&v2[OBJC_IVAR___AMMessagesMainViewController_unavailabelViewController] = v20;

  uint64_t v23 = *(void *)&v2[v21];
  if (!v23)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  double v24 = *(void **)(v23 + OBJC_IVAR____TtC22AudioMessagesExtension27AMUnavailableViewController_conversation);
  *(void *)(v23 + OBJC_IVAR____TtC22AudioMessagesExtension27AMUnavailableViewController_conversation) = a1;
  id v25 = a1;

  if (!*(void *)&v2[v21])
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  objc_msgSend(v2, "addChildViewController:");
  uint64_t v26 = *(void **)&v2[v21];
  if (!v26)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  id v27 = [v26 view];
  if (!v27)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  id v28 = v27;
  id v29 = [v2 view];
  if (!v29)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  double v30 = v29;
  id v31 = [v29 safeAreaLayoutGuide];

  [v31 layoutFrame];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  objc_msgSend(v28, "setFrame:", v33, v35, v37, v39);
  id v40 = [v2 view];
  if (!v40)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v41 = v40;
  objc_super v42 = *(void **)&v2[v21];
  if (!v42)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  id v43 = [v42 view];
  if (!v43)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v44 = v43;
  [v41 addSubview:v43];

  uint64_t v45 = *(void **)&v2[v21];
  if (!v45)
  {
LABEL_37:
    __break(1u);
    return;
  }
  [v45 didMoveToParentViewController:v2];
}

id sub_2DED0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  return [*(id *)(a1 + OBJC_IVAR___AMMessagesMainViewController_messagesViewController) *a5];
}

void sub_2DEFC(unint64_t a1)
{
  [*(id *)&v1[OBJC_IVAR___AMMessagesMainViewController_messagesViewController] didTransitionToPresentationStyle:a1];
  os_log_type_t v3 = v1;
  oslog = sub_46710();
  os_log_type_t v4 = sub_468A0();
  if (os_log_type_enabled(oslog, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    id v6 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412802;
    id v7 = v3;
    sub_468F0();
    *id v6 = v3;

    *(_WORD *)(v5 + 12) = 2080;
    sub_30CB4(0xD000000000000012, 0x80000000000669F0, &v11);
    sub_468F0();
    *(_WORD *)(v5 + 22) = 2080;
    if (a1 > 2)
    {
      unint64_t v9 = 0xE700000000000000;
      uint64_t v8 = 0x6E776F6E6B6E75;
    }
    else
    {
      uint64_t v8 = *(void *)&aCompact[8 * a1];
      unint64_t v9 = *(void *)&aExpandedtransc[8 * a1 + 16];
    }
    sub_30CB4(v8, v9, &v11);
    sub_468F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&def_3AC7C, oslog, v4, "%@ %s switching to presentation style %s", (uint8_t *)v5, 0x20u);
    sub_305B8(&qword_82690);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

id sub_2E2A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = v3;
  _s22AudioMessagesExtension0A24AppContentViewControllerC6logger33_6C80B9CA6D0C59A10BF4E668E4172F5CLL2os6LoggerVvpfi_0();
  *(void *)&v6[OBJC_IVAR___AMMessagesMainViewController_messagesViewController] = 0;
  *(void *)&v6[OBJC_IVAR___AMMessagesMainViewController_unavailabelViewController] = 0;

  if (a2)
  {
    NSString v7 = sub_467A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for AMMessagesMainViewController(0);
  id v8 = objc_msgSendSuper2(&v10, "initWithNibName:bundle:", v7, a3);

  return v8;
}

id sub_2E3D0(void *a1)
{
  os_log_type_t v3 = v1;
  _s22AudioMessagesExtension0A24AppContentViewControllerC6logger33_6C80B9CA6D0C59A10BF4E668E4172F5CLL2os6LoggerVvpfi_0();
  *(void *)&v3[OBJC_IVAR___AMMessagesMainViewController_messagesViewController] = 0;
  *(void *)&v3[OBJC_IVAR___AMMessagesMainViewController_unavailabelViewController] = 0;

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for AMMessagesMainViewController(0);
  id v4 = objc_msgSendSuper2(&v6, "initWithCoder:", a1);

  return v4;
}

id sub_2E48C()
{
  uint64_t v1 = OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController____lazy_storage___audioMessagesControlInterface;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController____lazy_storage___audioMessagesControlInterface);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController____lazy_storage___audioMessagesControlInterface);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)AMAudioMessagesControlInterface) initWithDelegate:v0];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_2E504(float a1, double a2)
{
  id v5 = v2;
  id v6 = sub_46710();
  os_log_type_t v7 = sub_46890();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    unint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412802;
    id v10 = v5;
    sub_468F0();
    *unint64_t v9 = v5;

    *(_WORD *)(v8 + 12) = 2048;
    sub_468F0();
    *(_WORD *)(v8 + 22) = 2048;
    sub_468F0();
    _os_log_impl(&def_3AC7C, v6, v7, "%@ audioMessageDidChangeAudioPowerLevel %f, duration: %f", (uint8_t *)v8, 0x20u);
    sub_305B8(&qword_82690);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v13 = Strong;
  uint64_t v14 = OBJC_IVAR____TtC22AudioMessagesExtension24AMWaveFormViewController_currentDuration;
  *(float *)&double v12 = a1;
  [Strong updatePowerLevel:v12 startTime:*(double *)&Strong[OBJC_IVAR____TtC22AudioMessagesExtension24AMWaveFormViewController_currentDuration] endTime:a2];
  *(double *)&v13[v14] = a2;

  uint64_t v15 = swift_unknownObjectWeakLoadStrong();
  if (!v15)
  {
LABEL_10:
    __break(1u);
    return;
  }
  uint64_t v16 = (char *)v15;
  uint64_t v17 = *(void *)(v15 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_recorder)
      + OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_power;
  swift_beginAccess();
  *(float *)uint64_t v17 = a1;
  *(unsigned char *)(v17 + 4) = 0;
  id v18 = &v16[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate];
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v19 = *((void *)v18 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t, float))(v19 + 16))(v16, ObjectType, v19, (float)(a1 + 60.0) / 50.0);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

void sub_2E834(double a1)
{
  id v3 = v1;
  id v4 = sub_46710();
  os_log_type_t v5 = sub_46890();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    os_log_type_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412546;
    id v8 = v3;
    sub_468F0();
    *os_log_type_t v7 = v3;

    *(_WORD *)(v6 + 12) = 2048;
    sub_468F0();
    _os_log_impl(&def_3AC7C, v4, v5, "%@ currentPlaybackTime %f", (uint8_t *)v6, 0x16u);
    sub_305B8(&qword_82690);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v10 = Strong;
    [Strong updateCurrentPlaybackTime:a1];
  }
  else
  {
    __break(1u);
  }
}

void sub_2EABC()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
_objc_release_x2:
    _objc_release_x2();
    return;
  }
  if (!*(unsigned char *)(Strong + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state))
  {
    goto _objc_release_x2;
  }
  id v4 = (char *)Strong;
  sub_3A4C8(0, 1, 0.0);
  uint64_t v1 = &v4[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate];
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v2 = *((void *)v1 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 56))(v4, ObjectType, v2);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

void sub_2EC08()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
_objc_release_x2:
    _objc_release_x2();
    return;
  }
  if (!*(unsigned char *)(Strong + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state))
  {
    goto _objc_release_x2;
  }
  id v4 = (char *)Strong;
  sub_3A4C8(0, 1, 0.0);
  uint64_t v1 = &v4[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate];
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v2 = *((void *)v1 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 72))(v4, ObjectType, v2);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

uint64_t sub_2ED58()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    if (*(unsigned char *)(Strong + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state) != 4) {
      sub_3A4C8(4u, 1, 0.0);
    }
  }
  else
  {
    __break(1u);
  }
  return _objc_release_x2();
}

uint64_t sub_2EE20()
{
  id v0 = sub_2E48C();
  id v1 = [v0 powerLevels];

  if (v1)
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (!Strong)
    {
LABEL_11:

      __break(1u);
      return _objc_release_x2();
    }
    id v3 = (void *)Strong;
    id v4 = sub_2E48C();
    [v4 duration];
    double v6 = v5;

    [v3 updatePowerLevels:v1 startTime:0.0 endTime:v6];
  }
  uint64_t v7 = swift_unknownObjectWeakLoadStrong();
  if (!v7)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (*(unsigned char *)(v7 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state) != 5) {
    sub_3A4C8(5u, 1, 0.0);
  }

  return _objc_release_x2();
}

uint64_t sub_2EFC8()
{
  return swift_unknownObjectWeakInit();
}

id sub_2F0BC(void *a1)
{
  id v3 = v1;
  _s22AudioMessagesExtension0A24AppContentViewControllerC6logger33_6C80B9CA6D0C59A10BF4E668E4172F5CLL2os6LoggerVvpfi_0();
  v3[OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController__willReleaseToSendOrCancel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController_currentPresentationStyle] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController____lazy_storage___audioMessagesControlInterface] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController_conversation] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for AMMessagesViewController(0);
  id v4 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = qword_82518;
    id v7 = v4;
    if (v6 != -1) {
      swift_once();
    }
    swift_unknownObjectWeakAssign();
  }
  return v5;
}

void sub_2F230(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (!Strong)
    {
LABEL_24:
      __break(1u);
      return;
    }
    id v7 = Strong;
    id v8 = [Strong arrangedSubviews];

    sub_31968();
    uint64_t v9 = sub_46820();

    if ((v9 & 0xC000000000000001) != 0)
    {
      id v10 = (id)sub_46960();
    }
    else
    {
      if (!*(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8))) {
        goto LABEL_22;
      }
      id v10 = *(id *)(v9 + 32);
    }
    id v12 = v10;
    swift_bridgeObjectRelease();
    [v12 setHidden:0];
    goto LABEL_13;
  }
  if (!a1)
  {
    id v1 = (void *)swift_unknownObjectWeakLoadStrong();
    if (!v1)
    {
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    uint64_t v2 = v1;
    id v3 = [v1 arrangedSubviews];

    sub_31968();
    uint64_t v4 = sub_46820();

    if ((v4 & 0xC000000000000001) != 0)
    {
      id v5 = (id)sub_46960();
      goto LABEL_7;
    }
    if (*(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8)))
    {
      id v5 = *(id *)(v4 + 32);
LABEL_7:
      id v12 = v5;
      swift_bridgeObjectRelease();
      [v12 setHidden:1];
LABEL_13:

      return;
    }
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_305B8(&qword_82AD0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_62E10;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 32) = 0xD00000000000001ELL;
  *(void *)(v11 + 40) = 0x8000000000066930;
  sub_46A80();

  swift_bridgeObjectRelease();
}

uint64_t sub_2F444()
{
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for AMMessagesViewController(0);
  objc_msgSendSuper2(&v9, "viewDidLoad");
  id v1 = self;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_319E0;
  *(void *)(v3 + 24) = v2;
  v8[4] = sub_31B08;
  v8[5] = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_2F5E8;
  v8[3] = &unk_6DE60;
  uint64_t v4 = _Block_copy(v8);
  id v5 = v0;
  swift_retain();
  swift_release();
  [v1 performWithoutAnimation:v4];
  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_2F5C0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2F5E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_2F658(char a1)
{
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for AMMessagesViewController(0);
  objc_msgSendSuper2(&v8, "viewWillDisappear:", a1 & 1);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    int v5 = *(unsigned __int8 *)(Strong + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state);
    if (v5 == 6)
    {
      sub_3A4C8(5u, 1, 0.0);
      id v6 = sub_2E48C();
      id v7 = &selRef_pausePlaying;
    }
    else
    {
      if (v5 != 4)
      {
LABEL_7:

        return;
      }
      sub_3A4C8(5u, 1, 0.0);
      id v6 = sub_2E48C();
      id v7 = &selRef_stopRecording;
    }
    [v6 *v7];

    uint64_t v4 = v6;
    goto LABEL_7;
  }
  __break(1u);
}

void sub_2F7A4(uint64_t a1)
{
  v17.receiver = v1;
  v17.super_class = (Class)type metadata accessor for AMMessagesViewController(0);
  objc_msgSendSuper2(&v17, "willMoveToParentViewController:", a1);
  if (!a1)
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v4 = Strong;
      [Strong willMoveToParentViewController:0];

      int v5 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v5)
      {
        id v6 = v5;
        id v7 = [v5 view];

        if (v7)
        {
          [v7 removeFromSuperview];

          objc_super v8 = (void *)swift_unknownObjectWeakLoadStrong();
          if (v8)
          {
            objc_super v9 = v8;
            [v8 removeFromParentViewController];

            id v10 = (void *)swift_unknownObjectWeakLoadStrong();
            if (v10)
            {
              uint64_t v11 = v10;
              [v10 willMoveToParentViewController:0];

              id v12 = (void *)swift_unknownObjectWeakLoadStrong();
              if (v12)
              {
                id v13 = v12;
                id v14 = [v12 view];

                if (v14)
                {
                  [v14 removeFromSuperview];

                  uint64_t v15 = (void *)swift_unknownObjectWeakLoadStrong();
                  if (v15)
                  {
                    uint64_t v16 = v15;
                    [v15 removeFromParentViewController];

                    return;
                  }
LABEL_19:
                  __break(1u);
                  return;
                }
LABEL_18:
                __break(1u);
                goto LABEL_19;
              }
LABEL_17:
              __break(1u);
              goto LABEL_18;
            }
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
}

uint64_t sub_2FAA0(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  sub_305B8(&qword_82AD0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_62E10;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 32) = a5;
  *(void *)(v11 + 40) = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a1;
  sub_46A80();

  return swift_bridgeObjectRelease();
}

id sub_2FC6C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMMessagesViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_2FD74(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_2FD88(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_2FD94(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_2FDA4(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4, uint64_t a5)
{
  id v7 = sub_2E48C();
  [v7 *a4];

  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v9 = Strong;
    [Strong setTimeControllerState:a5];
  }
  else
  {
    __break(1u);
  }
}

void sub_2FE2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_2FE3C()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController__willReleaseToSendOrCancel) = 1;
}

void sub_2FE50()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController__willReleaseToSendOrCancel) = 0;
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    objc_super v2 = Strong;
    [Strong reset];

    id v3 = sub_2E48C();
    [v3 cancelAudioMessage];
  }
  else
  {
    __break(1u);
  }
}

void sub_2FED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_2FEE0(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  id v5 = sub_2E48C();
  [v5 *a4];
}

uint64_t sub_2FF2C(void *a1, uint64_t a2)
{
  id v5 = self;
  sub_31758(a2, (uint64_t)v14);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v2;
  *(void *)(v6 + 24) = a1;
  sub_31860((uint64_t)v14, v6 + 32);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_318C8;
  *(void *)(v7 + 24) = v6;
  _OWORD v13[4] = sub_318E4;
  v13[5] = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_2F5E8;
  v13[3] = &unk_6DDE8;
  objc_super v8 = _Block_copy(v13);
  id v9 = v2;
  id v10 = a1;
  swift_retain();
  swift_release();
  [v5 performWithoutAnimation:v8];
  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

void sub_300B8(void *a1, void *a2, uint64_t a3)
{
  sub_31758(a3, (uint64_t)v16);
  uint64_t v5 = v17;
  if (v17)
  {
    uint64_t v6 = sub_31924(v16, v17);
    uint64_t v7 = *(void *)(v5 - 8);
    __chkstk_darwin(v6);
    id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = sub_46A50();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    sub_31810((uint64_t)v16);
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (objc_class *)type metadata accessor for AMMessagesViewController(0);
  v15.receiver = a1;
  v15.super_class = v11;
  objc_msgSendSuper2(&v15, "prepareForSegue:sender:", a2, v10);
  swift_unknownObjectRelease();
  id v12 = [a2 destinationViewController];
  type metadata accessor for AMWaveFormViewController();
  if (swift_dynamicCastClass())
  {
    swift_unknownObjectWeakAssign();
LABEL_9:

    return;
  }
  type metadata accessor for AudioAppContentViewController();
  if (!swift_dynamicCastClass()) {
    goto LABEL_9;
  }
  swift_unknownObjectWeakAssign();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v14 = (void *)Strong;
    *(void *)(Strong + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_controlDelegate + 8) = &off_6DD40;
    swift_unknownObjectWeakAssign();

    id v12 = v14;
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t variable initialization expression of AudioRecorder.delegate()
{
  return 0;
}

uint64_t variable initialization expression of AudioRecorder.power()
{
  return 0x100000000;
}

id variable initialization expression of AudioAppContentViewController.recorder()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for AudioRecorder());

  return [v0 init];
}

uint64_t variable initialization expression of AudioAppContentViewController.isPressed()
{
  return 0;
}

id variable initialization expression of AudioAppContentViewController.ringsContainerView()
{
  id v0 = objc_allocWithZone((Class)UIView);

  return [v0 init];
}

uint64_t variable initialization expression of AudioAppContentViewController.rings()
{
  sub_305B8(&qword_827C0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_62E20;
  type metadata accessor for AudioAppContentViewController.Ring();
  uint64_t v1 = swift_allocObject();
  type metadata accessor for GradientView();
  uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  id v3 = [objc_allocWithZone(ObjCClassFromMetadata) init];
  uint64_t v4 = kCAGradientLayerRadial;
  id v5 = [v3 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() setType:v4];

  *(void *)(v1 + 16) = v3;
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 32) = 0;
  *(void *)(v0 + 32) = v1;
  uint64_t v6 = swift_allocObject();
  id v7 = [objc_allocWithZone(ObjCClassFromMetadata) init];
  uint64_t v8 = v4;
  id v9 = [v7 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() setType:v8];

  *(void *)(v6 + 16) = v7;
  *(void *)(v6 + 24) = 0;
  *(unsigned char *)(v6 + 32) = 0;
  *(void *)(v0 + 40) = v6;
  sub_46830();
  return v0;
}

uint64_t sub_305B8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

double variable initialization expression of AudioAppContentViewController.bottomMarginForCalloutView()
{
  return 17.0;
}

double variable initialization expression of AudioAppContentViewController.minimumMarginBetweenButtonAndCalloutView()
{
  return 9.0;
}

uint64_t variable initialization expression of AudioAppContentViewController.recordingStartTime()
{
  return 0;
}

uint64_t variable initialization expression of AudioAppContentViewController.displayLink()
{
  return 0;
}

id variable initialization expression of AudioAppContentViewController.centerFillView()
{
  id v0 = [objc_allocWithZone((Class)UIView) init];
  id v1 = [self systemBackgroundColor];
  [v0 setBackgroundColor:v1];

  return v0;
}

id variable initialization expression of AudioAppContentViewController.iconView()
{
  id v0 = [objc_allocWithZone((Class)UIImageView) init];
  id v1 = [self configurationWithPointSize:6 weight:-1 scale:34.0];
  [v0 setPreferredSymbolConfiguration:v1];

  return v0;
}

id variable initialization expression of AudioAppContentViewController.labelColor()
{
  id v0 = objc_allocWithZone((Class)UIColor);

  return [v0 init];
}

double variable initialization expression of AudioAppContentViewController.recordingMinimumDuration()
{
  return 0.8;
}

double variable initialization expression of AudioAppContentViewController.collapsedSpring@<D0>(uint64_t a1@<X8>)
{
  double result = 246.74011;
  *(_OWORD *)a1 = xmmword_62E30;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  return result;
}

double variable initialization expression of AudioAppContentViewController.powerIntensitySpring@<D0>(uint64_t a1@<X8>)
{
  double result = 986.96044;
  *(_OWORD *)a1 = xmmword_62E40;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  return result;
}

id variable initialization expression of AudioAppContentViewController.longPressRecognizer()
{
  id v0 = objc_allocWithZone((Class)UILongPressGestureRecognizer);

  return [v0 init];
}

double variable initialization expression of Spring.velocity()
{
  return 0.0;
}

uint64_t sub_307D4()
{
  return type metadata accessor for AMMessagesMainViewController(0);
}

uint64_t type metadata accessor for AMMessagesMainViewController(uint64_t a1)
{
  return sub_308C0(a1, (uint64_t *)&unk_825A8);
}

uint64_t sub_307FC()
{
  uint64_t result = sub_46730();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_30898()
{
  return type metadata accessor for AMMessagesViewController(0);
}

uint64_t type metadata accessor for AMMessagesViewController(uint64_t a1)
{
  return sub_308C0(a1, (uint64_t *)&unk_82658);
}

uint64_t sub_308C0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_308F8()
{
  uint64_t result = sub_46730();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

__n128 sub_309BC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_309CC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_309EC(uint64_t result, int a2, int a3)
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

uint64_t initializeBufferWithCopyOfBuffer for Spring(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_30A5C(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_30A68(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_30A88(uint64_t result, int a2, int a3)
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

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
}

void type metadata accessor for MSMessagesAppPresentationStyle(uint64_t a1)
{
}

void type metadata accessor for CGColor(uint64_t a1)
{
}

uint64_t sub_30AF4()
{
  uint64_t v0 = sub_467B0();
  uint64_t v2 = v1;
  if (v0 == sub_467B0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_46A60();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void sub_30B80(void *a1@<X8>)
{
  *a1 = 0;
}

BOOL sub_30B88(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_30BB8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_30BC8(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_30BD4(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_30BE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_467B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_30C14(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_30C3C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_30CB4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_468F0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_30CB4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_30D88(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_31A24((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_31A24((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_31810((uint64_t)v12);
  return v7;
}

uint64_t sub_30D88(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_46900();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_30F44(a5, a6);
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
  uint64_t v8 = sub_46980();
  if (!v8)
  {
    sub_469E0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_46A40();
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

uint64_t sub_30F44(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_30FDC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_311BC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_311BC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_30FDC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_31154(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_46950();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_469E0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_467F0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_46A40();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_469E0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_31154(uint64_t a1, uint64_t a2)
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
  sub_305B8(&qword_82698);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  void v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_311BC(char a1, int64_t a2, char a3, char *a4)
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
    sub_305B8(&qword_82698);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_46A40();
  __break(1u);
  return result;
}

void sub_3130C(void *a1, void (**a2)(void, void))
{
  id v3 = [a1 view];
  if (!v3)
  {
    _Block_release(a2);
    __break(1u);
    goto LABEL_16;
  }
  unint64_t v4 = v3;
  [v3 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  id v13 = [self mainScreen];
  [v13 scale];
  CGFloat v15 = v14;

  v29.width = v10;
  v29.height = v12;
  UIGraphicsBeginImageContextWithOptions(v29, 1, v15);
  uint64_t v16 = UIGraphicsGetCurrentContext();
  if (!v16)
  {
LABEL_16:
    _Block_release(a2);
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v17 = v16;
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
LABEL_17:
    _Block_release(a2);
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v19 = Strong;
  id v20 = [Strong view];

  if (!v20)
  {
LABEL_18:
    _Block_release(a2);
    __break(1u);
LABEL_19:
    _Block_release(a2);
    __break(1u);
    return;
  }
  id v21 = [v20 backgroundColor];

  if (!v21
    || (double v22 = (CGColor *)[v21 CGColor], v21, !v22))
  {
    id v23 = [self systemBackgroundColor];
    double v22 = (CGColor *)[v23 CGColor];
  }
  CGContextSetFillColorWithColor(v17, v22);

  v30.origin.x = v6;
  v30.origin.y = v8;
  v30.size.width = v10;
  v30.size.height = v12;
  CGContextFillRect(v17, v30);
  uint64_t v24 = swift_unknownObjectWeakLoadStrong();
  if (!v24) {
    goto LABEL_19;
  }
  id v25 = (void *)v24;
  unsigned __int8 v26 = sub_3C878();

  if (v26) {
    id v27 = UIGraphicsGetImageFromCurrentImageContext();
  }
  else {
    id v27 = 0;
  }
  UIGraphicsEndImageContext();
  ((void (**)(void, UIImage *))a2)[2](a2, v27);
}

void sub_31584()
{
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController__willReleaseToSendOrCancel) & 1) == 0)
  {
    id v1 = sub_2E48C();
    [v1 stopRecording];

    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v3 = Strong;
      [Strong setTimeControllerState:0];
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_31620()
{
  int v1 = *(unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController__willReleaseToSendOrCancel);
  *(unsigned char *)(v0 + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController__willReleaseToSendOrCancel) = 0;
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v3 = Strong;
  [Strong reset];

  unint64_t v4 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v4)
  {
LABEL_9:
    __break(1u);
    return;
  }
  double v5 = v4;
  [v4 requestPresentationStyle:0];

  if (v1)
  {
    id v6 = sub_2E48C();
    [v6 sendAudioMessage];
  }
}

uint64_t sub_316F8(uint64_t a1)
{
  uint64_t v2 = sub_305B8((uint64_t *)&unk_82B00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_31758(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_305B8((uint64_t *)&unk_82B00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_317C0()
{
  if (*(void *)(v0 + 56)) {
    sub_31810(v0 + 32);
  }

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_31810(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_31860(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_305B8((uint64_t *)&unk_82B00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_318C8()
{
  sub_300B8(*(void **)(v0 + 16), *(void **)(v0 + 24), v0 + 32);
}

uint64_t sub_318D4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_318E4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_3190C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_3191C()
{
  return swift_release();
}

void *sub_31924(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_31968()
{
  unint64_t result = qword_82688;
  if (!qword_82688)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_82688);
  }
  return result;
}

uint64_t sub_319A8()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_319E0()
{
  sub_2F230((uint64_t)[*(id *)(v0 + 16) presentationStyle]);
}

uint64_t sub_31A14()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_31A24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_31A84(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for UIUserInterfaceStyle(uint64_t a1)
{
}

void sub_31ABC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t static ShapeView.layerClass.getter()
{
  return sub_33F38(0, &qword_826B8);
}

uint64_t ShapeView.shapeLayer.getter()
{
  id v1 = [v0 layer];
  self;

  return swift_dynamicCastObjCClassUnconditional();
}

void ShapeView.path.getter()
{
  id v1 = [v0 layer];
  self;
  id v2 = [(id)swift_dynamicCastObjCClassUnconditional() path];

  if (v2)
  {
    id v3 = [v0 layer];
    self;
    id v4 = [(id)swift_dynamicCastObjCClassUnconditional() path];

    if (v4)
    {
      [self bezierPathWithCGPath:v4];
    }
    else
    {
      __break(1u);
    }
  }
}

void ShapeView.path.setter(void *a1)
{
}

void (*ShapeView.path.modify(void *a1))(void **a1, char a2)
{
  a1[1] = v1;
  ShapeView.path.getter();
  *a1 = v3;
  return sub_31D78;
}

void sub_31D78(void **a1, char a2)
{
}

void ShapeView.fillColor.getter()
{
}

void ShapeView.fillColor.setter(void *a1)
{
}

void (*ShapeView.fillColor.modify(void *a1))(void **a1, char a2)
{
  a1[1] = v1;
  ShapeView.fillColor.getter();
  *a1 = v3;
  return sub_31DF4;
}

void sub_31DF4(void **a1, char a2)
{
}

void ShapeView.fillRule.getter(uint64_t a1@<X8>)
{
  id v3 = [v1 layer];
  self;
  id v21 = [(id)swift_dynamicCastObjCClassUnconditional() fillRule];

  uint64_t v4 = sub_467B0();
  uint64_t v6 = v5;
  if (v4 == sub_467B0() && v6 == v7) {
    goto LABEL_12;
  }
  char v9 = sub_46A60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
LABEL_13:
    uint64_t v16 = enum case for CGPathFillRule.evenOdd(_:);
    uint64_t v17 = sub_466F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 104))(a1, v16, v17);

    return;
  }
  uint64_t v10 = sub_467B0();
  uint64_t v12 = v11;
  if (v10 == sub_467B0() && v12 == v13)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v15 = sub_46A60();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      sub_469F0();
      __break(1u);
LABEL_12:
      swift_bridgeObjectRelease_n();
      goto LABEL_13;
    }
  }
  uint64_t v18 = enum case for CGPathFillRule.winding(_:);
  uint64_t v19 = sub_466F0();
  id v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104);

  v20(a1, v18, v19);
}

uint64_t ShapeView.fillRule.setter(uint64_t a1)
{
  id v2 = v1;
  uint64_t v4 = sub_466F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for CGPathFillRule.winding(_:))
  {
    char v9 = &kCAFillRuleNonZero;
LABEL_5:
    id v10 = [v2 layer];
    self;
    [(id)swift_dynamicCastObjCClassUnconditional() setFillRule:*v9];

    return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  if (v8 == enum case for CGPathFillRule.evenOdd(_:))
  {
    char v9 = &kCAFillRuleEvenOdd;
    goto LABEL_5;
  }
  uint64_t result = sub_469F0();
  __break(1u);
  return result;
}

void (*ShapeView.fillRule.modify(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = sub_466F0();
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  uint64_t v7 = malloc(v6);
  v3[4] = v7;
  ShapeView.fillRule.getter((uint64_t)v7);
  return sub_3231C;
}

void sub_3231C(uint64_t a1, char a2)
{
  id v2 = *(void **)a1;
  id v3 = *(void **)(*(void *)a1 + 24);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    uint64_t v5 = v2[1];
    uint64_t v6 = v2[2];
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 24), v4, v5);
    ShapeView.fillRule.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    ShapeView.fillRule.setter(*(void *)(*(void *)a1 + 32));
  }
  free(v4);
  free(v3);

  free(v2);
}

void ShapeView.strokeColor.getter()
{
}

void sub_323DC(SEL *a1)
{
  id v3 = [v1 layer];
  self;
  id v4 = [(id)swift_dynamicCastObjCClassUnconditional() *a1];

  if (v4)
  {
    id v5 = [v1 layer];
    self;
    id v6 = [(id)swift_dynamicCastObjCClassUnconditional() *a1];

    if (v6)
    {
      [objc_allocWithZone((Class)UIColor) initWithCGColor:v6];
    }
    else
    {
      __break(1u);
    }
  }
}

void ShapeView.strokeColor.setter(void *a1)
{
}

void sub_32508(void *a1, SEL *a2, SEL *a3)
{
  id v6 = [v3 layer];
  self;
  uint64_t v7 = (void *)swift_dynamicCastObjCClassUnconditional();
  if (a1) {
    id v8 = [a1 *a2];
  }
  else {
    id v8 = 0;
  }
  objc_msgSend(v7, *a3, v8);
}

void (*ShapeView.strokeColor.modify(void *a1))(void **a1, char a2)
{
  a1[1] = v1;
  ShapeView.strokeColor.getter();
  *a1 = v3;
  return sub_3261C;
}

void sub_3261C(void **a1, char a2)
{
}

void sub_32630(void **a1, char a2, SEL *a3, SEL *a4)
{
  id v6 = *a1;
  uint64_t v7 = a1[1];
  if (a2)
  {
    id v8 = v6;
    id v12 = [v7 layer];
    self;
    char v9 = (void *)swift_dynamicCastObjCClassUnconditional();
    if (v6) {
      id v10 = [v8 *a3];
    }
    else {
      id v10 = 0;
    }
    objc_msgSend(v9, *a4, v10);
  }
  else
  {
    id v12 = [a1[1] layer];
    self;
    uint64_t v11 = (void *)swift_dynamicCastObjCClassUnconditional();
    if (v6) {
      id v10 = [v6 *a3];
    }
    else {
      id v10 = 0;
    }
    objc_msgSend(v11, *a4, v10);
    id v8 = v6;
  }
}

double ShapeView.strokeStart.getter()
{
  return sub_331B8((SEL *)&selRef_strokeStart);
}

void ShapeView.strokeStart.setter(double a1)
{
}

void (*ShapeView.strokeStart.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  a1[1] = v1;
  id v3 = [v1 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() strokeStart];
  uint64_t v5 = v4;

  *a1 = v5;
  return sub_3284C;
}

void sub_3284C(uint64_t a1, uint64_t a2)
{
}

double ShapeView.strokeEnd.getter()
{
  return sub_331B8((SEL *)&selRef_strokeEnd);
}

void ShapeView.strokeEnd.setter(double a1)
{
}

void (*ShapeView.strokeEnd.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  a1[1] = v1;
  id v3 = [v1 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() strokeEnd];
  uint64_t v5 = v4;

  *a1 = v5;
  return sub_32910;
}

void sub_32910(uint64_t a1, uint64_t a2)
{
}

double ShapeView.lineWidth.getter()
{
  return sub_331B8((SEL *)&selRef_lineWidth);
}

void ShapeView.lineWidth.setter(double a1)
{
}

void (*ShapeView.lineWidth.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  a1[1] = v1;
  id v3 = [v1 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() lineWidth];
  uint64_t v5 = v4;

  *a1 = v5;
  return sub_329D4;
}

void sub_329D4(uint64_t a1, uint64_t a2)
{
}

uint64_t ShapeView.lineCap.getter()
{
  id v1 = [v0 layer];
  self;
  id v2 = [(id)swift_dynamicCastObjCClassUnconditional() lineCap];

  uint64_t v3 = sub_467B0();
  uint64_t v5 = v4;
  if (v3 == sub_467B0() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  char v8 = sub_46A60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_15:

    return 0;
  }
  uint64_t v9 = sub_467B0();
  uint64_t v11 = v10;
  if (v9 == sub_467B0() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  char v14 = sub_46A60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
LABEL_18:

    return 1;
  }
  uint64_t v15 = sub_467B0();
  uint64_t v17 = v16;
  if (v15 == sub_467B0() && v17 == v18)
  {

    uint64_t v19 = 2;
    swift_bridgeObjectRelease_n();
    return v19;
  }
  char v21 = sub_46A60();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21) {
    return 2;
  }
  uint64_t result = sub_469F0();
  __break(1u);
  return result;
}

void ShapeView.lineCap.setter(unsigned int a1)
{
  if (a1 >= 3)
  {
    sub_469F0();
    __break(1u);
  }
  else
  {
    id v2 = *(&off_6DF28 + (int)a1);
    id v3 = [v1 layer];
    self;
    [(id)swift_dynamicCastObjCClassUnconditional() setLineCap:*v2];
  }
}

void (*ShapeView.lineCap.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(_DWORD *)(a1 + 8) = ShapeView.lineCap.getter();
  return sub_32D3C;
}

void sub_32D3C(uint64_t a1)
{
}

uint64_t ShapeView.lineJoin.getter()
{
  id v1 = [v0 layer];
  self;
  id v2 = [(id)swift_dynamicCastObjCClassUnconditional() lineJoin];

  uint64_t v3 = sub_467B0();
  uint64_t v5 = v4;
  if (v3 == sub_467B0() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  char v8 = sub_46A60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_15:

    return 0;
  }
  uint64_t v9 = sub_467B0();
  uint64_t v11 = v10;
  if (v9 == sub_467B0() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  char v14 = sub_46A60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
LABEL_18:

    return 1;
  }
  uint64_t v15 = sub_467B0();
  uint64_t v17 = v16;
  if (v15 == sub_467B0() && v17 == v18)
  {

    uint64_t v19 = 2;
    swift_bridgeObjectRelease_n();
    return v19;
  }
  char v21 = sub_46A60();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21) {
    return 2;
  }
  uint64_t result = sub_469F0();
  __break(1u);
  return result;
}

void ShapeView.lineJoin.setter(unsigned int a1)
{
  if (a1 >= 3)
  {
    sub_469F0();
    __break(1u);
  }
  else
  {
    id v2 = *(&off_6DF40 + (int)a1);
    id v3 = [v1 layer];
    self;
    [(id)swift_dynamicCastObjCClassUnconditional() setLineJoin:*v2];
  }
}

void (*ShapeView.lineJoin.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(_DWORD *)(a1 + 8) = ShapeView.lineJoin.getter();
  return sub_330C0;
}

void sub_330C0(uint64_t a1)
{
}

double ShapeView.miterLimit.getter()
{
  return sub_331B8((SEL *)&selRef_miterLimit);
}

void ShapeView.miterLimit.setter(double a1)
{
}

void (*ShapeView.miterLimit.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  a1[1] = v1;
  id v3 = [v1 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() miterLimit];
  uint64_t v5 = v4;

  *a1 = v5;
  return sub_331A0;
}

void sub_331A0(uint64_t a1, uint64_t a2)
{
}

double ShapeView.lineDashPhase.getter()
{
  return sub_331B8((SEL *)&selRef_lineDashPhase);
}

double sub_331B8(SEL *a1)
{
  id v3 = [v1 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() *a1];
  double v5 = v4;

  return v5;
}

void ShapeView.lineDashPhase.setter(double a1)
{
}

void sub_33240(SEL *a1, double a2)
{
  id v5 = [v2 layer];
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), *a1, a2);
}

void (*ShapeView.lineDashPhase.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  a1[1] = v1;
  id v3 = [v1 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() lineDashPhase];
  uint64_t v5 = v4;

  *a1 = v5;
  return sub_33374;
}

void sub_33374(uint64_t a1, uint64_t a2)
{
}

void sub_33380(uint64_t a1, uint64_t a2, SEL *a3)
{
  double v4 = *(double *)a1;
  id v5 = [*(id *)(a1 + 8) layer];
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), *a3, v4);
}

void *ShapeView.lineDashPattern.getter()
{
  id v1 = [v0 layer];
  self;
  id v2 = [(id)swift_dynamicCastObjCClassUnconditional() lineDashPattern];

  if (!v2) {
    return v2;
  }
  sub_33F38(0, &qword_826C0);
  unint64_t v3 = sub_46820();

  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_46A00();
  swift_bridgeObjectRelease();
  if (!v4)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
LABEL_4:
  uint64_t result = (void *)sub_33F74(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = 0;
    id v2 = _swiftEmptyArrayStorage;
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v7 = (id)sub_46960();
      }
      else {
        id v7 = *(id *)(v3 + 8 * v6 + 32);
      }
      char v8 = v7;
      [v7 doubleValue];
      uint64_t v10 = v9;

      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_33F74(v11 > 1, v12 + 1, 1);
      }
      ++v6;
      _swiftEmptyArrayStorage[2] = v12 + 1;
      _swiftEmptyArrayStorage[v12 + 4] = v10;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    return v2;
  }
  __break(1u);
  return result;
}

void ShapeView.lineDashPattern.setter(uint64_t a1)
{
  if (a1)
  {
    id v3 = [v1 layer];
    self;
    uint64_t v4 = (void *)swift_dynamicCastObjCClassUnconditional();
    uint64_t v5 = *(void *)(a1 + 16);
    if (v5)
    {
      sub_469B0();
      uint64_t v6 = 0;
      do
      {
        uint64_t v7 = v6 + 1;
        [objc_allocWithZone((Class)NSNumber) initWithDouble:*(double *)(a1 + 8 * v6 + 32)];
        sub_46990();
        sub_469C0();
        sub_469D0();
        sub_469A0();
        uint64_t v6 = v7;
      }
      while (v5 != v7);
    }
    swift_bridgeObjectRelease();
    sub_33F38(0, &qword_826C0);
    Class isa = sub_46810().super.isa;
    swift_bridgeObjectRelease();
    [v4 setLineDashPattern:isa];
  }
  else
  {
    Class isa = (Class)[v1 layer];
    self;
    [(id)swift_dynamicCastObjCClassUnconditional() setLineDashPattern:0];
  }
}

void (*ShapeView.lineDashPattern.modify(void *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = ShapeView.lineDashPattern.getter();
  return sub_33844;
}

void sub_33844(uint64_t *a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = swift_bridgeObjectRetain();
    ShapeView.lineDashPattern.setter(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    ShapeView.lineDashPattern.setter(*a1);
  }
}

id ShapeView.action(for:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v7 = a2 == 1752457584 && a3 == 0xE400000000000000;
  if (v7
    || (sub_46A60() & 1) != 0
    || a2 == 0x6F6C6F436C6C6966 && a3 == 0xE900000000000072
    || (sub_46A60() & 1) != 0
    || a2 == 0x6F43656B6F727473 && a3 == 0xEB00000000726F6CLL
    || (sub_46A60() & 1) != 0
    || a2 == 0x7453656B6F727473 && a3 == 0xEB00000000747261
    || (sub_46A60() & 1) != 0
    || a2 == 0x6E45656B6F727473 && a3 == 0xE900000000000064
    || (sub_46A60() & 1) != 0
    || a2 == 0x74646957656E696CLL && a3 == 0xE900000000000068
    || (sub_46A60() & 1) != 0
    || a2 == 0x6D694C726574696DLL && a3 == 0xEA00000000007469
    || (sub_46A60() & 1) != 0
    || a2 == 0x68736144656E696CLL && a3 == 0xED00006573616850
    || (sub_46A60() & 1) != 0)
  {
    NSString v8 = sub_467A0();
    v15.receiver = v3;
    v15.super_class = (Class)type metadata accessor for ShapeView();
    id v9 = objc_msgSendSuper2(&v15, "actionForLayer:forKey:", a1, v8);

    id v10 = [v3 layer];
    self;
    unint64_t v11 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v12 = sub_4037C(a2, a3, v11, (uint64_t)v9);
    swift_unknownObjectRelease();
  }
  else
  {
    NSString v14 = sub_467A0();
    v16.receiver = v3;
    v16.super_class = (Class)type metadata accessor for ShapeView();
    id v12 = objc_msgSendSuper2(&v16, "actionForLayer:forKey:", a1, v14);
  }
  return v12;
}

id ShapeView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, "initWithFrame:", a1, a2, a3, a4);
}

id ShapeView.init(frame:)(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for ShapeView();
  return objc_msgSendSuper2(&v10, "initWithFrame:", a1, a2, a3, a4);
}

id ShapeView.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id ShapeView.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ShapeView();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id ShapeView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShapeView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_33F38(uint64_t a1, unint64_t *a2)
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

uint64_t sub_33F74(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_33FD8(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t type metadata accessor for ShapeView()
{
  return self;
}

uint64_t sub_33FB8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_34138(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_33FD8(char a1, int64_t a2, char a3, char *a4)
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
    sub_305B8(&qword_826F0);
    objc_super v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    objc_super v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  NSString v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_46A40();
  __break(1u);
  return result;
}

uint64_t sub_34138(char a1, int64_t a2, char a3, char *a4)
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
    sub_305B8(&qword_82AD0);
    objc_super v10 = (char *)swift_allocObject();
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
    objc_super v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  NSString v14 = a4 + 32;
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
  uint64_t result = sub_46A40();
  __break(1u);
  return result;
}

void ShadowView.shadowPath.getter()
{
  id v1 = [v0 layer];
  id v2 = [v1 shadowPath];

  if (v2)
  {
    id v3 = [v0 layer];
    id v4 = [v3 shadowPath];

    if (v4)
    {
      [self bezierPathWithCGPath:v4];
    }
    else
    {
      __break(1u);
    }
  }
}

void ShadowView.shadowPath.setter(void *a1)
{
}

void (*ShadowView.shadowPath.modify(void *a1))(void **a1, char a2)
{
  a1[1] = v1;
  ShadowView.shadowPath.getter();
  *a1 = v3;
  return sub_343E0;
}

void sub_343E0(void **a1, char a2)
{
}

void ShadowView.shadowColor.getter()
{
  id v1 = [v0 layer];
  id v2 = [v1 shadowColor];

  if (v2)
  {
    id v3 = [v0 layer];
    id v4 = [v3 shadowColor];

    if (v4)
    {
      [objc_allocWithZone((Class)UIColor) initWithCGColor:v4];
    }
    else
    {
      __break(1u);
    }
  }
}

void ShadowView.shadowColor.setter(void *a1)
{
}

void sub_344DC(void *a1, SEL *a2, SEL *a3)
{
  id v6 = [v3 layer];
  if (a1) {
    id v7 = [a1 *a2];
  }
  else {
    id v7 = 0;
  }
  objc_msgSend(v6, *a3, v7);
}

void (*ShadowView.shadowColor.modify(void *a1))(void **a1, char a2)
{
  a1[1] = v1;
  ShadowView.shadowColor.getter();
  *a1 = v3;
  return sub_345C8;
}

void sub_345C8(void **a1, char a2)
{
}

void sub_345DC(void **a1, char a2, SEL *a3, SEL *a4)
{
  id v6 = *a1;
  id v7 = a1[1];
  if (a2)
  {
    id v8 = v6;
    id v9 = [v7 layer];
    id v12 = v9;
    if (v6)
    {
      id v10 = [v8 *a3];
      id v9 = v12;
    }
    else
    {
      id v10 = 0;
    }
    objc_msgSend(v9, *a4, v10);
  }
  else
  {
    id v11 = [a1[1] layer];
    id v12 = v11;
    if (v6)
    {
      id v10 = [v6 *a3];
      id v11 = v12;
    }
    else
    {
      id v10 = 0;
    }
    objc_msgSend(v11, *a4, v10);
    id v8 = v6;
  }
}

double ShadowView.shadowOpacity.getter()
{
  id v1 = [v0 layer];
  [v1 shadowOpacity];
  float v3 = v2;

  return v3;
}

void ShadowView.shadowOpacity.setter(double a1)
{
  id v4 = [v1 layer];
  *(float *)&double v3 = a1;
  [v4 setShadowOpacity:v3];
}

void (*ShadowView.shadowOpacity.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)(a1 + 8) = v1;
  id v3 = [v1 layer];
  [v3 shadowOpacity];
  float v5 = v4;

  *(double *)a1 = v5;
  return sub_34830;
}

void sub_34830(uint64_t a1)
{
  double v1 = *(double *)a1;
  id v3 = [*(id *)(a1 + 8) layer];
  *(float *)&double v2 = v1;
  [v3 setShadowOpacity:v2];
}

double ShadowView.shadowOffset.getter()
{
  id v1 = [v0 layer];
  [v1 shadowOffset];
  double v3 = v2;

  return v3;
}

void ShadowView.shadowOffset.setter(double a1, double a2)
{
  id v5 = [v2 layer];
  objc_msgSend(v5, "setShadowOffset:", a1, a2);
}

void (*ShadowView.shadowOffset.modify(void *a1))(uint64_t a1)
{
  a1[2] = v1;
  id v3 = [v1 layer];
  [v3 shadowOffset];
  uint64_t v5 = v4;
  uint64_t v7 = v6;

  *a1 = v5;
  a1[1] = v7;
  return sub_349EC;
}

void sub_349EC(uint64_t a1)
{
  double v1 = *(double *)a1;
  double v2 = *(double *)(a1 + 8);
  id v3 = [*(id *)(a1 + 16) layer];
  objc_msgSend(v3, "setShadowOffset:", v1, v2);
}

double ShadowView.shadowRadius.getter()
{
  id v1 = [v0 layer];
  [v1 shadowRadius];
  double v3 = v2;

  return v3;
}

void ShadowView.shadowRadius.setter(double a1)
{
  id v3 = [v1 layer];
  [v3 setShadowRadius:a1];
}

void (*ShadowView.shadowRadius.modify(void *a1))(uint64_t a1)
{
  a1[1] = v1;
  id v3 = [v1 layer];
  [v3 shadowRadius];
  uint64_t v5 = v4;

  *a1 = v5;
  return sub_34B98;
}

void sub_34B98(uint64_t a1)
{
  double v1 = *(double *)a1;
  id v2 = [*(id *)(a1 + 8) layer];
  [v2 setShadowRadius:v1];
}

id ShadowView.action(for:forKey:)(void *a1, uint64_t a2, uint64_t a3)
{
  BOOL v7 = a2 == 0x6150776F64616873 && a3 == 0xEA00000000006874;
  if (v7
    || (sub_46A60() & 1) != 0
    || a2 == 0x6F43776F64616873 && a3 == 0xEB00000000726F6CLL
    || (sub_46A60() & 1) != 0
    || a2 == 0x664F776F64616873 && a3 == 0xEC00000074657366
    || (sub_46A60() & 1) != 0
    || a2 == 0x704F776F64616873 && a3 == 0xED00007974696361
    || (sub_46A60() & 1) != 0
    || a2 == 0x6152776F64616873 && a3 == 0xEC00000073756964
    || (sub_46A60() & 1) != 0)
  {
    NSString v8 = sub_467A0();
    v13.receiver = v3;
    v13.super_class = (Class)type metadata accessor for ShadowView();
    id v9 = objc_msgSendSuper2(&v13, "actionForLayer:forKey:", a1, v8);

    id v10 = sub_4037C(a2, a3, a1, (uint64_t)v9);
    swift_unknownObjectRelease();
  }
  else
  {
    NSString v12 = sub_467A0();
    v14.receiver = v3;
    v14.super_class = (Class)type metadata accessor for ShadowView();
    id v10 = objc_msgSendSuper2(&v14, "actionForLayer:forKey:", a1, v12);
  }
  return v10;
}

uint64_t type metadata accessor for ShadowView()
{
  return self;
}

id ShadowView.init(frame:)(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for ShadowView();
  return objc_msgSendSuper2(&v10, "initWithFrame:", a1, a2, a3, a4);
}

id ShadowView.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ShadowView();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id ShadowView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShadowView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_351E8(void *a1, void *a2, double a3)
{
  BOOL v7 = &v3[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_radius];
  *(void *)BOOL v7 = 0;
  v7[8] = 1;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_fillColor] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_parentView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleWidthAnchor] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleHeightAnchor] = 0;
  v41.receiver = v3;
  v41.super_class = (Class)type metadata accessor for AMWavePulsingView();
  id v8 = objc_msgSendSuper2(&v41, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  id v9 = self;
  objc_super v10 = (char *)v8;
  id v11 = [v9 clearColor];
  [v10 setBackgroundColor:v11];

  NSString v12 = (double *)&v10[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_radius];
  *NSString v12 = a3;
  *((unsigned char *)v12 + 8) = 0;
  objc_super v13 = *(void **)&v10[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_fillColor];
  *(void *)&v10[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_fillColor] = a1;
  id v14 = a1;

  uint64_t v15 = OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_parentView;
  objc_super v16 = *(void **)&v10[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_parentView];
  *(void *)&v10[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_parentView] = a2;
  id v17 = a2;

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v18 = *(void **)&v10[v15];
  if (!v18)
  {
    __break(1u);
    goto LABEL_6;
  }
  [v18 insertSubview:v10 atIndex:0];
  id v19 = [v10 widthAnchor];
  double v20 = a3 + a3;
  id v21 = [v19 constraintEqualToConstant:v20];

  uint64_t v22 = OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleWidthAnchor;
  id v23 = *(void **)&v10[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleWidthAnchor];
  *(void *)&v10[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleWidthAnchor] = v21;

  id v24 = [v10 heightAnchor];
  id v25 = [v24 constraintEqualToConstant:v20];

  uint64_t v26 = OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleHeightAnchor;
  id v27 = *(void **)&v10[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleHeightAnchor];
  *(void *)&v10[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleHeightAnchor] = v25;

  sub_305B8(&qword_827C0);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_630F0;
  id v29 = [v10 centerXAnchor];
  id v30 = [v17 centerXAnchor];
  id v31 = [v29 constraintEqualToAnchor:v30];

  *(void *)(v28 + 32) = v31;
  id v32 = [v10 centerYAnchor];
  id v33 = [v17 centerYAnchor];
  id v34 = [v32 constraintEqualToAnchor:v33];

  *(void *)(v28 + 40) = v34;
  double v35 = *(void **)&v10[v22];
  if (!v35)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  *(void *)(v28 + 48) = v35;
  double v36 = *(void **)&v10[v26];
  if (v36)
  {
    double v37 = self;
    *(void *)(v28 + 56) = v36;
    sub_46830();
    sub_35708();
    id v38 = v35;
    id v39 = v36;
    Class isa = sub_46810().super.isa;
    swift_bridgeObjectRelease();
    [v37 activateConstraints:isa];

    return;
  }
LABEL_7:
  __break(1u);
}

id sub_355B4(void *a1)
{
  [a1 setAlpha:0.1];

  return [a1 layoutIfNeeded];
}

id sub_35604(int a1, id a2)
{
  return [a2 removeFromSuperview];
}

id sub_35644()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMWavePulsingView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AMWavePulsingView()
{
  return self;
}

unint64_t sub_35708()
{
  unint64_t result = qword_82770;
  if (!qword_82770)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_82770);
  }
  return result;
}

void sub_35748()
{
  double v1 = &v0[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_radius];
  *(void *)double v1 = 0;
  v1[8] = 1;
  *(void *)&v0[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_fillColor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_parentView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleWidthAnchor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleHeightAnchor] = 0;

  sub_469F0();
  __break(1u);
}

BOOL sub_357F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_35804()
{
  Swift::UInt v1 = *v0;
  sub_46A90();
  sub_46AA0(v1);
  return sub_46AB0();
}

void sub_3584C()
{
  sub_46AA0(*v0);
}

Swift::Int sub_35878()
{
  Swift::UInt v1 = *v0;
  sub_46A90();
  sub_46AA0(v1);
  return sub_46AB0();
}

uint64_t sub_358BC()
{
  return *(void *)&aReady_0[8 * *v0];
}

uint64_t AudioRecorder.delegate.getter()
{
  return sub_37174();
}

uint64_t AudioRecorder.delegate.setter(uint64_t a1, uint64_t a2)
{
  return sub_371CC(a1, a2, &OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_delegate);
}

uint64_t (*AudioRecorder.delegate.modify(void *a1))()
{
  id v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_delegate;
  void v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return sub_35980;
}

unint64_t AudioRecorder.power.getter()
{
  uint64_t v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_power);
  swift_beginAccess();
  return *v1 | ((unint64_t)*((unsigned __int8 *)v1 + 4) << 32);
}

uint64_t AudioRecorder.power.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_power;
  uint64_t result = swift_beginAccess();
  *(_DWORD *)uint64_t v3 = a1;
  *(unsigned char *)(v3 + 4) = BYTE4(a1) & 1;
  return result;
}

uint64_t (*AudioRecorder.power.modify())()
{
  return j__swift_endAccess;
}

Swift::Float __swiftcall AudioRecorder.intensity(power:)(Swift::Float power)
{
  return (float)(power + 60.0) / 50.0;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AudioRecorder.start(transcribe:)(Swift::Bool transcribe)
{
  uint64_t v2 = v1 + OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_power;
  swift_beginAccess();
  *(_DWORD *)uint64_t v2 = 0;
  *(unsigned char *)(v2 + 4) = 1;
}

uint64_t sub_35B10()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_power;
  uint64_t result = swift_beginAccess();
  *(_DWORD *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 4) = 1;
  return result;
}

id AudioRecorder.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id AudioRecorder.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  id v1 = &v0[OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_power];
  *(_DWORD *)id v1 = 0;
  v1[4] = 1;
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for AudioRecorder();
  return objc_msgSendSuper2(&v3, "init");
}

uint64_t type metadata accessor for AudioRecorder()
{
  return self;
}

id AudioRecorder.__deallocating_deinit(uint64_t a1)
{
  return sub_37080(a1, type metadata accessor for AudioRecorder);
}

uint64_t sub_35CB4()
{
  return _swift_deallocClassInstance(v0, 33, 7);
}

id sub_35CEC()
{
  type metadata accessor for ShapeView();
  id v0 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  id v1 = [v0 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() setStrokeColor:0];

  id v2 = [self redColor];
  id v3 = [v0 layer];
  self;
  uint64_t v4 = (void *)swift_dynamicCastObjCClassUnconditional();
  if (v2) {
    id v5 = [v2 CGColor];
  }
  else {
    id v5 = 0;
  }
  [v4 setFillColor:v5];

  return v0;
}

id sub_35E34()
{
  sub_467B0();
  id v0 = objc_allocWithZone((Class)CAFilter);
  NSString v1 = sub_467A0();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithType:v1];

  Class isa = sub_46870().super.super.isa;
  NSString v4 = sub_467A0();
  [v2 setValue:isa forKey:v4];

  Class v5 = sub_46860().super.super.isa;
  NSString v6 = sub_467A0();
  [v2 setValue:v5 forKey:v6];

  sub_467B0();
  id v7 = objc_allocWithZone((Class)CAFilter);
  NSString v8 = sub_467A0();
  swift_bridgeObjectRelease();
  id v9 = [v7 initWithType:v8];

  Class v10 = sub_46870().super.super.isa;
  NSString v11 = sub_467A0();
  [v9 setValue:v10 forKey:v11];

  type metadata accessor for BackdropView();
  id v12 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  id v13 = [v12 layer];
  sub_305B8(&qword_82AD0);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_63140;
  uint64_t v15 = sub_33F38(0, &qword_82AD8);
  *(void *)(v14 + 32) = v9;
  *(void *)(v14 + 88) = v15;
  *(void *)(v14 + 56) = v15;
  *(void *)(v14 + 64) = v2;
  id v16 = v9;
  id v17 = v2;
  Class v18 = sub_46810().super.isa;
  swift_bridgeObjectRelease();
  [v13 setFilters:v18];

  id v19 = v12;
  id v20 = [v19 traitCollection];
  id v21 = (char *)[v20 userInterfaceStyle];

  if (v21 == (unsigned char *)&def_3AC7C + 2)
  {
    id v22 = [self effectWithStyle:9];
    id v23 = [objc_allocWithZone((Class)UIVisualEffectView) initWithEffect:v22];
    [v19 addSubview:v23];
  }
  return v19;
}

id sub_3617C()
{
  id v0 = [objc_allocWithZone((Class)UILabel) init];
  NSString v1 = self;
  id v2 = [v0 traitCollection];
  id v3 = [v1 preferredFontForTextStyle:UIFontTextStyleFootnote compatibleWithTraitCollection:v2];

  id v4 = v3;
  [v4 pointSize];
  id v5 = v4;
  if (v6 < 13.0)
  {
    id v5 = [v4 fontWithSize:13.0];
  }
  [v0 setFont:v5];
  [v0 setAdjustsFontSizeToFitWidth:1];
  [v0 setTextAlignment:1];
  [v0 setNumberOfLines:2];
  [v0 setLineBreakMode:4];

  return v0;
}

char *sub_362D4(double a1, double a2, double a3, double a4)
{
  id v9 = &v4[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_textInset];
  *id v9 = xmmword_63150;
  v9[1] = xmmword_63160;
  *(_OWORD *)&v4[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_arrowSize] = xmmword_63170;
  *(void *)&v4[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_maxWidth] = 0x7FF0000000000000;
  *(void *)&v4[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_maxHeight] = 0;
  *(void *)&v4[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_cornerRadius] = 0x402E000000000000;
  v4[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_arrowPointingDown] = 1;
  uint64_t v10 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_backdropColor;
  id v11 = objc_allocWithZone((Class)UIColor);
  id v12 = v4;
  *(void *)&v4[v10] = [v11 init];
  id v13 = &v12[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_text];
  *(void *)id v13 = 0;
  *((void *)v13 + 1) = 0;
  uint64_t v14 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_textColor;
  uint64_t v15 = self;
  *(void *)&v12[v14] = [v15 labelColor];
  uint64_t v16 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_shadowColor;
  *(void *)&v12[v16] = [v15 blackColor];
  uint64_t v17 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_shapeView;
  *(void *)&v12[v17] = sub_35CEC();
  uint64_t v18 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_backgroundView;
  *(void *)&v12[v18] = sub_35E34();
  uint64_t v19 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_shadowView;
  type metadata accessor for ShadowView();
  id v20 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  id v21 = [v20 layer];
  LODWORD(v22) = 1028443341;
  [v21 setShadowOpacity:v22];

  id v23 = [v20 layer];
  [v23 setShadowRadius:20.0];

  id v24 = [v20 layer];
  objc_msgSend(v24, "setShadowOffset:", 0.0, 3.0);

  *(void *)&v12[v19] = v20;
  uint64_t v25 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_labelView;
  *(void *)&v12[v25] = sub_3617C();

  v31.receiver = v12;
  v31.super_class = (Class)type metadata accessor for AudioAppContentViewController.CalloutView();
  uint64_t v26 = (char *)objc_msgSendSuper2(&v31, "initWithFrame:", a1, a2, a3, a4);
  uint64_t v27 = *(void *)&v26[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_shadowView];
  uint64_t v28 = v26;
  [v28 addSubview:v27];
  id v29 = *(void **)&v28[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_backgroundView];
  [v28 addSubview:v29];
  [v29 setMaskView:*(void *)&v28[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_shapeView]];
  [v28 addSubview:*(void *)&v28[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_labelView]];

  return v28;
}

void sub_36604()
{
  v57.receiver = v0;
  v57.super_class = (Class)type metadata accessor for AudioAppContentViewController.CalloutView();
  objc_msgSendSuper2(&v57, "layoutSubviews");
  [v0 bounds];
  double Height = CGRectGetHeight(v58);
  id v1 = [objc_allocWithZone((Class)UIBezierPath) init];
  [v0 bounds];
  double MidX = CGRectGetMidX(v59);
  [v0 bounds];
  objc_msgSend(v1, "moveToPoint:", MidX, CGRectGetMinY(v60));
  [v0 bounds];
  CGFloat v3 = CGRectGetMaxX(v61) + -15.0;
  [v0 bounds];
  objc_msgSend(v1, "addLineToPoint:", v3, CGRectGetMinY(v62));
  [v0 bounds];
  CGFloat v4 = CGRectGetMaxX(v63) + -15.0;
  [v0 bounds];
  objc_msgSend(v1, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v4, CGRectGetMinY(v64) + 15.0, 15.0, 4.71238898, 0.0);
  [v0 bounds];
  CGFloat v5 = CGRectGetMaxY(v65) + -5.0;
  [v0 bounds];
  objc_msgSend(v1, "addLineToPoint:", CGRectGetMaxX(v66), v5 + -15.0);
  [v0 bounds];
  CGFloat v6 = CGRectGetMaxX(v67) + -15.0;
  [v0 bounds];
  objc_msgSend(v1, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v6, CGRectGetMaxY(v68) + -20.0, 15.0, 0.0, 1.57079633);
  [v0 bounds];
  objc_msgSend(v1, "addLineToPoint:", CGRectGetMidX(v69) + 10.0, v5);
  [v0 bounds];
  double v7 = CGRectGetMidX(v70);
  [v0 bounds];
  double MaxY = CGRectGetMaxY(v71);
  [v0 bounds];
  CGFloat v9 = CGRectGetMidX(v72) + 10.0 + -5.0;
  [v0 bounds];
  CGFloat v10 = CGRectGetMidX(v73) + 2.5;
  [v0 bounds];
  objc_msgSend(v1, "addCurveToPoint:controlPoint1:controlPoint2:", v7, MaxY, v9, v5, v10, CGRectGetMaxY(v74));
  [v0 bounds];
  CGFloat v11 = CGRectGetMidX(v75) + -10.0;
  [v0 bounds];
  CGFloat v12 = CGRectGetMidX(v76) + -2.5;
  [v0 bounds];
  double v13 = CGRectGetMaxY(v77);
  [v0 bounds];
  objc_msgSend(v1, "addCurveToPoint:controlPoint1:controlPoint2:", v11, v5, v12, v13, CGRectGetMidX(v78) + -10.0 + 5.0, v5);
  [v0 bounds];
  objc_msgSend(v1, "addLineToPoint:", CGRectGetMinX(v79) + 15.0, v5);
  [v0 bounds];
  CGFloat v14 = CGRectGetMinX(v80) + 15.0;
  [v0 bounds];
  objc_msgSend(v1, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v14, CGRectGetMaxY(v81) + -20.0, 15.0, 1.57079633, 3.14159265);
  [v0 bounds];
  double MinX = CGRectGetMinX(v82);
  [v0 bounds];
  objc_msgSend(v1, "addLineToPoint:", MinX, CGRectGetMinY(v83) + 15.0);
  [v0 bounds];
  CGFloat v16 = CGRectGetMinX(v84) + 15.0;
  [v0 bounds];
  objc_msgSend(v1, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v16, CGRectGetMinY(v85) + 15.0, 15.0, 3.14159265, 4.71238898);
  [v1 closePath];
  uint64_t v54 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_arrowPointingDown;
  if ((v0[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_arrowPointingDown] & 1) == 0)
  {
    CGAffineTransformMakeScale(&v56, 1.0, -1.0);
    long long v52 = *(_OWORD *)&v56.c;
    long long v53 = *(_OWORD *)&v56.a;
    CGFloat tx = v56.tx;
    CGFloat ty = v56.ty;
    [v1 bounds];
    CGFloat v19 = CGRectGetHeight(v86);
    CGAffineTransformMakeTranslation(&v56, 0.0, v19);
    long long v50 = *(_OWORD *)&v56.c;
    long long v51 = *(_OWORD *)&v56.a;
    CGFloat v20 = v56.tx;
    CGFloat v21 = v56.ty;
    *(_OWORD *)&v56.a = v53;
    *(_OWORD *)&v56.c = v52;
    v56.CGFloat tx = tx;
    v56.CGFloat ty = ty;
    [v1 applyTransform:&v56];
    *(_OWORD *)&v56.a = v51;
    *(_OWORD *)&v56.c = v50;
    v56.CGFloat tx = v20;
    v56.CGFloat ty = v21;
    [v1 applyTransform:&v56];
  }
  id v22 = [v0 traitCollection];
  id v23 = (char *)[v22 userInterfaceStyle];

  if (v23 != (unsigned char *)&def_3AC7C + 2)
  {
    id v24 = [v0 layer];
    LODWORD(v25) = 1063675494;
    [v24 setOpacity:v25];

    id v26 = [v0 layer];
    [v26 setAllowsGroupOpacity:0];
  }
  uint64_t v27 = *(void **)&v0[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_shapeView];
  id v28 = v1;
  id v29 = [v27 layer];
  self;
  id v30 = (void *)swift_dynamicCastObjCClassUnconditional();
  id v31 = [v28 CGPath];
  [v30 setPath:v31];

  id v32 = *(void **)&v0[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_shadowView];
  id v33 = v28;
  id v34 = [v32 layer];
  id v35 = [v33 CGPath];
  [v34 setShadowPath:v35];

  [v0 bounds];
  [v32 bounds];
  objc_msgSend(v32, "setBounds:");
  [v0 bounds];
  double v36 = CGRectGetMidX(v87);
  [v0 bounds];
  objc_msgSend(v32, "setCenter:", v36, CGRectGetMidY(v88));
  id v37 = [v32 layer];
  [v37 setCornerRadius:15.0];

  id v38 = *(void **)&v0[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_backgroundView];
  [v0 bounds];
  [v38 bounds];
  objc_msgSend(v38, "setBounds:");
  [v0 bounds];
  double v39 = CGRectGetMidX(v89);
  [v0 bounds];
  objc_msgSend(v38, "setCenter:", v39, CGRectGetMidY(v90));
  id v40 = [v38 layer];
  [v40 setCornerRadius:15.0];

  [v38 bounds];
  [v27 bounds];
  objc_msgSend(v27, "setBounds:");
  [v38 bounds];
  double v41 = CGRectGetMidX(v91);
  [v38 bounds];
  objc_msgSend(v27, "setCenter:", v41, CGRectGetMidY(v92));
  objc_super v42 = *(void **)&v0[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_labelView];
  [v0 bounds];
  objc_msgSend(v42, "textRectForBounds:limitedToNumberOfLines:", 2, sub_3DA34(v43, v44, v45, v46, 5.0, 14.0));
  [v42 bounds];
  objc_msgSend(v42, "setBounds:");
  LODWORD(v38) = v0[v54];
  [v0 bounds];
  double v47 = (Height + -5.0) * 0.5 + CGRectGetMinY(v93);
  if (v38) {
    double v48 = v47;
  }
  else {
    double v48 = v47 + 5.0;
  }
  [v0 bounds];
  objc_msgSend(v42, "setCenter:", CGRectGetMidX(v94), v48);
  id v49 = [v0 layer];
  objc_msgSend(v49, "setAnchorPoint:", 0.5, 1.0);
}

id sub_36FCC(void *a1, char a2)
{
  int v3 = a2 & 1;
  double v4 = 0.0;
  if (a2) {
    double v4 = 1.0;
  }
  [a1 setAlpha:v4];
  if (v3)
  {
    long long v5 = xmmword_63180;
    long long v6 = xmmword_63190;
    long long v7 = 0uLL;
  }
  else
  {
    CGAffineTransformMakeScale(&v9, 0.01, 0.01);
    long long v6 = *(_OWORD *)&v9.a;
    long long v5 = *(_OWORD *)&v9.c;
    long long v7 = *(_OWORD *)&v9.tx;
  }
  *(_OWORD *)&v9.a = v6;
  *(_OWORD *)&v9.c = v5;
  *(_OWORD *)&v9.CGFloat tx = v7;
  return [a1 setTransform:&v9];
}

id sub_37064()
{
  return sub_37080(0, type metadata accessor for AudioAppContentViewController.CalloutView);
}

id sub_37080(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t AudioAppContentViewController.delegate.getter()
{
  return sub_37174();
}

uint64_t sub_37174()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t AudioAppContentViewController.delegate.setter(uint64_t a1, uint64_t a2)
{
  return sub_371CC(a1, a2, &OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate);
}

uint64_t sub_371CC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = v3 + *a3;
  swift_beginAccess();
  *(void *)(v5 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*AudioAppContentViewController.delegate.modify(void *a1))()
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate;
  void v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return sub_35980;
}

void sub_372BC(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

id AudioAppContentViewController.init(coder:)(void *a1)
{
  id v2 = v1;
  _s22AudioMessagesExtension0A24AppContentViewControllerC6logger33_6C80B9CA6D0C59A10BF4E668E4172F5CLL2os6LoggerVvpfi_0();
  *(void *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v3 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_recorder;
  *(void *)&v2[v3] = [objc_allocWithZone((Class)type metadata accessor for AudioRecorder()) init];
  v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state] = 0;
  v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isFirstStateSet] = 0;
  uint64_t v4 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_ringsContainerView;
  *(void *)&v2[v4] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v44 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_rings;
  sub_305B8(&qword_827C0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_62E20;
  type metadata accessor for AudioAppContentViewController.Ring();
  uint64_t v6 = swift_allocObject();
  type metadata accessor for GradientView();
  uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  id v8 = [objc_allocWithZone(ObjCClassFromMetadata) init];
  CGAffineTransform v9 = kCAGradientLayerRadial;
  id v10 = [v8 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() setType:v9];

  *(void *)(v6 + 16) = v8;
  *(void *)(v6 + 24) = 0;
  *(unsigned char *)(v6 + 32) = 0;
  *(void *)(v5 + 32) = v6;
  uint64_t v11 = swift_allocObject();
  id v12 = [objc_allocWithZone(ObjCClassFromMetadata) init];
  double v13 = v9;
  id v14 = [v12 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() setType:v13];

  *(void *)(v11 + 16) = v12;
  *(void *)(v11 + 24) = 0;
  *(unsigned char *)(v11 + 32) = 0;
  *(void *)(v5 + 40) = v11;
  uint64_t v47 = v5;
  sub_46830();
  *(void *)&v2[v44] = v5;
  *(void *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_bottomMarginForCalloutView] = 0x4031000000000000;
  *(void *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_minimumMarginBetweenButtonAndCalloutView] = 0x4022000000000000;
  v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isButtonsVisible] = 0;
  v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isHelpVisible] = 0;
  uint64_t v15 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpPresentTime];
  *(void *)uint64_t v15 = 0;
  v15[8] = 1;
  CGFloat v16 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpDismissTime];
  *(void *)CGFloat v16 = 0;
  v16[8] = 1;
  uint64_t v17 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpText];
  *uint64_t v17 = 0;
  v17[1] = 0;
  *(void *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpCalloutView] = 0;
  uint64_t v18 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_centerFillView;
  id v19 = [objc_allocWithZone((Class)UIView) init];
  id v20 = [self systemBackgroundColor];
  [v19 setBackgroundColor:v20];

  *(void *)&v2[v18] = v19;
  uint64_t v21 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_centerView;
  *(void *)&v2[v21] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v22 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_iconView;
  id v23 = [objc_allocWithZone((Class)UIImageView) init];
  id v24 = [self configurationWithPointSize:6 weight:-1 scale:34.0];
  [v23 setPreferredSymbolConfiguration:v24];

  *(void *)&v2[v22] = v23;
  v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isPressed] = 0;
  uint64_t v25 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_labelColor;
  *(void *)&v2[v25] = [objc_allocWithZone((Class)UIColor) init];
  uint64_t v26 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_popoverColor;
  *(void *)&v2[v26] = [objc_allocWithZone((Class)UIColor) init];
  uint64_t v27 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_buttonColor;
  *(void *)&v2[v27] = [objc_allocWithZone((Class)UIColor) init];
  id v28 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_recordingStartTime];
  *(void *)id v28 = 0;
  v28[8] = 1;
  v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_hasStartedFirstRecording] = 0;
  id v29 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_ringStartTime];
  *(void *)id v29 = 0;
  v29[8] = 1;
  *(void *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_recordingMinimumDuration] = 0x3FE999999999999ALL;
  v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isCollapsed] = 0;
  id v30 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_collapsedSpring];
  *(_OWORD *)id v30 = xmmword_62E30;
  *((void *)v30 + 3) = 0;
  *((void *)v30 + 4) = 0;
  *((void *)v30 + 2) = 0;
  id v31 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_powerIntensitySpring];
  *(_OWORD *)id v31 = xmmword_62E40;
  *((void *)v31 + 2) = 0;
  *((void *)v31 + 3) = 0;
  *((void *)v31 + 4) = 0;
  uint64_t v32 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_longPressRecognizer;
  *(void *)&v2[v32] = [objc_allocWithZone((Class)UILongPressGestureRecognizer) init];
  *(void *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink] = 0;
  *(void *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_controlDelegate + 8] = 0;
  swift_unknownObjectWeakInit();

  v46.receiver = v2;
  v46.super_class = (Class)type metadata accessor for AudioAppContentViewController();
  id v33 = objc_msgSendSuper2(&v46, "initWithCoder:", a1);
  if (!v33) {
    goto LABEL_5;
  }
  id v34 = self;
  id v35 = (char *)v33;
  id v36 = [v34 displayLinkWithTarget:v35 selector:"displayLinkFiredFrom:"];
  uint64_t v37 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink;
  id v38 = *(void **)&v35[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
  *(void *)&v35[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink] = v36;

  id result = *(id *)&v35[v37];
  if (result)
  {
    id result = [result setPaused:1];
    id v40 = *(void **)&v35[v37];
    if (v40)
    {
      double v41 = self;
      id v42 = v40;
      id v43 = [v41 mainRunLoop];
      [v42 addToRunLoop:v43 forMode:NSRunLoopCommonModes];

LABEL_5:
      return v33;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AudioAppContentViewController.Ring()
{
  return self;
}

Swift::Void __swiftcall AudioAppContentViewController.viewDidLoad()()
{
  uint64_t v1 = v0;
  v31.receiver = v0;
  v31.super_class = (Class)type metadata accessor for AudioAppContentViewController();
  objc_msgSendSuper2(&v31, "viewDidLoad");
  id v2 = [v0 view];
  if (!v2) {
    goto LABEL_21;
  }
  uint64_t v3 = v2;
  [v2 setIsAccessibilityElement:1];

  uint64_t v4 = self;
  [v4 setAnimationsEnabled:0];
  sub_387DC();
  id v5 = [v0 view];
  if (!v5)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_ringsContainerView];
  [v5 addSubview:*(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_ringsContainerView]];

  unint64_t v8 = *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_rings];
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_46A00();
    if (!v9) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (!v9) {
      goto LABEL_12;
    }
  }
  if (v9 < 1)
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  for (uint64_t i = 0; i != v9; ++i)
  {
    if ((v8 & 0xC000000000000001) != 0)
    {
      uint64_t v11 = sub_46960();
    }
    else
    {
      uint64_t v11 = *(void *)(v8 + 8 * i + 32);
      swift_retain();
    }
    [v7 addSubview:*(void *)(v11 + 16)];
    swift_release();
  }
LABEL_12:
  swift_bridgeObjectRelease();
  id v12 = [v1 view];
  if (!v12)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  double v13 = v12;
  [v12 addSubview:*(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_centerFillView]];

  id v14 = [v1 view];
  if (!v14)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v15 = v14;
  [v14 addSubview:*(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_centerView]];

  id v16 = [v1 view];
  if (!v16)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v17 = v16;
  [v16 addSubview:*(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_iconView]];

  uint64_t v18 = *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_recorder]
      + OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_delegate;
  swift_beginAccess();
  *(void *)(v18 + 8) = &protocol witness table for AudioAppContentViewController;
  swift_unknownObjectWeakAssign();
  id v19 = &v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_controlDelegate];
  swift_unknownObjectWeakLoadStrong();
  uint64_t v20 = *((void *)v19 + 1);
  uint64_t v21 = &v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate];
  swift_beginAccess();
  *((void *)v21 + 1) = v20;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  uint64_t v22 = *(void **)&v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_longPressRecognizer];
  [v22 setMinimumPressDuration:0.0];
  [v22 addTarget:v1 action:"longPressFrom:"];
  [v22 setDelegate:v1];
  id v23 = [v1 view];
  if (!v23)
  {
LABEL_26:
    __break(1u);
    return;
  }
  id v24 = v23;
  [v23 addGestureRecognizer:v22];

  sub_3A4C8(0, 0, 0.0);
  uint64_t v25 = v1;
  uint64_t v26 = sub_46710();
  os_log_type_t v27 = sub_468A0();
  if (os_log_type_enabled(v26, v27))
  {
    id v28 = (uint8_t *)swift_slowAlloc();
    id v29 = (void *)swift_slowAlloc();
    *(_DWORD *)id v28 = 138412290;
    id v30 = v25;
    sub_468F0();
    *id v29 = v1;

    _os_log_impl(&def_3AC7C, v26, v27, "%@ view loaded.", v28, 0xCu);
    sub_305B8(&qword_82690);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  [v4 setAnimationsEnabled:1];
}

Swift::Void __swiftcall AudioAppContentViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for AudioAppContentViewController();
  objc_msgSendSuper2(&v4, "viewDidAppear:", a1);
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
  if (v3) {
    [v3 setPaused:0];
  }
}

Swift::Void __swiftcall AudioAppContentViewController.viewWillDisappear(_:)(Swift::Bool a1)
{
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for AudioAppContentViewController();
  objc_msgSendSuper2(&v10, "viewWillDisappear:", a1);
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
  if (v3) {
    [v3 setPaused:1];
  }
  objc_super v4 = v1;
  id v5 = sub_46710();
  os_log_type_t v6 = sub_468A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    unint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    uint64_t v9 = v4;
    sub_468F0();
    *unint64_t v8 = v4;

    _os_log_impl(&def_3AC7C, v5, v6, "%@ view unloaded.", v7, 0xCu);
    sub_305B8(&qword_82690);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

id AudioAppContentViewController.__deallocating_deinit()
{
  id v1 = v0;
  id v2 = sub_46710();
  os_log_type_t v3 = sub_468A0();
  if (os_log_type_enabled(v2, v3))
  {
    objc_super v4 = (uint8_t *)swift_slowAlloc();
    id v5 = (void *)swift_slowAlloc();
    *(_DWORD *)objc_super v4 = 138412290;
    id v6 = v1;
    sub_468F0();
    void *v5 = v1;

    _os_log_impl(&def_3AC7C, v2, v3, "%@ released from memory.", v4, 0xCu);
    sub_305B8(&qword_82690);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for AudioAppContentViewController();
  return objc_msgSendSuper2(&v8, "dealloc");
}

Swift::Void __swiftcall AudioAppContentViewController.willMove(toParent:)(UIViewController_optional toParent)
{
  Class isa = toParent.value.super.super.isa;
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for AudioAppContentViewController();
  objc_msgSendSuper2(&v9, "willMoveToParentViewController:", isa);
  if (!isa)
  {
    uint64_t v3 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink;
    objc_super v4 = *(void **)&v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
    if (v4)
    {
      id v5 = self;
      id v6 = v4;
      id v7 = [v5 mainRunLoop];
      [v6 removeFromRunLoop:v7 forMode:NSRunLoopCommonModes];

      objc_super v8 = *(void **)&v1[v3];
      *(void *)&v1[v3] = 0;
    }
    else
    {
      __break(1u);
    }
  }
}

Swift::Void __swiftcall AudioAppContentViewController.viewWillLayoutSubviews()()
{
  v1.receiver = v0;
  v1.super_class = (Class)type metadata accessor for AudioAppContentViewController();
  objc_msgSendSuper2(&v1, "viewWillLayoutSubviews");
  sub_387DC();
}

Swift::Void __swiftcall AudioAppContentViewController.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  Class isa = a1.value.super.isa;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for AudioAppContentViewController();
  objc_msgSendSuper2(&v8, "traitCollectionDidChange:", isa);
  if (isa) {
    id v3 = [(objc_class *)isa userInterfaceStyle];
  }
  else {
    id v3 = 0;
  }
  id v4 = [v1 traitCollection];
  id v5 = [v4 userInterfaceStyle];

  if (!isa || v3 != v5)
  {
    sub_3B6D4(*((unsigned char *)v1 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state));
    id v6 = [v1 view];
    if (v6)
    {
      id v7 = v6;
      [v6 setNeedsLayout];
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_387DC()
{
  objc_super v1 = v0;
  id v2 = [v0 view];
  if (!v2)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  id v3 = v2;
  [v2 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [v1 view];
  if (!v12)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  double v13 = v12;
  [v12 safeAreaInsets];
  double v15 = v14;
  double v17 = v16;

  v98.origin.CGFloat x = sub_3DA34(v5, v7, v9, v11, v15, v17);
  CGFloat x = v98.origin.x;
  CGFloat y = v98.origin.y;
  CGFloat width = v98.size.width;
  CGFloat height = v98.size.height;
  double MidX = CGRectGetMidX(v98);
  v99.origin.CGFloat x = x;
  v99.origin.CGFloat y = y;
  v99.size.CGFloat width = width;
  v99.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v99);
  id v24 = [objc_allocWithZone((Class)CAShapeLayer) init];
  id v25 = [v1 view];
  if (!v25)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v26 = v25;
  [v25 bounds];
  double v28 = v27;
  double v30 = v29;

  v100.origin.CGFloat x = sub_3DA34(0.0, 0.0, v28, v30, 0.0, 0.0);
  CGPathRef v31 = CGPathCreateWithRect(v100, 0);
  [v24 setPath:v31];
  id v32 = [v1 view];
  if (!v32)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  id v33 = v32;
  id v34 = [v32 layer];

  [v34 setMask:v24];
  id v35 = *(void **)&v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_ringsContainerView];
  id v36 = [v1 view];
  if (v36)
  {
    uint64_t v37 = v36;
    CGRect v87 = v24;
    [v36 bounds];

    [v35 bounds];
    objc_msgSend(v35, "setBounds:");
    objc_msgSend(v35, "setCenter:", MidX, MidY);
    uint64_t v38 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isPressed;
    if (v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isPressed] != 1
      || (double v39 = 1.0, v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state] != 1))
    {
      double v39 = 0.5;
    }
    [v35 setAlpha:v39];
    if (v1[v38]) {
      double v40 = 0.8;
    }
    else {
      double v40 = 1.0;
    }
    double v41 = *(void **)&v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_centerView];
    objc_msgSend(v41, "setCenter:", MidX, MidY);
    [v41 bounds];
    objc_msgSend(v41, "setBounds:");
    id v42 = [v41 layer];
    [v41 bounds];
    [v42 setCornerRadius:CGRectGetHeight(v101) * 0.5];

    uint64_t v43 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state;
    char v44 = v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state];
    uint64_t v45 = swift_allocObject();
    *(unsigned char *)(v45 + 16) = 3;
    *(unsigned char *)(v45 + 17) = v44;
    id v46 = objc_allocWithZone((Class)UIColor);
    uint64_t v47 = swift_allocObject();
    *(void *)(v47 + 16) = sub_3DDA8;
    *(void *)(v47 + 24) = v45;
    v96 = sub_3DE68;
    uint64_t v97 = v47;
    aBlock = _NSConcreteStackBlock;
    uint64_t v93 = 1107296256;
    CGRect v94 = sub_3CC8C;
    v95 = &unk_6E480;
    double v48 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v49 = [v46 initWithDynamicProvider:v48];
    swift_release();
    _Block_release(v48);
    [v41 setBackgroundColor:v49];

    long long v50 = *(void **)&v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_centerFillView];
    objc_msgSend(v50, "setCenter:", MidX, MidY);
    [v41 bounds];
    [v50 bounds];
    objc_msgSend(v50, "setBounds:");
    id v51 = [v50 layer];
    [v50 bounds];
    [v51 setCornerRadius:CGRectGetHeight(v102) * 0.5];

    uint64_t v52 = self;
    unint64_t v53 = swift_allocObject();
    *(void *)(v53 + 16) = v1;
    *(double *)(v53 + 24) = v40;
    *(double *)(v53 + 32) = MidX;
    *(double *)(v53 + 40) = MidY;
    uint64_t v54 = swift_allocObject();
    *(void *)(v54 + 16) = sub_3DD50;
    *(void *)(v54 + 24) = v53;
    unint64_t v86 = v53;
    v96 = sub_3DD70;
    uint64_t v97 = v54;
    aBlock = _NSConcreteStackBlock;
    uint64_t v93 = 1107296256;
    CGRect v94 = sub_2F5E8;
    v95 = &unk_6E4F8;
    long long v55 = _Block_copy(&aBlock);
    CGAffineTransform v56 = v1;
    swift_retain();
    swift_release();
    [(id)v52 performWithoutAnimation:v55];
    _Block_release(v55);
    LOBYTE(v52) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (v52)
    {
      __break(1u);
    }
    else
    {
      objc_super v57 = *(void **)&v56[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_iconView];
      CGRect v91 = v1;
      char v58 = v1[v43];
      uint64_t v59 = swift_allocObject();
      *(unsigned char *)(v59 + 16) = 2;
      *(unsigned char *)(v59 + 17) = v58;
      id v60 = objc_allocWithZone((Class)UIColor);
      uint64_t v61 = swift_allocObject();
      *(void *)(v61 + 16) = sub_3DDA8;
      *(void *)(v61 + 24) = v59;
      v96 = sub_3DE68;
      uint64_t v97 = v61;
      aBlock = _NSConcreteStackBlock;
      uint64_t v93 = 1107296256;
      CGRect v94 = sub_3CC8C;
      v95 = &unk_6E570;
      CGRect v62 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      id v63 = [v60 initWithDynamicProvider:v62];
      swift_release();
      _Block_release(v62);
      [v57 setTintColor:v63];

      sub_39400();
      unint64_t v53 = *(void *)&v56[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_rings];
      uint64_t v90 = v43;
      if (!(v53 >> 62))
      {
        uint64_t v64 = *(void *)((char *)&dword_10 + (v53 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain();
        if (v64)
        {
LABEL_15:
          if (v64 >= 1)
          {
            uint64_t v65 = 0;
            unint64_t v88 = v53 & 0xC000000000000001;
            uint64_t v89 = v64;
            do
            {
              if (v88) {
                uint64_t v66 = sub_46960();
              }
              else {
                uint64_t v66 = swift_retain();
              }
              CGRect v67 = *(void **)(v66 + 16);
              objc_msgSend(v67, "setCenter:", MidX, MidY, v86);
              sub_305B8(&qword_827C0);
              uint64_t inited = swift_initStackObject();
              *(_OWORD *)(inited + 16) = xmmword_62E20;
              char v69 = v91[v90];
              uint64_t v70 = swift_allocObject();
              *(unsigned char *)(v70 + 16) = 4;
              *(unsigned char *)(v70 + 17) = v69;
              id v71 = objc_allocWithZone((Class)UIColor);
              uint64_t v72 = swift_allocObject();
              *(void *)(v72 + 16) = sub_3DDA8;
              *(void *)(v72 + 24) = v70;
              v96 = sub_3DE68;
              uint64_t v97 = v72;
              aBlock = _NSConcreteStackBlock;
              uint64_t v93 = 1107296256;
              CGRect v94 = sub_3CC8C;
              v95 = &unk_6E5E8;
              CGRect v73 = _Block_copy(&aBlock);
              id v74 = v67;
              swift_retain();
              swift_release();
              id v75 = [v71 initWithDynamicProvider:v73];
              swift_release();
              _Block_release(v73);
              *(void *)(inited + 32) = v75;
              char v76 = v91[v90];
              ++v65;
              uint64_t v77 = swift_allocObject();
              *(unsigned char *)(v77 + 16) = 5;
              *(unsigned char *)(v77 + 17) = v76;
              id v78 = objc_allocWithZone((Class)UIColor);
              uint64_t v79 = swift_allocObject();
              *(void *)(v79 + 16) = sub_3DDA8;
              *(void *)(v79 + 24) = v77;
              v96 = sub_3DE68;
              uint64_t v97 = v79;
              aBlock = _NSConcreteStackBlock;
              uint64_t v93 = 1107296256;
              CGRect v94 = sub_3CC8C;
              v95 = &unk_6E660;
              CGRect v80 = _Block_copy(&aBlock);
              swift_retain();
              swift_release();
              id v81 = [v78 initWithDynamicProvider:v80];
              swift_release();
              _Block_release(v80);
              *(void *)(inited + 40) = v81;
              aBlock = (void **)inited;
              sub_46830();
              unint64_t v82 = (unint64_t)aBlock;
              id v83 = [v74 layer];
              self;
              CGRect v84 = (void *)swift_dynamicCastObjCClassUnconditional();
              sub_3E4F4(v82);
              swift_bridgeObjectRelease();
              Class isa = sub_46810().super.isa;
              swift_bridgeObjectRelease();
              [v84 setColors:isa];
              swift_release();
            }
            while (v89 != v65);
            goto LABEL_23;
          }
          __break(1u);
          goto LABEL_25;
        }
LABEL_23:

        swift_bridgeObjectRelease();
        swift_release();

        return;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v64 = sub_46A00();
    if (v64) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_29:
  __break(1u);
}

id sub_39358(uint64_t a1, CGFloat a2, double a3, double a4)
{
  double v7 = *(void **)(a1 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_iconView);
  [v7 sizeToFit];
  CGAffineTransformMakeScale(&v9, a2, a2);
  [v7 setTransform:&v9];
  return objc_msgSend(v7, "setCenter:", a3, a4);
}

void sub_39400()
{
  objc_super v1 = *(void **)&v0[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpCalloutView];
  if (!v1) {
    return;
  }
  id v2 = *(void **)&v0[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_iconView];
  id v41 = v1;
  [v2 frame];
  double MinY = CGRectGetMinY(v43);
  id v4 = [v0 view];
  if (!v4)
  {
    __break(1u);
    goto LABEL_21;
  }
  double v5 = v4;
  [v4 safeAreaInsets];
  double v7 = v6;

  [v41 bounds];
  if (MinY - (42.0 - v7 + -18.0) < v8)
  {
    *((unsigned char *)v41
    + OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_arrowPointingDown) = 0;
    [v41 setNeedsLayout];
  }
  if (*((unsigned char *)v41
       + OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_arrowPointingDown) != 1)
  {
    [v2 frame];
    double MaxY = CGRectGetMaxY(v47);
    id v25 = [v0 view];
    if (v25)
    {
      uint64_t v26 = v25;
      double v27 = MaxY + 2.0;
      [v25 bounds];
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      CGFloat v35 = v34;

      v48.origin.CGFloat x = v29;
      v48.origin.CGFloat y = v31;
      v48.size.CGFloat width = v33;
      v48.size.CGFloat height = v35;
      CGFloat v36 = CGRectGetMaxY(v48) + -17.0;
      [v41 bounds];
      double v37 = v36 - CGRectGetHeight(v49);
      if (v37 >= v27) {
        double v38 = v27;
      }
      else {
        double v38 = v37;
      }
      [*(id *)&v0[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_centerView] center];
      double v23 = v39;
      [v41 frame];
      double v14 = v38 + v40;
      goto LABEL_17;
    }
    goto LABEL_22;
  }
  CGAffineTransform v9 = *(void **)&v0[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_centerView];
  [v9 frame];
  double v10 = CGRectGetMinY(v44);
  [v41 frame];
  double Height = CGRectGetHeight(v45);
  id v12 = [v0 view];
  if (!v12)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  double v13 = v12;
  double v14 = floor(v10 + -9.0);
  double v15 = v14 - Height;
  [v12 safeAreaInsets];
  double v17 = v16;

  if (v15 < 42.0 - v17 + -18.0)
  {
    id v18 = [v0 view];
    if (v18)
    {
      id v19 = v18;
      [v18 safeAreaInsets];
      double v21 = v20;

      [v41 frame];
      double v14 = 42.0 - v21 + -18.0 + CGRectGetHeight(v46);
      goto LABEL_10;
    }
LABEL_23:
    __break(1u);
    return;
  }
LABEL_10:
  [v9 center];
  double v23 = v22;
LABEL_17:
  objc_msgSend(v41, "setCenter:", v23, v14);
}

char *sub_39738()
{
  id result = (char *)[v0 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  id v2 = result;
  [result bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v31.origin.CGFloat x = v4;
  v31.origin.CGFloat y = v6;
  v31.size.CGFloat width = v8;
  v31.size.CGFloat height = v10;
  double MaxY = CGRectGetMaxY(v31);
  [*(id *)&v0[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_iconView] frame];
  double MidY = CGRectGetMidY(v32);
  id result = (char *)[v0 view];
  if (!result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  double v13 = result;
  double v14 = MaxY - (MidY + 17.0);
  [result bounds];
  uint64_t v16 = v15;

  double v17 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AudioAppContentViewController.CalloutView()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(void *)&v17[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_maxWidth] = v16;
  *(double *)&v17[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_maxHeight] = v14;
  uint64_t v18 = *(void *)&v0[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpText + 8];
  id v19 = &v17[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_text];
  *(void *)id v19 = *(void *)&v0[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpText];
  *((void *)v19 + 1) = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_labelView;
  double v21 = *(void **)&v17[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_labelView];
  if (*((void *)v19 + 1))
  {
    swift_bridgeObjectRetain();
    NSString v22 = sub_467A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v22 = 0;
  }
  [v21 setText:v22];

  [v17 setNeedsLayout];
  double v23 = *(void **)&v0[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_labelColor];
  uint64_t v24 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_textColor;
  id v25 = *(void **)&v17[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_textColor];
  *(void *)&v17[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_textColor] = v23;
  id v26 = v23;

  [*(id *)&v17[v20] setTextColor:*(void *)&v17[v24]];
  double v27 = *(void **)&v0[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_popoverColor];
  uint64_t v28 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_backdropColor;
  CGFloat v29 = *(void **)&v17[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_backdropColor];
  *(void *)&v17[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_backdropColor] = v27;
  id v30 = v27;

  [*(id *)&v17[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_backgroundView] setBackgroundColor:*(void *)&v17[v28]];
  [v17 sizeToFit];
  return v17;
}

void sub_399AC()
{
  uint64_t v105 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink;
  objc_super v1 = *(void **)&v0[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
  if (!v1)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  id v2 = v0;
  [v1 duration];
  Swift::Double v4 = v3;
  id v5 = [v0 view];
  if (!v5)
  {
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  CGFloat v6 = v5;
  [v5 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v107.origin.CGFloat x = v8;
  v107.origin.CGFloat y = v10;
  v107.size.CGFloat width = v12;
  v107.size.CGFloat height = v14;
  if (CGRectGetHeight(v107) <= 0.0) {
    return;
  }
  uint64_t v15 = (double *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpPresentTime];
  if ((v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpPresentTime + 8] & 1) == 0)
  {
    uint64_t v16 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isHelpVisible;
    if ((v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isHelpVisible] & 1) == 0)
    {
      double v17 = *(void **)&v2[v105];
      if (!v17)
      {
LABEL_73:
        __break(1u);
        goto LABEL_74;
      }
      double v18 = *v15;
      [v17 targetTimestamp];
      if (v18 < v19)
      {
        v2[v16] = 1;
        *uint64_t v15 = 0.0;
        *((unsigned char *)v15 + 8) = 1;
        uint64_t v20 = sub_39738();
        sub_39400();
        id v21 = [v2 view];
        if (!v21)
        {
LABEL_75:
          __break(1u);
          return;
        }
        NSString v22 = v21;
        [v21 addSubview:v20];

        double v23 = *(void **)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpCalloutView];
        *(void *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpCalloutView] = v20;
        uint64_t v24 = v20;

        [v24 setAlpha:0.0];
        CGAffineTransformMakeScale(&aBlock, 0.01, 0.01);
        [v24 setTransform:&aBlock];
        id v25 = self;
        uint64_t v26 = swift_allocObject();
        *(void *)(v26 + 16) = v24;
        *(unsigned char *)(v26 + 24) = 1;
        *(void *)&aBlock.CGFloat tx = sub_3DDAC;
        *(void *)&aBlock.CGFloat ty = v26;
        *(void *)&aBlock.a = _NSConcreteStackBlock;
        *(void *)&aBlock.b = 1107296256;
        *(void *)&aBlock.c = sub_40CD0;
        *(void *)&aBlock.d = &unk_6E160;
        double v27 = _Block_copy(&aBlock);
        uint64_t v28 = v24;
        swift_release();
        uint64_t v29 = swift_allocObject();
        *(unsigned char *)(v29 + 16) = 0;
        *(void *)(v29 + 24) = v28;
        *(void *)&aBlock.CGFloat tx = sub_3DC20;
        *(void *)&aBlock.CGFloat ty = v29;
        *(void *)&aBlock.a = _NSConcreteStackBlock;
        *(void *)&aBlock.b = 1107296256;
        *(void *)&aBlock.c = sub_40D14;
        *(void *)&aBlock.d = &unk_6E1B0;
        id v30 = _Block_copy(&aBlock);
        CGRect v31 = v28;
        swift_release();
        [v25 animateWithDuration:6 delay:v27 usingSpringWithDamping:v30 initialSpringVelocity:0.65 options:0.0 animations:0.78 completion:0.0];
        _Block_release(v30);
        _Block_release(v27);
      }
    }
  }
  CGRect v32 = (double *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpDismissTime];
  if ((v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpDismissTime + 8] & 1) == 0)
  {
    uint64_t v33 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isHelpVisible;
    if (v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isHelpVisible] == 1)
    {
      double v34 = *(void **)&v2[v105];
      if (!v34)
      {
LABEL_74:
        __break(1u);
        goto LABEL_75;
      }
      double v35 = *v32;
      [v34 targetTimestamp];
      if (v35 < v36)
      {
        v2[v33] = 0;
        *CGRect v32 = 0.0;
        *((unsigned char *)v32 + 8) = 1;
        uint64_t v37 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpCalloutView;
        double v38 = *(void **)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpCalloutView];
        if (v38)
        {
          id v39 = v38;
          [v39 setAlpha:1.0];
          aBlock.a = 1.0;
          aBlock.b = 0.0;
          aBlock.c = 0.0;
          aBlock.d = 1.0;
          aBlock.CGFloat tx = 0.0;
          aBlock.CGFloat ty = 0.0;
          [v39 setTransform:&aBlock];
          double v40 = self;
          uint64_t v41 = swift_allocObject();
          *(void *)(v41 + 16) = v39;
          *(unsigned char *)(v41 + 24) = 0;
          *(void *)&aBlock.CGFloat tx = sub_3DBDC;
          *(void *)&aBlock.CGFloat ty = v41;
          *(void *)&aBlock.a = _NSConcreteStackBlock;
          *(void *)&aBlock.b = 1107296256;
          *(void *)&aBlock.c = sub_40CD0;
          *(void *)&aBlock.d = &unk_6E0C0;
          id v42 = _Block_copy(&aBlock);
          id v43 = v39;
          swift_release();
          uint64_t v44 = swift_allocObject();
          *(unsigned char *)(v44 + 16) = 1;
          *(void *)(v44 + 24) = v43;
          *(void *)&aBlock.CGFloat tx = sub_3DC20;
          *(void *)&aBlock.CGFloat ty = v44;
          *(void *)&aBlock.a = _NSConcreteStackBlock;
          *(void *)&aBlock.b = 1107296256;
          *(void *)&aBlock.c = sub_40D14;
          *(void *)&aBlock.d = &unk_6E110;
          CGRect v45 = _Block_copy(&aBlock);
          id v46 = v43;
          swift_release();
          [v40 animateWithDuration:6 delay:v42 usingSpringWithDamping:v45 initialSpringVelocity:0.65 options:0.0 animations:0.78 completion:0.0];
          _Block_release(v45);
          _Block_release(v42);
          CGRect v47 = *(void **)&v2[v37];
          *(void *)&v2[v37] = 0;
        }
      }
    }
  }
  if ((v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_ringStartTime + 8] & 1) == 0)
  {
    CGRect v48 = *(void **)&v2[v105];
    if (!v48)
    {
LABEL_72:
      __break(1u);
      goto LABEL_73;
    }
    double v49 = *(double *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_ringStartTime];
    [v48 targetTimestamp];
    if (v49 < v50)
    {
      int v51 = v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isCollapsed];
      v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isCollapsed] = 0;
      if (v51 == 1)
      {
        unint64_t v52 = *(void *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_rings];
        if (v52 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v53 = sub_46A00();
          if (v53) {
            goto LABEL_22;
          }
        }
        else
        {
          uint64_t v53 = *(void *)((char *)&dword_10 + (v52 & 0xFFFFFFFFFFFFFF8));
          swift_bridgeObjectRetain();
          if (v53)
          {
LABEL_22:
            if (v53 >= 1)
            {
              if ((v52 & 0xC000000000000001) != 0)
              {
                uint64_t v54 = 0;
                do
                {
                  uint64_t v55 = sub_46960();
                  ++v54;
                  *(void *)(v55 + 24) = 0;
                  *(unsigned char *)(v55 + 32) = 0;
                  swift_unknownObjectRelease();
                }
                while (v53 != v54);
              }
              else
              {
                for (uint64_t i = 0; i != v53; ++i)
                {
                  uint64_t v57 = *(void *)(v52 + 8 * i + 32);
                  *(void *)(v57 + 24) = 0;
                  *(unsigned char *)(v57 + 32) = 0;
                }
              }
              goto LABEL_29;
            }
            __break(1u);
LABEL_67:
            __break(1u);
            goto LABEL_68;
          }
        }
LABEL_29:
        swift_bridgeObjectRelease();
      }
    }
  }
  if (v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isCollapsed]) {
    double v58 = 1.0;
  }
  else {
    double v58 = 0.0;
  }
  uint64_t v59 = (double *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_collapsedSpring];
  swift_beginAccess();
  v59[3] = v58;
  Spring.update(dt:)(v4);
  swift_endAccess();
  id v60 = [v2 view];
  if (!v60) {
    goto LABEL_70;
  }
  uint64_t v61 = v60;
  [v60 bounds];
  CGFloat v63 = v62;
  CGFloat v65 = v64;
  CGFloat v67 = v66;
  CGFloat v69 = v68;

  v108.origin.CGFloat x = v63;
  v108.origin.CGFloat y = v65;
  v108.size.CGFloat width = v67;
  v108.size.CGFloat height = v69;
  double Width = CGRectGetWidth(v108);
  id v71 = [v2 view];
  if (!v71)
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  uint64_t v72 = v71;
  [v71 bounds];
  CGFloat v74 = v73;
  CGFloat v76 = v75;
  CGFloat v78 = v77;
  CGFloat v80 = v79;

  v109.origin.CGFloat x = v74;
  v109.origin.CGFloat y = v76;
  v109.size.CGFloat width = v78;
  v109.size.CGFloat height = v80;
  double Height = CGRectGetHeight(v109);
  uint64_t v82 = *(void *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_recorder]
      + OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_power;
  swift_beginAccess();
  if (*(unsigned char *)(v82 + 4))
  {
    id v83 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_powerIntensitySpring];
    swift_beginAccess();
    *((void *)v83 + 2) = 0;
    *((void *)v83 + 4) = 0;
  }
  else
  {
    double v84 = (float)((float)(*(float *)v82 + 60.0) / 50.0);
    CGRect v85 = (double *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_powerIntensitySpring];
    swift_beginAccess();
    v85[3] = v84;
    Spring.update(dt:)(v4);
    swift_endAccess();
  }
  unint64_t v86 = (double *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_powerIntensitySpring];
  swift_beginAccess();
  double v87 = v86[2];
  unint64_t v88 = *(void *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_rings];
  v104 = v2;
  if (v88 >> 62) {
    goto LABEL_61;
  }
  uint64_t v89 = *(void *)((char *)&dword_10 + (v88 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  while (v89)
  {
    uint64_t v90 = 0;
    double v91 = sqrt(Width * Width + Height * Height);
    double Width = v87 * 3.0 + 1.0;
    unint64_t v92 = v88 & 0xC000000000000001;
    double Height = v91 + -80.0;
    while (v92)
    {
      uint64_t v98 = sub_46960();
      uint64_t v99 = v90 + 1;
      if (__OFADD__(v90, 1)) {
        goto LABEL_59;
      }
LABEL_49:
      if ((*(unsigned char *)(v98 + 32) & 1) == 0 && v90)
      {
        if (v92)
        {
          uint64_t v100 = sub_46960();
        }
        else
        {
          if ((unint64_t)(v90 - 1) >= *(void *)((char *)&dword_10 + (v88 & 0xFFFFFFFFFFFFFF8))) {
            goto LABEL_60;
          }
          uint64_t v100 = swift_retain();
        }
        double v101 = *(double *)(v100 + 24);
        swift_release();
        if (v101 < 0.5)
        {
          uint64_t v93 = (void *)(v98 + 24);
LABEL_42:
          *uint64_t v93 = 0;
          double v94 = 0.0;
          goto LABEL_43;
        }
      }
      *(unsigned char *)(v98 + 32) = 1;
      CGRect v102 = *(void **)&v104[v105];
      if (!v102) {
        goto LABEL_67;
      }
      [v102 duration];
      uint64_t v93 = (void *)(v98 + 24);
      double v94 = *(double *)(v98 + 24) + Width * (v103 / 3.0);
      *(double *)(v98 + 24) = v94;
      if (v94 > 1.0) {
        goto LABEL_42;
      }
LABEL_43:
      double v87 = Height * (v94 * (1.0 - v59[2])) + 80.0;
      id v95 = *(id *)(v98 + 16);
      [v95 bounds];
      objc_msgSend(v95, "setBounds:");

      v96 = *(void **)(v98 + 16);
      id v97 = [v96 layer];
      [v96 bounds];
      [v97 setCornerRadius:CGRectGetHeight(v110) * 0.5];

      [*(id *)(v98 + 16) setAlpha:(1.0 - *(double *)(v98 + 24)) * (1.0 - v59[2])];
      swift_release();
      ++v90;
      if (v99 == v89) {
        goto LABEL_62;
      }
    }
    uint64_t v98 = *(void *)(v88 + 8 * v90 + 32);
    swift_retain();
    uint64_t v99 = v90 + 1;
    if (!__OFADD__(v90, 1)) {
      goto LABEL_49;
    }
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    swift_bridgeObjectRetain();
    uint64_t v89 = sub_46A00();
  }
LABEL_62:
  swift_bridgeObjectRelease();
}

void sub_3A4C8(unsigned __int8 a1, char a2, double a3)
{
  Swift::Double v4 = v3;
  if (v3[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isFirstStateSet] == 1
    && v3[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state] == a1)
  {
    return;
  }
  v3[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isFirstStateSet] = 1;
  uint64_t v7 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state;
  int v8 = v3[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state];
  v3[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state] = a1;
  double v9 = v3;
  CGFloat v10 = sub_46710();
  os_log_type_t v11 = sub_468A0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t aBlock = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315650;
    id v13 = [v9 debugDescription];
    int v89 = v8;
    uint64_t v14 = sub_467B0();
    os_log_type_t typea = v11;
    unint64_t v16 = v15;

    sub_30CB4(v14, v16, &aBlock);
    sub_468F0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    sub_30CB4(0xD00000000000001FLL, 0x80000000000674B0, &aBlock);
    sub_468F0();
    uint64_t v17 = 8 * (char)v4[v7];
    uint64_t v18 = *(void *)&aReady_0[v17];
    *(_WORD *)(v12 + 22) = 2080;
    sub_30CB4(v18, *(void *)((char *)&unk_63450 + v17), &aBlock);
    sub_468F0();

    int v8 = v89;
    swift_bridgeObjectRelease();
    _os_log_impl(&def_3AC7C, v10, typea, "%s %s transitioned to state %s", (uint8_t *)v12, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if ((a1 - 1) <= 2u)
  {
    int v19 = v8 - 1;
    if ((v8 - 1) < 4) {
      goto LABEL_22;
    }
    goto LABEL_14;
  }
  if ((v8 - 1) <= 2)
  {
    if (a1 == 4) {
      goto LABEL_32;
    }
LABEL_18:
    uint64_t v27 = *(void *)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_recorder]
        + OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_power;
    swift_beginAccess();
    *(_DWORD *)uint64_t v27 = 0;
    *(unsigned char *)(v27 + 4) = 1;
    uint64_t v28 = &v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate];
    swift_beginAccess();
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v29 = *((void *)v28 + 1);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(char *, uint64_t, uint64_t))(v29 + 24))(v9, ObjectType, v29);
LABEL_20:
      swift_unknownObjectRelease();
    }
LABEL_21:
    int v19 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isCollapsed;
    v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isCollapsed] = 1;
LABEL_22:
    switch(v19)
    {
      case 1:
        uint64_t v37 = *(void **)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
        if (!v37) {
          goto LABEL_75;
        }
        [v37 timestamp];
        char v32 = 0;
        double v34 = v38 + 0.3;
        break;
      case 2:
      case 3:
      case 4:
        goto LABEL_32;
      case 5:
        double v35 = &v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_ringStartTime];
        *(void *)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_ringStartTime] = 0;
        char v32 = 1;
        goto LABEL_31;
      case 6:
        double v36 = *(void **)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
        if (!v36) {
          goto LABEL_74;
        }
        [v36 timestamp];
        char v32 = 0;
        break;
      default:
        CGRect v31 = *(void **)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
        if (!v31) {
          goto LABEL_73;
        }
        [v31 timestamp];
        char v32 = 0;
        double v34 = v33 + a3;
        break;
    }
    double v35 = &v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_ringStartTime];
    *(double *)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_ringStartTime] = v34;
LABEL_31:
    v35[8] = v32;
    goto LABEL_32;
  }
  if (a1 != 4)
  {
    if (v8 != 4) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  if (v8 != 4)
  {
LABEL_14:
    uint64_t v20 = *(void *)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_recorder]
        + OBJC_IVAR____TtC22AudioMessagesExtension13AudioRecorder_power;
    swift_beginAccess();
    *(_DWORD *)uint64_t v20 = 0;
    *(unsigned char *)(v20 + 4) = 1;
    id v21 = *(void **)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
    if (!v21)
    {
LABEL_68:
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
      JUMPOUT(0x3B1A0);
    }
    [v21 timestamp];
    NSString v22 = &v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_recordingStartTime];
    *(void *)NSString v22 = v23;
    v22[8] = 0;
    v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_hasStartedFirstRecording] = 1;
    uint64_t v24 = &v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate];
    swift_beginAccess();
    if (!swift_unknownObjectWeakLoadStrong()) {
      goto LABEL_21;
    }
    uint64_t v25 = *((void *)v24 + 1);
    uint64_t v26 = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 8))(v9, v26, v25);
    goto LABEL_20;
  }
LABEL_32:
  sub_3B6D4(a1);
  id v39 = *(void **)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_iconView];
  id v40 = sub_3B1D8(a1);
  [v39 setImage:v40];

  uint64_t v41 = (uint64_t *)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpText];
  uint64_t *v41 = 0;
  v41[1] = 0;
  uint64_t v90 = v41;
  swift_bridgeObjectRelease();
  id v42 = &v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpPresentTime];
  *(void *)id v42 = 0;
  v42[8] = 1;
  id v43 = &v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpDismissTime];
  *(void *)id v43 = 0;
  *(void *)type = v43;
  v43[8] = 1;
  v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isHelpVisible] = 0;
  uint64_t v44 = OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpCalloutView;
  CGRect v45 = *(void **)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpCalloutView];
  id v46 = &selRef_hasBeginAndEndTimeLabelAtOverviewWaveform;
  if (v45)
  {
    id v47 = v45;
    [v47 setAlpha:1.0];
    uint64_t aBlock = 0x3FF0000000000000;
    uint64_t v92 = 0;
    uint64_t v93 = 0;
    uint64_t v94 = 0x3FF0000000000000;
    id v95 = 0;
    uint64_t v96 = 0;
    [v47 setTransform:&aBlock];
    id v87 = self;
    uint64_t v48 = swift_allocObject();
    *(void *)(v48 + 16) = v47;
    *(unsigned char *)(v48 + 24) = 0;
    id v95 = (void (*)())sub_3DDAC;
    uint64_t v96 = v48;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v92 = 1107296256;
    uint64_t v93 = sub_40CD0;
    uint64_t v94 = (uint64_t)&unk_6E3B8;
    double v49 = _Block_copy(&aBlock);
    id v50 = v47;
    swift_release();
    uint64_t v51 = swift_allocObject();
    *(unsigned char *)(v51 + 16) = 1;
    *(void *)(v51 + 24) = v50;
    id v95 = (void (*)())sub_3DC20;
    uint64_t v96 = v51;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v92 = 1107296256;
    id v46 = &selRef_hasBeginAndEndTimeLabelAtOverviewWaveform;
    uint64_t v93 = sub_40D14;
    uint64_t v94 = (uint64_t)&unk_6E408;
    unint64_t v52 = _Block_copy(&aBlock);
    id v53 = v50;
    swift_release();
    [v87 animateWithDuration:6 delay:v49 usingSpringWithDamping:v52 initialSpringVelocity:0.65 options:0.0 animations:0.78 completion:0.0];
    _Block_release(v52);
    _Block_release(v49);
    uint64_t v54 = *(void **)&v9[v44];
    *(void *)&v9[v44] = 0;
  }
  switch(a1)
  {
    case 0u:
      uint64_t v55 = *(void **)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
      if (!v55) {
        goto LABEL_69;
      }
      [v55 timestamp];
      *(double *)id v42 = v56 + 10.0;
      v42[8] = 0;
      type metadata accessor for AMMessagesViewController(0);
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v58 = [self bundleForClass:ObjCClassFromMetadata];
      goto LABEL_45;
    case 1u:
      if ((v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_recordingStartTime + 8] & 1) == 0)
      {
        *(double *)id v42 = *(double *)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_recordingStartTime]
                       + 0.8;
        v42[8] = 0;
      }
      uint64_t v59 = *(void **)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
      if (!v59) {
        goto LABEL_70;
      }
      [v59 timestamp];
      **(double **)type = v60 + 0.8 + 2.0;
      *(unsigned char *)(*(void *)type + 8) = 0;
      type metadata accessor for AMMessagesViewController(0);
      uint64_t v61 = swift_getObjCClassFromMetadata();
      id v58 = [self bundleForClass:v61];
      goto LABEL_45;
    case 2u:
      double v62 = *(void **)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
      if (v62) {
        goto LABEL_44;
      }
      goto LABEL_71;
    case 3u:
      double v62 = *(void **)&v9[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
      if (!v62) {
        goto LABEL_72;
      }
LABEL_44:
      [v62 timestamp];
      *(void *)id v42 = v63;
      v42[8] = 0;
      type metadata accessor for AMMessagesViewController(0);
      uint64_t v64 = swift_getObjCClassFromMetadata();
      id v58 = [self bundleForClass:v64];
LABEL_45:
      NSString v65 = sub_467A0();
      id v66 = [v58 localizedStringForKey:v65 value:0 table:0];

      uint64_t v67 = sub_467B0();
      uint64_t v69 = v68;

      *uint64_t v90 = v67;
      v90[1] = v69;
      swift_bridgeObjectRelease();
LABEL_46:
      id v70 = objc_msgSend(v9, "view", *(void *)type);
      if (!v70)
      {
        __break(1u);
LABEL_67:
        __break(1u);
        goto LABEL_68;
      }
      id v71 = v70;
      sub_3B420();
      if (v72)
      {
        NSString v73 = sub_467A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v73 = 0;
      }
      [v71 setAccessibilityLabel:v73];

      id v74 = [v9 view];
      if (!v74) {
        goto LABEL_67;
      }
      double v75 = v74;
      if (v90[1])
      {
        swift_bridgeObjectRetain();
        NSString v76 = sub_467A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v76 = 0;
      }
      [v75 setAccessibilityHint:v76];

      if (!UIAccessibilityIsVoiceOverRunning())
      {
        if (a1 <= 2u)
        {
          UIAccessibilityNotifications v79 = UIAccessibilityScreenChangedNotification;
          id v80 = [v9 view];
          UIAccessibilityPostNotification(v79, v80);
        }
LABEL_60:
        if ((a2 & 1) == 0) {
          return;
        }
        goto LABEL_61;
      }
      if (a1 > 2u) {
        goto LABEL_60;
      }
      UIAccessibilityNotifications v77 = UIAccessibilityAnnouncementNotification;
      if (v90[1])
      {
        swift_bridgeObjectRetain();
        NSString v78 = sub_467A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v78 = 0;
      }
      UIAccessibilityPostNotification(v77, v78);
      swift_unknownObjectRelease();
      if (a2)
      {
LABEL_61:
        id v81 = self;
        uint64_t v82 = swift_allocObject();
        *(void *)(v82 + 16) = v9;
        id v95 = sub_3DCCC;
        uint64_t v96 = v82;
        uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
        uint64_t v92 = 1107296256;
        uint64_t v93 = sub_40CD0;
        uint64_t v94 = (uint64_t)&unk_6E368;
        id v83 = _Block_copy(&aBlock);
        double v84 = v9;
        swift_release();
        objc_msgSend(v81, v46[274], 6, v83, 0, 0.5, 0.0, 0.9, 0.0);
        _Block_release(v83);
      }
      return;
    case 4u:
    case 5u:
    case 6u:
      goto LABEL_46;
    default:
      JUMPOUT(0);
  }
}

id sub_3B1D8(char a1)
{
  switch(a1)
  {
    case 1:
    case 3:
      NSString v1 = sub_467A0();
      id v2 = [self systemImageNamed:v1];

      if (!v2)
      {
        __break(1u);
        goto LABEL_4;
      }
      return v2;
    case 2:
      goto LABEL_6;
    case 4:
      goto LABEL_12;
    case 5:
      goto LABEL_8;
    case 6:
      goto LABEL_10;
    default:
LABEL_4:
      NSString v3 = sub_467A0();
      id v2 = [self systemImageNamed:v3];

      if (v2) {
        return v2;
      }
      __break(1u);
LABEL_6:
      NSString v4 = sub_467A0();
      id v2 = [self systemImageNamed:v4];

      if (v2) {
        return v2;
      }
      __break(1u);
LABEL_8:
      NSString v5 = sub_467A0();
      id v2 = [self systemImageNamed:v5];

      if (!v2)
      {
        __break(1u);
LABEL_10:
        NSString v6 = sub_467A0();
        id v2 = [self systemImageNamed:v6];

        if (!v2)
        {
          __break(1u);
LABEL_12:
          NSString v7 = sub_467A0();
          id v2 = [self systemImageNamed:v7];

          if (!v2)
          {
            __break(1u);
            JUMPOUT(0x3B404);
          }
        }
      }
      return v2;
  }
}

uint64_t sub_3B420()
{
  type metadata accessor for AMMessagesViewController(0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v2 = sub_467A0();
  id v3 = [v1 localizedStringForKey:v2 value:0 table:0];

  uint64_t v4 = sub_467B0();
  return v4;
}

void sub_3B6D4(char a1)
{
  uint64_t v3 = swift_allocObject();
  *(unsigned char *)(v3 + 16) = 0;
  *(unsigned char *)(v3 + 17) = a1;
  id v4 = objc_allocWithZone((Class)UIColor);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_3DC5C;
  *(void *)(v5 + 24) = v3;
  uint64_t v25 = sub_3DCA4;
  uint64_t v26 = v5;
  id v21 = _NSConcreteStackBlock;
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_3CC8C;
  uint64_t v24 = &unk_6E228;
  NSString v6 = _Block_copy(&v21);
  swift_retain();
  swift_release();
  id v7 = [v4 initWithDynamicProvider:v6];
  swift_release();
  _Block_release(v6);
  int v8 = *(void **)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_popoverColor);
  *(void *)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_popoverColor) = v7;

  uint64_t v9 = swift_allocObject();
  *(unsigned char *)(v9 + 16) = 1;
  *(unsigned char *)(v9 + 17) = a1;
  id v10 = objc_allocWithZone((Class)UIColor);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_3DDA8;
  *(void *)(v11 + 24) = v9;
  uint64_t v25 = sub_3DE68;
  uint64_t v26 = v11;
  id v21 = _NSConcreteStackBlock;
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_3CC8C;
  uint64_t v24 = &unk_6E2A0;
  uint64_t v12 = _Block_copy(&v21);
  swift_retain();
  swift_release();
  id v13 = [v10 initWithDynamicProvider:v12];
  swift_release();
  _Block_release(v12);
  uint64_t v14 = *(void **)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_labelColor);
  *(void *)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_labelColor) = v13;

  uint64_t v15 = swift_allocObject();
  *(unsigned char *)(v15 + 16) = 3;
  *(unsigned char *)(v15 + 17) = a1;
  id v16 = objc_allocWithZone((Class)UIColor);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_3DDA8;
  *(void *)(v17 + 24) = v15;
  uint64_t v25 = sub_3DE68;
  uint64_t v26 = v17;
  id v21 = _NSConcreteStackBlock;
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_3CC8C;
  uint64_t v24 = &unk_6E318;
  uint64_t v18 = _Block_copy(&v21);
  swift_retain();
  swift_release();
  id v19 = [v16 initWithDynamicProvider:v18];
  swift_release();
  _Block_release(v18);
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void **)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_buttonColor);
  *(void *)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_buttonColor) = v19;
}

Swift::Bool __swiftcall AudioAppContentViewController.gestureRecognizerShouldBegin(_:)(UIGestureRecognizer a1)
{
  id v3 = [v1 view];
  [(objc_class *)a1.super.isa locationInView:v3];
  double v5 = v4;
  double v7 = v6;

  if ([(objc_class *)a1.super.isa state] == (char *)&def_3AC7C + 2
    || [(objc_class *)a1.super.isa state] == (char *)&def_3AC7C + 1)
  {
    if (qword_82518 != -1) {
      swift_once();
    }
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (!Strong)
    {
      __break(1u);
      return (char)Strong;
    }
  }
  uint64_t v9 = *(void **)&v1[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_centerView];
  id v10 = [v1 view];
  objc_msgSend(v9, "convertPoint:fromView:", v10, v5, v7);
  double v12 = v11;
  double v14 = v13;

  LOBYTE(Strong) = objc_msgSend(v9, "pointInside:withEvent:", 0, v12, v14);
  return (char)Strong;
}

void sub_3BBE4(void *a1)
{
  NSString v2 = v1;
  uint64_t v4 = sub_46740();
  uint64_t v72 = *(void *)(v4 - 8);
  uint64_t v73 = v4;
  __chkstk_darwin(v4);
  double v6 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_46760();
  uint64_t v70 = *(void *)(v7 - 8);
  uint64_t v71 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_46780();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  double v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  id v16 = (char *)&v64 - v15;
  id v17 = [v1 view];
  [a1 locationInView:v17];
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  if ([a1 state] == (char *)&def_3AC7C + 2 || objc_msgSend(a1, "state") == (char *)&def_3AC7C + 1)
  {
    if (qword_82518 != -1) {
      swift_once();
    }
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (!Strong)
    {
      __break(1u);
LABEL_49:
      __break(1u);
      JUMPOUT(0x3C5F4);
    }
  }
  [*(id *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_centerView] center];
  v81.origin.CGFloat x = v23 + -50.0;
  v81.origin.CGFloat y = v24 + -50.0;
  v81.size.CGFloat width = 100.0;
  v81.size.CGFloat height = 100.0;
  v80.CGFloat x = v19;
  v80.CGFloat y = v21;
  BOOL v69 = CGRectContainsPoint(v81, v80);
  if ([a1 state] == (char *)&def_3AC7C + 1)
  {
    uint64_t v25 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isPressed];
    if ((v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isPressed] & 1) == 0)
    {
      uint64_t v68 = v14;
      uint64_t v26 = v16;
      uint64_t v27 = v11;
      uint64_t v28 = v9;
      uint64_t v29 = v6;
      uint64_t v30 = v10;
      LOBYTE(v31) = 1;
LABEL_12:
      *uint64_t v25 = v31;
      char v32 = self;
      uint64_t v33 = swift_allocObject();
      *(void *)(v33 + 16) = v2;
      NSString v78 = sub_3DE40;
      uint64_t v79 = v33;
      uint64_t aBlock = _NSConcreteStackBlock;
      uint64_t v75 = 1107296256;
      NSString v76 = sub_40CD0;
      UIAccessibilityNotifications v77 = &unk_6E020;
      double v34 = _Block_copy(&aBlock);
      double v35 = v2;
      swift_release();
      [v32 animateWithDuration:6 delay:v34 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:0.9 completion:0.0];
      _Block_release(v34);
      uint64_t v10 = v30;
      double v6 = v29;
      uint64_t v9 = v28;
      uint64_t v11 = v27;
      id v16 = v26;
      double v14 = v68;
    }
  }
  else
  {
    int v31 = [a1 state] == (char *)&def_3AC7C + 2;
    uint64_t v25 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isPressed];
    if (v31 != v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_isPressed])
    {
      uint64_t v68 = v14;
      uint64_t v26 = v16;
      uint64_t v27 = v11;
      uint64_t v28 = v9;
      uint64_t v29 = v6;
      uint64_t v30 = v10;
      goto LABEL_12;
    }
  }
  if ([a1 state] == (char *)&def_3AC7C + 1
    && !v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state])
  {
    sub_33F38(0, &qword_82AE0);
    uint64_t v67 = sub_468C0();
    sub_46770();
    sub_46790();
    uint64_t v68 = *(char **)(v11 + 8);
    ((void (*)(char *, uint64_t))v68)(v14, v10);
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v2;
    NSString v78 = sub_3DAA0;
    uint64_t v79 = v36;
    uint64_t aBlock = _NSConcreteStackBlock;
    uint64_t v75 = 1107296256;
    NSString v76 = sub_40CD0;
    UIAccessibilityNotifications v77 = &unk_6E070;
    uint64_t v64 = _Block_copy(&aBlock);
    uint64_t v65 = v10;
    id v66 = v2;
    swift_release();
    sub_46750();
    uint64_t aBlock = (void **)_swiftEmptyArrayStorage;
    sub_3DAA8();
    sub_305B8(&qword_82AF0);
    sub_3DB00();
    uint64_t v37 = v73;
    sub_46920();
    double v38 = v64;
    id v39 = (void *)v67;
    sub_468B0();
    _Block_release(v38);

    (*(void (**)(char *, uint64_t))(v72 + 8))(v6, v37);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v9, v71);
    ((void (*)(char *, uint64_t))v68)(v16, v65);
    sub_3A4C8(1u, 1, 0.0);
  }
  if ([a1 state] != (char *)&def_3AC7C + 3
    && [a1 state] != &dword_4
    && v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state]
     - 1 <= 2)
  {
    if (v69) {
      unsigned __int8 v40 = 1;
    }
    else {
      unsigned __int8 v40 = 2;
    }
    sub_3A4C8(v40, 1, 0.0);
  }
  if ([a1 state] == (char *)&def_3AC7C + 3 || objc_msgSend(a1, "state") == &dword_4)
  {
    switch(v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state])
    {
      case 1:
        if (v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_recordingStartTime + 8]) {
          goto LABEL_42;
        }
        CGRect v45 = *(void **)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
        if (!v45) {
          goto LABEL_49;
        }
        double v46 = *(double *)&v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_recordingStartTime];
        [v45 targetTimestamp];
        if (v47 - v46 >= 0.8)
        {
LABEL_42:
          uint64_t v59 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate];
          swift_beginAccess();
          if (swift_unknownObjectWeakLoadStrong())
          {
            uint64_t v60 = *((void *)v59 + 1);
            uint64_t ObjectType = swift_getObjectType();
            (*(void (**)(char *, uint64_t, uint64_t))(v60 + 64))(v2, ObjectType, v60);
            swift_unknownObjectRelease();
          }
          sub_3A4C8(0, 1, 1.0);
          if (swift_unknownObjectWeakLoadStrong())
          {
            uint64_t v62 = *((void *)v59 + 1);
            uint64_t v63 = swift_getObjectType();
            (*(void (**)(char *, uint64_t, uint64_t))(v62 + 56))(v2, v63, v62);
LABEL_46:
            swift_unknownObjectRelease();
          }
        }
        else
        {
LABEL_32:
          unsigned __int8 v41 = 4;
LABEL_33:
          sub_3A4C8(v41, 1, 0.0);
        }
        break;
      case 2:
        uint64_t v48 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate];
        swift_beginAccess();
        if (swift_unknownObjectWeakLoadStrong())
        {
          uint64_t v49 = *((void *)v48 + 1);
          uint64_t v50 = swift_getObjectType();
          (*(void (**)(char *, uint64_t, uint64_t))(v49 + 64))(v2, v50, v49);
          swift_unknownObjectRelease();
        }
        sub_3A4C8(0, 1, 0.0);
        if (!swift_unknownObjectWeakLoadStrong()) {
          return;
        }
        uint64_t v51 = *((void *)v48 + 1);
        uint64_t v52 = swift_getObjectType();
        (*(void (**)(char *, uint64_t, uint64_t))(v51 + 72))(v2, v52, v51);
        goto LABEL_46;
      case 3:
        goto LABEL_32;
      case 4:
        sub_3A4C8(5u, 1, 0.0);
        id v42 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate];
        swift_beginAccess();
        if (!swift_unknownObjectWeakLoadStrong()) {
          return;
        }
        uint64_t v43 = *((void *)v42 + 1);
        uint64_t v44 = swift_getObjectType();
        (*(void (**)(char *, uint64_t, uint64_t))(v43 + 32))(v2, v44, v43);
        goto LABEL_46;
      case 5:
        sub_3A4C8(6u, 1, 0.0);
        id v53 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate];
        swift_beginAccess();
        if (!swift_unknownObjectWeakLoadStrong()) {
          return;
        }
        uint64_t v54 = *((void *)v53 + 1);
        uint64_t v55 = swift_getObjectType();
        (*(void (**)(char *, uint64_t, uint64_t))(v54 + 40))(v2, v55, v54);
        goto LABEL_46;
      case 6:
        sub_3A4C8(5u, 1, 0.0);
        double v56 = &v2[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate];
        swift_beginAccess();
        if (!swift_unknownObjectWeakLoadStrong()) {
          return;
        }
        uint64_t v57 = *((void *)v56 + 1);
        uint64_t v58 = swift_getObjectType();
        (*(void (**)(char *, uint64_t, uint64_t))(v57 + 48))(v2, v58, v57);
        goto LABEL_46;
      default:
        unsigned __int8 v41 = 1;
        goto LABEL_33;
    }
  }
}

void sub_3C610(void *a1)
{
  id v2 = [a1 view];
  if (!v2)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v3 = v2;
  [v2 setNeedsLayout];

  id v4 = [a1 view];
  if (!v4)
  {
LABEL_7:
    __break(1u);
    return;
  }
  id v5 = v4;
  [v4 layoutIfNeeded];
}

uint64_t sub_3C6B0(uint64_t result)
{
  if (*(unsigned __int8 *)(result
                                        + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state)
     - 1 <= 1)
  {
    uint64_t v1 = result;
    uint64_t v2 = result + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate;
    swift_beginAccess();
    id result = swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      uint64_t v3 = *(void *)(v2 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 80))(v1, ObjectType, v3);
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t AudioAppContentViewController.power(_:from:)(float a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = *(void *)(v3 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, float))(v5 + 16))(v1, ObjectType, v5, (float)(a1 + 60.0) / 50.0);
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_3C878()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_centerFillView);
  [v1 frame];
  unsigned int v2 = objc_msgSend(v1, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
  id result = 0;
  if (v2)
  {
    id v4 = *(void **)(v0 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_centerView);
    [v4 frame];
    unsigned int v5 = objc_msgSend(v4, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
    id result = 0;
    if (v5)
    {
      double v6 = *(void **)(v0 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_iconView);
      [v6 frame];
      return objc_msgSend(v6, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
    }
  }
  return result;
}

Swift::Void __swiftcall AudioAppContentViewController.didEndPlayback()()
{
}

Swift::Void __swiftcall AudioAppContentViewController.didSendMessage()()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state))
  {
    sub_3A4C8(0, 1, 0.0);
    uint64_t v1 = v0 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate;
    swift_beginAccess();
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v2 = *(void *)(v1 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 56))(v0, ObjectType, v2);
      swift_unknownObjectRelease();
    }
  }
}

Swift::Void __swiftcall AudioAppContentViewController.didCancelMessage()()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state))
  {
    sub_3A4C8(0, 1, 0.0);
    uint64_t v1 = v0 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate;
    swift_beginAccess();
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v2 = *(void *)(v1 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 72))(v0, ObjectType, v2);
      swift_unknownObjectRelease();
    }
  }
}

Swift::Void __swiftcall AudioAppContentViewController.restoreForPlayback()()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state) != 5) {
    sub_3A4C8(5u, 1, 0.0);
  }
}

Swift::Void __swiftcall AudioAppContentViewController.startRecording()()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state) != 4) {
    sub_3A4C8(4u, 1, 0.0);
  }
}

uint64_t AudioAppContentViewController.shouldStopRecordingOrPlayback(with:)(uint64_t (*a1)(BOOL, BOOL))
{
  int v3 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_state);
  if ((v3 | 2) == 6) {
    sub_3A4C8(5u, 1, 0.0);
  }
  return a1(v3 == 4, v3 == 6);
}

id AudioAppContentViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    NSString v6 = sub_467A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

void AudioAppContentViewController.init(nibName:bundle:)()
{
}

uint64_t type metadata accessor for AudioAppContentViewController()
{
  uint64_t result = qword_82940;
  if (!qword_82940) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_3CC8C(uint64_t a1, void *a2)
{
  int v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  unsigned int v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t sub_3CCF4(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_3CD04(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_3CD40(uint64_t (*a1)(void))
{
  return a1();
}

void sub_3CD68(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  NSString v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_468F0();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unsigned char **sub_3CE20(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  id v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_3CE30()
{
  return type metadata accessor for AudioAppContentViewController();
}

uint64_t sub_3CE38()
{
  uint64_t result = sub_46730();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t type metadata accessor for AudioAppContentViewController.CalloutView()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for State(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for State(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for State(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x3D0E8);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_3D110(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_3D118(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for State()
{
  return &type metadata for State;
}

unint64_t sub_3D134()
{
  unint64_t result = qword_82AC8;
  if (!qword_82AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_82AC8);
  }
  return result;
}

id sub_3D188(char a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 1:
      if (((1 << a1) & 0x1D) == 0) {
        goto LABEL_38;
      }
      goto LABEL_5;
    case 2:
      if (((1 << a1) & 0x1D) != 0)
      {
LABEL_5:
        id v4 = [self systemRedColor];
      }
      else if (((1 << a1) & 0x60) != 0)
      {
        uint64_t v12 = self;
        if (a2 == 2) {
          id v4 = [v12 blackColor];
        }
        else {
          id v4 = [v12 secondaryLabelColor];
        }
      }
      else
      {
        id v4 = [self whiteColor];
      }
      goto LABEL_39;
    case 3:
      if (((1 << a1) & 0x1D) != 0)
      {
        id v5 = [self systemRedColor];
        id v6 = v5;
        if (a2 == 2)
        {
          id v7 = [v5 colorWithAlphaComponent:0.39];
          goto LABEL_52;
        }
LABEL_26:
        id v7 = [v5 colorWithAlphaComponent:0.18];
        goto LABEL_52;
      }
      if (((1 << a1) & 0x60) != 0)
      {
        id v5 = [self secondaryLabelColor];
        id v6 = v5;
        if (a2 == 2) {
          return v6;
        }
        goto LABEL_26;
      }
LABEL_38:
      id v4 = [self systemBlueColor];
LABEL_39:
      return v4;
    case 4:
      if (((1 << a1) & 0x1D) != 0)
      {
        id v8 = [self systemRedColor];
        id v6 = v8;
        if (a2 == 2)
        {
LABEL_13:
          id v7 = [v8 colorWithAlphaComponent:0.26];
          goto LABEL_52;
        }
        goto LABEL_34;
      }
      if (((1 << a1) & 0x60) == 0)
      {
        id v8 = [self systemBlueColor];
        id v6 = v8;
        if (a2 == 2) {
          goto LABEL_13;
        }
LABEL_34:
        id v7 = [v8 colorWithAlphaComponent:0.0];
        goto LABEL_52;
      }
      uint64_t v13 = self;
      if (a2 == 2)
      {
        id v14 = [v13 tertiarySystemFillColor];
        id v15 = [v14 colorWithAlphaComponent:0.26];
      }
      else
      {
        id v14 = [v13 secondaryLabelColor];
        id v15 = [v14 colorWithAlphaComponent:0.0];
      }
      goto LABEL_48;
    case 5:
      if (((1 << a1) & 0x1D) != 0)
      {
        id v9 = [self systemRedColor];
        id v6 = v9;
        if (a2 == 2)
        {
LABEL_16:
          id v7 = [v9 colorWithAlphaComponent:0.48];
          goto LABEL_52;
        }
        goto LABEL_51;
      }
      if (((1 << a1) & 0x60) == 0)
      {
        id v9 = [self systemBlueColor];
        id v6 = v9;
        if (a2 == 2) {
          goto LABEL_16;
        }
LABEL_51:
        id v7 = [v9 colorWithAlphaComponent:0.1];
LABEL_52:
        id v17 = v7;

        return v17;
      }
      id v16 = self;
      if (a2 == 2)
      {
        id v14 = [v16 tertiarySystemFillColor];
        id v15 = [v14 colorWithAlphaComponent:0.48];
      }
      else
      {
        id v14 = [v16 secondaryLabelColor];
        id v15 = [v14 colorWithAlphaComponent:0.1];
      }
LABEL_48:
      id v6 = v15;

      return v6;
    default:
      if (a2 == 2)
      {
        id v4 = [self tertiarySystemBackgroundColor];
        goto LABEL_39;
      }
      id v10 = objc_allocWithZone((Class)UIColor);
      return [v10 initWithWhite:1.0 alpha:0.8];
  }
}

void sub_3D714()
{
  unint64_t v1 = &v0[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_textInset];
  _OWORD *v1 = xmmword_63150;
  v1[1] = xmmword_63160;
  *(_OWORD *)&v0[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_arrowSize] = xmmword_63170;
  *(void *)&v0[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_maxWidth] = 0x7FF0000000000000;
  *(void *)&v0[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_maxHeight] = 0;
  *(void *)&v0[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_cornerRadius] = 0x402E000000000000;
  v0[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_arrowPointingDown] = 1;
  uint64_t v2 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_backdropColor;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)UIColor) init];
  int v3 = &v0[OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_text];
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_textColor;
  id v5 = self;
  *(void *)&v0[v4] = [v5 labelColor];
  uint64_t v6 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_shadowColor;
  *(void *)&v0[v6] = [v5 blackColor];
  uint64_t v7 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_shapeView;
  *(void *)&v0[v7] = sub_35CEC();
  uint64_t v8 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_backgroundView;
  *(void *)&v0[v8] = sub_35E34();
  uint64_t v9 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_shadowView;
  type metadata accessor for ShadowView();
  id v10 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  id v11 = [v10 layer];
  LODWORD(v12) = 1028443341;
  [v11 setShadowOpacity:v12];

  id v13 = [v10 layer];
  [v13 setShadowRadius:20.0];

  id v14 = [v10 layer];
  objc_msgSend(v14, "setShadowOffset:", 0.0, 3.0);

  *(void *)&v0[v9] = v10;
  uint64_t v15 = OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_labelView;
  *(void *)&v0[v15] = sub_3617C();

  sub_469F0();
  __break(1u);
}

id sub_3D964()
{
  return objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_labelView), "textRectForBounds:limitedToNumberOfLines:", 2, sub_3DA34(0.0, 0.0, *(double *)(v0+ OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_maxWidth), *(double *)(v0+ OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_maxHeight), 5.0, 14.0));
}

double sub_3DA34(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_3DA50()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_3DA88(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_3DA98()
{
  return swift_release();
}

uint64_t sub_3DAA0()
{
  return sub_3C6B0(*(void *)(v0 + 16));
}

unint64_t sub_3DAA8()
{
  unint64_t result = qword_82AE8;
  if (!qword_82AE8)
  {
    sub_46740();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_82AE8);
  }
  return result;
}

unint64_t sub_3DB00()
{
  unint64_t result = qword_82AF8;
  if (!qword_82AF8)
  {
    sub_3DB5C(&qword_82AF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_82AF8);
  }
  return result;
}

uint64_t sub_3DB5C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_3DBA4()
{
  return _swift_deallocObject(v0, 25, 7);
}

id sub_3DBDC()
{
  return sub_36FCC(*(void **)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_3DBE8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_3DC24(uint64_t a1)
{
  return a1;
}

uint64_t sub_3DC4C()
{
  return _swift_deallocObject(v0, 18, 7);
}

id sub_3DC5C(uint64_t a1)
{
  return sub_3D188(*(unsigned char *)(v1 + 17), a1, *(unsigned char *)(v1 + 16));
}

uint64_t sub_3DC6C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_3DCA4(void *a1)
{
  return sub_45DD4(a1, *(uint64_t (**)(id))(v1 + 16));
}

uint64_t sub_3DCAC()
{
  return _swift_deallocObject(v0, 18, 7);
}

uint64_t sub_3DCBC()
{
  return _swift_deallocObject(v0, 18, 7);
}

void sub_3DCCC()
{
  sub_3C610(*(void **)(v0 + 16));
}

id sub_3DCE8()
{
  if (*(unsigned char *)(v0 + 16) == 1) {
    return [*(id *)(v0 + 24) removeFromSuperview];
  }
  return result;
}

uint64_t sub_3DD08()
{
  return _swift_deallocObject(v0, 18, 7);
}

uint64_t sub_3DD18()
{
  return _swift_deallocObject(v0, 48, 7);
}

id sub_3DD50()
{
  return sub_39358(*(void *)(v0 + 16), *(CGFloat *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40));
}

uint64_t sub_3DD60()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_3DD70()
{
  return sub_2F5C0(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_3DD78()
{
  return _swift_deallocObject(v0, 18, 7);
}

uint64_t sub_3DD88()
{
  return _swift_deallocObject(v0, 18, 7);
}

uint64_t sub_3DD98()
{
  return _swift_deallocObject(v0, 18, 7);
}

void sub_3DEB4()
{
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for AMUnavailableViewController();
  objc_msgSendSuper2(&v12, "viewDidLoad");
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC22AudioMessagesExtension27AMUnavailableViewController_conversation];
  if (!v1)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v2 = [v1 remoteParticipantIdentifiers];
  sub_466E0();
  uint64_t v3 = sub_46820();

  uint64_t v4 = *(void *)(v3 + 16);
  swift_bridgeObjectRelease();
  if (!v4)
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  if ([self isCurrentEntryViewEmpty]) {
    return;
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
LABEL_11:
    __break(1u);
    return;
  }
LABEL_7:
  uint64_t v6 = (void *)Strong;
  type metadata accessor for AMMessagesViewController(0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v8 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v9 = sub_467A0();
  id v10 = [v8 localizedStringForKey:v9 value:0 table:0];

  sub_467B0();
  NSString v11 = sub_467A0();
  swift_bridgeObjectRelease();
  [v6 setText:v11];
}

id sub_3E288()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMUnavailableViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AMUnavailableViewController()
{
  return self;
}

id sub_3E478()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMWaveFormViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AMWaveFormViewController()
{
  return self;
}

double interpolate(from:to:progress:)(double a1, double a2, double a3)
{
  return (a2 - a1) * a3 + a1;
}

double clamp(value:from:to:)(double result, double a2, double a3)
{
  if (a3 < result) {
    id result = a3;
  }
  if (result < a2) {
    return a2;
  }
  return result;
}

uint64_t sub_3E4F4(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    uint64_t v3 = _swiftEmptyArrayStorage;
    if (!v2) {
      return (uint64_t)v3;
    }
    id v14 = _swiftEmptyArrayStorage;
    uint64_t result = sub_33FB8(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v5 = 0;
    uint64_t v3 = v14;
    while (v2 != v5)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v6 = (id)sub_46960();
      }
      else {
        id v6 = *(id *)(a1 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      id v8 = objc_msgSend(v6, "CGColor", (void)v12);
      type metadata accessor for CGColor(0);
      uint64_t v13 = v9;

      *(void *)&long long v12 = v8;
      id v14 = v3;
      unint64_t v11 = v3[2];
      unint64_t v10 = v3[3];
      if (v11 >= v10 >> 1)
      {
        sub_33FB8(v10 > 1, v11 + 1, 1);
        uint64_t v3 = v14;
      }
      ++v5;
      v3[2] = v11 + 1;
      sub_31A84(&v12, &v3[4 * v11 + 4]);
      if (v2 == v5) {
        return (uint64_t)v3;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_46A00();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t static GradientView.layerClass.getter()
{
  return sub_33F38(0, &qword_82BD8);
}

uint64_t GradientView.gradientLayer.getter()
{
  id v1 = [v0 layer];
  self;

  return swift_dynamicCastObjCClassUnconditional();
}

void *GradientView.colors.getter()
{
  id v1 = [v0 layer];
  self;
  uint64_t v2 = [(id)swift_dynamicCastObjCClassUnconditional() colors];

  if (v2)
  {
    uint64_t v3 = sub_46820();

    uint64_t v2 = _swiftEmptyArrayStorage;
    unint64_t v13 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v4 = *(void *)(v3 + 16);
    if (v4)
    {
      uint64_t v5 = v3 + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_31A24(v5, (uint64_t)v12);
        sub_31924(v12, v12[3]);
        id v6 = (const void *)sub_46A50();
        CFTypeID v7 = CFGetTypeID(v6);
        swift_unknownObjectRelease();
        if (v7 == CGColorGetTypeID())
        {
          sub_31A24((uint64_t)v12, (uint64_t)v11);
          type metadata accessor for CGColor(0);
          swift_dynamicCast();
          id v8 = [objc_allocWithZone((Class)UIColor) initWithCGColor:v10];

          sub_31810((uint64_t)v12);
          if (v8)
          {
            sub_46800();
            if (*(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                           + (v13 & 0xFFFFFFFFFFFFFF8)) >> 1)
              sub_46840();
            sub_46850();
            sub_46830();
          }
        }
        else
        {
          sub_31810((uint64_t)v12);
        }
        v5 += 32;
        --v4;
      }
      while (v4);
      swift_bridgeObjectRelease();
      uint64_t v2 = (void *)v13;
    }
    swift_bridgeObjectRelease();
  }
  return v2;
}

void GradientView.colors.setter(unint64_t a1)
{
  if (a1)
  {
    id v3 = [v1 layer];
    self;
    uint64_t v4 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_3E4F4(a1);
    swift_bridgeObjectRelease();
    Class isa = sub_46810().super.isa;
    swift_bridgeObjectRelease();
    [v4 setColors:isa];
  }
  else
  {
    id v6 = [v1 layer];
    self;
    [(id)swift_dynamicCastObjCClassUnconditional() setColors:0];
  }
}

uint64_t (*GradientView.colors.modify(void *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = GradientView.colors.getter();
  return sub_3EADC;
}

uint64_t sub_3EADC(uint64_t *a1, char a2)
{
  return sub_3EF38(a1, a2, (uint64_t (*)(uint64_t))GradientView.colors.setter);
}

void *GradientView.locations.getter()
{
  id v1 = [v0 layer];
  self;
  uint64_t v2 = [(id)swift_dynamicCastObjCClassUnconditional() locations];

  if (!v2) {
    return v2;
  }
  sub_33F38(0, &qword_826C0);
  unint64_t v3 = sub_46820();

  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_46A00();
  swift_bridgeObjectRelease();
  if (!v4)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
LABEL_4:
  uint64_t result = (void *)sub_33F74(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = 0;
    uint64_t v2 = _swiftEmptyArrayStorage;
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v7 = (id)sub_46960();
      }
      else {
        id v7 = *(id *)(v3 + 8 * v6 + 32);
      }
      id v8 = v7;
      [v7 doubleValue];
      uint64_t v10 = v9;

      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_33F74(v11 > 1, v12 + 1, 1);
      }
      ++v6;
      _swiftEmptyArrayStorage[2] = v12 + 1;
      _swiftEmptyArrayStorage[v12 + 4] = v10;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    return v2;
  }
  __break(1u);
  return result;
}

void GradientView.locations.setter(uint64_t a1)
{
  if (a1)
  {
    id v3 = [v1 layer];
    self;
    uint64_t v4 = (void *)swift_dynamicCastObjCClassUnconditional();
    uint64_t v5 = *(void *)(a1 + 16);
    if (v5)
    {
      sub_469B0();
      uint64_t v6 = 0;
      do
      {
        uint64_t v7 = v6 + 1;
        [objc_allocWithZone((Class)NSNumber) initWithDouble:*(double *)(a1 + 8 * v6 + 32)];
        sub_46990();
        sub_469C0();
        sub_469D0();
        sub_469A0();
        uint64_t v6 = v7;
      }
      while (v5 != v7);
    }
    swift_bridgeObjectRelease();
    sub_33F38(0, &qword_826C0);
    Class isa = sub_46810().super.isa;
    swift_bridgeObjectRelease();
    [v4 setLocations:isa];
  }
  else
  {
    Class isa = (Class)[v1 layer];
    self;
    [(id)swift_dynamicCastObjCClassUnconditional() setLocations:0];
  }
}

uint64_t (*GradientView.locations.modify(void *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = GradientView.locations.getter();
  return sub_3EF20;
}

uint64_t sub_3EF20(uint64_t *a1, char a2)
{
  return sub_3EF38(a1, a2, (uint64_t (*)(uint64_t))GradientView.locations.setter);
}

uint64_t sub_3EF38(uint64_t *a1, char a2, uint64_t (*a3)(uint64_t))
{
  if ((a2 & 1) == 0) {
    return a3(*a1);
  }
  uint64_t v4 = swift_bridgeObjectRetain();
  a3(v4);

  return swift_bridgeObjectRelease();
}

double GradientView.startPoint.getter()
{
  return sub_3F07C((SEL *)&selRef_startPoint);
}

void GradientView.startPoint.setter(double a1, double a2)
{
}

void (*GradientView.startPoint.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  a1[2] = v1;
  id v3 = [v1 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() startPoint];
  uint64_t v5 = v4;
  uint64_t v7 = v6;

  *a1 = v5;
  a1[1] = v7;
  return sub_3F064;
}

void sub_3F064(uint64_t a1, uint64_t a2)
{
}

double GradientView.endPoint.getter()
{
  return sub_3F07C((SEL *)&selRef_endPoint);
}

double sub_3F07C(SEL *a1)
{
  id v3 = [v1 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() *a1];
  double v5 = v4;

  return v5;
}

void GradientView.endPoint.setter(double a1, double a2)
{
}

void sub_3F10C(SEL *a1, double a2, double a3)
{
  id v7 = [v3 layer];
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), *a1, a2, a3);
}

void (*GradientView.endPoint.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  a1[2] = v1;
  id v3 = [v1 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() endPoint];
  uint64_t v5 = v4;
  uint64_t v7 = v6;

  *a1 = v5;
  a1[1] = v7;
  return sub_3F24C;
}

void sub_3F24C(uint64_t a1, uint64_t a2)
{
}

void sub_3F258(uint64_t a1, uint64_t a2, SEL *a3)
{
  double v4 = *(double *)a1;
  double v5 = *(double *)(a1 + 8);
  id v6 = [*(id *)(a1 + 16) layer];
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), *a3, v4, v5);
}

id GradientView.type.getter()
{
  id v1 = [v0 layer];
  self;
  id v2 = [(id)swift_dynamicCastObjCClassUnconditional() type];

  return v2;
}

void GradientView.type.setter(void *a1)
{
  id v2 = [v1 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() setType:a1];
}

void (*GradientView.type.modify(void *a1))(void **a1, char a2)
{
  a1[1] = v1;
  id v3 = [v1 layer];
  self;
  id v4 = [(id)swift_dynamicCastObjCClassUnconditional() type];

  *a1 = v4;
  return sub_3F4A8;
}

void sub_3F4A8(void **a1, char a2)
{
  id v2 = *a1;
  id v3 = a1[1];
  if (a2)
  {
    id v4 = v2;
    id v5 = [v3 layer];
    self;
    [(id)swift_dynamicCastObjCClassUnconditional() setType:v4];
  }
  else
  {
    id v5 = [a1[1] layer];
    self;
    [(id)swift_dynamicCastObjCClassUnconditional() setType:v2];
  }
}

id GradientView.action(for:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v7 = a2 == 0x73726F6C6F63 && a3 == 0xE600000000000000;
  if (v7
    || (sub_46A60() & 1) != 0
    || a2 == 0x6E6F697461636F6CLL && a3 == 0xE900000000000073
    || (sub_46A60() & 1) != 0
    || a2 == 0x696F507472617473 && a3 == 0xEA0000000000746ELL
    || (sub_46A60() & 1) != 0
    || a2 == 0x746E696F50646E65 && a3 == 0xE800000000000000
    || (sub_46A60() & 1) != 0)
  {
    NSString v8 = sub_467A0();
    v15.receiver = v3;
    v15.super_class = (Class)type metadata accessor for GradientView();
    id v9 = objc_msgSendSuper2(&v15, "actionForLayer:forKey:", a1, v8);

    id v10 = [v3 layer];
    self;
    unint64_t v11 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v12 = sub_4037C(a2, a3, v11, (uint64_t)v9);
    swift_unknownObjectRelease();
  }
  else
  {
    NSString v14 = sub_467A0();
    v16.receiver = v3;
    v16.super_class = (Class)type metadata accessor for GradientView();
    id v12 = objc_msgSendSuper2(&v16, "actionForLayer:forKey:", a1, v14);
  }
  return v12;
}

id GradientView.init(frame:)(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for GradientView();
  return objc_msgSendSuper2(&v10, "initWithFrame:", a1, a2, a3, a4);
}

id GradientView.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GradientView();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id GradientView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GradientView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for GradientView()
{
  return self;
}

uint64_t static BackdropView.layerClass.getter()
{
  return sub_33F38(0, &qword_82C08);
}

uint64_t BackdropView.backdropLayer.getter()
{
  id v1 = [v0 layer];
  self;

  return swift_dynamicCastObjCClassUnconditional();
}

id BackdropView.action(for:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0xD000000000000020 && a3 == 0x80000000000675E0 || (sub_46A60() & 1) != 0)
  {
    NSString v7 = sub_467A0();
    v14.receiver = v3;
    v14.super_class = (Class)type metadata accessor for BackdropView();
    id v8 = objc_msgSendSuper2(&v14, "actionForLayer:forKey:", a1, v7);

    id v9 = [v3 layer];
    self;
    objc_super v10 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v11 = sub_4037C(a2, a3, v10, (uint64_t)v8);
    swift_unknownObjectRelease();
  }
  else
  {
    NSString v12 = sub_467A0();
    v15.receiver = v3;
    v15.super_class = (Class)type metadata accessor for BackdropView();
    id v11 = objc_msgSendSuper2(&v15, "actionForLayer:forKey:", a1, v12);
  }
  return v11;
}

uint64_t type metadata accessor for BackdropView()
{
  return self;
}

id BackdropView.init(frame:)(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for BackdropView();
  return objc_msgSendSuper2(&v10, "initWithFrame:", a1, a2, a3, a4);
}

id BackdropView.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for BackdropView();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id BackdropView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BackdropView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static BackdropView.blur()()
{
  type metadata accessor for BackdropView();
  id v0 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  sub_467B0();
  id v1 = objc_allocWithZone((Class)CAFilter);
  NSString v2 = sub_467A0();
  swift_bridgeObjectRelease();
  id v3 = [v1 initWithType:v2];

  Class isa = sub_46870().super.super.isa;
  NSString v5 = sub_467A0();
  [v3 setValue:isa forKey:v5];

  Class v6 = sub_46860().super.super.isa;
  NSString v7 = sub_467A0();
  [v3 setValue:v6 forKey:v7];

  id v8 = [v0 layer];
  sub_305B8(&qword_82AD0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_62E10;
  *(void *)(v9 + 56) = sub_33F38(0, &qword_82AD8);
  *(void *)(v9 + 32) = v3;
  id v10 = v3;
  Class v11 = sub_46810().super.isa;
  swift_bridgeObjectRelease();
  [v8 setFilters:v11];

  return v0;
}

void BackdropView.blurRadius.getter()
{
  id v1 = [v0 layer];
  NSString v2 = sub_467A0();
  id v3 = [v1 valueForKeyPath:v2];

  if (v3)
  {
    sub_46910();
    swift_unknownObjectRelease();
    sub_31A84(&v4, &v5);
    swift_dynamicCast();
  }
  else
  {
    __break(1u);
  }
}

void BackdropView.blurRadius.setter()
{
  id v1 = [v0 layer];
  Class isa = sub_46700().super.super.isa;
  NSString v3 = sub_467A0();
  [v1 setValue:isa forKeyPath:v3];
}

void (*BackdropView.blurRadius.modify(void *a1))(uint64_t a1)
{
  a1[1] = v1;
  BackdropView.blurRadius.getter();
  *a1 = v3;
  return sub_402CC;
}

void sub_402CC(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 8) layer];
  Class isa = sub_46700().super.super.isa;
  NSString v2 = sub_467A0();
  [v3 setValue:isa forKeyPath:v2];
}

id sub_4037C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (!a4) {
    return [objc_allocWithZone((Class)NSNull) init];
  }
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (!v5)
  {
    self;
    uint64_t v24 = swift_dynamicCastObjCClass();
    if (v24)
    {
      uint64_t v25 = (void *)v24;
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      NSString v26 = sub_467A0();
      swift_bridgeObjectRelease();
      id v27 = [self animationWithKeyPath:v26];

      NSString v28 = sub_467A0();
      id v29 = [a3 valueForKey:v28];

      [v27 setFromValue:v29];
      swift_unknownObjectRelease();
      id v30 = v27;
      id v31 = [v25 timingFunction];
      [v30 setTimingFunction:v31];

      id v32 = v30;
      objc_msgSend(v32, "setDelegate:", objc_msgSend(v25, "delegate"));
      swift_unknownObjectRelease();

      id v33 = v32;
      objc_msgSend(v33, "setAutoreverses:", objc_msgSend(v25, "autoreverses"));

      id v34 = v33;
      [v25 beginTime];
      objc_msgSend(v34, "setBeginTime:");

      id v35 = v34;
      [v25 duration];
      objc_msgSend(v35, "setDuration:");

      id v36 = v35;
      id v37 = [v25 fillMode];
      [v36 setFillMode:v37];

      id v38 = v36;
      [v25 repeatCount];
      objc_msgSend(v38, "setRepeatCount:");

      id v39 = v38;
      [v25 repeatDuration];
      objc_msgSend(v39, "setRepeatDuration:");

      id v40 = v39;
      [v25 speed];
      objc_msgSend(v40, "setSpeed:");

      id v41 = v40;
      [v25 timeOffset];
      objc_msgSend(v41, "setTimeOffset:");

      id v22 = v41;
      id v23 = [v25 beginTimeMode];
      goto LABEL_6;
    }
    return [objc_allocWithZone((Class)NSNull) init];
  }
  Class v6 = (void *)v5;
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  NSString v7 = sub_467A0();
  swift_bridgeObjectRelease();
  id v8 = [self animationWithKeyPath:v7];

  id v9 = v8;
  NSString v10 = sub_467A0();
  id v11 = [a3 valueForKey:v10];

  [v9 setFromValue:v11];
  swift_unknownObjectRelease();
  [v6 mass];
  objc_msgSend(v9, "setMass:");
  [v6 stiffness];
  objc_msgSend(v9, "setStiffness:");
  [v6 damping];
  objc_msgSend(v9, "setDamping:");
  [v6 initialVelocity];
  objc_msgSend(v9, "setInitialVelocity:");
  id v12 = v9;
  objc_msgSend(v12, "setDelegate:", objc_msgSend(v6, "delegate"));
  swift_unknownObjectRelease();

  id v13 = v12;
  objc_msgSend(v13, "setAutoreverses:", objc_msgSend(v6, "autoreverses"));

  id v14 = v13;
  [v6 beginTime];
  objc_msgSend(v14, "setBeginTime:");

  id v15 = v14;
  [v6 duration];
  objc_msgSend(v15, "setDuration:");

  id v16 = v15;
  id v17 = [v6 fillMode];
  [v16 setFillMode:v17];

  id v18 = v16;
  [v6 repeatCount];
  objc_msgSend(v18, "setRepeatCount:");

  id v19 = v18;
  [v6 repeatDuration];
  objc_msgSend(v19, "setRepeatDuration:");

  id v20 = v19;
  [v6 speed];
  objc_msgSend(v20, "setSpeed:");

  id v21 = v20;
  [v6 timeOffset];
  objc_msgSend(v21, "setTimeOffset:");

  id v22 = v21;
  id v23 = [v6 beginTimeMode];
LABEL_6:
  NSString v42 = v23;
  if (!v42)
  {
    sub_467B0();
    NSString v42 = sub_467A0();
    swift_bridgeObjectRelease();
  }
  [v22 setBeginTimeMode:v42];

  swift_unknownObjectRelease();
  return v22;
}

double Spring.init(dampingRatio:response:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  double v3 = 6.28318531 / a3 * (6.28318531 / a3);
  double v4 = sqrt(v3);
  double result = (v4 + v4) * a2;
  *(double *)a1 = v3;
  *(double *)(a1 + 8) = result;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  return result;
}

Swift::Void __swiftcall Spring.update(dt:)(Swift::Double dt)
{
  double v3 = v1[3];
  double v4 = v1[2] - v3;
  double v5 = v1[4];
  double v6 = sqrt(*v1);
  double v7 = v1[1] * 0.5;
  double v8 = -v7;
  double v9 = exp(-(v7 * dt));
  double v10 = v5 + v7 * v4;
  if (v7 >= v6)
  {
    if (v6 >= v7)
    {
      double v15 = v4 + v10 * dt;
      double v23 = v9 * v10;
      double v22 = v9 * v8 * v15;
      goto LABEL_7;
    }
    double v17 = sqrt(v7 * v7 - v6 * v6);
    long double v18 = v17 * dt;
    double v19 = v10 / v17;
    double v20 = cosh(v18);
    long double v21 = sinh(v18);
    double v15 = v4 * v20 + v19 * v21;
    double v16 = v17 * (v19 * v20) + v17 * (v4 * v21);
  }
  else
  {
    double v11 = sqrt(v6 * v6 - v7 * v7);
    double v12 = v11 * dt;
    double v13 = v10 / v11;
    __double2 v14 = __sincos_stret(v12);
    double v15 = v4 * v14.__cosval + v13 * v14.__sinval;
    double v16 = v11 * (v13 * v14.__cosval) - v11 * (v4 * v14.__sinval);
  }
  double v22 = v9 * v16;
  double v23 = v9 * v8 * v15;
LABEL_7:
  v1[2] = v3 + v9 * v15;
  v1[4] = v23 + v22;
}

void Spring.set(value:velocity:)(double a1, double a2)
{
  *(double *)(v2 + 16) = a1;
  *(double *)(v2 + 32) = a2;
}

double Spring.stiffness.getter()
{
  return *(double *)v0;
}

double Spring.damping.getter()
{
  return *(double *)(v0 + 8);
}

double Spring.value.getter()
{
  return *(double *)(v0 + 16);
}

void Spring.value.setter(double a1)
{
  *(double *)(v1 + 16) = a1;
}

uint64_t (*Spring.value.modify())()
{
  return AudioAppContentViewController.buffer(_:from:);
}

double Spring.target.getter()
{
  return *(double *)(v0 + 24);
}

void Spring.target.setter(double a1)
{
  *(double *)(v1 + 24) = a1;
}

uint64_t (*Spring.target.modify())()
{
  return AudioAppContentViewController.buffer(_:from:);
}

double Spring.velocity.getter()
{
  return *(double *)(v0 + 32);
}

void Spring.velocity.setter(double a1)
{
  *(double *)(v1 + 32) = a1;
}

uint64_t (*Spring.velocity.modify())()
{
  return AudioAppContentViewController.buffer(_:from:);
}

void Spring.init(stiffness:damping:)(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
}

__n128 initializeWithCopy for Spring(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for Spring(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Spring(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
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
  *(unsigned char *)(result + 40) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Spring()
{
  return &type metadata for Spring;
}

uint64_t sub_40CD0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_40D14(uint64_t a1, uint64_t a2)
{
  char v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_40D68()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.980392157 green:0.882352941 blue:0.882352941 alpha:1.0];
  qword_83478 = (uint64_t)result;
  return result;
}

id sub_40DB8()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.337254902 green:0.623529412 blue:0.97254902 alpha:1.0];
  qword_83480 = (uint64_t)result;
  return result;
}

id sub_40E0C()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.937254902 green:0.929411765 blue:0.937254902 alpha:1.0];
  qword_83488 = (uint64_t)result;
  return result;
}

id sub_40E58()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.980392157 green:0.882352941 blue:0.882352941 alpha:1.0];
  qword_83490 = (uint64_t)result;
  return result;
}

id sub_40EA8()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.337254902 green:0.623529412 blue:0.97254902 alpha:1.0];
  qword_83498 = (uint64_t)result;
  return result;
}

id sub_40EFC()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.937254902 green:0.929411765 blue:0.937254902 alpha:1.0];
  qword_834A0 = (uint64_t)result;
  return result;
}

id sub_40F48()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.925490196 green:0.329411765 blue:0.270588235 alpha:1.0];
  qword_834A8 = (uint64_t)result;
  return result;
}

id sub_40F98()
{
  id result = [self whiteColor];
  qword_834B0 = (uint64_t)result;
  return result;
}

id sub_40FD4()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.556862745 green:0.556862745 blue:0.576470588 alpha:1.0];
  qword_834B8 = (uint64_t)result;
  return result;
}

void sub_41020()
{
  uint64_t v1 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_audioMessagingState;
  if (v0[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_audioMessagingState] == 3) {
    double v2 = 86.4;
  }
  else {
    double v2 = 108.0;
  }
  char v3 = *(void **)&v0[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButtonWidthAnchor];
  if (!v3)
  {
LABEL_226:
    __break(1u);
    goto LABEL_227;
  }
  [v3 setConstant:v2];
  double v4 = *(void **)&v0[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButtonHeightAnchor];
  if (!v4)
  {
LABEL_227:
    __break(1u);
LABEL_228:
    __break(1u);
LABEL_229:
    __break(1u);
LABEL_230:
    __break(1u);
LABEL_231:
    __break(1u);
LABEL_232:
    __break(1u);
LABEL_233:
    __break(1u);
LABEL_234:
    __break(1u);
LABEL_235:
    __break(1u);
    goto LABEL_236;
  }
  [v4 setConstant:v2];
  double v5 = self;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v0;
  *(double *)(v6 + 24) = v2;
  v218 = (uint64_t (*)())sub_45B7C;
  uint64_t v219 = v6;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v215 = 1107296256;
  v216 = sub_40CD0;
  v217 = &unk_6E7D0;
  uint64_t v7 = (uint64_t)_Block_copy(&aBlock);
  double v8 = v0;
  swift_release();
  v218 = AudioAppContentViewController.buffer(_:from:);
  uint64_t v219 = 0;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v215 = 1107296256;
  v216 = sub_40D14;
  v217 = &unk_6E7F8;
  double v9 = _Block_copy(&aBlock);
  id v212 = v5;
  [v5 animateWithDuration:0 delay:v7 options:v9 animations:0.075 completion:0.0];
  _Block_release(v9);
  _Block_release((const void *)v7);
  v213 = v8;
  switch(v0[v1])
  {
    case 1:
      double v10 = *(void **)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton];
      if (!v10) {
        goto LABEL_228;
      }
      id v11 = v10;
      sub_44598(1);

      double v12 = (char **)OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_currentWavePulsingViews;
      unint64_t v13 = *(void *)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_currentWavePulsingViews];
      if (!v13) {
        goto LABEL_109;
      }
      if (v13 >> 62)
      {
        swift_bridgeObjectRetain_n();
        uint64_t v14 = sub_46A00();
        if (!v14) {
          goto LABEL_108;
        }
      }
      else
      {
        uint64_t v14 = *(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain_n();
        if (!v14) {
          goto LABEL_108;
        }
      }
      if (v14 >= 1)
      {
        uint64_t v15 = 0;
        do
        {
          if ((v13 & 0xC000000000000001) != 0) {
            id v16 = (id)sub_46960();
          }
          else {
            id v16 = *(id *)(v13 + 8 * v15 + 32);
          }
          double v17 = v16;
          ++v15;
          id v18 = [v16 layer];
          [v18 removeAllAnimations];
        }
        while (v14 != v15);
LABEL_108:
        swift_bridgeObjectRelease_n();
LABEL_109:
        sub_305B8(&qword_827C0);
        uint64_t v110 = swift_allocObject();
        *(_OWORD *)(v110 + 16) = xmmword_62E20;
        if (qword_82520 != -1) {
          goto LABEL_129;
        }
        while (1)
        {
          id v111 = (id)qword_83478;
          id v112 = [v8 view];
          if (!v112) {
            goto LABEL_242;
          }
          v113 = v112;
          v114 = (objc_class *)type metadata accessor for AMWavePulsingView();
          id v115 = objc_allocWithZone(v114);
          sub_351E8(v111, v113, 54.0);
          *(void *)(v110 + 32) = v116;
          id v117 = v111;
          id v118 = [v8 view];
          if (!v118) {
            goto LABEL_243;
          }
          v119 = v118;
          id v120 = objc_allocWithZone(v114);
          sub_351E8(v117, v119, 54.0);
          *(void *)(v110 + 40) = v121;
          uint64_t aBlock = (void **)v110;
          sub_46830();
          uint64_t v122 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_inititalWavePulsingViews;
          *(void *)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_inititalWavePulsingViews] = aBlock;
          swift_bridgeObjectRelease();
          uint64_t v211 = v122;
          unint64_t v123 = *(void *)&v8[v122];
          if (!v123) {
            goto LABEL_244;
          }
          uint64_t v208 = (uint64_t)v12;
          if (v123 >> 62)
          {
            swift_bridgeObjectRetain_n();
            uint64_t v124 = sub_46A00();
            if (!v124) {
              goto LABEL_131;
            }
          }
          else
          {
            uint64_t v124 = *(void *)((char *)&dword_10 + (v123 & 0xFFFFFFFFFFFFFF8));
            swift_bridgeObjectRetain_n();
            if (!v124) {
              goto LABEL_131;
            }
          }
          uint64_t v125 = 4;
          double v126 = 0.0;
          uint64_t v110 = 0x4074400000000000;
          while (1)
          {
            v127 = (v123 & 0xC000000000000001) != 0
                 ? (char *)sub_46960()
                 : (char *)*(id *)(v123 + 8 * v125);
            v128 = v127;
            double v12 = &selRef_encodeInteger_forKey_;
            uint64_t v129 = v125 - 3;
            if (__OFADD__(v125 - 4, 1)) {
              break;
            }
            v130 = *(void **)&v127[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleWidthAnchor];
            if (!v130) {
              goto LABEL_217;
            }
            [v130 setConstant:324.0];
            v131 = *(void **)&v128[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleHeightAnchor];
            if (!v131) {
              goto LABEL_218;
            }
            [v131 setConstant:324.0];
            uint64_t v132 = swift_allocObject();
            *(void *)(v132 + 16) = v128;
            v218 = (uint64_t (*)())sub_45DB0;
            uint64_t v219 = v132;
            uint64_t aBlock = _NSConcreteStackBlock;
            uint64_t v215 = 1107296256;
            v216 = sub_40CD0;
            v217 = &unk_6EAC8;
            v133 = _Block_copy(&aBlock);
            v134 = v128;
            swift_release();
            uint64_t v135 = swift_allocObject();
            *(void *)(v135 + 16) = v134;
            v218 = (uint64_t (*)())sub_45D50;
            uint64_t v219 = v135;
            uint64_t aBlock = _NSConcreteStackBlock;
            uint64_t v215 = 1107296256;
            v216 = sub_40D14;
            v217 = &unk_6EB18;
            v136 = _Block_copy(&aBlock);
            v137 = v134;
            swift_release();
            [v212 animateWithDuration:131080 delay:v133 options:v136 animations:3.0 completion:v126];
            _Block_release(v136);
            _Block_release(v133);
            double v8 = v213;
            unint64_t v138 = *(void *)&v213[v122];
            if (!v138) {
              goto LABEL_219;
            }
            if (v138 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v139 = sub_46A00();

              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v139 = *(void *)((char *)&dword_10 + (v138 & 0xFFFFFFFFFFFFFF8));
            }
            double v126 = v126 + 3.0 / (double)v139;
            ++v125;
            if (v129 == v124) {
              goto LABEL_131;
            }
          }
          __break(1u);
LABEL_129:
          swift_once();
        }
      }
      __break(1u);
      goto LABEL_208;
    case 2:
      double v19 = *(void **)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton];
      if (!v19) {
        goto LABEL_229;
      }
      id v20 = v19;
      sub_44598(2);

      long double v21 = (char **)OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_currentWavePulsingViews;
      unint64_t v22 = *(void *)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_currentWavePulsingViews];
      if (!v22) {
        goto LABEL_230;
      }
      if (v22 >> 62)
      {
        swift_bridgeObjectRetain_n();
        uint64_t v23 = sub_46A00();
        if (!v23) {
          goto LABEL_58;
        }
      }
      else
      {
        uint64_t v23 = *(void *)((char *)&dword_10 + (v22 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain_n();
        if (!v23) {
          goto LABEL_58;
        }
      }
      if (v23 < 1)
      {
        __break(1u);
LABEL_133:
        swift_bridgeObjectRetain_n();
        uint64_t v30 = sub_46A00();
        if (v30)
        {
LABEL_31:
          if (v30 < 1)
          {
LABEL_208:
            __break(1u);
            goto LABEL_209;
          }
          uint64_t v31 = 0;
          do
          {
            if ((v22 & 0xC000000000000001) != 0) {
              id v32 = (id)sub_46960();
            }
            else {
              id v32 = *(id *)(v22 + 8 * v31 + 32);
            }
            id v33 = v32;
            ++v31;
            id v34 = objc_msgSend(v32, "layer", v207);
            [v34 removeAllAnimations];
          }
          while (v30 != v31);
        }
LABEL_134:
        swift_bridgeObjectRelease_n();
LABEL_135:
        sub_305B8(&qword_827C0);
        uint64_t v140 = swift_allocObject();
        long long v210 = xmmword_62E20;
        *(_OWORD *)(v140 + 16) = xmmword_62E20;
        if (qword_82520 != -1) {
          swift_once();
        }
        id v141 = (id)qword_83478;
        uint64_t v142 = (uint64_t)&selRef_stringFromDuration_replacingDigitsWithDigit_style_;
        id v143 = [v8 view];
        if (!v143)
        {
LABEL_245:
          __break(1u);
LABEL_246:
          __break(1u);
LABEL_247:
          __break(1u);
LABEL_248:
          __break(1u);
LABEL_249:
          __break(1u);
          goto LABEL_250;
        }
        v144 = v143;
        uint64_t v7 = type metadata accessor for AMWavePulsingView();
        id v145 = objc_allocWithZone((Class)v7);
        sub_351E8(v141, v144, 54.0);
        *(void *)(v140 + 32) = v146;
        id v147 = v141;
        id v148 = [v8 view];
        if (!v148) {
          goto LABEL_246;
        }
        v149 = v148;
        id v150 = objc_allocWithZone((Class)v7);
        sub_351E8(v147, v149, 54.0);
        *(void *)(v140 + 40) = v151;
        uint64_t aBlock = (void **)v140;
        sub_46830();
        uint64_t v152 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_inititalWavePulsingViews;
        *(void *)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_inititalWavePulsingViews] = aBlock;
        swift_bridgeObjectRelease();
        uint64_t v211 = v152;
        unint64_t v38 = *(void *)&v8[v152];
        if (!v38)
        {
LABEL_152:
          uint64_t v209 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_releaseToStopWavePulsingViews;
          unint64_t v157 = *(void *)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_releaseToStopWavePulsingViews];
          if (!v157) {
            goto LABEL_163;
          }
          if (v157 >> 62)
          {
            swift_bridgeObjectRetain_n();
            uint64_t v158 = sub_46A00();
            if (v158)
            {
LABEL_155:
              if (v158 >= 1)
              {
                uint64_t v159 = 0;
                do
                {
                  if ((v157 & 0xC000000000000001) != 0) {
                    id v160 = (id)sub_46960();
                  }
                  else {
                    id v160 = *(id *)(v157 + 8 * v159 + 32);
                  }
                  v161 = v160;
                  ++v159;
                  id v162 = objc_msgSend(v160, "layer", v207);
                  [v162 removeAllAnimations];
                }
                while (v158 != v159);
                goto LABEL_162;
              }
              goto LABEL_210;
            }
          }
          else
          {
            uint64_t v158 = *(void *)((char *)&dword_10 + (v157 & 0xFFFFFFFFFFFFFF8));
            swift_bridgeObjectRetain_n();
            if (v158) {
              goto LABEL_155;
            }
          }
LABEL_162:
          swift_bridgeObjectRelease_n();
          double v8 = v213;
          uint64_t v142 = (uint64_t)&selRef_stringFromDuration_replacingDigitsWithDigit_style_;
LABEL_163:
          uint64_t v163 = swift_allocObject();
          *(_OWORD *)(v163 + 16) = v210;
          if (qword_82528 != -1) {
            goto LABEL_183;
          }
          while (1)
          {
            id v164 = (id)qword_83480;
            id v165 = [v8 *(SEL *)(v142 + 688)];
            if (!v165) {
              goto LABEL_247;
            }
            v166 = v165;
            id v167 = objc_allocWithZone((Class)v7);
            sub_351E8(v164, v166, 54.0);
            *(void *)(v163 + 32) = v168;
            id v169 = v164;
            id v170 = [v8 *(SEL *)(v142 + 688)];
            if (!v170) {
              goto LABEL_248;
            }
            v171 = v170;
            id v172 = objc_allocWithZone((Class)v7);
            sub_351E8(v169, v171, 54.0);
            *(void *)(v163 + 40) = v173;
            uint64_t aBlock = (void **)v163;
            sub_46830();
            *(void *)&v8[v209] = aBlock;
            swift_bridgeObjectRelease();
            unint64_t v174 = *(void *)&v8[v209];
            if (!v174) {
              goto LABEL_249;
            }
            if (v174 >> 62)
            {
              swift_bridgeObjectRetain_n();
              uint64_t v175 = sub_46A00();
              if (!v175)
              {
LABEL_185:
                swift_bridgeObjectRelease_n();
                unint64_t v189 = *(void *)&v8[v211];
                if (v189)
                {
                  if (v189 >> 62) {
                    goto LABEL_202;
                  }
                  uint64_t v190 = *(void *)((char *)&dword_10 + (v189 & 0xFFFFFFFFFFFFFF8));
                  swift_bridgeObjectRetain_n();
                  for (; v190; uint64_t v190 = sub_46A00())
                  {
                    uint64_t v191 = 4;
                    double v192 = 0.0;
                    while (1)
                    {
                      v193 = (v189 & 0xC000000000000001) != 0
                           ? (char *)sub_46960()
                           : (char *)*(id *)(v189 + 8 * v191);
                      v194 = v193;
                      uint64_t v195 = v191 - 3;
                      if (__OFADD__(v191 - 4, 1)) {
                        break;
                      }
                      v196 = *(void **)&v193[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleWidthAnchor];
                      if (!v196) {
                        goto LABEL_223;
                      }
                      [v196 setConstant:324.0];
                      v197 = *(void **)&v194[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleHeightAnchor];
                      if (!v197) {
                        goto LABEL_224;
                      }
                      [v197 setConstant:324.0];
                      uint64_t v198 = swift_allocObject();
                      *(void *)(v198 + 16) = v194;
                      v218 = (uint64_t (*)())sub_45DB0;
                      uint64_t v219 = v198;
                      uint64_t aBlock = _NSConcreteStackBlock;
                      uint64_t v215 = 1107296256;
                      v216 = sub_40CD0;
                      v217 = &unk_6E988;
                      v199 = _Block_copy(&aBlock);
                      v200 = v194;
                      swift_release();
                      uint64_t v201 = swift_allocObject();
                      *(void *)(v201 + 16) = v200;
                      v218 = (uint64_t (*)())sub_45D50;
                      uint64_t v219 = v201;
                      uint64_t aBlock = _NSConcreteStackBlock;
                      uint64_t v215 = 1107296256;
                      v216 = sub_40D14;
                      v217 = &unk_6E9D8;
                      v202 = _Block_copy(&aBlock);
                      v203 = v200;
                      swift_release();
                      [v212 animateWithDuration:131080 delay:v199 options:v202 animations:1.0 completion:v192];
                      _Block_release(v202);
                      _Block_release(v199);
                      double v8 = v213;
                      unint64_t v204 = *(void *)&v213[v211];
                      if (!v204) {
                        goto LABEL_225;
                      }
                      if (v204 >> 62)
                      {
                        swift_bridgeObjectRetain();
                        uint64_t v205 = sub_46A00();

                        swift_bridgeObjectRelease();
                      }
                      else
                      {
                        uint64_t v205 = *(void *)((char *)&dword_10 + (v204 & 0xFFFFFFFFFFFFFF8));
                      }
                      double v192 = v192 + 1.0 / (double)v205;
                      ++v191;
                      if (v195 == v190) {
                        goto LABEL_203;
                      }
                    }
                    __break(1u);
LABEL_202:
                    swift_bridgeObjectRetain_n();
                  }
LABEL_203:
                  swift_bridgeObjectRelease_n();
                  if (*(void *)&v8[v211])
                  {
                    if (*(void *)&v8[v209])
                    {
                      uint64_t aBlock = *(void ***)&v8[v211];
                      swift_bridgeObjectRetain();
                      unint64_t v206 = swift_bridgeObjectRetain();
                      sub_44C04(v206);
                      *(void *)&v8[v207] = aBlock;
                      goto LABEL_206;
                    }
LABEL_252:
                    __break(1u);
                    JUMPOUT(0x42CC0);
                  }
LABEL_251:
                  __break(1u);
                  goto LABEL_252;
                }
LABEL_250:
                __break(1u);
                goto LABEL_251;
              }
            }
            else
            {
              uint64_t v175 = *(void *)((char *)&dword_10 + (v174 & 0xFFFFFFFFFFFFFF8));
              swift_bridgeObjectRetain_n();
              if (!v175) {
                goto LABEL_185;
              }
            }
            uint64_t v142 = 4;
            double v176 = 0.0;
            uint64_t v7 = 0x4074400000000000;
            while (1)
            {
              v177 = (v174 & 0xC000000000000001) != 0
                   ? (char *)sub_46960()
                   : (char *)*(id *)(v174 + 8 * v142);
              v178 = v177;
              uint64_t v163 = v142 - 3;
              if (__OFADD__(v142 - 4, 1)) {
                break;
              }
              v179 = *(void **)&v177[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleWidthAnchor];
              if (!v179) {
                goto LABEL_220;
              }
              [v179 setConstant:324.0];
              v180 = *(void **)&v178[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleHeightAnchor];
              if (!v180) {
                goto LABEL_221;
              }
              [v180 setConstant:324.0];
              uint64_t v181 = swift_allocObject();
              *(void *)(v181 + 16) = v178;
              v218 = (uint64_t (*)())sub_45DB0;
              uint64_t v219 = v181;
              uint64_t aBlock = _NSConcreteStackBlock;
              uint64_t v215 = 1107296256;
              v216 = sub_40CD0;
              v217 = &unk_6E8E8;
              v182 = _Block_copy(&aBlock);
              v183 = v178;
              swift_release();
              uint64_t v184 = swift_allocObject();
              *(void *)(v184 + 16) = v183;
              v218 = (uint64_t (*)())sub_45D50;
              uint64_t v219 = v184;
              uint64_t aBlock = _NSConcreteStackBlock;
              uint64_t v215 = 1107296256;
              v216 = sub_40D14;
              v217 = &unk_6E938;
              v185 = _Block_copy(&aBlock);
              v186 = v183;
              swift_release();
              [v212 animateWithDuration:131080 delay:v182 options:v185 animations:1.0 completion:v176];
              _Block_release(v185);
              _Block_release(v182);
              double v8 = v213;
              unint64_t v187 = *(void *)&v213[v211];
              if (!v187) {
                goto LABEL_222;
              }
              if (v187 >> 62)
              {
                swift_bridgeObjectRetain();
                uint64_t v188 = sub_46A00();

                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v188 = *(void *)((char *)&dword_10 + (v187 & 0xFFFFFFFFFFFFFF8));
              }
              double v176 = v176 + 1.0 / (double)v188;
              ++v142;
              if (v163 == v175) {
                goto LABEL_185;
              }
            }
            __break(1u);
LABEL_183:
            swift_once();
          }
        }
        if (!(v38 >> 62))
        {
          uint64_t v153 = *(void *)((char *)&dword_10 + (v38 & 0xFFFFFFFFFFFFFF8));
          swift_bridgeObjectRetain_n();
          if (!v153)
          {
LABEL_151:
            swift_bridgeObjectRelease_n();
            uint64_t v142 = 516096;
            goto LABEL_152;
          }
          goto LABEL_142;
        }
LABEL_150:
        swift_bridgeObjectRetain_n();
        uint64_t v153 = sub_46A00();
        if (!v153) {
          goto LABEL_151;
        }
LABEL_142:
        if (v153 >= 1)
        {
          for (uint64_t i = 0; i != v153; ++i)
          {
            if ((v38 & 0xC000000000000001) != 0) {
              id v155 = (id)sub_46960();
            }
            else {
              id v155 = *(id *)(v38 + 8 * i + 32);
            }
            v156 = v155;
            objc_msgSend(v155, "setHidden:", 1, v207);
          }
          goto LABEL_151;
        }
LABEL_209:
        __break(1u);
LABEL_210:
        __break(1u);
LABEL_211:
        __break(1u);
LABEL_212:
        __break(1u);
LABEL_213:
        __break(1u);
LABEL_214:
        __break(1u);
LABEL_215:
        __break(1u);
LABEL_216:
        __break(1u);
LABEL_217:
        __break(1u);
LABEL_218:
        __break(1u);
LABEL_219:
        __break(1u);
LABEL_220:
        __break(1u);
LABEL_221:
        __break(1u);
LABEL_222:
        __break(1u);
LABEL_223:
        __break(1u);
LABEL_224:
        __break(1u);
LABEL_225:
        __break(1u);
        goto LABEL_226;
      }
      uint64_t v24 = 0;
      do
      {
        if ((v22 & 0xC000000000000001) != 0) {
          id v25 = (id)sub_46960();
        }
        else {
          id v25 = *(id *)(v22 + 8 * v24 + 32);
        }
        NSString v26 = v25;
        ++v24;
        id v27 = [v25 layer];
        [v27 removeAllAnimations];
      }
      while (v23 != v24);
LABEL_58:
      swift_bridgeObjectRelease_n();
      sub_305B8(&qword_827C0);
      uint64_t v51 = swift_allocObject();
      *(_OWORD *)(v51 + 16) = xmmword_62E20;
      if (qword_82520 == -1) {
        goto LABEL_59;
      }
      goto LABEL_102;
    case 3:
      NSString v28 = *(void **)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton];
      if (!v28) {
        goto LABEL_231;
      }
      id v29 = v28;
      sub_44598(3);

      uint64_t v207 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_currentWavePulsingViews;
      unint64_t v22 = *(void *)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_currentWavePulsingViews];
      if (!v22) {
        goto LABEL_135;
      }
      if (v22 >> 62) {
        goto LABEL_133;
      }
      uint64_t v30 = *(void *)((char *)&dword_10 + (v22 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain_n();
      if (v30) {
        goto LABEL_31;
      }
      goto LABEL_134;
    case 5:
      id v35 = *(void **)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton];
      if (!v35) {
        goto LABEL_232;
      }
      id v36 = v35;
      sub_44598(5);

      id v37 = (void **)OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_currentWavePulsingViews;
      unint64_t v38 = *(void *)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_currentWavePulsingViews];
      if (!v38) {
        goto LABEL_233;
      }
      if (v38 >> 62) {
        goto LABEL_78;
      }
      uint64_t v39 = *(void *)((char *)&dword_10 + (v38 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain_n();
      if (v39) {
        goto LABEL_41;
      }
      goto LABEL_79;
    case 6:
      uint64_t v44 = *(void **)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton];
      if (!v44) {
        goto LABEL_234;
      }
      id v45 = v44;
      sub_44598(6);

      uint64_t v46 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_currentWavePulsingViews;
      unint64_t v38 = *(void *)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_currentWavePulsingViews];
      if (!v38) {
        goto LABEL_235;
      }
      if (v38 >> 62)
      {
        swift_bridgeObjectRetain_n();
        uint64_t v7 = sub_46A00();
        if (!v7) {
          goto LABEL_81;
        }
      }
      else
      {
        uint64_t v7 = *(void *)((char *)&dword_10 + (v38 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain_n();
        if (!v7) {
          goto LABEL_81;
        }
      }
      if (v7 < 1)
      {
LABEL_149:
        __break(1u);
        goto LABEL_150;
      }
      uint64_t v47 = 0;
      do
      {
        if ((v38 & 0xC000000000000001) != 0) {
          id v48 = (id)sub_46960();
        }
        else {
          id v48 = *(id *)(v38 + 8 * v47 + 32);
        }
        uint64_t v49 = v48;
        ++v47;
        id v50 = [v48 layer];
        [v50 removeAllAnimations];
      }
      while (v7 != v47);
LABEL_81:
      swift_bridgeObjectRelease_n();
      sub_305B8(&qword_827C0);
      uint64_t v80 = swift_allocObject();
      *(_OWORD *)(v80 + 16) = xmmword_62E20;
      if (qword_82530 != -1) {
        swift_once();
      }
      id v81 = (id)qword_83488;
      id v82 = [v8 view];
      if (!v82) {
        goto LABEL_239;
      }
      id v83 = v82;
      double v84 = (objc_class *)type metadata accessor for AMWavePulsingView();
      id v85 = objc_allocWithZone(v84);
      sub_351E8(v81, v83, 54.0);
      *(void *)(v80 + 32) = v86;
      id v87 = v81;
      id v88 = [v8 view];
      if (!v88)
      {
LABEL_240:
        __break(1u);
        goto LABEL_241;
      }
      int v89 = v88;
      id v90 = objc_allocWithZone(v84);
      sub_351E8(v87, v89, 54.0);
      *(void *)(v80 + 40) = v91;
      uint64_t aBlock = (void **)v80;
      sub_46830();
      uint64_t v92 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_inititalWavePulsingViews;
      *(void *)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_inititalWavePulsingViews] = aBlock;
      swift_bridgeObjectRelease();
      uint64_t v211 = v92;
      unint64_t v93 = *(void *)&v8[v92];
      if (!v93)
      {
LABEL_241:
        __break(1u);
LABEL_242:
        __break(1u);
LABEL_243:
        __break(1u);
LABEL_244:
        __break(1u);
        goto LABEL_245;
      }
      uint64_t v208 = v46;
      if (v93 >> 62)
      {
        swift_bridgeObjectRetain_n();
        uint64_t v94 = sub_46A00();
        if (!v94) {
          goto LABEL_131;
        }
      }
      else
      {
        uint64_t v94 = *(void *)((char *)&dword_10 + (v93 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain_n();
        if (!v94) {
          goto LABEL_131;
        }
      }
      uint64_t v95 = 4;
      double v96 = 0.0;
      uint64_t v51 = 0x4074400000000000;
      while (1)
      {
        id v97 = (v93 & 0xC000000000000001) != 0 ? (char *)sub_46960() : (char *)*(id *)(v93 + 8 * v95);
        uint64_t v98 = v97;
        long double v21 = &selRef_encodeInteger_forKey_;
        uint64_t v99 = v95 - 3;
        if (__OFADD__(v95 - 4, 1)) {
          break;
        }
        uint64_t v100 = *(void **)&v97[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleWidthAnchor];
        if (!v100) {
          goto LABEL_214;
        }
        [v100 setConstant:324.0];
        double v101 = *(void **)&v98[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleHeightAnchor];
        if (!v101) {
          goto LABEL_215;
        }
        [v101 setConstant:324.0];
        uint64_t v102 = swift_allocObject();
        *(void *)(v102 + 16) = v98;
        v218 = (uint64_t (*)())sub_45BA0;
        uint64_t v219 = v102;
        uint64_t aBlock = _NSConcreteStackBlock;
        uint64_t v215 = 1107296256;
        v216 = sub_40CD0;
        v217 = &unk_6E848;
        double v103 = _Block_copy(&aBlock);
        v104 = v98;
        swift_release();
        uint64_t v105 = swift_allocObject();
        *(void *)(v105 + 16) = v104;
        v218 = (uint64_t (*)())sub_45BA8;
        uint64_t v219 = v105;
        uint64_t aBlock = _NSConcreteStackBlock;
        uint64_t v215 = 1107296256;
        v216 = sub_40D14;
        v217 = &unk_6E898;
        v106 = _Block_copy(&aBlock);
        CGRect v107 = v104;
        swift_release();
        [v212 animateWithDuration:131080 delay:v103 options:v106 animations:3.0 completion:v96];
        _Block_release(v106);
        _Block_release(v103);
        double v8 = v213;
        unint64_t v108 = *(void *)&v213[v92];
        if (!v108) {
          goto LABEL_216;
        }
        if (v108 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v109 = sub_46A00();

          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v109 = *(void *)((char *)&dword_10 + (v108 & 0xFFFFFFFFFFFFFF8));
        }
        double v96 = v96 + 3.0 / (double)v109;
        ++v95;
        if (v99 == v94) {
          goto LABEL_131;
        }
      }
      __break(1u);
LABEL_102:
      swift_once();
LABEL_59:
      id v52 = (id)qword_83478;
      id v53 = [v8 view];
      if (!v53)
      {
LABEL_236:
        __break(1u);
        goto LABEL_237;
      }
      uint64_t v54 = v53;
      uint64_t v55 = (objc_class *)type metadata accessor for AMWavePulsingView();
      id v56 = objc_allocWithZone(v55);
      sub_351E8(v52, v54, 54.0);
      *(void *)(v51 + 32) = v57;
      id v58 = v52;
      id v59 = [v8 view];
      if (!v59)
      {
LABEL_237:
        __break(1u);
        goto LABEL_238;
      }
      uint64_t v60 = v59;
      id v61 = objc_allocWithZone(v55);
      sub_351E8(v58, v60, 54.0);
      *(void *)(v51 + 40) = v62;
      uint64_t aBlock = (void **)v51;
      sub_46830();
      uint64_t v63 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_inititalWavePulsingViews;
      *(void *)&v8[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_inititalWavePulsingViews] = aBlock;
      swift_bridgeObjectRelease();
      uint64_t v211 = v63;
      unint64_t v38 = *(void *)&v8[v63];
      if (!v38)
      {
LABEL_238:
        __break(1u);
LABEL_239:
        __break(1u);
        goto LABEL_240;
      }
      uint64_t v208 = (uint64_t)v21;
      if (v38 >> 62)
      {
        swift_bridgeObjectRetain_n();
        uint64_t v64 = sub_46A00();
        if (v64) {
          goto LABEL_64;
        }
LABEL_131:
        swift_bridgeObjectRelease_n();
        *(void *)&v8[v208] = *(void *)&v8[v211];
        swift_bridgeObjectRetain();
        goto LABEL_206;
      }
      uint64_t v64 = *(void *)((char *)&dword_10 + (v38 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain_n();
      if (!v64) {
        goto LABEL_131;
      }
LABEL_64:
      *(void *)&long long v210 = v38 & 0xC000000000000001;
      id v37 = &v216;
      uint64_t v65 = 4;
      double v66 = 0.0;
      uint64_t v7 = 0x4074400000000000;
      while (1)
      {
        uint64_t v67 = (void)v210 ? (char *)sub_46960() : (char *)*(id *)(v38 + 8 * v65);
        uint64_t v68 = v67;
        uint64_t v69 = v65 - 3;
        if (__OFADD__(v65 - 4, 1)) {
          break;
        }
        uint64_t v70 = *(void **)&v67[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleWidthAnchor];
        if (!v70) {
          goto LABEL_211;
        }
        [v70 setConstant:324.0];
        uint64_t v71 = *(void **)&v68[OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleHeightAnchor];
        if (!v71) {
          goto LABEL_212;
        }
        [v71 setConstant:324.0];
        uint64_t v72 = swift_allocObject();
        *(void *)(v72 + 16) = v68;
        v218 = (uint64_t (*)())sub_45DB0;
        uint64_t v219 = v72;
        uint64_t aBlock = _NSConcreteStackBlock;
        uint64_t v215 = 1107296256;
        v216 = sub_40CD0;
        v217 = &unk_6EA28;
        uint64_t v73 = _Block_copy(&aBlock);
        id v74 = v68;
        swift_release();
        uint64_t v75 = swift_allocObject();
        *(void *)(v75 + 16) = v74;
        v218 = (uint64_t (*)())sub_45D50;
        uint64_t v219 = v75;
        uint64_t aBlock = _NSConcreteStackBlock;
        uint64_t v215 = 1107296256;
        v216 = sub_40D14;
        v217 = &unk_6EA78;
        NSString v76 = _Block_copy(&aBlock);
        UIAccessibilityNotifications v77 = v74;
        swift_release();
        [v212 animateWithDuration:131080 delay:v73 options:v76 animations:1.0 completion:v66];
        _Block_release(v76);
        _Block_release(v73);
        double v8 = v213;
        unint64_t v78 = *(void *)&v213[v211];
        if (!v78) {
          goto LABEL_213;
        }
        if (v78 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v79 = sub_46A00();

          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v79 = *(void *)((char *)&dword_10 + (v78 & 0xFFFFFFFFFFFFFF8));
        }
        double v66 = v66 + 1.0 / (double)v79;
        ++v65;
        if (v69 == v64) {
          goto LABEL_131;
        }
      }
      __break(1u);
LABEL_78:
      swift_bridgeObjectRetain_n();
      uint64_t v39 = sub_46A00();
      if (!v39) {
        goto LABEL_79;
      }
LABEL_41:
      if (v39 < 1)
      {
        __break(1u);
        goto LABEL_149;
      }
      uint64_t v40 = 0;
      do
      {
        if ((v38 & 0xC000000000000001) != 0) {
          id v41 = (id)sub_46960();
        }
        else {
          id v41 = *(id *)(v38 + 8 * v40 + 32);
        }
        NSString v42 = v41;
        ++v40;
        id v43 = [v41 layer];
        [v43 removeAllAnimations];
      }
      while (v39 != v40);
LABEL_79:
      swift_bridgeObjectRelease_n();
      *(void **)((char *)v37 + (void)v8) = _swiftEmptyArrayStorage;
LABEL_206:
      swift_bridgeObjectRelease();
      return;
    default:
      return;
  }
}

void sub_42CDC(char a1)
{
  if (a1 == 1)
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_isInReleaseToStop) = 0;
  }
  else if (!a1)
  {
    goto LABEL_10;
  }
  int v2 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_audioMessagingState);
  if (v2 == 3)
  {
    if (a1 != 4) {
      goto LABEL_10;
    }
  }
  else if (v2 != 4 || a1 != 3)
  {
    goto LABEL_10;
  }
  *(unsigned char *)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_skipAnimationUpdate) = 1;
LABEL_10:
  *(unsigned char *)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_audioMessagingState) = a1;
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_skipAnimationUpdate))
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_skipAnimationUpdate) = 0;
  }
  else
  {
    uint64_t v4 = v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_controlDelegate;
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v5 = *(void *)(v4 + 8);
      uint64_t ObjectType = swift_getObjectType();
      sub_467C0();
      NSString v7 = sub_467A0();
      swift_bridgeObjectRelease();
      (*(void (**)(NSString, uint64_t, uint64_t))(v5 + 8))(v7, ObjectType, v5);

      swift_unknownObjectRelease();
    }
    sub_41020();
  }
}

void sub_42E20()
{
  uint64_t v1 = v0;
  v55.receiver = v0;
  v55.super_class = (Class)type metadata accessor for AMRecordingViewController();
  objc_msgSendSuper2(&v55, "viewDidLoad");
  id v2 = [self buttonWithType:1];
  uint64_t v3 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton;
  uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton];
  *(void *)&v0[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton] = v2;

  uint64_t v5 = *(void **)&v0[v3];
  if (!v5)
  {
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v6 = qword_82538;
  id v7 = v5;
  if (v6 != -1) {
    swift_once();
  }
  [v7 setBackgroundColor:qword_83490];

  double v8 = *(void **)&v1[v3];
  if (!v8) {
    goto LABEL_28;
  }
  id v9 = [v8 layer];
  [v9 setCornerRadius:54.0];

  double v10 = *(void **)&v1[v3];
  if (!v10)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  id v11 = [v10 layer];
  [v11 setMasksToBounds:1];

  double v12 = *(void **)&v1[v3];
  if (!v12)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  [v12 addTarget:v1 action:"controllButtonTouchDown:" forControlEvents:1];
  unint64_t v13 = *(void **)&v1[v3];
  if (!v13)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  [v13 addTarget:v1 action:"controllButtonTouchUpInside:" forControlEvents:64];
  uint64_t v14 = *(void **)&v1[v3];
  if (!v14)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  [v14 addTarget:v1 action:"controllButtonTouchUpOutside:" forControlEvents:128];
  uint64_t v15 = *(void **)&v1[v3];
  if (!v15)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v16 = [v1 view];
  if (!v16)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (!*(void *)&v1[v3])
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  double v17 = v16;
  objc_msgSend(v16, "addSubview:");

  id v18 = *(void **)&v1[v3];
  if (!v18)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  id v19 = [v18 widthAnchor];
  id v20 = [v19 constraintEqualToConstant:108.0];

  uint64_t v21 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButtonWidthAnchor;
  unint64_t v22 = *(void **)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButtonWidthAnchor];
  *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButtonWidthAnchor] = v20;

  uint64_t v23 = *(void **)&v1[v3];
  if (!v23)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  id v24 = [v23 heightAnchor];
  id v25 = [v24 constraintEqualToConstant:108.0];

  uint64_t v26 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButtonHeightAnchor;
  id v27 = *(void **)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButtonHeightAnchor];
  *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButtonHeightAnchor] = v25;

  sub_305B8(&qword_827C0);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_630F0;
  id v29 = *(void **)&v1[v3];
  if (!v29)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  id v30 = [v29 centerXAnchor];
  id v31 = [v1 view];
  if (!v31)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  id v32 = v31;
  id v33 = [v31 centerXAnchor];

  id v34 = [v30 constraintEqualToAnchor:v33];
  *(void *)(v28 + 32) = v34;
  id v35 = *(void **)&v1[v3];
  if (!v35)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  id v36 = [v35 centerYAnchor];
  id v37 = [v1 view];
  if (!v37)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  unint64_t v38 = v37;
  id v39 = [v37 centerYAnchor];

  id v40 = [v36 constraintEqualToAnchor:v39];
  *(void *)(v28 + 40) = v40;
  id v41 = *(void **)&v1[v21];
  if (!v41)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  *(void *)(v28 + 48) = v41;
  NSString v42 = *(void **)&v1[v26];
  if (!v42)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  id v43 = self;
  *(void *)(v28 + 56) = v42;
  sub_46830();
  sub_33F38(0, (unint64_t *)&qword_82770);
  id v44 = v41;
  id v45 = v42;
  Class isa = sub_46810().super.isa;
  swift_bridgeObjectRelease();
  [v43 activateConstraints:isa];

  id v47 = [objc_allocWithZone((Class)UIPanGestureRecognizer) initWithTarget:v1 action:"handlePan:"];
  uint64_t v48 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_panGestureRecognizer;
  uint64_t v49 = *(void **)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_panGestureRecognizer];
  *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_panGestureRecognizer] = v47;

  id v50 = *(void **)&v1[v3];
  if (!v50)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (!*(void *)&v1[v48])
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  objc_msgSend(v50, "addGestureRecognizer:");
  id v51 = [objc_allocWithZone((Class)UILongPressGestureRecognizer) initWithTarget:v1 action:"controlButtonLongPress:"];
  uint64_t v52 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_longPressGestureRecognizer;
  id v53 = *(void **)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_longPressGestureRecognizer];
  *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_longPressGestureRecognizer] = v51;

  uint64_t v54 = *(void **)&v1[v3];
  if (!v54)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if (!*(void *)&v1[v52])
  {
LABEL_47:
    __break(1u);
    return;
  }
  objc_msgSend(v54, "addGestureRecognizer:");
  if (!v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_audioMessagingState]) {
    sub_42CDC(1);
  }
  sub_41020();
}

id sub_433F4(uint64_t a1, double a2)
{
  uint64_t v3 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton;
  id result = *(id *)(a1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v6 = [result layer];
  [v6 setCornerRadius:a2 * 0.5];

  id result = *(id *)(a1 + v3);
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }

  return [result layoutIfNeeded];
}

uint64_t sub_43528(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_305B8(&qword_82AD0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_62E10;
  *(void *)(v8 + 56) = &type metadata for String;
  *(void *)(v8 + 32) = a4;
  *(void *)(v8 + 40) = a5;
  swift_unknownObjectRetain();
  id v9 = a1;
  sub_46A80();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_435E4(void *a1)
{
  id v3 = [a1 view];
  [a1 locationInView:v3];
  double v5 = v4;
  double v7 = v6;

  id v8 = [a1 view];
  char v12 = 0;
  if (v8)
  {
    id v9 = v8;
    [v9 bounds];
    double v11 = v10;

    if ((v11 - (v5 + v11 * 0.5)) * (v11 - (v5 + v11 * 0.5)) + (v11 - (v7 + v11 * 0.5)) * (v11 - (v7 + v11 * 0.5)) <= v11 * v11) {
      char v12 = 1;
    }
  }
  unint64_t v13 = (char *)[a1 state];
  if (v13 == (unsigned char *)&def_3AC7C + 1)
  {
    sub_305B8(&qword_82AD0);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_62E10;
    *(void *)(v17 + 56) = &type metadata for String;
    *(void *)(v17 + 32) = 0xD000000000000010;
    *(void *)(v17 + 40) = 0x8000000000067850;
    sub_46A80();
    swift_bridgeObjectRelease();
    sub_42CDC(3);
  }
  else if (v13 != (unsigned char *)&def_3AC7C + 2)
  {
    if (v13 == (unsigned char *)&def_3AC7C + 3)
    {
      sub_305B8(&qword_82AD0);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_62E10;
      *(void *)(v14 + 56) = &type metadata for String;
      *(void *)(v14 + 32) = 0xD000000000000010;
      *(void *)(v14 + 40) = 0x8000000000067870;
      sub_46A80();
      swift_bridgeObjectRelease();
      sub_42CDC(1);
      uint64_t v15 = v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_controlDelegate;
      if (swift_unknownObjectWeakLoadStrong())
      {
        uint64_t v16 = *(void *)(v15 + 8);
        sub_33F38(0, &qword_82CE0);
        id v18 = (void *)sub_468D0();
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(void *, uint64_t, uint64_t))(v16 + 8))(v18, ObjectType, v16);

        swift_unknownObjectRelease();
      }
    }
    return;
  }

  sub_438C8(v12);
}

void sub_438C8(char a1)
{
  uint64_t v3 = OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_audioMessagingState;
  int v4 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_audioMessagingState);
  if ((a1 & 1) == 0)
  {
    if (v4 == 4) {
      return;
    }
    unint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_currentWavePulsingViews);
    if (!v5) {
      goto LABEL_58;
    }
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v10 = sub_46A00();
      id v2 = &selRef_encodeInteger_forKey_;
      if (!v10) {
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v10 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain_n();
      id v2 = &selRef_encodeInteger_forKey_;
      if (!v10) {
        goto LABEL_34;
      }
    }
    if (v10 < 1)
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    for (uint64_t i = 0; i != v10; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0) {
        id v12 = (id)sub_46960();
      }
      else {
        id v12 = *(id *)(v5 + 8 * i + 32);
      }
      unint64_t v13 = v12;
      [v12 setHidden:0];
    }
LABEL_34:
    swift_bridgeObjectRelease_n();
    unint64_t v5 = *(void *)(v1
                   + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_releaseToStopWavePulsingViews);
    if (!v5) {
      goto LABEL_51;
    }
    if (!(v5 >> 62))
    {
      uint64_t v18 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain_n();
      if (!v18)
      {
LABEL_50:
        swift_bridgeObjectRelease_n();
LABEL_51:
        sub_42CDC(4);
        unint64_t v22 = *(void **)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton);
        if (v22) {
          goto LABEL_52;
        }
LABEL_59:
        __break(1u);
        return;
      }
      goto LABEL_37;
    }
LABEL_49:
    swift_bridgeObjectRetain_n();
    uint64_t v18 = sub_46A00();
    if (!v18) {
      goto LABEL_50;
    }
LABEL_37:
    if (v18 >= 1)
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if ((v5 & 0xC000000000000001) != 0) {
          id v20 = (id)sub_46960();
        }
        else {
          id v20 = *(id *)(v5 + 8 * j + 32);
        }
        uint64_t v21 = v20;
        objc_msgSend(v20, v2[372], 1);
      }
      goto LABEL_50;
    }
    goto LABEL_56;
  }
  if (v4 == 3) {
    return;
  }
  unint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_currentWavePulsingViews);
  if (!v5) {
    goto LABEL_57;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v6 = sub_46A00();
    if (!v6) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain_n();
    if (!v6) {
      goto LABEL_24;
    }
  }
  if (v6 < 1)
  {
    __break(1u);
    goto LABEL_44;
  }
  uint64_t v7 = 0;
  id v2 = (char **)(v5 & 0xC000000000000001);
  do
  {
    if (v2) {
      id v8 = (id)sub_46960();
    }
    else {
      id v8 = *(id *)(v5 + 8 * v7 + 32);
    }
    id v9 = v8;
    ++v7;
    [v8 setHidden:1];
  }
  while (v6 != v7);
LABEL_24:
  swift_bridgeObjectRelease_n();
  unint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_releaseToStopWavePulsingViews);
  if (!v5) {
    goto LABEL_47;
  }
  if (v5 >> 62)
  {
LABEL_45:
    swift_bridgeObjectRetain_n();
    uint64_t v14 = sub_46A00();
    if (v14) {
      goto LABEL_27;
    }
    goto LABEL_46;
  }
  uint64_t v14 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain_n();
  if (v14)
  {
LABEL_27:
    if (v14 < 1)
    {
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    uint64_t v15 = 0;
    id v2 = (char **)(v5 & 0xC000000000000001);
    do
    {
      if (v2) {
        id v16 = (id)sub_46960();
      }
      else {
        id v16 = *(id *)(v5 + 8 * v15 + 32);
      }
      uint64_t v17 = v16;
      ++v15;
      [v16 setHidden:0];
    }
    while (v14 != v15);
  }
LABEL_46:
  swift_bridgeObjectRelease_n();
LABEL_47:
  sub_42CDC(3);
  unint64_t v22 = *(void **)(v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton);
  if (!v22)
  {
    __break(1u);
    goto LABEL_49;
  }
LABEL_52:
  char v23 = *(unsigned char *)(v1 + v3);
  id v24 = v22;
  sub_44598(v23);
}

char *sub_43D08(void *a1)
{
  id v3 = [a1 view];
  [a1 locationInView:v3];
  double v5 = v4;
  double v7 = v6;

  id v8 = [a1 view];
  BOOL v12 = 0;
  if (v8)
  {
    id v9 = v8;
    [v9 bounds];
    double v11 = v10;

    if ((v11 - (v5 + v11 * 0.5)) * (v11 - (v5 + v11 * 0.5)) + (v11 - (v7 + v11 * 0.5)) * (v11 - (v7 + v11 * 0.5)) <= v11 * v11) {
      BOOL v12 = 1;
    }
  }
  id result = (char *)[a1 state];
  if (result == (unsigned char *)&def_3AC7C + 3)
  {
    sub_42CDC(1);
    uint64_t v17 = v1 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_controlDelegate;
    id result = (char *)swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      uint64_t v18 = *(void *)(v17 + 8);
      sub_33F38(0, &qword_82CE0);
      id v19 = (void *)sub_468D0();
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(void *, uint64_t, uint64_t))(v18 + 8))(v19, ObjectType, v18);

      return (char *)swift_unknownObjectRelease();
    }
  }
  else
  {
    if (result != (unsigned char *)&def_3AC7C + 2)
    {
      if (result != (unsigned char *)&def_3AC7C + 1) {
        return result;
      }
      sub_42CDC(3);
    }
    sub_438C8(v12);
    sub_305B8(&qword_82AD0);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_62E10;
    sub_46940(18);
    swift_bridgeObjectRelease();
    if (v12) {
      v15._countAndFlagsBits = 1684956531;
    }
    else {
      v15._countAndFlagsBits = 0x6C65636E6163;
    }
    if (v12) {
      id v16 = (void *)0xE400000000000000;
    }
    else {
      id v16 = (void *)0xE600000000000000;
    }
    v15._object = v16;
    sub_467E0(v15);
    swift_bridgeObjectRelease();
    *(void *)(v14 + 56) = &type metadata for String;
    *(void *)(v14 + 32) = 0xD000000000000010;
    *(void *)(v14 + 40) = 0x8000000000067830;
    sub_46A80();
    return (char *)swift_bridgeObjectRelease();
  }
  return result;
}

id sub_4405C(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_viewPropertyAnimator] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButtonWidthAnchor] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButtonHeightAnchor] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_panGestureRecognizer] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_longPressGestureRecognizer] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_controlDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v3[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_skipAnimationUpdate] = 0;
  v3[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_audioMessagingState] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_inititalWavePulsingViews] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_releaseToStopWavePulsingViews] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_currentWavePulsingViews] = 0;
  v3[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_isInReleaseToStop] = 2;
  if (a2)
  {
    NSString v6 = sub_467A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for AMRecordingViewController();
  id v7 = objc_msgSendSuper2(&v9, "initWithNibName:bundle:", v6, a3);

  return v7;
}

id sub_441F4(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_viewPropertyAnimator] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButtonWidthAnchor] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButtonHeightAnchor] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_panGestureRecognizer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_longPressGestureRecognizer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_controlDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_skipAnimationUpdate] = 0;
  v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_audioMessagingState] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_inititalWavePulsingViews] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_releaseToStopWavePulsingViews] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_currentWavePulsingViews] = 0;
  v1[OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_isInReleaseToStop] = 2;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AMRecordingViewController();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_44318()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMRecordingViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AMRecordingViewController()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for AMAudioMessagingState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *id result = a2 + 6;
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
        JUMPOUT(0x44508);
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
          *id result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AMAudioMessagingState()
{
  return &type metadata for AMAudioMessagingState;
}

unint64_t sub_44544()
{
  unint64_t result = qword_82CD8;
  if (!qword_82CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_82CD8);
  }
  return result;
}

void sub_44598(char a1)
{
  objc_super v2 = v1;
  LOBYTE(v19) = a1;
  uint64_t v4 = sub_467C0();
  uint64_t v6 = v5;
  if (qword_82570 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v7 = off_82C40[0];
  if (*(void *)((char *)off_82C40[0] + (unint64_t)&dword_10))
  {
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_44DD0(v4, v6);
    if (v9) {
      id v10 = *(id *)(*(void *)&stru_20.segname[(void)v7 + 16] + 8 * v8);
    }
    else {
      id v10 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = 0;
  }
  swift_endAccess();
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      if (qword_82568 != -1) {
        swift_once();
      }
      id v11 = (id)qword_82C38;
      NSString v12 = sub_467A0();
      swift_bridgeObjectRelease();
      id v13 = [self systemImageNamed:v12 withConfiguration:v11];

      swift_beginAccess();
      if (v13)
      {
        id v14 = v13;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v18 = off_82C40[0];
        off_82C40[0] = (int *)0x8000000000000000;
        sub_45400((uint64_t)v14, v4, v6, isUniquelyReferenced_nonNull_native);
        off_82C40[0] = v18;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v16 = (void *)sub_44E48(v4, v6);
        swift_bridgeObjectRelease();
      }
      swift_endAccess();
      [v2 setImage:v13 forState:0];

      if (((1 << a1) & 0x16) != 0)
      {
        if (qword_82538 != -1) {
          swift_once();
        }
        objc_msgSend(v2, "setBackgroundColor:", qword_83490, v18, v19);
        if (qword_82550 != -1) {
          swift_once();
        }
        uint64_t v17 = qword_834A8;
      }
      else if (((1 << a1) & 0x60) != 0)
      {
        if (qword_82548 != -1) {
          swift_once();
        }
        objc_msgSend(v2, "setBackgroundColor:", qword_834A0, v18, v19);
        if (qword_82560 != -1) {
          swift_once();
        }
        uint64_t v17 = qword_834B8;
      }
      else
      {
        if (qword_82540 != -1) {
          swift_once();
        }
        objc_msgSend(v2, "setBackgroundColor:", qword_83498, v18, v19);
        if (qword_82558 != -1) {
          swift_once();
        }
        uint64_t v17 = qword_834B0;
      }
      [v2 setTintColor:v17];

      break;
    default:

      swift_bridgeObjectRelease();
      break;
  }
}

id sub_44A74()
{
  id result = [self configurationWithPointSize:5 weight:2 scale:34.0];
  qword_82C38 = (uint64_t)result;
  return result;
}

int *sub_44AC0()
{
  id result = (int *)sub_44AE8((uint64_t)_swiftEmptyArrayStorage);
  off_82C40[0] = result;
  return result;
}

unint64_t sub_44AE8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    objc_super v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_305B8(&qword_82CE8);
  objc_super v2 = (void *)sub_46A30();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    id v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_44DD0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    *id v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

uint64_t sub_44C04(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_46A00();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_46A00();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((char *)&dword_18 + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_46970();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_45940(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_46A00();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8)) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_46830();
}

unint64_t sub_44DD0(uint64_t a1, uint64_t a2)
{
  sub_46A90();
  sub_467D0();
  Swift::Int v4 = sub_46AB0();

  return sub_45570(a1, a2, v4);
}

uint64_t sub_44E48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_44DD0(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_45654();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_45228(v6, v9);
  uint64_t *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_44F18(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_305B8(&qword_82CE8);
  char v38 = a2;
  uint64_t v6 = sub_46A20();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  id v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    id v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_46A90();
    sub_467D0();
    uint64_t result = sub_46AB0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_45228(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_46930();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_46A90();
        swift_bridgeObjectRetain();
        sub_467D0();
        Swift::Int v9 = sub_46AB0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_45400(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_44DD0(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_45654();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_44F18(v15, a4 & 1);
  unint64_t v20 = sub_44DD0(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_46A70();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

unint64_t sub_45570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_46A60() & 1) == 0)
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
      while (!v14 && (sub_46A60() & 1) == 0);
    }
  }
  return v6;
}

id sub_45654()
{
  uint64_t v1 = v0;
  sub_305B8(&qword_82CE8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_46A10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void (*sub_45808(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_458B8(v6, a2, a3);
  return sub_45870;
}

void sub_45870(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_458B8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_46960();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_45938;
  }
  __break(1u);
  return result;
}

void sub_45938(id *a1)
{
}

uint64_t sub_45940(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_46A00();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_46A00();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_45BE8();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_305B8(&qword_82CF0);
          unint64_t v12 = sub_45808(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for AMWavePulsingView();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_46A40();
  __break(1u);
  return result;
}

uint64_t sub_45B44()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_45B7C()
{
  return sub_433F4(*(void *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t sub_45B88(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_45B98()
{
  return swift_release();
}

id sub_45BA0()
{
  return sub_355B4(*(void **)(v0 + 16));
}

id sub_45BA8(int a1)
{
  return sub_35604(a1, *(id *)(v1 + 16));
}

uint64_t sub_45BB0()
{
  return _swift_deallocObject(v0, 24, 7);
}

unint64_t sub_45BE8()
{
  unint64_t result = qword_82CF8;
  if (!qword_82CF8)
  {
    sub_3DB5C(&qword_82CF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_82CF8);
  }
  return result;
}

void sub_45C44()
{
  sub_305B8(&qword_82AD0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_62E10;
  *(void *)(v1 + 56) = &type metadata for String;
  *(void *)(v1 + 32) = 0x7075206863756F74;
  *(void *)(v1 + 40) = 0xEF656469736E6920;
  sub_46A80();
  swift_bridgeObjectRelease();
  char v2 = 2;
  switch(*(unsigned char *)(v0 + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_audioMessagingState))
  {
    case 1:
      goto LABEL_5;
    case 2:
      char v2 = 5;
      goto LABEL_5;
    case 3:
    case 4:
    case 6:
      char v2 = 1;
      goto LABEL_5;
    case 5:
      char v2 = 6;
LABEL_5:
      sub_42CDC(v2);
      break;
    default:
      return;
  }
}

uint64_t sub_45DD4(void *a1, uint64_t (*a2)(id))
{
  return a2([a1 userInterfaceStyle]);
}

uint64_t MSMessagesAppPresentationStyle.description.getter(unint64_t a1)
{
  if (a1 > 2) {
    return 0x6E776F6E6B6E75;
  }
  else {
    return *(void *)&aCompact_0[8 * a1];
  }
}

uint64_t sub_45E4C()
{
  return MSMessagesAppPresentationStyle.description.getter(*v0);
}

uint64_t sub_45E54()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_45E88(os_log_t log)
{
  int v1 = 136315138;
  char v2 = "-[RCWaveformRenderer _renderTimeRangeOfSegments:withDuration:needsWaveformCalculation:]";
  _os_log_debug_impl(&def_3AC7C, log, OS_LOG_TYPE_DEBUG, "%s -- requestedPillsToRender.length is 0. There will be nothing to render.", (uint8_t *)&v1, 0xCu);
}

void sub_45F0C(os_log_t log)
{
  int v1 = 136315138;
  char v2 = "-[RCWaveformRenderer _renderTimeRangeOfSegments:withDuration:needsWaveformCalculation:]_block_invoke";
  _os_log_debug_impl(&def_3AC7C, log, OS_LOG_TYPE_DEBUG, "%s -- Failed to create waveform slices. Will re-attempt on the next try.", (uint8_t *)&v1, 0xCu);
}

void sub_45F90(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "-[RCWaveformGenerator appendAveragePowerLevelsByDigestingContentsOfAudioFileURL:progressBlock:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl(&def_3AC7C, log, OS_LOG_TYPE_DEBUG, "%s -- loading waveform data from audioFile %@", buf, 0x16u);
}

void sub_45FFC()
{
  v1[0] = 136315394;
  sub_14010();
  _os_log_debug_impl(&def_3AC7C, v0, OS_LOG_TYPE_DEBUG, "%s -- loading waveform data from %@", (uint8_t *)v1, 0x16u);
}

void sub_4607C(int a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[RCWaveformGenerator _appendPowerMeterValuesFromSampleBuffer:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&def_3AC7C, a2, OS_LOG_TYPE_ERROR, "%s -- ERROR:  CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer failed:  rv = %d", (uint8_t *)&v2, 0x12u);
}

void sub_46108(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 136315650;
  int v5 = "-[RCWaveformGenerator _appendPowerMeterValuesFromDataInAudioFile:progressBlock:]";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_debug_impl(&def_3AC7C, log, OS_LOG_TYPE_DEBUG, "%s -- ERROR: encountered error while attempting to read from audio file %@, error = %@ canceling further operations..", (uint8_t *)&v4, 0x20u);
}

void sub_461A8()
{
  v1[0] = 136315394;
  sub_14010();
  _os_log_error_impl(&def_3AC7C, v0, OS_LOG_TYPE_ERROR, "%s -- audioError = %@", (uint8_t *)v1, 0x16u);
}

void sub_46228(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[RCWaveformGenerator _onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:]";
  _os_log_error_impl(&def_3AC7C, log, OS_LOG_TYPE_ERROR, "%s -- ERROR: unable to process samples", (uint8_t *)&v1, 0xCu);
}

void sub_462AC(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[RCWaveformDataSource saveGeneratedWaveformIfNecessary]";
  __int16 v4 = 2112;
  CFStringRef v5 = @"saved";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_debug_impl(&def_3AC7C, a2, OS_LOG_TYPE_DEBUG, "%s -- %@ waveform to %@", (uint8_t *)&v2, 0x20u);
}

void sub_46348(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[RCWaveformDataSource waveformGeneratorDidFinishLoading:error:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&def_3AC7C, a2, OS_LOG_TYPE_ERROR, "%s -- Waveform generator reported loading error! %@", (uint8_t *)&v2, 0x16u);
}

void sub_463D4(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[RCWaveform saveContentsToURL:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&def_3AC7C, a2, OS_LOG_TYPE_ERROR, "%s -- ERROR:  archiving waveform:  %@", (uint8_t *)&v2, 0x16u);
}

void sub_46460(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_464D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_46550(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_465C8(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "RCHasEnoughDiskSpaceToRecord";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&def_3AC7C, a2, OS_LOG_TYPE_ERROR, "%s -- ERROR: Not enough space to record a memo. Available space is %lli.", (uint8_t *)&v2, 0x16u);
}

void sub_46654(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "RCComputeFileDigest";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&def_3AC7C, a2, OS_LOG_TYPE_ERROR, "%s -- ERROR: unable load data for %@", (uint8_t *)&v2, 0x16u);
}

uint64_t sub_466E0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_466F0()
{
  return type metadata accessor for CGPathFillRule();
}

NSNumber sub_46700()
{
  return CGFloat._bridgeToObjectiveC()();
}

uint64_t sub_46710()
{
  return Logger.logObject.getter();
}

uint64_t _s22AudioMessagesExtension0A24AppContentViewControllerC6logger33_6C80B9CA6D0C59A10BF4E668E4172F5CLL2os6LoggerVvpfi_0()
{
  return Logger.init()();
}

uint64_t sub_46730()
{
  return type metadata accessor for Logger();
}

uint64_t sub_46740()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_46750()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_46760()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_46770()
{
  return static DispatchTime.now()();
}

uint64_t sub_46780()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_46790()
{
  return + infix(_:_:)();
}

NSString sub_467A0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_467B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_467C0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_467D0()
{
  return String.hash(into:)();
}

void sub_467E0(Swift::String a1)
{
}

Swift::Int sub_467F0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_46800()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_46810()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_46820()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_46830()
{
  return specialized Array._endMutation()();
}

uint64_t sub_46840()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_46850()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_46860()
{
  return Bool._bridgeToObjectiveC()();
}

NSNumber sub_46870()
{
  return Double._bridgeToObjectiveC()();
}

uint64_t sub_46880()
{
  return UIStoryboard.instantiateInitialViewController<A>(creator:)();
}

uint64_t sub_46890()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_468A0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_468B0()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_468C0()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_468D0()
{
  return NSString.init(stringLiteral:)();
}

uint64_t sub_468E0()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_468F0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_46900()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_46910()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_46920()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_46930()
{
  return _HashTable.previousHole(before:)();
}

void sub_46940(Swift::Int a1)
{
}

uint64_t sub_46950()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_46960()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_46970()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_46980()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_46990()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_469A0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_469B0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_469C0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_469D0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_469E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_469F0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_46A00()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_46A10()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_46A20()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_46A30()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_46A40()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_46A50()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_46A60()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_46A70()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_46A80()
{
  return print(_:separator:terminator:)();
}

uint64_t sub_46A90()
{
  return Hasher.init(_seed:)();
}

void sub_46AA0(Swift::UInt a1)
{
}

Swift::Int sub_46AB0()
{
  return Hasher._finalize()();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

BOOL CATransform3DIsIdentity(CATransform3D *t)
{
  return _CATransform3DIsIdentity(t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFStringRef CFDateFormatterCreateDateFormatFromTemplate(CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale)
{
  return _CFDateFormatterCreateDateFormatFromTemplate(allocator, tmplate, options, locale);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CFTypeID CGColorGetTypeID(void)
{
  return _CGColorGetTypeID();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithRect(rect, transform);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
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

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return _CGRectIsInfinite(rect);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return _CMAudioFormatDescriptionGetStreamBasicDescription(desc);
}

OSStatus CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(CMSampleBufferRef sbuf, size_t *bufferListSizeNeededOut, AudioBufferList *bufferListOut, size_t bufferListSize, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, CMBlockBufferRef *blockBufferOut)
{
  return _CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(sbuf, bufferListSizeNeededOut, bufferListOut, bufferListSize, blockBufferStructureAllocator, blockBufferBlockAllocator, flags, blockBufferOut);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetFormatDescription(sbuf);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return _CMTimeMakeWithSeconds(retstr, seconds, preferredTimescale);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return _CMTimeRangeMake(retstr, start, duration);
}

uint64_t CPSharedResourcesDirectory()
{
  return _CPSharedResourcesDirectory();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return _MSVDeviceOSIsInternalInstall();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t UIAXTimeStringForDuration()
{
  return _UIAXTimeStringForDuration();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  return _UIAccessibilityConvertFrameToScreenCoordinates(rect, view);
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return _UIAccessibilityIsBoldTextEnabled();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAnimationDragCoefficient()
{
  return _UIAnimationDragCoefficient();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
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

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

double __exp10(double a1)
{
  return ___exp10(a1);
}

float __exp10f(float a1)
{
  return ___exp10f(a1);
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
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

long double cosh(long double __x)
{
  return _cosh(__x);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
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

long double exp(long double __x)
{
  return _exp(__x);
}

long double exp2(long double __x)
{
  return _exp2(__x);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

long double log10(long double __x)
{
  return _log10(__x);
}

long double log2(long double __x)
{
  return _log2(__x);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

long double modf(long double __x, long double *__y)
{
  return _modf(__x, __y);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

long double sinh(long double __x)
{
  return _sinh(__x);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
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

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vmax(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _[a1 CGRectValue];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingPathExtension];
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return _[a1 URLByResolvingSymlinksInPath];
}

id objc_msgSend_URLByStandardizingPath(void *a1, const char *a2, ...)
{
  return _[a1 URLByStandardizingPath];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend___shouldDisplayBeginTimeText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__shouldDisplayBeginTimeText");
}

id objc_msgSend__accessibilityIncreaseValue_bySegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityIncreaseValue:bySegment:");
}

id objc_msgSend__accessibilityIncreaseValue_isThreeFingerScroll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityIncreaseValue:isThreeFingerScroll:");
}

id objc_msgSend__accessibilityRemoveValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityRemoveValueForKey:");
}

id objc_msgSend__accessibilitySetRetainedValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:");
}

id objc_msgSend__accessibilityValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityValueForKey:");
}

id objc_msgSend__appendAveragePowerLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendAveragePowerLevel:");
}

id objc_msgSend__appendAveragePowerLevelsByDigestingTimeRange_inAudioFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendAveragePowerLevelsByDigestingTimeRange:inAudioFile:");
}

id objc_msgSend__appendAveragePowerLevelsByDigestingWaveformSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendAveragePowerLevelsByDigestingWaveformSegments:");
}

id objc_msgSend__appendPowerMeterValuesFromAudioPCMBuffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendPowerMeterValuesFromAudioPCMBuffer:");
}

id objc_msgSend__appendPowerMeterValuesFromDataInAudioFile_progressBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendPowerMeterValuesFromDataInAudioFile:progressBlock:");
}

id objc_msgSend__appendPowerMeterValuesFromSampleBuffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendPowerMeterValuesFromSampleBuffer:");
}

id objc_msgSend__attributes(void *a1, const char *a2, ...)
{
  return _[a1 _attributes];
}

id objc_msgSend__axIsShowingSelectionBars(void *a1, const char *a2, ...)
{
  return _[a1 _axIsShowingSelectionBars];
}

id objc_msgSend__beginTimeRectWithSizedTextLayer_isOffsetForThumb_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginTimeRectWithSizedTextLayer:isOffsetForThumb:");
}

id objc_msgSend__beginTrackingSelectionBar_selectionBarType_withTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginTrackingSelectionBar:selectionBarType:withTouch:");
}

id objc_msgSend__clearRenderingState(void *a1, const char *a2, ...)
{
  return _[a1 _clearRenderingState];
}

id objc_msgSend__clearStaleTouches(void *a1, const char *a2, ...)
{
  return _[a1 _clearStaleTouches];
}

id objc_msgSend__clearSublayers(void *a1, const char *a2, ...)
{
  return _[a1 _clearSublayers];
}

id objc_msgSend__configureWaveformViewWithDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureWaveformViewWithDataSource:");
}

id objc_msgSend__createSpringAnimationWithKeyPath_basedOnPropertiesFromSpringAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createSpringAnimationWithKeyPath:basedOnPropertiesFromSpringAnimation:");
}

id objc_msgSend__createSublayersIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _createSublayersIfNeeded];
}

id objc_msgSend__currentTimeDisplayOptions(void *a1, const char *a2, ...)
{
  return _[a1 _currentTimeDisplayOptions];
}

id objc_msgSend__currentTimeDisplayOptionsIgnoringSelectionOverlayState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentTimeDisplayOptionsIgnoringSelectionOverlayState:");
}

id objc_msgSend__defaultDateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _defaultDateFormatter];
}

id objc_msgSend__didUpdateDisplayableTime(void *a1, const char *a2, ...)
{
  return _[a1 _didUpdateDisplayableTime];
}

id objc_msgSend__discontinuityRepairedSegmentsByGrowingToFillGapsInSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_discontinuityRepairedSegmentsByGrowingToFillGapsInSegments:");
}

id objc_msgSend__displaySize(void *a1, const char *a2, ...)
{
  return _[a1 _displaySize];
}

id objc_msgSend__draw_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_draw:");
}

id objc_msgSend__duration(void *a1, const char *a2, ...)
{
  return _[a1 _duration];
}

id objc_msgSend__endTimeRectWithSizedTextLayer_isOffsetForThumb_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endTimeRectWithSizedTextLayer:isOffsetForThumb:");
}

id objc_msgSend__formattedDateStringFromDate_remainingTimeValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_formattedDateStringFromDate:remainingTimeValid:");
}

id objc_msgSend__frameForTimeMarkerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frameForTimeMarkerView:");
}

id objc_msgSend__gobackwardSystemImage(void *a1, const char *a2, ...)
{
  return _[a1 _gobackwardSystemImage];
}

id objc_msgSend__goforwardSystemImage(void *a1, const char *a2, ...)
{
  return _[a1 _goforwardSystemImage];
}

id objc_msgSend__hiddenComponentStringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hiddenComponentStringWithString:");
}

id objc_msgSend__hitSelectionForPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hitSelectionForPoint:");
}

id objc_msgSend__horizontalSizeClassFromSplitView(void *a1, const char *a2, ...)
{
  return _[a1 _horizontalSizeClassFromSplitView];
}

id objc_msgSend__initWithTimeRange_averagePowerLevelData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithTimeRange:averagePowerLevelData:");
}

id objc_msgSend__internalSelectionKnobRadius(void *a1, const char *a2, ...)
{
  return _[a1 _internalSelectionKnobRadius];
}

id objc_msgSend__isCompactWidth(void *a1, const char *a2, ...)
{
  return _[a1 _isCompactWidth];
}

id objc_msgSend__isIOSMac(void *a1, const char *a2, ...)
{
  return _[a1 _isIOSMac];
}

id objc_msgSend__isIpad(void *a1, const char *a2, ...)
{
  return _[a1 _isIpad];
}

id objc_msgSend__isIpadOrIOSMac(void *a1, const char *a2, ...)
{
  return _[a1 _isIpadOrIOSMac];
}

id objc_msgSend__isIphone(void *a1, const char *a2, ...)
{
  return _[a1 _isIphone];
}

id objc_msgSend__isPortrait(void *a1, const char *a2, ...)
{
  return _[a1 _isPortrait];
}

id objc_msgSend__isScrubbingSelectionTimeRange(void *a1, const char *a2, ...)
{
  return _[a1 _isScrubbingSelectionTimeRange];
}

id objc_msgSend__isSplitViewControllerTransitioningBetweenStates(void *a1, const char *a2, ...)
{
  return _[a1 _isSplitViewControllerTransitioningBetweenStates];
}

id objc_msgSend__isVibrantUIOrIOSMac(void *a1, const char *a2, ...)
{
  return _[a1 _isVibrantUIOrIOSMac];
}

id objc_msgSend__isWatch(void *a1, const char *a2, ...)
{
  return _[a1 _isWatch];
}

id objc_msgSend__isWideIPad(void *a1, const char *a2, ...)
{
  return _[a1 _isWideIPad];
}

id objc_msgSend__isWideIpadOrIOSMac(void *a1, const char *a2, ...)
{
  return _[a1 _isWideIpadOrIOSMac];
}

id objc_msgSend__layoutTimeMarkerViewsForCurrentlyVisibleTimeRange(void *a1, const char *a2, ...)
{
  return _[a1 _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange];
}

id objc_msgSend__loadWithColor_selectionExtentIncludingKnobs_topKnob_bottomKnob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:");
}

id objc_msgSend__localizedDateTimeFormatForDurationFormattingStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localizedDateTimeFormatForDurationFormattingStyle:");
}

id objc_msgSend__localizedPositionalFormatStringForDurationFormattingStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localizedPositionalFormatStringForDurationFormattingStyle:");
}

id objc_msgSend__localizedPositionalFormatStringForLocalizedDateTimeFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localizedPositionalFormatStringForLocalizedDateTimeFormat:");
}

id objc_msgSend__mergeBoundarySegmentsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mergeBoundarySegmentsInArray:");
}

id objc_msgSend__mergedSegmentByFastMergingWithMergeableSegments_mergedLevelsDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mergedSegmentByFastMergingWithMergeableSegments:mergedLevelsDuration:");
}

id objc_msgSend__mergedSegmentByResamplingWithMergeableSegments_mergedLevelsDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mergedSegmentByResamplingWithMergeableSegments:mergedLevelsDuration:");
}

id objc_msgSend__minimumOverlaySelectionWidth(void *a1, const char *a2, ...)
{
  return _[a1 _minimumOverlaySelectionWidth];
}

id objc_msgSend__mutableSegmentsByClippingToTimeRange_withSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mutableSegmentsByClippingToTimeRange:withSegments:");
}

id objc_msgSend__mutableSegmentsIntersectingTimeRange_intersectionRange_withSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mutableSegmentsIntersectingTimeRange:intersectionRange:withSegments:");
}

id objc_msgSend__needsWaveformRendering(void *a1, const char *a2, ...)
{
  return _[a1 _needsWaveformRendering];
}

id objc_msgSend__newFormattedDateStringFromDate_forUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newFormattedDateStringFromDate:forUUID:");
}

id objc_msgSend__nonCachedContentWidthWithDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nonCachedContentWidthWithDuration:");
}

id objc_msgSend__onQueuePositionalFormatStringForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueuePositionalFormatStringForStyle:");
}

id objc_msgSend__onQueueStringFromDuration_byReplacingDigitsWithDigit_hideComponentOptions_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueStringFromDuration:byReplacingDigitsWithDigit:hideComponentOptions:style:");
}

id objc_msgSend__onQueueStringFromDuration_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueStringFromDuration:style:");
}

id objc_msgSend__onQueue_appendPowerMeterValuesFromRawAudioData_frameCount_format_isPredigest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:");
}

id objc_msgSend__onQueue_appendSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueue_appendSegment:");
}

id objc_msgSend__onQueue_digestAveragePowerLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueue_digestAveragePowerLevel:");
}

id objc_msgSend__onQueue_flushRemainingData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueue_flushRemainingData");
}

id objc_msgSend__onQueue_flushWaveformSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueue_flushWaveformSegment:");
}

id objc_msgSend__onQueue_flushWithNextSegmentWithEndTime_isPredigest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueue_flushWithNextSegmentWithEndTime:isPredigest:");
}

id objc_msgSend__onQueue_performInternalFinishedLoadingBlocksAndFinishObservers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueue_performInternalFinishedLoadingBlocksAndFinishObservers");
}

id objc_msgSend__onQueue_performLoadingFinishedBlock_internalBlockUUID_isTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueue_performLoadingFinishedBlock:internalBlockUUID:isTimeout:");
}

id objc_msgSend__onQueue_performObserversBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueue_performObserversBlock:");
}

id objc_msgSend__performObserversBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performObserversBlock:");
}

id objc_msgSend__performOnObserversBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performOnObserversBlock:");
}

id objc_msgSend__performOrDispatchToMainThread_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performOrDispatchToMainThread:");
}

id objc_msgSend__pointsPerSecond(void *a1, const char *a2, ...)
{
  return _[a1 _pointsPerSecond];
}

id objc_msgSend__rc_constraintsByNameDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rc_constraintsByNameDictionary:");
}

id objc_msgSend__rc_constraintsNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rc_constraintsNamed:");
}

id objc_msgSend__renderTimeRangeOfSegments_withDuration_needsWaveformCalculation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_renderTimeRangeOfSegments:withDuration:needsWaveformCalculation:");
}

id objc_msgSend__renderVisibleTimeRangeWithDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_renderVisibleTimeRangeWithDuration:");
}

id objc_msgSend__roundedThemePrimaryBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 _roundedThemePrimaryBackgroundColor];
}

id objc_msgSend__segmentByMergingMergableSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_segmentByMergingMergableSegments:");
}

id objc_msgSend__segmentWithValuesInContainedTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_segmentWithValuesInContainedTimeRange:");
}

id objc_msgSend__segmentsByJoiningIfNecessaryGreaterSegment_averagePowerLevelJoinLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_segmentsByJoiningIfNecessaryGreaterSegment:averagePowerLevelJoinLimit:");
}

id objc_msgSend__segmentsByJoiningSegment_toSegmentIfNecessaryWithGreaterSegment_averagePowerLevelJoinLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_segmentsByJoiningSegment:toSegmentIfNecessaryWithGreaterSegment:averagePowerLevelJoinLimit:");
}

id objc_msgSend__selectionBoundsIncludingKnobs(void *a1, const char *a2, ...)
{
  return _[a1 _selectionBoundsIncludingKnobs];
}

id objc_msgSend__selectionBoundsIncludingKnobsUsingMultiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectionBoundsIncludingKnobsUsingMultiplier:");
}

id objc_msgSend__selectionHighlightBounds(void *a1, const char *a2, ...)
{
  return _[a1 _selectionHighlightBounds];
}

id objc_msgSend__selectionOverlay(void *a1, const char *a2, ...)
{
  return _[a1 _selectionOverlay];
}

id objc_msgSend__selectionRectForSelectedTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectionRectForSelectedTimeRange:");
}

id objc_msgSend__setNeedsRendering(void *a1, const char *a2, ...)
{
  return _[a1 _setNeedsRendering];
}

id objc_msgSend__setNeedsVisibleTimeRangeRendering(void *a1, const char *a2, ...)
{
  return _[a1 _setNeedsVisibleTimeRangeRendering];
}

id objc_msgSend__setNeedsVisibleTimeRangeRenderingFromFrameChange(void *a1, const char *a2, ...)
{
  return _[a1 _setNeedsVisibleTimeRangeRenderingFromFrameChange];
}

id objc_msgSend__setSelectedTimeRange_updateVisibleTimeRange_updateWaveformViewContentSizeAndOffset_notifyDelegate_animationDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:");
}

id objc_msgSend__setSelectionOverlayEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSelectionOverlayEnabled:");
}

id objc_msgSend__setTimeMarkerViewsNeedInitialLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTimeMarkerViewsNeedInitialLayout:");
}

id objc_msgSend__setWantsAnimatedLayoutDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setWantsAnimatedLayoutDuration:");
}

id objc_msgSend__setWaveformDataSource_initialTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setWaveformDataSource:initialTime:");
}

id objc_msgSend__shouldOffsetSelectionBarTypeForThumb_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldOffsetSelectionBarTypeForThumb:");
}

id objc_msgSend__startRendering(void *a1, const char *a2, ...)
{
  return _[a1 _startRendering];
}

id objc_msgSend__startUpdating(void *a1, const char *a2, ...)
{
  return _[a1 _startUpdating];
}

id objc_msgSend__stopRendering(void *a1, const char *a2, ...)
{
  return _[a1 _stopRendering];
}

id objc_msgSend__stopUpdating(void *a1, const char *a2, ...)
{
  return _[a1 _stopUpdating];
}

id objc_msgSend__syncWaveformCompactness(void *a1, const char *a2, ...)
{
  return _[a1 _syncWaveformCompactness];
}

id objc_msgSend__thisWeekDateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _thisWeekDateFormatter];
}

id objc_msgSend__timeLabelAttributes(void *a1, const char *a2, ...)
{
  return _[a1 _timeLabelAttributes];
}

id objc_msgSend__todayDateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _todayDateFormatter];
}

id objc_msgSend__touchTrackingInfoForSelectionBarTye_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_touchTrackingInfoForSelectionBarTye:");
}

id objc_msgSend__updateAnnotationViews(void *a1, const char *a2, ...)
{
  return _[a1 _updateAnnotationViews];
}

id objc_msgSend__updateBackgroundWaveformHighlight(void *a1, const char *a2, ...)
{
  return _[a1 _updateBackgroundWaveformHighlight];
}

id objc_msgSend__updateCurrentTimeDisplay(void *a1, const char *a2, ...)
{
  return _[a1 _updateCurrentTimeDisplay];
}

id objc_msgSend__updateCurrentTimeForCapturedInputAtTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCurrentTimeForCapturedInputAtTime:");
}

id objc_msgSend__updateDisplayableTimesWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDisplayableTimesWithBlock:");
}

id objc_msgSend__updateInterfaceForTimeControllerState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateInterfaceForTimeControllerState:");
}

id objc_msgSend__updateOverviewUnitsPerSecond(void *a1, const char *a2, ...)
{
  return _[a1 _updateOverviewUnitsPerSecond];
}

id objc_msgSend__updateSelectedTimeRangeForTrackedTouchesAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSelectedTimeRangeForTrackedTouchesAnimated:");
}

id objc_msgSend__updateSelectionOverlayWithAnimationDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSelectionOverlayWithAnimationDuration:");
}

id objc_msgSend__updateVisibleAreaWithAnimationDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateVisibleAreaWithAnimationDuration:");
}

id objc_msgSend__updateWaveformViewContentSizeAndOffset(void *a1, const char *a2, ...)
{
  return _[a1 _updateWaveformViewContentSizeAndOffset];
}

id objc_msgSend__updateWaveformViewContentSizeAndOffsetToSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWaveformViewContentSizeAndOffsetToSize:");
}

id objc_msgSend__usesVibrantUI(void *a1, const char *a2, ...)
{
  return _[a1 _usesVibrantUI];
}

id objc_msgSend__visibleTimeRangeForCurrentSelectionTimeRange(void *a1, const char *a2, ...)
{
  return _[a1 _visibleTimeRangeForCurrentSelectionTimeRange];
}

id objc_msgSend__xAdjustmentAmount(void *a1, const char *a2, ...)
{
  return _[a1 _xAdjustmentAmount];
}

id objc_msgSend__yesterdayDateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _yesterdayDateFormatter];
}

id objc_msgSend_accessibilityContainer(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityContainer];
}

id objc_msgSend_accessibilityElements(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityElements];
}

id objc_msgSend_accessibilityLargeSizes(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityLargeSizes];
}

id objc_msgSend_accessibilityValue(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityValue];
}

id objc_msgSend_accumulatorWaveform(void *a1, const char *a2, ...)
{
  return _[a1 accumulatorWaveform];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activeTimeController(void *a1, const char *a2, ...)
{
  return _[a1 activeTimeController];
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConstraints:");
}

id objc_msgSend_addDisplayLinkObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDisplayLinkObserver:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addSegmentOutputObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSegmentOutputObserver:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:");
}

id objc_msgSend_addTimeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimeObserver:");
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToRunLoop:forMode:");
}

id objc_msgSend_adjustsStartTime(void *a1, const char *a2, ...)
{
  return _[a1 adjustsStartTime];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allowsWeakReference(void *a1, const char *a2, ...)
{
  return _[a1 allowsWeakReference];
}

id objc_msgSend_alphaComponent(void *a1, const char *a2, ...)
{
  return _[a1 alphaComponent];
}

id objc_msgSend_amplitude(void *a1, const char *a2, ...)
{
  return _[a1 amplitude];
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

id objc_msgSend_animationDragCoefficient(void *a1, const char *a2, ...)
{
  return _[a1 animationDragCoefficient];
}

id objc_msgSend_animationForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationForKey:");
}

id objc_msgSend_animationKeys(void *a1, const char *a2, ...)
{
  return _[a1 animationKeys];
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_annotatedWaveformRectForLayoutBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotatedWaveformRectForLayoutBounds:");
}

id objc_msgSend_annotationViewHeight(void *a1, const char *a2, ...)
{
  return _[a1 annotationViewHeight];
}

id objc_msgSend_appendAveragePowerLevelsByDigestingWaveformSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAveragePowerLevelsByDigestingWaveformSegment:");
}

id objc_msgSend_appendAveragePowerLevelsByDigestingWaveformSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAveragePowerLevelsByDigestingWaveformSegments:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_applicationIsInstalled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationIsInstalled:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 areAnimationsEnabled];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return _[a1 ascender];
}

id objc_msgSend_async_finishLoadingByTerminating_loadingFinishedBlockTimeout_loadingFinishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "async_finishLoadingByTerminating:loadingFinishedBlockTimeout:loadingFinishedBlock:");
}

id objc_msgSend_audioMessageDidCancelMessage(void *a1, const char *a2, ...)
{
  return _[a1 audioMessageDidCancelMessage];
}

id objc_msgSend_audioMessageDidChangeAudioPowerLevel_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioMessageDidChangeAudioPowerLevel:duration:");
}

id objc_msgSend_audioMessageDidChangeCurrentPlaybackTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioMessageDidChangeCurrentPlaybackTime:");
}

id objc_msgSend_audioMessageDidEndPlayback(void *a1, const char *a2, ...)
{
  return _[a1 audioMessageDidEndPlayback];
}

id objc_msgSend_audioMessageDidSendMessage(void *a1, const char *a2, ...)
{
  return _[a1 audioMessageDidSendMessage];
}

id objc_msgSend_audioMessageDidStartPlayback(void *a1, const char *a2, ...)
{
  return _[a1 audioMessageDidStartPlayback];
}

id objc_msgSend_audioMessageRecordingAvailabilityChanged(void *a1, const char *a2, ...)
{
  return _[a1 audioMessageRecordingAvailabilityChanged];
}

id objc_msgSend_audioMessageStartedRecordingFromMessages(void *a1, const char *a2, ...)
{
  return _[a1 audioMessageStartedRecordingFromMessages];
}

id objc_msgSend_audioMessageStoppedRecordingFromMessages(void *a1, const char *a2, ...)
{
  return _[a1 audioMessageStoppedRecordingFromMessages];
}

id objc_msgSend_audioWaveformControllerDidChangeAVState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioWaveformControllerDidChangeAVState:");
}

id objc_msgSend_audioWaveformControllerDidChangeAVTimes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioWaveformControllerDidChangeAVTimes:");
}

id objc_msgSend_audioWaveformControllerDidChangeWaveformDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioWaveformControllerDidChangeWaveformDataSource:");
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return _[a1 autoupdatingCurrentLocale];
}

id objc_msgSend_averagePowerLevels(void *a1, const char *a2, ...)
{
  return _[a1 averagePowerLevels];
}

id objc_msgSend_averagePowerLevelsCount(void *a1, const char *a2, ...)
{
  return _[a1 averagePowerLevelsCount];
}

id objc_msgSend_averagePowerLevelsRate(void *a1, const char *a2, ...)
{
  return _[a1 averagePowerLevelsRate];
}

id objc_msgSend_axSegment(void *a1, const char *a2, ...)
{
  return _[a1 axSegment];
}

id objc_msgSend_barComponents(void *a1, const char *a2, ...)
{
  return _[a1 barComponents];
}

id objc_msgSend_barMatchesKnobRadius(void *a1, const char *a2, ...)
{
  return _[a1 barMatchesKnobRadius];
}

id objc_msgSend_barWidthMatchesKnobs(void *a1, const char *a2, ...)
{
  return _[a1 barWidthMatchesKnobs];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginIgnoringContentOffsetChanges(void *a1, const char *a2, ...)
{
  return _[a1 beginIgnoringContentOffsetChanges];
}

id objc_msgSend_beginLoading(void *a1, const char *a2, ...)
{
  return _[a1 beginLoading];
}

id objc_msgSend_beginTime(void *a1, const char *a2, ...)
{
  return _[a1 beginTime];
}

id objc_msgSend_beginTimeIndicatorSelectionAffinity(void *a1, const char *a2, ...)
{
  return _[a1 beginTimeIndicatorSelectionAffinity];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_cancelAudioMessage(void *a1, const char *a2, ...)
{
  return _[a1 cancelAudioMessage];
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return _[a1 canceled];
}

id objc_msgSend_changeAXValue(void *a1, const char *a2, ...)
{
  return _[a1 changeAXValue];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return _[a1 color];
}

id objc_msgSend_colorForSliceColor_dimmed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorForSliceColor:dimmed:");
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
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

id objc_msgSend_compactStylePlayheadMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 compactStylePlayheadMultiplier];
}

id objc_msgSend_compactStyleTimeBarDefaultHeight(void *a1, const char *a2, ...)
{
  return _[a1 compactStyleTimeBarDefaultHeight];
}

id objc_msgSend_compactStyleTimeBarHeightInset(void *a1, const char *a2, ...)
{
  return _[a1 compactStyleTimeBarHeightInset];
}

id objc_msgSend_compactWaveformWaveVerticalPadding(void *a1, const char *a2, ...)
{
  return _[a1 compactWaveformWaveVerticalPadding];
}

id objc_msgSend_compareDate_toDate_toUnitGranularity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compareDate:toDate:toUnitGranularity:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_composition(void *a1, const char *a2, ...)
{
  return _[a1 composition];
}

id objc_msgSend_configurationWithPointSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithPointSize:");
}

id objc_msgSend_configurationWithPointSize_weight_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithPointSize:weight:scale:");
}

id objc_msgSend_configurationWithTextStyle_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithTextStyle:scale:");
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return _[a1 constant];
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return _[a1 constraints];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _[a1 contentOffset];
}

id objc_msgSend_contentOffsetInPresentationLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentOffsetInPresentationLayer:");
}

id objc_msgSend_contentWidth(void *a1, const char *a2, ...)
{
  return _[a1 contentWidth];
}

id objc_msgSend_convertRect_fromLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromLayer:");
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toView:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyWithAdjustedTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithAdjustedTimeRange:");
}

id objc_msgSend_copyWithTimeRangeOffsetByTimeOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithTimeRangeOffsetByTimeOffset:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createNewWaveformViewControllerWithDataSource_isOverview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNewWaveformViewControllerWithDataSource:isOverview:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentDuration(void *a1, const char *a2, ...)
{
  return _[a1 currentDuration];
}

id objc_msgSend_currentEntryView(void *a1, const char *a2, ...)
{
  return _[a1 currentEntryView];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentRate(void *a1, const char *a2, ...)
{
  return _[a1 currentRate];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return _[a1 currentThread];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return _[a1 currentTime];
}

id objc_msgSend_currentTimeIndicatorCoordinate(void *a1, const char *a2, ...)
{
  return _[a1 currentTimeIndicatorCoordinate];
}

id objc_msgSend_damping(void *a1, const char *a2, ...)
{
  return _[a1 damping];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingDays_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingDays:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultMetrics(void *a1, const char *a2, ...)
{
  return _[a1 defaultMetrics];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return _[a1 descender];
}

id objc_msgSend_desiredTimeDeltaForVisibleTimeRange(void *a1, const char *a2, ...)
{
  return _[a1 desiredTimeDeltaForVisibleTimeRange];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_disableRotationWhileRecordingAudioMessage(void *a1, const char *a2, ...)
{
  return _[a1 disableRotationWhileRecordingAudioMessage];
}

id objc_msgSend_displayLinkDidUpdate_withTimeController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayLinkDidUpdate:withTimeController:");
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayLinkWithTarget:selector:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_drawAtPoint_withAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawAtPoint:withAttributes:");
}

id objc_msgSend_drawViewHierarchyInRect_afterScreenUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawViewHierarchyInRect:afterScreenUpdates:");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_durationPerWaveformSlice(void *a1, const char *a2, ...)
{
  return _[a1 durationPerWaveformSlice];
}

id objc_msgSend_editButtonContentTopBottomPadding(void *a1, const char *a2, ...)
{
  return _[a1 editButtonContentTopBottomPadding];
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_emptySegmentWithTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emptySegmentWithTimeRange:");
}

id objc_msgSend_enablePlayBarTracking(void *a1, const char *a2, ...)
{
  return _[a1 enablePlayBarTracking];
}

id objc_msgSend_enableTimeTrackingInView(void *a1, const char *a2, ...)
{
  return _[a1 enableTimeTrackingInView];
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endIgnoringContentOffsetChanges(void *a1, const char *a2, ...)
{
  return _[a1 endIgnoringContentOffsetChanges];
}

id objc_msgSend_endTimeIndicatorSelectionAffinity(void *a1, const char *a2, ...)
{
  return _[a1 endTimeIndicatorSelectionAffinity];
}

id objc_msgSend_enumerateByteRangesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateByteRangesUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_expiration(void *a1, const char *a2, ...)
{
  return _[a1 expiration];
}

id objc_msgSend_failedFirstRenderCalculationAttempt(void *a1, const char *a2, ...)
{
  return _[a1 failedFirstRenderCalculationAttempt];
}

id objc_msgSend_favoriteImageName(void *a1, const char *a2, ...)
{
  return _[a1 favoriteImageName];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_finishLoadingWithCompletionTimeout_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishLoadingWithCompletionTimeout:completionBlock:");
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return _[a1 finished];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return _[a1 firstIndex];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fixupScrollPositionToMatchIndicatorPositionTime(void *a1, const char *a2, ...)
{
  return _[a1 fixupScrollPositionToMatchIndicatorPositionTime];
}

id objc_msgSend_floatChannelData(void *a1, const char *a2, ...)
{
  return _[a1 floatChannelData];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return _[a1 format];
}

id objc_msgSend_formattedDate(void *a1, const char *a2, ...)
{
  return _[a1 formattedDate];
}

id objc_msgSend_formattedDateStringFromDate_forUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedDateStringFromDate:forUUID:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_frameLength(void *a1, const char *a2, ...)
{
  return _[a1 frameLength];
}

id objc_msgSend_framePosition(void *a1, const char *a2, ...)
{
  return _[a1 framePosition];
}

id objc_msgSend_generatedWaveformOutputURL(void *a1, const char *a2, ...)
{
  return _[a1 generatedWaveformOutputURL];
}

id objc_msgSend_getRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRed:green:blue:alpha:");
}

id objc_msgSend_getValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValue:");
}

id objc_msgSend_hasContent(void *a1, const char *a2, ...)
{
  return _[a1 hasContent];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasProcessedSegments(void *a1, const char *a2, ...)
{
  return _[a1 hasProcessedSegments];
}

id objc_msgSend_hasSavedGeneratedWaveform(void *a1, const char *a2, ...)
{
  return _[a1 hasSavedGeneratedWaveform];
}

id objc_msgSend_hasUniformPowerLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasUniformPowerLevel:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_highlightTimeRange(void *a1, const char *a2, ...)
{
  return _[a1 highlightTimeRange];
}

id objc_msgSend_horizontalOffsetAtTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalOffsetAtTime:");
}

id objc_msgSend_horizontalOffsetAtTime_withVisibleTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalOffsetAtTime:withVisibleTimeRange:");
}

id objc_msgSend_hostsTransportAndDoneButtonInBottomSection(void *a1, const char *a2, ...)
{
  return _[a1 hostsTransportAndDoneButtonInBottomSection];
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_imageWithSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithSymbolConfiguration:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObject_inSortedRange_options_usingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_initForReading_commonFormat_interleaved_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReading:commonFormat:interleaved:error:");
}

id objc_msgSend_initWithAccessibilityContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccessibilityContainer:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithColor_selectionExtentIncludingKnobs_topKnob_bottomKnob_widthMultiplier_barWidthMatchesKnobs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:widthMultiplier:barWidthMatchesKnobs:");
}

id objc_msgSend_initWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:options:error:");
}

id objc_msgSend_initWithDampingRatio_initialVelocity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDampingRatio:initialVelocity:");
}

id objc_msgSend_initWithDelegate_height_selectionAreaInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:height:selectionAreaInsets:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithDuration_timingParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDuration:timingParameters:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithHandlerBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandlerBlock:");
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLength:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithOverviewWaveform_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOverviewWaveform:duration:");
}

id objc_msgSend_initWithPCMFormat_frameCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPCMFormat:frameCapacity:");
}

id objc_msgSend_initWithSamplingParametersFromGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSamplingParametersFromGenerator:");
}

id objc_msgSend_initWithSegmentFlushInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSegmentFlushInterval:");
}

id objc_msgSend_initWithSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSegments:");
}

id objc_msgSend_initWithTarget_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:selector:");
}

id objc_msgSend_initWithTimeRange_averagePowerLevelData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeRange:averagePowerLevelData:");
}

id objc_msgSend_initWithTimeRange_averagePowerLevelVector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeRange:averagePowerLevelVector:");
}

id objc_msgSend_initWithWaveformDataSource_isOverview_isLockScreen_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWaveformDataSource:isOverview:isLockScreen:delegate:");
}

id objc_msgSend_initWithWaveformGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWaveformGenerator:");
}

id objc_msgSend_insertSubview_above_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:above:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 interfaceOrientation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isAccessibilityElement(void *a1, const char *a2, ...)
{
  return _[a1 isAccessibilityElement];
}

id objc_msgSend_isAccessibilityLargerTextSizeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAccessibilityLargerTextSizeEnabled];
}

id objc_msgSend_isAudioMessageRecordingAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAudioMessageRecordingAvailable];
}

id objc_msgSend_isCompactView(void *a1, const char *a2, ...)
{
  return _[a1 isCompactView];
}

id objc_msgSend_isCurrentlyTracking(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentlyTracking];
}

id objc_msgSend_isDateInToday_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDateInToday:");
}

id objc_msgSend_isDateInYesterday_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDateInYesterday:");
}

id objc_msgSend_isEditingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEditingEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isInHardwareKeyboardMode(void *a1, const char *a2, ...)
{
  return _[a1 isInHardwareKeyboardMode];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isOverview(void *a1, const char *a2, ...)
{
  return _[a1 isOverview];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return _[a1 isPaused];
}

id objc_msgSend_isPlayBarOnlyMode(void *a1, const char *a2, ...)
{
  return _[a1 isPlayBarOnlyMode];
}

id objc_msgSend_isPlayback(void *a1, const char *a2, ...)
{
  return _[a1 isPlayback];
}

id objc_msgSend_isRecordWaveform(void *a1, const char *a2, ...)
{
  return _[a1 isRecordWaveform];
}

id objc_msgSend_isRecording(void *a1, const char *a2, ...)
{
  return _[a1 isRecording];
}

id objc_msgSend_isSelectedTimeRangeEditingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSelectedTimeRangeEditingEnabled];
}

id objc_msgSend_isUserInterfaceStyleDark(void *a1, const char *a2, ...)
{
  return _[a1 isUserInterfaceStyleDark];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_isWaveformDataAlmostEqualToDataInSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWaveformDataAlmostEqualToDataInSegment:");
}

id objc_msgSend_isWaveformDataEqualToDataInSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWaveformDataEqualToDataInSegment:");
}

id objc_msgSend_isWaveformOverview(void *a1, const char *a2, ...)
{
  return _[a1 isWaveformOverview];
}

id objc_msgSend_isZooming(void *a1, const char *a2, ...)
{
  return _[a1 isZooming];
}

id objc_msgSend_jumpBackwardForwardButtonSpacing(void *a1, const char *a2, ...)
{
  return _[a1 jumpBackwardForwardButtonSpacing];
}

id objc_msgSend_knobWidthMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 knobWidthMultiplier];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _[a1 languageCode];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_librarySupportsBlueCellSelectionStyle(void *a1, const char *a2, ...)
{
  return _[a1 librarySupportsBlueCellSelectionStyle];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return _[a1 lineHeight];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localeIdentifier];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_mass(void *a1, const char *a2, ...)
{
  return _[a1 mass];
}

id objc_msgSend_maximumDecibelDisplayRange(void *a1, const char *a2, ...)
{
  return _[a1 maximumDecibelDisplayRange];
}

id objc_msgSend_maximumSelectionDuration(void *a1, const char *a2, ...)
{
  return _[a1 maximumSelectionDuration];
}

id objc_msgSend_mergeGeneratedWaveformIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 mergeGeneratedWaveformIfNecessary];
}

id objc_msgSend_minimumDecibelDisplayRange(void *a1, const char *a2, ...)
{
  return _[a1 minimumDecibelDisplayRange];
}

id objc_msgSend_monospacedDigitSystemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monospacedDigitSystemFontOfSize:weight:");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_needsLocalizedSymbolImageWorkaround(void *a1, const char *a2, ...)
{
  return _[a1 needsLocalizedSymbolImageWorkaround];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_nextPreviewStartTime(void *a1, const char *a2, ...)
{
  return _[a1 nextPreviewStartTime];
}

id objc_msgSend_nextRenderBlock(void *a1, const char *a2, ...)
{
  return _[a1 nextRenderBlock];
}

id objc_msgSend_notFavoriteImageName(void *a1, const char *a2, ...)
{
  return _[a1 notFavoriteImageName];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberingSystem(void *a1, const char *a2, ...)
{
  return _[a1 numberingSystem];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
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

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return _[a1 opacity];
}

id objc_msgSend_overviewKnobWidthMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 overviewKnobWidthMultiplier];
}

id objc_msgSend_overviewPlayheadHeightInset(void *a1, const char *a2, ...)
{
  return _[a1 overviewPlayheadHeightInset];
}

id objc_msgSend_overviewPlayheadWidthMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 overviewPlayheadWidthMultiplier];
}

id objc_msgSend_overviewTrimHandleStyle(void *a1, const char *a2, ...)
{
  return _[a1 overviewTrimHandleStyle];
}

id objc_msgSend_overviewUnitsPerSecond(void *a1, const char *a2, ...)
{
  return _[a1 overviewUnitsPerSecond];
}

id objc_msgSend_overviewWaveformCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 overviewWaveformCornerRadius];
}

id objc_msgSend_overviewWaveformHorizontalSpacing(void *a1, const char *a2, ...)
{
  return _[a1 overviewWaveformHorizontalSpacing];
}

id objc_msgSend_overviewWaveformMinimumDurationToDisplayWhenRecording(void *a1, const char *a2, ...)
{
  return _[a1 overviewWaveformMinimumDurationToDisplayWhenRecording];
}

id objc_msgSend_overviewWaveformWaveVerticalPadding(void *a1, const char *a2, ...)
{
  return _[a1 overviewWaveformWaveVerticalPadding];
}

id objc_msgSend_overviewWaveformWaveWidth(void *a1, const char *a2, ...)
{
  return _[a1 overviewWaveformWaveWidth];
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 panGestureRecognizer];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_pausePlaying(void *a1, const char *a2, ...)
{
  return _[a1 pausePlaying];
}

id objc_msgSend_paused(void *a1, const char *a2, ...)
{
  return _[a1 paused];
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_pinchGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 pinchGestureRecognizer];
}

id objc_msgSend_playBarOnly(void *a1, const char *a2, ...)
{
  return _[a1 playBarOnly];
}

id objc_msgSend_playWidthMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 playWidthMultiplier];
}

id objc_msgSend_playbackPositionBarColor(void *a1, const char *a2, ...)
{
  return _[a1 playbackPositionBarColor];
}

id objc_msgSend_playbackSpeedSliderHeight(void *a1, const char *a2, ...)
{
  return _[a1 playbackSpeedSliderHeight];
}

id objc_msgSend_playbackViewBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackViewBackgroundColor:");
}

id objc_msgSend_playheadWidthMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 playheadWidthMultiplier];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return _[a1 pointerValue];
}

id objc_msgSend_pointsPerSecond(void *a1, const char *a2, ...)
{
  return _[a1 pointsPerSecond];
}

id objc_msgSend_pointsPerSecondWithVisibleTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointsPerSecondWithVisibleTimeRange:");
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _[a1 position];
}

id objc_msgSend_powerLevels(void *a1, const char *a2, ...)
{
  return _[a1 powerLevels];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:");
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return _[a1 presentationLayer];
}

id objc_msgSend_presentsTitleAndAdditionalEditingControlsInPlaybackCard(void *a1, const char *a2, ...)
{
  return _[a1 presentsTitleAndAdditionalEditingControlsInPlaybackCard];
}

id objc_msgSend_processingFormat(void *a1, const char *a2, ...)
{
  return _[a1 processingFormat];
}

id objc_msgSend_progressViewBackgroundColorEditingCard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "progressViewBackgroundColorEditingCard:");
}

id objc_msgSend_quaternarySystemFillColor(void *a1, const char *a2, ...)
{
  return _[a1 quaternarySystemFillColor];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rangeOfSegmentsIntersectingTimeRange_withSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfSegmentsIntersectingTimeRange:withSegments:");
}

id objc_msgSend_rc_URLByReplacingPathExtensionWithExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rc_URLByReplacingPathExtensionWithExtension:");
}

id objc_msgSend_rc_canAnimate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rc_canAnimate");
}

id objc_msgSend_rc_displayWithFramesPerSecond_handlerBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rc_displayWithFramesPerSecond:handlerBlock:");
}

id objc_msgSend_rc_removeConstraintsNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rc_removeConstraintsNamed:");
}

id objc_msgSend_rc_runUntilNextDisplayLinkEventWithTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rc_runUntilNextDisplayLinkEventWithTimeout:");
}

id objc_msgSend_rc_showAllViewBoundsRecursively_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rc_showAllViewBoundsRecursively:");
}

id objc_msgSend_readIntoBuffer_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readIntoBuffer:error:");
}

id objc_msgSend_readIntoBuffer_frameCount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readIntoBuffer:frameCount:error:");
}

id objc_msgSend_recordPositionBarColor(void *a1, const char *a2, ...)
{
  return _[a1 recordPositionBarColor];
}

id objc_msgSend_recordingCardBottomAccessoryBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 recordingCardBottomAccessoryBackgroundColor];
}

id objc_msgSend_recordingCardBottomGradientColor(void *a1, const char *a2, ...)
{
  return _[a1 recordingCardBottomGradientColor];
}

id objc_msgSend_recordingCardTopBorderColor1(void *a1, const char *a2, ...)
{
  return _[a1 recordingCardTopBorderColor1];
}

id objc_msgSend_recordingCardTopBorderColor2(void *a1, const char *a2, ...)
{
  return _[a1 recordingCardTopBorderColor2];
}

id objc_msgSend_recordingCardTopGradientColor(void *a1, const char *a2, ...)
{
  return _[a1 recordingCardTopGradientColor];
}

id objc_msgSend_recordingControlHeight(void *a1, const char *a2, ...)
{
  return _[a1 recordingControlHeight];
}

id objc_msgSend_recordingTableViewSupportsSidebarBackgroundConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 recordingTableViewSupportsSidebarBackgroundConfiguration];
}

id objc_msgSend_reloadLocalizedFormatStrings(void *a1, const char *a2, ...)
{
  return _[a1 reloadLocalizedFormatStrings];
}

id objc_msgSend_reloadOverlayOffsets(void *a1, const char *a2, ...)
{
  return _[a1 reloadOverlayOffsets];
}

id objc_msgSend_reloadSelectionOffsets(void *a1, const char *a2, ...)
{
  return _[a1 reloadSelectionOffsets];
}

id objc_msgSend_reloadWaveformDataSource_withActiveTimeController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadWaveformDataSource:withActiveTimeController:");
}

id objc_msgSend_remove(void *a1, const char *a2, ...)
{
  return _[a1 remove];
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _[a1 removeAllAnimations];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConstraints:");
}

id objc_msgSend_removeDisplayLinkObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDisplayLinkObserver:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeIndex:");
}

id objc_msgSend_removeIndexesInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeIndexesInRange:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeSegmentOutputObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSegmentOutputObserver:");
}

id objc_msgSend_removeTimeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTimeObserver:");
}

id objc_msgSend_renderReadyForDraw(void *a1, const char *a2, ...)
{
  return _[a1 renderReadyForDraw];
}

id objc_msgSend_renderer(void *a1, const char *a2, ...)
{
  return _[a1 renderer];
}

id objc_msgSend_rendererDelegate(void *a1, const char *a2, ...)
{
  return _[a1 rendererDelegate];
}

id objc_msgSend_renderingQueueIsBusy(void *a1, const char *a2, ...)
{
  return _[a1 renderingQueueIsBusy];
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_replaceObjectsInRange_withObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectsInRange:withObjectsFromArray:");
}

id objc_msgSend_replaceOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_replaceSelectionOverlayColor(void *a1, const char *a2, ...)
{
  return _[a1 replaceSelectionOverlayColor];
}

id objc_msgSend_resetSelectedTimeRangeToFullDuration(void *a1, const char *a2, ...)
{
  return _[a1 resetSelectedTimeRangeToFullDuration];
}

id objc_msgSend_runUntilDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runUntilDate:");
}

id objc_msgSend_safeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safeValueForKey:");
}

id objc_msgSend_sampleRate(void *a1, const char *a2, ...)
{
  return _[a1 sampleRate];
}

id objc_msgSend_saveContentsToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveContentsToURL:");
}

id objc_msgSend_saveGeneratedWaveformIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 saveGeneratedWaveformIfNecessary];
}

id objc_msgSend_saveableWaveform(void *a1, const char *a2, ...)
{
  return _[a1 saveableWaveform];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaledFontForFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledFontForFont:");
}

id objc_msgSend_scaledMonospacedSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledMonospacedSystemFontOfSize:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 secondarySystemBackgroundColor];
}

id objc_msgSend_segmentByClippingToTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentByClippingToTimeRange:");
}

id objc_msgSend_segmentCount(void *a1, const char *a2, ...)
{
  return _[a1 segmentCount];
}

id objc_msgSend_segments(void *a1, const char *a2, ...)
{
  return _[a1 segments];
}

id objc_msgSend_segmentsByClippingToTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentsByClippingToTimeRange:");
}

id objc_msgSend_segmentsByJoiningIfSmallSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentsByJoiningIfSmallSegment:");
}

id objc_msgSend_segmentsByMergingSegments_preferredSegmentDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentsByMergingSegments:preferredSegmentDuration:");
}

id objc_msgSend_segmentsByMergingSegments_preferredSegmentDuration_beforeTime_andThenUsePreferredSegmentDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentsByMergingSegments:preferredSegmentDuration:beforeTime:andThenUsePreferredSegmentDuration:");
}

id objc_msgSend_segmentsByReparingDiscontinuitiesInSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentsByReparingDiscontinuitiesInSegments:");
}

id objc_msgSend_segmentsByShiftingSegments_byTimeOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentsByShiftingSegments:byTimeOffset:");
}

id objc_msgSend_segmentsCopy(void *a1, const char *a2, ...)
{
  return _[a1 segmentsCopy];
}

id objc_msgSend_segmentsInCompositionByConvertingFromActiveLoadingFragment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentsInCompositionByConvertingFromActiveLoadingFragment:");
}

id objc_msgSend_segmentsIntersectingTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentsIntersectingTimeRange:");
}

id objc_msgSend_selectedTimeRange(void *a1, const char *a2, ...)
{
  return _[a1 selectedTimeRange];
}

id objc_msgSend_selectedTimeRangeMinimumDuration(void *a1, const char *a2, ...)
{
  return _[a1 selectedTimeRangeMinimumDuration];
}

id objc_msgSend_selectionAffinity(void *a1, const char *a2, ...)
{
  return _[a1 selectionAffinity];
}

id objc_msgSend_selectionBarType(void *a1, const char *a2, ...)
{
  return _[a1 selectionBarType];
}

id objc_msgSend_selectionBarWidth(void *a1, const char *a2, ...)
{
  return _[a1 selectionBarWidth];
}

id objc_msgSend_selectionBarWidthAX(void *a1, const char *a2, ...)
{
  return _[a1 selectionBarWidthAX];
}

id objc_msgSend_selectionHighlightToKnobInset(void *a1, const char *a2, ...)
{
  return _[a1 selectionHighlightToKnobInset];
}

id objc_msgSend_selectionHitTestSlop(void *a1, const char *a2, ...)
{
  return _[a1 selectionHitTestSlop];
}

id objc_msgSend_selectionKnobRadius(void *a1, const char *a2, ...)
{
  return _[a1 selectionKnobRadius];
}

id objc_msgSend_selectionKnobRadiusAX(void *a1, const char *a2, ...)
{
  return _[a1 selectionKnobRadiusAX];
}

id objc_msgSend_selectionMiddleTimeBaselineInset(void *a1, const char *a2, ...)
{
  return _[a1 selectionMiddleTimeBaselineInset];
}

id objc_msgSend_selectionOverlayAlpha(void *a1, const char *a2, ...)
{
  return _[a1 selectionOverlayAlpha];
}

id objc_msgSend_selectionOverlayBorderWidth(void *a1, const char *a2, ...)
{
  return _[a1 selectionOverlayBorderWidth];
}

id objc_msgSend_selectionOverlayColor(void *a1, const char *a2, ...)
{
  return _[a1 selectionOverlayColor];
}

id objc_msgSend_selectionOverlayEndpointBarColor(void *a1, const char *a2, ...)
{
  return _[a1 selectionOverlayEndpointBarColor];
}

id objc_msgSend_selectionOverlayShouldUseInsertMode(void *a1, const char *a2, ...)
{
  return _[a1 selectionOverlayShouldUseInsertMode];
}

id objc_msgSend_selectionRect(void *a1, const char *a2, ...)
{
  return _[a1 selectionRect];
}

id objc_msgSend_selectionTimeBaseLineOffset(void *a1, const char *a2, ...)
{
  return _[a1 selectionTimeBaseLineOffset];
}

id objc_msgSend_selectionTimeInsetNormal(void *a1, const char *a2, ...)
{
  return _[a1 selectionTimeInsetNormal];
}

id objc_msgSend_selectionTimeInsetWhenSelected(void *a1, const char *a2, ...)
{
  return _[a1 selectionTimeInsetWhenSelected];
}

id objc_msgSend_sendAudioMessage(void *a1, const char *a2, ...)
{
  return _[a1 sendAudioMessage];
}

id objc_msgSend_sendSubviewToBack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSubviewToBack:");
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return _[a1 separatorColor];
}

id objc_msgSend_setAccessibilityLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityLabel:");
}

id objc_msgSend_setActiveTimeController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveTimeController:");
}

id objc_msgSend_setAdjustsStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsStartTime:");
}

id objc_msgSend_setAllowedTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedTimeRange:");
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedUnits:");
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupOpacity:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlwaysBounceHorizontal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysBounceHorizontal:");
}

id objc_msgSend_setAmplitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAmplitude:");
}

id objc_msgSend_setAnchorPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnchorPoint:");
}

id objc_msgSend_setAnimationDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationDuration:");
}

id objc_msgSend_setAnimations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimations:");
}

id objc_msgSend_setAssetCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetCurrentTime:");
}

id objc_msgSend_setAssetDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetDuration:");
}

id objc_msgSend_setAudioMessageAppDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioMessageAppDelegate:");
}

id objc_msgSend_setAxSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAxSegment:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBarGlyph_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarGlyph:");
}

id objc_msgSend_setBarMatchesKnobRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarMatchesKnobRadius:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBounces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounces:");
}

id objc_msgSend_setBouncesZoom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBouncesZoom:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setCalcBlockShouldRefreshAllSlices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCalcBlockShouldRefreshAllSlices:");
}

id objc_msgSend_setCapturing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCapturing:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContentDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentDuration:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
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

id objc_msgSend_setContents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContents:");
}

id objc_msgSend_setContentsGravity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsGravity:");
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsScale:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCurrentDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentDuration:");
}

id objc_msgSend_setCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTime:");
}

id objc_msgSend_setCurrentTimeDisplayOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTimeDisplayOptions:");
}

id objc_msgSend_setDamping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDamping:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDebugID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugID:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredTimeDeltaForVisibleTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredTimeDeltaForVisibleTimeRange:");
}

id objc_msgSend_setDirectionalLockEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirectionalLockEnabled:");
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableActions:");
}

id objc_msgSend_setDoesRelativeDateFormatting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoesRelativeDateFormatting:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setDurationPerWaveformSlice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDurationPerWaveformSlice:");
}

id objc_msgSend_setEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditing:");
}

id objc_msgSend_setEditingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditingEnabled:");
}

id objc_msgSend_setEnableTimeTrackingInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableTimeTrackingInView:");
}

id objc_msgSend_setExpiration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpiration:");
}

id objc_msgSend_setFailedFirstRenderCalculationAttempt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFailedFirstRenderCalculationAttempt:");
}

id objc_msgSend_setFormattedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFormattedDate:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFramePosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFramePosition:");
}

id objc_msgSend_setFrequentUpdatesSegmentUpdatesExpectedHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrequentUpdatesSegmentUpdatesExpectedHint:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setHasProcessedSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasProcessedSegments:");
}

id objc_msgSend_setHasSavedGeneratedWaveform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasSavedGeneratedWaveform:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setInsertMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsertMode:");
}

id objc_msgSend_setIsCompactView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsCompactView:");
}

id objc_msgSend_setIsOverview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsOverview:");
}

id objc_msgSend_setIsPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPlayback:");
}

id objc_msgSend_setIsRecordWaveform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRecordWaveform:");
}

id objc_msgSend_setIsRecording_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRecording:");
}

id objc_msgSend_setKeyPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyPaths:");
}

id objc_msgSend_setKnobWidthMultiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKnobWidthMultiplier:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setMarkerClippingRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMarkerClippingRange:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setMass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMass:");
}

id objc_msgSend_setMaximumZoomScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumZoomScale:");
}

id objc_msgSend_setMinimumIntegerDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumIntegerDigits:");
}

id objc_msgSend_setMinimumZoomScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumZoomScale:");
}

id objc_msgSend_setMultipleTouchEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultipleTouchEnabled:");
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setNextRenderBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextRenderBlock:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObserver:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOverviewTrimHandleStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverviewTrimHandleStyle:");
}

id objc_msgSend_setOverviewUnitsPerSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverviewUnitsPerSecond:");
}

id objc_msgSend_setPaused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaused:");
}

id objc_msgSend_setPlayBarOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayBarOnly:");
}

id objc_msgSend_setPlayWidthMultiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayWidthMultiplier:");
}

id objc_msgSend_setPlaying_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaying:");
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPosition:");
}

id objc_msgSend_setPositiveFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPositiveFormat:");
}

id objc_msgSend_setPreferredFramesPerSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredFramesPerSecond:");
}

id objc_msgSend_setPrimaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryColor:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setRemovedOnCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovedOnCompletion:");
}

id objc_msgSend_setRenderReadyForDraw_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRenderReadyForDraw:");
}

id objc_msgSend_setRenderer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRenderer:");
}

id objc_msgSend_setRendererDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRendererDelegate:");
}

id objc_msgSend_setRenderingQueueIsBusy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRenderingQueueIsBusy:");
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScale:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setScrubbingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrubbingEnabled:");
}

id objc_msgSend_setSecondaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondaryColor:");
}

id objc_msgSend_setSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSegments:");
}

id objc_msgSend_setSelectedTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedTimeRange:");
}

id objc_msgSend_setSelectedTimeRange_animationDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedTimeRange:animationDuration:");
}

id objc_msgSend_setSelectedTimeRange_withAnimationDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedTimeRange:withAnimationDuration:");
}

id objc_msgSend_setSelectedTimeRangeEditingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedTimeRangeEditingEnabled:");
}

id objc_msgSend_setSelectedTimeRangeMinimumDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedTimeRangeMinimumDuration:");
}

id objc_msgSend_setSelectionBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionBackgroundView:");
}

id objc_msgSend_setSelectionBarType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionBarType:");
}

id objc_msgSend_setSelectionMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionMode:");
}

id objc_msgSend_setSelectionOverlayShouldUseInsertMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionOverlayShouldUseInsertMode:");
}

id objc_msgSend_setShouldOnlyRenderOnScreenTimeLabels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldOnlyRenderOnScreenTimeLabels:");
}

id objc_msgSend_setShowPlayBarOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowPlayBarOnly:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setSliceIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSliceIndex:");
}

id objc_msgSend_setSliceLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSliceLayer:");
}

id objc_msgSend_setStiffness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStiffness:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setTargetTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetTime:");
}

id objc_msgSend_setTargetView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetView:");
}

id objc_msgSend_setThreadPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThreadPriority:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimingFunction:");
}

id objc_msgSend_setTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouch:");
}

id objc_msgSend_setTrackedAssetCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrackedAssetCurrentTime:");
}

id objc_msgSend_setTrackingOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrackingOffset:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUnitsStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnitsStyle:");
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

id objc_msgSend_setVisibleTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisibleTimeRange:");
}

id objc_msgSend_setVisibleTimeRange_animationDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisibleTimeRange:animationDuration:");
}

id objc_msgSend_setVisualAmplitudeHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisualAmplitudeHeight:");
}

id objc_msgSend_setVisualAmplitudeHeightInterpolatingFrames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisualAmplitudeHeightInterpolatingFrames:");
}

id objc_msgSend_setWaitForFinalCalc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitForFinalCalc:");
}

id objc_msgSend_setWaveformAmpSlicesForRendering_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaveformAmpSlicesForRendering:");
}

id objc_msgSend_setWaveformDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaveformDataSource:");
}

id objc_msgSend_setWaveformSliceIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaveformSliceIndexes:");
}

id objc_msgSend_setWaveformSlices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaveformSlices:");
}

id objc_msgSend_setWaveformViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaveformViewController:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setZPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZPosition:");
}

id objc_msgSend_setZeroFormattingBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZeroFormattingBehavior:");
}

id objc_msgSend_set_horizontalSizeClassFromSplitView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_horizontalSizeClassFromSplitView:");
}

id objc_msgSend_sharedDateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 sharedDateFormatter];
}

id objc_msgSend_sharedFormatter(void *a1, const char *a2, ...)
{
  return _[a1 sharedFormatter];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedMessagesViewController(void *a1, const char *a2, ...)
{
  return _[a1 sharedMessagesViewController];
}

id objc_msgSend_sharedNoAnimationHelper(void *a1, const char *a2, ...)
{
  return _[a1 sharedNoAnimationHelper];
}

id objc_msgSend_sharedStyleProvider(void *a1, const char *a2, ...)
{
  return _[a1 sharedStyleProvider];
}

id objc_msgSend_shouldMakeUIForDefaultPNG(void *a1, const char *a2, ...)
{
  return _[a1 shouldMakeUIForDefaultPNG];
}

id objc_msgSend_shouldMergeLiveWaveform(void *a1, const char *a2, ...)
{
  return _[a1 shouldMergeLiveWaveform];
}

id objc_msgSend_shouldOnlyRenderOnScreenTimeLabels(void *a1, const char *a2, ...)
{
  return _[a1 shouldOnlyRenderOnScreenTimeLabels];
}

id objc_msgSend_shouldShowOverviewWaveform(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowOverviewWaveform];
}

id objc_msgSend_showPlayBarOnly(void *a1, const char *a2, ...)
{
  return _[a1 showPlayBarOnly];
}

id objc_msgSend_showsEmptyLibraryMessageInLibrary(void *a1, const char *a2, ...)
{
  return _[a1 showsEmptyLibraryMessageInLibrary];
}

id objc_msgSend_sidebarCollectionViewBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 sidebarCollectionViewBackgroundColor];
}

id objc_msgSend_simpleDescription(void *a1, const char *a2, ...)
{
  return _[a1 simpleDescription];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeWithAttributes:");
}

id objc_msgSend_sliceIndex(void *a1, const char *a2, ...)
{
  return _[a1 sliceIndex];
}

id objc_msgSend_sliceLayer(void *a1, const char *a2, ...)
{
  return _[a1 sliceLayer];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startOfDayForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOfDayForDate:");
}

id objc_msgSend_startPlaying(void *a1, const char *a2, ...)
{
  return _[a1 startPlaying];
}

id objc_msgSend_startRecording(void *a1, const char *a2, ...)
{
  return _[a1 startRecording];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stiffness(void *a1, const char *a2, ...)
{
  return _[a1 stiffness];
}

id objc_msgSend_stopRecording(void *a1, const char *a2, ...)
{
  return _[a1 stopRecording];
}

id objc_msgSend_stopScrolling(void *a1, const char *a2, ...)
{
  return _[a1 stopScrolling];
}

id objc_msgSend_streamDescription(void *a1, const char *a2, ...)
{
  return _[a1 streamDescription];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromDuration_hideComponentOptions_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDuration:hideComponentOptions:style:");
}

id objc_msgSend_stringFromDuration_replacingDigitsWithDigit_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDuration:replacingDigitsWithDigit:style:");
}

id objc_msgSend_stringFromDuration_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDuration:style:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromTimeInterval:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return _[a1 sublayers];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return _[a1 superlayer];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportsAccompaniedSidebarStyle(void *a1, const char *a2, ...)
{
  return _[a1 supportsAccompaniedSidebarStyle];
}

id objc_msgSend_system(void *a1, const char *a2, ...)
{
  return _[a1 system];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlackColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:weight:");
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemImageNamedNumberAware_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamedNumberAware:");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemRedColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _[a1 systemWhiteColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return _[a1 systemYellowColor];
}

id objc_msgSend_tableViewBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 tableViewBackgroundColor];
}

id objc_msgSend_tableViewCellTextColor(void *a1, const char *a2, ...)
{
  return _[a1 tableViewCellTextColor];
}

id objc_msgSend_terminateLoadingImmediately(void *a1, const char *a2, ...)
{
  return _[a1 terminateLoadingImmediately];
}

id objc_msgSend_tertiarySystemFillColor(void *a1, const char *a2, ...)
{
  return _[a1 tertiarySystemFillColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textAlignment(void *a1, const char *a2, ...)
{
  return _[a1 textAlignment];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_textRectWithAlignment_inLayoutBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textRectWithAlignment:inLayoutBounds:");
}

id objc_msgSend_threadPriority(void *a1, const char *a2, ...)
{
  return _[a1 threadPriority];
}

id objc_msgSend_tickMarksForMajorInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tickMarksForMajorInterval:");
}

id objc_msgSend_timeAtHorizontalOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeAtHorizontalOffset:");
}

id objc_msgSend_timeController_didChangeCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeController:didChangeCurrentTime:");
}

id objc_msgSend_timeController_didChangeRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeController:didChangeRate:");
}

id objc_msgSend_timeController_didChangeState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeController:didChangeState:");
}

id objc_msgSend_timeControllerState(void *a1, const char *a2, ...)
{
  return _[a1 timeControllerState];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeLabelsMajorInterval(void *a1, const char *a2, ...)
{
  return _[a1 timeLabelsMajorInterval];
}

id objc_msgSend_timeLineLabelFont(void *a1, const char *a2, ...)
{
  return _[a1 timeLineLabelFont];
}

id objc_msgSend_timeLineMajorPlaybackMarkerColor(void *a1, const char *a2, ...)
{
  return _[a1 timeLineMajorPlaybackMarkerColor];
}

id objc_msgSend_timeLineMajorTickHeight(void *a1, const char *a2, ...)
{
  return _[a1 timeLineMajorTickHeight];
}

id objc_msgSend_timeLineMinorPlaybackMarkerColor(void *a1, const char *a2, ...)
{
  return _[a1 timeLineMinorPlaybackMarkerColor];
}

id objc_msgSend_timeLineMinorTickHeight(void *a1, const char *a2, ...)
{
  return _[a1 timeLineMinorTickHeight];
}

id objc_msgSend_timeLineTickWidth(void *a1, const char *a2, ...)
{
  return _[a1 timeLineTickWidth];
}

id objc_msgSend_timeObservers(void *a1, const char *a2, ...)
{
  return _[a1 timeObservers];
}

id objc_msgSend_timeRange(void *a1, const char *a2, ...)
{
  return _[a1 timeRange];
}

id objc_msgSend_timeRangeToHighlight(void *a1, const char *a2, ...)
{
  return _[a1 timeRangeToHighlight];
}

id objc_msgSend_timelinePlaybackBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timelinePlaybackBackgroundColor:");
}

id objc_msgSend_timelinePlaybackTimeColor(void *a1, const char *a2, ...)
{
  return _[a1 timelinePlaybackTimeColor];
}

id objc_msgSend_timingFunction(void *a1, const char *a2, ...)
{
  return _[a1 timingFunction];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_touch(void *a1, const char *a2, ...)
{
  return _[a1 touch];
}

id objc_msgSend_trackingOffset(void *a1, const char *a2, ...)
{
  return _[a1 trackingOffset];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollectionWithPreferredContentSizeCategory:");
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _[a1 transform];
}

id objc_msgSend_uiColor(void *a1, const char *a2, ...)
{
  return _[a1 uiColor];
}

id objc_msgSend_uiColorDimmed(void *a1, const char *a2, ...)
{
  return _[a1 uiColorDimmed];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_updateBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 updateBackgroundColor];
}

id objc_msgSend_updateColors(void *a1, const char *a2, ...)
{
  return _[a1 updateColors];
}

id objc_msgSend_updateTrackingInfo(void *a1, const char *a2, ...)
{
  return _[a1 updateTrackingInfo];
}

id objc_msgSend_updateVisibleTimeRangeToFullDuration(void *a1, const char *a2, ...)
{
  return _[a1 updateVisibleTimeRangeToFullDuration];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _[a1 url];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_valueWithCGPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGPoint:");
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithPointer:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewWithTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewWithTag:");
}

id objc_msgSend_visibleBounds(void *a1, const char *a2, ...)
{
  return _[a1 visibleBounds];
}

id objc_msgSend_visibleTimeRange(void *a1, const char *a2, ...)
{
  return _[a1 visibleTimeRange];
}

id objc_msgSend_visualAmplitudeHeight(void *a1, const char *a2, ...)
{
  return _[a1 visualAmplitudeHeight];
}

id objc_msgSend_waitForFinalCalc(void *a1, const char *a2, ...)
{
  return _[a1 waitForFinalCalc];
}

id objc_msgSend_waitUntilFinished(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilFinished];
}

id objc_msgSend_waveformAmpSlicesForRendering(void *a1, const char *a2, ...)
{
  return _[a1 waveformAmpSlicesForRendering];
}

id objc_msgSend_waveformCompactBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 waveformCompactBackgroundColor];
}

id objc_msgSend_waveformCompactHighlightedBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 waveformCompactHighlightedBackgroundColor];
}

id objc_msgSend_waveformDataSource(void *a1, const char *a2, ...)
{
  return _[a1 waveformDataSource];
}

id objc_msgSend_waveformDataSourceRequiresUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformDataSourceRequiresUpdate:");
}

id objc_msgSend_waveformGenerator(void *a1, const char *a2, ...)
{
  return _[a1 waveformGenerator];
}

id objc_msgSend_waveformGeneratorDidFinishLoading_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformGeneratorDidFinishLoading:error:");
}

id objc_msgSend_waveformGeneratorWillBeginLoading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformGeneratorWillBeginLoading:");
}

id objc_msgSend_waveformHorizontalSpacing(void *a1, const char *a2, ...)
{
  return _[a1 waveformHorizontalSpacing];
}

id objc_msgSend_waveformLayer(void *a1, const char *a2, ...)
{
  return _[a1 waveformLayer];
}

id objc_msgSend_waveformPlaybackBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformPlaybackBackgroundColor:");
}

id objc_msgSend_waveformPlaybackHighlightedBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformPlaybackHighlightedBackgroundColor:");
}

id objc_msgSend_waveformRecordingColor(void *a1, const char *a2, ...)
{
  return _[a1 waveformRecordingColor];
}

id objc_msgSend_waveformRectForLayoutBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformRectForLayoutBounds:");
}

id objc_msgSend_waveformRenderer_contentWidthDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformRenderer:contentWidthDidChange:");
}

id objc_msgSend_waveformSegmentsIntersectingTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformSegmentsIntersectingTimeRange:");
}

id objc_msgSend_waveformSelectionOverlay_didFinishTrackingSelectionBeginTime_endTime_assetCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformSelectionOverlay:didFinishTrackingSelectionBeginTime:endTime:assetCurrentTime:");
}

id objc_msgSend_waveformSelectionOverlay_offsetForTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformSelectionOverlay:offsetForTime:");
}

id objc_msgSend_waveformSelectionOverlay_timeForOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformSelectionOverlay:timeForOffset:");
}

id objc_msgSend_waveformSelectionOverlay_willBeginTrackingSelectionBeginTime_endTime_assetCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformSelectionOverlay:willBeginTrackingSelectionBeginTime:endTime:assetCurrentTime:");
}

id objc_msgSend_waveformSelectionOverlay_willChangeAssetCurrentTime_isTracking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformSelectionOverlay:willChangeAssetCurrentTime:isTracking:");
}

id objc_msgSend_waveformSelectionOverlay_willChangeSelectedTimeRange_isTrackingMin_isTrackingMax_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformSelectionOverlay:willChangeSelectedTimeRange:isTrackingMin:isTrackingMax:");
}

id objc_msgSend_waveformSelectionOverlayGetCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformSelectionOverlayGetCurrentTime:");
}

id objc_msgSend_waveformSelectionOverlayNeedsExplicitAnimations(void *a1, const char *a2, ...)
{
  return _[a1 waveformSelectionOverlayNeedsExplicitAnimations];
}

id objc_msgSend_waveformSliceIndexes(void *a1, const char *a2, ...)
{
  return _[a1 waveformSliceIndexes];
}

id objc_msgSend_waveformSlices(void *a1, const char *a2, ...)
{
  return _[a1 waveformSlices];
}

id objc_msgSend_waveformStandardColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformStandardColor:");
}

id objc_msgSend_waveformViewController(void *a1, const char *a2, ...)
{
  return _[a1 waveformViewController];
}

id objc_msgSend_waveformViewController_didChangeToSelectedTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformViewController:didChangeToSelectedTimeRange:");
}

id objc_msgSend_waveformViewController_didScrubToTime_finished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformViewController:didScrubToTime:finished:");
}

id objc_msgSend_waveformViewControllerDidEndEditingSelectedTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformViewControllerDidEndEditingSelectedTimeRange:");
}

id objc_msgSend_waveformViewControllerWillBeginEditingSelectedTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformViewControllerWillBeginEditingSelectedTimeRange:");
}

id objc_msgSend_waveformWaveVerticalPadding(void *a1, const char *a2, ...)
{
  return _[a1 waveformWaveVerticalPadding];
}

id objc_msgSend_waveformWaveWidth(void *a1, const char *a2, ...)
{
  return _[a1 waveformWaveWidth];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_weakRefWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakRefWithObject:");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:atomically:");
}