@interface UIViewAccessibility
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
+ (void)_axTriggerNextContextMenuInteractionInQueue:(void *)a3 forElement:(void *)a4 targetPointValue:;
- (BOOL)_acceessibilityUIKitIsUserInteractionDisabled;
- (BOOL)_accessibilityAvoidsMockViewContainers;
- (BOOL)_accessibilityBlocksInteraction;
- (BOOL)_accessibilityDisplayFocusIndicatorForFocusEverywhereView;
- (BOOL)_accessibilityFKAShouldBeProcessed;
- (BOOL)_accessibilityInTopLevelTabLoop;
- (BOOL)_accessibilityIsDescendantOfHostingView;
- (BOOL)_accessibilityIsFKARunningForFocusItem;
- (BOOL)_accessibilityIsInCollectionCell;
- (BOOL)_accessibilityIsInFocusableCell;
- (BOOL)_accessibilityIsInTableCell;
- (BOOL)_accessibilityIsKindOfUIView;
- (BOOL)_accessibilityIsSoftwareKeyboardMimic;
- (BOOL)_accessibilityIsUserInteractionEnabled;
- (BOOL)_accessibilityIsUserInteractionEnabledChain;
- (BOOL)_accessibilityObscuredScreenAllowsView:(id)a3;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)_accessibilityPointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)_accessibilityPreventOcclusionForViewFromAboveFocusRegionForFocusEverywhereView;
- (BOOL)_accessibilityShouldHitTestLayers;
- (BOOL)_accessibilityShowContextMenuForElement:(id)a3 targetPointValue:(id)a4;
- (BOOL)_accessibilityUnfocusableViewCanBeFocusedForFocusEverywhere;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (BOOL)_accessibilityViewIsActive;
- (BOOL)_accessibilityViewIsBeingHitTested:(uint64_t)a1;
- (BOOL)_axHasNoVisibleAxElements;
- (BOOL)_axViewIsOffScreen:(uint64_t)a1;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)_prefersFocusContainment;
- (BOOL)accessibilityElementIsFocused;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)accessibilityViewIsModal;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGRect)_accessibilityBounds;
- (CGRect)accessibilityFrame;
- (double)_accessibilityFrameForView:(uint64_t)a1;
- (double)_accessibilityMaxFuzzyHitTestDistance;
- (double)_accessibilityViewAlpha;
- (id)__accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityAllDragSourceDescriptors;
- (id)_accessibilityAllDropPointDescriptors;
- (id)_accessibilityAuditIssuesWithOptions:(id)a3;
- (id)_accessibilityAutomaticIdentifier;
- (id)_accessibilityCapturedImages;
- (id)_accessibilityCheckForAllowedModalView:(double)a3 event:(double)a4;
- (id)_accessibilityCirclePathBasedOnBoundsWidth;
- (id)_accessibilityFocusRingTintColor;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityHitTestSubviews;
- (id)_accessibilityImageData;
- (id)_accessibilityLastFocusedChild;
- (id)_accessibilityObscuredScreenAllowedViews;
- (id)_accessibilityProxyView;
- (id)_accessibilityRetrieveIvarText;
- (id)_accessibilityRetrieveLabelFromTableViewCell;
- (id)_accessibilitySortedElementsWithin;
- (id)_accessibilitySortedElementsWithinWithOptions:(id)a3;
- (id)_accessibilitySubviewMatchingFKAView:(void *)a1;
- (id)_accessibilitySupportGesturesAttributes;
- (id)_accessibilityUserTestingChildrenInAccessibilitySortedOrder:(BOOL)a3;
- (id)_accessibilityUserTestingSubviewsSorted:(void *)a1;
- (id)_accessibilityViewController;
- (id)_accessibilityViewMatchingFKAView:(void *)a3 inArray:;
- (id)_axBackgroundViewForCornerRadius;
- (id)_axResponderChain;
- (id)_axSubviews;
- (id)_axViewIsProbablyDimmingViewCachedValue;
- (id)_childFocusViews;
- (id)_clippedViewHierarchyDescription;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)accessibilityContainer;
- (id)accessibilityPath;
- (id)automationElements;
- (id)focusItemsInRect:(CGRect)a3;
- (id)preferredFocusEnvironments;
- (int64_t)_accessibilityHorizontalSizeClass;
- (int64_t)_accessibilityVerticalSizeClass;
- (uint64_t)_accessibilityDidLoadAccessibilityInformation;
- (uint64_t)_accessibilityHasButtonLikeGestureRecognizer;
- (uint64_t)_accessibilityIsIgnored;
- (uint64_t)_accessibilityIsSiblingOfModalizingBlocker;
- (uint64_t)_accessibilityModalViewBlocksView:(void *)a3 blockerView:;
- (uint64_t)_accessibilityViewIsProbablyDimmingView;
- (uint64_t)_axHasSingleFocusableSubview;
- (uint64_t)_setAccessibilityDidLoadAccessibilityInformation:(uint64_t)result;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityCapturedImagesWithDepth:(void *)a3 capturedImages:;
- (void)_accessibilityFinalize;
- (void)_accessibilityPostNotification:(id)a3;
- (void)_axPrintSubviews:(int64_t)a3 string:(id)a4;
- (void)_axSetViewIsProbablyDimmingView:(void *)a1;
- (void)_notifyReferenceViewSizeChange;
- (void)setAlpha:(double)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UIViewAccessibility

- (void)_accessibilityFinalize
{
}

- (void)_notifyReferenceViewSizeChange
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIViewAccessibility;
  [(UIViewAccessibility *)&v2 _notifyReferenceViewSizeChange];
  -[UIViewAccessibility _axSetViewIsProbablyDimmingView:](v4, 0);
}

- (void)setBackgroundColor:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = v9;
  id v3 = (id)[v6 backgroundColor];
  char v4 = AXColorsProbablyEqual();

  BOOL v7 = (v4 & 1) == 0;
  v5.receiver = v9;
  v5.super_class = (Class)UIViewAccessibility;
  [(UIViewAccessibility *)&v5 setBackgroundColor:location[0]];
  if (v7) {
    -[UIViewAccessibility _axSetViewIsProbablyDimmingView:](v9, 0);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIViewAccessibility;
  [(UIViewAccessibility *)&v3 willMoveToWindow:location[0]];
  if (location[0] && (-[UIViewAccessibility _accessibilityDidLoadAccessibilityInformation]((uint64_t)v5) & 1) == 0)
  {
    [(UIViewAccessibility *)v5 _accessibilityLoadAccessibilityInformation];
    -[UIViewAccessibility _setAccessibilityDidLoadAccessibilityInformation:]((uint64_t)v5);
  }
  objc_storeStrong(location, 0);
}

- (uint64_t)_accessibilityDidLoadAccessibilityInformation
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)_setAccessibilityDidLoadAccessibilityInformation:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

- (void)setHidden:(BOOL)a3
{
  v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  id location = self;
  BOOL v5 = ([location isHidden] & 1) != v6;
  v3.receiver = v8;
  v3.super_class = (Class)UIViewAccessibility;
  [(UIViewAccessibility *)&v3 setHidden:v6];
  if (v5) {
    -[UIViewAccessibility _axSetViewIsProbablyDimmingView:](v8, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)setAlpha:(double)a3
{
  v9 = self;
  SEL v8 = a2;
  double v7 = a3;
  id location = self;
  [location alpha];
  BOOL v6 = AXCGFAbs_2(v3 - v7) >= 0.001;
  v4.receiver = v9;
  v4.super_class = (Class)UIViewAccessibility;
  [(UIViewAccessibility *)&v4 setAlpha:v7];
  if (v6) {
    -[UIViewAccessibility _axSetViewIsProbablyDimmingView:](v9, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)_axSetViewIsProbablyDimmingView:(void *)a1
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v38 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v38)
  {
    BOOL v35 = 0;
    id v34 = -[UIViewAccessibility _axViewIsProbablyDimmingViewCachedValue](v38);
    if (v34)
    {
      int v16 = [v34 BOOLValue] & 1;
      BOOL v35 = v16 != ([location BOOLValue] & 1);
    }
    else if (location)
    {
      BOOL v35 = ([location BOOLValue] & 1) != 0;
    }
    objc_setAssociatedObject(v38, &AXViewIsProbablyDimmingView, location, (void *)1);
    if (v35)
    {
      BOOL v33 = 1;
      id v32 = (id)[v38 _accessibilityObscuredScreenAllowedViews];
      memset(__b, 0, sizeof(__b));
      id obj = (id)_UIAccessibilityFocusedElements();
      uint64_t v15 = [obj countByEnumeratingWithState:__b objects:v40 count:16];
      if (v15)
      {
        uint64_t v11 = *(void *)__b[2];
        uint64_t v12 = 0;
        unint64_t v13 = v15;
        while (1)
        {
          uint64_t v10 = v12;
          if (*(void *)__b[2] != v11) {
            objc_enumerationMutation(obj);
          }
          v31 = *(void **)(__b[1] + 8 * v12);
          memset(v28, 0, sizeof(v28));
          id v8 = v32;
          uint64_t v9 = [v8 countByEnumeratingWithState:v28 objects:v39 count:16];
          if (v9)
          {
            uint64_t v5 = *(void *)v28[2];
            uint64_t v6 = 0;
            unint64_t v7 = v9;
            while (1)
            {
              uint64_t v4 = v6;
              if (*(void *)v28[2] != v5) {
                objc_enumerationMutation(v8);
              }
              id v29 = *(id *)(v28[1] + 8 * v6);
              uint64_t v23 = 0;
              v24 = &v23;
              int v25 = 0x20000000;
              int v26 = 32;
              char v27 = 0;
              double v3 = v31;
              uint64_t v17 = MEMORY[0x263EF8330];
              int v18 = -1073741824;
              int v19 = 0;
              v20 = __55__UIViewAccessibility__axSetViewIsProbablyDimmingView___block_invoke;
              v21 = &unk_2650AF510;
              v22[0] = v29;
              v22[1] = &v23;
              id v2 = (id)[v3 _accessibilityFindAncestor:&v17 startWithSelf:1];
              BOOL v33 = v2 == 0;

              int v36 = (v24[3] & 1) != 0 ? 4 : 0;
              objc_storeStrong(v22, 0);
              _Block_object_dispose(&v23, 8);
              if (v36) {
                break;
              }
              ++v6;
              if (v4 + 1 >= v7)
              {
                uint64_t v6 = 0;
                unint64_t v7 = [v8 countByEnumeratingWithState:v28 objects:v39 count:16];
                if (!v7) {
                  goto LABEL_22;
                }
              }
            }
          }
          else
          {
LABEL_22:
            int v36 = 0;
          }

          if (!v33) {
            break;
          }
          ++v12;
          if (v10 + 1 >= v13)
          {
            uint64_t v12 = 0;
            unint64_t v13 = [obj countByEnumeratingWithState:__b objects:v40 count:16];
            if (!v13) {
              goto LABEL_27;
            }
          }
        }
        int v36 = 2;
      }
      else
      {
LABEL_27:
        int v36 = 0;
      }

      if (v33) {
        UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
      }
      objc_storeStrong(&v32, 0);
    }
    objc_storeStrong(&v34, 0);
    int v36 = 0;
  }
  else
  {
    int v36 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)_axViewIsProbablyDimmingViewCachedValue
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &AXViewIsProbablyDimmingView);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  uint64_t v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  char v6 = [(UIViewAccessibility *)self _accessibilityBoolValueForKey:@"AXIsElementCheckingStatus"] & 1;
  if ((v6 & 1) == 0)
  {
    [(UIViewAccessibility *)v9 _accessibilitySetBoolValue:1 forKey:@"AXIsElementCheckingStatus"];
    id location = (id)[(UIViewAccessibility *)v9 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
    if (location && v7 != [(UIViewAccessibility *)v9 isAccessibilityElement]) {
      id v3 = (id)[location safeValueForKey:@"_accessibilityClearChildren"];
    }
    objc_storeStrong(&location, 0);
  }
  v4.receiver = v9;
  v4.super_class = (Class)UIViewAccessibility;
  [(UIViewAccessibility *)&v4 setIsAccessibilityElement:v7];
}

- (id)accessibilityContainer
{
  char v6 = self;
  location[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UIViewAccessibility;
  location[0] = [(UIViewAccessibility *)&v4 accessibilityContainer];
  if (location[0]) {
    id v7 = location[0];
  }
  else {
    id v7 = (id)[(UIViewAccessibility *)v6 superview];
  }
  objc_storeStrong(location, 0);
  id v2 = v7;

  return v2;
}

- (BOOL)_isEligibleForFocusInteraction
{
  unint64_t v13 = self;
  SEL v12 = a2;
  char v11 = 0;
  v10.receiver = self;
  v10.super_class = (Class)UIViewAccessibility;
  char v11 = [(UIViewAccessibility *)&v10 _isEligibleForFocusInteraction];
  if ([(UIViewAccessibility *)v13 _accessibilityIsFKARunningForFocusItem]
    || ([(UIViewAccessibility *)v13 _accessibilityIsFocusForFocusEverywhereRunningForFocusItem] & 1) != 0)
  {
    id location = v13;
    char v7 = 0;
    BOOL v6 = 0;
    if (([location isHidden] & 1) == 0)
    {
      [location alpha];
      BOOL v6 = 0;
      if (CGFAbs_2(v2 - 0.0) >= 2.22044605e-16)
      {
        id v8 = (id)[location _window];
        char v7 = 1;
        BOOL v6 = v8 != 0;
      }
    }
    char v11 = v6;
    if (v7) {

    }
    if ([(UIViewAccessibility *)v13 _accessibilityIsFKARunningForFocusItem])
    {
      char v5 = 1;
      if (([location isUserInteractionEnabled] & 1) == 0) {
        char v5 = [location accessibilityRespondsToUserInteraction];
      }
      char v4 = 0;
      if (v11)
      {
        char v4 = 0;
        if (v5) {
          char v4 = [location safeBoolForKey:@"_isFocusInteractionEnabled"];
        }
      }
      char v11 = v4 & 1;
    }
    char v14 = v11 & 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    char v14 = v11 & 1;
  }
  return v14 & 1;
}

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  char v11 = self;
  SEL v10 = a2;
  uint64_t v9 = 0;
  char v8 = 0;
  id v7 = (id)__UIAccessibilitySafeClass();
  id v6 = v7;
  objc_storeStrong(&v7, 0);
  id v3 = (id)[v6 traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  uint64_t v9 = v4;
  BOOL v5 = 0;
  if (_UIAccessibilityFullKeyboardAccessEnabled())
  {
    BOOL v5 = 0;
    if (v9 != 3) {
      return v9 != 2;
    }
  }
  return v5;
}

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  char v11 = location;
  id v10 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v8 = @"UIView";
  uint64_t v9 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_childFocusViews", v9, 0);
  id v3 = "B";
  [location[0] validateClass:v8 hasInstanceMethod:@"canBecomeFocused" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_isEligibleForFocusInteraction", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_isFocusInteractionEnabled", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_defaultFocusRegionFrame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  uint64_t v4 = @"_UIFocusItemInternal";
  objc_msgSend(location[0], "validateProtocol:hasOptionalInstanceMethod:");
  [location[0] validateProtocol:v4 hasOptionalInstanceMethod:@"_drawsFocusRingWhenChildrenFocused"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"preferredFocusEnvironments", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_normalInheritedTintColor", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"focusGroupIdentifier", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_systemDefaultFocusGroupIdentifier", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_containingScrollView", v9, 0);
  id v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"didUpdateFocusInContext:withAnimationCoordinator:", v9, v9, 0);
  BOOL v5 = @"UIContextMenuInteraction";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"presentationsByIdentifier", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_interactionShouldBeginAtPoint:completion:", v6, "{CAPoint3D=ddd}", "@?", 0);
  id v7 = @"_UIContextMenuUIController";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"platterContainerView", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_clippedViewHierarchyDescription", v9, 0);
  objc_storeStrong(v11, v10);
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityIsKindOfUIView
{
  return 1;
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v19 = self;
  SEL v18 = a2;
  if (-[UIViewAccessibility _accessibilityViewIsProbablyDimmingView](self))
  {
    id location = (id)[MEMORY[0x263EFF980] array];
    memset(__b, 0, sizeof(__b));
    id v9 = (id)[(UIViewAccessibility *)v19 superview];
    id v8 = (id)[v9 subviews];
    id obj = (id)[v8 reverseObjectEnumerator];

    uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
    if (v11)
    {
      uint64_t v5 = *(void *)__b[2];
      uint64_t v6 = 0;
      unint64_t v7 = v11;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(UIViewAccessibility **)(__b[1] + 8 * v6);
        if (v15 == v19) {
          break;
        }
        [location addObject:v15];
        ++v6;
        if (v4 + 1 >= v7)
        {
          uint64_t v6 = 0;
          unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
          if (!v7) {
            goto LABEL_11;
          }
        }
      }
      int v13 = 2;
    }
    else
    {
LABEL_11:
      int v13 = 0;
    }

    if ([location count])
    {
      id v20 = location;
    }
    else
    {
      v12.receiver = v19;
      v12.super_class = (Class)UIViewAccessibility;
      id v20 = [(UIViewAccessibility *)&v12 _accessibilityObscuredScreenAllowedViews];
    }
    int v13 = 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v17.receiver = v19;
    v17.super_class = (Class)UIViewAccessibility;
    id v20 = [(UIViewAccessibility *)&v17 _accessibilityObscuredScreenAllowedViews];
  }
  double v2 = v20;

  return v2;
}

- (uint64_t)_accessibilityViewIsProbablyDimmingView
{
  v63 = a1;
  if (a1)
  {
    id v62 = v63;
    [v62 bounds];
    v61.origin.x = v1;
    v61.origin.y = v2;
    v61.size.width = v3;
    v61.size.height = v4;
    id v23 = (id)[MEMORY[0x263F1C920] mainScreen];
    [v23 bounds];
    v60.origin.x = v5;
    v60.origin.y = v6;
    v60.size.width = v7;
    v60.size.height = v8;
    BOOL v24 = CGRectEqualToRect(v61, v60);

    if (v24)
    {
      id v9 = -[UIViewAccessibility _axViewIsProbablyDimmingViewCachedValue](v63);
      BOOL v22 = v9 == 0;

      if (!v22)
      {
        id v21 = -[UIViewAccessibility _axViewIsProbablyDimmingViewCachedValue](v63);
        char v64 = [v21 BOOLValue] & 1;

        int v59 = 1;
LABEL_27:
        objc_storeStrong(&v62, 0);
        return v64 & 1;
      }
      uint64_t v52 = MEMORY[0x263EF8330];
      int v53 = -1073741824;
      int v54 = 0;
      v55 = __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke;
      v56 = &unk_2650AF7B8;
      id v57 = v63;
      id v58 = (id)MEMORY[0x2455E7040](&v52);
      uint64_t v45 = MEMORY[0x263EF8330];
      int v46 = -1073741824;
      int v47 = 0;
      v48 = __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke_2;
      v49 = &unk_2650AF7E0;
      id v50 = v62;
      id v51 = (id)MEMORY[0x2455E7040](&v45);
      uint64_t v38 = MEMORY[0x263EF8330];
      int v39 = -1073741824;
      int v40 = 0;
      uint64_t v41 = __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke_3;
      v42 = &unk_2650AF808;
      id v43 = v51;
      id v44 = (id)MEMORY[0x2455E7040](&v38);
      uint64_t v31 = MEMORY[0x263EF8330];
      int v32 = -1073741824;
      int v33 = 0;
      id v34 = __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke_4;
      BOOL v35 = &unk_2650AE580;
      id v36 = v62;
      id v37 = (id)MEMORY[0x2455E7040](&v31);
      char v29 = 0;
      char v27 = 0;
      BOOL v20 = 1;
      if (([v62 isHidden] & 1) == 0)
      {
        id v30 = (id)[v62 layer];
        char v29 = 1;
        BOOL v20 = 1;
        if (([v30 isHidden] & 1) == 0)
        {
          id v28 = (id)[v62 layer];
          char v27 = 1;
          [v28 opacity];
          BOOL v20 = v10 == 0.0;
        }
      }
      if (v27) {

      }
      if (v29) {
      if (v20)
      }
      {
        char v64 = (*((uint64_t (**)(id, void))v58 + 2))(v58, 0) & 1;
        int v59 = 1;
      }
      else
      {
        id v26 = (id)[v62 backgroundColor];
        if (v26)
        {
          SEL v18 = (uint64_t (**)(id, void))v58;
          LOBYTE(v19) = 0;
          if ((*((uint64_t (**)(id, id))v44 + 2))(v44, v26)) {
            int v19 = (*((uint64_t (**)(void))v37 + 2))() ^ 1;
          }
          char v64 = v18[2](v18, v19 & 1) & 1;
          int v59 = 1;
        }
        else
        {
          id v16 = (id)[v62 layer];
          BOOL v17 = [v16 backgroundColor] == 0;

          if (v17)
          {
            int v59 = 0;
          }
          else
          {
            objc_super v12 = (void *)MEMORY[0x263F1C550];
            id v13 = (id)[v62 layer];
            id location = (id)objc_msgSend(v12, "colorWithCGColor:", objc_msgSend(v13, "backgroundColor"));

            char v14 = (uint64_t (**)(id, void))v58;
            LOBYTE(v15) = 0;
            if ((*((uint64_t (**)(id, id))v44 + 2))(v44, location)) {
              int v15 = (*((uint64_t (**)(void))v37 + 2))() ^ 1;
            }
            char v64 = v14[2](v14, v15 & 1) & 1;
            int v59 = 1;
            objc_storeStrong(&location, 0);
          }
        }
        objc_storeStrong(&v26, 0);
      }
      objc_storeStrong(&v37, 0);
      objc_storeStrong(&v36, 0);
      objc_storeStrong(&v44, 0);
      objc_storeStrong(&v43, 0);
      objc_storeStrong(&v51, 0);
      objc_storeStrong(&v50, 0);
      objc_storeStrong(&v58, 0);
      objc_storeStrong(&v57, 0);
      if (v59) {
        goto LABEL_27;
      }
    }
    char v64 = 0;
    int v59 = 1;
    goto LABEL_27;
  }
  char v64 = 0;
  return v64 & 1;
}

- (id)_accessibilityViewController
{
  CGFloat v6 = self;
  location[1] = (id)a2;
  location[0] = (id)[MEMORY[0x263F1CB68] viewControllerForView:self];
  if (!location[0])
  {
    id obj = (id)[(UIViewAccessibility *)v6 safeValueForKey:@"viewDelegate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong(location, obj);
    }
    objc_storeStrong(&obj, 0);
  }
  id v3 = location[0];
  objc_storeStrong(location, 0);

  return v3;
}

- (BOOL)accessibilityElementIsFocused
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v16 = self;
  location[1] = (id)a2;
  location[0] = (id)_UIAccessibilityFocusedElements();
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    unint64_t v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      char v14 = *(UIViewAccessibility **)(__b[1] + 8 * v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CGFloat v4 = v16;
        CGFloat v2 = (UIViewAccessibility *)(id)-[UIAccessibilityElementMockView view]((uint64_t)v14);
        char v17 = v4 == v2;

        int v12 = 1;
        goto LABEL_12;
      }
      if (v16 == v14) {
        break;
      }
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
        if (!v8) {
          goto LABEL_11;
        }
      }
    }
    char v17 = 1;
    int v12 = 1;
  }
  else
  {
LABEL_11:
    int v12 = 0;
  }
