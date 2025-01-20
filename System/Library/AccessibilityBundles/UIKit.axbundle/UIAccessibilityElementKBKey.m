@interface UIAccessibilityElementKBKey
+ (id)variantKeysForKey:(void *)a1;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityActivatePanAlternate:(id)a3;
- (BOOL)_accessibilityAllowsAlternativeCharacterActivation;
- (BOOL)_accessibilityDismissAlternativeKeyPicker;
- (BOOL)_accessibilityHasVariantKeys;
- (BOOL)_accessibilityIsInternationalKeyboardKey;
- (BOOL)_accessibilityKeyboardKeyAllowsTouchTyping;
- (BOOL)_accessibilityKeyboardKeyHasSignificantAlternateActions;
- (BOOL)_accessibilityKeyboardSupportsGestureMode;
- (BOOL)_accessibilitySecondaryActivate;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_accessibilitySupportsSecondaryActivateAction;
- (BOOL)_accessibilityWasForcedToUseForeignKB;
- (BOOL)_allowCachingAccessibilityLabel;
- (BOOL)_performCapsLockDoubleTap;
- (BOOL)accessibilityActivate;
- (BOOL)allowsCaseChangeOnShift;
- (BOOL)isAccessibilityElement;
- (BOOL)isButtonType;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (id)_accessibilityKeyboardKeyEnteredString;
- (id)_accessibilityLabel;
- (id)_accessibilityLocalizedStringForKeyboardLocale:(uint64_t)a1;
- (id)_accessibilitySupportGesturesAttributes;
- (id)_accessibilityVariantKeys;
- (id)_axDualStringLabel;
- (id)_axLayoutStar;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)description;
- (id)initWithAccessibilityContainer:(void *)a3 key:;
- (uint64_t)_accessibilityActivateForPanAlternate:(char)a3 isSecondAlternate:;
- (uint64_t)_accessibilityActivateForPanAlternate:(char)a3 isSecondAlternate:(char)a4 isSecondaryActivate:;
- (uint64_t)_accessibilityIsDeleteKey;
- (uint64_t)_accessibilityIsKeySelected;
- (uint64_t)_axDisplaysGlobeKeyAsEmojiKey;
- (uint64_t)_axIsDictationKey;
- (uint64_t)_axIsShifted;
- (uint64_t)cachedVariantKeys;
- (uint64_t)changesOnShiftDown;
- (uint64_t)isUnaffectedByShiftLock;
- (uint64_t)key;
- (uint64_t)setChangesOnShiftDown:(uint64_t)result;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_applyCapitalLetterTransform;
- (void)setCachedVariantKeys:(uint64_t)a1;
- (void)setKey:(uint64_t)a1;
@end

@implementation UIAccessibilityElementKBKey

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  id v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = @"UIKeyboardLayoutStar";
  objc_msgSend(location[0], "validateClass:");
  [location[0] validateClass:@"UIKeyboardLayoutStar" isKindOfClass:@"UIView"];
  [location[0] validateClass:@"UIKeyboardLayoutStar" hasInstanceVariable:@"_keyplaneView" withType:"UIKBKeyplaneView"];
  v4 = "v";
  [location[0] validateClass:@"UIKBKeyplaneView" hasInstanceMethod:@"deactivateKeys" withFullSignature:0];
  v7 = "B";
  v3 = @"UITouch";
  [location[0] validateClass:"{CGPoint=dd}" hasInstanceMethod:"B" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"setTimestamp:", v4, "d", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"setPhase:", v4, "q", 0);
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"setActiveKey:", v4, "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"useDismissForMessagesWriteboard", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardImpl", @"_layout", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboadLayoutStarAccessibility", @"_accessibilityVisibleKeysByRow", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"globeKeyDisplaysAsEmojiKey", v7, 0);
  objc_storeStrong(v9, v8);
}

- (id)initWithAccessibilityContainer:(void *)a3 key:
{
  id v10 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  if (v10)
  {
    id v3 = v10;
    id v10 = 0;
    v6.receiver = v3;
    v6.super_class = (Class)UIAccessibilityElementKBKey;
    id v10 = objc_msgSendSuper2(&v6, sel_initWithAccessibilityContainer_, location);
    objc_storeStrong(&v10, v10);
    if (v10)
    {
      objc_storeStrong((id *)v10 + 7, v8);
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    int v7 = 1;
  }
  else
  {
    id v11 = 0;
    int v7 = 1;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v10, 0);
  return v11;
}

- (id)description
{
  id v8 = self;
  SEL v7 = a2;
  id v3 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityElementKBKey;
  id v4 = [(UIAccessibilityElementKBKey *)&v6 description];
  id v5 = (id)[v3 stringWithFormat:@"%@: Key:%@", v4, v8->_key];

  return v5;
}

- (BOOL)_accessibilityWasForcedToUseForeignKB
{
  return a1 && AXKBElementWasForcedToUseForeignKB();
}

- (id)_accessibilityLocalizedStringForKeyboardLocale:(uint64_t)a1
{
  uint64_t v5 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v5) {
    id v6 = AXKBElementLocalizedForKeyboardLocale(location);
  }
  else {
    id v6 = 0;
  }
  objc_storeStrong(&location, 0);
  v2 = v6;

  return v2;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)_accessibilitySupportsSecondaryActivateAction
{
  return 1;
}

- (BOOL)_accessibilityKeyboardKeyAllowsTouchTyping
{
  char v4 = 0;
  char v3 = 1;
  if (-[UIAccessibilityElementKBKey isButtonType]((id *)&self->super.super.super.isa))
  {
    id v5 = (id)[(UIKBTree *)self->_key name];
    char v4 = 1;
    char v3 = [v5 hasSuffix:@"Shift-Key"];
  }
  if (v4) {

  }
  return v3 & 1;
}

- (BOOL)isButtonType
{
  char v3 = a1;
  if (a1)
  {
    id v6 = (dispatch_once_t *)&isButtonType_onceToken;
    id location = 0;
    objc_storeStrong(&location, &__block_literal_global_9);
    if (*v6 != -1) {
      dispatch_once(v6, location);
    }
    objc_storeStrong(&location, 0);
    id v2 = (id)[v3[7] name];
    BOOL v4 = ([(id)isButtonType_AcceptableButtonTypes containsObject:v2] & 1) != 0
      || ([v3 _accessibilityIsInternationalKeyboardKey] & 1) != 0
      || (-[UIAccessibilityElementKBKey _axIsDictationKey](v3) & 1) != 0
      || [v3[7] variantType] == 5;
    objc_storeStrong(&v2, 0);
  }
  else
  {
    return 0;
  }
  return v4;
}

- (id)_axLayoutStar
{
  if (a1) {
    id v2 = (id)[a1 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uikeyboardlayo.isa)];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (BOOL)_accessibilityDismissAlternativeKeyPicker
{
  v13[2] = self;
  v13[1] = (id)a2;
  v13[0] = -[UIAccessibilityElementKBKey _axLayoutStar](self);
  id v4 = (id)[v13[0] safeValueForKey:@"_keyplaneView"];
  id v2 = (id)[v4 safeValueForKey:@"deactivateKeys"];

  argument[1] = (id)MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __72__UIAccessibilityElementKBKey__accessibilityDismissAlternativeKeyPicker__block_invoke;
  id v11 = &unk_2650ADF18;
  id v12 = v13[0];
  AXPerformSafeBlock();
  id v5 = (void *)MEMORY[0x263F21660];
  id v6 = accessibilityLocalizedString(@"alternative.keys.dismissed");
  argument[0] = (id)objc_msgSend(v5, "axAttributedStringWithString:");

  [argument[0] setAttribute:&unk_26F48E9D8 forKey:*MEMORY[0x263F216D8]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument[0]);
  objc_storeStrong(argument, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return 1;
}

uint64_t __72__UIAccessibilityElementKBKey__accessibilityDismissAlternativeKeyPicker__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActiveKey:", 0, a1, a1);
}

- (uint64_t)_accessibilityActivateForPanAlternate:(char)a3 isSecondAlternate:
{
  if (a1) {
    char v4 = -[UIAccessibilityElementKBKey _accessibilityActivateForPanAlternate:isSecondAlternate:isSecondaryActivate:](a1, a2 & 1, a3 & 1, 0) & 1;
  }
  else {
    char v4 = 0;
  }
  return v4 & 1;
}

- (uint64_t)_accessibilityActivateForPanAlternate:(char)a3 isSecondAlternate:(char)a4 isSecondaryActivate:
{
  v20 = a1;
  char v19 = a2 & 1;
  char v18 = a3 & 1;
  char v17 = a4 & 1;
  if (a1)
  {
    id v16 = -[UIAccessibilityElementKBKey _axLayoutStar](v20);
    if (v16)
    {
      uint64_t v5 = MEMORY[0x263EF8330];
      int v6 = -1073741824;
      int v7 = 0;
      int v8 = __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke;
      int v9 = &unk_2650AE648;
      id v10 = v16;
      id v11 = v20;
      char v12 = v19 & 1;
      char v13 = v18 & 1;
      char v14 = v17 & 1;
      AXPerformSafeBlock();
      char v21 = 1;
      int v15 = 1;
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v10, 0);
    }
    else
    {
      char v21 = 0;
      int v15 = 1;
    }
    objc_storeStrong(&v16, 0);
  }
  else
  {
    char v21 = 0;
  }
  return v21 & 1;
}

