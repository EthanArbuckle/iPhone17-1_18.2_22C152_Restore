@interface HUMediaAccessControlEditorTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityHomeUIHandleTVandSpeakersTableViewCells;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUMediaAccessControlEditorTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUMediaAccessControlEditorTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUMediaAccessControlEditorTableViewController" isKindOfClass:@"UITableViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUItemTableViewController", @"itemManager", "@", 0);
  [v3 validateClass:@"HUItemTableViewController" isKindOfClass:@"UITableViewController"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUMediaAccessControlEditorTableViewControllerAccessibility;
  [(HUMediaAccessControlEditorTableViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(HUMediaAccessControlEditorTableViewControllerAccessibility *)self _accessibilityHomeUIHandleTVandSpeakersTableViewCells];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)HUMediaAccessControlEditorTableViewControllerAccessibility;
  [(HUMediaAccessControlEditorTableViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(HUMediaAccessControlEditorTableViewControllerAccessibility *)self _accessibilityHomeUIHandleTVandSpeakersTableViewCells];
}

- (void)_accessibilityHomeUIHandleTVandSpeakersTableViewCells
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v25 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
  uint64_t v3 = [v25 section];
  char v33 = 0;
  objc_opt_class();
  objc_super v4 = __UIAccessibilityCastAsClass();
  v24 = v4;
  v5 = [v4 tableView];
  v6 = [v5 visibleCells];

  v7 = [(HUMediaAccessControlEditorTableViewControllerAccessibility *)self safeValueForKey:@"itemManager"];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    unint64_t v11 = 0x263F08000uLL;
    uint64_t v26 = v3;
    v27 = v7;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        char v33 = 0;
        objc_opt_class();
        v14 = [v7 displayedSectionIdentifierForSectionIndex:v3];
        v15 = __UIAccessibilityCastAsClass();

        if (v33) {
          abort();
        }
        if ([v15 isEqualToString:@"ACCESS_CONTROL_SECTION"])
        {
          v16 = *(void **)(v11 + 2880);
          v17 = accessibilityHomeUILocalizedString(@"allow.speaker.and.tv.access.option");
          v18 = [v13 textLabel];
          [v18 text];
          uint64_t v19 = v9;
          unint64_t v20 = v11;
          v22 = uint64_t v21 = v10;
          v23 = objc_msgSend(v16, "localizedStringWithFormat:", v17, v22);
          [v13 setAccessibilityHint:v23];

          uint64_t v10 = v21;
          unint64_t v11 = v20;
          uint64_t v9 = v19;

          uint64_t v3 = v26;
          v7 = v27;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }
}

@end