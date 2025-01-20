void sub_100002888(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int8x16_t v7;
  uint64_t v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t v15;
  long long v16;
  int8x16_t v17;

  [*(id *)(a1 + 32) setStartGestureTimer:0];
  v2 = +[NSDate date];
  [*(id *)(a1 + 32) setGestureStartTime:v2];

  v3 = [*(id *)(a1 + 40) fingerController];
  v4 = objc_msgSend(*(id *)(a1 + 40), "_fingerModelsForFingerControllerPoint:numberOfFingers:", *(void *)(a1 + 64), *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(v3, "showFingerModels:animated:startPointForAnimation:", v4, 0, CGPointZero.x, CGPointZero.y);

  v5 = [*(id *)(a1 + 40) fingerController];
  [v5 pressFingersDownAnimated:0];

  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000029F0;
  v13 = &unk_1000246A0;
  v6 = *(id *)(a1 + 32);
  v7 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
  v16 = *(_OWORD *)(a1 + 48);
  v17 = v7;
  v8 = *(void *)(a1 + 40);
  v14 = v6;
  v15 = v8;
  v9 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:&v10 block:0.00833333333];
  objc_msgSend(*(id *)(a1 + 32), "setGestureUpdateTimer:", v9, v10, v11, v12, v13);
}

void sub_1000029F0(uint64_t a1)
{
  v2 = +[NSDate date];
  v3 = [*(id *)(a1 + 32) gestureStartTime];
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;

  double v6 = *(double *)(a1 + 48);
  double v7 = *(double *)(a1 + 56);
  double v8 = v5 * 50.0;
  switch(*(void *)(a1 + 64))
  {
    case 0:
      double v6 = v6 - v8;
      break;
    case 1:
      double v6 = v8 + v6;
      break;
    case 2:
      double v7 = v7 - v8;
      break;
    case 3:
      double v7 = v8 + v7;
      break;
    default:
      break;
  }
  +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:](AXPIFingerUtilities, "defaultLocationsForNumberOfFingers:aroundPoint:", *(void *)(a1 + 72), v6, v7, v8);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        CGPoint v14 = CGPointFromString((NSString *)*(void *)(*((void *)&v22 + 1) + 8 * (void)v13));
        v15 = [*(id *)(a1 + 40) view];
        [v15 bounds];
        BOOL v16 = CGRectContainsPoint(v27, v14);

        if (!v16)
        {
          v18 = FKALogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Gesture went out of bounds, so ending early.", buf, 2u);
          }

          [*(id *)(a1 + 40) _cleanUpExistingIncrementalGesture];
          goto LABEL_18;
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v17 = [*(id *)(a1 + 40) fingerController];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100002CA4;
  v19[3] = &unk_100024678;
  id v20 = v9;
  [v17 enumerateFingersUsingBlock:v19];

LABEL_18:
}

void sub_100002CA4(uint64_t a1, void *a2, uint64_t a3)
{
  double v4 = *(void **)(a1 + 32);
  id v5 = a2;
  double v7 = [v4 objectAtIndexedSubscript:a3];
  CGPoint v6 = CGPointFromString(v7);
  objc_msgSend(v5, "setLocation:", v6.x, v6.y);
}

void sub_10000328C(uint64_t a1)
{
  [*(id *)(a1 + 32) setStartGestureTimer:0];
  v2 = +[NSDate date];
  [*(id *)(a1 + 32) setGestureStartTime:v2];

  v3 = [*(id *)(a1 + 40) view];
  [v3 bounds];
  double v8 = +[AXPIFingerUtilities defaultPinchLocationsAroundPoint:withinBounds:](AXPIFingerUtilities, "defaultPinchLocationsAroundPoint:withinBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), v4, v5, v6, v7);

  id v9 = [*(id *)(a1 + 40) fingerController];
  id v10 = +[AXPIFingerUtilities fingerModelsForPointStrings:v8];
  objc_msgSend(v9, "showFingerModels:animated:startPointForAnimation:", v10, 0, CGPointZero.x, CGPointZero.y);

  id v11 = [*(id *)(a1 + 40) fingerController];
  [v11 pressFingersDownAnimated:0];

  uint64_t v12 = [*(id *)(a1 + 40) fingerController];
  v13 = [v12 fingerModels];
  CGPoint v14 = [v13 objectAtIndexedSubscript:0];
  [v14 location];
  uint64_t v16 = v15;
  uint64_t v18 = v17;

  v19 = [*(id *)(a1 + 40) fingerController];
  id v20 = [v19 fingerModels];
  v21 = [v20 objectAtIndexedSubscript:1];
  [v21 location];
  uint64_t v23 = v22;
  uint64_t v25 = v24;

  v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  v31 = sub_1000034EC;
  v32 = &unk_1000246C8;
  id v26 = *(id *)(a1 + 32);
  long long v35 = *(_OWORD *)(a1 + 64);
  uint64_t v36 = v16;
  uint64_t v37 = v18;
  uint64_t v38 = v23;
  uint64_t v39 = v25;
  uint64_t v27 = *(void *)(a1 + 40);
  id v33 = v26;
  uint64_t v34 = v27;
  v28 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:&v29 block:0.00833333333];
  objc_msgSend(*(id *)(a1 + 32), "setGestureUpdateTimer:", v28, v29, v30, v31, v32);
}

