void sub_3E1C(id a1)
{
  uint64_t vars8;

  qword_158C0 = objc_alloc_init(AXTouchAccommodationsUIServer);

  _objc_release_x1();
}

void sub_4008(uint64_t a1)
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v2 = *(void **)(a1 + 32);
    sub_4084(@"TOUCH-ACCOMMODATIONS-SUSPENEDED-DUE-TO-VOICEOVER-ON");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 _showBannerWithText:v3 andSubtitleText:0];
  }
}

id sub_4084(void *a1)
{
  id v1 = a1;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:v1 value:v1 table:@"Localizable"];

  return v3;
}

void sub_41B8(uint64_t a1)
{
  if (_UIAccessibilityZoomTouchEnabled())
  {
    v2 = *(void **)(a1 + 32);
    sub_4084(@"TOUCH-ACCOMMODATIONS-ZOOM-CONTROLLER-ENABLED");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 _showBannerWithText:v3 andSubtitleText:0];
  }
}

void sub_4800(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  sub_4084(@"TOUCH-ACCOMMODATIONS-SUSPENEDED-DUE-TO-VOICEOVER-ON");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _showBannerWithText:v2 andSubtitleText:0];
}

void sub_4860(id a1)
{
  id v1 = +[AXSettings sharedInstance];
  [v1 setZoomShouldShowSlug:1];
}

void sub_48AC(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  sub_4084(@"TOUCH-ACCOMMODATIONS-ZOOM-CONTROLLER-ENABLED");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _showBannerWithText:v2 andSubtitleText:0];
}

void sub_490C(id a1)
{
  id v1 = +[AXSettings sharedInstance];
  [v1 setZoomShouldShowSlug:0];
}

void sub_4AD0(id a1, BOOL a2)
{
  BOOL v2 = a2;
  id v3 = AXLogTouchAccommodations();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Showing Scene View Controller for Touch Accommodations", v5, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_A3CC(v4);
  }
}

void sub_4BE8(id a1, BOOL a2)
{
  BOOL v2 = a2;
  id v3 = AXLogTouchAccommodations();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Hiding Scene View Controller for Touch Accommodations", v5, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_A410(v4);
  }
}

void sub_4EC0(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2 == 0x7FFFFFFFFFFFFFFFLL) {
    [v3 setTouchAccommodationsEnabled:0];
  }
  else {
    [v3 setTouchAccommodationsUsageConfirmed:1];
  }
  id v4 = [*(id *)(a1 + 40) usageConfirmationTimeoutTimer];
  [v4 cancel];
}

void sub_4F34(id a1)
{
  id v1 = +[AXSpringBoardServer server];
  [v1 hideAlert];
}

void sub_4FE8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 9))
  {
    id v3 = [*(id *)(v1 + 48) parentViewController];

    if (!v3)
    {
      id v4 = +[AXUIDisplayManager sharedDisplayManager];
      objc_msgSend(v4, "addContentViewController:withUserInteractionEnabled:forService:", *(void *)(*(void *)(a1 + 32) + 48), 0);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
  }
}

void sub_50D4(uint64_t a1)
{
  BOOL v2 = *(unsigned char **)(a1 + 32);
  if (v2[9] && !v2[10])
  {
    id v3 = [v2 viewController];
    [v3 removeAllHandTouchMarkers];

    id v4 = [*(id *)(*(void *)(a1 + 32) + 48) parentViewController];

    if (v4)
    {
      v5 = +[AXUIDisplayManager sharedDisplayManager];
      objc_msgSend(v5, "removeContentViewController:withUserInteractionEnabled:forService:", *(void *)(*(void *)(a1 + 32) + 48), 0);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  }
}

void sub_5448(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) viewController];
  BOOL v2 = [*(id *)(a1 + 32) _getPointsArrayFromPathInfoArray:*(void *)(a1 + 40)];
  [v3 updateLocationOfHandTouchMarkerAtPoints:v2];
}

