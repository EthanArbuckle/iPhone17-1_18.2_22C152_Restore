@interface UIKeyboardLayoutStarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityFingerIsDown;
- (BOOL)_accessibilityHasBiasEscapeButton;
- (BOOL)_accessibilityKeyboardSupportsGestureMode;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityPerformEscape;
- (BOOL)canProduceString:(id)a3;
- (BOOL)isAccessibilityElement;
- (double)_axGetSortingNumberForEmojiCell:(uint64_t)a1;
- (id)_accessibilityBiasEscapeButton;
- (id)_accessibilityCreateElementForKey:(void *)a1;
- (id)_accessibilityGetKeyboardRowsByRowNumber;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityInternalData;
- (id)_accessibilityKeyElementForKey:(id)a3;
- (id)_accessibilityKeyboardKeyForString:(id)a3;
- (id)_accessibilityKeys;
- (id)_accessibilityScannerGroupElements;
- (id)_accessibilitySortedUnstoredKeys;
- (id)_accessibilityStickyPopupKeys;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)_accessibilityVisibleKeysByRow;
- (id)_accessibiltyAvailableKeyplanes;
- (id)_axKBModalView;
- (id)_rowNumberOverrideForSplitEmojiKey:(uint64_t)a1;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)atvGetKeyboardRowsByNumber;
- (id)atvGetOrderedRowsForRows:(id)a3 sortedRows:(id)a4 numRows:(int64_t)a5;
- (id)automationElements;
- (id)focusItemsInRect:(CGRect)a3;
- (id)iOSGetKeyboardRowsByNumber;
- (id)iOSGetOrderedRowsForRows:(id)a3 sortedRows:(id)a4 numRows:(int64_t)a5;
- (int64_t)accessibilityContainerType;
- (int64_t)accessibilityElementCount;
- (int64_t)accessibilityNavigationStyle;
- (int64_t)indexOfAccessibilityElement:(id)a3;
- (uint64_t)_accessibilityBiasEscapeButtonIsFirst;
- (uint64_t)_axIsWaitingForEmojiPopupAnnouncement;
- (uint64_t)_axSetIsWaitingForEmojiPopupAnnouncement:(uint64_t)result;
- (uint64_t)_isCapitalLetterKeyplane:(uint64_t)a1;
- (uint64_t)_isSmallLetterKeyplane:(uint64_t)a1;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityChangeToKeyplane:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityResetInternalData;
- (void)_accessibilitySetStickyPopupKeys:(uint64_t)a1;
- (void)_axClearReturnKeyLabel;
- (void)_axHandleEmojiPopupLayoutChangeAfterAnnouncement;
- (void)addContinuousPathPoint:(CGPoint)a3 withTimestamp:(double)a4;
- (void)continueFromInternationalActionForTouchUp:(id)a3 withActions:(unint64_t)a4 timestamp:(double)a5 interval:(double)a6 didLongPress:(BOOL)a7 prevActions:(unint64_t)a8 executionContext:(id)a9;
- (void)dealloc;
- (void)didBeginContinuousPath;
- (void)didMoveToWindow;
- (void)setActiveKey:(id)a3;
- (void)setKeyplaneName:(id)a3;
- (void)setLabel:(id)a3 forKey:(id)a4;
- (void)setReturnKeyEnabled:(BOOL)a3 withDisplayName:(id)a4 withType:(int)a5;
- (void)setState:(int)a3 forKey:(id)a4;
- (void)showPopupVariantsForKey:(id)a3;
- (void)showPopupView:(int64_t)a3 withKey:(id)a4 popupInfo:(id)a5 force:(BOOL)a6;
- (void)touchDown:(id)a3 executionContext:(id)a4;
- (void)touchDragged:(id)a3 executionContext:(id)a4;
- (void)touchUp:(id)a3 executionContext:(id)a4;
@end

@implementation UIKeyboardLayoutStarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardLayoutStar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityStickyPopupKeys
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UIKeyboardLayoutStarAccessibility___accessibilityStickyPopupKeys);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilitySetStickyPopupKeys:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v15 = location;
  id v14 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = @"UIKeyboardLayoutStar";
  v7 = @"UIKeyboardLayout";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"UIKBHandwritingCandidateView"];
  v9 = @"UIKeyboardEmojiCollectionInputView";
  objc_msgSend(location[0], "validateClass:");
  [location[0] validateClass:@"UIHandwritingAssistantView"];
  uint64_t v3 = "UIKBTree";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", @"UIKeyboardLayoutStar", @"_keyplane");
  [location[0] validateClass:@"UIKeyboardLayoutStar" hasInstanceVariable:@"_keyplaneView" withType:"UIKBKeyplaneView"];
  [location[0] validateClass:@"UIKeyboardLayoutStar" hasInstanceVariable:@"_gestureKeyboardIntroduction" withType:"UIGestureKeyboardIntroduction"];
  v4 = @"UIKBKeyplaneView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"UIKeyboardLayoutStar" hasInstanceVariable:@"_keyboard" withType:"UIKBTree"];
  [location[0] validateClass:@"UIKeyboardEmojiCollectionInputView" hasInstanceVariable:@"_collectionView" withType:"UIKeyboardEmojiCollectionView"];
  v10 = "B";
  [location[0] validateClass:@"UIKeyboardLayoutStar" hasInstanceMethod:@"isHandwritingPlane" withFullSignature:0];
  v11 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"viewForKey:", "@", 0);
  v8 = @"UIKBTree";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, 0);
  v5 = "{CGPoint=dd}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"keyHitTestClosestToPoint:", v11, "{CGPoint=dd}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"keyHitTestContainingPoint:", v11, v5, 0);
  v13 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"setLabel: forKey:", v11, v11, 0);
  v6 = "i";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"setReturnKeyEnabled: withDisplayName: withType:", v13, v10, v11, "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"setState: forKey:", v13, v6, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"touchDown:", v13, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"touchDown: executionContext:", v13, v11, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"touchDragged: executionContext:", v13, v11, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"touchUp:", v13, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"touchUp: executionContext:", v13, v11, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"keyHasAccentedVariants:", v10, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardKeyplaneTransition", @"setInitiallyAtEnd:", v13, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"selectedVariantIndex", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"modalDisplayView", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"tappedSkinToneEmoji", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"continueFromInternationalActionForTouchUp: withActions: timestamp: interval: didLongPress: prevActions: executionContext:", v13, v11, "Q", "d", "d", v10, "Q", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"setActiveKey:", v13, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"activeKey", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"didBeginContinuousPath", v13, 0);
  objc_storeStrong(v15, v14);
}

- (void)addContinuousPathPoint:(CGPoint)a3 withTimestamp:(double)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  CGPoint point = a3;
  v42 = self;
  SEL v41 = a2;
  double v40 = a4;
  v39.receiver = self;
  v39.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility addContinuousPathPoint:withTimestamp:](&v39, sel_addContinuousPathPoint_withTimestamp_, a3.x, a3.y, a4);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id location = [(UIKeyboardLayoutStarAccessibility *)v42 _accessibilityVisibleKeysByRow];
    uint64_t v37 = 0;
    memset(__b, 0, sizeof(__b));
    id obj = location;
    uint64_t v27 = [obj countByEnumeratingWithState:__b objects:v45 count:16];
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
        memset(&recta, 0, sizeof(recta));
        id v21 = (id)[v36 firstObject];
        [v21 frame];
        r1.origin.x = v4;
        r1.origin.y = v5;
        r1.size.width = v6;
        r1.size.height = v7;
        id v20 = (id)[v36 lastObject];
        [v20 frame];
        r2.origin.x = v8;
        r2.origin.y = v9;
        r2.size.width = v10;
        r2.size.height = v11;
        CGRect recta = CGRectUnion(r1, r2);

        if (CGRectContainsPoint(recta, point))
        {
          if (v37 != addContinuousPathPoint_withTimestamp__CurrentRow)
          {
            addContinuousPathPoint_withTimestamp__CurrentRow = v37;
            id v19 = (id)[MEMORY[0x263F22270] sharedManager];
            [v19 playHapticFeedbackForType:15];

            int v31 = 2;
            goto LABEL_23;
          }
          uint64_t v30 = 0;
          memset(v28, 0, sizeof(v28));
          id v17 = v36;
          uint64_t v18 = [v17 countByEnumeratingWithState:v28 objects:v44 count:16];
          if (v18)
          {
            uint64_t v14 = *(void *)v28[2];
            uint64_t v15 = 0;
            unint64_t v16 = v18;
            while (1)
            {
              uint64_t v13 = v15;
              if (*(void *)v28[2] != v14) {
                objc_enumerationMutation(v17);
              }
              id v29 = *(id *)(v28[1] + 8 * v15);
              [v29 frame];
              if (CGRectContainsPoint(v47, point) && v30 != addContinuousPathPoint_withTimestamp__CurrentKey) {
                break;
              }
              ++v30;
              ++v15;
              if (v13 + 1 >= v16)
              {
                uint64_t v15 = 0;
                unint64_t v16 = [v17 countByEnumeratingWithState:v28 objects:v44 count:16];
                if (!v16) {
                  goto LABEL_18;
                }
              }
            }
            addContinuousPathPoint_withTimestamp__CurrentKey = v30;
            id v12 = (id)[MEMORY[0x263F22270] sharedManager];
            [v12 playHapticFeedbackForType:14];

            int v31 = 4;
          }
          else
          {
LABEL_18:
            int v31 = 0;
          }
        }
        ++v37;
        ++v24;
        if (v22 + 1 >= v25)
        {
          uint64_t v24 = 0;
          unint64_t v25 = [obj countByEnumeratingWithState:__b objects:v45 count:16];
          if (!v25) {
            break;
          }
        }
      }
    }
    int v31 = 0;
LABEL_23:

    objc_storeStrong(&location, 0);
  }
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F813D0];
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  CGFloat v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  [(UIKeyboardLayoutStarAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v2 = (id)[(UIKeyboardLayoutStarAccessibility *)v7 safeValueForKey:@"_gestureKeyboardIntroduction"];
  [v2 _accessibilityLoadAccessibilityInformation];

  id v4 = accessibilityLocalizedString(@"keyboard.bias.escape.label");
  id v3 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](v7);
  [v3 setAccessibilityLabel:v4];
}

- (id)_accessibilityBiasEscapeButton
{
  id v7 = a1;
  if (a1)
  {
    char v6 = 0;
    objc_opt_class();
    id v3 = (id)[v7 safeValueForKey:@"_biasEscapeButton"];
    id v5 = (id)__UIAccessibilityCastAsClass();

    id v4 = v5;
    objc_storeStrong(&v5, 0);
    id v8 = v4;
  }
  else
  {
    id v8 = 0;
  }
  v1 = v8;

  return v1;
}

