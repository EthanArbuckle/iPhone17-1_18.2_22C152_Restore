@interface CNMeCardSharingSettingsViewController
+ (id)descriptorForRequiredKeys;
- (BOOL)isPresentedInOnboarding;
- (BOOL)isPresentingModalViewController;
- (BOOL)multiplePhoneNumbersTiedToAppleID;
- (BOOL)sharingEnabled;
- (BOOL)shouldSetAsMeContact;
- (BOOL)showsWallpaperSuggestionsGalleryPicker;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CNContact)contact;
- (CNContactImage)editingContactImage;
- (CNContactStore)contactStore;
- (CNMeCardSharingAudienceDataSource)sharingAudienceDataSource;
- (CNMeCardSharingAvatarProvider)avatarProvider;
- (CNMeCardSharingContactAvatarProvider)editingContactAvatarProvider;
- (CNMeCardSharingEnabledDataSource)enabledDataSource;
- (CNMeCardSharingNameProvider)nameProvider;
- (CNMeCardSharingPickerLayoutAttributes)layoutAttributes;
- (CNMeCardSharingSettingsHeaderViewController)headerViewController;
- (CNMeCardSharingSettingsNameDataSource)nameDataSource;
- (CNMeCardSharingSettingsViewController)initWithContactStore:(id)a3 contact:(id)a4 avatarProvider:(id)a5 nameProvider:(id)a6 sharingEnabled:(BOOL)a7 selectedSharingAudience:(unint64_t)a8;
- (CNMeCardSharingSettingsViewController)initWithContactStore:(id)a3 contact:(id)a4 avatarProvider:(id)a5 nameProvider:(id)a6 sharingEnabled:(BOOL)a7 selectedSharingAudience:(unint64_t)a8 showsWallpaperSuggestionsGalleryPicker:(BOOL)a9 headerMode:(int64_t)a10;
- (CNMeCardSharingSettingsViewController)initWithContactStore:(id)a3 contact:(id)a4 avatarProvider:(id)a5 nameProvider:(id)a6 sharingEnabled:(BOOL)a7 selectedSharingAudience:(unint64_t)a8 showsWallpaperSuggestionsGalleryPicker:(BOOL)a9 headerMode:(int64_t)a10 presentedInOnboarding:(BOOL)a11;
- (CNMeCardSharingSettingsViewControllerDelegate)delegate;
- (CNMutableContact)editingContact;
- (CNPhotoPickerViewController)photoPicker;
- (CNSNaPSetupFlowManager)editAvatarPosterFlowManager;
- (CNSharedProfileOnboardingController)snapOnboardingController;
- (CNSharingProfileLogger)logger;
- (CNSharingProfileMeCardUpdater)meCardUpdater;
- (NSArray)sectionDataSources;
- (NSString)editingFamilyName;
- (NSString)editingGivenName;
- (OBBoldTrayButton)continueButton;
- (OBButtonTray)buttonTray;
- (UISwitch)shareSwitch;
- (UITableView)tableView;
- (UITextField)familyNameField;
- (UITextField)givenNameField;
- (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer)carouselPreWarmer;
- (double)availableHeaderHeight;
- (double)keyboardHeight;
- (double)tableViewBottomInsets;
- (double)viewHeight;
- (id)initForOnboardingWithContactStore:(id)a3 contact:(id)a4 avatarProvider:(id)a5 nameProvider:(id)a6 sharingEnabled:(BOOL)a7 selectedSharingAudience:(unint64_t)a8 showsWallpaperSuggestionsGalleryPicker:(BOOL)a9 headerMode:(int64_t)a10;
- (id)sharingResultWithContactImage:(id)a3 wallpaper:(id)a4 watchWallpaperImageData:(id)a5 didSaveToMeCard:(BOOL)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (id)textFieldForIndex:(int64_t)a3;
- (id)textFields;
- (int64_t)headerMode;
- (int64_t)nameOrder;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)selectedSharingAudience;
- (void)adjustInsetsForKeyboardOverlap:(double)a3;
- (void)avatarPosterEditorFromFlowManager:(id)a3 didUpdateContact:(id)a4 withVisualIdentity:(id)a5;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)didTapContinueButton:(id)a3;
- (void)familyNameDidChange:(id)a3;
- (void)generateEditingContactWithCompletionHandler:(id)a3;
- (void)givenNameDidChange:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)notifyDelegateOfChangesWithDidSaveMeCard:(BOOL)a3 contactImage:(id)a4 sharingResult:(id)a5;
- (void)notifyDelegateOfChangesWithDidSaveToMeCard:(BOOL)a3;
- (void)notifyOfChangedEnablementState:(BOOL)a3;
- (void)performSaveToMeCardAction;
- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5;
- (void)photoPickerDidCancel:(id)a3;
- (void)preWarmContactPosterForContact:(id)a3;
- (void)presentErrorAlertForEmptyPhotoIfNeededWithCompletion:(id)a3;
- (void)presentNameEditor;
- (void)presentPhotoPickerControllerForContact:(id)a3;
- (void)promptForSavingToMeCardIfNeeded;
- (void)saveDraftContact;
- (void)sender:(id)a3 dismissViewController:(id)a4;
- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (void)sender:(id)a3 presentViewController:(id)a4;
- (void)setButtonTray:(id)a3;
- (void)setCarouselPreWarmer:(id)a3;
- (void)setContact:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditAvatarPosterFlowManager:(id)a3;
- (void)setEditingContact:(id)a3;
- (void)setEditingContactAvatarProvider:(id)a3;
- (void)setEditingContactImage:(id)a3;
- (void)setEditingFamilyName:(id)a3;
- (void)setEditingGivenName:(id)a3;
- (void)setFamilyNameField:(id)a3;
- (void)setGivenNameField:(id)a3;
- (void)setHeaderMode:(int64_t)a3;
- (void)setHeaderViewController:(id)a3;
- (void)setIsPresentedInOnboarding:(BOOL)a3;
- (void)setKeyboardHeight:(double)a3;
- (void)setMeCardUpdater:(id)a3;
- (void)setNameOrder:(int64_t)a3;
- (void)setPhotoPicker:(id)a3;
- (void)setSectionDataSources:(id)a3;
- (void)setShareSwitch:(id)a3;
- (void)setShouldSetAsMeContact:(BOOL)a3;
- (void)setShowsWallpaperSuggestionsGalleryPicker:(BOOL)a3;
- (void)setSnapOnboardingController:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTableViewBottomInsets:(double)a3;
- (void)sharingEnabledDataSource:(id)a3 didChangeEnabledState:(BOOL)a4;
- (void)sharingSettingsHeaderWasTapped:(id)a3;
- (void)sharingSettingsPreferenceMenuCell:(id)a3 didSelectSharingAudience:(unint64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateContact:(id)a3 withEditedContact:(id)a4;
- (void)updateContact:(id)a3 withImagePropertiesFromContact:(id)a4;
- (void)updateContact:(id)a3 withNamePropertiesFromContact:(id)a4;
- (void)updateHeaderViewFrame;
- (void)updateHeaderViewFrameAndTableView;
- (void)updateTableViewBottomPaddingIfNeeded;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation CNMeCardSharingSettingsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_snapOnboardingController, 0);
  objc_storeStrong((id *)&self->_carouselPreWarmer, 0);
  objc_storeStrong((id *)&self->_editAvatarPosterFlowManager, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_editingContactAvatarProvider, 0);
  objc_storeStrong((id *)&self->_familyNameField, 0);
  objc_storeStrong((id *)&self->_givenNameField, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_shareSwitch, 0);
  objc_storeStrong((id *)&self->_sectionDataSources, 0);
  objc_storeStrong((id *)&self->_photoPicker, 0);
  objc_storeStrong((id *)&self->_sharingAudienceDataSource, 0);
  objc_storeStrong((id *)&self->_enabledDataSource, 0);
  objc_storeStrong((id *)&self->_nameDataSource, 0);
  objc_storeStrong((id *)&self->_nameProvider, 0);
  objc_storeStrong((id *)&self->_avatarProvider, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_meCardUpdater, 0);
  objc_storeStrong((id *)&self->_editingFamilyName, 0);
  objc_storeStrong((id *)&self->_editingGivenName, 0);
  objc_storeStrong((id *)&self->_editingContactImage, 0);
  objc_storeStrong((id *)&self->_editingContact, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setIsPresentedInOnboarding:(BOOL)a3
{
  self->_isPresentedInOnboarding = a3;
}

- (BOOL)isPresentedInOnboarding
{
  return self->_isPresentedInOnboarding;
}

- (void)setHeaderMode:(int64_t)a3
{
  self->_headerMode = a3;
}

- (int64_t)headerMode
{
  return self->_headerMode;
}

- (void)setShowsWallpaperSuggestionsGalleryPicker:(BOOL)a3
{
  self->_showsWallpaperSuggestionsGalleryPicker = a3;
}

- (BOOL)showsWallpaperSuggestionsGalleryPicker
{
  return self->_showsWallpaperSuggestionsGalleryPicker;
}

- (void)setContinueButton:(id)a3
{
}

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setButtonTray:(id)a3
{
}

- (OBButtonTray)buttonTray
{
  return self->_buttonTray;
}

- (void)setSnapOnboardingController:(id)a3
{
}

- (CNSharedProfileOnboardingController)snapOnboardingController
{
  return self->_snapOnboardingController;
}

- (void)setCarouselPreWarmer:(id)a3
{
}

- (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer)carouselPreWarmer
{
  return self->_carouselPreWarmer;
}

- (void)setEditAvatarPosterFlowManager:(id)a3
{
}

- (CNSNaPSetupFlowManager)editAvatarPosterFlowManager
{
  return self->_editAvatarPosterFlowManager;
}

- (void)setTableViewBottomInsets:(double)a3
{
  self->_tableViewBottomInsets = a3;
}

- (double)tableViewBottomInsets
{
  return self->_tableViewBottomInsets;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (void)setShouldSetAsMeContact:(BOOL)a3
{
  self->_shouldSetAsMeContact = a3;
}

- (BOOL)shouldSetAsMeContact
{
  return self->_shouldSetAsMeContact;
}

- (void)setEditingContactAvatarProvider:(id)a3
{
}

- (CNMeCardSharingContactAvatarProvider)editingContactAvatarProvider
{
  return self->_editingContactAvatarProvider;
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

- (void)setTableView:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setShareSwitch:(id)a3
{
}

- (UISwitch)shareSwitch
{
  return self->_shareSwitch;
}

- (void)setSectionDataSources:(id)a3
{
}

- (NSArray)sectionDataSources
{
  return self->_sectionDataSources;
}

- (void)setPhotoPicker:(id)a3
{
}

- (CNPhotoPickerViewController)photoPicker
{
  return self->_photoPicker;
}

- (CNMeCardSharingAudienceDataSource)sharingAudienceDataSource
{
  return self->_sharingAudienceDataSource;
}

- (CNMeCardSharingEnabledDataSource)enabledDataSource
{
  return self->_enabledDataSource;
}

- (CNMeCardSharingSettingsNameDataSource)nameDataSource
{
  return self->_nameDataSource;
}

- (CNMeCardSharingNameProvider)nameProvider
{
  return self->_nameProvider;
}

- (CNMeCardSharingAvatarProvider)avatarProvider
{
  return self->_avatarProvider;
}

- (void)setHeaderViewController:(id)a3
{
}

- (CNMeCardSharingSettingsHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (CNMeCardSharingPickerLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setMeCardUpdater:(id)a3
{
}

- (CNSharingProfileMeCardUpdater)meCardUpdater
{
  return self->_meCardUpdater;
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

- (void)setEditingContactImage:(id)a3
{
}

- (CNContactImage)editingContactImage
{
  return self->_editingContactImage;
}

- (void)setEditingContact:(id)a3
{
}

- (CNMutableContact)editingContact
{
  return self->_editingContact;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setDelegate:(id)a3
{
}

- (CNMeCardSharingSettingsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNMeCardSharingSettingsViewControllerDelegate *)WeakRetained;
}

- (BOOL)multiplePhoneNumbersTiedToAppleID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getIMNicknameControllerClass_softClass;
  uint64_t v9 = getIMNicknameControllerClass_softClass;
  if (!getIMNicknameControllerClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getIMNicknameControllerClass_block_invoke;
    v5[3] = &unk_1E549AD00;
    v5[4] = &v6;
    __getIMNicknameControllerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return [v3 multiplePhoneNumbersTiedToAppleID];
}

- (void)sharingSettingsPreferenceMenuCell:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  uint64_t v6 = [(CNMeCardSharingSettingsViewController *)self sharingAudienceDataSource];
  [(id)v6 setSelectedSharingAudience:a4];

  v7 = [(CNMeCardSharingSettingsViewController *)self delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v8 = [(CNMeCardSharingSettingsViewController *)self delegate];
    objc_msgSend(v8, "sharingSettingsViewController:didSelectSharingAudience:", self, -[CNMeCardSharingAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"));
  }
  id v9 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v9 reloadData];
}

- (BOOL)isPresentingModalViewController
{
  v2 = [(CNMeCardSharingSettingsViewController *)self presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
}

- (void)sender:(id)a3 presentViewController:(id)a4
{
}

- (void)avatarPosterEditorFromFlowManager:(id)a3 didUpdateContact:(id)a4 withVisualIdentity:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F1B918];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 alloc];
  v11 = [v8 imageData];
  [v8 cropRect];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [MEMORY[0x1E4F1C9C8] now];
  v21 = (CNContactImage *)objc_msgSend(v10, "initWithImageData:cropRect:lastUsedDate:", v11, v20, v13, v15, v17, v19);
  editingContactImage = self->_editingContactImage;
  self->_editingContactImage = v21;

  uint64_t v23 = [v8 contactImageSource];
  [(CNContactImage *)self->_editingContactImage setSource:v23];
  [(CNMeCardSharingSettingsViewController *)self updateContact:self->_editingContact withEditedContact:v9];

  if (self->_editingContactAvatarProvider)
  {
    v24 = [(CNMeCardSharingSettingsViewController *)self headerViewController];
    [v24 reload];
  }
  else
  {
    v25 = [[CNMeCardSharingContactAvatarProvider alloc] initWithContact:self->_editingContact];
    editingContactAvatarProvider = self->_editingContactAvatarProvider;
    self->_editingContactAvatarProvider = v25;

    v24 = [(CNMeCardSharingSettingsViewController *)self headerViewController];
    [v24 updateWithAvatarProvider:self->_editingContactAvatarProvider];
  }

  [(CNMeCardSharingSettingsViewController *)self preWarmContactPosterForContact:self->_editingContact];
  v27 = [(CNMeCardSharingSettingsViewController *)self editingContact];
  v28 = [v27 givenName];
  v29 = [(CNMeCardSharingSettingsViewController *)self givenNameField];
  [v29 setText:v28];

  v30 = [(CNMeCardSharingSettingsViewController *)self editingContact];
  v31 = [v30 familyName];
  v32 = [(CNMeCardSharingSettingsViewController *)self familyNameField];
  [v32 setText:v31];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __111__CNMeCardSharingSettingsViewController_avatarPosterEditorFromFlowManager_didUpdateContact_withVisualIdentity___block_invoke;
  v33[3] = &unk_1E549B488;
  v33[4] = self;
  [(CNMeCardSharingSettingsViewController *)self dismissViewControllerAnimated:1 completion:v33];
}

uint64_t __111__CNMeCardSharingSettingsViewController_avatarPosterEditorFromFlowManager_didUpdateContact_withVisualIdentity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) promptForSavingToMeCardIfNeeded];
}

- (void)sharingEnabledDataSource:(id)a3 didChangeEnabledState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (_os_feature_enabled_impl()) {
    BOOL v7 = !v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7
    || ![(CNMeCardSharingSettingsViewController *)self multiplePhoneNumbersTiedToAppleID])
  {
    [(CNMeCardSharingSettingsViewController *)self notifyOfChangedEnablementState:v4];
  }
  else
  {
    id v8 = objc_opt_new();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__CNMeCardSharingSettingsViewController_sharingEnabledDataSource_didChangeEnabledState___block_invoke;
    v12[3] = &unk_1E54970B0;
    id v13 = v6;
    double v14 = self;
    BOOL v15 = v4;
    [v8 setOnCancel:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__CNMeCardSharingSettingsViewController_sharingEnabledDataSource_didChangeEnabledState___block_invoke_2;
    v10[3] = &unk_1E54970D8;
    v10[4] = self;
    BOOL v11 = v4;
    [v8 setOnContinue:v10];
    id v9 = [[CNPhotoPickerNavigationViewController alloc] initWithRootViewController:v8];
    [(CNPhotoPickerNavigationViewController *)v9 setAllowRotation:0];
    [(CNPhotoPickerNavigationViewController *)v9 setModalPresentationStyle:0];
    [(CNMeCardSharingSettingsViewController *)self presentViewController:v9 animated:1 completion:&__block_literal_global_204];
  }
}

uint64_t __88__CNMeCardSharingSettingsViewController_sharingEnabledDataSource_didChangeEnabledState___block_invoke(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  [*(id *)(a1 + 32) setSharingEnabled:0];
  BOOL v3 = *(void **)(a1 + 40);
  BOOL v4 = *(unsigned char *)(a1 + 48) == 0;

  return [v3 notifyOfChangedEnablementState:v4];
}

uint64_t __88__CNMeCardSharingSettingsViewController_sharingEnabledDataSource_didChangeEnabledState___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);

  return [v3 notifyOfChangedEnablementState:v4];
}