void sub_5544(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) viewController];
  BOOL v2 = [*(id *)(a1 + 32) _getPointsArrayFromPathInfoArray:*(void *)(a1 + 40)];
  [v3 resetProgressTrackOfHandTouchMarkerAtPoints:v2];
}

void sub_561C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  sub_4084(@"HOLD_DURATION_TRIPLE_CLICK_HELP_FORMAT");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v2 = sub_4084(@"HOLD-DURATION-HELP-SUBTITLE");
  id v3 = +[AXSettings sharedInstance];
  [v3 touchAccommodationsHoldDuration];
  *(float *)&double v4 = v4;
  v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v2, *(float *)&v4);
  [v1 _showBannerWithText:v6 andSubtitleText:v5];
}

void sub_68A4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40)) {
    return;
  }
  BOOL v2 = +[AXSettings sharedInstance];
  id v3 = [v2 touchAccommodationsTapActivationMethod];

  if (!v3) {
    return;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v44 = a1;
  double v4 = [*(id *)(*(void *)(a1 + 32) + 8) sublayers];
  id v5 = [v4 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v5) {
    goto LABEL_30;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v47;
  uint64_t v45 = kCAFilterPlusD;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v47 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      v10 = +[AXSettings sharedInstance];
      [v10 touchAccommodationsTapActivationTimeout];
      double v12 = v11;

      if (v12 <= 0.289999992)
      {
        v19 = [v9 name];
        unsigned int v20 = [v19 isEqualToString:@"shapeLayerDisc"];

        if (v20
          || ([v9 name],
              v21 = objc_claimAutoreleasedReturnValue(),
              unsigned int v22 = [v21 isEqualToString:@"shapeLayerDot"],
              v21,
              v22))
        {
          id v23 = +[UIColor clearColor];
          objc_msgSend(v9, "setFillColor:", objc_msgSend(v23, "CGColor"));
          goto LABEL_27;
        }
        v25 = [v9 name];
        unsigned int v26 = [v25 isEqualToString:@"shapeLayerEmptyTrack"];

        if (v26
          || ([v9 name],
              v27 = objc_claimAutoreleasedReturnValue(),
              unsigned int v28 = [v27 isEqualToString:@"holdDurationProgressTrack"],
              v27,
              v28))
        {
          v29 = +[UIColor clearColor];
          goto LABEL_26;
        }
      }
      else
      {
        v13 = +[AXSettings sharedInstance];
        [v13 touchAccommodationsHoldDuration];
        double v15 = v14;

        v16 = [v9 name];
        unsigned int v17 = [v16 isEqualToString:@"shapeLayerDisc"];

        if (v15 > 0.289999992)
        {
          if (!v17) {
            continue;
          }
          id v18 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
          objc_msgSend(v9, "setFillColor:", objc_msgSend(v18, "CGColor"));
          goto LABEL_23;
        }
        if (v17)
        {
          double v24 = 0.5;
LABEL_22:
          id v32 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:v24];
          objc_msgSend(v9, "setFillColor:", objc_msgSend(v32, "CGColor"));

          id v18 = +[CAFilter filterWithType:v45];
          [v9 setCompositingFilter:v18];
LABEL_23:

          continue;
        }
        v30 = [v9 name];
        unsigned int v31 = [v30 isEqualToString:@"shapeLayerDot"];

        if (v31)
        {
          double v24 = 0.300000012;
          goto LABEL_22;
        }
        v33 = [v9 name];
        unsigned int v34 = [v33 isEqualToString:@"shapeLayerEmptyTrack"];

        if (v34)
        {
          v29 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
LABEL_26:
          id v23 = v29;
          objc_msgSend(v9, "setStrokeColor:", objc_msgSend(v23, "CGColor"));
LABEL_27:

          [v9 setCompositingFilter:0];
          continue;
        }
      }
    }
    id v6 = [v4 countByEnumeratingWithState:&v46 objects:v50 count:16];
  }
  while (v6);
