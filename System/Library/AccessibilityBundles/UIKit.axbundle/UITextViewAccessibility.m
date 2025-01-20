@interface UITextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:(SEL)a3;
- (BOOL)_accessibilityTextViewShouldBreakUpParagraphs;
- (BOOL)_allowCustomActionHintSpeakOverride;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityContainsOneLink;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5;
- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)replaceAnimatedTextPlaceholderWith:(id)a3;
- (BOOL)resignFirstResponder;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3;
- (CGRect)accessibilityFrame;
- (_NSRange)_accessibilitySelectedTextRange;
- (double)_accessibilityFontSize;
- (id)_accessibilityAttributedTextRetrieval;
- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3;
- (id)_accessibilityDataDetectorScheme:(CGPoint)a3;
- (id)_accessibilityForegroundTextColorAttribute;
- (id)_accessibilityGetValue;
- (id)_accessibilityGetValue:(BOOL)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityInternalTextLinks;
- (id)_accessibilityLinksForRange:(NSUInteger)a3;
- (id)_accessibilityParagraphElements;
- (id)_accessibilityParagraphElementsWithLinks;
- (id)_accessibilityParagraphLinksCustomRotor;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)_accessibilityTextSelectionRectWithLargestVisualRangeFromCandidates:(void *)a1;
- (id)_replaceRange:(id)a3 withAttributedText:(id)a4 updatingSelection:(BOOL)a5;
- (id)accessibilityAttributedValue;
- (id)accessibilityCustomRotors;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityPlaceholderValue;
- (id)accessibilityValue;
- (id)automationElements;
- (int64_t)accessibilityContainerType;
- (uint64_t)_accessibilityActivateLink:(void *)a1;
- (uint64_t)_axDidRegisterForDDNotification;
- (uint64_t)_axIsOnlyOneLinkElement;
- (uint64_t)_axRegisterForDDNotificationIfNeeded;
- (uint64_t)_axSetDidRegisterForDDNotification:(uint64_t)result;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_accessibilitySetValue:(id)a3;
- (void)_axClearCachedLinkData;
- (void)_axDidFinishDataDetectorURLification:(id)a3;
- (void)dealloc;
- (void)insertAnimatedTextPlaceholderAtLocation:(id)a3 numLines:(double)a4;
- (void)removeAnimatedTextPlaceholders;
- (void)setAttributedPlaceholder:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setSelectedRange:(_NSRange)a3;
@end

@implementation UITextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v19 = location;
  id v18 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = @"UITextView";
  v15 = "B";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", 0);
  v17 = "@";
  v14 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"setAttributedText:", "@", 0);
  v11 = "{_NSRange=QQ}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"setSelectedRange:", v14, "{_NSRange=QQ}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"keyboardInput: shouldInsertText: isMarkedText:", v17, v17, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"keyboardInput: shouldReplaceTextInRange: replacementText:", v15, v17, v11, v17, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"keyboardInputChangedSelection:", v14, v17, 0);
  v10 = "{CGRect={CGPoint=dd}{CGSize=dd}}";
  [location[0] validateClass:v16 hasInstanceMethod:@"visibleTextRect" withFullSignature:0];
  v6 = "Q";
  [location[0] validateClass:v16 hasInstanceMethod:@"marginTop" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"setAttributedPlaceholder:", v14, v17, 0);
  [location[0] validateClass:v16 hasInstanceVariable:@"_placeholderLabel" withType:"UILabel"];
  [location[0] validateClass:v16 isKindOfClass:@"UIResponder"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"canBecomeFocused", v15, 0);
  v9 = @"_UITextKit2LayoutController";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "q", 0);
  [location[0] validateClass:v16 hasInstanceVariable:@"_textLayoutController" withType:"_UITextLayoutControllerBase<_UITextLayoutController>"];
  v3 = @"_UITextKit1LayoutController";
  v4 = @"layoutManager";
  objc_msgSend(location[0], "validateClass:hasProperty:withType:");
  v5 = @"canAccessLayoutManager";
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", v3);
  [location[0] validateClass:v9 hasProperty:v4 withType:v17];
  [location[0] validateClass:v9 hasProperty:v5 withType:v15];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_textInteractableItemAtPoint:precision:", v17, "{CGPoint=dd}", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"interactionAssistant", v17, 0);
  v7 = @"UITextInteractionAssistant";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"linkInteraction", v17, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UITextSimpleLinkInteraction", @"contextMenuInteraction", v17, 0);
  [location[0] validateClass:@"_UITextMenuLinkInteraction"];
  v8 = @"_UITextInteractableItem";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"invokeDefaultAction", v14, 0);
  [location[0] validateClass:v9];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"boundingRectForCharacterRange:", v10, v11, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", @"UIKeyboard", @"presentsInlineTextCompletionAsMarkedText", v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UITextKitTextRange", @"asRange", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardImpl", @"inlineTextCompletionController", v17, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIInlineTextCompletionController", @"lastAcceptedTextCompletion", v17, 0);
  v12 = @"_UIInlineTextCompletion";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"input", v17, 0);
  v13 = @"_UITextInteractableLinkItem";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v13, @"link", v17, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"replaceAnimatedTextPlaceholderWith:", v15, v17, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"removeAnimatedTextPlaceholders", v14, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"insertAnimatedTextPlaceholderAtLocation:numLines:", v14, v17, "d", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, @"_replaceRange:withAttributedText:updatingSelection:", v17, v17, v15, 0);
  objc_storeStrong(v19, v18);
}

- (uint64_t)_axDidRegisterForDDNotification
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)_axSetDidRegisterForDDNotification:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

- (uint64_t)_axRegisterForDDNotificationIfNeeded
{
  uint64_t v2 = result;
  if (result)
  {
    result = -[UITextViewAccessibility _axDidRegisterForDDNotification](result);
    if ((result & 1) == 0)
    {
      id v1 = (id)[MEMORY[0x263F08A00] defaultCenter];
      [v1 addObserver:v2 selector:sel__axDidFinishDataDetectorURLification_ name:@"DataDetectorsUIDidFinishURLificationNotification" object:v2];

      return -[UITextViewAccessibility _axSetDidRegisterForDDNotification:](v2);
    }
  }
  return result;
}

- (unint64_t)_accessibilityAutomationType
{
  return 52;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UITextViewAccessibility;
  [(UITextViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  -[UITextViewAccessibility _axRegisterForDDNotificationIfNeeded]((uint64_t)v4);
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:v5 name:@"DataDetectorsUIDidFinishURLificationNotification" object:v5];

  v3.receiver = v5;
  v3.super_class = (Class)UITextViewAccessibility;
  [(UITextViewAccessibility *)&v3 dealloc];
}

- (void)_axClearCachedLinkData
{
  id v1 = result;
  if (result)
  {
    objc_msgSend(result, "_accessibilitySetRetainedValue:forKey:");
    return (void *)[v1 _accessibilitySetRetainedValue:0 forKey:@"AXOnlyHasOneLink"];
  }
  return result;
}

- (void)_axDidFinishDataDetectorURLification:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (_AXSInUnitTestMode())
  {
    id v3 = (id)[(UITextViewAccessibility *)v5 _accessibilityValueForKey:@"UnitTestDataDetectionDoneBlock"];
    if (v3) {
      (*((void (**)(void))v3 + 2))();
    }
    objc_storeStrong(&v3, 0);
  }
  -[UITextViewAccessibility _axClearCachedLinkData](v5);
  -[UITextViewAccessibility _accessibilitySetRetainedValue:forKey:](v5, "_accessibilitySetRetainedValue:forKey:");
  [(UITextViewAccessibility *)v5 _accessibilitySetRetainedValue:0 forKey:*MEMORY[0x263F81490]];
  objc_storeStrong(location, 0);
}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2 = [(UITextViewAccessibility *)self selectedRange];
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)_accessibilityDataDetectorScheme:(CGPoint)a3
{
  id v4 = (id)[(UITextViewAccessibility *)self safeValueForKey:@"webView"];
  id v5 = (id)objc_msgSend(v4, "_accessibilityDataDetectorScheme:", a3.x, a3.y);

  return v5;
}

- (void)setAttributedText:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UITextViewAccessibility _axClearCachedLinkData](v8);
  [(UITextViewAccessibility *)v8 _accessibilitySetRetainedValue:0 forKey:@"AXParagraphLinkRotor"];
  [(UITextViewAccessibility *)v8 _accessibilitySetRetainedValue:0 forKey:*MEMORY[0x263F81490]];
  v6.receiver = v8;
  v6.super_class = (Class)UITextViewAccessibility;
  [(UITextViewAccessibility *)&v6 setAttributedText:location[0]];
  char v5 = [(UITextViewAccessibility *)v8 isFirstResponder] & 1;
  if (!location[0]
    || ([(UITextViewAccessibility *)v8 safeBoolForKey:@"hasText"] & 1) == 0 && (v5 & 1) != 0)
  {
    UIAccessibilityNotifications notification = *MEMORY[0x263F81438];
    v9[0] = *MEMORY[0x263F21C80];
    v10[0] = MEMORY[0x263EFFA88];
    v9[1] = *MEMORY[0x263F21C88];
    v10[1] = MEMORY[0x263EFFA88];
    id v4 = (id)[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    UIAccessibilityPostNotification(notification, v4);
  }
  objc_storeStrong(location, 0);
}

- (void)setSelectedRange:(_NSRange)a3
{
  _NSRange v13 = a3;
  v12 = self;
  SEL v11 = a2;
  char v10 = 0;
  if (([(UITextViewAccessibility *)self isFirstResponder] & 1) == 0
    || (uint64_t v8 = [(UITextViewAccessibility *)v12 selectedRange], v9 = v3, v8 == v13.location)
    && (uint64_t v6 = [(UITextViewAccessibility *)v12 selectedRange], v7 = v4, v4 == v13.length))
  {
    MEMORY[0x2455E6B10](*MEMORY[0x263F81340]);
    char v10 = 1;
  }
  v5.receiver = v12;
  v5.super_class = (Class)UITextViewAccessibility;
  -[UITextViewAccessibility setSelectedRange:](&v5, sel_setSelectedRange_, v13.location, v13.length);
  if (v10) {
    MEMORY[0x2455E6B10](0);
  }
}

- (BOOL)resignFirstResponder
{
  uint64_t v6 = self;
  SEL v5 = a2;
  char v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UITextViewAccessibility;
  char v4 = [(UITextViewAccessibility *)&v3 resignFirstResponder];
  -[UITextViewAccessibility _axClearCachedLinkData](v6);
  return v4 & 1;
}

