@interface _UISearchTokenAttachmentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation _UISearchTokenAttachmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UISearchTokenAttachment";
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
  v3 = "@";
  [location[0] validateClass:@"_UISearchTokenAttachment" hasInstanceMethod:@"_viewProvider" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"NSTextAttachmentViewProvider", @"view", v3, 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  id v4 = (id)[(_UISearchTokenAttachmentAccessibility *)self safeValueForKey:@"_viewProvider"];
  id v3 = (id)[v4 safeValueForKey:@"view"];
  id v5 = (id)[v3 accessibilityLabel];

  return v5;
}

@end