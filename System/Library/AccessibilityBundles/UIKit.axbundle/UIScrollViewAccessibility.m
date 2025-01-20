@interface UIScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityContentOffsetForScrollDirection:(int)a3 newContentOffset:(CGPoint *)a4 distanceMultiplier:(double)a5;
- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused;
- (BOOL)_accessibilityIncludeRoleInGroupNavigationOnly;
- (BOOL)_accessibilityIsGroupedParent;
- (BOOL)_accessibilityIsScannerGroup;
- (BOOL)_accessibilityIsScrollAncestor;
- (BOOL)_accessibilityIsSortPriorityContainer;
- (BOOL)_accessibilityRemembersLastFocusedChild;
- (BOOL)_accessibilityScrollPageInDirection:(int)a3;
- (BOOL)_accessibilityScrollStatusPrefersVertical;
- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4;
- (BOOL)_accessibilityScrollingEnabled;
- (BOOL)_accessibilityShouldAnimateScroll;
- (BOOL)_accessibilityShouldAnimateScrollToVisible;
- (BOOL)_accessibilityShouldUseFallbackForVisibleContentInset;
- (BOOL)_accessibilityUseContentInset;
- (BOOL)_axAlwaysScrollsContentIntoView;
- (BOOL)_axBaseScrollDownPageSupported;
- (BOOL)_axBaseScrollLeftPageSupported;
- (BOOL)_axBaseScrollRightPageSupported;
- (BOOL)_axBaseScrollUpPageSupported;
- (BOOL)_axShouldScrollToAlignWithPage;
- (BOOL)_axShowsHorizontalScrollBar;
- (BOOL)_axShowsVerticalScrollBar;
- (BOOL)accessibilityScrollDownPage;
- (BOOL)accessibilityScrollDownPageSupported;
- (BOOL)accessibilityScrollLeftPage;
- (BOOL)accessibilityScrollLeftPageSupported;
- (BOOL)accessibilityScrollRightPage;
- (BOOL)accessibilityScrollRightPageSupported;
- (BOOL)accessibilityScrollUpPage;
- (BOOL)accessibilityScrollUpPageSupported;
- (BOOL)accessibilityShouldEnableScrollIndicator:(id)a3;
- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3;
- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3;
- (CGFloat)accessibilityValidateScrollContentOffset:(CGFloat)a3;
- (CGPoint)_accessibilityContentOffset;
- (CGPoint)_accessibilityVisibleScrollArea:(BOOL)a3;
- (CGPoint)_newScrollOffsetForScrubReturningAnimated:(BOOL *)a3;
- (CGRect)_accessibilityContentFrame;
- (CGRect)_accessibilityScrollViewVisibleFrame;
- (CGRect)_defaultFocusRegionFrame;
- (CGRect)accessibilityFrame;
- (CGRect)accessibilityFrameForScrollIndicator:(id)a3;
- (UIEdgeInsets)_accessibilityContentInset;
- (UIEdgeInsets)_accessibilityNavigationControllerInset;
- (UIEdgeInsets)_accessibilityVisibleContentInset;
- (double)_accessibilityScrollAnimationDurationDelay;
- (double)_accessibilityScrollHeightDistance;
- (double)_accessibilityScrollWidthDistance;
- (double)_accessibilityZoomScale;
- (double)_axAllowedPagingOverlap;
- (double)_axContentOffsetForAddedProgress:(double)a3 inDirection:;
- (double)_axMaximumContentOffset;
- (double)_axMinimumContentOffset;
- (double)_axPageAlignedContentOffsetForPoint:(double)a3 forValidation:(double)a4;
- (double)_axPageSize;
- (double)_axProgressForDirection:(void *)a1;
- (double)accessibilityProgressForScrollIndicator:(id)a3;
- (id)_accessibilityDelegateScrollStatus;
- (id)_accessibilityElementsFilteredByPagingScrollView:(void *)a1;
- (id)_accessibilityFindRefreshControl;
- (id)_accessibilityFirstLastOpaqueElement:(id)obj options:;
- (id)_accessibilityFirstOpaqueElement;
- (id)_accessibilityFirstOpaqueElementWithOptions:(id)a3;
- (id)_accessibilityFocusAbsoluteFirstLastOpaqueElement:(BOOL)a3 technology:(id)a4 honorsGroups:(BOOL)a5 shouldAlwaysScroll:(BOOL)a6;
- (id)_accessibilityHorizontalScrollBarElement;
- (id)_accessibilityLastOpaqueElement;
- (id)_accessibilityLastOpaqueElementWithOptions:(id)a3;
- (id)_accessibilityRetrieveDelegate;
- (id)_accessibilityRoleDescription;
- (id)_accessibilityScrollStatus;
- (id)_accessibilityScrollStatusFormatString;
- (id)_accessibilityStoredShouldUseFallbackForVisibleContentInset;
- (id)_accessibilityStoredVisibleContentInset;
- (id)_accessibilitySubviews;
- (id)_accessibilityUIViewAccessibilityFrame;
- (id)_accessibilityVerticalScrollBarElement;
- (id)_axHorizontalScrollBar;
- (id)_axHorizontalScrollIndicator;
- (id)_axLastEdgeBoundaries;
- (id)_axLastScrubAnnouncementDate;
- (id)_axOverrideShowsHorizontallScrollBars;
- (id)_axOverrideShowsVerticalScrollBars;
- (id)_axVerticalScrollBar;
- (id)_axVerticalScrollIndicator;
- (id)_staticScrollBar;
- (id)accessibilityPath;
- (id)automationElements;
- (int64_t)_accessibilityPageCount;
- (int64_t)_accessibilityPageIndex;
- (int64_t)accessibilityContainerType;
- (int64_t)accessibilityNumberOfPagesForScrollIndicator:(id)a3;
- (uint64_t)_accessibilityCanHandleContentPullDown;
- (uint64_t)_axScrollViewPagingEnabled;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)_accessibilityBoundaryEdges;
- (void)_accessibilityAnnounceDelayedStatus;
- (void)_accessibilityCurrentPage:(uint64_t *)a3 totalPages:(char)a4 forVerticalDirection:;
- (void)_accessibilityCurrentPage:(uint64_t *)a3 totalPages:(int)a4 type:;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityScrollToTopWithAnnouncement:(id)obj touchLocation:(double)a4 originalHandler:(double)a5;
- (void)_accessibilitySendScrollStatus;
- (void)_accessibilitySetNavigationControllerInset:(UIEdgeInsets)a3;
- (void)_accessibilitySetScrollStatus:(id)a3;
- (void)_accessibilitySetShouldUseFallbackForVisibleContentInset:(BOOL)a3;
- (void)_accessibilitySetStoredShouldUseFallbackForVisibleContentInset:(uint64_t)a1;
- (void)_accessibilitySetStoredVisibleContentInset:(uint64_t)a1;
- (void)_accessibilitySetVisibleContentInset:(UIEdgeInsets)a3;
- (void)_accessibilityZoomAtPoint:(CGPoint)a3 zoomIn:(BOOL)a4;
- (void)_adjustScrollerIndicators:(BOOL)a3 alwaysShowingThem:(BOOL)a4;
- (void)_axAnnotateScrollBars;
- (void)_axAnnounceScrubForDirection:(void *)a1;
- (void)_axManipulateWithRefreshControl:(void *)a1;
- (void)_axSetAlwaysScrollsContentIntoView:(BOOL)a3;
- (void)_axSetHorizontalScrollBar:(id)a3;
- (void)_axSetLastEdgeBoundaries:(id)a3;
- (void)_axSetLastScrubAnnouncementDate:(id)a3;
- (void)_axSetOverrideShowsHorizontallScrollBars:(id)a3;
- (void)_axSetOverrideShowsVerticalScrollBars:(id)a3;
- (void)_axSetVerticalScrollBar:(id)a3;
- (void)_didEndDirectManipulationWithScrubbingDirection:(int64_t)a3;
- (void)_hideScrollIndicators;
- (void)_notifyDidScroll;
- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4;
- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4;
- (void)_scrollViewDidEndDeceleratingForDelegate;
- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animateWithDuration:(double)a5;
- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5;
- (void)accessibilityApplyScrollContent:(int)a3 sendScrollStatus:(CGFloat)a4 animateWithDuration:(CGFloat)a5 animationCurve:(double)a6;
- (void)accessibilityApplyScrollContentOverride:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animateWithDuration:(double)a5 animationCurve:(int)a6;
- (void)accessibilityScrollIndicator:(id)a3 addProgress:(double)a4;
- (void)accessibilityScrollIndicator:(id)a3 didBecomeFocused:(BOOL)a4;
@end

@implementation UIScrollViewAccessibility

- (void)_accessibilityLoadAccessibilityInformation
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIScrollViewAccessibility;
  [(UIScrollViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  -[UIScrollViewAccessibility _axAnnotateScrollBars](v4);
}

- (void)_adjustScrollerIndicators:(BOOL)a3 alwaysShowingThem:(BOOL)a4
{
  v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  BOOL v5 = a4;
  v4.receiver = self;
  v4.super_class = (Class)UIScrollViewAccessibility;
  [(UIScrollViewAccessibility *)&v4 _adjustScrollerIndicators:a3 alwaysShowingThem:a4];
  -[UIScrollViewAccessibility _axAnnotateScrollBars](v8);
}

- (void)_axAnnotateScrollBars
{
  SEL v3 = a1;
  if (a1)
  {
    id v2 = -[UIScrollViewAccessibility _axVerticalScrollIndicator](v3);
    -[_UIScrollViewScrollIndicatorAccessibility setAccessibilityScrollDirection:]((uint64_t)v2);
    -[_UIScrollViewScrollIndicatorAccessibility setAccessibilityScrollIndicatorDelegate:]((uint64_t)v2, v3);
    id v1 = -[UIScrollViewAccessibility _axHorizontalScrollIndicator](v3);
    -[_UIScrollViewScrollIndicatorAccessibility setAccessibilityScrollDirection:]((uint64_t)v1);
    -[_UIScrollViewScrollIndicatorAccessibility setAccessibilityScrollIndicatorDelegate:]((uint64_t)v1, v3);
    objc_storeStrong(&v1, 0);
    objc_storeStrong(&v2, 0);
  }
}

- (id)_axVerticalScrollIndicator
{
  id v7 = a1;
  if (a1)
  {
    char v6 = 0;
    objc_opt_class();
    id v3 = (id)[v7 safeValueForKey:@"_verticalScrollIndicator"];
    id v5 = (id)__UIAccessibilityCastAsSafeCategory();

    id v4 = v5;
    objc_storeStrong(&v5, 0);
    id v8 = v4;
  }
  else
  {
    id v8 = 0;
  }
  id v1 = v8;

  return v1;
}

- (id)_axHorizontalScrollIndicator
{
  id v7 = a1;
  if (a1)
  {
    char v6 = 0;
    objc_opt_class();
    id v3 = (id)[v7 safeValueForKey:@"_horizontalScrollIndicator"];
    id v5 = (id)__UIAccessibilityCastAsSafeCategory();

    id v4 = v5;
    objc_storeStrong(&v5, 0);
    id v8 = v4;
  }
  else
  {
    id v8 = 0;
  }
  id v1 = v8;

  return v1;
}

- (void)_accessibilitySetNavigationControllerInset:(UIEdgeInsets)a3
{
  id v4 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithUIEdgeInsets:", a3.top, a3.left, a3.bottom, a3.right);
  objc_setAssociatedObject(self, &_NavigationControllerInsetStorage, v4, (void *)0x301);
}

- (void)_didEndDirectManipulationWithScrubbingDirection:(int64_t)a3
{
  id v7 = self;
  SEL v6 = a2;
  int64_t v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)UIScrollViewAccessibility;
  [(UIScrollViewAccessibility *)&v4 _didEndDirectManipulationWithScrubbingDirection:a3];
  if (v5 == 2 || v5 == 1)
  {
    if (v5 == 2) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 1;
    }
    -[UIScrollViewAccessibility _axAnnounceScrubForDirection:](v7, v3);
  }
}

- (void)_notifyDidScroll
{
  v16 = self;
  SEL v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)UIScrollViewAccessibility;
  [(UIScrollViewAccessibility *)&v14 _notifyDidScroll];
  BOOL v13 = 0;
  BOOL v7 = 0;
  if (_AXSSpeakThisEnabled())
  {
    BOOL v7 = 0;
    if (_AXSQuickSpeakHighlightTextEnabled()) {
      BOOL v7 = _AXSSpeakThisHighlightVisible() != 0;
    }
  }
  BOOL v13 = v7;
  char v12 = 0;
  if (UIAccessibilityIsVoiceOverRunning()
    || _AXSAuditInspectionModeEnabled()
    || _AXSAssistiveTouchEnabled()
    || v13)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F81430], 0);
  }
  id location = v16;
  if ([location isFirstResponder])
  {
    uint64_t v10 = [(UIScrollViewAccessibility *)v16 _accessibilityBoundaryEdges];
    id v5 = [(UIScrollViewAccessibility *)v16 _axLastEdgeBoundaries];
    char v8 = 0;
    BOOL v6 = 1;
    if (v5)
    {
      id v9 = [(UIScrollViewAccessibility *)v16 _axLastEdgeBoundaries];
      char v8 = 1;
      BOOL v6 = v10 != [v9 unsignedIntegerValue];
    }
    if (v8) {

    }
    if (v6)
    {
      uint64_t v3 = v16;
      id v4 = (id)[NSNumber numberWithUnsignedInteger:v10];
      -[UIScrollViewAccessibility _axSetLastEdgeBoundaries:](v3, "_axSetLastEdgeBoundaries:");

      if (v10)
      {
        id v2 = (id)[NSNumber numberWithUnsignedInteger:v10];
        UIAccessibilityPostNotification(0x434u, v2);
      }
    }
  }
  objc_storeStrong(&location, 0);
}

+ (id)safeCategoryTargetClassName
{
  return @"UIScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axVerticalScrollBar
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___axVerticalScrollBar);
}

- (void)_axSetVerticalScrollBar:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_axHorizontalScrollBar
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___axHorizontalScrollBar);
}

- (void)_axSetHorizontalScrollBar:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (BOOL)_axAlwaysScrollsContentIntoView
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (void)_axSetAlwaysScrollsContentIntoView:(BOOL)a3
{
}

- (id)_axOverrideShowsVerticalScrollBars
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___axOverrideShowsVerticalScrollBars);
}

- (void)_axSetOverrideShowsVerticalScrollBars:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_axOverrideShowsHorizontallScrollBars
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___axOverrideShowsHorizontallScrollBars);
}

- (void)_axSetOverrideShowsHorizontallScrollBars:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_axLastEdgeBoundaries
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___axLastEdgeBoundaries);
}

- (void)_axSetLastEdgeBoundaries:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  BOOL v13 = location;
  id v12 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v10 = @"UIScrollView";
  id v4 = @"_staticScrollBar";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  uint64_t v3 = "UIView<_UIScrollViewScrollIndicator>";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", @"UIScrollView", @"_verticalScrollIndicator");
  [location[0] validateClass:@"UIScrollView" hasInstanceVariable:@"_horizontalScrollIndicator" withType:"UIView<_UIScrollViewScrollIndicator>"];
  BOOL v6 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"_UIScrollViewScrollIndicator");
  [location[0] validateClass:@"UIScrollView" isKindOfClass:@"UIView"];
  id v5 = "@";
  [location[0] validateClass:@"UIScrollView" hasInstanceMethod:@"_staticScrollBar" withFullSignature:0];
  id v9 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"setDelegate:", v5, 0);
  char v8 = "{CGPoint=dd}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_setContentOffset: duration: animationCurve:", v9, "{CGPoint=dd}", "d", "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_notifyDidScroll", v9, 0);
  BOOL v7 = "B";
  [location[0] validateClass:v10 hasInstanceMethod:@"_forwardsToParentScroller" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_defaultFocusRegionFrame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_scrollViewDidEndDeceleratingForDelegate", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_animatedTargetOffset", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_minimumContentOffset", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_maximumContentOffset", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_adjustScrollerIndicators:alwaysShowingThem:", v9, v7, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_hideScrollIndicators", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_newScrollOffsetForScrubReturningAnimated:", v8, "^B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_didEndDirectManipulationWithScrubbingDirection:", v9, "q", 0);
  v11 = "{UIEdgeInsets=dddd}";
  [location[0] validateClass:v10 hasInstanceMethod:@"_effectiveVerticalScrollIndicatorInsets" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_effectiveHorizontalScrollIndicatorInsets", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIPopoverPresentationController", @"_additionalSafeAreaInsets", v11, 0);
  objc_storeStrong(v13, v12);
}

