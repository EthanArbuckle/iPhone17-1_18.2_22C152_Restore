id sub_2E14(uint64_t a1)
{
  return [*(id *)(a1 + 32) installSafeCategory:@"SSSScreenshotsViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
}

void sub_552C(id a1)
{
  qword_83618 = +[NSMutableDictionary dictionary];

  _objc_release_x1();
}

BOOL sub_5970(id a1, CAFilter *a2, unint64_t a3, BOOL *a4)
{
  v5 = a2;
  v6 = [(CAFilter *)v5 name];
  if ([v6 isEqualToString:@"UIInvertColorsDoubleInvertPrivateKey"])
  {
  }
  else
  {
    v7 = [(CAFilter *)v5 name];
    unsigned int v8 = [v7 isEqualToString:@"InvertColorsDoubleInvert"];

    if (!v8)
    {
      BOOL v9 = 0;
      goto LABEL_6;
    }
  }
  BOOL v9 = 1;
  *a4 = 1;
LABEL_6:

  return v9;
}

BOOL sub_5C68(id a1, CAFilter *a2)
{
  v2 = [(CAFilter *)a2 name];
  unsigned __int8 v3 = [v2 isEqualToString:@"InvertColorsDarkModeWindowFilter"];

  return v3;
}

BOOL sub_5CAC(id a1, CAFilter *a2, unint64_t a3, BOOL *a4)
{
  v4 = [(CAFilter *)a2 name];
  unsigned __int8 v5 = [v4 isEqualToString:@"InvertColorsDarkModeWindowFilter"];

  return v5;
}

uint64_t sub_65A8(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t sub_65CC(uint64_t a1, void *a2)
{
  id v2 = a2;
  unsigned __int8 v3 = [(id)objc_opt_class() description];
  [v2 setValidationTargetName:v3];

  v4 = [(id)objc_opt_class() description];
  [v2 setOverrideProcessName:v4];

  [v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

id sub_666C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) installCategories:a2];
}

id sub_693C(uint64_t a1)
{
  id v2 = +[AXSubsystemInvertColors sharedInstance];
  unsigned __int8 v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    v4 = +[AXSubsystemInvertColors identifier];
    unsigned __int8 v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = AXColorizeFormatLog();
      uint64_t v10 = *(void *)(a1 + 32);
      unsigned int v8 = _AXStringForArgs();
      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v8;
        _os_log_impl(&dword_0, v5, v6, "%{public}@", buf, 0xCu);
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_initializeOverrides", v10);
}

id sub_6A84()
{
  uint64_t v4 = 0;
  unsigned __int8 v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_83630;
  uint64_t v7 = qword_83630;
  if (!qword_83630)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_76AC;
    v3[3] = &unk_446D0;
    v3[4] = &v4;
    sub_76AC((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_6B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_76AC(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_83638)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_77F0;
    v4[4] = &unk_446A8;
    v4[5] = v4;
    long long v5 = off_446F0;
    uint64_t v6 = 0;
    qword_83638 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!qword_83638)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AXBinaryMonitor");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)sub_21A00();
LABEL_8:
    free(v2);
  }
  qword_83630 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_77F0()
{
  uint64_t result = _sl_dlopen();
  qword_83638 = result;
  return result;
}

void sub_7864(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_7F90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tlk_updateWithCurrentAppearance");
}

id sub_8324(uint64_t a1)
{
  return [*(id *)(a1 + 32) installSafeCategory:@"SSScreenshotsWindowInvertColorsAccessibility" canInteractWithTargetClass:1];
}

void sub_8C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 sub_8C94(uint64_t a1)
{
  [(id)AXSafeClassFromString() _cartographicConfigurationForMapConfiguration:*(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  __n128 result = v6;
  *(_OWORD *)(v2 + 32) = v4;
  *(_OWORD *)(v2 + 48) = v5;
  *(__n128 *)(v2 + 64) = v6;
  *(void *)(v2 + 80) = v7;
  return result;
}

void sub_8E4C(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

id sub_A680(uint64_t a1)
{
  return [*(id *)(a1 + 32) installSafeCategory:@"NSTextAttachmentInvertColorsAccessibility" canInteractWithTargetClass:1];
}

id sub_B95C(uint64_t a1)
{
  [*(id *)(a1 + 32) installSafeCategory:@"CALayerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UISwitchInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UISliderInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UIViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UIWindowInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UIKeyboardEmojiCollectionViewCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UIKBKeyViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UIInputSetHostViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UIStatusBarItemViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"_UIActivityGroupActivityCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UITextViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UIStatusBar_ModernInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UIStatusBarBatteryItemViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"_UIBatteryViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"_UIInteractiveHighlightEnvironmentInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UITableViewCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UITableViewCellLayoutManagerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UIStatusBarQuietModeItemViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UITabBarControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"_UIListContentImageViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UIRemoteKeyboardWindowInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UIActivityContentViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"_UIPortalViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UIStatusBarWindowInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UISwipeActionStandardButtonInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"_UIHostedWindowInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UITextEffectsWindowHostedInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"UIRemoteKeyboardWindowHostedInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"_UIPointerContentEffectInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"_UIContextMenuUIControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) installSafeCategory:@"_UIContextMenuContainerViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 installSafeCategory:@"UIVisualEffectViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

void sub_C620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_C638(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_C648(uint64_t a1)
{
}

uint64_t sub_C650(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) layerForRenderFlags:1];

  return _objc_release_x1();
}

void sub_D77C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_D794(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v4 = [v3 _accessibilityBoolValueForKey:@"InvertState"];
    if (v4 != UIAccessibilityIsInvertColorsEnabled())
    {
      long long v5 = +[AXSubsystemInvertColors sharedInstance];
      unsigned __int8 v6 = [v5 ignoreLogging];

      if ((v6 & 1) == 0)
      {
        uint64_t v7 = +[AXSubsystemInvertColors identifier];
        unsigned int v8 = AXLoggerForFacility();

        os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v8, v9))
        {
          uint64_t v10 = AXColorizeFormatLog();
          uint64_t v23 = [*(id *)(a1 + 32) _accessibilityBoolValueForKey:@"InvertState"];
          BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
          id v22 = v3;
          v11 = _AXStringForArgs();
          if (os_log_type_enabled(v8, v9))
          {
            *(_DWORD *)buf = 138543362;
            v26 = v11;
            _os_log_impl(&dword_0, v8, v9, "%{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v12 = objc_msgSend(v3, "image", v22, v23, IsInvertColorsEnabled);
      if (v12)
      {
        v13 = (void *)v12;
        v14 = +[AXInvertColorsAppHelper invertImage:v12];

        if (v14)
        {
          [v3 _accessibilitySetBoolValue:UIAccessibilityIsInvertColorsEnabled() forKey:@"InvertState"];
          [v3 _accessibilitySetBoolValue:1 forKey:@"IsInvertingImage"];
          [v3 setImage:v14];
          [v3 _accessibilitySetBoolValue:0 forKey:@"IsInvertingImage"];
          v15 = +[AXSubsystemInvertColors sharedInstance];
          unsigned __int8 v16 = [v15 ignoreLogging];

          if ((v16 & 1) == 0)
          {
            v17 = +[AXSubsystemInvertColors identifier];
            v18 = AXLoggerForFacility();

            os_log_type_t v19 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v18, v19))
            {
              v20 = AXColorizeFormatLog();
              v21 = _AXStringForArgs();
              if (os_log_type_enabled(v18, v19))
              {
                *(_DWORD *)buf = 138543362;
                v26 = v21;
                _os_log_impl(&dword_0, v18, v19, "%{public}@", buf, 0xCu);
              }
            }
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        }
      }
    }
  }
}

id sub_DAB0(uint64_t a1)
{
  [*(id *)(a1 + 32) _axSetIgnoreNextAttributedText:1];
  [*(id *)(a1 + 32) setAttributedText:0];
  [*(id *)(a1 + 32) setAttributedText:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _axSetIgnoreNextAttributedText:0];
}

void sub_E2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_E2C4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _imageView:0];

  return _objc_release_x1();
}

id sub_FFF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateColorIfNeeded];
}

id sub_10704(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOverlayColor:*(void *)(a1 + 40)];
}

