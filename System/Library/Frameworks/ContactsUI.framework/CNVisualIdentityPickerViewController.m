@interface CNVisualIdentityPickerViewController
+ (BOOL)canShowAvatarEditor;
+ (BOOL)canShowPhotoPickerForView:(id)a3 withTraitCollection:(id)a4;
+ (CGSize)defaultContentSize;
+ (CGSize)defaultItemSize;
+ (double)itemsPerRowForWidth:(double)a3;
+ (id)descriptorForRequiredKeys;
+ (id)imagePickerForContact:(id)a3;
+ (id)imagePickerForGroupIdentity:(id)a3;
+ (id)imagePickerForVisualIdentity:(id)a3;
+ (id)log;
+ (id)makeDescriptorForRequiredKeys;
+ (id)navigationControllerForPicker:(id)a3;
- (BOOL)allowRotation;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)hasPendingChanges;
- (BOOL)isEditingOrDuplicatingItem;
- (BOOL)isModalInPresentation;
- (BOOL)isPresentingModalViewController;
- (BOOL)shouldUpdateEmojiSuggestions;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CNAvatarEditingManager)avatarEditingManager;
- (CNContactStyle)contactStyle;
- (CNPhotoPickerActionsViewController)actionsViewController;
- (CNPhotoPickerDataSource)dataSource;
- (CNPhotoPickerHeaderView)headerView;
- (CNPhotoPickerProviderItem)duplicatingProviderItem;
- (CNPhotoPickerProviderItem)editingProviderItem;
- (CNPhotoPickerProviderItem)lastSelectedProviderItem;
- (CNVisualIdentity)pendingVisualIdentity;
- (CNVisualIdentityEditablePrimaryAvatarViewController)editablePrimaryAvatarController;
- (CNVisualIdentityImagePickerController)imagePickerController;
- (CNVisualIdentityPickerPresenterDelegate)presenterDelegate;
- (CNVisualIdentityPickerViewController)initWithPhotosDataSource:(id)a3 style:(id)a4 allowRotation:(BOOL)a5;
- (CNVisualIdentityPickerViewControllerDelegate)delegate;
- (NSArray)pendingInjectedSuggestionItems;
- (NSData)proposedImageData;
- (NSString)assignActionTitleOverride;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionViewPaddingForCatalyst;
- (double)textFieldFontSize;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)contactImageForCurrentActiveItem;
- (id)insertNewItem:(id)a3 toGroupType:(int64_t)a4 updateActive:(BOOL)a5;
- (id)insertNewItem:(id)a3 toGroupType:(int64_t)a4 updateActive:(BOOL)a5 scrollToItem:(BOOL)a6;
- (id)photoPickerNavigationControllerForRootController:(id)a3;
- (id)visualIdentity;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)defaultModalPresentationStyle;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4;
- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4;
- (void)avatarEditorViewControllerDidCancel:(id)a3;
- (void)buildCollectionView;
- (void)buildHeaderView;
- (void)cancel:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)deleteExistingItem:(id)a3;
- (void)deleteItemFromRecentsImageStore:(id)a3;
- (void)didCancelEditingProviderItemFromViewController:(id)a3;
- (void)didSelectSuggestionsAddItemAtIndexPath:(id)a3;
- (void)done:(id)a3;
- (void)editableAvatarViewController:(id)a3 didUpdateWithProviderItem:(id)a4;
- (void)headerActionPressedAtIndexPath:(id)a3;
- (void)imagePickerController:(id)a3 didFinishWithProviderItem:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)initializeHeaderView;
- (void)insertNewItemIntoSuggestions:(id)a3;
- (void)photoPickerActionsViewController:(id)a3 didPerformAction:(int64_t)a4 withProviderItem:(id)a5 atIndexPath:(id)a6;
- (void)photoPickerActionsViewControllerDidFinish:(id)a3;
- (void)photoPickerHeaderView:(id)a3 didUpdateIdentityNameTextField:(id)a4 withText:(id)a5;
- (void)photoPickerHeaderViewDidReceiveDroppedImageData:(id)a3;
- (void)photoPickerHeaderViewDidTapClearAvatarImageButton:(id)a3;
- (void)photoPickerProviderGroup:(id)a3 didUpdateItem:(id)a4;
- (void)photoPickerProviderGroupDidUpdate:(id)a3 requiresFullReload:(BOOL)a4;
- (void)presentActionsViewControllerForProviderItem:(id)a3 atIndexPath:(id)a4;
- (void)presentCameraImagePicker;
- (void)presentDismissConfirmation;
- (void)presentEditItemViewController:(id)a3 fromViewController:(id)a4;
- (void)presentEmojiEditor;
- (void)presentLibraryImagePickerForIndexPath:(id)a3;
- (void)presentMonogramEditorFromIndexPath:(id)a3;
- (void)presentVisualIdentityItemEditorForItem:(id)a3 fromViewController:(id)a4;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)reloadItemsForUpdatedSuggestionsGroup:(id)a3 atSectionIndex:(int64_t)a4;
- (void)saveItemToRecentsImageStore:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)selectItem:(id)a3 presentFromViewControllerIfNeeded:(id)a4;
- (void)sender:(id)a3 dismissViewController:(id)a4;
- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (void)sender:(id)a3 presentViewController:(id)a4;
- (void)setActionsViewController:(id)a3;
- (void)setAllowRotation:(BOOL)a3;
- (void)setAssignActionTitleOverride:(id)a3;
- (void)setAvatarEditingManager:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContactStyle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDuplicatingProviderItem:(id)a3;
- (void)setEditablePrimaryAvatarController:(id)a3;
- (void)setEditingProviderItem:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setImagePickerController:(id)a3;
- (void)setLastSelectedProviderItem:(id)a3;
- (void)setPendingInjectedSuggestionItems:(id)a3;
- (void)setPendingVisualIdentity:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setProposedImageData:(id)a3;
- (void)setShouldUpdateEmojiSuggestions:(BOOL)a3;
- (void)setSuggestionsProviderItemAsActiveItem:(id)a3;
- (void)showAvatarCropAndScaleForItem:(id)a3 fromViewController:(id)a4;
- (void)showAvatarEditorForCreation;
- (void)showAvatarPosePickerFromItem:(id)a3 atIndexPath:(id)a4;
- (void)updateActiveIndexPath:(id)a3;
- (void)updateActiveIndexPath:(id)a3 reload:(BOOL)a4;
- (void)updateActiveIndexPathForUpdatedSuggestionsGroup:(id)a3 atSectionIndex:(int64_t)a4;
- (void)updateDoneButtonEnabledState;
- (void)updateDoneButtonEnabledStateForEditingProviderItem:(id)a3;
- (void)updateEmojiSuggestionsForUpdatedVisualIdentity:(id)a3 locale:(id)a4;
- (void)updateForSelectedProviderItem:(id)a3;
- (void)updateHeaderViewAvatar;
- (void)updateInjectedItemsSectionForProviderItem:(id)a3;
- (void)updateMonogramsForUpdatedVisualIdentity:(id)a3;
- (void)updateVisualIdentityWithName:(id)a3 locale:(id)a4;
- (void)updateVisualIdentityWithProposedImageData:(id)a3;
- (void)updateVisualIdentityWithProviderItem:(id)a3;
- (void)viewController:(id)a3 didSelectUpdatedProviderItem:(id)a4;
- (void)viewController:(id)a3 didSelectUpdatedProviderItem:(id)a4 completionHandler:(id)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNVisualIdentityPickerViewController

void __65__CNVisualIdentityPickerViewController_descriptorForRequiredKeys__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) makeDescriptorForRequiredKeys];
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_21;
  descriptorForRequiredKeys_cn_once_object_21 = v1;
}

+ (id)makeDescriptorForRequiredKeys
{
  v15[14] = *MEMORY[0x1E4F143B8];
  v2 = +[CNMonogrammer descriptorForRequiredKeysIncludingImage:1];
  v15[0] = v2;
  v3 = [MEMORY[0x1E4F5A6C0] descriptorForRequiredKeys];
  uint64_t v4 = *MEMORY[0x1E4F1AE08];
  v15[1] = v3;
  v15[2] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AE28];
  v15[3] = *MEMORY[0x1E4F1AE88];
  v15[4] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1AE20];
  v15[5] = *MEMORY[0x1E4F1AF98];
  v15[6] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1ADA8];
  v15[7] = *MEMORY[0x1E4F1AFA8];
  v15[8] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1AE48];
  v15[9] = *MEMORY[0x1E4F1ADE8];
  v15[10] = v8;
  uint64_t v9 = *MEMORY[0x1E4F1AE98];
  v15[11] = *MEMORY[0x1E4F1AE30];
  v15[12] = v9;
  v15[13] = *MEMORY[0x1E4F1AFB8];
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:14];

  v11 = (void *)MEMORY[0x1E4F1B8F8];
  v12 = [NSString stringWithUTF8String:"+[CNVisualIdentityPickerViewController makeDescriptorForRequiredKeys]"];
  v13 = [v11 descriptorWithKeyDescriptors:v10 description:v12];

  return v13;
}

+ (id)descriptorForRequiredKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CNVisualIdentityPickerViewController_descriptorForRequiredKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (descriptorForRequiredKeys_cn_once_token_21 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_21, block);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_21;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedImageData, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_pendingVisualIdentity, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_imagePickerController, 0);
  objc_storeStrong((id *)&self->_pendingInjectedSuggestionItems, 0);
  objc_storeStrong((id *)&self->_contactStyle, 0);
  objc_storeStrong((id *)&self->_editablePrimaryAvatarController, 0);
  objc_storeStrong((id *)&self->_actionsViewController, 0);
  objc_storeStrong((id *)&self->_avatarEditingManager, 0);
  objc_storeStrong((id *)&self->_duplicatingProviderItem, 0);
  objc_storeStrong((id *)&self->_editingProviderItem, 0);
  objc_storeStrong((id *)&self->_lastSelectedProviderItem, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_assignActionTitleOverride, 0);
  objc_destroyWeak((id *)&self->_presenterDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setProposedImageData:(id)a3
{
}

- (NSData)proposedImageData
{
  return self->_proposedImageData;
}

- (CNPhotoPickerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setPendingVisualIdentity:(id)a3
{
}

- (void)setHeaderView:(id)a3
{
}

- (CNPhotoPickerHeaderView)headerView
{
  return self->_headerView;
}

- (void)setImagePickerController:(id)a3
{
}

- (CNVisualIdentityImagePickerController)imagePickerController
{
  return self->_imagePickerController;
}

- (void)setPendingInjectedSuggestionItems:(id)a3
{
}

- (NSArray)pendingInjectedSuggestionItems
{
  return self->_pendingInjectedSuggestionItems;
}

- (void)setShouldUpdateEmojiSuggestions:(BOOL)a3
{
  self->_shouldUpdateEmojiSuggestions = a3;
}

- (BOOL)shouldUpdateEmojiSuggestions
{
  return self->_shouldUpdateEmojiSuggestions;
}

- (void)setAllowRotation:(BOOL)a3
{
  self->_allowRotation = a3;
}

- (BOOL)allowRotation
{
  return self->_allowRotation;
}

- (void)setContactStyle:(id)a3
{
}

- (CNContactStyle)contactStyle
{
  return self->_contactStyle;
}

- (void)setEditablePrimaryAvatarController:(id)a3
{
}

- (CNVisualIdentityEditablePrimaryAvatarViewController)editablePrimaryAvatarController
{
  return self->_editablePrimaryAvatarController;
}

- (void)setActionsViewController:(id)a3
{
}

- (CNPhotoPickerActionsViewController)actionsViewController
{
  return self->_actionsViewController;
}

- (void)setAvatarEditingManager:(id)a3
{
}

- (CNAvatarEditingManager)avatarEditingManager
{
  return self->_avatarEditingManager;
}

- (void)setDuplicatingProviderItem:(id)a3
{
}

- (CNPhotoPickerProviderItem)duplicatingProviderItem
{
  return self->_duplicatingProviderItem;
}

- (void)setEditingProviderItem:(id)a3
{
}

- (CNPhotoPickerProviderItem)editingProviderItem
{
  return self->_editingProviderItem;
}

- (void)setLastSelectedProviderItem:(id)a3
{
}

- (CNPhotoPickerProviderItem)lastSelectedProviderItem
{
  return self->_lastSelectedProviderItem;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setAssignActionTitleOverride:(id)a3
{
}

- (NSString)assignActionTitleOverride
{
  return self->_assignActionTitleOverride;
}

- (CNVisualIdentityPickerPresenterDelegate)presenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);

  return (CNVisualIdentityPickerPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CNVisualIdentityPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNVisualIdentityPickerViewControllerDelegate *)WeakRetained;
}

- (void)viewController:(id)a3 didSelectUpdatedProviderItem:(id)a4
{
}

- (void)viewController:(id)a3 didSelectUpdatedProviderItem:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(CNVisualIdentityPickerViewController *)self updateForSelectedProviderItem:a4];
  v18 = (CNVisualIdentityPickerViewController *)v8;
  v10 = [(CNVisualIdentityPickerViewController *)self presentedViewController];
  if (v10)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  v12 = [(CNVisualIdentityPickerViewController *)self presentedViewController];
  v13 = [(CNVisualIdentityPickerViewController *)v18 presentingViewController];

  if (v12 == v13 || (v14 = v18, (isKindOfClass & 1) != 0))
  {
    v14 = self;

    objc_opt_class();
    v15 = [(CNVisualIdentityPickerViewController *)v14 presentedViewController];
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    if (v17) {
      [v17 endDisablingAutorotationIfNeeded];
    }
  }
  [(CNVisualIdentityPickerViewController *)self sender:0 dismissViewController:v14 completionHandler:v9];
}

