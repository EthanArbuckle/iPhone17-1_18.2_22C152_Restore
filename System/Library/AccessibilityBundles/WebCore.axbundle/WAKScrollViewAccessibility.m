@interface WAKScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIsIgnored;
- (BOOL)isAccessibilityElement;
- (id)accessibilityContainer;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)accessibilityObject;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
@end

@implementation WAKScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WAKScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)accessibilityIsIgnored
{
  return 0;
}

- (int64_t)accessibilityElementCount
{
  return 1;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  v3 = [(WAKScrollViewAccessibility *)self safeValueForKey:@"contentView"];
  v4 = [v3 safeValueForKey:@"documentView"];
  v5 = [v4 safeValueForKey:@"accessibilityRootElement"];

  return v5;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  return 0;
}

- (id)accessibilityContainer
{
  v2 = [(WAKScrollViewAccessibility *)self safeValueForKey:@"superview"];
  v3 = [v2 safeValueForKey:@"superview"];
  NSClassFromString(&cfstr_Webhtmlview.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = @"******** AX: ScrollView cannot find its WebHTMLView";
    LOBYTE(v6) = 1;
    _AXLogWithFacility();
  }
  v4 = objc_msgSend(v3, "_accessibilityParentForSubview:", v2, v6, v7);

  return v4;
}

- (id)accessibilityObject
{
  return 0;
}

@end