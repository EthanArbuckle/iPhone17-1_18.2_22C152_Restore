void sub_1ED4(id a1)
{
  uint64_t vars8;

  qword_37A18 = objc_opt_new();

  _objc_release_x1();
}

uint64_t sub_2794(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 8) == 2;
  return result;
}

uint64_t sub_285C(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 8) == 1;
  return result;
}

uint64_t sub_2924(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 8) == 0;
  return result;
}

uint64_t sub_29EC(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = (*(_DWORD *)(*(void *)(result + 32) + 32) & 0x400) != 0;
  return result;
}

uint64_t sub_2AB0(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = (*(_DWORD *)(*(void *)(result + 32) + 32) & 0x800) != 0;
  return result;
}

uint64_t sub_2B74(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 34) & 1;
  return result;
}

uint64_t sub_2C38(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = (*(_DWORD *)(*(void *)(result + 32) + 32) & 0x20000) != 0;
  return result;
}

uint64_t sub_2CFC(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 28);
  return result;
}

void sub_34C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

uint64_t sub_34FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_350C(uint64_t a1)
{
}

void sub_3514(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "sb_hostWrapperForUseInWindow:hostRequester:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v3 = __UIAccessibilitySafeClass();

  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id sub_35A0(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [*(id *)(a1 + 32) contextHostWrappers];
  uint64_t v3 = (char *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        AXPerformSafeBlock();
      }
      uint64_t v4 = (char *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  v7 = [*(id *)(a1 + 32) hostedApplicationWindow];
  [v7 setHidden:1];

  [*(id *)(a1 + 32) setHostedApplicationWindow:0];
  return [*(id *)(a1 + 32) setContextHostWrappers:0];
}

id sub_372C(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopHosting];
}

id sub_3734(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 transform];
    uint64_t v3 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v3 = 0;
    memset(&v6, 0, sizeof(v6));
  }
  CGAffineTransformScale(&v7, &v6, *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 56));
  CGAffineTransform v5 = v7;
  return [v3 setTransform:&v5];
}

uint64_t sub_37C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_3970(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopHosting];
}

void sub_3F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_3F20(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_3F98;
  v3[3] = &unk_28710;
  long long v4 = *(_OWORD *)(a1 + 40);
  return [v1 enumerate:v3];
}

void sub_3F98(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = [a3 safeStringForKey:@"bundleIdentifier"];
  CGAffineTransform v6 = [*(id *)(a1 + 32) frontmostAppIdentifier];
  unsigned __int8 v7 = [v8 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void sub_428C(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  AXPerformBlockOnMainThreadAfterDelay();
}

id sub_431C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareTransitionToWorkspaceWithCompletionHandler:*(void *)(a1 + 40)];
}

void sub_445C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lockScreenDisableAssertion];

  if (v2)
  {
    uint64_t v3 = GAXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "GuidedAccess is trying to acquire the screen lock assertion, but we already have it!", buf, 2u);
    }
  }
  else
  {
    id v4 = +[SBUILockScreenDisableAssertion lockScreenDisableAssertionWithIdentifier:@"GuidedAccess"];
    [*(id *)(a1 + 32) setLockScreenDisableAssertion:v4];
  }
}

void sub_4598(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) systemApertureInertAssertion];

  if (v2)
  {
    uint64_t v3 = GAXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Guided Access is trying to acquire inert assertion for system aperture, but we already have it!", buf, 2u);
    }
  }
  else
  {
    id v4 = +[AXSpringBoardServer server];
    CGAffineTransform v5 = [v4 _windowsToHost];
    CGAffineTransform v6 = [v5 firstObject];
    unsigned __int8 v7 = [v6 safeValueForKey:@"windowScene"];
    id v9 = [v7 safeValueForKey:@"systemApertureController"];

    id v8 = [v9 restrictSystemApertureToInertWithReason:@"Guided Access starting"];
    [*(id *)(a1 + 32) setSystemApertureInertAssertion:v8];
  }
}

id sub_4750(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) systemApertureInertAssertion];
  [v2 invalidateWithReason:@"Guided Access ending"];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setSystemApertureInertAssertion:0];
}

void sub_4814(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) captureButtonSuppressionAssertion];

  if (v2)
  {
    uint64_t v3 = GAXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Guided Access is trying to acquire inert assertion for camera button, but we already have it!", buf, 2u);
    }
  }
  else
  {
    id v6 = +[UIApplication sharedApplication];
    id v4 = [v6 safeValueForKey:@"captureButtonRestrictionCoordinator"];
    CGAffineTransform v5 = [v4 inhibitCaptureButtonActionAssertionWithReason:@"Guided Access Starting"];
    [*(id *)(a1 + 32) setCaptureButtonSuppressionAssertion:v5];
  }
}

id sub_4984(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) captureButtonSuppressionAssertion];
  [v2 invalidate];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setCaptureButtonSuppressionAssertion:0];
}

id sub_4A40(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLockScreenDisableAssertion:0];
}

id sub_4D38(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissFloatingDockIfPresentedAnimated:1 completionHandler:0];
}

id sub_4D48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentFloatingDockIfDismissedAnimated:1 completionHandler:0];
}

void sub_4D58(uint64_t a1, void *a2)
{
  id v15 = a2;
  v14 = [v15 contentViewController];
  uint64_t v3 = [v14 safeDictionaryForKey:@"liveContentOverlays"];
  id v4 = [v3 allValues];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [*(id *)(*((void *)&v19 + 1) + 8 * i) safeValueForKey:@"deviceApplicationSceneViewController"];
        AXSafeClassFromString();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          long long v10 = [v9 safeValueForKey:@"_deviceApplicationSceneViewController"];
          long long v11 = __UIAccessibilityCastAsSafeCategory();

          v18 = [v9 safeValueForKey:@"_topAffordanceViewController"];
          id v12 = v18;
          AXPerformSafeBlock();
        }
        else
        {
          objc_opt_class();
          long long v11 = __UIAccessibilityCastAsSafeCategory();
        }
        [v11 _gaxSetShouldSuppressBottomGrabber:*(_DWORD *)(a1 + 32) == 2];
        v17 = v11;
        id v13 = v11;
        AXPerformSafeBlock();
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
}

id sub_506C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:*(_DWORD *)(a1 + 40) == 2 forReason:@"Guided Access" animated:1];
}

id sub_5090(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureStatusBarWithCurrentStyleRequest];
}

void sub_5098(uint64_t a1, void *a2)
{
  long long v20 = [a2 contentViewController];
  uint64_t v3 = [v20 safeDictionaryForKey:@"liveContentOverlays"];
  id v4 = [v3 allValues];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v25;
    CFStringRef v8 = @"deviceApplicationSceneViewController";
    CFStringRef v9 = @"SBMedusaDecoratedDeviceApplicationSceneViewController";
    do
    {
      long long v10 = 0;
      id v21 = v6;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v11 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)v10) safeValueForKey:v8];
        AXSafeClassFromString();
        if (objc_opt_isKindOfClass())
        {
          CFStringRef v12 = v9;
          CFStringRef v13 = v8;
          v14 = [v11 safeValueForKey:@"_topAffordanceViewController"];
          [v11 _topAffordanceViewController:v14 handleActionType:9 transitionSource:18];
          id v15 = [(id)AXSafeClassFromString() safeValueForKeyPath:@"localDefaults.externalDisplayDefaults"];
          if (!*(_DWORD *)(a1 + 40)
            && [*(id *)(a1 + 32) needsToUpdatePrefersMirroringForExternalDisplaysDefault])
          {
            id v16 = [v15 safeBoolForKey:@"mirroringEnabled"];
            v17 = +[AXSettings sharedInstance];
            [v17 setGuidedAccessUserPrefersMirroringForExternalDisplays:v16];

            [*(id *)(a1 + 32) setNeedsToUpdatePrefersMirroringForExternalDisplaysDefault:0];
          }
          v18 = +[AXSettings sharedInstance];
          [v18 guidedAccessUserPrefersMirroringForExternalDisplays];

          v23 = v15;
          id v19 = v15;
          AXPerformSafeBlock();
          [*(id *)(a1 + 32) setNeedsToUpdatePrefersMirroringForExternalDisplaysDefault:*(_DWORD *)(a1 + 44) == 0];

          CFStringRef v8 = v13;
          CFStringRef v9 = v12;
          id v6 = v21;
        }

        long long v10 = (char *)v10 + 1;
      }
      while (v6 != v10);
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }
}

id sub_538C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMirroringEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void sub_5500(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 40) payload];
  v2 = [v3 objectForKey:@"GAXIPCPayloadKeyFrontmostAppIdentifier"];
  [*(id *)(a1 + 32) setFrontmostAppIdentifier:v2];
}

void sub_567C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_5694(uint64_t a1)
{
  memset(v51, 0, 28);
  extractGAXBackboardStateFromMessage(*(void **)(a1 + 32), (uint64_t)v51);
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x4010000000;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  int v50 = 0;
  v46 = &unk_25C0E;
  uint64_t v47 = 0;
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(NSObject **)(v2 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5C38;
  block[3] = &unk_28870;
  block[4] = v2;
  block[5] = &v43;
  *(_OWORD *)((char *)v42 + 12) = *(_OWORD *)((char *)v51 + 12);
  v42[0] = v51[0];
  dispatch_sync(v3, block);
  int v4 = v51[0];
  unsigned int v5 = *((_DWORD *)v44 + 8);
  [*(id *)(a1 + 40) _updateSpringBoardForServerMode:LODWORD(v51[0]) previousServerMode:v5];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && AXDeviceHasSystemPasscode()
    && [*(id *)(a1 + 40) wantsSingleAppModeOrAppSelfLockMode])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  id v6 = +[AXSpringBoardServer server];
  [v6 updateLockAndIdleTimers];

  uint64_t v7 = *(void **)(a1 + 40);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [v7 _releaseLockScreenDisableAssertion];
    [*(id *)(a1 + 40) _acquireLockScreenDisableAssertion];
  }
  else
  {
    [v7 _releaseLockScreenDisableAssertion];
  }
  if (v4 != 1 && v5 == 1)
  {
    CFStringRef v8 = +[AXSpringBoardServer server];
    [v8 animateWallpaperStyleToOriginal];
LABEL_25:

    goto LABEL_26;
  }
  if (v5 == 2)
  {
    CFStringRef v9 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstance"];
    long long v10 = [v9 safeValueForKey:@"_iconModel"];
    long long v11 = [v10 safeValueForKey:@"applicationDataSource"];
    v28 = v9;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v54 = 0x3032000000;
    v55 = sub_34FC;
    v56 = sub_350C;
    id v57 = 0;
    v34 = _NSConcreteStackBlock;
    uint64_t v35 = 3221225472;
    v36 = sub_5C68;
    v37 = &unk_28898;
    p_long long buf = &buf;
    id v27 = v11;
    id v38 = v27;
    id v12 = v10;
    id v39 = v12;
    AXPerformSafeBlock();
    id v13 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v30 objects:v52 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v31;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v14);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "safeStringForKey:", @"bundleIdentifier", v27);
          id v19 = [v12 applicationIconForBundleIdentifier:v18];

          if (v19)
          {
            AXSafeClassFromString();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              long long v20 = AXLogValidations();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v19;
                _os_log_fault_impl(&dword_0, v20, OS_LOG_TYPE_FAULT, "Unexpected type for icon: %@", (uint8_t *)&buf, 0xCu);
              }
            }
          }
          id v21 = [v19 safeValueForKey:@"_notifyLaunchEnabledDidChange"];
        }
        id v15 = [v14 countByEnumeratingWithState:&v30 objects:v52 count:16];
      }
      while (v15);
    }

    long long v22 = [v28 safeValueForKeyPath:@"mainDisplayWindowScene.floatingDockController"];
    v23 = [v22 safeValueForKey:@"_viewController"];
    long long v24 = [v23 safeValueForKey:@"floatingDockViewController"];
    long long v25 = [v24 safeValueForKey:@"suggestionsViewController"];
    long long v26 = [v25 safeValueForKey:@"suggestionsIconListModel"];

    id v29 = v26;
    AXPerformSafeBlock();

    CFStringRef v8 = v28;
    goto LABEL_25;
  }