- (void)updateForSelectedProviderItem:(id)a3
{
  id v19 = a3;
  uint64_t v4 = [(CNVisualIdentityPickerViewController *)self visualIdentity];
  uint64_t v5 = [v4 identityType];

  if (!v5)
  {
    objc_opt_class();
    id v6 = v19;
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    int v9 = [v8 isGrayMonogramItem];
    v10 = [v8 monogramText];
    v11 = [(CNVisualIdentityPickerViewController *)self visualIdentity];
    v12 = [v11 abbreviatedName];
    char v13 = [v10 isEqualToString:v12];

    if (v9 && (v13 & 1) != 0)
    {
      [(CNVisualIdentityPickerViewController *)self updateVisualIdentityWithProviderItem:0];
      [(CNVisualIdentityPickerViewController *)self updateActiveIndexPath:0];
      goto LABEL_14;
    }
  }
  [(CNVisualIdentityPickerViewController *)self updateVisualIdentityWithProviderItem:v19];
  if ([(CNVisualIdentityPickerViewController *)self isEditingOrDuplicatingItem])
  {
    v14 = [(CNVisualIdentityPickerViewController *)self editingProviderItem];

    if (v14)
    {
      v15 = [(CNVisualIdentityPickerViewController *)self editingProviderItem];
      [(CNVisualIdentityPickerViewController *)self deleteExistingItem:v15];

      v16 = [(CNVisualIdentityPickerViewController *)self editingProviderItem];
      [(CNVisualIdentityPickerViewController *)self deleteItemFromRecentsImageStore:v16];

      [(CNVisualIdentityPickerViewController *)self setEditingProviderItem:0];
    }
    else
    {
      id v17 = [(CNVisualIdentityPickerViewController *)self duplicatingProviderItem];
      [(CNVisualIdentityPickerViewController *)self deleteExistingItem:v17];

      [(CNVisualIdentityPickerViewController *)self setDuplicatingProviderItem:0];
    }
  }
  id v18 = [(CNVisualIdentityPickerViewController *)self insertNewItem:v19 toGroupType:1 updateActive:1];
  [(CNVisualIdentityPickerViewController *)self saveItemToRecentsImageStore:v19];
  id v8 = [(CNVisualIdentityPickerViewController *)self actionsViewController];
  [v8 updateActionsModelWithProviderItem:v19];
LABEL_14:
}

- (void)didCancelEditingProviderItemFromViewController:(id)a3
{
  [(CNVisualIdentityPickerViewController *)self sender:0 dismissViewController:a3];

  [(CNVisualIdentityPickerViewController *)self setEditingProviderItem:0];
}

- (void)presentEditItemViewController:(id)a3 fromViewController:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  uint64_t v7 = [(CNVisualIdentityPickerViewController *)self photoPickerNavigationControllerForRootController:v6];
  [v7 setModalPresentationStyle:-2];
  uint64_t v8 = [(CNVisualIdentityPickerViewController *)self contactStyle];
  objc_msgSend(v7, "setModalTransitionStyle:", objc_msgSend((id)v8, "modalTransitionStyle"));

  [(CNVisualIdentityPickerViewController *)self preferredContentSize];
  objc_msgSend(v6, "setPreferredContentSize:");

  int v9 = [(CNVisualIdentityPickerViewController *)self presenterDelegate];
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    v10 = [(CNVisualIdentityPickerViewController *)self presenterDelegate];
    [v10 visualIdentityPicker:self presentViewController:v7];
  }
  else
  {
    [v11 presentViewController:v7 animated:1 completion:0];
  }
}

- (void)editableAvatarViewController:(id)a3 didUpdateWithProviderItem:(id)a4
{
  id v23 = a4;
  uint64_t v5 = [v23 imageData];
  id v6 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  uint64_t v7 = [v6 imageData];
  if (v5 != v7)
  {

LABEL_4:
    v22 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
    if (v23) {
      [v23 updateVisualIdentity:v22];
    }
    else {
      [v22 clearImage];
    }

    [(CNVisualIdentityPickerViewController *)self updateInjectedItemsSectionForProviderItem:v23];
    [(CNVisualIdentityPickerViewController *)self updateDoneButtonEnabledStateForEditingProviderItem:v23];
    goto LABEL_8;
  }
  [v23 cropRect];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  [v16 cropRect];
  v26.origin.x = v17;
  v26.origin.y = v18;
  v26.size.width = v19;
  v26.size.height = v20;
  v25.origin.x = v9;
  v25.origin.y = v11;
  v25.size.width = v13;
  v25.size.height = v15;
  BOOL v21 = CGRectEqualToRect(v25, v26);

  if (!v21) {
    goto LABEL_4;
  }
LABEL_8:
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(CNVisualIdentityPickerViewController *)self headerView];
  [v3 resignFirstResponder];
}

- (void)saveItemToRecentsImageStore:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CNVisualIdentityPickerViewController *)self visualIdentity];
  id v6 = [v5 identifier];

  if (v6)
  {
    uint64_t v7 = [v4 contactImageForMetadataStore];
    double v8 = [v7 imageData];
    if (v8)
    {
    }
    else
    {
      CGFloat v9 = [v7 variant];

      if (!v9)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1B930]);
    CGFloat v11 = (void *)MEMORY[0x1E4F1B928];
    double v12 = [(CNVisualIdentityPickerViewController *)self visualIdentity];
    CGFloat v13 = [v12 identifier];
    double v14 = [v11 saveRequestToCreateImage:v7 forContactIdentifier:v13];

    id v19 = 0;
    [v10 performSaveRequest:v14 error:&v19];
    id v15 = v19;
    if (v15)
    {
      v16 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        CGFloat v17 = [(CNVisualIdentityPickerViewController *)self visualIdentity];
        CGFloat v18 = [v17 identifier];
        *(_DWORD *)buf = 138412290;
        BOOL v21 = v18;
        _os_log_impl(&dword_18B625000, v16, OS_LOG_TYPE_INFO, "Failed to save item to recent image store for contact identifier <%@>", buf, 0xCu);
      }
    }
    else
    {
      v16 = [v7 identifier];
      [v4 setRecentsIdentifier:v16];
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (void)deleteItemFromRecentsImageStore:(id)a3
{
  id v3 = a3;
  id v4 = [v3 recentsIdentifier];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1B930]);
    id v6 = (void *)MEMORY[0x1E4F1B928];
    uint64_t v7 = [v3 recentsIdentifier];
    double v8 = [v6 saveRequestToDeleteImageForIdentifier:v7];

    uint64_t v9 = 0;
    [v5 performSaveRequest:v8 error:&v9];
  }
}

- (void)presentDismissConfirmation
{
  if ([(CNVisualIdentityPickerViewController *)self hasPendingChanges])
  {
    id v3 = (void *)MEMORY[0x1E4FB1418];
    id v4 = CNContactsUIBundle();
    id v5 = [v4 localizedStringForKey:@"PHOTO_EDITING_DISCARD_CONFIRMATION_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    id v6 = [v3 alertControllerWithTitle:v5 message:0 preferredStyle:0];

    uint64_t v7 = (void *)MEMORY[0x1E4FB1410];
    double v8 = CNContactsUIBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"PHOTO_EDITING_DISCARD_CONFIRM" value:&stru_1ED8AC728 table:@"Localized"];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __66__CNVisualIdentityPickerViewController_presentDismissConfirmation__block_invoke;
    v18[3] = &unk_1E549B590;
    v18[4] = self;
    id v10 = [v7 actionWithTitle:v9 style:2 handler:v18];
    [v6 addAction:v10];

    CGFloat v11 = (void *)MEMORY[0x1E4FB1410];
    double v12 = CNContactsUIBundle();
    CGFloat v13 = [v12 localizedStringForKey:@"PHOTO_EDITING_DISCARD_CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
    double v14 = [v11 actionWithTitle:v13 style:1 handler:0];
    [v6 addAction:v14];

    id v15 = [(CNVisualIdentityPickerViewController *)self navigationItem];
    v16 = [v15 leftBarButtonItem];
    CGFloat v17 = [v6 popoverPresentationController];
    [v17 setBarButtonItem:v16];

    [(CNVisualIdentityPickerViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    [(CNVisualIdentityPickerViewController *)self cancel:0];
  }
}

uint64_t __66__CNVisualIdentityPickerViewController_presentDismissConfirmation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel:0];
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  id v5 = [(CNVisualIdentityPickerViewController *)self presenterDelegate];
  [v5 visualIdentityPicker:self presentationControllerWillDismiss:v4];
}

- (BOOL)isModalInPresentation
{
  v2 = [(CNVisualIdentityPickerViewController *)self navigationItem];
  id v3 = [v2 rightBarButtonItem];
  char v4 = [v3 isEnabled];

  return v4;
}

- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = +[CNPhotoPickerAnimojiProvider providerItemForAvatarRecord:v7];
  uint64_t v9 = [(CNVisualIdentityPickerViewController *)self insertNewItem:v8 toGroupType:2 updateActive:0];
  objc_initWeak(&location, self);
  id v10 = [v6 presentingViewController];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__CNVisualIdentityPickerViewController_avatarEditorViewController_didFinishWithAvatarRecord___block_invoke;
  v13[3] = &unk_1E549BBD0;
  objc_copyWeak(&v16, &location);
  id v11 = v8;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [(CNVisualIdentityPickerViewController *)self sender:0 dismissViewController:v10 completionHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __93__CNVisualIdentityPickerViewController_avatarEditorViewController_didFinishWithAvatarRecord___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained showAvatarPosePickerFromItem:*(void *)(a1 + 32) atIndexPath:*(void *)(a1 + 40)];
}

- (void)avatarEditorViewControllerDidCancel:(id)a3
{
  id v4 = [a3 presentingViewController];
  [(CNVisualIdentityPickerViewController *)self sender:0 dismissViewController:v4];
}

- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v8 = a4;
  id v6 = [a3 viewController];
  if (v8)
  {
    id v7 = [v6 navigationController];
    [(CNVisualIdentityPickerViewController *)self selectItem:v8 presentFromViewControllerIfNeeded:v7];
  }
  else
  {
    id v7 = [v6 presentingViewController];
    [(CNVisualIdentityPickerViewController *)self sender:0 dismissViewController:v7];
  }
}

- (void)photoPickerActionsViewControllerDidFinish:(id)a3
{
  [(CNVisualIdentityPickerViewController *)self sender:0 dismissViewController:a3];
  [(CNVisualIdentityPickerViewController *)self setEditingProviderItem:0];
  [(CNVisualIdentityPickerViewController *)self setDuplicatingProviderItem:0];

  [(CNVisualIdentityPickerViewController *)self setActionsViewController:0];
}

