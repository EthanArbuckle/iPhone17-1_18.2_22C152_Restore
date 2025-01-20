@interface CNMeCardSharingOnboardingEditViewController
+ (id)descriptorForRequiredKeys;
+ (id)headerText;
- (AVTAvatarRecord)avatarRecord;
- (BOOL)delegateDoesRespondToOnboardingResultSelector;
- (BOOL)shouldSetAsMeContact;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CNAvatarEditingManager)posePicker;
- (CNContact)contact;
- (CNContactStore)contactStore;
- (CNMeCardSharingNameProvider)nameProvider;
- (CNMeCardSharingOnboardingAvatarCarouselViewController)avatarCarouselViewController;
- (CNMeCardSharingOnboardingEditViewController)initWithContactStore:(id)a3 contact:(id)a4 nameProvider:(id)a5 avatarRecord:(id)a6;
- (CNMeCardSharingOnboardingEditViewControllerDelegate)delegate;
- (CNMeCardSharingOnboardingHeaderViewController)headerViewController;
- (CNMeCardSharingPickerLayoutAttributes)layoutAttributes;
- (CNMutableContact)avatarCarouselEditingContact;
- (CNMutableContact)editingContact;
- (CNPhotoPickerVariantsManager)variantsManager;
- (CNPhotoPickerViewController)photoPickerViewController;
- (CNSharingProfileLogger)logger;
- (NSString)editingFamilyName;
- (NSString)editingGivenName;
- (UITextField)familyNameField;
- (UITextField)givenNameField;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)confirmButtonTitle;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)textFieldForIndex:(int64_t)a3;
- (int64_t)contactImageSourceForType:(unint64_t)a3;
- (int64_t)nameOrder;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)adjustInsetsForKeyboardOverlap:(double)a3;
- (void)avatarCarouselViewControllerDidTapPhotoPickerCell:(id)a3;
- (void)avatarCarouselViewControllerDidUpdateCenterMostItem:(id)a3;
- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4;
- (void)dealloc;
- (void)familyNameDidChange:(id)a3;
- (void)finishOnboardingWithDidSaveToMeContact:(BOOL)a3;
- (void)finishOnboardingWithProviderItem:(id)a3;
- (void)givenNameDidChange:(id)a3;
- (void)handleConfirmButtonTapped;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)notifyDelegateWithContactImage:(id)a3 didSaveToMeContact:(BOOL)a4;
- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5;
- (void)photoPickerDidCancel:(id)a3;
- (void)photoPickerVariantListController:(id)a3 didSelectProviderItem:(id)a4;
- (void)photoPickerVariantListControllerDidCancel:(id)a3;
- (void)presentErrorAlertForEmptyPhotoIfNeededWithCompletion:(id)a3;
- (void)presentPhotoPickerVariantListForItem:(id)a3 FromViewController:(id)a4;
- (void)promptForSavingToMeCard;
- (void)saveDraftContact;
- (void)setAvatarCarouselEditingContact:(id)a3;
- (void)setAvatarCarouselViewController:(id)a3;
- (void)setAvatarRecord:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateDoesRespondToOnboardingResultSelector:(BOOL)a3;
- (void)setEditingContact:(id)a3;
- (void)setEditingFamilyName:(id)a3;
- (void)setEditingGivenName:(id)a3;
- (void)setFamilyNameField:(id)a3;
- (void)setGivenNameField:(id)a3;
- (void)setHeaderViewController:(id)a3;
- (void)setLayoutAttributes:(id)a3;
- (void)setNameOrder:(int64_t)a3;
- (void)setNameProvider:(id)a3;
- (void)setPhotoPickerViewController:(id)a3;
- (void)setPosePicker:(id)a3;
- (void)setShouldSetAsMeContact:(BOOL)a3;
- (void)setVariantsManager:(id)a3;
- (void)showAvatarPosePickerFromItem:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateAvatarCarouselContactName;
- (void)updateContact:(id)a3 withImagePropertiesFromContact:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CNMeCardSharingOnboardingEditViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_posePicker, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_photoPickerViewController, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_avatarCarouselViewController, 0);
  objc_storeStrong((id *)&self->_nameProvider, 0);
  objc_storeStrong((id *)&self->_editingFamilyName, 0);
  objc_storeStrong((id *)&self->_editingGivenName, 0);
  objc_storeStrong((id *)&self->_avatarCarouselEditingContact, 0);
  objc_storeStrong((id *)&self->_editingContact, 0);
  objc_storeStrong((id *)&self->_familyNameField, 0);
  objc_storeStrong((id *)&self->_givenNameField, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (void)setPosePicker:(id)a3
{
}

- (CNAvatarEditingManager)posePicker
{
  return self->_posePicker;
}

- (void)setVariantsManager:(id)a3
{
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setPhotoPickerViewController:(id)a3
{
}

- (CNPhotoPickerViewController)photoPickerViewController
{
  return self->_photoPickerViewController;
}

- (void)setHeaderViewController:(id)a3
{
}

- (CNMeCardSharingOnboardingHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setAvatarCarouselViewController:(id)a3
{
}

- (CNMeCardSharingOnboardingAvatarCarouselViewController)avatarCarouselViewController
{
  return self->_avatarCarouselViewController;
}

- (void)setNameProvider:(id)a3
{
}

- (CNMeCardSharingNameProvider)nameProvider
{
  return self->_nameProvider;
}

- (void)setEditingFamilyName:(id)a3
{
}

- (NSString)editingFamilyName
{
  return self->_editingFamilyName;
}

- (void)setEditingGivenName:(id)a3
{
}

- (NSString)editingGivenName
{
  return self->_editingGivenName;
}

- (void)setAvatarCarouselEditingContact:(id)a3
{
}

- (CNMutableContact)avatarCarouselEditingContact
{
  return self->_avatarCarouselEditingContact;
}

- (void)setEditingContact:(id)a3
{
}

- (CNMutableContact)editingContact
{
  return self->_editingContact;
}

- (void)setShouldSetAsMeContact:(BOOL)a3
{
  self->_shouldSetAsMeContact = a3;
}

- (BOOL)shouldSetAsMeContact
{
  return self->_shouldSetAsMeContact;
}

- (void)setFamilyNameField:(id)a3
{
}

- (UITextField)familyNameField
{
  return self->_familyNameField;
}

- (void)setGivenNameField:(id)a3
{
}

- (UITextField)givenNameField
{
  return self->_givenNameField;
}

- (void)setNameOrder:(int64_t)a3
{
  self->_nameOrder = a3;
}

- (int64_t)nameOrder
{
  return self->_nameOrder;
}

- (void)setLayoutAttributes:(id)a3
{
}

- (CNMeCardSharingPickerLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setAvatarRecord:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setDelegateDoesRespondToOnboardingResultSelector:(BOOL)a3
{
  self->_delegateDoesRespondToOnboardingResultSelector = a3;
}

- (BOOL)delegateDoesRespondToOnboardingResultSelector
{
  return self->_delegateDoesRespondToOnboardingResultSelector;
}

- (void)setDelegate:(id)a3
{
}

- (CNMeCardSharingOnboardingEditViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNMeCardSharingOnboardingEditViewControllerDelegate *)WeakRetained;
}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    [(CNMeCardSharingOnboardingEditViewController *)self updateContact:self->_editingContact withImagePropertiesFromContact:v8];
    [(CNMeCardSharingOnboardingEditViewController *)self updateContact:self->_avatarCarouselEditingContact withImagePropertiesFromContact:v8];
  }
  if ([v9 source] == 1 || !objc_msgSend(v9, "source"))
  {
    v10 = [v9 variant];

    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F89D48]);
      v12 = [v9 variant];
      v13 = (void *)[v11 initWithColorName:v12];
      [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self->_avatarCarouselViewController setMonogramColor:v13];
    }
    else
    {
      [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self->_avatarCarouselViewController setMonogramColor:0];
    }
  }
  [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self->_avatarCarouselViewController reloadForUpdatedContactPhoto];
  v14 = [(CNMeCardSharingOnboardingEditViewController *)self presentedViewController];
  [v14 dismissViewControllerAnimated:1 completion:0];
}