LABEL_26:
  _Block_object_dispose(&v43, 8);
}

void sub_5BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

__n128 sub_5C38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v3 = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(v2 + 44) = *(_OWORD *)(v1 + 20);
  *(_OWORD *)(v2 + 32) = v3;
  uint64_t v4 = *(void *)(a1 + 32);
  __n128 result = *(__n128 *)(a1 + 48);
  *(_OWORD *)(v4 + 20) = *(_OWORD *)(a1 + 60);
  *(__n128 *)(v4 + 8) = result;
  return result;
}

uint64_t sub_5C68(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) allApplicationsForIconModel:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

id sub_5CB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateIconsUsingBlock:&stru_288D8];
}

void sub_5CC8(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = objc_msgSend(a2, "safeValueForKey:", @"_notifyLaunchEnabledDidChange", a4);
}

void sub_6290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_62D4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_634C;
  v3[3] = &unk_28900;
  long long v4 = *(_OWORD *)(a1 + 40);
  return [v1 _prepareTransitionToWorkspaceWithCompletionHandler:v3];
}

uint64_t sub_634C(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  return result;
}

void sub_6464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 sub_647C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v3 = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(v2 + 44) = *(_OWORD *)(v1 + 20);
  *(_OWORD *)(v2 + 32) = v3;
  uint64_t v4 = *(void *)(a1 + 32);
  __n128 result = *(__n128 *)(a1 + 48);
  *(_OWORD *)(v4 + 20) = *(_OWORD *)(a1 + 60);
  *(__n128 *)(v4 + 8) = result;
  return result;
}

void sub_6620(uint64_t a1)
{
  +[NSDate timeIntervalSinceReferenceDate];
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_7148;
  v77[3] = &unk_28948;
  v77[4] = v1;
  uint64_t v2 = objc_retainBlock(v77);
  AXPerformBlockSynchronouslyOnMainThread();
  char v3 = ((uint64_t (*)(void *))v2[2])(v2);
  if (v3)
  {
    uint64_t v4 = @"Launch time expired trying to unlock device";
  }
  else
  {
    uint64_t v4 = @"Launch time expired trying to unlock device";
    while (1)
    {
      LOBYTE(v71) = 0;
      unsigned int v5 = +[AXSpringBoardServer server];
      unsigned __int8 v6 = [v5 isScreenLockedWithPasscode:&v71];

      if ((v6 & 1) == 0) {
        break;
      }
      +[NSThread sleepForTimeInterval:0.2];
      AXPerformBlockSynchronouslyOnMainThread();
      int v7 = ((uint64_t (*)(void *))v2[2])(v2);
      char v3 = v7;
      if (v7) {
        goto LABEL_8;
      }
    }
    uint64_t v4 = 0;
  }
LABEL_8:
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = sub_34FC;
  v75 = sub_350C;
  id v76 = 0;
  v66 = _NSConcreteStackBlock;
  uint64_t v67 = 3221225472;
  v68 = sub_71D4;
  v69 = &unk_28990;
  v70 = &v71;
  AXPerformBlockSynchronouslyOnMainThread();
  if ((v3 & 1) == 0)
  {
    uint64_t v4 = @"Launch time expired trying to make SB frontmost";
    while (1)
    {
      CFStringRef v8 = +[AXSpringBoardServer server];
      unsigned __int8 v9 = [v8 isSystemAppFrontmost];

      if (v9) {
        break;
      }
      if (((uint64_t (*)(void *))v2[2])(v2)) {
        goto LABEL_20;
      }
      long long v10 = GAXLogAppLaunching();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Handling app launch request; need to make SpringBoard frontmost",
          (uint8_t *)&buf,
          2u);
      }

      AXPerformBlockSynchronouslyOnMainThread();
      +[NSThread sleepForTimeInterval:0.2];
    }
    uint64_t v4 = @"Launch time expired waiting for SB to say it can launch apps";
    while (1)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v82 = 0x2020000000;
      LOBYTE(v83) = 0;
      v61 = _NSConcreteStackBlock;
      uint64_t v62 = 3221225472;
      v63 = sub_7288;
      v64 = &unk_28990;
      p_long long buf = &buf;
      AXPerformBlockSynchronouslyOnMainThread();
      if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
        break;
      }
      +[NSThread sleepForTimeInterval:0.2];
      int v11 = ((uint64_t (*)(void *))v2[2])(v2);
      _Block_object_dispose(&buf, 8);
      if (v11) {
        goto LABEL_20;
      }
    }
    _Block_object_dispose(&buf, 8);
    uint64_t v4 = 0;
  }
LABEL_20:
  uint64_t v12 = [(id)v72[5] objectForKeyedSubscript:*(void *)(a1 + 32)];
  BOOL v13 = v12 == 0;

  if (!v13) {
    +[NSThread sleepForTimeInterval:1.0];
  }
  if (!v4)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v82 = 0x3032000000;
    v83 = sub_34FC;
    v84 = sub_350C;
    id v85 = 0;
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2020000000;
    uint64_t v60 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = &v53;
    uint64_t v55 = 0x2020000000;
    uint64_t v56 = 0;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_7300;
    v48[3] = &unk_289D8;
    int v50 = &buf;
    v51 = &v57;
    v52 = &v53;
    id v49 = *(id *)(a1 + 32);
    uint64_t v14 = objc_retainBlock(v48);
    AXPerformBlockSynchronouslyOnMainThread();
    uint64_t v15 = GAXLogAppLaunching();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v78 = 0;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Trying to launch the app. Capped by the launch timer beginning roughly now...", v78, 2u);
    }

    while (1)
    {
      uint64_t v16 = GAXLogAppLaunching();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = v58[3];
        uint64_t v18 = v54[3];
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)v78 = 67109634;
        *(_DWORD *)v79 = v17;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = v18;
        *(_WORD *)v80 = 2112;
        *(void *)&v80[2] = v19;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "App visibility: %d state: %d (bundleID %@)", v78, 0x18u);
      }

      if (v58[3] != 2 || v54[3] != 2)
      {
        v45[1] = _NSConcreteStackBlock;
        v45[2] = (id)3221225472;
        v45[3] = sub_7430;
        v45[4] = &unk_28A00;
        uint64_t v47 = &buf;
        v46 = v14;
        AXPerformBlockSynchronouslyOnMainThread();
        long long v20 = GAXLogAppLaunching();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(*((void *)&buf + 1) + 40);
          uint64_t v22 = v58[3];
          uint64_t v23 = v54[3];
          *(_DWORD *)v78 = 138412802;
          *(void *)v79 = v21;
          *(_WORD *)&v79[8] = 1024;
          *(_DWORD *)v80 = v22;
          *(_WORD *)&v80[4] = 1024;
          *(_DWORD *)&v80[6] = v23;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Refreshed due to process visibility/state. App: %@ visibility: %d state: %d", v78, 0x18u);
        }
      }
      if (((uint64_t (*)(void *))v2[2])(v2))
      {
        uint64_t v4 = @"Launch time expired waiting to app to move to foreground";
        goto LABEL_52;
      }
      if (v58[3] == 2 && v54[3] == 2) {
        break;
      }
      +[NSThread sleepForTimeInterval:1.0];
      AXPerformBlockSynchronouslyOnMainThread();
      long long v24 = GAXLogAppLaunching();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = v58[3];
        uint64_t v26 = v54[3];
        *(_DWORD *)v78 = 67109376;
        *(_DWORD *)v79 = v25;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = v26;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Refreshed after quick nap. App visibility: %d state: %d", v78, 0xEu);
      }

      id v27 = [objc_alloc((Class)AXIPCMessage) initWithKey:13018 payload:0];
      v28 = [*(id *)(a1 + 40) backboardClient];
      v45[0] = 0;
      id v29 = [v28 sendMessage:v27 withError:v45];
      id v30 = v45[0];

      if (v30)
      {
        long long v31 = GAXLogCommon();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v78 = 138412290;
          *(void *)v79 = v30;
          _os_log_error_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, "Couldn't get app launch generation: %@", v78, 0xCu);
        }
      }
      long long v32 = [v29 payload];
      long long v33 = [v32 objectForKeyedSubscript:@"GAXIPCPayloadKeyAppLaunchGeneration"];

      if (v30
        || (id v34 = [v33 unsignedLongValue], v34 == objc_msgSend(*(id *)(a1 + 48), "unsignedLongValue")))
      {
        uint64_t v4 = 0;
        int v35 = 1;
      }
      else
      {
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"App launch generation changed while launching app (%lu, %lu)", [*(id *)(a1 + 48) unsignedLongValue], objc_msgSend(v33, "unsignedLongValue"));
        uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v35 = 0;
      }

      if (!v35)
      {
        if (v4) {
          goto LABEL_52;
        }
        break;
      }
      if (v4) {
        goto LABEL_52;
      }
    }
    [*(id *)(a1 + 40) _sendMessageToBackboardWithIdentifier:13003 payload:0 description:@"Get active app interface orientation" replyHandler:&stru_28A40];
    uint64_t v4 = 0;
LABEL_52:

    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&buf, 8);
  }
  id v36 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", *(void *)(a1 + 56), @"GAXIPCPayloadKeyProfileConfiguration", *(void *)(a1 + 48), @"GAXIPCPayloadKeyAppLaunchGeneration", v4, @"GAXIPCPayloadKeyErrorMessage", 0);
  v37 = GAXLogAppLaunching();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = *(void *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v38;
    _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "Guided Access did finish launching app with bundle ID: %@", (uint8_t *)&buf, 0xCu);
  }

  id v39 = +[AXReplayer replayer];
  v40 = dispatch_get_global_queue(0, 0);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_7624;
  v43[3] = &unk_28A88;
  v43[4] = *(void *)(a1 + 40);
  id v41 = v36;
  id v44 = v41;
  [v39 replayWithName:@"did finish launching application" attempts:20 interval:1 async:v40 queue:v43 replayBlock:&stru_28AC8 completion:0.2];

  _Block_object_dispose(&v71, 8);
}

