id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F7A5C28 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityLabelForUsageItems(void *a1)
{
  return accessibilityLabelForUsageItemsOverridingUsages(a1, 0, 1);
}

id accessibilityLabelForUsageItemsOverridingUsages(void *a1, void *a2, char a3)
{
  id v5 = a2;
  v6 = [a1 axFilterObjectsUsingBlock:&__block_literal_global_375];
  v7 = objc_opt_new();
  if (![v6 count]) {
    goto LABEL_27;
  }
  uint64_t v38 = 0;
  char v37 = 0;
  unint64_t v8 = 0;
  v9 = @"itemType";
  char v39 = a3;
  do
  {
    v10 = [v6 objectAtIndexedSubscript:v8];
    if (v5)
    {
      v11 = [v5 objectAtIndexedSubscript:v8];
      if (a3) {
        goto LABEL_8;
      }
    }
    else
    {
      objc_opt_class();
      v12 = [v10 safeValueForKey:@"totalUsage"];
      v11 = __UIAccessibilityCastAsClass();

      if (a3) {
        goto LABEL_8;
      }
    }
    [v11 doubleValue];
    if (v13 == 0.0) {
      goto LABEL_24;
    }
LABEL_8:
    uint64_t v14 = [v10 safeUnsignedIntegerForKey:v9];
    if (v14 == 6)
    {
      v19 = NSString;
      v20 = accessibilityLocalizedString(@"pickups.count.format");
      v17 = objc_msgSend(v19, "stringWithFormat:", v20, objc_msgSend(v11, "unsignedIntegerValue"));

      [v7 axSafelyAddObject:v17];
LABEL_15:

      goto LABEL_24;
    }
    if (v14 == 5)
    {
      v15 = [v10 safeValueForKey:@"displayName"];

      if (v15)
      {
        v16 = [v10 safeValueForKey:@"displayName"];
        v17 = v16;
        if (v16 && v11)
        {
          v18 = accessibilityLabelForNotificationsCount(v16, v11, (v37 & 1) == 0);
          [v7 addObject:v18];

          char v37 = 1;
        }
        goto LABEL_15;
      }
      v38 += [v11 unsignedIntegerValue];
    }
    else
    {
      v21 = v9;
      v22 = [v10 safeValueForKey:@"displayName"];
      v23 = v22;
      if (v22)
      {
        id v24 = v22;
      }
      else
      {
        accessibilityLocalizedString(@"unknown.item");
        id v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v25 = v24;

      [v7 axSafelyAddObject:v25];
      objc_opt_class();
      v26 = __UIAccessibilityCastAsClass();
      v27 = v26;
      if (v26)
      {
        [v26 doubleValue];
        double v29 = v28;
        [v27 doubleValue];
        v31 = MEMORY[0x24565EF70](v30 < 60.0, v29);
      }
      else
      {
        v31 = 0;
      }
      [v7 axSafelyAddObject:v31];

      v9 = v21;
      a3 = v39;
    }
LABEL_24:

    ++v8;
  }
  while (v8 < [v6 count]);
  if (v38)
  {
    v32 = accessibilityLocalizedString(@"unknown.notification.senders");
    v33 = [NSNumber numberWithUnsignedInteger:v38];
    v34 = accessibilityLabelForNotificationsCount(v32, v33, (v37 & 1) == 0);
    [v7 addObject:v34];
  }
LABEL_27:
  v35 = AXLabelForElements();

  return v35;
}

BOOL __accessibilityLabelForUsageItemsOverridingUsages_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = __UIAccessibilitySafeClass();
  BOOL v4 = v3 != 0;

  return v4;
}

id accessibilityLabelForNotificationsCount(void *a1, void *a2, int a3)
{
  if (a3)
  {
    BOOL v4 = NSString;
    id v5 = a2;
    id v6 = a1;
    accessibilityLocalizedString(@"notifications.count.format");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v5 unsignedIntegerValue];

    objc_msgSend(v4, "stringWithFormat:", v7, v8);
  }
  else
  {
    id v7 = a2;
    id v9 = a1;
    AXFormatNumber();
  v10 = };

  v11 = NSString;
  v12 = accessibilityLocalizedString(@"notification.origination");
  double v13 = objc_msgSend(v11, "stringWithFormat:", v12, v10, a1);

  return v13;
}

void sub_2424C9E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2424CB46C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2424CB710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2424CB958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2424CCB54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2424CD888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v24 - 88));
  _Unwind_Resume(a1);
}

void sub_2424CDA28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2424CEA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
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

uint64_t AXClockTimeStringForDate()
{
  return MEMORY[0x270F09F18]();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x270F09F50]();
}

uint64_t AXDurationStringForDurationWithSeconds()
{
  return MEMORY[0x270F0A0B0]();
}

uint64_t AXFormatNumber()
{
  return MEMORY[0x270F0A118]();
}

uint64_t AXLabelForElements()
{
  return MEMORY[0x270F09810]();
}

uint64_t AXLocStringKeyForModel()
{
  return MEMORY[0x270F0A190]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
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
  return MEMORY[0x270F0A418]();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x270F0A428]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
}

void abort(void)
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}