@interface UITextFieldAccessibility__ContactsUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation UITextFieldAccessibility__ContactsUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3 = [(UITextFieldAccessibility__ContactsUI__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:kAXPhotosTextFieldIdentifier];

  if (v4) {
    return *MEMORY[0x263F1CEF8];
  }
  v6.receiver = self;
  v6.super_class = (Class)UITextFieldAccessibility__ContactsUI__UIKit;
  return [(UITextFieldAccessibility__ContactsUI__UIKit *)&v6 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  v2 = self;
  v3 = [(UITextFieldAccessibility__ContactsUI__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:kAXPhotosTextFieldIdentifier];

  if (v4)
  {
    v2 = [v2 safeStringForKey:@"text"];
    if (v2)
    {
      v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      objc_super v6 = [v2 stringByTrimmingCharactersInSet:v5];

      LOBYTE(v2) = [v6 length] != 0;
    }
  }
  else
  {
    v8.receiver = v2;
    v8.super_class = (Class)UITextFieldAccessibility__ContactsUI__UIKit;
    LOBYTE(v2) = [(UITextFieldAccessibility__ContactsUI__UIKit *)&v8 isAccessibilityElement];
  }
  return (char)v2;
}

@end