- (void)photoPickerDidCancel:(id)a3
{
  id v3 = [(CNMeCardSharingOnboardingEditViewController *)self presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)avatarCarouselViewControllerDidUpdateCenterMostItem:(id)a3
{
  id v5 = [a3 imageProvider];
  v4 = [(CNMeCardSharingOnboardingViewController *)self confirmButton];
  [v4 setEnabled:v5 != 0];
}

- (void)avatarCarouselViewControllerDidTapPhotoPickerCell:(id)a3
{
  v4 = [CNPhotoPickerViewController alloc];
  avatarCarouselEditingContact = self->_avatarCarouselEditingContact;
  v6 = +[CNContactStyle defaultStyle];
  v7 = +[CNPhotoPickerConfiguration contactsConfiguration];
  id v8 = [(CNPhotoPickerViewController *)v4 initWithContact:avatarCarouselEditingContact style:v6 configuration:v7];

  [(CNPhotoPickerViewController *)v8 setDelegate:self];
  id v9 = CNContactsUIBundle();
  v10 = [v9 localizedStringForKey:@"SHARING_PHOTOPICKER_ASSIGN_TITLE_OVERRIDE" value:&stru_1ED8AC728 table:@"Localized"];
  [(CNVisualIdentityPickerViewController *)v8 setAssignActionTitleOverride:v10];

  photoPickerViewController = self->_photoPickerViewController;
  self->_photoPickerViewController = v8;
  v12 = v8;

  v13 = [(CNMeCardSharingOnboardingEditViewController *)self view];
  v14 = [v13 window];
  [v14 endEditing:1];

  id v15 = +[CNPhotoPickerViewController navigationControllerForPicker:v12];

  [(CNMeCardSharingOnboardingEditViewController *)self presentViewController:v15 animated:1 completion:0];
}

- (id)textFieldForIndex:(int64_t)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if (self->_nameOrder == 2)
  {
    v10[0] = self->_familyNameField;
    v4 = &OBJC_IVAR___CNMeCardSharingOnboardingEditViewController__givenNameField;
    p_givenNameField = (UITextField **)v10;
  }
  else
  {
    givenNameField = self->_givenNameField;
    v4 = &OBJC_IVAR___CNMeCardSharingOnboardingEditViewController__familyNameField;
    p_givenNameField = &givenNameField;
  }
  p_givenNameField[1] = *(UITextField **)((char *)&self->super.super.super.super.super.super.super.isa + *v4);
  v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  v7 = [v6 objectAtIndexedSubscript:a3];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v4 = CNContactsUIBundle();
  id v5 = [v4 localizedStringForKey:@"SHARING_ONBOARDING_DISPLAY_NAME" value:&stru_1ED8AC728 table:@"Localized"];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = [a3 cellForRowAtIndexPath:a4];
  v4 = [v5 textField];
  [v4 becomeFirstResponder];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CNMeCardSharingTextFieldTableViewCell cellIdentifier];
  id v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  [v9 setSelectionStyle:0];
  uint64_t v10 = [v6 row];

  id v11 = [(CNMeCardSharingOnboardingEditViewController *)self textFieldForIndex:v10];
  [v9 setTextField:v11];

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  v4 = [(UITextField *)self->_givenNameField font];
  [v4 lineHeight];
  double v6 = v5 + 10.0;

  double result = 44.0;
  if (v6 >= 44.0) {
    return v6;
  }
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (void)textFieldDidEndEditing:(id)a3
{
  v4 = [(UITextField *)self->_givenNameField text];
  editingGivenName = self->_editingGivenName;
  self->_editingGivenName = v4;

  double v6 = [(UITextField *)self->_familyNameField text];
  editingFamilyName = self->_editingFamilyName;
  self->_editingFamilyName = v6;

  [(CNMeCardSharingOnboardingEditViewController *)self updateAvatarCarouselContactName];
  avatarCarouselViewController = self->_avatarCarouselViewController;

  [(CNMeCardSharingOnboardingAvatarCarouselViewController *)avatarCarouselViewController reloadForUpdatedMonogram];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  v4 = (UITextField *)a3;
  double v5 = v4;
  int64_t nameOrder = self->_nameOrder;
  if ((nameOrder != 2 || self->_familyNameField == v4) && self->_givenNameField == v4)
  {
    if (nameOrder == 2) {
      id v7 = &OBJC_IVAR___CNMeCardSharingOnboardingEditViewController__givenNameField;
    }
    else {
      id v7 = &OBJC_IVAR___CNMeCardSharingOnboardingEditViewController__familyNameField;
    }
    [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v7) becomeFirstResponder];
  }
  else
  {
    [(UITextField *)v4 resignFirstResponder];
  }

  return 0;
}