- (BOOL)_axShowsVerticalScrollBar
{
  id v2 = [(UIScrollViewAccessibility *)self _axOverrideShowsVerticalScrollBars];
  BOOL v7 = v2 == 0;

  if (v7)
  {
    BOOL v5 = 0;
    if ([(UIScrollViewAccessibility *)self showsVerticalScrollIndicator])
    {
      BOOL v4 = 1;
      if (!-[UIScrollViewAccessibility _axBaseScrollUpPageSupported](self)) {
        return -[UIScrollViewAccessibility _axBaseScrollDownPageSupported](self);
      }
      return v4;
    }
    return v5;
  }
  else
  {
    id v6 = [(UIScrollViewAccessibility *)self _axOverrideShowsVerticalScrollBars];
    BOOL v9 = [v6 BOOLValue] & 1;
  }
  return v9;
}

- (BOOL)_axBaseScrollUpPageSupported
{
  if (a1)
  {
    id v1 = -[UIScrollViewAccessibility _accessibilityFindRefreshControl](a1);
    BOOL v5 = v1 == 0;

    if (v5)
    {
      [a1 contentOffset];
      double v7 = v2;
      double v6 = 0.0;
      if ([a1 _accessibilityUseContentInset])
      {
        [a1 _accessibilityContentInset];
        double v6 = 0.0 - v3;
      }
      return v7 > v6;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return 0;
  }
}

- (BOOL)_axBaseScrollDownPageSupported
{
  id v12 = a1;
  if (a1)
  {
    [v12 _accessibilityContentSize];
    location[1] = v1;
    double v11 = v2;
    location[0] = v12;
    [location[0] contentOffset];
    double v9 = v3;
    [location[0] visibleBounds];
    double v8 = v4;
    double v7 = v11;
    if ([v12 _accessibilityUseContentInset])
    {
      [v12 _accessibilityContentInset];
      double v7 = v11 + v5;
    }
    BOOL v13 = v9 + v8 < v7;
    objc_storeStrong(location, 0);
  }
  else
  {
    return 0;
  }
  return v13;
}

- (BOOL)_axShowsHorizontalScrollBar
{
  id v2 = [(UIScrollViewAccessibility *)self _axOverrideShowsHorizontallScrollBars];
  BOOL v7 = v2 == 0;

  if (v7)
  {
    BOOL v5 = 0;
    if ([(UIScrollViewAccessibility *)self showsHorizontalScrollIndicator])
    {
      BOOL v4 = 1;
      if (!-[UIScrollViewAccessibility _axBaseScrollLeftPageSupported](self)) {
        return -[UIScrollViewAccessibility _axBaseScrollRightPageSupported](self);
      }
      return v4;
    }
    return v5;
  }
  else
  {
    id v6 = [(UIScrollViewAccessibility *)self _axOverrideShowsHorizontallScrollBars];
    BOOL v9 = [v6 BOOLValue] & 1;
  }
  return v9;
}

- (BOOL)_axBaseScrollLeftPageSupported
{
  if (a1)
  {
    [a1 contentOffset];
    return v1 < -[UIScrollViewAccessibility _axMaximumContentOffset](a1);
  }
  else
  {
    return 0;
  }
}

- (BOOL)_axBaseScrollRightPageSupported
{
  if (a1)
  {
    [a1 contentOffset];
    return v1 > -[UIScrollViewAccessibility _axMinimumContentOffset](a1);
  }
  else
  {
    return 0;
  }
}

- (id)_accessibilityVerticalScrollBarElement
{
  SEL v15 = self;
  v14[1] = (id)a2;
  id v2 = [(UIScrollViewAccessibility *)self _axVerticalScrollBar];
  BOOL v6 = v2 == 0;

  if (v6)
  {
    if ([(UIScrollViewAccessibility *)v15 _axShowsVerticalScrollBar])
    {
      v14[0] = [[UIScrollBarIndicatorAccessibilityElement alloc] initWithAccessibilityContainer:v15];
      -[UIScrollBarIndicatorAccessibilityElement setOrientation:]((uint64_t)v14[0], 1);
      objc_initWeak(&location, v15);
      id v5 = v14[0];
      uint64_t v7 = MEMORY[0x263EF8330];
      int v8 = -1073741824;
      int v9 = 0;
      uint64_t v10 = __67__UIScrollViewAccessibility__accessibilityVerticalScrollBarElement__block_invoke;
      double v11 = &unk_2650AE230;
      objc_copyWeak(&v12, &location);
      [v5 _setAccessibilityFrameBlock:&v7];
      [(UIScrollViewAccessibility *)v15 _axSetVerticalScrollBar:v14[0]];
      id v16 = v14[0];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      objc_storeStrong(v14, 0);
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = [(UIScrollViewAccessibility *)v15 _axVerticalScrollBar];
  }
  double v3 = v16;

  return v3;
}

double __67__UIScrollViewAccessibility__accessibilityVerticalScrollBarElement__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)[WeakRetained safeUIViewForKey:@"_verticalScrollIndicator"];
  [v3 accessibilityFrame];
  double v5 = v1;

  return v5;
}

- (id)_accessibilityHorizontalScrollBarElement
{
  SEL v15 = self;
  v14[1] = (id)a2;
  id v2 = [(UIScrollViewAccessibility *)self _axHorizontalScrollBar];
  BOOL v6 = v2 == 0;

  if (v6)
  {
    if ([(UIScrollViewAccessibility *)v15 _axShowsHorizontalScrollBar])
    {
      v14[0] = [[UIScrollBarIndicatorAccessibilityElement alloc] initWithAccessibilityContainer:v15];
      -[UIScrollBarIndicatorAccessibilityElement setOrientation:]((uint64_t)v14[0], 2);
      objc_initWeak(&location, v15);
      id v5 = v14[0];
      uint64_t v7 = MEMORY[0x263EF8330];
      int v8 = -1073741824;
      int v9 = 0;
      uint64_t v10 = __69__UIScrollViewAccessibility__accessibilityHorizontalScrollBarElement__block_invoke;
      double v11 = &unk_2650AE230;
      objc_copyWeak(&v12, &location);
      [v5 _setAccessibilityFrameBlock:&v7];
      [(UIScrollViewAccessibility *)v15 _axSetHorizontalScrollBar:v14[0]];
      id v16 = v14[0];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      objc_storeStrong(v14, 0);
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = [(UIScrollViewAccessibility *)v15 _axHorizontalScrollBar];
  }
  id v3 = v16;

  return v3;
}

double __69__UIScrollViewAccessibility__accessibilityHorizontalScrollBarElement__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)[WeakRetained safeUIViewForKey:@"_horizontalScrollIndicator"];
  [v3 accessibilityFrame];
  double v5 = v1;

  return v5;
}

- (double)_accessibilityZoomScale
{
  [(UIScrollViewAccessibility *)self zoomScale];
  return result;
}

- (void)_accessibilityScrollToTopWithAnnouncement:(id)obj touchLocation:(double)a4 originalHandler:(double)a5
{
  double v19 = a4;
  double v20 = a5;
  id v18 = a1;
  char v17 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (v18)
  {
    id v5 = v18;
    uint64_t v7 = MEMORY[0x263EF8330];
    int v8 = -1073741824;
    int v9 = 0;
    uint64_t v10 = __101__UIScrollViewAccessibility__accessibilityScrollToTopWithAnnouncement_touchLocation_originalHandler___block_invoke;
    double v11 = &unk_2650AF0D0;
    char v14 = v17 & 1;
    id v12 = v18;
    id v13 = location;
    v6.receiver = v5;
    v6.super_class = (Class)UIScrollViewAccessibility;
    objc_msgSendSuper2(&v6, sel__scrollToTopFromTouchAtScreenLocation_resultHandler_, &v7, v19, v20);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
    int v15 = 0;
  }
  else
  {
    int v15 = 1;
  }
  objc_storeStrong(&location, 0);
}

void __101__UIScrollViewAccessibility__accessibilityScrollToTopWithAnnouncement_touchLocation_originalHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v11 = a1;
  char v10 = a2 & 1;
  v9[1] = (id)a1;
  if (*(unsigned char *)(a1 + 48))
  {
    v9[0] = (id)[*(id *)(a1 + 32) safeValueForKey:@"delegate"];
    id v8 = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v2 = (id)[*(id *)(a1 + 32) safeValueForKey:@"dataSource"];
      id v3 = v8;
      id v8 = v2;
    }
    id v5 = *(id *)(a1 + 32);
    id v6 = v9[0];
    id v7 = v8;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(v9, 0);
  }
  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __101__UIScrollViewAccessibility__accessibilityScrollToTopWithAnnouncement_touchLocation_originalHandler___block_invoke_2(uint64_t a1)
{
}

- (void)_accessibilityAnnounceDelayedStatus
{
  if (a1)
  {
    UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
    id v2 = (id)[a1 _accessibilityScrollStatus];
    UIAccessibilityPostNotification(notification, v2);
  }
}

- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4
{
  CGPoint v7 = a3;
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    [(UIScrollViewAccessibility *)v6 _accessibilityScrollToTopWithAnnouncement:location[0] touchLocation:v7.x originalHandler:v7.y];
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UIScrollViewAccessibility;
    -[UIScrollViewAccessibility _scrollToTopFromTouchAtScreenLocation:resultHandler:](&v4, sel__scrollToTopFromTouchAtScreenLocation_resultHandler_, location[0], v7.x, v7.y);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityScrollingEnabled
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UIScrollViewAccessibility *)self _accessibilityUserDefinedScrollingEnabled];
  if (location[0])
  {
    char v6 = [location[0] BOOLValue] & 1;
  }
  else
  {
    id v3 = (id)[(UIScrollViewAccessibility *)v5 safeValueForKey:@"isScrollEnabled"];
    char v6 = [v3 BOOLValue] & 1;
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  id v2 = (id)[(UIScrollViewAccessibility *)self isAccessibilityUserDefinedScrollAncestor];
  BOOL v5 = v2 == 0;

  if (v5) {
    return [(UIScrollViewAccessibility *)self _accessibilityScrollingEnabled];
  }
  id v4 = (id)[(UIScrollViewAccessibility *)self isAccessibilityUserDefinedScrollAncestor];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (CGRect)_accessibilityScrollViewVisibleFrame
{
  [(UIScrollViewAccessibility *)self visibleBounds];
  UIAccessibilityFrameForBounds();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)_accessibilityFirstOpaqueElement
{
  BOOL v7 = (UIView *)self;
  location[1] = (id)a2;
  location[0] = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
  double v5 = v7;
  if (((uint64_t (*)(void))__61__UIScrollViewAccessibility__accessibilityFirstOpaqueElement__block_invoke)())
  {
    id v8 = -[UIScrollViewAccessibility _accessibilityFirstLastOpaqueElement:options:](v7, 1, location[0]);
    int v4 = 1;
  }
  else
  {
    int v4 = 0;
  }
  objc_storeStrong((id *)&v5, 0);
  if (!v4) {
    id v8 = (id)[(UIView *)v7 _accessibilityFirstOpaqueElementWithOptions:location[0]];
  }
  objc_storeStrong(location, 0);
  double v2 = v8;

  return v2;
}

BOOL __61__UIScrollViewAccessibility__accessibilityFirstOpaqueElement__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  id v18 = (dispatch_once_t *)&kUIScrollViewScrollVerticalStorageKey_block_invoke_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_30);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityFirstOpaqueElement);
  IMP Implementation = 0;
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v12 = (id)AXLogCommon();
    char v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      os_log_type_t type = v11;
      id v8 = NSStringFromSelector(sel__accessibilityFirstOpaqueElement);
      int v4 = v8;
      char v10 = v4;
      double v2 = (objc_class *)objc_opt_class();
      BOOL v7 = NSStringFromClass(v2);
      int v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)kUIScrollViewScrollVerticalStorageKey_block_invoke_BaseImplementation;
}

void __61__UIScrollViewAccessibility__accessibilityFirstOpaqueElement__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityFirstOpaqueElement);
  if (InstanceMethod)
  {
    kUIScrollViewScrollVerticalStorageKey_block_invoke_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      BOOL v7 = NSStringFromSelector(sel__accessibilityFirstOpaqueElement);
      double v3 = v7;
      int v9 = v3;
      double v2 = (objc_class *)objc_opt_class();
      char v6 = NSStringFromClass(v2);
      id v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilityFirstLastOpaqueElement:(id)obj options:
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v36 = a1;
  char v35 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (v36)
  {
    char v32 = 0;
    char v24 = 1;
    if (([(UIView *)v36 _accessibilityOpaqueElementScrollsContentIntoView] & 1) == 0)char v24 = [(UIView *)v36 _axAlwaysScrollsContentIntoView]; {
    char v32 = v24 & 1;
    }
    if (([(UIView *)v36 _accessibilityShouldPreventOpaqueScrolling] & 1) == 0
      && (v32 & 1) != 0)
    {
      if (v35) {
        uint64_t v3 = 1;
      }
      else {
        uint64_t v3 = 2;
      }
      [(UIView *)v36 _accessibilityScrollOpaqueElementIntoView:v3 previousScroller:0];
    }
    id v31 = (id)[(UIView *)v36 _accessibilitySortedElementsWithinWithOptions:location];
    if ((v35 & 1) == 0)
    {
      id v23 = (id)[v31 reverseObjectEnumerator];
      id v4 = (id)[v23 allObjects];
      id v5 = v31;
      id v31 = v4;
    }
    [(UIView *)v36 visibleBounds];
    CGRect rect = v41;
    CGRect v30 = UIAccessibilityConvertFrameToScreenCoordinates(v41, v36);
    memset(__b, 0, sizeof(__b));
    id obja = v31;
    uint64_t v22 = [obja countByEnumeratingWithState:__b objects:v38 count:16];
    if (v22)
    {
      uint64_t v18 = *(void *)__b[2];
      uint64_t v19 = 0;
      unint64_t v20 = v22;
      while (1)
      {
        uint64_t v17 = v19;
        if (*(void *)__b[2] != v18) {
          objc_enumerationMutation(obja);
        }
        id v28 = *(id *)(__b[1] + 8 * v19);
        NSClassFromString(&cfstr_Uiscrollviewsc_0.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [v28 accessibilityFrame];
          r2.origin.x = v6;
          r2.origin.y = v7;
          r2.size.width = v8;
          r2.size.double height = v9;
          CGRect v42 = CGRectIntersection(v30, r2);
          double height = v42.size.height;
          if (([v28 _accessibilityIsNotFirstElement] & 1) == 0)
          {
            [v28 accessibilityFrame];
            double v16 = v10;
            [(UIView *)v36 _accessibilityVisibleItemDenominator];
            if (height > v16 / v11) {
              break;
            }
            double v15 = v30.size.height;
            [(UIView *)v36 _accessibilityVisibleItemDenominator];
            if (height > v15 / v12) {
              break;
            }
          }
        }
        ++v19;
        if (v17 + 1 >= v20)
        {
          uint64_t v19 = 0;
          unint64_t v20 = [obja countByEnumeratingWithState:__b objects:v38 count:16];
          if (!v20) {
            goto LABEL_24;
          }
        }
      }
      id v37 = v28;
      int v33 = 1;
    }
    else
    {
LABEL_24:
      int v33 = 0;
    }

    if (!v33)
    {
      id v37 = 0;
      int v33 = 1;
    }
    objc_storeStrong(&v31, 0);
  }
  else
  {
    id v37 = 0;
    int v33 = 1;
  }
  objc_storeStrong(&location, 0);
  uint64_t v13 = v37;

  return v13;
}

- (id)_accessibilityFirstOpaqueElementWithOptions:(id)a3
{
  double v15 = (UIView *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  double v10 = __73__UIScrollViewAccessibility__accessibilityFirstOpaqueElementWithOptions___block_invoke;
  double v11 = &unk_2650AE580;
  double v12 = v15;
  char v13 = ((uint64_t (*)(void))__73__UIScrollViewAccessibility__accessibilityFirstOpaqueElementWithOptions___block_invoke)() & 1;
  id v5 = v15;
  char v6 = ((uint64_t (*)(void))__73__UIScrollViewAccessibility__accessibilityFirstOpaqueElementWithOptions___block_invoke_415)() & 1;
  if (v13 & 1) == 0 || (v6) {
    id v16 = -[UIScrollViewAccessibility _accessibilityFirstLastOpaqueElement:options:](v15, 1, location[0]);
  }
  else {
    id v16 = (id)[(UIView *)v15 _accessibilityFirstOpaqueElement];
  }
  objc_storeStrong((id *)&v5, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(location, 0);
  uint64_t v3 = v16;

  return v3;
}

BOOL __73__UIScrollViewAccessibility__accessibilityFirstOpaqueElementWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  uint64_t v18 = (dispatch_once_t *)&kUIScrollViewScrollVerticalStorageKey_block_invoke_2_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_414);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityFirstOpaqueElement);
  IMP Implementation = 0;
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v12 = (id)AXLogCommon();
    char v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      os_log_type_t type = v11;
      int v8 = NSStringFromSelector(sel__accessibilityFirstOpaqueElement);
      id v4 = v8;
      double v10 = v4;
      double v2 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v2);
      int v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)kUIScrollViewScrollVerticalStorageKey_block_invoke_2_BaseImplementation;
}

