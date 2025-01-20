double AXScaledSliderValues(double a1, double a2, double a3, double a4)
{
  BOOL v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v12;

  v4 = a4 == a2 || a4 == a3;
  if (v4 || ((v5 = vabdd_f64(a4, a2), v6 = vabdd_f64(a3, a4), a4 + a4 == a3) ? (v7 = v5 == v6) : (v7 = 0), v7))
  {
    if (a3 > a2) {
      return (a1 - a2) / (a3 - a2) + 0.0;
    }
    return 2.22507386e-308;
  }
  v8 = 0.0;
  if (a4 <= a2) {
    return v8;
  }
  if (a3 <= a2) {
    return 2.22507386e-308;
  }
  if (a1 >= a4)
  {
    if (a3 > a4)
    {
      v9 = (a1 - a4) / (a3 - a4);
      v10 = 0.0;
      goto LABEL_20;
    }
  }
  else if (a4 > a2)
  {
    v9 = (a1 - a2) / (a4 - a2);
    v10 = -1.0;
LABEL_20:
    v12 = v9 + v10;
    goto LABEL_22;
  }
  v12 = 2.22507386e-308;
LABEL_22:
  if (round(v12 * 100.0) / 100.0 == 0.0) {
    return 0.0;
  }
  else {
    return v12;
  }
}

double AXScaleSymmetricSliderValuesBetween(double a1, double a2, double a3, double a4, double a5)
{
  if (a3 <= a2) {
    return 2.22507386e-308;
  }
  else {
    return (a1 - a2) * (a5 - a4) / (a3 - a2) + a4;
  }
}

double AXScaleAsymmetricSliderValuesBetween(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  if (a4 <= a2) {
    return 2.22507386e-308;
  }
  if (a1 >= a3)
  {
    if (a4 > a3)
    {
      double result = (a1 - a3) * (a7 - a6) / (a4 - a3) + a6;
      goto LABEL_9;
    }
  }
  else if (a3 > a2)
  {
    double result = (a1 - a2) * (a6 - a5) / (a3 - a2) + a5;
    goto LABEL_9;
  }
  double result = 2.22507386e-308;
LABEL_9:
  if (round(result * 100.0) / 100.0 == 0.0) {
    return 0.0;
  }
  return result;
}

id accessibilityPULocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityPULocalizedString_axBundle;
  if (accessibilityPULocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityPULocalizedString_axBundle,
        accessibilityPULocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityPULocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F42F3E0 table:@"PhotosUIAccessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityPhotosFrameworkLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityPhotosFrameworkLocalizedString_axBundle;
  if (accessibilityPhotosFrameworkLocalizedString_axBundle) {
    goto LABEL_3;
  }
  uint64_t v3 = (void *)MEMORY[0x263F086E0];
  v4 = AXAccessibilityBundlesDirectory();
  v5 = [v4 stringByAppendingPathComponent:@"PhotosFramework.axbundle"];
  uint64_t v6 = [v3 bundleWithPath:v5];
  v7 = (void *)accessibilityPhotosFrameworkLocalizedString_axBundle;
  accessibilityPhotosFrameworkLocalizedString_axBundle = v6;

  v2 = (void *)accessibilityPhotosFrameworkLocalizedString_axBundle;
  if (accessibilityPhotosFrameworkLocalizedString_axBundle)
  {
LABEL_3:
    v8 = [v2 localizedStringForKey:v1 value:&stru_26F42F3E0 table:@"PhotosFrameworkStrings"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id AXScrollStatusForBrowsingSession(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = [v3 safeValueForKey:@"viewModel"];
  uint64_t v6 = [v5 safeValueForKey:@"assetsDataSource"];
  v7 = [v5 safeValueForKey:@"currentAssetReference"];
  LOBYTE(v33) = 0;
  objc_opt_class();
  v8 = [v7 safeValueForKey:@"indexPath"];
  v9 = __UIAccessibilityCastAsClass();

  v20 = v3;
  uint64_t v10 = objc_msgSend(v9, "indexAtPosition:", objc_msgSend(v9, "length") - 1);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = __AXScrollStatusForBrowsingSession_block_invoke;
  v29 = &unk_2650A7CC0;
  id v30 = v6;
  id v11 = v9;
  id v31 = v11;
  v32 = &v33;
  AXPerformSafeBlock();
  uint64_t v12 = v34[3];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  id v21 = v30;
  AXPerformSafeBlock();
  uint64_t v13 = v23[3];

  _Block_object_dispose(&v22, 8);
  v14 = NSString;
  v15 = accessibilityPULocalizedString(@"photo.scrubber.value.format");
  v16 = MEMORY[0x2455E4370](v10 + v12 + 1);
  v17 = MEMORY[0x2455E4370](v13);
  v18 = objc_msgSend(v14, "stringWithFormat:", v15, v4, v16, v17);

  _Block_object_dispose(&v33, 8);

  return v18;
}

void sub_240247ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 136), 8);
  _Unwind_Resume(a1);
}

