@interface NotificationCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation NotificationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NotificationCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_imageView:", "@", "B", 0);
  [v3 validateClass:@"NotificationCell" isKindOfClass:@"UITableViewCell"];
}

- (unint64_t)accessibilityTraits
{
  v18.receiver = self;
  v18.super_class = (Class)NotificationCellAccessibility;
  unint64_t v2 = [(NotificationCellAccessibility *)&v18 accessibilityTraits];
  char v17 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  AXPerformSafeBlock();
  id v3 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  v4 = __UIAccessibilitySafeClass();

  if (v17) {
    abort();
  }
  v5 = [v4 image];
  v6 = [v5 accessibilityIdentification];
  int v7 = [v6 hasPrefix:@"UIPreferencesBlueCheck"];

  uint64_t v8 = *MEMORY[0x263F1CF38];
  if (!v7) {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v8 | v2;

  return v9;
}

uint64_t __52__NotificationCellAccessibility_accessibilityTraits__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _imageView:0];

  return MEMORY[0x270F9A758]();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end