@interface TPLCDTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TPLCDTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPLCDTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v2 = [(TPLCDTextViewAccessibility *)self accessibilityLabel];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (CGRect)accessibilityFrame
{
  BOOL v3 = [(TPLCDTextViewAccessibility *)self safeValueForKey:@"textRect"];
  [v3 rectValue];
  unint64_t v5 = v4;
  unint64_t v7 = v6;

  v8 = [(TPLCDTextViewAccessibility *)self safeValueForKey:@"sizeToFit"];
  [v8 sizeValue];
  unint64_t v10 = v9;
  unint64_t v12 = v11;

  v13.n128_u64[0] = v5;
  v14.n128_u64[0] = v7;
  v15.n128_u64[0] = v10;
  v16.n128_u64[0] = v12;

  MEMORY[0x270F80998](self, v13, v14, v15, v16);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)accessibilityLabel
{
  v6.receiver = self;
  v6.super_class = (Class)TPLCDTextViewAccessibility;
  BOOL v3 = [(TPLCDTextViewAccessibility *)&v6 accessibilityLabel];
  if (![v3 length])
  {
    uint64_t v4 = [(TPLCDTextViewAccessibility *)self safeValueForKey:@"text"];

    BOOL v3 = (void *)v4;
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF48];
}

@end