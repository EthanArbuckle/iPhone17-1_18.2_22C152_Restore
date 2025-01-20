@interface UIBarButtonItemAccessibility
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (UIBarButtonItemAccessibility)initWithImage:(id)a3 landscapeImagePhone:(id)a4 style:(int64_t)a5 target:(id)a6 action:(SEL)a7;
- (UIBarButtonItemAccessibility)initWithImage:(id)a3 style:(int64_t)a4 target:(id)a5 action:(SEL)a6;
- (id)_accessibilityIdentifierForImage:(uint64_t)a1;
- (id)_axBarButtonImagePath;
- (id)accessibilityLabel;
- (id)accessibilityLocalizationBundleID;
- (id)accessibilityLocalizationBundlePath;
- (id)accessibilityLocalizedStringKey;
- (id)accessibilityLocalizedStringTableName;
- (id)createViewForNavigationItem:(id)a3;
- (id)createViewForToolbar:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityAddIdForView:(void *)a1;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setAXBarButtonImagePath:(uint64_t)a1;
- (void)_setAccessibilityHintBlock:(id)a3;
- (void)_setAccessibilityIsNotFirstElement:(BOOL)a3;
- (void)_setAccessibilityLabelBlock:(id)a3;
- (void)_setAccessibilityValueBlock:(id)a3;
- (void)_updateAccessibilityLabelForImage:(void *)a1;
- (void)dealloc;
- (void)setAccessibilityAttributedHint:(id)a3;
- (void)setAccessibilityAttributedLabel:(id)a3;
- (void)setAccessibilityAttributedValue:(id)a3;
- (void)setAccessibilityHint:(id)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setAccessibilityUserInputLabels:(id)a3;
- (void)setAccessibilityValue:(id)a3;
- (void)setCustomView:(id)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setView:(id)a3;
@end

