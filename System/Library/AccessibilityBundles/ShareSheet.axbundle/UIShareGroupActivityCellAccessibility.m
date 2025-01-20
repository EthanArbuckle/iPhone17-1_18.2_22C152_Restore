@interface UIShareGroupActivityCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_accessibilityAXAttributedLabel;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilitySlotID;
@end

@implementation UIShareGroupActivityCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIShareGroupActivityCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIShareGroupActivityCell", @"titleLabel", "@", 0);
  [v3 validateClass:@"UIShareGroupActivityCell" hasProperty:@"titleSlotID" withType:"I"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)UIShareGroupActivityCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(UIShareGroupActivityCellAccessibility *)&v3 accessibilityTraits];
}

- (unsigned)_accessibilitySlotID
{
  return [(UIShareGroupActivityCellAccessibility *)self safeUnsignedIntForKey:@"titleSlotID"];
}

- (id)_accessibilityAXAttributedLabel
{
  if ([(UIShareGroupActivityCellAccessibility *)self _accessibilitySlotID])
  {
    id v3 = objc_alloc(MEMORY[0x263F21660]);
    v4 = accessibilityLocalizedString(@"sharing.activity");
    v5 = (void *)[v3 initWithString:v4];

    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[UIShareGroupActivityCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"));
    [v5 setAttribute:v6 forKey:*MEMORY[0x263F21870]];
  }
  else
  {
    v6 = [(UIShareGroupActivityCellAccessibility *)self safeUIViewForKey:@"titleLabel"];
    v5 = [v6 accessibilityLabel];
  }

  return v5;
}

- (CGRect)accessibilityFrame
{
  if ((accessibilityIsPagesApp() & 1) == 0)
  {
    v34.receiver = self;
    v34.super_class = (Class)UIShareGroupActivityCellAccessibility;
    [(UIShareGroupActivityCellAccessibility *)&v34 accessibilityFrame];
  }
  id v3 = [(UIShareGroupActivityCellAccessibility *)self accessibilityUserDefinedFrame];
  v4 = v3;
  if (v3)
  {
    [v3 rectValue];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    v13 = self;
    [(UIShareGroupActivityCellAccessibility *)v13 bounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    [(UIShareGroupActivityCellAccessibility *)v13 _accessibilityFrameExpansion];
    CGFloat v23 = -v22;
    CGFloat v25 = -v24;
    v35.origin.x = v15;
    v35.origin.y = v17;
    v35.size.width = v19;
    v35.size.height = v21;
    CGRectInset(v35, v23, v25);
    UIAccessibilityFrameForBounds();
    double v6 = v26;
    double v8 = v27;
    double v10 = v28;
    double v12 = v29;
  }
  double v30 = v6;
  double v31 = v8;
  double v32 = v10;
  double v33 = v12;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

@end