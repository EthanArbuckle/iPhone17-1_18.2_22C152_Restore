id accessibilityLocalizedString(void *a1)
{
  return accessibilityLocalizedStringFromTable(a1, @"Accessibility");
}

id accessibilityLocalizedStringFromTable(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = (void *)accessibilityLocalizedStringFromTable_axBundle;
  if (accessibilityLocalizedStringFromTable_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v7 = (void *)accessibilityLocalizedStringFromTable_axBundle,
        accessibilityLocalizedStringFromTable_axBundle = v6,
        v7,
        (v5 = (void *)accessibilityLocalizedStringFromTable_axBundle) != 0))
  {
    v8 = [v5 localizedStringForKey:v3 value:&stru_26F6BBCE0 table:v4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

__CFString *accessibiityStringForBloodType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7)
  {
    v2 = &stru_26F6BBCE0;
  }
  else
  {
    accessibilityLocalizedStringFromTable(off_265125D50[a1 - 1], @"Accessibility");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void AXMoveFocusToPicker(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  _UIAccessibilityBlockPostingOfNotification();
  v4[2](v4);

  v3[2](v3);
  id argument = (id)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument);
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __AXMoveFocusToPicker_block_invoke()
{
  return MEMORY[0x270F80AE8](*MEMORY[0x263F812B8]);
}

id AXBloodTypeStringFromString(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 lowercaseString];
  v5 = [v3 lowercaseString];

  uint64_t v6 = AXIsBloodTypeString_onceToken;
  id v7 = v5;
  if (v6 != -1) {
    dispatch_once(&AXIsBloodTypeString_onceToken, &__block_literal_global_445);
  }
  int v8 = [(id)AXIsBloodTypeString_BloodTypes containsObject:v7];

  id v9 = 0;
  if (v8 && v7 && v4)
  {
    unint64_t v10 = [v4 length];
    if (v10 >= [v7 length])
    {
      v11 = [MEMORY[0x263F21660] axAttributedStringWithString:v4];
      uint64_t v12 = [v11 rangeOfString:v7];
      if (v13 >= 2)
      {
        objc_msgSend(v11, "setAttribute:forKey:withRange:", MEMORY[0x263EFFA88], *MEMORY[0x263F217C8], v12, v13 - 1);
        uint64_t v14 = [v4 rangeOfString:@"-" options:4];
        if (v15) {
          objc_msgSend(v11, "setAttribute:forKey:withRange:", @"BloodType", *MEMORY[0x263F216C8], v14, v15);
        }
        id v9 = v11;
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

__CFString *AXStringFromTimeScope(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return off_265125D90[a1];
  }
}

id AXLocalizedStringFromTimeScope(unint64_t a1)
{
  if (a1 > 7) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = off_265125D90[a1];
  }
  return accessibilityLocalizedStringFromTable(v1, @"Accessibility");
}

id accessibilityYodelLocalizedString(void *a1)
{
  return accessibilityLocalizedStringFromTable(a1, @"Accessibility-Yodel");
}

uint64_t __AXIsBloodTypeString_block_invoke()
{
  AXIsBloodTypeString_BloodTypes = [MEMORY[0x263EFFA08] setWithArray:&unk_26F6C04D0];

  return MEMORY[0x270F9A758]();
}

void sub_24219D688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_24219E050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_24219F18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24219F9CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2421A1FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_2421A308C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
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

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x270F09F50]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F0A258]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x270F808F8]();
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x270F80998]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIAccessibilityBlockPostingOfNotification()
{
  return MEMORY[0x270F80A90]();
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
  return MEMORY[0x270F0A418]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F0A468]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}