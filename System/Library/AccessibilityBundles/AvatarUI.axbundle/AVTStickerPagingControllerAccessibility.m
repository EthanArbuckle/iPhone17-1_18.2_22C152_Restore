@interface AVTStickerPagingControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
- (void)stickerSheetController:(id)a3 didInteractWithStickerItem:(id)a4 atIndex:(int64_t)a5 byPeeling:(BOOL)a6;
@end

@implementation AVTStickerPagingControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTStickerPagingController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTStickerPagingController", @"loadView", "v", 0);
  [v3 validateClass:@"AVTStickerPagingController" hasProperty:@"collectionView" withType:"@"];
  [v3 validateClass:@"AVTStickerPagingController" conformsToProtocol:@"AVTStickerSheetControllerDelegate"];
  [v3 validateProtocol:@"AVTStickerSheetControllerDelegate" hasMethod:@"stickerSheetController:didInteractWithStickerItem:atIndex:byPeeling:" isInstanceMethod:1 isRequired:1];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)AVTStickerPagingControllerAccessibility;
  [(AVTStickerPagingControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(AVTStickerPagingControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityContainerType:0];
  [v4 setAccessibilityShouldBypassCollectionViewAccessibility:1];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)AVTStickerPagingControllerAccessibility;
  [(AVTStickerPagingControllerAccessibility *)&v3 loadView];
  [(AVTStickerPagingControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)stickerSheetController:(id)a3 didInteractWithStickerItem:(id)a4 atIndex:(int64_t)a5 byPeeling:(BOOL)a6
{
  v8.receiver = self;
  v8.super_class = (Class)AVTStickerPagingControllerAccessibility;
  [(AVTStickerPagingControllerAccessibility *)&v8 stickerSheetController:a3 didInteractWithStickerItem:a4 atIndex:a5 byPeeling:a6];
  UIAccessibilityNotifications v6 = *MEMORY[0x263F1CDC8];
  v7 = accessibilityLocalizedString(@"announcement.selected.sticker");
  UIAccessibilityPostNotification(v6, v7);
}

@end