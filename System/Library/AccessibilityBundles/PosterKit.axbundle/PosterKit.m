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
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F781388 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_2424421F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, id *a14, id *a15)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(v21);
  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak((id *)(v22 - 112));
  _Unwind_Resume(a1);
}

void sub_24244267C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_24244285C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_242442920(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_242442D4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_242442F2C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_242442FF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_242443FE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_2424441D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_242444BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_242445FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_2424463F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AXWidgetFamilyType(void *a1)
{
  unint64_t v1 = [a1 safeIntegerForKey:@"family"] - 10;
  if (v1 > 2)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = accessibilityLocalizedString(off_265146060[v1]);
  }

  return v2;
}

id AXWidgetAndAppName(void *a1, int a2)
{
  id v3 = a1;
  v4 = [v3 safeValueForKey:@"extensionIdentity"];
  v5 = [v4 safeStringForKey:@"containerBundleIdentifier"];
  v6 = AXAppNameForBundleId();

  if (a2) {
    v7 = @"editing.wrapper.inline.complication.label";
  }
  else {
    v7 = @"editing.wrapper.grouped.complication.label";
  }
  v8 = accessibilityLocalizedString(v7);
  v9 = [v3 safeStringForKey:@"displayName"];

  v12 = AXCFormattedString();
  v10 = __UIAXStringForVariables();

  return v10;
}

id AXWidgetDescription(void *a1)
{
  unint64_t v1 = [a1 safeStringForKey:@"widgetDescription"];
  if ([v1 length])
  {
    uint64_t v2 = (void *)MEMORY[0x263EFABD0];
    id v3 = accessibilityLocalizedString(@"widget.description");
    v4 = [v2 customContentWithLabel:v3 value:v1];

    [v4 setImportance:1];
    v5 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t AXIsWidgetConfigurable(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v1 = [a1 safeValueForKey:@"intent"];
  if (v1)
  {
    NSClassFromString(&cfstr_Inappintent.isa);
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = 1;
    }
    else
    {
      id v3 = [v1 safeValueForKey:@"_codableDescription"];
      v4 = [v3 safeDictionaryForKey:@"attributes"];
      v5 = [v4 allValues];

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "safeBoolForKey:", @"isConfigurable", (void)v12))
            {
              uint64_t v2 = 1;
              goto LABEL_15;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
      uint64_t v2 = 0;
LABEL_15:
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id AXRemoveWidgetLabel(void *a1)
{
  id v1 = a1;
  uint64_t v2 = accessibilityLocalizedString(@"editing.minus.close.box.button.label");
  id v3 = AXWidgetAndAppName(v1, 0);

  v4 = AXCFormattedString();

  return v4;
}

uint64_t AXAppNameForBundleId()
{
  return MEMORY[0x270F09D28]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x270F09F10]();
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x270F09D40]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F0A258]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x270F0A2E8]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
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

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
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

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F0A468]();
}

void abort(void)
{
}

uint64_t accessibilityUIKitSymbolNamesLocalizedString()
{
  return MEMORY[0x270F80B10]();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}