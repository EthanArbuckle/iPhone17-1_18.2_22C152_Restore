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
    v4 = [v2 localizedStringForKey:v1 value:&stru_26F804FB8 table:@"Accessibility"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id accessibilityRetrieveLabelForSource(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"trailer"])
  {
    v2 = @"trailer.label";
LABEL_17:
    v3 = accessibilityLocalizedString(v2);
    goto LABEL_18;
  }
  if ([v1 containsString:@"button-play"])
  {
    v2 = @"play.button";
    goto LABEL_17;
  }
  if ([v1 containsString:@"popover-more"])
  {
    v2 = @"more.button";
    goto LABEL_17;
  }
  if ([v1 containsString:@"popover-share"])
  {
    v2 = @"share.button";
    goto LABEL_17;
  }
  if ([v1 isEqualToString:@"resource://ActionMenu-Add"])
  {
    v2 = @"add.button";
    goto LABEL_17;
  }
  if ([v1 isEqualToString:@"resource://ActionMenu-Remove"])
  {
    v2 = @"remove.button";
    goto LABEL_17;
  }
  if ([v1 containsString:@"Actions_AddGlyph"])
  {
    v2 = @"add.hint";
    goto LABEL_17;
  }
  if ([v1 containsString:@"Actions_CheckGlyph"])
  {
    v2 = @"remove.hint";
    goto LABEL_17;
  }
  if ([v1 containsString:@"tomato-certified"])
  {
    v5 = [MEMORY[0x263F22248] sharedInstance];
    v6 = [v5 atvaccessibilityLocalizedString:@"tv.tomato.rating"];
    v7 = [MEMORY[0x263F22248] sharedInstance];
    v8 = v7;
    v9 = @"tv.freshness.certified.fresh";
LABEL_28:
    v12 = [v7 atvaccessibilityLocalizedString:v9];
    v3 = __AXStringForVariables();

LABEL_29:
    goto LABEL_18;
  }
  if ([v1 containsString:@"tomato-fresh"])
  {
    v5 = [MEMORY[0x263F22248] sharedInstance];
    v6 = [v5 atvaccessibilityLocalizedString:@"tv.tomato.rating"];
    v7 = [MEMORY[0x263F22248] sharedInstance];
    v8 = v7;
    v9 = @"tv.freshness.fresh";
    goto LABEL_28;
  }
  if (([v1 containsString:@"tomato-rotten"] & 1) != 0
    || [v1 containsString:@"tomato-splat"])
  {
    v5 = [MEMORY[0x263F22248] sharedInstance];
    v6 = [v5 atvaccessibilityLocalizedString:@"tv.tomato.rating"];
    v7 = [MEMORY[0x263F22248] sharedInstance];
    v8 = v7;
    v9 = @"tv.freshness.rotten";
    goto LABEL_28;
  }
  if ([v1 isEqualToString:@"resource://overlay-checkmark"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"tv.played";
LABEL_49:
    v3 = [v10 atvaccessibilityLocalizedString:v11];
    goto LABEL_29;
  }
  if ([v1 isEqualToString:@"resource://cc"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.closed.captions";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://metadata-ad"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.ad";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://dolby-vision"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.dolby-vision";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://dolby-atmos"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.dolby-atmos";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://4k"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.4k";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://hdr"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.hdr";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://metadata-sdh"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.sdh";
    goto LABEL_49;
  }
  if (([v1 isEqualToString:@"resource://videos-HD"] & 1) != 0
    || [v1 isEqualToString:@"resource://hd"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.hd";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://mpaa-g"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.rating.g";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://mpaa-pg"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.rating.pg";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://mpaa-pg13"])
  {
LABEL_55:
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.rating.pg13";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://mpaa-r"])
  {
LABEL_57:
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.rating.r";
    goto LABEL_49;
  }
  if (([v1 isEqualToString:@"resource://mpaa-nr"] & 1) != 0
    || [v1 isEqualToString:@"resource://nr"])
  {
LABEL_60:
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.rating.nr";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"unrated"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.rating.unrated";
    goto LABEL_49;
  }
  if ([v1 containsString:@"common-sense-badge"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"tv.common.sense";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://tv-g"]) {
    goto LABEL_66;
  }
  if ([v1 isEqualToString:@"resource://tv-pg13"]) {
    goto LABEL_55;
  }
  if ([v1 isEqualToString:@"resource://tv-ma"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.rating.tvma";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://tv-nr"]) {
    goto LABEL_60;
  }
  if ([v1 isEqualToString:@"resource://tv-r"]) {
    goto LABEL_57;
  }
  if ([v1 isEqualToString:@"resource://tv-nc17"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.rating.nc17";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://tv-y7fv"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.rating.tvy7fv";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://tv-y7"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.rating.tvy7";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://tv-y"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.rating.tvy";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://tv-pg"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.rating.tvpg";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://tv-g"])
  {
LABEL_66:
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.rating.tvg";
    goto LABEL_49;
  }
  if ([v1 isEqualToString:@"resource://tv-14"])
  {
    v10 = [MEMORY[0x263F22248] sharedInstance];
    v5 = v10;
    v11 = @"axid.icon.rating.tv14";
    goto LABEL_49;
  }
  v3 = 0;
LABEL_18:

  return v3;
}

id accessibilityLabelForTVView(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  v2 = [v1 safeValueForKey:@"tv_AccessibilityText"];
  v3 = __UIAccessibilityCastAsClass();

  v4 = [v1 _accessibilityValueForKey:@"AXTVMLKitAccessibilityTextOverrideKey"];
  if ([v1 _accessibilityBoolValueForKey:@"AXTVMLKitPrefersAccessibilityTextOverrideKey"])v5 = v4; {
  else
  }
    v5 = v3;
  id v6 = v5;
  if (![v6 length])
  {
    if ([v3 length]) {
      v7 = v3;
    }
    else {
      v7 = v4;
    }
    id v8 = v7;

    id v6 = v8;
  }
  v9 = objc_msgSend(v1, "tv_associatedIKViewElement");
  v10 = [v9 attributes];
  v11 = [v10 objectForKeyedSubscript:@"src"];
  if (!v11)
  {
    v11 = [v10 objectForKeyedSubscript:@"srcset"];
  }
  v14 = accessibilityRetrieveLabelForSource(v11);
  v12 = __UIAXStringForVariables();

  return v12;
}

void sub_242647954(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 120));
  objc_destroyWeak((id *)(v6 - 112));
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

void sub_242647C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x270F808F8]();
}

uint64_t UIAXStarRatingStringForRatingWithMaxRating()
{
  return MEMORY[0x270F80930]();
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

uint64_t _AXAssert()
{
  return MEMORY[0x270F0A3E8]();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}