- (void)notifyOfChangedEnablementState:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v5 reloadData];

  id v6 = [(CNMeCardSharingSettingsViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CNMeCardSharingSettingsViewController *)self delegate];
    [v8 sharingSettingsViewController:self didUpdateSharingState:v3];
  }
  if (v3)
  {
    [(CNMeCardSharingSettingsViewController *)self notifyDelegateOfChangesWithDidSaveToMeCard:0];
  }
}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_storeStrong((id *)&self->_editingContactImage, a5);
  if (v7)
  {
    [(CNMeCardSharingSettingsViewController *)self updateContact:self->_editingContact withImagePropertiesFromContact:v7];
    if (self->_editingContactAvatarProvider)
    {
      id v9 = [(CNMeCardSharingSettingsViewController *)self headerViewController];
      [v9 reload];
    }
    else
    {
      id v10 = [[CNMeCardSharingContactAvatarProvider alloc] initWithContact:self->_editingContact];
      editingContactAvatarProvider = self->_editingContactAvatarProvider;
      self->_editingContactAvatarProvider = v10;

      id v9 = [(CNMeCardSharingSettingsViewController *)self headerViewController];
      [v9 updateWithAvatarProvider:self->_editingContactAvatarProvider];
    }
  }
  double v12 = [(CNMeCardSharingSettingsViewController *)self presentedViewController];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__CNMeCardSharingSettingsViewController_photoPicker_didUpdatePhotoForContact_withContactImage___block_invoke;
  v13[3] = &unk_1E549B488;
  v13[4] = self;
  [v12 dismissViewControllerAnimated:1 completion:v13];
}