void __73__UIScrollViewAccessibility__accessibilityFirstOpaqueElementWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityFirstOpaqueElement);
  if (InstanceMethod)
  {
    kUIScrollViewScrollVerticalStorageKey_block_invoke_2_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      uint64_t v7 = NSStringFromSelector(sel__accessibilityFirstOpaqueElement);
      uint64_t v3 = v7;
      int v9 = v3;
      double v2 = (objc_class *)objc_opt_class();
      char v6 = NSStringFromClass(v2);
      int v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

BOOL __73__UIScrollViewAccessibility__accessibilityFirstOpaqueElementWithOptions___block_invoke_415(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  uint64_t v18 = (dispatch_once_t *)&kUIScrollViewScrollVerticalStorageKey_block_invoke_3_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_418);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityFirstOpaqueElementWithOptions_);
  IMP Implementation = 0;
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v12 = (id)AXLogCommon();
    char v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      os_log_type_t type = v11;
      int v8 = NSStringFromSelector(sel__accessibilityFirstOpaqueElementWithOptions_);
      id v4 = v8;
      char v10 = v4;
      double v2 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v2);
      int v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)kUIScrollViewScrollVerticalStorageKey_block_invoke_3_BaseImplementation;
}

void __73__UIScrollViewAccessibility__accessibilityFirstOpaqueElementWithOptions___block_invoke_2_416(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityFirstOpaqueElementWithOptions_);
  if (InstanceMethod)
  {
    kUIScrollViewScrollVerticalStorageKey_block_invoke_3_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      uint64_t v7 = NSStringFromSelector(sel__accessibilityFirstOpaqueElementWithOptions_);
      uint64_t v3 = v7;
      int v9 = v3;
      double v2 = (objc_class *)objc_opt_class();
      char v6 = NSStringFromClass(v2);
      int v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilityLastOpaqueElement
{
  uint64_t v7 = (UIView *)self;
  location[1] = (id)a2;
  location[0] = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
  id v5 = v7;
  if (((uint64_t (*)(void))__60__UIScrollViewAccessibility__accessibilityLastOpaqueElement__block_invoke)())
  {
    id v8 = -[UIScrollViewAccessibility _accessibilityFirstLastOpaqueElement:options:](v7, 0, location[0]);
    int v4 = 1;
  }
  else
  {
    int v4 = 0;
  }
  objc_storeStrong((id *)&v5, 0);
  if (!v4) {
    id v8 = (id)[(UIView *)v7 _accessibilityLastOpaqueElementWithOptions:location[0]];
  }
  objc_storeStrong(location, 0);
  double v2 = v8;

  return v2;
}

BOOL __60__UIScrollViewAccessibility__accessibilityLastOpaqueElement__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  uint64_t v18 = (dispatch_once_t *)&kUIScrollViewScrollVerticalStorageKey_block_invoke_4_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_422);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityLastOpaqueElement);
  IMP Implementation = 0;
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v12 = (id)AXLogCommon();
    char v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      os_log_type_t type = v11;
      id v8 = NSStringFromSelector(sel__accessibilityLastOpaqueElement);
      int v4 = v8;
      char v10 = v4;
      double v2 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v2);
      int v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)kUIScrollViewScrollVerticalStorageKey_block_invoke_4_BaseImplementation;
}

void __60__UIScrollViewAccessibility__accessibilityLastOpaqueElement__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityLastOpaqueElement);
  if (InstanceMethod)
  {
    kUIScrollViewScrollVerticalStorageKey_block_invoke_4_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      uint64_t v7 = NSStringFromSelector(sel__accessibilityLastOpaqueElement);
      uint64_t v3 = v7;
      int v9 = v3;
      double v2 = (objc_class *)objc_opt_class();
      char v6 = NSStringFromClass(v2);
      id v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilityLastOpaqueElementWithOptions:(id)a3
{
  uint64_t v15 = (UIView *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  char v10 = __72__UIScrollViewAccessibility__accessibilityLastOpaqueElementWithOptions___block_invoke;
  id v11 = &unk_2650AE580;
  id v12 = v15;
  char v13 = ((uint64_t (*)(void))__72__UIScrollViewAccessibility__accessibilityLastOpaqueElementWithOptions___block_invoke)() & 1;
  id v5 = v15;
  char v6 = ((uint64_t (*)(void))__72__UIScrollViewAccessibility__accessibilityLastOpaqueElementWithOptions___block_invoke_427)() & 1;
  if (v13 & 1) == 0 || (v6) {
    id v16 = -[UIScrollViewAccessibility _accessibilityFirstLastOpaqueElement:options:](v15, 0, location[0]);
  }
  else {
    id v16 = (id)[(UIView *)v15 _accessibilityLastOpaqueElement];
  }
  objc_storeStrong((id *)&v5, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(location, 0);
  uint64_t v3 = v16;

  return v3;
}

BOOL __72__UIScrollViewAccessibility__accessibilityLastOpaqueElementWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  uint64_t v18 = (dispatch_once_t *)&kUIScrollViewScrollVerticalStorageKey_block_invoke_5_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_426);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityLastOpaqueElement);
  IMP Implementation = 0;
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v12 = (id)AXLogCommon();
    char v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      os_log_type_t type = v11;
      int v8 = NSStringFromSelector(sel__accessibilityLastOpaqueElement);
      int v4 = v8;
      char v10 = v4;
      double v2 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v2);
      int v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)kUIScrollViewScrollVerticalStorageKey_block_invoke_5_BaseImplementation;
}

void __72__UIScrollViewAccessibility__accessibilityLastOpaqueElementWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityLastOpaqueElement);
  if (InstanceMethod)
  {
    kUIScrollViewScrollVerticalStorageKey_block_invoke_5_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      uint64_t v7 = NSStringFromSelector(sel__accessibilityLastOpaqueElement);
      uint64_t v3 = v7;
      int v9 = v3;
      double v2 = (objc_class *)objc_opt_class();
      char v6 = NSStringFromClass(v2);
      int v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

BOOL __72__UIScrollViewAccessibility__accessibilityLastOpaqueElementWithOptions___block_invoke_427(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  uint64_t v18 = (dispatch_once_t *)&kUIScrollViewScrollVerticalStorageKey_block_invoke_6_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_430);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityLastOpaqueElementWithOptions_);
  IMP Implementation = 0;
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v12 = (id)AXLogCommon();
    char v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      os_log_type_t type = v11;
      int v8 = NSStringFromSelector(sel__accessibilityLastOpaqueElementWithOptions_);
      int v4 = v8;
      char v10 = v4;
      double v2 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v2);
      int v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)kUIScrollViewScrollVerticalStorageKey_block_invoke_6_BaseImplementation;
}

void __72__UIScrollViewAccessibility__accessibilityLastOpaqueElementWithOptions___block_invoke_2_428(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilityLastOpaqueElementWithOptions_);
  if (InstanceMethod)
  {
    kUIScrollViewScrollVerticalStorageKey_block_invoke_6_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      uint64_t v7 = NSStringFromSelector(sel__accessibilityLastOpaqueElementWithOptions_);
      uint64_t v3 = v7;
      int v9 = v3;
      double v2 = (objc_class *)objc_opt_class();
      char v6 = NSStringFromClass(v2);
      int v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilityFocusAbsoluteFirstLastOpaqueElement:(BOOL)a3 technology:(id)a4 honorsGroups:(BOOL)a5 shouldAlwaysScroll:(BOOL)a6
{
  uint64_t v17 = self;
  SEL v16 = a2;
  BOOL v15 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  BOOL v13 = a5;
  BOOL v12 = a6;
  [(UIScrollViewAccessibility *)v17 _axSetAlwaysScrollsContentIntoView:a6];
  v10.receiver = v17;
  v10.super_class = (Class)UIScrollViewAccessibility;
  id v11 = [(UIScrollViewAccessibility *)&v10 _accessibilityFocusAbsoluteFirstLastOpaqueElement:v15 technology:location honorsGroups:a5 shouldAlwaysScroll:a6];
  [(UIScrollViewAccessibility *)v17 _axSetAlwaysScrollsContentIntoView:0];
  id v9 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);

  return v9;
}

- (BOOL)_accessibilityIncludeRoleInGroupNavigationOnly
{
  return 1;
}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(@"group.role");
}

- (CGPoint)_accessibilityContentOffset
{
  [(UIScrollViewAccessibility *)self contentOffset];
  result.y = v3;
  result.x = v2;
  return result;
}

- (uint64_t)_axScrollViewPagingEnabled
{
  if (a1)
  {
    id v1 = (id)[a1 _accessibilityPagingEnabled];
    BOOL v4 = v1 == 0;

    if (v4)
    {
      char v6 = [a1 isPagingEnabled] & 1;
    }
    else
    {
      id v3 = (id)[a1 _accessibilityPagingEnabled];
      char v6 = [v3 BOOLValue] & 1;
    }
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

- (BOOL)_axShouldScrollToAlignWithPage
{
  return -[UIScrollViewAccessibility _axScrollViewPagingEnabled](self) & 1;
}

- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  CGRect v118 = a3;
  v117 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  [(UIScrollViewAccessibility *)v117 visibleBounds];
  rect.origin.x = v4;
  rect.origin.y = v5;
  rect.size.width = v6;
  rect.size.double height = v7;
  os_log_t oslog = (os_log_t)(id)AXLogScrollToVisible();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    log = oslog;
    os_log_type_t v76 = type;
    v78 = NSStringFromCGRect(v118);
    v73 = v78;
    v112 = v73;
    id v74 = location[0];
    v77 = NSStringFromCGRect(rect);
    v111 = v77;
    __os_log_helper_16_2_3_8_66_8_66_8_66((uint64_t)v125, (uint64_t)v73, (uint64_t)v74, (uint64_t)v111);
    _os_log_debug_impl(&dword_2402B7000, log, v76, "Original frame %{public}@, view %{public}@, scroller bounds %{public}@", v125, 0x20u);

    objc_storeStrong((id *)&v111, 0);
    objc_storeStrong((id *)&v112, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (location[0] == v117)
  {
    os_log_t v110 = (os_log_t)(id)AXLogScrollToVisible();
    os_log_type_t v109 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
    {
      v71 = v110;
      os_log_type_t v72 = v109;
      __os_log_helper_16_0_0(v108);
      _os_log_debug_impl(&dword_2402B7000, v71, v72, "Trying to scroll view within itself.  Doing nothing.", v108, 2u);
    }
    objc_storeStrong((id *)&v110, 0);
  }
  else
  {
    UIAccessibilityFrameToBounds();
    v107.origin.x = v8;
    v107.origin.y = v9;
    v107.size.width = v10;
    v107.size.double height = v11;
    CGRect v118 = v107;
  }
  os_log_t v106 = (os_log_t)(id)AXLogScrollToVisible();
  os_log_type_t v105 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
  {
    v68 = v106;
    os_log_type_t v69 = v105;
    v70 = NSStringFromCGRect(v118);
    v104 = v70;
    __os_log_helper_16_2_2_8_66_8_66((uint64_t)v124, (uint64_t)v104, (uint64_t)v117);
    _os_log_debug_impl(&dword_2402B7000, v68, v69, "Will scroll to frame %{public}@ in bounds for %{public}@", v124, 0x16u);

    objc_storeStrong((id *)&v104, 0);
  }
  objc_storeStrong((id *)&v106, 0);
  char v103 = 0;
  [(UIScrollViewAccessibility *)v117 _accessibilityVisibleContentInset];
  insets.top = v12;
  insets.left = v13;
  insets.bottom = v14;
  insets.right = v15;
  os_log_t v101 = (os_log_t)(id)AXLogScrollToVisible();
  os_log_type_t v100 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
  {
    v65 = v101;
    os_log_type_t v66 = v100;
    v67 = NSStringFromUIEdgeInsets(insets);
    v99 = v67;
    __os_log_helper_16_2_1_8_66((uint64_t)v123, (uint64_t)v99);
    _os_log_debug_impl(&dword_2402B7000, v65, v66, "Visible content inset is %{public}@", v123, 0xCu);

    objc_storeStrong((id *)&v99, 0);
  }
  objc_storeStrong((id *)&v101, 0);
  insets.top = CGFloatMin_0(0.0, -insets.top);
  insets.left = CGFloatMin_0(0.0, -insets.left);
  insets.bottom = CGFloatMin_0(0.0, -insets.bottom);
  insets.right = CGFloatMin_0(0.0, -insets.right);
  CGPoint origin = v118.origin;
  v97.origin.x = UIEdgeInsetsInsetRect_0(v118.origin.x, v118.origin.y, v118.size.width, v118.size.height, insets.top, insets.left);
  v97.origin.y = v16;
  v97.size.width = v17;
  v97.size.double height = v18;
  CGRect v118 = v97;
  double MinX = CGRectGetMinX(v97);
  if (MinX >= CGRectGetMinX(rect)
    || (v62 = CGRectGetMinX(v118), CGFloat v19 = CGRectGetMinX(rect), v63 = 1, AXCGFAbs_0(v62 - v19) < 0.001))
  {
    double MinY = CGRectGetMinY(v118);
    if (MinY >= CGRectGetMinY(rect)
      || (v60 = CGRectGetMinY(v118), CGFloat v20 = CGRectGetMinY(rect), v63 = 1, AXCGFAbs_0(v60 - v20) < 0.001))
    {
      double MaxX = CGRectGetMaxX(v118);
      if (MaxX <= CGRectGetMaxX(rect)
        || (v58 = CGRectGetMaxX(v118), CGFloat v21 = CGRectGetMaxX(rect), v63 = 1, AXCGFAbs_0(v58 - v21) < 0.001))
      {
        double MaxY = CGRectGetMaxY(v118);
        BOOL v57 = 0;
        if (MaxY > CGRectGetMaxY(rect))
        {
          double v55 = CGRectGetMaxY(v118);
          CGFloat v22 = CGRectGetMaxY(rect);
          BOOL v57 = AXCGFAbs_0(v55 - v22) >= 0.001;
        }
        char v63 = v57;
      }
    }
  }
  char v103 = v63;
  os_log_t v96 = (os_log_t)(id)AXLogScrollToVisible();
  os_log_type_t v95 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
  {
    v52 = v96;
    os_log_type_t v53 = v95;
    v54 = NSStringFromCGRect(v118);
    v94 = v54;
    __os_log_helper_16_2_2_8_66_4_0((uint64_t)v122, (uint64_t)v94, v103 & 1);
    _os_log_debug_impl(&dword_2402B7000, v52, v53, "After insetting, frame is %{public}@.  Should scroll: %i", v122, 0x12u);

    objc_storeStrong((id *)&v94, 0);
  }
  objc_storeStrong((id *)&v96, 0);
  if ((v103 & 1) == 0) {
    goto LABEL_45;
  }
  [(UIScrollViewAccessibility *)v117 bounds];
  CGRect rect1 = v127;
  if (CGRectContainsRect(v127, v118))
  {
    os_log_t v82 = (os_log_t)(id)AXLogScrollToVisible();
    os_log_type_t v81 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
    {
      char v32 = v82;
      os_log_type_t v33 = v81;
      char v35 = NSStringFromCGRect(rect1);
      id v31 = v35;
      v80 = v31;
      v34 = NSStringFromCGRect(v118);
      v79 = v34;
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v120, (uint64_t)v31, (uint64_t)v79);
      _os_log_debug_impl(&dword_2402B7000, v32, v33, "Real bounds %{public}@ already contained frame %{public}@, so doing nothing.", v120, 0x16u);

      objc_storeStrong((id *)&v79, 0);
      objc_storeStrong((id *)&v80, 0);
    }
    objc_storeStrong((id *)&v82, 0);
LABEL_45:
    char v119 = 0;
    int v83 = 1;
    goto LABEL_46;
  }
  [(UIScrollViewAccessibility *)v117 contentOffset];
  point.x = v23;
  point.y = v24;
  if ([(UIScrollViewAccessibility *)v117 _axShouldScrollToAlignWithPage])
  {
    v91.x = [(UIScrollViewAccessibility *)v117 _axPageAlignedContentOffsetForPoint:origin.x forValidation:origin.y];
    v91.y = v25;
    CGPoint point = v91;
    os_log_t v90 = (os_log_t)(id)AXLogScrollToVisible();
    os_log_type_t v89 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
    {
      v50 = v90;
      os_log_type_t v51 = v89;
      __os_log_helper_16_0_0(v88);
      _os_log_debug_impl(&dword_2402B7000, v50, v51, "Aligning content offset for page.", v88, 2u);
    }
    objc_storeStrong((id *)&v90, 0);
    goto LABEL_39;
  }
  double Width = UIRectGetWidth(v118.origin.x, v118.origin.y, v118.size.width);
  if (Width > UIRectGetWidth(rect1.origin.x, rect1.origin.y, rect1.size.width)) {
    goto LABEL_33;
  }
  double v48 = UIRectGetMaxX(v118.origin.x, v118.origin.y, v118.size.width);
  if (v48 >= UIRectGetMaxX(rect1.origin.x, rect1.origin.y, rect1.size.width))
  {
    double v47 = UIRectGetMaxX(v118.origin.x, v118.origin.y, v118.size.width);
    point.x = v47 - UIRectGetWidth(rect1.origin.x, rect1.origin.y, rect1.size.width);
    goto LABEL_34;
  }
  UIRectGetMinX();
  double v46 = v26;
  UIRectGetMinX();
  if (v46 < v27)
  {
LABEL_33:
    UIRectGetMinX();
    point.x = v28;
  }
LABEL_34:
  double Height = UIRectGetHeight(v118.origin.x, v118.origin.y, v118.size.width, v118.size.height);
  if (Height > UIRectGetHeight(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height)) {
    goto LABEL_38;
  }
  double v44 = UIRectGetMaxY(v118.origin.x, v118.origin.y, v118.size.width, v118.size.height);
  if (v44 < UIRectGetMaxY(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height))
  {
    double v42 = UIRectGetMinY(v118.origin.x, v118.origin.y);
    if (v42 >= UIRectGetMinY(rect1.origin.x, rect1.origin.y)) {
      goto LABEL_39;
    }
LABEL_38:
    point.y = UIRectGetMinY(v118.origin.x, v118.origin.y);
    goto LABEL_39;
  }
  double v43 = UIRectGetMaxY(v118.origin.x, v118.origin.y, v118.size.width, v118.size.height);
  point.y = v43 - UIRectGetHeight(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height);
LABEL_39:
  os_log_t v87 = (os_log_t)(id)AXLogScrollToVisible();
  os_log_type_t v86 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
  {
    v38 = v87;
    os_log_type_t v39 = v86;
    CGRect v41 = NSStringFromCGPoint(point);
    id v37 = v41;
    v85 = v37;
    v40 = NSStringFromCGRect(rect1);
    v84 = v40;
    __os_log_helper_16_2_2_8_66_8_66((uint64_t)v121, (uint64_t)v37, (uint64_t)v84);
    _os_log_debug_impl(&dword_2402B7000, v38, v39, "Computed content offset: %{public}@.  Bounds: %{public}@", v121, 0x16u);

    objc_storeStrong((id *)&v84, 0);
    objc_storeStrong((id *)&v85, 0);
  }
  objc_storeStrong((id *)&v87, 0);
  v36 = v117;
  BOOL v29 = [(UIScrollViewAccessibility *)v117 _accessibilityShouldAnimateScrollToVisible];
  [(UIScrollViewAccessibility *)v36 accessibilityApplyScrollContent:0 sendScrollStatus:v29 animated:point];
  char v119 = 1;
  int v83 = 1;
LABEL_46:
  objc_storeStrong(location, 0);
  return v119 & 1;
}

- (double)_axPageAlignedContentOffsetForPoint:(double)a3 forValidation:(double)a4
{
  double v25 = a3;
  double v26 = a4;
  CGFloat v24 = a1;
  char v23 = a2 & 1;
  if (a1)
  {
    double v21 = -[UIScrollViewAccessibility _axPageSize](v24);
    double v22 = v4;
    id location = v24;
    [location _pagingOrigin];
    *(double *)&long long v19 = v5;
    *((void *)&v19 + 1) = v6;
    long long v27 = v19;
    double v7 = 0.00001;
    if ((v23 & 1) == 0) {
      double v7 = 0.02;
    }
    double v18 = (v25 - v5) / v21;
    double v17 = (v26 - *((double *)&v19 + 1)) / v22;
    double v31 = v18;
    if (ceil(v18) - v18 >= v7)
    {
      double v33 = (v25 - v5) / v21;
      double v12 = floor(v18);
    }
    else
    {
      double v30 = (v25 - v5) / v21;
      double v12 = ceil(v18);
    }
    *(double *)&long long v27 = *(double *)&v27 + v12 * v21;
    double v29 = (v26 - *((double *)&v19 + 1)) / v22;
    if (ceil(v17) - v17 >= v7)
    {
      double v32 = (v26 - *((double *)&v19 + 1)) / v22;
      double v11 = floor(v17);
    }
    else
    {
      double v28 = (v26 - *((double *)&v19 + 1)) / v22;
      double v11 = ceil(v17);
    }
    *((double *)&v27 + 1) = *((double *)&v27 + 1) + v11 * v22;
    double v15 = -[UIScrollViewAccessibility _axMinimumContentOffset](v24);
    double v16 = v8;
    double v13 = -[UIScrollViewAccessibility _axMaximumContentOffset](v24);
    double v14 = v9;
    *(void *)&long long v27 = CGFloatMinMax_0(*(double *)&v27, v15, v13);
    *((void *)&v27 + 1) = CGFloatMinMax_0(*((double *)&v27 + 1), v16, v14);
    objc_storeStrong(&location, 0);
  }
  else
  {
    long long v27 = 0uLL;
  }
  return *(double *)&v27;
}

- (int64_t)accessibilityContainerType
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UIScrollViewAccessibility *)self storedAccessibilityContainerType];
  if (location[0]) {
    int64_t v4 = [location[0] integerValue];
  }
  else {
    int64_t v4 = 12;
  }
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_accessibilityShouldAnimateScrollToVisible
{
  return 0;
}

