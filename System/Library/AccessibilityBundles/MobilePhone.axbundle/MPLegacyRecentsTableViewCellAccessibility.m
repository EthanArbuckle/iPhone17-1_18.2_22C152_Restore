@interface MPLegacyRecentsTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldIgnoreSwipeActionCompletionHandler;
- (id)accessibilityCustomActions;
@end

@implementation MPLegacyRecentsTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPLegacyRecentsTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPLegacyRecentsTableViewCell", @"callButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPLegacyRecentsTableViewCell", @"callButtonTapped:", "v", "@", 0);
}

- (BOOL)_accessibilityShouldIgnoreSwipeActionCompletionHandler
{
  return 1;
}

- (id)accessibilityCustomActions
{
  v13[1] = *MEMORY[0x263EF8340];
  char v12 = 0;
  objc_opt_class();
  id v3 = [(MPLegacyRecentsTableViewCellAccessibility *)self safeUIViewForKey:@"callButton"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4 && ([v4 isHidden] & 1) == 0)
  {
    id v6 = objc_alloc(MEMORY[0x263F1C390]);
    v7 = accessibilityLocalizedString(@"call.text");
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__MPLegacyRecentsTableViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v10[3] = &unk_265134EF8;
    v10[4] = self;
    id v11 = v4;
    v8 = (void *)[v6 initWithName:v7 actionHandler:v10];

    v13[0] = v8;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

uint64_t __71__MPLegacyRecentsTableViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __71__MPLegacyRecentsTableViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) callButtonTapped:*(void *)(a1 + 40)];
}

@end