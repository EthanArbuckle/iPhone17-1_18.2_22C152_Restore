@interface EKDayOccurrenceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsInWidget;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_axIsInPreview;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrameForScrolling;
- (NSValue)_axRealFrameInSuperview;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)_axDraggingView;
- (id)_axDropPointDescriptorsProvider;
- (id)_axWidgetContainerView;
- (id)accessibilityCustomRotors;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
- (void)_axSetDropPointDescriptorsProvider:(id)a3;
- (void)_axSetRealFrameInSuperview:(id)a3;
- (void)prepareForReuse;
- (void)setDrawsResizeHandles:(BOOL)a3;
@end

@implementation EKDayOccurrenceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKDayOccurrenceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSValue)_axRealFrameInSuperview
{
}

- (void)_axSetRealFrameInSuperview:(id)a3
{
}

- (id)_axDropPointDescriptorsProvider
{
}

- (void)_axSetDropPointDescriptorsProvider:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKLayoutContainerView"];
  [v3 validateClass:@"EKDayViewController"];
  [v3 validateClass:@"EKDayGridView"];
  [v3 validateClass:@"EKDayView"];
  [v3 validateClass:@"EKEvent"];
  [v3 validateClass:@"EKDayOccurrenceView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKLayoutContainerView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayOccurrenceView", @"arrayOfResizeHandles", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayOccurrenceView", @"occurrence", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayOccurrenceView", @"isAllDay", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayOccurrenceView", @"prepareForReuse", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayOccurrenceView", @"isCancelled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayOccurrenceView", @"isBirthday", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayOccurrenceView", @"isTentative", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayOccurrenceView", @"isDeclined", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayOccurrenceView", @"needsReply", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayOccurrenceView", @"isSelectedCopyView", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayOccurrenceView", @"setDrawsResizeHandles:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayOccurrenceView", @"occurrence", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayViewController", @"currentDayView", "@", 0);
  [v3 validateClass:@"EKDayViewController" hasInstanceVariable:@"_eventGestureController" withType:"EKEventGestureController"];
  [v3 validateClass:@"EKEventGestureController" hasInstanceVariable:@"_draggingView" withType:"EKDayOccurrenceView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEvent", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEvent", @"virtualConference", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKVirtualConference", @"joinMethods", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKCalendarItem", @"location", "@", 0);
  [v3 validateClass:@"EKEvent" isKindOfClass:@"EKCalendarItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
}

- (BOOL)_axIsInPreview
{
  v2 = [(EKDayOccurrenceViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Ekdaygridview.isa)];
  char v3 = [v2 accessibilityIsPreviewGridView];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  char v3 = [(EKDayOccurrenceViewAccessibility *)self isAccessibilityUserDefinedElement];

  if (v3)
  {
    v4 = [(EKDayOccurrenceViewAccessibility *)self isAccessibilityUserDefinedElement];
    char v5 = [v4 BOOLValue];

    return v5;
  }
  else if ([(EKDayOccurrenceViewAccessibility *)self safeBoolForKey:@"isSelectedCopyView"])
  {
    return 0;
  }
  else if ([(EKDayOccurrenceViewAccessibility *)self _axIsInPreview])
  {
    [(EKDayOccurrenceViewAccessibility *)self accessibilityFrameForScrolling];
    return !CGRectIsNull(v7);
  }
  else
  {
    return 1;
  }
}

- (CGRect)accessibilityFrameForScrolling
{
  char v3 = [(EKDayOccurrenceViewAccessibility *)self _axRealFrameInSuperview];
  uint64_t v4 = [(EKDayOccurrenceViewAccessibility *)self superview];
  char v5 = (void *)v4;
  if (v3 && v4)
  {
    [v3 CGRectValue];
    UIAccessibilityFrameForBounds();
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)EKDayOccurrenceViewAccessibility;
    [(EKDayOccurrenceViewAccessibility *)&v24 accessibilityFrameForScrolling];
  }
  CGFloat x = v6;
  CGFloat y = v7;
  CGFloat width = v8;
  CGFloat height = v9;
  v14 = [(EKDayOccurrenceViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Ekdaygridview.isa)];
  if ([v14 accessibilityIsPreviewGridView])
  {
    v15 = [v14 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
    [v15 accessibilityFrame];
    v28.origin.CGFloat x = v16;
    v28.origin.CGFloat y = v17;
    v28.size.CGFloat width = v18;
    v28.size.CGFloat height = v19;
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    CGRect v26 = CGRectIntersection(v25, v28);
    CGFloat x = v26.origin.x;
    CGFloat y = v26.origin.y;
    CGFloat width = v26.size.width;
    CGFloat height = v26.size.height;
  }
  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  char v3 = [(EKDayOccurrenceViewAccessibility *)self safeValueForKey:@"occurrence"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  id v5 = [v4 safeStringForKey:@"title"];
  double v6 = v5;
  if ([(EKDayOccurrenceViewAccessibility *)self safeBoolForKey:@"isCancelled"])
  {
    v37 = accessibilityLocalizedString(@"AX_IS_CANCELED");
    v48 = @"__AXStringForVariablesSentinel";
    double v6 = __UIAXStringForVariables();
  }
  if ([(EKDayOccurrenceViewAccessibility *)self safeBoolForKey:@"isTentative", v37, v48])
  {
    v38 = accessibilityLocalizedString(@"event.tentative");
    v49 = @"__AXStringForVariablesSentinel";
    uint64_t v7 = __UIAXStringForVariables();

    double v6 = (void *)v7;
  }
  if ([(EKDayOccurrenceViewAccessibility *)self safeBoolForKey:@"isDeclined", v38, v49])
  {
    v39 = accessibilityLocalizedString(@"event.declined");
    v50 = @"__AXStringForVariablesSentinel";
    uint64_t v8 = __UIAXStringForVariables();

    double v6 = (void *)v8;
  }
  if ([(EKDayOccurrenceViewAccessibility *)self safeBoolForKey:@"needsReply", v39, v50])
  {
    v40 = accessibilityLocalizedString(@"event.needsreply");
    v51 = @"__AXStringForVariablesSentinel";
    uint64_t v9 = __UIAXStringForVariables();

    double v6 = (void *)v9;
  }
  v10 = objc_msgSend(v4, "virtualConference", v40, v51);
  v11 = [v10 safeArrayForKey:@"joinMethods"];
  v12 = [v11 firstObject];

  v13 = [v12 URL];
  v14 = [v13 absoluteString];
  v15 = [v14 lowercaseString];

  if ([v15 containsString:@"facetime.apple.com"])
  {
    v41 = accessibilityLocalizedString(@"application.name.facetime");
    v52 = @"__AXStringForVariablesSentinel";
    uint64_t v16 = __UIAXStringForVariables();

    double v6 = (void *)v16;
  }
  CGFloat v17 = objc_msgSend(v4, "safeStringForKey:", @"location", v41, v52);
  if (v4)
  {
    v60 = [v4 _accessibilityDurationString];
    v61 = v17;
    CGFloat v18 = __UIAXStringForVariables();

    objc_msgSend(v4, "travelTime", v17, v60, @"__AXStringForVariablesSentinel");
    if (v19 > 0.0)
    {
      v43 = MEMORY[0x24564B8E0]([v4 travelTime]);
      v54 = @"__AXStringForVariablesSentinel";
      uint64_t v20 = __UIAXStringForVariables();

      CGFloat v18 = (void *)v20;
    }
    if (objc_msgSend(v4, "isOrWasPartOfRecurringSeries", v43, v54))
    {
      v44 = accessibilityLocalizedString(@"event.repeats");
      v55 = @"__AXStringForVariablesSentinel";
      uint64_t v21 = __UIAXStringForVariables();

      CGFloat v18 = (void *)v21;
    }
    v62 = v12;
    if (objc_msgSend(v4, "hasAttachment", v44, v55))
    {
      v45 = accessibilityLocalizedString(@"event.has.attachments");
      v56 = @"__AXStringForVariablesSentinel";
      uint64_t v22 = __UIAXStringForVariables();

      CGFloat v18 = (void *)v22;
    }
    double v23 = objc_msgSend(MEMORY[0x263EFF8F0], "currentCalendar", v45, v56);
    objc_super v24 = [v4 startDate];
    if (v24)
    {
      CGRect v25 = [v23 components:62 fromDate:v24];
      CGRect v26 = [v4 endDate];
      if (v26)
      {
        id v58 = v5;
        v59 = [v23 components:62 fromDate:v26];
        v27 = [MEMORY[0x263EFF910] date];
        CGRect v28 = [v23 components:62 fromDate:v27];

        uint64_t v29 = [v25 year];
        if (v29 == [v28 year])
        {
          uint64_t v30 = [v25 month];
          if (v30 == [v28 month])
          {
            uint64_t v31 = [v25 day];
            if (v31 == [v28 day])
            {
              uint64_t v32 = [v25 hour];
              if (v32 >= [v28 hour])
              {
                uint64_t v33 = [v59 hour];
                if (v33 <= [v28 hour])
                {
                  v42 = accessibilityLocalizedString(@"in.progress");
                  v53 = @"__AXStringForVariablesSentinel";
                  uint64_t v57 = __UIAXStringForVariables();

                  CGFloat v18 = (void *)v57;
                }
              }
            }
          }
        }

        id v5 = v58;
      }
      else
      {
        v42 = v4;
        _AXAssert();
      }
    }
    else
    {
      v42 = v4;
      _AXAssert();
    }

    double v6 = v18;
    CGFloat v17 = v61;
    v12 = v62;
  }
  if ([(EKDayOccurrenceViewAccessibility *)self safeBoolForKey:@"isBirthday", v42, v53])
  {
    v46 = accessibilityLocalizedString(@"event.birthday");
    uint64_t v34 = __UIAXStringForVariables();

    double v6 = (void *)v34;
  }
  if (v4)
  {
    v47 = accessibilityCalendarTitleForEventIfNecessary(v4);
    uint64_t v35 = __UIAXStringForVariables();

    double v6 = (void *)v35;
  }

  return v6;
}

- (id)accessibilityUserInputLabels
{
  objc_opt_class();
  char v3 = [(EKDayOccurrenceViewAccessibility *)self safeValueForKey:@"occurrence"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  id v5 = [v4 safeStringForKey:@"title"];
  double v6 = MEMORY[0x24564B970]();

  return v6;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(EKDayOccurrenceViewAccessibility *)self _axDraggingView];
  char v3 = [v2 safeValueForKey:@"_endResizeHandle"];

  if ([v3 _accessibilityViewIsVisible])
  {
    v6[0] = v3;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(EKDayOccurrenceViewAccessibility *)self _axDraggingView];
  char v3 = [v2 safeValueForKey:@"_startResizeHandle"];

  if ([v3 _accessibilityViewIsVisible])
  {
    v6[0] = v3;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)setDrawsResizeHandles:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKDayOccurrenceViewAccessibility;
  [(EKDayOccurrenceViewAccessibility *)&v6 setDrawsResizeHandles:a3];
  uint64_t v4 = [(EKDayOccurrenceViewAccessibility *)self safeValueForKey:@"_startResizeHandle"];
  [v4 setAccessibilityIdentifier:@"StartHandle"];
  [v4 setAccessibilityContainer:self];
  id v5 = [(EKDayOccurrenceViewAccessibility *)self safeValueForKey:@"_endResizeHandle"];
  [v5 setAccessibilityContainer:self];
  [v5 setAccessibilityIdentifier:@"EndHandle"];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)_axDraggingView
{
  char v3 = [(EKDayOccurrenceViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Eklayoutcontai.isa)];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 safeValueForKey:@"delegate"];
    NSClassFromString(&cfstr_Ekdayviewcontr_0.isa);
    if (objc_opt_isKindOfClass())
    {
      objc_super v6 = [v5 safeValueForKey:@"_eventGestureController"];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  uint64_t v7 = [(EKDayOccurrenceViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Weekgroupview.isa)];
  id v5 = v7;
  if (!v7)
  {
LABEL_9:
    objc_super v6 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = [v7 superview];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = v5;
    uint64_t v16 = v8;
    _AXAssert();
  }
  uint64_t v9 = objc_msgSend(v8, "safeValueForKey:", @"delegate", v15, v16);
  NSClassFromString(&cfstr_Weekviewcontro.isa);
  if (objc_opt_isKindOfClass())
  {
    objc_super v6 = [v9 safeValueForKey:@"_eventGestureController"];
  }
  else
  {
    objc_super v6 = 0;
  }

LABEL_12:
  v10 = [v6 safeValueForKey:@"_draggingView"];
  v11 = [(EKDayOccurrenceViewAccessibility *)self safeValueForKey:@"occurrence"];
  v12 = [v10 safeValueForKey:@"occurrence"];
  char v13 = [v11 isEqual:v12];

  if ((v13 & 1) == 0)
  {

    v10 = 0;
  }

  return v10;
}

- (id)accessibilityCustomRotors
{
  v15[1] = *MEMORY[0x263EF8340];
  char v3 = [(EKDayOccurrenceViewAccessibility *)self _axDraggingView];

  if (v3)
  {
    uint64_t v4 = [(EKDayOccurrenceViewAccessibility *)self _accessibilityValueForKey:@"AXCustomRotor"];
    if (!v4)
    {
      objc_initWeak(&location, self);
      id v5 = objc_alloc(MEMORY[0x263F1C398]);
      objc_super v6 = accessibilityLocalizedString(@"handles");
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      v11 = __61__EKDayOccurrenceViewAccessibility_accessibilityCustomRotors__block_invoke;
      v12 = &unk_26511E3B8;
      objc_copyWeak(&v13, &location);
      uint64_t v4 = (void *)[v5 initWithName:v6 itemSearchBlock:&v9];

      [(EKDayOccurrenceViewAccessibility *)self _accessibilitySetRetainedValue:v4, @"AXCustomRotor", v9, v10, v11, v12 forKey];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    v15[0] = v4;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id __61__EKDayOccurrenceViewAccessibility_accessibilityCustomRotors__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  id v5 = [WeakRetained _axDraggingView];
  objc_super v6 = [v5 safeValueForKey:@"arrayOfResizeHandles"];
  uint64_t v7 = __UIAccessibilitySafeClass();

  id v8 = objc_loadWeakRetained(a1);
  uint64_t v9 = [v8 _accessibilityCustomRotorResultHelper:v3 array:v7];

  return v9;
}

- (unint64_t)accessibilityTraits
{
  v22.receiver = self;
  v22.super_class = (Class)EKDayOccurrenceViewAccessibility;
  unint64_t v3 = [(EKDayOccurrenceViewAccessibility *)&v22 accessibilityTraits];
  BOOL v4 = [(EKDayOccurrenceViewAccessibility *)self _axIsInPreview];
  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if (v4) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 | v3;
  uint64_t v7 = [(EKDayOccurrenceViewAccessibility *)self _axWidgetContainerView];
  id v8 = v7;
  if (v7)
  {
    [v7 accessibilityFrame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(EKDayOccurrenceViewAccessibility *)self accessibilityFrame];
    v24.origin.CGFloat x = v17;
    v24.origin.CGFloat y = v18;
    v24.size.CGFloat width = v19;
    v24.size.CGFloat height = v20;
    v23.origin.CGFloat x = v10;
    v23.origin.CGFloat y = v12;
    v23.size.CGFloat width = v14;
    v23.size.CGFloat height = v16;
    if (!CGRectIntersectsRect(v23, v24)) {
      v6 |= *MEMORY[0x263F813E8];
    }
  }

  return v6;
}

- (id)_axWidgetContainerView
{
  Class v3 = NSClassFromString(&cfstr_Ncwidgetviewco.isa);

  return (id)[(EKDayOccurrenceViewAccessibility *)self _accessibilityViewAncestorIsKindOf:v3];
}

- (BOOL)_accessibilityIsInWidget
{
  v2 = [(EKDayOccurrenceViewAccessibility *)self _axWidgetContainerView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)accessibilityHint
{
  if ([(EKDayOccurrenceViewAccessibility *)self _accessibilityIsInWidget]
    || [(EKDayOccurrenceViewAccessibility *)self _axIsInPreview]
    || ([(EKDayOccurrenceViewAccessibility *)self _axDraggingView],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    BOOL v4 = 0;
  }
  else
  {
    if ([(EKDayOccurrenceViewAccessibility *)self safeBoolForKey:@"isAllDay"]) {
      unint64_t v6 = @"occurrence.gestures.hint.all.day";
    }
    else {
      unint64_t v6 = @"occurrence.gestures.hint";
    }
    BOOL v4 = accessibilityLocalizedString(v6);
  }

  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)EKDayOccurrenceViewAccessibility;
  [(EKDayOccurrenceViewAccessibility *)&v3 prepareForReuse];
  [(EKDayOccurrenceViewAccessibility *)self _axSetRealFrameInSuperview:0];
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return ![(EKDayOccurrenceViewAccessibility *)self _axIsInPreview];
}

- (id)accessibilityDragSourceDescriptors
{
  v20[1] = *MEMORY[0x263EF8340];
  char v19 = 0;
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  BOOL v4 = [v3 _accessibilityDragAndDropTargetViewForDrop:0];
  if (v4)
  {
    [v3 bounds];
    objc_msgSend(v4, "convertRect:fromView:", v3);
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    id v13 = objc_alloc(MEMORY[0x263F1C3B8]);
    CGFloat v14 = accessibilityLocalizedString(@"drag.whole.event");
    v22.origin.CGFloat x = v6;
    v22.origin.CGFloat y = v8;
    v22.size.CGFloat width = v10;
    v22.size.CGFloat height = v12;
    CGRectGetMidX(v22);
    v23.origin.CGFloat x = v6;
    v23.origin.CGFloat y = v8;
    v23.size.CGFloat width = v10;
    v23.size.CGFloat height = v12;
    CGRectGetMidY(v23);
    CalRoundPointToScreenScale();
    double v15 = objc_msgSend(v13, "initWithName:point:inView:", v14, v4);

    v20[0] = v15;
    CGFloat v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)EKDayOccurrenceViewAccessibility;
    CGFloat v16 = [(EKDayOccurrenceViewAccessibility *)&v18 accessibilityDragSourceDescriptors];
  }

  return v16;
}

- (id)accessibilityDropPointDescriptors
{
  objc_super v3 = [(EKDayOccurrenceViewAccessibility *)self _axDropPointDescriptorsProvider];
  BOOL v4 = [v3 accessibilityDropPointDescriptors];

  if ([v4 count])
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EKDayOccurrenceViewAccessibility;
    id v5 = [(EKDayOccurrenceViewAccessibility *)&v8 accessibilityDropPointDescriptors];
  }
  CGFloat v6 = v5;

  return v6;
}

- (BOOL)canBecomeFocused
{
  if ([(EKDayOccurrenceViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    objc_super v3 = [(EKDayOccurrenceViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_2 startWithSelf:0];
    BOOL v4 = [v3 _accessibilityViewController];

    if (v4)
    {
      id v5 = [v4 safeValueForKey:@"currentDayView"];
      CGFloat v6 = [(EKDayOccurrenceViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Ekdayview.isa)];

      if (v5 != v6) {
        return 0;
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)EKDayOccurrenceViewAccessibility;
  return [(EKDayOccurrenceViewAccessibility *)&v8 canBecomeFocused];
}

uint64_t __52__EKDayOccurrenceViewAccessibility_canBecomeFocused__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Ekdayviewcontr_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end