- (unint64_t)_accessibilityAutomationType
{
  return 46;
}

- (BOOL)_accessibilityShouldAnimateScroll
{
  if (a1)
  {
    id v2 = (id)[MEMORY[0x263F1C408] sharedApplication];
    BOOL v3 = [v2 applicationState] != 2;

    return v3;
  }
  else
  {
    return 0;
  }
}

- (double)_accessibilityScrollWidthDistance
{
  [(UIScrollViewAccessibility *)self visibleBounds];
  double v6 = v2;
  [(UIScrollViewAccessibility *)self _accessibilityVisibleContentInset];
  return v6 - v3 - v4;
}

- (double)_accessibilityScrollHeightDistance
{
  [(UIScrollViewAccessibility *)self visibleBounds];
  double v6 = v2;
  [(UIScrollViewAccessibility *)self _accessibilityVisibleContentInset];
  return v6 - v3 - v4;
}

- (BOOL)_accessibilityScrollStatusPrefersVertical
{
  return 1;
}

- (void)_accessibilityCurrentPage:(uint64_t *)a3 totalPages:(int)a4 type:
{
  if (a1)
  {
    int v7 = 1;
    id v5 = (id)[a1 _accessibilityValueForKey:@"kUIScrollViewScrollVerticalStorageKey"];
    int v6 = [v5 intValue];

    if (v6) {
      int v7 = v6;
    }
    if (v7 == 3 || a4 == 3)
    {
      if (a4 == 2 || a4 == 1)
      {
        int v7 = a4;
      }
      else
      {
        if ([a1 _accessibilityScrollStatusPrefersVertical]) {
          int v4 = 1;
        }
        else {
          int v4 = 2;
        }
        int v7 = v4;
      }
    }
    -[UIScrollViewAccessibility _accessibilityCurrentPage:totalPages:forVerticalDirection:](a1, a2, a3, v7 == 1);
  }
}

- (void)_accessibilityCurrentPage:(uint64_t *)a3 totalPages:(char)a4 forVerticalDirection:
{
  char v34 = a4 & 1;
  if (a1)
  {
    [a1 visibleBounds];
    double v28 = v4;
    double v29 = v5;
    double v30 = v6;
    double v31 = v7;
    [a1 _accessibilityScrollHeightDistance];
    double v27 = v8;
    [a1 _accessibilityScrollWidthDistance];
    double v26 = v9;
    [a1 _accessibilityContentSize];
    double v24 = v10;
    double v25 = v11;
    [a1 _accessibilityVisibleContentInset];
    v23.origin.x = UIEdgeInsetsInsetRect_0(v28, v29, v30, v31, v12, v13);
    v23.origin.y = v14;
    v23.size.width = v15;
    v23.size.double height = v16;
    if ((v34 & 1) == 0 || v25 == v27)
    {
      if (v24 > v26)
      {
        float v19 = v24 / v26;
        uint64_t v32 = vcvtps_s32_f32(v19);
        double v21 = CGRectGetMidX(v23) / v24;
        if (v21 > 1.0) {
          double v21 = 1.0;
        }
        float v20 = v21 * (double)v32;
        unint64_t v33 = vcvtms_s32_f32(v20) + 1;
      }
      else
      {
        uint64_t v32 = 1;
        unint64_t v33 = 1;
      }
    }
    else if (v25 > v27)
    {
      float v17 = v25 / v27;
      uint64_t v32 = vcvtps_s32_f32(v17);
      double v22 = CGRectGetMidY(v23) / v25;
      if (v22 > 1.0) {
        double v22 = 1.0;
      }
      float v18 = v22 * (double)v32;
      unint64_t v33 = vcvtms_s32_f32(v18) + 1;
    }
    else
    {
      uint64_t v32 = 1;
      unint64_t v33 = 1;
    }
    if (a3) {
      *a3 = v32;
    }
    if (a2) {
      *a2 = v33;
    }
  }
}

- (BOOL)_accessibilityUseContentInset
{
  return 1;
}

- (double)_axMinimumContentOffset
{
  if (!a1) {
    return 0.0;
  }
  [a1 safeCGPointForKey:@"_minimumContentOffset"];
  return v1;
}

- (double)_axMaximumContentOffset
{
  if (!a1) {
    return 0.0;
  }
  [a1 safeCGPointForKey:@"_maximumContentOffset"];
  return v1;
}

- (BOOL)accessibilityScrollLeftPageSupported
{
  return (-[UIScrollViewAccessibility _accessibilityHasActionBlockForKey:](self, "_accessibilityHasActionBlockForKey:", 2009) & 1) != 0|| -[UIScrollViewAccessibility _axBaseScrollLeftPageSupported](self);
}

- (BOOL)accessibilityScrollRightPageSupported
{
  return (-[UIScrollViewAccessibility _accessibilityHasActionBlockForKey:](self, "_accessibilityHasActionBlockForKey:", 2008) & 1) != 0|| -[UIScrollViewAccessibility _axBaseScrollRightPageSupported](self);
}

- (BOOL)accessibilityScrollUpPageSupported
{
  return (-[UIScrollViewAccessibility _accessibilityHasActionBlockForKey:](self, "_accessibilityHasActionBlockForKey:", 2007) & 1) != 0|| -[UIScrollViewAccessibility _axBaseScrollUpPageSupported](self);
}

- (id)_accessibilityFindRefreshControl
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v13 = a1;
  if (a1)
  {
    id location = (id)[v13 safeValueForKey:@"_refreshControl"];
    if (!location)
    {
      id v11 = (id)[v13 safeValueForKey:@"subviews"];
      memset(__b, 0, sizeof(__b));
      id obj = v11;
      uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
      if (v8)
      {
        uint64_t v4 = *(void *)__b[2];
        uint64_t v5 = 0;
        unint64_t v6 = v8;
        while (1)
        {
          uint64_t v3 = v5;
          if (*(void *)__b[2] != v4) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(id *)(__b[1] + 8 * v5);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          ++v5;
          if (v3 + 1 >= v6)
          {
            uint64_t v5 = 0;
            unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
            if (!v6) {
              goto LABEL_12;
            }
          }
        }
        objc_storeStrong(&location, v10);
      }
LABEL_12:

      objc_storeStrong(&v11, 0);
    }
    id v14 = location;
    objc_storeStrong(&location, 0);
  }
  else
  {
    id v14 = 0;
  }
  double v1 = v14;

  return v1;
}

- (BOOL)accessibilityScrollDownPageSupported
{
  return (-[UIScrollViewAccessibility _accessibilityHasActionBlockForKey:](self, "_accessibilityHasActionBlockForKey:", 2006) & 1) != 0|| -[UIScrollViewAccessibility _axBaseScrollDownPageSupported](self);
}

- (id)_accessibilityScrollStatusFormatString
{
  return accessibilityLocalizedString(@"scroll.page.summary");
}

- (void)_scrollViewDidEndDeceleratingForDelegate
{
  uint64_t v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIScrollViewAccessibility;
  [(UIScrollViewAccessibility *)&v2 _scrollViewDidEndDeceleratingForDelegate];
  UIAccessibilityPostNotification(*MEMORY[0x263F81338], 0);
}

- (unint64_t)_accessibilityBoundaryEdges
{
  [(UIScrollViewAccessibility *)self contentOffset];
  double v11 = v2;
  double v12 = v3;
  double v9 = -[UIScrollViewAccessibility _axMinimumContentOffset](self);
  double v10 = v4;
  double v8 = -[UIScrollViewAccessibility _axMaximumContentOffset](self);
  unint64_t v7 = v12 <= v10;
  if (v12 >= v5) {
    v7 |= 4uLL;
  }
  if (v11 <= v9) {
    v7 |= 2uLL;
  }
  if (v11 >= v8) {
    v7 |= 8uLL;
  }
  return v7;
}

- (id)_accessibilityRetrieveDelegate
{
  return (id)[(UIScrollViewAccessibility *)self safeValueForKey:@"delegate", a2, self];
}

- (id)_accessibilityDelegateScrollStatus
{
  double v8 = self;
  v7[1] = (id)a2;
  v7[0] = [(UIScrollViewAccessibility *)self _accessibilityRetrieveDelegate];
  id v6 = v8;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ((location = (id)[v7[0] accessibilityAttributedScrollStatusForScrollView:v6]) == 0? (int v4 = 0): (v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F21660]), "initWithCFAttributedString:", location), int v4 = 1), objc_storeStrong(&location, 0), !v4))
  {
    if (objc_opt_respondsToSelector()) {
      id v9 = (id)[v7[0] accessibilityScrollStatusForScrollView:v6];
    }
    else {
      id v9 = 0;
    }
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
  double v2 = v9;

  return v2;
}

- (double)_axAllowedPagingOverlap
{
  if (!a1) {
    return 0.0;
  }
  id v1 = (id)[a1 _accessibilityAllowedPagingOverlap];
  BOOL v5 = v1 == 0;

  if (v5) {
    return 0.0;
  }
  id v4 = (id)[a1 _accessibilityAllowedPagingOverlap];
  [v4 doubleValue];
  double v7 = v2;

  return v7;
}

- (id)_accessibilityElementsFilteredByPagingScrollView:(void *)a1
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v40 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v40)
  {
    id v37 = (id)objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(location, "count"));
    if ((-[UIScrollViewAccessibility _axScrollViewPagingEnabled](v40) & 1) == 0
      || ([v40 _accessibilityScrollAcrossPageBoundaries] & 1) != 0)
    {
      id v41 = 0;
      int v38 = 1;
    }
    else
    {
      char v36 = 0;
      id v2 = (id)[v40 _accessibilityPagingEnabled];
      BOOL v29 = v2 == 0;

      if (!v29)
      {
        id v28 = (id)[v40 _accessibilityPagingEnabled];
        char v36 = [v28 BOOLValue] & 1;
      }
      [v40 visibleBounds];
      v35.origin.x = v3;
      v35.origin.y = v4;
      v35.size.width = v5;
      v35.size.double height = v6;
      memset(__b, 0, sizeof(__b));
      id obj = location;
      uint64_t v27 = [obj countByEnumeratingWithState:__b objects:v42 count:16];
      if (v27)
      {
        uint64_t v23 = *(void *)__b[2];
        uint64_t v24 = 0;
        unint64_t v25 = v27;
        while (1)
        {
          uint64_t v22 = v24;
          if (*(void *)__b[2] != v23) {
            objc_enumerationMutation(obj);
          }
          id v34 = *(id *)(__b[1] + 8 * v24);
          id v21 = v34;
          [v34 bounds];
          objc_msgSend(v21, "convertRect:toView:", v40, v7, v8, v9, v10);
          r2.origin.x = v11;
          r2.origin.y = v12;
          r2.size.width = v13;
          r2.size.double height = v14;
          if (v36)
          {
            CGRect v45 = CGRectIntersection(v35, r2);
            double height = v45.size.height;
            if (v45.size.width >= -[UIScrollViewAccessibility _axAllowedPagingOverlap](v40)
              && height >= -[UIScrollViewAccessibility _axAllowedPagingOverlap](v40))
            {
              objc_msgSend(v37, "addObject:", v34, height);
            }
          }
          else
          {
            [v34 frame];
            rect2.origin.x = v15;
            rect2.origin.y = v16;
            rect2.size.width = v17;
            rect2.size.double height = v18;
            if (CGRectIntersectsRect(v35, rect2)) {
              [v37 addObject:v34];
            }
          }
          ++v24;
          if (v22 + 1 >= v25)
          {
            uint64_t v24 = 0;
            unint64_t v25 = [obj countByEnumeratingWithState:__b objects:v42 count:16];
            if (!v25) {
              break;
            }
          }
        }
      }

      id v41 = v37;
      int v38 = 1;
    }
    objc_storeStrong(&v37, 0);
  }
  else
  {
    id v41 = 0;
    int v38 = 1;
  }
  objc_storeStrong(&location, 0);
  float v19 = v41;

  return v19;
}