void __AXScrollStatusForBrowsingSession_block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __AXScrollStatusForBrowsingSession_block_invoke_2;
  v6[3] = &unk_2650A7C98;
  id v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 enumerateIndexPathsStartingAtIndexPath:v2 reverseDirection:0 usingBlock:v6];
}

uint64_t __AXScrollStatusForBrowsingSession_block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 section];
  uint64_t result = [*(id *)(a1 + 32) section];
  if (v5 == result) {
    *a3 = 1;
  }
  else {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

uint64_t __AXScrollStatusForBrowsingSession_block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) numberOfAssetsWithMaximum:0x7FFFFFFFFFFFFFFFLL];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_240247F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_240248198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24024899C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_240248B74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_24024A360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_24024A9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_24024AB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24024D308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_24024D82C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_24024FA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_24024FC40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_240252090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *a10, id *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  objc_destroyWeak(v29);
  objc_destroyWeak(v32);
  objc_destroyWeak(&a29);
  objc_destroyWeak(v31);
  objc_destroyWeak(a9);
  objc_destroyWeak((id *)(v33 - 224));
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)(v33 - 128));
  _Unwind_Resume(a1);
}

void sub_2402528EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(v20);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_240252FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_240253A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_2402549D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_2402565C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240256878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240256ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_240257AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_240257E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24025A44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  objc_destroyWeak(v28);
  objc_destroyWeak((id *)(v29 - 144));
  _Unwind_Resume(a1);
}

void sub_24025A4C0()
{
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x270F09138]();
}

uint64_t AXDeviceIsTallPhoneIdiom()
{
  return MEMORY[0x270F09210]();
}

uint64_t AXFormatFloat()
{
  return MEMORY[0x270F09238]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F09430]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F09460]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F09540]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t UIAXFormatInteger()
{
  return MEMORY[0x270F808E0]();
}

uint64_t UIAXTimeStringForDuration()
{
  return MEMORY[0x270F80940]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  MEMORY[0x270F05ED8](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x270F80998]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F05F48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

uint64_t UIAccessibilityMetadataDescriptionForImage()
{
  return MEMORY[0x270F097E0]();
}

uint64_t UIAccessibilityMetadataDescriptionForVideo()
{
  return MEMORY[0x270F097E8]();
}

uint64_t UIAccessibilityPointForPoint()
{
  return MEMORY[0x270F809D8]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAccessibilitySpeak()
{
  return MEMORY[0x270F80A08]();
}

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x270F80A10]();
}

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x270F80A40]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F095D8]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x270F095E8]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x270F90600]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x270F099D8]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F09600]();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x270F09610]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F09658]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F09670]();
}

void abort(void)
{
}

uint64_t accessibilityUIKitLocalizedString()
{
  return MEMORY[0x270F80B08]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}