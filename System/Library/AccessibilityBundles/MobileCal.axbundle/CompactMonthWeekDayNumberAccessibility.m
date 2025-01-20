@interface CompactMonthWeekDayNumberAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_axAreChildrenFocused;
- (BOOL)_prefersFocusContainment;
- (BOOL)canBecomeFocused;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)accessibilityFrame;
- (NSArray)preferredFocusEnvironments;
- (NSString)focusGroupIdentifier;
- (UIFocusEnvironment)parentFocusEnvironment;
- (id)_axCalendarModel;
- (id)_axEventStore;
- (id)_axStringForNumberOfEvents:(unint64_t)a3;
- (id)_preferredFocusRegionCoordinateSpace;
- (id)accessibilityCustomContent;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (id)focusItemsInRect:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)_axSetAreChildrenFocused:(BOOL)a3;
- (void)_destroyFocusLayer;
- (void)_updateFocusLayerFrame;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setNeedsFocusUpdate;
- (void)updateFocusIfNeeded;
@end

@implementation CompactMonthWeekDayNumberAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CompactMonthWeekDayNumber";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CompactWidthMonthViewController"];
  [v3 validateClass:@"CompactMonthWeekView"];
  [v3 validateClass:@"CompactMonthWeekView" hasInstanceVariable:@"_today" withType:"CompactMonthWeekDayNumber"];
  [v3 validateClass:@"CompactWidthMonthViewController" hasInstanceVariable:@"_model" withType:"CUIKCalendarModel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CompactMonthWeekDayNumber", @"calendarDate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CompactMonthWeekDayNumber", @"attachedTodayCircle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CompactMonthWeekTodayCircle", @"drawCircle", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CompactMonthWeekDayNumber", @"frame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(CompactMonthWeekDayNumberAccessibility *)self safeValueForKey:@"calendarDate"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CGRect)accessibilityFrame
{
  BOOL v3 = [(CompactMonthWeekDayNumberAccessibility *)self accessibilityContainer];
  v4 = [(CompactMonthWeekDayNumberAccessibility *)self safeValueForKey:@"layer"];
  v5 = [v4 safeValueForKey:@"frame"];
  [v5 CGRectValue];
  UIAccessibilityFrameForBounds();
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  uint64_t v14 = v7;
  uint64_t v15 = v9;
  uint64_t v16 = v11;
  uint64_t v17 = v13;

  return CGRectInset(*(CGRect *)&v14, -10.0, -10.0);
}

- (id)accessibilityLabel
{
  BOOL v3 = [(CompactMonthWeekDayNumberAccessibility *)self safeValueForKey:@"calendarDate"];
  v4 = [v3 safeValueForKey:@"date"];
  v5 = _AXGetStringsForDate(v4);

  uint64_t v6 = [(CompactMonthWeekDayNumberAccessibility *)self accessibilityContainer];
  uint64_t v7 = [v6 safeValueForKey:@"_today"];

  if (v7 == self)
  {
    uint64_t v8 = accessibilityLocalizedString(@"today.indicator");
    uint64_t v9 = __UIAXStringForVariables();

    v5 = (void *)v9;
  }

  return v5;
}

- (id)accessibilityUserInputLabels
{
  objc_opt_class();
  BOOL v3 = [(CompactMonthWeekDayNumberAccessibility *)self safeValueForKey:@"calendarDate"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 day];
  v5 = AXFormatInteger();
  uint64_t v6 = MEMORY[0x245654990]();

  return v6;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"month.day.hint");
}

- (unint64_t)accessibilityTraits
{
  unint64_t v2 = *MEMORY[0x263F1CEE8];
  BOOL v3 = [(CompactMonthWeekDayNumberAccessibility *)self safeValueForKey:@"attachedTodayCircle"];
  v4 = v3;
  if (v3 && [v3 safeBoolForKey:@"drawCircle"]) {
    v2 |= *MEMORY[0x263F1CF38];
  }

  return v2;
}

