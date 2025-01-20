@interface CNSharingProfileOnboardingPhotoSelectionViewController
+ (id)descriptorForRequiredKeys;
- (AVTAvatarRecord)avatarRecord;
- (CNContact)contact;
- (CNMutableContact)photoProviderContact;
- (CNPhotoPickerViewController)photoPickerViewController;
- (CNSharingProfileAvatarItemProviderConfiguration)avatarItemProviderConfiguration;
- (CNSharingProfileLogger)logger;
- (CNSharingProfileOnboardingPhotoSelectionViewController)initWithContact:(id)a3 avatarRecord:(id)a4 avatarItemProviderConfiguration:(id)a5;
- (CNSharingProfileOnboardingPhotoSelectionViewControllerDelegate)delegate;
- (CNSharingProfilePhotoPickerViewController)sharingPhotoPickerViewController;
- (OBBoldTrayButton)backButton;
- (OBBoldTrayButton)confirmButton;
- (OBLinkTrayButton)setupLaterButton;
- (id)contentView;
- (void)didTapBackButton:(id)a3;
- (void)didTapDoneButton:(id)a3;
- (void)didTapSetupLaterButton:(id)a3;
- (void)loadView;
- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5;
- (void)photoPickerDidCancel:(id)a3;
- (void)setAvatarItemProviderConfiguration:(id)a3;
- (void)setAvatarRecord:(id)a3;
- (void)setBackButton:(id)a3;
- (void)setConfirmButton:(id)a3;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLogger:(id)a3;
- (void)setPhotoPickerViewController:(id)a3;
- (void)setPhotoProviderContact:(id)a3;
- (void)setSetupLaterButton:(id)a3;
- (void)setSharingPhotoPickerViewController:(id)a3;
- (void)sharingPhotoPickerDidSelectAddItem:(id)a3;
- (void)updateForContentSizeCategoryChange;
@end

@implementation CNSharingProfileOnboardingPhotoSelectionViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoProviderContact, 0);
  objc_storeStrong((id *)&self->_photoPickerViewController, 0);
  objc_storeStrong((id *)&self->_sharingPhotoPickerViewController, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_setupLaterButton, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_avatarItemProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setPhotoProviderContact:(id)a3
{
}

- (CNMutableContact)photoProviderContact
{
  return self->_photoProviderContact;
}

- (void)setPhotoPickerViewController:(id)a3
{
}

- (CNPhotoPickerViewController)photoPickerViewController
{
  return self->_photoPickerViewController;
}

- (void)setSharingPhotoPickerViewController:(id)a3
{
}

- (CNSharingProfilePhotoPickerViewController)sharingPhotoPickerViewController
{
  return self->_sharingPhotoPickerViewController;
}

- (void)setConfirmButton:(id)a3
{
}

- (OBBoldTrayButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setBackButton:(id)a3
{
}

- (OBBoldTrayButton)backButton
{
  return self->_backButton;
}

- (void)setSetupLaterButton:(id)a3
{
}

- (OBLinkTrayButton)setupLaterButton
{
  return self->_setupLaterButton;
}

- (void)setLogger:(id)a3
{
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (void)setAvatarItemProviderConfiguration:(id)a3
{
}

- (CNSharingProfileAvatarItemProviderConfiguration)avatarItemProviderConfiguration
{
  return self->_avatarItemProviderConfiguration;
}

- (void)setAvatarRecord:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNSharingProfileOnboardingPhotoSelectionViewControllerDelegate *)a3;
}

- (CNSharingProfileOnboardingPhotoSelectionViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  objc_storeStrong((id *)&self->_photoProviderContact, a4);
  if ([v8 source] == 1)
  {
    v9 = [v8 variant];

    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F89D48]);
      v11 = [v8 variant];
      v12 = (void *)[v10 initWithColorName:v11];
      [(CNSharingProfilePhotoPickerViewController *)self->_sharingPhotoPickerViewController setMonogramColor:v12];
    }
  }
  v13 = [v15 memojiMetadata];
  [(CNSharingProfilePhotoPickerViewController *)self->_sharingPhotoPickerViewController setMemojiMetadata:v13];

  [(CNSharingProfilePhotoPickerViewController *)self->_sharingPhotoPickerViewController updateWithContact:self->_photoProviderContact fromFullPhotoPicker:1];
  v14 = [(CNSharingProfileOnboardingPhotoSelectionViewController *)self presentedViewController];
  [v14 dismissViewControllerAnimated:1 completion:0];
}