void sub_70C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose((const void *)(v66 - 192), 8);
  _Block_object_dispose(&a66, 8);
  _Unwind_Resume(a1);
}

BOOL sub_7148(uint64_t a1)
{
  +[NSDate timeIntervalSinceReferenceDate];
  return v2 - *(double *)(a1 + 32) > 120.0;
}

void sub_718C(id a1)
{
  id v1 = +[AXSpringBoardServer server];
  [v1 unlockDevice];
}

void sub_71D4(uint64_t a1)
{
  id v5 = +[AXSpringBoardServerHelper sharedServerHelper];
  uint64_t v2 = [v5 medusaBundleIDsToLayoutRoles];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_7240(id a1)
{
  id v1 = +[AXSpringBoardServer server];
  [v1 quitTopApplication];
}

void sub_7288(uint64_t a1)
{
  id v3 = +[UIApplication sharedApplication];
  uint64_t v2 = [v3 safeValueForKey:@"_accessibilityShouldAllowAppLaunch"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 BOOLValue];
}

void sub_7300(void *a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (!v2 || !*(void *)(*(void *)(a1[6] + 8) + 24) || !*(void *)(*(void *)(a1[7] + 8) + 24))
  {
    id v3 = GAXLogAppLaunching();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_159E4(v3);
    }

    uint64_t v4 = +[AXSpringBoardServer server];
    uint64_t v5 = [v4 applicationWithIdentifier:a1[4]];
    uint64_t v6 = *(void *)(a1[5] + 8);
    int v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
  }
  CFStringRef v8 = [v2 safeValueForKey:@"processState"];
  unsigned __int8 v9 = [v8 safeValueForKey:@"visibility"];
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v9 unsignedIntegerValue];

  long long v10 = [v8 safeValueForKey:@"taskState"];
  *(void *)(*(void *)(a1[7] + 8) + 24) = [v10 unsignedIntegerValue];
}

uint64_t sub_7430(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = +[AXSpringBoardServerHelper sharedServerHelper];
    [v2 launchApplicationWithFullConfiguration:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

void sub_74A4(id a1, AXIPCMessage *a2, NSError *a3)
{
  id v3 = [(AXIPCMessage *)a2 payload];
  uint64_t v4 = [v3 objectForKey:@"GAXIPCPayloadKeyAppInterfaceOrientation"];
  [v4 unsignedIntegerValue];

  AXPerformBlockSynchronouslyOnMainThread();
}

uint64_t sub_7558()
{
  return AXPerformSafeBlock();
}

void sub_75C8(uint64_t a1)
{
  id v2 = +[UIDevice currentDevice];
  objc_msgSend(v2, "gax_forceSetOrientation:animated:", *(void *)(a1 + 32), 1);
}

id sub_7624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _sendReplayableSimpleMessageToBackboardWithIdentifier:13004 payload:*(void *)(a1 + 40) description:@"did finish launching application" error:a3];
}

void sub_7640(id a1, BOOL a2, id a3, NSError *a4)
{
  uint64_t v5 = a4;
  if (!a2)
  {
    uint64_t v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_15A28();
    }
  }
}

id sub_770C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRequiringWallpaper:0];
}

id sub_786C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStateOfHostedApplicationWithIdentifier:scaleFactor:center:animationDuration:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void sub_78A4(id a1)
{
  id v1 = +[AXSpringBoardServer server];
  [v1 unlockDevice];
}

void sub_803C(id a1)
{
  id v1 = +[TUCallCenter sharedInstance];
  [v1 disconnectAllCalls];
}

void sub_80A8(id a1)
{
  id v1 = +[UIApplication sharedApplication];
  id v2 = [v1 safeValueForKey:@"notificationDispatcher"];
  id v3 = [v2 safeValueForKey:@"bannerDestination"];

  uint64_t v4 = [v3 safeValueForKey:@"_presentedNotificationPresentableVC"];
  uint64_t v5 = [v4 safeValueForKey:@"notificationViewController"];
  uint64_t v6 = [v5 safeValueForKey:@"notificationRequest"];
  int v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    int v11 = GAXLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "No notification banner to dismiss.", buf, 2u);
    }
  }
  else
  {
    unsigned __int8 v9 = +[UIApplication sharedApplication];
    long long v10 = [v9 safeValueForKey:@"bannerManager"];

    *(void *)long long buf = 0;
    uint64_t v19 = buf;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    int v11 = v10;
    id v17 = v4;
    AXPerformSafeBlock();
    int v12 = v19[24];

    _Block_object_dispose(buf, 8);
    BOOL v13 = GAXLogCommon();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Dismissing notification banner.", buf, 2u);
      }

      uint64_t v16 = v3;
      AXPerformSafeBlock();
      BOOL v13 = v16;
    }
    else if (v14)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Not dismissing notification banner, as it is still queued and not yet presented.", buf, 2u);
    }
  }
  uint64_t v15 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstance"];
  [v15 _enumerateSwitcherControllersWithBlock:&stru_28BB8];
}

void sub_8398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_83B0(void *a1)
{
  id v2 = (void *)a1[4];
  id v3 = [v2 windowSceneForPresentable:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 isDisplayingBannerInWindowScene:v3];
}

id sub_8418(uint64_t a1)
{
  [*(id *)(a1 + 32) _performCancelAction];
  id v2 = *(void **)(a1 + 32);

  return [v2 _dismissPresentedBannerAnimated:0 reason:@"Guided Access" forceIfSticky:1];
}

void sub_8464(id a1, id a2, BOOL *a3)
{
  id v6 = [a2 safeValueForKey:@"_gestureManager"];
  id v3 = [v6 safeValueForKey:@"fluidDragAndDropManager"];
  uint64_t v4 = [v3 safeValueForKey:@"dropInteraction"];
  uint64_t v5 = [v4 view];
  [v5 removeInteraction:v4];
  [v5 addInteraction:v4];
}

void sub_8844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_8868(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backboardClient];
  if ([v2 verifyConnectionExists])
  {
    id v3 = [objc_alloc((Class)AXIPCMessage) initWithKey:*(unsigned int *)(a1 + 64) payload:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v4 + 40);
    unsigned __int8 v5 = [v2 sendSimpleMessage:v3 withError:&obj];
    objc_storeStrong((id *)(v4 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
  }
}

void sub_8A98(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = GAXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_15B04(a1, (uint64_t)v3, v4);
  }
}

void sub_8AFC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backboardClient];
  if ([v2 verifyConnectionExists])
  {
    id v3 = [objc_alloc((Class)AXIPCMessage) initWithKey:*(unsigned int *)(a1 + 64) payload:*(void *)(a1 + 40)];
    uint64_t v4 = *(void **)(a1 + 48);
    if (v4)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_8C30;
      v7[3] = &unk_28C30;
      id v8 = v4;
      id v9 = *(id *)(a1 + 56);
      [v2 sendAsyncMessage:v3 withReplyHandler:v7];

      id v5 = v8;
    }
    else
    {
      id v10 = 0;
      unsigned __int8 v6 = [v2 sendSimpleMessage:v3 withError:&v10];
      id v5 = v10;
      if ((v6 & 1) == 0) {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
  }
}

uint64_t sub_8C30(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v6) {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return _objc_release_x1(v4);
}