LABEL_30:

  v35 = +[AXSettings sharedInstance];
  [v35 touchAccommodationsTapActivationTimeout];
  double v37 = v36;

  v38 = *(void **)(v44 + 32);
  if (v37 <= 0.289999992)
  {
    v39 = +[UIColor clearColor];
    v41 = v38;
    v42 = v39;
    uint64_t v40 = 0;
  }
  else
  {
    v39 = +[UIColor whiteColor];
    uint64_t v40 = kCAFilterNormalBlendMode;
    v41 = v38;
    v42 = v39;
  }
  v43 = [v41 _createProgressLayerWithColor:v42 withFilterName:v40 forHoldDuration:0];

  [v43 setName:@"tapAssistanceProgressTrack"];
  [*(id *)(*(void *)(v44 + 32) + 8) addSublayer:v43];
}

void sub_72DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_7308(uint64_t a1)
{
  BOOL v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_73C4;
  v3[3] = &unk_10538;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void sub_73C4(uint64_t a1)
{
  BOOL v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 touchAccommodationsIgnoreRepeatEnabled];

  if ((v3 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _setTimerState:0];

    id v5 = *(void **)(*(void *)(a1 + 32) + 32);
    [v5 cancel];
  }
}

id sub_7458(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 3001)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = [WeakRetained _handleEvent:v3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_7A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_7ABC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _endHoldDurationAndAllowTapAssistance:1];
}

void sub_7BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_7C18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setTimerState:4];
}

void sub_7D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_7D6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setTimerState:0];
}

id sub_7FB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processTimerEventsFromCurrentState];
}

void sub_82C4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v7 = [v3 copy];
    id v4 = [v7 handInfo];
    [v4 setEventType:1];

    [v7 resetInitialTouchCountValueForHidStreamIdentifier:TouchAccommodationsHIDEventTapIdentifier];
    [v7 setIsGeneratedEvent:1];
    [*(id *)(a1 + 40) _sendHIDEventUnconditionally:v7 shouldUseOriginalTime:1];
    +[NSThread sleepForTimeInterval:0.05];
  }
  else
  {
    [v3 setIsGeneratedEvent:1];
    uint64_t v6 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    [v5 _sendHIDEventUnconditionally:v6 shouldUseOriginalTime:1];
  }
}

id sub_8454(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) initialTouchEvent];

  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 initialTouchEvent];
    [v3 _sendHIDEventUnconditionally:v4 shouldUseOriginalTime:0];

    +[NSThread sleepForTimeInterval:0.05];
    id v5 = [*(id *)(*(void *)(a1 + 32) + 160) handInfo];
    [v5 setEventType:6];

    [*(id *)(*(void *)(a1 + 32) + 160) setIsGeneratedEvent:1];
    [*(id *)(*(void *)(a1 + 32) + 160) setWillUpdateMask:0];
    [*(id *)(*(void *)(a1 + 32) + 160) setDidUpdateMask:0];
    [*(id *)(a1 + 32) _sendHIDEventUnconditionally:*(void *)(*(void *)(a1 + 32) + 160) shouldUseOriginalTime:0];
  }
  uint64_t v6 = *(void **)(a1 + 32);

  return [v6 setInitialTouchEvent:0];
}

id sub_85F0(uint64_t a1)
{
  int v2 = *(id **)(a1 + 32);
  if (v2[19])
  {
    id v3 = [v2[19] handInfo];
    [v3 setEventType:1];

    [*(id *)(*(void *)(a1 + 32) + 152) setIsGeneratedEvent:1];
    [*(id *)(a1 + 32) _sendHIDEventUnconditionally:*(void *)(*(void *)(a1 + 32) + 152) shouldUseOriginalTime:0];
    +[NSThread sleepForTimeInterval:0.05];
    id v4 = [*(id *)(*(void *)(a1 + 32) + 152) handInfo];
    [v4 setEventType:6];

    [*(id *)(*(void *)(a1 + 32) + 152) setIsGeneratedEvent:1];
    [*(id *)(*(void *)(a1 + 32) + 152) setWillUpdateMask:0];
    [*(id *)(*(void *)(a1 + 32) + 152) setDidUpdateMask:0];
    [*(id *)(a1 + 32) _sendHIDEventUnconditionally:*(void *)(*(void *)(a1 + 32) + 152) shouldUseOriginalTime:0];
    int v2 = *(id **)(a1 + 32);
  }

  return [v2 setFinalTouchEvent:0];
}