- (id)_axCalendarModel
{
  unint64_t v2 = [(CompactMonthWeekDayNumberAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Compactmonthwe_2.isa)];
  if (v2)
  {
    objc_opt_class();
    BOOL v3 = __UIAccessibilityCastAsSafeCategory();
    v4 = [v3 _accessibilityMonthViewController];

    if (v4)
    {
      v5 = [v4 safeValueForKey:@"_model"];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    _AXAssert();
    v5 = 0;
  }

  return v5;
}

- (id)_axEventStore
{
  unint64_t v2 = [(CompactMonthWeekDayNumberAccessibility *)self _axCalendarModel];
  BOOL v3 = [v2 safeValueForKey:@"eventStore"];

  return v3;
}

- (id)_axStringForNumberOfEvents:(unint64_t)a3
{
  v4 = NSString;
  v5 = accessibilityLocalizedString(@"event.count");
  uint64_t v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (id)accessibilityValue
{
  BOOL v3 = [(CompactMonthWeekDayNumberAccessibility *)self _axEventStore];
  v4 = [(CompactMonthWeekDayNumberAccessibility *)self _axCalendarModel];
  v5 = [v4 safeValueForKey:@"selectedCalendars"];

  uint64_t v6 = [(CompactMonthWeekDayNumberAccessibility *)self safeValueForKey:@"calendarDate"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = [v6 components];
    [v7 setHour:0];
    [v7 setMinute:0];
    [v7 setSecond:0];
    uint64_t v8 = (void *)MEMORY[0x263F30080];
    uint64_t v9 = [v3 timeZone];
    uint64_t v10 = [v8 calendarDateWithDateComponents:v7 timeZone:v9];

    v18 = [v10 calendarDateByAddingDays:1];
    uint64_t v11 = [v10 date];
    uint64_t v12 = [v18 date];
    uint64_t v13 = [v5 allObjects];
    uint64_t v14 = [v3 predicateForEventsWithStartDate:v11 endDate:v12 calendars:v13];

    uint64_t v15 = [v3 eventsMatchingPredicate:v14];
    uint64_t v16 = -[CompactMonthWeekDayNumberAccessibility _axStringForNumberOfEvents:](self, "_axStringForNumberOfEvents:", [v15 count]);
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)accessibilityCustomContent
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  BOOL v3 = accessibilityLocalizedString(@"event.calendars.none");
  v4 = [(CompactMonthWeekDayNumberAccessibility *)self _axEventStore];
  v5 = [(CompactMonthWeekDayNumberAccessibility *)self _axCalendarModel];
  uint64_t v6 = [v5 safeValueForKey:@"selectedCalendars"];

  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [(CompactMonthWeekDayNumberAccessibility *)self safeValueForKey:@"calendarDate"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v8 components];
      [v9 setHour:0];
      [v9 setMinute:0];
      [v9 setSecond:0];
      uint64_t v10 = (void *)MEMORY[0x263F30080];
      uint64_t v11 = [v4 timeZone];
      v35 = v9;
      uint64_t v12 = [v10 calendarDateWithDateComponents:v9 timeZone:v11];

      uint64_t v13 = [v12 calendarDateByAddingDays:1];
      v34 = v12;
      uint64_t v14 = [v12 date];
      v33 = v13;
      uint64_t v15 = [v13 date];
      v36 = v6;
      uint64_t v16 = [v6 allObjects];
      uint64_t v17 = [v4 predicateForEventsWithStartDate:v14 endDate:v15 calendars:v16];

      v32 = (void *)v17;
      v18 = [v4 eventsMatchingPredicate:v17];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v38 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = [*(id *)(*((void *)&v37 + 1) + 8 * i) calendar];
            v24 = [v23 title];
            [v7 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v20);
      }
      v25 = [v7 allObjects];
      uint64_t v26 = [v25 componentsJoinedByString:@", "];

      BOOL v3 = (void *)v26;
      uint64_t v6 = v36;
    }
  }
  v27 = (void *)MEMORY[0x263EFABD0];
  v28 = accessibilityLocalizedString(@"event.calendars");
  v29 = [v27 customContentWithLabel:v28 value:v3];
  v41 = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];

  return v30;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  unint64_t v2 = [(CompactMonthWeekDayNumberAccessibility *)self accessibilityValue];
  BOOL v3 = accessibilityLocalizedString(@"event.count.none");
  char v4 = [v2 isEqualToString:v3] ^ 1;

  return v4;
}

- (BOOL)_axAreChildrenFocused
{
  return MEMORY[0x270F0A438](self, &__CompactMonthWeekDayNumberAccessibility___axAreChildrenFocused);
}

- (void)_axSetAreChildrenFocused:(BOOL)a3
{
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  return (UIFocusEnvironment *)[(CompactMonthWeekDayNumberAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_2 startWithSelf:0];
}

uint64_t __84__CompactMonthWeekDayNumberAccessibility_UIFocusConformance__parentFocusEnvironment__block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_26F70D2F8];
}