- (void)didMoveToWindow
{
  id v4 = self;
  SEL v3 = a2;
  [(UIKeyboardLayoutStarAccessibility *)self _accessibilityLoadAccessibilityInformation];
  v2.receiver = v4;
  v2.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  [(UIKeyboardLayoutStarAccessibility *)&v2 didMoveToWindow];
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v22 = self;
  SEL v21 = a2;
  if (AXDeviceIsPad() & 1) != 0 && (UIKeyboardSupportsSplit())
  {
    char v20 = [MEMORY[0x263F1C738] isSplit] & 1;
    UIKeyboardSetSplit();
    UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
    if (v20) {
      objc_super v2 = @"keyboard.unsplit";
    }
    else {
      objc_super v2 = @"keyboard.split";
    }
    id v12 = accessibilityLocalizedString(v2);
    UIAccessibilityPostNotification(notification, v12);

    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    char v23 = 1;
  }
  else
  {
    id v8 = (id)[MEMORY[0x263F1C710] activeKeyboard];
    id v9 = (id)[v8 defaultTextInputTraits];
    char v18 = 0;
    char v16 = 0;
    BOOL v10 = 0;
    if (([v9 isDevicePasscodeEntry] & 1) == 0)
    {
      id v19 = (id)[MEMORY[0x263F1C710] activeKeyboard];
      char v18 = 1;
      id v17 = (id)[v19 defaultTextInputTraits];
      char v16 = 1;
      BOOL v10 = [v17 keyboardType] != 127;
    }
    if (v16) {

    }
    if (v18) {
    if (!v10)
    }
      goto LABEL_20;
    char v15 = 0;
    if (AXUIKeyboardIsOOP())
    {
      id v7 = (id)[MEMORY[0x263F1C738] activeInstance];
      [v7 dismissKeyboard];

      char v15 = 1;
    }
    else
    {
      char v15 = [(id)*MEMORY[0x263F1D020] resignFirstResponder] & 1;
      if (!v15)
      {
        id v6 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityMainWindow];
        id v14 = (id)[v6 firstResponder];

        char v15 = [v14 resignFirstResponder] & 1;
        objc_storeStrong(&v14, 0);
      }
    }
    if (v15)
    {
      id v4 = (void *)MEMORY[0x263F21660];
      id v5 = accessibilityLocalizedString(@"keyboard.hidden");
      id v13 = (id)objc_msgSend(v4, "axAttributedStringWithString:");

      [v13 setAttribute:&unk_26F48EA50 forKey:*MEMORY[0x263F216D8]];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v13);
      char v23 = 1;
      objc_storeStrong(&v13, 0);
    }
    else
    {
LABEL_20:
      char v23 = 0;
    }
  }
  return v23 & 1;
}

- (id)_accessibilityCreateElementForKey:(void *)a1
{
  char v18 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v18)
  {
    id v3 = (id)[location name];
    char v14 = 0;
    char v4 = 1;
    if (([v3 isEqualToString:@"Emoji-Category-Control-Key"] & 1) == 0)
    {
      id v15 = (id)[location name];
      char v14 = 1;
      char v4 = [v15 hasPrefix:@"Emoji-InputView-"];
    }
    if (v14) {

    }
    if (v4)
    {
      uint64_t v7 = 0;
      id v8 = &v7;
      int v9 = 838860800;
      int v10 = 48;
      CGFloat v11 = __Block_byref_object_copy__15;
      id v12 = __Block_byref_object_dispose__15;
      id v13 = 0;
      v6[1] = &v7;
      id v5 = v18;
      v6[0] = location;
      AXPerformSafeBlock();
      id v19 = (id)v8[5];
      int v16 = 1;
      objc_storeStrong(v6, 0);
      objc_storeStrong(&v5, 0);
      _Block_object_dispose(&v7, 8);
      objc_storeStrong(&v13, 0);
    }
    else
    {
      id v19 = -[UIAccessibilityElementKBKey initWithAccessibilityContainer:key:](objc_allocWithZone((Class)UIAccessibilityElementKBKey), v18, location);
      int v16 = 1;
    }
  }
  else
  {
    id v19 = 0;
    int v16 = 1;
  }
  objc_storeStrong(&location, 0);
  return v19;
}

uint64_t __71__UIKeyboardLayoutStarAccessibility__accessibilityCreateElementForKey___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13[2] = (id)a1;
  v13[1] = (id)a1;
  id v9 = (id)[*(id *)(a1 + 32) safeValueForKey:@"_keyplaneView"];
  id v1 = (id)[v9 viewForKey:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v13[0] = (id)AXLogAppAccessibility();
    char v12 = 17;
    if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_FAULT))
    {
      log = v13[0];
      os_log_type_t type = v12;
      uint64_t v5 = *(void *)(a1 + 40);
      id v8 = (id)[*(id *)(a1 + 32) safeValueForKey:@"_keyplaneView"];
      id v11 = v8;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v14, v5, (uint64_t)v11);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Could not get view for key in keyplane: %@, %@", v14, 0x16u);

      objc_storeStrong(&v11, 0);
    }
    objc_storeStrong(v13, 0);
  }
  return [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setAccessibilityContainer:*(void *)(a1 + 32)];
}

- (BOOL)_accessibilityFingerIsDown
{
  id v3 = (id)[(UIKeyboardLayoutStarAccessibility *)self _accessibilityValueForKey:@"IsFingerDown"];
  LOBYTE(v4) = 0;
  if ([v3 BOOLValue]) {
    int v4 = [(UIKeyboardLayoutStarAccessibility *)self _accessibilityBoolValueForKey:@"IsActivatingAXKey"] ^ 1;
  }

  return v4 & 1;
}

- (void)touchDown:(id)a3 executionContext:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  [(UIKeyboardLayoutStarAccessibility *)&v5 touchDown:location[0] executionContext:v6];
  [(UIKeyboardLayoutStarAccessibility *)v8 _accessibilitySetRetainedValue:*MEMORY[0x263EFFB40] forKey:@"IsFingerDown"];
  [(UIKeyboardLayoutStarAccessibility *)v8 _accessibilitySetIntegerValue:-1 forKey:@"AXSpokenVariant"];
  UIAccessibilityPostNotification(0xFA2u, &unk_26F48EC80);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)touchUp:(id)a3 executionContext:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  [(UIKeyboardLayoutStarAccessibility *)&v5 touchUp:location[0] executionContext:v6];
  [(UIKeyboardLayoutStarAccessibility *)v8 _accessibilitySetRetainedValue:*MEMORY[0x263EFFB38] forKey:@"IsFingerDown"];
  [(UIKeyboardLayoutStarAccessibility *)v8 _accessibilitySetBoolValue:0 forKey:@"IsActivatingAXKey"];
  _UIAXSetLastKeyboardUsed();
  UIAccessibilityPostNotification(0xFA2u, &unk_26F48ECA8);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)touchDragged:(id)a3 executionContext:(id)a4
{
  uint64_t v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    char v18 = 0;
    id v6 = (id)[(UIKeyboardLayoutStarAccessibility *)v24 safeValueForKey:@"activeKey"];
    id v17 = (id)__UIAccessibilitySafeClass();

    id v16 = v17;
    objc_storeStrong(&v17, 0);
    id v19 = v16;
    uint64_t v15 = [(UIKeyboardLayoutStarAccessibility *)v24 _accessibilityIntegerValueForKey:@"AXSpokenVariant"];
    v14.receiver = v24;
    v14.super_class = (Class)UIKeyboardLayoutStarAccessibility;
    [(UIKeyboardLayoutStarAccessibility *)&v14 touchDragged:location[0] executionContext:v22];
    unint64_t v13 = (int)[v19 safeIntForKey:@"displayTypeHint"];
    id v12 = (id)[v19 safeArrayForKey:@"subtrees"];
    if (v13 == v15)
    {
      int v20 = 1;
    }
    else
    {
      [(UIKeyboardLayoutStarAccessibility *)v24 _accessibilitySetIntegerValue:v13 forKey:@"AXSpokenVariant"];
      if (v13 < [v12 count])
      {
        id v11 = (id)[v12 objectAtIndex:v13];
        id v10 = -[UIKeyboardLayoutStarAccessibility _accessibilityCreateElementForKey:](v24, v11);
        id v9 = (id)[v10 accessibilityLabel];
        id argument = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v9];
        id v4 = argument;
        id v5 = (id)[v10 accessibilityLanguage];
        objc_msgSend(v4, "setAttribute:forKey:");

        UIAccessibilityPostNotification(*MEMORY[0x263F812E8], argument);
        objc_storeStrong(&argument, 0);
        objc_storeStrong(&v9, 0);
        objc_storeStrong(&v10, 0);
        objc_storeStrong(&v11, 0);
      }
      int v20 = 0;
    }
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    v21.receiver = v24;
    v21.super_class = (Class)UIKeyboardLayoutStarAccessibility;
    [(UIKeyboardLayoutStarAccessibility *)&v21 touchDragged:location[0] executionContext:v22];
    int v20 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (uint64_t)_axIsWaitingForEmojiPopupAnnouncement
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)_axSetIsWaitingForEmojiPopupAnnouncement:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

- (void)_axHandleEmojiPopupLayoutChangeAfterAnnouncement
{
  id v6 = self;
  location[1] = (id)a2;
  if (-[UIKeyboardLayoutStarAccessibility _axIsWaitingForEmojiPopupAnnouncement]((uint64_t)self))
  {
    location[0] = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v6);
    if ([location[0] count])
    {
      UIAccessibilityNotifications notification = *MEMORY[0x263F1CE18];
      id v4 = (id)[location[0] firstObject];
      UIAccessibilityPostNotification(notification, v4);
    }
    -[UIKeyboardLayoutStarAccessibility _axSetIsWaitingForEmojiPopupAnnouncement:]((uint64_t)v6);
    id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
    objc_msgSend(v2, "removeObserver:name:object:", v6, *MEMORY[0x263F1CDB0]);

    objc_storeStrong(location, 0);
  }
}

- (void)continueFromInternationalActionForTouchUp:(id)a3 withActions:(unint64_t)a4 timestamp:(double)a5 interval:(double)a6 didLongPress:(BOOL)a7 prevActions:(unint64_t)a8 executionContext:(id)a9
{
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v40 = a4;
  double v39 = a5;
  double v38 = a6;
  BOOL v37 = a7;
  unint64_t v36 = a8;
  id v35 = 0;
  objc_storeStrong(&v35, a9);
  v34.receiver = v42;
  v34.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  [(UIKeyboardLayoutStarAccessibility *)&v34 continueFromInternationalActionForTouchUp:location[0] withActions:v40 timestamp:v37 interval:v36 didLongPress:v35 prevActions:v39 executionContext:v38];
  char v32 = 0;
  objc_opt_class();
  id v22 = (id)[(UIKeyboardLayoutStarAccessibility *)v42 safeValueForKey:@"activeKey"];
  id v31 = (id)__UIAccessibilityCastAsClass();

  id v30 = v31;
  objc_storeStrong(&v31, 0);
  id v33 = v30;
  if (v30 && [v33 variantType] == 10)
  {
    id v29 = (id)[(UIKeyboardLayoutStarAccessibility *)v42 _accessibilityDescendantOfType:NSClassFromString(&cfstr_Uikeyboardemoj_11.isa)];
    char v27 = 0;
    objc_opt_class();
    id v15 = (id)[v29 safeValueForKey:@"_collectionView"];
    id v26 = (id)__UIAccessibilityCastAsClass();

    id v25 = v26;
    objc_storeStrong(&v26, 0);
    id v14 = (id)[v29 safeValueForKey:@"tappedSkinToneEmoji"];
    id v28 = (id)objc_msgSend(v25, "cellForItemAtIndexPath:");

    id v24 = (id)[v28 _accessibilityVariantKeys];
    -[UIKeyboardLayoutStarAccessibility _accessibilitySetStickyPopupKeys:]((uint64_t)v42, v24);
    if (UIAccessibilityIsVoiceOverRunning())
    {
      UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
      id v12 = accessibilityLocalizedString(@"emoji.variants.alert");
      UIAccessibilityPostNotification(notification, v12);

      -[UIKeyboardLayoutStarAccessibility _axSetIsWaitingForEmojiPopupAnnouncement:]((uint64_t)v42);
      id v13 = (id)[MEMORY[0x263F08A00] defaultCenter];
      objc_msgSend(v13, "addObserver:selector:name:object:", v42, sel__axHandleEmojiPopupLayoutChangeAfterAnnouncement, *MEMORY[0x263F1CDB0]);

      char v23 = v42;
      AXPerformBlockOnMainThreadAfterDelay();
      objc_storeStrong((id *)&v23, 0);
    }
    else
    {
      UIAccessibilityNotifications v9 = *MEMORY[0x263F1CE18];
      id v10 = (id)[v24 firstObject];
      UIAccessibilityPostNotification(v9, v10);
    }
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

uint64_t __152__UIKeyboardLayoutStarAccessibility_continueFromInternationalActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axHandleEmojiPopupLayoutChangeAfterAnnouncement", a1, a1);
}

- (void)setActiveKey:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  [(UIKeyboardLayoutStarAccessibility *)&v6 setActiveKey:location[0]];
  char v4 = 0;
  BOOL v3 = 0;
  if (!location[0])
  {
    id v5 = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v8);
    char v4 = 1;
    BOOL v3 = v5 != 0;
  }
  if (v4) {

  }
  if (v3)
  {
    -[UIKeyboardLayoutStarAccessibility _accessibilitySetStickyPopupKeys:]((uint64_t)v8, 0);
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  objc_storeStrong(location, 0);
}

