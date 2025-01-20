@interface _UITextMenuLinkInteractionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
@end

@implementation _UITextMenuLinkInteractionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UITextMenuLinkInteraction";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UITextMenuLinkInteraction", @"_contextMenuInteraction:styleForMenuWithConfiguration:", "@", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(_UITextMenuLinkInteractionAccessibility *)v12 _accessibilityBoolValueForKey:@"AXIsPerformingSimpleTap"] & 1) != 0)
  {
    id v9 = (id)[MEMORY[0x263F1CC60] defaultStyle];
    [v9 setPreferredLayout:3];
    id v13 = v9;
    int v8 = 1;
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v7.receiver = v12;
    v7.super_class = (Class)_UITextMenuLinkInteractionAccessibility;
    id v13 = [(_UITextMenuLinkInteractionAccessibility *)&v7 _contextMenuInteraction:location[0] styleForMenuWithConfiguration:v10];
    int v8 = 1;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  v4 = v13;

  return v4;
}

@end