id sub_12264(uint64_t a1)
{
  return [*(id *)(a1 + 32) _wallpaperDidChange:0];
}

void sub_126E8(id a1)
{
  qword_83668 = AXSafeClassFromString();
}

uint64_t sub_12AB0()
{
  return AXPerformSafeBlock();
}

id sub_12B28(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) safeValueForKey:@"_materialLayer"];
  [v2 setReduceTransparencyEnabled:*(unsigned __int8 *)(a1 + 40)];

  id v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 41))
  {
    return [v3 _invalidateAlphaTransformer];
  }
  else
  {
    return [v3 _setupAlphaTransformer];
  }
}

void sub_15220()
{
  v0 = +[UIColor whiteColor];
  objc_opt_class();
  uint64_t v1 = __UIAccessibilityCastAsClass();
  [v1 setTextColor:v0];
}

id sub_15444(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tlk_updateWithCurrentAppearance");
}

void sub_162F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_16308(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isItemAtIndexPathAddItem:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_16428(uint64_t a1)
{
  return [*(id *)(a1 + 32) installSafeCategory:@"_UIApplicationInfoInvertColorsAccessibility" canInteractWithTargetClass:1];
}

void sub_16B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  objc_destroyWeak(v19);
  _Block_object_dispose(&a18, 8);
  objc_destroyWeak(v18);
  objc_destroyWeak((id *)(v20 - 72));
  _Unwind_Resume(a1);
}

id sub_16B7C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained layer];
  +[AXInvertColorsAppHelper unapplyInvertFilterToLayer:v3];

  unsigned int v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "evaluateJavaScript:completionHandler:", @"function removeFilter() { Array.prototype.forEach.call(document.querySelectorAll('img, picture, video'), function (img) { if (img.style.filter == 'invert(100%)') {img.style.filter = 'invert(0%)';} }) }removeFilter();",
           &stru_44850);
}

