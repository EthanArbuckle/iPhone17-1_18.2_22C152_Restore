@interface _UILabelAttributedStringContentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (_UILabelAttributedStringContentAccessibility)initWithAttributedString:(id)a3 defaultAttributes:(id)a4;
@end

@implementation _UILabelAttributedStringContentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UILabelAttributedStringContent";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UILabelAttributedStringContent";
  [location[0] validateClass:"@" hasInstanceMethod:"@" withFullSignature:0];
  [location[0] validateClass:v3 hasInstanceVariable:@"_attributedString" withType:"NSAttributedString"];
  objc_storeStrong(v5, obj);
}

- (_UILabelAttributedStringContentAccessibility)initWithAttributedString:(id)a3 defaultAttributes:(id)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  v4 = v14;
  v14 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)_UILabelAttributedStringContentAccessibility;
  v14 = [(_UILabelAttributedStringContentAccessibility *)&v10 initWithAttributedString:location[0] defaultAttributes:v12];
  v11 = v14;
  id v8 = (id)[(_UILabelAttributedStringContentAccessibility *)v14 safeValueForKey:@"_attributedString"];
  id v7 = (id)[location[0] accessibilityLabel];
  objc_msgSend(v8, "setAccessibilityLabel:");

  v9 = v11;
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v14, 0);
  return v9;
}

@end