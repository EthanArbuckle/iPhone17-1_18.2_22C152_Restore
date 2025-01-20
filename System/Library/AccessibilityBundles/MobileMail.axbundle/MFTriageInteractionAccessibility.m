@interface MFTriageInteractionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)swipeActionWithPreparation:(id)a3 completion:(id)a4;
@end

@implementation MFTriageInteractionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFTriageInteraction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFTriageInteraction", @"swipeActionWithPreparation:completion:", "@", "@?", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFTriageInteraction", @"title", "@", 0);
}

- (id)swipeActionWithPreparation:(id)a3 completion:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MFTriageInteractionAccessibility;
  v5 = [(MFTriageInteractionAccessibility *)&v8 swipeActionWithPreparation:a3 completion:a4];
  v6 = [(MFTriageInteractionAccessibility *)self safeStringForKey:@"title"];
  [v5 setAccessibilityLabel:v6];

  return v5;
}

@end