- (double)_accessibilityFontSize
{
  id v4 = (id)[(UITextViewAccessibility *)self font];
  [v4 pointSize];
  double v5 = v2;

  return v5;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  CGPoint v34 = a3;
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v31 = [(UITextViewAccessibility *)v33 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v24 = 0;
  char v14 = 0;
  if (!v31)
  {
    uint64_t v25 = MEMORY[0x263EF8330];
    int v26 = -1073741824;
    int v27 = 0;
    v28 = __59__UITextViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v29 = &unk_2650AE580;
    v30 = v33;
    char v24 = 1;
    v23 = (id *)&v30;
    char v14 = ((uint64_t (*)(void))__59__UITextViewAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v14)
  {
    -[UITextViewAccessibility _accessibilitySetBoolValue:forKey:](v33, "_accessibilitySetBoolValue:forKey:", 1);
    id v22 = (id)-[UITextViewAccessibility accessibilityHitTest:withEvent:](v33, "accessibilityHitTest:withEvent:", location[0], v34.x, v34.y);
    [(UITextViewAccessibility *)v33 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    id v35 = v22;
    int v21 = 1;
    objc_storeStrong(&v22, 0);
  }
  else
  {
    int v21 = 0;
  }
  if (v24) {
    objc_storeStrong(v23, 0);
  }
  if (!v21)
  {
    if (!_AXSAutomationEnabled()) {
      goto LABEL_24;
    }
    memset(__b, 0, sizeof(__b));
    id obj = [(UITextViewAccessibility *)v33 automationElements];
    uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v36 count:16];
    if (v13)
    {
      uint64_t v9 = *(void *)__b[2];
      uint64_t v10 = 0;
      unint64_t v11 = v13;
      while (1)
      {
        uint64_t v8 = v10;
        if (*(void *)__b[2] != v9) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(id *)(__b[1] + 8 * v10);
        id v18 = (id)objc_msgSend(v20, "_accessibilityHitTest:withEvent:", location[0], v34.x, v34.y);
        if (v18)
        {
          id v35 = v18;
          int v21 = 1;
        }
        else
        {
          UIAccessibilityPointForPoint();
          point.x = v4;
          point.y = v5;
          [v20 accessibilityFrame];
          CGRect rect = v39;
          if (CGRectContainsPoint(v39, point))
          {
            id v35 = v20;
            int v21 = 1;
          }
          else
          {
            int v21 = 0;
          }
        }
        objc_storeStrong(&v18, 0);
        if (v21) {
          break;
        }
        ++v10;
        if (v8 + 1 >= v11)
        {
          uint64_t v10 = 0;
          unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v36 count:16];
          if (!v11) {
            goto LABEL_22;
          }
        }
      }
    }
    else
    {
LABEL_22:
      int v21 = 0;
    }

    if (!v21)
    {
LABEL_24:
      v15.receiver = v33;
      v15.super_class = (Class)UITextViewAccessibility;
      id v35 = -[UITextViewAccessibility _accessibilityHitTest:withEvent:](&v15, sel__accessibilityHitTest_withEvent_, location[0], v34.x, v34.y);
      int v21 = 1;
    }
  }
  objc_storeStrong(location, 0);
  uint64_t v6 = v35;

  return v6;
}

BOOL __59__UITextViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  id v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_onceToken_4;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_49);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  id v1 = (objc_class *)objc_opt_class();
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
      CGFloat v4 = v8;
      uint64_t v10 = v4;
      double v2 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v2);
      uint64_t v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_4;
}

void __59__UITextViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_4 = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      uint64_t v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      objc_super v3 = v7;
      uint64_t v9 = v3;
      double v2 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v2);
      uint64_t v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (void)_accessibilitySetValue:(id)a3
{
  char v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (id)[MEMORY[0x263F1C738] activeInstance];
    id v3 = (id)[v7 textInputTraits];
    char v4 = [v3 contentsIsSingleValue];

    id v5 = (id)[v7 textInputTraits];
    [v5 setContentsIsSingleValue:1];

    [(UITextViewAccessibility *)v10 setText:location[0]];
    id v6 = (id)[v7 textInputTraits];
    [v6 setContentsIsSingleValue:v4 & 1];

    -[UITextViewAccessibility keyboardInputChanged:](v10, "keyboardInputChanged:");
    objc_storeStrong(&v7, 0);
    int v8 = 0;
  }
  else
  {
    int v8 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)_accessibilitySupplementaryHeaderViews
{
  return (id)[(UITextViewAccessibility *)self _accessibleNonSupplementarySubviews];
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  char v24 = self;
  SEL v23 = a2;
  id v22 = a3;
  id v21 = (id)[(UITextViewAccessibility *)self _accessibilityAXAttributedValue];
  id location = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_msgSend((id)objc_msgSend(v21, "cfAttributedString"), "mutableCopy");
    id v4 = location;
    id location = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = (void *)[v21 mutableCopy];
      id v6 = location;
      id location = v5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v25 = 0;
        int v19 = 1;
        goto LABEL_13;
      }
      id v7 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v21];
      id v8 = location;
      id location = v7;
    }
  }
  NSUInteger length = v22->length;
  NSUInteger v26 = v22->location;
  NSUInteger v27 = length;
  if (v26 + length <= [location length])
  {
    id v17 = (id)objc_msgSend(location, "attributedSubstringFromRange:", v22->location, v22->length);
    char v10 = (void *)[v17 mutableCopy];
    id v11 = location;
    id location = v10;
  }
  if (!location)
  {
    v18.receiver = v24;
    v18.super_class = (Class)UITextViewAccessibility;
    id v16 = [(UITextViewAccessibility *)&v18 _accessibilityAttributedValueForRange:v22];
    id v12 = (void *)[v16 mutableCopy];
    id v13 = location;
    id location = v12;
  }
  [(UITextViewAccessibility *)v24 _accessibilityAddAutoCorrectionAttributes:location];
  [(UITextViewAccessibility *)v24 _accessibilityConvertStyleAttributesToAccessibility:location];
  [(UITextViewAccessibility *)v24 _accessibilityAddMispellingsToAttributedString:location];
  id v25 = location;
  int v19 = 1;
LABEL_13:
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v21, 0);
  uint64_t v14 = v25;

  return v14;
}

- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:(SEL)a3
{
  uint64_t v9 = self;
  SEL v8 = a2;
  SEL name = a3;
  id v12 = (dispatch_once_t *)&_accessibilityOverridesPotentiallyAttributedAPISelector__onceToken_1;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_499);
  if (*v12 != -1) {
    dispatch_once(v12, location);
  }
  objc_storeStrong(&location, 0);
  id v3 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v3, name);
  if (name == sel_accessibilityValue) {
    return InstanceMethod != (Method)_accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityValueBaseMethod_0;
  }
  if (name == sel_accessibilityAttributedValue) {
    return InstanceMethod != (Method)_accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedValueBaseMethod_0;
  }
  v5.receiver = v9;
  v5.super_class = (Class)UITextViewAccessibility;
  return [(UITextViewAccessibility *)&v5 _accessibilityOverridesPotentiallyAttributedAPISelector:name];
}

Method __83__UITextViewAccessibility__accessibilityOverridesPotentiallyAttributedAPISelector___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityValueBaseMethod_0 = (uint64_t)class_getInstanceMethod(v0, sel_accessibilityValue);
  id v1 = (objc_class *)objc_opt_class();
  Method result = class_getInstanceMethod(v1, sel_accessibilityAttributedValue);
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedValueBaseMethod_0 = (uint64_t)result;
  return result;
}

- (id)_accessibilityGetValue
{
  return -[UITextViewAccessibility _accessibilityGetValue:](self, "_accessibilityGetValue:", 0, a2, self);
}

- (id)_accessibilityGetValue:(BOOL)a3
{
  v63[1] = *MEMORY[0x263EF8340];
  v60 = self;
  SEL v59 = a2;
  BOOL v58 = a3;
  id v57 = 0;
  id v3 = (id)[(UITextViewAccessibility *)self accessibilityUserDefinedValue];
  BOOL v31 = v3 == 0;

  if (!v31)
  {
    id v4 = (id)[(UITextViewAccessibility *)v60 accessibilityUserDefinedValue];
    id v5 = v57;
    id v57 = v4;

LABEL_30:
    id v37 = (id)[(UITextViewAccessibility *)v60 safeValueForKey:@"textInputTraits"];
    id v20 = (id)[v37 safeValueForKey:@"isSecureTextEntry"];
    char v21 = [v20 BOOLValue];

    if (v21)
    {
      char v36 = 0;
      objc_opt_class();
      id v35 = (id)__UIAccessibilityCastAsClass();
      id v34 = v35;
      objc_storeStrong(&v35, 0);
      id v14 = -[UIView _accessibilitySecureTextForString:]((uint64_t)v34, v57);
      id v15 = v57;
      id v57 = v14;
    }
    if (![v57 length])
    {
      id v33 = [(UITextViewAccessibility *)v60 accessibilityPlaceholderValue];
      if (v33)
      {
        id v32 = (id)[objc_alloc(MEMORY[0x263F21660]) initWithString:v33];
        id v18 = v32;
        uint64_t v62 = *MEMORY[0x263F21820];
        v63[0] = MEMORY[0x263EFFA88];
        id v19 = (id)[NSDictionary dictionaryWithObjects:v63 forKeys:&v62 count:1];
        objc_msgSend(v18, "setAttributes:");

        objc_storeStrong(&v57, v32);
        objc_storeStrong(&v32, 0);
      }
      objc_storeStrong(&v33, 0);
    }
    id v61 = v57;
    int v39 = 1;
    objc_storeStrong(&v37, 0);
    goto LABEL_37;
  }
  char v55 = 0;
  objc_opt_class();
  id v30 = (id)[(UITextViewAccessibility *)v60 safeValueForKey:@"attributedText"];
  id v54 = (id)__UIAccessibilityCastAsClass();

  id v53 = v54;
  objc_storeStrong(&v54, 0);
  id v56 = v53;
  id v52 = (id)[MEMORY[0x263F1C738] activeInstance];
  id v28 = (id)[v52 delegate];
  char v29 = [v28 isEqual:v60];

  if ((v29 & 1) == 0
    || ([MEMORY[0x263F1C710] safeBoolForKey:@"presentsInlineTextCompletionAsMarkedText"] & 1) == 0)
  {
    goto LABEL_23;
  }
  id v25 = (id)[v52 inlineCompletionAsMarkedText];
  id v51 = (id)[v25 string];

  id v27 = (id)[v52 inputDelegate];
  id v26 = (id)[v27 markedTextRange];
  uint64_t v49 = [v26 safeRangeForKey:@"asRange"];
  uint64_t v50 = v6;

  char v46 = 0;
  char v44 = 0;
  if (v49 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v47 = (id)[v56 string];
    char v46 = 1;
    id v45 = (id)objc_msgSend(v47, "substringWithRange:", v49, v50);
    char v44 = 1;
    id v7 = v45;
  }
  id v48 = v7;
  if (v44) {

  }
  if (v46) {
  char v43 = [v48 isEqualToString:v51] & 1;
  }
  id v22 = (void *)MEMORY[0x263F21660];
  id v23 = (id)[v56 string];
  id v42 = (id)objc_msgSend(v22, "axAttributedStringWithString:");

  id v24 = (id)[v52 safeValueForKeyPath:@"inlineTextCompletionController.lastAcceptedTextCompletion"];
  id v41 = (id)[v24 safeStringForKey:@"candidate"];

  char v40 = 0;
  if (!v51) {
    goto LABEL_42;
  }
  if (v48 && (v43 & 1) != 0)
  {
    objc_msgSend(v42, "setAttribute:forKey:withRange:", v51, *MEMORY[0x263F216A8], v49, v50);
    char v40 = 1;
  }
  else
  {
LABEL_42:
    if (v41)
    {
      [v42 setAttribute:v41 forKey:*MEMORY[0x263F21698]];
      char v40 = 1;
    }
  }
  if ([v42 length] && (v40 & 1) != 0)
  {
    id v61 = v42;
    int v39 = 1;
  }
  else
  {
    int v39 = 0;
  }
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v51, 0);
  if (!v39)
  {
LABEL_23:
    if (v56)
    {
      if ([v56 length])
      {
        id v10 = (id)UIAccessibilityConvertAttachmentsInAttributedStringToAX();
        id v11 = v57;
        id v57 = v10;

        if (!v57)
        {
          id v12 = (id)[v56 string];
          id v13 = v57;
          id v57 = v12;
        }
      }
    }
    else
    {
      id v8 = (id)[(UITextViewAccessibility *)v60 safeValueForKey:@"text"];
      id v9 = v57;
      id v57 = v8;
    }
    int v39 = 0;
  }
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v56, 0);
  if (!v39) {
    goto LABEL_30;
  }