void sub_16BFC(id a1, id a2, NSError *a3)
{
  id v3 = a3;
  unsigned int v4 = AXLogInvertColors();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_21AA0((uint64_t)v3, v4);
  }
}

void sub_16C50(uint64_t a1)
{
  if (CFAbsoluteTimeGetCurrent() - *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 0.25)
  {
    id v3 = *(void **)(a1 + 32);
    unsigned int v4 = AXInvertColorsDarkModeDetectionJavascript();
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_16D80;
    v8[3] = &unk_448C0;
    objc_copyWeak(&v11, (id *)(a1 + 56));
    long long v5 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    id v9 = v6;
    uint64_t v10 = v7;
    [v3 evaluateJavaScript:v4 completionHandler:v8];

    objc_destroyWeak(&v11);
  }
  else
  {
    uint64_t v2 = AXLogInvertColors();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_21B18(a1, v2);
    }
  }
}

void sub_16D6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_16D80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  unsigned int v8 = [WeakRetained traitCollection];
  [v8 userInterfaceStyle];
  id v9 = AXInvertColorsUserInterfaceStyleDescription();

  id v10 = objc_loadWeakRetained((id *)(a1 + 56));
  [v10 overrideUserInterfaceStyle];
  id v11 = AXInvertColorsUserInterfaceStyleDescription();

  uint64_t v12 = AXLogInvertColors();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v17 = objc_loadWeakRetained((id *)(a1 + 56));
    v18 = [v17 URL];
    *(_DWORD *)uint64_t v20 = 138413826;
    *(void *)&v20[4] = v17;
    *(_WORD *)&v20[12] = 2112;
    *(void *)&v20[14] = v18;
    *(_WORD *)&v20[22] = 2112;
    v21 = v9;
    *(_WORD *)id v22 = 2112;
    *(void *)&v22[2] = v11;
    *(_WORD *)&v22[10] = 2112;
    *(void *)&v22[12] = v5;
    *(_WORD *)&v22[20] = 2112;
    *(void *)&v22[22] = objc_opt_class();
    *(_WORD *)&v22[30] = 2112;
    id v23 = v6;
    id v19 = *(id *)&v22[22];
    _os_log_debug_impl(&dword_0, v12, OS_LOG_TYPE_DEBUG, "Pre-js: WKWebView %@ (%@) S %@, OS %@, supports dark: %@[%@] -> %@", v20, 0x48u);
  }
  if (!v6
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v5 BOOLValue] & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "_accessibilitySubclassSupportsDarkMode", *(_OWORD *)v20, *(void *)&v20[16], v21, *(_OWORD *)v22, *(_OWORD *)&v22[16], v23))
  {
    v13 = AXLogInvertColors();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_21BB4((id *)(a1 + 56));
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v14 = objc_loadWeakRetained((id *)(a1 + 56));
    v15 = [v14 layer];
    +[AXInvertColorsAppHelper applyInvertFilterToLayer:v15];

    unsigned __int8 v16 = AXLogInvertColors();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_21C4C((id *)(a1 + 56));
    }

    objc_msgSend(*(id *)(a1 + 32), "evaluateJavaScript:completionHandler:", @"function addFilter() { Array.prototype.forEach.call(document.querySelectorAll('img, picture, video'), function (img) { img.style.filter = 'invert(100%)';}) }addFilter();",
      &stru_44898);
  }
  *(CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CFAbsoluteTimeGetCurrent();
}

void sub_17028(id a1, id a2, NSError *a3)
{
  id v3 = a3;
  unsigned int v4 = AXLogInvertColors();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_21CE4((uint64_t)v3, v4);
  }
}

void sub_171D0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

BOOL sub_1761C(id a1, UIView *a2, BOOL *a3)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_17C08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_17C38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v2 = [WeakRetained _accessibilityBoolValueForKey:@"galleryVisible"];

  return v2 ^ 1;
}

uint64_t sub_17C78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v2 = [WeakRetained _accessibilityBoolValueForKey:@"galleryVisible"];

  return v2 ^ 1;
}

BOOL sub_181B4(id a1, UIView *a2, unint64_t a3)
{
  uint64_t v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![(UIView *)v3 isHidden])
  {
    [(UIView *)v3 alpha];
    BOOL v4 = v5 > 0.0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

BOOL sub_18220(id a1, UIView *a2, unint64_t a3, BOOL *a4)
{
  BOOL v4 = a2;
  NSClassFromString(@"MPVideoView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id sub_18A54(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mt_removeAllVisualStyling");
}

id sub_18B14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mt_removeAllVisualStyling");
}

id sub_18B1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVisualStyling];
}

id sub_191E0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _accessibilityForceRefreshOfInvertColors:a2];
}

void sub_1A5A4(id a1)
{
  id v1 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstance"];
  [v1 invalidateSnapshotsForLocations:3];
}

id sub_1AF24(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentEffect];
}

