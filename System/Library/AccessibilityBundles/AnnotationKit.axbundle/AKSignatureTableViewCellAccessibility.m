@interface AKSignatureTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation AKSignatureTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKSignatureTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKSignatureTableViewCell", @"signature", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKSignature", @"creationDate", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"signature.label");
}

- (id)accessibilityValue
{
  v11.receiver = self;
  v11.super_class = (Class)AKSignatureTableViewCellAccessibility;
  id v3 = [(AKSignatureTableViewCellAccessibility *)&v11 accessibilityLabel];
  if (!v3)
  {
    objc_opt_class();
    v4 = [(AKSignatureTableViewCellAccessibility *)self safeValueForKey:@"signature"];
    v5 = [v4 safeValueForKey:@"creationDate"];
    v6 = __UIAccessibilityCastAsClass();

    if (v6)
    {
      v7 = NSString;
      v8 = accessibilityLocalizedString(@"signature.date.created");
      v9 = [MEMORY[0x263F08790] localizedStringFromDate:v6 dateStyle:3 timeStyle:3];
      id v3 = objc_msgSend(v7, "stringWithFormat:", v8, v9);
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

@end