void __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke(uint64_t a1)
{
  uint64_t v25 = a1;
  uint64_t v24 = a1;
  [*(id *)(a1 + 32) _accessibilitySetBoolValue:1 forKey:@"IsActivatingAXKey"];
  memset(&v23[3], 0, 32);
  [*(id *)(*(void *)(a1 + 40) + 56) frame];
  *(CGRect *)&v23[3] = v26;
  CGRectGetMidX(v26);
  CGRectGetMidY(*(CGRect *)&v23[3]);
  CGPointMake_1();
  v23[1] = v1;
  v23[2] = v2;
  v23[0] = (id)AXUIMakeTouchForTouchesBeganAtLocation();
  char v3 = *(void **)(a1 + 32);
  id v4 = (id)[MEMORY[0x263EFFA08] setWithObject:v23[0]];
  objc_msgSend(v3, "touchesBegan:withEvent:");

  uint64_t v22 = 0x3F847AE147AE147BLL;
  id v6 = (id)[*(id *)(*(void *)(a1 + 40) + 56) name];
  char v7 = [v6 isEqualToString:@"Caps-Lock-Key"];

  if (v7) {
    uint64_t v22 = 0x3FC3333333333333;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    char v14 = __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_2;
    int v15 = &unk_2650AE5D0;
    id v16 = *(id *)(a1 + 40);
    CGRect v19 = *(CGRect *)&v23[3];
    char v21 = *(unsigned char *)(a1 + 49) & 1;
    id v17 = v23[0];
    uint64_t v20 = v22;
    id v18 = *(id *)(a1 + 32);
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    id v8 = v23[0];
    v9[1] = (id)v22;
    v9[0] = *(id *)(a1 + 32);
    char v10 = *(unsigned char *)(a1 + 50) & 1;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong(v9, 0);
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(v23, 0);
}

void __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = a1;
  uint64_t v26 = a1;
  CGFloat v25 = 0.0;
  id v12 = (id)[*(id *)(*(void *)(a1 + 32) + 56) secondaryRepresentedStrings];
  if ([v12 count] == 1)
  {
    CGFloat MidX = CGRectGetMidX(*(CGRect *)(a1 + 56));
  }
  else
  {
    uint64_t v1 = *(void *)(a1 + 56);
    uint64_t v2 = *(void *)(a1 + 64);
    uint64_t v3 = *(void *)(a1 + 72);
    uint64_t v4 = *(void *)(a1 + 80);
    if (*(unsigned char *)(a1 + 96)) {
      double v9 = CGRectGetMaxX(*(CGRect *)&v1) + 10.0;
    }
    else {
      double v9 = CGRectGetMinX(*(CGRect *)&v1) - 10.0;
    }
    CGFloat MidX = v9;
  }

  CGFloat v25 = MidX;
  long long v24 = 0uLL;
  CGRectGetMaxY(*(CGRect *)(a1 + 56));
  CGPointMake_1();
  *(void *)&long long v24 = v5;
  *((void *)&v24 + 1) = v6;
  uint64_t v16 = MEMORY[0x263EF8330];
  int v17 = -1073741824;
  int v18 = 0;
  CGRect v19 = __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_3;
  uint64_t v20 = &unk_2650AE5A8;
  id v21 = *(id *)(a1 + 40);
  v22[1] = *(id *)(a1 + 88);
  v22[0] = *(id *)(a1 + 48);
  long long v23 = v24;
  AXPerformSafeBlock();
  char v7 = *(void **)(a1 + 48);
  id v8 = (id)[MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
  objc_msgSend(v7, "touchesMoved:withEvent:");

  id v13 = *(id *)(a1 + 40);
  v14[1] = *(id *)(a1 + 88);
  v14[0] = *(id *)(a1 + 48);
  long long v15 = v24;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v22, 0);
  objc_storeStrong(&v21, 0);
}

uint64_t __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *(void **)(a1 + 32);
  double v5 = *(double *)(a1 + 48) / 2.0;
  [v6 timestamp];
  [v6 setTimestamp:v1 + v5];
  [*(id *)(a1 + 32) setPhase:1];
  id v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "convertPoint:toView:", 0, *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(v8, "_setLocationInWindow:resetPrevious:", 0, v2, v3);
}

void __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_4(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v12 = a1;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_5;
  id v8 = &unk_2650AE5A8;
  id v9 = *(id *)(a1 + 32);
  v10[1] = *(id *)(a1 + 48);
  v10[0] = *(id *)(a1 + 40);
  long long v11 = *(_OWORD *)(a1 + 56);
  AXPerformSafeBlock();
  double v2 = *(void **)(a1 + 40);
  id v3 = (id)[MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 32)];
  objc_msgSend(v2, "touchesEnded:withEvent:");

  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
}

uint64_t __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_5(uint64_t a1)
{
  int v6 = *(void **)(a1 + 32);
  double v5 = *(double *)(a1 + 48) / 2.0;
  [v6 timestamp];
  [v6 setTimestamp:v1 + v5];
  [*(id *)(a1 + 32) setPhase:3];
  id v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "convertPoint:toView:", 0, *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(v8, "_setLocationInWindow:resetPrevious:", 0, v2, v3);
}

void __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_6(uint64_t a1)
{
  v7[3] = (id)a1;
  v7[2] = (id)a1;
  [*(id *)(a1 + 32) setPhase:3];
  double v2 = *(void **)(a1 + 32);
  [v2 timestamp];
  [v2 setTimestamp:v1 + *(double *)(a1 + 48)];
  double v3 = *(void **)(a1 + 40);
  id v4 = (id)[MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 32)];
  objc_msgSend(v3, "touchesEnded:withEvent:");

  if (*(unsigned char *)(a1 + 56))
  {
    id v6 = *(id *)(a1 + 32);
    v7[1] = *(id *)(a1 + 48);
    v7[0] = *(id *)(a1 + 40);
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong(v7, 0);
    objc_storeStrong(&v6, 0);
  }
}

void __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_7(uint64_t a1)
{
  v7[3] = (id)a1;
  v7[2] = (id)a1;
  [*(id *)(a1 + 32) setPhase:0];
  double v2 = *(void **)(a1 + 32);
  [v2 timestamp];
  [v2 setTimestamp:v1 + *(double *)(a1 + 48)];
  double v3 = *(void **)(a1 + 40);
  id v4 = (id)[MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 32)];
  objc_msgSend(v3, "touchesBegan:withEvent:");

  id v6 = *(id *)(a1 + 32);
  v7[1] = *(id *)(a1 + 48);
  v7[0] = *(id *)(a1 + 40);
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong(v7, 0);
  objc_storeStrong(&v6, 0);
}

void __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) setPhase:3];
  double v2 = *(void **)(a1 + 32);
  [v2 timestamp];
  [v2 setTimestamp:v1 + *(double *)(a1 + 48)];
  id v4 = *(void **)(a1 + 40);
  id v5 = (id)[MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 32)];
  objc_msgSend(v4, "touchesEnded:withEvent:");
}

- (unint64_t)_accessibilityAutomationType
{
  return 20;
}

- (BOOL)accessibilityActivate
{
  return -[UIAccessibilityElementKBKey _accessibilityActivateForPanAlternate:isSecondAlternate:](self, 0, 0) & 1;
}

- (BOOL)_accessibilitySecondaryActivate
{
  return -[UIAccessibilityElementKBKey _accessibilityActivateForPanAlternate:isSecondAlternate:isSecondaryActivate:](self, 0, 0, 1) & 1;
}

