@interface CNPosterEditOptionsViewController
- (CNContact)contact;
- (CNContact)contactForSharedProfile;
- (CNContactImage)pendingAvatar;
- (CNContactPoster)pendingPoster;
- (CNPosterEditOptionsViewController)initWithContact:(id)a3 mode:(int64_t)a4;
- (CNPosterEditOptionsViewControllerDelegate)delegate;
- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)configuration;
- (id)finalizedCurrentAvatar:(id)a3 backedByRecents:(BOOL)a4;
- (id)finalizedPendingPoster;
- (id)finalizedPoster:(id)a3;
- (int64_t)mode;
- (void)avatarPosterPairCollectionDidDeleteCurrentPosterPair;
- (void)avatarPosterPairCollectionDidDeletePosterPair;
- (void)avatarPosterPairCollectionDidEditPoster:(id)a3;
- (void)avatarPosterPairCollectionDidLoadCurrentPairWithAvatar:(id)a3 poster:(id)a4 backedByRecents:(BOOL)a5;
- (void)avatarPosterPairCollectionDidSelectAvatar:(id)a3 poster:(id)a4 selectionDidChange:(BOOL)a5 isShared:(BOOL)a6;
- (void)avatarPosterPairCollectionDidSelectCreateNew;
- (void)avatarPosterPairCollectionDidSelectEditAvatar:(id)a3;
- (void)posterEditOptionsDidCancel;
- (void)posterEditOptionsDidTapDone;
- (void)setConfiguration:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactForSharedProfile:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setPendingAvatar:(id)a3;
- (void)setPendingPoster:(id)a3;
- (void)viewDidLoad;
@end

@implementation CNPosterEditOptionsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPoster, 0);
  objc_storeStrong((id *)&self->_pendingAvatar, 0);
  objc_storeStrong((id *)&self->_contactForSharedProfile, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setPendingPoster:(id)a3
{
}

- (CNContactPoster)pendingPoster
{
  return self->_pendingPoster;
}

- (void)setPendingAvatar:(id)a3
{
}

- (CNContactImage)pendingAvatar
{
  return self->_pendingAvatar;
}

- (void)setContactForSharedProfile:(id)a3
{
}

- (CNContact)contactForSharedProfile
{
  return self->_contactForSharedProfile;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setDelegate:(id)a3
{
}

- (CNPosterEditOptionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPosterEditOptionsViewControllerDelegate *)WeakRetained;
}

- (void)setConfiguration:(id)a3
{
}

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)configuration
{
  return self->_configuration;
}

- (id)finalizedPoster:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_3;
  }
  v5 = +[CNWallpaperConfigurationGenerator shared];
  v6 = [v4 posterData];
  v7 = [(CNPosterEditOptionsViewController *)self contact];
  char v8 = [v5 isCleanStatePosterData:v6 contact:v7];

  if ((v8 & 1) == 0) {
    id v9 = v4;
  }
  else {
LABEL_3:
  }
    id v9 = 0;

  return v9;
}

- (id)finalizedCurrentAvatar:(id)a3 backedByRecents:(BOOL)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    id v7 = v5;
  }
  else
  {
    char v8 = [v5 imageData];
    id v7 = (id)[v6 copyWithNewImageData:v8];
  }

  return v7;
}

- (id)finalizedPendingPoster
{
  v3 = [(CNPosterEditOptionsViewController *)self pendingPoster];
  id v4 = [(CNPosterEditOptionsViewController *)self finalizedPoster:v3];

  return v4;
}

- (void)posterEditOptionsDidTapDone
{
  id v5 = [(CNPosterEditOptionsViewController *)self finalizedPendingPoster];
  v3 = [(CNPosterEditOptionsViewController *)self delegate];
  id v4 = [(CNPosterEditOptionsViewController *)self pendingAvatar];
  [v3 posterEditOptionsViewController:self didSelectAvatar:v4 poster:v5];
}

- (void)posterEditOptionsDidCancel
{
  id v3 = [(CNPosterEditOptionsViewController *)self delegate];
  [v3 posterEditOptionsViewControllerDidCancel:self];
}

