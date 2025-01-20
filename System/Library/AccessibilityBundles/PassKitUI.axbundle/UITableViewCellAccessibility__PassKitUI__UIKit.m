@interface UITableViewCellAccessibility__PassKitUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityChildren;
@end

@implementation UITableViewCellAccessibility__PassKitUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityChildren
{
  if ([(UITableViewCellAccessibility__PassKitUI__UIKit *)self _accessibilityBoolValueForKey:kAXManualEntryCellIdentifier])
  {
    v7.receiver = self;
    v7.super_class = (Class)UITableViewCellAccessibility__PassKitUI__UIKit;
    v3 = [(UITableViewCellAccessibility__PassKitUI__UIKit *)&v7 _accessibilityChildren];
    uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_7];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = 0;
    }
    else
    {
      v5 = [v3 objectAtIndex:v4];
    }
    [v5 setIsAccessibilityElement:0];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCellAccessibility__PassKitUI__UIKit;
    v3 = [(UITableViewCellAccessibility__PassKitUI__UIKit *)&v8 _accessibilityChildren];
  }

  return v3;
}

@end