void sub_94D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

uint64_t sub_94FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_950C(uint64_t a1)
{
}

uint64_t sub_9514(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 120) copy];

  return _objc_release_x1();
}

id sub_9614(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) removeAllObjects];
}

void sub_9C20(uint64_t a1)
{
  uint64_t v1 = (os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  if ([*(id *)&(*v1)[12]._os_unfair_lock_opaque count])
  {
    int v2 = AXLogTouchAccommodations();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_A668(v1, 48, v2);
    }

    [*(id *)&(*v1)[12]._os_unfair_lock_opaque removeAllObjects];
  }
  os_unfair_lock_unlock(*v1 + 14);
}

id sub_9CBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEvent:*(void *)(a1 + 40)];
}

id sub_9CC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTouchAccommodationsBasedOnTapActivation];
}

id sub_9CCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTouchAccommodationsBasedOnTapActivation];
}

id sub_9CD4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setInitialTouchEvent:v2];

  id v3 = *(void **)(a1 + 32);

  return [v3 setCanBeginIgnoreRepeatTimer:1];
}

id sub_9D28(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setTimerState:1];
}

void sub_9D34(id *a1)
{
  [a1[4] _setTimerState:2];
  if ([a1[5] touchAccommodationsTapActivationMethod] == (char *)&dword_0 + 2)
  {
    id v5 = [a1[6] handInfo];
    uint64_t v2 = [v5 paths];
    id v3 = a1[4];
    id v4 = (void *)v3[14];
    v3[14] = v2;
  }
}

id sub_9DCC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) touchAccommodationsIgnoreRepeatEnabled])
  {
    if (([*(id *)(a1 + 32) touchAccommodationsHoldDurationEnabled] & 1) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 40);
      if (v2[8] != 3 && *(_DWORD *)(a1 + 48) != 10 && [v2 canBeginIgnoreRepeatTimer]) {
        [*(id *)(a1 + 40) _setTimerState:3];
      }
    }
  }
  id v3 = *(void **)(a1 + 40);

  return [v3 setCanBeginIgnoreRepeatTimer:0];
}

void sub_9E54(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _shouldAllowBypassForSwipeGestures])
  {
    unsigned int v2 = [*(id *)(a1 + 32) _bypassForSwipeGestureDueToEvent:*(void *)(a1 + 40)];
    id v3 = AXLogTouchAccommodations();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
    if (v2)
    {
      if (v4) {
        sub_A720(a1 + 40, v3, v5, v6, v7, v8, v9, v10);
      }
    }
    else
    {
      if (v4) {
        sub_A790(a1, v3, v5, v6, v7, v8, v9, v10);
      }

      uint64_t v11 = *(void *)(a1 + 32);
      double v12 = *(NSObject **)(v11 + 128);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_9F68;
      v13[3] = &unk_104E8;
      v13[4] = v11;
      id v14 = *(id *)(a1 + 40);
      dispatch_sync(v12, v13);
    }
  }
}

id sub_9F68(uint64_t a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 120);
  if (!v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 120);
    *(void *)(v4 + 120) = v3;

    unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 120);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

void sub_A0F0(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)(*(void *)(a1 + 32) + 88) > 3.0)
  {
    uint64_t v3 = +[AXUserEventTimer sharedInstance];
    [v3 userEventOccurred];

    *(double *)(*(void *)(a1 + 32) + 88) = Current;
  }
}