- (uint64_t)_axIsDictationKey
{
  id v10 = a1;
  if (a1)
  {
    id v9 = (id)[v10 _accessibilityValueForKey:@"AXIsDictationKey"];
    if (v9)
    {
      char v11 = [v9 BOOLValue] & 1;
      int v8 = 1;
    }
    else
    {
      id v7 = (id)[v10 safeValueForKey:@"key"];
      id v3 = (id)[v7 properties];
      id v2 = (id)[v3 objectForKey:*MEMORY[0x263F1D3B0]];
      BOOL v4 = [v2 intValue] == 4;

      id v5 = v10;
      id v6 = (id)[NSNumber numberWithBool:v4];
      objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:");

      char v11 = v4;
      int v8 = 1;
      objc_storeStrong(&v7, 0);
    }
    objc_storeStrong(&v9, 0);
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

- (id)_accessibilityKeyboardKeyEnteredString
{
  id v3 = (id)[(UIKBTree *)self->_key properties];
  id v4 = (id)[v3 objectForKey:*MEMORY[0x263F1D3C0]];

  return v4;
}

- (BOOL)isAccessibilityElement
{
  if (([(UIKBTree *)self->_key visible] & 1) == 0
    || [(UIKBTree *)self->_key displayType] == 1)
  {
    return 0;
  }
  if ([(UIKBTree *)self->_key ghost]) {
    return 0;
  }
  id v3 = [(UIAccessibilityElementKBKey *)self accessibilityLabel];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)accessibilityValue
{
  int v8 = self;
  location[1] = (id)a2;
  if (!self->_key)
  {
    id v9 = 0;
    goto LABEL_13;
  }
  location[0] = (id)[(UIKBTree *)v8->_key name];
  if (([location[0] hasSuffix:@"Shift-Key"] & 1) == 0)
  {
    if ([(UIAccessibilityElementKBKey *)v8 _accessibilityIsInternationalKeyboardKey])
    {
      if (-[UIAccessibilityElementKBKey _axDisplaysGlobeKeyAsEmojiKey](v8))
      {
        id v9 = 0;
      }
      else
      {
        BOOL KeyboardKeys = UIAXRequiresTwoNextKeyboardKeys();
        id v9 = UIAXNextKeyboardValue(KeyboardKeys);
      }
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v5 = (id)[MEMORY[0x263F1C738] sharedInstance];
  char v6 = [v5 isShiftLocked];

  if ((v6 & 1) == 0)
  {
LABEL_11:
    id v9 = 0;
    goto LABEL_12;
  }
  id v9 = accessibilityLocalizedString(@"caps.lock.enabled");
LABEL_12:
  objc_storeStrong(location, 0);
LABEL_13:
  id v3 = v9;

  return v3;
}

- (uint64_t)_axDisplaysGlobeKeyAsEmojiKey
{
  if (a1)
  {
    id v2 = -[UIAccessibilityElementKBKey _axLayoutStar](a1);
    char v3 = [v2 safeBoolForKey:@"globeKeyDisplaysAsEmojiKey"] & 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (id)accessibilityIdentifier
{
  uint64_t v27 = self;
  location[1] = (id)a2;
  id v17 = (id)[(UIKBTree *)self->_key name];
  char v18 = [v17 isEqualToString:@"Return-Key"];

  if (v18)
  {
    location[0] = (id)[MEMORY[0x263F1C738] sharedInstance];
    unsigned int v2 = [location[0] returnKeyType];
    if (v2)
    {
      uint64_t v4 = v2;
      char v3 = 1;
    }
    else
    {
      uint64_t v4 = 0;
      char v3 = 0;
    }
    if (v3)
    {
      int v25 = 0;
    }
    else
    {
      switch(v4)
      {
        case 0:
          v28 = @"Return";
          int v25 = 1;
          break;
        case 1:
          v28 = @"Go";
          int v25 = 1;
          break;
        case 2:
          v28 = @"Google";
          int v25 = 1;
          break;
        case 3:
          v28 = @"Join:";
          int v25 = 1;
          break;
        case 4:
          v28 = @"Next:";
          int v25 = 1;
          break;
        case 5:
          v28 = @"Route";
          int v25 = 1;
          break;
        case 6:
          v28 = @"Search";
          int v25 = 1;
          break;
        case 7:
          v28 = @"Send";
          int v25 = 1;
          break;
        case 8:
          v28 = @"Yahoo";
          int v25 = 1;
          break;
        case 9:
          v28 = @"Done";
          int v25 = 1;
          break;
        case 10:
          v28 = @"Emergency call";
          int v25 = 1;
          break;
        default:
          JUMPOUT(0);
      }
    }
    objc_storeStrong(location, 0);
    if (!v25)
    {
LABEL_41:
      id v20 = (id)[(UIKBTree *)v27->_key name];
      if ([v20 isEqualToString:@"Voiced-Sound-Mark-And-Semi-Voiced-Sound-Mark-And-Small-Variation"])
      {
        v28 = (__CFString *)(id)[(UIKBTree *)v27->_key representedString];
      }
      else
      {
        v19.receiver = v27;
        v19.super_class = (Class)UIAccessibilityElementKBKey;
        v28 = (__CFString *)[(UIAccessibilityElementKBKey *)&v19 accessibilityIdentifier];
      }
      int v25 = 1;
      objc_storeStrong(&v20, 0);
    }
  }
  else
  {
    id v15 = (id)[(UIKBTree *)v27->_key name];
    char v16 = [v15 isEqualToString:@"Tab-Key"];

    if (v16)
    {
      v28 = @"tab";
    }
    else
    {
      id v13 = (id)[(UIKBTree *)v27->_key name];
      char v23 = 0;
      char v14 = 1;
      if (([v13 isEqualToString:@"Delete-Key"] & 1) == 0)
      {
        id v24 = (id)[(UIKBTree *)v27->_key name];
        char v23 = 1;
        char v14 = [v24 isEqualToString:@"Monolith-Linear-Delete-Key"];
      }
      if (v23) {

      }
      if (v14)
      {
        v28 = @"delete";
      }
      else
      {
        id v11 = (id)[(UIKBTree *)v27->_key name];
        char v12 = [v11 isEqualToString:@"Shift-Key"];

        if (v12)
        {
          v28 = @"shift";
        }
        else
        {
          id v9 = (id)[(UIKBTree *)v27->_key name];
          char v10 = [v9 isEqualToString:@"Caps-Lock-Key"];

          if (v10)
          {
            v28 = @"caps-lock";
          }
          else if (-[UIAccessibilityElementKBKey _axIsDictationKey](v27))
          {
            v28 = @"dictation";
          }
          else
          {
            id v7 = (id)[(UIKBTree *)v27->_key name];
            char v21 = 0;
            char v8 = 1;
            if (([v7 hasSuffix:@"More-Key"] & 1) == 0)
            {
              id v22 = (id)[(UIKBTree *)v27->_key name];
              char v21 = 1;
              char v8 = [v22 isEqualToString:@"NumberPad-More"];
            }
            if (v21) {

            }
            if ((v8 & 1) == 0) {
              goto LABEL_41;
            }
            v28 = @"more";
          }
        }
      }
    }
  }
  id v5 = v28;

  return v5;
}

- (uint64_t)_axIsShifted
{
  id v7 = a1;
  if (a1)
  {
    id location = (id)[MEMORY[0x263F1C738] sharedInstance];
    char v4 = 0;
    char v3 = 1;
    if (([location isShifted] & 1) == 0)
    {
      LOBYTE(v2) = 0;
      if ([location isShiftLocked])
      {
        id v5 = -[UIAccessibilityElementKBKey _axLayoutStar](v7);
        char v4 = 1;
        int v2 = [v5 safeBoolForKey:@"isShiftKeyBeingHeld"] ^ 1;
      }
      char v3 = v2;
    }
    char v8 = v3 & 1;
    if (v4) {

    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

- (id)_accessibilityLabel
{
  v247 = a1;
  if (!a1)
  {
    id v248 = 0;
    goto LABEL_272;
  }
  char v246 = 0;
  char v245 = 0;
  id location = 0;
  char v243 = 0;
  v191 = (void *)MEMORY[0x263EFF960];
  id v194 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
  id v193 = (id)[v194 currentInputMode];
  id v192 = (id)[v193 primaryLanguage];
  BOOL v195 = objc_msgSend(v191, "characterDirectionForLanguage:") == 2;

  BOOL v242 = v195;
  if (v247[7])
  {
    if (-[UIAccessibilityElementKBKey _axIsDictationKey](v247))
    {
      id v248 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"dictation.key");
      int v241 = 1;
      goto LABEL_271;
    }
    id v240 = (id)[v247[7] name];
    int v239 = 0;
    int v239 = [v247[7] variantType];
    char v238 = 0;
    if ([v240 isEqualToString:@"NumberPad-Delete"])
    {
      char v246 = 1;
      id v1 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"delete.key");
      id v2 = location;
      id location = v1;

      goto LABEL_165;
    }
    if (([v240 isEqualToString:@"Delete-Key"] & 1) != 0
      || ([v240 isEqualToString:@"Monolith-Linear-Delete-Key"] & 1) != 0)
    {
      char v245 = 1;
      char v246 = 1;
      id v190 = (id)[v247[7] properties];
      id v3 = (id)[v190 valueForKey:*MEMORY[0x263F1D3A8]];
      id v4 = location;
      id location = v3;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Double-Em-Dash"])
    {
      char v246 = 1;
      id v5 = accessibilityLocalizedString(@"double.em.dash.key");
      id v6 = location;
      id location = v5;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Double-Horizontal-Ellipsis"])
    {
      char v246 = 1;
      id v7 = accessibilityLocalizedString(@"double.ellipsis.dash.key");
      id v8 = location;
      id location = v7;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Cut-Key"])
    {
      char v246 = 1;
      id v9 = accessibilityLocalizedString(@"cut.keyboard.key");
      id v10 = location;
      id location = v9;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Copy-Key"])
    {
      char v246 = 1;
      id v11 = accessibilityLocalizedString(@"copy.keyboard.key");
      id v12 = location;
      id location = v11;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Paste-Key"])
    {
      char v246 = 1;
      id v13 = accessibilityLocalizedString(@"paste.keyboard.key");
      id v14 = location;
      id location = v13;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Hebrew-Accents"])
    {
      char v246 = 1;
      id v15 = accessibilityLocalizedString(@"hebrew.accents.key");
      id v16 = location;
      id location = v15;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Bold-Key"])
    {
      char v246 = 1;
      id v17 = accessibilityLocalizedString(@"bold.keyboard.key");
      id v18 = location;
      id location = v17;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Undo-Key"])
    {
      char v246 = 1;
      id v19 = accessibilityLocalizedString(@"undo.keyboard.key");
      id v20 = location;
      id location = v19;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Roman-to-Non-Roman-Switch-Key"])
    {
      char v246 = 1;
      id v21 = accessibilityLocalizedString(@"switch.back.to.non.roman.key");
      id v22 = location;
      id location = v21;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Non-Roman-to-Roman-Switch-Key"])
    {
      char v246 = 1;
      id v23 = accessibilityLocalizedString(@"switch.to.roman.key");
      id v24 = location;
      id location = v23;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"BIU-Key"])
    {
      char v246 = 1;
      id v25 = accessibilityLocalizedString(@"biu.keyboard.key");
      id v26 = location;
      id location = v25;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Left-Arrow-Key"])
    {
      char v246 = 1;
      id v27 = accessibilityLocalizedString(@"left.arrow.keyboard.key");
      id v28 = location;
      id location = v27;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Right-Arrow-Key"])
    {
      char v246 = 1;
      id v29 = accessibilityLocalizedString(@"right.arrow.keyboard.key");
      id v30 = location;
      id location = v29;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Redo-Key"])
    {
      char v246 = 1;
      id v31 = accessibilityLocalizedString(@"redo.keyboard.key");
      id v32 = location;
      id location = v31;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Emoji"])
    {
      char v246 = 1;
      id v33 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"emoji.keyboard.key");
      id v34 = location;
      id location = v33;

      goto LABEL_165;
    }
    if ([v247 _accessibilityIsInternationalKeyboardKey])
    {
      char v246 = 1;
      if (-[UIAccessibilityElementKBKey _axDisplaysGlobeKeyAsEmojiKey](v247)) {
        id v35 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"global.keyboard.key.emoji");
      }
      else {
        id v35 = accessibilityLocalizedString(@"global.keyboard.key");
      }
      id v36 = location;
      id location = v35;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"Handwriting-Input"])
    {
      char v246 = 1;
      id v37 = accessibilityLocalizedString(@"handwriting.input.area");
      id v38 = location;
      id location = v37;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"FiftyOn-Fullwidth-Left-And-Right-Corner-Bracket-Right"])
    {
      char v246 = 1;
      id v39 = accessibilityLocalizedString(@"parentheses");
      id v40 = location;
      id location = v39;

      goto LABEL_165;
    }
    if ([v240 isEqualToString:@"FiftyOn-SymbolNumber-Keyplane-Switch-Key"])
    {
LABEL_69:
      char v245 = 1;
      char v246 = 1;
      id v55 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"more.numbers.key");
      id v56 = location;
      id location = v55;

      goto LABEL_165;
    }
    if (([v240 isEqualToString:@"TenKey-Alphabet-Keyplane-Switch-Key"] & 1) == 0)
    {
      if ([v240 isEqualToString:@"FiftyOn-Kana-Keyplane-Switch-Key"])
      {
        char v245 = 1;
        char v246 = 1;
        id v43 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"more.kana.key");
        id v44 = location;
        id location = v43;

        goto LABEL_165;
      }
      if ([v240 isEqualToString:@"TenKey-Pinyin-Keyplane-Switch-Key"])
      {
        char v245 = 1;
        char v246 = 1;
        id v45 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"more.pinyin.key");
        id v46 = location;
        id location = v45;

        goto LABEL_165;
      }
      if ([v240 isEqualToString:@"Multitap-Complete-Key"])
      {
        char v246 = 1;
        id v47 = accessibilityLocalizedString(@"keyboard.complete.key");
        id v48 = location;
        id location = v47;

        goto LABEL_165;
      }
      if ([v240 isEqualToString:@"Multitap-Reverse-Key"])
      {
        char v246 = 1;
        id v49 = accessibilityLocalizedString(@"keyboard.reverse.key");
        id v50 = location;
        id location = v49;

        goto LABEL_165;
      }
      if ([v240 isEqualToString:@"TenKey-Case-Swap"])
      {
        char v245 = 1;
        char v246 = 1;
        id v51 = accessibilityLocalizedString(@"keyboard.case.swap.key");
        id v52 = location;
        id location = v51;

        goto LABEL_165;
      }
      if ([v240 isEqualToString:@"Voiced-Sound-Mark-And-Semi-Voiced-Sound-Mark-And-Small-Variation"])
      {
        char v245 = 1;
        char v246 = 1;
        id v53 = accessibilityLocalizedString(@"keyboard.voice.sound.mark.key");
        id v54 = location;
        id location = v53;

        goto LABEL_165;
      }
      if (([v240 hasSuffix:@"TenKey-Alphabet-Keyplane-Switch-Key"] & 1) != 0
        || ([v240 hasSuffix:@"SymbolNumber-Keyplane-Switch-Key"] & 1) != 0)
      {
        goto LABEL_69;
      }
      if (([v240 hasSuffix:@"Alphabet-Keyplane-Switch-Key"] & 1) == 0)
      {
        if ([v240 hasSuffix:@"Monolith-Clear-Key"])
        {
          char v245 = 1;
          char v246 = 1;
          id v57 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"apple.tv.clear.key");
          id v58 = location;
          id location = v57;
        }
        else if ([v240 hasSuffix:@"Monolith-Capital-Letters-Keyplane-Switch-Key"])
        {
          char v245 = 1;
          char v246 = 1;
          id v59 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"Capital-Letters");
          id v60 = location;
          id location = v59;
        }
        else if ([v240 hasSuffix:@"Monolith-Small-Letters-Keyplane-Switch-Key"])
        {
          char v245 = 1;
          char v246 = 1;
          id v61 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"Small-Letters");
          id v62 = location;
          id location = v61;
        }
        else if ([v240 hasSuffix:@"Monolith-Numbers-Keyplane-Switch-Key"])
        {
          char v245 = 1;
          char v246 = 1;
          id v63 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"Numbers");
          id v64 = location;
          id location = v63;
        }
        else if ([v240 hasSuffix:@"Monolith-Punctuation-Keyplane-Switch-Key"])
        {
          char v245 = 1;
          char v246 = 1;
          id v65 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"Punctuation");
          id v66 = location;
          id location = v65;
        }
        else if ([v240 hasSuffix:@"Monolith-Recents-Keyplane-Switch-Key"])
        {
          char v245 = 1;
          char v246 = 1;
          id v67 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"Recents");
          id v68 = location;
          id location = v67;
        }
        else if (([v240 hasSuffix:@"More-Key"] & 1) != 0 {
               || ([v240 isEqualToString:@"NumberPad-More"] & 1) != 0)
        }
        {
          char v246 = 1;
          id v188 = -[UIAccessibilityElementKBKey _axLayoutStar](v247);
          id v187 = (id)[v188 safeValueForKey:@"displayTypeHintForMoreKey"];
          unsigned int v189 = [v187 intValue];

          unsigned int v237 = v189;
          if (v189 <= 1)
          {
            uint64_t v70 = v189 - 1;
            char v69 = 0;
          }
          else
          {
            uint64_t v70 = v189 - 1;
            char v69 = 1;
          }
          if (v69)
          {
            objc_storeStrong(&location, 0);
          }
          else
          {
            switch(v70)
            {
              case 0:
                id v71 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"more.letters.key");
                id v72 = location;
                id location = v71;

                break;
              case 1:
                id v73 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"more.numbers.key");
                id v74 = location;
                id location = v73;

                break;
              case 2:
                id v75 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"more.symbols.key");
                id v76 = location;
                id location = v75;

                break;
              case 3:
                id v77 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"more.phone.key");
                id v78 = location;
                id location = v77;

                break;
              case 4:
                id v79 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"more.glyph.key");
                id v80 = location;
                id location = v79;

                break;
              default:
                JUMPOUT(0);
            }
          }
          if (!location)
          {
            id v81 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"more.key");
            id v82 = location;
            id location = v81;
          }
          char v245 = 1;
        }
        else if ([v240 hasSuffix:@"Shift-Key"])
        {
          char v246 = 1;
          id v185 = -[UIAccessibilityElementKBKey _axLayoutStar](v247);
          id v184 = (id)[v185 safeValueForKey:@"displayTypeHintForShiftKey"];
          int v186 = [v184 intValue];

          int v236 = v186;
          switch(v186)
          {
            case 1:
              id v83 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"more.letters.key");
              id v84 = location;
              id location = v83;

              break;
            case 2:
              id v85 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"more.numbers.key");
              id v86 = location;
              id location = v85;

              break;
            case 3:
              id v87 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"more.symbols.key");
              id v88 = location;
              id location = v87;

              break;
            default:
              objc_storeStrong(&location, 0);
              break;
          }
          if (!location)
          {
            id v89 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"shift.key");
            id v90 = location;
            id location = v89;
          }
          char v245 = 1;
        }
        else if (([v240 isEqualToString:@"Space-Key"] & 1) != 0 {
               || ([v240 isEqualToString:@"Unlabeled-Space-Key"] & 1) != 0
        }
               || ([v240 isEqualToString:@"TenKey-Number-To-Number-Alternative-Keyplane-Switch-Key"] & 1) != 0|| (objc_msgSend(v240, "isEqualToString:", @"TenKey-Number-Alternative-To-Number-Keyplane-Switch-Key") & 1) != 0|| (objc_msgSend(v240, "isEqualToString:", @"Monolith-Space-Key") & 1) != 0|| (objc_msgSend(v240, "isEqualToString:", @"Monolith-Linear-Space-Key") & 1) != 0)
        {
          id v183 = (id)[v247[7] properties];
          id v235 = (id)[v183 valueForKey:*MEMORY[0x263F1D3A8]];

          if ([v235 length])
          {
            objc_storeStrong(&location, v235);
          }
          else
          {
            char v246 = 1;
            id v91 = accessibilityLocalizedString(@"spacebar.key");
            id v92 = location;
            id location = v91;
          }
          char v238 = 1;
          objc_storeStrong(&v235, 0);
        }
        else if ([v240 isEqualToString:@"Return-Key"])
        {
          id v234 = (id)[v247[7] displayString];
          if (([v234 isEqualToString:@"⏎"] & 1) != 0
            || ([v234 isEqualToString:@"⮑"] & 1) != 0
            || ([v234 isEqualToString:@"⮐"] & 1) != 0)
          {
            char v246 = 1;
            id v93 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"keyboard.return.key.default");
            id v94 = location;
            id location = v93;
          }
          objc_storeStrong(&v234, 0);
        }
        else if (([v240 isEqualToString:@"Dismiss-Key"] & 1) != 0 {
               || ([v240 isEqualToString:@"Dismiss-HWR-Key"] & 1) != 0)
        }
        {
          char v246 = 1;
          id v95 = accessibilityLocalizedString(@"keyboard.dismiss.key.default");
          id v96 = location;
          id location = v95;
        }
        else if ([v240 isEqualToString:@"Chinese-Facemark"])
        {
          char v246 = 1;
          id v97 = accessibilityLocalizedString(@"face.marks.keyboard.button");
          id v98 = location;
          id location = v97;
        }
        else if ([v240 isEqualToString:@"Wubihua-Letter-WildCard"])
        {
          char v246 = 1;
          id v99 = accessibilityLocalizedString(@"keyboard.key.chinese.stroke.wildcard");
          id v100 = location;
          id location = v99;
        }
        else if ([v240 hasSuffix:@"Chinese10Key-Ideographic-Comma-Fullwidth-Question-Mark-Exclamation-Mark"] & 1) != 0|| (objc_msgSend(v240, "hasSuffix:", @"Period-Comma-Question-Mark-Exclamation-Mark"))
        {
          char v246 = 1;
          id v101 = accessibilityLocalizedString(@"keyboard.key.chinese.stroke.punctuation");
          id v102 = location;
          id location = v101;
        }
        else if ([v240 isEqualToString:@"Japanese-50on-Emoji"])
        {
          char v246 = 1;
          id v103 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"keyboard.emoji.keyplane");
          id v104 = location;
          id location = v103;
        }
        else if (([v240 isEqualToString:@"TenKey-Fullwidth-Keyplane-Switch-Key"] & 1) != 0 {
               || ([v240 isEqualToString:@"TenKey-Wubihua-Fullwidth-Keyplane-Switch-Key"] & 1) != 0)
        }
        {
          char v246 = 1;
          id v105 = accessibilityLocalizedString(@"keyboard.chinese.fullwidth.toggle");
          id v106 = location;
          id location = v105;
        }
        else if (([v240 isEqualToString:@"TenKey-Fullwidth-SymbolNumber-Keyplane-Switch-Key"] & 1) != 0 {
               || ([v240 isEqualToString:@"TenKey-Wubihua-Fullwidth-SymbolNumber-Keyplane-Switch-Key"] & 1) != 0)
        }
        {
          char v246 = 1;
          id v107 = accessibilityLocalizedString(@"keyboard.chinese.regularwidth.toggle");
          id v108 = location;
          id location = v107;
        }
        else if ([v240 isEqualToString:@"Wubihua-Facemark"])
        {
          char v246 = 1;
          id v109 = accessibilityLocalizedString(@"keyboard.emoticon.key");
          id v110 = location;
          id location = v109;
        }
        else if (([v240 isEqualToString:@"TenKey-Wubihua-Keyplane-Switch-Key"] & 1) != 0 {
               || ([v240 isEqualToString:@"TenKey-Wubihua-Stroke-Keyplane-Switch-Key"] & 1) != 0)
        }
        {
          id v111 = (id)[v247[7] displayString];
          id v112 = location;
          id location = v111;
        }
        else if ([v240 isEqualToString:@"Cangjie-Letter-Z"])
        {
          objc_storeStrong(&location, @"蟲");
        }
        else if ([v240 isEqualToString:@"Ampersand"])
        {
          if (AXRequestingClient() != 15)
          {
            char v246 = 1;
            id v113 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"keyboard.key.ampersand");
            id v114 = location;
            id location = v113;
          }
        }
        else if (v239 == 5)
        {
          id v181 = (id)[v247[7] representedString];
          id v180 = (id)[MEMORY[0x263F08708] whitespaceCharacterSet];
          id v179 = (id)objc_msgSend(v181, "stringByTrimmingCharactersInSet:");
          BOOL v182 = [v179 length] != 0;

          if (!v182)
          {
            char v246 = 1;
            id v115 = accessibilityLocalizedString(@"keyboard.key.accents");
            id v116 = location;
            id location = v115;
          }
        }
        else if ([v240 isEqualToString:@"Tab-Key"])
        {
          char v246 = 1;
          id v117 = accessibilityLocalizedString(@"keyboard.tab.key");
          id v118 = location;
          id location = v117;
        }
        else if ([v240 isEqualToString:@"Caps-Lock-Key"])
        {
          char v246 = 1;
          id v119 = accessibilityLocalizedString(@"caps.lock");
          id v120 = location;
          id location = v119;
        }
        else if ([v240 isEqualToString:@"Writeboard-Key"])
        {
          char v246 = 1;
          id v121 = accessibilityLocalizedString(@"keyboard.writeboard.key");
          id v122 = location;
          id location = v121;
        }
