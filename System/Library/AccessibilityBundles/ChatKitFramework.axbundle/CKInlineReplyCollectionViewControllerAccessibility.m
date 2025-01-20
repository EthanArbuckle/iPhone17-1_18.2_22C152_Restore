@interface CKInlineReplyCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setCollectionViewCurrentFramesForNextLayout:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CKInlineReplyCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKInlineReplyCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKInlineReplyCollectionViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CKInlineReplyCollectionViewController" hasProperty:@"collectionView" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKInlineReplyCollectionViewController", @"setCollectionViewCurrentFramesForNextLayout:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CKInlineReplyCollectionViewControllerAccessibility;
  [(CKInlineReplyCollectionViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKInlineReplyCollectionViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = accessibilityLocalizedString(@"group.reply.collection");
  [v3 setAccessibilityLabel:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKInlineReplyCollectionViewControllerAccessibility;
  [(CKInlineReplyCollectionViewControllerAccessibility *)&v6 viewDidAppear:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE68];
  objc_super v5 = [(CKInlineReplyCollectionViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  UIAccessibilityPostNotification(v4, v5);
}

- (void)setCollectionViewCurrentFramesForNextLayout:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKInlineReplyCollectionViewControllerAccessibility;
  [(CKInlineReplyCollectionViewControllerAccessibility *)&v9 setCollectionViewCurrentFramesForNextLayout:v4];
  objc_opt_class();
  objc_super v5 = [(CKInlineReplyCollectionViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  objc_super v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 visibleCells];
  v8 = [v7 firstObject];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v8);
}

@end