void sub_1C670(id a1)
{
  id v1 = +[NSBundle mainBundle];
  unsigned int v2 = [v1 bundleIdentifier];
  byte_83688 = [v2 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider"];

  id v4 = +[NSBundle mainBundle];
  uint64_t v3 = [v4 bundleIdentifier];
  byte_83689 = [v3 isEqualToString:@"com.apple.ambient.AmbientUI.InfographPoster"];
}

BOOL sub_1CA7C(id a1, UIView *a2)
{
  unsigned int v2 = a2;
  AXSafeClassFromString();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_1CB28(id a1)
{
  id v2 = +[NSBundle mainBundle];
  id v1 = [v2 bundleIdentifier];
  byte_83698 = [v1 isEqualToString:@"com.apple.mobileslideshow.photospicker"];
}

void sub_1D7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1D7F4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) color];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_1DB48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DB64(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DB74(uint64_t a1)
{
}

uint64_t sub_1DB7C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) indexPathForCell:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

uint64_t sub_1DBCC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));

  return _objc_release_x1();
}

void sub_1E23C(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", @"collectionView", 0);
  uint64_t v3 = [v2 safeArrayForKey:@"visibleCells"];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) _axRefreshInvertColorsForCell:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void sub_1EC44(id a1, UIView *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  [(UIView *)v4 setAccessibilityIgnoresInvertColors:_AXSInvertColorsEnabledGlobalCached() != 0];
}

id sub_1EE9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

void sub_1F618(id a1)
{
}

void sub_1F6AC(uint64_t a1)
{
  id v2 = objc_alloc_init(AXInvertColorsManager);
  uint64_t v3 = (void *)qword_836B0;
  qword_836B0 = (uint64_t)v2;

  id v4 = AXLogInvertColorsLoadBundles();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_21E9C(a1, v4);
  }
}

void sub_1F8A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

id sub_1F8BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _installCategories];
}

void sub_1F8C4(id a1)
{
  id v1 = AXLogInvertColors();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_21F2C(v1);
  }

  +[AXInvertColorsManager toggleFirstLayerWindowsInvert];
  +[AXInvertColorsManager _traverseAppForInvertColors];
}

void sub_1F91C(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)sub_1FAD0, (CFStringRef)UIAccessibilityInvertColorsStatusDidChangeNotification, 0, (CFNotificationSuspensionBehavior)0);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, *(const void **)(a1 + 32), (CFNotificationCallback)sub_1FAD0, (CFStringRef)UIAccessibilityInvertColorsStatusDidChangeNotification, 0, (CFNotificationSuspensionBehavior)0);
  id v4 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v4, *(const void **)(a1 + 32), (CFNotificationCallback)sub_1FAD0, (CFStringRef)UIAccessibilityInvertColorsStatusDidChangeNotification, 0, (CFNotificationSuspensionBehavior)0);
  id v5 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = _UIWindowDidAttachContextNotification;
  uint64_t v7 = +[NSOperationQueue mainQueue];
  id v8 = [v5 addObserverForName:v6 object:0 queue:v7 usingBlock:&stru_44B58];

  long long v9 = +[NSNotificationCenter defaultCenter];
  uint64_t v10 = AXUIServerModifiedWindowInterfaceStyle;
  long long v11 = +[NSOperationQueue mainQueue];
  id v12 = [v9 addObserverForName:v10 object:0 queue:v11 usingBlock:&stru_44B78];

  v13 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v13, *(const void **)(a1 + 32), (CFNotificationCallback)sub_1FAD0, (CFStringRef)UIKeyboardWillShowNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v14 = CFNotificationCenterGetLocalCenter();
  v15 = *(const void **)(a1 + 32);
  CFStringRef v16 = (const __CFString *)_UIScreenUserInterfaceStyleDidChangeForSmartInvertNotification;

  CFNotificationCenterAddObserver(v14, v15, (CFNotificationCallback)sub_1FAD0, v16, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

uint64_t sub_1FAD0()
{
  if (CFAbsoluteTimeGetCurrent() - *(double *)&qword_836C0 < 0.3)
  {
    v0 = AXLogInvertColors();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
      sub_21F70(v0);
    }
  }
  qword_836C0 = CFAbsoluteTimeGetCurrent();
  return AXPerformBlockAsynchronouslyOnMainThread();
}

void sub_1FB48(id a1, NSNotification *a2)
{
  id v2 = AXLogInvertColors();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "New window appeared, applying IC status update", v3, 2u);
  }

  sub_1FAD0();
}

void sub_1FBB4(id a1, NSNotification *a2)
{
  id v2 = AXLogInvertColors();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "AXUIServer modified an interface style, applying IC status update", v3, 2u);
  }

  sub_1FAD0();
}

int64_t sub_1FD54(id a1, Class a2, Class a3)
{
  id v4 = +[NSNumber numberWithInteger:[(objc_class *)a3 loadPriority]];
  id v5 = +[NSNumber numberWithInteger:[(objc_class *)a2 loadPriority]];
  id v6 = [v4 compare:v5];

  return (int64_t)v6;
}

