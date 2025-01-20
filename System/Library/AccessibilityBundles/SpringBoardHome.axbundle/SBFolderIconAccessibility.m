@interface SBFolderIconAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (void)dealloc;
@end

@implementation SBFolderIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFolderIcon";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  [(SBFolderIconAccessibility *)self _accessibilityUnregister];
  v3.receiver = self;
  v3.super_class = (Class)SBFolderIconAccessibility;
  [(SBFolderIconAccessibility *)&v3 dealloc];
}

- (id)accessibilityLabel
{
  objc_super v3 = NSString;
  v4 = accessibilityLocalizedString(@"folder.label");
  v8.receiver = self;
  v8.super_class = (Class)SBFolderIconAccessibility;
  v5 = [(SBFolderIconAccessibility *)&v8 accessibilityLabel];
  v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F81388] | *MEMORY[0x263F813A0];
}

- (id)automationElements
{
  v2 = [(SBFolderIconAccessibility *)self safeValueForKey:@"_folder"];
  objc_super v3 = [v2 safeValueForKey:@"allIcons"];
  v4 = [v3 allObjects];

  return v4;
}

@end