- (id)_accessibilityInternalData
{
  id v4 = a1;
  if (a1)
  {
    id v3 = (id)[v4 _accessibilityValueForKey:@"AXInternalData"];
    if (!v3)
    {
      id v3 = (id)[objc_allocWithZone(MEMORY[0x263EFF9A0]) init];

      [v4 _accessibilitySetRetainedValue:v3 forKey:@"AXInternalData"];
    }
    id v5 = v3;
    objc_storeStrong(&v3, 0);
  }
  else
  {
    id v5 = 0;
  }
  id v1 = v5;

  return v1;
}

- (void)_accessibilityResetInternalData
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v11 = a1;
  if (a1)
  {
    id location = -[UIKeyboardLayoutStarAccessibility _accessibilityInternalData](v11);
    memset(__b, 0, sizeof(__b));
    id obj = location;
    uint64_t v7 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
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
        uint64_t v9 = *(void *)(__b[1] + 8 * v4);
        id v1 = (id)[location objectForKey:v9];
        [v1 setAccessibilityContainer:0];

        ++v4;
        if (v2 + 1 >= v5)
        {
          uint64_t v4 = 0;
          unint64_t v5 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
          if (!v5) {
            break;
          }
        }
      }
    }

    [v11 _accessibilityRemoveValueForKey:@"AXInternalData"];
    [v11 _accessibilityRemoveValueForKey:@"AXInternalStoredKeyOrder"];
    [v11 _accessibilityRemoveValueForKey:@"kAXStoredVisibleKeysByRow"];
    objc_storeStrong(&location, 0);
  }
}

- (void)dealloc
{
  uint64_t v4 = self;
  SEL v3 = a2;
  -[UIKeyboardLayoutStarAccessibility _accessibilityResetInternalData](self);
  v2.receiver = v4;
  v2.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  [(UIKeyboardLayoutStarAccessibility *)&v2 dealloc];
}

- (BOOL)accessibilityElementsHidden
{
  LOBYTE(v3) = 0;
  if (([(id)*MEMORY[0x263F1D020] _accessibilitySoftwareKeyboardActive] & 1) == 0) {
    int v3 = AXProcessIsStickerPickerService() ^ 1;
  }
  return v3 & 1;
}

- (BOOL)_accessibilityKeyboardSupportsGestureMode
{
  return 1;
}

- (id)_accessibilityKeyboardKeyForString:(id)a3
{
  int v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  int v14 = 838860800;
  int v15 = 48;
  id v16 = __Block_byref_object_copy__15;
  id v17 = __Block_byref_object_dispose__15;
  id v18 = 0;
  unint64_t v5 = v20;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __72__UIKeyboardLayoutStarAccessibility__accessibilityKeyboardKeyForString___block_invoke;
  id v10 = &unk_2650AEEA8;
  v11[0] = location[0];
  v11[1] = &v12;
  [(UIKeyboardLayoutStarAccessibility *)v5 accessibilityEnumerateContainerElementsUsingBlock:&v6];
  id v4 = (id)v13[5];
  objc_storeStrong(v11, 0);
  _Block_object_dispose(&v12, 8);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);

  return v4;
}

void __72__UIKeyboardLayoutStarAccessibility__accessibilityKeyboardKeyForString___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v47 = a3;
  uint64_t v46 = a4;
  uint64_t v45 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v43 = location[0];
    id v10 = (id)[v43 accessibilityLabel];
    char v11 = 0;
    if ([v10 isEqualToString:*(void *)(a1 + 32)]) {
      char v11 = [v43 isAccessibilityElement];
    }

    if (v11) {
      goto LABEL_53;
    }
    char v41 = 0;
    char v39 = 0;
    char v9 = 0;
    if ([*(id *)(a1 + 32) isEqualToString:@"\n"])
    {
      id v42 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v43);
      char v41 = 1;
      id v40 = (id)[v42 name];
      char v39 = 1;
      char v9 = [v40 isEqualToString:@"Return-Key"];
    }
    if (v39) {

    }
    if (v41) {
    if (v9)
    }
      goto LABEL_53;
    char v37 = 0;
    char v35 = 0;
    char v33 = 0;
    char v31 = 0;
    char v29 = 0;
    char v27 = 0;
    char v8 = 0;
    if ([*(id *)(a1 + 32) isEqualToString:@" "])
    {
      id v38 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v43);
      char v37 = 1;
      id v36 = (id)[v38 name];
      char v35 = 1;
      char v7 = 1;
      if (([v36 isEqualToString:@"Space-Key"] & 1) == 0)
      {
        id v34 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v43);
        char v33 = 1;
        id v32 = (id)[v34 name];
        char v31 = 1;
        char v7 = 1;
        if (([v32 isEqualToString:@"Unlabeled-Space-Key"] & 1) == 0)
        {
          id v30 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v43);
          char v29 = 1;
          id v28 = (id)[v30 name];
          char v27 = 1;
          char v7 = [v28 isEqualToString:@"Monolith-Space-Key"];
        }
      }
      char v8 = v7;
    }
    if (v27) {

    }
    if (v29) {
    if (v31)
    }

    if (v33) {
    if (v35)
    }

    if (v37) {
    if (v8)
    }
      goto LABEL_53;
    char v25 = 0;
    char v23 = 0;
    char v21 = 0;
    char v19 = 0;
    char v6 = 0;
    if ([*(id *)(a1 + 32) isEqualToString:@"\b"])
    {
      id v26 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v43);
      char v25 = 1;
      id v24 = (id)[v26 name];
      char v23 = 1;
      char v5 = 1;
      if (([v24 isEqualToString:@"Delete-Key"] & 1) == 0)
      {
        id v22 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v43);
        char v21 = 1;
        id v20 = (id)[v22 name];
        char v19 = 1;
        char v5 = [v20 isEqualToString:@"Monolith-Linear-Delete-Key"];
      }
      char v6 = v5;
    }
    if (v19) {

    }
    if (v21) {
    if (v23)
    }

    if (v25) {
    if (v6)
    }
      goto LABEL_53;
    char v17 = 0;
    char v15 = 0;
    char v4 = 0;
    if ([*(id *)(a1 + 32) isEqualToString:@"&"])
    {
      id v18 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v43);
      char v17 = 1;
      id v16 = (id)[v18 name];
      char v15 = 1;
      char v4 = [v16 isEqualToString:@"Ampersand"];
    }
    if (v15) {

    }
    if (v17) {
    if (v4)
    }
    {
LABEL_53:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v43);
      *uint64_t v46 = 1;
    }
    objc_storeStrong(&v43, 0);
    int v44 = 0;
  }
  else
  {
    int v44 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityChangeToKeyplane:(id)a3
{
  char v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v3 = (id)[(UIKeyboardLayoutStarAccessibility *)v6 keyplaneNamed:location[0]];
    [(UIKeyboardLayoutStarAccessibility *)v6 changeToKeyplane:v3];
    [(UIKeyboardLayoutStarAccessibility *)v6 _accessibilityRemoveValueForKey:@"AXInternalStoredKeyOrder"];
    objc_storeStrong(&v3, 0);
    int v4 = 0;
  }
  else
  {
    int v4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)_accessibiltyAvailableKeyplanes
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v16 = self;
  v15[1] = (id)a2;
  v15[0] = (id)[MEMORY[0x263EFF980] array];
  memset(__b, 0, sizeof(__b));
  id v10 = (id)[(UIKeyboardLayoutStarAccessibility *)v16 safeValueForKey:@"keyboard"];
  id obj = (id)[v10 safeValueForKey:@"subtrees"];

  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
  if (v12)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    unint64_t v9 = v12;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(id *)(__b[1] + 8 * v8);
      id v4 = v15[0];
      id v5 = (id)[v14 name];
      objc_msgSend(v4, "addObject:");

      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  id v3 = v15[0];
  objc_storeStrong(v15, 0);

  return v3;
}

- (id)_accessibilityKeys
{
  uint64_t v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)[(UIKeyboardLayoutStarAccessibility *)self _accessibilityValueForKey:@"AXInternalStoredKeyOrder"];
  if (!v7[0])
  {
    v7[0] = [(UIKeyboardLayoutStarAccessibility *)v8 _accessibilitySortedUnstoredKeys];

    [(UIKeyboardLayoutStarAccessibility *)v8 _accessibilitySetRetainedValue:v7[0] forKey:@"AXInternalStoredKeyOrder"];
    id v6 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
    id v5 = (id)[v6 currentInputMode];
    id v4 = (id)[v5 primaryLanguage];
    -[UIKeyboardLayoutStarAccessibility _accessibilitySetRetainedValue:forKey:](v8, "_accessibilitySetRetainedValue:forKey:");
  }
  id v3 = v7[0];
  objc_storeStrong(v7, 0);

  return v3;
}

