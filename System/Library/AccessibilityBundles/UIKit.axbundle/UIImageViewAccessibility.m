@interface UIImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (UIImageViewAccessibility)initWithImage:(id)a3;
- (id)accessibilityElements;
- (id)accessibilityIdentification;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
@end

@implementation UIImageViewAccessibility

- (UIImageViewAccessibility)initWithImage:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v10;
  id v10 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)UIImageViewAccessibility;
  id v10 = [(UIImageViewAccessibility *)&v7 initWithImage:location[0]];
  id v8 = v10;
  id v6 = (id)[location[0] accessibilityLabel];
  if (v6) {
    [v8 setAccessibilityLabel:v6];
  }
  v5 = (UIImageViewAccessibility *)v8;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v10, 0);
  return v5;
}

+ (id)safeCategoryTargetClassName
{
  return @"UIImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityAutomationType
{
  return 43;
}

- (id)accessibilityElements
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v17 = self;
  v16[1] = (id)a2;
  v15.receiver = self;
  v15.super_class = (Class)UIImageViewAccessibility;
  v16[0] = [(UIImageViewAccessibility *)&v15 accessibilityElements];
  if (v16[0])
  {
    id v18 = v16[0];
    int v14 = 1;
  }
  else
  {
    id v7 = (id)[(UIImageViewAccessibility *)v17 image];
    id v13 = (id)[v7 _accessibilityEncodedHierarchyData];

    if (v13)
    {
      id v12 = (id)[objc_alloc(MEMORY[0x263F811A0]) initWithHierarchyData:v13];
      id v11 = 0;
      id obj = 0;
      id v6 = (id)[v12 decodeHierarchyWithContainer:v17 error:&obj];
      objc_storeStrong(&v11, obj);
      id v10 = v6;
      if (v11 || !v10)
      {
        os_log_t oslog = (os_log_t)(id)AXLogAppAccessibility();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v20, (uint64_t)v11);
          _os_log_error_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_ERROR, "Could not decode hierarchy: %@", v20, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      if (v10)
      {
        id v19 = v10;
        id v2 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
        id v3 = v16[0];
        v16[0] = v2;

        [(UIImageViewAccessibility *)v17 setAccessibilityElements:v16[0]];
      }
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v12, 0);
    }
    id v18 = v16[0];
    int v14 = 1;
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(v16, 0);
  v4 = v18;

  return v4;
}

- (unint64_t)accessibilityTraits
{
  id v8 = self;
  SEL v7 = a2;
  id v2 = (id)[(UIImageViewAccessibility *)self accessibilityUserDefinedTraits];
  BOOL v5 = v2 == 0;

  if (v5)
  {
    v6.receiver = v8;
    v6.super_class = (Class)UIImageViewAccessibility;
    return [(UIImageViewAccessibility *)&v6 accessibilityTraits] | *MEMORY[0x263F1CF00];
  }
  else
  {
    id v4 = (id)[(UIImageViewAccessibility *)v8 accessibilityUserDefinedTraits];
    unint64_t v9 = [v4 unsignedLongLongValue];
  }
  return v9;
}

- (id)accessibilityLabel
{
  unint64_t v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)[(UIImageViewAccessibility *)self accessibilityUserDefinedLabel];
  if ([v8[0] length])
  {
    id v10 = v8[0];
    int v7 = 1;
  }
  else
  {
    id v4 = (id)[(UIImageViewAccessibility *)v9 safeValueForKey:@"image"];
    id location = (id)[v4 accessibilityLabel];

    if ([location length])
    {
      id v10 = location;
    }
    else
    {
      v5.receiver = v9;
      v5.super_class = (Class)UIImageViewAccessibility;
      id v10 = [(UIImageViewAccessibility *)&v5 accessibilityLabel];
    }
    int v7 = 1;
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v8, 0);
  id v2 = v10;

  return v2;
}

- (id)accessibilityValue
{
  unint64_t v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)[(UIImageViewAccessibility *)self accessibilityUserDefinedValue];
  if ([v8[0] length])
  {
    id v10 = v8[0];
    int v7 = 1;
  }
  else
  {
    id v4 = (id)[(UIImageViewAccessibility *)v9 safeValueForKey:@"image"];
    id location = (id)[v4 accessibilityValue];

    if ([location length])
    {
      id v10 = location;
    }
    else
    {
      v5.receiver = v9;
      v5.super_class = (Class)UIImageViewAccessibility;
      id v10 = [(UIImageViewAccessibility *)&v5 accessibilityValue];
    }
    int v7 = 1;
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v8, 0);
  id v2 = v10;

  return v2;
}

- (id)accessibilityIdentification
{
  unint64_t v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)UIImageViewAccessibility;
  v8[0] = [(UIImageViewAccessibility *)&v7 accessibilityIdentification];
  if (!v8[0])
  {
    id v6 = (id)[(UIImageViewAccessibility *)v9 safeValueForKey:@"image"];
    id v2 = (id)[v6 accessibilityIdentification];
    id v3 = v8[0];
    v8[0] = v2;
  }
  id v5 = v8[0];
  objc_storeStrong(v8, 0);

  return v5;
}

- (id)accessibilityIdentifier
{
  id v6 = self;
  v5[1] = (id)a2;
  v5[0] = (id)[(UIImageViewAccessibility *)self accessibilityUserDefinedIdentifier];
  if (!v5[0])
  {
    v5[0] = [(UIImageViewAccessibility *)v6 accessibilityIdentification];
  }
  if (!v5[0])
  {
    id v4 = (id)[(UIImageViewAccessibility *)v6 safeValueForKey:@"image"];
    v5[0] = (id)[v4 accessibilityIdentifier];
  }
  id v3 = v5[0];
  objc_storeStrong(v5, 0);

  return v3;
}

- (BOOL)isAccessibilityElement
{
  objc_super v7 = self;
  SEL v6 = a2;
  id v3 = (id)[(UIImageViewAccessibility *)self storedAccessibilityIdentifier];
  BOOL v4 = 0;
  if (v3) {
    BOOL v4 = AXDoesRequestingClientDeserveAutomation() != 0;
  }

  if (v4) {
    return 1;
  }
  v5.receiver = v7;
  v5.super_class = (Class)UIImageViewAccessibility;
  return [(UIImageViewAccessibility *)&v5 isAccessibilityElement];
}

@end