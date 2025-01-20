@interface UIPreviewActionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation UIPreviewActionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPreviewAction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIPreviewAction", @"copyWithZone:", "@", "^{_NSZone=}", 0);
  objc_storeStrong(v4, obj);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11 = self;
  SEL v10 = a2;
  v9 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIPreviewActionAccessibility;
  id v8 = [(UIPreviewActionAccessibility *)&v7 copyWithZone:a3];
  id v6 = (id)[(UIPreviewActionAccessibility *)v11 accessibilityLabel];
  if (v6)
  {
    id v5 = (id)[v6 copyWithZone:v9];
    [v8 setAccessibilityLabel:v5];
    objc_storeStrong(&v5, 0);
  }
  id v4 = v8;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

@end