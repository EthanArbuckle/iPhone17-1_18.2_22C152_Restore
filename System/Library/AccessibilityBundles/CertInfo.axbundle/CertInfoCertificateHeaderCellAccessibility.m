@interface CertInfoCertificateHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation CertInfoCertificateHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CertInfoCertificateHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(CertInfoCertificateHeaderCellAccessibility *)self safeValueForKey:@"_titleLabel"];
  v4 = [(CertInfoCertificateHeaderCellAccessibility *)self safeValueForKey:@"_subtitleLabel"];
  v5 = [(CertInfoCertificateHeaderCellAccessibility *)self safeValueForKey:@"_trustedLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = [v4 textColor];
  v8 = [MEMORY[0x263F1C550] redColor];
  char v9 = [v7 isEqual:v8];

  v10 = [v3 accessibilityLabel];
  v11 = [v4 accessibilityLabel];
  if (v9)
  {
    v14 = accessibilityLocalizedString(@"expired");
    v12 = __UIAXStringForVariables();
  }
  else
  {
    v12 = __UIAXStringForVariables();
  }

  return v12;
}

@end