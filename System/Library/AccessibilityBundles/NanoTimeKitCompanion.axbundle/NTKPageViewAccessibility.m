@interface NTKPageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityFKAShouldProcessChildren;
- (BOOL)_accessibilityShouldAttemptScrollToFrameOnParentView;
- (BOOL)_axAllowsDelete;
- (BOOL)_axAllowsSelect;
- (BOOL)_axHandleDelete;
- (BOOL)accessibilityActivate;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)_axPageScrollViewController;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)_axGetCurrentScrollViewIndex;
@end

@implementation NTKPageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKPageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageView", @"pageDelegate", "@", 0);
  [v3 validateClass:@"NTKPageView" hasInstanceVariable:@"_outlineView" withType:"UIView"];
  [v3 validateProtocol:@"NTKPageDelegate" hasRequiredInstanceMethod:@"pageWasSelected:"];
  [v3 validateProtocol:@"NTKPageDelegate" hasRequiredInstanceMethod:@"pageDidBeginSwipeToDelete:"];
  [v3 validateProtocol:@"NTKPageDelegate" hasRequiredInstanceMethod:@"page:didEndSwipeToDelete:"];
  [v3 validateProtocol:@"NTKPageDelegate" hasRequiredInstanceMethod:@"page:didUpdateSwipeToDelete:"];
  [v3 validateClass:@"NTKPageScrollViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageScrollViewController", @"_canSelectPageAtIndex:", "B", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageScrollViewController", @"_canDeletePageAtIndex:", "B", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageScrollViewController", @"confirmPageDeletion", "v", 0);
}

- (id)accessibilityPath
{
  if (-[NTKPageViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem")&& (-[NTKPageViewAccessibility _axPageScrollViewController](self, "_axPageScrollViewController"), id v3 = objc_claimAutoreleasedReturnValue(), v4 = [v3 _accessibilityShouldSwipeBetweenPages], v3, v4))
  {
    v5 = [(NTKPageViewAccessibility *)self safeUIViewForKey:@"_outlineView"];
    v6 = [v5 accessibilityPath];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKPageViewAccessibility;
    v6 = [(NTKPageViewAccessibility *)&v8 accessibilityPath];
  }

  return v6;
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(NTKPageViewAccessibility *)self _axPageScrollViewController];
  if ([v3 _accessibilityShouldSwipeBetweenPages])
  {
    unsigned int v4 = [(NTKPageViewAccessibility *)self _axPageScrollViewController];
    unsigned __int8 v5 = [v4 _accessibilityIsPageViewVisible:self];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_accessibilityFKAShouldProcessChildren
{
  if ([(NTKPageViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    id v3 = [(NTKPageViewAccessibility *)self _axPageScrollViewController];
    if ([v3 _accessibilityShouldSwipeBetweenPages])
    {
      unsigned __int8 v4 = 0;
    }
    else
    {
      unsigned __int8 v5 = [(NTKPageViewAccessibility *)self _axPageScrollViewController];
      unsigned __int8 v4 = [v5 _accessibilityIsPageViewVisible:self];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKPageViewAccessibility;
    return [(NTKPageViewAccessibility *)&v7 accessibilityViewIsModal];
  }
  return v4;
}

- (id)accessibilityLabel
{
  id v3 = [(NTKPageViewAccessibility *)self _axPageScrollViewController];
  unsigned __int8 v4 = [v3 _accessibilityLabelForPageView:self];

  return v4;
}

- (id)accessibilityValue
{
  id v3 = [(NTKPageViewAccessibility *)self _axPageScrollViewController];
  unsigned __int8 v4 = [v3 _accessibilityValueForPageView:self];

  return v4;
}

- (id)accessibilityHint
{
  id v3 = [(NTKPageViewAccessibility *)self _axPageScrollViewController];
  unsigned __int8 v4 = [v3 _accessibilityHintForPageView:self];

  return v4;
}

- (id)accessibilityCustomActions
{
  id v3 = [(NTKPageViewAccessibility *)self _axPageScrollViewController];
  unsigned __int8 v4 = [v3 _accessibilityCustomActionsForPageView:self];

  if ([(NTKPageViewAccessibility *)self _axAllowsDelete])
  {
    id v5 = objc_alloc((Class)UIAccessibilityCustomAction);
    objc_super v7 = accessibilityLocalizedString(@"delete.page", v6);
    id v8 = [v5 initWithName:v7 target:self selector:"_axHandleDelete"];

    v9 = +[UIImage systemImageNamed:@"trash.fill"];
    [v8 setImage:v9];

    if (v4)
    {
      uint64_t v10 = [v4 arrayByAddingObject:v8];

      unsigned __int8 v4 = (void *)v10;
    }
    else
    {
      id v12 = v8;
      unsigned __int8 v4 = +[NSArray arrayWithObjects:&v12 count:1];
    }
  }

  return v4;
}

- (BOOL)accessibilityActivate
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __49__NTKPageViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _axAllowsSelect])
  {
    char v2 = [*(id *)(a1 + 32) safeValueForKey:@"pageDelegate"];
    [v2 pageWasSelected:*(void *)(a1 + 32)];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)_accessibilityShouldAttemptScrollToFrameOnParentView
{
  return 0;
}

- (BOOL)_axHandleDelete
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __43__NTKPageViewAccessibility__axHandleDelete__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _axAllowsDelete])
  {
    char v2 = [*(id *)(a1 + 32) safeValueForKey:@"pageDelegate"];
    if (v2)
    {
      id v3 = v2;
      [v2 pageDidBeginSwipeToDelete:*(void *)(a1 + 32)];
      [v3 page:*(void *)(a1 + 32) didUpdateSwipeToDelete:1.0];
      [v3 page:*(void *)(a1 + 32) didEndSwipeToDelete:1];
      [v3 confirmPageDeletion];
      UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
      char v2 = v3;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

- (BOOL)_axAllowsSelect
{
  [(NTKPageViewAccessibility *)self _axGetCurrentScrollViewIndex];
  [(NTKPageViewAccessibility *)self safeValueForKey:@"pageDelegate"];
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

id __43__NTKPageViewAccessibility__axAllowsSelect__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _canSelectPageAtIndex:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

- (BOOL)_axAllowsDelete
{
  [(NTKPageViewAccessibility *)self _axGetCurrentScrollViewIndex];
  [(NTKPageViewAccessibility *)self safeValueForKey:@"pageDelegate"];
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

id __43__NTKPageViewAccessibility__axAllowsDelete__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _canDeletePageAtIndex:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

- (unint64_t)_axGetCurrentScrollViewIndex
{
  char v2 = [(NTKPageViewAccessibility *)self safeValueForKey:@"pageDelegate"];
  char v3 = [v2 safeValueForKey:@"_scrollView"];
  id v4 = [v3 safeUnsignedIntegerForKey:@"currentPageIndex"];

  return (unint64_t)v4;
}

- (id)_axPageScrollViewController
{
  objc_opt_class();
  char v3 = [(NTKPageViewAccessibility *)self safeValueForKey:@"pageDelegate"];
  id v4 = __UIAccessibilityCastAsSafeCategory();

  return v4;
}

- (BOOL)canBecomeFocused
{
  if ([(NTKPageViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    return [(NTKPageViewAccessibility *)self isAccessibilityElement];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NTKPageViewAccessibility;
    return [(NTKPageViewAccessibility *)&v4 canBecomeFocused];
  }
}

@end