- (void)photoPickerDidCancel:(id)a3
{
  id v3 = [(CNSharingProfileOnboardingPhotoSelectionViewController *)self presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)sharingPhotoPickerDidSelectAddItem:(id)a3
{
  v4 = [CNPhotoPickerViewController alloc];
  photoProviderContact = self->_photoProviderContact;
  v6 = +[CNContactStyle defaultStyle];
  v7 = +[CNPhotoPickerConfiguration contactsConfiguration];
  id v8 = [(CNPhotoPickerViewController *)v4 initWithContact:photoProviderContact style:v6 configuration:v7];

  [(CNPhotoPickerViewController *)v8 setDelegate:self];
  v9 = CNContactsUIBundle();
  id v10 = [v9 localizedStringForKey:@"SHARING_PHOTOPICKER_ASSIGN_TITLE_OVERRIDE" value:&stru_1ED8AC728 table:@"Localized"];
  [(CNVisualIdentityPickerViewController *)v8 setAssignActionTitleOverride:v10];

  +[CNVisualIdentityPickerViewController defaultContentSize];
  -[CNPhotoPickerViewController setPreferredContentSize:](v8, "setPreferredContentSize:");
  photoPickerViewController = self->_photoPickerViewController;
  self->_photoPickerViewController = v8;
  v12 = v8;

  v13 = [(CNSharingProfileOnboardingPhotoSelectionViewController *)self view];
  v14 = [v13 window];
  [v14 endEditing:1];

  id v19 = +[CNPhotoPickerViewController navigationControllerForPicker:v12];
  [v19 setModalPresentationStyle:2];
  +[CNVisualIdentityPickerViewController defaultContentSize];
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(v19, "setPreferredContentSize:", v16, v18);
  [(CNSharingProfileOnboardingPhotoSelectionViewController *)self presentViewController:v19 animated:1 completion:0];
}

- (void)didTapDoneButton:(id)a3
{
  id v14 = [(CNSharingProfilePhotoPickerViewController *)self->_sharingPhotoPickerViewController selectedItem];
  v4 = objc_alloc_init(CNSharingProfileOnboardingPhotoSelectionResult);
  v5 = objc_msgSend(v14, "originalImageWithSize:", 500.0, 500.0);
  [(CNSharingProfileOnboardingPhotoSelectionResult *)v4 setOriginalImage:v5];

  v6 = objc_msgSend(v14, "compositeImageWithSize:", 500.0, 500.0);
  [(CNSharingProfileOnboardingPhotoSelectionResult *)v4 setCompositedImage:v6];

  v7 = [v14 avatarItem];
  -[CNSharingProfileOnboardingPhotoSelectionResult setAvatarType:](v4, "setAvatarType:", [v7 type]);

  id v8 = [v14 avatarItem];
  v9 = [v8 variantIdentifier];
  [(CNSharingProfileOnboardingPhotoSelectionResult *)v4 setVariantName:v9];

  id v10 = [v14 avatarItem];
  -[CNSharingProfileOnboardingPhotoSelectionResult setWasSelectedInFullPhotoPicker:](v4, "setWasSelectedInFullPhotoPicker:", [v10 wasSetFromFullPhotoPicker]);

  v11 = [v14 avatarItem];
  v12 = [v11 memojiMetadata];
  [(CNSharingProfileOnboardingPhotoSelectionResult *)v4 setMemojiMetadata:v12];

  v13 = [(CNSharingProfileOnboardingPhotoSelectionViewController *)self delegate];
  [v13 photoSelectionViewControllerDidFinishWithResult:v4];
}

- (void)didTapBackButton:(id)a3
{
  id v3 = [(CNSharingProfileOnboardingPhotoSelectionViewController *)self delegate];
  [v3 photoSelectionViewControllerDidFinishWithResult:0];
}

- (void)didTapSetupLaterButton:(id)a3
{
  v4 = [(CNSharingProfileOnboardingPhotoSelectionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNSharingProfileOnboardingPhotoSelectionViewController *)self delegate];
    [v6 photoSelectionViewControllerDidTapSetupLater:self];
  }
}

- (void)updateForContentSizeCategoryChange
{
  id v2 = [(CNSharingProfileOnboardingPhotoSelectionViewController *)self view];
  [v2 setNeedsLayout];
}

