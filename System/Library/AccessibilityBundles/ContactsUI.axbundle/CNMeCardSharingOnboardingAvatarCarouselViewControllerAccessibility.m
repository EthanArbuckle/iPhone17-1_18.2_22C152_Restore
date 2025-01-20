@interface CNMeCardSharingOnboardingAvatarCarouselViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
@end

@implementation CNMeCardSharingOnboardingAvatarCarouselViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNMeCardSharingOnboardingAvatarCarouselViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNMeCardSharingOnboardingAvatarCarouselViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CNMeCardSharingOnboardingAvatarCarouselViewController" conformsToProtocol:@"UICollectionViewDataSource"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNMeCardSharingOnboardingAvatarCarouselViewController", @"items", "@", 0);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselViewControllerAccessibility;
  v8 = [(CNMeCardSharingOnboardingAvatarCarouselViewControllerAccessibility *)&v13 collectionView:v6 cellForItemAtIndexPath:v7];
  objc_opt_class();
  v9 = __UIAccessibilityCastAsSafeCategory();
  if (v9)
  {
    v10 = [(CNMeCardSharingOnboardingAvatarCarouselViewControllerAccessibility *)self safeArrayForKey:@"items"];
    v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    [v9 _axSetCarouselItem:v11];
  }

  return v8;
}

@end