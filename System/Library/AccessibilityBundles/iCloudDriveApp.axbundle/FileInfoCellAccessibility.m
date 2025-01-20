@interface FileInfoCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (FileInfoCellAccessibility)initWithNameAndValue:(id)a3 value:(id)a4 maxLines:(int64_t)a5;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation FileInfoCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FileInfoCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FileInfoCell", @"nameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FileInfoCell", @"valueLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FileInfoCell", @"initWithNameAndValue: value: maxLines:", "@", "@", "@", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(FileInfoCellAccessibility *)self safeValueForKey:@"nameLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  objc_opt_class();
  id v3 = [(FileInfoCellAccessibility *)self safeValueForKey:@"valueLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = NSString;
  v6 = accessibilityLocalizedString(@"fileinfo.location.arrow");
  v7 = [v5 stringWithFormat:@", %@ ,", v6];

  v8 = [v4 safeValueForKey:@"text"];
  v9 = [v8 stringByReplacingOccurrencesOfString:@"▸" withString:v7];

  return v9;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)FileInfoCellAccessibility;
  [(FileInfoCellAccessibility *)&v14 _accessibilityLoadAccessibilityInformation];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(FileInfoCellAccessibility *)self safeValueForKey:@"nameLabel", 0];
  v15[0] = v3;
  v4 = [(FileInfoCellAccessibility *)self safeValueForKey:@"valueLabel"];
  v15[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setIsAccessibilityElement:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v7);
  }
}

- (FileInfoCellAccessibility)initWithNameAndValue:(id)a3 value:(id)a4 maxLines:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)FileInfoCellAccessibility;
  v5 = [(FileInfoCellAccessibility *)&v7 initWithNameAndValue:a3 value:a4 maxLines:a5];
  [(FileInfoCellAccessibility *)v5 _accessibilityLoadAccessibilityInformation];

  return v5;
}

@end