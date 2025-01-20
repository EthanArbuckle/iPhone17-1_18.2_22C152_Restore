@interface CNSNaPSuggestionsGalleryViewController
- (BOOL)isEditingSNaP;
- (BOOL)isOnboarding;
- (CNContact)contact;
- (CNSNaPSuggestionsGalleryViewController)initWithMode:(int64_t)a3 contact:(id)a4 isEditingSNaP:(BOOL)a5 isOnboarding:(BOOL)a6;
- (CNSNaPSuggestionsGalleryViewController)initWithMode:(int64_t)a3 contact:(id)a4 isEditingSNaP:(BOOL)a5 isOnboarding:(BOOL)a6 photoLibraryAssetID:(id)a7;
- (CNSNaPSuggestionsGalleryViewControllerDelegate)delegate;
- (NSString)photoLibraryAssetID;
- (int64_t)mode;
- (int64_t)sourceTypeFromString:(id)a3;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsEditingSNaP:(BOOL)a3;
- (void)setIsOnboarding:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setPhotoLibraryAssetID:(id)a3;
- (void)setupNavBarAppearance;
- (void)skipStep;
- (void)suggestionsGalleryDidCancel;
- (void)suggestionsGalleryDidFinishWithPosterConfiguration:(id)a3 posterType:(id)a4 withGivenName:(id)a5 familyName:(id)a6;
- (void)suggestionsGalleryDidRequestPresentationOfImagePickerController:(id)a3;
- (void)suggestionsGalleryDidRequestPresentationOfPosterEditingViewController:(id)a3;
- (void)suggestionsGalleryDidSelectAvatarSourceType:(id)a3 withGivenName:(id)a4 familyName:(id)a5;
- (void)suggestionsGalleryDidSelectSuggestedAvatar:(id)a3 withGivenName:(id)a4 familyName:(id)a5;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation CNSNaPSuggestionsGalleryViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryAssetID, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPhotoLibraryAssetID:(id)a3
{
}

- (NSString)photoLibraryAssetID
{
  return self->_photoLibraryAssetID;
}

- (void)setIsOnboarding:(BOOL)a3
{
  self->_isOnboarding = a3;
}

- (BOOL)isOnboarding
{
  return self->_isOnboarding;
}

- (void)setIsEditingSNaP:(BOOL)a3
{
  self->_isEditingSNaP = a3;
}

- (BOOL)isEditingSNaP
{
  return self->_isEditingSNaP;
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
}

- (CNSNaPSuggestionsGalleryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNSNaPSuggestionsGalleryViewControllerDelegate *)WeakRetained;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)suggestionsGalleryDidRequestPresentationOfImagePickerController:(id)a3
{
  id v4 = a3;
  id v5 = [(CNSNaPSuggestionsGalleryViewController *)self navigationController];
  [v5 presentViewController:v4 animated:1 completion:0];
}

- (void)suggestionsGalleryDidRequestPresentationOfPosterEditingViewController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [v7 setModalPresentationStyle:6];
    v8 = [(CNSNaPSuggestionsGalleryViewController *)self navigationController];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __112__CNSNaPSuggestionsGalleryViewController_suggestionsGalleryDidRequestPresentationOfPosterEditingViewController___block_invoke;
    v9[3] = &unk_1E549B488;
    id v10 = v7;
    [v8 presentViewController:v10 animated:1 completion:v9];
  }
}

uint64_t __112__CNSNaPSuggestionsGalleryViewController_suggestionsGalleryDidRequestPresentationOfPosterEditingViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentationDidFinishAnimated:1];
}

- (void)suggestionsGalleryDidCancel
{
  id v3 = [(CNSNaPSuggestionsGalleryViewController *)self delegate];
  [v3 suggestionsGalleryViewControllerDidCancel:self];
}