- (id)_accessibilityVisibleKeysByRow
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  v50 = self;
  v49[1] = (id)a2;
  v49[0] = (id)[(UIKeyboardLayoutStarAccessibility *)self _accessibilityValueForKey:@"kAXStoredVisibleKeysByRow"];
  if (!v49[0])
  {
    id v48 = [(UIKeyboardLayoutStarAccessibility *)v50 _accessibilityKeys];
    id v47 = (id)[MEMORY[0x263EFF980] array];
    memset(__b, 0, sizeof(__b));
    id obj = v48;
    uint64_t v30 = [obj countByEnumeratingWithState:__b objects:v53 count:16];
    if (v30)
    {
      uint64_t v26 = *(void *)__b[2];
      uint64_t v27 = 0;
      unint64_t v28 = v30;
      while (1)
      {
        uint64_t v25 = v27;
        if (*(void *)__b[2] != v26) {
          objc_enumerationMutation(obj);
        }
        id v46 = *(id *)(__b[1] + 8 * v27);
        if ([v46 visible])
        {
          long long v43 = 0u;
          long long v44 = 0u;
          [v46 frame];
          *(void *)&long long v43 = v2;
          *((void *)&v43 + 1) = v3;
          *(void *)&long long v44 = v4;
          *((void *)&v44 + 1) = v5;
          char v42 = 0;
          memset(v40, 0, sizeof(v40));
          id v23 = v47;
          uint64_t v24 = [v23 countByEnumeratingWithState:v40 objects:v52 count:16];
          if (v24)
          {
            uint64_t v20 = *(void *)v40[2];
            uint64_t v21 = 0;
            unint64_t v22 = v24;
            while (1)
            {
              uint64_t v19 = v21;
              if (*(void *)v40[2] != v20) {
                objc_enumerationMutation(v23);
              }
              id v41 = *(id *)(v40[1] + 8 * v21);
              id location = (id)[v41 firstObject];
              double v18 = *((double *)&v43 + 1);
              [location frame];
              uint64_t v35 = v6;
              double v36 = v7;
              uint64_t v37 = v8;
              uint64_t v38 = v9;
              if (CGFAbs_0(v18 - v7) >= 0.001)
              {
                int v34 = 0;
              }
              else
              {
                [v41 addObject:v46];
                char v42 = 1;
                int v34 = 4;
              }
              objc_storeStrong(&location, 0);
              if (v34) {
                break;
              }
              ++v21;
              if (v19 + 1 >= v22)
              {
                uint64_t v21 = 0;
                unint64_t v22 = [v23 countByEnumeratingWithState:v40 objects:v52 count:16];
                if (!v22) {
                  goto LABEL_17;
                }
              }
            }
          }
          else
          {
LABEL_17:
            int v34 = 0;
          }

          if ((v42 & 1) == 0)
          {
            id v33 = (id)[MEMORY[0x263EFF980] arrayWithObject:v46];
            [v47 addObject:v33];
            objc_storeStrong(&v33, 0);
          }
        }
        ++v27;
        if (v25 + 1 >= v28)
        {
          uint64_t v27 = 0;
          unint64_t v28 = [obj countByEnumeratingWithState:__b objects:v53 count:16];
          if (!v28) {
            break;
          }
        }
      }
    }

    memset(v31, 0, sizeof(v31));
    id v16 = v47;
    uint64_t v17 = [v16 countByEnumeratingWithState:v31 objects:v51 count:16];
    if (v17)
    {
      uint64_t v13 = *(void *)v31[2];
      uint64_t v14 = 0;
      unint64_t v15 = v17;
      while (1)
      {
        uint64_t v12 = v14;
        if (*(void *)v31[2] != v13) {
          objc_enumerationMutation(v16);
        }
        id v32 = *(id *)(v31[1] + 8 * v14);
        [v32 sortUsingComparator:&__block_literal_global_24];
        ++v14;
        if (v12 + 1 >= v15)
        {
          uint64_t v14 = 0;
          unint64_t v15 = [v16 countByEnumeratingWithState:v31 objects:v51 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }

    [v47 sortUsingComparator:&__block_literal_global_550];
    [(UIKeyboardLayoutStarAccessibility *)v50 _accessibilitySetRetainedValue:v47 forKey:@"kAXStoredVisibleKeysByRow"];
    objc_storeStrong(v49, v47);
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v48, 0);
  }
  id v11 = v49[0];
  int v34 = 1;
  objc_storeStrong(v49, 0);

  return v11;
}

uint64_t __67__UIKeyboardLayoutStarAccessibility__accessibilityVisibleKeysByRow__block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  [location[0] frame];
  double v7 = v3;
  [v8 frame];
  if (v7 >= v4) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = -1;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

uint64_t __67__UIKeyboardLayoutStarAccessibility__accessibilityVisibleKeysByRow__block_invoke_2(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v11 = 0;
  objc_storeStrong(&v11, a3);
  id v9 = (id)[location[0] firstObject];
  [v9 frame];
  double v8 = v3;
  id v7 = (id)[v11 firstObject];
  [v7 frame];
  BOOL v10 = v8 >= v4;

  if (v10) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = -1;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (id)_accessibilitySortedUnstoredKeys
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v32 = self;
  v31[1] = (id)a2;
  v31[0] = (id)[(UIKeyboardLayoutStarAccessibility *)self safeValueForKey:@"keyplane"];
  id v30 = 0;
  if ([(UIKeyboardLayoutStarAccessibility *)v32 _accessibilityIsRTL])
  {
    char v29 = 0;
    objc_opt_class();
    id v17 = (id)[v31[0] safeValueForKey:@"keys"];
    id v28 = (id)__UIAccessibilityCastAsClass();

    id v27 = v28;
    objc_storeStrong(&v28, 0);
    id v2 = (id)[v27 sortedArrayUsingFunction:accessibilityRTLKeyPositionSort context:0];
    id v3 = v30;
    id v30 = v2;
  }
  else
  {
    char v26 = 0;
    objc_opt_class();
    id v16 = (id)[v31[0] safeValueForKey:@"keysOrderedByPositionWithoutZip"];
    id v25 = (id)__UIAccessibilityCastAsClass();

    id v24 = v25;
    objc_storeStrong(&v25, 0);
    id v4 = v30;
    id v30 = v24;
  }
  id v13 = (id)[MEMORY[0x263EFF9D8] orderedSetWithArray:v30];
  id v12 = (id)[v13 array];
  id v23 = (id)[v12 mutableCopy];

  memset(__b, 0, sizeof(__b));
  id obj = v30;
  uint64_t v15 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
  if (v15)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v15;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v22 = *(id *)(__b[1] + 8 * v10);
      char v20 = 0;
      objc_opt_class();
      char v20 = objc_opt_isKindOfClass() & 1;
      char v19 = 1;
      if (!v20 || ([v22 visible] & 1) == 0 || (v19 & 1) == 0)
      {
        if ((v20 & 1) == 0)
        {
          os_log_t oslog = (os_log_t)(id)AXLogCommon();
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            log = oslog;
            __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v22);
            _os_log_error_impl(&dword_2402B7000, log, OS_LOG_TYPE_ERROR, "Unexpected kb tree: %@", v33, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        [v23 removeObject:v22];
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  id v6 = (id)[v23 copy];
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(v31, 0);

  return v6;
}

- (void)_axClearReturnKeyLabel
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v20 = a1;
  if (a1)
  {
    memset(__b, 0, sizeof(__b));
    id v6 = -[UIKeyboardLayoutStarAccessibility _accessibilityInternalData](v20);
    id obj = (id)[v6 allValues];

    uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
    if (v8)
    {
      uint64_t v3 = *(void *)__b[2];
      uint64_t v4 = 0;
      unint64_t v5 = v8;
      while (1)
      {
        uint64_t v2 = v4;
        if (*(void *)__b[2] != v3) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(id *)(__b[1] + 8 * v4);
        objc_opt_class();
        char v13 = 0;
        char v11 = 0;
        char v9 = 0;
        char v1 = 0;
        if (objc_opt_isKindOfClass())
        {
          char v17 = 0;
          objc_opt_class();
          id v16 = (id)__UIAccessibilityCastAsClass();
          if (v17) {
            abort();
          }
          id v15 = v16;
          objc_storeStrong(&v16, 0);
          id v14 = v15;
          char v13 = 1;
          id v12 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v15);
          char v11 = 1;
          id v10 = (id)[v12 name];
          char v9 = 1;
          char v1 = [v10 isEqualToString:@"Return-Key"];
        }
        if (v9) {

        }
        if (v11) {
        if (v13)
        }

        if (v1) {
          [v19 setAccessibilityLabel:0];
        }
        ++v4;
        if (v2 + 1 >= v5)
        {
          uint64_t v4 = 0;
          unint64_t v5 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
          if (!v5) {
            break;
          }
        }
      }
    }
  }
}

- (void)setLabel:(id)a3 forKey:(id)a4
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  [(UIKeyboardLayoutStarAccessibility *)&v5 setLabel:location[0] forKey:v6];
  if ([v6 isEqualToString:*MEMORY[0x263F1D450]]) {
    -[UIKeyboardLayoutStarAccessibility _axClearReturnKeyLabel](v8);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)setReturnKeyEnabled:(BOOL)a3 withDisplayName:(id)a4 withType:(int)a5
{
  char v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  int v7 = a5;
  v6.receiver = v11;
  v6.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  [(UIKeyboardLayoutStarAccessibility *)&v6 setReturnKeyEnabled:v9 withDisplayName:location withType:a5];
  -[UIKeyboardLayoutStarAccessibility _axClearReturnKeyLabel](v11);
  objc_storeStrong(&location, 0);
}

- (uint64_t)_isCapitalLetterKeyplane:(uint64_t)a1
{
  uint64_t v5 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    id v3 = (id)[location lowercaseString];
    char v6 = [v3 hasSuffix:@"capital-letters"] & 1;
  }
  else
  {
    char v6 = 0;
  }
  objc_storeStrong(&location, 0);
  return v6 & 1;
}

- (uint64_t)_isSmallLetterKeyplane:(uint64_t)a1
{
  uint64_t v5 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    id v3 = (id)[location lowercaseString];
    char v6 = [v3 hasSuffix:@"small-letters"] & 1;
  }
  else
  {
    char v6 = 0;
  }
  objc_storeStrong(&location, 0);
  return v6 & 1;
}

- (void)setKeyplaneName:(id)a3
{
  uint64_t v54 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v52 = 0;
  uint64_t v47 = 0;
  id v48 = &v47;
  int v49 = 0x20000000;
  int v50 = 32;
  uint64_t v51 = 0;
  id v3 = [(UIKeyboardLayoutStarAccessibility *)v54 _accessibilityKeys];
  id v4 = v52;
  id v52 = v3;

  v41[1] = (id)MEMORY[0x263EF8330];
  int v42 = -1073741824;
  int v43 = 0;
  long long v44 = __53__UIKeyboardLayoutStarAccessibility_setKeyplaneName___block_invoke;
  uint64_t v45 = &unk_2650AEB20;
  id v46 = &v47;
  objc_msgSend(v52, "enumerateObjectsUsingBlock:");
  v41[0] = (id)[(UIKeyboardLayoutStarAccessibility *)v54 safeValueForKey:@"_keyplane"];
  id v40 = (id)[(UIKeyboardLayoutStarAccessibility *)v54 safeValueForKey:@"keyplaneName"];
  v39.receiver = v54;
  v39.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  [(UIKeyboardLayoutStarAccessibility *)&v39 setKeyplaneName:location[0]];
  id v38 = (id)[(UIKeyboardLayoutStarAccessibility *)v54 safeValueForKey:@"_keyplane"];
  if (v41[0] == v38)
  {
    int v37 = 1;
  }
  else
  {
    id v36 = [(UIKeyboardLayoutStarAccessibility *)v54 _accessibilityKeys];
    char v35 = 0;
    if ((-[UIKeyboardLayoutStarAccessibility _isCapitalLetterKeyplane:]((uint64_t)v54, v40) & 1) != 0
      && (-[UIKeyboardLayoutStarAccessibility _isSmallLetterKeyplane:]((uint64_t)v54, location[0]) & 1) != 0
      || (-[UIKeyboardLayoutStarAccessibility _isCapitalLetterKeyplane:]((uint64_t)v54, location[0]) & 1) != 0
      && (-[UIKeyboardLayoutStarAccessibility _isSmallLetterKeyplane:]((uint64_t)v54, v40) & 1) != 0)
    {
      char v35 = 1;
    }
    uint64_t v30 = 0;
    char v31 = &v30;
    int v32 = 0x20000000;
    int v33 = 32;
    uint64_t v34 = 0;
    uint64_t v24 = MEMORY[0x263EF8330];
    int v25 = -1073741824;
    int v26 = 0;
    id v27 = __53__UIKeyboardLayoutStarAccessibility_setKeyplaneName___block_invoke_2;
    id v28 = &unk_2650AEB20;
    char v29 = &v30;
    objc_msgSend(v36, "enumerateObjectsUsingBlock:");
    char v23 = 0;
    BOOL v14 = 1;
    if (v35) {
      BOOL v14 = v48[3] != v31[3];
    }
    char v23 = v14;
    if (v14)
    {
      id v13 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
      id v12 = (id)[v13 currentInputMode];
      id v11 = (id)[v12 primaryLanguage];
      id v9 = (id)[(UIKeyboardLayoutStarAccessibility *)v54 _accessibilityValueForKey:@"AXCurrentLanguage"];
      char v10 = objc_msgSend(v11, "isEqualToString:");

      if ((v10 & 1) == 0) {
        char v23 = 1;
      }
    }
    id v8 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
    id v7 = (id)[v8 currentInputMode];
    id v22 = (id)[v7 primaryLanguage];

    if (!UIAccessibilityIsVoiceOverRunning()
      || (v35 & 1) != 0
      && (([v22 hasPrefix:@"th"] & 1) != 0
       || ([v22 hasPrefix:@"hi"] & 1) != 0
       || ([v22 hasPrefix:@"ko"] & 1) != 0))
    {
      char v23 = 1;
    }
    if (v23)
    {
      -[UIKeyboardLayoutStarAccessibility _accessibilityResetInternalData](v54);
    }
    else
    {
      id v21 = -[UIKeyboardLayoutStarAccessibility _accessibilityInternalData](v54);
      id v6 = [(UIKeyboardLayoutStarAccessibility *)v54 _accessibilityKeys];
      uint64_t v15 = MEMORY[0x263EF8330];
      int v16 = -1073741824;
      int v17 = 0;
      double v18 = __53__UIKeyboardLayoutStarAccessibility_setKeyplaneName___block_invoke_3;
      id v19 = &unk_2650AE910;
      id v20 = v21;
      [v6 enumerateObjectsUsingBlock:&v15];

      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v21, 0);
    }
    if (v23 & 1) != 0 && ([(id)*MEMORY[0x263F1D020] _accessibilitySoftwareKeyboardActive])
    {
      UIAccessibilityNotifications notification = *MEMORY[0x263F1CE18];
      if (UIAccessibilityIsSwitchControlRunning()) {
        UIAccessibilityPostNotification(notification, (id)*MEMORY[0x263F21A08]);
      }
      else {
        UIAccessibilityPostNotification(notification, 0);
      }
    }
    objc_storeStrong(&v22, 0);
    _Block_object_dispose(&v30, 8);
    objc_storeStrong(&v36, 0);
    int v37 = 0;
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(v41, 0);
  _Block_object_dispose(&v47, 8);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(location, 0);
}

