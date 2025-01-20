@interface UIAssistantBarButtonItemProviderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)actionForInputMode:(id)a3;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation UIAssistantBarButtonItemProviderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIAssistantBarButtonItemProvider";
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
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", @"UIAssistantBarButtonItemProvider", @"actionForInputMode:", "@", 0);
  objc_storeStrong(v4, obj);
}

+ (id)actionForInputMode:(id)a3
{
  id v16 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13.receiver = v16;
  v13.super_class = (Class)&OBJC_METACLASS___UIAssistantBarButtonItemProviderAccessibility;
  id v14 = objc_msgSendSuper2(&v13, sel_actionForInputMode_, location[0]);
  id v12 = (id)[v14 title];
  if ([v12 length])
  {
    id v6 = (id)MEMORY[0x2455E67C0](location[0]);
    id v11 = (id)MEMORY[0x2455E66B0]();

    id v10 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v12];
    id v9 = v10;
    id v7 = v11;
    uint64_t v8 = *MEMORY[0x263F217A8];
    uint64_t v3 = [v12 length];
    uint64_t v18 = 0;
    uint64_t v17 = v3;
    uint64_t v19 = 0;
    uint64_t v20 = v3;
    objc_msgSend(v9, "setAttribute:forKey:withRange:", v7, v8, 0, v3);
    [v14 setAccessibilityLabel:v10];
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  id v5 = v14;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);

  return v5;
}

@end