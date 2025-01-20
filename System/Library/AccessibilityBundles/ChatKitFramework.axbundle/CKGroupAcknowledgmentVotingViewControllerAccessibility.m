@interface CKGroupAcknowledgmentVotingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collapseButton;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (void)_animateToLayout:(unint64_t)a3 aroundSection:(int64_t)a4;
- (void)acknowledgmentVotingViewAnimatorDidFinishAnimation:(id)a3;
- (void)viewDidLoad;
@end

@implementation CKGroupAcknowledgmentVotingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKGroupAcknowledgmentVotingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKGroupAcknowledgmentVotingViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKGroupAcknowledgmentVotingViewController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKGroupAcknowledgmentVotingViewController", @"tallies", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKGroupAcknowledgmentVotingViewController", @"collapseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKGroupAcknowledgmentVotingViewController", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKGroupAcknowledgmentVotingViewController", @"collectionView:viewForSupplementaryElementOfKind:atIndexPath:", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKGroupAcknowledgmentVotingViewController", @"_animateToLayout:aroundSection:", "v", "Q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKGroupAcknowledgmentVotingViewController", @"acknowledgmentVotingViewAnimatorDidFinishAnimation:", "v", "@", 0);
  [v3 validateClass:@"CKAvatarContactNameCollectionReusableView"];
  [v3 validateClass:@"CKAcknowledgmentIconCollectionReusableView"];
  [v3 validateClass:@"CKAcknowledgmentVoteCountCollectionReusableView"];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CKGroupAcknowledgmentVotingViewControllerAccessibility;
  [(CKGroupAcknowledgmentVotingViewControllerAccessibility *)&v5 viewDidLoad];
  id v3 = [(CKGroupAcknowledgmentVotingViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = accessibilityLocalizedString(@"collection.acknowledgments.label");
  [v3 setAccessibilityLabel:v4];
}

- (id)collapseButton
{
  v5.receiver = self;
  v5.super_class = (Class)CKGroupAcknowledgmentVotingViewControllerAccessibility;
  v2 = [(CKGroupAcknowledgmentVotingViewControllerAccessibility *)&v5 collapseButton];
  id v3 = accessibilityLocalizedString(@"acknowledgment.collapse.button");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKGroupAcknowledgmentVotingViewControllerAccessibility;
  v8 = [(CKGroupAcknowledgmentVotingViewControllerAccessibility *)&v13 collectionView:v6 cellForItemAtIndexPath:v7];
  [v8 setIsAccessibilityElement:1];
  objc_opt_class();
  v9 = [(CKGroupAcknowledgmentVotingViewControllerAccessibility *)self safeValueForKey:@"tallies"];
  v10 = __UIAccessibilityCastAsClass();

  v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "section"));
  [v8 _accessibilitySetAssignedValue:v11 forKey:@"AXTapbackTally"];
  objc_msgSend(v8, "_accessibilitySetIntegerValue:forKey:", objc_msgSend(v7, "item"), @"AXTapbackContactIndex");

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)CKGroupAcknowledgmentVotingViewControllerAccessibility;
  objc_super v5 = [(CKGroupAcknowledgmentVotingViewControllerAccessibility *)&v7 collectionView:a3 viewForSupplementaryElementOfKind:a4 atIndexPath:a5];
  [v5 setIsAccessibilityElement:0];
  [v5 setAccessibilityElementsHidden:1];

  return v5;
}

- (void)_animateToLayout:(unint64_t)a3 aroundSection:(int64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CKGroupAcknowledgmentVotingViewControllerAccessibility;
  -[CKGroupAcknowledgmentVotingViewControllerAccessibility _animateToLayout:aroundSection:](&v12, sel__animateToLayout_aroundSection_);
  objc_opt_class();
  objc_super v7 = [(CKGroupAcknowledgmentVotingViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v8 = __UIAccessibilityCastAsClass();

  if (a3 == 1) {
    int64_t v9 = 0;
  }
  else {
    int64_t v9 = a4;
  }
  v10 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v9];
  v11 = [v8 cellForItemAtIndexPath:v10];
  if (v11) {
    [v8 scrollToItemAtIndexPath:v10 atScrollPosition:16 animated:0];
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v11);
}

- (void)acknowledgmentVotingViewAnimatorDidFinishAnimation:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKGroupAcknowledgmentVotingViewControllerAccessibility;
  [(CKGroupAcknowledgmentVotingViewControllerAccessibility *)&v3 acknowledgmentVotingViewAnimatorDidFinishAnimation:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end