LABEL_165:
        if (![location length])
        {
          char v243 = -[UIAccessibilityElementKBKey _axIsShifted](v247) & 1;
          if ([v247[7] displayType] == 7)
          {
            -[UIAccessibilityElementKBKey setChangesOnShiftDown:]((uint64_t)v247, 1);
            id v123 = -[UIAccessibilityElementKBKey _axDualStringLabel](v247);
            id v124 = location;
            id location = v123;
          }
        }
        if (![location length] || (v238 & 1) != 0)
        {
          id v233 = (id)[v247[7] overrideDisplayString];
          if ([v233 length])
          {
            objc_storeStrong(&location, v233);
            char v246 = 0;
          }
          objc_storeStrong(&v233, 0);
        }
        if ([location length]) {
          goto LABEL_212;
        }
        char v231 = 0;
        objc_opt_class();
        id v178 = (id)[v247[7] displayString];
        id v230 = (id)__UIAccessibilityCastAsClass();

        id v229 = v230;
        objc_storeStrong(&v230, 0);
        id v232 = v229;
        char v227 = 0;
        objc_opt_class();
        id v177 = (id)[v247[7] representedString];
        id v226 = (id)__UIAccessibilityCastAsClass();

        id v225 = v226;
        objc_storeStrong(&v226, 0);
        id v228 = v225;
        if (([v240 hasPrefix:@"TenKey-Latin"] & 1) != 0
          || ([v240 hasPrefix:@"TenKey-At"] & 1) != 0
          || ([v240 hasPrefix:@"TenKey-Period"] & 1) != 0
          || ([v240 hasPrefix:@"TenKey-Chinese-Pinyin"] & 1) != 0)
        {
          id v224 = (id)[MEMORY[0x263F089D8] string];
          uint64_t v223 = [v232 length];
          for (i = 0; (uint64_t)i < v223; ++i)
          {
            v254 = i;
            uint64_t v253 = 1;
            v255 = i;
            uint64_t v256 = 1;
            obj[1] = i;
            obj[2] = (id)1;
            id v176 = (id)objc_msgSend(v232, "substringWithRange:", i, 1);
            [v224 appendFormat:@"%@ ", v176];
          }
          objc_storeStrong(&v228, v224);
          id v174 = (id)[v247[7] name];
          char v175 = [v174 hasPrefix:@"TenKey-Period"];

          if (v175)
          {
            obj[0] = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v228];
            uint64_t v173 = MEMORY[0x263EFFA88];
            objc_msgSend(obj[0], "setAttribute:forKey:");
            [obj[0] setAttribute:v173 forKey:*MEMORY[0x263F217C8]];
            objc_storeStrong(&v228, obj[0]);
            objc_storeStrong(obj, 0);
          }
          objc_storeStrong(&v224, 0);
        }
        else if ([v240 hasSuffix:@"10Key-Keyplane-Switch-Key"])
        {
          objc_storeStrong(&v228, v232);
        }
        else if ([v240 hasPrefix:@"Hebrew-Accents"])
        {
          objc_storeStrong(&v232, v228);
        }
        if ([v228 length]
          && ([v232 isEqualToString:v228] & 1) == 0
          && !-[UIAccessibilityElementKBKey isButtonType](v247)
          && !v242)
        {
          objc_storeStrong(&v232, v228);
          if ([v232 length] == 1
            && (unsigned __int16)[v232 characterAtIndex:0] == 9787)
          {
            id v248 = accessibilityLocalizedString(@"face.marks.keyboard.button");
            int v241 = 1;
            goto LABEL_211;
          }
          if ([v240 isEqualToString:@"Wubihua-Letter-ExactMatch"])
          {
            id v125 = (id)[v247[7] displayString];
            id v126 = v232;
            id v232 = v125;
          }
        }
        if (v232)
        {
          if (-[UIAccessibilityElementKBKey allowsCaseChangeOnShift]((uint64_t)v247))
          {
            if ([v232 length])
            {
              uint64_t v219 = [v232 rangeOfComposedCharacterSequenceAtIndex:0];
              uint64_t v220 = v127;
              if (v127 == [v232 length])
              {
                -[UIAccessibilityElementKBKey setChangesOnShiftDown:]((uint64_t)v247, 1);
                if (v243) {
                  id v128 = (id)[v232 uppercaseString];
                }
                else {
                  id v128 = (id)[v232 lowercaseString];
                }
                id v129 = v232;
                id v232 = v128;
              }
            }
          }
          id v171 = (id)[v247[7] name];
          char v172 = [v171 hasPrefix:@"NumberPad"];

          if (v172)
          {
            uint64_t v217 = [v232 rangeOfString:@"/"];
            uint64_t v218 = v130;
            if (v217 != 0x7FFFFFFFFFFFFFFFLL)
            {
              id v131 = (id)[v232 substringToIndex:v217];
              id v132 = location;
              id location = v131;
            }
          }
          if (![location length]) {
            objc_storeStrong(&location, v232);
          }
        }
        int v241 = 0;