void sub_1000034EC(uint64_t a1)
{
  v2 = +[NSDate date];
  v3 = [*(id *)(a1 + 32) gestureStartTime];
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;

  double v6 = v5 * *(double *)(a1 + 48);
  double v7 = v5 * *(double *)(a1 + 56) * 0.392699082;
  long long v8 = *(_OWORD *)(a1 + 64);
  long long v19 = *(_OWORD *)(a1 + 80);
  long long v20 = v8;
  +[AXPIFingerUtilities updateFirstLocation:&v20 secondLocation:&v19 forPinchWithRadiusDelta:v6 angleDelta:v7];
  id v9 = [*(id *)(a1 + 40) fingerController];
  [v9 beginUpdates];

  long long v10 = v20;
  id v11 = [*(id *)(a1 + 40) fingerController];
  uint64_t v12 = [v11 fingerModels];
  v13 = [v12 objectAtIndexedSubscript:0];
  [v13 setLocation:v10];

  long long v14 = v19;
  uint64_t v15 = [*(id *)(a1 + 40) fingerController];
  uint64_t v16 = [v15 fingerModels];
  uint64_t v17 = [v16 objectAtIndexedSubscript:1];
  [v17 setLocation:v14];

  uint64_t v18 = [*(id *)(a1 + 40) fingerController];
  [v18 endUpdates];
}

void sub_1000038D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = +[NSDate date];
  double v5 = [*(id *)(a1 + 32) gestureStartTime];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 <= AXForceTouchDuration)
  {
    id v9 = [*(id *)(a1 + 40) fingerController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003A20;
    v11[3] = &unk_1000246E8;
    uint64_t v10 = *(void *)(a1 + 48);
    *(double *)&v11[4] = v7;
    v11[5] = v10;
    [v9 enumerateFingersUsingBlock:v11];
  }
  else
  {
    long long v8 = FKALogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Finished increasing force. Leaving fingers pressed, but performing no other updates.", buf, 2u);
    }

    [v3 invalidate];
  }
}

id sub_100003A20(uint64_t a1, void *a2)
{
  return [a2 setForce:*(double *)(a1 + 32) * *(double *)(a1 + 40) / AXForceTouchDuration];
}

void sub_100004104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10000412C(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _handleEventRepresentation:v3];

  return v5;
}

uint64_t sub_100004180()
{
  return AXPerformBlockAsynchronouslyOnMainThread();
}

void sub_100004350(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) _keyboardEventForEventRepresentation:*(void *)(a1 + 40)];
  if (v8)
  {
    v2 = [*(id *)(a1 + 32) delegate];
    [v2 eventTap:*(void *)(a1 + 32) handleKeyboardEvent:v8];

    if (([v8 isDownEvent] & 1) == 0)
    {
      id v3 = [*(id *)(a1 + 32) keyCodesRequiringRepostForUpEvent];
      double v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 keyCode]);
      unsigned int v5 = [v3 containsObject:v4];

      if (v5)
      {
        double v6 = [*(id *)(a1 + 32) keyCodesRequiringRepostForUpEvent];
        double v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 keyCode]);
        [v6 removeObject:v7];

        [*(id *)(a1 + 32) _repostEventRepresentation:*(void *)(a1 + 40)];
      }
    }
  }
}

id sub_100004B74(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForContinuityStateChange];
}

uint64_t start(int a1, char **a2)
{
  unsigned int v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  double v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  double v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = UIApplicationMain(a1, a2, v6, v8);

  return v9;
}

void sub_100008590(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  [v5 actionManager:*(void *)(a1 + 32) displaySysdiagnoseStatus:v4];
}

void sub_100009F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009F28(id a1)
{
  qword_10002DBA8 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);

  _objc_release_x1();
}

id sub_100009F64(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100009FE8;
  v2[3] = &unk_100024828;
  int v3 = *(_DWORD *)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  return +[UIScreen _enumerateScreensWithBlock:v2];
}

void sub_100009FE8(uint64_t a1, void *a2, unsigned char *a3)
{
  id v13 = a2;
  id v5 = [v13 displayIdentity];
  unsigned int v6 = [v5 displayID];
  int v7 = *(_DWORD *)(a1 + 40);

  if (v6 == v7)
  {
    [v13 _referenceBounds];
    id v8 = *(void **)(*(void *)(a1 + 32) + 8);
    v8[4] = v9;
    v8[5] = v10;
    v8[6] = v11;
    v8[7] = v12;
    *a3 = 1;
  }
}

id sub_10000A528(uint64_t a1)
{
  [*(id *)(a1 + 32) didMoveToParentViewController:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 40);

  return [v2 updateRequiresNativeFocus];
}

void sub_10000A568(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

uint64_t sub_10000A5B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000A73C(uint64_t a1)
{
  [*(id *)(a1 + 32) willMoveToParentViewController:0];
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  int v3 = *(void **)(a1 + 40);

  return [v3 updateRequiresNativeFocus];
}

void sub_10000A79C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

uint64_t sub_10000A7E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000AA28(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  int v3 = *(void **)(a1 + 32);

  return [v3 updateRequiresNativeFocus];
}

id sub_10000AB54(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  int v3 = *(void **)(a1 + 32);

  return [v3 updateRequiresNativeFocus];
}

id sub_10000AC64(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  int v3 = *(void **)(a1 + 32);

  return [v3 updateRequiresNativeFocus];
}

BOOL sub_10000ADF4(id a1, UIViewController *a2, unint64_t a3, BOOL *a4)
{
  return [(UIViewController *)a2 requiresNativeFocus];
}

void sub_10000B0AC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 didReleaseNativeFocus];
}

void sub_10000B184(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) view];
  id v1 = [v3 window];
  uint64_t v2 = [v1 windowScene];
  [v2 _accessibilitySetFocusEnabledInApplication:1];
}