- (void)loadView
{
  v10.receiver = self;
  v10.super_class = (Class)CNSharingProfileOnboardingPhotoSelectionViewController;
  [(OBBaseWelcomeController *)&v10 loadView];
  id v3 = objc_alloc_init(CNOnboardingBoldButtonProvider);
  v4 = [(CNOnboardingBoldButtonProvider *)v3 boldButton];
  confirmButton = self->_confirmButton;
  self->_confirmButton = v4;

  id v6 = self->_confirmButton;
  v7 = CNContactsUIBundle();
  id v8 = [v7 localizedStringForKey:@"SHARING_CONTINUE" value:&stru_1ED8AC728 table:@"Localized"];
  [(OBBoldTrayButton *)v6 setTitle:v8 forState:0];

  [(OBBoldTrayButton *)self->_confirmButton addTarget:self action:sel_didTapDoneButton_ forControlEvents:64];
  v9 = [(CNSharingProfileOnboardingPhotoSelectionViewController *)self buttonTray];
  [v9 addButton:self->_confirmButton];
}

- (id)contentView
{
  return (id)[(CNSharingProfilePhotoPickerViewController *)self->_sharingPhotoPickerViewController view];
}

- (CNSharingProfileOnboardingPhotoSelectionViewController)initWithContact:(id)a3 avatarRecord:(id)a4 avatarItemProviderConfiguration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = CNContactsUIBundle();
  v13 = [v12 localizedStringForKey:@"SHARING_CHOOSE_YOUR_PHOTO_TO_SHARE" value:&stru_1ED8AC728 table:@"Localized"];
  v24.receiver = self;
  v24.super_class = (Class)CNSharingProfileOnboardingPhotoSelectionViewController;
  id v14 = [(CNSharingProfileOnboardingPhotoSelectionViewController *)&v24 initWithTitle:v13 detailText:0 icon:0];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_contact, a3);
    uint64_t v15 = [v9 mutableCopy];
    photoProviderContact = v14->_photoProviderContact;
    v14->_photoProviderContact = (CNMutableContact *)v15;

    objc_storeStrong((id *)&v14->_avatarRecord, a4);
    objc_storeStrong((id *)&v14->_avatarItemProviderConfiguration, a5);
    double v17 = objc_alloc_init(CNSharingProfileLogger);
    logger = v14->_logger;
    v14->_logger = v17;

    id v19 = [[CNSharingProfilePhotoPickerViewController alloc] initWithContact:v14->_photoProviderContact avatarRecord:v14->_avatarRecord avatarItemProviderConfiguration:v14->_avatarItemProviderConfiguration logger:v14->_logger];
    sharingPhotoPickerViewController = v14->_sharingPhotoPickerViewController;
    v14->_sharingPhotoPickerViewController = v19;

    v21 = [(CNSharingProfilePhotoPickerViewController *)v14->_sharingPhotoPickerViewController view];
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(CNSharingProfilePhotoPickerViewController *)v14->_sharingPhotoPickerViewController setDelegate:v14];
    [(CNSharingProfilePhotoPickerViewController *)v14->_sharingPhotoPickerViewController willMoveToParentViewController:v14];
    [(CNSharingProfileOnboardingPhotoSelectionViewController *)v14 addChildViewController:v14->_sharingPhotoPickerViewController];
    v22 = v14;
  }

  return v14;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_46229 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_46229, &__block_literal_global_46230);
  }
  id v2 = (void *)descriptorForRequiredKeys_cn_once_object_1_46231;

  return v2;
}

void __83__CNSharingProfileOnboardingPhotoSelectionViewController_descriptorForRequiredKeys__block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v0 = +[CNVisualIdentityPickerViewController descriptorForRequiredKeys];
  uint64_t v1 = *MEMORY[0x1E4F1AE28];
  v8[0] = v0;
  v8[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADE8];
  v8[2] = *MEMORY[0x1E4F1AF98];
  v8[3] = v2;
  v8[4] = *MEMORY[0x1E4F1AE20];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];

  v4 = (void *)MEMORY[0x1E4F1B8F8];
  char v5 = [NSString stringWithUTF8String:"+[CNSharingProfileOnboardingPhotoSelectionViewController descriptorForRequiredKeys]_block_invoke"];
  uint64_t v6 = [v4 descriptorWithKeyDescriptors:v3 description:v5];

  v7 = (void *)descriptorForRequiredKeys_cn_once_object_1_46231;
  descriptorForRequiredKeys_cn_once_object_1_46231 = v6;
}

@end