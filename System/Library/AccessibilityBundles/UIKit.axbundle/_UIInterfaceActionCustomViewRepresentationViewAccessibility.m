@interface _UIInterfaceActionCustomViewRepresentationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityPath;
@end

@implementation _UIInterfaceActionCustomViewRepresentationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIInterfaceActionCustomViewRepresentationView";
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
  objc_storeStrong(location, 0);
}

- (id)accessibilityPath
{
  v24 = self;
  SEL v23 = a2;
  [(_UIInterfaceActionCustomViewRepresentationViewAccessibility *)self accessibilityFrame];
  CGRect v20 = v26;
  CGRect v27 = CGRectIntegral(v26);
  *(CGFloat *)&long long v21 = v27.origin.x;
  *((void *)&v21 + 1) = *(void *)&v27.origin.y;
  *(CGFloat *)&long long v22 = v27.size.width;
  *((void *)&v22 + 1) = *(void *)&v27.size.height;
  uint64_t v12 = MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  v15 = __80___UIInterfaceActionCustomViewRepresentationViewAccessibility_accessibilityPath__block_invoke;
  v16 = &__block_descriptor_64_e39_Q40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  long long v17 = v21;
  long long v18 = v22;
  id v19 = (id)MEMORY[0x2455E7040]();
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  id location = (id)[(_UIInterfaceActionCustomViewRepresentationViewAccessibility *)v24 _accessibilityFindViewAncestor:&__block_literal_global_53 startWithSelf:0];
  if (location)
  {
    [location accessibilityFrame];
    CGRect v29 = CGRectIntegral(v28);
    uint64_t v11 = (*((uint64_t (**)(__n128, __n128, __n128, __n128))v19 + 2))((__n128)v29.origin, *(__n128 *)&v29.origin.y, (__n128)v29.size, *(__n128 *)&v29.size.height);
    id v8 = (id)[location layer];
    [v8 cornerRadius];
    uint64_t v10 = v2;
  }
  v6 = (void *)MEMORY[0x263F1C478];
  CGSizeMake_4();
  id v7 = (id)objc_msgSend(v6, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v11, v21, v22, v3, v4);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v19, 0);

  return v7;
}

@end