@interface WDAddDataManualEntryItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_createWDManualDataEntryTableViewCellWithDisplayName:(id)a3 unitName:(id)a4 entryType:(unint64_t)a5 highlightWhenEditing:(BOOL)a6;
@end

@implementation WDAddDataManualEntryItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WDAddDataManualEntryItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_createWDManualDataEntryTableViewCellWithDisplayName:(id)a3 unitName:(id)a4 entryType:(unint64_t)a5 highlightWhenEditing:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  char v17 = 0;
  v16.receiver = self;
  v16.super_class = (Class)WDAddDataManualEntryItemAccessibility;
  v12 = [(WDAddDataManualEntryItemAccessibility *)&v16 _createWDManualDataEntryTableViewCellWithDisplayName:v10 unitName:v11 entryType:a5 highlightWhenEditing:v6];
  v13 = __UIAccessibilitySafeClass();

  if (v17) {
    abort();
  }
  v14 = [(WDAddDataManualEntryItemAccessibility *)self accessibilityLabel];
  [v13 _accessibilitySetRetainedValue:v14 forKey:@"AXDisplayLabelOverrideKey"];

  [v13 _accessibilityLoadAccessibilityInformation];

  return v13;
}

@end