void __53__UIKeyboardLayoutStarAccessibility_setKeyplaneName___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([location[0] visible]) {
    ++*(void *)(*(void *)(a1[4] + 8) + 24);
  }
  objc_storeStrong(location, 0);
}

void __53__UIKeyboardLayoutStarAccessibility_setKeyplaneName___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([location[0] visible]) {
    ++*(void *)(*(void *)(a1[4] + 8) + 24);
  }
  objc_storeStrong(location, 0);
}

void __53__UIKeyboardLayoutStarAccessibility_setKeyplaneName___block_invoke_3(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8[3] = a3;
  v8[2] = a4;
  v8[1] = a1;
  v8[0] = (id)[objc_allocWithZone(NSNumber) initWithUnsignedInteger:a3];
  id v7 = (id)[a1[4] objectForKey:v8[0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[UIAccessibilityElementKBKey setKey:]((uint64_t)v7, location[0]);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
  objc_storeStrong(location, 0);
}

- (void)didBeginContinuousPath
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  [(UIKeyboardLayoutStarAccessibility *)&v2 didBeginContinuousPath];
  UIAccessibilityPostNotification(0x427u, 0);
}

- (id)automationElements
{
  v9[2] = self;
  v9[1] = (id)a2;
  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  v9[0] = [(UIKeyboardLayoutStarAccessibility *)&v8 automationElements];
  id v6 = (id)[MEMORY[0x263F1C738] sharedInstance];
  id location = (id)[v6 autocorrectPrompt];

  if (location && ([location isHiddenOrHasHiddenAncestor] & 1) == 0)
  {
    id v2 = (id)[v9[0] arrayByAddingObject:location];
    id v3 = v9[0];
    v9[0] = v2;
  }
  id v5 = v9[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v9, 0);

  return v5;
}

- (void)showPopupVariantsForKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    BOOL v14 = __61__UIKeyboardLayoutStarAccessibility_showPopupVariantsForKey___block_invoke;
    uint64_t v15 = &unk_2650ADFB0;
    id v16 = location[0];
    int v17 = v20;
    uint64_t v18 = MEMORY[0x2455E7040](&v11);
    uint64_t v10 = 0;
    id v5 = (id)[MEMORY[0x263F1C710] activeKeyboard];
    char v3 = [v5 _accessibilityKeyboardIsContinuousPathAvailable];
    float v4 = 0.5;
    if ((v3 & 1) == 0) {
      float v4 = 0.0;
    }
    *(double *)&uint64_t v6 = v4;

    uint64_t v10 = v6;
    os_log_t oslog = (os_log_t)(id)VOTLogCommon();
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v21, v10);
      _os_log_impl(&dword_2402B7000, oslog, type, "Delay for popup keys: %f", v21, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong((id *)&v18, 0);
    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v7.receiver = v20;
    v7.super_class = (Class)UIKeyboardLayoutStarAccessibility;
    [(UIKeyboardLayoutStarAccessibility *)&v7 showPopupVariantsForKey:location[0]];
    UIAccessibilityPostNotification(*MEMORY[0x263F812D0], 0);
  }
  objc_storeStrong(location, 0);
}

void __61__UIKeyboardLayoutStarAccessibility_showPopupVariantsForKey___block_invoke(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  id v7 = (id)[MEMORY[0x263F1C710] activeKeyboard];
  char v8 = [v7 _accessibilityKeyboardIsContinuousPathTracking];

  if ((v8 & 1) == 0)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    v9.receiver = *(id *)(a1 + 40);
    v9.super_class = (Class)UIKeyboardLayoutStarAccessibility;
    objc_msgSendSuper2(&v9, sel_showPopupVariantsForKey_, v1);
    UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
    id v5 = accessibilityLocalizedString(@"keyboard.variants.alert");
    id v2 = accessibilityLocalizedString(@"keyboard.variants.hint");
    id v4 = (id)__UIAXStringForVariables();
    UIAccessibilityPostNotification(notification, v4);

    UIAccessibilityPostNotification(*MEMORY[0x263F812D0], 0);
  }
}

- (void)showPopupView:(int64_t)a3 withKey:(id)a4 popupInfo:(id)a5 force:(BOOL)a6
{
  uint64_t v24 = self;
  SEL v23 = a2;
  int64_t v22 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v20 = 0;
  objc_storeStrong(&v20, a5);
  BOOL v19 = a6;
  id v15 = (id)[(UIKeyboardLayoutStarAccessibility *)v24 safeValueForKey:@"_keyplaneView"];
  id v14 = (id)[v15 safeDictionaryForKey:@"_activeViewIndex"];
  id v13 = (id)[location name];
  id v6 = (id)objc_msgSend(v14, "objectForKey:");
  BOOL v16 = v6 != 0;

  BOOL v18 = !v16;
  v17.receiver = v24;
  v17.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  [(UIKeyboardLayoutStarAccessibility *)&v17 showPopupView:v22 withKey:location popupInfo:v20 force:a6];
  if (v18)
  {
    UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
    id v10 = accessibilityLocalizedString(@"keyboard.variants.alert");
    id v7 = accessibilityLocalizedString(@"keyboard.variants.hint");
    id v9 = (id)__UIAXStringForVariables();
    UIAccessibilityPostNotification(notification, v9);

    UIAccessibilityPostNotification(*MEMORY[0x263F812D0], 0);
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&location, 0);
}

- (void)setState:(int)a3 forKey:(id)a4
{
  BOOL v18 = self;
  SEL v17 = a2;
  unsigned int v16 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  v14.receiver = v18;
  v14.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  [(UIKeyboardLayoutStarAccessibility *)&v14 setState:v16 forKey:location];
  if (v16 == 16)
  {
    id v13 = 0;
    id v12 = (id)[location subtrees];
    if ([location interactionType] == 16)
    {
      uint64_t v11 = [location flickDirection];
      if (v11 + 1 < (unint64_t)[v12 count])
      {
        id v4 = (id)[v12 objectAtIndex:v11 + 1];
        id v5 = v13;
        id v13 = v4;
      }
    }
    else
    {
      unint64_t v10 = [location safeIntegerForKey:@"selectedVariantIndex"];
      if (v10 < [v12 count])
      {
        id v6 = (id)[v12 objectAtIndex:v10];
        id v7 = v13;
        id v13 = v6;
      }
    }
    id v9 = -[UIKeyboardLayoutStarAccessibility _accessibilityCreateElementForKey:](v18, v13);
    id argument = (id)[v9 accessibilityLabel];
    if (!setState_forKey__LastLabel
      || ([argument isEqualToString:setState_forKey__LastLabel] & 1) == 0)
    {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
      objc_storeStrong((id *)&setState_forKey__LastLabel, argument);
    }
    objc_storeStrong(&argument, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
  }
  else
  {
    objc_storeStrong((id *)&setState_forKey__LastLabel, 0);
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityKeyElementForKey:(id)a3
{
  int v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = [(UIKeyboardLayoutStarAccessibility *)v25 _accessibilityKeys];
  uint64_t v11 = [v10 indexOfObject:location[0]];

  uint64_t v23 = v11;
  id v15 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
  id v14 = (id)[v15 currentInputMode];
  id v13 = (id)[v14 primaryLanguage];
  id v12 = (id)[(UIKeyboardLayoutStarAccessibility *)v25 _accessibilityValueForKey:@"AXCurrentLanguage"];
  int v16 = objc_msgSend(v13, "isEqualToString:") ^ 1;

  char v22 = v16 & 1;
  int v17 = [(UIKeyboardLayoutStarAccessibility *)v25 _accessibilityIsRTL] & 1;
  BOOL v21 = v17 != ([(UIKeyboardLayoutStarAccessibility *)v25 _accessibilityBoolValueForKey:@"AXIsRTL"] & 1);
  if ((v16 & 1) != 0 || v21)
  {
    -[UIKeyboardLayoutStarAccessibility _accessibilityResetInternalData](v25);
    [(UIKeyboardLayoutStarAccessibility *)v25 _accessibilitySetBoolValue:[(UIKeyboardLayoutStarAccessibility *)v25 _accessibilityIsRTL] & 1 forKey:@"AXIsRTL"];
  }
  if (v23 == 0x7FFFFFFFFFFFFFFFLL || (v22 & 1) != 0)
  {
    [(UIKeyboardLayoutStarAccessibility *)v25 _accessibilityRemoveValueForKey:@"AXInternalStoredKeyOrder"];
    id v9 = [(UIKeyboardLayoutStarAccessibility *)v25 _accessibilityKeys];
    uint64_t v23 = [v9 indexOfObject:location[0]];
  }
  id v20 = -[UIKeyboardLayoutStarAccessibility _accessibilityInternalData](v25);
  id v19 = 0;
  if (v23 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = -[UIKeyboardLayoutStarAccessibility _accessibilityCreateElementForKey:](v25, location[0]);
    id v4 = v19;
    id v19 = v3;
  }
  else
  {
    id v18 = (id)[objc_allocWithZone(NSNumber) initWithUnsignedInteger:v23];
    id v5 = (id)[v20 objectForKey:v18];
    id v6 = v19;
    id v19 = v5;

    if (!v19)
    {
      id v19 = -[UIKeyboardLayoutStarAccessibility _accessibilityCreateElementForKey:](v25, location[0]);

      [v20 setObject:v19 forKey:v18];
    }
    objc_storeStrong(&v18, 0);
  }
  id v8 = v19;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);

  return v8;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v44 = a3;
  int v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if ([(UIKeyboardLayoutStarAccessibility *)v43 pointInside:location[0] withEvent:v44])
  {
    id v40 = 0;
    id v39 = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v43);
    if (v39)
    {
      uint64_t v32 = MEMORY[0x263EF8330];
      int v33 = -1073741824;
      int v34 = 0;
      char v35 = __69__UIKeyboardLayoutStarAccessibility__accessibilityHitTest_withEvent___block_invoke;
      id v36 = &__block_descriptor_48_e44_B32__0__UIAccessibilityElementKBKey_8Q16_B24l;
      CGPoint v37 = v44;
      uint64_t v38 = objc_msgSend(v39, "indexOfObjectPassingTest:");
      if (v38 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v4 = (id)[v39 objectAtIndex:v38];
        id v5 = v40;
        id v40 = v4;
      }
    }
    char v30 = 0;
    char v23 = 0;
    char v21 = 0;
    char v19 = 0;
    if (!v40)
    {
      id v18 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](v43);
      id v31 = v18;
      char v30 = 1;
      char v27 = 0;
      objc_opt_class();
      id v26 = (id)__UIAccessibilityCastAsClass();
      id v25 = v26;
      objc_storeStrong(&v26, 0);
      id v24 = v25;
      char v23 = 1;
      id v22 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](v43);
      char v21 = 1;
      objc_msgSend(v25, "convertPoint:toView:", v44);
      double v28 = v6;
      double v29 = v7;
      char v19 = objc_msgSend(v18, "pointInside:withEvent:", 0, v6, v7);
    }
    if (v21) {

    }
    if (v23) {
    if (v30)
    }

    if (v19)
    {
      uint64_t v45 = (UIKeyboardLayoutStarAccessibility *)-[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](v43);
      int v41 = 1;
    }
    else
    {
      if (!v40 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v8 = (id)[(UIKeyboardLayoutStarAccessibility *)v43 keyHitTestContainingPoint:v44];
        id v9 = v40;
        id v40 = v8;

        if (!v40 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          id v10 = (id)[(UIKeyboardLayoutStarAccessibility *)v43 keyHitTestClosestToPoint:v44];
          id v11 = v40;
          id v40 = v10;
        }
      }
      if (v40)
      {
        id v20 = v40;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v12 = [(UIKeyboardLayoutStarAccessibility *)v43 _accessibilityKeyElementForKey:v40];
          id v13 = v20;
          id v20 = v12;
        }
        if (([v20 isAccessibilityElement] & 1) == 0)
        {
          id v14 = (id)[(UIKeyboardLayoutStarAccessibility *)v43 __accessibilityHitTest:location[0] withEvent:v44];
          id v15 = v20;
          id v20 = v14;
        }
        uint64_t v45 = (UIKeyboardLayoutStarAccessibility *)v20;
        int v41 = 1;
        objc_storeStrong(&v20, 0);
      }
      else
      {
        uint64_t v45 = v43;
        int v41 = 1;
      }
    }
    objc_storeStrong(&v39, 0);
    objc_storeStrong(&v40, 0);
  }
  else
  {
    uint64_t v45 = 0;
    int v41 = 1;
  }
  objc_storeStrong(location, 0);
  int v16 = v45;

  return v16;
}