- (void)suggestionsGalleryDidFinishWithPosterConfiguration:(id)a3 posterType:(id)a4 withGivenName:(id)a5 familyName:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v13 = [(CNSNaPSuggestionsGalleryViewController *)self delegate];
  v12 = [[CNSNaPSuggestionsGalleryName alloc] initWithGivenName:v10 familyName:v9];

  [v13 suggestionsGalleryViewController:self didFinishWithPosterConfiguration:v11 name:v12];
}

- (void)suggestionsGalleryDidSelectSuggestedAvatar:(id)a3 withGivenName:(id)a4 familyName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(CNSNaPSuggestionsGalleryViewController *)self delegate];
  id v11 = [[CNSNaPSuggestionsGalleryName alloc] initWithGivenName:v9 familyName:v8];

  [v12 suggestionsGalleryViewController:self didSelectSuggestedAvatar:v10 name:v11];
}

- (void)suggestionsGalleryDidSelectAvatarSourceType:(id)a3 withGivenName:(id)a4 familyName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v13 = [(CNSNaPSuggestionsGalleryViewController *)self delegate];
  int64_t v11 = [(CNSNaPSuggestionsGalleryViewController *)self sourceTypeFromString:v10];

  id v12 = [[CNSNaPSuggestionsGalleryName alloc] initWithGivenName:v9 familyName:v8];
  [v13 suggestionsGalleryViewController:self didSelectAvatarSourceType:v11 name:v12];
}

- (int64_t)sourceTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"camera"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"photos"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"memoji"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"emoji"])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 3;
  }

  return v4;
}