- (void)photoPickerActionsViewController:(id)a3 didPerformAction:(int64_t)a4 withProviderItem:(id)a5 atIndexPath:(id)a6
{
  id v36 = a3;
  id v10 = a5;
  id v11 = a6;
  switch(a4)
  {
    case 0:
      objc_opt_class();
      id v12 = [(CNVisualIdentityPickerViewController *)self dataSource];
      CGFloat v13 = [v12 providerGroupAtIndexPath:v11];
      if (objc_opt_isKindOfClass()) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }
      id v15 = v14;

      uint64_t v16 = [v15 indexForDefaultMonogram];
      if ([v11 row] == v16)
      {
        [(CNVisualIdentityPickerViewController *)self updateVisualIdentityWithProviderItem:v10];
        [(CNVisualIdentityPickerViewController *)self updateActiveIndexPath:v11];
      }
      else
      {
        v32 = [(CNVisualIdentityPickerViewController *)self dataSource];
        id v33 = [v32 activePhotoIndexPath];

        if (v33 != v11)
        {
          [(CNVisualIdentityPickerViewController *)self setSuggestionsProviderItemAsActiveItem:v10];
          [(CNVisualIdentityPickerViewController *)self updateVisualIdentityWithProviderItem:v10];
        }
      }
      [(CNVisualIdentityPickerViewController *)self sender:0 dismissViewController:v36];
      break;
    case 1:
      [(CNVisualIdentityPickerViewController *)self setEditingProviderItem:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        id v17 = v10;
        if (objc_opt_isKindOfClass()) {
          CGFloat v18 = v17;
        }
        else {
          CGFloat v18 = 0;
        }
        id v19 = v18;

        if (v19) {
          [(CNVisualIdentityPickerViewController *)self showAvatarCropAndScaleForItem:v19 fromViewController:v36];
        }
        goto LABEL_33;
      }
      [(CNVisualIdentityPickerViewController *)self selectItem:v10 presentFromViewControllerIfNeeded:v36];
      break;
    case 2:
      id v19 = (id)[v10 copy];
      CGFloat v20 = [(CNVisualIdentityPickerViewController *)self actionsViewController];
      [v20 updateActionsModelWithProviderItem:v19];

      [(CNVisualIdentityPickerViewController *)self updateVisualIdentityWithProviderItem:v19];
      id v21 = [(CNVisualIdentityPickerViewController *)self insertNewItem:v19 toGroupType:1 updateActive:1];
      [(CNVisualIdentityPickerViewController *)self setDuplicatingProviderItem:v19];
      [(CNVisualIdentityPickerViewController *)self selectItem:v19 presentFromViewControllerIfNeeded:v36];
      goto LABEL_33;
    case 3:
      [(CNVisualIdentityPickerViewController *)self deleteExistingItem:v10];
      uint64_t v22 = [(CNVisualIdentityPickerViewController *)self dataSource];
      id v19 = [v22 providerItemAtIndexPath:v11];

      id v23 = [(CNVisualIdentityPickerViewController *)self dataSource];
      id v24 = [v23 activePhotoIndexPath];

      if (v24 == v11)
      {
        CGRect v25 = [(CNVisualIdentityPickerViewController *)self dataSource];
        CGRect v26 = [v25 providerGroupAtIndexPath:v11];

        objc_opt_class();
        id v27 = v26;
        if (objc_opt_isKindOfClass()) {
          v28 = v27;
        }
        else {
          v28 = 0;
        }
        id v29 = v28;

        if (v19)
        {
          id v30 = v19;
          id v31 = v11;
        }
        else if (v29)
        {
          objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v29, "indexForDefaultMonogram"), 0);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          v34 = [(CNVisualIdentityPickerViewController *)self dataSource];
          id v30 = [v34 providerItemAtIndexPath:v11];
        }
        else
        {
          id v31 = 0;
          id v30 = 0;
        }
        [(CNVisualIdentityPickerViewController *)self updateActiveIndexPath:v31 reload:0];
        [(CNVisualIdentityPickerViewController *)self updateVisualIdentityWithProviderItem:v30];
      }
      v35 = [v10 recentsIdentifier];

      if (v35) {
        [(CNVisualIdentityPickerViewController *)self deleteItemFromRecentsImageStore:v10];
      }
      if (v19) {
        [v36 performDeleteTransitionToItem:v19];
      }
      else {
        [(CNVisualIdentityPickerViewController *)self sender:0 dismissViewController:v36];
      }
LABEL_33:

      break;
    default:
      break;
  }
}

- (void)presentActionsViewControllerForProviderItem:(id)a3 atIndexPath:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  id v7 = [(CNVisualIdentityPickerViewController *)self dataSource];
  id v8 = [v7 providerGroupAtIndexPath:v6];

  uint64_t v9 = [v8 groupType];
  if (v9 == 3)
  {
    id v21 = [CNPhotoPickerActionsModel alloc];
    uint64_t v16 = [(CNVisualIdentityPickerViewController *)self assignActionTitleOverride];
    CGFloat v18 = v21;
    id v19 = v26;
    CGFloat v20 = v16;
    BOOL v17 = 0;
  }
  else
  {
    if (v9 != 1) {
      goto LABEL_9;
    }
    objc_opt_class();
    id v10 = [(CNVisualIdentityPickerViewController *)self dataSource];
    id v11 = [v10 providerGroupAtIndexPath:v6];
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    uint64_t v14 = [v13 indexForDefaultMonogram];
    id v15 = [CNPhotoPickerActionsModel alloc];
    uint64_t v16 = [(CNVisualIdentityPickerViewController *)self assignActionTitleOverride];
    BOOL v17 = [v6 row] > v14;
    CGFloat v18 = v15;
    id v19 = v26;
    CGFloat v20 = v16;
  }
  uint64_t v22 = [(CNPhotoPickerActionsModel *)v18 initWithProviderItem:v19 assignActionTitleOverride:v20 canDelete:v17 atIndexPath:v6];

  id v23 = [[CNPhotoPickerActionsViewController alloc] initWithActionsModel:v22];
  [(CNPhotoPickerActionsViewController *)v23 setDelegate:self];
  [(CNVisualIdentityPickerViewController *)self setActionsViewController:v23];
  id v24 = [(CNVisualIdentityPickerViewController *)self photoPickerNavigationControllerForRootController:v23];
  objc_msgSend(v24, "setModalPresentationStyle:", -[CNVisualIdentityPickerViewController defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
  CGRect v25 = [(CNVisualIdentityPickerViewController *)self contactStyle];
  objc_msgSend(v24, "setModalTransitionStyle:", objc_msgSend(v25, "modalTransitionStyle"));

  [(CNVisualIdentityPickerViewController *)self sender:0 presentViewController:v24];
LABEL_9:
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  [(CNVisualIdentityPickerViewController *)self sender:0 dismissViewController:a3];
  [(CNVisualIdentityPickerViewController *)self setActionsViewController:0];

  [(CNVisualIdentityPickerViewController *)self setEditingProviderItem:0];
}

- (void)imagePickerController:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  getPHPickerViewControllerClass[0]();
  objc_opt_class();
  id v8 = [v6 presentingViewController];
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__CNVisualIdentityPickerViewController_imagePickerController_didFinishWithProviderItem___block_invoke;
    aBlock[3] = &unk_1E549BF80;
    aBlock[4] = self;
    id v23 = v7;
    id v11 = _Block_copy(aBlock);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__CNVisualIdentityPickerViewController_imagePickerController_didFinishWithProviderItem___block_invoke_2;
    v19[3] = &unk_1E549B710;
    id v20 = v10;
    id v21 = v11;
    id v12 = v10;
    id v13 = v11;
    [v6 dismissViewControllerAnimated:1 completion:v19];

    uint64_t v14 = v23;
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__CNVisualIdentityPickerViewController_imagePickerController_didFinishWithProviderItem___block_invoke_3;
    v16[3] = &unk_1E549BF80;
    id v17 = v10;
    CGFloat v18 = self;
    id v15 = v10;
    [(CNVisualIdentityPickerViewController *)self sender:0 dismissViewController:v6 completionHandler:v16];
    uint64_t v14 = v17;
  }
}

void __88__CNVisualIdentityPickerViewController_imagePickerController_didFinishWithProviderItem___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isEditingOrDuplicatingItem];
  int v3 = [*(id *)(a1 + 40) allowsVariants];
  if (v2)
  {
    if (v3)
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      id v8 = [v5 presentedViewController];
      [v5 presentVisualIdentityItemEditorForItem:v4 fromViewController:v8];
    }
  }
  else if (v3)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    [v6 presentVisualIdentityItemEditorForItem:v7 fromViewController:v6];
  }
}

uint64_t __88__CNVisualIdentityPickerViewController_imagePickerController_didFinishWithProviderItem___block_invoke_2(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2) {
    return [v2 dismissViewControllerAnimated:1 completion:v3];
  }
  else {
    return (*(uint64_t (**)(void))(v3 + 16))(*(void *)(a1 + 40));
  }
}

uint64_t __88__CNVisualIdentityPickerViewController_imagePickerController_didFinishWithProviderItem___block_invoke_3(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 40), "sender:dismissViewController:", 0);
  }
  return result;
}

- (BOOL)isPresentingModalViewController
{
  int v2 = [(CNVisualIdentityPickerViewController *)self presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(CNVisualIdentityPickerViewController *)self presenterDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(CNVisualIdentityPickerViewController *)self presenterDelegate];
    [v10 visualIdentityPicker:self dismissViewController:v11];
  }
  else
  {
    [v11 dismissViewControllerAnimated:1 completion:v7];
  }
}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CNVisualIdentityPickerViewController *)self contactStyle];
  objc_msgSend(v7, "setModalTransitionStyle:", objc_msgSend((id)v8, "modalTransitionStyle"));

  id v22 = v6;
  char v9 = [v7 popoverPresentationController];
  [v9 setSourceView:v22];

  [v22 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  CGFloat v18 = [v7 popoverPresentationController];
  objc_msgSend(v18, "setSourceRect:", v11, v13, v15, v17);

  id v19 = [v7 popoverPresentationController];
  [v19 setPermittedArrowDirections:15];

  [(CNVisualIdentityPickerViewController *)self preferredContentSize];
  objc_msgSend(v7, "setPreferredContentSize:");
  id v20 = [(CNVisualIdentityPickerViewController *)self presenterDelegate];
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    id v21 = [(CNVisualIdentityPickerViewController *)self presenterDelegate];
    [v21 visualIdentityPicker:self presentViewController:v7];
  }
  else
  {
    [(CNVisualIdentityPickerViewController *)self presentViewController:v7 animated:1 completion:0];
  }
}

- (void)updateEmojiSuggestionsForUpdatedVisualIdentity:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CNVisualIdentityPickerViewController *)self shouldUpdateEmojiSuggestions])
  {
    uint64_t v8 = [v6 name];
    char v9 = [(CNVisualIdentityPickerViewController *)self dataSource];
    double v10 = [v9 variantsManager];
    [(id)objc_opt_class() defaultItemSize];
    double v11 = +[CNPhotoPickerEmojiProviderItem suggestedEmojiItemsForString:variantsManager:size:locale:](CNPhotoPickerEmojiProviderItem, "suggestedEmojiItemsForString:variantsManager:size:locale:", v8, v10, v7);

    double v12 = [(CNVisualIdentityPickerViewController *)self dataSource];
    double v13 = [v12 uniqueEmojiSuggestionItems:v11];

    if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
    {
      double v14 = [(CNVisualIdentityPickerViewController *)self dataSource];
      double v15 = [v14 emojiSuggestionItems];
      unint64_t v16 = [v15 count];

      if (v16 <= 2)
      {
        uint64_t v20 = objc_msgSend(v13, "_cn_takeLast:", 3 - v16);

        id v21 = [(CNVisualIdentityPickerViewController *)self dataSource];
        id v22 = [v21 emojiSuggestionItems];
        id v23 = [v22 arrayByAddingObjectsFromArray:v20];
        id v24 = [(CNVisualIdentityPickerViewController *)self dataSource];
        [v24 setEmojiSuggestionItems:v23];

        double v13 = (void *)v20;
      }
      else
      {
        double v17 = [(CNVisualIdentityPickerViewController *)self dataSource];
        CGFloat v18 = [v17 emojiSuggestionItems];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __94__CNVisualIdentityPickerViewController_updateEmojiSuggestionsForUpdatedVisualIdentity_locale___block_invoke;
        v30[3] = &unk_1E5499308;
        v30[4] = self;
        objc_msgSend(v18, "_cn_each:", v30);

        id v19 = [(CNVisualIdentityPickerViewController *)self dataSource];
        [v19 setEmojiSuggestionItems:v13];
      }
      CGRect v25 = [(CNVisualIdentityPickerViewController *)self dataSource];
      id v26 = [(CNVisualIdentityPickerViewController *)self dataSource];
      id v27 = [v26 activePhotoIndexPath];
      v28 = [v25 providerItemAtIndexPath:v27];

      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __94__CNVisualIdentityPickerViewController_updateEmojiSuggestionsForUpdatedVisualIdentity_locale___block_invoke_2;
      v29[3] = &unk_1E5499308;
      v29[4] = self;
      objc_msgSend(v13, "_cn_each:", v29);
      [(CNVisualIdentityPickerViewController *)self setSuggestionsProviderItemAsActiveItem:v28];
    }
  }
}

