@interface MTACountDownPickerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation MTACountDownPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTACountDownPicker";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MTACountDownPicker" isKindOfClass:@"UITextField"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTACountDownPicker", @"incrementValue", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTACountDownPicker", @"decrementValue", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTACountDownPicker", @"incrementValueContinuouslly", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTACountDownPicker", @"decrementValueContinuouslly", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTACountDownPicker", @"pressesEnded:withEvent:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTACountDownPicker", @"selectedField", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTACountDownPicker", @"duration", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTACountDownPicker", @"setSelectedField:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTACountDownPicker", @"hourHighlightFrame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTACountDownPicker", @"minuteHighlightFrame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTACountDownPicker", @"secondHighlightFrame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

@end