uint64_t __95__CNMeCardSharingSettingsViewController_photoPicker_didUpdatePhotoForContact_withContactImage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) promptForSavingToMeCardIfNeeded];
}

- (void)photoPickerDidCancel:(id)a3
{
  id v3 = [(CNMeCardSharingSettingsViewController *)self presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)presentNameEditor
{
  id v3 = [CNMeCardSharingSettingsNameEditorViewController alloc];
  uint64_t v4 = [(CNMeCardSharingSettingsViewController *)self textFields];
  id v6 = [(CNMeCardSharingSettingsNameEditorViewController *)v3 initWithTextFields:v4];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
  [(CNMeCardSharingSettingsViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)preWarmContactPosterForContact:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v5 = [v4 featureFlags];
  if ([v5 isFeatureEnabled:16]) {
    BOOL v6 = [(CNMeCardSharingSettingsViewController *)self showsWallpaperSuggestionsGalleryPicker];
  }
  else {
    BOOL v6 = 0;
  }

  id v7 = [(CNMeCardSharingSettingsViewController *)self view];
  id v8 = [v7 window];
  id v9 = [v8 windowScene];

  if (v6)
  {
    id v10 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v11 = [v10 userInterfaceIdiom];

    if ((v11 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      if (v9)
      {
        double v12 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
        id v13 = [v12 nicknameProvider];
        double v14 = [v13 nicknameAsContactForContact:v17];

        BOOL v15 = [[_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer alloc] initWithContact:v17 contactForSharedProfile:v14];
        [(CNMeCardSharingSettingsViewController *)self setCarouselPreWarmer:v15];

        double v16 = [(CNMeCardSharingSettingsViewController *)self carouselPreWarmer];
        [v16 preWarmFirstPosterSnapshotIn:v9];
      }
    }
  }
}

- (void)presentPhotoPickerControllerForContact:(id)a3
{
  id v18 = a3;
  uint64_t v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v5 = [v4 featureFlags];
  if ([v5 isFeatureEnabled:16])
  {
    BOOL v6 = [(CNMeCardSharingSettingsViewController *)self showsWallpaperSuggestionsGalleryPicker];

    if (v6)
    {
      id v7 = [(CNMeCardSharingSettingsViewController *)self editAvatarPosterFlowManager];
      [(CNPhotoPickerViewController *)v7 startEditFlowWithSNaPContact:v18];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v8 = [CNPhotoPickerViewController alloc];
  id v9 = +[CNContactStyle defaultStyle];
  id v10 = +[CNPhotoPickerConfiguration contactsConfiguration];
  uint64_t v11 = [v10 configurationBySettingAllowsPhotoCapture:1];
  id v7 = [(CNPhotoPickerViewController *)v8 initWithContact:v18 style:v9 configuration:v11];

  [(CNPhotoPickerViewController *)v7 setDelegate:self];
  double v12 = CNContactsUIBundle();
  id v13 = [v12 localizedStringForKey:@"SHARING_PHOTOPICKER_ASSIGN_TITLE_OVERRIDE" value:&stru_1ED8AC728 table:@"Localized"];
  [(CNVisualIdentityPickerViewController *)v7 setAssignActionTitleOverride:v13];

  +[CNVisualIdentityPickerViewController defaultContentSize];
  -[CNPhotoPickerViewController setPreferredContentSize:](v7, "setPreferredContentSize:");
  [(CNMeCardSharingSettingsViewController *)self setPhotoPicker:v7];
  double v14 = [(CNMeCardSharingSettingsViewController *)self view];
  BOOL v15 = [v14 window];
  [v15 endEditing:1];

  double v16 = [(CNMeCardSharingSettingsViewController *)self photoPicker];
  id v17 = +[CNPhotoPickerViewController navigationControllerForPicker:v16];

  [(CNMeCardSharingSettingsViewController *)self presentViewController:v17 animated:1 completion:0];
LABEL_6:
}

- (double)viewHeight
{
  v2 = [(CNMeCardSharingSettingsViewController *)self view];
  [v2 bounds];
  double v4 = v3;

  return v4;
}

- (void)sharingSettingsHeaderWasTapped:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__CNMeCardSharingSettingsViewController_sharingSettingsHeaderWasTapped___block_invoke;
  v3[3] = &unk_1E5497060;
  v3[4] = self;
  [(CNMeCardSharingSettingsViewController *)self generateEditingContactWithCompletionHandler:v3];
}

uint64_t __72__CNMeCardSharingSettingsViewController_sharingSettingsHeaderWasTapped___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) presentPhotoPickerControllerForContact:a2];
  }
  return result;
}

- (void)generateEditingContactWithCompletionHandler:(id)a3
{
  id v4 = a3;
  editingContactAvatarProvider = self->_editingContactAvatarProvider;
  if (editingContactAvatarProvider)
  {
    BOOL v6 = editingContactAvatarProvider;
  }
  else
  {
    int v7 = [(CNMeCardSharingAvatarProvider *)self->_avatarProvider conformsToProtocol:&unk_1ED978360];
    avatarProvider = self->_avatarProvider;
    if (!v7)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __85__CNMeCardSharingSettingsViewController_generateEditingContactWithCompletionHandler___block_invoke;
      v22[3] = &unk_1E5497D78;
      v22[4] = self;
      id v23 = v4;
      -[CNMeCardSharingAvatarProvider generateAvatarImageOfSize:imageHandler:](avatarProvider, "generateAvatarImageOfSize:imageHandler:", v22, 220.0, 220.0);

      goto LABEL_7;
    }
    BOOL v6 = avatarProvider;
  }
  id v9 = v6;
  id v10 = [(CNMeCardSharingContactAvatarProvider *)v6 imageData];
  [(CNMeCardSharingContactAvatarProvider *)v9 cropRect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = [(CNMeCardSharingContactAvatarProvider *)v9 thumbnailImageData];
  v20 = [(CNMeCardSharingContactAvatarProvider *)v9 wallpaper];

  v21 = (void *)[(CNMutableContact *)self->_editingContact mutableCopy];
  [v21 setImageData:v10];
  objc_msgSend(v21, "setCropRect:", v12, v14, v16, v18);
  [v21 setThumbnailImageData:v19];
  [v21 setGivenName:self->_editingGivenName];
  [v21 setFamilyName:self->_editingFamilyName];
  [v21 setWallpaper:v20];
  (*((void (**)(id, void *))v4 + 2))(v4, v21);

LABEL_7:
}

void __85__CNMeCardSharingSettingsViewController_generateEditingContactWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  image = a2;
  id v5 = a3;
  BOOL v6 = *(id **)(a1 + 32);
  if (v5)
  {
    int v7 = [v6 logger];
    id v8 = [v5 localizedDescription];
    [v7 logErrorGeneratingAvatarForPhotoPickerWithDescription:v8];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v9 = (void *)[v6[126] mutableCopy];
    id v10 = UIImagePNGRepresentation(image);
    [v9 setImageData:v10];
    objc_msgSend(v9, "setCropRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v9 setThumbnailImageData:v10];
    [v9 setGivenName:*(void *)(*(void *)(a1 + 32) + 1024)];
    [v9 setFamilyName:*(void *)(*(void *)(a1 + 32) + 1032)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)updateContact:(id)a3 withNamePropertiesFromContact:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v5 givenName];
  [v6 setGivenName:v7];

  id v8 = [v5 familyName];

  [v6 setFamilyName:v8];
}