uint64_t __94__CNVisualIdentityPickerViewController_updateEmojiSuggestionsForUpdatedVisualIdentity_locale___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteExistingItem:a2];
}

id __94__CNVisualIdentityPickerViewController_updateEmojiSuggestionsForUpdatedVisualIdentity_locale___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) insertNewItem:a2 toGroupType:1 updateActive:0 scrollToItem:0];
}

- (void)updateMonogramsForUpdatedVisualIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [(CNVisualIdentityPickerViewController *)self dataSource];
  id v12 = [v5 suggestionsGroup];

  [(id)objc_opt_class() defaultItemSize];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(CNVisualIdentityPickerViewController *)self view];
  BOOL v11 = [v10 effectiveUserInterfaceLayoutDirection] == 1;

  objc_msgSend(v12, "reloadMonogramProviderGroupWithVisualIdentity:size:RTL:", v4, v11, v7, v9);
}

- (void)updateVisualIdentityWithName:(id)a3 locale:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  double v7 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  int v8 = [v7 canUpdateGroupName];

  if (v8)
  {
    double v9 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
    double v10 = [v9 abbreviatedName];

    BOOL v11 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
    [v11 updateGroupName:v21];

    id v12 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
    [(CNVisualIdentityPickerViewController *)self updateEmojiSuggestionsForUpdatedVisualIdentity:v12 locale:v6];

    double v13 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
    double v14 = [v13 abbreviatedName];
    char v15 = [v10 isEqualToString:v14];

    uint64_t v16 = *MEMORY[0x1E4F5A2A0];
    double v17 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
    CGFloat v18 = [v17 abbreviatedName];
    int v19 = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v18);

    if ((v15 & 1) == 0 && v19)
    {
      uint64_t v20 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
      [(CNVisualIdentityPickerViewController *)self updateMonogramsForUpdatedVisualIdentity:v20];
    }
  }
}

- (void)photoPickerHeaderViewDidReceiveDroppedImageData:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1818];
  id v5 = a3;
  id v19 = (id)[[v4 alloc] initWithData:v5];
  [v19 size];
  double v7 = v6;
  [v19 scale];
  CGFloat v9 = v7 / v8;
  [v19 size];
  double v11 = v10;
  [v19 scale];
  CGFloat v13 = v11 / v12;
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v9;
  v21.size.height = v13;
  CGRectGetWidth(v21);
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v9;
  v22.size.height = v13;
  CGRectGetHeight(v22);
  UIRectGetCenter();
  [v19 scale];
  UIRectCenteredAboutPointScale();
  CGFloat v18 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:]([CNPhotoPickerProviderItem alloc], "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v5, 0, 0, v14, v15, v16, v17);

  if ([(CNPhotoPickerProviderItem *)v18 allowsVariants]) {
    [(CNVisualIdentityPickerViewController *)self presentVisualIdentityItemEditorForItem:v18 fromViewController:self];
  }
}

- (void)photoPickerHeaderViewDidTapClearAvatarImageButton:(id)a3
{
  [(CNVisualIdentityPickerViewController *)self updateVisualIdentityWithProviderItem:0];
  [(CNVisualIdentityPickerViewController *)self updateInjectedItemsSectionForProviderItem:0];

  [(CNVisualIdentityPickerViewController *)self updateActiveIndexPath:0];
}

- (void)photoPickerHeaderView:(id)a3 didUpdateIdentityNameTextField:(id)a4 withText:(id)a5
{
  id v7 = a5;
  double v8 = [a4 textInputMode];
  id v10 = [v8 primaryLanguage];

  CGFloat v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v10];
  [(CNVisualIdentityPickerViewController *)self updateVisualIdentityWithName:v7 locale:v9];

  [(CNVisualIdentityPickerViewController *)self updateDoneButtonEnabledState];
}

- (void)updateActiveIndexPathForUpdatedSuggestionsGroup:(id)a3 atSectionIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  double v8 = [v7 imageData];

  objc_opt_class();
  id v13 = v6;
  if (objc_opt_isKindOfClass()) {
    CGFloat v9 = v13;
  }
  else {
    CGFloat v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    if (v8)
    {
      double v11 = [(CNVisualIdentityPickerViewController *)self dataSource];
      double v12 = [v11 findActiveIndexPathInGroup:v13 withImageData:v8];
    }
    else
    {
      double v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v10, "indexForDefaultMonogram"), a4);
    }
  }
  else
  {
    double v12 = 0;
  }
  [(CNVisualIdentityPickerViewController *)self updateActiveIndexPath:v12];
}

- (void)reloadItemsForUpdatedSuggestionsGroup:(id)a3 atSectionIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CNVisualIdentityPickerViewController *)self collectionView];
  double v8 = [v7 indexPathsForVisibleItems];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__CNVisualIdentityPickerViewController_reloadItemsForUpdatedSuggestionsGroup_atSectionIndex___block_invoke;
  v19[3] = &unk_1E5499270;
  int64_t v21 = a4;
  id v9 = v6;
  id v20 = v9;
  id v10 = objc_msgSend(v8, "_cn_filter:", v19);

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    id v11 = [(CNVisualIdentityPickerViewController *)self collectionView];
    double v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
    [v11 reloadSections:v12];
  }
  else
  {
    id v13 = [(CNVisualIdentityPickerViewController *)self dataSource];
    double v14 = [v13 indexPathsToReloadForUpdatedGroup:v9];

    double v15 = [(CNVisualIdentityPickerViewController *)self collectionView];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93__CNVisualIdentityPickerViewController_reloadItemsForUpdatedSuggestionsGroup_atSectionIndex___block_invoke_2;
    v16[3] = &unk_1E549B800;
    void v16[4] = self;
    id v17 = v10;
    id v18 = v14;
    id v11 = v14;
    [v15 performBatchUpdates:v16 completion:0];
  }
}

BOOL __93__CNVisualIdentityPickerViewController_reloadItemsForUpdatedSuggestionsGroup_atSectionIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 section];
  uint64_t v5 = *(void *)(a1 + 40);
  if ([*(id *)(a1 + 32) allowAddItem]) {
    BOOL v6 = [v3 row] != 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = v4 == v5 && v6;

  return v7;
}

void __93__CNVisualIdentityPickerViewController_reloadItemsForUpdatedSuggestionsGroup_atSectionIndex___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) collectionView];
  [v2 deleteItemsAtIndexPaths:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) collectionView];
  [v3 insertItemsAtIndexPaths:*(void *)(a1 + 48)];
}

- (void)photoPickerProviderGroup:(id)a3 didUpdateItem:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(CNVisualIdentityPickerViewController *)self isViewLoaded])
  {
    if ([v6 groupType] == 1)
    {
      double v8 = [(CNVisualIdentityPickerViewController *)self dataSource];
      id v9 = [v7 imageData];
      id v10 = [v8 findActiveIndexPathInGroup:v6 withImageData:v9];

      if (v10)
      {
        id v11 = [(CNVisualIdentityPickerViewController *)self collectionView];
        v13[0] = v10;
        double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
        [v11 reloadItemsAtIndexPaths:v12];
      }
    }
    else
    {
      [(CNVisualIdentityPickerViewController *)self photoPickerProviderGroupDidUpdate:v6 requiresFullReload:0];
    }
  }
}

- (void)photoPickerProviderGroupDidUpdate:(id)a3 requiresFullReload:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  if ([(CNVisualIdentityPickerViewController *)self isViewLoaded])
  {
    id v6 = [(CNVisualIdentityPickerViewController *)self dataSource];
    uint64_t v7 = [v6 sectionIndexForProviderGroup:v14];

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = [v14 groupType];
      if ((unint64_t)(v8 - 2) >= 2)
      {
        if (v8 == 1)
        {
          if (v4)
          {
            id v10 = [(CNVisualIdentityPickerViewController *)self collectionView];
            [v10 reloadData];
          }
          else
          {
            [(CNVisualIdentityPickerViewController *)self reloadItemsForUpdatedSuggestionsGroup:v14 atSectionIndex:v7];
          }
          [(CNVisualIdentityPickerViewController *)self updateActiveIndexPathForUpdatedSuggestionsGroup:v14 atSectionIndex:v7];
          uint64_t v11 = *MEMORY[0x1E4F5A258];
          double v12 = [(CNVisualIdentityPickerViewController *)self pendingInjectedSuggestionItems];
          LOBYTE(v11) = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12);

          if ((v11 & 1) == 0)
          {
            id v13 = [(CNVisualIdentityPickerViewController *)self pendingInjectedSuggestionItems];
            objc_msgSend(v13, "_cn_each:", &__block_literal_global_282);

            [(CNVisualIdentityPickerViewController *)self setPendingInjectedSuggestionItems:MEMORY[0x1E4F1CBF0]];
          }
        }
      }
      else
      {
        id v9 = [(CNVisualIdentityPickerViewController *)self collectionView];
        [v9 reloadData];
      }
    }
  }
}

uint64_t __93__CNVisualIdentityPickerViewController_photoPickerProviderGroupDidUpdate_requiresFullReload___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)presentCameraImagePicker
{
  if (+[CNPhotoPickerCapabilities allowsCameraAccess])
  {
    id v3 = [(CNVisualIdentityPickerViewController *)self imagePickerController];
    [v3 presentCameraImagePickerFromViewController:self];
  }
}

- (void)presentLibraryImagePickerForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNVisualIdentityPickerViewController *)self collectionView];
  id v7 = [v5 cellForItemAtIndexPath:v4];

  id v6 = [(CNVisualIdentityPickerViewController *)self imagePickerController];
  [v6 presentPhotoLibraryPickerFromViewController:self sourceView:v7];
}

- (void)showAvatarCropAndScaleForItem:(id)a3 fromViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [CNAvatarEditingManager alloc];
  id v9 = [v7 avatarRecord];
  id v10 = [(CNVisualIdentityPickerViewController *)self dataSource];
  uint64_t v11 = [v10 variantsManager];
  id v14 = [(CNAvatarEditingManager *)v8 initForEditingWithAvatarRecord:v9 variantsManager:v11 fromViewController:v6];

  [v14 setDelegate:self];
  [v14 setOriginalItem:v7];
  [(CNVisualIdentityPickerViewController *)self setAvatarEditingManager:v14];
  double v12 = [v14 imagePickerForItem:v7];

  id v13 = [(CNVisualIdentityPickerViewController *)self imagePickerController];
  [v13 presentImagePicker:v12 withStyle:6 fromViewController:v6 forVisualIdentityPicker:self];
}

