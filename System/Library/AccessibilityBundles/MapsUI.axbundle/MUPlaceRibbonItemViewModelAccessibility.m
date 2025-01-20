@interface MUPlaceRibbonItemViewModelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)amenityItemViewForMapItem:(id)a3 amenityItemConfiguration:(id)a4;
+ (id)costItemViewForMapItem:(id)a3;
+ (id)factoidItemForFactoid:(id)a3;
+ (id)guidesItemViewModelForMapItem:(id)a3;
+ (id)hoursItemViewModelForMapItem:(id)a3;
+ (id)ratingSubmissionStatusViewModelForRatingState:(int64_t)a3;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation MUPlaceRibbonItemViewModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUPlaceRibbonItemViewModel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"MUPlaceRibbonItemViewModel", @"hoursItemViewModelForMapItem:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"MUPlaceRibbonItemViewModel", @"amenityItemViewForMapItem:amenityItemConfiguration:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"MUPlaceRibbonItemViewModel", @"costItemViewForMapItem:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"MUPlaceRibbonItemViewModel", @"factoidItemForFactoid:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"MUPlaceRibbonItemViewModel", @"guidesItemViewModelForMapItem:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"MUPlaceRibbonItemViewModel", @"ratingSubmissionStatusViewModelForRatingState:", "@", "q", 0);
}

+ (id)hoursItemViewModelForMapItem:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MUPlaceRibbonItemViewModelAccessibility;
  id v3 = objc_msgSendSuper2(&v6, sel_hoursItemViewModelForMapItem_, a3);
  v4 = [NSNumber numberWithInt:1];
  [v3 _accessibilitySetRetainedValue:v4 forKey:@"RibbonItemViewTypeKey"];

  return v3;
}

+ (id)amenityItemViewForMapItem:(id)a3 amenityItemConfiguration:(id)a4
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MUPlaceRibbonItemViewModelAccessibility;
  v4 = objc_msgSendSuper2(&v7, sel_amenityItemViewForMapItem_amenityItemConfiguration_, a3, a4);
  v5 = [NSNumber numberWithInt:3];
  [v4 _accessibilitySetRetainedValue:v5 forKey:@"RibbonItemViewTypeKey"];

  return v4;
}

+ (id)costItemViewForMapItem:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MUPlaceRibbonItemViewModelAccessibility;
  id v3 = objc_msgSendSuper2(&v6, sel_costItemViewForMapItem_, a3);
  v4 = [NSNumber numberWithInt:4];
  [v3 _accessibilitySetRetainedValue:v4 forKey:@"RibbonItemViewTypeKey"];

  return v3;
}

+ (id)factoidItemForFactoid:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MUPlaceRibbonItemViewModelAccessibility;
  id v3 = objc_msgSendSuper2(&v6, sel_factoidItemForFactoid_, a3);
  v4 = [NSNumber numberWithInt:6];
  [v3 _accessibilitySetRetainedValue:v4 forKey:@"RibbonItemViewTypeKey"];

  return v3;
}

+ (id)guidesItemViewModelForMapItem:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MUPlaceRibbonItemViewModelAccessibility;
  id v3 = objc_msgSendSuper2(&v6, sel_guidesItemViewModelForMapItem_, a3);
  v4 = [NSNumber numberWithInt:5];
  [v3 _accessibilitySetRetainedValue:v4 forKey:@"RibbonItemViewTypeKey"];

  return v3;
}

+ (id)ratingSubmissionStatusViewModelForRatingState:(int64_t)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MUPlaceRibbonItemViewModelAccessibility;
  id v3 = objc_msgSendSuper2(&v6, sel_ratingSubmissionStatusViewModelForRatingState_, a3);
  v4 = [NSNumber numberWithInt:7];
  [v3 _accessibilitySetRetainedValue:v4 forKey:@"RibbonItemViewTypeKey"];

  return v3;
}

@end