void sub_8F68(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_8F90(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t sub_9130(uint64_t a1)
{
  id v2 = +[GAXSpringboard sharedInstance];
  [v2 deviceWasUnlocked];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_9448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_9470(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

BOOL sub_95F4(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 validateClass:@"SBApplication"];
  [(AXValidationManager *)v2 validateClass:@"SBApplicationController"];
  [(AXValidationManager *)v2 validateClass:@"SBConferenceManager"];
  [(AXValidationManager *)v2 validateClass:@"SBIconController"];
  [(AXValidationManager *)v2 validateClass:@"SBUIController"];
  [(AXValidationManager *)v2 validateClass:@"SBUserNotificationAlert"];
  [(AXValidationManager *)v2 validateClass:@"SBPasscodeAlertItem"];
  [(AXValidationManager *)v2 validateClass:@"SBWorkspace"];
  [(AXValidationManager *)v2 validateClass:@"SBApplicationController", @"sharedInstance", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBIconController", @"sharedInstance", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBMediaController", @"sharedInstance", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBSceneManagerCoordinator", @"mainDisplaySceneManager", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBUIController", @"sharedInstance", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBWallpaperController", @"sharedInstance", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NSObject", @"__accessibilityGuidedAccessStateEnabled", "B", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBWorkspace", @"mainWorkspace", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBTelephonyManager", @"sharedTelephonyManager", "@", 0 hasClassMethod withFullSignature];
  -[AXValidationManager validateClass:hasInstanceMethod:withFullSignature:](v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", 0);
  [(AXValidationManager *)v2 validateClass:@"SBApplication", @"displayName", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBApplication", @"isWebApplication", "B", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBApplicationController", @"applicationWithBundleIdentifier:", "@", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBApplicationController", @"runningApplications", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBTelephonyManager", @"disconnectAllCalls", "v", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBIconController", @"model", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBIconModel", @"applicationIconForBundleIdentifier:", "@", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBLockScreenManager", @"isUILocked", "B", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBUIController", @"handleHomeButtonSinglePressUpForWindowScene:", "B", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBWallpaperController", @"requireWallpaperWithReason:", "@", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBWallpaperController", @"setWallpaperStyle:forPriority:forVariant:withAnimationFactory:", "B", "q", "q", "q", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBWallpaperController", @"removeWallpaperStyleForPriority: forVariant: withAnimationFactory:", "B", "q", "q", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"FBProcess", @"bundleIdentifier", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"FBScene", @"clientProcess", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBIcon"];
  [(AXValidationManager *)v2 validateClass:@"SBIcon", @"_notifyLaunchEnabledDidChange", "v", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBIconModel" isKindOfClass:@"SBHIconModel"];
  [(AXValidationManager *)v2 validateClass:@"SBHIconModel", @"applicationDataSource", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateProtocol:@"SBHIconModelApplicationDataSource" hasRequiredInstanceMethod:@"allApplicationsForIconModel:"];
  [(AXValidationManager *)v2 validateProtocol:@"SBHApplication" hasRequiredInstanceMethod:@"bundleIdentifier"];
  [(AXValidationManager *)v2 validateClass:@"SBHIconModel", @"applicationIconForBundleIdentifier:", "@", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBIconListModel", @"enumerateIconsUsingBlock:", "v", "@?", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBIconController", @"mainDisplayWindowScene", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBWindowScene", @"floatingDockController", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBFloatingDockController" hasInstanceVariable:@"_viewController" withType:"SBFloatingDockRootViewController"];
  [(AXValidationManager *)v2 validateClass:@"SBFloatingDockRootViewController", @"floatingDockViewController", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBFloatingDockViewController", @"suggestionsViewController", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBFloatingDockSuggestionsViewController", @"suggestionsIconListModel", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIDevice", @"setOrientation: animated:", "v", "q", "B", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBUserNotificationAlert" hasInstanceVariable:@"_soundPath" withType:"NSString"];
  [(AXValidationManager *)v2 validateClass:@"UIWindow", @"sb_hostWrapperForUseInWindow: hostRequester:", "@", "@", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBWindowSelfHostWrapper", @"hostView", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBWindowSelfHostWrapper", @"stopHosting", "v", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBMainWorkspace", @"requestTransitionWithBuilder:", "B", "@?", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBMainWorkspaceTransitionRequest", @"setSource:", "v", "q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBMainWorkspaceTransitionRequest" isKindOfClass:@"SBWorkspaceTransitionRequest"];
  [(AXValidationManager *)v2 validateClass:@"SBWorkspaceTransitionRequest", @"modifyApplicationContext:", "v", "@?", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBWorkspaceApplicationSceneTransitionContext", @"setEntity:forLayoutRole:", "v", "@", "q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBDeviceApplicationSceneEntity", @"initWithApplicationForMainDisplay:", "@", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBIdleTimerGlobalCoordinator", @"sharedInstance", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBIdleTimerGlobalCoordinator", @"resetIdleTimerForReason:", "v", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBApplication", @"processState", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBApplicationProcessState", @"visibility", "q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBApplicationProcessState", @"taskState", "q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBMainWorkspace", @"transientOverlayPresentationManager", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBTransientOverlayPresentationManager", @"hasActivePresentation", "B", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBTransientOverlayPresentationManager" hasInstanceVariable:@"_presentersByWindowScene" withType:"NSMapTable"];
  [(AXValidationManager *)v2 validateClass:@"SBTransientOverlayScenePresenter" hasInstanceVariable:@"_entities" withType:"NSMutableArray"];
  [(AXValidationManager *)v2 validateClass:@"_SBTransientOverlayPresentedEntity", @"window", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SpringBoard", @"notificationDispatcher", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBNCNotificationDispatcher", @"bannerDestination", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBNotificationBannerDestination", @"_presentedNotificationPresentableVC", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBNotificationPresentableViewController" isKindOfClass:@"NCNotificationPresentableViewController"];
  [(AXValidationManager *)v2 validateClass:@"NCNotificationPresentableViewController", @"notificationViewController", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"NCNotificationViewController", @"notificationRequest", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SpringBoard", @"bannerManager", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBBannerManager", @"isDisplayingBannerInWindowScene:", "B", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBBannerManager", @"windowSceneForPresentable:", "@", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBNotificationBannerDestination", @"_performCancelAction", "v", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBNotificationBannerDestination", @"_dismissPresentedBannerAnimated:reason:forceIfSticky:", "v", "B", "@", "B", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBMainSwitcherControllerCoordinator"];
  [(AXValidationManager *)v2 validateClass:@"SBMedusaDecoratedDeviceApplicationSceneViewController"];
  [(AXValidationManager *)v2 validateClass:@"SBMainSwitcherControllerCoordinator", @"sharedInstance", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBMainSwitcherControllerCoordinator", @"sharedInstanceIfExists", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBMainSwitcherControllerCoordinator", @"_activeDisplaySwitcherController", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBSwitcherController", @"switcherWindow", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBMainSwitcherControllerCoordinator", @"_rebuildAppListCache", "v", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBSwitcherController" hasInstanceVariable:@"_gestureManager" withType:"SBFluidSwitcherGestureManager"];
  [(AXValidationManager *)v2 validateClass:@"SBMainSwitcherControllerCoordinator", @"_enumerateSwitcherControllersWithBlock:", "v", "@?", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBSwitcherController", @"contentViewController", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBFluidSwitcherGestureManager", @"fluidDragAndDropManager", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBFluidSwitcherViewController" hasInstanceVariable:@"_liveContentOverlayCoordinator" withType:"<SBSwitcherLiveContentOverlayCoordinating>"];
  [(AXValidationManager *)v2 validateClass:@"SBFullScreenSwitcherSceneLiveContentOverlay", @"deviceApplicationSceneViewController", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBMedusaDecoratedDeviceApplicationSceneViewController" hasInstanceVariable:@"_deviceApplicationSceneViewController" withType:"SBDeviceApplicationSceneViewController"];
  [(AXValidationManager *)v2 validateClass:@"SBFluidSwitcherDragAndDropManager", @"dropInteraction", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBAppLayout", @"enumerate:", "v", "@?", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBDisplayItem", @"bundleIdentifier", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBDeviceApplicationSceneViewController", @"_configureStatusBarWithCurrentStyleRequest", "v", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBTopAffordanceViewController"];
  [(AXValidationManager *)v2 validateClass:@"SBTopAffordanceViewController", @"setHidden:forReason:animated:", "v", "B", "@", "B", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBMedusaDecoratedDeviceApplicationSceneViewController" hasInstanceVariable:@"_topAffordanceViewController" withType:"SBTopAffordanceViewController"];
  [(AXValidationManager *)v2 validateClass:@"SBMedusaDecoratedDeviceApplicationSceneViewController", @"_topAffordanceViewController:handleActionType:transitionSource:", "v", "@", "q", "q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBFloatingDockController", @"_dismissFloatingDockIfPresentedAnimated:completionHandler:", "v", "B", "@?", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBFloatingDockController", @"_presentFloatingDockIfDismissedAnimated:completionHandler:", "v", "B", "@?", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBDefaults", @"localDefaults", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBLocalDefaults", @"externalDisplayDefaults", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBExternalDisplayDefaults", @"setMirroringEnabled:", "v", "B", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"SBInCallPresentationManager", @"handleOpenApplicationRequest:clientWorkspace:actions:origin:options:withResult:", "v", "@", "@", "@", "@", "@", "@?", 0 hasInstanceMethod withFullSignature];

  return 1;
}

BOOL sub_A2AC(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"GAX Springboard Server"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"Guided Access (Springboard)"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void sub_A30C(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 installSafeCategory:@"GAXFBSSystemServiceOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXFBSOpenApplicationService" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBAlertItemOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBAlertItemsControllerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBNSObjectOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBScreenFlashOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBSyncControllerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBVoiceControlControllerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBMainWorkspaceOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBUIControllerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSpringBoardOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXUIDeviceOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBSBLockScreenOrientationManager" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBLockScreenViewControllerBaseOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBSceneManagerCoordinatorOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBReachabilityManagerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBMainSwitcherControllerCoordinatorOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBSwitcherControllerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBSBMainDisplayPolicyAggregator" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXNCNotificationRequestOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBIdleTimerGlobalStateMonitorOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBSystemGestureManagerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBCoverSheetSlidingViewControllerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBMainDisplaySystemGestureManagerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBFloatingDockControllerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBDragAndDropWorkspaceTransactionOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBFluidSwitcherGestureManagerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBAppSwitcherModelOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBAppPlatterDragPreviewOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBDeviceApplicationSceneViewControllerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBDeviceApplicationSceneHandleOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBSystemNotesInteractionManagerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBInteractiveScreenshotGestureManager" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBFullScreenSwitcherSceneLiveContentOverlayOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBExternalDisplayDefaultsOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBInCallPresentationManagerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBActivityBannerObserverOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBIconOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBLeafIconOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBBookmarkIconOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBIconViewOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXSBCommandTabControllerOverride" canInteractWithTargetClass:1];
}

void sub_A688(id a1)
{
}

void sub_A698(id a1)
{
  id v1 = +[AXValidationManager sharedInstance];
  [v1 performValidations:&stru_28D80 withPreValidationHandler:&stru_28DA0 postValidationHandler:0];
}

BOOL sub_A6F4(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 validateClass:@"CMASBBAlertItem"];
  [(AXValidationManager *)v2 validateClass:@"CKCarrierSMSAlertItem"];

  return 1;
}

BOOL sub_A73C(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"GAXServer - ChatKit"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"Guided Access"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void sub_A79C(id a1)
{
  id v1 = +[AXValidationManager sharedInstance];
  [v1 performValidations:&stru_28DE0 withPreValidationHandler:&stru_28E00 postValidationHandler:0 safeCategoryInstallationHandler:&stru_28E20];
}

BOOL sub_A800(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL sub_A808(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"GAX Springboard Server - AssistantServices"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"Guided Access (Springboard)"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void sub_A868(id a1, AXValidationManager *a2)
{
}

void sub_A87C(id a1)
{
  id v1 = +[AXValidationManager sharedInstance];
  [v1 performValidations:&stru_28E60 withPreValidationHandler:&stru_28E80 postValidationHandler:0 safeCategoryInstallationHandler:&stru_28EA0];
}

BOOL sub_A8E0(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL sub_A8E8(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"GAX Springboard Server - AssistantUI"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"Guided Access (Springboard)"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void sub_A948(id a1, AXValidationManager *a2)
{
}

void sub_AE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_AE90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_AEA0(uint64_t a1)
{
}

void sub_AEA8(uint64_t a1)
{
  id v5 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstance"];
  uint64_t v2 = [v5 applicationWithPid:*(unsigned int *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_B460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_B89C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)GAXSpringBoardOverride;
  return objc_msgSendSuper2(&v3, "batteryStatusDidChange:", v1);
}

Class sub_B9F4(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_37A38)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_BB20;
    void v3[4] = &unk_28A60;
    v3[5] = v3;
    long long v4 = off_28EE8;
    uint64_t v5 = 0;
    qword_37A38 = _sl_dlopen();
  }
  if (!qword_37A38) {
    sub_15BD8(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("PRNotifyEvents");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_15C58();
  }
  qword_37A30 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_BB20()
{
  uint64_t result = _sl_dlopen();
  qword_37A38 = result;
  return result;
}

BOOL sub_C010(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  uint64_t v5 = +[GAXSpringboard sharedInstance];
  unsigned __int8 v6 = [v5 isFrontmostAppLayout:v4];

  return v6;
}

void sub_C5D8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    objc_super v3 = GAXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_15CD4((uint64_t)v2, v3);
    }
  }
}

uint64_t sub_C7BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_CA2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_CA40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_CA54(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 payload];
  id v4 = [v3 objectForKey:@"GAXIPCPayloadKeyShouldAbortServerModeTransition"];
  unsigned __int8 v5 = [v4 BOOLValue];

  if (v5)
  {
    unsigned __int8 v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Transition was aborted by system app.", v10, 2u);
    }

    int v7 = 0;
  }
  else
  {
    int v7 = objc_alloc_init(GAXSpringboardClientStatus);
    id v8 = [v3 objectForKey:@"GAXIPCPayloadKeyFrontmostAppName"];
    [(GAXSpringboardClientStatus *)v7 setSessionApplicationName:v8];

    uint64_t v9 = [v3 objectForKey:@"GAXIPCPayloadKeyFrontmostArchivedAppIcon"];
    [(GAXSpringboardClientStatus *)v7 setArchivedSessionApplicationIcon:v9];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_D060(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    unsigned __int8 v6 = AXLogIPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_15DD4((uint64_t)v5, v6);
    }
  }
  else
  {
    int v7 = [a2 payload];
    id v8 = [v7 objectForKey:@"GAXIPCPayloadKeyNewPasscodeLength"];
    [v8 unsignedIntegerValue];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_D3B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_D3CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_F4A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHomeGrabberDisplayMode:1];
}

id sub_F4B0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 _gaxDesiredHomeGrabberDisplayMode];

  return [v1 setHomeGrabberDisplayMode:v2];
}

id GAXFallbackValueForProfileKey(void *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  if (qword_37A58 == -1)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_37A58, &stru_29458);
    if (a3)
    {
LABEL_3:
      unsigned __int8 v6 = [(id)qword_37A50 objectForKey:v5];
      if (v6) {
        goto LABEL_8;
      }
    }
  }
  int v7 = (void *)qword_37A48;
  id v8 = +[NSNumber numberWithUnsignedInt:a2];
  uint64_t v9 = [v7 objectForKey:v8];
  unsigned __int8 v6 = [v9 objectForKey:v5];

  if (!v6)
  {
    id v10 = GAXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_15E90((uint64_t)v5, v10);
    }

    unsigned __int8 v6 = 0;
  }
LABEL_8:

  return v6;
}

void sub_FE98(id a1)
{
  v52[0] = @"GAXProfileAllowsKeyboardTextInput";
  v52[1] = @"GAXProfileAllowsTouch";
  v53[0] = &__kCFBooleanTrue;
  v53[1] = &__kCFBooleanTrue;
  v52[2] = @"GAXProfileAllowsMotion";
  v52[3] = @"GAXProfileAllowsRingerSwitch";
  v53[2] = &__kCFBooleanTrue;
  v53[3] = &__kCFBooleanFalse;
  v52[4] = @"GAXProfileAllowsProximity";
  v52[5] = @"GAXProfileAllowsLockButton";
  v53[4] = &__kCFBooleanFalse;
  v53[5] = &__kCFBooleanFalse;
  v52[6] = @"GAXProfileAllowsVolumeButtons";
  v52[7] = @"GAXProfileAllowsAutolock";
  v53[6] = &__kCFBooleanFalse;
  v53[7] = &__kCFBooleanTrue;
  v52[8] = @"GAXProfileAppTimeoutDuration";
  v52[9] = @"GAXProfileAppTimeoutEnabled";
  v53[8] = &off_2E568;
  v53[9] = &__kCFBooleanFalse;
  v52[10] = @"GAXProfileAllowsAXAutoEnableVoiceOver";
  id v41 = +[NSNull null];
  v53[10] = v41;
  v52[11] = @"GAXProfileAllowsAXAutoEnableZoom";
  uint64_t v38 = +[NSNull null];
  v53[11] = v38;
  v52[12] = @"GAXProfileAllowsAXAutoEnableInvertColors";
  int v35 = +[NSNull null];
  v53[12] = v35;
  v52[13] = @"GAXProfileAllowsAXAutoEnableGrayscale";
  long long v32 = +[NSNull null];
  v53[13] = v32;
  v52[14] = @"GAXProfileAllowsAXAutoEnableAssistiveTouch";
  id v29 = +[NSNull null];
  v53[14] = v29;
  v52[15] = @"GAXProfileAllowsAXAutoEnableSpeakSelection";
  uint64_t v1 = +[NSNull null];
  v53[15] = v1;
  v52[16] = @"GAXProfileAllowsAXAutoEnableMonoAudio";
  id v2 = +[NSNull null];
  v53[16] = v2;
  v52[17] = @"GAXProfileAllowsAXAutoEnableCommandAndControl";
  objc_super v3 = +[NSNull null];
  v53[17] = v3;
  v53[18] = &__kCFBooleanFalse;
  v52[18] = @"GAXProfileAllowsAXToggleVoiceOver";
  v52[19] = @"GAXProfileAllowsAXToggleZoom";
  v53[19] = &__kCFBooleanFalse;
  v53[20] = &__kCFBooleanFalse;
  v52[20] = @"GAXProfileAllowsAXToggleInvertColors";
  v52[21] = @"GAXProfileAllowsAXToggleGrayscale";
  v53[21] = &__kCFBooleanFalse;
  v53[22] = &__kCFBooleanFalse;
  v52[22] = @"GAXProfileAllowsAXToggleAssistiveTouch";
  v52[23] = @"GAXProfileAllowsAXToggleCommandAndControl";
  v53[23] = &__kCFBooleanFalse;
  v52[24] = @"GAXProfileIgnoredTouchRegionsPortrait";
  id v4 = +[NSNull null];
  v53[24] = v4;
  v52[25] = @"GAXProfileIgnoredTouchRegionsLandscape";
  id v5 = +[NSNull null];
  v53[25] = v5;
  v52[26] = @"GAXProfileStatesForRestrictions";
  unsigned __int8 v6 = +[NSNull null];
  v53[26] = v6;
  v52[27] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  int v7 = +[NSNull null];
  v53[27] = v7;
  v53[28] = &__kCFBooleanFalse;
  v52[28] = @"GAXProfileAllowsHomeButton";
  v52[29] = @"GAXProfileShouldAutolaunchCrashedApps";
  v53[29] = &__kCFBooleanTrue;
  v53[30] = &__kCFBooleanTrue;
  v52[30] = @"GAXProfileShowsUserConfirmationPromptsAndBanners";
  v52[31] = @"GAXProfileShouldAutolaunchAppsAfterSystemCrash";
  v53[31] = &__kCFBooleanTrue;
  v53[32] = &__kCFBooleanTrue;
  v52[32] = @"GAXProfileAllowsExit";
  v52[33] = @"GAXProfileShouldAutolaunchAfterLowBatteryShutDown";
  v53[33] = &__kCFBooleanFalse;
  v53[34] = &__kCFBooleanTrue;
  v52[34] = @"GAXProfileAllowsWebTextDefine";
  v52[35] = @"GAXProfileAllowsAccessibilityShortcut";
  v53[35] = &__kCFBooleanFalse;
  uint64_t v43 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:36];

  v50[0] = @"GAXProfileAllowsKeyboardTextInput";
  v50[1] = @"GAXProfileAllowsTouch";
  v51[0] = &__kCFBooleanTrue;
  v51[1] = &__kCFBooleanTrue;
  v50[2] = @"GAXProfileAllowsMotion";
  v50[3] = @"GAXProfileAllowsRingerSwitch";
  _OWORD v51[2] = &__kCFBooleanTrue;
  v51[3] = &__kCFBooleanTrue;
  v50[4] = @"GAXProfileAllowsProximity";
  v50[5] = @"GAXProfileAllowsLockButton";
  v51[4] = &__kCFBooleanTrue;
  v51[5] = &__kCFBooleanTrue;
  v50[6] = @"GAXProfileAllowsVolumeButtons";
  v50[7] = @"GAXProfileAllowsAutolock";
  v51[6] = &__kCFBooleanTrue;
  v51[7] = &__kCFBooleanTrue;
  v50[8] = @"GAXProfileAppTimeoutDuration";
  v50[9] = @"GAXProfileAppTimeoutEnabled";
  v51[8] = &off_2E568;
  v51[9] = &__kCFBooleanFalse;
  v50[10] = @"GAXProfileAllowsAXAutoEnableVoiceOver";
  id v39 = +[NSNull null];
  v51[10] = v39;
  v50[11] = @"GAXProfileAllowsAXAutoEnableZoom";
  id v36 = +[NSNull null];
  v51[11] = v36;
  v50[12] = @"GAXProfileAllowsAXAutoEnableInvertColors";
  long long v33 = +[NSNull null];
  v51[12] = v33;
  v50[13] = @"GAXProfileAllowsAXAutoEnableGrayscale";
  id v30 = +[NSNull null];
  v51[13] = v30;
  v50[14] = @"GAXProfileAllowsAXAutoEnableAssistiveTouch";
  id v27 = +[NSNull null];
  v51[14] = v27;
  v50[15] = @"GAXProfileAllowsAXAutoEnableSpeakSelection";
  id v8 = +[NSNull null];
  v51[15] = v8;
  v50[16] = @"GAXProfileAllowsAXAutoEnableMonoAudio";
  uint64_t v9 = +[NSNull null];
  v51[16] = v9;
  v50[17] = @"GAXProfileAllowsAXAutoEnableCommandAndControl";
  id v10 = +[NSNull null];
  v51[17] = v10;
  v51[18] = &__kCFBooleanFalse;
  v50[18] = @"GAXProfileAllowsAXToggleVoiceOver";
  v50[19] = @"GAXProfileAllowsAXToggleZoom";
  v51[19] = &__kCFBooleanFalse;
  v51[20] = &__kCFBooleanFalse;
  v50[20] = @"GAXProfileAllowsAXToggleInvertColors";
  v50[21] = @"GAXProfileAllowsAXToggleGrayscale";
  v51[21] = &__kCFBooleanFalse;
  v51[22] = &__kCFBooleanFalse;
  v50[22] = @"GAXProfileAllowsAXToggleAssistiveTouch";
  v50[23] = @"GAXProfileAllowsAXToggleCommandAndControl";
  v51[23] = &__kCFBooleanFalse;
  v50[24] = @"GAXProfileIgnoredTouchRegionsPortrait";
  int v11 = +[NSNull null];
  v51[24] = v11;
  v50[25] = @"GAXProfileIgnoredTouchRegionsLandscape";
  uint64_t v12 = +[NSNull null];
  v51[25] = v12;
  v50[26] = @"GAXProfileStatesForRestrictions";
  BOOL v13 = +[NSNull null];
  v51[26] = v13;
  v50[27] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  uint64_t v14 = +[NSNull null];
  v51[27] = v14;
  v51[28] = &__kCFBooleanFalse;
  v50[28] = @"GAXProfileAllowsHomeButton";
  v50[29] = @"GAXProfileShouldAutolaunchCrashedApps";
  v51[29] = &__kCFBooleanTrue;
  v51[30] = &__kCFBooleanTrue;
  v50[30] = @"GAXProfileShowsUserConfirmationPromptsAndBanners";
  v50[31] = @"GAXProfileShouldAutolaunchAppsAfterSystemCrash";
  v51[31] = &__kCFBooleanTrue;
  v51[32] = &__kCFBooleanFalse;
  v50[32] = @"GAXProfileAllowsExit";
  v50[33] = @"GAXProfileShouldAutolaunchAfterLowBatteryShutDown";
  v51[33] = &__kCFBooleanTrue;
  v51[34] = &__kCFBooleanTrue;
  v50[34] = @"GAXProfileAllowsWebTextDefine";
  v50[35] = @"GAXProfileAllowsAccessibilityShortcut";
  v51[35] = &__kCFBooleanFalse;
  v42 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:36];

  v48[0] = @"GAXProfileAllowsKeyboardTextInput";
  v48[1] = @"GAXProfileAllowsTouch";
  v49[0] = &__kCFBooleanTrue;
  v49[1] = &__kCFBooleanTrue;
  v48[2] = @"GAXProfileAllowsMotion";
  v48[3] = @"GAXProfileAllowsRingerSwitch";
  v49[2] = &__kCFBooleanTrue;
  v49[3] = &__kCFBooleanTrue;
  void v48[4] = @"GAXProfileAllowsProximity";
  v48[5] = @"GAXProfileAllowsLockButton";
  v49[4] = &__kCFBooleanTrue;
  v49[5] = &__kCFBooleanTrue;
  v48[6] = @"GAXProfileAllowsVolumeButtons";
  v48[7] = @"GAXProfileAllowsAutolock";
  v49[6] = &__kCFBooleanTrue;
  v49[7] = &__kCFBooleanTrue;
  v48[8] = @"GAXProfileAppTimeoutDuration";
  v48[9] = @"GAXProfileAppTimeoutEnabled";
  v49[8] = &off_2E568;
  v49[9] = &__kCFBooleanFalse;
  v48[10] = @"GAXProfileAllowsAXAutoEnableVoiceOver";
  v40 = +[NSNull null];
  v49[10] = v40;
  v48[11] = @"GAXProfileAllowsAXAutoEnableZoom";
  v37 = +[NSNull null];
  v49[11] = v37;
  v48[12] = @"GAXProfileAllowsAXAutoEnableInvertColors";
  id v34 = +[NSNull null];
  v49[12] = v34;
  v48[13] = @"GAXProfileAllowsAXAutoEnableGrayscale";
  long long v31 = +[NSNull null];
  v49[13] = v31;
  v48[14] = @"GAXProfileAllowsAXAutoEnableAssistiveTouch";
  v28 = +[NSNull null];
  v49[14] = v28;
  v48[15] = @"GAXProfileAllowsAXAutoEnableSpeakSelection";
  uint64_t v15 = +[NSNull null];
  v49[15] = v15;
  v48[16] = @"GAXProfileAllowsAXAutoEnableMonoAudio";
  uint64_t v16 = +[NSNull null];
  v49[16] = v16;
  v48[17] = @"GAXProfileAllowsAXAutoEnableCommandAndControl";
  id v17 = +[NSNull null];
  v49[17] = v17;
  v49[18] = &__kCFBooleanFalse;
  v48[18] = @"GAXProfileAllowsAXToggleVoiceOver";
  v48[19] = @"GAXProfileAllowsAXToggleZoom";
  v49[19] = &__kCFBooleanFalse;
  v49[20] = &__kCFBooleanFalse;
  v48[20] = @"GAXProfileAllowsAXToggleInvertColors";
  v48[21] = @"GAXProfileAllowsAXToggleGrayscale";
  v49[21] = &__kCFBooleanFalse;
  v49[22] = &__kCFBooleanFalse;
  v48[22] = @"GAXProfileAllowsAXToggleAssistiveTouch";
  v48[23] = @"GAXProfileAllowsAXToggleCommandAndControl";
  v49[23] = &__kCFBooleanFalse;
  v48[24] = @"GAXProfileIgnoredTouchRegionsPortrait";
  uint64_t v18 = +[NSNull null];
  v49[24] = v18;
  v48[25] = @"GAXProfileIgnoredTouchRegionsLandscape";
  uint64_t v19 = +[NSNull null];
  v49[25] = v19;
  v48[26] = @"GAXProfileStatesForRestrictions";
  uint64_t v20 = +[NSNull null];
  v49[26] = v20;
  v48[27] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  char v21 = +[NSNull null];
  v49[27] = v21;
  v49[28] = &__kCFBooleanFalse;
  v48[28] = @"GAXProfileAllowsHomeButton";
  v48[29] = @"GAXProfileShouldAutolaunchCrashedApps";
  v49[29] = &__kCFBooleanTrue;
  v49[30] = &__kCFBooleanTrue;
  v48[30] = @"GAXProfileShowsUserConfirmationPromptsAndBanners";
  v48[31] = @"GAXProfileShouldAutolaunchAppsAfterSystemCrash";
  v49[31] = &__kCFBooleanTrue;
  v49[32] = &__kCFBooleanFalse;
  v48[32] = @"GAXProfileAllowsExit";
  v48[33] = @"GAXProfileShouldAutolaunchAfterLowBatteryShutDown";
  v49[33] = &__kCFBooleanTrue;
  v49[34] = &__kCFBooleanTrue;
  v48[34] = @"GAXProfileAllowsWebTextDefine";
  v48[35] = @"GAXProfileAllowsAccessibilityShortcut";
  v49[35] = &__kCFBooleanFalse;
  uint64_t v22 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:36];

  v46[0] = @"GAXProfileAllowsAutolock";
  v46[1] = @"GAXProfileAllowsLockButton";
  v47[0] = &__kCFBooleanFalse;
  v47[1] = &__kCFBooleanFalse;
  uint64_t v23 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
  long long v24 = (void *)qword_37A50;
  qword_37A50 = v23;

  v44[0] = &off_2E578;
  v44[1] = &off_2E590;
  v45[0] = v43;
  v45[1] = v42;
  v44[2] = &off_2E5A8;
  v45[2] = v22;
  uint64_t v25 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];
  uint64_t v26 = (void *)qword_37A48;
  qword_37A48 = v25;
}

id GAXAppIsMobilePhoneOrFacetime(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.mobilephone"]) {
    id v2 = &dword_0 + 1;
  }
  else {
    id v2 = [v1 isEqualToString:@"com.apple.facetime"];
  }

  return v2;
}