- (void)adjustInsetsForKeyboardOverlap:(double)a3
{
  double v5 = [(OBTableWelcomeController *)self scrollView];
  [v5 contentInset];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  if (v11 != a3)
  {
    v14 = [(OBTableWelcomeController *)self scrollView];
    objc_msgSend(v14, "setContentInset:", v7, v9, a3, v13);

    id v15 = [(OBTableWelcomeController *)self scrollView];
    objc_msgSend(v15, "setScrollIndicatorInsets:", v7, v9, a3, v13);
  }
}

- (void)keyboardWillHide:(id)a3
{
}

- (void)keyboardWillShow:(id)a3
{
  v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  id v59 = [(CNMeCardSharingOnboardingEditViewController *)self view];
  v14 = [v59 window];
  objc_msgSend(v14, "convertRect:fromWindow:", 0, v7, v9, v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  objc_msgSend(v59, "convertRect:fromView:", 0, v16, v18, v20, v22);
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  [v59 bounds];
  v64.origin.x = v24;
  v64.origin.y = v26;
  v64.size.width = v28;
  v64.size.height = v30;
  CGRect v62 = CGRectIntersection(v61, v64);
  double Height = CGRectGetHeight(v62);
  v31 = [(OBTableWelcomeController *)self scrollView];
  [v31 frame];
  CGFloat v33 = v32;
  v34 = [(OBTableWelcomeController *)self scrollView];
  [v34 frame];
  CGFloat v36 = v35;
  v37 = [(OBTableWelcomeController *)self scrollView];
  [v37 contentSize];
  CGFloat v39 = v38;
  v40 = [(OBTableWelcomeController *)self scrollView];
  [v40 contentSize];
  CGFloat v42 = v41;

  v63.origin.x = v24;
  v63.origin.y = v26;
  v63.size.width = v28;
  v63.size.height = v30;
  v65.origin.x = v33;
  v65.origin.y = v36;
  v65.size.width = v39;
  v65.size.height = v42;
  if (CGRectIntersectsRect(v63, v65))
  {
    [(CNMeCardSharingOnboardingEditViewController *)self adjustInsetsForKeyboardOverlap:Height];
    v43 = [(OBTableWelcomeController *)self scrollView];
    [v43 frame];
    double v45 = Height - v44;

    v46 = [(OBTableWelcomeController *)self scrollView];
    [v46 frame];
    double v48 = v45 + v47;
    v49 = [(OBTableWelcomeController *)self scrollView];
    [v49 contentSize];
    double v51 = v50;

    if (v48 > v51)
    {
      v52 = [(OBTableWelcomeController *)self scrollView];
      [v52 contentSize];
      double v54 = v53;
      v55 = [(OBTableWelcomeController *)self scrollView];
      [v55 frame];
      double v45 = v54 - (v56 - Height);
    }
    v57 = [(OBTableWelcomeController *)self scrollView];
    objc_msgSend(v57, "setContentOffset:", 0.0, v45);
  }
}

- (void)updateContact:(id)a3 withImagePropertiesFromContact:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [v5 imageData];
  [v6 setImageData:v7];

  [v5 cropRect];
  objc_msgSend(v6, "setCropRect:");
  double v8 = [v5 thumbnailImageData];
  [v6 setThumbnailImageData:v8];

  double v9 = [v5 fullscreenImageData];
  [v6 setFullscreenImageData:v9];

  double v10 = [v5 preferredLikenessSource];
  [v6 setPreferredLikenessSource:v10];

  double v11 = [v5 imageType];
  [v6 setImageType:v11];

  double v12 = [v5 imageHash];
  [v6 setImageHash:v12];

  id v13 = [v5 memojiMetadata];

  [v6 setMemojiMetadata:v13];
}

- (void)photoPickerVariantListController:(id)a3 didSelectProviderItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (CNMeCardSharingOnboardingEditViewController *)v6;
  double v9 = [(CNMeCardSharingOnboardingEditViewController *)self presentedViewController];
  double v10 = [(CNMeCardSharingOnboardingEditViewController *)v8 presentingViewController];

  double v11 = v8;
  if (v9 == v10)
  {
    double v11 = self;
  }
  [v7 updateContact:self->_editingContact];
  [(CNMeCardSharingOnboardingEditViewController *)self updateContact:self->_avatarCarouselEditingContact withImagePropertiesFromContact:self->_editingContact];
  [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self->_avatarCarouselViewController reloadForUpdatedContactPhoto];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__CNMeCardSharingOnboardingEditViewController_photoPickerVariantListController_didSelectProviderItem___block_invoke;
  v12[3] = &unk_1E549B488;
  v12[4] = self;
  [(CNMeCardSharingOnboardingEditViewController *)v11 dismissViewControllerAnimated:1 completion:v12];
}