- (void)showAvatarPosePickerFromItem:(id)a3 atIndexPath:(id)a4
{
  id v17 = a3;
  if (+[CNPhotoPickerCapabilities allowsAvatarUI])
  {
    uint64_t v5 = [CNAvatarEditingManager alloc];
    id v6 = [v17 avatarRecord];
    id v7 = [(CNVisualIdentityPickerViewController *)self dataSource];
    uint64_t v8 = [v7 variantsManager];
    id v9 = [(CNAvatarEditingManager *)v5 initWithAvatarRecord:v6 variantsManager:v8];

    [(CNAvatarEditingManager *)v9 setDelegate:self];
    [(CNAvatarEditingManager *)v9 setOriginalItem:v17];
    [(CNVisualIdentityPickerViewController *)self setAvatarEditingManager:v9];
    id v10 = [(CNVisualIdentityPickerViewController *)self view];
    uint64_t v11 = [v10 backgroundColor];
    double v12 = [(CNAvatarEditingManager *)v9 viewController];
    id v13 = [v12 view];
    [v13 setBackgroundColor:v11];

    id v14 = [(CNAvatarEditingManager *)v9 viewController];
    double v15 = [(CNVisualIdentityPickerViewController *)self photoPickerNavigationControllerForRootController:v14];

    objc_msgSend(v15, "setModalPresentationStyle:", -[CNVisualIdentityPickerViewController defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
    double v16 = [(CNVisualIdentityPickerViewController *)self contactStyle];
    objc_msgSend(v15, "setModalTransitionStyle:", objc_msgSend(v16, "modalTransitionStyle"));

    [(CNVisualIdentityPickerViewController *)self sender:0 presentViewController:v15];
  }
}

- (void)showAvatarEditorForCreation
{
  if ([(id)objc_opt_class() canShowAvatarEditor])
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v3 = (void *)getAVTAvatarEditorViewControllerClass_softClass;
    uint64_t v15 = getAVTAvatarEditorViewControllerClass_softClass;
    if (!getAVTAvatarEditorViewControllerClass_softClass)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getAVTAvatarEditorViewControllerClass_block_invoke;
      v11[3] = &unk_1E549AD00;
      v11[4] = &v12;
      __getAVTAvatarEditorViewControllerClass_block_invoke((uint64_t)v11);
      id v3 = (void *)v13[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v12, 8);
    uint64_t v5 = [(CNVisualIdentityPickerViewController *)self dataSource];
    id v6 = [v5 avatarStore];
    id v7 = [v4 viewControllerForCreatingAvatarInStore:v6];

    [v7 setDelegate:self];
    [v7 setEditorPresentationContext:1];
    uint64_t v8 = [v7 navigationItem];
    [v8 _setBackgroundHidden:1];

    id v9 = [(CNVisualIdentityPickerViewController *)self photoPickerNavigationControllerForRootController:v7];
    objc_msgSend(v9, "setModalPresentationStyle:", -[CNVisualIdentityPickerViewController defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
    id v10 = [(CNVisualIdentityPickerViewController *)self contactStyle];
    objc_msgSend(v9, "setModalTransitionStyle:", objc_msgSend(v10, "modalTransitionStyle"));

    [(CNVisualIdentityPickerViewController *)self sender:0 presentViewController:v9];
  }
}

- (int64_t)defaultModalPresentationStyle
{
  int v2 = [(CNVisualIdentityPickerViewController *)self contactStyle];
  if ([v2 shouldPresentInCurrentContext])
  {
    int64_t v3 = 3;
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v4 userInterfaceIdiom] == 1) {
      int64_t v3 = 2;
    }
    else {
      int64_t v3 = -2;
    }
  }
  return v3;
}

- (void)presentVisualIdentityItemEditorForItem:(id)a3 fromViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [CNVisualIdentityItemEditorViewController alloc];
  id v9 = [(CNVisualIdentityPickerViewController *)self dataSource];
  id v10 = [v9 variantsManager];
  uint64_t v11 = [(CNVisualIdentityItemEditorViewController *)v8 initWithProviderItem:v7 variantsManager:v10];

  [(CNVisualIdentityItemEditorViewController *)v11 setDelegate:self];
  [(CNVisualIdentityPickerViewController *)self presentEditItemViewController:v11 fromViewController:v6];
}

- (void)selectItem:(id)a3 presentFromViewControllerIfNeeded:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v10 allowsMoveAndScale])
  {
    BOOL v7 = [(CNVisualIdentityPickerViewController *)self isEditingOrDuplicatingItem];
    uint64_t v8 = [(CNVisualIdentityPickerViewController *)self imagePickerController];
    if (v7) {
      [v10 originalImageData];
    }
    else {
    id v9 = [v10 imageData];
    }
    [v10 cropRect];
    objc_msgSend(v8, "presentMoveAndScaleForImageData:withCropRect:fromViewController:", v9, v6);
  }
  else if ([v10 allowsVariants])
  {
    [(CNVisualIdentityPickerViewController *)self presentVisualIdentityItemEditorForItem:v10 fromViewController:v6];
  }
}

- (BOOL)isEditingOrDuplicatingItem
{
  int64_t v3 = [(CNVisualIdentityPickerViewController *)self editingProviderItem];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(CNVisualIdentityPickerViewController *)self duplicatingProviderItem];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)presentMonogramEditorFromIndexPath:(id)a3
{
  BOOL v4 = [(CNVisualIdentityPickerViewController *)self dataSource];
  [(id)objc_opt_class() defaultItemSize];
  objc_msgSend(v4, "monogramProviderMonogramItemWithSize:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(CNVisualIdentityPickerViewController *)self selectItem:v5 presentFromViewControllerIfNeeded:self];
}

- (void)presentEmojiEditor
{
  [(id)objc_opt_class() defaultItemSize];
  +[CNPhotoPickerEmojiProviderItem addNewEmojiProviderItemWithSize:](CNPhotoPickerEmojiProviderItem, "addNewEmojiProviderItemWithSize:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(CNVisualIdentityPickerViewController *)self selectItem:v3 presentFromViewControllerIfNeeded:self];
}

- (void)didSelectSuggestionsAddItemAtIndexPath:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(CNVisualIdentityPickerViewController *)self dataSource];
  id v5 = [v4 providerItemAtIndexPath:v9];

  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    switch([v8 addItemType])
    {
      case 0:
        [(CNVisualIdentityPickerViewController *)self presentCameraImagePicker];
        break;
      case 1:
        [(CNVisualIdentityPickerViewController *)self presentLibraryImagePickerForIndexPath:v9];
        break;
      case 2:
        [(CNVisualIdentityPickerViewController *)self handleAddEmojiItemSelectedWithIndexPath:v9];
        break;
      case 3:
        [(CNVisualIdentityPickerViewController *)self presentMonogramEditorFromIndexPath:v9];
        break;
      default:
        break;
    }
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v17 = a4;
  id v5 = [(CNVisualIdentityPickerViewController *)self dataSource];
  id v6 = [v5 providerGroupAtIndexPath:v17];

  BOOL v7 = [(CNVisualIdentityPickerViewController *)self dataSource];
  int v8 = [v7 isItemAtIndexPathAddItem:v17];

  switch([v6 groupType])
  {
    case 0:
      goto LABEL_3;
    case 1:
      if (v8)
      {
LABEL_3:
        [(CNVisualIdentityPickerViewController *)self didSelectSuggestionsAddItemAtIndexPath:v17];
        goto LABEL_17;
      }
      uint64_t v11 = [(CNVisualIdentityPickerViewController *)self dataSource];
      id v10 = [v11 providerItemAtIndexPath:v17];

      [(CNVisualIdentityPickerViewController *)self processSelectionForSuggestionsProviderItem:v10 atIndexPath:v17];
      goto LABEL_16;
    case 2:
      if (v8)
      {
        [(CNVisualIdentityPickerViewController *)self showAvatarEditorForCreation];
      }
      else
      {
        objc_opt_class();
        uint64_t v12 = [(CNVisualIdentityPickerViewController *)self dataSource];
        id v13 = [v12 providerItemAtIndexPath:v17];
        if (objc_opt_isKindOfClass()) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = 0;
        }
        id v15 = v14;

        if (v15)
        {
          [(CNVisualIdentityPickerViewController *)self showAvatarPosePickerFromItem:v15 atIndexPath:v17];
        }
      }
      goto LABEL_17;
    case 3:
      if (v8)
      {
        [(CNVisualIdentityPickerViewController *)self handleAddEmojiItemSelectedWithIndexPath:v17];
      }
      else
      {
        double v16 = [(CNVisualIdentityPickerViewController *)self dataSource];
        id v10 = [v16 providerItemAtIndexPath:v17];

        [(CNVisualIdentityPickerViewController *)self selectItem:v10 presentFromViewControllerIfNeeded:self];
LABEL_16:
      }
LABEL_17:

      return;
    case 4:
      id v9 = [(CNVisualIdentityPickerViewController *)self dataSource];
      id v10 = [v9 providerItemAtIndexPath:v17];

      [(CNVisualIdentityPickerViewController *)self updateVisualIdentityWithProviderItem:v10];
      goto LABEL_16;
    default:
      goto LABEL_17;
  }
}

- (void)headerActionPressedAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CNVisualIdentityPickerViewController *)self dataSource];
  id v6 = [v5 providerGroupAtIndexPath:v4];

  if ([v6 groupType] == 2)
  {
    BOOL v7 = [(CNVisualIdentityPickerViewController *)self dataSource];
    objc_msgSend(v7, "updateGroupCollapsedStateForSection:", objc_msgSend(v4, "section"));

    int v8 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v4, "section"));
    id v9 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__CNVisualIdentityPickerViewController_headerActionPressedAtIndexPath___block_invoke;
    v11[3] = &unk_1E549BF80;
    v11[4] = self;
    id v12 = v8;
    id v10 = v8;
    [v9 performWithoutAnimation:v11];
  }
}

void __71__CNVisualIdentityPickerViewController_headerActionPressedAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 reloadSections:*(void *)(a1 + 40)];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = *MEMORY[0x1E4FB2770];
  if ((id)*MEMORY[0x1E4FB2770] != v10)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    CGRect v25 = (objc_class *)objc_opt_class();
    id v26 = NSStringFromClass(v25);
    [v24 handleFailureInMethod:a2, self, @"CNVisualIdentityPickerViewController.m", 1000, @"%@ asked to provide a supplementary element for an unsupported kind %@ at %@", v26, v10, v11 object file lineNumber description];
  }
  id v13 = +[CNPhotoPickerSectionHeader reusableIdentifier];
  uint64_t v14 = [v9 dequeueReusableSupplementaryViewOfKind:v12 withReuseIdentifier:v13 forIndexPath:v11];

  id v15 = [(CNVisualIdentityPickerViewController *)self contactStyle];
  [v14 updateStyle:v15];

  double v16 = [(CNVisualIdentityPickerViewController *)self dataSource];
  id v17 = objc_msgSend(v16, "titleForSection:", objc_msgSend(v11, "section"));

  id v18 = [v14 titleLabel];
  [v18 setText:v17];

  id v19 = [v14 actionButton];
  id v20 = [(CNVisualIdentityPickerViewController *)self dataSource];
  int64_t v21 = objc_msgSend(v20, "actionTitleForSection:", objc_msgSend(v11, "section"));
  [v19 setTitle:v21 forState:0];

  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __101__CNVisualIdentityPickerViewController_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
  v27[3] = &unk_1E549B670;
  objc_copyWeak(&v29, &location);
  id v22 = v11;
  id v28 = v22;
  [v14 setActionBlock:v27];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v14;
}