BOOL __69__UIKeyboardLayoutStarAccessibility__accessibilityHitTest_withEvent___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] accessibilityFrame];
  v12.origin.x = v2;
  v12.origin.y = v3;
  v12.size.width = v4;
  v12.size.height = v5;
  id v9 = (id)[location[0] accessibilityContainer];
  UIAccessibilityPointForPoint();
  point.x = v6;
  point.y = v7;
  BOOL v10 = CGRectContainsPoint(v12, point);

  objc_storeStrong(location, 0);
  return v10;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  int v34 = self;
  v33[1] = (id)a2;
  v33[0] = (id)[MEMORY[0x263EFF980] array];
  if ([(UIKeyboardLayoutStarAccessibility *)v34 safeBoolForKey:@"isHandwritingPlane"])
  {
    id v32 = (id)[(UIKeyboardLayoutStarAccessibility *)v34 safeUIViewForKey:@"_keyplaneView"];
    uint64_t v24 = 0;
    id v25 = &v24;
    int v26 = 838860800;
    int v27 = 48;
    double v28 = __Block_byref_object_copy__15;
    double v29 = __Block_byref_object_dispose__15;
    id v30 = 0;
    uint64_t v18 = MEMORY[0x263EF8330];
    int v19 = -1073741824;
    int v20 = 0;
    char v21 = __75__UIKeyboardLayoutStarAccessibility__accessibilitySupplementaryHeaderViews__block_invoke;
    id v22 = &unk_2650AE390;
    v23[1] = &v24;
    v23[0] = v34;
    AXPerformSafeBlock();
    id v17 = (id)v25[5];
    objc_storeStrong(v23, 0);
    _Block_object_dispose(&v24, 8);
    objc_storeStrong(&v30, 0);
    id v31 = (id)[v17 firstObject];

    id v6 = v33[0];
    uint64_t v10 = 0;
    id v11 = &v10;
    int v12 = 838860800;
    int v13 = 48;
    id v14 = __Block_byref_object_copy__15;
    id v15 = __Block_byref_object_dispose__15;
    id v16 = 0;
    v9[1] = &v10;
    id v8 = v32;
    v9[0] = v31;
    AXPerformSafeBlock();
    id v7 = (id)v11[5];
    objc_storeStrong(v9, 0);
    objc_storeStrong(&v8, 0);
    _Block_object_dispose(&v10, 8);
    objc_storeStrong(&v16, 0);
    objc_msgSend(v6, "axSafelyAddObject:");

    id v4 = v33[0];
    id v5 = (id)[v32 _accessibilityFindSubviewDescendant:&__block_literal_global_621];
    objc_msgSend(v4, "axSafelyAddObject:");

    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  id v3 = v33[0];
  objc_storeStrong(v33, 0);

  return v3;
}

void __75__UIKeyboardLayoutStarAccessibility__accessibilitySupplementaryHeaderViews__block_invoke(uint64_t a1)
{
  id v5 = (id)[*(id *)(a1 + 32) safeValueForKey:@"_keyplane"];
  id v1 = (id)[v5 cachedKeysByKeyName:@"Handwriting-Input"];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

void __75__UIKeyboardLayoutStarAccessibility__accessibilitySupplementaryHeaderViews__block_invoke_2(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) viewForKey:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

uint64_t __75__UIKeyboardLayoutStarAccessibility__accessibilitySupplementaryHeaderViews__block_invoke_3(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uihandwritinga.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_axKBModalView
{
  if (a1) {
    id v2 = (id)[a1 safeValueForKey:@"modalDisplayView"];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (BOOL)_accessibilityHasBiasEscapeButton
{
  if (a1)
  {
    id v1 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](a1);
    BOOL v3 = v1 != 0;
  }
  else
  {
    return 0;
  }
  return v3;
}

- (uint64_t)_accessibilityBiasEscapeButtonIsFirst
{
  id v9 = a1;
  if (a1)
  {
    char v7 = 0;
    objc_opt_class();
    id v4 = (id)[MEMORY[0x263F1C738] activeInstance];
    id v3 = (id)[v4 safeValueForKey:@"_layout"];
    id v6 = (id)__UIAccessibilityCastAsClass();

    id v5 = v6;
    objc_storeStrong(&v6, 0);
    id v8 = v5;
    uint64_t v2 = [v5 currentHandBias];
    if (v2)
    {
      if (v2 == 1)
      {
        char v10 = ([v9 _accessibilityIsRTL] ^ 1) & 1;
      }
      else if (v2 == 2)
      {
        char v10 = [v9 _accessibilityIsRTL] & 1;
      }
    }
    else
    {
      char v10 = 0;
    }
    objc_storeStrong(&v8, 0);
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

- (int64_t)accessibilityElementCount
{
  id v8 = self;
  location[1] = (id)a2;
  id v2 = -[UIKeyboardLayoutStarAccessibility _axKBModalView](self);
  BOOL v6 = v2 == 0;

  if (!v6) {
    return 1;
  }
  location[0] = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v8);
  if (location[0])
  {
    int64_t v9 = [location[0] count];
  }
  else
  {
    id v5 = [(UIKeyboardLayoutStarAccessibility *)v8 _accessibilityKeys];
    uint64_t v4 = [v5 count];
    int64_t v9 = v4 + -[UIKeyboardLayoutStarAccessibility _accessibilityHasBiasEscapeButton](v8);
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = -[UIKeyboardLayoutStarAccessibility _axKBModalView](v26);
  BOOL v19 = v3 == 0;

  if (v19)
  {
    id v23 = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v26);
    if (v23)
    {
      int64_t v27 = [v23 indexOfObject:location[0]];
      int v24 = 1;
    }
    else
    {
      id v17 = location[0];
      id v4 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](v26);
      BOOL v18 = v17 != v4;

      if (v18)
      {
        id v22 = -[UIKeyboardLayoutStarAccessibility _accessibilityInternalData](v26);
        memset(__b, 0, sizeof(__b));
        id obj = v22;
        uint64_t v15 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
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
            id v21 = *(id *)(__b[1] + 8 * v12);
            id v5 = (id)[v22 objectForKey:v21];
            BOOL v9 = v5 != location[0];

            if (!v9) {
              break;
            }
            ++v12;
            if (v10 + 1 >= v13)
            {
              uint64_t v12 = 0;
              unint64_t v13 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
              if (!v13) {
                goto LABEL_20;
              }
            }
          }
          uint64_t v7 = [v21 unsignedIntegerValue];
          char v8 = 0;
          if (-[UIKeyboardLayoutStarAccessibility _accessibilityHasBiasEscapeButton](v26)) {
            char v8 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButtonIsFirst](v26);
          }
          int64_t v27 = v7 + ((v8 & 1) != 0);
          int v24 = 1;
        }
        else
        {
LABEL_20:
          int v24 = 0;
        }

        if (!v24)
        {
          int64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
          int v24 = 1;
        }
        objc_storeStrong(&v22, 0);
      }
      else
      {
        if (-[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButtonIsFirst](v26)) {
          uint64_t v16 = 0;
        }
        else {
          uint64_t v16 = [(UIKeyboardLayoutStarAccessibility *)v26 accessibilityElementCount] - 1;
        }
        int64_t v27 = v16;
        int v24 = 1;
      }
    }
    objc_storeStrong(&v23, 0);
  }
  else
  {
    int64_t v27 = 0;
    int v24 = 1;
  }
  objc_storeStrong(location, 0);
  return v27;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  int v24 = self;
  SEL v23 = a2;
  int64_t v22 = a3;
  id v3 = -[UIKeyboardLayoutStarAccessibility _axKBModalView](self);
  BOOL v14 = v3 == 0;

  if (!v14)
  {
    id v25 = -[UIKeyboardLayoutStarAccessibility _axKBModalView](v24);
    goto LABEL_26;
  }
  id v21 = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v24);
  if (v21)
  {
    id v20 = 0;
    if (v22 < 0 || v22 >= (unint64_t)[v21 count])
    {
      _AXAssert();
    }
    else
    {
      id v4 = (id)[v21 objectAtIndexedSubscript:v22];
      id v5 = v20;
      id v20 = v4;
    }
    id v25 = v20;
    int v19 = 1;
    objc_storeStrong(&v20, 0);
    goto LABEL_25;
  }
  if (!-[UIKeyboardLayoutStarAccessibility _accessibilityHasBiasEscapeButton](v24)
    || (-[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButtonIsFirst](v24) & 1) == 0)
  {
LABEL_14:
    id v18 = -[UIKeyboardLayoutStarAccessibility _accessibilityInternalData](v24);
    id v17 = (id)[objc_allocWithZone(NSNumber) initWithUnsignedInteger:v22];
    id v16 = (id)[v18 objectForKey:v17];
    if (!v16)
    {
      id v15 = [(UIKeyboardLayoutStarAccessibility *)v24 _accessibilityKeys];
      if (v22 < (unint64_t)[v15 count])
      {
        id v13 = (id)[v15 objectAtIndex:v22];
        id v6 = -[UIKeyboardLayoutStarAccessibility _accessibilityCreateElementForKey:](v24, v13);
        id v7 = v16;
        id v16 = v6;

        if (v16) {
          [v18 setObject:v16 forKey:v17];
        }
      }
      objc_storeStrong(&v15, 0);
    }
    if (!v16)
    {
      int64_t v12 = v22;
      if (v12 == [(UIKeyboardLayoutStarAccessibility *)v24 accessibilityElementCount] - 1
        && -[UIKeyboardLayoutStarAccessibility _accessibilityHasBiasEscapeButton](v24)
        && (-[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButtonIsFirst](v24) & 1) == 0)
      {
        id v8 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](v24);
        id v9 = v16;
        id v16 = v8;
      }
    }
    id v25 = v16;
    int v19 = 1;
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
    goto LABEL_25;
  }
  if (v22)
  {
    --v22;
    goto LABEL_14;
  }
  id v25 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](v24);
  int v19 = 1;