uint64_t __102__CNMeCardSharingOnboardingEditViewController_photoPickerVariantListController_didSelectProviderItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) promptForSavingToMeCard];
}

- (void)photoPickerVariantListControllerDidCancel:(id)a3
{
  id v3 = [(CNMeCardSharingOnboardingEditViewController *)self presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)presentPhotoPickerVariantListForItem:(id)a3 FromViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v14 = [[CNPhotoPickerVariantListController alloc] initWithVariantsManager:self->_variantsManager originalItem:v7];

  [(CNPhotoPickerVariantListController *)v14 setDelegate:self];
  double v8 = [(CNMeCardSharingOnboardingEditViewController *)self view];
  double v9 = [v8 backgroundColor];
  double v10 = [(CNPhotoPickerVariantListController *)v14 view];
  [v10 setBackgroundColor:v9];

  double v11 = [[CNPortraitOnlyNavigationController alloc] initWithRootViewController:v14];
  double v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  [(CNPortraitOnlyNavigationController *)v11 setModalPresentationStyle:2 * ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)];
  [v6 presentViewController:v11 animated:1 completion:0];
}

- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v8 = a4;
  if (v8)
  {
    id v6 = [a3 viewController];
    id v7 = [v6 navigationController];
    [(CNMeCardSharingOnboardingEditViewController *)self presentPhotoPickerVariantListForItem:v8 FromViewController:v7];
  }
  else
  {
    [(CNMeCardSharingOnboardingEditViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)showAvatarPosePickerFromItem:(id)a3
{
  id v18 = a3;
  if (!self->_variantsManager)
  {
    v4 = objc_alloc_init(CNPhotoPickerVariantsManager);
    variantsManager = self->_variantsManager;
    self->_variantsManager = v4;
  }
  if (+[CNPhotoPickerCapabilities allowsAvatarUI])
  {
    id v6 = [CNAvatarEditingManager alloc];
    id v7 = [v18 avatarRecord];
    id v8 = [(CNAvatarEditingManager *)v6 initWithAvatarRecord:v7 variantsManager:self->_variantsManager];

    [(CNAvatarEditingManager *)v8 setDelegate:self];
    [(CNAvatarEditingManager *)v8 setOriginalItem:v18];
    posePicker = self->_posePicker;
    self->_posePicker = v8;
    double v10 = v8;

    double v11 = [(CNMeCardSharingOnboardingEditViewController *)self view];
    double v12 = [v11 backgroundColor];
    uint64_t v13 = [(CNAvatarEditingManager *)v10 viewController];
    v14 = [v13 view];
    [v14 setBackgroundColor:v12];

    double v15 = [CNPortraitOnlyNavigationController alloc];
    double v16 = [(CNAvatarEditingManager *)v10 viewController];

    double v17 = [(CNPortraitOnlyNavigationController *)v15 initWithRootViewController:v16];
    [(CNPortraitOnlyNavigationController *)v17 setModalPresentationStyle:0];
    [(CNMeCardSharingOnboardingEditViewController *)self presentViewController:v17 animated:1 completion:0];
  }
}

- (void)notifyDelegateWithContactImage:(id)a3 didSaveToMeContact:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [CNMeCardSharingResult alloc];
  editingGivenName = self->_editingGivenName;
  editingFamilyName = self->_editingFamilyName;
  double v10 = [v6 resizedContactImageForMeCardSharing];
  double v11 = [(CNMutableContact *)self->_editingContact wallpaper];
  double v12 = [(CNMutableContact *)self->_editingContact watchWallpaperImageData];
  uint64_t v13 = [(CNMeCardSharingResult *)v7 initWithGivenName:editingGivenName familyName:editingFamilyName contactImage:v10 wallpaper:v11 watchWallpaperImageData:v12 didSaveImageToMeCard:v4];

  logger = self->_logger;
  double v15 = [(CNMeCardSharingResult *)v13 description];
  [(CNSharingProfileLogger *)logger logOnboardingReturningSharingResultWithDescription:v15];

  double v16 = [(CNMeCardSharingResult *)v13 contactImage];
  double v17 = [v16 imageData];
  uint64_t v18 = [v17 length];

  if (!v18)
  {
    if ([v6 source] != 1
      || ([v6 variant], double v20 = objc_claimAutoreleasedReturnValue(), v20, v20))
    {
      [(CNSharingProfileLogger *)self->_logger logOnboardingReturningEmptyImage];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __97__CNMeCardSharingOnboardingEditViewController_notifyDelegateWithContactImage_didSaveToMeContact___block_invoke;
      v21[3] = &unk_1E549BF80;
      v21[4] = self;
      double v22 = v13;
      [(CNMeCardSharingOnboardingEditViewController *)self presentErrorAlertForEmptyPhotoIfNeededWithCompletion:v21];

      goto LABEL_6;
    }
    [(CNSharingProfileLogger *)self->_logger logOnboardingReturningDefaultMonogram];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained meCardSharingOnboardingEditController:self didFinishWithOnboardingResult:v13];

LABEL_6:
}

void __97__CNMeCardSharingOnboardingEditViewController_notifyDelegateWithContactImage_didSaveToMeContact___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1272));
  [WeakRetained meCardSharingOnboardingEditController:*(void *)(a1 + 32) didFinishWithOnboardingResult:*(void *)(a1 + 40)];
}