- (NSString)focusGroupIdentifier
{
  v9.receiver = self;
  v9.super_class = (Class)CompactMonthWeekDayNumberAccessibility;
  BOOL v3 = [(CompactMonthWeekDayNumberAccessibility *)&v9 focusGroupIdentifier];
  if (v3
    || ([(CompactMonthWeekDayNumberAccessibility *)self _accessibilityParentView],
        char v4 = objc_claimAutoreleasedReturnValue(),
        [v4 safeValueForKey:@"_containingScrollView"],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = v3;
  }
  else
  {
    id v6 = [(CompactMonthWeekDayNumberAccessibility *)self _accessibilityDefaultFocusGroupIdentifier];
  }
  uint64_t v7 = v6;

  return (NSString *)v7;
}

- (void)setNeedsFocusUpdate
{
  id v3 = [MEMORY[0x263F1C650] focusSystemForEnvironment:self];
  [v3 requestFocusUpdateToEnvironment:self];
  [(CompactMonthWeekDayNumberAccessibility *)self _updateFocusLayerFrame];
}

- (void)updateFocusIfNeeded
{
  id v3 = [MEMORY[0x263F1C650] focusSystemForEnvironment:self];
  [v3 updateFocusIfNeeded];
  [(CompactMonthWeekDayNumberAccessibility *)self _updateFocusLayerFrame];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __111__CompactMonthWeekDayNumberAccessibility_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v8[3] = &unk_265131DF8;
  id v9 = v6;
  uint64_t v10 = self;
  id v7 = v6;
  [a4 addCoordinatedAnimations:v8 completion:0];
}

uint64_t __111__CompactMonthWeekDayNumberAccessibility_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) nextFocusedItem];
  id v3 = v2;
  if (v2 != *(void **)(a1 + 40))
  {

LABEL_7:
    id v9 = (void *)MEMORY[0x263F1C648];
    uint64_t v10 = *(void *)(a1 + 40);
    return [v9 removeRingFromFocusItem:v10];
  }
  char v4 = [v2 _accessibilityParentView];
  int v5 = [v4 _accessibilityIsFKARunningForFocusItem];

  if (!v5) {
    goto LABEL_7;
  }
  id v6 = (void *)MEMORY[0x263F1C648];
  uint64_t v7 = *(void *)(a1 + 40);

  return [v6 moveRingToFocusItem:v7];
}

- (void)_destroyFocusLayer
{
}

- (void)_updateFocusLayerFrame
{
}

- (BOOL)canBecomeFocused
{
  int v3 = [(CompactMonthWeekDayNumberAccessibility *)self isAccessibilityElement];
  if (v3)
  {
    LOBYTE(v3) = [(CompactMonthWeekDayNumberAccessibility *)self accessibilityRespondsToUserInteraction];
  }
  return v3;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  unint64_t v2 = [(CompactMonthWeekDayNumberAccessibility *)self _accessibilityParentView];
  int v3 = [v2 _screen];
  char v4 = [v3 coordinateSpace];

  return v4;
}

- (id)focusItemsInRect:(CGRect)a3
{
  char v4 = [(CompactMonthWeekDayNumberAccessibility *)self accessibilityElements];
  if (v4)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __79__CompactMonthWeekDayNumberAccessibility_UIFocusConformance__focusItemsInRect___block_invoke;
    v12[3] = &unk_265131E90;
    v12[4] = self;
    int v5 = [MEMORY[0x263F08A98] predicateWithBlock:v12];
    id v6 = [v4 filteredArrayUsingPredicate:v5];
  }
  else if ([(CompactMonthWeekDayNumberAccessibility *)self accessibilityElementCount] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[CompactMonthWeekDayNumberAccessibility accessibilityElementCount](self, "accessibilityElementCount"));
    if ([(CompactMonthWeekDayNumberAccessibility *)self accessibilityElementCount])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [(CompactMonthWeekDayNumberAccessibility *)self accessibilityElementAtIndex:v7];
        if ([v8 conformsToProtocol:&unk_26F70D648])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || [(CompactMonthWeekDayNumberAccessibility *)self _accessibilityFKAShouldIncludeViewsAsElements])
          {
            [v6 axSafelyAddObject:v8];
          }
        }

        ++v7;
      }
      while (v7 < [(CompactMonthWeekDayNumberAccessibility *)self accessibilityElementCount]);
    }
  }
  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = (void *)MEMORY[0x263EFFA68];
  }
  id v10 = v9;

  return v10;
}

uint64_t __79__CompactMonthWeekDayNumberAccessibility_UIFocusConformance__focusItemsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_26F70D648])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = [*(id *)(a1 + 32) _accessibilityFKAShouldIncludeViewsAsElements];
    }
    else {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_prefersFocusContainment
{
  if ([(CompactMonthWeekDayNumberAccessibility *)self conformsToProtocol:&unk_26F713020]
    || ([(CompactMonthWeekDayNumberAccessibility *)self _accessibilityIsTouchContainer] & 1) != 0)
  {
    return 1;
  }

  return [(CompactMonthWeekDayNumberAccessibility *)self shouldGroupAccessibilityChildren];
}

- (BOOL)conformsToProtocol:(id)a3
{
  if (&unk_26F70D648 == a3 || &unk_26F70D2F8 == a3 || &unk_26F70D7A8 == a3 || &unk_26F70DC98 == a3) {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)CompactMonthWeekDayNumberAccessibility;
  return -[CompactMonthWeekDayNumberAccessibility conformsToProtocol:](&v7, sel_conformsToProtocol_);
}

@end