@implementation UIBarButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIBarButtonItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIBarButtonItem";
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"customView", v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityAddIdForView:(void *)a1
{
  id v45 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v45)
  {
    if (location)
    {
      id v42 = (id)[v45 accessibilityIdentification];
      if ([v42 length])
      {
        [location accessibilitySetIdentification:v42];
      }
      else
      {
        id v37 = (id)[v45 safeValueForKey:@"systemItem"];
        unsigned int v38 = [v37 intValue];

        unsigned int v41 = v38;
        if (!v38)
        {
          id v36 = (id)[v45 safeValueForKey:@"tag"];
          unsigned int v41 = [v36 intValue];
        }
        if (v41)
        {
          id v34 = location;
          id v35 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", v41);
          objc_msgSend(v34, "accessibilitySetIdentification:");
        }
      }
      id v40 = (id)[v45 _accessibilityGetBlockForAttribute:1];
      if (v40)
      {
        [location _setAccessibilityLabelBlock:v40];
      }
      else
      {
        id v39 = (id)[v45 _accessibilityAXAttributedLabel];
        if ([v39 length]) {
          [location setAccessibilityLabel:v39];
        }
        objc_storeStrong(&v39, 0);
      }
      id v2 = (id)[v45 _accessibilityGetBlockForAttribute:2];
      id v3 = v40;
      id v40 = v2;

      if (v40)
      {
        [location _setAccessibilityHintBlock:v40];
      }
      else
      {
        id v4 = (id)[v45 _accessibilityAXAttributedHint];
        BOOL v33 = v4 == 0;

        if (!v33)
        {
          id v31 = location;
          id v32 = (id)[v45 _accessibilityAXAttributedHint];
          objc_msgSend(v31, "setAccessibilityHint:");
        }
      }
      id v5 = (id)[v45 accessibilityIdentifier];
      BOOL v30 = v5 == 0;

      if (!v30)
      {
        id v28 = location;
        id v29 = (id)[v45 accessibilityIdentifier];
        objc_msgSend(v28, "setAccessibilityIdentifier:");
      }
      id v6 = (id)[v45 accessibilityUserInputLabels];
      BOOL v27 = v6 == 0;

      if (!v27)
      {
        id v25 = location;
        id v26 = (id)[v45 accessibilityUserInputLabels];
        objc_msgSend(v25, "setAccessibilityUserInputLabels:");
      }
      id v7 = (id)[v45 _accessibilityGetBlockForAttribute:3];
      id v8 = v40;
      id v40 = v7;

      if (v40)
      {
        [location _setAccessibilityValueBlock:v40];
      }
      else
      {
        id v9 = (id)[v45 _accessibilityAXAttributedValue];
        BOOL v24 = v9 == 0;

        if (!v24)
        {
          id v22 = location;
          id v23 = (id)[v45 _accessibilityAXAttributedValue];
          objc_msgSend(v22, "setAccessibilityValue:");
        }
      }
      id v10 = (id)[v45 accessibilityUserDefinedTraits];
      BOOL v21 = v10 == 0;

      if (!v21)
      {
        id v19 = location;
        id v20 = (id)[v45 accessibilityUserDefinedTraits];
        objc_msgSend(v19, "setAccessibilityTraits:", objc_msgSend(v20, "unsignedLongLongValue"));
      }
      id v11 = (id)[v45 isAccessibilityUserDefinedElement];
      BOOL v18 = v11 == 0;

      if (!v18)
      {
        id v16 = location;
        id v17 = (id)[v45 isAccessibilityUserDefinedElement];
        objc_msgSend(v16, "setIsAccessibilityElement:", objc_msgSend(v17, "BOOLValue") & 1);
      }
      id v12 = (id)[v45 accessibilityUserDefinedNotFirstElement];
      BOOL v15 = v12 == 0;

      if (!v15)
      {
        id v13 = location;
        id v14 = (id)[v45 accessibilityUserDefinedNotFirstElement];
        objc_msgSend(v13, "_setAccessibilityIsNotFirstElement:", objc_msgSend(v14, "BOOLValue") & 1);
      }
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v42, 0);
      int v43 = 0;
    }
    else
    {
      int v43 = 1;
    }
  }
  else
  {
    int v43 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityIdentifierForImage:(uint64_t)a1
{
  uint64_t v15 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v15)
  {
    if (location)
    {
      id v12 = &unk_26F48ECF8;
      id v11 = &unk_26F48ED10;
      for (int i = 0; ; ++i)
      {
        unint64_t v6 = i;
        if (v6 >= [v12 count]) {
          break;
        }
        id v4 = (void *)MEMORY[0x263F1C6B0];
        id v5 = (id)[v12 objectAtIndexedSubscript:i];
        image = (UIImage *)(id)objc_msgSend(v4, "kitImageNamed:");

        id v8 = UIImagePNGRepresentation((UIImage *)location);
        id v7 = UIImagePNGRepresentation(image);
        if ([v8 isEqual:v7])
        {
          id v16 = (id)[v11 objectAtIndexedSubscript:i];
          int v13 = 1;
        }
        else
        {
          int v13 = 0;
        }
        objc_storeStrong(&v7, 0);
        objc_storeStrong(&v8, 0);
        objc_storeStrong((id *)&image, 0);
        if (v13) {
          goto LABEL_13;
        }
      }
      id v16 = 0;
      int v13 = 1;
LABEL_13:
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v12, 0);
    }
    else
    {
      id v16 = 0;
      int v13 = 1;
    }
  }
  else
  {
    id v16 = 0;
    int v13 = 1;
  }
  objc_storeStrong(&location, 0);
  id v2 = v16;

  return v2;
}