- (void)skipStep
{
  id v3 = [(CNSNaPSuggestionsGalleryViewController *)self delegate];
  [v3 suggestionsGalleryViewControllerDidSelectCustomizeLater:self];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v41[4] = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)CNSNaPSuggestionsGalleryViewController;
  [(CNSNaPSuggestionsGalleryViewController *)&v40 viewIsAppearing:a3];
  int64_t v4 = [_TtC10ContactsUI40CNWallpaperSuggestionsGalleryViewWrapper alloc];
  id v5 = [(CNSNaPSuggestionsGalleryViewController *)self view];
  v6 = [v5 window];
  id v7 = [v6 windowScene];
  int64_t v8 = [(CNSNaPSuggestionsGalleryViewController *)self mode];
  id v9 = [(CNSNaPSuggestionsGalleryViewController *)self contact];
  BOOL v10 = [(CNSNaPSuggestionsGalleryViewController *)self isEditingSNaP];
  BOOL v11 = [(CNSNaPSuggestionsGalleryViewController *)self isOnboarding];
  id v12 = [(CNSNaPSuggestionsGalleryViewController *)self photoLibraryAssetID];
  id v13 = [(CNWallpaperSuggestionsGalleryViewWrapper *)v4 initWithDelegate:self windowScene:v7 mode:v8 contact:v9 isEditingSNaP:v10 isOnboarding:v11 photoLibraryAssetID:v12];

  v14 = [(CNWallpaperSuggestionsGalleryViewWrapper *)v13 hostingController];
  v15 = [v14 view];

  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = [(CNWallpaperSuggestionsGalleryViewWrapper *)v13 hostingController];
  [v16 willMoveToParentViewController:self];

  v39 = v13;
  v17 = [(CNWallpaperSuggestionsGalleryViewWrapper *)v13 hostingController];
  [(CNSNaPSuggestionsGalleryViewController *)self addChildViewController:v17];

  v18 = [(CNSNaPSuggestionsGalleryViewController *)self view];
  [v18 addSubview:v15];

  v19 = [(CNWallpaperSuggestionsGalleryViewWrapper *)v13 hostingController];
  [v19 didMoveToParentViewController:self];

  v20 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v15 setBackgroundColor:v20];

  v31 = (void *)MEMORY[0x1E4F28DC8];
  v37 = [v15 leadingAnchor];
  v38 = [(CNSNaPSuggestionsGalleryViewController *)self view];
  v36 = [v38 leadingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v41[0] = v35;
  v33 = [v15 trailingAnchor];
  v34 = [(CNSNaPSuggestionsGalleryViewController *)self view];
  v32 = [v34 trailingAnchor];
  v30 = [v33 constraintEqualToAnchor:v32];
  v41[1] = v30;
  v21 = [v15 topAnchor];
  v22 = [(CNSNaPSuggestionsGalleryViewController *)self view];
  v23 = [v22 topAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  v41[2] = v24;
  v25 = [v15 bottomAnchor];
  v26 = [(CNSNaPSuggestionsGalleryViewController *)self view];
  v27 = [v26 bottomAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  v41[3] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
  [v31 activateConstraints:v29];
}

- (void)setupNavBarAppearance
{
  id v8 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v8 configureWithDefaultBackground];
  if (CNUIIsMessages())
  {
    id v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v8 setBackgroundColor:v3];

    int64_t v4 = [MEMORY[0x1E4FB1618] clearColor];
    [v8 setShadowColor:v4];
  }
  id v5 = [(CNSNaPSuggestionsGalleryViewController *)self navigationItem];
  [v5 setStandardAppearance:v8];

  id v6 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v6 configureWithTransparentBackground];
  id v7 = [(CNSNaPSuggestionsGalleryViewController *)self navigationItem];
  [v7 setScrollEdgeAppearance:v6];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)CNSNaPSuggestionsGalleryViewController;
  [(CNSNaPSuggestionsGalleryViewController *)&v12 viewDidLoad];
  id v3 = [(CNSNaPSuggestionsGalleryViewController *)self navigationController];
  int64_t v4 = [v3 viewControllers];
  id v5 = [v4 firstObject];

  id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v7 = v6;
  if (v5 == self)
  {
    id v8 = (void *)[v6 initWithBarButtonSystemItem:1 target:self action:sel_suggestionsGalleryDidCancel];
    id v9 = [(CNSNaPSuggestionsGalleryViewController *)self navigationItem];
    [v9 setLeftBarButtonItem:v8];
  }
  else
  {
    id v8 = CNContactsUIBundle();
    id v9 = [v8 localizedStringForKey:@"SNAP_POSTER_PREVIEW_SKIP" value:&stru_1ED8AC728 table:@"Localized"];
    BOOL v10 = (void *)[v7 initWithTitle:v9 style:0 target:self action:sel_skipStep];
    BOOL v11 = [(CNSNaPSuggestionsGalleryViewController *)self navigationItem];
    [v11 setRightBarButtonItem:v10];
  }
  [(CNSNaPSuggestionsGalleryViewController *)self setupNavBarAppearance];
}

- (CNSNaPSuggestionsGalleryViewController)initWithMode:(int64_t)a3 contact:(id)a4 isEditingSNaP:(BOOL)a5 isOnboarding:(BOOL)a6 photoLibraryAssetID:(id)a7
{
  id v13 = a4;
  id v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CNSNaPSuggestionsGalleryViewController;
  v15 = [(CNSNaPSuggestionsGalleryViewController *)&v19 init];
  v16 = v15;
  if (v15)
  {
    v15->_mode = a3;
    objc_storeStrong((id *)&v15->_contact, a4);
    v16->_isEditingSNaP = a5;
    v16->_isOnboarding = a6;
    objc_storeStrong((id *)&v16->_photoLibraryAssetID, a7);
    v17 = v16;
  }

  return v16;
}

- (CNSNaPSuggestionsGalleryViewController)initWithMode:(int64_t)a3 contact:(id)a4 isEditingSNaP:(BOOL)a5 isOnboarding:(BOOL)a6
{
  return [(CNSNaPSuggestionsGalleryViewController *)self initWithMode:a3 contact:a4 isEditingSNaP:a5 isOnboarding:a6 photoLibraryAssetID:0];
}

@end