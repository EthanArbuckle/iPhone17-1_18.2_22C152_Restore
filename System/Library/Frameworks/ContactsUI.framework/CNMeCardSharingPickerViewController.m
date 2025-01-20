@interface CNMeCardSharingPickerViewController
+ (id)descriptorForRequiredKeys;
- (BOOL)sharingEnabled;
- (BOOL)shouldSetMeContact;
- (CNContact)contact;
- (CNContactImage)draftContactImage;
- (CNContactStore)contactStore;
- (CNMeCardSharingAudienceDataSource)sharingAudienceDataSource;
- (CNMeCardSharingAvatarProvider)avatarProvider;
- (CNMeCardSharingAvatarViewController)avatarViewController;
- (CNMeCardSharingEnabledDataSource)enabledDataSource;
- (CNMeCardSharingHeaderViewController)headerViewController;
- (CNMeCardSharingPickerLayoutAttributes)layoutAttributes;
- (CNMeCardSharingPickerViewController)initWithContact:(id)a3;
- (CNMeCardSharingPickerViewController)initWithContactStore:(id)a3 contact:(id)a4 nameProvider:(id)a5 sharingEnabled:(BOOL)a6 selectedNameFormat:(unint64_t)a7 selectedSharingAudience:(unint64_t)a8 mode:(unint64_t)a9;
- (CNMeCardSharingPickerViewControllerDelegate)delegate;
- (CNMutableContact)draftContact;
- (CNPhotoPickerViewController)photoPicker;
- (NSArray)sectionDataSources;
- (NSString)sharedName;
- (OBBoldTrayButton)confirmButton;
- (OBLinkTrayButton)laterButton;
- (UISwitch)shareSwitch;
- (UITableView)tableView;
- (UIView)buttonTray;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)meCardSharingStatus;
- (unint64_t)mode;
- (unint64_t)selectedNameFormat;
- (unint64_t)selectedSharingAudience;
- (void)avatarViewControllerWasTapped:(id)a3;
- (void)didTapDoneButton:(id)a3;
- (void)didTapSetUpLaterButton:(id)a3;
- (void)loadView;
- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5;
- (void)photoPickerDidCancel:(id)a3;
- (void)saveDraftContact;
- (void)setAvatarProvider:(id)a3;
- (void)setAvatarViewController:(id)a3;
- (void)setButtonTray:(id)a3;
- (void)setConfirmButton:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDraftContact:(id)a3;
- (void)setDraftContactImage:(id)a3;
- (void)setEnabledDataSource:(id)a3;
- (void)setHeaderViewController:(id)a3;
- (void)setLaterButton:(id)a3;
- (void)setLayoutAttributes:(id)a3;
- (void)setMeCardSharingStatus:(unint64_t)a3;
- (void)setPhotoPicker:(id)a3;
- (void)setSectionDataSources:(id)a3;
- (void)setShareSwitch:(id)a3;
- (void)setSharingAudienceDataSource:(id)a3;
- (void)setSharingEnabled:(BOOL)a3;
- (void)setShouldSetMeContact:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)sharingEnabledDataSource:(id)a3 didChangeEnabledState:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CNMeCardSharingPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_shareSwitch, 0);
  objc_storeStrong((id *)&self->_laterButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_sectionDataSources, 0);
  objc_storeStrong((id *)&self->_photoPicker, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_sharingAudienceDataSource, 0);
  objc_storeStrong((id *)&self->_enabledDataSource, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_avatarProvider, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_draftContactImage, 0);
  objc_storeStrong((id *)&self->_draftContact, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_destroyWeak((id *)&self->_delegate);
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

- (void)setLaterButton:(id)a3
{
}

- (OBLinkTrayButton)laterButton
{
  return self->_laterButton;
}

- (void)setConfirmButton:(id)a3
{
}

- (OBBoldTrayButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setButtonTray:(id)a3
{
}

- (UIView)buttonTray
{
  return self->_buttonTray;
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

- (void)setLayoutAttributes:(id)a3
{
}

- (CNMeCardSharingPickerLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setSharingAudienceDataSource:(id)a3
{
}

- (CNMeCardSharingAudienceDataSource)sharingAudienceDataSource
{
  return self->_sharingAudienceDataSource;
}

- (void)setEnabledDataSource:(id)a3
{
}

- (CNMeCardSharingEnabledDataSource)enabledDataSource
{
  return self->_enabledDataSource;
}

- (void)setAvatarViewController:(id)a3
{
}

- (CNMeCardSharingAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setAvatarProvider:(id)a3
{
}

- (CNMeCardSharingAvatarProvider)avatarProvider
{
  return self->_avatarProvider;
}

- (void)setHeaderViewController:(id)a3
{
}

- (CNMeCardSharingHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setDraftContactImage:(id)a3
{
}

- (CNContactImage)draftContactImage
{
  return self->_draftContactImage;
}

- (void)setDraftContact:(id)a3
{
}

- (CNMutableContact)draftContact
{
  return self->_draftContact;
}

- (void)setShouldSetMeContact:(BOOL)a3
{
  self->_shouldSetMeContact = a3;
}

- (BOOL)shouldSetMeContact
{
  return self->_shouldSetMeContact;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setSharingEnabled:(BOOL)a3
{
  self->_sharingEnabled = a3;
}

- (void)setDelegate:(id)a3
{
}

- (CNMeCardSharingPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNMeCardSharingPickerViewControllerDelegate *)WeakRetained;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)sharingEnabledDataSource:(id)a3 didChangeEnabledState:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  self->_sharingEnabled = v4;
  if (self->_mode == 1 && self->_shouldSetMeContact) {
    [(CNMeCardSharingPickerViewController *)self saveDraftContact];
  }
  v6 = [(CNMeCardSharingPickerViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(CNMeCardSharingPickerViewController *)self delegate];
    [v8 sharingPicker:self didChangeSharingState:self->_sharingEnabled];
  }
  if (v4)
  {
    if ([(CNMeCardSharingAudienceDataSource *)self->_sharingAudienceDataSource selectedSharingAudience])
    {
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v9 = 2;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(CNMeCardSharingPickerViewController *)self setMeCardSharingStatus:v9];
}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  objc_storeStrong((id *)&self->_draftContactImage, a5);
  if (v16)
  {
    v8 = [v16 imageData];
    [(CNMutableContact *)self->_draftContact setImageData:v8];

    uint64_t v9 = [v16 imageType];
    [(CNMutableContact *)self->_draftContact setImageType:v9];

    id v10 = [v16 imageHash];
    [(CNMutableContact *)self->_draftContact setImageHash:v10];

    [v16 cropRect];
    -[CNMutableContact setCropRect:](self->_draftContact, "setCropRect:");
    v11 = [v16 thumbnailImageData];
    [(CNMutableContact *)self->_draftContact setThumbnailImageData:v11];

    v12 = [v16 fullscreenImageData];
    [(CNMutableContact *)self->_draftContact setFullscreenImageData:v12];

    v13 = [v16 preferredLikenessSource];
    [(CNMutableContact *)self->_draftContact setPreferredLikenessSource:v13];

    if (self->_mode == 1) {
      [(CNMeCardSharingPickerViewController *)self saveDraftContact];
    }
    v14 = [(CNMeCardSharingPickerViewController *)self avatarViewController];
    [v14 reload];
  }
  v15 = [(CNMeCardSharingPickerViewController *)self presentedViewController];
  [v15 dismissViewControllerAnimated:1 completion:0];
}

- (void)photoPickerDidCancel:(id)a3
{
  id v3 = [(CNMeCardSharingPickerViewController *)self presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)avatarViewControllerWasTapped:(id)a3
{
  BOOL v4 = [CNPhotoPickerViewController alloc];
  draftContact = self->_draftContact;
  v6 = +[CNContactStyle defaultStyle];
  id v7 = +[CNPhotoPickerConfiguration contactsConfiguration];
  v8 = [v7 configurationBySettingAllowsPhotoCapture:1];
  v15 = [(CNPhotoPickerViewController *)v4 initWithContact:draftContact style:v6 configuration:v8];

  [(CNPhotoPickerViewController *)v15 setDelegate:self];
  uint64_t v9 = CNContactsUIBundle();
  id v10 = [v9 localizedStringForKey:@"SHARING_PHOTOPICKER_ASSIGN_TITLE_OVERRIDE" value:&stru_1ED8AC728 table:@"Localized"];
  [(CNVisualIdentityPickerViewController *)v15 setAssignActionTitleOverride:v10];

  [(CNMeCardSharingPickerViewController *)self setPhotoPicker:v15];
  v11 = [(CNMeCardSharingPickerViewController *)self view];
  v12 = [v11 window];
  [v12 endEditing:1];

  v13 = [(CNMeCardSharingPickerViewController *)self photoPicker];
  v14 = +[CNPhotoPickerViewController navigationControllerForPicker:v13];

  [(CNMeCardSharingPickerViewController *)self presentViewController:v14 animated:1 completion:0];
}

- (void)saveDraftContact
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  int v4 = [(CNMutableContact *)self->_draftContact hasBeenPersisted];
  draftContact = self->_draftContact;
  if (v4) {
    [v3 updateContact:draftContact];
  }
  else {
    [v3 addContact:draftContact toContainerWithIdentifier:0];
  }
  contactStore = self->_contactStore;
  id v15 = 0;
  [(CNContactStore *)contactStore executeSaveRequest:v3 error:&v15];
  id v7 = v15;
  v8 = v7;
  if (v7)
  {
    NSLog(&cfstr_UnableToSaveCo.isa, v7);
  }
  else
  {
    if ([(CNMeCardSharingPickerViewController *)self shouldSetMeContact])
    {
      uint64_t v9 = self->_contactStore;
      id v10 = self->_draftContact;
      id v14 = 0;
      [(CNContactStore *)v9 setMeContact:v10 error:&v14];
      id v11 = v14;
      v12 = v11;
      if (v11) {
        NSLog(&cfstr_UnableToSetMeC.isa, v11);
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)CNMeCardSharingPickerViewControllerDidSaveNotification, 0, 0, 0);
  }
}

- (void)didTapSetUpLaterButton:(id)a3
{
  int v4 = [(CNMeCardSharingPickerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNMeCardSharingPickerViewController *)self delegate];
    [v6 sharingPickerDidFinish:self];
  }
}

- (void)didTapDoneButton:(id)a3
{
  [(CNMeCardSharingPickerViewController *)self saveDraftContact];
  if (!self->_sharingEnabled)
  {
    self->_sharingEnabled = 1;
    int v4 = [(CNMeCardSharingPickerViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(CNMeCardSharingPickerViewController *)self delegate];
      [v6 sharingPicker:self didChangeSharingState:self->_sharingEnabled];
    }
  }
  id v7 = [(CNMeCardSharingPickerViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CNMeCardSharingPickerViewController *)self delegate];
    [v9 sharingPickerDidFinish:self];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_sectionDataSources, "objectAtIndexedSubscript:", [v6 section]);
  id v7 = (CNMeCardSharingAudienceDataSource *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [(CNMeCardSharingAudienceDataSource *)v7 selectedIndex];
  -[CNMeCardSharingAudienceDataSource didSelectItemAtIndex:](v7, "didSelectItemAtIndex:", [v6 row]);
  id v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v8, objc_msgSend(v6, "section"));
  if (v7 == self->_sharingAudienceDataSource)
  {
    id v10 = [(CNMeCardSharingPickerViewController *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12 = [(CNMeCardSharingPickerViewController *)self delegate];
      objc_msgSend(v12, "sharingPicker:didSelectSharingAudience:", self, -[CNMeCardSharingAudienceDataSource selectedSharingAudience](self->_sharingAudienceDataSource, "selectedSharingAudience"));
    }
    if (self->_sharingEnabled)
    {
      if ([(CNMeCardSharingAudienceDataSource *)self->_sharingAudienceDataSource selectedSharingAudience])
      {
        uint64_t v13 = 1;
      }
      else
      {
        uint64_t v13 = 2;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
    [(CNMeCardSharingPickerViewController *)self setMeCardSharingStatus:v13];
    id v14 = [(CNMeCardSharingPickerViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      BOOL sharingEnabled = self->_sharingEnabled;

      if (!sharingEnabled) {
        goto LABEL_13;
      }
      id v14 = [(CNMeCardSharingPickerViewController *)self delegate];
      [v14 sharingPicker:self didSelectSharingStatus:v13];
    }
  }
LABEL_13:
  char v16 = [v9 isEqual:v6];
  [v18 deselectRowAtIndexPath:v6 animated:0];
  if ((v16 & 1) == 0)
  {
    v17 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v6, "section"));
    [v18 reloadSections:v17 withRowAnimation:0];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v6];
  uint64_t v8 = -[NSArray objectAtIndexedSubscript:](self->_sectionDataSources, "objectAtIndexedSubscript:", [v6 section]);
  uint64_t v9 = [v6 row];

  id v10 = [v8 itemForIndex:v9];
  char v11 = [v10 label];
  v12 = [v7 textLabel];
  [v12 setText:v11];

  [v7 setSelectionStyle:0];
  uint64_t v13 = [v10 accessoryView];

  if (v13)
  {
    id v14 = [v10 accessoryView];
    [v7 setAccessoryView:v14];
  }
  else
  {
    [v7 setAccessoryView:0];
  }
  if ([v10 isSelected]) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 0;
  }
  [v7 setAccessoryType:v15];

  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[NSArray objectAtIndexedSubscript:](self->_sectionDataSources, "objectAtIndexedSubscript:", [v5 section]);
  uint64_t v7 = [v6 selectedIndex];
  if (v7 == [v5 row]) {
    id v8 = 0;
  }
  else {
    id v8 = v5;
  }

  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  int v4 = [(NSArray *)self->_sectionDataSources objectAtIndexedSubscript:a4];
  id v5 = [v4 sectionFooterLabel];

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int v4 = [(NSArray *)self->_sectionDataSources objectAtIndexedSubscript:a4];
  id v5 = [v4 sectionHeaderLabel];

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int v4 = [(NSArray *)self->_sectionDataSources objectAtIndexedSubscript:a4];
  int64_t v5 = [v4 numberOfItems];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sectionDataSources count];
}

- (unint64_t)selectedSharingAudience
{
  return [(CNMeCardSharingAudienceDataSource *)self->_sharingAudienceDataSource selectedSharingAudience];
}

- (unint64_t)selectedNameFormat
{
  return 2;
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (NSString)sharedName
{
  return (NSString *)&stru_1ED8AC728;
}

- (void)viewWillLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CNMeCardSharingPickerViewController;
  [(CNMeCardSharingPickerViewController *)&v19 viewWillLayoutSubviews];
  id v3 = [(CNMeCardSharingPickerViewController *)self view];
  [(OBBoldTrayButton *)self->_confirmButton intrinsicContentSize];
  double v5 = v4;
  [v3 bounds];
  -[OBBoldTrayButton setFrame:](self->_confirmButton, "setFrame:", 20.0, 10.0, v6 + -40.0, v5);
  [(OBLinkTrayButton *)self->_laterButton intrinsicContentSize];
  double v8 = v7;
  [(OBBoldTrayButton *)self->_confirmButton frame];
  CGFloat v9 = CGRectGetMaxY(v20) + 10.0;
  [v3 bounds];
  -[OBLinkTrayButton setFrame:](self->_laterButton, "setFrame:", 20.0, v9, v10 + -40.0, v8);
  [v3 bounds];
  double MaxY = CGRectGetMaxY(v21);
  v12 = [(CNMeCardSharingPickerViewController *)self view];
  [v12 safeAreaInsets];
  double v14 = MaxY - (v13 + 130.0);
  [v3 bounds];
  double Width = CGRectGetWidth(v22);
  char v16 = [(CNMeCardSharingPickerViewController *)self view];
  [v16 safeAreaInsets];
  -[UIView setFrame:](self->_buttonTray, "setFrame:", 0.0, v14, Width, v17 + 130.0);

  id v18 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(UIView *)self->_buttonTray setBackgroundColor:v18];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)CNMeCardSharingPickerViewController;
  [(CNMeCardSharingPickerViewController *)&v12 viewDidLoad];
  id v3 = [(CNMeCardSharingHeaderViewController *)self->_headerViewController view];
  double v4 = [(CNMeCardSharingPickerViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  [(CNMeCardSharingHeaderViewController *)self->_headerViewController desiredHeight];
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v6, v7);

  [v3 setAutoresizingMask:2];
  double v8 = [(CNMeCardSharingPickerViewController *)self tableView];
  [v8 setTableHeaderView:v3];

  CGFloat v9 = [(CNMeCardSharingPickerViewController *)self tableView];
  [v9 setDelegate:self];

  double v10 = [(CNMeCardSharingPickerViewController *)self tableView];
  [v10 setDataSource:self];

  char v11 = [(CNMeCardSharingPickerViewController *)self tableView];
  [v11 registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  id v34 = (id)objc_msgSend(v3, "initWithFrame:");

  id v5 = objc_alloc(MEMORY[0x1E4FB1D00]);
  [v34 bounds];
  double v6 = objc_msgSend(v5, "initWithFrame:style:", 1);
  [(CNMeCardSharingPickerViewController *)self setTableView:v6];

  if (!self->_mode)
  {
    double v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [v34 setBackgroundColor:v7];

    double v8 = [MEMORY[0x1E4FB1618] clearColor];
    CGFloat v9 = [(CNMeCardSharingPickerViewController *)self tableView];
    [v9 setBackgroundColor:v8];

    double v10 = [MEMORY[0x1E4F83A78] boldButton];
    confirmButton = self->_confirmButton;
    self->_confirmButton = v10;

    objc_super v12 = self->_confirmButton;
    double v13 = CNContactsUIBundle();
    double v14 = [v13 localizedStringForKey:@"SHARING_DONE" value:&stru_1ED8AC728 table:@"Localized"];
    [(OBBoldTrayButton *)v12 setTitle:v14 forState:0];

    [(OBBoldTrayButton *)self->_confirmButton addTarget:self action:sel_didTapDoneButton_ forControlEvents:64];
    [(OBBoldTrayButton *)self->_confirmButton intrinsicContentSize];
    double v16 = v15;
    [v34 bounds];
    -[OBBoldTrayButton setFrame:](self->_confirmButton, "setFrame:", 20.0, 10.0, v17 + -40.0, v16);
    [(OBBoldTrayButton *)self->_confirmButton setAutoresizingMask:2];
    id v18 = [MEMORY[0x1E4F83AB0] linkButton];
    laterButton = self->_laterButton;
    self->_laterButton = v18;

    CGRect v20 = self->_laterButton;
    CGRect v21 = CNContactsUIBundle();
    CGRect v22 = [v21 localizedStringForKey:@"SHARING_SET_UP_LATER" value:&stru_1ED8AC728 table:@"Localized"];
    [(OBLinkTrayButton *)v20 setTitle:v22 forState:0];

    [(OBLinkTrayButton *)self->_laterButton addTarget:self action:sel_didTapSetUpLaterButton_ forControlEvents:64];
    [(OBLinkTrayButton *)self->_laterButton intrinsicContentSize];
    double v24 = v23;
    [(OBBoldTrayButton *)self->_confirmButton frame];
    CGFloat v25 = CGRectGetMaxY(v36) + 10.0;
    [v34 bounds];
    -[OBLinkTrayButton setFrame:](self->_laterButton, "setFrame:", 20.0, v25, v26 + -40.0, v24);
    [(OBLinkTrayButton *)self->_laterButton setAutoresizingMask:2];
    id v27 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [v34 bounds];
    CGFloat v28 = CGRectGetMaxY(v37) + -130.0;
    [v34 bounds];
    v29 = (UIView *)objc_msgSend(v27, "initWithFrame:", 0.0, v28, CGRectGetWidth(v38), 130.0);
    buttonTray = self->_buttonTray;
    self->_buttonTray = v29;

    v31 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(UIView *)self->_buttonTray setBackgroundColor:v31];

    [(UIView *)self->_buttonTray addSubview:self->_confirmButton];
    [(UIView *)self->_buttonTray addSubview:self->_laterButton];
    [v34 addSubview:self->_buttonTray];
    [(UIView *)self->_buttonTray setAutoresizingMask:10];
  }
  v32 = [(CNMeCardSharingPickerViewController *)self tableView];
  [v32 setAutoresizingMask:18];

  v33 = [(CNMeCardSharingPickerViewController *)self tableView];
  [v34 addSubview:v33];

  if (self->_buttonTray) {
    objc_msgSend(v34, "addSubview:");
  }
  [(CNMeCardSharingPickerViewController *)self setView:v34];
}

- (CNMeCardSharingPickerViewController)initWithContactStore:(id)a3 contact:(id)a4 nameProvider:(id)a5 sharingEnabled:(BOOL)a6 selectedNameFormat:(unint64_t)a7 selectedSharingAudience:(unint64_t)a8 mode:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v43.receiver = self;
  v43.super_class = (Class)CNMeCardSharingPickerViewController;
  id v18 = [(CNMeCardSharingPickerViewController *)&v43 initWithNibName:0 bundle:0];
  objc_super v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_contactStore, a3);
    v19->_BOOL sharingEnabled = a6;
    v19->_mode = a9;
    if (v16)
    {
      uint64_t v20 = [v16 mutableCopy];
      draftContact = v19->_draftContact;
      v19->_draftContact = (CNMutableContact *)v20;
    }
    else
    {
      CGRect v22 = (CNMutableContact *)objc_alloc_init(MEMORY[0x1E4F1BA40]);
      double v23 = v19->_draftContact;
      v19->_draftContact = v22;

      double v24 = [v17 givenName];
      [(CNMutableContact *)v19->_draftContact setGivenName:v24];

      CGFloat v25 = [v17 middleName];
      [(CNMutableContact *)v19->_draftContact setMiddleName:v25];

      double v26 = [v17 familyName];
      [(CNMutableContact *)v19->_draftContact setFamilyName:v26];

      v19->_shouldSetMeContact = 1;
    }
    if (a9) {
      +[CNMeCardSharingPickerLayoutAttributes layoutAttributesForSettings];
    }
    else {
    id v27 = +[CNMeCardSharingPickerLayoutAttributes layoutAttributesForBuddy];
    }
    objc_storeStrong((id *)&v19->_layoutAttributes, v27);

    CGFloat v28 = [[CNMeCardSharingContactAvatarProvider alloc] initWithContact:v19->_draftContact];
    avatarProvider = v19->_avatarProvider;
    v19->_avatarProvider = (CNMeCardSharingAvatarProvider *)v28;

    v30 = [[CNMeCardSharingAvatarViewController alloc] initWithAvatarProvider:v19->_avatarProvider];
    avatarViewController = v19->_avatarViewController;
    v19->_avatarViewController = v30;

    [(CNMeCardSharingAvatarViewController *)v19->_avatarViewController setDelegate:v19];
    v32 = [MEMORY[0x1E4F1CA48] array];
    if (a9 == 1)
    {
      v33 = [[CNMeCardSharingEnabledDataSource alloc] initWithSharingEnabled:v19->_sharingEnabled];
      enabledDataSource = v19->_enabledDataSource;
      v19->_enabledDataSource = v33;

      [(CNMeCardSharingEnabledDataSource *)v19->_enabledDataSource setDelegate:v19];
      [v32 addObject:v19->_enabledDataSource];
    }
    v35 = [[CNMeCardSharingAudienceDataSource alloc] initWithSelectedSharingAudience:a8];
    sharingAudienceDataSource = v19->_sharingAudienceDataSource;
    v19->_sharingAudienceDataSource = v35;

    [v32 addObject:v19->_sharingAudienceDataSource];
    CGRect v37 = [[CNMeCardSharingHeaderViewController alloc] initWithAvatarViewController:v19->_avatarViewController name:&stru_1ED8AC728 layoutAttributes:v19->_layoutAttributes];
    headerViewController = v19->_headerViewController;
    v19->_headerViewController = v37;

    uint64_t v39 = [v32 copy];
    sectionDataSources = v19->_sectionDataSources;
    v19->_sectionDataSources = (NSArray *)v39;

    v41 = v19;
  }

  return v19;
}

