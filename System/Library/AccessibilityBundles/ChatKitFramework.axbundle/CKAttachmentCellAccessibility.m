@interface CKAttachmentCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CKAttachmentCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAttachmentCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CKAttachmentCellAccessibility *)self safeValueForKey:@"representedObject"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end