LABEL_37:
  objc_storeStrong(&v57, 0);
  id v16 = v61;

  return v16;
}

- (id)accessibilityValue
{
  if (-[UITextViewAccessibility _axIsOnlyOneLinkElement](self)) {
    id v4 = 0;
  }
  else {
    id v4 = [(UITextViewAccessibility *)self _accessibilityGetValue];
  }

  return v4;
}

- (uint64_t)_axIsOnlyOneLinkElement
{
  id v18 = a1;
  if (a1)
  {
    if ([v18 isEditable] & 1)
    {
      char v19 = 0;
    }
    else
    {
      id v16 = (id)[v18 _accessibilityValueForKey:@"AXOnlyHasOneLink"];
      if (v16)
      {
        char v19 = [v16 BOOLValue] & 1;
        int v15 = 1;
      }
      else
      {
        char v14 = 0;
        id v8 = (id)[v18 _accessibilityInternalTextLinks];
        BOOL v9 = [v8 count] != 1;

        if (!v9)
        {
          id v13 = (id)[v18 attributedText];
          uint64_t v11 = 0;
          uint64_t v12 = 0;
          id location = (id)[v13 attributesAtIndex:0 effectiveRange:&v11];
          id v1 = (id)[location objectForKey:*MEMORY[0x263F81520]];
          BOOL v7 = v1 == 0;

          if (!v7)
          {
            uint64_t v2 = [v13 length];
            uint64_t v25 = 0;
            uint64_t v24 = v2;
            uint64_t v26 = 0;
            uint64_t v27 = v2;
            uint64_t v22 = v11;
            uint64_t v23 = v12;
            uint64_t v20 = 0;
            uint64_t v21 = v2;
            BOOL v6 = 0;
            if (!v11) {
              BOOL v6 = v23 == v21;
            }
            if (v6) {
              char v14 = 1;
            }
          }
          objc_storeStrong(&location, 0);
          objc_storeStrong(&v13, 0);
        }
        id v4 = v18;
        id v5 = (id)[NSNumber numberWithBool:v14 & 1];
        objc_msgSend(v4, "_accessibilitySetRetainedValue:forKey:");

        -[UITextViewAccessibility _axRegisterForDDNotificationIfNeeded]((uint64_t)v18);
        char v19 = v14 & 1;
        int v15 = 1;
      }
      objc_storeStrong(&v16, 0);
    }
  }
  else
  {
    char v19 = 0;
  }
  return v19 & 1;
}

- (id)accessibilityAttributedValue
{
  id v5 = self;
  location[1] = (id)a2;
  if (-[UITextViewAccessibility _axIsOnlyOneLinkElement](self))
  {
    id v6 = 0;
  }
  else
  {
    location[0] = [(UITextViewAccessibility *)v5 _accessibilityGetValue];
    if ([location[0] isAXAttributedString])
    {
      id v6 = (id)[location[0] cfAttributedString];
    }
    else if (location[0])
    {
      id v6 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:location[0]];
    }
    else
    {
      id v6 = 0;
    }
    objc_storeStrong(location, 0);
  }
  uint64_t v2 = v6;

  return v2;
}

- (id)accessibilityLabel
{
  id v6 = self;
  SEL v5 = a2;
  if (-[UITextViewAccessibility _axIsOnlyOneLinkElement](self))
  {
    id v7 = [(UITextViewAccessibility *)v6 _accessibilityGetValue:1];
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UITextViewAccessibility;
    id v7 = [(UITextViewAccessibility *)&v4 accessibilityLabel];
  }
  uint64_t v2 = v7;

  return v2;
}

- (id)accessibilityPlaceholderValue
{
  char v14 = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  char v11 = 0;
  objc_opt_class();
  id v8 = (id)[(UITextViewAccessibility *)v14 safeValueForKey:@"_placeholderLabel"];
  id v10 = (id)__UIAccessibilityCastAsClass();

  id v9 = v10;
  objc_storeStrong(&v10, 0);
  id v12 = v9;
  if ([v9 _accessibilityViewIsVisible])
  {
    id v2 = (id)[v12 accessibilityLabel];
    id v3 = v13[0];
    v13[0] = v2;

    id v4 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v13[0]];
    id v5 = v13[0];
    v13[0] = v4;

    [v13[0] setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21820]];
  }
  id v7 = v13[0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);

  return v7;
}