BOOL sub_201C8(id a1, CAFilter *a2, unint64_t a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = [(CAFilter *)v5 name];
  if ([v6 isEqualToString:@"InvertColorsDoubleInvert"])
  {
  }
  else
  {
    uint64_t v7 = [(CAFilter *)v5 name];
    unsigned int v8 = [v7 isEqualToString:@"UIInvertColorsDoubleInvertPrivateKey"];

    if (!v8)
    {
      BOOL v9 = 0;
      goto LABEL_6;
    }
  }
  BOOL v9 = 1;
  *a4 = 1;
LABEL_6:

  return v9;
}

void sub_20360(id a1, id a2)
{
  id v2 = a2;
  if (!+[AXInvertColorsManager objectIsOnCarScreen:](AXInvertColorsManager, "objectIsOnCarScreen:"))
  {
    [v2 _accessibilityLoadInvertColors];
    +[AXInvertColorsAppHelper toggleInvertColors:v2];
  }
}

void sub_20794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_207BC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 screen];
  unsigned __int8 v7 = [v6 _isCarScreen];

  if ((v7 & 1) == 0)
  {
    unsigned int v8 = [v5 traitCollection];
    [v8 userInterfaceStyle];
    BOOL v9 = AXInvertColorsUserInterfaceStyleDescription();

    [v5 overrideUserInterfaceStyle];
    uint64_t v10 = AXInvertColorsUserInterfaceStyleDescription();
    long long v11 = AXLogInvertColorsTraversal();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v16 = [v5 description];
      id v17 = [v16 substringToIndex:70];
      int v22 = 134219266;
      uint64_t v23 = a3;
      __int16 v24 = 2112;
      v25 = v17;
      __int16 v26 = 2112;
      v27 = v9;
      __int16 v28 = 2112;
      v29 = v10;
      __int16 v30 = 1024;
      unsigned int v31 = +[AXInvertColorsAppHelper hasInvertFilter:v5];
      __int16 v32 = 1024;
      unsigned int v33 = [v5 accessibilityIgnoresInvertColors];
      _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "\tBEFORE <- (%lu) window: %@, S: %@, OS: %@, IF: %d, IC: %d", (uint8_t *)&v22, 0x36u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = +[AXInvertColorsManager toggleDarkModeWindowInvert:v5];
    id v12 = [v5 traitCollection];
    [v12 userInterfaceStyle];
    v13 = AXInvertColorsUserInterfaceStyleDescription();

    [v5 overrideUserInterfaceStyle];
    id v14 = AXInvertColorsUserInterfaceStyleDescription();

    v15 = AXLogInvertColorsTraversal();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v18 = [v5 description];
      id v19 = [v18 substringToIndex:70];
      unsigned int v20 = +[AXInvertColorsAppHelper hasInvertFilter:v5];
      unsigned int v21 = [v5 accessibilityIgnoresInvertColors];
      int v22 = 134219266;
      uint64_t v23 = a3;
      __int16 v24 = 2112;
      v25 = v19;
      __int16 v26 = 2112;
      v27 = v13;
      __int16 v28 = 2112;
      v29 = v14;
      __int16 v30 = 1024;
      unsigned int v31 = v20;
      __int16 v32 = 1024;
      unsigned int v33 = v21;
      _os_log_debug_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "\tAFTER  -> (%lu) window: %@, S: %@, OS: %@, IF: %d, IC: %d", (uint8_t *)&v22, 0x36u);
    }
  }
}

void sub_20BE4(id a1, UIWindow *a2, unint64_t a3, BOOL *a4)
{
  id v6 = a2;
  id v4 = [(UIWindow *)v6 screen];
  unsigned __int8 v5 = [v4 _isCarScreen];

  if ((v5 & 1) == 0)
  {
    NSClassFromString(@"_UIHostedWindow");
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      +[AXInvertColorsManager toggleFirstLayerWindowInvert:v6];
    }
  }
}

void sub_21248(id a1)
{
  LocalCenter = CFNotificationCenterGetLocalCenter();

  CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)UIAccessibilityInvertColorsStatusDidChangeNotification, 0, 0, 1u);
}

