@interface UIStatusBarServiceItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityCoreTelephonyServiceStringName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIStatusBarServiceItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarServiceItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"UIStatusBarServiceItemView" hasInstanceVariable:@"_serviceString" withType:"NSString"];
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityCoreTelephonyServiceStringName
{
  v8[1] = *MEMORY[0x263EF8340];
  v5[1] = a1;
  if (a1)
  {
    v5[0] = (id)[MEMORY[0x263F21660] axAttributedStringWithString:@"__service__string__"];
    id v3 = v5[0];
    uint64_t v7 = *MEMORY[0x263F218D0];
    v8[0] = MEMORY[0x263EFFA88];
    id v4 = (id)[NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    objc_msgSend(v3, "setAttributes:");

    id v6 = v5[0];
    objc_storeStrong(v5, 0);
  }
  else
  {
    id v6 = 0;
  }
  v1 = v6;

  return v1;
}

- (id)accessibilityLabel
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  id v15 = (id)[(UIStatusBarServiceItemViewAccessibility *)self safeValueForKey:@"_contentType"];
  int v16 = [v15 intValue];

  int v21 = v16;
  if (v16 == 2)
  {
    uint64_t Type = AXDeviceGetType();
    if (Type == 2)
    {
      id v2 = accessibilityLocalizedString(@"status.service.ipod");
      id v3 = location[0];
      location[0] = v2;
    }
    else
    {
      if (Type == 3) {
        id v4 = accessibilityLocalizedString(@"status.service.ipad");
      }
      else {
        id v4 = -[UIStatusBarServiceItemViewAccessibility _accessibilityCoreTelephonyServiceStringName](v23);
      }
      id v5 = location[0];
      location[0] = v4;
    }
  }
  else if (v21 == 1)
  {
    id v6 = (id)[(UIStatusBarServiceItemViewAccessibility *)v23 safeValueForKey:@"_serviceString"];
    id v7 = location[0];
    location[0] = v6;
  }
  else
  {
    id v19 = -[UIStatusBarServiceItemViewAccessibility _accessibilityCoreTelephonyServiceStringName](v23);
    if ([v19 hasAttribute:*MEMORY[0x263F218D0]])
    {
      id v18 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:&stru_26F458D38];
      id v11 = v18;
      id v12 = accessibilityLocalizedString(@"status.service.network.format");
      [v11 appendFormat:v19];

      id v13 = v18;
      id v14 = (id)[v19 coalescedAttributes];
      uint64_t v17 = [v18 rangeOfString:v19];
      objc_msgSend(v13, "setAttributes:withRange:", v14, v17, v8);

      objc_storeStrong(location, v18);
      objc_storeStrong(&v18, 0);
    }
    else
    {
      objc_storeStrong(location, v19);
    }
    objc_storeStrong(&v19, 0);
  }
  id v10 = location[0];
  objc_storeStrong(location, 0);

  return v10;
}

- (unint64_t)accessibilityTraits
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarServiceItemViewAccessibility;
  return [(UIStatusBarServiceItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

@end