- (id)_accessibilitySubviews
{
  double v10 = self;
  v9[1] = (id)a2;
  id v7 = (id)[(UIScrollViewAccessibility *)self subviews];
  v9[0] = -[UIScrollViewAccessibility _accessibilityElementsFilteredByPagingScrollView:](self, v7);

  if (!v9[0])
  {
    v8.receiver = v10;
    v8.super_class = (Class)UIScrollViewAccessibility;
    id v2 = [(UIScrollViewAccessibility *)&v8 _accessibilitySubviews];
    id v3 = v9[0];
    v9[0] = v2;
  }
  id v5 = v9[0];
  objc_storeStrong(v9, 0);

  return v5;
}

- (int64_t)_accessibilityPageCount
{
  v4[2] = (uint64_t)self;
  v4[1] = (uint64_t)a2;
  v4[0] = 0;
  unint64_t v3 = 0;
  -[UIScrollViewAccessibility _accessibilityCurrentPage:totalPages:type:](self, &v3, v4, 3);
  return v4[0];
}

- (int64_t)_accessibilityPageIndex
{
  v4[2] = (uint64_t)self;
  v4[1] = (uint64_t)a2;
  v4[0] = 0;
  int64_t v3 = 0;
  -[UIScrollViewAccessibility _accessibilityCurrentPage:totalPages:type:](self, (unint64_t *)&v3, v4, 3);
  return v3;
}

- (void)_accessibilitySetScrollStatus:(id)a3
{
  CGFloat v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UIScrollViewAccessibility *)v4 _accessibilitySetValue:location[0] forKey:@"accessibilityScrollStatus" storageMode:0];
  objc_storeStrong(location, 0);
}

- (id)_accessibilityScrollStatus
{
  float v19 = self;
  v18[1] = (id)a2;
  v18[0] = (id)[(UIScrollViewAccessibility *)self _accessibilityValueForKey:@"accessibilityScrollStatus"];
  if (![v18[0] length])
  {
    id v2 = [(UIScrollViewAccessibility *)v19 _accessibilityDelegateScrollStatus];
    id v3 = v18[0];
    v18[0] = v2;
  }
  if (![v18[0] length])
  {
    uint64_t v17 = 0;
    unint64_t v16 = 0;
    id v10 = (id)-[UIScrollViewAccessibility _accessibilityValueForKey:](v19, "_accessibilityValueForKey:");
    unsigned int v11 = [v10 intValue];

    [(UIScrollViewAccessibility *)v19 _accessibilitySetIntegerValue:3 forKey:@"kUIScrollViewScrollVerticalStorageKey"];
    -[UIScrollViewAccessibility _accessibilityCurrentPage:totalPages:type:](v19, &v16, &v17, v11);
    CGFloat v12 = NSString;
    id v15 = [(UIScrollViewAccessibility *)v19 _accessibilityScrollStatusFormatString];
    id v14 = (id)AXFormatInteger();
    id v13 = (id)AXFormatInteger();
    id v4 = (id)objc_msgSend(v12, "stringWithFormat:", v15, v14, v13);
    id v5 = v18[0];
    v18[0] = v4;

    if ((-[UIScrollViewAccessibility _axScrollViewPagingEnabled](v19) & 1) != 0 && v11 == 2)
    {
      id v6 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v18[0]];
      id v7 = v18[0];
      v18[0] = v6;

      [v18[0] setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21A70]];
    }
    [(UIScrollViewAccessibility *)v19 _accessibilitySetIntegerValue:v11 forKey:@"kUIScrollViewScrollVerticalStorageKey"];
  }
  id v9 = v18[0];
  objc_storeStrong(v18, 0);

  return v9;
}

- (void)_accessibilitySendScrollStatus
{
  argument[2] = self;
  argument[1] = (id)a2;
  argument[0] = [(UIScrollViewAccessibility *)self _accessibilityScrollStatus];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE30], argument[0]);
  objc_storeStrong(argument, 0);
}

- (void)_accessibilityZoomAtPoint:(CGPoint)a3 zoomIn:(BOOL)a4
{
  CGPoint v19 = a3;
  CGFloat v18 = self;
  SEL v17 = a2;
  BOOL v16 = a4;
  id v15 = self;
  [(UIScrollViewAccessibility *)v15 maximumZoomScale];
  double v13 = v4;
  [(UIScrollViewAccessibility *)v15 minimumZoomScale];
  double v14 = (v13 - v5) / 10.0;
  if (!v16) {
    double v14 = -v14;
  }
  id v7 = v15;
  [(UIScrollViewAccessibility *)v15 zoomScale];
  [(UIScrollViewAccessibility *)v7 setZoomScale:v6 + v14];
  [(UIScrollViewAccessibility *)v15 zoomScale];
  [(UIScrollViewAccessibility *)v15 minimumZoomScale];
  UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
  objc_super v8 = NSString;
  id v12 = accessibilityLocalizedString(@"zoom.level");
  id v11 = (id)AXFormatInteger();
  id v10 = (id)objc_msgSend(v8, "stringWithFormat:", v12, v11);
  UIAccessibilityPostNotification(notification, v10);

  objc_storeStrong((id *)&v15, 0);
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  return 1;
}

- (double)_accessibilityScrollAnimationDurationDelay
{
  return 0.0;
}

- (uint64_t)_accessibilityCanHandleContentPullDown
{
  if (a1)
  {
    if ((_accessibilityCanHandleContentPullDown__kAXCanHandleContentPullDownInitialized & 1) == 0)
    {
      id v3 = (id)[MEMORY[0x263F086E0] mainBundle];
      id v2 = (id)[v3 bundleIdentifier];
      _accessibilityCanHandleContentPullDown__kAXCanHandleContentPullDown = ([v2 hasPrefix:@"com.apple."] ^ 1) & 1;

      _accessibilityCanHandleContentPullDown__kAXCanHandleContentPullDownInitialized = 1;
    }
    char v4 = _accessibilityCanHandleContentPullDown__kAXCanHandleContentPullDown & 1;
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (void)_axManipulateWithRefreshControl:(void *)a1
{
  id v19 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v19)
  {
    [location beginRefreshing];
    [location sendActionsForControlEvents:4096];
    id v10 = v19;
    [v19 contentOffset];
    v16[1] = v2;
    v16[2] = v3;
    id v11 = (id)[location safeValueForKey:@"_refreshControlHeight"];
    [v11 floatValue];
    CGPointMake_5();
    v16[3] = v4;
    v16[4] = v5;
    objc_msgSend(v10, "setContentOffset:animated:", 1, *(double *)&v4, *(double *)&v5);

    v16[0] = (id)[location _accessibilityAXAttributedLabel];
    id v15 = (id)[location _accessibilityAXAttributedHint];
    if (!v16[0])
    {
      id v9 = (id)[location attributedTitle];
      v16[0] = (id)[v9 string];
    }
    id v6 = (id)__UIAXStringForVariables();
    id v7 = v16[0];
    v16[0] = v6;

    UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
    char v13 = 0;
    if (objc_msgSend(v16[0], "length", v15, @"__AXStringForVariablesSentinel"))
    {
      UIAccessibilityPostNotification(notification, v16[0]);
    }
    else
    {
      id v14 = accessibilityLocalizedString(@"refreshing.content");
      char v13 = 1;
      UIAccessibilityPostNotification(notification, v14);
    }
    if (v13) {

    }
    id v12 = location;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(v16, 0);
    int v17 = 0;
  }
  else
  {
    int v17 = 1;
  }
  objc_storeStrong(&location, 0);
}

uint64_t __61__UIScrollViewAccessibility__axManipulateWithRefreshControl___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endRefreshing", a1, a1);
}

- (BOOL)_accessibilityContentOffsetForScrollDirection:(int)a3 newContentOffset:(CGPoint *)a4 distanceMultiplier:(double)a5
{
  v73 = self;
  SEL v72 = a2;
  unsigned int v71 = a3;
  v70 = a4;
  double v69 = a5;
  [(UIScrollViewAccessibility *)self visibleBounds];
  v68.origin.x = v5;
  v68.origin.y = v6;
  v68.size.width = v7;
  v68.size.double height = v8;
  [(UIScrollViewAccessibility *)v73 _accessibilityScrollHeightDistance];
  double v67 = v9 * v69;
  [(UIScrollViewAccessibility *)v73 _accessibilityScrollWidthDistance];
  double v66 = v10 * v69;
  if (v71)
  {
    uint64_t v12 = v71;
    char v11 = 1;
  }
  else
  {
    uint64_t v12 = 0;
    char v11 = 0;
  }
  if (v11)
  {
LABEL_40:
    [(UIScrollViewAccessibility *)v73 _accessibilityContentSize];
    if (v30 == v68.size.width)
    {
      char v74 = 0;
      return v74 & 1;
    }
    if ([(UIScrollViewAccessibility *)v73 _accessibilityUseContentInset]) {
      [(UIScrollViewAccessibility *)v73 _accessibilityContentInset];
    }
    CGPointMake_5();
    v41.x = v31;
    v41.y = v32;
    CGPoint *v70 = v41;
  }
  else
  {
    switch(v12)
    {
      case 0:
        [(UIScrollViewAccessibility *)v73 _accessibilityContentSize];
        uint64_t v64 = v13;
        double v65 = v14;
        if (v14 == v68.size.height)
        {
          char v74 = 0;
          return v74 & 1;
        }
        double v63 = v68.origin.y - v67;
        if (v68.origin.y < 5.0)
        {
          id v62 = -[UIScrollViewAccessibility _accessibilityFindRefreshControl](v73);
          if (v62)
          {
            -[UIScrollViewAccessibility _axManipulateWithRefreshControl:](v73, v62);
            p_x = (_OWORD *)&v70->x;
            uint64_t v55 = 0;
            v56 = &v55;
            int v57 = 0x10000000;
            int v58 = 48;
            v59 = &unk_24046C852;
            uint64_t v60 = 0;
            uint64_t v61 = 0;
            v54[1] = &v55;
            v54[0] = v73;
            AXPerformSafeBlock();
            _OWORD *p_x = *((_OWORD *)v56 + 2);
            objc_storeStrong(v54, 0);
            _Block_object_dispose(&v55, 8);
            if (__CGPointEqualToPoint_1(v70->x, v70->y, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8)))
            {
              os_log_type_t v39 = (_OWORD *)&v70->x;
              [(UIScrollViewAccessibility *)v73 contentOffset];
              *(void *)&long long v53 = v15;
              *((void *)&v53 + 1) = v16;
              *os_log_type_t v39 = v53;
            }
            char v74 = 1;
            int v52 = 1;
          }
          else if ((-[UIScrollViewAccessibility _accessibilityCanHandleContentPullDown]((uint64_t)v73) & 1) != 0 {
                 && ([(UIScrollViewAccessibility *)v73 safeBoolForKey:@"bouncesZoom"] & 1) != 0)
          }
          {
            -[UIScrollViewAccessibility _axHandleScrollViewPullDown]();
            char v74 = 1;
            int v52 = 1;
          }
          else
          {
            int v52 = 0;
          }
          objc_storeStrong(&v62, 0);
          if (v52) {
            return v74 & 1;
          }
        }
        double v51 = 0.0;
        if ([(UIScrollViewAccessibility *)v73 _accessibilityUseContentInset])
        {
          [(UIScrollViewAccessibility *)v73 _accessibilityContentInset];
          double v51 = 0.0 - v17;
        }
        if (v63 >= v51) {
          double v38 = v63;
        }
        else {
          double v38 = v51;
        }
        double v63 = v38;
        id v37 = (_OWORD *)&v70->x;
        CGPointMake_5();
        *(void *)&long long v50 = v18;
        *((void *)&v50 + 1) = v19;
        *id v37 = v50;
        break;
      case 1:
        [(UIScrollViewAccessibility *)v73 _accessibilityContentSize];
        double v49 = v20;
        if (v20 == v68.size.height)
        {
          char v74 = 0;
          return v74 & 1;
        }
        if ([(UIScrollViewAccessibility *)v73 _accessibilityUseContentInset])
        {
          [(UIScrollViewAccessibility *)v73 _accessibilityContentInset];
          *(void *)&long long v47 = v21;
          *(void *)&long long v48 = v22;
        }
        else
        {
          long long v47 = *MEMORY[0x263F1D1C0];
          long long v48 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
        }
        if (v49 + *(double *)&v47 + *(double *)&v48 > v68.size.height)
        {
          CGRectGetMinY(v68);
          [(UIScrollViewAccessibility *)v73 _accessibilityUseContentInset];
          CGPointMake_5();
          v46.x = v23;
          v46.y = v24;
          CGPoint *v70 = v46;
        }
        break;
      case 2:
        [(UIScrollViewAccessibility *)v73 _accessibilityContentSize];
        double v45 = v25;
        if (v25 == v68.size.width)
        {
          char v74 = 0;
          return v74 & 1;
        }
        if ([(UIScrollViewAccessibility *)v73 _accessibilityUseContentInset])
        {
          [(UIScrollViewAccessibility *)v73 _accessibilityContentInset];
          *((void *)&v43 + 1) = v26;
          *((void *)&v44 + 1) = v27;
        }
        else
        {
          long long v43 = *MEMORY[0x263F1D1C0];
          long long v44 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
        }
        if (v45 + *((double *)&v43 + 1) + *((double *)&v44 + 1) > v68.size.width)
        {
          CGRectGetMinX(v68);
          [(UIScrollViewAccessibility *)v73 _accessibilityUseContentInset];
          CGPointMake_5();
          v42.x = v28;
          v42.y = v29;
          CGPoint *v70 = v42;
        }
        break;
      case 3:
        goto LABEL_40;
      default:
        JUMPOUT(0);
    }
  }
  [(UIScrollViewAccessibility *)v73 contentOffset];
  BOOL v36 = 0;
  if (AXCGFAbs_0(v33 - v70->x) < 0.001)
  {
    [(UIScrollViewAccessibility *)v73 contentOffset];
    BOOL v36 = AXCGFAbs_0(v34 - v70->y) < 0.001;
  }
  char v74 = !v36;
  return v74 & 1;
}

__n128 __111__UIScrollViewAccessibility__accessibilityContentOffsetForScrollDirection_newContentOffset_distanceMultiplier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _animatedTargetOffset];
  v5.n128_u64[0] = v1;
  v5.n128_u64[1] = v2;
  __n128 result = v5;
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v5;
  return result;
}