void sub_21288(id a1)
{
  id v1 = AXLogInvertColors();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_22240();
  }

  id v2 = [UIApp _accessibilityValueForKey:@"AXInvertColorsTraversalTimer"];
  [v2 doubleValue];
  double v4 = v3;

  unsigned __int8 v5 = [UIApp _accessibilityValueForKey:@"AXInvertColorsDarkModePref"];
  unsigned int v6 = [v5 BOOLValue];

  unsigned __int8 v7 = [UIApp _accessibilityValueForKey:@"AXInvertColorsPref"];
  unsigned int v8 = [v7 BOOLValue];

  if (CFAbsoluteTimeGetCurrent() - v4 <= 0.5
    && v6 == AXInvertColorsIsSystemWideDarkModeEnabled()
    && _AXSInvertColorsEnabled() == v8)
  {
    BOOL v9 = AXLogInvertColors();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_221C0();
    }
  }
  else
  {
    +[AXInvertColorsManager _traverseAppForInvertColors];
    uint64_t v10 = (void *)UIApp;
    long long v11 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
    [v10 _accessibilitySetRetainedValue:v11 forKey:@"AXInvertColorsTraversalTimer"];

    id v12 = (void *)UIApp;
    BOOL v9 = +[NSNumber numberWithBool:AXInvertColorsIsSystemWideDarkModeEnabled()];
    [v12 _accessibilitySetRetainedValue:v9 forKey:@"AXInvertColorsDarkModePref"];
  }

  v13 = AXLogInvertColors();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_220F8(v13);
  }

  +[AXInvertColorsManager toggleDarkModeWindowsInvert];
  +[AXInvertColorsManager toggleFirstLayerWindowsInvert];
}

void sub_21474(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xEu);
}

void sub_218BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21928(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21994(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_21A00()
{
  uint64_t v0 = abort_report_np();
  return sub_21A28(v0);
}

void sub_21A28(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Notifying invert colors after switching tabs on %@", (uint8_t *)&v2, 0xCu);
}

void sub_21AA0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Applied dark mode image reverse filter: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21B18(uint64_t a1, NSObject *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = 138412290;
  id v5 = WeakRetained;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Not retrying js for %@, too soon", (uint8_t *)&v4, 0xCu);
}

void sub_21BB4(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  int v2 = [WeakRetained URL];
  sub_171B8();
  sub_171D0(&dword_0, v3, v4, "Successful js: WKWebView %@ (%@) Supports dark mode", v5, v6, v7, v8, v9);
}

void sub_21C4C(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  int v2 = [WeakRetained URL];
  sub_171B8();
  sub_171D0(&dword_0, v3, v4, "Successful js: WKWebView %@ (%@) Supports dark mode not supported, applying filter", v5, v6, v7, v8, v9);
}

void sub_21CE4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Applied dark mode image reinstate filter: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21D5C(void *a1)
{
  id v1 = [a1 URL];
  int v2 = [v1 absoluteString];
  sub_171B8();
  sub_171D0(&dword_0, v3, v4, "_didFinishLoadForMainFrame: %@ (%@)", v5, v6, v7, v8, v9);
}

void sub_21DFC(void *a1)
{
  id v1 = [a1 URL];
  int v2 = [v1 absoluteString];
  sub_171B8();
  sub_171D0(&dword_0, v3, v4, "_didFinishNavigation: %@ (%@)", v5, v6, v7, v8, v9);
}

void sub_21E9C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412546;
  uint64_t v4 = qword_836B0;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Created AXInvertColorsManager %@ in %@", (uint8_t *)&v3, 0x16u);
}

void sub_21F2C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Undoing double invert filters now", v1, 2u);
}

void sub_21F70(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Ignoring IC status change: too soon", v1, 2u);
}