- (void)presentErrorAlertForEmptyPhotoIfNeededWithCompletion:(id)a3
{
  id v3 = (void (**)(void))a3;
  if ([MEMORY[0x1E4F1B8F8] nameAndPhotoSharingDebugUIEnabled])
  {
    BOOL v4 = (void *)MEMORY[0x1E4FB1418];
    id v5 = CNContactsUIBundle();
    id v6 = [v5 localizedStringForKey:@"Uh Oh" value:&stru_1ED8AC728 table:@"Localized"];
    id v7 = CNContactsUIBundle();
    id v8 = [v7 localizedStringForKey:@"Empty image returned to Messages for Name + Photo" value:&stru_1ED8AC728 table:@"Localized"];
    double v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

    double v10 = (void *)MEMORY[0x1E4FB1410];
    double v11 = CNContactsUIBundle();
    double v12 = [v11 localizedStringForKey:@"OK" value:&stru_1ED8AC728 table:@"Localized"];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __100__CNMeCardSharingOnboardingEditViewController_presentErrorAlertForEmptyPhotoIfNeededWithCompletion___block_invoke;
    v14[3] = &unk_1E549A818;
    double v15 = v3;
    uint64_t v13 = [v10 actionWithTitle:v12 style:0 handler:v14];
    [v9 addAction:v13];
  }
  else
  {
    v3[2](v3);
  }
}

uint64_t __100__CNMeCardSharingOnboardingEditViewController_presentErrorAlertForEmptyPhotoIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finishOnboardingWithDidSaveToMeContact:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self->_avatarCarouselViewController selectedItem];
  uint64_t v6 = [v5 imageType];
  id v7 = [v5 cachedImage];
  id v8 = v7;
  if (!v7)
  {
    double v12 = [v5 imageProvider];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __86__CNMeCardSharingOnboardingEditViewController_finishOnboardingWithDidSaveToMeContact___block_invoke;
    v13[3] = &unk_1E549A7F0;
    v13[4] = self;
    v13[5] = v6;
    BOOL v14 = v3;
    ((void (**)(void, void *))v12)[2](v12, v13);
    goto LABEL_5;
  }
  double v9 = UIImagePNGRepresentation(v7);
  id v10 = objc_alloc(MEMORY[0x1E4F1B918]);
  double v11 = [MEMORY[0x1E4F1C9C8] date];
  double v12 = (void (**)(void, void))objc_msgSend(v10, "initWithImageData:cropRect:lastUsedDate:", v9, v11, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  objc_msgSend(v12, "setSource:", -[CNMeCardSharingOnboardingEditViewController contactImageSourceForType:](self, "contactImageSourceForType:", v6));
  if (v12)
  {
    [(CNMeCardSharingOnboardingEditViewController *)self notifyDelegateWithContactImage:v12 didSaveToMeContact:v3];
LABEL_5:
  }
}

void __86__CNMeCardSharingOnboardingEditViewController_finishOnboardingWithDidSaveToMeContact___block_invoke(uint64_t a1, UIImage *image)
{
  UIImagePNGRepresentation(image);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc(MEMORY[0x1E4F1B918]);
  BOOL v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = objc_msgSend(v3, "initWithImageData:cropRect:lastUsedDate:", v6, v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  objc_msgSend(v5, "setSource:", objc_msgSend(*(id *)(a1 + 32), "contactImageSourceForType:", *(void *)(a1 + 40)));
  [*(id *)(a1 + 32) notifyDelegateWithContactImage:v5 didSaveToMeContact:*(unsigned __int8 *)(a1 + 48)];
}

- (int64_t)contactImageSourceForType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return qword_18B9C38A0[a3 - 1];
  }
}

- (void)promptForSavingToMeCard
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  BOOL v4 = CNContactsUIBundle();
  id v5 = [v4 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  id v6 = CNContactsUIBundle();
  id v7 = [v6 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_MESSAGE" value:&stru_1ED8AC728 table:@"Localized"];
  id v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  double v9 = (void *)MEMORY[0x1E4FB1410];
  id v10 = CNContactsUIBundle();
  double v11 = [v10 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_CONFIRM" value:&stru_1ED8AC728 table:@"Localized"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__CNMeCardSharingOnboardingEditViewController_promptForSavingToMeCard__block_invoke;
  v21[3] = &unk_1E549B590;
  v21[4] = self;
  double v12 = [v9 actionWithTitle:v11 style:0 handler:v21];
  [v8 addAction:v12];

  uint64_t v13 = (void *)MEMORY[0x1E4FB1410];
  BOOL v14 = CNContactsUIBundle();
  double v15 = [v14 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __70__CNMeCardSharingOnboardingEditViewController_promptForSavingToMeCard__block_invoke_2;
  v20[3] = &unk_1E549B590;
  v20[4] = self;
  double v16 = [v13 actionWithTitle:v15 style:1 handler:v20];
  [v8 addAction:v16];

  double v17 = self;
  uint64_t v18 = [(CNMeCardSharingOnboardingEditViewController *)v17 presentedViewController];

  if (v18)
  {
    uint64_t v19 = [(CNMeCardSharingOnboardingEditViewController *)v17 presentedViewController];

    double v17 = (CNMeCardSharingOnboardingEditViewController *)v19;
  }
  [(CNMeCardSharingOnboardingEditViewController *)v17 presentViewController:v8 animated:1 completion:0];
}

uint64_t __70__CNMeCardSharingOnboardingEditViewController_promptForSavingToMeCard__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) saveDraftContact];
  v2 = *(void **)(a1 + 32);

  return [v2 finishOnboardingWithDidSaveToMeContact:1];
}

uint64_t __70__CNMeCardSharingOnboardingEditViewController_promptForSavingToMeCard__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishOnboardingWithDidSaveToMeContact:0];
}