- (BOOL)_accessibilityScrollPageInDirection:(int)a3
{
  CGFloat v23 = self;
  SEL v22 = a2;
  unsigned int v21 = a3;
  unsigned int v20 = 0;
  if (a3)
  {
    uint64_t v4 = a3;
    char v3 = 1;
  }
  else
  {
    uint64_t v4 = 0;
    char v3 = 0;
  }
  if ((v3 & 1) == 0)
  {
    switch(v4)
    {
      case 0:
        unsigned int v20 = 2007;
        break;
      case 1:
        unsigned int v20 = 2006;
        break;
      case 2:
        unsigned int v20 = 2009;
        break;
      case 3:
        unsigned int v20 = 2008;
        break;
      default:
        JUMPOUT(0);
    }
  }
  if (([(UIScrollViewAccessibility *)v23 _accessibilityHasActionBlockForKey:v20] & 1) == 0)goto LABEL_15; {
  id v19 = 0;
  }
  id v18 = 0;
  uint64_t v17 = 0;
  id v16 = 0;
  [(UIScrollViewAccessibility *)v23 _accessibilityActionBlock:&v17 andValue:&v16 forKey:v20];
  __n128 v5 = (void *)MEMORY[0x2455E7040](v17);
  id v6 = v19;
  id v19 = v5;

  objc_storeStrong(&v18, v16);
  if (v19)
  {
    char v24 = (*((uint64_t (**)(id, id))v19 + 2))(v19, v18) & 1;
    int v15 = 1;
  }
  else
  {
    int v15 = 0;
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  if (!v15)
  {
LABEL_15:
    BOOL v14 = 0;
    BOOL v12 = 1;
    if (v21) {
      BOOL v12 = v21 == 1;
    }
    BOOL v14 = v12;
    double v10 = v23;
    if (v12) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    id v11 = (id)[NSNumber numberWithInt:v7];
    -[UIScrollViewAccessibility _accessibilitySetRetainedValue:forKey:](v10, "_accessibilitySetRetainedValue:forKey:");

    if ([(UIScrollViewAccessibility *)v23 _accessibilityScrollingEnabled])
    {
      long long v13 = 0uLL;
      long long v13 = *MEMORY[0x263F00148];
      if ([(UIScrollViewAccessibility *)v23 _accessibilityContentOffsetForScrollDirection:v21 newContentOffset:&v13 distanceMultiplier:1.0])
      {
        BOOL ShouldAnimate = -[UIScrollViewAccessibility _accessibilityShouldAnimateScroll]((uint64_t)v23);
        [(UIScrollViewAccessibility *)v23 accessibilityApplyScrollContent:1 sendScrollStatus:ShouldAnimate animated:v13];
        char v24 = 1;
      }
      else
      {
        char v24 = 0;
      }
    }
    else
    {
      char v24 = 0;
    }
  }
  return v24 & 1;
}

- (double)_axPageSize
{
  id v12 = a1;
  if (a1)
  {
    id v11 = v12;
    [v11 _interpageSpacing];
    double v9 = v1;
    double v10 = v2;
    long long v13 = 0uLL;
    [v11 bounds];
    *(double *)&long long v13 = v3 + v9;
    *((double *)&v13 + 1) = v4 + v10;
    UISizeRoundToViewScale();
    *(void *)&long long v8 = v5;
    *((void *)&v8 + 1) = v6;
    long long v13 = v8;
    objc_storeStrong(&v11, 0);
  }
  else
  {
    long long v13 = 0uLL;
  }
  return *(double *)&v13;
}

- (CGFloat)accessibilityValidateScrollContentOffset:(CGFloat)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v24.x = a2;
  v24.y = a3;
  CGFloat v23 = a1;
  if (a1)
  {
    if ([v23 _axShouldScrollToAlignWithPage])
    {
      double v21 = -[UIScrollViewAccessibility _axPageSize](v23);
      uint64_t v22 = v3;
      CGPointMake_5();
      oslog[1] = v4;
      oslog[2] = v5;
      v20.x = [(UIScrollViewAccessibility *)v23 _axPageAlignedContentOffsetForPoint:*(double *)&v4 forValidation:*(double *)&v5];
      v20.y = v6;
      CGPoint v24 = v20;
      oslog[0] = (os_log_t)(id)AXLogScrollToVisible();
      os_log_type_t type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
      {
        log = oslog[0];
        os_log_type_t v11 = type;
        id v12 = NSStringFromCGPoint(v24);
        uint64_t v17 = v12;
        __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v17);
        _os_log_debug_impl(&dword_2402B7000, log, v11, "Validated: %@", v26, 0xCu);

        objc_storeStrong((id *)&v17, 0);
      }
      objc_storeStrong((id *)oslog, 0);
    }
    else
    {
      double v15 = -[UIScrollViewAccessibility _axMinimumContentOffset](v23);
      double v16 = v7;
      double v13 = -[UIScrollViewAccessibility _axMaximumContentOffset](v23);
      double v14 = v8;
      v24.x = CGFloatMinMax_0(v24.x, v15, v13);
      v24.y = CGFloatMinMax_0(v24.y, v16, v14);
    }
    CGPoint v25 = v24;
  }
  else
  {
    CGPoint v25 = (CGPoint)0;
  }
  return v25.x;
}

- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v6 = a4;
  double v5 = 0.0;
  if (a5)
  {
    if (UIAccessibilityIsSwitchControlRunning())
    {
      [(UIScrollViewAccessibility *)self accessibilityApplyScrollContent:1 sendScrollStatus:a3.x animateWithDuration:a3.y animationCurve:1.0];
      return;
    }
    double v5 = 0.15;
  }
  [(UIScrollViewAccessibility *)self accessibilityApplyScrollContent:0 sendScrollStatus:a3.x animateWithDuration:a3.y animationCurve:v5];
}

- (void)accessibilityApplyScrollContent:(int)a3 sendScrollStatus:(CGFloat)a4 animateWithDuration:(CGFloat)a5 animationCurve:(double)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v48.x = a4;
  v48.y = a5;
  long long v47 = a1;
  char v46 = a2 & 1;
  double v45 = a6;
  int v44 = a3;
  if (a1)
  {
    BOOL v43 = v45 > 0.0;
    id v42 = (id)AXLogScrollToVisible();
    char v41 = 2;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEBUG))
    {
      log = v42;
      os_log_type_t type = v41;
      int v9 = v43;
      id v12 = NSStringFromCGPoint(v48);
      v40 = v12;
      __os_log_helper_16_2_2_4_0_8_64((uint64_t)v49, v9, (uint64_t)v40);
      _os_log_debug_impl(&dword_2402B7000, log, type, "Scrolling content animated: %i, to: %@", v49, 0x12u);

      objc_storeStrong((id *)&v40, 0);
    }
    objc_storeStrong(&v42, 0);
    v39.x = [(UIScrollViewAccessibility *)v47 accessibilityValidateScrollContentOffset:v48.y];
    v39.y = v6;
    CGPoint v48 = v39;
    [v47 contentOffset];
    double v37 = v7;
    double v38 = v8;
    if (!__CGPointEqualToPoint_1(v7, v8, v48.x, v48.y))
    {
      id v36 = (id)[v47 safeValueForKey:@"delegate"];
      if (objc_opt_respondsToSelector()) {
        [v36 scrollViewWillBeginDragging:v47];
      }
      if (objc_opt_respondsToSelector())
      {
        CGPoint v35 = v48;
        objc_msgSend(v36, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v47, &v48, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
        if (AXCGFAbs_0(v37 - v48.x) >= 0.001 || AXCGFAbs_0(v38 - v48.y) >= 0.001)
        {
          if (AXCGFAbs_0(v35.x - v48.x) >= 0.001 || AXCGFAbs_0(v35.y - v48.y) >= 0.001)
          {
            if ((v34 = v35.x - v37, v33 = v35.y - v38, v32 = v48.x - v37, double v31 = v48.y - v38, v35.x - v37 > 0.0)
              && v32 < 0.0
              || v34 < 0.0 && v32 > 0.0
              || v33 > 0.0 && v31 < 0.0
              || v33 < 0.0 && v31 > 0.0)
            {
              CGPoint v48 = v35;
            }
          }
        }
        else
        {
          CGPoint v48 = v35;
        }
      }
      char v29 = 0;
      objc_opt_class();
      id v28 = (id)__UIAccessibilityCastAsClass();
      id v27 = v28;
      objc_storeStrong(&v28, 0);
      id v30 = v27;
      char v26 = [v27 _contentOffsetRoundingEnabled] & 1;
      [v30 _setContentOffsetRoundingEnabled:0];
      v17[1] = (id)MEMORY[0x263EF8330];
      int v18 = -1073741824;
      int v19 = 0;
      CGPoint v20 = __113__UIScrollViewAccessibility_accessibilityApplyScrollContent_sendScrollStatus_animateWithDuration_animationCurve___block_invoke;
      double v21 = &unk_2650AF0F8;
      id v22 = v47;
      CGPoint v23 = v48;
      double v24 = v45;
      int v25 = v44;
      AXPerformSafeBlock();
      v17[0] = (id)[v47 safeValueForKey:@"_animation"];
      if (v43 && !v17[0]) {
        BOOL v43 = 0;
      }
      if (v43)
      {
        [v47 _accessibilitySetBoolValue:v46 & 1 forKey:@"_accessibilityScrollViewSendScrollStatus"];
        [v47 _accessibilitySetBoolValue:1 forKey:@"_accessibilityScrollViewAnimationEndedShouldHandleDelegateCallbacks"];
        [v30 _setContentOffsetRoundingEnabled:v26 & 1];
      }
      else
      {
        id v13 = v47;
        char v15 = v46 & 1;
        id v14 = v30;
        char v16 = v26 & 1;
        AXPerformBlockOnMainThreadAfterDelay();
        objc_storeStrong(&v14, 0);
        objc_storeStrong(&v13, 0);
      }
      objc_storeStrong(v17, 0);
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v36, 0);
    }
  }
}

- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animateWithDuration:(double)a5
{
}

- (void)accessibilityApplyScrollContentOverride:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animateWithDuration:(double)a5 animationCurve:(int)a6
{
}

uint64_t __113__UIScrollViewAccessibility_accessibilityApplyScrollContent_sendScrollStatus_animateWithDuration_animationCurve___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setContentOffset:duration:animationCurve:", *(unsigned int *)(a1 + 64), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), a1, a1);
}

void __113__UIScrollViewAccessibility_accessibilityApplyScrollContent_sendScrollStatus_animateWithDuration_animationCurve___block_invoke_2(uint64_t a1)
{
  v16[2] = (id)a1;
  v16[1] = (id)a1;
  v16[0] = (id)[*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    [*(id *)(a1 + 32) contentOffset];
    uint64_t v14 = v1;
    uint64_t v15 = v2;
    objc_msgSend(v16[0], "scrollViewWillEndDragging:withVelocity:targetContentOffset:", *(void *)(a1 + 32), &v14, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  }
  if (objc_opt_respondsToSelector()) {
    [v16[0] scrollViewDidEndDragging:*(void *)(a1 + 32) willDecelerate:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v16[0] scrollViewWillBeginDecelerating:*(void *)(a1 + 32)];
  }
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  os_log_type_t v11 = __113__UIScrollViewAccessibility_accessibilityApplyScrollContent_sendScrollStatus_animateWithDuration_animationCurve___block_invoke_3;
  id v12 = &unk_2650ADF18;
  id v13 = *(id *)(a1 + 32);
  AXPerformSafeBlock();
  [*(id *)(a1 + 32) _accessibilityScrollAnimationDurationDelay];
  char v6 = *(unsigned char *)(a1 + 48) & 1;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 49) & 1;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v16, 0);
}

uint64_t __113__UIScrollViewAccessibility_accessibilityApplyScrollContent_sendScrollStatus_animateWithDuration_animationCurve___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollViewDidEndDeceleratingForDelegate", a1, a1);
}

uint64_t __113__UIScrollViewAccessibility_accessibilityApplyScrollContent_sendScrollStatus_animateWithDuration_animationCurve___block_invoke_4(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 48))
  {
    [*(id *)(result + 32) _accessibilitySendScrollStatus];
    return [*(id *)(v1 + 40) _setContentOffsetRoundingEnabled:*(unsigned char *)(v1 + 49) & 1];
  }
  return result;
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  double v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v32 = a4;
  char v31 = [(UIScrollViewAccessibility *)v34 _accessibilityBoolValueForKey:@"_accessibilityScrollViewAnimationEndedShouldHandleDelegateCallbacks"] & 1;
  if (v31)
  {
    char v30 = -[UIScrollViewAccessibility _accessibilityBoolValueForKey:](v34, "_accessibilityBoolValueForKey:") & 1;
    [(UIScrollViewAccessibility *)v34 _accessibilitySetBoolValue:0 forKey:@"_accessibilityScrollViewSendScrollStatus"];
    [(UIScrollViewAccessibility *)v34 _accessibilitySetBoolValue:0 forKey:@"_accessibilityScrollViewAnimationEndedShouldHandleDelegateCallbacks"];
    id v29 = (id)[(UIScrollViewAccessibility *)v34 safeValueForKey:@"delegate"];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      [(UIScrollViewAccessibility *)v34 contentOffset];
      uint64_t v27 = v4;
      uint64_t v28 = v5;
      objc_msgSend(v29, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v34, &v27, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    }
    if (objc_opt_respondsToSelector()) {
      [v29 scrollViewDidEndDragging:v34 willDecelerate:1];
    }
    if (objc_opt_respondsToSelector()) {
      [v29 scrollViewWillBeginDecelerating:v34];
    }
    v21[1] = (id)MEMORY[0x263EF8330];
    int v22 = -1073741824;
    int v23 = 0;
    double v24 = __64__UIScrollViewAccessibility__scrollViewAnimationEnded_finished___block_invoke;
    int v25 = &unk_2650ADF18;
    char v26 = v34;
    AXPerformSafeBlock();
    char v6 = (void *)MEMORY[0x263F1CB60];
    uint64_t v16 = MEMORY[0x263EF8330];
    int v17 = -1073741824;
    int v18 = 0;
    int v19 = __64__UIScrollViewAccessibility__scrollViewAnimationEnded_finished___block_invoke_2;
    CGPoint v20 = &unk_2650ADF18;
    v21[0] = v34;
    uint64_t v9 = MEMORY[0x263EF8330];
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = __64__UIScrollViewAccessibility__scrollViewAnimationEnded_finished___block_invoke_3;
    id v13 = &unk_2650AF148;
    char v15 = v30 & 1;
    uint64_t v14 = v34;
    [v6 animateWithDuration:&v16 animations:&v9 completion:0.15];
    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong(v21, 0);
    objc_storeStrong((id *)&v26, 0);
    objc_storeStrong(&v29, 0);
  }
  else
  {
    v8.receiver = v34;
    v8.super_class = (Class)UIScrollViewAccessibility;
    [(UIScrollViewAccessibility *)&v8 _scrollViewAnimationEnded:location[0] finished:v32];
  }
  objc_storeStrong(location, 0);
}

uint64_t __64__UIScrollViewAccessibility__scrollViewAnimationEnded_finished___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollViewDidEndDeceleratingForDelegate", a1, a1);
}

id __64__UIScrollViewAccessibility__scrollViewAnimationEnded_finished___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", @"_adjustContentOffsetIfNecessary", a1, a1);

  return v1;
}

void __64__UIScrollViewAccessibility__scrollViewAnimationEnded_finished___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v5 = a1;
  char v4 = a2 & 1;
  v3[1] = (id)a1;
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _accessibilityScrollAnimationDurationDelay];
    v3[0] = *(id *)(a1 + 32);
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong(v3, 0);
  }
}

uint64_t __64__UIScrollViewAccessibility__scrollViewAnimationEnded_finished___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilitySendScrollStatus", a1, a1);
}

- (CGPoint)_accessibilityVisibleScrollArea:(BOOL)a3
{
  [(UIScrollViewAccessibility *)self visibleBounds];
  [(UIScrollViewAccessibility *)self _accessibilityContentSize];
  CGPointMake_5();
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)accessibilityScrollUpPage
{
  return -[UIScrollViewAccessibility _accessibilityScrollPageInDirection:](self, "_accessibilityScrollPageInDirection:", 0, a2, self);
}

- (BOOL)accessibilityScrollDownPage
{
  return -[UIScrollViewAccessibility _accessibilityScrollPageInDirection:](self, "_accessibilityScrollPageInDirection:", 1, a2, self);
}

- (BOOL)accessibilityScrollLeftPage
{
  return -[UIScrollViewAccessibility _accessibilityScrollPageInDirection:](self, "_accessibilityScrollPageInDirection:", 2, a2, self);
}

- (BOOL)accessibilityScrollRightPage
{
  return -[UIScrollViewAccessibility _accessibilityScrollPageInDirection:](self, "_accessibilityScrollPageInDirection:", 3, a2, self);
}

- (BOOL)_accessibilityIsGroupedParent
{
  id v3 = (id)[(UIScrollViewAccessibility *)self accessibilityLabel];
  BOOL v4 = [v3 length] == 0;

  return !v4;
}