- (void)updateContact:(id)a3 withImagePropertiesFromContact:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v5 imageData];
  [v6 setImageData:v7];

  [v5 cropRect];
  objc_msgSend(v6, "setCropRect:");
  id v8 = [v5 thumbnailImageData];
  [v6 setThumbnailImageData:v8];

  id v9 = [v5 fullscreenImageData];
  [v6 setFullscreenImageData:v9];

  id v10 = [v5 preferredLikenessSource];
  [v6 setPreferredLikenessSource:v10];

  double v11 = [v5 imageType];
  [v6 setImageType:v11];

  double v12 = [v5 imageHash];
  [v6 setImageHash:v12];

  double v13 = [v5 memojiMetadata];
  [v6 setMemojiMetadata:v13];

  double v14 = [v5 wallpaper];
  [v6 setWallpaper:v14];

  id v15 = [v5 watchWallpaperImageData];

  [v6 setWatchWallpaperImageData:v15];
}

- (void)updateContact:(id)a3 withEditedContact:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CNMeCardSharingSettingsViewController *)self updateContact:v7 withImagePropertiesFromContact:v6];
  [(CNMeCardSharingSettingsViewController *)self updateContact:v7 withNamePropertiesFromContact:v6];
}

- (void)saveDraftContact
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  if (self->_shouldSetAsMeContact)
  {
    [(CNMutableContact *)self->_editingContact setGivenName:self->_editingGivenName];
    [(CNMutableContact *)self->_editingContact setFamilyName:self->_editingFamilyName];
    id v4 = self->_editingContact;
    logger = self->_logger;
    id v6 = [(CNMutableContact *)self->_editingContact identifier];
    [(CNSharingProfileLogger *)logger logSettingsSavingContact:v6];

    [v3 addContact:self->_editingContact toContainerWithIdentifier:0];
  }
  else if ([(CNContact *)self->_contact hasBeenPersisted])
  {
    id v4 = (CNMutableContact *)[(CNContact *)self->_contact mutableCopy];
    [(CNMeCardSharingSettingsViewController *)self updateContact:v4 withImagePropertiesFromContact:self->_editingContact];
    id v7 = self->_logger;
    id v8 = [(CNMutableContact *)v4 identifier];
    [(CNSharingProfileLogger *)v7 logSettingsSavingContact:v8];

    [v3 updateContact:v4];
  }
  else
  {
    id v4 = 0;
  }
  id v9 = [(CNMeCardSharingSettingsViewController *)self contactStore];
  id v26 = 0;
  char v10 = [v9 executeSaveRequest:v3 error:&v26];
  id v11 = v26;

  if ((v10 & 1) == 0)
  {
    v20 = self->_logger;
    v21 = [v11 localizedDescription];
    [(CNSharingProfileLogger *)v20 logSettingsErrorSavingContactWithDescription:v21];
LABEL_15:

    goto LABEL_16;
  }
  double v12 = self->_logger;
  if (self->_shouldSetAsMeContact)
  {
    [(CNSharingProfileLogger *)v12 logSettingsSettingMeContact];
    double v13 = [(CNMeCardSharingSettingsViewController *)self contactStore];
    id v25 = 0;
    char v14 = [v13 setMeContact:v4 error:&v25];
    id v15 = v25;

    if ((v14 & 1) == 0)
    {
      v24 = self->_logger;
      v21 = [v15 localizedDescription];
      [(CNSharingProfileLogger *)v24 logSettingsErrorSettingMeContactWithDescription:v21];

      goto LABEL_15;
    }
    self->_shouldSetAsMeContact = 0;
    double v16 = (CNContact *)[(CNMutableContact *)v4 copy];
    contact = self->_contact;
    self->_contact = v16;

    [(CNSharingProfileLogger *)self->_logger logSettingsSuccessSavingContact];
    double v18 = [(CNMeCardSharingSettingsViewController *)self delegate];
    char v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  [(CNSharingProfileLogger *)v12 logSettingsSuccessSavingContact];
  v22 = [(CNMeCardSharingSettingsViewController *)self delegate];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
LABEL_13:
    v21 = [(CNMeCardSharingSettingsViewController *)self delegate];
    [v21 sharingSettingsViewControllerDidUpdateContact:self];
    goto LABEL_15;
  }
LABEL_16:
}

- (void)performSaveToMeCardAction
{
  [(CNMeCardSharingSettingsViewController *)self saveDraftContact];

  [(CNMeCardSharingSettingsViewController *)self notifyDelegateOfChangesWithDidSaveToMeCard:1];
}

- (void)promptForSavingToMeCardIfNeeded
{
  id v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:15];

  if (v5)
  {
    [(CNMeCardSharingSettingsViewController *)self performSaveToMeCardAction];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4FB1418];
    id v7 = CNContactsUIBundle();
    id v8 = [v7 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    id v9 = CNContactsUIBundle();
    char v10 = [v9 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_MESSAGE" value:&stru_1ED8AC728 table:@"Localized"];
    id v11 = [v6 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

    double v12 = (void *)MEMORY[0x1E4FB1410];
    double v13 = CNContactsUIBundle();
    char v14 = [v13 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_CONFIRM" value:&stru_1ED8AC728 table:@"Localized"];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72__CNMeCardSharingSettingsViewController_promptForSavingToMeCardIfNeeded__block_invoke;
    v24[3] = &unk_1E549B590;
    v24[4] = self;
    id v15 = [v12 actionWithTitle:v14 style:0 handler:v24];
    [v11 addAction:v15];

    double v16 = (void *)MEMORY[0x1E4FB1410];
    double v17 = CNContactsUIBundle();
    double v18 = [v17 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __72__CNMeCardSharingSettingsViewController_promptForSavingToMeCardIfNeeded__block_invoke_2;
    v23[3] = &unk_1E549B590;
    v23[4] = self;
    char v19 = [v16 actionWithTitle:v18 style:1 handler:v23];
    [v11 addAction:v19];

    v20 = self;
    v21 = [(CNMeCardSharingSettingsViewController *)v20 presentedViewController];

    if (v21)
    {
      uint64_t v22 = [(CNMeCardSharingSettingsViewController *)v20 presentedViewController];

      v20 = (CNMeCardSharingSettingsViewController *)v22;
    }
    [(CNMeCardSharingSettingsViewController *)v20 presentViewController:v11 animated:1 completion:0];
  }
}

uint64_t __72__CNMeCardSharingSettingsViewController_promptForSavingToMeCardIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSaveToMeCardAction];
}

uint64_t __72__CNMeCardSharingSettingsViewController_promptForSavingToMeCardIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateOfChangesWithDidSaveToMeCard:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [v8 cellForRowAtIndexPath:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CNMeCardSharingSettingsViewController *)self presentNameEditor];
    [v8 deselectRowAtIndexPath:v6 animated:0];
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [a3 cellForRowAtIndexPath:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 row])
  {
    char v10 = [v6 dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v7];

    double v13 = [(CNMeCardSharingSettingsViewController *)self enabledDataSource];
    id v11 = [v13 itemForIndex:0];

    char v14 = [v11 label];
    id v15 = [v10 textLabel];
    [v15 setText:v14];

    [v10 setSelectionStyle:0];
    double v12 = [v11 accessoryView];
    [v10 setAccessoryView:v12];
    goto LABEL_5;
  }
  uint64_t v8 = [v7 row];

  if (v8 == 1)
  {
    id v9 = +[CNMeCardSharingSettingsNameCell cellIdentifier];
    char v10 = [v6 dequeueReusableCellWithIdentifier:v9];

    id v11 = [(CNMeCardSharingSettingsViewController *)self editingGivenName];
    double v12 = [(CNMeCardSharingSettingsViewController *)self editingFamilyName];
    [v10 setUpWithGivenName:v11 familyName:v12];
LABEL_5:

    goto LABEL_7;
  }
  double v16 = +[CNMeCardSharingSettingsPreferenceMenuCell cellIdentifier];
  char v10 = [v6 dequeueReusableCellWithIdentifier:v16];

  objc_msgSend(v10, "setSharingAudience:", -[CNMeCardSharingSettingsViewController selectedSharingAudience](self, "selectedSharingAudience"));
  objc_msgSend(v10, "setEnabled:", -[CNMeCardSharingSettingsViewController sharingEnabled](self, "sharingEnabled"));
  [v10 setDelegate:self];
  [v10 setSelectionStyle:0];
LABEL_7:
  double v17 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v10 setBackgroundColor:v17];

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v4 = [(CNMeCardSharingSettingsViewController *)self sharingAudienceDataSource];
  id v5 = [v4 sectionFooterLabel];

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)textFieldForIndex:(int64_t)a3
{
  id v4 = [(CNMeCardSharingSettingsViewController *)self textFields];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (id)textFields
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if (self->_nameOrder == 2)
  {
    v7[0] = self->_familyNameField;
    v2 = &OBJC_IVAR___CNMeCardSharingSettingsViewController__givenNameField;
    p_givenNameField = (UITextField **)v7;
  }
  else
  {
    givenNameField = self->_givenNameField;
    v2 = &OBJC_IVAR___CNMeCardSharingSettingsViewController__familyNameField;
    p_givenNameField = &givenNameField;
  }
  p_givenNameField[1] = *(UITextField **)((char *)&self->super.super.super.isa + *v2);
  id v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");

  return v4;
}

