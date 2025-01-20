@interface UITableViewCellAccessibility__PhotoLibrary__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIgnoreInternalLabels;
@end

@implementation UITableViewCellAccessibility__PhotoLibrary__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIgnoreInternalLabels
{
  v2 = [(UITableViewCellAccessibility__PhotoLibrary__UIKit *)self accessibilityIdentification];
  char v3 = [v2 isEqualToString:@"CloudCreateCell"];

  return v3;
}

@end