- (CGRect)accessibilityFrame
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UIScrollViewAccessibility *)self accessibilityUserDefinedFrame];
  if (location[0])
  {
    [location[0] rectValue];
  }
  else
  {
    v10.receiver = v13;
    v10.super_class = (Class)UIScrollViewAccessibility;
    [(UIScrollViewAccessibility *)&v10 accessibilityFrame];
  }
  double v14 = v2;
  double v15 = v3;
  double v16 = v4;
  double v17 = v5;
  int v11 = 1;
  objc_storeStrong(location, 0);
  double v6 = v14;
  double v7 = v15;
  double v8 = v16;
  double v9 = v17;
  result.size.double height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)_accessibilityContentFrame
{
  [(UIScrollViewAccessibility *)self bounds];
  double v12 = v2;
  double v13 = v3;
  double v14 = v4;
  double v15 = v5;
  [(UIScrollViewAccessibility *)self _accessibilityVisibleContentInset];
  UIEdgeInsetsInsetRect_0(v12, v13, v14, v15, v6, v7);
  UIAccessibilityFrameForBounds();
  result.size.double height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (UIEdgeInsets)_accessibilityContentInset
{
  id v14[2] = self;
  v14[1] = (id)a2;
  v14[0] = self;
  long long v15 = 0u;
  long long v16 = 0u;
  [v14[0] adjustedContentInset];
  *(void *)&long long v15 = v2;
  *((void *)&v15 + 1) = v3;
  *(void *)&long long v16 = v4;
  *((void *)&v16 + 1) = v5;
  UIRoundToViewScale();
  *(void *)&long long v15 = v6;
  UIRoundToViewScale();
  *((void *)&v15 + 1) = v7;
  UIRoundToViewScale();
  *(void *)&long long v16 = v8;
  UIRoundToViewScale();
  *((void *)&v16 + 1) = v9;
  objc_storeStrong(v14, 0);
  double v11 = *((double *)&v15 + 1);
  double v10 = *(double *)&v15;
  double v13 = *((double *)&v16 + 1);
  double v12 = *(double *)&v16;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (BOOL)_accessibilityShouldUseFallbackForVisibleContentInset
{
  id v2 = [(UIScrollViewAccessibility *)self _accessibilityStoredShouldUseFallbackForVisibleContentInset];
  BOOL v14 = v2 == 0;

  if (v14)
  {
    [(UIScrollViewAccessibility *)self _accessibilityContentInset];
    double v17 = v3;
    double v18 = v4;
    [(UIScrollViewAccessibility *)self bounds];
    double v15 = v5;
    double v16 = v6;
    UIEdgeInsetsInsetRect_0(v7, v8, v5, v6, v17, v18);
    BOOL v12 = 1;
    if (v9 > 0.0)
    {
      BOOL v12 = 1;
      if (v10 > 0.0)
      {
        BOOL v12 = 1;
        if (v9 <= v15) {
          return v10 > v16;
        }
      }
    }
    return v12;
  }
  else
  {
    id v13 = [(UIScrollViewAccessibility *)self _accessibilityStoredShouldUseFallbackForVisibleContentInset];
    BOOL v20 = [v13 BOOLValue] & 1;
  }
  return v20;
}

- (id)_accessibilityStoredShouldUseFallbackForVisibleContentInset
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___accessibilityStoredShouldUseFallbackForVisibleContentInset);
}

- (void)_accessibilitySetStoredShouldUseFallbackForVisibleContentInset:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (void)_accessibilitySetShouldUseFallbackForVisibleContentInset:(BOOL)a3
{
  id v4 = (id)[NSNumber numberWithBool:a3];
  -[UIScrollViewAccessibility _accessibilitySetStoredShouldUseFallbackForVisibleContentInset:]((uint64_t)self, v4);
}

- (id)_accessibilityStoredVisibleContentInset
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___accessibilityStoredVisibleContentInset);
}

- (void)_accessibilitySetStoredVisibleContentInset:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  double v38 = self;
  location[1] = (id)a2;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v39 = *MEMORY[0x263F1D1C0];
  long long v40 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  location[0] = [(UIScrollViewAccessibility *)self _accessibilityStoredVisibleContentInset];
  if (location[0])
  {
    [location[0] UIEdgeInsetsValue];
    *(void *)&long long v35 = v2;
    *((void *)&v35 + 1) = v3;
    *(void *)&long long v36 = v4;
    *((void *)&v36 + 1) = v5;
    long long v39 = v35;
    long long v40 = v36;
  }
  else
  {
    [(UIScrollViewAccessibility *)v38 _accessibilityContentInset];
    *(void *)&long long v33 = v6;
    *((void *)&v33 + 1) = v7;
    *(void *)&long long v34 = v8;
    *((void *)&v34 + 1) = v9;
    long long v39 = v33;
    long long v40 = v34;
    [(UIScrollViewAccessibility *)v38 bounds];
    v32.origin.x = v10;
    v32.origin.y = v11;
    v32.size.width = v12;
    v32.size.double height = v13;
    if ([(UIScrollViewAccessibility *)v38 _accessibilityShouldUseFallbackForVisibleContentInset])
    {
      [(UIScrollViewAccessibility *)v38 _accessibilityNavigationControllerInset];
      *(void *)&long long v30 = v14;
      *((void *)&v30 + 1) = v15;
      *(void *)&long long v31 = v16;
      *((void *)&v31 + 1) = v17;
      long long v39 = v30;
      long long v40 = v31;
      [(UIScrollViewAccessibility *)v38 _accessibilityContentInset];
      if (v18 > *(double *)&v31
        && (objc_msgSend((id)*MEMORY[0x263F1D020], "_accessibilitySoftwareKeyboardCoversElement:", v38, v18) & 1) != 0)
      {
        [(id)*MEMORY[0x263F1D020] _accessibilitySoftwareKeyboardAccessibilityFrame];
        UIAccessibilityFrameToBounds();
        r2.origin.x = v19;
        r2.origin.y = v20;
        r2.size.width = v21;
        r2.size.double height = v22;
        CGRect v41 = CGRectIntersection(v32, r2);
        double rect_24 = v41.size.height;
        if (!CGRectIsNull(v41))
        {
          if (rect_24 >= *(double *)&v40) {
            double v27 = rect_24;
          }
          else {
            double v27 = *(double *)&v40;
          }
          *(double *)&long long v40 = v27;
        }
      }
    }
  }
  objc_storeStrong(location, 0);
  double v24 = *((double *)&v39 + 1);
  double v23 = *(double *)&v39;
  double v26 = *((double *)&v40 + 1);
  double v25 = *(double *)&v40;
  result.right = v26;
  result.bottom = v25;
  result.left = v24;
  result.top = v23;
  return result;
}

- (void)_accessibilitySetVisibleContentInset:(UIEdgeInsets)a3
{
  id v4 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithUIEdgeInsets:", a3.top, a3.left, a3.bottom, a3.right);
  -[UIScrollViewAccessibility _accessibilitySetStoredVisibleContentInset:]((uint64_t)self, v4);
}

- (UIEdgeInsets)_accessibilityNavigationControllerInset
{
  id v10 = objc_getAssociatedObject(self, &_NavigationControllerInsetStorage);
  [v10 UIEdgeInsetsValue];
  double v11 = v2;
  double v12 = v3;
  double v13 = v4;
  double v14 = v5;

  double v6 = v11;
  double v7 = v12;
  double v8 = v13;
  double v9 = v14;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (id)_accessibilityUIViewAccessibilityFrame
{
  double v14 = self;
  SEL v13 = a2;
  double v7 = (void *)MEMORY[0x263F08D40];
  v8.receiver = self;
  v8.super_class = (Class)UIScrollViewAccessibility;
  [(UIScrollViewAccessibility *)&v8 accessibilityFrame];
  double v9 = v2;
  double v10 = v3;
  double v11 = v4;
  double v12 = v5;
  return (id)objc_msgSend(v7, "valueWithCGRect:", v2, v3, v4, v5);
}

- (id)_staticScrollBar
{
  v5[2] = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UIScrollViewAccessibility;
  v5[0] = [(UIScrollViewAccessibility *)&v4 _staticScrollBar];
  [v5[0] _accessibilityLoadAccessibilityInformation];
  id v3 = v5[0];
  objc_storeStrong(v5, 0);

  return v3;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (id)automationElements
{
  uint64_t v17 = self;
  v16[1] = (id)a2;
  v15.receiver = self;
  v15.super_class = (Class)UIScrollViewAccessibility;
  id v11 = [(UIScrollViewAccessibility *)&v15 automationElements];
  double v12 = (void *)[v11 mutableCopy];
  char v13 = 0;
  if (v12)
  {
    id v2 = v12;
  }
  else
  {
    id v14 = (id)[MEMORY[0x263EFF980] array];
    char v13 = 1;
    id v2 = v14;
  }
  v16[0] = v2;
  if (v13) {

  }
  id v4 = v16[0];
  id v5 = (id)[(UIScrollViewAccessibility *)v17 safeValueForKey:@"_staticScrollBar"];
  objc_msgSend(v4, "axSafelyAddObject:");

  id v6 = v16[0];
  id v7 = (id)[(UIScrollViewAccessibility *)v17 safeValueForKey:@"_verticalScrollIndicator"];
  objc_msgSend(v6, "axSafelyAddObject:");

  id v8 = v16[0];
  id v9 = (id)[(UIScrollViewAccessibility *)v17 safeValueForKey:@"_horizontalScrollIndicator"];
  objc_msgSend(v8, "axSafelyAddObject:");

  id v10 = v16[0];
  objc_storeStrong(v16, 0);

  return v10;
}

- (id)accessibilityPath
{
  os_log_t v82 = self;
  v81[1] = (id)a2;
  char v80 = 0;
  objc_opt_class();
  id v39 = (id)[(UIScrollViewAccessibility *)v82 _accessibilityFindAncestor:&__block_literal_global_520 startWithSelf:1];
  id v38 = (id)[v39 _accessibilityViewController];
  id v37 = (id)[v38 safeValueForKey:@"popoverPresentationController"];
  id v79 = (id)__UIAccessibilityCastAsClass();

  id v78 = v79;
  objc_storeStrong(&v79, 0);
  v81[0] = v78;
  BOOL v77 = v78 != 0;
  long long v75 = 0u;
  long long v76 = 0u;
  if (v78)
  {
    uint64_t v68 = 0;
    double v69 = &v68;
    int v70 = 0x10000000;
    int v71 = 64;
    SEL v72 = &unk_24046C852;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v62 = MEMORY[0x263EF8330];
    int v63 = -1073741824;
    int v64 = 0;
    double v65 = __46__UIScrollViewAccessibility_accessibilityPath__block_invoke_2;
    double v66 = &unk_2650AE390;
    v67[1] = &v68;
    v67[0] = v81[0];
    AXPerformSafeBlock();
    long long v75 = *((_OWORD *)v69 + 2);
    long long v76 = *((_OWORD *)v69 + 3);
    objc_storeStrong(v67, 0);
    _Block_object_dispose(&v68, 8);
  }
  else
  {
    long long v75 = *MEMORY[0x263F1D1C0];
    long long v76 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  }
  double v61 = 44.0;
  [(UIScrollViewAccessibility *)v82 accessibilityFrame];
  CGRect rect = v84;
  CGRect rect1 = CGRectIntegral(v84);
  [(UIScrollViewAccessibility *)v82 safeAreaInsets];
  double v55 = v2;
  double v56 = v3;
  double v57 = v4;
  double v58 = v5;
  if (v2 <= 44.0) {
    double v36 = *(double *)&v75;
  }
  else {
    double v36 = v55;
  }
  double v55 = v36;
  if (v56 <= v61) {
    double v35 = *((double *)&v75 + 1);
  }
  else {
    double v35 = v56;
  }
  double v56 = v35;
  if (v58 <= v61) {
    double v34 = *((double *)&v76 + 1);
  }
  else {
    double v34 = v58;
  }
  double v58 = v34;
  if (v57 <= v61) {
    double v33 = *(double *)&v76;
  }
  else {
    double v33 = v57;
  }
  double v57 = v33;
  v54.origin.x = UIEdgeInsetsInsetRect_0(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, v55, v56);
  v54.origin.y = v6;
  v54.size.width = v7;
  v54.size.double height = v8;
  CGRect rect1 = v54;
  id v53 = (id)MEMORY[0x2455E7040](&__block_literal_global_527);
  id v52 = (id)[(UIScrollViewAccessibility *)v82 _accessibilityWindow];
  [v52 accessibilityFrame];
  v51.origin.x = v9;
  v51.origin.y = v10;
  v51.size.width = v11;
  v51.size.double height = v12;
  uint64_t v50 = 0;
  uint64_t v50 = (*((uint64_t (**)(double, double, double, double, double, double, double, double))v53 + 2))(v54.origin.x, v54.origin.y, v54.size.width, v54.size.height, v9, v10, v11, v12);
  double v49 = 0.0;
  if ((*((uint64_t (**)(double, double, double, double, double, double, double, double))v53 + 2))(v54.origin.x, v54.origin.y, v54.size.width, v54.size.height, v51.origin.x, v51.origin.y, v51.size.width, v51.size.height))
  {
    id v30 = (id)[MEMORY[0x263F1C920] mainScreen];
    [v30 bounds];
    CGRect v47 = v85;
    double Height = CGRectGetHeight(v85);
    BOOL v32 = Height != CGRectGetHeight(v51);

    BOOL v48 = v32;
    char v45 = 0;
    if (v32)
    {
      double v29 = 10.0;
    }
    else
    {
      id v46 = (id)[(UIScrollViewAccessibility *)v82 traitCollection];
      char v45 = 1;
      [v46 displayCornerRadius];
      double v29 = v13;
    }
    double v49 = v29;
    if (v45) {
  }
    }
  else
  {
    id v44 = (id)[(UIScrollViewAccessibility *)v82 _accessibilityFindViewAncestor:&__block_literal_global_531 startWithSelf:0];
    if (v44)
    {
      [v44 accessibilityFrame];
      rect2.origin.x = v14;
      rect2.origin.y = v15;
      rect2.size.width = v16;
      rect2.size.double height = v17;
      if (v77)
      {
        v41.x = UIEdgeInsetsInsetRect_0(v14, v15, v16, v17, *(double *)&v75, *((double *)&v75 + 1));
        v41.y = v18;
        v42.width = v19;
        v42.double height = v20;
        rect2.CGPoint origin = v41;
        rect2.size = v42;
      }
      CGRect v40 = CGRectIntegral(rect2);
      if (CGRectContainsRect(rect1, v40)) {
        CGRect rect1 = v40;
      }
      uint64_t v50 = (*((uint64_t (**)(double, double, double, double, double, double, double, double))v53 + 2))(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
      id v28 = (id)[v44 layer];
      [v28 cornerRadius];
      double v49 = v21;
    }
    objc_storeStrong(&v44, 0);
  }
  double v25 = (void *)MEMORY[0x263F1C478];
  uint64_t v26 = v50;
  CGSizeMake_1();
  id v27 = (id)objc_msgSend(v25, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v26, rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, v22, v23);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(v81, 0);

  return v27;
}

BOOL __46__UIScrollViewAccessibility_accessibilityPath__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v2 = (id)[location[0] _accessibilityViewController];
  BOOL v4 = v2 != 0;

  objc_storeStrong(location, 0);
  return v4;
}

__n128 __46__UIScrollViewAccessibility_accessibilityPath__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _additionalSafeAreaInsets];
  *(void *)&long long v8 = v1;
  *((void *)&v8 + 1) = v2;
  v9.n128_u64[0] = v3;
  v9.n128_u64[1] = v4;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  *(_OWORD *)(v5 + 32) = v8;
  __n128 result = v9;
  *(__n128 *)(v5 + 48) = v9;
  return result;
}

uint64_t __46__UIScrollViewAccessibility_accessibilityPath__block_invoke_3(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  *(double *)id v27 = a1;
  *(double *)&v27[8] = a2;
  *(double *)&v27[16] = a3;
  *(double *)&v27[24] = a4;
  *(double *)uint64_t v26 = a5;
  *(double *)&v26[8] = a6;
  *(double *)&v26[16] = a7;
  *(double *)&uint8_t v26[24] = a8;
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  BOOL v23 = 0;
  if (MinX == CGRectGetMinX(*(CGRect *)v26))
  {
    double MinY = CGRectGetMinY(*(CGRect *)v27);
    BOOL v23 = MinY == CGRectGetMinY(*(CGRect *)v26);
  }
  double MaxX = CGRectGetMaxX(*(CGRect *)v27);
  BOOL v20 = 0;
  if (MaxX == CGRectGetMaxX(*(CGRect *)v26))
  {
    double v18 = CGRectGetMinY(*(CGRect *)v27);
    BOOL v20 = v18 == CGRectGetMinY(*(CGRect *)v26);
  }
  uint64_t v8 = 0;
  if (v20) {
    uint64_t v8 = 2;
  }
  unint64_t v24 = v23 | (unint64_t)v8;
  double v16 = CGRectGetMinX(*(CGRect *)v27);
  BOOL v17 = 0;
  if (v16 == CGRectGetMinX(*(CGRect *)v26))
  {
    double MaxY = CGRectGetMaxY(*(CGRect *)v27);
    BOOL v17 = MaxY == CGRectGetMaxY(*(CGRect *)v26);
  }
  uint64_t v9 = 0;
  if (v17) {
    uint64_t v9 = 4;
  }
  uint64_t v25 = v24 | v9;
  double v13 = CGRectGetMaxX(*(CGRect *)v27);
  BOOL v14 = 0;
  if (v13 == CGRectGetMaxX(*(CGRect *)v26))
  {
    double v12 = CGRectGetMaxY(*(CGRect *)v27);
    BOOL v14 = v12 == CGRectGetMaxY(*(CGRect *)v26);
  }
  uint64_t v10 = 0;
  if (v14) {
    uint64_t v10 = 8;
  }
  return v25 | v10;
}

