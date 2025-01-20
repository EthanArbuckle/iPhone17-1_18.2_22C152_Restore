void sub_24262C544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_24262CB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AXAnnotateDataNetworkViewWithType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD)
  {
    v2 = 0;
  }
  else
  {
    v2 = accessibilityLocalizedString(off_26515CA48[a1 - 1]);
  }
  return v2;
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F7FDA20 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }
  if ([v5 isEqualToString:v1])
  {
    uint64_t v6 = UIKitAccessibilityLocalizedString();

    v5 = (void *)v6;
  }

  return v5;
}

void sub_24262D494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24262D6F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24262D8D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2426303A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
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

id AXStatusBarItemHint(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 _accessibilityAncestorIsKindOf:objc_opt_class()];

  uint64_t v3 = [v2 currentStyle];
  int v4 = [(id)*MEMORY[0x263F1D020] _accessibilityIsSystemAppServer];
  v5 = accessibilityLocalizedString(@"status.bar.scroll.to.top.hint");
  if (v3 == 207)
  {
    uint64_t v6 = accessibilityLocalizedString(@"opens.preferences");
    goto LABEL_6;
  }
  int IsDoubleHeight = UIStatusBarStyleIsDoubleHeight();
  if ((IsDoubleHeight & 1) == 0 && ((v4 ^ 1) & 1) == 0)
  {
    v8 = [MEMORY[0x263F22968] server];
    char v9 = [v8 isScreenLockedWithPasscode:0];

    uint64_t v6 = 0;
    if ((v9 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v6 = 0;
  if (IsDoubleHeight)
  {
LABEL_6:

    v5 = 0;
  }
LABEL_7:
  v10 = accessibilityLocalizedString(@"notification.center.hint");
  if (v4)
  {
    v11 = [MEMORY[0x263F22968] server];
    int v12 = [v11 isNotificationCenterVisible];
  }
  else
  {
    int v12 = 0;
  }
  v13 = [MEMORY[0x263F086E0] mainBundle];
  v14 = [v13 bundleIdentifier];
  char v15 = [v14 isEqualToString:@"com.apple.purplebuddy"];

  if ((v15 & 1) != 0 || v12)
  {

    v10 = 0;
  }
  v16 = accessibilityLocalizedString(@"control.center.hint");
  v17 = v16;
  if ((v4 & v12) == 1)
  {

    v17 = 0;
  }
  v18 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v19 = [v18 userInterfaceIdiom];

  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v20 = accessibilityLocalizedString(@"dock.hint");
  }
  else
  {
    v20 = 0;
  }
  v21 = __UIAXStringForVariables();

  return v21;
}

id AXStatusBarPillTimeView(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 _accessibilityAncestorIsKindOf:MEMORY[0x245665C20](@"STUIStatusBar")];

  uint64_t v3 = [v2 safeDictionaryForKey:@"items"];
  int v4 = [v3 allValues];

  v5 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_1);
  uint64_t v6 = [v5 firstObject];

  v7 = [v6 safeValueForKey:@"pillTimeView"];

  return v7;
}

BOOL __AXStatusBarPillTimeView_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245665C20](@"STUIStatusBarTimeItem");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 safeValueForKey:@"pillTimeView"];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x270F09F50]();
}

uint64_t AXDeviceHasJindo()
{
  return MEMORY[0x270F09FB8]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F0A108]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x270F0A2E8]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x270F09860]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

uint64_t AX_CGPointGetDistanceToPoint()
{
  return MEMORY[0x270F0A378]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x270F80A40]();
}

uint64_t UIStatusBarStyleIsDoubleHeight()
{
  return MEMORY[0x270F06298]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIAccessibilityFocusedElements()
{
  return MEMORY[0x270F80AC0]();
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

uint64_t __UIAccessibilityGetAssociatedBool()
{
  return MEMORY[0x270F0A438]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
}

uint64_t __UIAccessibilitySetAssociatedBool()
{
  return MEMORY[0x270F0A488]();
}

void abort(void)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}