@interface SUUIIndexBarControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityMoveToIndexPath:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (id)accessibilityFlowToElements;
- (id)accessibilityLabel;
- (int64_t)_accessibilityTableIndexAdjustment;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityBumpValue:(BOOL)a3;
- (void)_sendSelectionForTouch:(id)a3 withEvent:(id)a4;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation SUUIIndexBarControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIIndexBarControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIIndexBarControl", @"_visibleBounds", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"SUUIIndexBarControl" hasInstanceVariable:@"_totalEntryCount" withType:"NSInteger"];
  [v3 validateClass:@"SUUIAttributedStringIndexBarEntry" hasInstanceVariable:@"_synthesizedAttributedString" withType:"NSAttributedString"];
  [v3 validateClass:@"SUUIIndexBarControl" hasInstanceVariable:@"_lastSelectedIndexPath" withType:"NSIndexPath"];
  [v3 validateClass:@"SUUIIndexBarControl" hasInstanceVariable:@"_delegate" withType:"<SUUIIndexBarControlDelegate>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIIndexBarControl", @"_entryAtIndexPath:", "@", 0);
  [v3 validateProtocol:@"SUUIIndexBarControlDelegate" hasOptionalInstanceMethod:@"indexBarControl:didSelectEntryAtIndexPath:"];
}

- (int64_t)_accessibilityTableIndexAdjustment
{
  v2 = [(SUUIIndexBarControlAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  id v3 = [v2 delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [v2 safeValueForKey:@"delegate"];
    v6 = [v5 safeValueForKey:@"_accessibilityTableViewIndexAdjustment"];
    int64_t v7 = [v6 integerValue];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"index.bar.control");
}

- (void)accessibilityDecrement
{
}

- (void)accessibilityIncrement
{
}

- (void)_accessibilityBumpValue:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  v5 = [(SUUIIndexBarControlAccessibility *)self safeValueForKey:@"_lastSelectedIndexPath"];
  v6 = __UIAccessibilityCastAsClass();

  uint64_t v7 = [v6 row];
  if (v3) {
    uint64_t v8 = v7 + 1;
  }
  else {
    uint64_t v8 = v7 - 1;
  }
  v9 = [MEMORY[0x263F088C8] indexPathForRow:v8 inSection:0];
  BOOL v10 = [(SUUIIndexBarControlAccessibility *)self _accessibilityMoveToIndexPath:v9];

  if (!v10) {
    UIAccessibilityPostNotification(*MEMORY[0x263F812E8], 0);
  }
}

- (BOOL)_accessibilityMoveToIndexPath:(id)a3
{
  id v5 = a3;
  v6 = [(SUUIIndexBarControlAccessibility *)self safeValueForKey:@"_totalEntryCount"];
  uint64_t v7 = [v6 integerValue];

  if ([v5 row] < 0 || objc_msgSend(v5, "row") > v7)
  {
    BOOL v8 = 0;
    goto LABEL_20;
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  id v9 = v5;
  AXPerformSafeBlock();
  id v10 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  v11 = [NSString string];
  NSClassFromString(&cfstr_Suuiattributed_3.isa);
  if (objc_opt_isKindOfClass())
  {
    LOBYTE(v23) = 0;
    objc_opt_class();
    v12 = [v10 safeValueForKey:@"_synthesizedAttributedString"];
    v13 = __UIAccessibilityCastAsClass();

    if ((_BYTE)v23) {
      abort();
    }
    v14 = [v13 string];
    uint64_t v15 = [v14 lowercaseString];

    v11 = v13;
    goto LABEL_14;
  }
  NSClassFromString(&cfstr_Suuiimageindex.isa);
  if (objc_opt_isKindOfClass())
  {
    v16 = @"recently.added";
LABEL_13:
    uint64_t v15 = accessibilityLocalizedString(v16);
LABEL_14:

    v11 = (void *)v15;
    goto LABEL_15;
  }
  NSClassFromString(&cfstr_Suuiplaceholde.isa);
  if (objc_opt_isKindOfClass())
  {
    v16 = @"placeholder";
    goto LABEL_13;
  }
  NSClassFromString(&cfstr_Suuisystemcomb.isa);
  if (objc_opt_isKindOfClass())
  {
    v16 = @"combined";
    goto LABEL_13;
  }
LABEL_15:
  v17 = [MEMORY[0x263F21660] axAttributedStringWithString:v11];

  v18 = (id *)[(SUUIIndexBarControlAccessibility *)self safeIvarForKey:@"_lastSelectedIndexPath"];
  if (v18) {
    objc_storeStrong(v18, a3);
  }
  v19 = [(SUUIIndexBarControlAccessibility *)self safeValueForKey:@"_delegate"];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    v21 = [(SUUIIndexBarControlAccessibility *)self safeValueForKey:@"_delegate"];
    [v21 indexBarControl:self didSelectEntryAtIndexPath:v9];
  }
  [v17 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F216C0]];
  UIAccessibilityPostNotification(*MEMORY[0x263F812E8], v17);

  BOOL v8 = 1;
LABEL_20:

  return v8;
}