uint64_t GAXSessionAppsContainMobilePhoneOrFacetime(void *a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  id v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        unsigned __int8 v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v6, "isEqualToString:", @"com.apple.mobilephone", (void)v9) & 1) != 0
          || ([v6 isEqualToString:@"com.apple.facetime"] & 1) != 0)
        {
          uint64_t v7 = 1;
          goto LABEL_13;
        }
      }
      id v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v7 = 0;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_13:

  return v7;
}

void extractGAXBackboardStateFromMessage(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 24) = 0;
  *(void *)(a2 + 16) = 0;
  id v3 = [a1 payload];
  id v4 = [v3 objectForKey:@"GAXIPCPayloadKeyGAXBackboardState"];

  [v4 getBytes:a2 length:28];
}

id serializeGAXBackboardState(uint64_t a1)
{
  return +[NSData dataWithBytes:a1 length:28];
}

id gaxDebugDescriptionForGAXBackboardState(unsigned int *a1)
{
  id v2 = +[NSMutableString stringWithString:@"GAXBackboardState:\n"];
  objc_msgSend(v2, "appendFormat:", @"  mode: %ld\n", *a1);
  objc_msgSend(v2, "appendFormat:", @"  passcodeWindowContextID: %ld\n", a1[1]);
  objc_msgSend(v2, "appendFormat:", @"  voiceOverItemChooserWindowContextID: %ld\n", a1[2]);
  objc_msgSend(v2, "appendFormat:", @"  tripleClickSheetWindowContextID: %ld\n", a1[3]);
  objc_msgSend(v2, "appendFormat:", @"  shouldBlockAllEvents: %ld\n", a1[6] & 1);
  objc_msgSend(v2, "appendFormat:", @"  restartingAndWasActiveBeforeRestart: %ld\n", ((unint64_t)a1[6] >> 1) & 1);
  objc_msgSend(v2, "appendFormat:", @"  verifyingDeviceUnlockInSAM: %ld\n", ((unint64_t)a1[6] >> 2) & 1);
  objc_msgSend(v2, "appendFormat:", @"  isPasscodeViewVisible: %ld\n", ((unint64_t)a1[6] >> 3) & 1);
  objc_msgSend(v2, "appendFormat:", @"  isRestricted: %ld\n", ((unint64_t)a1[6] >> 4) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideAllowsAllTouchSBMiniAlertIsShowing: %ld\n", ((unint64_t)a1[6] >> 5) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideAllowsAllTouchCallStateIsChanging: %ld\n", ((unint64_t)a1[6] >> 6) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideAllowsAllTouchMakingEmergencyCall: %ld\n", ((unint64_t)a1[6] >> 7) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideIgnoresAllTouchAllowedAppNotFound: %ld\n", ((unint64_t)a1[6] >> 8) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideIgnoresAllTouchVerifyingIntegrity: %ld\n", ((unint64_t)a1[6] >> 9) & 1);
  objc_msgSend(v2, "appendFormat:", @"  profileConfiguration: %ld\n", a1[5]);
  objc_msgSend(v2, "appendFormat:", @"  allowsTouch: %ld\n", ((unint64_t)a1[6] >> 10) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsLockButton: %ld\n", ((unint64_t)a1[6] >> 11) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsAppExit: %ld\n", ((unint64_t)a1[6] >> 12) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsHomeButton: %ld\n", ((unint64_t)a1[6] >> 13) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsVolumeButtons: %ld\n", ((unint64_t)a1[6] >> 14) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsRingerSwitch: %ld\n", ((unint64_t)a1[6] >> 15) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsMotion: %ld\n", ((unint64_t)a1[6] >> 16) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsAutolock: %ld\n", ((unint64_t)a1[6] >> 17) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsKeyboardTextInput: %ld\n", ((unint64_t)a1[6] >> 18) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsProximity: %ld\n", ((unint64_t)a1[6] >> 19) & 1);

  return v2;
}

BOOL GAXSecTaskHasBooleanEntitlement(__SecTask *a1, void *a2)
{
  id v3 = a2;
  CFErrorRef error = 0;
  CFTypeRef v4 = SecTaskCopyValueForEntitlement(a1, v3, &error);
  if (error)
  {
    id v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412802;
      long long v11 = a1;
      __int16 v12 = 2112;
      BOOL v13 = v3;
      __int16 v14 = 2112;
      CFErrorRef v15 = error;
      _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Unable to check if task %@ has entitlement %@: %@", buf, 0x20u);
    }

    CFRelease(error);
  }
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v4) != 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void sub_11630(id a1)
{
  id v1 = +[GAXSpringboard sharedInstance];
  [v1 notifyBackboardIsMakingEmergencyCall:0];
}

id sub_12830(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateSwitcherControllersWithBlock:&stru_294F0];
}

