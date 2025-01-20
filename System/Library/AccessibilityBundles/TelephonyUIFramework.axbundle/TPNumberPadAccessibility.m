@interface TPNumberPadAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsScannerGroup;
- (BOOL)_accessibilityProvidesScannerGroupElements;
- (BOOL)canBecomeFocused;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)_accessibilityScannerGroupElements;
- (unint64_t)_accessibilityScannerGroupTraits;
@end

@implementation TPNumberPadAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPNumberPad";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TPSimpleNumberPad"];
  [v3 validateClass:@"TPSimpleNumberPad" hasInstanceVariable:@"_deleteButton" withType:"UIButton"];
  [v3 validateClass:@"TPSimpleNumberPad" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIControl", @"canBecomeFocused", "B", 0);
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  return 1;
}

- (BOOL)_accessibilityProvidesScannerGroupElements
{
  return 1;
}

- (id)_accessibilityScannerGroupElements
{
  v15[2] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  v4 = [(TPNumberPadAccessibility *)self safeValueForKey:@"_buttons"];
  if ([v4 count] == 12)
  {
    unint64_t v5 = -3;
    do
    {
      v5 += 3;
      v14[0] = @"GroupElements";
      v6 = objc_msgSend(v4, "subarrayWithRange:", v5, 3);
      v14[1] = @"GroupTraits";
      v15[0] = v6;
      v15[1] = &unk_26F80FC18;
      v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

      [v3 addObject:v7];
    }
    while (v5 < 9);
  }
  else
  {
    [v4 count];
    _AXAssert();
  }
  NSClassFromString(&cfstr_Tpsimplenumber_0.isa);
  if (objc_opt_isKindOfClass())
  {
    v8 = [(TPNumberPadAccessibility *)self safeValueForKey:@"_deleteButton"];
    if ([v8 isAccessibilityElement]
      && [v8 _accessibilityViewIsVisible])
    {
      v9 = [v3 lastObject];
      v10 = (void *)[v9 mutableCopy];

      v11 = [v10 objectForKey:@"GroupElements"];
      v12 = [v11 arrayByAddingObject:v8];
      [v10 setObject:v12 forKey:@"GroupElements"];

      objc_msgSend(v3, "replaceObjectAtIndex:withObject:", objc_msgSend(v3, "count") - 1, v10);
    }
  }

  return v3;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  if ([(TPNumberPadAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)TPNumberPadAccessibility;
  return [(TPNumberPadAccessibility *)&v4 canBecomeFocused];
}

@end