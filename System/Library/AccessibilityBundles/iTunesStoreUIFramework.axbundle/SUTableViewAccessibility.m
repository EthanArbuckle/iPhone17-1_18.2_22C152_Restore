@interface SUTableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityScrollStatus;
@end

@implementation SUTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUTableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityScrollStatus
{
  v3 = [(SUTableViewAccessibility *)self safeValueForKey:@"_accessibilityHeaderElement"];
  NSClassFromString(&cfstr_Suwebview.isa);
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (NSClassFromString(&cfstr_Asapplicationp.isa), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v4 = [(SUTableViewAccessibility *)self safeValueForKey:@"_accessibilityUIScrollViewScrollStatus"];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUTableViewAccessibility;
    uint64_t v4 = [(SUTableViewAccessibility *)&v7 _accessibilityScrollStatus];
  }
  v5 = (void *)v4;

  return v5;
}

@end