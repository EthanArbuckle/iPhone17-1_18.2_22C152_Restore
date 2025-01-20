@interface BBBulletinAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySectionNameForIcon;
@end

@implementation BBBulletinAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BBBulletin";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBApplicationController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBApplicationController", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationController", @"applicationWithBundleIdentifier:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"displayName", "@", 0);
}

- (id)_accessibilitySectionNameForIcon
{
  v2 = [(BBBulletinAccessibility *)self sectionID];
  [NSClassFromString(&cfstr_Sbapplicationc.isa) safeValueForKey:@"sharedInstance"];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v2;
  AXPerformSafeBlock();
  id v3 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return v3;
}

void __59__BBBulletinAccessibility__accessibilitySectionNameForIcon__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) applicationWithBundleIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = [v7 safeValueForKey:@"displayName"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = &stru_26F7D3690;
  }
}

@end