LABEL_12:

  if (!v12)
  {
    v11.receiver = v16;
    v11.super_class = (Class)UIViewAccessibility;
    char v17 = [(UIViewAccessibility *)&v11 accessibilityElementIsFocused];
    int v12 = 1;
  }
  objc_storeStrong(location, 0);
  return v17 & 1;
}

- (void)_accessibilityPostNotification:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  UIAccessibilityNotifications notification = 0;
  if ([location[0] isEqualToString:@"AXLayoutChange"]) {
    UIAccessibilityNotifications notification = *MEMORY[0x263F1CE18];
  }
  if (notification) {
    UIAccessibilityPostNotification(notification, 0);
  }
  objc_storeStrong(location, 0);
}

- (double)_accessibilityFrameForView:(uint64_t)a1
{
  uint64_t v15 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v15)
  {
    [location bounds];
    rect.origin.x = v2;
    rect.origin.y = v3;
    rect.size.width = v4;
    rect.size.height = v5;
    [location _accessibilityFrameExpansion];
    CGRectInset(rect, -v6, -v7);
    UIAccessibilityFrameForBounds();
    *(void *)&long long v16 = v8;
    *((void *)&v16 + 1) = v9;
    *(void *)&long long v17 = v10;
    *((void *)&v17 + 1) = v11;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  objc_storeStrong(&location, 0);
  return *(double *)&v16;
}

- (id)_accessibilityProxyView
{
  return self;
}

- (CGRect)_accessibilityBounds
{
  [(UIViewAccessibility *)self bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)_accessibilityCirclePathBasedOnBoundsWidth
{
  uint64_t v15 = (UIView *)self;
  SEL v14 = a2;
  [(UIViewAccessibility *)self _accessibilityBounds];
  path[1] = v2;
  path[2] = v3;
  double v12 = v4;
  uint64_t v13 = v5;
  uint64_t v9 = (void *)MEMORY[0x263F1C478];
  AX_CGRectGetCenter();
  path[0] = (UIBezierPath *)(id)objc_msgSend(v9, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v6, v7, v12 / 2.0, 0.0, 6.28318531);
  uint64_t v10 = UIAccessibilityConvertPathToScreenCoordinates(path[0], v15);
  objc_storeStrong((id *)path, 0);

  return v10;
}

- (id)accessibilityPath
{
  uint64_t v41 = self;
  SEL v40 = a2;
  v39.receiver = self;
  v39.super_class = (Class)UIViewAccessibility;
  id v2 = [(UIViewAccessibility *)&v39 accessibilityPath];
  BOOL v20 = v2 == 0;

  if (v20)
  {
    char v36 = 0;
    objc_opt_class();
    id v19 = (id)[(UIViewAccessibility *)v41 safeValueForKey:@"layer"];
    id v35 = (id)__UIAccessibilityCastAsClass();

    id v34 = v35;
    objc_storeStrong(&v35, 0);
    id v37 = v34;
    [v34 cornerRadius];
    if (v3 > 0.0 && ([(UIViewAccessibility *)v41 clipsToBounds] & 1) != 0)
    {
      SEL v18 = (void *)MEMORY[0x263F1C478];
      [(UIViewAccessibility *)v41 accessibilityFrame];
      double v29 = v4;
      double v30 = v5;
      double v31 = v6;
      double v32 = v7;
      [v37 cornerRadius];
      id v33 = (id)objc_msgSend(v18, "_bezierPathWithArcRoundedRect:cornerRadius:", v29, v30, v31, v32, v8);
      id v42 = v33;
      int v28 = 1;
      objc_storeStrong(&v33, 0);
    }
    else
    {
      id v27 = -[UIViewAccessibility _axBackgroundViewForCornerRadius]((uint64_t)v41);
      if (v27)
      {
        long long v16 = (void *)MEMORY[0x263F1C478];
        [v27 accessibilityFrame];
        double v22 = v9;
        double v23 = v10;
        double v24 = v11;
        double v25 = v12;
        id v17 = (id)[v27 layer];
        [v17 cornerRadius];
        id v26 = (id)objc_msgSend(v16, "_bezierPathWithArcRoundedRect:cornerRadius:", v22, v23, v24, v25, v13);

        id v42 = v26;
        int v28 = 1;
        objc_storeStrong(&v26, 0);
      }
      else
      {
        int v28 = 0;
      }
      objc_storeStrong(&v27, 0);
      if (!v28)
      {
        v21.receiver = v41;
        v21.super_class = (Class)UIViewAccessibility;
        id v42 = [(UIViewAccessibility *)&v21 accessibilityPath];
        int v28 = 1;
      }
    }
    objc_storeStrong(&v37, 0);
  }
  else
  {
    v38.receiver = v41;
    v38.super_class = (Class)UIViewAccessibility;
    id v42 = [(UIViewAccessibility *)&v38 accessibilityPath];
  }
  SEL v14 = v42;

  return v14;
}

- (id)_axBackgroundViewForCornerRadius
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v25 = a1;
  if (a1)
  {
    id location = 0;
    id v23 = (id)[objc_allocWithZone(MEMORY[0x263EFF980]) init];
    [v23 addObject:v25];
    do
    {
      if (![v23 count]) {
        break;
      }
      id v22 = (id)[v23 firstObject];
      [v23 removeObjectAtIndex:0];
      char v21 = 0;
      id v14 = (id)[v22 layer];
      [v14 cornerRadius];
      BOOL v15 = v1 <= 0.0;

      if (v15)
      {
        memset(__b, 0, sizeof(__b));
        id obj = (id)[v22 subviews];
        uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
        if (v13)
        {
          uint64_t v9 = *(void *)__b[2];
          uint64_t v10 = 0;
          unint64_t v11 = v13;
          while (1)
          {
            if (*(void *)__b[2] != v9) {
              objc_enumerationMutation(obj);
            }
            id v20 = *(id *)(__b[1] + 8 * v10);
            [v20 frame];
            double v17 = v2;
            double v18 = v3;
            [v22 frame];
            if (!__CGSizeEqualToSize_3(v17, v18, v4, v5)) {
              break;
            }
            [v23 addObject:v20];
            if (++v10 >= v11)
            {
              uint64_t v10 = 0;
              unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
              if (!v11) {
                break;
              }
            }
          }
        }
      }
      else
      {
        objc_storeStrong(&location, v22);
        char v21 = 1;
      }
      int v16 = (v21 & 1) != 0 ? 3 : 0;
      objc_storeStrong(&v22, 0);
    }
    while (!v16);
    id v26 = location;
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&location, 0);
  }
  else
  {
    id v26 = 0;
  }
  double v7 = v26;

  return v7;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  double v8 = self;
  SEL v7 = a2;
  id v2 = (id)[(UIViewAccessibility *)self _accessibilityValueForKey:@"_accessibilityOnlyComparesByXAxis"];
  BOOL v5 = v2 == 0;

  if (v5)
  {
    id v4 = [(UIViewAccessibility *)v8 _accessibilityViewController];
    BOOL v9 = [v4 _accessibilityOnlyComparesByXAxis] & 1;
  }
  else
  {
    v6.receiver = v8;
    v6.super_class = (Class)UIViewAccessibility;
    return [(UIViewAccessibility *)&v6 _accessibilityOnlyComparesByXAxis];
  }
  return v9;
}

- (CGRect)accessibilityFrame
{
  unint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UIViewAccessibility *)self accessibilityUserDefinedFrame];
  if (location[0])
  {
    [location[0] rectValue];
    double v12 = v5;
  }
  else
  {
    double v12 = -[UIViewAccessibility _accessibilityFrameForView:]((uint64_t)v11, v11);
  }
  double v13 = v2;
  double v14 = v3;
  double v15 = v4;
  objc_storeStrong(location, 0);
  double v6 = v12;
  double v7 = v13;
  double v8 = v14;
  double v9 = v15;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (uint64_t)_accessibilityIsSiblingOfModalizingBlocker
{
  id v6 = a1;
  if (a1)
  {
    double v9 = (dispatch_once_t *)&_accessibilityIsSiblingOfModalizingBlocker_onceToken;
    id location = 0;
    objc_storeStrong(&location, &__block_literal_global_51);
    if (*v9 != -1) {
      dispatch_once(v9, location);
    }
    objc_storeStrong(&location, 0);
    id v3 = (id)[v6 superview];
    id v5 = (id)[v3 subviews];

    char v4 = 1;
    if ((objc_msgSend(v5, "ax_containsObjectUsingBlock:", &__block_literal_global_402_0) & 1) == 0)
    {
      BOOL v2 = 0;
      if (![v5 indexOfObject:v6]) {
        BOOL v2 = (unint64_t)[v5 count] > 1;
      }
      char v4 = v2;
    }
    char v7 = v4;
    objc_storeStrong(&v5, 0);
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

void __65__UIViewAccessibility__accessibilityIsSiblingOfModalizingBlocker__block_invoke()
{
  char v4 = (void *)MEMORY[0x263EFFA08];
  id v3 = (void *)MEMORY[0x263EFF8C0];
  Class v2 = NSClassFromString(&cfstr_Uialertcontrol_6.isa);
  id v5 = (id)objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v2, NSClassFromString(&cfstr_Uipopoverview.isa));
  id v0 = (id)objc_msgSend(v4, "setWithArray:");
  double v1 = (void *)_accessibilityIsSiblingOfModalizingBlocker_ClassSet;
  _accessibilityIsSiblingOfModalizingBlocker_ClassSet = (uint64_t)v0;
}

uint64_t __65__UIViewAccessibility__accessibilityIsSiblingOfModalizingBlocker__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [(id)_accessibilityIsSiblingOfModalizingBlocker_ClassSet containsObject:objc_opt_class()];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)accessibilityViewIsModal
{
  id v2 = (id)[(UIViewAccessibility *)self storedAccessibilityViewIsModal];
  BOOL v5 = v2 == 0;

  if (v5) {
    return (-[UIViewAccessibility _accessibilityViewIsProbablyDimmingView](self) & 1) != 0
  }
        && (-[UIViewAccessibility _accessibilityIsSiblingOfModalizingBlocker](self) & 1) == 0;
  id v4 = (id)[(UIViewAccessibility *)self storedAccessibilityViewIsModal];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (BOOL)_accessibilityShouldHitTestLayers
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  double v9 = self;
  SEL v8 = a2;
  unint64_t v7 = 0;
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility;
  unint64_t v7 = [(UIViewAccessibility *)&v6 accessibilityTraits];
  id location = (id)[(UIViewAccessibility *)v9 accessibilityUserDefinedTraits];
  if (location)
  {
    uint64_t v2 = [location unsignedLongLongValue];
    v7 |= v2;
  }
  unint64_t v4 = v7;
  objc_storeStrong(&location, 0);
  return v4;
}

- (uint64_t)_accessibilityHasButtonLikeGestureRecognizer
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v12 = a1;
  if (a1)
  {
    id location = (id)[v12 gestureRecognizers];
    memset(__b, 0, sizeof(__b));
    id obj = location;
    uint64_t v7 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
    if (v7)
    {
      uint64_t v3 = *(void *)__b[2];
      uint64_t v4 = 0;
      unint64_t v5 = v7;
      while (1)
      {
        uint64_t v2 = v4;
        if (*(void *)__b[2] != v3) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(__b[1] + 8 * v4);
        if ([v10 isEnabled])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
        }
        ++v4;
        if (v2 + 1 >= v5)
        {
          uint64_t v4 = 0;
          unint64_t v5 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
          if (!v5) {
            goto LABEL_13;
          }
        }
      }
      char v13 = 1;
      int v8 = 1;
    }
    else
    {
LABEL_13:
      int v8 = 0;
    }

    if (!v8) {
      char v13 = 0;
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

- (BOOL)isAccessibilityElement
{
  objc_super v6 = self;
  SEL v5 = a2;
  if (UIAccessibilityIsSwitchControlRunning()
    && ([(UIViewAccessibility *)v6 _accessibilityShouldBeScannedIfAncestorCanScroll] & 1) != 0)
  {
    char v3 = 0;
    if (-[UIViewAccessibility _axHasNoVisibleAxElements](v6)) {
      char v3 = [(UIViewAccessibility *)v6 _accessibilityCanScrollInAtLeastOneDirection];
    }
    return v3 & 1;
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UIViewAccessibility;
    return [(UIViewAccessibility *)&v4 isAccessibilityElement];
  }
}

- (BOOL)_axHasNoVisibleAxElements
{
  id v10 = a1;
  if (a1)
  {
    id v2 = v10;
    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    objc_super v6 = __48__UIViewAccessibility__axHasNoVisibleAxElements__block_invoke;
    uint64_t v7 = &unk_2650AE790;
    id v8 = v10;
    id location = (id)[v2 _accessibilityFindSubviewDescendant:&v3];
    BOOL v11 = location == 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v8, 0);
  }
  else
  {
    return 0;
  }
  return v11;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  objc_super v6 = self;
  SEL v5 = a2;
  if (UIAccessibilityIsSwitchControlRunning()
    && ([(UIViewAccessibility *)v6 _accessibilityShouldBeScannedIfAncestorCanScroll] & 1) != 0)
  {
    char v3 = 0;
    if (-[UIViewAccessibility _axHasNoVisibleAxElements](v6)) {
      char v3 = [(UIViewAccessibility *)v6 _accessibilityCanScrollInAtLeastOneDirection];
    }
    return v3 & 1;
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UIViewAccessibility;
    return [(UIViewAccessibility *)&v4 accessibilityRespondsToUserInteraction];
  }
}

- (BOOL)_accessibilityViewIsActive
{
  return a1
      && ([a1 _accessibilityViewIsVisible] & 1) != 0
      && ([a1 isUserInteractionEnabled] & 1) != 0;
}

uint64_t __48__UIViewAccessibility__axHasNoVisibleAxElements__block_invoke(uint64_t *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[1] = a1;
  char v8 = 0;
  objc_opt_class();
  id v7 = (id)__UIAccessibilityCastAsClass();
  id v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  char v4 = 0;
  if (location[0] != (id)a1[4])
  {
    char v4 = 0;
    if ([v9[0] _accessibilityViewIsVisible])
    {
      char v4 = 0;
      if (!-[UIViewAccessibility _axViewIsOffScreen:](a1[4], v9[0]))
      {
        if (([v9[0] isAccessibilityElement] & 1) == 0
          || (char isKindOfClass = 1, ([v9[0] accessibilityRespondsToUserInteraction] & 1) == 0))
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
        }
        char v4 = isKindOfClass;
      }
    }
  }
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)_axViewIsOffScreen:(uint64_t)a1
{
  uint64_t v9 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v9)
  {
    [location _accessibilityVisibleFrame];
    rect2.origin.x = v2;
    rect2.origin.y = v3;
    rect2.size.width = v4;
    rect2.size.height = v5;
    BOOL v10 = CGRectEqualToRect(*MEMORY[0x263F001A8], rect2);
  }
  else
  {
    BOOL v10 = 0;
  }
  objc_storeStrong(&location, 0);
  return v10;
}