void __101__CNVisualIdentityPickerViewController_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained headerActionPressedAtIndexPath:*(void *)(a1 + 32)];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  int v8 = [v7 collectionViewLayout];
  [v8 sectionInset];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  id v17 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v18 = [v17 userInterfaceIdiom];

  id v19 = [(CNVisualIdentityPickerViewController *)self view];
  id v20 = [v19 traitCollection];
  uint64_t v21 = [v20 horizontalSizeClass];

  id v22 = [(CNVisualIdentityPickerViewController *)self dataSource];
  id v23 = [v22 providerGroupAtSection:a5];

  uint64_t v24 = [v23 groupType];
  if (v18 || v21 != 1)
  {
    if (!v24)
    {
      double v31 = (double)[v7 numberOfItemsInSection:a5];
      [v8 itemSize];
      double v33 = v32 * v31;
      [v8 minimumInteritemSpacing];
      double v35 = v34 * (v31 + -1.0);
      [v7 bounds];
      double v37 = v36;
      v38 = [(CNVisualIdentityPickerViewController *)self view];
      [v38 safeAreaInsets];
      double v40 = v39;
      v41 = [(CNVisualIdentityPickerViewController *)self view];
      [v41 safeAreaInsets];
      double v43 = v37 - (v40 + v42);

      double v16 = (v43 - (v33 + v35)) * 0.5;
      double v12 = v16;
    }
  }
  else
  {
    if (v24 == 1)
    {
      CGRect v25 = [(CNVisualIdentityPickerViewController *)self dataSource];
      id v26 = [v25 providerGroupAtSection:a5 - 1];

      if (![v26 groupType])
      {
        [v8 minimumInteritemSpacing];
        double v10 = v27 * 0.5;
      }
    }
    if (![v23 groupType])
    {
      id v28 = [(CNVisualIdentityPickerViewController *)self dataSource];
      id v29 = [v28 providerGroupAtSection:a5 + 1];

      if ([v29 groupType] == 1)
      {
        [v8 minimumInteritemSpacing];
        double v14 = v30 * 0.5;
      }
    }
  }

  double v44 = v10;
  double v45 = v12;
  double v46 = v14;
  double v47 = v16;
  result.right = v47;
  result.bottom = v46;
  result.left = v45;
  result.top = v44;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  if (objc_msgSend(a3, "numberOfItemsInSection:", a5, a4) < 0)
  {
    double v16 = *MEMORY[0x1E4F1DB30];
    uint64_t v17 = *(uint64_t *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    id v7 = [(CNVisualIdentityPickerViewController *)self dataSource];
    int v8 = [v7 providerGroupAtSection:a5];

    uint64_t v9 = [v8 groupType];
    uint64_t v10 = [v8 groupType];
    uint64_t v11 = [v8 groupType];
    double v12 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if (!v9 || (!v13 ? (BOOL v14 = v10 == 1) : (BOOL v14 = 0), !v14 ? (v15 = v11 == 4) : (v15 = 1), v15))
    {
      double v16 = *MEMORY[0x1E4F1DB30];
      uint64_t v17 = *(uint64_t *)(MEMORY[0x1E4F1DB30] + 8);
    }
    else
    {
      double v16 = 0.0;
      if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
      {
        id v20 = [(CNVisualIdentityPickerViewController *)self dataSource];
        uint64_t v21 = [v20 actionTitleForSection:a5];
        +[CNPhotoPickerSectionHeader heightNeededForAccessibilityLayoutIncludingActionButton:](CNPhotoPickerSectionHeader, "heightNeededForAccessibilityLayoutIncludingActionButton:", [v21 length] != 0);
        uint64_t v17 = v22;
      }
      else
      {
        *(double *)&uint64_t v17 = 44.0;
      }
    }
  }
  double v18 = v16;
  double v19 = *(double *)&v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[CNPhotoPickerCollectionViewCell cellIdentifier];
  uint64_t v9 = [(CNVisualIdentityPickerViewController *)self dataSource];
  uint64_t v10 = [v9 providerItemAtIndexPath:v7];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v12 = [(CNVisualIdentityPickerViewController *)self dataSource];
  uint64_t v13 = [v12 providerGroupAtIndexPath:v7];

  if (isKindOfClass)
  {
    uint64_t v14 = [v8 stringByAppendingFormat:@"-Add"];

    int v8 = (void *)v14;
  }
  BOOL v15 = objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v7, v6);
  double v16 = [MEMORY[0x1E4F29128] UUID];
  [v15 setDisplaySessionUUID:v16];
  uint64_t v17 = [(CNVisualIdentityPickerViewController *)self dataSource];
  double v18 = [v17 activePhotoIndexPath];
  objc_msgSend(v15, "setSelected:", objc_msgSend(v7, "isEqual:", v18));

  if (isKindOfClass & 1) != 0 && (objc_opt_respondsToSelector())
  {
    double v19 = [(CNVisualIdentityPickerViewController *)self view];
    id v20 = [v19 tintColor];
    [v10 updateTintColorIfNeeded:v20];

    [v15 setDisplaysBorder:1];
    uint64_t v21 = [(CNVisualIdentityPickerViewController *)self view];
    uint64_t v22 = [v21 tintColor];
    [v15 updateBorderTintColor:v22];
  }
  uint64_t v33 = 0;
  double v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __78__CNVisualIdentityPickerViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v29[3] = &unk_1E5499248;
  id v23 = v15;
  id v30 = v23;
  id v24 = v16;
  id v31 = v24;
  double v32 = &v33;
  [v10 thumbnailViewWithCompletion:v29];
  objc_msgSend(v23, "setCellStyle:", (objc_msgSend(v13, "groupType") != 2) | (isKindOfClass & 1));
  *((unsigned char *)v34 + 24) = 0;
  CGRect v25 = v31;
  id v26 = v23;

  _Block_object_dispose(&v33, 8);

  return v26;
}

void __78__CNVisualIdentityPickerViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) displaySessionUUID];
  id v4 = *(void **)(a1 + 40);

  if (v3 == v4) {
    [*(id *)(a1 + 32) updateWithView:v5 animation:*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0];
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = [(CNVisualIdentityPickerViewController *)self dataSource];
  int64_t v6 = [v5 numberOfItemsInSection:a4];

  return v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v3 = [(CNVisualIdentityPickerViewController *)self dataSource];
  int64_t v4 = [v3 numberOfSections];

  return v4;
}

- (id)contactImageForCurrentActiveItem
{
  id v3 = [(CNVisualIdentityPickerViewController *)self dataSource];
  int64_t v4 = [(CNVisualIdentityPickerViewController *)self dataSource];
  id v5 = [v4 activePhotoIndexPath];
  int64_t v6 = [v3 providerItemAtIndexPath:v5];

  id v7 = [v6 contactImageForMetadataStore];

  return v7;
}

- (void)setSuggestionsProviderItemAsActiveItem:(id)a3
{
  id v5 = a3;
  [(CNVisualIdentityPickerViewController *)self deleteExistingItem:v5];
  id v4 = [(CNVisualIdentityPickerViewController *)self insertNewItem:v5 toGroupType:1 updateActive:1];
}

- (void)deleteExistingItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CNVisualIdentityPickerViewController *)self dataSource];
  int64_t v6 = [v5 removeItem:v4];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4FB1EB0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__CNVisualIdentityPickerViewController_deleteExistingItem___block_invoke;
    v8[3] = &unk_1E549BF80;
    v8[4] = self;
    id v9 = v6;
    [v7 performWithoutAnimation:v8];
  }
}

void __59__CNVisualIdentityPickerViewController_deleteExistingItem___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) collectionView];
  id v2 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  [v3 reloadSections:v2];
}

- (id)insertNewItem:(id)a3 toGroupType:(int64_t)a4 updateActive:(BOOL)a5 scrollToItem:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  uint64_t v11 = [(CNVisualIdentityPickerViewController *)self dataSource];
  double v12 = [v11 indexOfAddedItem:v10 inGroupOfType:a4];

  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __92__CNVisualIdentityPickerViewController_insertNewItem_toGroupType_updateActive_scrollToItem___block_invoke;
    uint64_t v21 = &unk_1E549BF80;
    uint64_t v22 = self;
    id v14 = v12;
    id v23 = v14;
    [v13 performWithoutAnimation:&v18];
    if (v6)
    {
      BOOL v15 = [(CNVisualIdentityPickerViewController *)self collectionView];
      [v15 scrollToItemAtIndexPath:v14 atScrollPosition:2 animated:1];
    }
    if (v7) {
      [(CNVisualIdentityPickerViewController *)self updateActiveIndexPath:v14];
    }
    id v16 = v14;
  }

  return v12;
}

void __92__CNVisualIdentityPickerViewController_insertNewItem_toGroupType_updateActive_scrollToItem___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) collectionView];
  id v2 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  [v3 reloadSections:v2];
}

- (id)insertNewItem:(id)a3 toGroupType:(int64_t)a4 updateActive:(BOOL)a5
{
  return [(CNVisualIdentityPickerViewController *)self insertNewItem:a3 toGroupType:a4 updateActive:a5 scrollToItem:1];
}

- (void)insertNewItemIntoSuggestions:(id)a3
{
  id v4 = a3;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __69__CNVisualIdentityPickerViewController_insertNewItemIntoSuggestions___block_invoke;
  id v14 = &unk_1E549BF80;
  BOOL v15 = self;
  id v16 = v4;
  id v5 = v4;
  BOOL v6 = (void (**)(void))_Block_copy(&v11);
  if ([(CNVisualIdentityPickerViewController *)self isViewLoaded])
  {
    v6[2](v6);
  }
  else
  {
    BOOL v7 = [(CNVisualIdentityPickerViewController *)self pendingInjectedSuggestionItems];
    int v8 = (void *)[v6 copy];
    id v9 = _Block_copy(v8);
    id v10 = [v7 arrayByAddingObject:v9];
    [(CNVisualIdentityPickerViewController *)self setPendingInjectedSuggestionItems:v10];
  }
}

id __69__CNVisualIdentityPickerViewController_insertNewItemIntoSuggestions___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) insertNewItem:*(void *)(a1 + 40) toGroupType:1 updateActive:1 scrollToItem:0];
}

- (void)updateHeaderViewAvatar
{
  id v3 = [(CNVisualIdentityPickerViewController *)self headerView];
  uint64_t v4 = [v3 placeholderProviderItem];
  if (v4)
  {
    id v5 = (void *)v4;
LABEL_3:

    goto LABEL_5;
  }
  BOOL v6 = [(CNVisualIdentityPickerViewController *)self visualIdentity];
  uint64_t v7 = [v6 identityType];

  if (!v7)
  {
    id v9 = [(CNVisualIdentityPickerViewController *)self dataSource];
    [(id)objc_opt_class() defaultItemSize];
    id v3 = objc_msgSend(v9, "monogramProviderDefaultItemWithSize:");

    id v5 = [(CNVisualIdentityPickerViewController *)self headerView];
    [v5 setPlaceholderProviderItem:v3];
    goto LABEL_3;
  }
LABEL_5:
  id v10 = [(CNVisualIdentityPickerViewController *)self headerView];
  int v8 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  [v10 updatePhotoViewWithUpdatedIdentity:v8];
}

- (void)updateDoneButtonEnabledStateForEditingProviderItem:(id)a3
{
  BOOL v4 = [(CNVisualIdentityPickerViewController *)self hasPendingChanges];
  id v6 = [(CNVisualIdentityPickerViewController *)self navigationItem];
  id v5 = [v6 rightBarButtonItem];
  [v5 setEnabled:v4];
}

- (void)updateDoneButtonEnabledState
{
}

- (void)updateInjectedItemsSectionForProviderItem:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNVisualIdentityPickerViewController *)self dataSource];
  uint64_t v6 = [v5 sectionIndexForProviderGroupType:4];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(CNVisualIdentityPickerViewController *)self dataSource];
    int v8 = [v7 injectedItemsGroup];
    [v8 removeAllAddedProviderItems];

    if (v4)
    {
      uint64_t v30 = v6;
      id v9 = [(CNVisualIdentityPickerViewController *)self dataSource];
      id v10 = [v9 variantsManager];
      id v31 = v4;
      uint64_t v11 = [v4 createVariantsItemsWithVariantsManager:v10];
      uint64_t v12 = objc_msgSend(v11, "_cn_reversed");

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id obj = v12;
      uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v36;
        uint64_t v16 = *MEMORY[0x1E4F5A2A0];
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v36 != v15) {
              objc_enumerationMutation(obj);
            }
            id v18 = *(id *)(*((void *)&v35 + 1) + 8 * i);
            uint64_t v19 = &unk_1ED9A0450;
            if ([v18 conformsToProtocol:v19]) {
              id v20 = v18;
            }
            else {
              id v20 = 0;
            }
            id v21 = v20;

            if (!v21) {
              goto LABEL_13;
            }
            uint64_t v22 = [v21 itemText];
            objc_msgSend(v22, "_cn_trimmedString");
            v24 = id v23 = self;
            int v25 = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v24);

            self = v23;
            if (v25) {
LABEL_13:
            }
              id v26 = [(CNVisualIdentityPickerViewController *)self insertNewItem:v18 toGroupType:4 updateActive:0];
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v14);
      }

      double v27 = [(CNVisualIdentityPickerViewController *)self dataSource];
      id v28 = [v27 injectedItemsGroup];
      char v29 = [v28 hasAddedProviderItems];

      if ((v29 & 1) == 0)
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __82__CNVisualIdentityPickerViewController_updateInjectedItemsSectionForProviderItem___block_invoke;
        v34[3] = &unk_1E5499220;
        v34[4] = self;
        v34[5] = v30;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v34];
      }

      id v4 = v31;
    }
    else
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __82__CNVisualIdentityPickerViewController_updateInjectedItemsSectionForProviderItem___block_invoke_2;
      v33[3] = &unk_1E5499220;
      v33[4] = self;
      v33[5] = v6;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v33];
    }
  }
}

void __82__CNVisualIdentityPickerViewController_updateInjectedItemsSectionForProviderItem___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) collectionView];
  id v2 = [MEMORY[0x1E4F28D60] indexSetWithIndex:*(void *)(a1 + 40)];
  [v3 reloadSections:v2];
}

void __82__CNVisualIdentityPickerViewController_updateInjectedItemsSectionForProviderItem___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) collectionView];
  id v2 = [MEMORY[0x1E4F28D60] indexSetWithIndex:*(void *)(a1 + 40)];
  [v3 reloadSections:v2];
}