- (void)setAttributedPlaceholder:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITextViewAccessibility;
  [(UITextViewAccessibility *)&v4 setAttributedPlaceholder:location[0]];
  id v3 = (id)[(UITextViewAccessibility *)v6 safeValueForKey:@"_placeholderLabel"];
  [v3 setIsAccessibilityElement:0];

  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  id v2 = (id)[(UITextViewAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v5 = v2 == 0;

  if (v5) {
    return ![(UITextViewAccessibility *)self _accessibilityTextViewShouldBreakUpParagraphs]&& (([(UITextViewAccessibility *)self _accessibilityViewIsVisible] & 1) != 0|| AXDoesRequestingClientDeserveAutomation());
  }
  id v4 = (id)[(UITextViewAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (BOOL)accessibilityActivate
{
  id v12 = self;
  v11[1] = (id)a2;
  id v5 = [(UITextViewAccessibility *)self _accessibilityInternalTextLinks];
  BOOL v6 = [v5 count] != 1;

  if (v6)
  {
    v7.receiver = v12;
    v7.super_class = (Class)UITextViewAccessibility;
    char v13 = [(UITextViewAccessibility *)&v7 accessibilityActivate];
  }
  else
  {
    char v10 = 0;
    objc_opt_class();
    id v4 = [(UITextViewAccessibility *)v12 _accessibilityInternalTextLinks];
    id v3 = (id)[v4 firstObject];
    id v9 = (id)__UIAccessibilityCastAsClass();

    id v8 = v9;
    objc_storeStrong(&v9, 0);
    v11[0] = v8;
    char v13 = -[UITextViewAccessibility _accessibilityActivateLink:](v12, v8) & 1;
    objc_storeStrong(v11, 0);
  }
  return v13 & 1;
}

- (uint64_t)_accessibilityActivateLink:(void *)a1
{
  id v60 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v60)
  {
    if ([v60 _accessibilityActivateTextViewLink:location] & 1)
    {
      char v61 = 1;
      int v58 = 1;
    }
    else
    {
      id v56 = (id)[v60 safeValueForKey:@"delegate"];
      if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
      {
        uint64_t v54 = [location range];
        uint64_t v55 = v2;
        char v53 = 0;
        if (objc_opt_respondsToSelector())
        {
          id v19 = v60;
          id v20 = (id)[location url];
          char v53 = objc_msgSend(v56, "textView:shouldInteractWithURL:inRange:interaction:", v19) & 1;
        }
        if (objc_opt_respondsToSelector())
        {
          id v17 = v60;
          id v18 = (id)[location url];
          char v53 = objc_msgSend(v56, "textView:shouldInteractWithURL:inRange:", v17) & 1;
        }
        if (v53)
        {
          id v52 = (id)[location textRangeForTextView:v60];
          long long v50 = 0u;
          long long v51 = 0u;
          [v60 firstRectForRange:v52];
          *(void *)&long long v50 = v3;
          *((void *)&v50 + 1) = v4;
          *(void *)&long long v51 = v5;
          *((void *)&v51 + 1) = v6;
          v41[1] = (id)MEMORY[0x263EF8330];
          int v42 = -1073741824;
          int v43 = 0;
          char v44 = __54__UITextViewAccessibility__accessibilityActivateLink___block_invoke;
          id v45 = &unk_2650AF5B0;
          id v46 = v60;
          long long v48 = v50;
          long long v49 = v51;
          id v47 = location;
          AXPerformSafeBlock();
          objc_storeStrong(&v47, 0);
          objc_storeStrong(&v46, 0);
          objc_storeStrong(&v52, 0);
        }
        char v61 = v53 & 1;
        int v58 = 1;
      }
      else
      {
        v41[0] = (id)[v60 safeValueForKeyPath:@"interactionAssistant.linkInteraction"];
        NSClassFromString(&cfstr_Uitextsimpleli.isa);
        char v38 = 0;
        if (objc_opt_isKindOfClass())
        {
          id v39 = (id)[v41[0] safeValueForKey:@"contextMenuInteraction"];
          char v38 = 1;
          id v7 = v39;
        }
        else
        {
          id v7 = 0;
        }
        id v40 = v7;
        if (v38) {

        }
        if (v41[0] && v40)
        {
          id v37 = (id)[location textRangeForTextView:v60];
          long long v35 = 0u;
          long long v36 = 0u;
          [v60 firstRectForRange:v37];
          *(void *)&long long v35 = v8;
          *((void *)&v35 + 1) = v9;
          *(void *)&long long v36 = v10;
          *((void *)&v36 + 1) = v11;
          objc_msgSend(v41[0], "_accessibilitySetBoolValue:forKey:", 1);
          v26[1] = (id)MEMORY[0x263EF8330];
          int v27 = -1073741824;
          int v28 = 0;
          char v29 = __54__UITextViewAccessibility__accessibilityActivateLink___block_invoke_2;
          id v30 = &unk_2650AF5B0;
          id v31 = v60;
          long long v33 = v35;
          long long v34 = v36;
          id v32 = v40;
          AXPerformSafeBlock();
          [v41[0] _accessibilitySetBoolValue:0 forKey:@"AXIsPerformingSimpleTap"];
          char v61 = 1;
          int v58 = 1;
          objc_storeStrong(&v32, 0);
          objc_storeStrong(&v31, 0);
          objc_storeStrong(&v37, 0);
        }
        else
        {
          v26[0] = (id)[location textRangeForTextView:v60];
          [v60 firstRectForRange:v26[0]];
          *(void *)&long long v24 = v12;
          *((void *)&v24 + 1) = v13;
          *(void *)&long long v25 = v14;
          *((void *)&v25 + 1) = v15;
          id v21 = v60;
          long long v22 = v24;
          long long v23 = v25;
          AXPerformSafeBlock();
          char v61 = 1;
          int v58 = 1;
          objc_storeStrong(&v21, 0);
          objc_storeStrong(v26, 0);
        }
        objc_storeStrong(&v40, 0);
        objc_storeStrong(v41, 0);
      }
      objc_storeStrong(&v56, 0);
    }
  }
  else
  {
    char v61 = 0;
    int v58 = 1;
  }
  objc_storeStrong(&location, 0);
  return v61 & 1;
}

void __54__UITextViewAccessibility__accessibilityActivateLink___block_invoke(uint64_t a1)
{
  v17[2] = (id)a1;
  v17[1] = (id)a1;
  uint64_t v9 = *(void **)(a1 + 32);
  CGRectGetMinX(*(CGRect *)(a1 + 48));
  AX_CGRectGetCenter();
  uint64_t v13 = v1;
  uint64_t v14 = v2;
  CGPointMake_11();
  double v15 = v3;
  double v16 = v4;
  v17[0] = (id)objc_msgSend(v9, "_textInteractableItemAtPoint:precision:", 0, v3, v4);
  NSClassFromString(&cfstr_Uitextinteract_1.isa);
  if (objc_opt_isKindOfClass())
  {
    char v12 = 0;
    objc_opt_class();
    id v7 = (id)[v17[0] safeValueForKey:@"link"];
    id v11 = (id)__UIAccessibilityCastAsClass();

    id v10 = v11;
    objc_storeStrong(&v11, 0);
    id v5 = (id)[*(id *)(a1 + 40) url];
    char v6 = objc_msgSend(v10, "isEqual:");

    if (v6) {
      [v17[0] invokeDefaultAction];
    }
  }
  objc_storeStrong(v17, 0);
}

void __54__UITextViewAccessibility__accessibilityActivateLink___block_invoke_2(void *a1)
{
  v5[2] = a1;
  v5[1] = a1;
  double v3 = (void *)a1[4];
  AX_CGRectGetCenter();
  v5[0] = (id)objc_msgSend(v3, "_textInteractableItemAtPoint:precision:", 0, v1, v2);
  [v5[0] setContextMenuInteraction:a1[5]];
  [v5[0] invokeDefaultAction];
  objc_storeStrong(v5, 0);
}

uint64_t __54__UITextViewAccessibility__accessibilityActivateLink___block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *(void **)(a1 + 32);
  AX_CGRectGetCenter();
  objc_msgSend(v8, "startInteractionWithLinkAtPoint:", v1, v2);
  uint64_t v9 = *(void **)(a1 + 32);
  AX_CGRectGetCenter();
  objc_msgSend(v9, "updateInteractionWithLinkAtPoint:", v3, v4);
  id v11 = *(void **)(a1 + 32);
  AX_CGRectGetCenter();
  return objc_msgSend(v11, "validateInteractionWithLinkAtPoint:", v5, v6);
}

- (BOOL)accessibilityContainsOneLink
{
  return -[UITextViewAccessibility _axIsOnlyOneLinkElement](self) & 1;
}

- (unint64_t)accessibilityTraits
{
  id v21 = self;
  SEL v20 = a2;
  id v2 = (id)[(UITextViewAccessibility *)self accessibilityUserDefinedTraits];
  BOOL v11 = v2 == 0;

  if (!v11)
  {
    id v9 = (id)[(UITextViewAccessibility *)v21 accessibilityUserDefinedTraits];
    uint64_t v10 = [v9 unsignedLongLongValue];

    unint64_t v19 = v10;
    if (v10 != *MEMORY[0x263F21AA8]) {
      return v19;
    }
  }
  if (-[UITextViewAccessibility _axIsOnlyOneLinkElement](v21)) {
    return *MEMORY[0x263F1CF10];
  }
  char v18 = [(UITextViewAccessibility *)v21 isEditable] & 1;
  unint64_t v17 = 0;
  if (v18) {
    unint64_t v17 = *MEMORY[0x263F81408] | *MEMORY[0x263F21B60];
  }
  else {
    unint64_t v17 = *MEMORY[0x263F1CF48] | *MEMORY[0x263F21B60];
  }
  id v6 = (id)[(UITextViewAccessibility *)v21 safeValueForKey:@"selectedRange"];
  uint64_t v15 = [v6 rangeValue];
  uint64_t v16 = v3;

  id v7 = (id)[(UITextViewAccessibility *)v21 safeValueForKey:@"isEditing"];
  BOOL v8 = 0;
  if ([v7 BOOLValue]) {
    BOOL v8 = v15 != 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v8
    && (_AXSMossdeepEnabled()
     || ([(id)*MEMORY[0x263F1D020] _accessibilityHardwareKeyboardActive] & 1) != 0
     || ([(id)*MEMORY[0x263F1D020] _accessibilitySoftwareKeyboardActive] & 1) != 0))
  {
    v17 |= *MEMORY[0x263F81398];
  }
  char v14 = 0;
  objc_opt_class();
  id v13 = (id)__UIAccessibilityCastAsClass();
  id v12 = v13;
  objc_storeStrong(&v13, 0);
  uint64_t v4 = -[UIView _accessibilityTextAreaTraits](v12);
  v17 |= v4;

  return v17;
}

- (id)_accessibilityForegroundTextColorAttribute
{
  return (id)[(UITextViewAccessibility *)self textColor];
}

- (id)accessibilityElements
{
  id v6 = self;
  SEL v5 = a2;
  if ([(UITextViewAccessibility *)self _accessibilityTextViewShouldBreakUpParagraphs])
  {
    id v7 = -[UITextViewAccessibility _accessibilityParagraphElements](v6);
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UITextViewAccessibility;
    id v7 = [(UITextViewAccessibility *)&v4 accessibilityElements];
  }
  id v2 = v7;

  return v2;
}

- (id)_accessibilityParagraphElements
{
  id v48 = a1;
  if (a1)
  {
    id v47 = (id)[v48 _accessibilityValueForKey:*MEMORY[0x263F81490]];
    if (v47)
    {
      id v49 = v47;
      int v46 = 1;
    }
    else
    {
      char v44 = 0;
      objc_opt_class();
      id v43 = (id)__UIAccessibilityCastAsClass();
      id v42 = v43;
      objc_storeStrong(&v43, 0);
      id v45 = v42;
      if (v42)
      {
        uint64_t v35 = 0;
        long long v36 = &v35;
        int v37 = 838860800;
        int v38 = 48;
        id v39 = __Block_byref_object_copy__24;
        id v40 = __Block_byref_object_dispose__24;
        id v41 = (id)[MEMORY[0x263EFF980] array];
        v29[0] = 0;
        v29[1] = v29;
        int v30 = 838860800;
        int v31 = 48;
        id v32 = __Block_byref_object_copy__24;
        long long v33 = __Block_byref_object_dispose__24;
        id v34 = (id)[MEMORY[0x263EFF980] array];
        id v28 = (id)[v48 _accessibilityAXAttributedValue];
        id v8 = (id)[v45 text];
        id v6 = (id)[v45 text];
        uint64_t v7 = [v6 length];
        uint64_t v55 = 0;
        uint64_t v54 = v7;
        uint64_t v56 = 0;
        uint64_t v57 = v7;
        uint64_t v26 = 0;
        uint64_t v27 = v7;
        v20[1] = (id)MEMORY[0x263EF8330];
        int v21 = -1073741824;
        int v22 = 0;
        long long v23 = __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke;
        long long v24 = &unk_2650AF6A0;
        long long v25 = v29;
        [v8 enumerateSubstringsInRange:0 options:v7 usingBlock:1];

        uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v20[0] = dispatch_queue_create("AXUITextViewLinkQueue", v3);

        id v4 = v28;
        uint64_t v5 = [v28 length];
        uint64_t v51 = 0;
        uint64_t v50 = v5;
        uint64_t v52 = 0;
        uint64_t v53 = v5;
        uint64_t v18 = 0;
        uint64_t v19 = v5;
        uint64_t v9 = MEMORY[0x263EF8330];
        int v10 = -1073741824;
        int v11 = 0;
        id v12 = __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke_2;
        id v13 = &unk_2650AF740;
        v17[1] = v29;
        id v14 = v48;
        id v15 = v20[0];
        id v16 = v28;
        v17[0] = v45;
        v17[2] = &v35;
        objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", v18, v19, 1, &v9);
        if ([(id)v36[5] count]) {
          [v48 _accessibilitySetRetainedValue:v36[5] forKey:*MEMORY[0x263F81490]];
        }
        id v49 = (id)v36[5];
        int v46 = 1;
        objc_storeStrong(v17, 0);
        objc_storeStrong(&v16, 0);
        objc_storeStrong(&v15, 0);
        objc_storeStrong(&v14, 0);
        objc_storeStrong(v20, 0);
        objc_storeStrong(&v28, 0);
        _Block_object_dispose(v29, 8);
        objc_storeStrong(&v34, 0);
        _Block_object_dispose(&v35, 8);
        objc_storeStrong(&v41, 0);
      }
      else
      {
        id v49 = MEMORY[0x263EFFA68];
        int v46 = 1;
      }
      objc_storeStrong(&v45, 0);
    }
    objc_storeStrong(&v47, 0);
  }
  else
  {
    id v49 = 0;
  }
  double v1 = v49;

  return v1;
}

- (id)_accessibilityTextSelectionRectWithLargestVisualRangeFromCandidates:(void *)a1
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v41 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v41)
  {
    char v37 = 0;
    objc_opt_class();
    id v36 = (id)__UIAccessibilityCastAsClass();
    id v35 = v36;
    objc_storeStrong(&v36, 0);
    id v38 = v35;
    id v34 = 0;
    double v33 = 0.0;
    memset(__b, 0, sizeof(__b));
    id obj = location;
    uint64_t v24 = [obj countByEnumeratingWithState:__b objects:v43 count:16];
    if (v24)
    {
      uint64_t v20 = *(void *)__b[2];
      uint64_t v21 = 0;
      unint64_t v22 = v24;
      while (1)
      {
        uint64_t v19 = v21;
        if (*(void *)__b[2] != v20) {
          objc_enumerationMutation(obj);
        }
        id v32 = *(id *)(__b[1] + 8 * v21);
        id v17 = v38;
        [v32 rect];
        double v26 = v2;
        double v27 = v3;
        double v28 = v4;
        double v29 = v5;
        id v18 = (id)[v38 superview];
        objc_msgSend(v17, "convertRect:toView:", v26, v27, v28, v29);
        r1.origin.x = v6;
        r1.origin.y = v7;
        r1.size.width = v8;
        r1.size.height = v9;

        [v41 frame];
        r2.origin.x = v10;
        r2.origin.y = v11;
        r2.size.width = v12;
        r2.size.height = v13;
        CGRect v46 = CGRectIntersection(r1, r2);
        double v14 = v46.size.width * v46.size.height;
        if (v46.size.width * v46.size.height > v33)
        {
          double v33 = v46.size.width * v46.size.height;
          objc_storeStrong(&v34, v32);
        }
        ++v21;
        if (v19 + 1 >= v22)
        {
          uint64_t v21 = 0;
          unint64_t v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v43, 16, v14);
          if (!v22) {
            break;
          }
        }
      }
    }

    id v42 = v34;
    int v39 = 1;
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v38, 0);
  }
  else
  {
    id v42 = 0;
    int v39 = 1;
  }
  objc_storeStrong(&location, 0);
  id v15 = v42;

  return v15;
}