uint64_t __66__SUUIIndexBarControlAccessibility__accessibilityMoveToIndexPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _entryAtIndexPath:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (void)_sendSelectionForTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)SUUIIndexBarControlAccessibility;
  [(SUUIIndexBarControlAccessibility *)&v39 _sendSelectionForTouch:v6 withEvent:v7];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    BOOL v8 = [(SUUIIndexBarControlAccessibility *)self _accessibilityValueForKey:@"AXLastIndexPath"];
    [v6 locationInView:self];
    double v10 = v9;
    v11 = [(SUUIIndexBarControlAccessibility *)self safeValueForKey:@"_visibleBounds"];
    [v11 rectValue];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    char v20 = [(SUUIIndexBarControlAccessibility *)self safeValueForKey:@"_totalEntryCount"];
    uint64_t v21 = [v20 integerValue];

    v40.origin.x = v13;
    v40.origin.y = v15;
    v40.size.width = v17;
    v40.size.height = v19;
    if (v10 < CGRectGetMinY(v40)) {
      goto LABEL_11;
    }
    v41.origin.x = v13;
    v41.origin.y = v15;
    v41.size.width = v17;
    v41.size.height = v19;
    if (v10 > CGRectGetMaxY(v41)) {
      goto LABEL_11;
    }
    v42.origin.x = v13;
    v42.origin.y = v15;
    v42.size.width = v17;
    v42.size.height = v19;
    double v22 = v10 - CGRectGetMinY(v42);
    v43.origin.x = v13;
    v43.origin.y = v15;
    v43.size.width = v17;
    v43.size.height = v19;
    CGFloat Height = CGRectGetHeight(v43);
    uint64_t v24 = v21 - 1;
    int64_t v25 = llround(v22 / Height * (double)(v21 - 1));
    if (v21 - 1 >= v25) {
      uint64_t v24 = v25;
    }
    uint64_t v26 = v24 & ~(v24 >> 63);
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__3;
    v37 = __Block_byref_object_dispose__3;
    id v38 = 0;
    if (v26 >= v21) {
      goto LABEL_9;
    }
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v32[3] = 0;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __69__SUUIIndexBarControlAccessibility__sendSelectionForTouch_withEvent___block_invoke;
    v31[3] = &unk_2651385F0;
    v31[5] = &v33;
    v31[6] = v26;
    v31[4] = v32;
    [(SUUIIndexBarControlAccessibility *)self _enumerateEntryIndexPathsUsingBlock:v31];
    _Block_object_dispose(v32, 8);
    v27 = (void *)v34[5];
    if (v27)
    {
      id v28 = v27;
      char v29 = 0;
    }
    else
    {
LABEL_9:
      id v28 = 0;
      char v29 = 1;
    }
    _Block_object_dispose(&v33, 8);

    if (v29)
    {
LABEL_11:
      id v28 = 0;
    }
    else if (([v28 isEqual:v8] & 1) == 0)
    {
      [(SUUIIndexBarControlAccessibility *)self _accessibilityMoveToIndexPath:v28];
    }
    v30 = [(SUUIIndexBarControlAccessibility *)self safeValueForKey:@"_lastSelectedIndexPath"];
    [(SUUIIndexBarControlAccessibility *)self _accessibilitySetRetainedValue:v30 forKey:@"AXLastIndexPath"];
  }
}

void __69__SUUIIndexBarControlAccessibility__sendSelectionForTouch_withEvent___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(a1[4] + 8);
  uint64_t v8 = *(void *)(v7 + 24);
  if (v8 == a1[6])
  {
    id v9 = v6;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    id v6 = v9;
    *a3 = 1;
    uint64_t v7 = *(void *)(a1[4] + 8);
    uint64_t v8 = *(void *)(v7 + 24);
  }
  *(void *)(v7 + 24) = v8 + 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8] | *MEMORY[0x263F81400];
}

- (CGRect)accessibilityFrame
{
  v18.receiver = self;
  v18.super_class = (Class)SUUIIndexBarControlAccessibility;
  [(SUUIIndexBarControlAccessibility *)&v18 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(SUUIIndexBarControlAccessibility *)self safeValueForKey:@"_visibleBounds"];
  [v7 rectValue];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v6 + v9;
  double v15 = v4;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  [(SUUIIndexBarControlAccessibility *)self accessibilityFrame];

  UIAccessibilityPointForPoint();
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)accessibilityFlowToElements
{
  return (id)[(SUUIIndexBarControlAccessibility *)self _accessibilityValueForKey:@"kAXSUUIToElements"];
}

@end