- (unint64_t)selectedSharingAudience
{
  return [(CNMeCardSharingAudienceDataSource *)self->_sharingAudienceDataSource selectedSharingAudience];
}

- (BOOL)sharingEnabled
{
  return [(CNMeCardSharingEnabledDataSource *)self->_enabledDataSource sharingEnabled];
}

- (void)textFieldDidEndEditing:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(UITextField *)self->_givenNameField text];
  editingGivenName = self->_editingGivenName;
  self->_editingGivenName = v4;

  id v6 = [(UITextField *)self->_familyNameField text];
  editingFamilyName = self->_editingFamilyName;
  self->_editingFamilyName = v6;

  uint64_t v8 = [(CNMeCardSharingSettingsViewController *)self tableView];
  id v9 = [MEMORY[0x1E4F28D58] indexPathForRow:1 inSection:0];
  v11[0] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v8 reloadRowsAtIndexPaths:v10 withRowAnimation:100];

  if (![(CNMeCardSharingSettingsViewController *)self isPresentedInOnboarding]) {
    [(CNMeCardSharingSettingsViewController *)self notifyDelegateOfChangesWithDidSaveToMeCard:0];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = (UITextField *)a3;
  id v5 = v4;
  int64_t nameOrder = self->_nameOrder;
  if ((nameOrder != 2 || self->_familyNameField == v4) && self->_givenNameField == v4)
  {
    if (nameOrder == 2) {
      id v7 = &OBJC_IVAR___CNMeCardSharingSettingsViewController__givenNameField;
    }
    else {
      id v7 = &OBJC_IVAR___CNMeCardSharingSettingsViewController__familyNameField;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v7) becomeFirstResponder];
  }
  else
  {
    [(UITextField *)v4 resignFirstResponder];
  }

  return 0;
}

- (void)updateTableViewBottomPaddingIfNeeded
{
  id v3 = [(CNMeCardSharingSettingsViewController *)self buttonTray];
  [v3 frame];
  double v5 = v4;

  if (v5 > 0.0)
  {
    id v6 = [(CNMeCardSharingSettingsViewController *)self tableView];
    [v6 _bottomPadding];
    double v8 = v7;

    if (v8 < v5)
    {
      id v9 = [(CNMeCardSharingSettingsViewController *)self tableView];
      [v9 _setBottomPadding:v5];
    }
  }
}

- (double)availableHeaderHeight
{
  id v3 = [(CNMeCardSharingSettingsViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  id v6 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v6 rectForSection:0];
  double v8 = v7;

  id v9 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v9 rectForFooterInSection:0];
  double v11 = v10;

  double v12 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v12 _bottomPadding];
  double v14 = v5 - v8 - v11 - v13;
  id v15 = [(CNMeCardSharingSettingsViewController *)self view];
  [v15 safeAreaInsets];
  double v17 = v14 - v16;

  return v17;
}

- (void)updateHeaderViewFrame
{
  [(CNMeCardSharingSettingsViewController *)self availableHeaderHeight];
  double v4 = v3;
  [(CNMeCardSharingSettingsHeaderViewController *)self->_headerViewController minHeight];
  if (v4 >= v5) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  [(CNMeCardSharingSettingsHeaderViewController *)self->_headerViewController maxHeight];
  if (v6 >= v7) {
    double v6 = v7;
  }
  double v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    [(CNMeCardSharingSettingsHeaderViewController *)self->_headerViewController minBottomPadding];
    double v6 = v6 + fmax((v4 - v6 - v10) * 0.5, 0.0);
  }
  double v11 = [(CNMeCardSharingSettingsViewController *)self view];
  [v11 bounds];
  double v13 = v12;

  double v14 = [(CNMeCardSharingSettingsHeaderViewController *)self->_headerViewController view];
  [v14 frame];
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v13;
  v19.size.height = v6;
  BOOL v15 = CGRectEqualToRect(v18, v19);

  if (!v15)
  {
    id v16 = [(CNMeCardSharingSettingsHeaderViewController *)self->_headerViewController view];
    objc_msgSend(v16, "setFrame:", 0.0, 0.0, v13, v6);
  }
}

- (void)updateHeaderViewFrameAndTableView
{
  [(CNMeCardSharingSettingsViewController *)self updateHeaderViewFrame];
  id v4 = [(CNMeCardSharingSettingsHeaderViewController *)self->_headerViewController view];
  double v3 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v3 setTableHeaderView:v4];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  id v4 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v4 reloadData];

  [(CNMeCardSharingSettingsViewController *)self updateHeaderViewFrameAndTableView];
}

- (void)adjustInsetsForKeyboardOverlap:(double)a3
{
  [(CNMeCardSharingSettingsViewController *)self keyboardHeight];
  if (v5 != a3) {
    [(CNMeCardSharingSettingsViewController *)self setKeyboardHeight:a3];
  }
  double v6 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v6 contentInset];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  if (v12 >= a3)
  {
    if (a3 != 0.0) {
      return;
    }
    [(CNMeCardSharingSettingsViewController *)self tableViewBottomInsets];
    double v15 = v16;
  }
  else
  {
    [(CNMeCardSharingSettingsViewController *)self setTableViewBottomInsets:v12];
    double v15 = v12 + a3;
  }
  if (v15 != v12)
  {
    double v17 = [(CNMeCardSharingSettingsViewController *)self tableView];
    [v17 contentOffset];
    double v19 = v18;
    double v21 = v20;
    double v22 = *MEMORY[0x1E4F1DAD8];
    double v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);

    v24 = [(CNMeCardSharingSettingsViewController *)self tableView];
    objc_msgSend(v24, "setContentInset:", v8, v10, v15, v14);

    id v25 = [(CNMeCardSharingSettingsViewController *)self tableView];
    objc_msgSend(v25, "setScrollIndicatorInsets:", v8, v10, v15, v14);

    if (v22 == v19 && v23 == v21)
    {
      v27 = [(CNMeCardSharingSettingsViewController *)self tableView];
      [v27 contentOffset];
      double v29 = v28;
      double v30 = -v8;

      if (v29 != v30)
      {
        id v34 = [(CNMeCardSharingSettingsViewController *)self tableView];
        [v34 contentOffset];
        double v32 = v31;
        v33 = [(CNMeCardSharingSettingsViewController *)self tableView];
        objc_msgSend(v33, "setContentOffset:", v32, v30);
      }
    }
  }
}

- (void)keyboardWillHide:(id)a3
{
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  id v31 = [(CNMeCardSharingSettingsViewController *)self view];
  double v14 = [v31 window];
  objc_msgSend(v14, "convertRect:fromWindow:", 0, v7, v9, v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  objc_msgSend(v31, "convertRect:fromView:", 0, v16, v18, v20, v22);
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  [v31 bounds];
  v35.origin.x = v24;
  v35.origin.y = v26;
  v35.size.width = v28;
  v35.size.height = v30;
  CGRect v34 = CGRectIntersection(v33, v35);
  [(CNMeCardSharingSettingsViewController *)self adjustInsetsForKeyboardOverlap:CGRectGetHeight(v34)];
}

- (void)familyNameDidChange:(id)a3
{
  id v4 = [a3 text];
  editingFamilyName = self->_editingFamilyName;
  self->_editingFamilyName = v4;
}

- (void)givenNameDidChange:(id)a3
{
  id v4 = [a3 text];
  editingGivenName = self->_editingGivenName;
  self->_editingGivenName = v4;
}

- (void)notifyDelegateOfChangesWithDidSaveMeCard:(BOOL)a3 contactImage:(id)a4 sharingResult:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  logger = self->_logger;
  double v10 = [v8 description];
  [(CNSharingProfileLogger *)logger logSettingsReturningSharingResultWithDescription:v10];

  uint64_t v11 = *MEMORY[0x1E4F5A268];
  double v12 = [v7 imageData];
  LOBYTE(v11) = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  if ((v11 & 1) == 0) {
    goto LABEL_8;
  }
  if (!self->_editingContactImage)
  {
    [(CNSharingProfileLogger *)self->_logger logSettingsReturningEmptyImageForNoChange];
LABEL_8:
    double v14 = [(CNMeCardSharingSettingsViewController *)self delegate];
    [v14 sharingSettingsViewController:self didUpdateWithSharingResult:v8];

    goto LABEL_9;
  }
  if ([v7 source] == 1)
  {
    double v13 = [v7 variant];

    if (!v13)
    {
      [(CNSharingProfileLogger *)self->_logger logSettingsReturningDefaultMonogram];
      goto LABEL_8;
    }
  }
  [(CNSharingProfileLogger *)self->_logger logSettingsReturningEmptyImage];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __109__CNMeCardSharingSettingsViewController_notifyDelegateOfChangesWithDidSaveMeCard_contactImage_sharingResult___block_invoke;
  v15[3] = &unk_1E549BF80;
  v15[4] = self;
  id v16 = v8;
  [(CNMeCardSharingSettingsViewController *)self presentErrorAlertForEmptyPhotoIfNeededWithCompletion:v15];

LABEL_9:
}