- (void)avatarPosterPairCollectionDidSelectAvatar:(id)a3 poster:(id)a4 selectionDidChange:(BOOL)a5 isShared:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  [(CNPosterEditOptionsViewController *)self setPendingAvatar:a3];
  [(CNPosterEditOptionsViewController *)self setPendingPoster:v10];

  v11 = [(CNPosterEditOptionsViewController *)self navigationItem];
  v12 = [v11 rightBarButtonItem];
  [v12 setEnabled:v7];

  if (v6)
  {
    v13 = NSString;
    CNContactsUIBundle();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    v14 = [v20 localizedStringForKey:@"SNAP_PHOTO_BANNER_SUBTITLE_%@" value:&stru_1ED8AC728 table:@"Localized"];
    v15 = [(CNPosterEditOptionsViewController *)self contact];
    v16 = [v15 posterName];
    v17 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v16);
    v18 = [v17 capitalizedString];
    v19 = [(CNPosterEditOptionsViewController *)self navigationItem];
    [v19 setTitle:v18];
  }
  else
  {
    id v20 = [(CNPosterEditOptionsViewController *)self navigationItem];
    [v20 setTitle:0];
  }
}

- (void)avatarPosterPairCollectionDidSelectCreateNew
{
  id v3 = [(CNPosterEditOptionsViewController *)self delegate];
  [v3 posterEditOptionsViewControllerDidSelectCreateNew:self];
}

- (void)avatarPosterPairCollectionDidEditPoster:(id)a3
{
  id v9 = a3;
  id v4 = [(CNPosterEditOptionsViewController *)self pendingPoster];
  id v5 = [(CNPosterEditOptionsViewController *)self pendingAvatar];
  BOOL v6 = +[CNAvatarPosterCarouselEditingContext contextWithExistingPoster:v4 existingAvatar:v5];

  if (v9)
  {
    BOOL v7 = +[CNAvatarPosterCarouselPendingPosterEdit pendingEditFromPosterConfiguration:v9];
    [v6 setPendingPosterEdit:v7];
  }
  char v8 = [(CNPosterEditOptionsViewController *)self delegate];
  [v8 posterEditOptionsViewController:self didEditPosterWithContext:v6];
}

- (void)avatarPosterPairCollectionDidSelectEditAvatar:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPosterEditOptionsViewController *)self pendingPoster];
  id v7 = +[CNAvatarPosterCarouselEditingContext contextWithExistingPoster:v5 existingAvatar:v4];

  BOOL v6 = [(CNPosterEditOptionsViewController *)self delegate];
  [v6 posterEditOptionsViewController:self didSelectEditAvatarWithContext:v7];
}

- (void)avatarPosterPairCollectionDidDeletePosterPair
{
  id v3 = [(CNPosterEditOptionsViewController *)self delegate];
  [v3 posterEditOptionsViewControllerDidDeleteExistingPosterPair:self];
}

- (void)avatarPosterPairCollectionDidDeleteCurrentPosterPair
{
  id v3 = [(CNPosterEditOptionsViewController *)self delegate];
  [v3 posterEditOptionsViewControllerDidDeleteCurrentPosterPair:self];
}

- (void)avatarPosterPairCollectionDidLoadCurrentPairWithAvatar:(id)a3 poster:(id)a4 backedByRecents:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v11 = [(CNPosterEditOptionsViewController *)self finalizedCurrentAvatar:a3 backedByRecents:v5];
  id v9 = [(CNPosterEditOptionsViewController *)self finalizedCurrentPoster:v8];

  id v10 = [(CNPosterEditOptionsViewController *)self delegate];
  [v10 posterEditOptionsViewController:self didLoadCurrentAvatar:v11 poster:v9 backedByRecents:v5];
}