- (id)accessibilityDragSourceDescriptors
{
  v20[1] = *MEMORY[0x263EF8340];
  id v18 = self;
  v17[1] = (id)a2;
  v17[0] = (id)[(UITextViewAccessibility *)self accessibilityUserDefinedDragSourceDescriptors];
  if (v17[0])
  {
    id v19 = v17[0];
    int v16 = 1;
  }
  else
  {
    char v14 = 0;
    objc_opt_class();
    id v13 = (id)__UIAccessibilityCastAsClass();
    id v12 = v13;
    objc_storeStrong(&v13, 0);
    id v15 = v12;
    id v11 = (id)[v12 selectedTextRange];
    if (v11 && ([v11 isEmpty] & 1) == 0)
    {
      id v10 = (id)[v15 selectionRectsForRange:v11];
      id v9 = -[UITextViewAccessibility _accessibilityTextSelectionRectWithLargestVisualRangeFromCandidates:](v18, v10);
      if (v9)
      {
        id v6 = objc_alloc(MEMORY[0x263F1C3B8]);
        id v8 = accessibilityLocalizedString(@"drag.selection");
        [v9 rect];
        UIRectGetCenter();
        id v7 = (id)objc_msgSend(v6, "initWithName:point:inView:", v8, v15, v2, v3);
        v20[0] = v7;
        id v19 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
      }
      else
      {
        id v19 = MEMORY[0x263EFFA68];
      }
      int v16 = 1;
      objc_storeStrong(&v9, 0);
      objc_storeStrong(&v10, 0);
    }
    else
    {
      id v19 = MEMORY[0x263EFFA68];
      int v16 = 1;
    }
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(v17, 0);
  double v4 = v19;

  return v4;
}

- (id)accessibilityDropPointDescriptors
{
  v53[1] = *MEMORY[0x263EF8340];
  id v49 = self;
  v48[1] = (id)a2;
  v48[0] = (id)[(UITextViewAccessibility *)self accessibilityUserDefinedDropPointDescriptors];
  if (v48[0])
  {
    id v50 = v48[0];
    int v47 = 1;
    goto LABEL_16;
  }
  char v45 = 0;
  objc_opt_class();
  id v44 = (id)__UIAccessibilityCastAsClass();
  id v43 = v44;
  objc_storeStrong(&v44, 0);
  id v46 = v43;
  id v42 = (id)[v43 textDropDelegate];
  if ([v46 isEditable] & 1) != 0 || (objc_opt_respondsToSelector())
  {
    id v41 = (id)[v46 selectedTextRange];
    if (v41)
    {
      if ([v41 isEmpty])
      {
        id v24 = v46;
        id v25 = (id)[v41 start];
        objc_msgSend(v24, "caretRectForPosition:");
        uint64_t v37 = v2;
        uint64_t v38 = v3;
        uint64_t v39 = v4;
        uint64_t v40 = v5;

        UIRectGetCenter();
        double v35 = v6;
        double v36 = v7;
        id v26 = objc_alloc(MEMORY[0x263F1C3B8]);
        id v28 = accessibilityLocalizedString(@"drop.at.point");
        id v27 = (id)objc_msgSend(v26, "initWithName:point:inView:", v35, v36);
        v53[0] = v27;
        id v50 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:1];

        int v47 = 1;
LABEL_14:
        objc_storeStrong(&v41, 0);
        goto LABEL_15;
      }
      id v34 = (id)[v46 selectionRectsForRange:v41];
      id v33 = -[UITextViewAccessibility _accessibilityTextSelectionRectWithLargestVisualRangeFromCandidates:](v49, v34);
      if (v33)
      {
        id v21 = objc_alloc(MEMORY[0x263F1C3B8]);
        id v23 = accessibilityLocalizedString(@"drop.on.selection");
        [v33 rect];
        UIRectGetCenter();
        id v22 = (id)objc_msgSend(v21, "initWithName:point:inView:", v23, v46, v8, v9);
        id v52 = v22;
        id v50 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];

        int v47 = 1;
      }
      else
      {
        int v47 = 0;
      }
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
      if (v47) {
        goto LABEL_14;
      }
    }
    id v16 = v46;
    [v46 frame];
    UIRectGetCenter();
    double v29 = v10;
    double v30 = v11;
    id v17 = (id)[v46 superview];
    [v16 convertPoint:v29 fromView:v30];
    double v31 = v12;
    double v32 = v13;

    id v18 = objc_alloc(MEMORY[0x263F1C3B8]);
    id v20 = accessibilityLocalizedString(@"drop.into.text");
    id v19 = (id)objc_msgSend(v18, "initWithName:point:inView:", v31, v32);
    id v51 = v19;
    id v50 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];

    int v47 = 1;
    goto LABEL_14;
  }
  id v50 = MEMORY[0x263EFFA68];
  int v47 = 1;
LABEL_15:
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v46, 0);
LABEL_16:
  objc_storeStrong(v48, 0);
  char v14 = v50;

  return v14;
}

- (CGPoint)accessibilityActivationPoint
{
  id v22 = self;
  location[1] = (id)a2;
  unint64_t v2 = [(UITextViewAccessibility *)self accessibilityTraits];
  if ((v2 & *MEMORY[0x263F81398]) != 0)
  {
    location[0] = (id)[(UITextViewAccessibility *)v22 selectedTextRange];
    id v16 = (id)[location[0] start];
    -[UITextViewAccessibility caretRectForPosition:](v22, "caretRectForPosition:");

    if (location[0] && ([location[0] isEmpty] & 1) == 0) {
      [(UITextViewAccessibility *)v22 firstRectForRange:location[0]];
    }
    UIAccessibilityFrameForBounds();
    v20.origin.x = v3;
    v20.origin.y = v4;
    v20.size.width = v5;
    v20.size.height = v6;
    CGRectGetMidX(v20);
    CGRectGetMidY(v20);
    CGPointMake_11();
    *(void *)&long long v23 = v7;
    *((void *)&v23 + 1) = v8;
    objc_storeStrong(location, 0);
  }
  else
  {
    id v15 = (id)[(UITextViewAccessibility *)v22 safeValueForKey:@"visibleTextRect"];
    [v15 rectValue];
    double v18 = v9;
    double v19 = v10;

    if (AX_CGSizeIsEmpty_0(v18, v19)) {
      [(UITextViewAccessibility *)v22 bounds];
    }
    [(UITextViewAccessibility *)v22 safeIntegerForKey:@"marginTop"];
    UIAccessibilityFrameForBounds();
    *(void *)&long long v17 = v11;
    *((void *)&v17 + 1) = v12;
    long long v23 = v17;
  }
  double v14 = *((double *)&v23 + 1);
  double v13 = *(double *)&v23;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGRect)accessibilityFrame
{
  [(UITextViewAccessibility *)self safeCGRectForKey:@"visibleTextRect"];
  if (AX_CGSizeIsEmpty_0(v2, v3)) {
    [(UITextViewAccessibility *)self bounds];
  }
  UIAccessibilityFrameForBounds();
  *(double *)id v16 = v5;
  *(double *)&v16[8] = v4;
  *(void *)&v16[16] = v6;
  *(void *)&v16[24] = v7;
  if (v5 < 0.0 || v4 < 0.0)
  {
    id v12 = (id)[(UITextViewAccessibility *)self _accessibilityWindow];
    [v12 frame];
    CGRect v18 = CGRectIntersection(v17, *(CGRect *)v16);
    *(CGFloat *)&long long v13 = v18.origin.x;
    *((void *)&v13 + 1) = *(void *)&v18.origin.y;
    *(CGFloat *)&long long v14 = v18.size.width;
    *((void *)&v14 + 1) = *(void *)&v18.size.height;
    *(_OWORD *)id v16 = v13;
    *(_OWORD *)&v16[16] = v14;
  }
  double v9 = *(double *)&v16[8];
  double v8 = *(double *)v16;
  double v11 = *(double *)&v16[24];
  double v10 = *(double *)&v16[16];
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  CGPoint v12 = a3;
  double v11 = self;
  SEL v10 = a2;
  [(UITextViewAccessibility *)self safeCGPointForKey:@"contentOffset"];
  double v7 = v3;
  double v8 = v4;
  BOOL v9 = !__CGPointEqualToPoint_2(v12.x, v12.y, v3, v4);
  v6.receiver = v11;
  v6.super_class = (Class)UITextViewAccessibility;
  -[UITextViewAccessibility setContentOffset:](&v6, sel_setContentOffset_, v12.x, v12.y);
  if (v9)
  {
    double v5 = v11;
    AXPerformBlockAsynchronouslyOnMainThread();
    objc_storeStrong((id *)&v5, 0);
  }
}