void __109__CNMeCardSharingSettingsViewController_notifyDelegateOfChangesWithDidSaveMeCard_contactImage_sharingResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 sharingSettingsViewController:*(void *)(a1 + 32) didUpdateWithSharingResult:*(void *)(a1 + 40)];
}

- (void)notifyDelegateOfChangesWithDidSaveToMeCard:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CNMeCardSharingSettingsViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    editingContactImage = self->_editingContactImage;
    id v8 = [(CNMutableContact *)self->_editingContact imageData];
    double v9 = (void *)[(CNContactImage *)editingContactImage copyWithNewImageData:v8];

    double v10 = (void *)MEMORY[0x1E4F1BAD8];
    uint64_t v11 = [(CNMutableContact *)self->_editingContact thumbnailImageData];
    double v12 = [v10 fingerprintForData:v11];

    [v9 setVisualFingerprint:v12];
    uint64_t v13 = *MEMORY[0x1E4F5A268];
    double v14 = [(CNMutableContact *)self->_editingContact wallpaper];
    double v15 = [v14 posterArchiveData];
    char v16 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v15);

    double v17 = [(CNMutableContact *)self->_editingContact wallpaper];
    editingContact = self->_editingContact;
    if (v16)
    {
      double v19 = [(CNMutableContact *)self->_editingContact watchWallpaperImageData];
      double v20 = [(CNMeCardSharingSettingsViewController *)self sharingResultWithContactImage:v9 wallpaper:v17 watchWallpaperImageData:v19 didSaveToMeCard:v3];

      [(CNMeCardSharingSettingsViewController *)self notifyDelegateOfChangesWithDidSaveMeCard:v3 contactImage:v9 sharingResult:v20];
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __84__CNMeCardSharingSettingsViewController_notifyDelegateOfChangesWithDidSaveToMeCard___block_invoke;
      v21[3] = &unk_1E5497088;
      v21[4] = self;
      id v22 = v9;
      BOOL v23 = v3;
      [v17 snapshotImageDataForWatchForContact:editingContact completion:v21];
    }
  }
}

void __84__CNMeCardSharingSettingsViewController_notifyDelegateOfChangesWithDidSaveToMeCard___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 1008) wallpaper];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A268] + 16))() & 1) == 0) {
    [v3 setGeneratedWatchImageData:v5];
  }
  id v4 = [*(id *)(a1 + 32) sharingResultWithContactImage:*(void *)(a1 + 40) wallpaper:v3 watchWallpaperImageData:v5 didSaveToMeCard:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) notifyDelegateOfChangesWithDidSaveMeCard:*(unsigned __int8 *)(a1 + 48) contactImage:*(void *)(a1 + 40) sharingResult:v4];
}

- (id)sharingResultWithContactImage:(id)a3 wallpaper:(id)a4 watchWallpaperImageData:(id)a5 didSaveToMeCard:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [CNMeCardSharingResult alloc];
  editingGivenName = self->_editingGivenName;
  editingFamilyName = self->_editingFamilyName;
  char v16 = [v12 resizedContactImageForMeCardSharing];

  double v17 = [(CNMeCardSharingResult *)v13 initWithGivenName:editingGivenName familyName:editingFamilyName contactImage:v16 wallpaper:v11 watchWallpaperImageData:v10 didSaveImageToMeCard:v6];

  return v17;
}

- (void)didTapContinueButton:(id)a3
{
  id v4 = [(CNMeCardSharingSettingsViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v6 = [(CNMeCardSharingSettingsViewController *)self delegate];
    objc_msgSend(v6, "sharingSettingsViewController:didUpdateSharingState:", self, -[CNMeCardSharingSettingsViewController sharingEnabled](self, "sharingEnabled"));
  }
  id v7 = [(CNMeCardSharingSettingsViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(CNMeCardSharingSettingsViewController *)self delegate];
    objc_msgSend(v9, "sharingSettingsViewController:didSelectSharingAudience:", self, -[CNMeCardSharingAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"));
  }

  [(CNMeCardSharingSettingsViewController *)self promptForSavingToMeCardIfNeeded];
}

- (void)presentErrorAlertForEmptyPhotoIfNeededWithCompletion:(id)a3
{
  BOOL v3 = (void (**)(void))a3;
  if ([MEMORY[0x1E4F1B8F8] nameAndPhotoSharingDebugUIEnabled])
  {
    id v4 = (void *)MEMORY[0x1E4FB1418];
    char v5 = CNContactsUIBundle();
    BOOL v6 = [v5 localizedStringForKey:@"Uh Oh" value:&stru_1ED8AC728 table:@"Localized"];
    id v7 = CNContactsUIBundle();
    char v8 = [v7 localizedStringForKey:@"Empty image returned to Messages for Name + Photo" value:&stru_1ED8AC728 table:@"Localized"];
    double v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

    id v10 = (void *)MEMORY[0x1E4FB1410];
    id v11 = CNContactsUIBundle();
    id v12 = [v11 localizedStringForKey:@"OK" value:&stru_1ED8AC728 table:@"Localized"];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __94__CNMeCardSharingSettingsViewController_presentErrorAlertForEmptyPhotoIfNeededWithCompletion___block_invoke;
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

uint64_t __94__CNMeCardSharingSettingsViewController_presentErrorAlertForEmptyPhotoIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)viewDidLayoutSubviews
{
  [(CNMeCardSharingSettingsViewController *)self updateTableViewBottomPaddingIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)CNMeCardSharingSettingsViewController;
  [(CNMeCardSharingSettingsViewController *)&v3 viewDidLayoutSubviews];
  [(CNMeCardSharingSettingsViewController *)self updateHeaderViewFrameAndTableView];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNMeCardSharingSettingsViewController;
  [(CNMeCardSharingSettingsViewController *)&v5 viewIsAppearing:a3];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__CNMeCardSharingSettingsViewController_viewIsAppearing___block_invoke;
  v4[3] = &unk_1E5497060;
  v4[4] = self;
  [(CNMeCardSharingSettingsViewController *)self generateEditingContactWithCompletionHandler:v4];
}

uint64_t __57__CNMeCardSharingSettingsViewController_viewIsAppearing___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) preWarmContactPosterForContact:a2];
  }
  return result;
}

