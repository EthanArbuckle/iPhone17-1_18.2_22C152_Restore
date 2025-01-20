@interface PSSpecifierAccessibility__ScreenTimeUI__Preferences
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsExpandableSTUICell;
- (BOOL)_accessibilityIsExpandedSTUICell;
- (void)_accessibilitySetIsExpandableSTUICell:(BOOL)a3;
- (void)_accessibilitySetIsExpandedSTUICell:(BOOL)a3;
@end

@implementation PSSpecifierAccessibility__ScreenTimeUI__Preferences

+ (id)safeCategoryTargetClassName
{
  return @"PSSpecifier";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsExpandableSTUICell
{
  return MEMORY[0x270F0A438](self, &__STUI_PSSpecifierAccessibility___accessibilityIsExpandableSTUICell);
}

- (void)_accessibilitySetIsExpandableSTUICell:(BOOL)a3
{
}

- (BOOL)_accessibilityIsExpandedSTUICell
{
  return MEMORY[0x270F0A438](self, &__STUI_PSSpecifierAccessibility___accessibilityIsExpandedSTUICell);
}

- (void)_accessibilitySetIsExpandedSTUICell:(BOOL)a3
{
}

@end