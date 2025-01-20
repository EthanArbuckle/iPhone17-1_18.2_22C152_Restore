@interface UITableViewCellAccessibility__MediaPlayer__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation UITableViewCellAccessibility__MediaPlayer__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  v18.receiver = self;
  v18.super_class = (Class)UITableViewCellAccessibility__MediaPlayer__UIKit;
  unint64_t v2 = [(UITableViewCellAccessibility__MediaPlayer__UIKit *)&v18 accessibilityTraits];
  char v17 = 0;
  objc_opt_class();
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  AXPerformSafeBlock();
  id v3 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  v4 = __UIAccessibilityCastAsClass();

  if (v17) {
    abort();
  }
  v5 = [v4 image];
  v6 = [v5 accessibilityIdentifier];

  int v7 = [v6 hasPrefix:@"AlternateTrackCheckmark"];
  uint64_t v8 = *MEMORY[0x263F1CF38];
  if (!v7) {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v8 | v2;

  return v9;
}

@end