- (void)viewDidLoad
{
  v111[5] = *MEMORY[0x1E4F143B8];
  v110.receiver = self;
  v110.super_class = (Class)CNMeCardSharingSettingsViewController;
  [(CNMeCardSharingSettingsViewController *)&v110 viewDidLoad];
  objc_super v3 = [(CNMeCardSharingSettingsViewController *)self navigationItem];
  [v3 _setBackgroundHidden:1];

  id v4 = [(CNMeCardSharingSettingsViewController *)self navigationItem];
  [v4 setLargeTitleDisplayMode:2];

  id v5 = objc_alloc(MEMORY[0x1E4FB1D00]);
  BOOL v6 = [(CNMeCardSharingSettingsViewController *)self view];
  [v6 bounds];
  id v7 = objc_msgSend(v5, "initWithFrame:style:", 2);
  [(CNMeCardSharingSettingsViewController *)self setTableView:v7];

  char v8 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v8 setAutoresizingMask:18];

  double v9 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v9 setDelegate:self];

  id v10 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v10 setDataSource:self];

  id v11 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v11 registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];

  id v12 = [(CNMeCardSharingSettingsViewController *)self tableView];
  uint64_t v13 = objc_opt_class();
  double v14 = +[CNMeCardSharingSettingsNameCell cellIdentifier];
  [v12 registerClass:v13 forCellReuseIdentifier:v14];

  double v15 = [(CNMeCardSharingSettingsViewController *)self tableView];
  uint64_t v16 = objc_opt_class();
  double v17 = +[CNMeCardSharingSettingsPreferenceMenuCell cellIdentifier];
  [v15 registerClass:v16 forCellReuseIdentifier:v17];

  double v18 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v18 setContentInsetAdjustmentBehavior:2];

  double v19 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v19 setAutomaticallyAdjustsScrollIndicatorInsets:0];

  double v20 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v20 setShowsVerticalScrollIndicator:0];

  double v21 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v22 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v22 setBackgroundColor:v21];

  BOOL v23 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v23 _setTopPadding:0.0];

  CGFloat v24 = [(CNMeCardSharingSettingsViewController *)self tableView];
  double v25 = [(CNMeCardSharingSettingsViewController *)self tabBarController];
  CGFloat v26 = [v25 tabBar];
  [v26 bounds];
  double v28 = v27;
  [v24 _bottomPadding];
  [v24 _setBottomPadding:v29 + v28];

  CGFloat v30 = [(CNMeCardSharingSettingsViewController *)self view];
  id v31 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v30 addSubview:v31];

  [(CNMeCardSharingSettingsViewController *)self updateHeaderViewFrame];
  double v32 = [(CNMeCardSharingSettingsHeaderViewController *)self->_headerViewController view];
  [v32 setAutoresizingMask:2];

  [(CNMeCardSharingSettingsHeaderViewController *)self->_headerViewController willMoveToParentViewController:self];
  [(CNMeCardSharingSettingsViewController *)self addChildViewController:self->_headerViewController];
  CGRect v33 = [(CNMeCardSharingSettingsHeaderViewController *)self->_headerViewController view];
  CGRect v34 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v34 setTableHeaderView:v33];

  CGRect v35 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v36 = [(CNMeCardSharingSettingsHeaderViewController *)self->_headerViewController view];
  [v36 setBackgroundColor:v35];

  [(CNMeCardSharingSettingsHeaderViewController *)self->_headerViewController didMoveToParentViewController:self];
  id v37 = objc_alloc(MEMORY[0x1E4FB1D70]);
  double v38 = *MEMORY[0x1E4F1DB28];
  double v39 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v40 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v41 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v42 = (UITextField *)objc_msgSend(v37, "initWithFrame:", *MEMORY[0x1E4F1DB28], v39, v40, v41);
  givenNameField = self->_givenNameField;
  self->_givenNameField = v42;

  uint64_t v44 = *MEMORY[0x1E4FB28C8];
  v45 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UITextField *)self->_givenNameField setFont:v45];

  [(UITextField *)self->_givenNameField setAdjustsFontForContentSizeCategory:1];
  [(UITextField *)self->_givenNameField setAutocorrectionType:1];
  v46 = [(CNMeCardSharingNameProvider *)self->_nameProvider givenName];
  [(UITextField *)self->_givenNameField setText:v46];

  v47 = CNContactsUIBundle();
  v48 = [v47 localizedStringForKey:@"SHARING_GIVEN_NAME_PLACEHOLDER" value:&stru_1ED8AC728 table:@"Localized"];
  [(UITextField *)self->_givenNameField setPlaceholder:v48];

  [(UITextField *)self->_givenNameField addTarget:self action:sel_givenNameDidChange_ forControlEvents:0x20000];
  [(UITextField *)self->_givenNameField setDelegate:self];
  v49 = (UITextField *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D70]), "initWithFrame:", v38, v39, v40, v41);
  familyNameField = self->_familyNameField;
  self->_familyNameField = v49;

  v51 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v44];
  [(UITextField *)self->_familyNameField setFont:v51];

  [(UITextField *)self->_familyNameField setAutocorrectionType:1];
  [(UITextField *)self->_familyNameField setAdjustsFontForContentSizeCategory:1];
  v52 = [(CNMeCardSharingNameProvider *)self->_nameProvider familyName];
  [(UITextField *)self->_familyNameField setText:v52];

  v53 = CNContactsUIBundle();
  v54 = [v53 localizedStringForKey:@"SHARING_FAMILY_NAME_PLACEHOLDER" value:&stru_1ED8AC728 table:@"Localized"];
  [(UITextField *)self->_familyNameField setPlaceholder:v54];

  [(UITextField *)self->_familyNameField addTarget:self action:sel_familyNameDidChange_ forControlEvents:0x20000];
  [(UITextField *)self->_familyNameField setDelegate:self];
  uint64_t v55 = [(CNContact *)self->_contact givenName];
  if (v55
    && (v56 = (void *)v55,
        [(CNContact *)self->_contact familyName],
        v57 = objc_claimAutoreleasedReturnValue(),
        v57,
        v56,
        v57))
  {
    id v58 = 0;
  }
  else
  {
    id v58 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    v59 = [(CNContact *)self->_contact givenName];
    [v58 setGivenName:v59];

    v60 = [(CNContact *)self->_contact familyName];
    [v58 setFamilyName:v60];
  }
  self->_int64_t nameOrder = [MEMORY[0x1E4F28F38] _nameOrderWithOverridesForComponents:v58 options:0];
  v61 = [(CNMeCardSharingSettingsViewController *)self tableView];
  [v61 setKeyboardDismissMode:2];

  v62 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v62 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

  v63 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v63 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];

  v64 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v64 addObserver:self selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

  if ([(CNMeCardSharingSettingsViewController *)self isPresentedInOnboarding])
  {
    v65 = [MEMORY[0x1E4F83A78] boldButton];
    [(CNMeCardSharingSettingsViewController *)self setContinueButton:v65];

    v66 = [(CNMeCardSharingSettingsViewController *)self continueButton];
    v67 = CNContactsUIBundle();
    v68 = [v67 localizedStringForKey:@"SHARING_DONE" value:&stru_1ED8AC728 table:@"Localized"];
    [v66 setTitle:v68 forState:0];

    v69 = [(CNMeCardSharingSettingsViewController *)self continueButton];
    [v69 addTarget:self action:sel_didTapContinueButton_ forControlEvents:64];

    v70 = [(CNMeCardSharingSettingsViewController *)self continueButton];
    [v70 setTranslatesAutoresizingMaskIntoConstraints:0];

    v71 = objc_msgSend(objc_alloc(MEMORY[0x1E4F83A90]), "initWithFrame:", v38, v39, v40, v41);
    [(CNMeCardSharingSettingsViewController *)self setButtonTray:v71];

    v72 = [(CNMeCardSharingSettingsViewController *)self buttonTray];
    [v72 setTranslatesAutoresizingMaskIntoConstraints:0];

    v73 = [(CNMeCardSharingSettingsViewController *)self buttonTray];
    v74 = [(CNMeCardSharingSettingsViewController *)self continueButton];
    [v73 addButton:v74];

    v75 = [(CNMeCardSharingSettingsViewController *)self tableView];
    v76 = [v75 backgroundColor];
    v77 = [(CNMeCardSharingSettingsViewController *)self buttonTray];
    [v77 setBackgroundColor:v76];

    v78 = [(CNMeCardSharingSettingsViewController *)self view];
    v79 = [(CNMeCardSharingSettingsViewController *)self buttonTray];
    [v78 addSubview:v79];

    v96 = (void *)MEMORY[0x1E4F28DC8];
    v108 = [(CNMeCardSharingSettingsViewController *)self buttonTray];
    v106 = [v108 leadingAnchor];
    v107 = [(CNMeCardSharingSettingsViewController *)self view];
    v105 = [v107 layoutMarginsGuide];
    v104 = [v105 leadingAnchor];
    v103 = [v106 constraintEqualToAnchor:v104];
    v111[0] = v103;
    v102 = [(CNMeCardSharingSettingsViewController *)self buttonTray];
    v100 = [v102 trailingAnchor];
    v101 = [(CNMeCardSharingSettingsViewController *)self view];
    v99 = [v101 layoutMarginsGuide];
    v98 = [v99 trailingAnchor];
    v97 = [v100 constraintEqualToAnchor:v98];
    v111[1] = v97;
    v95 = [(CNMeCardSharingSettingsViewController *)self buttonTray];
    v93 = [v95 bottomAnchor];
    v94 = [(CNMeCardSharingSettingsViewController *)self view];
    v92 = [v94 bottomAnchor];
    v91 = [v93 constraintEqualToAnchor:v92];
    v111[2] = v91;
    v90 = [(CNMeCardSharingSettingsViewController *)self continueButton];
    v80 = [v90 leadingAnchor];
    [(CNMeCardSharingSettingsViewController *)self buttonTray];
    v81 = id v109 = v58;
    v82 = [v81 leadingAnchor];
    v83 = [v80 constraintEqualToAnchor:v82];
    v111[3] = v83;
    v84 = [(CNMeCardSharingSettingsViewController *)self continueButton];
    v85 = [v84 trailingAnchor];
    v86 = [(CNMeCardSharingSettingsViewController *)self buttonTray];
    v87 = [v86 trailingAnchor];
    v88 = [v85 constraintEqualToAnchor:v87];
    v111[4] = v88;
    v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:5];
    [v96 activateConstraints:v89];

    id v58 = v109;
  }
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharingSettingsViewController;
  [(CNMeCardSharingSettingsViewController *)&v4 dealloc];
}

