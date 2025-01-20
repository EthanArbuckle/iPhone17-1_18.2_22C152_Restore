@interface CKBalloonTextView_QSExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityQuickSpeakContent;
@end

@implementation CKBalloonTextView_QSExtras

+ (id)safeCategoryTargetClassName
{
  return @"CKBalloonTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"text", "@", 0);
  [v3 validateClass:@"CKBalloonTextView" isKindOfClass:@"UITextView"];
}

- (id)_accessibilityQuickSpeakContent
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 text];

  return v3;
}

@end