void __44__UITextViewAccessibility_setContentOffset___block_invoke(uint64_t a1)
{
  if (_AXSAuditInspectionModeEnabled()
    && ([*(id *)(a1 + 32) isAccessibilityElement] & 1) != 0
    || UIAccessibilityIsSwitchControlRunning()
    && ([*(id *)(a1 + 32) _accessibilityTextViewShouldBreakUpParagraphs] & 1) != 0)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  _NSRange v13 = a4;
  CGPoint v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  char v9 = 0;
  v8.receiver = v12;
  v8.super_class = (Class)UITextViewAccessibility;
  char v9 = -[UITextViewAccessibility keyboardInput:shouldReplaceTextInRange:replacementText:](&v8, sel_keyboardInput_shouldReplaceTextInRange_replacementText_, location[0], v13.location, v13.length, v10);
  if (!v9) {
    UIAccessibilityPostNotification(*MEMORY[0x263F812C8], 0);
  }
  char v6 = v9;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  long long v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  BOOL v11 = a5;
  char v10 = 0;
  v9.receiver = v14;
  v9.super_class = (Class)UITextViewAccessibility;
  char v10 = [(UITextViewAccessibility *)&v9 keyboardInput:location[0] shouldInsertText:v12 isMarkedText:a5];
  if ((v10 & 1) == 0) {
    UIAccessibilityPostNotification(*MEMORY[0x263F812C8], 0);
  }
  char v6 = v10;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  _NSRange v12 = a3;
  BOOL v11 = self;
  v10[1] = (id)a2;
  v10[0] = (id)[(UITextViewAccessibility *)self _accessibilityAXAttributedValue];
  if (!v10[0])
  {
    v10[0] = (id)[(UITextViewAccessibility *)v11 _accessibilityAXAttributedLabel];
  }
  char v9 = 0;
  if (AXIsDictationListening())
  {
    AXHandleUserInteractionForDictation(1);
    char v9 = 1;
  }
  id v8 = v11;
  if (v12.length || (location = v12.location, uint64_t v15 = 0, v12.location > [v10[0] length]))
  {
    if (v12.length) {
      [v11 _accessibilitySetTextSelection:v12.length];
    }
  }
  else
  {
    objc_msgSend(v8, "setSelectedRange:", v12.location, v12.length);
    if (([v8 isEditing] & 1) == 0)
    {
      id v6 = (id)[v8 beginningOfDocument];
      id v5 = (id)objc_msgSend(v8, "positionFromPosition:offset:");
      id v4 = (id)[v8 beginningOfDocument];
      _NSRange v13 = v12;
      id v3 = (id)objc_msgSend(v8, "positionFromPosition:offset:");
      id v7 = (id)objc_msgSend(v8, "textRangeFromPosition:toPosition:", v5);

      [v8 setSelectedTextRange:v7];
      objc_storeStrong(&v7, 0);
    }
  }
  if (v9) {
    AXHandleUserInteractionForDictation(0);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v10, 0);
}

- (BOOL)_allowCustomActionHintSpeakOverride
{
  return 1;
}

- (id)_accessibilityAttributedTextRetrieval
{
  return (id)[(UITextViewAccessibility *)self attributedText];
}

- (id)accessibilityCustomRotors
{
  id v16 = self;
  v15[1] = (id)a2;
  v15[0] = (id)[MEMORY[0x263EFF980] array];
  id v12 = v15[0];
  v14.receiver = v16;
  v14.super_class = (Class)UITextViewAccessibility;
  id v13 = [(UITextViewAccessibility *)&v14 accessibilityCustomRotors];
  objc_msgSend(v12, "axSafelyAddObjectsFromArray:");

  if ([(UITextViewAccessibility *)v16 _accessibilityTextViewShouldBreakUpParagraphs])
  {
    id v10 = v15[0];
    id v11 = -[UITextViewAccessibility _accessibilityParagraphLinksCustomRotor](v16);
    objc_msgSend(v10, "axSafelyAddObject:");
  }
  else
  {
    id v8 = v15[0];
    id v9 = (id)[(UITextViewAccessibility *)v16 _accessibilityInternalTextLinkCustomRotors];
    objc_msgSend(v8, "axSafelyAddObjectsFromArray:");

    if ([(UITextViewAccessibility *)v16 isEditable])
    {
      id v6 = v15[0];
      id v7 = (id)[(UITextViewAccessibility *)v16 _accessibilityCommonStylingRotors];
      objc_msgSend(v6, "axSafelyAddObjectsFromArray:");

      if (!AXUIKeyboardTypeSupportsMisspelledRotor([(UITextViewAccessibility *)v16 keyboardType]))
      {
        id v4 = v15[0];
        id v5 = (id)[(UITextViewAccessibility *)v16 _accessibilityMisspelledRotor];
        objc_msgSend(v4, "removeObject:");
      }
    }
  }
  id v3 = v15[0];
  objc_storeStrong(v15, 0);

  return v3;
}

- (id)_accessibilityParagraphLinksCustomRotor
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  double v29 = a1;
  if (a1)
  {
    id v15 = -[UITextViewAccessibility _accessibilityParagraphElements](v29);
    char v27 = 0;
    BOOL v14 = 0;
    if ([v15 count])
    {
      id v28 = -[UITextViewAccessibility _accessibilityParagraphElementsWithLinks](v29);
      char v27 = 1;
      BOOL v14 = [v28 count] != 0;
    }
    if (v27) {

    }
    if (v14)
    {
      id v26 = (id)[v29 _accessibilityValueForKey:@"AXParagraphLinkRotor"];
      if (!v26)
      {
        objc_initWeak(&location, v29);
        id v13 = objc_alloc(MEMORY[0x263F1C398]);
        uint64_t v19 = MEMORY[0x263EF8330];
        int v20 = -1073741824;
        int v21 = 0;
        id v22 = __66__UITextViewAccessibility__accessibilityParagraphLinksCustomRotor__block_invoke;
        long long v23 = &unk_2650AF678;
        objc_copyWeak(&v24, &location);
        id v12 = (void *)[v13 initWithSystemType:1 itemSearchBlock:&v19];
        id v1 = v26;
        id v26 = v12;

        uint64_t v18 = 0;
        memset(__b, 0, sizeof(__b));
        id obj = -[UITextViewAccessibility _accessibilityParagraphElementsWithLinks](v29);
        uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
        if (v11)
        {
          uint64_t v7 = *(void *)__b[2];
          uint64_t v8 = 0;
          unint64_t v9 = v11;
          while (1)
          {
            uint64_t v6 = v8;
            if (*(void *)__b[2] != v7) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(__b[1] + 8 * v8);
            id v4 = (id)-[_AXUITextViewParagraphElement links](v17);
            uint64_t v5 = [v4 count];
            v18 += v5;

            ++v8;
            if (v6 + 1 >= v9)
            {
              uint64_t v8 = 0;
              unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
              if (!v9) {
                break;
              }
            }
          }
        }

        [v26 setLinkCount:v18];
        [v29 _accessibilitySetRetainedValue:v26 forKey:@"AXParagraphLinkRotor"];
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
      id v30 = v26;
      objc_storeStrong(&v26, 0);
    }
    else
    {
      id v30 = 0;
    }
  }
  else
  {
    id v30 = 0;
  }
  double v2 = v30;

  return v2;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  _NSRange v71 = a3;
  v70 = self;
  SEL v69 = a2;
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(UITextViewAccessibility *)v70 accessibilityFrame];
    *(void *)&long long v72 = v3;
    *((void *)&v72 + 1) = v4;
    *(void *)&long long v73 = v5;
    *((void *)&v73 + 1) = v6;
  }
  else
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v72 = *MEMORY[0x263F001A8];
    long long v73 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    if ([(UITextViewAccessibility *)v70 isEditable])
    {
      v66.receiver = v70;
      v66.super_class = (Class)UITextViewAccessibility;
      [(UITextViewAccessibility *)&v66 _accessibilityBoundsForRange:v71];
      *(void *)&long long v67 = v7;
      *((void *)&v67 + 1) = v8;
      *(void *)&long long v68 = v9;
      *((void *)&v68 + 1) = v10;
      long long v72 = v67;
      long long v73 = v68;
    }
    id v65 = (id)[(UITextViewAccessibility *)v70 safeValueForKey:@"_textLayoutController"];
    if (__CGSizeEqualToSize_2(*MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8), *(double *)&v73, *((double *)&v73 + 1))&& ([v65 safeBoolForKey:@"canAccessLayoutManager"] & 1) != 0)
    {
      char v63 = 0;
      objc_opt_class();
      id v32 = (id)[v65 safeValueForKey:@"layoutManager"];
      id v62 = (id)__UIAccessibilityCastAsClass();

      id v61 = v62;
      objc_storeStrong(&v62, 0);
      id v64 = v61;
      char v59 = 0;
      objc_opt_class();
      id v31 = (id)[(UITextViewAccessibility *)v70 safeValueForKey:@"_textContainer"];
      id v58 = (id)__UIAccessibilityCastAsClass();

      id v57 = v58;
      objc_storeStrong(&v58, 0);
      id v60 = v57;
      [v64 boundingRectForGlyphRange:v71 inTextContainer:v57];
      uint64_t v51 = v11;
      uint64_t v52 = v12;
      uint64_t v53 = v13;
      uint64_t v54 = v14;
      UIAccessibilityFrameForBounds();
      *(void *)&long long v55 = v15;
      *((void *)&v55 + 1) = v16;
      *(void *)&long long v56 = v17;
      *((void *)&v56 + 1) = v18;
      long long v72 = v55;
      long long v73 = v56;
      long long v49 = 0u;
      long long v50 = 0u;
      char v48 = 0;
      objc_opt_class();
      id v47 = (id)__UIAccessibilityCastAsClass();
      id v46 = v47;
      objc_storeStrong(&v47, 0);
      [v46 textContainerInset];
      *(void *)&long long v49 = v19;
      *((void *)&v49 + 1) = v20;
      *(void *)&long long v50 = v21;
      *((void *)&v50 + 1) = v22;

      *(double *)&long long v72 = *(double *)&v72 + *((double *)&v49 + 1);
      *((double *)&v72 + 1) = *((double *)&v72 + 1) + *(double *)&v49;
      objc_storeStrong(&v60, 0);
      objc_storeStrong(&v64, 0);
    }
    else if (__CGSizeEqualToSize_2(*MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8), *(double *)&v73, *((double *)&v73 + 1)))
    {
      NSClassFromString(&cfstr_Uitextkit2layo.isa);
      if (objc_opt_isKindOfClass())
      {
        uint64_t v35 = 0;
        double v36 = &v35;
        int v37 = 0x10000000;
        int v38 = 64;
        uint64_t v39 = &unk_24046C852;
        long long v40 = 0u;
        long long v41 = 0u;
        v33[1] = &v35;
        v33[0] = v65;
        _NSRange v34 = v71;
        AXPerformSafeBlock();
        long long v42 = *((_OWORD *)v36 + 2);
        long long v43 = *((_OWORD *)v36 + 3);
        objc_storeStrong(v33, 0);
        _Block_object_dispose(&v35, 8);
        UIAccessibilityFrameForBounds();
        *(void *)&long long v44 = v23;
        *((void *)&v44 + 1) = v24;
        *(void *)&long long v45 = v25;
        *((void *)&v45 + 1) = v26;
        long long v72 = v44;
        long long v73 = v45;
      }
    }
    objc_storeStrong(&v65, 0);
  }
  double v28 = *((double *)&v72 + 1);
  double v27 = *(double *)&v72;
  double v30 = *((double *)&v73 + 1);
  double v29 = *(double *)&v73;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