- (BOOL)_accessibilityBlocksInteraction
{
  return 0;
}

- (uint64_t)_accessibilityIsIgnored
{
  return 0;
}

- (id)_accessibilityAutomaticIdentifier
{
  id v3 = (id)[(UIViewAccessibility *)self safeValueForKey:@"tag"];
  uint64_t v4 = [v3 integerValue];

  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld", v4);
}

- (int64_t)_accessibilityHorizontalSizeClass
{
  v7[2] = self;
  v7[1] = (id)a2;
  char v6 = 0;
  id v5 = (id)__UIAccessibilitySafeClass();
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = (id)[v4 traitCollection];

  int64_t v3 = [v7[0] horizontalSizeClass];
  objc_storeStrong(v7, 0);
  return v3;
}

- (int64_t)_accessibilityVerticalSizeClass
{
  v7[2] = self;
  v7[1] = (id)a2;
  char v6 = 0;
  id v5 = (id)__UIAccessibilitySafeClass();
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = (id)[v4 traitCollection];

  int64_t v3 = [v7[0] verticalSizeClass];
  objc_storeStrong(v7, 0);
  return v3;
}

- (BOOL)_accessibilityAvoidsMockViewContainers
{
  return 0;
}

- (BOOL)_accessibilityObscuredScreenAllowsView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (uint64_t)_accessibilityModalViewBlocksView:(void *)a3 blockerView:
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v38 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  char v36 = a3;
  if (v38)
  {
    id v34 = location;
    id v33 = (id)[location _accessibilityParentView];
    while (v33)
    {
      id v21 = (id)[v33 superview];
      id v20 = (id)[v21 subviews];
      id v19 = (id)[v20 reverseObjectEnumerator];
      id v32 = (id)[v19 allObjects];

      id v31 = 0;
      memset(__b, 0, sizeof(__b));
      id obj = v32;
      uint64_t v23 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
      if (v23)
      {
        uint64_t v16 = *(void *)__b[2];
        uint64_t v17 = 0;
        unint64_t v18 = v23;
        while (1)
        {
          uint64_t v15 = v17;
          if (*(void *)__b[2] != v16) {
            objc_enumerationMutation(obj);
          }
          id v30 = *(id *)(__b[1] + 8 * v17);
          if (([v30 accessibilityViewIsModal] & 1) != 0
            && ([v30 _accessibilityViewIsVisible] & 1) != 0)
          {
            break;
          }
          ++v17;
          if (v15 + 1 >= v18)
          {
            uint64_t v17 = 0;
            unint64_t v18 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
            if (!v18) {
              goto LABEL_14;
            }
          }
        }
        objc_storeStrong(&v31, v30);
        int v35 = 4;
      }
      else
      {
LABEL_14:
        int v35 = 0;
      }

      if (v31)
      {
        if ([v31 _accessibilityObscuredScreenAllowsView:location])
        {
          char v39 = 0;
          int v35 = 1;
        }
        else if ([v33 _accessibilityIsViewDescendantOfElement:v31])
        {
          char v39 = 0;
          int v35 = 1;
        }
        else
        {
          id v28 = (id)[v31 _accessibilityObscuredScreenAllowedViews];
          id v27 = (id)[v31 _accessibilityHitTestingObscuredScreenAllowedViews];
          if (v27)
          {
            if (v28)
            {
              id v3 = (id)[v28 arrayByAddingObjectsFromArray:v27];
              id v4 = v28;
              id v28 = v3;
            }
            else
            {
              objc_storeStrong(&v28, v27);
            }
          }
          memset(v25, 0, sizeof(v25));
          id v13 = v28;
          uint64_t v14 = [v13 countByEnumeratingWithState:v25 objects:v40 count:16];
          if (v14)
          {
            uint64_t v10 = *(void *)v25[2];
            uint64_t v11 = 0;
            unint64_t v12 = v14;
            while (1)
            {
              uint64_t v9 = v11;
              if (*(void *)v25[2] != v10) {
                objc_enumerationMutation(v13);
              }
              uint64_t v26 = *(void *)(v25[1] + 8 * v11);
              if ([v34 _accessibilityIsDescendantOfElement:v26]) {
                break;
              }
              ++v11;
              if (v9 + 1 >= v12)
              {
                uint64_t v11 = 0;
                unint64_t v12 = [v13 countByEnumeratingWithState:v25 objects:v40 count:16];
                if (!v12) {
                  goto LABEL_32;
                }
              }
            }
            char v39 = 0;
            int v35 = 1;
          }
          else
          {
LABEL_32:
            int v35 = 0;
          }

          if (!v35)
          {
            id v5 = v31;
            *char v36 = v5;
            char v39 = 1;
            int v35 = 1;
          }
          objc_storeStrong(&v27, 0);
          objc_storeStrong(&v28, 0);
        }
      }
      else
      {
        id v6 = (id)[v33 superview];
        id v7 = v33;
        id v33 = v6;

        int v35 = 0;
      }
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
      if (v35) {
        goto LABEL_40;
      }
    }
    char v39 = 0;
    int v35 = 1;
LABEL_40:
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
  }
  else
  {
    char v39 = 0;
    int v35 = 1;
  }
  objc_storeStrong(&location, 0);
  return v39 & 1;
}

uint64_t __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke(uint64_t a1, char a2)
{
  char v5 = a2 & 1;
  id v3 = *(void **)(a1 + 32);
  id v4 = (id)[NSNumber numberWithBool:a2 & 1];
  -[UIViewAccessibility _axSetViewIsProbablyDimmingView:](v3, v4);

  return v5 & 1;
}

double __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke_2(uint64_t a1, double a2)
{
  [*(id *)(a1 + 32) alpha];
  return a2 * v2;
}

uint64_t __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke_3(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v17 = a1;
  id v6 = location[0];
  id v2 = (id)[MEMORY[0x263F1C550] clearColor];
  BOOL v7 = v6 != v2;

  if (v7)
  {
    double v15 = 0.0;
    double v14 = 0.0;
    double v13 = 0.0;
    double v12 = 0.0;
    if (([location[0] getRed:&v15 green:&v14 blue:&v13 alpha:&v12] & 1) == 0) {
      goto LABEL_13;
    }
    if ((*(double (**)(double))(a1[4] + 16))(v12) == 0.0)
    {
      char v19 = 0;
      int v16 = 1;
      goto LABEL_14;
    }
    id v11 = (id)[MEMORY[0x263F1C550] colorWithRed:v15 green:v14 blue:v13 alpha:v12];
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    if (([v11 getHue:&v10 saturation:&v9 brightness:&v8 alpha:&v12] & 1) != 0
      && (AXColorGetLuma(), v3 < 0.00999999978)
      && (*(double (**)(double))(a1[4] + 16))(v12) >= 0.100000001
      && (*(double (**)(double))(a1[4] + 16))(v12) <= 0.899999976)
    {
      char v19 = 1;
      int v16 = 1;
    }
    else
    {
      int v16 = 0;
    }
    objc_storeStrong(&v11, 0);
    if (!v16)
    {
LABEL_13:
      char v19 = 0;
      int v16 = 1;
    }
  }
  else
  {
    char v19 = 0;
    int v16 = 1;
  }
LABEL_14:
  objc_storeStrong(location, 0);
  return v19 & 1;
}

uint64_t __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke_4(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = a1[4];
  while (1)
  {
    id v18 = (id)[location[0] subviews];
    BOOL v19 = [v18 count] != 1;

    if (v19) {
      break;
    }
    id v14 = (id)[location[0] subviews];
    id v1 = (id)[v14 firstObject];
    id v2 = location[0];
    location[0] = v1;

    [location[0] bounds];
    v23.origin.x = v3;
    v23.origin.y = v4;
    v23.size.width = v5;
    v23.size.height = v6;
    id v15 = (id)[MEMORY[0x263F1C920] mainScreen];
    [v15 bounds];
    rect2.origin.x = v7;
    rect2.origin.y = v8;
    rect2.size.width = v9;
    rect2.size.height = v10;
    BOOL v16 = CGRectEqualToRect(v23, rect2);

    char v20 = 0;
    BOOL v17 = 0;
    if (v16)
    {
      BOOL v17 = 0;
      if ([location[0] _accessibilityViewIsVisible])
      {
        id v21 = (id)[location[0] backgroundColor];
        char v20 = 1;
        [v21 alphaComponent];
        BOOL v17 = v11 == 1.0;
      }
    }
    if (v20) {

    }
    if (v17)
    {
      char v25 = 1;
      goto LABEL_16;
    }
    if (v16 || ([location[0] clipsToBounds] & 1) == 0)
    {
      [location[0] alpha];
      if (v12 >= 1.0) {
        continue;
      }
    }
    char v25 = 0;
    goto LABEL_16;
  }
  char v25 = 0;
LABEL_16:
  objc_storeStrong(location, 0);
  return v25 & 1;
}

BOOL __55__UIViewAccessibility__axSetViewIsProbablyDimmingView___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (location[0] == *(id *)(a1 + 32)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  BOOL v3 = location[0] == *(id *)(a1 + 32);
  objc_storeStrong(location, 0);
  return v3;
}

- (id)_accessibilityHitTestSubviews
{
  return (id)[(UIViewAccessibility *)self _accessibilitySubviews];
}

- (BOOL)_accessibilityPointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v22 = a3;
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if ([(UIViewAccessibility *)v21 _accessibilityUseAccessibilityFrameForHittest])
  {
    v19.x = 0.0;
    v19.y = 0.0;
    char v18 = 0;
    objc_opt_class();
    id v17 = (id)__UIAccessibilityCastAsClass();
    id v16 = v17;
    objc_storeStrong(&v17, 0);
    UIAccessibilityPointForPoint();
    v19.x = v4;
    v19.y = v5;

    [(UIViewAccessibility *)v21 accessibilityFrame];
    CGRect v15 = v24;
    char v23 = CGRectContainsPoint(v24, v19);
    int v14 = 1;
  }
  else if ([(UIViewAccessibility *)v21 isAccessibilityElement] {
         || ([(UIViewAccessibility *)v21 _accessibilityOverridesInvalidFrames] & 1) == 0)
  }
  {
    char v23 = -[UIViewAccessibility pointInside:withEvent:](v21, "pointInside:withEvent:", location[0], v22.x, v22.y) & 1;
    int v14 = 1;
  }
  else
  {
    point.x = 0.0;
    point.y = 0.0;
    char v12 = 0;
    objc_opt_class();
    id v11 = (id)__UIAccessibilityCastAsClass();
    id v10 = v11;
    objc_storeStrong(&v11, 0);
    UIAccessibilityPointForPoint();
    point.x = v6;
    point.y = v7;

    id v9 = (id)[(UIViewAccessibility *)v21 subviews];
    [v9 accessibilityFrame];
    char v23 = CGRectContainsPoint(v25, point);

    int v14 = 1;
  }
  objc_storeStrong(location, 0);
  return v23 & 1;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 0;
}

- (double)_accessibilityMaxFuzzyHitTestDistance
{
  return 3.40282347e38;
}

- (BOOL)_accessibilityIsUserInteractionEnabledChain
{
  if (a1)
  {
    id v1 = (id)[a1 _accessibilityFindViewAncestor:&__block_literal_global_435 startWithSelf:1];
    BOOL v3 = v1 != 0;

    return !v3;
  }
  else
  {
    return 0;
  }
}

uint64_t __66__UIViewAccessibility__accessibilityIsUserInteractionEnabledChain__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  LOBYTE(v3) = 0;
  if (objc_opt_isKindOfClass()) {
    int v3 = [location[0] isUserInteractionEnabled] ^ 1;
  }
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)_acceessibilityUIKitIsUserInteractionDisabled
{
  return ([(UIViewAccessibility *)self isUserInteractionEnabled] ^ 1) & 1;
}

+ (void)_axTriggerNextContextMenuInteractionInQueue:(void *)a3 forElement:(void *)a4 targetPointValue:
{
  uint64_t v40 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v38 = 0;
  objc_storeStrong(&v38, a3);
  id v37 = 0;
  objc_storeStrong(&v37, a4);
  uint64_t v40 = self;
  id v36 = (id)[location firstObject];
  id v18 = (id)[v36 safeDictionaryForKey:@"presentationsByIdentifier"];
  BOOL v19 = [v18 count] == 0;

  if (v19)
  {
    id v13 = (id)[v36 view];
    [v38 accessibilityActivationPoint];
    uint64_t v29 = v4;
    uint64_t v30 = v5;
    UIAccessibilityPointToPoint();
    *(void *)&long long v31 = v6;
    *((void *)&v31 + 1) = v7;

    if (v37)
    {
      [v37 pointValue];
      uint64_t v27 = v8;
      uint64_t v28 = v9;
      id v12 = (id)[v36 view];
      UIAccessibilityPointToPoint();
      *(void *)&long long v26 = v10;
      *((void *)&v26 + 1) = v11;
      long long v31 = v26;
    }
    id v20 = v36;
    long long v24 = v31;
    id v21 = location;
    uint64_t v25 = v40;
    id v22 = v38;
    id v23 = v37;
    AXPerformSafeBlock();
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    int v32 = 0;
  }
  else
  {
    id v35 = (id)AXLogAppAccessibility();
    os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
    {
      log = v35;
      os_log_type_t type = v34;
      __os_log_helper_16_0_0(v33);
      _os_log_impl(&dword_2402B7000, log, type, "Already showing a presentation for this interaction. Skipping attempt to fast-track context menu.", v33, 2u);
    }
    objc_storeStrong(&v35, 0);
    UIAccessibilityPostNotification(*MEMORY[0x263F81218], &unk_26F48EB10);
    int v32 = 1;
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&location, 0);
}

void __95__UIViewAccessibility__axTriggerNextContextMenuInteractionInQueue_forElement_targetPointValue___block_invoke(id *a1)
{
  BOOL v19 = a1;
  id v18 = a1;
  id v5 = a1[4];
  CAPoint3DMakeWithCGPoint();
  double v15 = v1;
  double v16 = v2;
  double v17 = v3;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __95__UIViewAccessibility__axTriggerNextContextMenuInteractionInQueue_forElement_targetPointValue___block_invoke_2;
  uint64_t v10 = &unk_2650AF830;
  id v11 = a1[4];
  id v12 = a1[5];
  v14[1] = a1[10];
  id v13 = a1[6];
  v14[0] = a1[7];
  objc_msgSend(v5, "_interactionShouldBeginAtPoint:completion:", v15, v16, v17);
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
}

void __95__UIViewAccessibility__axTriggerNextContextMenuInteractionInQueue_forElement_targetPointValue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a1;
  uint64_t v19 = a2;
  uint64_t v18 = a1;
  if (a2)
  {
    if ((unint64_t)[*(id *)(a1 + 40) count] <= 1)
    {
      UIAccessibilityPostNotification(*MEMORY[0x263F81218], &unk_26F48EB10);
    }
    else
    {
      uint64_t v4 = *(void **)(a1 + 40);
      uint64_t v22 = 1;
      uint64_t v21 = [v4 count] - 1;
      uint64_t v23 = 1;
      uint64_t v24 = v21;
      v12[0] = (id)objc_msgSend(v4, "subarrayWithRange:", 1, v21);
      +[UIViewAccessibility _axTriggerNextContextMenuInteractionInQueue:forElement:targetPointValue:](*(void *)(a1 + 64), v12[0], *(void *)(a1 + 48), *(void *)(a1 + 56));
      objc_storeStrong(v12, 0);
    }
  }
  else
  {
    char v17 = 0;
    objc_opt_class();
    id v10 = (id)[*(id *)(a1 + 32) safeValueForKey:@"presentationInteraction"];
    id v16 = (id)__UIAccessibilityCastAsClass();

    id v15 = v16;
    objc_storeStrong(&v16, 0);
    [v15 present];

    BOOL v14 = 0;
    id v8 = (id)[*(id *)(a1 + 32) safeDictionaryForKey:@"presentationsByIdentifier"];
    BOOL v9 = [v8 count] != 0;

    BOOL v14 = v9;
    if (v9 || (unint64_t)[*(id *)(a1 + 40) count] <= 1)
    {
      UIAccessibilityNotifications notification = *MEMORY[0x263F81218];
      if (v14) {
        uint64_t v3 = 2;
      }
      else {
        uint64_t v3 = 1;
      }
      id v6 = (id)[NSNumber numberWithInt:v3];
      UIAccessibilityPostNotification(notification, v6);
    }
    else
    {
      int v7 = *(void **)(a1 + 40);
      uint64_t v2 = [v7 count];
      uint64_t v26 = 1;
      uint64_t v25 = v2 - 1;
      uint64_t v27 = 1;
      uint64_t v28 = v2 - 1;
      v12[1] = (id)1;
      v12[2] = (id)(v2 - 1);
      id v13 = (id)objc_msgSend(v7, "subarrayWithRange:", 1, v2 - 1);
      +[UIViewAccessibility _axTriggerNextContextMenuInteractionInQueue:forElement:targetPointValue:](*(void *)(a1 + 64), v13, *(void *)(a1 + 48), *(void *)(a1 + 56));
      objc_storeStrong(&v13, 0);
    }
  }
}

- (BOOL)_accessibilityShowContextMenuForElement:(id)a3 targetPointValue:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  char v21 = 0;
  id v20 = (id)[MEMORY[0x263EFF980] array];
  id v19 = v24;
  while (v19)
  {
    memset(__b, 0, sizeof(__b));
    id v13 = (id)[v19 interactions];
    uint64_t v14 = [v13 countByEnumeratingWithState:__b objects:v25 count:16];
    if (v14)
    {
      uint64_t v10 = *(void *)__b[2];
      uint64_t v11 = 0;
      unint64_t v12 = v14;
      while (1)
      {
        uint64_t v9 = v11;
        if (*(void *)__b[2] != v10) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(id *)(__b[1] + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = v18;
          [v20 addObject:v16];
          objc_storeStrong(&v16, 0);
        }
        ++v11;
        if (v9 + 1 >= v12)
        {
          uint64_t v11 = 0;
          unint64_t v12 = [v13 countByEnumeratingWithState:__b objects:v25 count:16];
          if (!v12) {
            break;
          }
        }
      }
    }

    id v4 = (id)[v19 superview];
    id v5 = v19;
    id v19 = v4;
  }
  objc_storeStrong(&v19, 0);
  if ([v20 count] != 0)
  {
    char v21 = 1;
    +[UIViewAccessibility _axTriggerNextContextMenuInteractionInQueue:forElement:targetPointValue:]((uint64_t)UIViewAccessibility, v20, location[0], v22);
  }
  char v8 = v21;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (id)_accessibilityUserTestingChildrenInAccessibilitySortedOrder:(BOOL)a3
{
  return [(UIViewAccessibility *)self automationElements];
}