void sub_12840(id a1, id a2, BOOL *a3)
{
}

id sub_1284C(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateSwitcherControllersWithBlock:&stru_29510];
}

void sub_1285C(id a1, id a2, BOOL *a3)
{
}

void sub_12A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_12AA8(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_37A70)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_12BD4;
    void v3[4] = &unk_28A60;
    v3[5] = v3;
    long long v4 = off_29530;
    uint64_t v5 = 0;
    qword_37A70 = _sl_dlopen();
  }
  if (!qword_37A70) {
    sub_15F80(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("PRNotifyEvents");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_16000();
  }
  qword_37A68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_12BD4()
{
  uint64_t result = _sl_dlopen();
  qword_37A70 = result;
  return result;
}

uint64_t sub_134B8(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_13E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_13E34(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

id GAXAllowedRemoteUIProcesses()
{
  if (qword_37A80 != -1) {
    dispatch_once(&qword_37A80, &stru_29570);
  }
  v0 = (void *)qword_37A78;

  return v0;
}

void sub_14008(id a1)
{
  v3[0] = @"com.apple.MailCompositionService";
  v3[1] = @"com.apple.mobilesms.compose";
  v3[2] = @"com.apple.MessageCompositionService";
  v3[3] = @"com.apple.social.remoteui.SocialUIService";
  void v3[4] = @"com.apple.quicklook.quicklookd";
  v3[5] = @"com.apple.SafariViewService";
  v3[6] = @"com.apple.CoreAuthUI";
  v3[7] = @"com.apple.InCallService";
  v3[8] = @"com.apple.datadetectors.DDActionsService";
  v3[9] = @"com.apple.shortcuts.runtime";
  v3[10] = @"com.apple.SleepLockScreen";
  v3[11] = @"com.apple.ContactlessUIService";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:12];
  id v2 = (void *)qword_37A78;
  qword_37A78 = v1;
}

id GAXURLSchemeIsPhoneRelated(void *a1)
{
  uint64_t v1 = [a1 scheme];
  if (([v1 isEqualToString:@"tel"] & 1) != 0
    || ([v1 isEqualToString:@"facetime"] & 1) != 0)
  {
    id v2 = &dword_0 + 1;
  }
  else
  {
    id v2 = [v1 isEqualToString:@"facetime-audio"];
  }

  return v2;
}

id GAXLocalizedStringForTimeDuration(double a1)
{
  id v2 = objc_opt_new();
  [v2 setZeroFormattingBehavior:1];
  [v2 setUnitsStyle:3];
  if (a1 >= 60.0)
  {
    if ((int)a1 % 60 > 30) {
      a1 = a1 + 60.0;
    }
    uint64_t v3 = 96;
  }
  else
  {
    uint64_t v3 = 128;
  }
  [v2 setAllowedUnits:v3];
  long long v4 = [v2 stringFromTimeInterval:a1];

  return v4;
}

void sub_144D8(uint64_t a1)
{
  char v6 = 0;
  id v2 = [(id)AXSafeClassFromString() safeValueForKey:@"mainWorkspace"];
  uint64_t v3 = __UIAccessibilitySafeClass();

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_145C4;
  v4[3] = &unk_29598;
  id v5 = *(id *)(a1 + 32);
  [v3 requestTransitionWithBuilder:v4];
}

void sub_145C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = __UIAccessibilitySafeClass();

  id v6 = *(id *)(a1 + 32);
  id v5 = v4;
  AXPerformSafeBlock();
}

void sub_146A8(uint64_t a1)
{
  [*(id *)(a1 + 32) setSource:0];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_14740;
  v3[3] = &unk_29598;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 modifyApplicationContext:v3];
}