void sub_21FB4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_22020(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2208C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_220F8(NSObject *a1)
{
  uint64_t v2 = +[NSBundle mainBundle];
  int v3 = [v2 bundleIdentifier];
  int v4 = 138412546;
  __int16 v5 = v3;
  __int16 v6 = 1024;
  int IsSystemWideDarkModeEnabled = AXInvertColorsIsSystemWideDarkModeEnabled();
  _os_log_debug_impl(&dword_0, a1, OS_LOG_TYPE_DEBUG, "Applying or removing invert at window level, %@, dark mode: %d", (uint8_t *)&v4, 0x12u);
}

void sub_221C0()
{
  AXInvertColorsIsSystemWideDarkModeEnabled();
  _AXSInvertColorsEnabled();
  sub_2145C();
  sub_21474(&dword_0, v0, v1, "Ignoring, too soon for traversal dark mode: %d, IC: %d\n", v2, v3, v4, v5, v6);
}

void sub_22240()
{
  AXInvertColorsIsSystemWideDarkModeEnabled();
  _AXSInvertColorsEnabled();
  sub_2145C();
  sub_21474(&dword_0, v0, v1, "*** Color change/KB notification:, dark mode: %d, IC: %d\n", v2, v3, v4, v5, v6);
}

uint64_t AXApplicationIsViewService()
{
  return _AXApplicationIsViewService();
}

uint64_t AXColorGetLuma()
{
  return _AXColorGetLuma();
}

uint64_t AXColorizeFormatLog()
{
  return _AXColorizeFormatLog();
}

uint64_t AXColorsProbablyEqual()
{
  return _AXColorsProbablyEqual();
}

uint64_t AXDeviceIsPad()
{
  return _AXDeviceIsPad();
}

uint64_t AXInvertColorForColorPreservingAlpha()
{
  return _AXInvertColorForColorPreservingAlpha();
}

uint64_t AXInvertColorsDarkModeDetectionJavascript()
{
  return _AXInvertColorsDarkModeDetectionJavascript();
}

uint64_t AXInvertColorsIsSystemWideDarkModeEnabled()
{
  return _AXInvertColorsIsSystemWideDarkModeEnabled();
}

uint64_t AXInvertColorsUserInterfaceStyleDescription()
{
  return _AXInvertColorsUserInterfaceStyleDescription();
}

uint64_t AXLanguageIsSpeakableEmojiString()
{
  return _AXLanguageIsSpeakableEmojiString();
}

uint64_t AXLogInvertColors()
{
  return _AXLogInvertColors();
}

uint64_t AXLogInvertColorsLoadBundles()
{
  return _AXLogInvertColorsLoadBundles();
}

uint64_t AXLogInvertColorsTraversal()
{
  return _AXLogInvertColorsTraversal();
}

uint64_t AXLoggerForFacility()
{
  return _AXLoggerForFacility();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return _AXOSLogLevelFromAXLogLevel();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return _AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t AXPerformSafeBlock()
{
  return _AXPerformSafeBlock();
}

uint64_t AXProcessIsInCallService()
{
  return _AXProcessIsInCallService();
}

uint64_t AXProcessIsSpotlight()
{
  return _AXProcessIsSpotlight();
}

uint64_t AXProcessIsSpringBoard()
{
  return _AXProcessIsSpringBoard();
}

uint64_t AXSafeClassFromString()
{
  return _AXSafeClassFromString();
}

uint64_t AXUIApplicationWindows()
{
  return _AXUIApplicationWindows();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return _UIAccessibilityIsInvertColorsEnabled();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return _UIAccessibilityIsReduceTransparencyEnabled();
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

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXSClassicInvertColorsEnabled()
{
  return __AXSClassicInvertColorsEnabled();
}

uint64_t _AXSInvertColorsEnabled()
{
  return __AXSInvertColorsEnabled();
}

uint64_t _AXSInvertColorsEnabledAppCached()
{
  return __AXSInvertColorsEnabledAppCached();
}

uint64_t _AXSInvertColorsEnabledGlobalCached()
{
  return __AXSInvertColorsEnabledGlobalCached();
}

uint64_t _AXStringForArgs()
{
  return __AXStringForArgs();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MKMapTypeForCartographicConfiguration()
{
  return __MKMapTypeForCartographicConfiguration();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilityCastAsClass()
{
  return ___UIAccessibilityCastAsClass();
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

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
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

const char **__cdecl objc_copyClassNamesForImage(const char *image, unsigned int *outCount)
{
  return _objc_copyClassNamesForImage(image, outCount);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__accessibilityAppliesInvertColors(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityAppliesInvertColors];
}

id objc_msgSend__accessibilityAppliesInvertColorsInDarkUI(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityAppliesInvertColorsInDarkUI];
}

id objc_msgSend__accessibilityApplyInvertFilter(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityApplyInvertFilter];
}

id objc_msgSend__accessibilityBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityBackgroundColor];
}

id objc_msgSend__accessibilityFindImageViews(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityFindImageViews];
}

id objc_msgSend__accessibilityInvertColorAdditionalVisitors(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityInvertColorAdditionalVisitors];
}

id objc_msgSend__accessibilityInvertColorsActsAsDarkWindowBlock(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityInvertColorsActsAsDarkWindowBlock];
}

id objc_msgSend__accessibilityInvertColorsIsDarkWindow(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityInvertColorsIsDarkWindow];
}

id objc_msgSend__accessibilityInvertColorsIsInHostedDarkWindow(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityInvertColorsIsInHostedDarkWindow];
}

id objc_msgSend__accessibilityInvertColorsSupportsDarkWindowInvert(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityInvertColorsSupportsDarkWindowInvert];
}

id objc_msgSend__accessibilityInvertColorsSupportsDarkWindowInvertBlock(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityInvertColorsSupportsDarkWindowInvertBlock];
}

id objc_msgSend__accessibilityInvertEnabled(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityInvertEnabled];
}

id objc_msgSend__accessibilityLoadInvertColors(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityLoadInvertColors];
}

id objc_msgSend__accessibilityLoadInvertColorsMostUsed(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityLoadInvertColorsMostUsed];
}

id objc_msgSend__accessibilityMaskViewColor(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityMaskViewColor];
}

id objc_msgSend__accessibilityShouldInvertKey(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityShouldInvertKey];
}

id objc_msgSend__accessibilitySubclassSupportsDarkMode(void *a1, const char *a2, ...)
{
  return [a1 _accessibilitySubclassSupportsDarkMode];
}

id objc_msgSend__accessibilityTintViewColor(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityTintViewColor];
}

id objc_msgSend__accessibilityWindowHasInvertedApps(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityWindowHasInvertedApps];
}

id objc_msgSend__axGetOriginalColor(void *a1, const char *a2, ...)
{
  return [a1 _axGetOriginalColor];
}

id objc_msgSend__axIgnoreNextAttributedText(void *a1, const char *a2, ...)
{
  return [a1 _axIgnoreNextAttributedText];
}

id objc_msgSend__axIsBigEmoji(void *a1, const char *a2, ...)
{
  return [a1 _axIsBigEmoji];
}