- (id)__accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v278 = *MEMORY[0x263EF8340];
  CGPoint v255 = a3;
  v254 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v252 = [location[0] _accessibilityAutomationHitTest] & 1;
  BOOL v251 = (unsigned __int16)[location[0] _accessibilityHitTestType] == 3;
  BOOL v250 = _AXSAutomationEnabled() != 0;
  if (v250)
  {
    id v249 = (id)AXLogUIA();
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v249, OS_LOG_TYPE_INFO))
    {
      log = v249;
      os_log_type_t v132 = type;
      v130 = v254;
      v133 = NSStringFromCGPoint(v255);
      v247 = v133;
      __os_log_helper_16_3_2_8_69_8_64((uint64_t)v277, (uint64_t)v130, (uint64_t)v247);
      _os_log_impl(&dword_2402B7000, log, v132, "Hit test: %{sensitive}@ > %@", v277, 0x16u);

      objc_storeStrong((id *)&v247, 0);
    }
    objc_storeStrong(&v249, 0);
  }
  if (![(UIViewAccessibility *)v254 accessibilityElementsHidden])
  {
    id v242 = (id)[(UIViewAccessibility *)v254 _accessibilityFuzzyHitTestElements];
    char v241 = [(UIViewAccessibility *)v254 _accessibilityHitTestShouldFallbackToNearestChild] & 1;
    if (v241
      && (v252 & 1) == 0
      && ([(UIViewAccessibility *)v254 isAccessibilityOpaqueElementProvider] & 1) == 0
      && (v242
       || ([(UIViewAccessibility *)v254 _accessibilityHasOrderedChildren] & 1) != 0))
    {
      v240.receiver = v254;
      v240.super_class = (Class)UIViewAccessibility;
      v256 = (UIViewAccessibility *)-[UIViewAccessibility _accessibilityHitTest:withEvent:](&v240, sel__accessibilityHitTest_withEvent_, location[0], v255.x, v255.y);
      int v243 = 1;
      goto LABEL_317;
    }
    if (!-[UIViewAccessibility _accessibilityPointInside:withEvent:](v254, "_accessibilityPointInside:withEvent:", location[0], v255.x, v255.y))
    {
      if (v250)
      {
        id v239 = (id)AXLogUIA();
        os_log_type_t v238 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled((os_log_t)v239, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_3_1_8_69((uint64_t)v276, (uint64_t)v254);
          _os_log_impl(&dword_2402B7000, (os_log_t)v239, v238, "Point was not inside self %{sensitive}@", v276, 0xCu);
        }
        objc_storeStrong(&v239, 0);
      }
      if ([(UIViewAccessibility *)v254 _accessibilityBlocksInteraction])
      {
        v256 = v254;
        int v243 = 1;
        goto LABEL_317;
      }
      id v237 = (id)-[UIViewAccessibility hitTest:withEvent:](v254, "hitTest:withEvent:", location[0], v255.x, v255.y);
      if (v237)
      {
        if ([(UIViewAccessibility *)v254 isDescendantOfView:v237])
        {
          v256 = 0;
          int v243 = 1;
        }
        else
        {
          objc_msgSend(v237, "convertPoint:fromView:", v254, v255.x, v255.y);
          v235[3] = v4;
          v235[4] = v5;
          id v236 = (id)objc_msgSend(v237, "_accessibilityHitTest:withEvent:", location[0], *(double *)&v4, *(double *)&v5);
          if ([v237 isDescendantOfView:v254])
          {
            id v6 = (id)[v237 superview];
            id v7 = v237;
            id v237 = v6;

            while (1)
            {
              BOOL v127 = 0;
              if (!v236) {
                BOOL v127 = v237 != v254;
              }
              if (!v127) {
                break;
              }
              objc_msgSend(v237, "convertPoint:fromView:", v254, v255.x, v255.y);
              v235[1] = v8;
              v235[2] = v9;
              id v10 = (id)objc_msgSend(v237, "_accessibilityHitTest:withEvent:", location[0], *(double *)&v8, *(double *)&v9);
              id v11 = v236;
              id v236 = v10;

              id v12 = (id)[v237 superview];
              id v13 = v237;
              id v237 = v12;
            }
          }
          v256 = (UIViewAccessibility *)v236;
          int v243 = 1;
          objc_storeStrong(&v236, 0);
        }
      }
      else if ([(UIViewAccessibility *)v254 _accessibilityAllowOutOfBoundsHitTestAtPoint:location[0] withEvent:v255])
      {
        int v243 = 0;
      }
      else
      {
        v256 = 0;
        int v243 = 1;
      }
      objc_storeStrong(&v237, 0);
      if (v243)
      {
LABEL_317:
        objc_storeStrong(&v242, 0);
        goto LABEL_318;
      }
    }
    id v126 = (id)[location[0] _accessibilityHitTestOptions];
    char v233 = 0;
    if (v126)
    {
      id v14 = v126;
    }
    else
    {
      id v234 = (id)[MEMORY[0x263F811B0] defaultOptions];
      char v233 = 1;
      id v14 = v234;
    }
    v235[0] = v14;
    if (v233) {

    }
    char v232 = 0;
    v124 = (uint64_t (**)(id, UIViewAccessibility *))(id)[v235[0] leafNodePredicate];
    char v125 = 1;
    if ((v124[2](v124, v254) & 1) == 0)
    {
      BOOL v123 = 0;
      if (v252) {
        BOOL v123 = -[UIViewAccessibility _accessibilityViewIsBeingHitTested:]((uint64_t)v254, v254);
      }
      char v125 = v123;
    }

    char v232 = v125 & 1;
    char v230 = 0;
    BOOL v122 = 0;
    if (v125)
    {
      [(UIViewAccessibility *)v254 alpha];
      if (v15 > 0.0
        || (BOOL v122 = 0,
            ([(UIViewAccessibility *)v254 _accessibilityOverridesInvisibility] & 1) != 0))
      {
        v231 = (UIViewAccessibility *)(id)[location[0] _accessibilityHitTestStartsAtElement];
        char v230 = 1;
        BOOL v122 = 0;
        if (v231 != v254) {
          BOOL v122 = !v251;
        }
      }
    }
    if (v230) {

    }
    if (v122)
    {
      id v229 = (id)-[UIViewAccessibility _accessibilityHitTestSupplementaryViews:event:](v254, "_accessibilityHitTestSupplementaryViews:event:", location[0], v255.x, v255.y);
      if (v229)
      {
        v256 = (UIViewAccessibility *)v229;
        int v243 = 1;
      }
      else
      {
        if ((v252 & 1) == 0) {
          goto LABEL_89;
        }
        char v228 = 0;
        if (([location[0] _accessibilityAutomationHitTest] & 1) == 0
          || (char v121 = 1,
              ([(UIViewAccessibility *)v254 _accessibilityAutomationHitTestReverseOrder] & 1) == 0))
        {
          char v121 = [(UIViewAccessibility *)v254 _accessibilityHitTestReverseOrder];
        }
        char v228 = v121 & 1;
        char v225 = 0;
        char v223 = 0;
        char v221 = 0;
        char v219 = 0;
        if (v121)
        {
          id v226 = [(UIViewAccessibility *)v254 automationElements];
          char v225 = 1;
          id v224 = (id)[v226 reverseObjectEnumerator];
          char v223 = 1;
          id v16 = (id)[v224 allObjects];
          id v222 = v16;
          char v221 = 1;
        }
        else
        {
          id v16 = [(UIViewAccessibility *)v254 automationElements];
          id v220 = v16;
          char v219 = 1;
        }
        id v227 = v16;
        if (v219) {

        }
        if (v221) {
        if (v223)
        }

        if (v225) {
        memset(__b, 0, sizeof(__b));
        }
        id obj = v227;
        uint64_t v120 = [obj countByEnumeratingWithState:__b objects:v275 count:16];
        if (v120)
        {
          uint64_t v116 = *(void *)__b[2];
          uint64_t v117 = 0;
          unint64_t v118 = v120;
          while (1)
          {
            uint64_t v115 = v117;
            if (*(void *)__b[2] != v116) {
              objc_enumerationMutation(obj);
            }
            id v218 = *(id *)(__b[1] + 8 * v117);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              double v215 = 0.0;
              double v216 = 0.0;
              objc_msgSend(v218, "convertPoint:fromView:", v254, v255.x, v255.y);
              double v215 = v17;
              double v216 = v18;
              id v214 = (id)objc_msgSend(v218, "_accessibilityHitTest:withEvent:", location[0], v17, v18);
              if (v214)
              {
                v256 = (UIViewAccessibility *)v214;
                int v243 = 1;
              }
              else
              {
                int v243 = 0;
              }
              objc_storeStrong(&v214, 0);
              if (v243) {
                break;
              }
            }
            UIAccessibilityPointForPoint();
            v213.x = v19;
            v213.y = v20;
            [v218 accessibilityFrame];
            CGRect v212 = v280;
            if (CGRectContainsPoint(v280, v213))
            {
              v256 = (UIViewAccessibility *)v218;
              int v243 = 1;
              break;
            }
            ++v117;
            if (v115 + 1 >= v118)
            {
              uint64_t v117 = 0;
              unint64_t v118 = [obj countByEnumeratingWithState:__b objects:v275 count:16];
              if (!v118) {
                goto LABEL_85;
              }
            }
          }
        }
        else
        {
LABEL_85:
          int v243 = 0;
        }

        if (!v243) {
          int v243 = 0;
        }
        objc_storeStrong(&v227, 0);
        if (!v243)
        {
LABEL_89:
          if (v250)
          {
            id v211 = (id)AXLogUIA();
            os_log_type_t v210 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled((os_log_t)v211, OS_LOG_TYPE_INFO))
            {
              v112 = v211;
              os_log_type_t v113 = v210;
              id v114 = (id)UIAXMassageElementDescription();
              id v209 = v114;
              __os_log_helper_16_2_1_8_64((uint64_t)v274, (uint64_t)v209);
              _os_log_impl(&dword_2402B7000, v112, v113, "Was valid accessibility element, and everything else checked out, so returning self %@", v274, 0xCu);

              objc_storeStrong(&v209, 0);
            }
            objc_storeStrong(&v211, 0);
          }
          v256 = v254;
          int v243 = 1;
        }
      }
      objc_storeStrong(&v229, 0);
      goto LABEL_316;
    }
    id v110 = (id)[(UIViewAccessibility *)v254 _accessibilityAdditionalElements];
    BOOL v111 = [v110 count] == 0;

    if (!v111)
    {
      id v208 = (id)-[UIViewAccessibility _accessibilityHitTestAdditionalElements:event:](v254, "_accessibilityHitTestAdditionalElements:event:", location[0], v255.x, v255.y);
      if (v208)
      {
        v256 = (UIViewAccessibility *)v208;
        int v243 = 1;
      }
      else
      {
        int v243 = 0;
      }
      objc_storeStrong(&v208, 0);
      if (v243) {
        goto LABEL_316;
      }
    }
    id v207 = [(UIViewAccessibility *)v254 _accessibilityHitTestSubviews];
    if ((-[UIViewAccessibility _accessibilityIsIgnored]() & 1) != 0 && ![v207 count])
    {
      v256 = 0;
      int v243 = 1;
      goto LABEL_315;
    }
    char v206 = 0;
    uint64_t v204 = [v207 count];
    id v203 = 0;
    id v202 = 0;
    double v201 = 3.40282347e38;
    for (uint64_t i = v204 - 1; ; --i)
    {
      if (i < 0)
      {
LABEL_231:
        if (v203)
        {
          char v150 = 0;
          char v70 = 1;
          if (([v203 accessibilityElementsHidden] & 1) == 0)
          {
            LOBYTE(v69) = 0;
            if (([v203 isAccessibilityElement] & 1) == 0)
            {
              LOBYTE(v69) = 0;
              if (([v203 _accessibilityIsTouchContainer] & 1) == 0) {
                int v69 = [v203 accessibilityViewIsModal] ^ 1;
              }
            }
            char v70 = v69;
          }
          char v150 = v70 & 1;
          if (([(UIViewAccessibility *)v254 accessibilityIsWindow] & 1) != 0
            && (v150 & 1) != 0
            && (v252 & 1) != 0)
          {
            char v150 = 0;
          }
          if ([(UIViewAccessibility *)v254 accessibilityViewIsModal] && (v150 & 1) != 0)
          {
            v256 = v254;
            int v243 = 1;
          }
          else
          {
            v256 = (UIViewAccessibility *)v203;
            int v243 = 1;
          }
        }
        else
        {
          if (![(UIViewAccessibility *)v254 _accessibilityShouldHitTestLayers]) {
            goto LABEL_262;
          }
          id v66 = (id)[(UIViewAccessibility *)v254 layer];
          id v42 = (id)[v66 sublayers];
          id v43 = v207;
          id v207 = v42;

          memset(v148, 0, sizeof(v148));
          id v67 = (id)[v207 reverseObjectEnumerator];
          uint64_t v68 = [v67 countByEnumeratingWithState:v148 objects:v263 count:16];
          if (v68)
          {
            uint64_t v63 = *(void *)v148[2];
            uint64_t v64 = 0;
            unint64_t v65 = v68;
            while (1)
            {
              uint64_t v62 = v64;
              if (*(void *)v148[2] != v63) {
                objc_enumerationMutation(v67);
              }
              v149 = *(void **)(v148[1] + 8 * v64);
              CGRect v60 = v149;
              int v59 = v149;
              id v61 = (id)[(UIViewAccessibility *)v254 layer];
              [v59 convertPoint:v255.x fromLayer:v255.y];
              v146[1] = v44;
              v146[2] = v45;
              id v147 = (id)objc_msgSend(v60, "_accessibilityHitTest:withEvent:", location[0], *(double *)&v44, *(double *)&v45);

              if (v147)
              {
                v256 = (UIViewAccessibility *)v147;
                int v243 = 1;
              }
              else
              {
                int v243 = 0;
              }
              objc_storeStrong(&v147, 0);
              if (v243) {
                break;
              }
              ++v64;
              if (v62 + 1 >= v65)
              {
                uint64_t v64 = 0;
                unint64_t v65 = [v67 countByEnumeratingWithState:v148 objects:v263 count:16];
                if (!v65) {
                  goto LABEL_256;
                }
              }
            }
          }
          else
          {
LABEL_256:
            int v243 = 0;
          }

          if (!v243)
          {
            id v58 = (id)[(UIViewAccessibility *)v254 layer];
            v146[0] = (id)[v58 _accessibilityHitTest:location[0] withEvent:v255];

            if (v146[0])
            {
              v256 = (UIViewAccessibility *)v146[0];
              int v243 = 1;
            }
            else
            {
              int v243 = 0;
            }
            objc_storeStrong(v146, 0);
            if (!v243)
            {
LABEL_262:
              char v145 = 0;
              char v57 = 0;
              if ([(UIViewAccessibility *)v254 accessibilityViewIsModal]) {
                char v57 = [(UIViewAccessibility *)v254 _accessibilityViewIsVisible];
              }
              char v145 = v57 & 1;
              if ((v57 & 1) == 0
                || ([(UIViewAccessibility *)v254 _accessibilityAllowsSiblingsWhenOvergrown] & 1) != 0)
              {
                if ((v241 & 1) != 0 && v202)
                {
                  v256 = (UIViewAccessibility *)v202;
                  int v243 = 1;
                }
                else
                {
                  int v54 = (uint64_t (**)(id, UIViewAccessibility *))(id)[v235[0] fallbackPredicate];
                  char v55 = 1;
                  if ((v54[2](v54, v254) & 1) == 0)
                  {
                    char v53 = 0;
                    if (v251)
                    {
                      objc_opt_class();
                      char v53 = 0;
                      if (objc_opt_isKindOfClass()) {
                        char v53 = [(UIViewAccessibility *)v254 _accessibilityScrollingEnabled];
                      }
                    }
                    char v55 = v53;
                  }

                  if (v55)
                  {
                    v256 = v254;
                    int v243 = 1;
                  }
                  else if ((v252 & 1) != 0 {
                         && -[UIViewAccessibility _accessibilityIsUserInteractionEnabledChain](v254)
                  }
                         && ![(UIViewAccessibility *)v254 _accessibilityIsDescendantOfHostingView])
                  {
                    id v139 = (id)-[UIViewAccessibility hitTest:withEvent:](v254, "hitTest:withEvent:", location[0], v255.x, v255.y);
                    if (v250)
                    {
                      os_log_t oslog = (os_log_t)(id)AXLogUIA();
                      os_log_type_t v137 = OS_LOG_TYPE_INFO;
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
                      {
                        __os_log_helper_16_3_2_8_69_8_69((uint64_t)v262, (uint64_t)v254, (uint64_t)v139);
                        _os_log_impl(&dword_2402B7000, oslog, v137, "Returning self or subview of self (self %{sensitive}@, result %{sensitive}@)", v262, 0x16u);
                      }
                      objc_storeStrong((id *)&oslog, 0);
                    }
                    if (([v139 isEqual:v254] & 1) == 0
                      && ([(UIViewAccessibility *)v254 _accessibilityIsViewDescendantOfElement:v139] & 1) == 0)
                    {
                      id v52 = v139;
                      -[UIViewAccessibility convertPoint:toView:](v254, "convertPoint:toView:", v139, v255.x, v255.y);
                      v136[1] = v46;
                      v136[2] = v47;
                      id v48 = (id)objc_msgSend(v52, "_accessibilityHitTest:withEvent:", location[0], *(double *)&v46, *(double *)&v47);
                      id v49 = v139;
                      id v139 = v48;

                      if (v250)
                      {
                        v136[0] = (os_log_t)(id)AXLogUIA();
                        os_log_type_t v135 = OS_LOG_TYPE_INFO;
                        if (os_log_type_enabled(v136[0], OS_LOG_TYPE_INFO))
                        {
                          __os_log_helper_16_3_1_8_69((uint64_t)v261, (uint64_t)v139);
                          _os_log_impl(&dword_2402B7000, v136[0], v135, "Performed further axHitTest post process to get (result %{sensitive}@)", v261, 0xCu);
                        }
                        objc_storeStrong((id *)v136, 0);
                      }
                    }
                    v256 = (UIViewAccessibility *)v139;
                    int v243 = 1;
                    objc_storeStrong(&v139, 0);
                  }
                  else
                  {
                    if (v250)
                    {
                      os_log_t v134 = (os_log_t)(id)AXLogUIA();
                      if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
                      {
                        __os_log_helper_16_3_1_8_69((uint64_t)v260, (uint64_t)v254);
                        _os_log_impl(&dword_2402B7000, v134, OS_LOG_TYPE_INFO, "Returning nil because we didn't hit one of our subviews but the point is inside %{sensitive}@", v260, 0xCu);
                      }
                      objc_storeStrong((id *)&v134, 0);
                    }
                    v256 = 0;
                    int v243 = 1;
                  }
                }
              }
              else
              {
                id v144 = [(UIViewAccessibility *)v254 _accessibilityCheckForAllowedModalView:v255.x event:v255.y];
                if (v144)
                {
                  v256 = (UIViewAccessibility *)v144;
                  int v243 = 1;
                }
                else if ((v145 & 1) != 0 {
                       || (v206 & 1) != 0
                }
                       || [(UIViewAccessibility *)v254 isAccessibilityElement]
                       || ([(UIViewAccessibility *)v254 _accessibilityHasOrderedChildren] & 1) != 0|| ([(UIViewAccessibility *)v254 _accessibilityIsTouchContainer] & 1) != 0)
                {
                  char v142 = 0;
                  char v140 = 0;
                  BOOL v56 = 0;
                  if ([(UIViewAccessibility *)v254 _accessibilityAllowsSiblingsWhenOvergrown])
                  {
                    id v143 = (id)[(UIViewAccessibility *)v254 superview];
                    char v142 = 1;
                    id v141 = (id)[v143 subviews];
                    char v140 = 1;
                    BOOL v56 = (unint64_t)[v141 count] > 1;
                  }
                  if (v140) {

                  }
                  if (v142) {
                  if (v56)
                  }
                    v256 = 0;
                  else {
                    v256 = v254;
                  }
                  int v243 = 1;
                }
                else
                {
                  v256 = 0;
                  int v243 = 1;
                }
                objc_storeStrong(&v144, 0);
              }
            }
          }
        }
LABEL_314:
        objc_storeStrong(&v202, 0);
        objc_storeStrong(&v203, 0);
LABEL_315:
        objc_storeStrong(&v207, 0);
LABEL_316:
        objc_storeStrong(v235, 0);
        goto LABEL_317;
      }
      id v200 = (id)[v207 objectAtIndex:i];
      char v199 = 0;
      int v259 = 720896;
      int v257 = 2;
      int v258 = 720896;
      if (dyld_program_sdk_at_least())
      {
        [v200 alpha];
        if (v21 == 0.0
          || ([v200 isHidden] & 1) != 0
          || (LOBYTE(v109) = 0, ([v200 accessibilityElementsHidden] & 1) != 0))
        {
          int v109 = [v200 _accessibilityOverridesInvisibility] ^ 1;
        }
        char v199 = v109 & 1;
      }
      else
      {
        [v200 alpha];
        if (v22 == 0.0 || (LOBYTE(v108) = 0, ([v200 isHidden] & 1) != 0)) {
          int v108 = [v200 _accessibilityOverridesInvisibility] ^ 1;
        }
        char v199 = v108 & 1;
      }
      if (v199)
      {
        int v243 = 8;
        goto LABEL_227;
      }
      char v206 = 1;
      v198.x = 0.0;
      v198.y = 0.0;
      objc_msgSend(v200, "convertPoint:fromView:", v254, v255.x, v255.y);
      v198.x = v23;
      v198.y = v24;
      id v197 = (id)objc_msgSend(v200, "_accessibilityHitTest:withEvent:", location[0], v23, v24);
      if (([v197 _accessibilityIsRemoteElement] & 1) != 0
        && ([v197 _accessibilityRemoteElementShouldHitTestHostProcess] & 1) != 0)
      {
        int v243 = 8;
      }
      else
      {
        if (v250)
        {
          id v196 = (id)AXLogUIA();
          os_log_type_t v195 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled((os_log_t)v196, OS_LOG_TYPE_INFO))
          {
            v105 = v196;
            os_log_type_t v106 = v195;
            id v104 = v197;
            v107 = NSStringFromCGPoint(v198);
            v194 = v107;
            __os_log_helper_16_3_3_8_69_8_64_8_64((uint64_t)v273, (uint64_t)v104, (uint64_t)v194, (uint64_t)v200);
            _os_log_impl(&dword_2402B7000, v105, v106, "AX hit test found %{sensitive}@ at converted point %@ for view: %@", v273, 0x20u);

            objc_storeStrong((id *)&v194, 0);
          }
          objc_storeStrong(&v196, 0);
        }
        if (!v197 || (v252 & 1) == 0) {
          goto LABEL_161;
        }
        v193.x = 0.0;
        v193.y = 0.0;
        char v192 = 0;
        objc_opt_class();
        id v191 = (id)__UIAccessibilityCastAsClass();
        if (v192) {
          abort();
        }
        id v190 = v191;
        objc_storeStrong(&v191, 0);
        id v102 = v190;
        UIAccessibilityPointForPoint();
        v193.x = v25;
        v193.y = v26;

        BOOL v189 = 0;
        BOOL v189 = -[UIViewAccessibility _accessibilityViewIsBeingHitTested:]((uint64_t)v254, v197);
        char v188 = 0;
        [v197 accessibilityFrame];
        CGRect v187 = v281;
        char v103 = 0;
        if (CGRectContainsPoint(v281, v193))
        {
          objc_opt_class();
          char v101 = 1;
          if (objc_opt_isKindOfClass())
          {
            char v100 = 0;
            if ([v197 _accessibilityViewIsVisible]) {
              char v100 = [v197 isUserInteractionEnabled];
            }
            char v101 = v100;
          }
          char v103 = v101;
        }
        char v188 = v103 & 1;
        if (!v189 && (v188 & 1) != 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v98 = v200;
            -[UIViewAccessibility convertPoint:toView:](v254, "convertPoint:toView:", v200, v255.x, v255.y);
            double v184 = v27;
            double v185 = v28;
            id v186 = (id)objc_msgSend(v98, "hitTest:withEvent:", location[0], v27, v28);
            BOOL IsUserInteractionEnabled = 0;
            if ([v186 _accessibilityViewIsVisible]) {
              BOOL IsUserInteractionEnabled = -[UIViewAccessibility _accessibilityIsUserInteractionEnabledChain](v186);
            }
            char v188 = IsUserInteractionEnabled;
            BOOL v189 = -[UIViewAccessibility _accessibilityViewIsBeingHitTested:]((uint64_t)v254, v186);
            char v183 = 0;
            char v183 = [v186 _accessibilityIsDescendantOfElement:v197] & 1;
            if (v189 || (v183 & 1) != 0)
            {
              if (!_CFMZEnabled()
                || (v183 & 1) == 0
                || ([v186 isAccessibilityElement] & 1) != 0)
              {
                objc_storeStrong(&v197, v186);
                if (v250)
                {
                  id v180 = (id)AXLogUIA();
                  os_log_type_t v179 = OS_LOG_TYPE_INFO;
                  if (os_log_type_enabled((os_log_t)v180, OS_LOG_TYPE_INFO))
                  {
                    v94 = v180;
                    os_log_type_t v95 = v179;
                    __os_log_helper_16_3_2_8_69_8_69((uint64_t)v271, (uint64_t)v200, (uint64_t)v186);
                    _os_log_impl(&dword_2402B7000, v94, v95, "Found the view we were looking for through touch forwarding views %{sensitive}@ -> %{sensitive}@", v271, 0x16u);
                  }
                  objc_storeStrong(&v180, 0);
                }
              }
            }
            else
            {
              if (v250)
              {
                id v182 = (id)AXLogUIA();
                os_log_type_t v181 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled((os_log_t)v182, OS_LOG_TYPE_INFO))
                {
                  v96 = v182;
                  os_log_type_t v97 = v181;
                  __os_log_helper_16_3_3_8_69_8_69_8_69((uint64_t)v272, (uint64_t)v200, (uint64_t)v197, (uint64_t)v186);
                  _os_log_impl(&dword_2402B7000, v96, v97, "Not using this view because it looks like it's a touch forwarding view: parent view: %{sensitive}@, foundView: %{sensitive}@ (forward to: %{sensitive}@)", v272, 0x20u);
                }
                objc_storeStrong(&v182, 0);
              }
              char v188 = 0;
            }
            objc_storeStrong(&v186, 0);
          }
        }
        if (v189 || (v188 & 1) != 0)
        {
          if (v250)
          {
            id v178 = (id)AXLogUIA();
            os_log_type_t v177 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled((os_log_t)v178, OS_LOG_TYPE_INFO))
            {
              v92 = v178;
              os_log_type_t v93 = v177;
              __os_log_helper_16_3_1_8_69((uint64_t)v270, (uint64_t)v197);
              _os_log_impl(&dword_2402B7000, v92, v93, "Returning the matching UIA test object: %{sensitive}@", v270, 0xCu);
            }
            objc_storeStrong(&v178, 0);
          }
          v256 = (UIViewAccessibility *)v197;
          int v243 = 1;
        }
        else
        {
LABEL_161:
          if (v197)
          {
            if (!v203) {
              objc_storeStrong(&v203, v197);
            }
            id v176 = 0;
            id v175 = 0;
            char v91 = -[UIViewAccessibility _accessibilityModalViewBlocksView:blockerView:]((uint64_t)v254, v197, &v175);
            objc_storeStrong(&v176, v175);
            if (v91)
            {
              if (v250)
              {
                id v174 = (id)AXLogUIA();
                os_log_type_t v173 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled((os_log_t)v174, OS_LOG_TYPE_INFO))
                {
                  v89 = v174;
                  os_log_type_t v90 = v173;
                  __os_log_helper_16_3_1_8_69((uint64_t)v269, (uint64_t)v176);
                  _os_log_impl(&dword_2402B7000, v89, v90, "Something blocks the view we found, so skipping it.  We also uncache our first good view for some reason...: %{sensitive}@", v269, 0xCu);
                }
                objc_storeStrong(&v174, 0);
              }
              objc_storeStrong(&v203, 0);
              int v243 = 8;
            }
            else
            {
              BOOL v172 = 0;
              if (v252)
              {
                id v29 = (id)[v197 _accessibilityFindViewAncestor:&__block_literal_global_443 startWithSelf:1];
                BOOL v172 = v29 != 0;

                if (v250)
                {
                  id v171 = (id)AXLogUIA();
                  os_log_type_t v170 = OS_LOG_TYPE_INFO;
                  if (os_log_type_enabled((os_log_t)v171, OS_LOG_TYPE_INFO))
                  {
                    v87 = v171;
                    os_log_type_t v88 = v170;
                    __os_log_helper_16_0_1_4_0((uint64_t)v268, v172);
                    _os_log_impl(&dword_2402B7000, v87, v88, "Is this an expected hit test view? %d", v268, 8u);
                  }
                  objc_storeStrong(&v171, 0);
                }
              }
              char v30 = [v197 accessibilityElementsHidden];
              char v168 = 0;
              char v86 = 1;
              if ((v30 & 1) == 0)
              {
                v169 = (uint64_t (**)(id, id))(id)[v235[0] isEligibleElement];
                char v168 = 1;
                char v85 = 0;
                if ((v169[2](v169, v197) & 1) == 0) {
                  char v85 = !v172;
                }
                char v86 = v85;
              }
              if (v168) {

              }
              if (v86)
              {
                if (v250)
                {
                  id v167 = (id)AXLogUIA();
                  os_log_type_t v166 = OS_LOG_TYPE_INFO;
                  if (os_log_type_enabled((os_log_t)v167, OS_LOG_TYPE_INFO))
                  {
                    v83 = v167;
                    os_log_type_t v84 = v166;
                    __os_log_helper_16_3_3_8_69_4_0_4_0((uint64_t)v267, (uint64_t)v197, [v197 accessibilityElementsHidden] & 1, objc_msgSend(v197, "isAccessibilityElement") & 1);
                    _os_log_impl(&dword_2402B7000, v83, v84, "Can't use this view, so keep going: %{sensitive}@ hidden: %d iselement: %d", v267, 0x18u);
                  }
                  objc_storeStrong(&v167, 0);
                }
                if (v203 == v197) {
                  objc_storeStrong(&v203, 0);
                }
                int v243 = 0;
              }
              else
              {
                if (v250)
                {
                  id v165 = (id)AXLogUIA();
                  os_log_type_t v164 = OS_LOG_TYPE_INFO;
                  if (os_log_type_enabled((os_log_t)v165, OS_LOG_TYPE_INFO))
                  {
                    v81 = v165;
                    os_log_type_t v82 = v164;
                    __os_log_helper_16_3_1_8_69((uint64_t)v266, (uint64_t)v197);
                    _os_log_impl(&dword_2402B7000, v81, v82, "Returning the view we found via AX hit test %{sensitive}@", v266, 0xCu);
                  }
                  objc_storeStrong(&v165, 0);
                }
                v256 = (UIViewAccessibility *)v197;
                int v243 = 1;
              }
            }
            objc_storeStrong(&v176, 0);
            if (v243) {
              goto LABEL_226;
            }
          }
          else if (v241)
          {
            id v163 = (id)[v200 _accessibilityAccessibleDescendants];
            memset(v161, 0, sizeof(v161));
            id v79 = v163;
            uint64_t v80 = [v79 countByEnumeratingWithState:v161 objects:v265 count:16];
            if (v80)
            {
              uint64_t v76 = *(void *)v161[2];
              uint64_t v77 = 0;
              unint64_t v78 = v80;
              while (1)
              {
                uint64_t v75 = v77;
                if (*(void *)v161[2] != v76) {
                  objc_enumerationMutation(v79);
                }
                id v162 = *(id *)(v161[1] + 8 * v77);
                char v160 = 0;
                char v160 = [v162 accessibilityElementsHidden] & 1;
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v162 alpha];
                  if (v31 == 0.0 || (LOBYTE(v74) = 0, ([v162 isHidden] & 1) != 0)) {
                    int v74 = [v162 _accessibilityOverridesInvisibility] ^ 1;
                  }
                  char v160 = (v160 & 1 | v74 & 1) != 0;
                }
                if ((v160 & 1) == 0)
                {
                  uint64_t v158 = 0;
                  uint64_t v159 = 0;
                  UIAccessibilityPointForPoint();
                  uint64_t v158 = v32;
                  uint64_t v159 = v33;
                  double v157 = 0.0;
                  [v162 accessibilityFrame];
                  v156[1] = v34;
                  v156[2] = v35;
                  v156[3] = v36;
                  v156[4] = v37;
                  AX_CGRectGetCenter();
                  v156[5] = v38;
                  v156[6] = v39;
                  AX_CGPointGetDistanceToPoint();
                  double v157 = v40;
                  if (v40 < v201)
                  {
                    double v73 = v157;
                    [(UIViewAccessibility *)v254 _accessibilityMaxFuzzyHitTestDistance];
                    if (v73 < v41)
                    {
                      double v201 = v157;
                      objc_storeStrong(&v202, v162);
                    }
                  }
                }
                ++v77;
                if (v75 + 1 >= v78)
                {
                  uint64_t v77 = 0;
                  unint64_t v78 = [v79 countByEnumeratingWithState:v161 objects:v265 count:16];
                  if (!v78) {
                    break;
                  }
                }
              }
            }

            objc_storeStrong(&v163, 0);
          }
          if (([v200 accessibilityViewIsModal] & 1) != 0
            && ([v200 _accessibilityViewIsVisible] & 1) != 0)
          {
            char v155 = 0;
            objc_opt_class();
            id v154 = (id)__UIAccessibilityCastAsSafeCategory();
            if (v155) {
              abort();
            }
            id v153 = v154;
            objc_storeStrong(&v154, 0);
            id v72 = v153;
            v156[0] = [(UIViewAccessibility *)v153 _accessibilityCheckForAllowedModalView:v198.x event:v198.y];

            if (v156[0])
            {
              if (v250)
              {
                id v152 = (id)AXLogUIA();
                os_log_type_t v151 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled((os_log_t)v152, OS_LOG_TYPE_INFO))
                {
                  v71 = v152;
                  __os_log_helper_16_3_1_8_69((uint64_t)v264, (uint64_t)v156[0]);
                  _os_log_impl(&dword_2402B7000, v71, v151, "Returning our allowed modal view %{sensitive}@", v264, 0xCu);
                }
                objc_storeStrong(&v152, 0);
              }
              v256 = (UIViewAccessibility *)v156[0];
              int v243 = 1;
            }
            else
            {
              int v243 = 6;
            }
            objc_storeStrong(v156, 0);
          }
          else
          {
            int v243 = 0;
          }
        }
      }