- (void)viewDidLoad
{
  v46[4] = *MEMORY[0x1E4F143B8];
  v45.receiver = self;
  v45.super_class = (Class)CNPosterEditOptionsViewController;
  [(CNPosterEditOptionsViewController *)&v45 viewDidLoad];
  id v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v4 = [(CNPosterEditOptionsViewController *)self view];
  [v4 setBackgroundColor:v3];

  BOOL v5 = [_TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper alloc];
  BOOL v6 = [(CNPosterEditOptionsViewController *)self configuration];
  id v7 = [(CNPosterEditOptionsViewController *)self contact];
  id v8 = [(CNPosterEditOptionsViewController *)self contactForSharedProfile];
  id v9 = [(CNAvatarPosterPairCollectionViewControllerWrapper *)v5 initWithConfiguration:v6 contact:v7 contactForSharedProfile:v8 mode:[(CNPosterEditOptionsViewController *)self mode] delegate:self];

  id v10 = v9;
  id v11 = [(CNAvatarPosterPairCollectionViewControllerWrapper *)v9 viewController];
  v12 = [v11 view];

  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [(CNAvatarPosterPairCollectionViewControllerWrapper *)v10 viewController];
  [v13 willMoveToParentViewController:self];

  v44 = v10;
  v14 = [(CNAvatarPosterPairCollectionViewControllerWrapper *)v10 viewController];
  [(CNPosterEditOptionsViewController *)self addChildViewController:v14];

  v15 = [(CNPosterEditOptionsViewController *)self view];
  [v15 addSubview:v12];

  v16 = [(CNAvatarPosterPairCollectionViewControllerWrapper *)v10 viewController];
  [v16 didMoveToParentViewController:self];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_posterEditOptionsDidCancel];
  v18 = [(CNPosterEditOptionsViewController *)self navigationItem];
  [v18 setLeftBarButtonItem:v17];

  v19 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_posterEditOptionsDidTapDone];
  id v20 = [(CNPosterEditOptionsViewController *)self navigationItem];
  [v20 setRightBarButtonItem:v19];

  v21 = [(CNPosterEditOptionsViewController *)self navigationItem];
  v22 = [v21 rightBarButtonItem];
  [v22 setEnabled:0];

  v23 = [(CNPosterEditOptionsViewController *)self navigationItem];
  [v23 _setBackgroundHidden:1];

  v35 = (void *)MEMORY[0x1E4F28DC8];
  v24 = v12;
  v42 = [v12 leadingAnchor];
  v43 = [(CNPosterEditOptionsViewController *)self view];
  v41 = [v43 leadingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v46[0] = v40;
  v38 = [v12 trailingAnchor];
  v39 = [(CNPosterEditOptionsViewController *)self view];
  v36 = [v39 trailingAnchor];
  v25 = [v38 constraintEqualToAnchor:v36];
  v46[1] = v25;
  v37 = v12;
  v26 = [v12 topAnchor];
  v27 = [(CNPosterEditOptionsViewController *)self view];
  v28 = [v27 topAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  v46[2] = v29;
  v30 = [v24 bottomAnchor];
  v31 = [(CNPosterEditOptionsViewController *)self view];
  v32 = [v31 bottomAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  v46[3] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
  [v35 activateConstraints:v34];
}

- (CNPosterEditOptionsViewController)initWithContact:(id)a3 mode:(int64_t)a4
{
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CNPosterEditOptionsViewController;
  id v8 = [(CNPosterEditOptionsViewController *)&v22 init];
  if (v8)
  {
    id v9 = [_TtC10ContactsUI31CNPosterEditorViewConfiguration alloc];
    if (a4)
    {
      id v10 = [v7 wallpaper];
      id v11 = [v10 posterArchiveData];
      v12 = [v7 posterName];
      uint64_t v13 = [(CNPosterEditorViewConfiguration *)v9 initWithPosterArchiveData:v11 displayName:v12];
      configuration = v8->_configuration;
      v8->_configuration = (_TtC10ContactsUI31CNPosterEditorViewConfiguration *)v13;
    }
    else
    {
      id v10 = [v7 imageData];
      id v11 = [v7 posterName];
      uint64_t v15 = [(CNPosterEditorViewConfiguration *)v9 initWithImageData:v10 displayName:v11];
      v12 = v8->_configuration;
      v8->_configuration = (_TtC10ContactsUI31CNPosterEditorViewConfiguration *)v15;
    }

    objc_storeStrong((id *)&v8->_contact, a3);
    v16 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v17 = [v16 nicknameProvider];
    uint64_t v18 = [v17 nicknameAsContactForContact:v7];
    contactForSharedProfile = v8->_contactForSharedProfile;
    v8->_contactForSharedProfile = (CNContact *)v18;

    v8->_mode = a4;
    id v20 = v8;
  }

  return v8;
}

@end