LABEL_211:
        objc_storeStrong(&v228, 0);
        objc_storeStrong(&v232, 0);
        if (v241)
        {
LABEL_270:
          objc_storeStrong(&v240, 0);
          goto LABEL_271;
        }
LABEL_212:
        if (![location length])
        {
          id v216 = (id)[v247[7] variantDisplayString];
          if (v216) {
            objc_storeStrong(&location, v216);
          }
          objc_storeStrong(&v216, 0);
        }
        id v168 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
        id v215 = (id)[v168 currentInputMode];

        id v169 = (id)[v215 primaryLanguage];
        char v170 = [v169 _containsSubstring:@"zh"];

        if (v170)
        {
          id v166 = (id)[v215 identifier];
          char v167 = [v166 _containsSubstring:@"Wubihua"];

          if (v167)
          {
            id v214 = 0;
            id v164 = (id)[v215 primaryLanguage];
            char v212 = 0;
            BOOL v165 = 1;
            if ([v164 compare:@"zh-hant" options:1])
            {
              id v213 = (id)[v215 primaryLanguage];
              char v212 = 1;
              BOOL v165 = [v213 compare:@"zh_hant" options:1] == 0;
            }
            if (v212) {

            }
            if (v165)
            {
              id v133 = _TraditionalStrokeDictionary();
              id v134 = v214;
              id v214 = v133;
            }
            else
            {
              id v162 = (id)[v215 primaryLanguage];
              char v210 = 0;
              BOOL v163 = 1;
              if ([v162 compare:@"zh-hans" options:1])
              {
                id v211 = (id)[v215 primaryLanguage];
                char v210 = 1;
                BOOL v163 = [v211 compare:@"zh_hans" options:1] == 0;
              }
              if (v210) {

              }
              if (v163)
              {
                id v135 = _SimplifiedStrokeDictionary();
                id v136 = v214;
                id v214 = v135;
              }
            }
            id v209 = (id)[v214 objectForKey:location];
            if ([v209 length]) {
              objc_storeStrong(&location, v209);
            }
            objc_storeStrong(&v209, 0);
            objc_storeStrong(&v214, 0);
          }
          else
          {
            id v160 = (id)[v215 identifier];
            char v161 = [v160 _containsSubstring:@"Zhuyin"];

            if (v161)
            {
              id v208 = 0;
              id v158 = (id)[v215 primaryLanguage];
              char v206 = 0;
              BOOL v159 = 1;
              if ([v158 compare:@"zh-hant" options:1])
              {
                id v207 = (id)[v215 primaryLanguage];
                char v206 = 1;
                BOOL v159 = [v207 compare:@"zh_hant" options:1] == 0;
              }
              if (v206) {

              }
              if (v159)
              {
                id v137 = _ZhuyinTraditionalStrokeDictionary();
                id v138 = v208;
                id v208 = v137;
              }
              id v205 = (id)[v208 objectForKey:location];
              if ([v205 length]) {
                objc_storeStrong(&location, v205);
              }
              objc_storeStrong(&v205, 0);
              objc_storeStrong(&v208, 0);
            }
          }
        }
        id v204 = 0;
        if (([location isAXAttributedString] & 1) == 0 && location)
        {
          id v139 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:location];
          id v140 = v204;
          id v204 = v139;
        }
        else
        {
          objc_storeStrong(&v204, location);
        }
        BOOL v203 = -[UIAccessibilityElementKBKey _accessibilityWasForcedToUseForeignKB]((uint64_t)v247);
        if ((v246 & 1) != 0 || ![location length])
        {
          if ((v245 & 1) != 0 && !v203)
          {
            id v197 = (id)[v215 primaryLanguage];
            id v144 = (id)MEMORY[0x2455E5E10](v197);
            id v145 = v197;
            id v197 = v144;

            if ([v197 length]) {
              [v204 setAttribute:v197 forKey:*MEMORY[0x263F217A8]];
            }
            objc_storeStrong(&v197, 0);
          }
        }
        else
        {
          uint64_t v141 = [location length];
          uint64_t v250 = 0;
          uint64_t v249 = v141;
          uint64_t v251 = 0;
          uint64_t v252 = v141;
          uint64_t v201 = 0;
          uint64_t v202 = v141;
          if (!-[UIAccessibilityElementKBKey isButtonType](v247) && v202 == 1)
          {
            id v156 = v204;
            id v157 = (id)[NSNumber numberWithBool:1];
            objc_msgSend(v156, "setAttribute:forKey:withRange:");
          }
          id v154 = (id)[v247 accessibilityLanguage];
          BOOL v155 = [v154 length] != 0;

          if (!v155)
          {
            id v151 = (id)[MEMORY[0x263F1C738] sharedInstance];
            id v150 = (id)[v151 textInputTraits];
            uint64_t v152 = [v150 keyboardType];

            uint64_t v200 = v152;
            BOOL v199 = 0;
            BOOL v153 = 1;
            if (v152 != 5)
            {
              BOOL v153 = 1;
              if (v200 != 4) {
                BOOL v153 = v200 == 8;
              }
            }
            BOOL v199 = v153;
            if (!v153 && !v203)
            {
              id v198 = (id)[v215 primaryLanguage];
              id v142 = (id)MEMORY[0x2455E5E10](v198);
              id v143 = v198;
              id v198 = v142;

              if ([v198 length]) {
                objc_msgSend(v204, "setAttribute:forKey:withRange:", v198, *MEMORY[0x263F217A8], v201, v202);
              }
              objc_storeStrong(&v198, 0);
            }
          }
        }
        v196[0] = 0;
        v196[1] = 0;
        id v148 = (id)[v204 attributesAtIndex:0 effectiveRange:v196];
        BOOL v149 = [v148 count] == 0;

        if (!v149) {
          objc_storeStrong(&location, v204);
        }
        id v248 = location;
        int v241 = 1;
        objc_storeStrong(&v204, 0);
        objc_storeStrong(&v215, 0);
        goto LABEL_270;
      }
    }
    char v245 = 1;
    char v246 = 1;
    id v41 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:]((uint64_t)v247, @"more.letters.key");
    id v42 = location;
    id location = v41;

    goto LABEL_165;
  }
  id v248 = 0;
  int v241 = 1;