- (void)finishOnboardingWithProviderItem:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 cachedImage];

  if (v4 && [v7 imageType] == 2)
  {
    id v5 = [v7 cachedImage];
    id v6 = UIImagePNGRepresentation(v5);
    [(CNMutableContact *)self->_editingContact setImageData:v6];

    [(CNMutableContact *)self->_editingContact updateImageInfoWithType:2];
  }
  [(CNMeCardSharingOnboardingEditViewController *)self promptForSavingToMeCard];
}

- (void)handleConfirmButtonTapped
{
  id v3 = [(UITextField *)self->_givenNameField text];
  BOOL v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];

  id v6 = [(UITextField *)self->_familyNameField text];
  id v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v8 = [v6 stringByTrimmingCharactersInSet:v7];

  objc_storeStrong((id *)&self->_editingGivenName, v5);
  objc_storeStrong((id *)&self->_editingFamilyName, v8);
  [(CNMeCardSharingOnboardingEditViewController *)self updateAvatarCarouselContactName];
  double v9 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self->_avatarCarouselViewController selectedItem];
  if ([v9 imageType] == 3 && objc_msgSend(v9, "shouldShowVariants"))
  {
    id v10 = +[CNUIContactsEnvironment currentEnvironment];
    double v11 = [v10 defaultSchedulerProvider];

    double v12 = (void *)[v11 newSerialSchedulerWithName:@"com.apple.ContactsUI.PhotoPickerAnimojiProvider.renderingQueue"];
    uint64_t v13 = [v11 mainThreadScheduler];
    uint64_t v26 = 0;
    double v27 = &v26;
    uint64_t v28 = 0x2050000000;
    BOOL v14 = (void *)getAVTAvatarRecordImageProviderClass_softClass_52608;
    uint64_t v29 = getAVTAvatarRecordImageProviderClass_softClass_52608;
    if (!getAVTAvatarRecordImageProviderClass_softClass_52608)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      double v23 = __getAVTAvatarRecordImageProviderClass_block_invoke_52609;
      CGFloat v24 = &unk_1E549AD00;
      double v25 = &v26;
      __getAVTAvatarRecordImageProviderClass_block_invoke_52609((uint64_t)&v21);
      BOOL v14 = (void *)v27[3];
    }
    double v15 = v14;
    _Block_object_dispose(&v26, 8);
    id v16 = objc_alloc_init(v15);
    uint64_t v26 = 0;
    double v27 = &v26;
    uint64_t v28 = 0x2050000000;
    double v17 = (void *)getAVTRenderingScopeClass_softClass_52610;
    uint64_t v29 = getAVTRenderingScopeClass_softClass_52610;
    if (!getAVTRenderingScopeClass_softClass_52610)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      double v23 = __getAVTRenderingScopeClass_block_invoke_52611;
      CGFloat v24 = &unk_1E549AD00;
      double v25 = &v26;
      __getAVTRenderingScopeClass_block_invoke_52611((uint64_t)&v21);
      double v17 = (void *)v27[3];
    }
    id v18 = v17;
    _Block_object_dispose(&v26, 8);
    uint64_t v19 = [v18 gridThumbnailScope];
    double v20 = [[CNPhotoPickerAnimojiProviderItem alloc] initWithAvatarRecord:self->_avatarRecord imageProvider:v16 renderingScope:v19 renderingQueue:v12 callbackQueue:v13];
    [(CNMeCardSharingOnboardingEditViewController *)self showAvatarPosePickerFromItem:v20];
  }
  else
  {
    [(CNMeCardSharingOnboardingEditViewController *)self finishOnboardingWithProviderItem:v9];
  }
}