- (CNMeCardSharingPickerViewController)initWithContact:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  id v5 = [(id)objc_opt_class() descriptorForRequiredKeys];
  v11[0] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  double v7 = [v4 _crossPlatformUnifiedMeContactWithKeysToFetch:v6 error:0];

  double v8 = [[CNMeCardSharingContactNameProvider alloc] initWithContact:v7];
  CGFloat v9 = [(CNMeCardSharingPickerViewController *)self initWithContactStore:v4 contact:v7 nameProvider:v8 sharingEnabled:0 selectedNameFormat:2 selectedSharingAudience:0 mode:1];

  return v9;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_49152 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_49152, &__block_literal_global_49153);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_1_49154;

  return v2;
}

void __64__CNMeCardSharingPickerViewController_descriptorForRequiredKeys__block_invoke()
{
  v11[9] = *MEMORY[0x1E4F143B8];
  v0 = +[CNMeCardSharingContactNameProvider descriptorForRequiredKeys];
  v1 = +[CNVisualIdentityPickerViewController descriptorForRequiredKeys];
  uint64_t v2 = *MEMORY[0x1E4F1AE28];
  v11[1] = v1;
  void v11[2] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1ADE8];
  v11[3] = *MEMORY[0x1E4F1AF98];
  v11[4] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AFB8];
  v11[5] = *MEMORY[0x1E4F1AE20];
  v11[6] = v4;
  v11[7] = *MEMORY[0x1E4F1AFC8];
  id v5 = +[CNSNaPSetupFlowManager descriptorForRequiredKeys];
  v11[8] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:9];

  double v7 = (void *)MEMORY[0x1E4F1B8F8];
  double v8 = [NSString stringWithUTF8String:"+[CNMeCardSharingPickerViewController descriptorForRequiredKeys]_block_invoke"];
  uint64_t v9 = [v7 descriptorWithKeyDescriptors:v6 description:v8];

  double v10 = (void *)descriptorForRequiredKeys_cn_once_object_1_49154;
  descriptorForRequiredKeys_cn_once_object_1_49154 = v9;
}