LABEL_226:
      objc_storeStrong(&v197, 0);
LABEL_227:
      objc_storeStrong(&v200, 0);
      if (v243)
      {
        if (v243 == 6) {
          goto LABEL_231;
        }
        if (v243 != 8) {
          goto LABEL_314;
        }
      }
    }
  }
  if (v250)
  {
    id v246 = (id)AXLogUIA();
    os_log_type_t v245 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v246, OS_LOG_TYPE_INFO))
    {
      v128 = v246;
      os_log_type_t v129 = v245;
      __os_log_helper_16_0_0(v244);
      _os_log_impl(&dword_2402B7000, v128, v129, "Elements were hidden, returning nil", v244, 2u);
    }
    objc_storeStrong(&v246, 0);
  }
  v256 = 0;
  int v243 = 1;
LABEL_318:
  objc_storeStrong(location, 0);
  id v50 = v256;

  return v50;
}

- (BOOL)_accessibilityViewIsBeingHitTested:(uint64_t)a1
{
  uint64_t v5 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    id v2 = (id)[location _accessibilityFindAncestor:&__block_literal_global_446 startWithSelf:1];
    BOOL v6 = v2 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  objc_storeStrong(&location, 0);
  return v6;
}

uint64_t __56__UIViewAccessibility___accessibilityHitTest_withEvent___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] _accessibilityElementIsBeingHitTested];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilityCheckForAllowedModalView:(double)a3 event:(double)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  *(double *)&long long v40 = a3;
  *((double *)&v40 + 1) = a4;
  id v39 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v39)
  {
    id v36 = (id)[v39 _accessibilityObscuredScreenAllowedViews];
    id v35 = (id)[v39 _accessibilityHitTestingObscuredScreenAllowedViews];
    if (v35)
    {
      if (v36)
      {
        id v4 = (id)[v36 arrayByAddingObjectsFromArray:v35];
        id v5 = v36;
        id v36 = v4;
      }
      else
      {
        objc_storeStrong(&v36, v35);
      }
    }
    id v34 = (id)[v39 _accessibilityWindow];
    memset(__b, 0, sizeof(__b));
    id obj = v36;
    uint64_t v21 = [obj countByEnumeratingWithState:__b objects:v42 count:16];
    if (v21)
    {
      uint64_t v17 = *(void *)__b[2];
      uint64_t v18 = 0;
      unint64_t v19 = v21;
      while (1)
      {
        uint64_t v16 = v18;
        if (*(void *)__b[2] != v17) {
          objc_enumerationMutation(obj);
        }
        id v33 = *(id *)(__b[1] + 8 * v18);
        if (v33 != v39 && v33 != v34)
        {
          long long v31 = v40;
          id v30 = (id)[v33 _accessibilityWindow];
          char v28 = 0;
          char v26 = 0;
          BOOL v15 = 0;
          if (v34)
          {
            BOOL v15 = 0;
            if (v30)
            {
              id v14 = (id)[v39 _accessibilityWindow];
              id v29 = v14;
              char v28 = 1;
              id v27 = (id)[v33 _accessibilityWindow];
              char v26 = 1;
              BOOL v15 = v14 != v27;
            }
          }
          if (v26) {

          }
          if (v28) {
          if (v15)
          }
          {
            [v30 convertPoint:v39 fromView:v31];
            *(double *)&long long v25 = v6;
            *((double *)&v25 + 1) = v7;
            long long v31 = v25;
            objc_msgSend(v30, "convertPoint:toView:", v33, v6, v7);
            *(void *)&long long v24 = v8;
            *((void *)&v24 + 1) = v9;
            long long v31 = v24;
          }
          else
          {
            [v33 convertPoint:v39 fromView:v40];
            *(void *)&long long v23 = v10;
            *((void *)&v23 + 1) = v11;
            long long v31 = v23;
          }
          id v22 = (id)[v33 _accessibilityHitTest:location withEvent:v31];
          if (v22)
          {
            id v41 = v22;
            int v37 = 1;
          }
          else
          {
            int v37 = 0;
          }
          objc_storeStrong(&v22, 0);
          objc_storeStrong(&v30, 0);
          if (v37) {
            break;
          }
        }
        ++v18;
        if (v16 + 1 >= v19)
        {
          uint64_t v18 = 0;
          unint64_t v19 = [obj countByEnumeratingWithState:__b objects:v42 count:16];
          if (!v19) {
            goto LABEL_30;
          }
        }
      }
    }
    else
    {
LABEL_30:
      int v37 = 0;
    }

    if (!v37)
    {
      id v41 = 0;
      int v37 = 1;
    }
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
  }
  else
  {
    id v41 = 0;
    int v37 = 1;
  }
  objc_storeStrong(&location, 0);
  id v12 = v41;

  return v12;
}