- (id)confirmButtonTitle
{
  v2 = CNContactsUIBundle();
  id v3 = [v2 localizedStringForKey:@"SHARING_CONTINUE" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (void)familyNameDidChange:(id)a3
{
  BOOL v4 = [a3 text];
  editingFamilyName = self->_editingFamilyName;
  self->_editingFamilyName = v4;

  [(CNMeCardSharingOnboardingEditViewController *)self updateAvatarCarouselContactName];
  avatarCarouselViewController = self->_avatarCarouselViewController;

  [(CNMeCardSharingOnboardingAvatarCarouselViewController *)avatarCarouselViewController reloadForUpdatedMonogram];
}

- (void)givenNameDidChange:(id)a3
{
  BOOL v4 = [a3 text];
  editingGivenName = self->_editingGivenName;
  self->_editingGivenName = v4;

  [(CNMeCardSharingOnboardingEditViewController *)self updateAvatarCarouselContactName];
  avatarCarouselViewController = self->_avatarCarouselViewController;

  [(CNMeCardSharingOnboardingAvatarCarouselViewController *)avatarCarouselViewController reloadForUpdatedMonogram];
}

- (void)saveDraftContact
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  if (self->_shouldSetAsMeContact)
  {
    [(CNMutableContact *)self->_editingContact setGivenName:self->_editingGivenName];
    [(CNMutableContact *)self->_editingContact setFamilyName:self->_editingFamilyName];
    BOOL v4 = self->_editingContact;
    [v3 addContact:v4 toContainerWithIdentifier:0];
  }
  else if ([(CNContact *)self->_contact hasBeenPersisted])
  {
    BOOL v4 = (CNMutableContact *)[(CNContact *)self->_contact mutableCopy];
    [(CNMeCardSharingOnboardingEditViewController *)self updateContact:v4 withImagePropertiesFromContact:self->_editingContact];
    [v3 updateContact:v4];
  }
  else
  {
    BOOL v4 = 0;
  }
  logger = self->_logger;
  id v6 = [(CNMutableContact *)v4 identifier];
  [(CNSharingProfileLogger *)logger logOnboardingSavingContact:v6];

  id v7 = [(CNMeCardSharingOnboardingEditViewController *)self contactStore];
  id v20 = 0;
  char v8 = [v7 executeSaveRequest:v3 error:&v20];
  id v9 = v20;

  if ((v8 & 1) == 0)
  {
    id v16 = self->_logger;
    id v13 = [v9 localizedDescription];
    [(CNSharingProfileLogger *)v16 logOnboardingErrorSavingContactWithDescription:v13];
LABEL_13:

    goto LABEL_14;
  }
  id v10 = self->_logger;
  if (self->_shouldSetAsMeContact)
  {
    [(CNSharingProfileLogger *)v10 logSettingsSettingMeContact];
    double v11 = [(CNMeCardSharingOnboardingEditViewController *)self contactStore];
    id v19 = 0;
    char v12 = [v11 setMeContact:v4 error:&v19];
    id v13 = v19;

    if (v12)
    {
      self->_shouldSetAsMeContact = 0;
      BOOL v14 = (CNContact *)[(CNMutableContact *)v4 copy];
      contact = self->_contact;
      self->_contact = v14;

      [(CNSharingProfileLogger *)self->_logger logOnboardingSuccessSavingContact];
    }
    else
    {
      double v17 = self->_logger;
      uint64_t v18 = [v13 localizedDescription];
      [(CNSharingProfileLogger *)v17 logOnboardingErrorSettingMeContactWithDescription:v18];

      id v13 = (id)v18;
    }
    goto LABEL_13;
  }
  [(CNSharingProfileLogger *)v10 logOnboardingSuccessSavingContact];
LABEL_14:
}

- (void)updateAvatarCarouselContactName
{
  [(CNMutableContact *)self->_avatarCarouselEditingContact setGivenName:self->_editingGivenName];
  editingFamilyName = self->_editingFamilyName;
  avatarCarouselEditingContact = self->_avatarCarouselEditingContact;

  [(CNMutableContact *)avatarCarouselEditingContact setFamilyName:editingFamilyName];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNMeCardSharingOnboardingEditViewController;
  [(OBTableWelcomeController *)&v6 viewWillAppear:a3];
  BOOL v4 = [(CNMeCardSharingOnboardingEditViewController *)self view];
  uint64_t v5 = [v4 effectiveUserInterfaceLayoutDirection];

  if (v5 == 1) {
    [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self->_avatarCarouselViewController scrollToItemAtIndex:0 animated:0];
  }
}

- (void)viewDidLoad
{
  v46.receiver = self;
  v46.super_class = (Class)CNMeCardSharingOnboardingEditViewController;
  [(CNMeCardSharingOnboardingViewController *)&v46 viewDidLoad];
  id v3 = [(OBTableWelcomeController *)self scrollView];
  [v3 setKeyboardDismissMode:2];

  BOOL v4 = [(OBTableWelcomeController *)self tableView];
  uint64_t v5 = objc_opt_class();
  objc_super v6 = +[CNMeCardSharingTextFieldTableViewCell cellIdentifier];
  [v4 registerClass:v5 forCellReuseIdentifier:v6];

  id v7 = [[CNMeCardSharingOnboardingAvatarCarouselViewController alloc] initWithContact:self->_avatarCarouselEditingContact avatarRecord:self->_avatarRecord logger:self->_logger];
  avatarCarouselViewController = self->_avatarCarouselViewController;
  self->_avatarCarouselViewController = v7;

  id v9 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self->_avatarCarouselViewController view];
  [v9 setAutoresizingMask:2];

  id v10 = [(OBTableWelcomeController *)self tableView];
  [v10 bounds];
  double Width = CGRectGetWidth(v47);
  char v12 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self->_avatarCarouselViewController view];
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, Width, 220.0);

  [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self->_avatarCarouselViewController setDelegate:self];
  id v13 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self->_avatarCarouselViewController view];
  BOOL v14 = [(OBTableWelcomeController *)self tableView];
  [v14 setTableHeaderView:v13];

  double v15 = [(OBTableWelcomeController *)self tableView];
  [v15 setDelegate:self];

  id v16 = [(OBTableWelcomeController *)self tableView];
  [v16 setDataSource:self];

  double v17 = [(CNMeCardSharingNameProvider *)self->_nameProvider givenName];
  editingGivenName = self->_editingGivenName;
  self->_editingGivenName = v17;

  id v19 = [(CNMeCardSharingNameProvider *)self->_nameProvider familyName];
  editingFamilyName = self->_editingFamilyName;
  self->_editingFamilyName = v19;

  id v21 = objc_alloc(MEMORY[0x1E4FB1D70]);
  double v22 = *MEMORY[0x1E4F1DB28];
  double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v26 = (UITextField *)objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E4F1DB28], v23, v24, v25);
  givenNameField = self->_givenNameField;
  self->_givenNameField = v26;

  uint64_t v28 = [(CNMeCardSharingNameProvider *)self->_nameProvider givenName];
  [(UITextField *)self->_givenNameField setText:v28];

  uint64_t v29 = CNContactsUIBundle();
  CGFloat v30 = [v29 localizedStringForKey:@"SHARING_GIVEN_NAME_PLACEHOLDER" value:&stru_1ED8AC728 table:@"Localized"];
  [(UITextField *)self->_givenNameField setPlaceholder:v30];

  uint64_t v31 = *MEMORY[0x1E4FB28C8];
  double v32 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UITextField *)self->_givenNameField setFont:v32];

  [(UITextField *)self->_givenNameField setAdjustsFontForContentSizeCategory:1];
  [(UITextField *)self->_givenNameField setAutocorrectionType:1];
  [(UITextField *)self->_givenNameField addTarget:self action:sel_givenNameDidChange_ forControlEvents:0x20000];
  [(UITextField *)self->_givenNameField setDelegate:self];
  CGFloat v33 = (UITextField *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D70]), "initWithFrame:", v22, v23, v24, v25);
  familyNameField = self->_familyNameField;
  self->_familyNameField = v33;

  double v35 = [(CNMeCardSharingNameProvider *)self->_nameProvider familyName];
  [(UITextField *)self->_familyNameField setText:v35];

  CGFloat v36 = CNContactsUIBundle();
  v37 = [v36 localizedStringForKey:@"SHARING_FAMILY_NAME_PLACEHOLDER" value:&stru_1ED8AC728 table:@"Localized"];
  [(UITextField *)self->_familyNameField setPlaceholder:v37];

  double v38 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v31];
  [(UITextField *)self->_familyNameField setFont:v38];

  [(UITextField *)self->_familyNameField setAdjustsFontForContentSizeCategory:1];
  [(UITextField *)self->_familyNameField setAutocorrectionType:1];
  [(UITextField *)self->_familyNameField addTarget:self action:sel_familyNameDidChange_ forControlEvents:0x20000];
  [(UITextField *)self->_familyNameField setDelegate:self];
  CGFloat v39 = [(OBTableWelcomeController *)self tableView];
  [v39 setKeyboardDismissMode:2];

  id v40 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  double v41 = [(CNMeCardSharingNameProvider *)self->_nameProvider givenName];
  [v40 setGivenName:v41];

  CGFloat v42 = [(CNMeCardSharingNameProvider *)self->_nameProvider familyName];
  [v40 setFamilyName:v42];

  self->_int64_t nameOrder = [MEMORY[0x1E4F28F38] _nameOrderWithOverridesForComponents:v40 options:0];
  v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v43 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

  double v44 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v44 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];

  double v45 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v45 addObserver:self selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharingOnboardingEditViewController;
  [(CNMeCardSharingOnboardingEditViewController *)&v4 dealloc];
}