LABEL_25:
  objc_storeStrong(&v21, 0);
LABEL_26:
  uint64_t v10 = v25;

  return v10;
}

- (id)focusItemsInRect:(CGRect)a3
{
  CGRect v17 = a3;
  id v16 = self;
  v15[1] = (id)a2;
  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  v15[0] = -[UIKeyboardLayoutStarAccessibility focusItemsInRect:](&v14, sel_focusItemsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if ([(UIKeyboardLayoutStarAccessibility *)v16 _accessibilityIsFKARunningForFocusItem])
  {
    id v5 = [(UIKeyboardLayoutStarAccessibility *)v16 _accessibilityKeys];
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = __54__UIKeyboardLayoutStarAccessibility_focusItemsInRect___block_invoke;
    uint64_t v10 = &unk_2650AEF30;
    uint64_t v11 = v16;
    id v12 = (id)[v5 axMapObjectsUsingBlock:&v6];

    id v18 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "axArrayWithPossiblyNilArrays:", 1, v12);
    int v13 = 1;
    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v11, 0);
  }
  else
  {
    id v18 = v15[0];
    int v13 = 1;
  }
  objc_storeStrong(v15, 0);
  id v3 = v18;

  return v3;
}

id __54__UIKeyboardLayoutStarAccessibility_focusItemsInRect___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[a1[4] _accessibilityKeyElementForKey:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (BOOL)canProduceString:(id)a3
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v14 = 0;
  v13.receiver = v16;
  v13.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  char v14 = [(UIKeyboardLayoutStarAccessibility *)&v13 canProduceString:location[0]];
  if (!v14 && UIAccessibilityIsVoiceOverRunning())
  {
    char v14 = 1;
    unint64_t v12 = [location[0] length];
    for (unint64_t i = 0; ; ++i)
    {
      char v7 = 0;
      if (i < v12) {
        char v7 = v14;
      }
      if ((v7 & 1) == 0) {
        break;
      }
      id v5 = v16;
      unint64_t v18 = i;
      uint64_t v17 = 1;
      unint64_t v19 = i;
      uint64_t v20 = 1;
      unint64_t v9 = i;
      uint64_t v10 = 1;
      id v6 = (id)objc_msgSend(location[0], "substringWithRange:", i, 1);
      v8.receiver = v5;
      v8.super_class = (Class)UIKeyboardLayoutStarAccessibility;
      char v14 = -[UIKeyboardLayoutStarAccessibility canProduceString:](&v8, sel_canProduceString_);
    }
  }
  char v4 = v14;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (double)_axGetSortingNumberForEmojiCell:(uint64_t)a1
{
  uint64_t v9 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v9)
  {
    double v6 = 0.4;
    id v5 = (id)[location _accessibilityAncestorIsKindOf:objc_opt_class()];
    if (v5)
    {
      [location accessibilityFrame];
      UIAccessibilityFrameToBounds();
      CGRect v4 = v11;
      double Width = CGRectGetWidth(v11);
      double v6 = (double)(unint64_t)(CGRectGetMidX(v4) / Width) / 100.0 + 0.5;
    }
    double v10 = v6;
    int v7 = 1;
    objc_storeStrong(&v5, 0);
  }
  else
  {
    double v10 = 0.0;
    int v7 = 1;
  }
  objc_storeStrong(&location, 0);
  return v10;
}

- (id)_rowNumberOverrideForSplitEmojiKey:(uint64_t)a1
{
  uint64_t v8 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v8)
  {
    id v5 = 0;
    id v4 = (id)[location name];
    if (([v4 isEqualToString:@"Space-Key"] & 1) != 0
      || ([v4 isEqualToString:@"Return-Key"] & 1) != 0
      || ([v4 isEqualToString:@"Delete-Key"] & 1) != 0)
    {
      objc_storeStrong(&v5, &unk_26F48EA68);
    }
    else if ([v4 isEqualToString:@"Emoji-International-Key"])
    {
      objc_storeStrong(&v5, &unk_26F48EA80);
    }
    id v9 = v5;
    int v6 = 1;
    objc_storeStrong(&v4, 0);
    objc_storeStrong(&v5, 0);
  }
  else
  {
    id v9 = 0;
    int v6 = 1;
  }
  objc_storeStrong(&location, 0);
  id v2 = v9;

  return v2;
}

- (id)_accessibilityGetKeyboardRowsByRowNumber
{
  if (a1) {
    id v2 = (id)[a1 iOSGetKeyboardRowsByNumber];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)atvGetKeyboardRowsByNumber
{
  int64_t v22 = self;
  SEL v21 = a2;
  v17[0] = 0;
  v17[1] = v17;
  int v18 = 0x20000000;
  int v19 = 32;
  char v20 = 0;
  v13[0] = 0;
  v13[1] = v13;
  int v14 = 0x20000000;
  int v15 = 32;
  int v16 = 0;
  id v12 = (id)[MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(UIKeyboardLayoutStarAccessibility *)v22 _accessibilityKeys];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  uint64_t v8 = __63__UIKeyboardLayoutStarAccessibility_atvGetKeyboardRowsByNumber__block_invoke;
  id v9 = &unk_2650AEF58;
  double v10 = v22;
  v11[1] = v13;
  id v11[2] = v17;
  v11[0] = v12;
  [v4 enumerateObjectsUsingBlock:&v5];

  id v3 = v12;
  objc_storeStrong(v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v12, 0);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v17, 8);

  return v3;
}

void __63__UIKeyboardLayoutStarAccessibility_atvGetKeyboardRowsByNumber__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v40[3] = a3;
  v40[2] = a4;
  v40[1] = (id)a1;
  v40[0] = (id)[*(id *)(a1 + 32) _accessibilityKeyElementForKey:location[0]];
  id v39 = (id)[MEMORY[0x263F81198] defaultSwitchControlOptions];
  [v39 setShouldReturnScannerGroups:0];
  id v38 = (id)[v40[0] _accessibilityLeafDescendantsWithOptions:v39];
  memset(__b, 0, sizeof(__b));
  id obj = v38;
  uint64_t v29 = [obj countByEnumeratingWithState:__b objects:v42 count:16];
  if (v29)
  {
    uint64_t v22 = *(void *)__b[2];
    uint64_t v23 = 0;
    unint64_t v24 = v29;
    while (1)
    {
      uint64_t v21 = v23;
      if (*(void *)__b[2] != v22) {
        objc_enumerationMutation(obj);
      }
      uint64_t v37 = *(void *)(__b[1] + 8 * v23);
      id v35 = 0;
      id v19 = (id)[location[0] properties];
      id v4 = (id)[v19 objectForKeyedSubscript:*MEMORY[0x263F1D3A0]];
      BOOL v20 = v4 == 0;

      if (v20)
      {
        id v7 = (id)[NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
        id v8 = v35;
        id v35 = v7;

        id v16 = (id)[location[0] name];
        char v17 = [v16 isEqualToString:@"Monolith-Linear-Delete-Key"];

        if (v17) {
          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        }
        char v9 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        char v33 = 0;
        char v31 = 0;
        char v15 = 0;
        if ((v9 & 1) == 0)
        {
          id v34 = (id)[location[0] name];
          char v33 = 1;
          char v14 = 1;
          if (([v34 isEqualToString:@"Monolith-Capital-Letters-Keyplane-Switch-Key"] & 1) == 0)
          {
            id v32 = (id)[location[0] name];
            char v31 = 1;
            char v14 = [v32 isEqualToString:@"Monolith-International-Key"];
          }
          char v15 = v14;
        }
        if (v31) {

        }
        if (v33) {
        if (v15)
        }
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
          id v10 = (id)[NSNumber numberWithInt:++*(_DWORD *)(*(void *)(*(void *)(a1 + 48)+ 8)+ 24)];
          id v11 = v35;
          id v35 = v10;
        }
      }
      else
      {
        id v18 = (id)[location[0] properties];
        id v5 = (id)[v18 objectForKeyedSubscript:*MEMORY[0x263F1D3A0]];
        id v6 = v35;
        id v35 = v5;
      }
      id v30 = (id)[*(id *)(a1 + 40) objectForKey:v35];
      if (!v30)
      {
        id v12 = (id)[MEMORY[0x263EFF980] array];
        id v13 = v30;
        id v30 = v12;

        [*(id *)(a1 + 40) setObject:v30 forKey:v35];
      }
      [v30 addObject:v37];
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v35, 0);
      ++v23;
      if (v21 + 1 >= v24)
      {
        uint64_t v23 = 0;
        unint64_t v24 = [obj countByEnumeratingWithState:__b objects:v42 count:16];
        if (!v24) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(v40, 0);
  objc_storeStrong(location, 0);
}

- (id)iOSGetKeyboardRowsByNumber
{
  id v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)[MEMORY[0x263EFF9A0] dictionary];
  id v3 = [(UIKeyboardLayoutStarAccessibility *)v8 _accessibilityKeys];
  id v5 = v8;
  id v6 = v7[0];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:");

  id v4 = v7[0];
  objc_storeStrong(&v6, 0);
  objc_storeStrong((id *)&v5, 0);
  objc_storeStrong(v7, 0);

  return v4;
}