BOOL __46__UIScrollViewAccessibility_accessibilityPath__block_invoke_4(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[location[0] layer];
  [v4 cornerRadius];
  BOOL v5 = v2 > 0.0;

  objc_storeStrong(location, 0);
  return v5;
}

- (CGRect)_defaultFocusRegionFrame
{
  CGFloat v19 = self;
  SEL v18 = a2;
  long long v20 = 0u;
  long long v21 = 0u;
  v17.receiver = self;
  v17.super_class = (Class)UIScrollViewAccessibility;
  [(UIScrollViewAccessibility *)&v17 _defaultFocusRegionFrame];
  *(void *)&long long v20 = v2;
  *((void *)&v20 + 1) = v3;
  *(void *)&long long v21 = v4;
  *((void *)&v21 + 1) = v5;
  if ([(UIScrollViewAccessibility *)v19 _accessibilityIsFKARunningForFocusItem])
  {
    [(UIScrollViewAccessibility *)v19 safeAreaInsets];
    *(void *)&long long v15 = UIEdgeInsetsInsetRect_0(*(double *)&v20, *((double *)&v20 + 1), *(double *)&v21, *((double *)&v21 + 1), v6, v7);
    *((void *)&v15 + 1) = v8;
    *(void *)&long long v16 = v9;
    *((void *)&v16 + 1) = v10;
    long long v20 = v15;
    long long v21 = v16;
  }
  double v12 = *((double *)&v20 + 1);
  double v11 = *(double *)&v20;
  double v14 = *((double *)&v21 + 1);
  double v13 = *(double *)&v21;
  result.size.double height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused
{
  return (AXProcessIsSpringBoard() ^ 1) & 1;
}

- (BOOL)_accessibilityRemembersLastFocusedChild
{
  id v2 = (id)[(UIScrollViewAccessibility *)self focusGroupIdentifier];
  BOOL v4 = v2 != 0;

  return v4;
}

- (void)_hideScrollIndicators
{
  uint64_t v8 = self;
  SEL v7 = a2;
  id v4 = -[UIScrollViewAccessibility _axVerticalScrollIndicator](self);
  char v5 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorIsFocused]((uint64_t)v4);

  if ((v5 & 1) == 0)
  {
    id v2 = -[UIScrollViewAccessibility _axHorizontalScrollIndicator](v8);
    char v3 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorIsFocused]((uint64_t)v2);

    if ((v3 & 1) == 0)
    {
      v6.receiver = v8;
      v6.super_class = (Class)UIScrollViewAccessibility;
      [(UIScrollViewAccessibility *)&v6 _hideScrollIndicators];
    }
  }
}

- (BOOL)_accessibilityIsSortPriorityContainer
{
  return 1;
}

- (BOOL)accessibilityShouldEnableScrollIndicator:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (MEMORY[0x2455E68D0]())
  {
    if (UIAccessibilityIsWidgetExtension())
    {
      char v11 = 0;
      int v8 = 1;
    }
    else
    {
      char v7 = 0;
      uint64_t v5 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection]((uint64_t)location[0]);
      if (v5 == 1)
      {
        char v7 = [(UIScrollViewAccessibility *)v10 _axShowsVerticalScrollBar];
      }
      else if (v5 == 2)
      {
        char v7 = [(UIScrollViewAccessibility *)v10 _axShowsHorizontalScrollBar];
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)AXLogAppAccessibility();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
        {
          uint64_t v3 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection]((uint64_t)location[0]);
          __os_log_helper_16_0_1_8_0((uint64_t)v12, v3);
          _os_log_fault_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_FAULT, "Unexpected direction for indicator: %ld", v12, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      if (v7) {
        char v7 = [(UIScrollViewAccessibility *)v10 accessibilityNumberOfPagesForScrollIndicator:location[0]] >= 5;
      }
      char v11 = v7 & 1;
      int v8 = 1;
    }
  }
  else
  {
    char v11 = 0;
    int v8 = 1;
  }
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (void)accessibilityScrollIndicator:(id)a3 didBecomeFocused:(BOOL)a4
{
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v7 = a4;
  id v6 = v9;
  if (a4)
  {
    [v6 flashScrollIndicators];
  }
  else
  {
    uint64_t v5 = v9;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v5, 0);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

uint64_t __75__UIScrollViewAccessibility_accessibilityScrollIndicator_didBecomeFocused___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideScrollIndicators", a1, a1);
}

- (void)accessibilityScrollIndicator:(id)a3 addProgress:(double)a4
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v7 = v10;
  uint64_t v4 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection]((uint64_t)location[0]);
  double v8 = -[UIScrollViewAccessibility _axContentOffsetForAddedProgress:inDirection:](v7, v4, a4);
  -[UIScrollViewAccessibility setContentOffset:](v10, "setContentOffset:", v8, v5);
  objc_storeStrong(location, 0);
}

- (double)_axContentOffsetForAddedProgress:(double)a3 inDirection:
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  double v33 = a1;
  double v32 = a3;
  uint64_t v31 = a2;
  if (a1)
  {
    id location = v33;
    [location contentOffset];
    *(void *)&long long v29 = v3;
    *((void *)&v29 + 1) = v4;
    long long v34 = v29;
    if (v31 == 1)
    {
      double v26 = -[UIScrollViewAccessibility _axMinimumContentOffset](v33);
      double v27 = v5;
      double v28 = v5;
      double v23 = -[UIScrollViewAccessibility _axMaximumContentOffset](v33);
      double v24 = v6;
      double v25 = v6;
      if (v28 < v6)
      {
        double v7 = CGFloatMin_0(*((double *)&v29 + 1) + v32 * (v25 - v28), v25);
        double v22 = CGFloatMax_0(v7, v28);
        *((double *)&v34 + 1) = v22;
      }
    }
    else if (v31 == 2)
    {
      id v12 = (id)[MEMORY[0x263F1C408] sharedApplication];
      BOOL v13 = [v12 userInterfaceLayoutDirection] != 1;

      if (!v13) {
        double v32 = v32 * -1.0;
      }
      double v19 = -[UIScrollViewAccessibility _axMinimumContentOffset](v33);
      uint64_t v20 = v8;
      double v21 = v19;
      double v16 = -[UIScrollViewAccessibility _axMaximumContentOffset](v33);
      uint64_t v17 = v9;
      double v18 = v16;
      if (v19 < v16)
      {
        double v10 = CGFloatMin_0(*(double *)&v29 + v32 * (v18 - v21), v18);
        double v15 = CGFloatMax_0(v10, v21);
        *(double *)&long long v34 = v15;
      }
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)AXLogAppAccessibility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v35, v31);
        _os_log_fault_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_FAULT, "Unexpected direction for indicator: %ld", v35, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    long long v34 = 0uLL;
  }
  return *(double *)&v34;
}

- (int64_t)accessibilityNumberOfPagesForScrollIndicator:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  double v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v8 = 0;
  uint64_t v6 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection]((uint64_t)location[0]);
  if (v6 == 1)
  {
    -[UIScrollViewAccessibility _accessibilityCurrentPage:totalPages:forVerticalDirection:](v10, 0, &v8, 1);
  }
  else if (v6 == 2)
  {
    -[UIScrollViewAccessibility _accessibilityCurrentPage:totalPages:forVerticalDirection:](v10, 0, &v8, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogAppAccessibility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v3 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection]((uint64_t)location[0]);
      __os_log_helper_16_0_1_8_0((uint64_t)v11, v3);
      _os_log_fault_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_FAULT, "Unexpected direction for indicator: %ld", v11, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  int64_t v5 = v8;
  objc_storeStrong(location, 0);
  return v5;
}

- (double)accessibilityProgressForScrollIndicator:(id)a3
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v5 = v8;
  uint64_t v3 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection]((uint64_t)location[0]);
  double v6 = -[UIScrollViewAccessibility _axProgressForDirection:](v5, v3);
  objc_storeStrong(location, 0);
  return v6;
}

- (double)_axProgressForDirection:(void *)a1
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  double v28 = a1;
  uint64_t v27 = a2;
  if (!a1) {
    return 0.0;
  }
  double v26 = 0.0;
  double v25 = 0.0;
  double v24 = 0.0;
  double v23 = 0.0;
  id location = v28;
  [location contentOffset];
  double v20 = v2;
  double v21 = v3;
  BOOL v19 = 0;
  if (v27 == 1)
  {
    double v17 = -[UIScrollViewAccessibility _axMinimumContentOffset](v28);
    double v18 = v4;
    double v25 = v4;
    double v15 = -[UIScrollViewAccessibility _axMaximumContentOffset](v28);
    double v16 = v5;
    double v24 = v5;
    double v23 = v21;
  }
  else if (v27 == 2)
  {
    double v13 = -[UIScrollViewAccessibility _axMinimumContentOffset](v28);
    uint64_t v14 = v6;
    double v25 = v13;
    double v11 = -[UIScrollViewAccessibility _axMaximumContentOffset](v28);
    uint64_t v12 = v7;
    double v24 = v11;
    double v23 = v20;
    id v9 = (id)[MEMORY[0x263F1C408] sharedApplication];
    BOOL v19 = [v9 userInterfaceLayoutDirection] == 1;
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogAppAccessibility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v30, v27);
      _os_log_fault_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_FAULT, "Unexpected direction for indicator: %ld", v30, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  if (v25 < v24)
  {
    if (v23 > v25)
    {
      if (v23 >= v24 || v24 == 0.0) {
        double v26 = 1.0;
      }
      else {
        double v26 = (v23 - v25) / (v24 - v25);
      }
    }
    else
    {
      double v26 = 0.0;
    }
  }
  if (v19) {
    double v26 = 1.0 - v26;
  }
  double v29 = v26;
  objc_storeStrong(&location, 0);
  return v29;
}

- (CGRect)accessibilityFrameForScrollIndicator:(id)a3
{
  os_log_type_t v89 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v87 = v89;
  char v85 = 0;
  objc_opt_class();
  id v84 = (id)__UIAccessibilityCastAsClass();
  id v83 = v84;
  objc_storeStrong(&v84, 0);
  id v86 = v83;
  [v83 bounds];
  double v78 = v3;
  double v79 = v4;
  double v80 = v5;
  double v81 = v6;
  objc_msgSend(v83, "convertRect:toView:", v87, v3, v4, v5, v6);
  v82.origin.x = v7;
  v82.origin.y = v8;
  v82.size.width = v9;
  v82.size.double height = v10;
  double v77 = 30.0;
  double v76 = 0.5;
  uint64_t v33 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection]((uint64_t)location[0]);
  if (v33 == 1)
  {
    long long v74 = 0u;
    long long v75 = 0u;
    [v87 bounds];
    double v70 = v11;
    double v71 = v12;
    double v72 = v13;
    double v73 = v14;
    uint64_t v61 = 0;
    uint64_t v62 = &v61;
    int v63 = 0x10000000;
    int v64 = 64;
    double v65 = &unk_24046C852;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v55 = MEMORY[0x263EF8330];
    int v56 = -1073741824;
    int v57 = 0;
    double v58 = __66__UIScrollViewAccessibility_accessibilityFrameForScrollIndicator___block_invoke;
    v59 = &unk_2650AE390;
    v60[1] = &v61;
    v60[0] = v87;
    AXPerformSafeBlock();
    long long v68 = *((_OWORD *)v62 + 2);
    long long v69 = *((_OWORD *)v62 + 3);
    objc_storeStrong(v60, 0);
    _Block_object_dispose(&v61, 8);
    *(void *)&long long v74 = UIEdgeInsetsInsetRect_0(v70, v71, v72, v73, *(double *)&v68, *((double *)&v68 + 1));
    *((CGFloat *)&v74 + 1) = v15;
    *(void *)&long long v75 = v16;
    *((CGFloat *)&v75 + 1) = v17;
    v82.origin.y = v15;
    v82.size.double height = v17;
    [v87 bounds];
    CGRect recta = v94;
    double v54 = 0.5 * CGRectGetWidth(v94);
    double v52 = CGFloatMin_0(30.0, v54);
    v82.origin.x = CGRectGetMaxX(v82) - v52;
    v82.size.width = v52;
  }
  else if (v33 == 2)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    [v87 bounds];
    double v46 = v18;
    double v47 = v19;
    double v48 = v20;
    double v49 = v21;
    uint64_t v37 = 0;
    id v38 = &v37;
    int v39 = 0x10000000;
    int v40 = 64;
    CGPoint v41 = &unk_24046C852;
    long long v42 = 0u;
    long long v43 = 0u;
    v36[1] = &v37;
    v36[0] = v87;
    AXPerformSafeBlock();
    long long v44 = *((_OWORD *)v38 + 2);
    long long v45 = *((_OWORD *)v38 + 3);
    objc_storeStrong(v36, 0);
    _Block_object_dispose(&v37, 8);
    *(void *)&long long v50 = UIEdgeInsetsInsetRect_0(v46, v47, v48, v49, *(double *)&v44, *((double *)&v44 + 1));
    *((void *)&v50 + 1) = v22;
    *(CGFloat *)&long long v51 = v23;
    *((void *)&v51 + 1) = v24;
    *(void *)&v82.origin.x = v50;
    v82.size.width = v23;
    [v87 bounds];
    double v35 = 0.5 * CGRectGetHeight(v95);
    double v34 = CGFloatMin_0(30.0, v35);
    v82.origin.y = CGRectGetMaxY(v82) - v34;
    v82.size.double height = v34;
  }
  UIAccessibilityFrameForBounds();
  double v90 = v25;
  double v91 = v26;
  double v92 = v27;
  double v93 = v28;
  objc_storeStrong(&v86, 0);
  objc_storeStrong(&v87, 0);
  objc_storeStrong(location, 0);
  double v29 = v90;
  double v30 = v91;
  double v31 = v92;
  double v32 = v93;
  result.size.double height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

__n128 __66__UIScrollViewAccessibility_accessibilityFrameForScrollIndicator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _effectiveVerticalScrollIndicatorInsets];
  *(void *)&long long v8 = v1;
  *((void *)&v8 + 1) = v2;
  v9.n128_u64[0] = v3;
  v9.n128_u64[1] = v4;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  *(_OWORD *)(v5 + 32) = v8;
  __n128 result = v9;
  *(__n128 *)(v5 + 48) = v9;
  return result;
}

__n128 __66__UIScrollViewAccessibility_accessibilityFrameForScrollIndicator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _effectiveHorizontalScrollIndicatorInsets];
  *(void *)&long long v8 = v1;
  *((void *)&v8 + 1) = v2;
  v9.n128_u64[0] = v3;
  v9.n128_u64[1] = v4;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  *(_OWORD *)(v5 + 32) = v8;
  __n128 result = v9;
  *(__n128 *)(v5 + 48) = v9;
  return result;
}

- (id)_axLastScrubAnnouncementDate
{
  return objc_getAssociatedObject(self, &__UIScrollViewAccessibility___axLastScrubAnnouncementDate);
}

- (void)_axSetLastScrubAnnouncementDate:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (void)_axAnnounceScrubForDirection:(void *)a1
{
  if (a1)
  {
    UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
    -[UIScrollViewAccessibility _axProgressForDirection:](a1, a2);
    id v3 = (id)AXFormatFloatWithPercentage();
    UIAccessibilityPostNotification(notification, v3);
  }
}

- (CGPoint)_newScrollOffsetForScrubReturningAnimated:(BOOL *)a3
{
  CGFloat v17 = self;
  SEL v16 = a2;
  CGFloat v15 = a3;
  double v18 = 0.0;
  double v19 = 0.0;
  v14.receiver = self;
  v14.super_class = (Class)UIScrollViewAccessibility;
  [(UIScrollViewAccessibility *)&v14 _newScrollOffsetForScrubReturningAnimated:a3];
  double v18 = v3;
  double v19 = v4;
  id v13 = (id)[MEMORY[0x263EFF910] date];
  id location = [(UIScrollViewAccessibility *)v17 _axLastScrubAnnouncementDate];
  [(UIScrollViewAccessibility *)v17 contentOffset];
  double v11 = v6;
  double v7 = v18;
  if (v18 == v11)
  {
    double v7 = v19;
    uint64_t v10 = v19 != v5;
  }
  else
  {
    uint64_t v10 = 2;
  }
  if (v10)
  {
    if (!location || (objc_msgSend(v13, "timeIntervalSinceDate:", location, v7), v7 > 1.0))
    {
      -[UIScrollViewAccessibility _axSetLastScrubAnnouncementDate:](v17, "_axSetLastScrubAnnouncementDate:", v13, v7);
      -[UIScrollViewAccessibility _axAnnounceScrubForDirection:](v17, v10);
    }
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v13, 0);
  double v8 = v18;
  double v9 = v19;
  result.y = v9;
  result.x = v8;
  return result;
}

@end