- (void)updateVisualIdentityWithProviderItem:(id)a3
{
  id v5 = a3;
  id v4 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  if (v5) {
    [v5 updateVisualIdentity:v4];
  }
  else {
    [v4 clearImage];
  }

  [(CNVisualIdentityPickerViewController *)self updateHeaderViewAvatar];
  [(CNVisualIdentityPickerViewController *)self updateDoneButtonEnabledState];
}

- (BOOL)hasPendingChanges
{
  id v3 = [(CNVisualIdentityPickerViewController *)self visualIdentity];
  [v3 cropRect];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  uint64_t v12 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  [v12 cropRect];
  v41.origin.x = v13;
  v41.origin.y = v14;
  v41.size.width = v15;
  v41.size.height = v16;
  v40.origin.x = v5;
  v40.origin.y = v7;
  v40.size.width = v9;
  v40.size.height = v11;
  BOOL v17 = CGRectEqualToRect(v40, v41);

  id v18 = [(CNVisualIdentityPickerViewController *)self visualIdentity];
  uint64_t v19 = [v18 imageData];
  id v20 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  id v21 = [v20 imageData];

  uint64_t v22 = [(CNVisualIdentityPickerViewController *)self visualIdentity];
  id v23 = [v22 thumbnailImageData];
  id v24 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  int v25 = [v24 thumbnailImageData];

  id v26 = [(CNVisualIdentityPickerViewController *)self visualIdentity];
  double v27 = [v26 fullscreenImageData];
  id v28 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  char v29 = [v28 fullscreenImageData];

  BOOL v30 = 1;
  if (v17 && v19 == v21) {
    BOOL v30 = v23 != v25 || v27 != v29;
  }
  double v32 = [(CNVisualIdentityPickerViewController *)self visualIdentity];
  uint64_t v33 = [v32 name];
  if (!v33)
  {
    id v21 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
    id v23 = [v21 name];
    if (!v23)
    {
      LOBYTE(v38) = 0;
LABEL_14:

      goto LABEL_15;
    }
  }
  double v34 = [(CNVisualIdentityPickerViewController *)self visualIdentity];
  long long v35 = [v34 name];
  long long v36 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  long long v37 = [v36 name];
  int v38 = [v35 isEqual:v37] ^ 1;

  if (!v33) {
    goto LABEL_14;
  }
LABEL_15:

  return v30 | v38;
}

- (void)updateActiveIndexPath:(id)a3
{
}

- (void)updateActiveIndexPath:(id)a3 reload:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  double v6 = [(CNVisualIdentityPickerViewController *)self dataSource];
  CGFloat v7 = [v6 activePhotoIndexPath];
  char v8 = [v7 isEqual:v17];

  if ((v8 & 1) == 0)
  {
    CGFloat v9 = objc_opt_new();
    double v10 = [(CNVisualIdentityPickerViewController *)self dataSource];
    CGFloat v11 = [v10 activePhotoIndexPath];

    uint64_t v12 = [(CNVisualIdentityPickerViewController *)self dataSource];
    [v12 setActivePhotoIndexPath:v17];

    if (v17) {
      [v9 addObject:v17];
    }
    CGFloat v13 = [(CNVisualIdentityPickerViewController *)self dataSource];
    uint64_t v14 = objc_msgSend(v13, "numberOfItemsInSection:", objc_msgSend(v17, "section"));
    uint64_t v15 = [v11 row];

    if (v14 > v15 && v11) {
      [v9 addObject:v11];
    }
    if (v4)
    {
      CGFloat v16 = [(CNVisualIdentityPickerViewController *)self collectionView];
      [v16 reloadItemsAtIndexPaths:v9];
    }
  }
}

- (id)photoPickerNavigationControllerForRootController:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [[CNPhotoPickerNavigationViewController alloc] initWithRootViewController:v4];

  [(CNPhotoPickerNavigationViewController *)v5 setAllowRotation:[(CNVisualIdentityPickerViewController *)self allowRotation]];

  return v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CNVisualIdentityPickerViewController;
  -[CNVisualIdentityPickerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  CGFloat v5 = [(CNVisualIdentityPickerViewController *)self collectionView];
  double v6 = [v5 collectionViewLayout];
  [v6 invalidateLayout];
}

- (void)viewDidLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CNVisualIdentityPickerViewController;
  [(CNVisualIdentityPickerViewController *)&v19 viewDidLayoutSubviews];
  id v3 = [(CNVisualIdentityPickerViewController *)self collectionView];
  id v4 = [v3 collectionViewLayout];

  CGFloat v5 = objc_opt_class();
  double v6 = [(CNVisualIdentityPickerViewController *)self view];
  [v6 bounds];
  [v5 itemsPerRowForWidth:v7];
  double v9 = v8;

  double v10 = [(CNVisualIdentityPickerViewController *)self view];
  [v10 bounds];
  double v12 = (v11 + (v9 + 1.0) * -20.0) / v9;

  double v13 = fmin(v12, 90.0);
  objc_msgSend(v4, "setItemSize:", v13, v13);
  uint64_t v14 = [(CNVisualIdentityPickerViewController *)self collectionView];
  uint64_t v15 = [v14 collectionViewLayout];
  [v15 invalidateLayout];

  CGFloat v16 = [(CNVisualIdentityPickerViewController *)self dataSource];
  uint64_t v17 = [v16 itemsPerRow];

  id v18 = [(CNVisualIdentityPickerViewController *)self dataSource];
  [v18 setItemsPerRow:(unint64_t)v9 requiresFullReload:v9 != (double)v17];
}

- (void)initializeHeaderView
{
  id v3 = [CNPhotoPickerHeaderView alloc];
  id v6 = [(CNVisualIdentityPickerViewController *)self visualIdentity];
  id v4 = [(CNPhotoPickerHeaderView *)v3 initWithVisualIdentity:v6];
  headerView = self->_headerView;
  self->_headerView = v4;
}

- (void)buildHeaderView
{
  v24[3] = *MEMORY[0x1E4F143B8];
  [(CNVisualIdentityPickerViewController *)self initializeHeaderView];
  id v3 = [(CNVisualIdentityPickerViewController *)self headerView];
  [v3 setDelegate:self];

  id v4 = [(CNVisualIdentityPickerViewController *)self headerView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  CGFloat v5 = [(CNVisualIdentityPickerViewController *)self view];
  id v6 = [(CNVisualIdentityPickerViewController *)self headerView];
  [v5 addSubview:v6];

  id v23 = [(CNVisualIdentityPickerViewController *)self headerView];
  id v21 = [v23 topAnchor];
  uint64_t v22 = [(CNVisualIdentityPickerViewController *)self view];
  id v20 = [v22 safeAreaLayoutGuide];
  objc_super v19 = [v20 topAnchor];
  id v18 = [v21 constraintEqualToAnchor:v19];
  v24[0] = v18;
  uint64_t v17 = [(CNVisualIdentityPickerViewController *)self headerView];
  double v7 = [v17 leadingAnchor];
  double v8 = [(CNVisualIdentityPickerViewController *)self view];
  double v9 = [v8 leadingAnchor];
  double v10 = [v7 constraintEqualToAnchor:v9];
  v24[1] = v10;
  double v11 = [(CNVisualIdentityPickerViewController *)self headerView];
  double v12 = [v11 trailingAnchor];
  double v13 = [(CNVisualIdentityPickerViewController *)self view];
  uint64_t v14 = [v13 trailingAnchor];
  uint64_t v15 = [v12 constraintEqualToAnchor:v14];
  v24[2] = v15;
  CGFloat v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];

  [MEMORY[0x1E4F28DC8] activateConstraints:v16];
}

- (void)buildCollectionView
{
  v51[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v3 setScrollDirection:0];
  [v3 setSectionHeadersPinToVisibleBounds:1];
  [v3 setSectionInsetReference:1];
  objc_msgSend(v3, "setSectionInset:", 14.0, 20.0, 30.0, 20.0);
  v50 = v3;
  [v3 setSectionHeadersPinToVisibleBounds:0];
  id v4 = objc_alloc(MEMORY[0x1E4FB1568]);
  CGFloat v5 = [(CNVisualIdentityPickerViewController *)self view];
  [v5 bounds];
  id v6 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
  [(CNVisualIdentityPickerViewController *)self setCollectionView:v6];

  double v7 = [(CNVisualIdentityPickerViewController *)self collectionView];
  [v7 setDelegate:self];

  double v8 = [(CNVisualIdentityPickerViewController *)self collectionView];
  [v8 setDataSource:self];

  double v9 = [(CNVisualIdentityPickerViewController *)self collectionView];
  uint64_t v10 = objc_opt_class();
  double v11 = +[CNPhotoPickerCollectionViewCell cellIdentifier];
  [v9 registerClass:v10 forCellWithReuseIdentifier:v11];

  double v12 = [(CNVisualIdentityPickerViewController *)self collectionView];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = +[CNPhotoPickerCollectionViewCell cellIdentifier];
  uint64_t v15 = [v14 stringByAppendingFormat:@"-Add"];
  [v12 registerClass:v13 forCellWithReuseIdentifier:v15];

  CGFloat v16 = [(CNVisualIdentityPickerViewController *)self collectionView];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = *MEMORY[0x1E4FB2770];
  objc_super v19 = +[CNPhotoPickerSectionHeader reusableIdentifier];
  [v16 registerClass:v17 forSupplementaryViewOfKind:v18 withReuseIdentifier:v19];

  id v20 = [MEMORY[0x1E4FB1618] clearColor];
  id v21 = [(CNVisualIdentityPickerViewController *)self collectionView];
  [v21 setBackgroundColor:v20];

  uint64_t v22 = [(CNVisualIdentityPickerViewController *)self collectionView];
  [v22 setAlwaysBounceVertical:1];

  id v23 = [(CNVisualIdentityPickerViewController *)self collectionView];
  [v23 setContentInsetAdjustmentBehavior:2];

  id v24 = [(CNVisualIdentityPickerViewController *)self collectionView];
  objc_msgSend(v24, "setContentInset:", 0.0, 20.0, 0.0, 20.0);

  int v25 = [(CNVisualIdentityPickerViewController *)self collectionView];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v26 = [(CNVisualIdentityPickerViewController *)self view];
  double v27 = [(CNVisualIdentityPickerViewController *)self collectionView];
  id v28 = [(CNVisualIdentityPickerViewController *)self headerView];
  [v26 insertSubview:v27 below:v28];

  char v29 = [(CNVisualIdentityPickerViewController *)self headerView];
  v49 = [v29 bottomAnchor];

  v48 = [(CNVisualIdentityPickerViewController *)self collectionView];
  double v47 = [v48 topAnchor];
  double v46 = [v47 constraintEqualToAnchor:v49];
  v51[0] = v46;
  double v45 = [(CNVisualIdentityPickerViewController *)self collectionView];
  double v43 = [v45 leadingAnchor];
  double v44 = [(CNVisualIdentityPickerViewController *)self view];
  double v42 = [v44 leadingAnchor];
  CGRect v41 = [v43 constraintEqualToAnchor:v42];
  v51[1] = v41;
  CGRect v40 = [(CNVisualIdentityPickerViewController *)self collectionView];
  BOOL v30 = [v40 trailingAnchor];
  id v31 = [(CNVisualIdentityPickerViewController *)self view];
  double v32 = [v31 trailingAnchor];
  uint64_t v33 = [v30 constraintEqualToAnchor:v32];
  v51[2] = v33;
  double v34 = [(CNVisualIdentityPickerViewController *)self collectionView];
  long long v35 = [v34 bottomAnchor];
  long long v36 = [(CNVisualIdentityPickerViewController *)self view];
  long long v37 = [v36 bottomAnchor];
  int v38 = [v35 constraintEqualToAnchor:v37];
  v51[3] = v38;
  double v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v39];
}

- (double)collectionViewPaddingForCatalyst
{
  id v3 = objc_opt_class();
  id v4 = [(CNVisualIdentityPickerViewController *)self view];
  [v4 bounds];
  [v3 itemsPerRowForWidth:v5];
  double v7 = v6;

  double v8 = [(CNVisualIdentityPickerViewController *)self view];
  [v8 bounds];
  double v10 = (v9 - ((v7 + -1.0) * 16.0 + v7 * 48.0 + 1.0)) * 0.5;

  return v10;
}

- (double)textFieldFontSize
{
  return 50.0;
}