void sub_10000B260(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) view];
  id v1 = [v3 window];
  uint64_t v2 = [v1 windowScene];
  [v2 _accessibilitySceneDidBecomeFocused];
}

void sub_10000B790(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 typeaheadViewController:*(void *)(a1 + 32) didChangeQueryString:*(void *)(a1 + 40)];
}

void sub_10000BAC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000BAE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCachedTypeaheadString:0];
}

void sub_10000E32C(uint64_t a1)
{
  id v2 = +[NSMutableArray array];
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v3 = +[AXElement systemWideElement];
  id v4 = [v3 systemApplication];
  id v5 = [v4 currentApplications];

  id obj = v5;
  id v27 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(obj);
        }
        int v7 = [*(id *)(*((void *)&v36 + 1) + 8 * i) focusContainersForCurrentSceneIdentifier:0];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v8 = [*(id *)(a1 + 32) view];
        uint64_t v9 = [v8 window];
        uint64_t v10 = [v9 screen];
        uint64_t v11 = [v10 displayIdentity];
        uint64_t v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v11 displayID]);
        id v13 = [v7 objectForKey:v12];

        id v14 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v33;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v33 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) elementsForAttribute:95246 parameter:*(void *)(a1 + 40)];
              [v2 addObjectsFromArray:v18];
            }
            id v15 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
          }
          while (v15);
        }
      }
      id v27 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v27);
  }

  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = v2;
  id v20 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (k = 0; k != v21; k = (char *)k + 1)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * (void)k) setTypeaheadQueryString:*(void *)(a1 + 40)];
      }
      id v21 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v21);
  }

  id v24 = v19;
  AXPerformBlockOnMainThread();
}

void sub_10000E6B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) typeaheadNamesViewController];
  [v2 setItems:v1];
}

void sub_10000E700(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) typeaheadNamesViewController];
  [v1 setItems:&__NSArray0__struct];
}

void sub_10000FB68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_10000FBAC(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 commandMap];

  [WeakRetained _didUpdateAvailableCommandsWithUpdatedMap:v4];
}

void sub_10000FC20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didUpdateFocusRingTimeout];
}

void sub_10000FC60(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didUpdateFocusRingTimeout];
}

id sub_10000FCA0(uint64_t a1, void *a2)
{
  return [a2 _didUpdateHardwareKeyboardAttachedStatus];
}

void sub_100010F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010F44(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateTypeaheadNamesViewControllerItemsForQueryString:*(void *)(a1 + 32)];

  id v5 = objc_loadWeakRetained(v2);
  id v4 = [v5 actionManager];
  [v4 moveFocusWithHeading:256 queryString:*(void *)(a1 + 32)];
}

void sub_100011120(id a1, FKASceneDelegate *a2)
{
  uint64_t v2 = [(FKASceneDelegate *)a2 nonInteractiveWindow];
  id v5 = [v2 rootViewController];

  id v3 = [v5 typeaheadNamesViewController];

  if (!v3)
  {
    id v4 = objc_opt_new();
    [v5 setTypeaheadNamesViewController:v4];
    [v5 showChildViewController:v4 animated:0];
  }
}

void sub_1000111CC(id a1, FKASceneDelegate *a2)
{
  uint64_t v2 = [(FKASceneDelegate *)a2 nonInteractiveWindow];
  id v5 = [v2 rootViewController];

  id v3 = [v5 typeaheadNamesViewController];

  if (v3)
  {
    id v4 = [v5 typeaheadNamesViewController];
    [v5 dismissChildViewController:v4 animated:0];

    [v5 setTypeaheadNamesViewController:0];
  }
}

void sub_100011364(uint64_t a1, void *a2)
{
  id v3 = [a2 nonInteractiveWindow];
  id v4 = [v3 rootViewController];

  [v4 updateTypeaheadNamesForQueryString:*(void *)(a1 + 32)];
}

id sub_100011DF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 delegate];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v5 = [*(id *)(a1 + 32) _sceneVendedByOneness:v3];

      if ((v5 & 1) == 0)
      {
        unsigned int v6 = [v3 delegate];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  unsigned int v6 = 0;
LABEL_7:

  return v6;
}

uint64_t sub_100011F60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000133B8(uint64_t a1)
{
  [*(id *)(a1 + 32) setShouldIgnoreNextScreenChange:1];
  uint64_t v2 = [*(id *)(a1 + 32) rootViewController];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100013458;
  v3[3] = &unk_100024778;
  long long v4 = *(_OWORD *)(a1 + 32);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

void sub_100013458(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) elementActionManager];
  [v2 performAction:*(void *)(a1 + 40)];
}