__n128 __56__UITextViewAccessibility__accessibilityBoundsForRange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "boundingRectForCharacterRange:", *(void *)(a1 + 48), *(void *)(a1 + 56));
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

- (int64_t)accessibilityContainerType
{
  return 0;
}

- (id)_accessibilityInternalTextLinks
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v24 = self;
  v23[1] = (id)a2;
  v22.receiver = self;
  v22.super_class = (Class)UITextViewAccessibility;
  v23[0] = [(UITextViewAccessibility *)&v22 _accessibilityInternalTextLinks];
  memset(__b, 0, sizeof(__b));
  id obj = v23[0];
  uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
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
      id v21 = *(id *)(__b[1] + 8 * v7);
      objc_initWeak(&location, v21);
      objc_initWeak(&from, v24);
      id v4 = v21;
      uint64_t v11 = MEMORY[0x263EF8330];
      int v12 = -1073741824;
      int v13 = 0;
      uint64_t v14 = __58__UITextViewAccessibility__accessibilityInternalTextLinks__block_invoke;
      uint64_t v15 = &unk_2650AF628;
      objc_copyWeak(&v16, &from);
      objc_copyWeak(&v17, &location);
      [v4 setAccessibilityActivateBlock:&v11];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  -[UITextViewAccessibility _axRegisterForDDNotificationIfNeeded]((uint64_t)v24);
  id v3 = v23[0];
  objc_storeStrong(v23, 0);

  return v3;
}

uint64_t __58__UITextViewAccessibility__accessibilityInternalTextLinks__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = -[UITextViewAccessibility _accessibilityActivateLink:](WeakRetained, v3);

  return v5 & 1;
}

- (BOOL)canBecomeFocused
{
  char v5 = self;
  SEL v4 = a2;
  if ([(UITextViewAccessibility *)self _accessibilityIsFocusForFocusEverywhereRunningForFocusItem])return 1; {
  if (([(UITextViewAccessibility *)v5 _accessibilityIsFKARunningForFocusItem] & 1) != 0
  }
    && ![(UITextViewAccessibility *)v5 isAccessibilityElement])
  {
    return 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)UITextViewAccessibility;
  return [(UITextViewAccessibility *)&v3 canBecomeFocused];
}

- (id)automationElements
{
  double v28 = self;
  v27[1] = (id)a2;
  v26.receiver = self;
  v26.super_class = (Class)UITextViewAccessibility;
  id v10 = [(UITextViewAccessibility *)&v26 automationElements];
  id v11 = (id)[v10 mutableCopy];
  char v24 = 0;
  if (v11)
  {
    id v2 = v11;
  }
  else
  {
    id v25 = (id)[MEMORY[0x263EFF980] array];
    char v24 = 1;
    id v2 = v25;
  }
  v27[0] = v2;
  if (v24) {

  }
  id v9 = (id)[(UITextViewAccessibility *)v28 safeValueForKey:@"interactionAssistant"];
  id v23 = (id)[v9 safeUIViewForKey:@"_selectionView"];

  if ([v23 _accessibilityViewIsVisible]) {
    [v27[0] addObject:v23];
  }
  objc_super v22 = v28;
  id v7 = (id)[(UITextViewAccessibility *)v22 textStorage];
  uint64_t v5 = *MEMORY[0x263F814A0];
  id v6 = (id)[(UITextViewAccessibility *)v22 textStorage];
  uint64_t v3 = [v6 length];
  uint64_t v30 = 0;
  uint64_t v29 = v3;
  uint64_t v31 = 0;
  uint64_t v32 = v3;
  uint64_t v20 = 0;
  uint64_t v21 = v3;
  uint64_t v12 = MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  uint64_t v15 = __45__UITextViewAccessibility_automationElements__block_invoke;
  id v16 = &unk_2650AF650;
  id v17 = v22;
  uint64_t v18 = v28;
  id v19 = v27[0];
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v5, v20, v21, 0, &v12);

  id v8 = v27[0];
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong((id *)&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(v27, 0);

  return v8;
}

void __45__UITextViewAccessibility_automationElements__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  *(void *)&long long v51 = a3;
  *((void *)&v51 + 1) = a4;
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v49[2] = a5;
  v49[1] = (id)a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v49[0] = location[0];
    id v48 = 0;
    id v5 = (id)[*(id *)(a1 + 32) textLayoutManager];
    BOOL v23 = v5 != 0;

    if (v23)
    {
      id v17 = (id)[*(id *)(a1 + 32) textLayoutManager];
      id v16 = (id)[*(id *)(a1 + 32) textLayoutManager];
      id v15 = (id)[v16 documentRange];
      id v14 = (id)[v15 location];
      id v26 = (id)objc_msgSend(v17, "locationFromLocation:withOffset:");

      id v18 = (id)[*(id *)(a1 + 32) textLayoutManager];
      id v10 = (id)[v18 viewProviderForTextAttachment:v49[0] location:v26];
      id v11 = v48;
      id v48 = v10;

      objc_storeStrong(&v26, 0);
    }
    else if (([(id)objc_opt_class() safeBoolForKey:@"_isTextLayoutManagerEnabled"] & 1) != 0 {
           && (objc_opt_respondsToSelector() & 1) != 0)
    }
    {
      id v47 = (id)[*(id *)(a1 + 40) safeValueForKey:@"_textLayoutController"];
      uint64_t v39 = 0;
      long long v40 = &v39;
      int v41 = 838860800;
      int v42 = 48;
      long long v43 = __Block_byref_object_copy__24;
      long long v44 = __Block_byref_object_dispose__24;
      id v45 = 0;
      uint64_t v32 = MEMORY[0x263EF8330];
      int v33 = -1073741824;
      int v34 = 0;
      uint64_t v35 = __45__UITextViewAccessibility_automationElements__block_invoke_599;
      double v36 = &unk_2650AF600;
      v37[1] = &v39;
      v37[0] = v47;
      long long v38 = v51;
      AXPerformSafeBlock();
      id v31 = (id)v40[5];
      objc_storeStrong(v37, 0);
      _Block_object_dispose(&v39, 8);
      objc_storeStrong(&v45, 0);
      id v46 = v31;
      char v29 = 0;
      objc_opt_class();
      id v22 = (id)[*(id *)(a1 + 40) safeValueForKey:@"_textContainer"];
      id v28 = (id)__UIAccessibilityCastAsClass();

      id v27 = v28;
      objc_storeStrong(&v28, 0);
      id v30 = v27;
      id v6 = (id)[v49[0] viewProviderForParentView:*(void *)(a1 + 32) location:v46 textContainer:v27];
      id v7 = v48;
      id v48 = v6;

      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v46, 0);
      objc_storeStrong(&v47, 0);
    }
    else
    {
      id v19 = *(void **)(a1 + 32);
      uint64_t v20 = v51;
      id v21 = (id)[v19 layoutManager];
      id v8 = (id)objc_msgSend(v49[0], "viewProviderForParentView:characterIndex:layoutManager:", v19, v20);
      id v9 = v48;
      id v48 = v8;
    }
    uint64_t v12 = *(void **)(a1 + 48);
    id v13 = (id)[v48 view];
    objc_msgSend(v12, "axSafelyAddObject:");

    objc_storeStrong(&v48, 0);
    objc_storeStrong(v49, 0);
  }
  objc_storeStrong(location, 0);
}

void __45__UITextViewAccessibility_automationElements__block_invoke_599(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _locationWithOffset:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (BOOL)replaceAnimatedTextPlaceholderWith:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)UITextViewAccessibility;
  char v6 = [(UITextViewAccessibility *)&v5 replaceAnimatedTextPlaceholderWith:location[0]];
  [(UITextViewAccessibility *)v8 _accessibilitySetRetainedValue:0 forKey:*MEMORY[0x263F81490]];
  char v4 = v6;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (void)removeAnimatedTextPlaceholders
{
  char v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UITextViewAccessibility;
  [(UITextViewAccessibility *)&v2 removeAnimatedTextPlaceholders];
  [(UITextViewAccessibility *)v4 _accessibilitySetRetainedValue:0 forKey:*MEMORY[0x263F81490]];
}

- (void)insertAnimatedTextPlaceholderAtLocation:(id)a3 numLines:(double)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UITextViewAccessibility;
  [(UITextViewAccessibility *)&v5 insertAnimatedTextPlaceholderAtLocation:location[0] numLines:a4];
  [(UITextViewAccessibility *)v8 _accessibilitySetRetainedValue:0 forKey:*MEMORY[0x263F81490]];
  objc_storeStrong(location, 0);
}

- (id)_replaceRange:(id)a3 withAttributedText:(id)a4 updatingSelection:(BOOL)a5
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  BOOL v11 = a5;
  v9.receiver = v14;
  v9.super_class = (Class)UITextViewAccessibility;
  id v10 = [(UITextViewAccessibility *)&v9 _replaceRange:location[0] withAttributedText:v12 updatingSelection:a5];
  [(UITextViewAccessibility *)v14 _accessibilitySetRetainedValue:0 forKey:*MEMORY[0x263F81490]];
  id v8 = v10;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);

  return v8;
}

- (BOOL)_accessibilityTextViewShouldBreakUpParagraphs
{
  id v8 = self;
  SEL v7 = a2;
  if ([(UITextViewAccessibility *)self isEditable] & 1) {
    return 0;
  }
  id v3 = [(UITextViewAccessibility *)v8 accessibilityLabel];
  BOOL v4 = [v3 length] == 0;

  if (!v4) {
    return 0;
  }
  if (([(UITextViewAccessibility *)v8 _accessibilityViewIsVisible] & 1) == 0) {
    return 0;
  }
  v5.receiver = v8;
  v5.super_class = (Class)UITextViewAccessibility;
  return [(UITextViewAccessibility *)&v5 _accessibilityTextViewShouldBreakUpParagraphs];
}