- (CNMeCardSharingSettingsViewController)initWithContactStore:(id)a3 contact:(id)a4 avatarProvider:(id)a5 nameProvider:(id)a6 sharingEnabled:(BOOL)a7 selectedSharingAudience:(unint64_t)a8 showsWallpaperSuggestionsGalleryPicker:(BOOL)a9 headerMode:(int64_t)a10 presentedInOnboarding:(BOOL)a11
{
  BOOL v11 = a7;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  v58.receiver = self;
  v58.super_class = (Class)CNMeCardSharingSettingsViewController;
  double v21 = [(CNMeCardSharingSettingsViewController *)&v58 initWithNibName:0 bundle:0];
  id v22 = v21;
  if (!v21) {
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v21->_contactStore, a3);
  objc_storeStrong((id *)&v22->_contact, a4);
  v22->_isPresentedInOnboarding = a11;
  if (!v18)
  {
    double v25 = (CNMutableContact *)objc_alloc_init(MEMORY[0x1E4F1BA40]);
    editingContact = v22->_editingContact;
    v22->_editingContact = v25;

LABEL_7:
    v22->_shouldSetAsMeContact = 1;
    goto LABEL_8;
  }
  uint64_t v23 = [v18 mutableCopy];
  CGFloat v24 = v22->_editingContact;
  v22->_editingContact = (CNMutableContact *)v23;

  if (v22->_isPresentedInOnboarding && ([v18 hasBeenPersisted] & 1) == 0) {
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v27 = +[CNMeCardSharingPickerLayoutAttributes layoutAttributesForSettings];
  layoutAttributes = v22->_layoutAttributes;
  v22->_layoutAttributes = (CNMeCardSharingPickerLayoutAttributes *)v27;

  objc_storeStrong((id *)&v22->_avatarProvider, a5);
  v22->_showsWallpaperSuggestionsGalleryPicker = a9;
  double v29 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v30 = [v29 userInterfaceIdiom];

  if ((v30 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    int64_t v31 = 0;
  }
  else {
    int64_t v31 = a10;
  }
  v22->_headerMode = v31;
  double v32 = [[CNMeCardSharingSettingsHeaderViewController alloc] initWithAvatarProvider:v22->_avatarProvider mode:v22->_headerMode];
  headerViewController = v22->_headerViewController;
  v22->_headerViewController = v32;

  [(CNMeCardSharingSettingsHeaderViewController *)v22->_headerViewController setDelegate:v22];
  id v17 = v56;
  CGRect v34 = [[CNSNaPSetupFlowManager alloc] initWithPresenterDelegate:v22 contactStore:v56 mode:v22->_headerMode];
  editAvatarPosterFlowManager = v22->_editAvatarPosterFlowManager;
  v22->_editAvatarPosterFlowManager = v34;

  [(CNSNaPSetupFlowManager *)v22->_editAvatarPosterFlowManager setDelegate:v22];
  v36 = [[CNSharedProfileOnboardingController alloc] initWithContactStore:v56];
  snapOnboardingController = v22->_snapOnboardingController;
  v22->_snapOnboardingController = v36;

  double v38 = [MEMORY[0x1E4F1CA48] array];
  p_nameProvider = (id *)&v22->_nameProvider;
  objc_storeStrong((id *)&v22->_nameProvider, a6);
  double v40 = objc_alloc_init(CNMeCardSharingSettingsNameDataSource);
  nameDataSource = v22->_nameDataSource;
  v22->_nameDataSource = v40;

  [v38 addObject:v22->_nameDataSource];
  v42 = [[CNMeCardSharingEnabledDataSource alloc] initWithSharingEnabled:v11];
  enabledDataSource = v22->_enabledDataSource;
  v22->_enabledDataSource = v42;

  [(CNMeCardSharingEnabledDataSource *)v22->_enabledDataSource setDelegate:v22];
  [v38 addObject:v22->_enabledDataSource];
  uint64_t v44 = [[CNMeCardSharingAudienceDataSource alloc] initWithSelectedSharingAudience:a8];
  sharingAudienceDataSource = v22->_sharingAudienceDataSource;
  v22->_sharingAudienceDataSource = v44;

  if (v11) {
    [v38 addObject:v22->_sharingAudienceDataSource];
  }
  uint64_t v46 = [v38 copy];
  sectionDataSources = v22->_sectionDataSources;
  v22->_sectionDataSources = (NSArray *)v46;

  uint64_t v48 = [*p_nameProvider givenName];
  editingGivenName = v22->_editingGivenName;
  v22->_editingGivenName = (NSString *)v48;

  uint64_t v50 = [*p_nameProvider familyName];
  editingFamilyName = v22->_editingFamilyName;
  v22->_editingFamilyName = (NSString *)v50;

  v52 = objc_alloc_init(CNSharingProfileLogger);
  logger = v22->_logger;
  v22->_logger = v52;

  v54 = v22;
LABEL_14:

  return v22;
}

- (CNMeCardSharingSettingsViewController)initWithContactStore:(id)a3 contact:(id)a4 avatarProvider:(id)a5 nameProvider:(id)a6 sharingEnabled:(BOOL)a7 selectedSharingAudience:(unint64_t)a8 showsWallpaperSuggestionsGalleryPicker:(BOOL)a9 headerMode:(int64_t)a10
{
  LOBYTE(v12) = 0;
  LOBYTE(v11) = a9;
  return [(CNMeCardSharingSettingsViewController *)self initWithContactStore:a3 contact:a4 avatarProvider:a5 nameProvider:a6 sharingEnabled:a7 selectedSharingAudience:a8 showsWallpaperSuggestionsGalleryPicker:v11 headerMode:a10 presentedInOnboarding:v12];
}

- (CNMeCardSharingSettingsViewController)initWithContactStore:(id)a3 contact:(id)a4 avatarProvider:(id)a5 nameProvider:(id)a6 sharingEnabled:(BOOL)a7 selectedSharingAudience:(unint64_t)a8
{
  BOOL v9 = a7;
  double v14 = (void *)MEMORY[0x1E4F5A3D8];
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [v14 currentEnvironment];
  id v20 = [v19 featureFlags];
  LOBYTE(v24) = 0;
  LOBYTE(v23) = [v20 isFeatureEnabled:16];
  double v21 = [(CNMeCardSharingSettingsViewController *)self initWithContactStore:v18 contact:v17 avatarProvider:v16 nameProvider:v15 sharingEnabled:v9 selectedSharingAudience:a8 showsWallpaperSuggestionsGalleryPicker:v23 headerMode:0 presentedInOnboarding:v24];

  return v21;
}

- (id)initForOnboardingWithContactStore:(id)a3 contact:(id)a4 avatarProvider:(id)a5 nameProvider:(id)a6 sharingEnabled:(BOOL)a7 selectedSharingAudience:(unint64_t)a8 showsWallpaperSuggestionsGalleryPicker:(BOOL)a9 headerMode:(int64_t)a10
{
  BOOL v11 = a7;
  id v16 = a4;
  LOBYTE(v32) = 1;
  LOBYTE(v31) = a9;
  id v17 = [(CNMeCardSharingSettingsViewController *)self initWithContactStore:a3 contact:v16 avatarProvider:a5 nameProvider:a6 sharingEnabled:v11 selectedSharingAudience:a8 showsWallpaperSuggestionsGalleryPicker:v31 headerMode:a10 presentedInOnboarding:v32];
  id v18 = objc_alloc(MEMORY[0x1E4F1B918]);
  id v19 = [v16 imageData];
  [v16 cropRect];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  double v28 = [MEMORY[0x1E4F1C9C8] now];
  double v29 = objc_msgSend(v18, "initWithImageData:cropRect:lastUsedDate:", v19, v28, v21, v23, v25, v27);
  [(CNMeCardSharingSettingsViewController *)v17 setEditingContactImage:v29];

  return v17;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_5 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_5, &__block_literal_global_6490);
  }
  id v2 = (void *)descriptorForRequiredKeys_cn_once_object_5;

  return v2;
}

void __66__CNMeCardSharingSettingsViewController_descriptorForRequiredKeys__block_invoke()
{
  v13[12] = *MEMORY[0x1E4F143B8];
  v0 = +[CNVisualIdentityPickerViewController descriptorForRequiredKeys];
  uint64_t v1 = *MEMORY[0x1E4F1AE28];
  v13[0] = v0;
  v13[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADE8];
  v13[2] = *MEMORY[0x1E4F1AF98];
  v13[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F5A5E8];
  v13[4] = *MEMORY[0x1E4F1AE20];
  void v13[5] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AFC0];
  v13[6] = *MEMORY[0x1E4F1AFB8];
  v13[7] = v4;
  v13[8] = *MEMORY[0x1E4F1AFC8];
  id v5 = +[CNSNaPSetupFlowManager descriptorForRequiredKeys];
  v13[9] = v5;
  BOOL v6 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v13[10] = v6;
  id v7 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForNameOrder];
  v13[11] = v7;
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:12];

  BOOL v9 = (void *)MEMORY[0x1E4F1B8F8];
  id v10 = [NSString stringWithUTF8String:"+[CNMeCardSharingSettingsViewController descriptorForRequiredKeys]_block_invoke"];
  uint64_t v11 = [v9 descriptorWithKeyDescriptors:v8 description:v10];

  uint64_t v12 = (void *)descriptorForRequiredKeys_cn_once_object_5;
  descriptorForRequiredKeys_cn_once_object_5 = v11;
}

@end