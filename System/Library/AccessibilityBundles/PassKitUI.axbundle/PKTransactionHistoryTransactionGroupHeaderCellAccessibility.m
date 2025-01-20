@interface PKTransactionHistoryTransactionGroupHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (PKTransactionHistoryTransactionGroupHeaderCellAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PKTransactionHistoryTransactionGroupHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKTransactionHistoryTransactionGroupHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKTransactionHistoryTransactionGroupHeaderCell", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"PKTransactionHistoryTransactionGroupHeaderCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PKTransactionHistoryTransactionGroupHeaderCellAccessibility;
  [(PKTransactionHistoryTransactionGroupHeaderCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F1CEF8];
  v4 = [(PKTransactionHistoryTransactionGroupHeaderCellAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  [v4 setAccessibilityTraits:v3];
}

- (PKTransactionHistoryTransactionGroupHeaderCellAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKTransactionHistoryTransactionGroupHeaderCellAccessibility;
  uint64_t v3 = -[PKTransactionHistoryTransactionGroupHeaderCellAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PKTransactionHistoryTransactionGroupHeaderCellAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end