- (id)accessibilityLabel
{
  BOOL v24 = self;
  v23[1] = (id)a2;
  v22.receiver = self;
  v22.super_class = (Class)UIBarButtonItemAccessibility;
  v23[0] = [(UIBarButtonItemAccessibility *)&v22 accessibilityLabel];
  char v20 = 0;
  objc_opt_class();
  id v13 = (id)[(UIBarButtonItemAccessibility *)v24 safeValueForKey:@"image"];
  id v19 = (id)__UIAccessibilityCastAsClass();

  id v18 = v19;
  objc_storeStrong(&v19, 0);
  id v21 = v18;
  if (!v23[0])
  {
    id v17 = (id)[v21 accessibilityIdentifier];
    if (!v17)
    {
      id v17 = -[UIBarButtonItemAccessibility _accessibilityIdentifierForImage:]((uint64_t)v24, v21);
    }
    id v16 = (id)UIAXLocalizedStringForKnownAXIdentifier();
    if ([v16 length])
    {
      objc_storeStrong(v23, v16);
    }
    else
    {
      id v2 = (id)[v21 accessibilityLabel];
      id v3 = v23[0];
      v23[0] = v2;
    }
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
  if (!v23[0])
  {
    id v4 = -[UIBarButtonItemAccessibility _axBarButtonImagePath](v24);
    id v5 = v23[0];
    v23[0] = v4;
  }
  char v14 = 0;
  char v12 = 0;
  if (![v23[0] length])
  {
    id v15 = (id)[v21 accessibilityLabel];
    char v14 = 1;
    char v12 = [v15 isEqualToString:@"sidebar.leading"];
  }
  if (v14) {

  }
  if (v12)
  {
    id v6 = (id)accessibilityUIKitLocalizedString();
    id v7 = v23[0];
    v23[0] = v6;
  }
  if (!v23[0]
    && ([(UIBarButtonItemAccessibility *)v24 safeBoolForKey:@"isSystemItem"] & 1) != 0)
  {
    id v8 = (id)objc_msgSend(MEMORY[0x263F1CB60], "_accessibilityTitleForSystemTag:", -[UIBarButtonItemAccessibility safeIntegerForKey:](v24, "safeIntegerForKey:", @"systemItem"));
    id v9 = v23[0];
    v23[0] = v8;
  }
  id v11 = v23[0];
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v23, 0);

  return v11;
}

- (id)_axBarButtonImagePath
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UIBarButtonItemAccessibility___axBarButtonImagePath);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)accessibilityLocalizedStringKey
{
  return (id)[(UIBarButtonItemAccessibility *)self _accessibilityRetrieveLocalizedStringKey];
}

- (id)accessibilityLocalizationBundleID
{
  return (id)[(UIBarButtonItemAccessibility *)self _accessibilityRetrieveLocalizationBundleID];
}

- (id)accessibilityLocalizationBundlePath
{
  return (id)[(UIBarButtonItemAccessibility *)self _accessibilityRetrieveLocalizationBundlePath];
}

- (id)accessibilityLocalizedStringTableName
{
  return (id)[(UIBarButtonItemAccessibility *)self _accessibilityRetrieveLocalizedStringTableName];
}

- (void)setTitle:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 setTitle:location[0]];
  id v3 = v7;
  id v4 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"view"];
  -[UIBarButtonItemAccessibility _accessibilityAddIdForView:](v3, v4);

  objc_storeStrong(location, 0);
}

- (void)setView:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v3 setView:location[0]];
  -[UIBarButtonItemAccessibility _accessibilityAddIdForView:](v5, location[0]);
  objc_storeStrong(location, 0);
}

- (void)setCustomView:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v3 setCustomView:location[0]];
  -[UIBarButtonItemAccessibility _accessibilityAddIdForView:](v5, location[0]);
  objc_storeStrong(location, 0);
}

- (void)_setAccessibilityLabelBlock:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 _setAccessibilityLabelBlock:location[0]];
  id v4 = (id)[(UIBarButtonItemAccessibility *)v7 safeUIViewForKey:@"_view"];
  [v4 _setAccessibilityLabelBlock:location[0]];

  id v3 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_updateView"];
  objc_storeStrong(location, 0);
}