uint64_t __58__UIViewAccessibility__accessibilityViewIsBeingHitTested___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] _accessibilityBoolValueForKey:@"AXPerformingVisiblePointHitTest"];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v27 = a3;
  char v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v24 = [(UIViewAccessibility *)v26 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v17 = 0;
  char v10 = 0;
  if (!v24)
  {
    uint64_t v18 = MEMORY[0x263EF8330];
    int v19 = -1073741824;
    int v20 = 0;
    uint64_t v21 = __55__UIViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
    id v22 = &unk_2650AE580;
    long long v23 = v26;
    char v17 = 1;
    uint64_t v16 = (id *)&v23;
    char v10 = ((uint64_t (*)(void))__55__UIViewAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v10)
  {
    -[UIViewAccessibility _accessibilitySetBoolValue:forKey:](v26, "_accessibilitySetBoolValue:forKey:", 1);
    id v15 = (id)-[UIViewAccessibility accessibilityHitTest:withEvent:](v26, "accessibilityHitTest:withEvent:", location[0], v27.x, v27.y);
    [(UIViewAccessibility *)v26 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    id v28 = v15;
    int v14 = 1;
    objc_storeStrong(&v15, 0);
  }
  else
  {
    int v14 = 0;
  }
  if (v17) {
    objc_storeStrong(v16, 0);
  }
  if (!v14)
  {
    id v13 = 0;
    uint64_t v12 = [(UIViewAccessibility *)v26 accessibilityElementCount];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = -[UIViewAccessibility __accessibilityHitTest:withEvent:](v26, "__accessibilityHitTest:withEvent:", location[0], v27.x, v27.y);
      id v7 = v13;
      id v13 = v6;
    }
    else
    {
      v11.receiver = v26;
      v11.super_class = (Class)UIViewAccessibility;
      id v4 = -[UIViewAccessibility _accessibilityHitTest:withEvent:](&v11, sel__accessibilityHitTest_withEvent_, location[0], v27.x, v27.y);
      id v5 = v13;
      id v13 = v4;
    }
    id v28 = v13;
    int v14 = 1;
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(location, 0);
  uint64_t v8 = v28;

  return v8;
}

BOOL __55__UIViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  uint64_t v18 = (dispatch_once_t *)&AXViewIsProbablyDimmingView_block_invoke_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_454);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
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
      uint64_t v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      id v4 = v8;
      char v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v2);
      uint64_t v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)AXViewIsProbablyDimmingView_block_invoke_BaseImplementation;
}

void __55__UIViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    AXViewIsProbablyDimmingView_block_invoke_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      id v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      char v3 = v7;
      uint64_t v9 = v3;
      id v2 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v2);
      uint64_t v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilityRetrieveIvarText
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v28 = a1;
  if (a1)
  {
    if (!_accessibilityRetrieveIvarText_IgnoreStringSet)
    {
      uint64_t v1 = [objc_allocWithZone(MEMORY[0x263EFF9C0]) init];
      id v2 = (void *)_accessibilityRetrieveIvarText_IgnoreStringSet;
      _accessibilityRetrieveIvarText_IgnoreStringSet = v1;

      [(id)_accessibilityRetrieveIvarText_IgnoreStringSet addObject:@"_reuseIdentifier"];
      [(id)_accessibilityRetrieveIvarText_IgnoreStringSet addObject:@"_backgroundColorSystemColorName"];
      [(id)_accessibilityRetrieveIvarText_IgnoreStringSet addObject:@"_contentViewConfigurationIdentifier"];
    }
    unsigned int v27 = 0;
    char v3 = (objc_class *)objc_opt_class();
    char v26 = class_copyIvarList(v3, &v27);
    id v25 = &stru_26F458D38;
    for (int i = v27 - 1; i >= 0; --i)
    {
      Ivar v23 = 0;
      Ivar v23 = v26[i];
      TypeEncoding = 0;
      TypeEncoding = ivar_getTypeEncoding(v23);
      if (TypeEncoding && !strcmp(TypeEncoding, "@\"NSString\""))
      {
        Name = 0;
        Name = ivar_getName(v23);
        id v20 = (id)[NSString stringWithCString:Name encoding:1];
        if ([(id)_accessibilityRetrieveIvarText_IgnoreStringSet containsObject:v20]) {
          goto LABEL_26;
        }
        id v19 = (id)[v28 safeValueForKey:v20];
        if (v19)
        {
          Class Class = 0;
          Class Class = object_getClass(v19);
          if (Class)
          {
            long long v31 = (dispatch_once_t *)&_accessibilityRetrieveIvarText_onceToken;
            id location = 0;
            objc_storeStrong(&location, &__block_literal_global_473);
            if (*v31 != -1) {
              dispatch_once(v31, location);
            }
            objc_storeStrong(&location, 0);
            memset(__b, 0, sizeof(__b));
            id obj = (id)_accessibilityRetrieveIvarText_AcceptableClasses;
            uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
            if (v14)
            {
              uint64_t v10 = *(void *)__b[2];
              uint64_t v11 = 0;
              unint64_t v12 = v14;
              while (1)
              {
                uint64_t v9 = v11;
                if (*(void *)__b[2] != v10) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v16 = *(objc_class **)(__b[1] + 8 * v11);
                if (v16 == Class)
                {
                  id v4 = (id)__UIAXStringForVariables();
                  id v5 = v25;
                  id v25 = v4;
                }
                ++v11;
                if (v9 + 1 >= v12)
                {
                  uint64_t v11 = 0;
                  unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
                  if (!v12) {
                    break;
                  }
                }
              }
            }

            int v18 = 0;
          }
          else
          {
            int v18 = 4;
          }
        }
        else
        {
          int v18 = 4;
        }
        objc_storeStrong(&v19, 0);
        if (!v18) {
LABEL_26:
        }
          int v18 = 0;
        objc_storeStrong(&v20, 0);
      }
    }
    free(v26);
    if ([v25 length]) {
      id v6 = v25;
    }
    else {
      id v6 = 0;
    }
    id v29 = v6;
    int v18 = 1;
    objc_storeStrong(&v25, 0);
  }
  else
  {
    id v29 = 0;
  }
  id v7 = v29;

  return v7;
}

Class __53__UIViewAccessibility__accessibilityRetrieveIvarText__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08A88]) initWithOptions:256];
  uint64_t v1 = (void *)_accessibilityRetrieveIvarText_AcceptableClasses;
  _accessibilityRetrieveIvarText_AcceptableClasses = v0;

  [(id)_accessibilityRetrieveIvarText_AcceptableClasses addPointer:objc_opt_class()];
  [(id)_accessibilityRetrieveIvarText_AcceptableClasses addPointer:NSClassFromString(&cfstr_Nscfstring.isa)];
  [(id)_accessibilityRetrieveIvarText_AcceptableClasses addPointer:NSClassFromString(&cfstr_Nscfconstantst.isa)];
  Class result = NSClassFromString(&cfstr_Nstaggedpointe.isa);
  if (result) {
    return (Class)[(id)_accessibilityRetrieveIvarText_AcceptableClasses addPointer:result];
  }
  return result;
}

- (id)_accessibilityRetrieveLabelFromTableViewCell
{
  id v30 = a1;
  if (a1)
  {
    uint64_t v23 = 0;
    char v24 = &v23;
    int v25 = 838860800;
    int v26 = 48;
    unsigned int v27 = __Block_byref_object_copy__25;
    id v28 = __Block_byref_object_dispose__25;
    id v29 = 0;
    id v22 = (id)[v30 safeValueForKey:@"superview"];
    while (1)
    {
      LOBYTE(v17) = 0;
      if (v22)
      {
        objc_opt_class();
        int v17 = objc_opt_isKindOfClass() ^ 1;
      }
      if ((v17 & 1) == 0) {
        break;
      }
      id v1 = (id)[v22 superview];
      id v2 = v22;
      id v22 = v1;
    }
    if (v22)
    {
      if ([v22 isAccessibilityElement])
      {
        id v3 = (id)[v22 safeValueForKey:@"accessibilityLabel"];
        id v4 = (void *)v24[5];
        v24[5] = (uint64_t)v3;
      }
      else
      {
        id v5 = (id)[v22 safeValueForKey:@"accessibilityTableViewCellText"];
        id v6 = (void *)v24[5];
        v24[5] = (uint64_t)v5;

        if (!v24[5])
        {
          id v21 = (id)[v22 safeValueForKey:@"_accessibilityIndexPath"];
          id v20 = (id)[v22 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
          if (v20)
          {
            id v19 = 0;
            if ([(id)*MEMORY[0x263F1D020] _accessibilityWantsOpaqueElementProviders]) {
              id v7 = (id)[v30 _accessibilityAncestorIsKindOf:objc_opt_class()];
            }
            else {
              id v7 = (id)objc_msgSend(v20, "accessibilityTableViewCellElementAtGlobalRow:", objc_msgSend(v20, "globalRowForRowAtIndexPath:", v21));
            }
            id v8 = v19;
            id v19 = v7;

            id location = v19;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v9 = (id)[v19 tableViewCell];
              id v10 = location;
              id location = v9;
            }
            objc_opt_class();
            id v15 = (id)__UIAccessibilityCastAsSafeCategory();
            char IsFetching = -[UITableViewCellAccessibility accessibilityIsFetchingChildren]((uint64_t)v15);

            if ((IsFetching & 1) == 0) {
              objc_msgSend(v19, "accessibilityEnumerateContainerElementsUsingBlock:");
            }
            objc_storeStrong(&location, 0);
            objc_storeStrong(&v19, 0);
          }
          objc_storeStrong(&v20, 0);
          objc_storeStrong(&v21, 0);
        }
      }
      if (!v24[5])
      {
        id v11 = (id)[v22 safeValueForKey:@"text"];
        unint64_t v12 = (void *)v24[5];
        v24[5] = (uint64_t)v11;
      }
    }
    id v31 = (id)v24[5];
    objc_storeStrong(&v22, 0);
    _Block_object_dispose(&v23, 8);
    objc_storeStrong(&v29, 0);
  }
  else
  {
    id v31 = 0;
  }
  uint64_t v13 = v31;

  return v13;
}

void __67__UIViewAccessibility__accessibilityRetrieveLabelFromTableViewCell__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = (id)[location[0] accessibilityLabel];
    uint64_t v3 = *(void *)(a1[4] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  objc_storeStrong(location, 0);
}

- (BOOL)accessibilityElementsHidden
{
  id v2 = (id)[(UIViewAccessibility *)self storedAccessibilityElementsHidden];
  BOOL v6 = v2 == 0;

  if (v6)
  {
    LOBYTE(v4) = 0;
    if ([(UIViewAccessibility *)self isHidden]) {
      int v4 = [(UIViewAccessibility *)self _accessibilityOverridesInvisibility] ^ 1;
    }
    return v4 & 1;
  }
  else
  {
    id v5 = (id)[(UIViewAccessibility *)self storedAccessibilityElementsHidden];
    BOOL v8 = [v5 BOOLValue] & 1;
  }
  return v8;
}

- (double)_accessibilityViewAlpha
{
  [(UIViewAccessibility *)self alpha];
  return result;
}

- (BOOL)_accessibilityIsInTableCell
{
  id v2 = (id)[(UIViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  BOOL v4 = v2 != 0;

  return v4;
}

- (BOOL)_accessibilityIsInCollectionCell
{
  id v2 = (id)[(UIViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  BOOL v4 = v2 != 0;

  return v4;
}

- (BOOL)_accessibilityIsInFocusableCell
{
  return 0;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  BOOL v3 = 0;
  if ([(UIViewAccessibility *)self isAccessibilityElement]) {
    return [(UIViewAccessibility *)self accessibilityRespondsToUserInteraction];
  }
  return v3;
}

- (id)_systemDefaultFocusGroupIdentifier
{
  id v9 = self;
  location[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)UIViewAccessibility;
  location[0] = [(UIViewAccessibility *)&v7 _systemDefaultFocusGroupIdentifier];
  char v5 = 0;
  BOOL v4 = 0;
  if (!location[0])
  {
    BOOL v4 = 0;
    if ([(UIViewAccessibility *)v9 _accessibilityIsFKARunningForFocusItem])
    {
      id v6 = (id)[(UIViewAccessibility *)v9 safeValueForKey:@"_containingScrollView"];
      char v5 = 1;
      BOOL v4 = 0;
      if (!v6) {
        BOOL v4 = [(UIViewAccessibility *)v9 _accessibilityInTopLevelTabLoop];
      }
    }
  }
  if (v5) {

  }
  if (v4) {
    id v10 = (id)[(UIViewAccessibility *)v9 _accessibilityDefaultFocusGroupIdentifier];
  }
  else {
    id v10 = location[0];
  }
  objc_storeStrong(location, 0);
  id v2 = v10;

  return v2;
}

- (id)focusItemsInRect:(CGRect)a3
{
  CGRect v33 = a3;
  uint64_t v32 = self;
  v31[1] = (id)a2;
  v30.receiver = self;
  v30.super_class = (Class)UIViewAccessibility;
  v31[0] = -[UIViewAccessibility focusItemsInRect:](&v30, sel_focusItemsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if ([(UIViewAccessibility *)v32 _accessibilityIsFKARunningForFocusItem])
  {
    [(UIViewAccessibility *)v32 accessibilityFrame];
    *(void *)&long long v27 = v3;
    *((void *)&v27 + 1) = v4;
    *(void *)&long long v28 = v5;
    *((void *)&v28 + 1) = v6;
    id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
    v17[1] = (id)MEMORY[0x263EF8330];
    int v18 = -1073741824;
    int v19 = 0;
    id v20 = __40__UIViewAccessibility_focusItemsInRect___block_invoke;
    id v21 = &__block_descriptor_64_e8_B16__0_8l;
    long long v22 = v27;
    long long v23 = v28;
    id v24 = (id)MEMORY[0x2455E7040]();
    id v9 = v31[0];
    uint64_t v10 = MEMORY[0x263EF8330];
    int v11 = -1073741824;
    int v12 = 0;
    uint64_t v13 = __40__UIViewAccessibility_focusItemsInRect___block_invoke_2;
    uint64_t v14 = &unk_2650AF8A0;
    v17[0] = v24;
    id v15 = v26;
    id v16 = v25;
    [v9 enumerateObjectsUsingBlock:&v10];
    id v34 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "axArrayWithPossiblyNilArrays:", 2, v26, v25);
    int v29 = 1;
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(v17, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  else
  {
    id v34 = v31[0];
    int v29 = 1;
  }
  objc_storeStrong(v31, 0);
  objc_super v7 = v34;

  return v7;
}

uint64_t __40__UIViewAccessibility_focusItemsInRect___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ([location[0] _accessibilityIsKindOfUIView])
  {
    char v4 = 0;
  }
  else
  {
    [location[0] accessibilityFrame];
    char v4 = AX_CGRectAlmostEqualToRect() & 1;
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

void __40__UIViewAccessibility_focusItemsInRect___block_invoke_2(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))()) {
    [*(id *)(a1 + 32) addObject:location[0]];
  }
  else {
    [*(id *)(a1 + 40) addObject:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (id)_accessibilitySupportGesturesAttributes
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v28[2] = self;
  v28[1] = (id)a2;
  id v22 = (id)[(UIViewAccessibility *)self gestureRecognizers];
  v28[0] = (id)objc_msgSend(v22, "ax_filteredArrayUsingBlock:", &__block_literal_global_527_0);

  if ([v28[0] count])
  {
    id v26 = (id)[MEMORY[0x263EFF980] array];
    memset(__b, 0, sizeof(__b));
    id obj = v28[0];
    uint64_t v21 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
    if (v21)
    {
      uint64_t v17 = *(void *)__b[2];
      uint64_t v18 = 0;
      unint64_t v19 = v21;
      while (1)
      {
        uint64_t v16 = v18;
        if (*(void *)__b[2] != v17) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(id *)(__b[1] + 8 * v18);
        id v23 = (id)[MEMORY[0x263EFF9A0] dictionary];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v23 setObject:&unk_26F48EB28 forKey:@"AXSupportedGestureTypeKey"];
          id v12 = v23;
          id v13 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "numberOfTapsRequired"));
          objc_msgSend(v12, "setObject:forKey:");

          id v14 = v23;
          id v15 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "numberOfTouchesRequired"));
          objc_msgSend(v14, "setObject:forKey:");
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v23 setObject:&unk_26F48EB40 forKey:@"AXSupportedGestureTypeKey"];
            id v8 = v23;
            id v9 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "numberOfTapsRequired"));
            objc_msgSend(v8, "setObject:forKey:");

            id v10 = v23;
            id v11 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "numberOfTouchesRequired"));
            objc_msgSend(v10, "setObject:forKey:");
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v23 setObject:&unk_26F48EB58 forKey:@"AXSupportedGestureTypeKey"];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v23 setObject:&unk_26F48EB58 forKey:@"AXSupportedGestureTypeKey"];
                id v4 = v23;
                id v5 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "direction"));
                objc_msgSend(v4, "setObject:forKey:");

                id v6 = v23;
                id v7 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "numberOfTouchesRequired"));
                objc_msgSend(v6, "setObject:forKey:");
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v23 setObject:&unk_26F48EB70 forKey:@"AXSupportedGestureTypeKey"];
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v23 setObject:&unk_26F48EB88 forKey:@"AXSupportedGestureTypeKey"];
                  }
                }
              }
            }
          }
        }
        [v26 addObject:v23];
        objc_storeStrong(&v23, 0);
        ++v18;
        if (v16 + 1 >= v19)
        {
          uint64_t v18 = 0;
          unint64_t v19 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
          if (!v19) {
            break;
          }
        }
      }
    }

    id v29 = v26;
    int v27 = 1;
    objc_storeStrong(&v26, 0);
  }
  else
  {
    id v29 = 0;
    int v27 = 1;
  }
  objc_storeStrong(v28, 0);
  id v2 = v29;

  return v2;
}

