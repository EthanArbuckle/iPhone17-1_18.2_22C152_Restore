@interface AXContactsUIGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXContactsUIGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

uint64_t __49__AXContactsUIGlue_accessibilityInitializeBundle__block_invoke()
{
  v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_274 withPreValidationHandler:&__block_literal_global_296 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_302];

  v1 = (void *)MEMORY[0x263F22288];

  return [v1 performValidations];
}

uint64_t __49__AXContactsUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"CNAvatarViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"CNMonogrammer", @"descriptorForRequiredKeysIncludingImage:", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContact", @"givenName", "@", 0);

  return 1;
}

uint64_t __49__AXContactsUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AX ContactsUI"];
  [v2 setOverrideProcessName:@"AX ContactsUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __49__AXContactsUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"CNPropertySimpleCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPropertySimpleTransportCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPropertySimpleEditingCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNFaceTimeCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPropertyPhoneNumberCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPropertyNameCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPropertyPlaceholderCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPropertyPhoneNumberEditingCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPropertyNoteCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNTransportButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNAvatarViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ABPostalNameContactEditingCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPostalAddressEditorViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNContactListBannerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNContactHeaderDisplayViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPropertyLabelButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNContactActionSplitCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPickerItemCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNContactGridCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNQuickActionButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNActionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNMeCardSharingOnboardingAvatarCarouselViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNMeCardSharingOnboardingAvatarCarouselCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPhotoPickerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPhotoPickerCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNMeCardSharingSettingsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNContactHeaderEditViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPhotoPickerSectionHeaderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNContactPhotoViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNSharingProfilePhotoPickerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNSharingProfileAvatarItemProviderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPhotoPickerVariantListControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPhotoPickerMonogramProviderItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPhotoPickerAnimojiProviderItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPhotoPickerGlyphProviderItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPhotoPickerEmojiProviderItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNVisualIdentityPickerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNVisualIdentityItemEditorViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPhotoPickerHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITextFieldAccessibility__ContactsUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNVisualIdentityAvatarViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNGroupIdentityHeaderViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNUINavigationListViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNAvatarCardViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNUINavigationListViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPropertyRelatedNameCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPropertyPostalAddressEditingCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNVisualIdentityEditablePrimaryAvatarViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_UICollectionViewOutlineCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNContactGeminiViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNAccountsAndGroupsCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNContactListCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNContactListCollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNContactActionDropdownMenuCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UISwipeActionStandardButtonAccessibility__ContactsUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPropertyAddressingGrammarEditingCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNAvatarPosterPairCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPlatterBackBarButtonItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPropertyAddressingGrammarLabeledEditingCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNContactHeaderStaticDisplayViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNPhotoPickerListCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNMeCardSharingSettingsPreferenceMenuCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNCardSharedProfileCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNContactListSectionHeaderFooterViewAccessibility" canInteractWithTargetClass:1];
}

@end