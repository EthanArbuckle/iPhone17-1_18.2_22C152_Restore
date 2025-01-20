id accessibilityLocalizedString(void *a1)
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
    v4 = [v2 localizedStringForKey:v1 value:&stru_26F7B5DB0 table:@"Accessibility-Seymour"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id _accessibilityStringForBurnBarPosition(unint64_t a1, int a2)
{
  v8[2] = *MEMORY[0x263EF8340];
  if (a1 > 4)
  {
    v3 = 0;
    if (!a2) {
      goto LABEL_3;
    }
  }
  else
  {
    v3 = accessibilityLocalizedString(off_26514EE00[a1]);
    if (!a2)
    {
LABEL_3:
      id v4 = v3;
      goto LABEL_6;
    }
  }
  v5 = accessibilityLocalizedString(@"burn.bar.title");
  v8[0] = v5;
  v8[1] = v3;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  AXLabelForElements();
  id v4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:

  return v4;
}

uint64_t _accessibilityReplaceStylsticBulletsForSpeaking(void *a1, const char *a2)
{
  return [a1 stringByReplacingOccurrencesOfString:@" • ", @", " withString];
}

id _accessibilityStringForHealthKitWorkoutType(uint64_t a1)
{
  v2 = 0;
  uint64_t v3 = a1 - 8;
  id v4 = @"workout.icon.barre";
  switch(v3)
  {
    case 0:
      id v4 = @"workout.icon.boxing";
      goto LABEL_33;
    case 1:
      id v4 = @"workout.icon.climbing";
      goto LABEL_33;
    case 2:
    case 3:
    case 4:
    case 6:
    case 7:
    case 9:
    case 10:
    case 11:
    case 13:
    case 14:
    case 15:
    case 17:
    case 18:
    case 19:
    case 21:
    case 22:
    case 23:
    case 26:
    case 28:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 37:
    case 39:
    case 40:
    case 41:
    case 43:
    case 46:
    case 47:
    case 48:
    case 52:
    case 53:
    case 59:
    case 62:
    case 63:
    case 65:
    case 67:
    case 68:
    case 70:
    case 71:
      goto LABEL_34;
    case 5:
      id v4 = @"workout.icon.cycling";
      goto LABEL_33;
    case 8:
      id v4 = @"workout.icon.elliptical";
      goto LABEL_33;
    case 12:
      id v4 = @"workout.icon.functionalStrengthTraining";
      goto LABEL_33;
    case 16:
      id v4 = @"workout.icon.hiking";
      goto LABEL_33;
    case 20:
      id v4 = @"workout.icon.martialArts";
      goto LABEL_33;
    case 24:
      id v4 = @"workout.icon.play";
      goto LABEL_33;
    case 25:
      id v4 = @"workout.icon.preparationAndRecovery";
      goto LABEL_33;
    case 27:
      id v4 = @"workout.icon.rowing";
      goto LABEL_33;
    case 29:
      id v4 = @"workout.icon.running";
      goto LABEL_33;
    case 36:
      id v4 = @"workout.icon.stairClimbing";
      goto LABEL_33;
    case 38:
      id v4 = @"workout.icon.swimming";
      goto LABEL_33;
    case 42:
      id v4 = @"workout.icon.traditionalStrengthTraining";
      goto LABEL_33;
    case 44:
      id v4 = @"workout.icon.walking";
      goto LABEL_33;
    case 45:
      id v4 = @"workout.icon.waterFitness";
      goto LABEL_33;
    case 49:
      id v4 = @"workout.icon.yoga";
      goto LABEL_33;
    case 50:
      goto LABEL_33;
    case 51:
      id v4 = @"workout.icon.coreTraining";
      goto LABEL_33;
    case 54:
      id v4 = @"workout.icon.flexibility";
      goto LABEL_33;
    case 55:
      id v4 = @"workout.icon.highIntensityIntervalTraining";
      goto LABEL_33;
    case 56:
      id v4 = @"workout.icon.jumpRope";
      goto LABEL_33;
    case 57:
      id v4 = @"workout.icon.kickboxing";
      goto LABEL_33;
    case 58:
      id v4 = @"workout.icon.pilates";
      goto LABEL_33;
    case 60:
      id v4 = @"workout.icon.stairs";
      goto LABEL_33;
    case 61:
      id v4 = @"workout.icon.stepTraining";
      goto LABEL_33;
    case 64:
      id v4 = @"workout.icon.taiChi";
      goto LABEL_33;
    case 66:
      id v4 = @"workout.icon.handCycling";
      goto LABEL_33;
    case 69:
      id v4 = @"workout.icon.dance";
      goto LABEL_33;
    case 72:
      id v4 = @"workout.icon.cooldown";
      goto LABEL_33;
    default:
      if (@"workout.icon.barre" != (__CFString *)3000) {
        goto LABEL_34;
      }
      id v4 = @"workout.icon.other";
LABEL_33:
      v2 = accessibilityLocalizedString(v4);
LABEL_34:
      return v2;
  }
}

__CFString *_accessibilityDescriptionForMediaTags(void *a1)
{
  id v1 = a1;
  if ([v1 containsObject:@"Closed Caption"])
  {
    v7 = accessibilityLocalizedString(@"media.tags.closed.captions.label");
    v11 = @"__AXStringForVariablesSentinel";
    __UIAXStringForVariables();
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &stru_26F7B5DB0;
  }
  if (objc_msgSend(v1, "containsObject:", @"Subtitle", v7, v11))
  {
    v8 = accessibilityLocalizedString(@"media.tags.subtitles.label");
    v12 = @"__AXStringForVariablesSentinel";
    uint64_t v3 = __UIAXStringForVariables();

    v2 = (__CFString *)v3;
  }
  if (objc_msgSend(v1, "containsObject:", @"Explicit Icon", v8, v12))
  {
    v9 = accessibilityLocalizedString(@"media.tags.explicit.label");
    v13 = @"__AXStringForVariablesSentinel";
    uint64_t v4 = __UIAXStringForVariables();

    v2 = (__CFString *)v4;
  }
  if (objc_msgSend(v1, "containsObject:", @"Audio Hints", v9, v13))
  {
    v10 = accessibilityLocalizedString(@"media.tags.audio.hints.label");
    uint64_t v5 = __UIAXStringForVariables();

    v2 = (__CFString *)v5;
  }

  return v2;
}

void sub_242505060(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_242505884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_242505934(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x270F09808]();
}

uint64_t AXDurationForDurationString()
{
  return MEMORY[0x270F0A0A0]();
}

uint64_t AXDurationStringForDuration()
{
  return MEMORY[0x270F0A0A8]();
}

uint64_t AXLabelForElements()
{
  return MEMORY[0x270F09810]();
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

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
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

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}