void __63__UIKeyboardLayoutStarAccessibility_iOSGetKeyboardRowsByNumber__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v49[3] = a3;
  id v49[2] = a4;
  v49[1] = a1;
  v49[0] = (id)[a1[4] _accessibilityKeyElementForKey:location[0]];
  id v48 = (id)[MEMORY[0x263F81198] defaultSwitchControlOptions];
  [v48 setShouldReturnScannerGroups:0];
  id v47 = (id)[v49[0] _accessibilityLeafDescendantsWithOptions:v48];
  memset(__b, 0, sizeof(__b));
  id obj = v47;
  uint64_t v35 = [obj countByEnumeratingWithState:__b objects:v51 count:16];
  if (v35)
  {
    uint64_t v28 = *(void *)__b[2];
    uint64_t v29 = 0;
    unint64_t v30 = v35;
    while (1)
    {
      uint64_t v27 = v29;
      if (*(void *)__b[2] != v28) {
        objc_enumerationMutation(obj);
      }
      id v46 = *(void **)(__b[1] + 8 * v29);
      id v44 = 0;
      char v43 = 0;
      objc_opt_class();
      id v26 = (id)[a1[4] safeValueForKey:@"_keyboard"];
      id v42 = (id)__UIAccessibilityCastAsClass();

      if (v43) {
        abort();
      }
      id v41 = v42;
      objc_storeStrong(&v42, 0);
      id v24 = v41;
      BOOL v25 = [v41 visualStyle] != 109;

      if (!v25)
      {
        id v4 = -[UIKeyboardLayoutStarAccessibility _rowNumberOverrideForSplitEmojiKey:]((uint64_t)a1[4], location[0]);
        id v5 = v44;
        id v44 = v4;
      }
      if (!v44)
      {
        id v23 = (id)[location[0] properties];
        id v6 = (id)[v23 objectForKeyedSubscript:*MEMORY[0x263F1D3A0]];
        id v7 = v44;
        id v44 = v6;
      }
      if (v44) {
        goto LABEL_28;
      }
      id v21 = (id)[location[0] name];
      char v8 = [v21 isEqualToString:@"Emoji-Category-Control-Key"];
      char v39 = 0;
      char v22 = 1;
      if ((v8 & 1) == 0)
      {
        id v40 = (id)[location[0] name];
        char v39 = 1;
        char v22 = [v40 isEqualToString:@"Handwriting-Input"];
      }
      if (v39) {

      }
      if ((v22 & 1) == 0)
      {
        id v19 = (id)[location[0] name];
        char v9 = [v19 hasPrefix:@"Emoji-InputView-"];
        char v37 = 0;
        char v20 = 1;
        if ((v9 & 1) == 0)
        {
          id v38 = (id)[location[0] name];
          char v37 = 1;
          char v20 = [v38 isEqualToString:@"Voiced-Sound-Mark-And-Semi-Voiced-Sound-Mark-And-Small-Variation"];
        }
        if (v37) {

        }
        if ((v20 & 1) == 0)
        {
          id v14 = location[0];
          _AXAssert();
        }
        id v17 = (id)[location[0] name];
        char v18 = [v17 hasPrefix:@"Emoji-InputView-"];

        if (v18)
        {
          id v10 = (id)objc_msgSend(NSNumber, "numberWithDouble:", -[UIKeyboardLayoutStarAccessibility _axGetSortingNumberForEmojiCell:]((uint64_t)a1[4], v46));
          id v11 = v44;
          id v44 = v10;

          goto LABEL_28;
        }
        id v15 = (id)[location[0] name];
        char v16 = [v15 isEqualToString:@"Voiced-Sound-Mark-And-Semi-Voiced-Sound-Mark-And-Small-Variation"];

        if ((v16 & 1) == 0)
        {
          objc_storeStrong(&v44, &unk_26F48EA98);
          goto LABEL_28;
        }
      }
      objc_storeStrong(&v44, &unk_26F48EA68);
LABEL_28:
      id v36 = (id)objc_msgSend(a1[5], "objectForKey:", v44, v14);
      if (!v36)
      {
        id v12 = (id)[MEMORY[0x263EFF980] array];
        id v13 = v36;
        id v36 = v12;

        [a1[5] setObject:v36 forKey:v44];
      }
      [v36 addObject:v46];
      objc_storeStrong(&v36, 0);
      objc_storeStrong(&v44, 0);
      ++v29;
      if (v27 + 1 >= v30)
      {
        uint64_t v29 = 0;
        unint64_t v30 = [obj countByEnumeratingWithState:__b objects:v51 count:16];
        if (!v30) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(v49, 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityScannerGroupElements
{
  id v14 = self;
  SEL v13 = a2;
  id v2 = -[UIKeyboardLayoutStarAccessibility _axKBModalView](self);
  BOOL v8 = v2 == 0;

  if (v8)
  {
    id v3 = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v14);
    BOOL v7 = v3 == 0;

    if (v7)
    {
      id v11 = -[UIKeyboardLayoutStarAccessibility _accessibilityGetKeyboardRowsByRowNumber](v14);
      uint64_t v10 = [v11 count];
      id v6 = (id)[v11 allKeys];
      id v9 = (id)[v6 sortedArrayUsingComparator:&__block_literal_global_666];

      id v15 = [(UIKeyboardLayoutStarAccessibility *)v14 iOSGetOrderedRowsForRows:v11 sortedRows:v9 numRows:v10];
      objc_storeStrong(&v9, 0);
      objc_storeStrong(&v11, 0);
    }
    else
    {
      id v15 = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v14);
    }
  }
  else
  {
    v12.receiver = v14;
    v12.super_class = (Class)UIKeyboardLayoutStarAccessibility;
    id v15 = [(UIKeyboardLayoutStarAccessibility *)&v12 _accessibilityScannerGroupElements];
  }
  id v4 = v15;

  return v4;
}

uint64_t __71__UIKeyboardLayoutStarAccessibility__accessibilityScannerGroupElements__block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v10 = 0;
  objc_storeStrong(&v10, a3);
  [location[0] doubleValue];
  double v9 = v3;
  [v10 doubleValue];
  if (v9 == v4)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v5 = 1;
    if (v9 < v4) {
      uint64_t v5 = -1;
    }
    uint64_t v7 = v5;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)atvGetOrderedRowsForRows:(id)a3 sortedRows:(id)a4 numRows:(int64_t)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v37 = 0;
  objc_storeStrong(&v37, a4);
  v36[1] = (id)a5;
  v36[0] = (id)[MEMORY[0x263EFF980] arrayWithCapacity:a5];
  memset(__b, 0, sizeof(__b));
  id v24 = v37;
  uint64_t v25 = [v24 countByEnumeratingWithState:__b objects:v43 count:16];
  if (v25)
  {
    uint64_t v19 = *(void *)__b[2];
    uint64_t v20 = 0;
    unint64_t v21 = v25;
    while (1)
    {
      uint64_t v18 = v20;
      if (*(void *)__b[2] != v19) {
        objc_enumerationMutation(v24);
      }
      uint64_t v35 = *(void *)(__b[1] + 8 * v20);
      id v33 = (id)[MEMORY[0x263EFF980] array];
      id v32 = (id)[location[0] objectForKey:v35];
      unint64_t v31 = 0;
      unint64_t v31 = (int)[v32 count];
      if (v31 >= 6)
      {
        float v30 = 0.0;
        float v5 = 2.0;
        if (v31 != 6) {
          float v5 = 4.0;
        }
        float v30 = v5;
        unint64_t v29 = vcvtps_u32_f32((float)v31 / v5);
        for (unint64_t i = 0; (unint64_t)i < v31; i += v29)
        {
          if ((unint64_t)&i[v29] > v31) {
            unint64_t v29 = v31 - (void)i;
          }
          id v41 = @"GroupElements";
          location[4] = i;
          id location[3] = (id)v29;
          location[5] = i;
          location[6] = (id)v29;
          v26[1] = i;
          v26[2] = (id)v29;
          id v17 = (id)objc_msgSend(v32, "subarrayWithRange:", i, v29);
          id v42 = v17;
          id v27 = (id)[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];

          [v33 addObject:v27];
          objc_storeStrong(&v27, 0);
        }
      }
      else
      {
        [v33 setArray:v32];
      }
      if ((unint64_t)[v32 count] <= 1)
      {
        if ([v32 count] == 1)
        {
          id v8 = v36[0];
          id v9 = (id)[v32 firstObject];
          objc_msgSend(v8, "addObject:");
        }
      }
      else
      {
        v39[0] = @"GroupElements";
        v40[0] = v33;
        v39[1] = @"GroupTraits";
        v40[1] = &unk_26F48EAB0;
        v39[2] = @"GroupLabel";
        id v10 = NSString;
        id v16 = (id)UIKitAccessibilityLocalizedString();
        id v15 = (id)[v32 firstObject];
        id v14 = (id)[v15 accessibilityLabel];
        id v13 = (id)[v32 lastObject];
        id v12 = (id)[v13 accessibilityLabel];
        id v11 = (id)objc_msgSend(v10, "stringWithFormat:", v16, v14, v12);
        v40[2] = v11;
        v26[0] = (id)[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:3];

        [v36[0] addObject:v26[0]];
        objc_storeStrong(v26, 0);
      }
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      ++v20;
      if (v18 + 1 >= v21)
      {
        uint64_t v20 = 0;
        unint64_t v21 = [v24 countByEnumeratingWithState:__b objects:v43 count:16];
        if (!v21) {
          break;
        }
      }
    }
  }

  id v7 = v36[0];
  objc_storeStrong(v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);

  return v7;
}

- (id)iOSGetOrderedRowsForRows:(id)a3 sortedRows:(id)a4 numRows:(int64_t)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v45 = 0;
  objc_storeStrong(&v45, a4);
  v44[1] = (id)a5;
  v44[0] = (id)[MEMORY[0x263EFF980] arrayWithCapacity:a5];
  uint64_t v43 = 1;
  char v42 = [(UIKeyboardLayoutStarAccessibility *)v47 _accessibilityIsRTL] & 1;
  memset(__b, 0, sizeof(__b));
  id v25 = v45;
  uint64_t v26 = [v25 countByEnumeratingWithState:__b objects:v56 count:16];
  if (v26)
  {
    uint64_t v20 = *(void *)__b[2];
    uint64_t v21 = 0;
    unint64_t v22 = v26;
    while (1)
    {
      uint64_t v19 = v21;
      if (*(void *)__b[2] != v20) {
        objc_enumerationMutation(v25);
      }
      uint64_t v41 = *(void *)(__b[1] + 8 * v21);
      id v39 = (id)[MEMORY[0x263EFF980] array];
      id v38 = (id)[location[0] objectForKey:v41];
      uint64_t v37 = 0;
      uint64_t v37 = [v38 count];
      if (v37 <= 8)
      {
        [v39 setArray:v38];
      }
      else
      {
        uint64_t v31 = MEMORY[0x263EF8330];
        int v32 = -1073741824;
        int v33 = 0;
        id v34 = __81__UIKeyboardLayoutStarAccessibility_iOSGetOrderedRowsForRows_sortedRows_numRows___block_invoke;
        uint64_t v35 = &__block_descriptor_33_e11_q24__0_8_16l;
        char v36 = v42 & 1;
        id v5 = (id)objc_msgSend(v38, "sortedArrayWithOptions:usingComparator:", 16);
        id v6 = v38;
        id v38 = v5;

        unint64_t v30 = llroundf((float)v37 / 3.0);
        unint64_t v29 = 0;
        while ((uint64_t)v29 < v37)
        {
          if ((uint64_t)&v29[v30] > v37 || v37 - (uint64_t)v29 <= 5) {
            unint64_t v30 = v37 - (void)v29;
          }
          uint64_t v54 = @"GroupElements";
          int v49 = v29;
          unint64_t v48 = v30;
          int v50 = v29;
          unint64_t v51 = v30;
          v27[1] = v29;
          v27[2] = (id)v30;
          id v18 = (id)objc_msgSend(v38, "subarrayWithRange:", v29, v30);
          id v55 = v18;
          id v28 = (id)[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];

          [v39 addObject:v28];
          v29 += v30;
          objc_storeStrong(&v28, 0);
        }
      }
      if ((unint64_t)[v38 count] <= 1)
      {
        if ([v38 count] == 1)
        {
          id v9 = v44[0];
          id v10 = (id)[v38 firstObject];
          objc_msgSend(v9, "addObject:");
        }
      }
      else
      {
        v52[0] = @"GroupElements";
        v53[0] = v39;
        v52[1] = @"GroupTraits";
        v53[1] = &unk_26F48EAB0;
        v52[2] = @"GroupLabel";
        id v11 = NSString;
        id v17 = (id)UIKitAccessibilityLocalizedString();
        id v16 = (id)[v38 firstObject];
        id v15 = (id)[v16 accessibilityLabel];
        id v14 = (id)[v38 lastObject];
        id v13 = (id)[v14 accessibilityLabel];
        id v12 = (id)objc_msgSend(v11, "stringWithFormat:", v17, v15, v13);
        v53[2] = v12;
        v52[3] = @"GroupScanBehaviorTraits";
        v53[3] = &unk_26F48EAC8;
        v27[0] = (id)[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:4];

        [v44[0] addObject:v27[0]];
        objc_storeStrong(v27, 0);
      }
      ++v43;
      objc_storeStrong(&v38, 0);
      objc_storeStrong(&v39, 0);
      ++v21;
      if (v19 + 1 >= v22)
      {
        uint64_t v21 = 0;
        unint64_t v22 = [v25 countByEnumeratingWithState:__b objects:v56 count:16];
        if (!v22) {
          break;
        }
      }
    }
  }

  id v8 = v44[0];
  objc_storeStrong(v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);

  return v8;
}

uint64_t __81__UIKeyboardLayoutStarAccessibility_iOSGetOrderedRowsForRows_sortedRows_numRows___block_invoke(unsigned char *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v11 = 0;
  objc_storeStrong(&v11, a3);
  [location[0] accessibilityFrame];
  double v10 = v3;
  [v11 accessibilityFrame];
  if (v10 >= v4)
  {
    if (v4 >= v10)
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v6 = 1;
      if (a1[32]) {
        uint64_t v6 = -1;
      }
      uint64_t v13 = v6;
    }
  }
  else
  {
    uint64_t v5 = -1;
    if (a1[32]) {
      uint64_t v5 = 1;
    }
    uint64_t v13 = v5;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (int64_t)accessibilityNavigationStyle
{
  return 1;
}

@end