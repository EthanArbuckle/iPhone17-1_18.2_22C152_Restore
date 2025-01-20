@interface UIImageNibPlaceholderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (UIImageNibPlaceholderAccessibility)initWithCoder:(id)a3;
- (UIImageNibPlaceholderAccessibility)initWithData:(id)a3 andRuntimeResourceName:(id)a4;
@end

@implementation UIImageNibPlaceholderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIImageNibPlaceholder";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (UIImageNibPlaceholderAccessibility)initWithData:(id)a3 andRuntimeResourceName:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)UIImageNibPlaceholderAccessibility;
  v11 = [(UIImageNibPlaceholderAccessibility *)&v8 initWithData:location[0] andRuntimeResourceName:v9];
  objc_storeStrong((id *)&v11, v11);
  [(UIImageNibPlaceholderAccessibility *)v11 accessibilitySetIdentification:v9];
  v7 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (UIImageNibPlaceholderAccessibility)initWithCoder:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v17;
  v17 = 0;
  v14.receiver = v3;
  v14.super_class = (Class)UIImageNibPlaceholderAccessibility;
  v17 = [(UIImageNibPlaceholderAccessibility *)&v14 initWithCoder:location[0]];
  v15 = v17;
  id v13 = (id)[location[0] decodeObjectForKey:@"UIResourceName"];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __52__UIImageNibPlaceholderAccessibility_initWithCoder___block_invoke;
  v10 = &unk_2650ADFB0;
  v11 = v15;
  id v12 = v13;
  AXPerformSafeBlock();
  v5 = v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v5;
}

uint64_t __52__UIImageNibPlaceholderAccessibility_initWithCoder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilitySetIdentification:", *(void *)(a1 + 40), a1, a1);
}

@end