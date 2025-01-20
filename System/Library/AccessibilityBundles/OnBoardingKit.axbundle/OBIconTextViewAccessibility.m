@interface OBIconTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (OBIconTextViewAccessibility)initWithIcon:(id)a3 iconSize:(CGSize)a4 text:(id)a5 dataDetectorTypes:(unint64_t)a6;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation OBIconTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBIconTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"OBIconTextView" hasInstanceVariable:@"_textView" withType:"UITextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBIconTextView", @"initWithIcon:iconSize:text:dataDetectorTypes:", "@", "{CGSize=dd}", "@", "Q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)OBIconTextViewAccessibility;
  [(OBIconTextViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(OBIconTextViewAccessibility *)self safeValueForKey:@"_textView"];
  [v3 _accessibilitySetTextViewShouldBreakUpParagraphs:1];
}

- (OBIconTextViewAccessibility)initWithIcon:(id)a3 iconSize:(CGSize)a4 text:(id)a5 dataDetectorTypes:(unint64_t)a6
{
  v8.receiver = self;
  v8.super_class = (Class)OBIconTextViewAccessibility;
  v6 = -[OBIconTextViewAccessibility initWithIcon:iconSize:text:dataDetectorTypes:](&v8, sel_initWithIcon_iconSize_text_dataDetectorTypes_, a3, a5, a6, a4.width, a4.height);
  [(OBIconTextViewAccessibility *)v6 _accessibilityLoadAccessibilityInformation];

  return v6;
}

@end