id AXMobileMailGetSelectedMessageCellElement()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t vars8;

  v0 = [MEMORY[0x263F1C408] sharedApplication];
  NSClassFromString(&cfstr_Mailappcontrol_0.isa);
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v1 = [v0 safeValueForKey:@"masterNavigationController"];
    v2 = __UIAccessibilityCastAsClass();

    v3 = [v2 visibleViewController];
    NSClassFromString(&cfstr_Messagelistvie_0.isa);
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      v4 = [v3 safeValueForKey:@"collectionView"];
      v5 = __UIAccessibilityCastAsClass();

      v6 = [v5 indexPathsForSelectedItems];
      v7 = [v6 firstObject];

      if (v7)
      {
        v8 = [v5 cellForItemAtIndexPath:v7];
        v9 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
        [v9 setLeafNodePredicate:&__block_literal_global_549];
        v10 = [v8 _accessibilityLeafDescendantsWithCount:1 options:v9];
        v11 = [v10 firstObject];
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __AXMobileMailGetSelectedMessageCellElement_block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

void sub_2422B5628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_2422B5884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2422B5F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2422B692C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2422B6C8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2422B7124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2422B8398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2422B8EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2422B9E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
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

void sub_2422BABB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2422BC0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_2422BD8F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
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

void sub_2422BDF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2422BF020(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
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

void sub_2422BF3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2422BF9B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_2422C0A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_2422C0DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2422C10F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2422C1E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_2422C2504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2422C2990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MobileMail.axbundle"],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F7103B8 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilitySubstituteReadPhonemeInString(uint64_t a1)
{
  id v1 = [MEMORY[0x263F21660] axAttributedStringWithString:a1];
  [v1 setAttribute:&unk_26F714C88 forKey:*MEMORY[0x263F21628]];

  return v1;
}

id accessibilityLabelForFlagColor(void *a1)
{
  id v1 = a1;
  v2 = [MEMORY[0x263F1C550] systemYellowColor];
  int v3 = [v1 isEqual:v2];

  if (v3)
  {
    v4 = @"flag.color.yellow";
LABEL_15:
    uint64_t v17 = accessibilityLocalizedString(v4);
    goto LABEL_16;
  }
  v5 = [MEMORY[0x263F1C550] systemBlueColor];
  int v6 = [v1 isEqual:v5];

  if (v6)
  {
    v4 = @"flag.color.blue";
    goto LABEL_15;
  }
  v7 = [MEMORY[0x263F1C550] systemRedColor];
  int v8 = [v1 isEqual:v7];

  if (v8)
  {
    v4 = @"flag.color.red";
    goto LABEL_15;
  }
  uint64_t v9 = [MEMORY[0x263F1C550] systemOrangeColor];
  int v10 = [v1 isEqual:v9];

  if (v10)
  {
    v4 = @"flag.color.orange";
    goto LABEL_15;
  }
  v11 = [MEMORY[0x263F1C550] systemGrayColor];
  int v12 = [v1 isEqual:v11];

  if (v12)
  {
    v4 = @"flag.color.gray";
    goto LABEL_15;
  }
  v13 = [MEMORY[0x263F1C550] systemPurpleColor];
  int v14 = [v1 isEqual:v13];

  if (v14)
  {
    v4 = @"flag.color.purple";
    goto LABEL_15;
  }
  v15 = [MEMORY[0x263F1C550] systemGreenColor];
  int v16 = [v1 isEqual:v15];

  if (v16)
  {
    v4 = @"flag.color.green";
    goto LABEL_15;
  }
  uint64_t v17 = AXColorStringForColor();
LABEL_16:
  v18 = (void *)v17;

  return v18;
}

id accessibilityApproximateVisibleSummaryText(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  v5 = [v3 _accessibilityValueForKey:@"ApproximateVisibleSummary"];
  id v20 = v5;
  int v6 = v16;
  if (v16[5])
  {
    v7 = __accessibilityApproximateVisibleSummaryText_block_invoke((uint64_t)v5, v4);
    char v8 = [v7 hasPrefix:v16[5]];

    int v6 = v16;
    if ((v8 & 1) == 0)
    {
      uint64_t v9 = (void *)v16[5];
      v16[5] = 0;

      int v6 = v16;
    }
  }
  int v10 = (void *)v6[5];
  if (!v10)
  {
    id v14 = v4;
    AXPerformSafeBlock();
    uint64_t v11 = v16[5];
    if (v11) {
      [v3 _accessibilitySetRetainedValue:v11 forKey:@"ApproximateVisibleSummary"];
    }

    int v10 = (void *)v16[5];
  }
  id v12 = v10;
  _Block_object_dispose(&v15, 8);

  return v12;
}

void sub_2422C3218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __accessibilityApproximateVisibleSummaryText_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 attributedText];
  id v4 = [v3 string];

  if (!v4)
  {
    id v4 = [v2 text];
  }

  return v4;
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

void __accessibilityApproximateVisibleSummaryText_block_invoke_326(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if ([v12 length])
  {
    id v2 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
    id v3 = [NSDictionary dictionaryWithObject:v2 forKey:*MEMORY[0x263F1C238]];
    CFAttributedStringRef v4 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v12 attributes:v3];
    v5 = CTFramesetterCreateWithAttributedString(v4);

    [*(id *)(a1 + 32) bounds];
    int v6 = CGPathCreateWithRect(v15, 0);
    v14.length = [v12 length];
    v14.location = 0;
    Frame = CTFramesetterCreateFrame(v5, v14, v6, 0);
    CFRange VisibleStringRange = CTFrameGetVisibleStringRange(Frame);
    CFRelease(Frame);
    CFRelease(v6);
    CFRelease(v5);
    if (VisibleStringRange.location != -1)
    {
      uint64_t v9 = objc_msgSend(v12, "substringWithRange:", VisibleStringRange.location, VisibleStringRange.length);
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
}

void sub_2422C3F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_2422C4508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x270F09D40]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F091E0]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F09240]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x270F09248]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x270F092A0]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
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

void CFRelease(CFTypeRef cf)
{
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7058](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CFRange CTFrameGetVisibleStringRange(CTFrameRef frame)
{
  CFIndex v1 = MEMORY[0x270EE9D30](frame);
  result.length = v2;
  result.location = v1;
  return result;
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x270EE9D38](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x270EE9D40](attrString);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t UIAXArrayForString()
{
  return MEMORY[0x270F808D0]();
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x270F808F8]();
}

uint64_t UIAXStringForAllChildren()
{
  return MEMORY[0x270F80938]();
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

UIBezierPath *__cdecl UIAccessibilityConvertPathToScreenCoordinates(UIBezierPath *path, UIView *view)
{
  return (UIBezierPath *)MEMORY[0x270F05EE0](path, view);
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
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

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x270F90600]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIAccessibilityCustomActionDeleteImage()
{
  return MEMORY[0x270F80A98]();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}