- (void)_setAccessibilityHintBlock:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 _setAccessibilityHintBlock:location[0]];
  id v4 = (id)[(UIBarButtonItemAccessibility *)v7 safeUIViewForKey:@"_view"];
  [v4 _setAccessibilityHintBlock:location[0]];

  id v3 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_updateView"];
  objc_storeStrong(location, 0);
}

- (void)_setAccessibilityValueBlock:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 _setAccessibilityValueBlock:location[0]];
  id v4 = (id)[(UIBarButtonItemAccessibility *)v7 safeUIViewForKey:@"_view"];
  [v4 _setAccessibilityValueBlock:location[0]];

  id v3 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_updateView"];
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityLabel:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 setAccessibilityLabel:location[0]];
  id v4 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_view"];
  [v4 setAccessibilityLabel:location[0]];
  id v3 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_updateView"];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityAttributedLabel:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 setAccessibilityAttributedLabel:location[0]];
  id v4 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_view"];
  [v4 setAccessibilityAttributedLabel:location[0]];
  id v3 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_updateView"];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityUserInputLabels:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 setAccessibilityUserInputLabels:location[0]];
  id v4 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_view"];
  [v4 setAccessibilityUserInputLabels:location[0]];
  id v3 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_updateView"];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityIdentifier:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 setAccessibilityIdentifier:location[0]];
  id v4 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_view"];
  [v4 setAccessibilityIdentifier:location[0]];
  id v3 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_updateView"];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 setIsAccessibilityElement:a3];
  id v4 = (id)[(UIBarButtonItemAccessibility *)v8 safeValueForKey:@"_view"];
  [v4 setIsAccessibilityElement:v6];
  id v3 = (id)[(UIBarButtonItemAccessibility *)v8 safeValueForKey:@"_updateView"];
  objc_storeStrong(&v4, 0);
}

- (void)setAccessibilityValue:(id)a3
{
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 setAccessibilityValue:location[0]];
  id v4 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_view"];
  [v4 setAccessibilityValue:location[0]];
  id v3 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_updateView"];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityAttributedValue:(id)a3
{
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 setAccessibilityAttributedValue:location[0]];
  id v4 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_view"];
  [v4 setAccessibilityAttributedValue:location[0]];
  id v3 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_updateView"];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  id v8 = self;
  SEL v7 = a2;
  unint64_t v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 setAccessibilityTraits:a3];
  id v4 = (id)[(UIBarButtonItemAccessibility *)v8 safeValueForKey:@"_view"];
  [v4 setAccessibilityTraits:v6];
  id v3 = (id)[(UIBarButtonItemAccessibility *)v8 safeValueForKey:@"_updateView"];
  objc_storeStrong(&v4, 0);
}

