@interface PSSpecifierAccessibility__MobileMail__Preferences
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PSSpecifierAccessibility__MobileMail__Preferences

+ (id)safeCategoryTargetClassName
{
  return @"PSSpecifier";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PSSpecifierAccessibility__MobileMail__Preferences *)self safeValueForKey:@"name"];
  if ([v2 isEqualToString:@"Yahoo!"])
  {
    v3 = @"yahoo.cell.text";
LABEL_7:
    v4 = accessibilityLocalizedString(v3);
    goto LABEL_8;
  }
  if ([v2 isEqualToString:@"AOL"])
  {
    v3 = @"aol.cell.text";
    goto LABEL_7;
  }
  if ([v2 isEqualToString:@".Mac"])
  {
    v3 = @"dotmac.cell.text";
    goto LABEL_7;
  }
  v4 = 0;
LABEL_8:

  return v4;
}

@end