uint64_t __62__UIViewAccessibility__accessibilitySupportGesturesAttributes__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] _accessibilityIsSupportedGestureRecognizer];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilitySortedElementsWithin
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
  id v5 = v7;
  if (((uint64_t (*)(void))__57__UIViewAccessibility__accessibilitySortedElementsWithin__block_invoke)())
  {
    id v8 = (id)[(UIViewAccessibility *)v7 _accessibilityViewChildrenWithOptions:location[0]];
    int v4 = 1;
  }
  else
  {
    int v4 = 0;
  }
  objc_storeStrong((id *)&v5, 0);
  if (!v4) {
    id v8 = [(UIViewAccessibility *)v7 _accessibilitySortedElementsWithinWithOptions:location[0]];
  }
  objc_storeStrong(location, 0);
  id v2 = v8;

  return v2;
}

BOOL __57__UIViewAccessibility__accessibilitySortedElementsWithin__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  uint64_t v18 = (dispatch_once_t *)&AXViewIsProbablyDimmingView_block_invoke_2_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_558);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
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
      id v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      int v4 = v8;
      id v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v2);
      id v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)AXViewIsProbablyDimmingView_block_invoke_2_BaseImplementation;
}

void __57__UIViewAccessibility__accessibilitySortedElementsWithin__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    AXViewIsProbablyDimmingView_block_invoke_2_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      id v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      char v3 = v7;
      id v9 = v3;
      id v2 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v2);
      id v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilitySortedElementsWithinWithOptions:(id)a3
{
  uint64_t v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  char v10 = __69__UIViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke;
  id v11 = &unk_2650AE580;
  id v12 = v15;
  char v13 = ((uint64_t (*)(void))__69__UIViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke)() & 1;
  id v5 = v15;
  char v6 = ((uint64_t (*)(void))__69__UIViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_563)() & 1;
  if (v13 & 1) == 0 || (v6) {
    id v16 = (id)[(UIViewAccessibility *)v15 _accessibilityViewChildrenWithOptions:location[0]];
  }
  else {
    id v16 = [(UIViewAccessibility *)v15 _accessibilitySortedElementsWithin];
  }
  objc_storeStrong((id *)&v5, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(location, 0);
  char v3 = v16;

  return v3;
}

BOOL __69__UIViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  uint64_t v18 = (dispatch_once_t *)&AXViewIsProbablyDimmingView_block_invoke_3_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_562);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
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
      int v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      int v4 = v8;
      char v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v2);
      int v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)AXViewIsProbablyDimmingView_block_invoke_3_BaseImplementation;
}

void __69__UIViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    AXViewIsProbablyDimmingView_block_invoke_3_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      uint64_t v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      char v3 = v7;
      int v9 = v3;
      id v2 = (objc_class *)objc_opt_class();
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

BOOL __69__UIViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_563(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  uint64_t v18 = (dispatch_once_t *)&AXViewIsProbablyDimmingView_block_invoke_4_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_566);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithinWithOptions_);
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
      int v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithinWithOptions_);
      int v4 = v8;
      char v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v2);
      int v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)AXViewIsProbablyDimmingView_block_invoke_4_BaseImplementation;
}

void __69__UIViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_2_564(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithinWithOptions_);
  if (InstanceMethod)
  {
    AXViewIsProbablyDimmingView_block_invoke_4_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      uint64_t v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithinWithOptions_);
      char v3 = v7;
      int v9 = v3;
      id v2 = (objc_class *)objc_opt_class();
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

- (id)automationElements
{
  char v6 = self;
  SEL v5 = a2;
  if ([(UIViewAccessibility *)self isAccessibilityElement]
    || ([(UIViewAccessibility *)v6 _accessibilityHasOrderedChildren] & 1) != 0)
  {
    v4.receiver = v6;
    v4.super_class = (Class)UIViewAccessibility;
    id v7 = [(UIViewAccessibility *)&v4 automationElements];
  }
  else
  {
    id v7 = -[UIViewAccessibility _accessibilityUserTestingSubviewsSorted:](v6, !([(UIViewAccessibility *)v6 _accessibilityBoolValueForKey:@"AXPerformingChildrenCount"] & 1));
  }
  id v2 = v7;

  return v2;
}

- (id)_accessibilityUserTestingSubviewsSorted:(void *)a1
{
  id v11 = a1;
  char v10 = a2 & 1;
  if (a1)
  {
    id v5 = (id)[v11 _accessibilitySubviews];
    id v9 = (id)[v5 mutableCopy];

    char v6 = 0;
    if ([v11 _accessibilityViewIsVisible])
    {
      id v7 = (id)[v9 indexesOfObjectsPassingTest:&__block_literal_global_576];
      char v6 = 1;
      id v2 = v7;
    }
    else
    {
      id v2 = 0;
    }
    id location = v2;
    if (v6) {

    }
    if ([location count]) {
      [v9 removeObjectsAtIndexes:location];
    }
    if (v10) {
      [v11 _accessibilitySortElementsUsingGeometry:v9];
    }
    id v12 = v9;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v9, 0);
  }
  else
  {
    id v12 = 0;
  }
  char v3 = v12;

  return v3;
}

BOOL __63__UIViewAccessibility__accessibilityUserTestingSubviewsSorted___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BOOL v3 = !([location[0] _accessibilityViewIsVisible] & 1);
  objc_storeStrong(location, 0);
  return v3;
}

- (void)_axPrintSubviews:(int64_t)a3 string:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  long long v40 = self;
  SEL v39 = a2;
  int64_t v38 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  if (!v38)
  {
    id v28 = location;
    id v30 = (id)[(UIViewAccessibility *)v40 description];
    id v29 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v28 appendFormat:@"SELF: %@ {%@}\n", v30, v29];
  }
  memset(__b, 0, sizeof(__b));
  id obj = (id)[(UIViewAccessibility *)v40 subviews];
  uint64_t v27 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
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
      id v36 = *(id *)(__b[1] + 8 * v24);
      for (int i = 0; i < v38; ++i)
        [location appendString:@"    "];
      id v33 = (id)[MEMORY[0x263F1CB68] viewControllerForView:v36];
      id v32 = &stru_26F458D38;
      if (v33)
      {
        id v4 = (id)[NSString stringWithFormat:@"VC:[%@] ", v33];
        id v5 = v32;
        id v32 = v4;
      }
      id v31 = &stru_26F458D38;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v20 = NSString;
        id v21 = (id)[v36 safeValueForKey:@"delegate"];
        id v6 = (id)[v20 stringWithFormat:@"Delegate:[%@] ", v21];
        id v7 = v31;
        id v31 = v6;
      }
      id v12 = location;
      id v17 = (id)[v36 description];
      char v8 = [v36 accessibilityIgnoresInvertColors];
      id v16 = (id)[v36 layer];
      id v15 = (id)[v16 filters];
      char v9 = objc_msgSend(v15, "ax_containsObjectUsingBlock:", &__block_literal_global_600_0);
      id v14 = (id)[v36 backgroundColor];
      id v10 = v32;
      id v11 = v31;
      id v13 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v12 appendFormat:@"%@[INV:%d(L:%d), BG:{%@}] %@%@ {%@}\n", v17, v8 & 1, v9 & 1, v14, v10, v11, v13];

      id v18 = (id)[v36 subviews];
      BOOL v19 = [v18 count] == 0;

      if (!v19) {
        [v36 _axPrintSubviews:v38 + 1 string:location];
      }
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      ++v24;
      if (v22 + 1 >= v25)
      {
        uint64_t v24 = 0;
        unint64_t v25 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
        if (!v25) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&location, 0);
}

uint64_t __47__UIViewAccessibility__axPrintSubviews_string___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[location[0] name];
  char v7 = 0;
  char v5 = 0;
  char v4 = 1;
  if (([v3 isEqualToString:@"InvertColorsDoubleInvert"] & 1) == 0)
  {
    id v8 = (id)[location[0] name];
    char v7 = 1;
    char v4 = 1;
    if (([v8 isEqualToString:@"UIInvertColorsDoubleInvertPrivateKey"] & 1) == 0)
    {
      id v6 = (id)[location[0] name];
      char v5 = 1;
      char v4 = [v6 isEqualToString:@"InvertColorsDarkModeWindowFilter"];
    }
  }
  char v10 = v4 & 1;
  if (v5) {

  }
  if (v7) {
  objc_storeStrong(location, 0);
  }
  return v10 & 1;
}

- (id)_axSubviews
{
  char v5 = self;
  v4[1] = (id)a2;
  v4[0] = (id)[MEMORY[0x263F089D8] string];
  [(UIViewAccessibility *)v5 _axPrintSubviews:0 string:v4[0]];
  id v3 = v4[0];
  objc_storeStrong(v4, 0);

  return v3;
}

- (id)_axResponderChain
{
  id v14 = self;
  v13[1] = (id)a2;
  v13[0] = (id)[MEMORY[0x263F089D8] string];
  id v12 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:5];
  unint64_t v11 = 1;
  id v7 = (id)[(UIViewAccessibility *)v14 _accessibilityWindow];
  id location = (id)[v7 safeValueForKey:@"firstResponder"];

  if (location)
  {
    [v13[0] appendFormat:@"First Responder:\n %@\nResponder Chain:\n", location];
    [v12 addObject:location];
    while (1)
    {
      id v6 = (id)[location nextResponder];
      id v2 = location;
      id location = v6;

      if (!v6) {
        break;
      }
      [v12 addObject:location];
    }
    for (uint64_t i = [v12 count] - 1; i >= 0; --i)
    {
      for (unint64_t j = 0; j < v11; ++j)
        [v13[0] appendString:@" "];
      ++v11;
      id v5 = (id)[v12 objectAtIndex:i];
      [v13[0] appendFormat:@"%@\n", v5];
    }
    id v15 = (__CFString *)v13[0];
  }
  else
  {
    id v15 = @"This is no current first responder";
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  id v3 = v15;

  return v3;
}

- (BOOL)_accessibilityIsUserInteractionEnabled
{
  return [(UIViewAccessibility *)self isUserInteractionEnabled] & 1;
}

- (id)_clippedViewHierarchyDescription
{
  id v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)[(UIViewAccessibility *)self _iosAccessibilityAttributeValue:2041];
  char v13 = 0;
  uint64_t v12 = 0;
  id v11 = (id)[(UIViewAccessibility *)v15 superview];
  while (v11)
  {
    ++v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      char v13 = 1;
      break;
    }
    id v2 = (id)[v11 superview];
    id v3 = v11;
    id v11 = v2;
  }
  if (v13)
  {
    id v10 = (id)objc_msgSend(v14[0], "componentsSeparatedByString:");
    uint64_t v17 = 0;
    uint64_t v16 = v12;
    uint64_t v18 = 0;
    uint64_t v19 = v12;
    id v9 = (id)objc_msgSend(v10, "subarrayWithRange:", 0, v12);
    id v8 = (id)[v9 componentsJoinedByString:@"-"];
    id v4 = (id)[v8 stringByAppendingString:@"-"];
    id v5 = v14[0];
    v14[0] = v4;

    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
  }
  id v7 = v14[0];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v14, 0);

  return v7;
}

- (id)_accessibilityAuditIssuesWithOptions:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12.receiver = v15;
  v12.super_class = (Class)UIViewAccessibility;
  id v13 = [(UIViewAccessibility *)&v12 _accessibilityAuditIssuesWithOptions:location[0]];
  if (!v13)
  {
    id v3 = (id)[MEMORY[0x263EFF980] array];
    id v4 = v13;
    id v13 = v3;
  }
  id v11 = (id)[MEMORY[0x263F81180] optionsDictionaryForAuditTest:*MEMORY[0x263F21578] inDictionary:location[0]];
  char v10 = 0;
  char v10 = [MEMORY[0x263F81180] checkBoolValueForOptionsKey:*MEMORY[0x263F215D0] inDictionary:v11] & 1;
  id v9 = 0;
  if (v10)
  {
    id v5 = (id)[MEMORY[0x263F811E0] _axAuditContrastDetectionForView:v15];
    id v6 = v9;
    id v9 = v5;
  }
  [v13 axSafelyAddObjectsFromArray:v9];
  id v8 = v13;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);

  return v8;
}

- (id)_accessibilityImageData
{
  v37[2] = self;
  v37[1] = (id)a2;
  v37[0] = self;
  [v37[0] bounds];
  uint64_t v33 = v2;
  uint64_t v34 = v3;
  double v35 = v4;
  uint64_t v36 = v5;
  double v18 = CGCeiling(v4);
  [v37[0] bounds];
  uint64_t v29 = v6;
  uint64_t v30 = v7;
  uint64_t v31 = v8;
  double v32 = v9;
  if (v18 * CGCeiling(v9) <= 4096.0)
  {
    id v16 = objc_alloc(MEMORY[0x263F1C680]);
    [v37[0] bounds];
    v24[1] = v10;
    v24[2] = v11;
    *(double *)&long long v25 = v12;
    *((double *)&v25 + 1) = v13;
    long long v26 = v25;
    uint64_t v27 = objc_msgSend(v16, "initWithSize:", v12, v13);
    id v17 = (id)v27;
    uint64_t v19 = MEMORY[0x263EF8330];
    int v20 = -1073741824;
    int v21 = 0;
    uint64_t v22 = __46__UIViewAccessibility__accessibilityImageData__block_invoke;
    uint64_t v23 = &unk_2650AF908;
    v24[0] = v37[0];
    id v38 = (id)[v17 imageWithActions:&v19];
    objc_storeStrong(v24, 0);
    int v28 = 1;
    objc_storeStrong((id *)&v27, 0);
  }
  else
  {
    id v38 = 0;
    int v28 = 1;
  }
  objc_storeStrong(v37, 0);
  id v14 = v38;

  return v14;
}

void __46__UIViewAccessibility__accessibilityImageData__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = a1[4];
  [v7 bounds];
  [a1[4] bounds];
  CGRectMake_4();
  objc_msgSend(v7, "drawViewHierarchyInRect:afterScreenUpdates:", 0, v2, v3, v4, v5);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityCapturedImages
{
  uint64_t v6 = self;
  v5[1] = a2;
  v5[0] = 0;
  id v4 = (id)[MEMORY[0x263EFF980] array];
  -[UIViewAccessibility _accessibilityCapturedImagesWithDepth:capturedImages:](v6, v5, v4);
  id v3 = v4;
  objc_storeStrong(&v4, 0);

  return v3;
}

- (void)_accessibilityCapturedImagesWithDepth:(void *)a3 capturedImages:
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v15 = a1;
  id v14 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  if (v15)
  {
    if ((_UIApplicationIsExtension() & 1) != 0 || !v14 || *v14 >= 5uLL || [location count])
    {
      int v12 = 1;
    }
    else
    {
      ++*v14;
      id v11 = (id)[v15 _accessibilityImageData];
      if (v11) {
        [location addObject:v11];
      }
      memset(__b, 0, sizeof(__b));
      id obj = (id)[v15 subviews];
      uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
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
          uint64_t v10 = *(void *)(__b[1] + 8 * v5);
          -[UIViewAccessibility _accessibilityCapturedImagesWithDepth:capturedImages:](v10, v14, location);
          ++v5;
          if (v3 + 1 >= v6)
          {
            uint64_t v5 = 0;
            unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
            if (!v6) {
              break;
            }
          }
        }
      }

      objc_storeStrong(&v11, 0);
      int v12 = 0;
    }
  }
  else
  {
    int v12 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityAllDragSourceDescriptors
{
  unint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UIViewAccessibility *)self accessibilityDragSourceDescriptors];
  if (location[0])
  {
    id v7 = location[0];
  }
  else
  {
    id v4 = (id)[(UIViewAccessibility *)v6 _accessibilityFindUnsortedSubviewDescendantsPassingTest:&__block_literal_global_647];
    id v7 = (id)[v4 axMapObjectsUsingBlock:&__block_literal_global_650];
  }
  objc_storeStrong(location, 0);
  double v2 = v7;

  return v2;
}

uint64_t __61__UIViewAccessibility__accessibilityAllDragSourceDescriptors__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] _accessibilityHasDragSources];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

id __61__UIViewAccessibility__accessibilityAllDragSourceDescriptors__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v2 = objc_alloc(MEMORY[0x263F1C3B8]);
  id v4 = (id)[v2 initWithName:*MEMORY[0x263F215F8] view:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (id)_accessibilityAllDropPointDescriptors
{
  unint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UIViewAccessibility *)self accessibilityDropPointDescriptors];
  if (location[0])
  {
    id v7 = location[0];
  }
  else
  {
    id v4 = (id)[(UIViewAccessibility *)v6 _accessibilityFindUnsortedSubviewDescendantsPassingTest:&__block_literal_global_653];
    id v7 = (id)[v4 axMapObjectsUsingBlock:&__block_literal_global_655];
  }
  objc_storeStrong(location, 0);
  id v2 = v7;

  return v2;
}

uint64_t __60__UIViewAccessibility__accessibilityAllDropPointDescriptors__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] _accessibilityHasDragDestinations];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

