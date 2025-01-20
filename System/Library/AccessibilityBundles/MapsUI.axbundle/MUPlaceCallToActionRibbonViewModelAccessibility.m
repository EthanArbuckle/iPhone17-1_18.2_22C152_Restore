@interface MUPlaceCallToActionRibbonViewModelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (MUPlaceCallToActionRibbonViewModelAccessibility)initWithSubmissionStatus:(id)a3;
- (void)setSubmissionStatus:(id)a3;
@end

@implementation MUPlaceCallToActionRibbonViewModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUPlaceCallToActionRibbonViewModel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPlaceCallToActionRibbonViewModel", @"initWithSubmissionStatus:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPlaceCallToActionRibbonViewModel", @"setSubmissionStatus:", "v", "@", 0);
}

- (MUPlaceCallToActionRibbonViewModelAccessibility)initWithSubmissionStatus:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceCallToActionRibbonViewModelAccessibility;
  id v3 = a3;
  v4 = [(MUPlaceCallToActionRibbonViewModelAccessibility *)&v9 initWithSubmissionStatus:v3];
  v5 = objc_msgSend(NSNumber, "numberWithInt:", 7, v9.receiver, v9.super_class);
  [(MUPlaceCallToActionRibbonViewModelAccessibility *)v4 _accessibilitySetRetainedValue:v5 forKey:@"RibbonItemViewTypeKey"];

  uint64_t v6 = [v3 ratingState];
  v7 = [NSNumber numberWithInteger:v6];
  [(MUPlaceCallToActionRibbonViewModelAccessibility *)v4 _accessibilitySetRetainedValue:v7 forKey:@"RibbonItemViewRatingStateKey"];

  return v4;
}

- (void)setSubmissionStatus:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MUPlaceCallToActionRibbonViewModelAccessibility;
  id v4 = a3;
  [(MUPlaceCallToActionRibbonViewModelAccessibility *)&v7 setSubmissionStatus:v4];
  uint64_t v5 = objc_msgSend(v4, "ratingState", v7.receiver, v7.super_class);

  uint64_t v6 = [NSNumber numberWithInteger:v5];
  [(MUPlaceCallToActionRibbonViewModelAccessibility *)self _accessibilitySetRetainedValue:v6 forKey:@"RibbonItemViewRatingStateKey"];
}

@end