void sub_A3B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_A3CC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to show Scene View Controller for Touch Accommodations", v1, 2u);
}

void sub_A410(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to hide Scene View Controller for Touch Accommodations", v1, 2u);
}

void sub_A454(NSObject *a1)
{
  unsigned int v2 = +[NSThread callStackSymbols];
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_0, a1, OS_LOG_TYPE_DEBUG, "Ending hold duration %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_A4F4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unexpected state for ending hold duration: %ld", (uint8_t *)&v3, 0xCu);
}

void sub_A570(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Now bypassing hold duration", v1, 2u);
}

void sub_A5B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A624(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Clearing events to replay for swipe gesture bypass", v1, 2u);
}

void sub_A668(void *a1, uint64_t a2, NSObject *a3)
{
  id v6 = [*(id *)(*a1 + a2) count];
  uint64_t v7 = *(void *)(*a1 + a2);
  int v8 = 134218242;
  id v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "HID has been quiesced for 30 seconds but there are still %lu generations anticipating update! This is a bug somewhere in the system! generations: %{public}@", (uint8_t *)&v8, 0x16u);
}

void sub_A720(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A790(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t AXDenormalizePoint()
{
  return _AXDenormalizePoint();
}

uint64_t AXDeviceGetMainScreenBounds()
{
  return _AXDeviceGetMainScreenBounds();
}

uint64_t AXDeviceHasJindo()
{
  return _AXDeviceHasJindo();
}

uint64_t AXLocStringKeyForHomeButtonAndExclusiveModel()
{
  return _AXLocStringKeyForHomeButtonAndExclusiveModel();
}

uint64_t AXLogTouchAccommodations()
{
  return _AXLogTouchAccommodations();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXPerformBlockOnMainThread()
{
  return _AXPerformBlockOnMainThread();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return _AXPerformBlockOnMainThreadAfterDelay();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIAccessibilityZoomTouchEnabled()
{
  return __UIAccessibilityZoomTouchEnabled();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return [a1 CGPointValue];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend__clearEventsToReplayForSwipeGestureBypass(void *a1, const char *a2, ...)
{
  return [a1 _clearEventsToReplayForSwipeGestureBypass];
}

id objc_msgSend__disableTouchAccommodations(void *a1, const char *a2, ...)
{
  return [a1 _disableTouchAccommodations];
}

id objc_msgSend__enableTouchAccommodations(void *a1, const char *a2, ...)
{
  return [a1 _enableTouchAccommodations];
}

id objc_msgSend__handleTapActivationMethodActivateOnRelease(void *a1, const char *a2, ...)
{
  return [a1 _handleTapActivationMethodActivateOnRelease];
}

id objc_msgSend__handleTapActivationMethodActivateOnTouch(void *a1, const char *a2, ...)
{
  return [a1 _handleTapActivationMethodActivateOnTouch];
}

id objc_msgSend__handleTimerEvents(void *a1, const char *a2, ...)
{
  return [a1 _handleTimerEvents];
}

id objc_msgSend__handleUsageConfirmation(void *a1, const char *a2, ...)
{
  return [a1 _handleUsageConfirmation];
}

id objc_msgSend__initiateHoldDurationTimer(void *a1, const char *a2, ...)
{
  return [a1 _initiateHoldDurationTimer];
}

id objc_msgSend__initiateTapTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 _initiateTapTimeoutTimer];
}

id objc_msgSend__minimumDistanceForSwipeGestureBypass(void *a1, const char *a2, ...)
{
  return [a1 _minimumDistanceForSwipeGestureBypass];
}

id objc_msgSend__notifyUserEventOccurred(void *a1, const char *a2, ...)
{
  return [a1 _notifyUserEventOccurred];
}

id objc_msgSend__shouldAllowBypassForSwipeGestures(void *a1, const char *a2, ...)
{
  return [a1 _shouldAllowBypassForSwipeGestures];
}

id objc_msgSend__updateTouchAccommodationsBasedOnTapActivation(void *a1, const char *a2, ...)
{
  return [a1 _updateTouchAccommodationsBasedOnTapActivation];
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeInterfaceOrientation];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_canBeginIgnoreRepeatTimer(void *a1, const char *a2, ...)
{
  return [a1 canBeginIgnoreRepeatTimer];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_discoverabilitySignal(void *a1, const char *a2, ...)
{
  return [a1 discoverabilitySignal];
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return [a1 event];
}

id objc_msgSend_eventProcessor(void *a1, const char *a2, ...)
{
  return [a1 eventProcessor];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_finalTouchEvent(void *a1, const char *a2, ...)
{
  return [a1 finalTouchEvent];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_generationCount(void *a1, const char *a2, ...)
{
  return [a1 generationCount];
}

id objc_msgSend_handEventMask(void *a1, const char *a2, ...)
{
  return [a1 handEventMask];
}

id objc_msgSend_handInfo(void *a1, const char *a2, ...)
{
  return [a1 handInfo];
}

id objc_msgSend_hideAlert(void *a1, const char *a2, ...)
{
  return [a1 hideAlert];
}

id objc_msgSend_holdDurationTripleClickHelpAlertIdentifier(void *a1, const char *a2, ...)
{
  return [a1 holdDurationTripleClickHelpAlertIdentifier];
}

id objc_msgSend_initialTouchEvent(void *a1, const char *a2, ...)
{
  return [a1 initialTouchEvent];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isUpdate(void *a1, const char *a2, ...)
{
  return [a1 isUpdate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_pathIndex(void *a1, const char *a2, ...)
{
  return [a1 pathIndex];
}

id objc_msgSend_pathLocation(void *a1, const char *a2, ...)
{
  return [a1 pathLocation];
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return [a1 paths];
}

id objc_msgSend_preventBackgroundViewController(void *a1, const char *a2, ...)
{
  return [a1 preventBackgroundViewController];
}

id objc_msgSend_removeAllHandTouchMarkers(void *a1, const char *a2, ...)
{
  return [a1 removeAllHandTouchMarkers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_senderID(void *a1, const char *a2, ...)
{
  return [a1 senderID];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDisplayManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shouldSendFakeTouchDownIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 shouldSendFakeTouchDownIfNeeded];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return [a1 sublayers];
}

id objc_msgSend_touchAccommodationsAllowsSwipeGesturesToBypass(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsAllowsSwipeGesturesToBypass];
}

id objc_msgSend_touchAccommodationsAreConfigured(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsAreConfigured];
}

id objc_msgSend_touchAccommodationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsEnabled];
}

id objc_msgSend_touchAccommodationsHoldDuration(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsHoldDuration];
}

id objc_msgSend_touchAccommodationsHoldDurationEnabled(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsHoldDurationEnabled];
}

id objc_msgSend_touchAccommodationsIgnoreRepeatDuration(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsIgnoreRepeatDuration];
}

id objc_msgSend_touchAccommodationsIgnoreRepeatEnabled(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsIgnoreRepeatEnabled];
}

id objc_msgSend_touchAccommodationsSwipeGestureMinimumDistance(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsSwipeGestureMinimumDistance];
}

id objc_msgSend_touchAccommodationsTapActivationMethod(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsTapActivationMethod];
}

id objc_msgSend_touchAccommodationsTapActivationTimeout(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsTapActivationTimeout];
}

id objc_msgSend_touchAccommodationsUsageConfirmed(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsUsageConfirmed];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_usageConfirmationTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 usageConfirmationTimeoutTimer];
}

id objc_msgSend_userEventOccurred(void *a1, const char *a2, ...)
{
  return [a1 userEventOccurred];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return [a1 viewController];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_willBeUpdated(void *a1, const char *a2, ...)
{
  return [a1 willBeUpdated];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_zoomShouldShowSlug(void *a1, const char *a2, ...)
{
  return [a1 zoomShouldShowSlug];
}