LABEL_271:
  objc_storeStrong(&location, 0);
LABEL_272:
  v146 = v248;

  return v146;
}

- (uint64_t)setChangesOnShiftDown:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 64) = a2 & 1;
  }
  return result;
}

- (id)_axDualStringLabel
{
  id v26 = a1;
  if (a1)
  {
    v25[8] = 0;
    *(void *)id v25 = -[UIAccessibilityElementKBKey _axIsShifted](v26) & 1;
    id v24 = (id)[MEMORY[0x263F1C738] sharedInstance];
    char v23 = 0;
    if (([v24 isShiftLocked] & 1) == 0
      || (char v18 = 1, (-[UIAccessibilityElementKBKey isUnaffectedByShiftLock]((uint64_t)v26) & 1) == 0))
    {
      char v18 = 1;
      if (([v24 isAutoShifted] & 1) == 0) {
        char v18 = v25[0] ^ 1;
      }
    }
    char v23 = v18 & 1;
    id v16 = (id)[v26[7] representedString];
    BOOL v17 = [v16 length] != 1;

    if (v17)
    {
      id v12 = (id)[v26[7] representedString];
      BOOL v13 = (unint64_t)[v12 length] < 2;

      if (!v13)
      {
        if (v23)
        {
          id v11 = (id)[v26[7] representedString];
          uint64_t v33 = 0;
          uint64_t v32 = 1;
          uint64_t v34 = 0;
          uint64_t v35 = 1;
          id v4 = (id)objc_msgSend(v11, "substringWithRange:", 0, 1);
          id v5 = *(void **)&v25[1];
          *(void *)&v25[1] = v4;
        }
        else
        {
          id v10 = (id)[v26[7] representedString];
          uint64_t v29 = 1;
          uint64_t v28 = 1;
          uint64_t v30 = 1;
          uint64_t v31 = 1;
          id v6 = (id)objc_msgSend(v10, "substringWithRange:", 1, 1);
          id v7 = *(void **)&v25[1];
          *(void *)&v25[1] = v6;
        }
      }
    }
    else if (v23)
    {
      id v1 = (id)[v26[7] representedString];
      id v2 = *(void **)&v25[1];
      *(void *)&v25[1] = v1;
    }
    else
    {
      id v22 = (id)[v26[7] secondaryRepresentedStrings];
      if ([v22 count])
      {
        char v21 = 0;
        objc_opt_class();
        id v15 = (id)[v26[7] secondaryRepresentedStrings];
        id v14 = (id)[v15 firstObject];
        id v20 = (id)__UIAccessibilityCastAsClass();

        id v19 = v20;
        objc_storeStrong(&v20, 0);
        id v3 = *(void **)&v25[1];
        *(void *)&v25[1] = v19;
      }
      objc_storeStrong(&v22, 0);
    }
    id v27 = *(id *)&v25[1];
    objc_storeStrong(&v24, 0);
    objc_storeStrong((id *)&v25[1], 0);
  }
  else
  {
    id v27 = 0;
  }
  id v8 = v27;

  return v8;
}

