@interface HKMedicalIDEditorMultilineStringCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (HKMedicalIDEditorMultilineStringCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityUpdateTextViewLabel;
- (void)setLabel:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setStringValue:(id)a3;
@end

@implementation HKMedicalIDEditorMultilineStringCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKMedicalIDEditorMultilineStringCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HKMedicalIDEditorMultilineStringCell" hasInstanceVariable:@"_labelLabel" withType:"UILabel"];
  [v3 validateClass:@"HKMedicalIDEditorMultilineStringCell" hasInstanceVariable:@"_placeholderLabel" withType:"UILabel"];
  [v3 validateClass:@"HKMedicalIDEditorMultilineStringCell" hasInstanceVariable:@"_textView" withType:"UITextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorMultilineStringCell", @"setLabel:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorMultilineStringCell", @"setPlaceholder:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorMultilineStringCell", @"setStringValue:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorMultilineStringCell", @"stringValue", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  return 0;
}

- (HKMedicalIDEditorMultilineStringCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HKMedicalIDEditorMultilineStringCellAccessibility;
  v4 = [(HKMedicalIDEditorMultilineStringCellAccessibility *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  [(HKMedicalIDEditorMultilineStringCellAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicalIDEditorMultilineStringCellAccessibility;
  [(HKMedicalIDEditorMultilineStringCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HKMedicalIDEditorMultilineStringCellAccessibility *)self safeValueForKey:@"_labelLabel"];
  [v3 setIsAccessibilityElement:0];

  v4 = [(HKMedicalIDEditorMultilineStringCellAccessibility *)self safeValueForKey:@"_placeholderLabel"];
  [v4 setIsAccessibilityElement:0];
}

- (void)setLabel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDEditorMultilineStringCellAccessibility;
  [(HKMedicalIDEditorMultilineStringCellAccessibility *)&v4 setLabel:a3];
  [(HKMedicalIDEditorMultilineStringCellAccessibility *)self _accessibilityUpdateTextViewLabel];
}

- (void)setPlaceholder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDEditorMultilineStringCellAccessibility;
  [(HKMedicalIDEditorMultilineStringCellAccessibility *)&v4 setPlaceholder:a3];
  [(HKMedicalIDEditorMultilineStringCellAccessibility *)self _accessibilityUpdateTextViewLabel];
}

- (void)setStringValue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDEditorMultilineStringCellAccessibility;
  [(HKMedicalIDEditorMultilineStringCellAccessibility *)&v4 setStringValue:a3];
  [(HKMedicalIDEditorMultilineStringCellAccessibility *)self _accessibilityUpdateTextViewLabel];
}

- (void)_accessibilityUpdateTextViewLabel
{
  id v3 = [(HKMedicalIDEditorMultilineStringCellAccessibility *)self safeValueForKeyPath:@"_placeholderLabel.isHidden"];
  if ([v3 BOOLValue])
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(HKMedicalIDEditorMultilineStringCellAccessibility *)self safeValueForKeyPath:@"_placeholderLabel.text"];
  }

  objc_super v4 = [(HKMedicalIDEditorMultilineStringCellAccessibility *)self safeValueForKeyPath:@"_labelLabel.text"];
  objc_super v5 = [(HKMedicalIDEditorMultilineStringCellAccessibility *)self safeValueForKey:@"_textView"];
  objc_super v6 = __UIAXStringForVariables();
  objc_msgSend(v5, "setAccessibilityLabel:", v6, v7, @"__AXStringForVariablesSentinel");
}

@end