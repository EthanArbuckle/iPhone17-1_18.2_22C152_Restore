@interface EKDayOccurrenceView_QSExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityQuickSpeakContent;
@end

@implementation EKDayOccurrenceView_QSExtras

+ (id)safeCategoryTargetClassName
{
  return @"EKDayOccurrenceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayOccurrenceView", @"occurrence", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEvent", @"title", "@", 0);
}

- (id)_accessibilityQuickSpeakContent
{
  v2 = [(EKDayOccurrenceView_QSExtras *)self safeValueForKey:@"occurrence"];
  id v3 = [v2 safeStringForKey:@"title"];

  return v3;
}

@end