- (BOOL)allowsCaseChangeOnShift
{
  uint64_t v5 = a1;
  if (a1)
  {
    id location = (id)[*(id *)(v5 + 56) name];
    if ([location isEqualToString:@"Return-Key"])
    {
      BOOL v6 = 0;
    }
    else
    {
      id v2 = (id)[*(id *)(v5 + 56) name];
      char v3 = [v2 hasPrefix:@"Latin-Small-Letter-Small-Display"];

      BOOL v6 = (v3 & 1) == 0;
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    return 0;
  }
  return v6;
}

- (uint64_t)isUnaffectedByShiftLock
{
  uint64_t v5 = a1;
  if (a1)
  {
    id v2 = (id)-[UIAccessibilityElementKBKey key](v5);
    id location = (id)[v2 name];

    char v3 = 1;
    if (([location isEqualToString:@"Comma-With-Exclamation-Mark"] & 1) == 0) {
      char v3 = [location isEqualToString:@"Full-Stop-With-Question-Mark"];
    }
    char v6 = v3 & 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

- (void)_applyCapitalLetterTransform
{
  id v10 = a1;
  if (a1 && (-[UIAccessibilityElementKBKey changesOnShiftDown]((uint64_t)v10) & 1) != 0)
  {
    char v9 = -[UIAccessibilityElementKBKey _axIsShifted](v10) & 1;
    id v8 = (id)[v10 accessibilityUserDefinedLabel];
    if ([v8 length])
    {
      id v6 = 0;
      if ([v10[7] displayType] == 7)
      {
        -[UIAccessibilityElementKBKey setChangesOnShiftDown:]((uint64_t)v10, 1);
        id v1 = -[UIAccessibilityElementKBKey _axDualStringLabel](v10);
        id v2 = v6;
        id v6 = v1;
      }
      if (![v6 length])
      {
        if (-[UIAccessibilityElementKBKey allowsCaseChangeOnShift]((uint64_t)v10))
        {
          if (v9) {
            id v3 = (id)[v8 uppercaseString];
          }
          else {
            id v3 = (id)[v8 lowercaseString];
          }
          id v4 = v6;
          id v6 = v3;
        }
        if (([v8 isAXAttributedString] & 1) != 0 && objc_msgSend(v6, "length"))
        {
          id obj = (id)[v8 copy];
          [obj replaceString:v6];
          objc_storeStrong(&v6, obj);
          objc_storeStrong(&obj, 0);
        }
      }
      if (([v6 isEqualToString:v8] & 1) == 0) {
        [v10 setAccessibilityLabel:v6];
      }
      objc_storeStrong(&v6, 0);
      int v7 = 0;
    }
    else
    {
      int v7 = 1;
    }
    objc_storeStrong(&v8, 0);
  }
}

- (uint64_t)changesOnShiftDown
{
  if (a1) {
    char v2 = *(unsigned char *)(a1 + 64) & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (BOOL)_allowCachingAccessibilityLabel
{
  uint64_t v4 = a1;
  if (a1)
  {
    id v2 = (id)-[UIAccessibilityElementKBKey key](v4);
    id location = (id)[v2 name];

    BOOL v5 = ([location isEqualToString:@"TenKey-Facemark-Voiced-Sound-Mark-And-Semi-Voiced-Sound-Mark-And-Small-Variation"] & 1) == 0&& (objc_msgSend(location, "isEqualToString:", @"Space-Key") & 1) == 0&& (-[UIAccessibilityElementKBKey isUnaffectedByShiftLock](v4) & 1) == 0&& (objc_msgSend(location, "isEqualToString:", @"Voiced-Sound-Mark-And-Semi-Voiced-Sound-Mark-And-Small-Variation") & 1) == 0;
    objc_storeStrong(&location, 0);
  }
  else
  {
    return 0;
  }
  return v5;
}

- (uint64_t)key
{
  if (a1) {
    return *(void *)(a1 + 56);
  }
  else {
    return 0;
  }
}

- (id)accessibilityLabel
{
  BOOL v5 = self;
  location[1] = (id)a2;
  -[UIAccessibilityElementKBKey _applyCapitalLetterTransform]((id *)&self->super.super.super.isa);
  location[0] = (id)[(UIAccessibilityElementKBKey *)v5 accessibilityUserDefinedLabel];
  if (!location[0])
  {
    location[0] = -[UIAccessibilityElementKBKey _accessibilityLabel]((id *)&v5->super.super.super.isa);

    if (-[UIAccessibilityElementKBKey _allowCachingAccessibilityLabel]((uint64_t)v5)) {
      [(UIAccessibilityElementKBKey *)v5 setAccessibilityLabel:location[0]];
    }
  }
  id v6 = location[0];
  objc_storeStrong(location, 0);
  id v2 = v6;

  return v2;
}

- (BOOL)_accessibilityKeyboardSupportsGestureMode
{
  id v3 = (id)[(UIAccessibilityElementKBKey *)self accessibilityContainer];
  char v4 = [v3 _accessibilityKeyboardSupportsGestureMode];

  return v4 & 1;
}

- (CGPoint)accessibilityActivationPoint
{
  id v10 = self;
  SEL v9 = a2;
  id v6 = (id)[(UIKBTree *)self->_key name];
  char v7 = [v6 isEqualToString:@"Handwriting-Input"];

  if (v7)
  {
    long long v11 = *MEMORY[0x263F00148];
  }
  else
  {
    v8.receiver = v10;
    v8.super_class = (Class)UIAccessibilityElementKBKey;
    [(UIAccessibilityElementKBKey *)&v8 accessibilityActivationPoint];
    *(void *)&long long v11 = v2;
    *((void *)&v11 + 1) = v3;
  }
  double v5 = *((double *)&v11 + 1);
  double v4 = *(double *)&v11;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)accessibilityHint
{
  id v27 = self;
  v26[1] = (id)a2;
  if (-[UIAccessibilityElementKBKey _axIsDictationKey](self))
  {
    id v28 = accessibilityLocalizedString(@"dictation.key.hint");
    goto LABEL_43;
  }
  v26[0] = (id)[(UIKBTree *)v27->_key displayString];
  id v25 = (id)[(UIKBTree *)v27->_key name];
  if ([v25 hasPrefix:@"NumberPad"])
  {
    uint64_t v23 = [v26[0] rangeOfString:@"/"];
    uint64_t v24 = v2;
    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v28 = 0;
      int v22 = 1;
    }
    else
    {
      id v3 = (id)[v26[0] substringFromIndex:v23];
      id v4 = v26[0];
      v26[0] = v3;

      id v21 = (id)[MEMORY[0x263F08708] letterCharacterSet];
      id v20 = (id)[MEMORY[0x263F089D8] string];
      uint64_t v19 = 0;
      uint64_t v18 = [v26[0] length];
      while (v19 < v18)
      {
        unsigned __int16 v17 = [v26[0] characterAtIndex:v19];
        if ([v21 characterIsMember:v17])
        {
          objc_msgSend(v20, "appendFormat:", @"%C", v17);
          if (v19 < v18 - 1) {
            [v20 appendString:@"-"];
          }
        }
        ++v19;
      }
      id v28 = v20;
      int v22 = 1;
      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v21, 0);
    }
    goto LABEL_42;
  }
  if (([v25 isEqualToString:@"Handwriting-Input"] & 1) == 0)
  {
    char v15 = 0;
    char v12 = 1;
    if (([v25 isEqualToString:@"Dismiss-Key"] & 1) == 0)
    {
      id v16 = (id)[(UIKBTree *)v27->_key name];
      char v15 = 1;
      char v12 = [v16 isEqualToString:@"Dismiss-HWR-Key"];
    }
    if (v15) {

    }
    if (v12)
    {
      id v10 = (id)[(UIAccessibilityElementKBKey *)v27 accessibilityContainer];
      char v11 = [v10 safeBoolForKey:@"useDismissForMessagesWriteboard"];

      if (v11) {
        id v28 = accessibilityLocalizedString(@"keyboard.writeboard.key");
      }
      else {
        id v28 = accessibilityLocalizedString(@"keyboard.dismiss.hint");
      }
      int v22 = 1;
      goto LABEL_42;
    }
    if ([(UIAccessibilityElementKBKey *)v27 _accessibilityIsInternationalKeyboardKey])
    {
      if ((-[UIAccessibilityElementKBKey _axDisplaysGlobeKeyAsEmojiKey](v27) & 1) == 0)
      {
        id v28 = accessibilityLocalizedString(@"globe.keyboard.key.hint");
        int v22 = 1;
        goto LABEL_42;
      }
    }
    else
    {
      char v13 = 0;
      char v9 = 0;
      if ([v25 hasSuffix:@"Shift-Key"])
      {
        id v14 = (id)[MEMORY[0x263F1C738] sharedInstance];
        char v13 = 1;
        char v9 = [v14 shiftLockedEnabled];
      }
      if (v13) {

      }
      if (v9)
      {
        id v8 = (id)[MEMORY[0x263F1C738] sharedInstance];
        if ([v8 isShiftLocked]) {
          double v5 = @"keyboard.turn.capslock.off.hint";
        }
        else {
          double v5 = @"keyboard.turn.capslock.on.hint";
        }
        id v28 = accessibilityLocalizedString(v5);

        int v22 = 1;
        goto LABEL_42;
      }
      if ([v25 isEqualToString:@"Monolith-Linear-Delete-Key"])
      {
        id v28 = accessibilityLocalizedString(@"atv.delete.keyboard.key.hint");
        int v22 = 1;
        goto LABEL_42;
      }
      if ([v25 isEqualToString:@"Writeboard-Key"])
      {
        id v28 = accessibilityLocalizedString(@"keyboard.writeboard.key.hint");
        int v22 = 1;
        goto LABEL_42;
      }
    }
    id v28 = 0;
    int v22 = 1;
    goto LABEL_42;
  }
  id v28 = accessibilityLocalizedString(@"handwriting.input.hint");
  int v22 = 1;
LABEL_42:
  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);
LABEL_43:
  id v6 = v28;

  return v6;
}

- (CGRect)accessibilityFrame
{
  id v20 = self;
  SEL v19 = a2;
  if (self->_key)
  {
    unsigned __int16 v17 = (UIView *)-[UIAccessibilityElementKBKey _axLayoutStar](v20);
    [(UIKBTree *)v20->_key frame];
    rect.origin.double x = v6;
    rect.origin.double y = v7;
    rect.size.double width = v8;
    rect.size.double height = v9;
    id v14 = (id)[(UIKBTree *)v20->_key name];
    char v15 = [v14 isEqualToString:@"Handwriting-Input"];

    if (v15 & 1) != 0 && (AXDeviceIsPhoneIdiom())
    {
      rect.origin.double y = rect.origin.y + 30.0;
      rect.size.double height = rect.size.height - 30.0;
    }
    CGRect v21 = UIAccessibilityConvertFrameToScreenCoordinates(rect, v17);
    objc_storeStrong((id *)&v17, 0);
  }
  else
  {
    v18.receiver = v20;
    v18.super_class = (Class)UIAccessibilityElementKBKey;
    [(UIAccessibilityElementKBKey *)&v18 accessibilityFrame];
    v21.origin.double x = v2;
    v21.origin.double y = v3;
    v21.size.double width = v4;
    v21.size.double height = v5;
  }
  double x = v21.origin.x;
  double y = v21.origin.y;
  double width = v21.size.width;
  double height = v21.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)_accessibilityAllowsAlternativeCharacterActivation
{
  return 1;
}

void __43__UIAccessibilityElementKBKey_isButtonType__block_invoke(uint64_t a1)
{
  uint64_t v4 = a1;
  uint64_t v3 = a1;
  uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", @"Return-Key", @"Dismiss-Key", @"Dismiss-HWR-Key", @"Tab-Key", @"Handwriting-Input", @"Emoji-International-Key", @"Emoji", @"Cut-Key", @"Copy-Key", @"Undo-Key", @"Paste-Key", @"Redo-Key", @"Shift-Key", @"BIU-Key", @"Writeboard-Key", 0);
  CGFloat v2 = (void *)isButtonType_AcceptableButtonTypes;
  isButtonType_AcceptableButtonTypes = v1;
}

- (uint64_t)_accessibilityIsDeleteKey
{
  uint64_t v4 = a1;
  if (a1)
  {
    id location = (id)[*(id *)(v4 + 56) name];
    char v2 = 1;
    if (([location isEqualToString:@"Delete-Key"] & 1) == 0)
    {
      char v2 = 1;
      if (([location isEqualToString:@"NumberPad-Delete"] & 1) == 0) {
        char v2 = [location isEqualToString:@"Monolith-Linear-Delete-Key"];
      }
    }
    char v5 = v2 & 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (BOOL)_accessibilityIsInternationalKeyboardKey
{
  id v3 = (id)[(UIKBTree *)self->_key name];
  char v5 = 0;
  char v4 = 1;
  if (([v3 isEqualToString:@"International-Key"] & 1) == 0)
  {
    id v6 = (id)[(UIKBTree *)self->_key name];
    char v5 = 1;
    char v4 = [v6 isEqualToString:@"Emoji-International-Key"];
  }
  if (v5) {

  }
  return v4 & 1;
}

- (unint64_t)accessibilityTraits
{
  unsigned __int16 v17 = self;
  SEL v16 = a2;
  unint64_t v15 = 0;
  unint64_t v15 = *MEMORY[0x263F1CF28] | *MEMORY[0x263F1CF08];
  id v14 = (id)[(UIKBTree *)self->_key name];
  if (-[UIAccessibilityElementKBKey isButtonType]((id *)&v17->super.super.super.isa)) {
    v15 |= *MEMORY[0x263F1CEE8];
  }
  if (-[UIAccessibilityElementKBKey _axIsDictationKey](v17))
  {
    if (([(UIKBTree *)v17->_key state] & 4) != 0) {
      v15 |= *MEMORY[0x263F1CF38];
    }
    v15 |= *MEMORY[0x263F1CF40];
  }
  char v2 = [(UIKBTree *)v17->_key disabled];
  char v12 = 0;
  char v9 = 1;
  if ((v2 & 1) == 0)
  {
    LOBYTE(v8) = 0;
    if ([v14 isEqualToString:@"Return-Key"])
    {
      id v13 = (id)[MEMORY[0x263F1C738] sharedInstance];
      char v12 = 1;
      int v8 = [v13 returnKeyEnabled] ^ 1;
    }
    char v9 = v8;
  }
  if (v12) {

  }
  if (v9) {
    v15 |= *MEMORY[0x263F1CF20];
  }
  if (-[UIAccessibilityElementKBKey _accessibilityIsDeleteKey]((uint64_t)v17)) {
    v15 |= *MEMORY[0x263F81378];
  }
  if (([(UIKBTree *)v17->_key visible] & 1) == 0) {
    v15 |= *MEMORY[0x263F813E8];
  }
  if ([v14 hasSuffix:@"Shift-Key"])
  {
    id v6 = -[UIAccessibilityElementKBKey _axLayoutStar](v17);
    id v5 = (id)[v6 safeValueForKey:@"displayTypeHintForShiftKey"];
    int v7 = [v5 intValue];

    int v11 = v7;
    if (!v7)
    {
      id location = (id)[MEMORY[0x263F1C738] sharedInstance];
      if ([location isShifted]) {
        v15 |= *MEMORY[0x263F1CF38];
      }
      objc_storeStrong(&location, 0);
    }
  }
  else if ([v14 isEqualToString:@"Handwriting-Input"])
  {
    v15 |= *MEMORY[0x263F1CEE0];
  }
  if (-[UIAccessibilityElementKBKey _accessibilityIsKeySelected]()) {
    v15 |= *MEMORY[0x263F1CF38];
  }
  unint64_t v4 = v15;
  objc_storeStrong(&v14, 0);
  return v4;
}

- (uint64_t)_accessibilityIsKeySelected
{
  return 0;
}

- (id)_accessibilityVariantKeys
{
  id v4 = (id)-[UIAccessibilityElementKBKey cachedVariantKeys]((uint64_t)self);
  BOOL v5 = [v4 count] != 0;

  if (!v5)
  {
    id v3 = +[UIAccessibilityElementKBKey variantKeysForKey:](UIAccessibilityElementKBKey, self->_key);
    -[UIAccessibilityElementKBKey setCachedVariantKeys:]((uint64_t)self, v3);
  }
  return (id)-[UIAccessibilityElementKBKey cachedVariantKeys]((uint64_t)self);
}

- (uint64_t)cachedVariantKeys
{
  if (a1) {
    return *(void *)(a1 + 72);
  }
  else {
    return 0;
  }
}

+ (id)variantKeysForKey:(void *)a1
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v18 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v18 = self;
  id v16 = (id)[location subtrees];
  id v15 = (id)[MEMORY[0x263EFF980] array];
  memset(__b, 0, sizeof(__b));
  id obj = v16;
  uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
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
      id v14 = *(void **)(__b[1] + 8 * v8);
      if ([v14 displayType] != 50)
      {
        id v4 = [UIAccessibilityElementKBKey alloc];
        id v5 = (id)UIAccessibilityGetKeyboardLayoutStar();
        id v12 = -[UIAccessibilityElementKBKey initWithAccessibilityContainer:key:](v4, v5, v14);

        [v15 addObject:v12];
        objc_storeStrong(&v12, 0);
      }
      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  [v18 _accessibilitySortElementsUsingGeometry:v15];
  id v3 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&location, 0);

  return v3;
}

- (void)setCachedVariantKeys:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (BOOL)_accessibilityHasVariantKeys
{
  uint64_t v7 = self;
  SEL v6 = a2;
  char v5 = 0;
  int v4 = 0;
  int v4 = [(UIKBTree *)self->_key variantType];
  if (v4 == 1 || v4 == 3 || v4 == 7 || v4 == 4 || v4 == 5 || v4 == 8)
  {
    char v5 = 1;
  }
  else
  {
    id v3 = (id)UIAccessibilityGetKeyboardLayoutStar();
    char v5 = [v3 keyHasAccentedVariants:v7->_key] & 1;
    objc_storeStrong(&v3, 0);
  }
  return v5 & 1;
}

- (id)_accessibilitySupportGesturesAttributes
{
  v10[1] = *MEMORY[0x263EF8340];
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = 0;
  if (-[UIAccessibilityElementKBKey _accessibilityIsDeleteKey]((uint64_t)self))
  {
    v8[0] = @"AXSupportedGestureTypeKey";
    v9[0] = &unk_26F48E9D8;
    v8[1] = @"AXGestureTapCountKey";
    v9[1] = &unk_26F48E9F0;
    v8[2] = @"AXGestureFingerCountKey";
    id v9[2] = &unk_26F48E9F0;
    id v6 = (id)[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
    v10[0] = v6;
    id v2 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    id v3 = v7[0];
    v7[0] = v2;
  }
  id v5 = v7[0];
  objc_storeStrong(v7, 0);

  return v5;
}

- (BOOL)_performCapsLockDoubleTap
{
  id v7 = (id)[MEMORY[0x263F1C738] sharedInstance];
  char v8 = [v7 isShiftLocked];

  if (v8)
  {
    id v5 = (id)[MEMORY[0x263F1C738] sharedInstance];
    [v5 setShiftLocked:0];

    id v6 = (id)[MEMORY[0x263F1C738] sharedInstance];
    [v6 setShift:0];
  }
  else
  {
    id v3 = (id)[MEMORY[0x263F1C738] sharedInstance];
    [v3 setShift:1];

    id v4 = (id)[MEMORY[0x263F1C738] sharedInstance];
    [v4 setShiftLocked:1];
  }
  return 1;
}

- (BOOL)_accessibilityActivatePanAlternate:(id)a3
{
  char v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = v8;
  char v3 = -[UIAccessibilityPanAlternateCustomAction isSecondAlternate]((uint64_t)location[0]);
  char v6 = -[UIAccessibilityElementKBKey _accessibilityActivateForPanAlternate:isSecondAlternate:](v5, 1, v3 & 1);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (id)accessibilityCustomActions
{
  v20[1] = *MEMORY[0x263EF8340];
  id v18 = self;
  v17[1] = (id)a2;
  id v12 = (id)[(UIKBTree *)self->_key name];
  char v13 = [v12 hasSuffix:@"Shift-Key"];

  if (v13)
  {
    id v9 = objc_alloc(MEMORY[0x263F1C390]);
    id v11 = accessibilityLocalizedString(@"caps.lock");
    id v10 = (id)objc_msgSend(v9, "initWithName:target:selector:");
    v20[0] = v10;
    id v19 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  }
  else if ([(UIKBTree *)v18->_key displayTypeHint] == 10)
  {
    v17[0] = (id)[MEMORY[0x263EFF980] array];
    unint64_t v16 = 0;
    id v7 = (id)[(UIKBTree *)v18->_key secondaryRepresentedStrings];
    uint64_t v8 = [v7 count];

    unint64_t v16 = v8;
    for (unint64_t i = 0; i < v16; ++i)
    {
      id v4 = [UIAccessibilityPanAlternateCustomAction alloc];
      id v6 = (id)[(UIKBTree *)v18->_key secondaryDisplayStrings];
      id v5 = (id)[v6 objectAtIndexedSubscript:i];
      id v14 = -[UIAccessibilityPanAlternateCustomAction initWithName:target:selector:](v4, "initWithName:target:selector:");

      -[UIAccessibilityPanAlternateCustomAction setIsSecondAlternate:]((uint64_t)v14, i == 1);
      [v17[0] addObject:v14];
      objc_storeStrong((id *)&v14, 0);
    }
    id v19 = v17[0];
    objc_storeStrong(v17, 0);
  }
  else
  {
    id v19 = 0;
  }
  id v2 = v19;

  return v2;
}

- (BOOL)_accessibilityKeyboardKeyHasSignificantAlternateActions
{
  id v3 = (id)[(UIKBTree *)self->_key name];
  char v4 = 1;
  if (([v3 hasSuffix:@"Shift-Key"] & 1) == 0) {
    char v4 = -[UIAccessibilityElementKBKey _accessibilityIsDeleteKey]((uint64_t)self);
  }

  return v4 & 1;
}

- (void)setKey:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void).cxx_destruct
{
}

@end