id objc_msgSend__axIsBoltShowing(void *a1, const char *a2, ...)
{
  return [a1 _axIsBoltShowing];
}

id objc_msgSend__axIsMessageGray(void *a1, const char *a2, ...)
{
  return [a1 _axIsMessageGray];
}

id objc_msgSend__axRefreshInvertColors(void *a1, const char *a2, ...)
{
  return [a1 _axRefreshInvertColors];
}

id objc_msgSend__continuousCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 _continuousCornerRadius];
}

id objc_msgSend__initializeOverrides(void *a1, const char *a2, ...)
{
  return [a1 _initializeOverrides];
}

id objc_msgSend__installUIKitCategories(void *a1, const char *a2, ...)
{
  return [a1 _installUIKitCategories];
}

id objc_msgSend__invertColorHelperClasses(void *a1, const char *a2, ...)
{
  return [a1 _invertColorHelperClasses];
}

id objc_msgSend__isCarScreen(void *a1, const char *a2, ...)
{
  return [a1 _isCarScreen];
}

id objc_msgSend__isClassic(void *a1, const char *a2, ...)
{
  return [a1 _isClassic];
}

id objc_msgSend__shouldInstallCategories(void *a1, const char *a2, ...)
{
  return [a1 _shouldInstallCategories];
}

id objc_msgSend__traverseAppForInvertColors(void *a1, const char *a2, ...)
{
  return [a1 _traverseAppForInvertColors];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessibilityAppliesInvertColorsInDarkUI(void *a1, const char *a2, ...)
{
  return [a1 accessibilityAppliesInvertColorsInDarkUI];
}

id objc_msgSend_accessibilityIgnoreInvertIfDarkBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 accessibilityIgnoreInvertIfDarkBackgroundColor];
}

id objc_msgSend_accessibilityIgnoresInvertColors(void *a1, const char *a2, ...)
{
  return [a1 accessibilityIgnoresInvertColors];
}

id objc_msgSend_accessibilityInvertColorsIsolatedTree(void *a1, const char *a2, ...)
{
  return [a1 accessibilityInvertColorsIsolatedTree];
}

id objc_msgSend_accessibilityInvertEnabledOverride(void *a1, const char *a2, ...)
{
  return [a1 accessibilityInvertEnabledOverride];
}

id objc_msgSend_accessibilityMaterialViewMimicsReduceTransparency(void *a1, const char *a2, ...)
{
  return [a1 accessibilityMaterialViewMimicsReduceTransparency];
}

id objc_msgSend_accessibilityVisualEffectHandleBackdrop(void *a1, const char *a2, ...)
{
  return [a1 accessibilityVisualEffectHandleBackdrop];
}

id objc_msgSend_activeInstance(void *a1, const char *a2, ...)
{
  return [a1 activeInstance];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return [a1 attributedText];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_backgroundStyle(void *a1, const char *a2, ...)
{
  return [a1 backgroundStyle];
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return [a1 batteryState];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleName(void *a1, const char *a2, ...)
{
  return [a1 bundleName];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_classicInvertColors(void *a1, const char *a2, ...)
{
  return [a1 classicInvertColors];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_darkGrayColor(void *a1, const char *a2, ...)
{
  return [a1 darkGrayColor];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_evaluateExistingBinaries(void *a1, const char *a2, ...)
{
  return [a1 evaluateExistingBinaries];
}

id objc_msgSend_executablePath(void *a1, const char *a2, ...)
{
  return [a1 executablePath];
}

id objc_msgSend_filters(void *a1, const char *a2, ...)
{
  return [a1 filters];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_helperType(void *a1, const char *a2, ...)
{
  return [a1 helperType];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreLogging(void *a1, const char *a2, ...)
{
  return [a1 ignoreLogging];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initializeOverrides(void *a1, const char *a2, ...)
{
  return [a1 initializeOverrides];
}

id objc_msgSend_initializeOverridesImmediately(void *a1, const char *a2, ...)
{
  return [a1 initializeOverridesImmediately];
}

id objc_msgSend_initializedOverrides(void *a1, const char *a2, ...)
{
  return [a1 initializedOverrides];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isBatteryMonitoringEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBatteryMonitoringEnabled];
}

id objc_msgSend_isDarkModeActive(void *a1, const char *a2, ...)
{
  return [a1 isDarkModeActive];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
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

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return [a1 lightGrayColor];
}

id objc_msgSend_loadPriority(void *a1, const char *a2, ...)
{
  return [a1 loadPriority];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return [a1 opacity];
}

id objc_msgSend_overrideUserInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 overrideUserInterfaceStyle];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return [a1 sublayers];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return [a1 superlayer];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return [a1 textColor];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_toggleDarkModeWindowsInvert(void *a1, const char *a2, ...)
{
  return [a1 toggleDarkModeWindowsInvert];
}

id objc_msgSend_toggleFirstLayerWindowsInvert(void *a1, const char *a2, ...)
{
  return [a1 toggleFirstLayerWindowsInvert];
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

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}