- (void)updateVisualIdentityWithProposedImageData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v19 = v4;
    double v5 = [MEMORY[0x1E4FB1818] imageWithData:v4];
    double v6 = v5;
    if (v5)
    {
      [v5 size];
      if (v8 != *MEMORY[0x1E4F1DB30] || v7 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        double v10 = (void *)MEMORY[0x1E4F5A420];
        [v6 size];
        double v12 = v11;
        [v6 size];
        objc_msgSend(v10, "centeredSquareCropRectInRect:", 0.0, 0.0, v12, v13);
        uint64_t v18 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:]([CNPhotoPickerProviderItem alloc], "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v19, 0, 0, v14, v15, v16, v17);
        [(CNVisualIdentityPickerViewController *)self updateVisualIdentityWithProviderItem:v18];
      }
    }

    id v4 = v19;
  }
}

- (void)done:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  [(CNVisualIdentityPickerViewController *)self setShouldUpdateEmojiSuggestions:0];
  id v4 = [(CNVisualIdentityPickerViewController *)self headerView];
  [v4 resignFirstResponder];

  double v5 = [(CNVisualIdentityPickerViewController *)self contactImageForCurrentActiveItem];
  double v6 = [(CNVisualIdentityPickerViewController *)self delegate];
  double v7 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  [v6 visualIdentityPicker:self didUpdatePhotoForVisualIdentity:v7 withContactImage:v5];

  double v8 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
    [v9 cropRect];
    uint64_t v11 = v10;
    double v12 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
    [v12 cropRect];
    uint64_t v14 = v13;
    double v15 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
    [v15 cropRect];
    uint64_t v17 = v16;
    uint64_t v18 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
    [v18 cropRect];
    uint64_t v20 = v19;
    id v21 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
    uint64_t v22 = [v21 avatarImage];
    [v22 size];
    uint64_t v24 = v23;
    int v25 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
    id v26 = [v25 avatarImage];
    [v26 size];
    int v28 = 134219264;
    uint64_t v29 = v11;
    __int16 v30 = 2048;
    uint64_t v31 = v14;
    __int16 v32 = 2048;
    uint64_t v33 = v17;
    __int16 v34 = 2048;
    uint64_t v35 = v20;
    __int16 v36 = 2048;
    uint64_t v37 = v24;
    __int16 v38 = 2048;
    uint64_t v39 = v27;
    _os_log_impl(&dword_18B625000, v8, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Updated likeness selected with cropRect {%.2f, %.2f, %.2f, %.2f}, image size {%.2f, %.2f}", (uint8_t *)&v28, 0x3Eu);
  }
}

- (void)cancel:(id)a3
{
  id v4 = [(CNVisualIdentityPickerViewController *)self delegate];
  [v4 visualIdentityPickerDidCancel:self];
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)CNVisualIdentityPickerViewController;
  [(CNVisualIdentityPickerViewController *)&v38 viewDidLoad];
  [(CNVisualIdentityPickerViewController *)self buildHeaderView];
  [(CNVisualIdentityPickerViewController *)self buildCollectionView];
  [(id)objc_opt_class() defaultItemSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 scale];
  double v9 = v8;

  uint64_t v10 = [(CNVisualIdentityPickerViewController *)self view];
  BOOL v11 = [v10 effectiveUserInterfaceLayoutDirection] == 1;

  double v12 = objc_opt_class();
  uint64_t v13 = [(CNVisualIdentityPickerViewController *)self view];
  [v13 bounds];
  [v12 itemsPerRowForWidth:v14];
  double v16 = v15;

  uint64_t v17 = [(CNVisualIdentityPickerViewController *)self dataSource];
  objc_msgSend(v17, "loadProviderGroupsItemsForSize:itemsPerRow:scale:RTL:", v11, v4, v6, v16, v9);

  uint64_t v18 = [(CNVisualIdentityPickerViewController *)self contactStyle];
  uint64_t v19 = [v18 backgroundColor];

  if (v19)
  {
    uint64_t v20 = [(CNVisualIdentityPickerViewController *)self contactStyle];
    id v21 = [v20 backgroundColor];
    uint64_t v22 = [(CNVisualIdentityPickerViewController *)self view];
    [v22 setBackgroundColor:v21];
  }
  else
  {
    uint64_t v20 = +[CNUIColorRepository photoPickerBackgroundColor];
    id v21 = [(CNVisualIdentityPickerViewController *)self view];
    [v21 setBackgroundColor:v20];
  }

  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_confirmCancelAction];
  uint64_t v24 = [(CNVisualIdentityPickerViewController *)self navigationItem];
  [v24 setLeftBarButtonItem:v23];

  int v25 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_done_];
  id v26 = [(CNVisualIdentityPickerViewController *)self navigationItem];
  [v26 setRightBarButtonItem:v25];

  uint64_t v27 = [(CNVisualIdentityPickerViewController *)self navigationItem];
  int v28 = [v27 rightBarButtonItem];
  [v28 setEnabled:0];

  uint64_t v29 = [(CNVisualIdentityPickerViewController *)self navigationItem];
  [v29 setLargeTitleDisplayMode:2];

  __int16 v30 = [(CNVisualIdentityPickerViewController *)self navigationController];
  uint64_t v31 = [v30 presentationController];
  [(id)v31 setDelegate:self];

  __int16 v32 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel_confirmCancelAction];
  [(CNVisualIdentityPickerViewController *)self addKeyCommand:v32];

  uint64_t v33 = [(CNVisualIdentityPickerViewController *)self navigationItem];
  [v33 _setBackgroundHidden:1];

  __int16 v34 = [(CNVisualIdentityPickerViewController *)self navigationController];
  uint64_t v35 = [v34 navigationBar];
  LOBYTE(v31) = [v35 isTranslucent];

  if ((v31 & 1) == 0) {
    [(CNVisualIdentityPickerViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
  }
  [(CNVisualIdentityPickerViewController *)self setShouldUpdateEmojiSuggestions:1];
  __int16 v36 = [(CNVisualIdentityPickerViewController *)self proposedImageData];

  if (v36)
  {
    uint64_t v37 = [(CNVisualIdentityPickerViewController *)self proposedImageData];
    [(CNVisualIdentityPickerViewController *)self updateVisualIdentityWithProposedImageData:v37];
  }
}

- (CNVisualIdentity)pendingVisualIdentity
{
  pendingVisualIdentity = self->_pendingVisualIdentity;
  if (!pendingVisualIdentity)
  {
    double v4 = [(CNVisualIdentityPickerViewController *)self visualIdentity];
    double v5 = (CNVisualIdentity *)[v4 mutableCopy];
    double v6 = self->_pendingVisualIdentity;
    self->_pendingVisualIdentity = v5;

    pendingVisualIdentity = self->_pendingVisualIdentity;
  }

  return pendingVisualIdentity;
}

- (id)visualIdentity
{
  id v2 = [(CNVisualIdentityPickerViewController *)self dataSource];
  double v3 = [v2 visualIdentity];

  return v3;
}

- (void)setPresenterDelegate:(id)a3
{
  p_presenterDelegate = &self->_presenterDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_presenterDelegate, v5);
  [(CNVisualIdentityImagePickerController *)self->_imagePickerController setPresenterDelegate:v5];
}

- (CNVisualIdentityPickerViewController)initWithPhotosDataSource:(id)a3 style:(id)a4 allowRotation:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CNVisualIdentityPickerViewController;
  BOOL v11 = [(CNVisualIdentityPickerViewController *)&v23 initWithNibName:0 bundle:0];
  double v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataSource, a3);
    [(CNPhotoPickerDataSource *)v12->_dataSource setDelegate:v12];
    objc_storeStrong((id *)&v12->_contactStyle, a4);
    v12->_allowRotation = a5;
    pendingInjectedSuggestionItems = v12->_pendingInjectedSuggestionItems;
    v12->_pendingInjectedSuggestionItems = (NSArray *)MEMORY[0x1E4F1CBF0];

    double v14 = [[CNVisualIdentityImagePickerController alloc] initWithContactStyle:v10];
    imagePickerController = v12->_imagePickerController;
    v12->_imagePickerController = v14;

    double v16 = [MEMORY[0x1E4F5A6D8] unifiedMeContactMonitor];
    uint64_t v17 = [v9 visualIdentity];
    uint64_t v18 = [v17 contacts];
    uint64_t v19 = [v18 firstObject];
    -[CNVisualIdentityImagePickerController setIsMeContact:](v12->_imagePickerController, "setIsMeContact:", [v16 isMeContact:v19]);

    [(CNVisualIdentityImagePickerController *)v12->_imagePickerController setDelegate:v12];
    uint64_t v20 = [(CNVisualIdentityPickerViewController *)v12 presenterDelegate];
    [(CNVisualIdentityImagePickerController *)v12->_imagePickerController setPresenterDelegate:v20];

    id v21 = v12;
  }

  return v12;
}

+ (id)imagePickerForVisualIdentity:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CNContactViewCache);
  double v6 = +[CNPhotoPickerConfiguration defaultConfiguration];
  double v7 = [[CNPhotoPickerDataSource alloc] initWithVisualIdentity:v4 contactViewCache:v5 photoPickerConfiguration:v6];

  id v8 = objc_alloc((Class)a1);
  id v9 = +[CNContactStyle currentStyle];
  id v10 = objc_msgSend(v8, "initWithPhotosDataSource:style:allowRotation:", v7, v9, objc_msgSend(v6, "allowRotation"));

  return v10;
}

+ (id)imagePickerForGroupIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [[CNVisualIdentity alloc] initWithGroupIdentity:v4];
  double v6 = [a1 imagePickerForVisualIdentity:v5];
  uint64_t v7 = [v4 numberOfContacts];

  id v8 = CNContactsUIBundle();
  id v9 = v8;
  if (v7 >= 2) {
    id v10 = @"PHOTO_ACTION_SELECT_GROUP";
  }
  else {
    id v10 = @"PHOTO_ACTION_SELECT_CONTACT";
  }
  BOOL v11 = [v8 localizedStringForKey:v10 value:&stru_1ED8AC728 table:@"Localized"];
  [v6 setAssignActionTitleOverride:v11];

  return v6;
}

+ (id)imagePickerForContact:(id)a3
{
  id v4 = a3;
  id v5 = [[CNVisualIdentity alloc] initWithContact:v4];

  double v6 = [a1 imagePickerForVisualIdentity:v5];

  return v6;
}

+ (BOOL)canShowAvatarEditor
{
  return +[CNPhotoPickerCapabilities allowsAvatarUI];
}

+ (double)itemsPerRowForWidth:(double)a3
{
  BOOL v3 = a3 <= 460.0;
  double result = 4.0;
  if (!v3) {
    return 6.0;
  }
  return result;
}

+ (id)navigationControllerForPicker:(id)a3
{
  id v3 = a3;
  id v4 = [[CNPhotoPickerNavigationViewController alloc] initWithRootViewController:v3];
  uint64_t v5 = [v3 allowRotation];

  [(CNPhotoPickerNavigationViewController *)v4 setAllowRotation:v5];

  return v4;
}

+ (CGSize)defaultItemSize
{
  double v2 = 212.0;
  double v3 = 212.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)defaultContentSize
{
  double v2 = 624.0;
  double v3 = 746.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)canShowPhotoPickerForView:(id)a3 withTraitCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 window];

  if (v7)
  {
    id v8 = [v5 window];
    id v9 = [v8 windowScene];
    uint64_t v10 = [v9 interfaceOrientation];
  }
  else
  {
    [v5 bounds];
    double v12 = v11;
    [v5 bounds];
    if (v12 <= v13) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 3;
    }
  }
  [v5 bounds];
  if (v14 >= 320.0)
  {
    [v5 bounds];
    BOOL v15 = v16 < 454.4;
  }
  else
  {
    BOOL v15 = 1;
  }
  uint64_t v17 = [v6 userInterfaceIdiom];
  char v18 = (unint64_t)(v10 - 3) < 2 || v15;
  if (v17) {
    char v18 = v15;
  }
  char v19 = v18 ^ 1;

  return v19;
}

+ (id)log
{
  if (log_cn_once_token_20 != -1) {
    dispatch_once(&log_cn_once_token_20, &__block_literal_global_33394);
  }
  double v2 = (void *)log_cn_once_object_20;

  return v2;
}

void __43__CNVisualIdentityPickerViewController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNVisualIdentityPicker");
  uint64_t v1 = (void *)log_cn_once_object_20;
  log_cn_once_object_20 = (uint64_t)v0;
}

@end