void sub_14740(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __UIAccessibilitySafeClass();

  if (v4)
  {
    id v5 = *(id *)(a1 + 32);
    id v6 = v4;
    AXPerformSafeBlock();
  }
}

void sub_14824(uint64_t a1)
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  BOOL v7 = sub_14930;
  id v8 = sub_14940;
  id v9 = 0;
  id v3 = *(id *)(a1 + 32);
  AXPerformSafeBlock();
  uint64_t v2 = v5[5];
  if (v2) {
    objc_msgSend(*(id *)(a1 + 40), "setEntity:forLayoutRole:", v2, 1, _NSConcreteStackBlock, 3221225472, sub_14948, &unk_285E0, v3, &v4);
  }

  _Block_object_dispose(&v4, 8);
}

void sub_14918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_14930(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_14940(uint64_t a1)
{
}

uint64_t sub_14948(uint64_t a1)
{
  id v2 = [objc_alloc((Class)AXSafeClassFromString()) initWithApplicationForMainDisplay:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;

  return _objc_release_x1(v2);
}

void sub_14A0C(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _windowsToHost];
  uint64_t v1 = [v4 firstObject];
  id v2 = [v1 windowScene];

  id v3 = [(id)objc_opt_class() _uiController];
  [v3 handleHomeButtonSinglePressUpForWindowScene:v2];
}

void sub_14AAC(id a1)
{
  uint64_t v1 = GAXLogCommon();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_INFO, "Updating lock and idle timers.", v3, 2u);
  }

  id v2 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstance"];
  [v2 resetIdleTimerForReason:@"GAX requested idle timer update"];
}

void sub_14CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_14CF8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) requireWallpaperWithReason:@"Guided Access UI"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;

  return _objc_release_x1(v2);
}

void sub_14E34(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) _wallpaperStyleAnimationFactoryWithDelay:0.1];
  [v1 setWallpaperStyle:0 forPriority:3 forVariant:1 withAnimationFactory:v2];
}

void sub_14F38(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) _wallpaperStyleAnimationFactoryWithDelay:0.0];
  [v1 removeWallpaperStyleForPriority:3 forVariant:1 withAnimationFactory:v2];
}

void sub_1543C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_15454(uint64_t a1)
{
  uint64_t v2 = +[BSUIAnimationFactory factoryWithDuration:0.3 delay:*(double *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = v2;

  return _objc_release_x1(v2);
}

void sub_15844()
{
  sub_8F84();
  sub_8F68(&dword_0, v0, v1, "SpringBoard Server could not start its message server: %@", v2, v3, v4, v5, v6);
}

void sub_158AC()
{
  sub_8F84();
  sub_8F68(&dword_0, v0, v1, "SpringBoard server could not disconnect from backboard service gracefully: %@", v2, v3, v4, v5, v6);
}

void sub_15914()
{
  sub_8F84();
  sub_8F68(&dword_0, v0, v1, "SpringBoard could not stop its message server gracefully: %@", v2, v3, v4, v5, v6);
}

void sub_1597C()
{
  sub_8F84();
  sub_8F68(&dword_0, v0, v1, "Error archiving app icon: %@", v2, v3, v4, v5, v6);
}

void sub_159E4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Making a new application object from AXSpringBoardServer to make sure we're not stuck on a stale one (if the app is being reinstalled or updated)", v1, 2u);
}

void sub_15A28()
{
  sub_8F84();
  sub_8F68(&dword_0, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void sub_15A90()
{
  sub_8F84();
  sub_8F90(&dword_0, v0, v1, "Unable to terminate BackgroundShortcutRunner for reason \"%@\": %@");
}

void sub_15B04(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&void v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&void v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_8F90(&dword_0, a2, a3, "could not send message to backboard. Message : %@\nError : %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_15B80(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Failed to call completion handler from Guided Access: %@", buf, 0xCu);
}

void sub_15BD8(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *ProximityReaderLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"GAXSpringBoardOverride.m", 32, @"%s", *a1);

  __break(1u);
}

void sub_15C58()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  os_log_t v1 = +[NSString stringWithUTF8String:"Class getPRNotifyEventsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"GAXSpringBoardOverride.m", 33, @"Unable to find class %s", "PRNotifyEvents");

  __break(1u);
}

void sub_15CD4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to push backboard state change to SpringBoard: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_15D4C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Updating GAXSpringboardClient with a nil frontmostAppID", v1, 2u);
}

void sub_15D90(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "No appID sent in when launching application", v1, 2u);
}

void sub_15DD4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Couldn't get suggested passcode length from SpringBoard: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_15E4C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Unexpectedly tried to update home grabber display mode change for a floating window after creation.", v1, 2u);
}

void sub_15E90(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "No fallback value was registered for profile key: %@", (uint8_t *)&v2, 0xCu);
}

void sub_15F08(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unexpectedly had current floating app layout that did not match frontmost: %@", (uint8_t *)&v2, 0xCu);
}

void sub_15F80(void *a1)
{
  int v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *ProximityReaderLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"GAXSBInCallPresentationManagerOverride.m", 21, @"%s", *a1);

  __break(1u);
}

void sub_16000()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  os_log_t v1 = +[NSString stringWithUTF8String:"Class getPRNotifyEventsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"GAXSBInCallPresentationManagerOverride.m", 22, @"Unable to find class %s", "PRNotifyEvents");

  __break(1u);
}

void sub_1607C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Could not find an application window to host.", v1, 2u);
}

uint64_t AXDeviceHasHomeButton()
{
  return _AXDeviceHasHomeButton();
}

uint64_t AXDeviceHasSystemPasscode()
{
  return _AXDeviceHasSystemPasscode();
}

uint64_t AXLogCommon()
{
  return _AXLogCommon();
}

uint64_t AXLogIPC()
{
  return _AXLogIPC();
}

uint64_t AXLogValidations()
{
  return _AXLogValidations();
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

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return _AXPerformBlockSynchronouslyOnMainThread();
}

uint64_t AXPerformSafeBlock()
{
  return _AXPerformSafeBlock();
}

uint64_t AXProcessIsSpringBoard()
{
  return _AXProcessIsSpringBoard();
}