void sub_1000134AC(uint64_t a1)
{
  [*(id *)(a1 + 32) setShouldIgnoreNextScreenChange:1];
  id v2 = [*(id *)(a1 + 32) rootViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

uint64_t sub_1000145D8()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_10001460C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Tried to repost unexpected keyboard event: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100014684(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Expected keyboard event in _keyboardEventForEventRepresentation:", v1, 2u);
}

void sub_1000146C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected type for connected scene: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100014740(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected orientation: %i", (uint8_t *)v2, 8u);
}

void sub_1000147B8(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Got unexpected application orientation %i", (uint8_t *)v2, 8u);
}

void sub_100014830(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Gesture attempted, but no visible point or center point AND frame was empty: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000148A8(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Expected exactly two subviews per list item.", v1, 2u);
}

void sub_1000148EC(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unexpected number of cell views: %lu", (uint8_t *)&v2, 0xCu);
}

void sub_100014964(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Unexpectedly had no identifier for transient commands, but was in gesture mode.", v1, 2u);
}

void sub_1000149A8(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Unhandled notification received: %i. Data: %@", (uint8_t *)v3, 0x12u);
}

uint64_t AXDeviceIsPad()
{
  return _AXDeviceIsPad();
}

uint64_t AXForceTouchThreshold()
{
  return _AXForceTouchThreshold();
}

uint64_t AXIsInternalInstall()
{
  return _AXIsInternalInstall();
}

uint64_t AXLogCommon()
{
  return _AXLogCommon();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXPerformBlockOnMainThread()
{
  return _AXPerformBlockOnMainThread();
}

uint64_t AXPerformSafeBlock()
{
  return _AXPerformSafeBlock();
}

uint64_t AXUIAutomationHandleKeyComplete()
{
  return _AXUIAutomationHandleKeyComplete();
}

uint64_t AX_CGRectGetCenter()
{
  return _AX_CGRectGetCenter();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

uint64_t FKALogCommon()
{
  return _FKALogCommon();
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return _GSEventIsHardwareKeyboardAttached();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return _NSStringFromCGPoint(point);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXFeatureSupportsNonSightedUsage()
{
  return __AXFeatureSupportsNonSightedUsage();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return __AXSFullKeyboardAccessEnabled();
}

uint64_t _AXSFullKeyboardAccessFocusRingEnabled()
{
  return __AXSFullKeyboardAccessFocusRingEnabled();
}

uint64_t _AXSFullKeyboardAccessSetFocusRingEnabled()
{
  return __AXSFullKeyboardAccessSetFocusRingEnabled();
}

uint64_t _AXSFullKeyboardAccessSetPassthroughModeEnabled()
{
  return __AXSFullKeyboardAccessSetPassthroughModeEnabled();
}

uint64_t _AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation()
{
  return __AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation();
}

uint64_t _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason()
{
  return __AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
}

uint64_t _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason()
{
  return __AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAXStringForVariables()
{
  return ___UIAXStringForVariables();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double exp2(long double __x)
{
  return _exp2(__x);
}

pid_t getpid(void)
{
  return _getpid();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return [a1 _FBSScene];
}

id objc_msgSend__accessibilitySceneDidBecomeFocused(void *a1, const char *a2, ...)
{
  return [a1 _accessibilitySceneDidBecomeFocused];
}

id objc_msgSend__addTransientCommandsForGesturesMode(void *a1, const char *a2, ...)
{
  return [a1 _addTransientCommandsForGesturesMode];
}

id objc_msgSend__canPerform3DTouchCommand(void *a1, const char *a2, ...)
{
  return [a1 _canPerform3DTouchCommand];
}

id objc_msgSend__cancelFocusRingTimeout(void *a1, const char *a2, ...)
{
  return [a1 _cancelFocusRingTimeout];
}

id objc_msgSend__cancelGestureIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _cancelGestureIfNecessary];
}

id objc_msgSend__cleanUpExistingIncrementalGesture(void *a1, const char *a2, ...)
{
  return [a1 _cleanUpExistingIncrementalGesture];
}

id objc_msgSend__didUpdateFocusRingTimeout(void *a1, const char *a2, ...)
{
  return [a1 _didUpdateFocusRingTimeout];
}

id objc_msgSend__disableFocusRing(void *a1, const char *a2, ...)
{
  return [a1 _disableFocusRing];
}

id objc_msgSend__enableFocusRingIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _enableFocusRingIfNecessary];
}

id objc_msgSend__enableFocusRingWithTimeout(void *a1, const char *a2, ...)
{
  return [a1 _enableFocusRingWithTimeout];
}

id objc_msgSend__fkaDelegateScenes(void *a1, const char *a2, ...)
{
  return [a1 _fkaDelegateScenes];
}

id objc_msgSend__hideTypeaheadNames(void *a1, const char *a2, ...)
{
  return [a1 _hideTypeaheadNames];
}

id objc_msgSend__hideTypeaheadSynchronously(void *a1, const char *a2, ...)
{
  return [a1 _hideTypeaheadSynchronously];
}

id objc_msgSend__keyChordForExitingTextMode(void *a1, const char *a2, ...)
{
  return [a1 _keyChordForExitingTextMode];
}

id objc_msgSend__notificationsToRegister(void *a1, const char *a2, ...)
{
  return [a1 _notificationsToRegister];
}

id objc_msgSend__notifySceneDidBecomeFocused(void *a1, const char *a2, ...)
{
  return [a1 _notifySceneDidBecomeFocused];
}

id objc_msgSend__numberOfColumns(void *a1, const char *a2, ...)
{
  return [a1 _numberOfColumns];
}

id objc_msgSend__numberOfRows(void *a1, const char *a2, ...)
{
  return [a1 _numberOfRows];
}

id objc_msgSend__pointForGestures(void *a1, const char *a2, ...)
{
  return [a1 _pointForGestures];
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return [a1 _referenceBounds];
}

id objc_msgSend__resetCellViewsForCurrentSelectableFrame(void *a1, const char *a2, ...)
{
  return [a1 _resetCellViewsForCurrentSelectableFrame];
}

id objc_msgSend__resetFocusRingTimeout(void *a1, const char *a2, ...)
{
  return [a1 _resetFocusRingTimeout];
}

id objc_msgSend__sceneDelegateForFocusedElement(void *a1, const char *a2, ...)
{
  return [a1 _sceneDelegateForFocusedElement];
}

id objc_msgSend__sceneDelegates(void *a1, const char *a2, ...)
{
  return [a1 _sceneDelegates];
}

id objc_msgSend__selectableFrame(void *a1, const char *a2, ...)
{
  return [a1 _selectableFrame];
}

id objc_msgSend__showTypeaheadNames(void *a1, const char *a2, ...)
{
  return [a1 _showTypeaheadNames];
}

id objc_msgSend__updateForContinuityStateChange(void *a1, const char *a2, ...)
{
  return [a1 _updateForContinuityStateChange];
}

id objc_msgSend__updateTypeaheadNamesViewControllerItems(void *a1, const char *a2, ...)
{
  return [a1 _updateTypeaheadNamesViewControllerItems];
}

id objc_msgSend__wakeDeviceIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _wakeDeviceIfNeeded];
}

id objc_msgSend__xIncrement(void *a1, const char *a2, ...)
{
  return [a1 _xIncrement];
}

id objc_msgSend__yIncrement(void *a1, const char *a2, ...)
{
  return [a1 _yIncrement];
}

id objc_msgSend_accelerometer(void *a1, const char *a2, ...)
{
  return [a1 accelerometer];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_actionManager(void *a1, const char *a2, ...)
{
  return [a1 actionManager];
}

id objc_msgSend_activateHomeButton(void *a1, const char *a2, ...)
{
  return [a1 activateHomeButton];
}

id objc_msgSend_activateLockButton(void *a1, const char *a2, ...)
{
  return [a1 activateLockButton];
}

id objc_msgSend_activateSOSMode(void *a1, const char *a2, ...)
{
  return [a1 activateSOSMode];
}

id objc_msgSend_activateSiri(void *a1, const char *a2, ...)
{
  return [a1 activateSiri];
}

id objc_msgSend_activateTripleClick(void *a1, const char *a2, ...)
{
  return [a1 activateTripleClick];
}

id objc_msgSend_activeApplicationOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeApplicationOrientation];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_armApplePay(void *a1, const char *a2, ...)
{
  return [a1 armApplePay];
}

id objc_msgSend_arrangedSubviews(void *a1, const char *a2, ...)
{
  return [a1 arrangedSubviews];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backupUnmodifiedInput(void *a1, const char *a2, ...)
{
  return [a1 backupUnmodifiedInput];
}

id objc_msgSend_bannerPresenter(void *a1, const char *a2, ...)
{
  return [a1 bannerPresenter];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginUpdates];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cachedKeyCommands(void *a1, const char *a2, ...)
{
  return [a1 cachedKeyCommands];
}

id objc_msgSend_cachedTypeaheadString(void *a1, const char *a2, ...)
{
  return [a1 cachedTypeaheadString];
}

id objc_msgSend_cancelGesture(void *a1, const char *a2, ...)
{
  return [a1 cancelGesture];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_categories(void *a1, const char *a2, ...)
{
  return [a1 categories];
}

id objc_msgSend_cellViews(void *a1, const char *a2, ...)
{
  return [a1 cellViews];
}

id objc_msgSend_centerPoint(void *a1, const char *a2, ...)
{
  return [a1 centerPoint];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return [a1 cleanup];
}

id objc_msgSend_clearCachedTypeaheadStringTimer(void *a1, const char *a2, ...)
{
  return [a1 clearCachedTypeaheadStringTimer];
}

id objc_msgSend_commandMap(void *a1, const char *a2, ...)
{
  return [a1 commandMap];
}

id objc_msgSend_commands(void *a1, const char *a2, ...)
{
  return [a1 commands];
}

id objc_msgSend_commandsViewController(void *a1, const char *a2, ...)
{
  return [a1 commandsViewController];
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return [a1 connectedScenes];
}

id objc_msgSend_containsModifier(void *a1, const char *a2, ...)
{
  return [a1 containsModifier];
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

id objc_msgSend_currentApplication(void *a1, const char *a2, ...)
{
  return [a1 currentApplication];
}

id objc_msgSend_currentApplications(void *a1, const char *a2, ...)
{
  return [a1 currentApplications];
}

id objc_msgSend_currentDeviceOrientation(void *a1, const char *a2, ...)
{
  return [a1 currentDeviceOrientation];
}

id objc_msgSend_currentElement(void *a1, const char *a2, ...)
{
  return [a1 currentElement];
}

id objc_msgSend_currentFocusElement(void *a1, const char *a2, ...)
{
  return [a1 currentFocusElement];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugBannerPresenter(void *a1, const char *a2, ...)
{
  return [a1 debugBannerPresenter];
}

id objc_msgSend_decreaseXPrecision(void *a1, const char *a2, ...)
{
  return [a1 decreaseXPrecision];
}

id objc_msgSend_decreaseYPrecision(void *a1, const char *a2, ...)
{
  return [a1 decreaseYPrecision];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didObserveScreenChange(void *a1, const char *a2, ...)
{
  return [a1 didObserveScreenChange];
}

id objc_msgSend_didPerformTextInput(void *a1, const char *a2, ...)
{
  return [a1 didPerformTextInput];
}

id objc_msgSend_didReleaseNativeFocus(void *a1, const char *a2, ...)
{
  return [a1 didReleaseNativeFocus];
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return [a1 direction];
}

id objc_msgSend_dismissBuddyIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 dismissBuddyIfNecessary];
}

id objc_msgSend_dismissFloatingView(void *a1, const char *a2, ...)
{
  return [a1 dismissFloatingView];
}

id objc_msgSend_displayConfiguration(void *a1, const char *a2, ...)
{
  return [a1 displayConfiguration];
}

id objc_msgSend_displayID(void *a1, const char *a2, ...)
{
  return [a1 displayID];
}

id objc_msgSend_displayIdentity(void *a1, const char *a2, ...)
{
  return [a1 displayIdentity];
}

id objc_msgSend_drillIn(void *a1, const char *a2, ...)
{
  return [a1 drillIn];
}

id objc_msgSend_drillOut(void *a1, const char *a2, ...)
{
  return [a1 drillOut];
}

id objc_msgSend_element(void *a1, const char *a2, ...)
{
  return [a1 element];
}

id objc_msgSend_elementActionManager(void *a1, const char *a2, ...)
{
  return [a1 elementActionManager];
}

id objc_msgSend_elementForRemoteFocusSystem(void *a1, const char *a2, ...)
{
  return [a1 elementForRemoteFocusSystem];
}

id objc_msgSend_elementNamesView(void *a1, const char *a2, ...)
{
  return [a1 elementNamesView];
}

id objc_msgSend_endIncrementalGesture(void *a1, const char *a2, ...)
{
  return [a1 endIncrementalGesture];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return [a1 endUpdates];
}

id objc_msgSend_eventManager(void *a1, const char *a2, ...)
{
  return [a1 eventManager];
}

id objc_msgSend_eventRepresentation(void *a1, const char *a2, ...)
{
  return [a1 eventRepresentation];
}

id objc_msgSend_eventTap(void *a1, const char *a2, ...)
{
  return [a1 eventTap];
}

id objc_msgSend_fingerContainerView(void *a1, const char *a2, ...)
{
  return [a1 fingerContainerView];
}

id objc_msgSend_fingerController(void *a1, const char *a2, ...)
{
  return [a1 fingerController];
}

id objc_msgSend_fingerModels(void *a1, const char *a2, ...)
{
  return [a1 fingerModels];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fixedCoordinateSpace(void *a1, const char *a2, ...)
{
  return [a1 fixedCoordinateSpace];
}

id objc_msgSend_fkaSpeakableDisplayValue(void *a1, const char *a2, ...)
{
  return [a1 fkaSpeakableDisplayValue];
}

id objc_msgSend_focusManager(void *a1, const char *a2, ...)
{
  return [a1 focusManager];
}

id objc_msgSend_focusOnSceneForTypeahead(void *a1, const char *a2, ...)
{
  return [a1 focusOnSceneForTypeahead];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_footerText(void *a1, const char *a2, ...)
{
  return [a1 footerText];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fullKeyboardAccessFocusRingTimeout(void *a1, const char *a2, ...)
{
  return [a1 fullKeyboardAccessFocusRingTimeout];
}

id objc_msgSend_fullKeyboardAccessFocusRingTimeoutEnabled(void *a1, const char *a2, ...)
{
  return [a1 fullKeyboardAccessFocusRingTimeoutEnabled];
}

id objc_msgSend_fullKeyboardAccessShouldShowDebugKeyCommandsView(void *a1, const char *a2, ...)
{
  return [a1 fullKeyboardAccessShouldShowDebugKeyCommandsView];
}

id objc_msgSend_fullKeyboardAccessShouldShowTextEditingModeInstructions(void *a1, const char *a2, ...)
{
  return [a1 fullKeyboardAccessShouldShowTextEditingModeInstructions];
}

id objc_msgSend_gestureStartTime(void *a1, const char *a2, ...)
{
  return [a1 gestureStartTime];
}

id objc_msgSend_gestureUpdateTimer(void *a1, const char *a2, ...)
{
  return [a1 gestureUpdateTimer];
}

id objc_msgSend_gestureViewController(void *a1, const char *a2, ...)
{
  return [a1 gestureViewController];
}

id objc_msgSend_gesturesModeKeyChordsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 gesturesModeKeyChordsIdentifier];
}

id objc_msgSend_gsModifierState(void *a1, const char *a2, ...)
{
  return [a1 gsModifierState];
}

id objc_msgSend_hardwareIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hardwareIdentifier];
}

id objc_msgSend_hasRemoteFocusSystem(void *a1, const char *a2, ...)
{
  return [a1 hasRemoteFocusSystem];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_horizontalLineView(void *a1, const char *a2, ...)
{
  return [a1 horizontalLineView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_increaseXPrecision(void *a1, const char *a2, ...)
{
  return [a1 increaseXPrecision];
}

id objc_msgSend_increaseYPrecision(void *a1, const char *a2, ...)
{
  return [a1 increaseYPrecision];
}

id objc_msgSend_incrementalGestureState(void *a1, const char *a2, ...)
{
  return [a1 incrementalGestureState];
}

id objc_msgSend_indexPath(void *a1, const char *a2, ...)
{
  return [a1 indexPath];
}

id objc_msgSend_indexPathByRemovingLastIndex(void *a1, const char *a2, ...)
{
  return [a1 indexPathByRemovingLastIndex];
}

id objc_msgSend_interactiveWindow(void *a1, const char *a2, ...)
{
  return [a1 interactiveWindow];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isArrowKeyChord(void *a1, const char *a2, ...)
{
  return [a1 isArrowKeyChord];
}

id objc_msgSend_isComboBox(void *a1, const char *a2, ...)
{
  return [a1 isComboBox];
}

id objc_msgSend_isContinuitySessionActive(void *a1, const char *a2, ...)
{
  return [a1 isContinuitySessionActive];
}

id objc_msgSend_isDownEvent(void *a1, const char *a2, ...)
{
  return [a1 isDownEvent];
}

id objc_msgSend_isGesturesModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isGesturesModeEnabled];
}

id objc_msgSend_isInTextEditingMode(void *a1, const char *a2, ...)
{
  return [a1 isInTextEditingMode];
}

id objc_msgSend_isOverridingNativeFocus(void *a1, const char *a2, ...)
{
  return [a1 isOverridingNativeFocus];
}

id objc_msgSend_isPassthroughModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isPassthroughModeEnabled];
}

id objc_msgSend_isPerformingGesture(void *a1, const char *a2, ...)
{
  return [a1 isPerformingGesture];
}

id objc_msgSend_isPinchOrRotate(void *a1, const char *a2, ...)
{
  return [a1 isPinchOrRotate];
}

id objc_msgSend_isPressed(void *a1, const char *a2, ...)
{
  return [a1 isPressed];
}

id objc_msgSend_isShowingTextEditingModeInstructions(void *a1, const char *a2, ...)
{
  return [a1 isShowingTextEditingModeInstructions];
}

id objc_msgSend_isSwipe(void *a1, const char *a2, ...)
{
  return [a1 isSwipe];
}

id objc_msgSend_isSystemSleeping(void *a1, const char *a2, ...)
{
  return [a1 isSystemSleeping];
}

id objc_msgSend_isTextInputChord(void *a1, const char *a2, ...)
{
  return [a1 isTextInputChord];
}

id objc_msgSend_isTextInputTabChord(void *a1, const char *a2, ...)
{
  return [a1 isTextInputTabChord];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_keyChord(void *a1, const char *a2, ...)
{
  return [a1 keyChord];
}

id objc_msgSend_keyCode(void *a1, const char *a2, ...)
{
  return [a1 keyCode];
}

id objc_msgSend_keyCodesRequiringRepostForUpEvent(void *a1, const char *a2, ...)
{
  return [a1 keyCodesRequiringRepostForUpEvent];
}

id objc_msgSend_keyCodesToBackupUnicodeCharacters(void *a1, const char *a2, ...)
{
  return [a1 keyCodesToBackupUnicodeCharacters];
}

id objc_msgSend_keyCodesToDownEventRepresentations(void *a1, const char *a2, ...)
{
  return [a1 keyCodesToDownEventRepresentations];
}

id objc_msgSend_keyCodesToUnicodeCharacters(void *a1, const char *a2, ...)
{
  return [a1 keyCodesToUnicodeCharacters];
}

id objc_msgSend_keyDescription(void *a1, const char *a2, ...)
{
  return [a1 keyDescription];
}

id objc_msgSend_keyDown(void *a1, const char *a2, ...)
{
  return [a1 keyDown];
}

id objc_msgSend_keyInfo(void *a1, const char *a2, ...)
{
  return [a1 keyInfo];
}

id objc_msgSend_keys(void *a1, const char *a2, ...)
{
  return [a1 keys];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastWakeDeviceDate(void *a1, const char *a2, ...)
{
  return [a1 lastWakeDeviceDate];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lift(void *a1, const char *a2, ...)
{
  return [a1 lift];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_modifierMask(void *a1, const char *a2, ...)
{
  return [a1 modifierMask];
}

id objc_msgSend_modifierState(void *a1, const char *a2, ...)
{
  return [a1 modifierState];
}

id objc_msgSend_moveDown(void *a1, const char *a2, ...)
{
  return [a1 moveDown];
}

id objc_msgSend_moveLeft(void *a1, const char *a2, ...)
{
  return [a1 moveLeft];
}

id objc_msgSend_moveRight(void *a1, const char *a2, ...)
{
  return [a1 moveRight];
}

id objc_msgSend_moveSelectionDown(void *a1, const char *a2, ...)
{
  return [a1 moveSelectionDown];
}

id objc_msgSend_moveSelectionLeft(void *a1, const char *a2, ...)
{
  return [a1 moveSelectionLeft];
}

id objc_msgSend_moveSelectionRight(void *a1, const char *a2, ...)
{
  return [a1 moveSelectionRight];
}

id objc_msgSend_moveSelectionUp(void *a1, const char *a2, ...)
{
  return [a1 moveSelectionUp];
}

id objc_msgSend_moveUp(void *a1, const char *a2, ...)
{
  return [a1 moveUp];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nativeFocusElementDisplayID(void *a1, const char *a2, ...)
{
  return [a1 nativeFocusElementDisplayID];
}

id objc_msgSend_nonInteractiveWindow(void *a1, const char *a2, ...)
{
  return [a1 nonInteractiveWindow];
}

id objc_msgSend_numberOfFingers(void *a1, const char *a2, ...)
{
  return [a1 numberOfFingers];
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return [a1 perform];
}

id objc_msgSend_performDefaultAction(void *a1, const char *a2, ...)
{
  return [a1 performDefaultAction];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_platterBlurEffect(void *a1, const char *a2, ...)
{
  return [a1 platterBlurEffect];
}

id objc_msgSend_pointPickerView(void *a1, const char *a2, ...)
{
  return [a1 pointPickerView];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentationController];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_prepareForKeycodeTranslation(void *a1, const char *a2, ...)
{
  return [a1 prepareForKeycodeTranslation];
}

id objc_msgSend_presentTypeaheadView(void *a1, const char *a2, ...)
{
  return [a1 presentTypeaheadView];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_press(void *a1, const char *a2, ...)
{
  return [a1 press];
}

id objc_msgSend_queryString(void *a1, const char *a2, ...)
{
  return [a1 queryString];
}

id objc_msgSend_rebootDevice(void *a1, const char *a2, ...)
{
  return [a1 rebootDevice];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_requiresNativeFocus(void *a1, const char *a2, ...)
{
  return [a1 requiresNativeFocus];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_rotateLeft(void *a1, const char *a2, ...)
{
  return [a1 rotateLeft];
}

id objc_msgSend_rotatePortrait(void *a1, const char *a2, ...)
{
  return [a1 rotatePortrait];
}

id objc_msgSend_rotateRight(void *a1, const char *a2, ...)
{
  return [a1 rotateRight];
}

id objc_msgSend_rotateUpsideDown(void *a1, const char *a2, ...)
{
  return [a1 rotateUpsideDown];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_selectedIndex(void *a1, const char *a2, ...)
{
  return [a1 selectedIndex];
}

id objc_msgSend_selectedPoint(void *a1, const char *a2, ...)
{
  return [a1 selectedPoint];
}

id objc_msgSend_selectedScreenPoint(void *a1, const char *a2, ...)
{
  return [a1 selectedScreenPoint];
}

id objc_msgSend_senderID(void *a1, const char *a2, ...)
{
  return [a1 senderID];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shouldAvoidRepostingTextInput(void *a1, const char *a2, ...)
{
  return [a1 shouldAvoidRepostingTextInput];
}

id objc_msgSend_shouldIgnoreNextScreenChange(void *a1, const char *a2, ...)
{
  return [a1 shouldIgnoreNextScreenChange];
}

id objc_msgSend_showContextMenu(void *a1, const char *a2, ...)
{
  return [a1 showContextMenu];
}

id objc_msgSend_startFingerControllerPoint(void *a1, const char *a2, ...)
{
  return [a1 startFingerControllerPoint];
}

id objc_msgSend_startGestureTimer(void *a1, const char *a2, ...)
{
  return [a1 startGestureTimer];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_systemApplication(void *a1, const char *a2, ...)
{
  return [a1 systemApplication];
}

id objc_msgSend_systemWideElement(void *a1, const char *a2, ...)
{
  return [a1 systemWideElement];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textEditingModeExitKeyChord(void *a1, const char *a2, ...)
{
  return [a1 textEditingModeExitKeyChord];
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return [a1 textField];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_toggleAppLibrary(void *a1, const char *a2, ...)
{
  return [a1 toggleAppLibrary];
}

id objc_msgSend_toggleAppSwitcher(void *a1, const char *a2, ...)
{
  return [a1 toggleAppSwitcher];
}

id objc_msgSend_toggleControlCenter(void *a1, const char *a2, ...)
{
  return [a1 toggleControlCenter];
}

id objc_msgSend_toggleDock(void *a1, const char *a2, ...)
{
  return [a1 toggleDock];
}

id objc_msgSend_toggleNotificationCenter(void *a1, const char *a2, ...)
{
  return [a1 toggleNotificationCenter];
}

id objc_msgSend_toggleQuickNote(void *a1, const char *a2, ...)
{
  return [a1 toggleQuickNote];
}

id objc_msgSend_toggleTypeaheadState(void *a1, const char *a2, ...)
{
  return [a1 toggleTypeaheadState];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_traits(void *a1, const char *a2, ...)
{
  return [a1 traits];
}

id objc_msgSend_translateKeycode(void *a1, const char *a2, ...)
{
  return [a1 translateKeycode];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typeaheadController(void *a1, const char *a2, ...)
{
  return [a1 typeaheadController];
}

id objc_msgSend_typeaheadNamesViewController(void *a1, const char *a2, ...)
{
  return [a1 typeaheadNamesViewController];
}

id objc_msgSend_typeaheadPresenter(void *a1, const char *a2, ...)
{
  return [a1 typeaheadPresenter];
}

id objc_msgSend_typeaheadStartTimer(void *a1, const char *a2, ...)
{
  return [a1 typeaheadStartTimer];
}

id objc_msgSend_typeaheadTextField(void *a1, const char *a2, ...)
{
  return [a1 typeaheadTextField];
}

id objc_msgSend_typeaheadView(void *a1, const char *a2, ...)
{
  return [a1 typeaheadView];
}

id objc_msgSend_uiElement(void *a1, const char *a2, ...)
{
  return [a1 uiElement];
}

id objc_msgSend_unicodeCharacter(void *a1, const char *a2, ...)
{
  return [a1 unicodeCharacter];
}

id objc_msgSend_unmodifiedInput(void *a1, const char *a2, ...)
{
  return [a1 unmodifiedInput];
}

id objc_msgSend_updateRequiresNativeFocus(void *a1, const char *a2, ...)
{
  return [a1 updateRequiresNativeFocus];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirection];
}

id objc_msgSend_usesScenes(void *a1, const char *a2, ...)
{
  return [a1 usesScenes];
}

id objc_msgSend_verticalLineView(void *a1, const char *a2, ...)
{
  return [a1 verticalLineView];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_visiblePoint(void *a1, const char *a2, ...)
{
  return [a1 visiblePoint];
}

id objc_msgSend_wakeUpDeviceIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 wakeUpDeviceIfNecessary];
}

id objc_msgSend_warm(void *a1, const char *a2, ...)
{
  return [a1 warm];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_willAquireNativeFocus(void *a1, const char *a2, ...)
{
  return [a1 willAquireNativeFocus];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowContextId(void *a1, const char *a2, ...)
{
  return [a1 windowContextId];
}

id objc_msgSend_windowDisplayId(void *a1, const char *a2, ...)
{
  return [a1 windowDisplayId];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}

id objc_msgSend_xPrecisionLevel(void *a1, const char *a2, ...)
{
  return [a1 xPrecisionLevel];
}

id objc_msgSend_yPrecisionLevel(void *a1, const char *a2, ...)
{
  return [a1 yPrecisionLevel];
}