- (id)_accessibilityLinksForRange:(NSUInteger)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v19.id location = a2;
  v19.NSUInteger length = a3;
  id v18 = a1;
  if (a1)
  {
    id v12 = (id)[v18 _accessibilityInternalTextLinks];
    BOOL v13 = [v12 count] == 0;

    if (v13)
    {
      id v20 = MEMORY[0x263EFFA68];
    }
    else
    {
      id v17 = (id)[MEMORY[0x263EFF980] array];
      memset(__b, 0, sizeof(__b));
      id obj = (id)[v18 _accessibilityInternalTextLinks];
      uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
      if (v11)
      {
        uint64_t v7 = *(void *)__b[2];
        uint64_t v8 = 0;
        unint64_t v9 = v11;
        while (1)
        {
          uint64_t v6 = v8;
          if (*(void *)__b[2] != v7) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(id *)(__b[1] + 8 * v8);
          range2.id location = [v16 range];
          range2.NSUInteger length = v3;
          if (NSIntersectionRange(v19, range2).length) {
            [v17 addObject:v16];
          }
          ++v8;
          if (v6 + 1 >= v9)
          {
            uint64_t v8 = 0;
            unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
            if (!v9) {
              break;
            }
          }
        }
      }

      id v20 = v17;
      objc_storeStrong(&v17, 0);
    }
  }
  else
  {
    id v20 = 0;
  }
  BOOL v4 = v20;

  return v4;
}

- (id)_accessibilityParagraphElementsWithLinks
{
  id v18 = a1;
  if (a1)
  {
    id v17 = -[UITextViewAccessibility _accessibilityParagraphElements](v18);
    if ([v17 count])
    {
      uint64_t v9 = 0;
      id v10 = &v9;
      int v11 = 838860800;
      int v12 = 48;
      BOOL v13 = __Block_byref_object_copy__24;
      id v14 = __Block_byref_object_dispose__24;
      id v15 = (id)[MEMORY[0x263EFF980] array];
      uint64_t v3 = MEMORY[0x263EF8330];
      int v4 = -1073741824;
      int v5 = 0;
      uint64_t v6 = __67__UITextViewAccessibility__accessibilityParagraphElementsWithLinks__block_invoke;
      uint64_t v7 = &unk_2650AF768;
      uint64_t v8 = &v9;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:");
      id v19 = (id)v10[5];
      int v16 = 1;
      _Block_object_dispose(&v9, 8);
      objc_storeStrong(&v15, 0);
    }
    else
    {
      id v19 = MEMORY[0x263EFFA68];
      int v16 = 1;
    }
    objc_storeStrong(&v17, 0);
  }
  else
  {
    id v19 = 0;
  }
  id v1 = v19;

  return v1;
}

id __66__UITextViewAccessibility__accessibilityParagraphLinksCustomRotor__block_invoke(id *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v27[1] = a1;
  v27[0] = objc_loadWeakRetained(a1 + 4);
  id v26 = -[UITextViewAccessibility _accessibilityParagraphElementsWithLinks](v27[0]);
  id v25 = (id)[MEMORY[0x263EFF980] array];
  memset(__b, 0, sizeof(__b));
  id obj = v26;
  uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
  if (v19)
  {
    uint64_t v14 = *(void *)__b[2];
    uint64_t v15 = 0;
    unint64_t v16 = v19;
    while (1)
    {
      uint64_t v13 = v15;
      if (*(void *)__b[2] != v14) {
        objc_enumerationMutation(obj);
      }
      uint64_t v24 = *(void *)(__b[1] + 8 * v15);
      id v11 = v25;
      id v12 = (id)-[_AXUITextViewParagraphElement links](v24);
      objc_msgSend(v11, "axSafelyAddObjectsFromArray:");

      ++v15;
      if (v13 + 1 >= v16)
      {
        uint64_t v15 = 0;
        unint64_t v16 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
        if (!v16) {
          break;
        }
      }
    }
  }

  if ([v25 count])
  {
    id v7 = v25;
    id v9 = (id)[location[0] currentItem];
    id v8 = (id)[v9 targetElement];
    uint64_t v10 = objc_msgSend(v7, "indexOfObject:");

    uint64_t v21 = v10;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v21 = 0;
    }
    else if ([location[0] searchDirection])
    {
      ++v21;
    }
    else
    {
      --v21;
    }
    if (v21 < (unint64_t)[v25 count])
    {
      if (v21 >= 0) {
        uint64_t v5 = v21;
      }
      else {
        uint64_t v5 = [v25 count] - 1;
      }
      uint64_t v6 = v5;
    }
    else
    {
      uint64_t v6 = 0;
    }
    uint64_t v21 = v6;
    id v20 = objc_alloc_init(MEMORY[0x263F1C3A0]);
    id v4 = (id)[v25 objectAtIndex:v6];
    objc_msgSend(v20, "setTargetElement:");

    id v29 = v20;
    int v22 = 1;
    objc_storeStrong(&v20, 0);
  }
  else
  {
    id v29 = 0;
    int v22 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v27, 0);
  objc_storeStrong(location, 0);
  objc_super v2 = v29;

  return v2;
}

void __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v10 = a3;
  uint64_t v11 = a4;
  id location[2] = a5;
  id location[3] = a6;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = *(void **)(*(void *)(a1[4] + 8) + 40);
  id v8 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v10, v11);
  objc_msgSend(v7, "addObject:");

  objc_storeStrong(location, 0);
}

void __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id location[4] = a3;
  location[5] = a4;
  id location[2] = a5;
  id location[3] = a6;
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v41 = a7;
  uint64_t v40 = a1;
  long long v39 = 0uLL;
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    id v18 = (id)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) firstObject];
    *(void *)&long long v38 = [v18 rangeValue];
    *((void *)&v38 + 1) = v7;
    long long v39 = v38;

    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeObjectAtIndex:0];
  }
  else
  {
    uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v44 = 0;
    uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v47 = 0;
    long long v37 = 0x7FFFFFFFFFFFFFFFuLL;
    long long v39 = 0x7FFFFFFFFFFFFFFFuLL;
  }
  if ([location[0] length])
  {
    char v35 = 0;
    objc_opt_class();
    id v34 = (id)__UIAccessibilityCastAsClass();
    id v33 = v34;
    objc_storeStrong(&v34, 0);
    id v36 = v33;
    id v8 = [_AXUITextViewParagraphElement alloc];
    id v32 = [(_AXUITextViewParagraphElement *)v8 initWithAccessibilityContainer:v39 textRange:*((uint64_t *)&v39 + 1) links:0];
    id v16 = (id)[v36 text];
    BOOL v17 = (unint64_t)[v16 length] <= 0x2710;

    if (v17)
    {
      id v22 = [(UITextViewAccessibility *)*(void **)(a1 + 32) _accessibilityLinksForRange:*((NSUInteger *)&v39 + 1)];
      id v9 = [_AXUITextViewParagraphElement alloc];
      id v10 = [(_AXUITextViewParagraphElement *)v9 initWithAccessibilityContainer:v39 textRange:*((uint64_t *)&v39 + 1) links:v22];
      id v11 = v32;
      id v32 = v10;

      objc_storeStrong(&v22, 0);
    }
    else
    {
      objc_initWeak(&v31, *(id *)(a1 + 32));
      queue = *(NSObject **)(a1 + 40);
      uint64_t v23 = MEMORY[0x263EF8330];
      int v24 = -1073741824;
      int v25 = 0;
      id v26 = __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke_3;
      id v27 = &unk_2650AF718;
      objc_copyWeak(&v29, &v31);
      long long v30 = v39;
      id v28 = v32;
      dispatch_async(queue, &v23);
      objc_storeStrong(&v28, 0);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
    }
    if (([*(id *)(a1 + 48) isAXAttributedString] & 1) != 0
      && ([*(id *)(a1 + 48) hasAttributes] & 1) != 0
      && (void)v39 != 0x7FFFFFFFFFFFFFFFLL
      && (v43 = v39, unint64_t v14 = v39 + *((void *)&v39 + 1), v14 <= [*(id *)(a1 + 48) length]))
    {
      id v12 = (id)[*(id *)(a1 + 48) attributedString];
      id v21 = (id)[v12 attributedSubstringFromRange:v39];

      id v13 = (id)UIAccessibilityConvertAttachmentsInAttributedStringToAX();
      -[_AXUITextViewParagraphElement set_accessibilityContent:]((uint64_t)v32, v13);

      objc_storeStrong(&v21, 0);
    }
    else
    {
      -[_AXUITextViewParagraphElement set_accessibilityContent:]((uint64_t)v32, location[0]);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v32];
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v36, 0);
  }
  objc_storeStrong(location, 0);
}

void __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke_3(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  location[0] = [(UITextViewAccessibility *)WeakRetained _accessibilityLinksForRange:*(void *)(a1 + 56)];

  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  uint64_t v6 = __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke_4;
  uint64_t v7 = &unk_2650AF6F0;
  id v8 = *(id *)(a1 + 32);
  id v9 = location[0];
  objc_copyWeak(&v10, (id *)(a1 + 40));
  AXPerformBlockOnMainThread();
  objc_destroyWeak(&v10);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

void __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke_4(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v28 = a1;
  uint64_t v27 = a1;
  -[_AXUITextViewParagraphElement setLinks:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 40);
  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
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
      id v26 = *(id *)(__b[1] + 8 * v5);
      [v26 setAccessibilityContainer:*(void *)(a1 + 32)];
      objc_initWeak(&location, v26);
      id v2 = v26;
      uint64_t v17 = MEMORY[0x263EF8330];
      int v18 = -1073741824;
      int v19 = 0;
      id v20 = __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke_5;
      id v21 = &unk_2650AF6C8;
      objc_copyWeak(&v22, (id *)(a1 + 48));
      objc_copyWeak(&v23, &location);
      [v2 _setAccessibilityFrameBlock:&v17];
      id v1 = v26;
      uint64_t v10 = MEMORY[0x263EF8330];
      int v11 = -1073741824;
      int v12 = 0;
      id v13 = __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke_6;
      unint64_t v14 = &unk_2650AF628;
      objc_copyWeak(&v15, (id *)(a1 + 48));
      objc_copyWeak(v16, &location);
      [v1 _setAccessibilityActivateBlock:&v10];
      objc_destroyWeak(v16);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }
}

double __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = [v5 range];
  objc_msgSend(WeakRetained, "_accessibilityBoundsForRange:", v7, v1);
  double v8 = v2;

  return v8;
}

uint64_t __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke_6(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  char v8 = 0;
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = (id)__UIAccessibilityCastAsSafeCategory();

  id v6 = v7;
  objc_storeStrong(&v7, 0);
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = -[UITextViewAccessibility _accessibilityActivateLink:](v6, v2);

  return v3 & 1;
}

void __67__UITextViewAccessibility__accessibilityParagraphElementsWithLinks__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)-[_AXUITextViewParagraphElement links]((uint64_t)location[0]);
  BOOL v4 = [v3 count] == 0;

  if (!v4) {
    [*(id *)(*(void *)(a1[4] + 8) + 40) addObject:location[0]];
  }
  objc_storeStrong(location, 0);
}

@end