id accessibilityPencilKitLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  v1 = a1;
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 localizedStringForKey:v1 value:&stru_26F76E388 table:@"AccessibilityPencilKit"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id accessibilityNameForInkIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x263F14CA8]])
  {
    v2 = @"pen.tool";
LABEL_15:
    v3 = accessibilityPencilKitLocalizedString(v2);
    goto LABEL_16;
  }
  if ([v1 isEqualToString:*MEMORY[0x263F14CB0]])
  {
    v2 = @"pencil.tool";
    goto LABEL_15;
  }
  if ([v1 isEqualToString:*MEMORY[0x263F14C98]])
  {
    v2 = @"marker.tool";
    goto LABEL_15;
  }
  if ([v1 isEqualToString:*MEMORY[0x263F14C88]])
  {
    v2 = @"eraser.tool";
    goto LABEL_15;
  }
  if ([v1 isEqualToString:*MEMORY[0x263F14CA0]])
  {
    v2 = @"object.eraser.tool";
    goto LABEL_15;
  }
  if ([v1 isEqualToString:*MEMORY[0x263F14C90]])
  {
    v2 = @"lasso.tool";
    goto LABEL_15;
  }
  if ([v1 isEqualToString:*MEMORY[0x263F14CE8]])
  {
    v2 = @"ruler.tool";
    goto LABEL_15;
  }
  v3 = 0;
LABEL_16:

  return v3;
}

id accessibilityPencilKitNameForWeight(double a1)
{
  if (a1 > 1.0) {
    a1 = 1.0;
  }
  switch(llround((fmax(a1, -1.0) + 1.0) * 0.5 * 4.0))
  {
    case 0uLL:
      id v1 = @"tool.weight.verylight";
      goto LABEL_10;
    case 1uLL:
      id v1 = @"tool.weight.light";
      goto LABEL_10;
    case 2uLL:
      id v1 = @"tool.weight.medium";
      goto LABEL_10;
    case 3uLL:
      id v1 = @"tool.weight.heavy";
      goto LABEL_10;
    case 4uLL:
      id v1 = @"tool.weight.veryheavy";
LABEL_10:
      v2 = accessibilityPencilKitLocalizedString(v1);
      break;
    default:
      _AXAssert();
      v2 = 0;
      break;
  }

  return v2;
}

void sub_24240528C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x270F09D40]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x270F09808]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F0A108]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
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

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F0A3E8]();
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