uint64_t AXSafeClassFromString()
{
  return _AXSafeClassFromString();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
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

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

uint64_t GAXLogAppLaunching()
{
  return _GAXLogAppLaunching();
}

uint64_t GAXLogCommon()
{
  return _GAXLogCommon();
}

uint64_t GSEventGetType()
{
  return _GSEventGetType();
}

uint64_t LIIconOutputSizeForVariant()
{
  return _LIIconOutputSizeForVariant();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXSGuidedAccessRequiresApplicationAccessibility()
{
  return __AXSGuidedAccessRequiresApplicationAccessibility();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilityCastAsClass()
{
  return ___UIAccessibilityCastAsClass();
}

uint64_t __UIAccessibilityCastAsProtocol()
{
  return ___UIAccessibilityCastAsProtocol();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return ___UIAccessibilityCastAsSafeCategory();
}

uint64_t __UIAccessibilitySafeClass()
{
  return ___UIAccessibilitySafeClass();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void abort(void)
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

id objc_msgSend__acquireCameraButtonAssertion(void *a1, const char *a2, ...)
{
  return [a1 _acquireCameraButtonAssertion];
}

id objc_msgSend__acquireLockScreenDisableAssertion(void *a1, const char *a2, ...)
{
  return [a1 _acquireLockScreenDisableAssertion];
}

id objc_msgSend__acquireSystemApertureInertAssertion(void *a1, const char *a2, ...)
{
  return [a1 _acquireSystemApertureInertAssertion];
}

id objc_msgSend__applicationController(void *a1, const char *a2, ...)
{
  return [a1 _applicationController];
}

id objc_msgSend__axSpringBoardServerInstance(void *a1, const char *a2, ...)
{
  return [a1 _axSpringBoardServerInstance];
}

id objc_msgSend__deviceHasBiometrics(void *a1, const char *a2, ...)
{
  return [a1 _deviceHasBiometrics];
}

id objc_msgSend__endHostingApplicationImmediately(void *a1, const char *a2, ...)
{
  return [a1 _endHostingApplicationImmediately];
}

id objc_msgSend__gaxDesiredHomeGrabberDisplayMode(void *a1, const char *a2, ...)
{
  return [a1 _gaxDesiredHomeGrabberDisplayMode];
}

id objc_msgSend__gaxHasLoggedDisallowedDrop(void *a1, const char *a2, ...)
{
  return [a1 _gaxHasLoggedDisallowedDrop];
}

id objc_msgSend__gaxInitializeOverride(void *a1, const char *a2, ...)
{
  return [a1 _gaxInitializeOverride];
}

id objc_msgSend__gaxInternalShouldSuppressBottomGrabber(void *a1, const char *a2, ...)
{
  return [a1 _gaxInternalShouldSuppressBottomGrabber];
}

id objc_msgSend__gaxMainDisplaySystemGestureManager(void *a1, const char *a2, ...)
{
  return [a1 _gaxMainDisplaySystemGestureManager];
}

id objc_msgSend__gaxNeedsLaunchEnabledAppearance(void *a1, const char *a2, ...)
{
  return [a1 _gaxNeedsLaunchEnabledAppearance];
}

id objc_msgSend__gaxShouldAppearLaunchDisabled(void *a1, const char *a2, ...)
{
  return [a1 _gaxShouldAppearLaunchDisabled];
}

id objc_msgSend__gaxShouldLimitActiveAppLayoutToCurrentApp(void *a1, const char *a2, ...)
{
  return [a1 _gaxShouldLimitActiveAppLayoutToCurrentApp];
}

id objc_msgSend__gaxShouldLimitAppLayoutsToCurrentApp(void *a1, const char *a2, ...)
{
  return [a1 _gaxShouldLimitAppLayoutsToCurrentApp];
}

id objc_msgSend__gaxShouldSuppressBottomGrabber(void *a1, const char *a2, ...)
{
  return [a1 _gaxShouldSuppressBottomGrabber];
}

id objc_msgSend__gaxWallpaperAssertion(void *a1, const char *a2, ...)
{
  return [a1 _gaxWallpaperAssertion];
}

id objc_msgSend__iconController(void *a1, const char *a2, ...)
{
  return [a1 _iconController];
}

id objc_msgSend__invalidateCameraButtonAssertion(void *a1, const char *a2, ...)
{
  return [a1 _invalidateCameraButtonAssertion];
}

id objc_msgSend__invalidateSystemApertureInertAssertion(void *a1, const char *a2, ...)
{
  return [a1 _invalidateSystemApertureInertAssertion];
}

id objc_msgSend__performCancelAction(void *a1, const char *a2, ...)
{
  return [a1 _performCancelAction];
}

id objc_msgSend__releaseLockScreenDisableAssertion(void *a1, const char *a2, ...)
{
  return [a1 _releaseLockScreenDisableAssertion];
}

id objc_msgSend__shouldDispatchLocally(void *a1, const char *a2, ...)
{
  return [a1 _shouldDispatchLocally];
}

id objc_msgSend__uiController(void *a1, const char *a2, ...)
{
  return [a1 _uiController];
}

id objc_msgSend__wallpaperController(void *a1, const char *a2, ...)
{
  return [a1 _wallpaperController];
}

id objc_msgSend__windowsToHost(void *a1, const char *a2, ...)
{
  return [a1 _windowsToHost];
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeInterfaceOrientation];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowsAutolock(void *a1, const char *a2, ...)
{
  return [a1 allowsAutolock];
}

id objc_msgSend_allowsLockButton(void *a1, const char *a2, ...)
{
  return [a1 allowsLockButton];
}

id objc_msgSend_allowsMotion(void *a1, const char *a2, ...)
{
  return [a1 allowsMotion];
}

id objc_msgSend_allowsTouch(void *a1, const char *a2, ...)
{
  return [a1 allowsTouch];
}

id objc_msgSend_animateWallpaperStyleToNormal(void *a1, const char *a2, ...)
{
  return [a1 animateWallpaperStyleToNormal];
}

id objc_msgSend_animateWallpaperStyleToOriginal(void *a1, const char *a2, ...)
{
  return [a1 animateWallpaperStyleToOriginal];
}

id objc_msgSend_applicationLaunchingQueue(void *a1, const char *a2, ...)
{
  return [a1 applicationLaunchingQueue];
}

id objc_msgSend_archivedSessionApplicationIcon(void *a1, const char *a2, ...)
{
  return [a1 archivedSessionApplicationIcon];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backboardClient(void *a1, const char *a2, ...)
{
  return [a1 backboardClient];
}

id objc_msgSend_backboardMessageQueue(void *a1, const char *a2, ...)
{
  return [a1 backboardMessageQueue];
}

id objc_msgSend_beginRequiringWallpaper(void *a1, const char *a2, ...)
{
  return [a1 beginRequiringWallpaper];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_captureButtonSuppressionAssertion(void *a1, const char *a2, ...)
{
  return [a1 captureButtonSuppressionAssertion];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return [a1 contentViewController];
}

id objc_msgSend_contextHostWrappers(void *a1, const char *a2, ...)
{
  return [a1 contextHostWrappers];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_deviceWasUnlocked(void *a1, const char *a2, ...)
{
  return [a1 deviceWasUnlocked];
}

id objc_msgSend_didEndRequiringWallpaperCheckTimer(void *a1, const char *a2, ...)
{
  return [a1 didEndRequiringWallpaperCheckTimer];
}

id objc_msgSend_didFailToActivate(void *a1, const char *a2, ...)
{
  return [a1 didFailToActivate];
}

id objc_msgSend_disconnectAllCalls(void *a1, const char *a2, ...)
{
  return [a1 disconnectAllCalls];
}

id objc_msgSend_dismissAppSwitcher(void *a1, const char *a2, ...)
{
  return [a1 dismissAppSwitcher];
}

id objc_msgSend_dismissSiri(void *a1, const char *a2, ...)
{
  return [a1 dismissSiri];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_effectiveWhitelistedAppsAndOptions(void *a1, const char *a2, ...)
{
  return [a1 effectiveWhitelistedAppsAndOptions];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fixedCoordinateSpace(void *a1, const char *a2, ...)
{
  return [a1 fixedCoordinateSpace];
}

id objc_msgSend_focusedAppProcess(void *a1, const char *a2, ...)
{
  return [a1 focusedAppProcess];
}

id objc_msgSend_frontmostAppIdentifier(void *a1, const char *a2, ...)
{
  return [a1 frontmostAppIdentifier];
}

id objc_msgSend_gaxEndRequiringWallpaper(void *a1, const char *a2, ...)
{
  return [a1 gaxEndRequiringWallpaper];
}

id objc_msgSend_gaxInternalSettingsTimeRestrictionHasExpired(void *a1, const char *a2, ...)
{
  return [a1 gaxInternalSettingsTimeRestrictionHasExpired];
}

id objc_msgSend_guidedAccessAllowsMultipleWindows(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessAllowsMultipleWindows];
}

id objc_msgSend_guidedAccessAutoLockTimeInSeconds(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessAutoLockTimeInSeconds];
}

id objc_msgSend_guidedAccessUserPrefersMirroringForExternalDisplays(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessUserPrefersMirroringForExternalDisplays];
}

id objc_msgSend_hideNotificationCenter(void *a1, const char *a2, ...)
{
  return [a1 hideNotificationCenter];
}

id objc_msgSend_hostedApplicationWindow(void *a1, const char *a2, ...)
{
  return [a1 hostedApplicationWindow];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAppSwitcherVisible(void *a1, const char *a2, ...)
{
  return [a1 isAppSwitcherVisible];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isInSingleAppMode(void *a1, const char *a2, ...)
{
  return [a1 isInSingleAppMode];
}

id objc_msgSend_isInWorkspace(void *a1, const char *a2, ...)
{
  return [a1 isInWorkspace];
}

id objc_msgSend_isInactive(void *a1, const char *a2, ...)
{
  return [a1 isInactive];
}

id objc_msgSend_isNotificationCenterVisible(void *a1, const char *a2, ...)
{
  return [a1 isNotificationCenterVisible];
}

id objc_msgSend_isOnlyGuidedAccessDisablingSystemGestures(void *a1, const char *a2, ...)
{
  return [a1 isOnlyGuidedAccessDisablingSystemGestures];
}

id objc_msgSend_isRequiringWallpaper(void *a1, const char *a2, ...)
{
  return [a1 isRequiringWallpaper];
}

id objc_msgSend_isSiriVisible(void *a1, const char *a2, ...)
{
  return [a1 isSiriVisible];
}

id objc_msgSend_isSystemAppFrontmost(void *a1, const char *a2, ...)
{
  return [a1 isSystemAppFrontmost];
}

id objc_msgSend_isSystemSleeping(void *a1, const char *a2, ...)
{
  return [a1 isSystemSleeping];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lockScreenDisableAssertion(void *a1, const char *a2, ...)
{
  return [a1 lockScreenDisableAssertion];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_medusaBundleIDsToLayoutRoles(void *a1, const char *a2, ...)
{
  return [a1 medusaBundleIDsToLayoutRoles];
}

id objc_msgSend_needsToUpdatePrefersMirroringForExternalDisplaysDefault(void *a1, const char *a2, ...)
{
  return [a1 needsToUpdatePrefersMirroringForExternalDisplaysDefault];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_onlySystemGesturesDisabledHolderIsGuidedAccess(void *a1, const char *a2, ...)
{
  return [a1 onlySystemGesturesDisabledHolderIsGuidedAccess];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_profileConfiguration(void *a1, const char *a2, ...)
{
  return [a1 profileConfiguration];
}

id objc_msgSend_quitTopApplication(void *a1, const char *a2, ...)
{
  return [a1 quitTopApplication];
}

id objc_msgSend_replayer(void *a1, const char *a2, ...)
{
  return [a1 replayer];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_sessionApplicationName(void *a1, const char *a2, ...)
{
  return [a1 sessionApplicationName];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setUp(void *a1, const char *a2, ...)
{
  return [a1 setUp];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedInstanceIfExists(void *a1, const char *a2, ...)
{
  return [a1 sharedInstanceIfExists];
}

id objc_msgSend_sharedServerHelper(void *a1, const char *a2, ...)
{
  return [a1 sharedServerHelper];
}

id objc_msgSend_springBoardServerInstanceIfExists(void *a1, const char *a2, ...)
{
  return [a1 springBoardServerInstanceIfExists];
}

id objc_msgSend_springboardOverrideHandler(void *a1, const char *a2, ...)
{
  return [a1 springboardOverrideHandler];
}

id objc_msgSend_springboardServer(void *a1, const char *a2, ...)
{
  return [a1 springboardServer];
}

id objc_msgSend_systemApertureInertAssertion(void *a1, const char *a2, ...)
{
  return [a1 systemApertureInertAssertion];
}

id objc_msgSend_systemDidRestartDueToLowBattery(void *a1, const char *a2, ...)
{
  return [a1 systemDidRestartDueToLowBattery];
}

id objc_msgSend_tearDown(void *a1, const char *a2, ...)
{
  return [a1 tearDown];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_unlockDevice(void *a1, const char *a2, ...)
{
  return [a1 unlockDevice];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateLockAndIdleTimers(void *a1, const char *a2, ...)
{
  return [a1 updateLockAndIdleTimers];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_verifyConnectionExists(void *a1, const char *a2, ...)
{
  return [a1 verifyConnectionExists];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_wantsAppSelfLockMode(void *a1, const char *a2, ...)
{
  return [a1 wantsAppSelfLockMode];
}

id objc_msgSend_wantsSingleAppMode(void *a1, const char *a2, ...)
{
  return [a1 wantsSingleAppMode];
}

id objc_msgSend_wantsSingleAppModeOrAppSelfLockMode(void *a1, const char *a2, ...)
{
  return [a1 wantsSingleAppModeOrAppSelfLockMode];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}

id objc_msgSend_windowSceneForPresentable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowSceneForPresentable:");
}