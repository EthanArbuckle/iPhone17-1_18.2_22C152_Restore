@interface WebHTMLViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityElements;
@end

@implementation WebHTMLViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WebHTMLView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityElements
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(WebHTMLViewAccessibility *)self safeValueForKey:@"accessibilityRootElement"];
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end