- (BOOL)isAccessibilityElement
{
  id v2 = (id)[(UIBarButtonItemAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v5 = v2 == 0;

  if (v5) {
    return 1;
  }
  id v4 = (id)[(UIBarButtonItemAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (unint64_t)accessibilityTraits
{
  id v2 = (id)[(UIBarButtonItemAccessibility *)self accessibilityUserDefinedTraits];
  BOOL v5 = v2 == 0;

  if (v5) {
    return *MEMORY[0x263F1CEE8];
  }
  id v4 = (id)[(UIBarButtonItemAccessibility *)self accessibilityUserDefinedTraits];
  unint64_t v7 = [v4 unsignedLongLongValue];

  return v7;
}

- (void)_setAccessibilityIsNotFirstElement:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 _setAccessibilityIsNotFirstElement:a3];
  id v4 = (id)[(UIBarButtonItemAccessibility *)v8 safeValueForKey:@"_view"];
  [v4 _setAccessibilityIsNotFirstElement:v6];
  id v3 = (id)[(UIBarButtonItemAccessibility *)v8 safeValueForKey:@"_updateView"];
  objc_storeStrong(&v4, 0);
}

- (void)setAccessibilityHint:(id)a3
{
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 setAccessibilityHint:location[0]];
  id v4 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_view"];
  [v4 setAccessibilityHint:location[0]];
  id v3 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_updateView"];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityAttributedHint:(id)a3
{
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v5 setAccessibilityAttributedHint:location[0]];
  id v4 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_view"];
  [v4 setAccessibilityAttributedHint:location[0]];
  id v3 = (id)[(UIBarButtonItemAccessibility *)v7 safeValueForKey:@"_updateView"];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  BOOL v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v2 = v6;
  id v3 = (id)[(UIBarButtonItemAccessibility *)v6 safeValueForKey:@"view"];
  -[UIBarButtonItemAccessibility _accessibilityAddIdForView:](v2, v3);
}

- (void)dealloc
{
  objc_super v4 = self;
  SEL v3 = a2;
  [(UIBarButtonItemAccessibility *)self _accessibilityUnregister];
  v2.receiver = v4;
  v2.super_class = (Class)UIBarButtonItemAccessibility;
  [(UIBarButtonItemAccessibility *)&v2 dealloc];
}

- (id)createViewForNavigationItem:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v8;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  id v6 = [(UIBarButtonItemAccessibility *)&v5 createViewForNavigationItem:location[0]];
  -[UIBarButtonItemAccessibility _accessibilityAddIdForView:](v8, v6);
  id v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (UIBarButtonItemAccessibility)initWithImage:(id)a3 style:(int64_t)a4 target:(id)a5 action:(SEL)a6
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v15 = a4;
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  SEL v13 = a6;
  id v6 = v17;
  id v17 = 0;
  v12.receiver = v6;
  v12.super_class = (Class)UIBarButtonItemAccessibility;
  id v17 = [(UIBarButtonItemAccessibility *)&v12 initWithImage:location[0] style:v15 target:v14 action:a6];
  objc_storeStrong((id *)&v17, v17);
  -[UIBarButtonItemAccessibility _updateAccessibilityLabelForImage:](v17, location[0]);
  id v11 = v17;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v11;
}

- (void)_updateAccessibilityLabelForImage:(void *)a1
{
  id v8 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v8)
  {
    id v5 = (id)[location accessibilityIdentifier];
    if ([v5 length])
    {
      id v4 = (id)UIAXLocalizedStringForKnownAXIdentifier();
      if (v4)
      {
        [v8 setAccessibilityLabel:v4];
      }
      else
      {
        uint64_t v2 = (uint64_t)v8;
        id v3 = (id)[v8 _accessibilityRetrieveImagePathLabel:v5];
        -[UIBarButtonItemAccessibility _setAXBarButtonImagePath:](v2, v3);
      }
      objc_storeStrong(&v4, 0);
    }
    objc_storeStrong(&v5, 0);
    int v6 = 0;
  }
  else
  {
    int v6 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (UIBarButtonItemAccessibility)initWithImage:(id)a3 landscapeImagePhone:(id)a4 style:(int64_t)a5 target:(id)a6 action:(SEL)a7
{
  char v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  int64_t v17 = a5;
  id v16 = 0;
  objc_storeStrong(&v16, a6);
  SEL v15 = a7;
  SEL v7 = v20;
  char v20 = 0;
  v14.receiver = v7;
  v14.super_class = (Class)UIBarButtonItemAccessibility;
  char v20 = [(UIBarButtonItemAccessibility *)&v14 initWithImage:location[0] landscapeImagePhone:v18 style:v17 target:v16 action:a7];
  objc_storeStrong((id *)&v20, v20);
  -[UIBarButtonItemAccessibility _updateAccessibilityLabelForImage:](v20, location[0]);
  SEL v13 = v20;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v20, 0);
  return v13;
}

- (void)_setAXBarButtonImagePath:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (id)createViewForToolbar:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v8;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  id v6 = [(UIBarButtonItemAccessibility *)&v5 createViewForToolbar:location[0]];
  -[UIBarButtonItemAccessibility _accessibilityAddIdForView:](v8, v6);
  id v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);

  return v4;
}

@end