- (CNMeCardSharingOnboardingEditViewController)initWithContactStore:(id)a3 contact:(id)a4 nameProvider:(id)a5 avatarRecord:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  double v15 = [(id)objc_opt_class() headerText];
  v33.receiver = self;
  v33.super_class = (Class)CNMeCardSharingOnboardingEditViewController;
  id v16 = [(OBTableWelcomeController *)&v33 initWithTitle:v15 detailText:0 icon:0 adoptTableViewScrollView:0];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_contactStore, a3);
    objc_storeStrong((id *)&v16->_contact, a4);
    objc_storeStrong((id *)&v16->_nameProvider, a5);
    objc_storeStrong((id *)&v16->_avatarRecord, a6);
    if (v12)
    {
      uint64_t v17 = [v12 mutableCopy];
      editingContact = v16->_editingContact;
      v16->_editingContact = (CNMutableContact *)v17;

      uint64_t v19 = [v12 mutableCopy];
      avatarCarouselEditingContact = v16->_avatarCarouselEditingContact;
      v16->_avatarCarouselEditingContact = (CNMutableContact *)v19;
    }
    else
    {
      id v21 = (CNMutableContact *)objc_alloc_init(MEMORY[0x1E4F1BA40]);
      double v22 = v16->_editingContact;
      v16->_editingContact = v21;

      double v23 = (CNMutableContact *)objc_alloc_init(MEMORY[0x1E4F1BA40]);
      double v24 = v16->_avatarCarouselEditingContact;
      v16->_avatarCarouselEditingContact = v23;

      v16->_shouldSetAsMeContact = 1;
    }
    double v25 = [v13 givenName];
    [(CNMutableContact *)v16->_avatarCarouselEditingContact setGivenName:v25];

    uint64_t v26 = [v13 familyName];
    [(CNMutableContact *)v16->_avatarCarouselEditingContact setFamilyName:v26];

    uint64_t v27 = +[CNMeCardSharingPickerLayoutAttributes layoutAttributesForBuddy];
    layoutAttributes = v16->_layoutAttributes;
    v16->_layoutAttributes = (CNMeCardSharingPickerLayoutAttributes *)v27;

    uint64_t v29 = objc_alloc_init(CNSharingProfileLogger);
    logger = v16->_logger;
    v16->_logger = v29;

    uint64_t v31 = v16;
  }

  return v16;
}

+ (id)headerText
{
  v2 = CNContactsUIBundle();
  id v3 = [v2 localizedStringForKey:@"SHARING_ONBOARDING_NAME_AND_PHOTO_HEADER" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_52665 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_52665, &__block_literal_global_52666);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_1_52667;

  return v2;
}

void __72__CNMeCardSharingOnboardingEditViewController_descriptorForRequiredKeys__block_invoke()
{
  v9[6] = *MEMORY[0x1E4F143B8];
  v0 = +[CNMeCardSharingContactNameProvider descriptorForRequiredKeys];
  v9[0] = v0;
  v1 = +[CNVisualIdentityPickerViewController descriptorForRequiredKeys];
  uint64_t v2 = *MEMORY[0x1E4F1AE28];
  v9[1] = v1;
  v9[2] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1ADE8];
  v9[3] = *MEMORY[0x1E4F1AF98];
  v9[4] = v3;
  v9[5] = *MEMORY[0x1E4F1AE20];
  objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:6];

  uint64_t v5 = (void *)MEMORY[0x1E4F1B8F8];
  objc_super v6 = [NSString stringWithUTF8String:"+[CNMeCardSharingOnboardingEditViewController descriptorForRequiredKeys]_block_invoke"];
  uint64_t v7 = [v5 descriptorWithKeyDescriptors:v4 description:v6];

  char v8 = (void *)descriptorForRequiredKeys_cn_once_object_1_52667;
  descriptorForRequiredKeys_cn_once_object_1_52667 = v7;
}

@end