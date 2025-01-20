@interface UITableViewCellAccessibility__Preferences__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation UITableViewCellAccessibility__Preferences__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(UITableViewCellAccessibility__Preferences__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"LanguageCell"];

  if (v4)
  {
    v5 = [(UITableViewCellAccessibility__Preferences__UIKit *)self safeValueForKey:@"textLabel"];
    v6 = [v5 accessibilityLabel];

    if ([v6 length])
    {
      v7 = [MEMORY[0x263F21660] axAttributedStringWithString:v6];
      v8 = [(UITableViewCellAccessibility__Preferences__UIKit *)self _accessibilityValueForKey:@"axLanguage"];
      [v7 setAttribute:v8 forKey:*MEMORY[0x263F217F0]];

      goto LABEL_6;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)UITableViewCellAccessibility__Preferences__UIKit;
  v7 = [(UITableViewCellAccessibility__Preferences__UIKit *)&v10 accessibilityLabel];
LABEL_6:

  return v7;
}

@end