id __60__UIViewAccessibility__accessibilityAllDropPointDescriptors__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v2 = objc_alloc(MEMORY[0x263F1C3B8]);
  id v4 = (id)[v2 initWithName:*MEMORY[0x263F215F8] view:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (BOOL)_accessibilityIsSoftwareKeyboardMimic
{
  id v7 = self;
  SEL v6 = a2;
  id v3 = [(UIViewAccessibility *)self _accessibilityViewController];
  id v5 = (id)objc_opt_class();

  if (([v5 isEqual:NSClassFromString(&cfstr_Uiemojiandstic.isa)] & 1) != 0
    || ([v5 isEqual:NSClassFromString(&cfstr_StickerkitLoca.isa)] & 1) != 0)
  {
    return 1;
  }
  v4.receiver = v7;
  v4.super_class = (Class)UIViewAccessibility;
  return [(UIViewAccessibility *)&v4 _accessibilityIsSoftwareKeyboardMimic];
}

- (BOOL)canBecomeFocused
{
  int v12 = self;
  SEL v11 = a2;
  char v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)UIViewAccessibility;
  char v10 = [(UIViewAccessibility *)&v9 canBecomeFocused];
  if ([(UIViewAccessibility *)v12 _accessibilityIsFKARunningForFocusItem]
    || ([(UIViewAccessibility *)v12 _accessibilityIsFocusForFocusEverywhereRunningForFocusItem] & 1) != 0)
  {
    if (v10) {
      char v10 = (-[UIViewAccessibility _axHasSingleFocusableSubview](v12) ^ 1) & 1;
    }
    if ((v10 & 1) == 0
      && ([(UIViewAccessibility *)v12 safeBoolForKey:@"_isFocusedOrAncestorOfFocusedView"] & 1) == 0)
    {
      id v8 = (id)[(UIViewAccessibility *)v12 _accessibilityGetBlockForAttribute:5010];
      if (v8)
      {
        char v10 = (*((uint64_t (**)(void))v8 + 2))() & 1;
      }
      else if ([(UIViewAccessibility *)v12 _accessibilityUnfocusableViewCanBeFocusedForFocusEverywhere])
      {
        char v10 = 1;
      }
      if ([(UIViewAccessibility *)v12 _accessibilityIsFKARunningForFocusItem]
        && ([(UIViewAccessibility *)v12 _accessibilityRemembersLastFocusedChild] & 1) != 0)
      {
        id location = [(UIViewAccessibility *)v12 _accessibilityLastFocusedChild];
        char v5 = 0;
        BOOL v4 = 0;
        if (location)
        {
          id v6 = (id)[location _accessibilityWindow];
          char v5 = 1;
          BOOL v4 = v6 != 0;
        }
        if (v5) {

        }
        if (v4) {
          char v10 = 1;
        }
        objc_storeStrong(&location, 0);
      }
      objc_storeStrong(&v8, 0);
    }
    if ((v10 & 1) == 0
      && [(UIViewAccessibility *)v12 _accessibilityIsFKARunningForFocusItem])
    {
      BOOL v3 = 0;
      if ([(UIViewAccessibility *)v12 isAccessibilityElement]) {
        BOOL v3 = [(UIViewAccessibility *)v12 accessibilityRespondsToUserInteraction];
      }
      char v10 = v3;
    }
    char v13 = v10 & 1;
  }
  else
  {
    char v13 = v10 & 1;
  }
  return v13 & 1;
}

- (uint64_t)_axHasSingleFocusableSubview
{
  id v8 = a1;
  if (a1)
  {
    id location = v8;
    while (1)
    {
      id v5 = (id)[location subviews];
      BOOL v6 = [v5 count] != 1;

      if (v6) {
        break;
      }
      id v4 = (id)[location subviews];
      id v1 = (id)[v4 firstObject];
      id v2 = location;
      id location = v1;

      if (([location safeBoolForKey:@"_isEligibleForFocusInteraction"] & 1) != 0
        && (([location canBecomeFocused] & 1) != 0 || (objc_msgSend(location, "isFocused") & 1) != 0))
      {
        char v9 = 1;
        goto LABEL_11;
      }
    }
    char v9 = 0;
LABEL_11:
    objc_storeStrong(&location, 0);
  }
  else
  {
    char v9 = 0;
  }
  return v9 & 1;
}

- (id)preferredFocusEnvironments
{
  v10[1] = *MEMORY[0x263EF8340];
  char v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)UIViewAccessibility;
  v8[0] = [(UIViewAccessibility *)&v7 preferredFocusEnvironments];
  if ([(UIViewAccessibility *)v9 _accessibilityIsFKARunningForFocusItem]
    && ([(UIViewAccessibility *)v9 _accessibilityRemembersLastFocusedChild] & 1) != 0)
  {
    id location = [(UIViewAccessibility *)v9 _accessibilityLastFocusedChild];
    if (location)
    {
      v10[0] = location;
      id v2 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
      id v3 = v8[0];
      v8[0] = v2;
    }
    objc_storeStrong(&location, 0);
  }
  id v5 = v8[0];
  objc_storeStrong(v8, 0);

  return v5;
}

- (id)_accessibilityLastFocusedChild
{
  char v13 = self;
  v12[1] = (id)a2;
  char v11 = 0;
  objc_opt_class();
  id v6 = (id)[(UIViewAccessibility *)v13 _axGetLastFocusedChild];
  id v10 = (id)__UIAccessibilityCastAsClass();

  id v9 = v10;
  objc_storeStrong(&v10, 0);
  v12[0] = v9;
  char v7 = 0;
  BOOL v5 = 0;
  if (v9)
  {
    BOOL v4 = 1;
    if (([v12[0] isHidden] & 1) == 0)
    {
      id v8 = (id)[v12[0] window];
      char v7 = 1;
      BOOL v4 = v8 == 0;
    }
    BOOL v5 = v4;
  }
  if (v7) {

  }
  if (v5) {
    [(UIViewAccessibility *)v13 _axSetLastFocusedChild:0];
  }
  id v3 = (id)[(UIViewAccessibility *)v13 _axGetLastFocusedChild];
  objc_storeStrong(v12, 0);

  return v3;
}

- (id)_childFocusViews
{
  int v74 = self;
  v73[1] = (id)a2;
  v72.receiver = self;
  v72.super_class = (Class)UIViewAccessibility;
  id v27 = [(UIViewAccessibility *)&v72 _childFocusViews];
  v73[0] = (id)[v27 mutableCopy];

  if ([(UIViewAccessibility *)v74 _accessibilityIsFKARunningForFocusItem])
  {
    if (![(UIViewAccessibility *)v74 accessibilityElementsHidden]
      && ([(UIViewAccessibility *)v74 _accessibilityFKAShouldProcessChildren] & 1) != 0)
    {
      if (![v73[0] count])
      {
        char v69 = 0;
        objc_opt_class();
        id v26 = (id)[(UIViewAccessibility *)v74 safeValueForKey:@"_viewDelegate"];
        id v68 = (id)__UIAccessibilityCastAsClass();

        id v67 = v68;
        objc_storeStrong(&v68, 0);
        id v70 = v67;
        id v66 = (id)[v67 presentedViewController];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v64 = 0;
          objc_opt_class();
          id v63 = (id)__UIAccessibilityCastAsClass();
          id v62 = v63;
          objc_storeStrong(&v63, 0);
          id v65 = v62;
          if (v62)
          {
            id v24 = (id)[v65 searchResultsController];
            char v60 = 0;
            char v58 = 0;
            char v56 = 0;
            char v54 = 0;
            char v52 = 0;
            char v25 = 1;
            if (v24)
            {
              id v61 = (id)[v65 view];
              char v60 = 1;
              id v59 = (id)[v65 searchResultsController];
              char v58 = 1;
              id v57 = (id)[v59 view];
              char v56 = 1;
              char v25 = 1;
              if (objc_msgSend(v61, "containsView:"))
              {
                id v55 = (id)[v65 searchResultsController];
                char v54 = 1;
                id v53 = (id)[v55 view];
                char v52 = 1;
                char v25 = [v53 isHidden];
              }
            }
            if (v52) {

            }
            if (v54) {
            if (v56)
            }

            if (v58) {
            if (v60)
            }

            if (v25)
            {
              id v22 = v73[0];
              id v23 = (id)[(UIViewAccessibility *)v74 subviews];
              objc_msgSend(v22, "axSafelyAddObjectsFromArray:");
            }
          }
          objc_storeStrong(&v65, 0);
        }
        else
        {
          id v20 = (id)[v70 presentedViewController];
          BOOL v21 = [v20 modalPresentationStyle] != 7;

          if (v21)
          {
            id v13 = (id)[v66 presentationController];
            NSClassFromString(&cfstr_Uicontextmenuu_0.isa);
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              id v11 = (id)[v66 presentationController];
              id v43 = (id)[v11 safeUIViewForKey:@"platterContainerView"];

              id v12 = v43;
              uint64_t v36 = MEMORY[0x263EF8330];
              int v37 = -1073741824;
              int v38 = 0;
              SEL v39 = __39__UIViewAccessibility__childFocusViews__block_invoke_2;
              long long v40 = &unk_2650AE790;
              id v41 = v74;
              id v42 = (id)[v12 _accessibilityFindAncestor:&v36 startWithSelf:0];
              if (v42) {
                [v73[0] axSafelyAddObject:v43];
              }
              objc_storeStrong(&v42, 0);
              objc_storeStrong((id *)&v41, 0);
              objc_storeStrong(&v43, 0);
            }
            else if (v66)
            {
              id v35 = (id)[v66 view];
              id v10 = v35;
              uint64_t v28 = MEMORY[0x263EF8330];
              int v29 = -1073741824;
              int v30 = 0;
              uint64_t v31 = __39__UIViewAccessibility__childFocusViews__block_invoke_3;
              double v32 = &unk_2650AE790;
              uint64_t v33 = v74;
              id v34 = (id)[v10 _accessibilityFindAncestor:&v28 startWithSelf:0];
              if (v34) {
                [v73[0] axSafelyAddObject:v35];
              }
              objc_storeStrong(&v34, 0);
              objc_storeStrong((id *)&v33, 0);
              objc_storeStrong(&v35, 0);
            }
          }
          else
          {
            id v18 = (id)[v70 presentedViewController];
            id v17 = (id)[v18 popoverPresentationController];
            id v51 = (id)[v17 passthroughViews];

            uint64_t v19 = v74;
            uint64_t v44 = MEMORY[0x263EF8330];
            int v45 = -1073741824;
            int v46 = 0;
            int v47 = __39__UIViewAccessibility__childFocusViews__block_invoke;
            id v48 = &unk_2650AE790;
            id v49 = v51;
            id v50 = (id)[(UIViewAccessibility *)v19 _accessibilityFindAncestor:&v44 startWithSelf:1];
            if (v50)
            {
              id v15 = v73[0];
              id v16 = (id)[(UIViewAccessibility *)v74 subviews];
              objc_msgSend(v15, "axSafelyAddObjectsFromArray:");
            }
            objc_storeStrong(&v50, 0);
            objc_storeStrong(&v49, 0);
            objc_storeStrong(&v51, 0);
          }
        }
        objc_storeStrong(&v66, 0);
        objc_storeStrong(&v70, 0);
      }
      BOOL v4 = (void *)MEMORY[0x263F1CB60];
      id v9 = (id)[v73[0] reverseObjectEnumerator];
      id v8 = (id)[v9 allObjects];
      id v7 = (id)objc_msgSend(v4, "_subviewsReplacedByModalViewSubviewsIfNecessary:");
      id v6 = (id)[v7 reverseObjectEnumerator];
      id v5 = (id)[v6 allObjects];
      id v75 = (id)objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_678);

      int v71 = 1;
    }
    else
    {
      id v75 = MEMORY[0x263EFFA68];
      int v71 = 1;
    }
  }
  else
  {
    id v75 = v73[0];
    int v71 = 1;
  }
  objc_storeStrong(v73, 0);
  id v2 = v75;

  return v2;
}

uint64_t __39__UIViewAccessibility__childFocusViews__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v4 = [a1[4] containsObject:location[0]];
  objc_storeStrong(location, 0);
  return v4 & 1;
}

BOOL __39__UIViewAccessibility__childFocusViews__block_invoke_2(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BOOL v4 = location[0] == a1[4];
  objc_storeStrong(location, 0);
  return v4;
}

BOOL __39__UIViewAccessibility__childFocusViews__block_invoke_3(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BOOL v4 = location[0] == a1[4];
  objc_storeStrong(location, 0);
  return v4;
}

uint64_t __39__UIViewAccessibility__childFocusViews__block_invoke_4(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] _accessibilityFKAShouldBeProcessed];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)_prefersFocusContainment
{
  char v3 = 1;
  if (([(UIViewAccessibility *)self conformsToProtocol:&unk_26F4AA928] & 1) == 0)
  {
    char v3 = 1;
    if (([(UIViewAccessibility *)self _accessibilityIsTouchContainer] & 1) == 0) {
      char v3 = [(UIViewAccessibility *)self shouldGroupAccessibilityChildren];
    }
  }
  return v3 & 1;
}

- (BOOL)_accessibilityUnfocusableViewCanBeFocusedForFocusEverywhere
{
  id v6 = self;
  SEL v5 = a2;
  if (([(UIViewAccessibility *)self _accessibilityIsFocusForFocusEverywhereRunningForFocusItem] & 1) == 0)return 0; {
  v4.receiver = v6;
  }
  v4.super_class = (Class)UIViewAccessibility;
  LOBYTE(v3) = 0;
  if (![(UIViewAccessibility *)&v4 canBecomeFocused])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), LOBYTE(v3) = 0, (objc_opt_isKindOfClass()))
    {
      LOBYTE(v3) = 0;
      if ([(UIViewAccessibility *)v6 isAccessibilityElement]) {
        int v3 = ![(UIViewAccessibility *)v6 _accessibilityIsInFocusableCell];
      }
    }
  }
  return v3 & 1;
}

- (BOOL)_accessibilityDisplayFocusIndicatorForFocusEverywhereView
{
  id v6 = self;
  v5[1] = (id)a2;
  v5[0] = (id)[(UIViewAccessibility *)self _accessibilityGetBlockForAttribute:5010];
  if ([(UIViewAccessibility *)v6 _accessibilityUnfocusableViewCanBeFocusedForFocusEverywhere]|| v5[0] && ((*((uint64_t (**)(void))v5[0] + 2))() & 1) != 0)
  {
    id location = (id)[(UIViewAccessibility *)v6 _accessibilityGetBlockForAttribute:5011];
    if (location)
    {
      char v7 = (*((uint64_t (**)(void))location + 2))() & 1;
    }
    else
    {
      objc_opt_class();
      char v7 = objc_opt_isKindOfClass() & 1;
    }
    int v4 = 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    char v7 = 0;
    int v4 = 1;
  }
  objc_storeStrong(v5, 0);
  return v7 & 1;
}

- (BOOL)_accessibilityPreventOcclusionForViewFromAboveFocusRegionForFocusEverywhereView
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UIViewAccessibility *)self _accessibilityGetBlockForAttribute:5012];
  if (location[0]) {
    char v4 = (*((uint64_t (**)(void))location[0] + 2))() & 1;
  }
  else {
    char v4 = 0;
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)_accessibilityFKAShouldBeProcessed
{
  if ([(UIViewAccessibility *)self _accessibilityViewIsVisible])
  {
    char v9 = 0;
    char v7 = 0;
    BOOL v6 = 0;
    if ((UIAccessibilityIsWidgetExtension() & 1) == 0)
    {
      objc_opt_class();
      BOOL v5 = 1;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v10 = (id)[(UIViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
        char v9 = 1;
        BOOL v5 = 1;
        if (!v10)
        {
          objc_opt_class();
          BOOL v5 = 1;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v8 = (id)[(UIViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
            char v7 = 1;
            BOOL v5 = v8 != 0;
          }
        }
      }
      BOOL v6 = v5;
    }
    if (v7) {

    }
    if (v9) {
    if (v6)
    }
    {
      return 1;
    }
    else
    {
      id v3 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityContainerToStopVisibilityCheck];
      char v4 = 0;
      if (!v3) {
        char v4 = [(UIViewAccessibility *)self _accessibilityIsFrameOutOfBounds];
      }

      return (v4 & 1) == 0;
    }
  }
  else
  {
    return 0;
  }
}

- (id)_accessibilityFocusRingTintColor
{
  char v7 = self;
  location[1] = (id)a2;
  v5.receiver = self;
  v5.super_class = (Class)UIViewAccessibility;
  location[0] = [(UIViewAccessibility *)&v5 _accessibilityFocusRingTintColor];
  if (location[0])
  {
    id v8 = location[0];
  }
  else
  {
    id v4 = (id)[(UIViewAccessibility *)v7 superview];
    id v8 = (id)[v4 _accessibilityFocusRingTintColor];
  }
  objc_storeStrong(location, 0);
  id v2 = v8;

  return v2;
}

- (id)_accessibilitySubviewMatchingFKAView:(void *)a1
{
  id v15 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v15)
  {
    id v12 = v15;
    id v4 = v15;
    uint64_t v5 = MEMORY[0x263EF8330];
    int v6 = -1073741824;
    int v7 = 0;
    id v8 = __60__UIViewAccessibility__accessibilitySubviewMatchingFKAView___block_invoke;
    char v9 = &unk_2650AF950;
    id v10 = location;
    id v11 = v12;
    id v16 = (id)[v4 _accessibilityFindSubviewDescendant:&v5];
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v10, 0);
    int v13 = 1;
    objc_storeStrong(&v12, 0);
  }
  else
  {
    id v16 = 0;
    int v13 = 1;
  }
  objc_storeStrong(&location, 0);
  id v2 = v16;

  return v2;
}

uint64_t __60__UIViewAccessibility__accessibilitySubviewMatchingFKAView___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v19 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v18 = 0;
    char v16 = 0;
    objc_opt_class();
    id v15 = (id)__UIAccessibilityCastAsClass();
    id v14 = v15;
    objc_storeStrong(&v15, 0);
    id v17 = v14;
    if (v14 && *(void *)(a1 + 32))
    {
      id v11 = v17;
      objc_msgSend(v17, "safeCGRectForKey:");
      objc_msgSend(v11, "convertRect:toView:", *(void *)(a1 + 40), v2, v3, v4, v5);
      id v12 = v17;
      [*(id *)(a1 + 32) safeCGRectForKey:@"_defaultFocusRegionFrame"];
      objc_msgSend(v12, "convertRect:toView:", *(void *)(a1 + 40), v6, v7, v8, v9);
      char v18 = AX_CGRectAlmostEqualToRect() & 1;
    }
    char v21 = v18 & 1;
    objc_storeStrong(&v17, 0);
  }
  else
  {
    char v21 = 0;
  }
  objc_storeStrong(location, 0);
  return v21 & 1;
}

- (id)_accessibilityViewMatchingFKAView:(void *)a3 inArray:
{
  uint64_t v17 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v15 = 0;
  objc_storeStrong(&v15, a3);
  if (v17)
  {
    id v5 = v15;
    uint64_t v8 = MEMORY[0x263EF8330];
    int v9 = -1073741824;
    int v10 = 0;
    id v11 = __65__UIViewAccessibility__accessibilityViewMatchingFKAView_inArray___block_invoke;
    id v12 = &unk_2650AE9C0;
    id v13 = location;
    id v6 = (id)objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &v8);
    id v18 = (id)[v6 firstObject];

    objc_storeStrong(&v13, 0);
  }
  else
  {
    id v18 = 0;
  }
  int v14 = 1;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&location, 0);
  double v3 = v18;

  return v3;
}

uint64_t __65__UIViewAccessibility__accessibilityViewMatchingFKAView_inArray___block_invoke(id *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v16 = a3;
  id v15 = a4;
  int v14 = a1;
  char v13 = 0;
  char v11 = 0;
  objc_opt_class();
  id v10 = (id)__UIAccessibilityCastAsClass();
  id v9 = v10;
  objc_storeStrong(&v10, 0);
  id v12 = v9;
  if (v9)
  {
    [v12 frame];
    [a1[4] frame];
    char v13 = AX_CGRectAlmostEqualToRect() & 1;
  }
  *id v15 = v13 & 1;
  char v5 = v13;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)_accessibilityIsDescendantOfHostingView
{
  id v2 = (id)[(UIViewAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_744 startWithSelf:0];
  BOOL v4 = v2 != 0;

  return v4;
}

uint64_t __62__UIViewAccessibility__accessibilityIsDescendantOfHostingView__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] _accessibilityIsSwiftUIHostingView];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

@end