- (unint64_t)meCardSharingStatus
{
  if (!self->_sharingEnabled) {
    return 0;
  }
  if ([(CNMeCardSharingAudienceDataSource *)self->_sharingAudienceDataSource selectedSharingAudience])
  {
    return 1;
  }
  return 2;
}

- (void)setMeCardSharingStatus:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      -[CNMeCardSharingEnabledDataSource setSharingEnabled:](self->_enabledDataSource, "setSharingEnabled:");
      uint64_t v5 = 0;
      uint64_t v4 = 0;
      self->_BOOL sharingEnabled = 0;
      goto LABEL_9;
    case 2uLL:
      uint64_t v4 = 0;
      goto LABEL_7;
    case 1uLL:
      uint64_t v4 = 1;
LABEL_7:
      uint64_t v5 = 1;
      [(CNMeCardSharingEnabledDataSource *)self->_enabledDataSource setSharingEnabled:1];
      self->_BOOL sharingEnabled = 1;
      goto LABEL_9;
  }
  uint64_t v5 = 0;
  uint64_t v4 = 0;
  self->_BOOL sharingEnabled = 0;
LABEL_9:
  [(CNMeCardSharingEnabledDataSource *)self->_enabledDataSource setSharingEnabled:v5];
  sharingAudienceDataSource = self->_sharingAudienceDataSource;

  [(CNMeCardSharingAudienceDataSource *)sharingAudienceDataSource setSelectedSharingAudience:v4];
}

@end