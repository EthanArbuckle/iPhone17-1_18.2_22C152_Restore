@interface CKTranscriptMessageCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityRetainsCustomRotorActionSetting;
- (id)_accessibilityCustomActionGroupIdentifier;
- (id)_accessibilitySupplementaryFooterViews;
- (void)setFailed:(BOOL)a3;
@end

@implementation CKTranscriptMessageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTranscriptMessageCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptMessageCell", @"setFailed:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptMessageCell", @"failureButton", "@", 0);
}

- (void)setFailed:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKTranscriptMessageCellAccessibility;
  [(CKTranscriptMessageCellAccessibility *)&v6 setFailed:a3];
  v4 = [(CKTranscriptMessageCellAccessibility *)self safeValueForKey:@"failureButton"];
  v5 = accessibilityLocalizedString(@"failure.button.text");
  [v4 setAccessibilityLabel:v5];
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  return 1;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)_accessibilitySupplementaryFooterViews
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(CKTranscriptMessageCellAccessibility *)self safeValueForKey:@"failureButton"];
  id v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end