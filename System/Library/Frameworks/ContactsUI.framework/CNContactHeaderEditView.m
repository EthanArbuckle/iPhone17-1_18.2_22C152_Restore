@interface CNContactHeaderEditView
+ (id)contactHeaderViewWithContact:(id)a3 shouldAllowTakePhotoAction:(BOOL)a4 monogramOnly:(BOOL)a5 isOutOfProcess:(BOOL)a6 delegate:(id)a7;
+ (id)contactHeaderViewWithContact:(id)a3 shouldAllowTakePhotoAction:(BOOL)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 isOutOfProcess:(BOOL)a7 delegate:(id)a8;
+ (id)makePhotoViewWithShouldAllowTakePhotoAction:(BOOL)a3 shouldAllowImageDrops:(BOOL)a4 monogramOnly:(BOOL)a5;
+ (id)sizeAttributesShowingNavBar:(BOOL)a3;
- (BOOL)allowsEditPhoto;
- (BOOL)hasPhoto;
- (BOOL)hasWallpaper;
- (BOOL)isOutOfProcess;
- (BOOL)photoIsModified;
- (BOOL)shouldShowPoster;
- (BOOL)shouldUseStaticHeader;
- (BOOL)wallpaperIsModified;
- (CGSize)maxButtonSize;
- (CNContactHeaderEditView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowTakePhotoAction:(BOOL)a5 delegate:(id)a6 showingNavBar:(BOOL)a7 monogramOnly:(BOOL)a8 isOutOfProcess:(BOOL)a9;
- (CNContactHeaderEditView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowTakePhotoAction:(BOOL)a5 showingNavBar:(BOOL)a6 monogramOnly:(BOOL)a7 isOutOfProcess:(BOOL)a8 delegate:(id)a9;
- (CNMutableContact)editingWallpaperContact;
- (CNPRSPosterConfiguration)cachedPosterConfiguration;
- (CNSNaPSetupFlowManager)flowManager;
- (CNSensitiveContentAnalysisManager)sensitiveContentManager;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (UIButton)editButton;
- (_TtC10ContactsUI32CNHostingPosterSnapshotImageView)editingPosterView;
- (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer)carouselPreWarmer;
- (double)defaultMaxHeight;
- (double)maxHeight;
- (double)minHeight;
- (double)staticEditingHeaderHeight;
- (double)staticHeaderPhotoAvatarAndPosterTopMargin;
- (double)staticHeaderPhotoAvatarOnlyTopMargin;
- (double)staticHeaderPhotoHeight;
- (double)staticHeaderPhotoTopMargin;
- (double)staticHeaderPhotoTopMarginOffset;
- (id)mutableContact;
- (id)posterPlaceholderImage;
- (void)_presentRemotePosterAndAvatarEditorWithMode:(int64_t)a3 isEditing:(BOOL)a4;
- (void)avatarPosterEditorFromFlowManager:(id)a3 didUpdateContact:(id)a4 withVisualIdentity:(id)a5;
- (void)avatarPosterEditorFromFlowManagerDidCancel:(id)a3;
- (void)calculateLabelSizesIfNeeded;
- (void)didFinishUsing;
- (void)didTapPhotoViewWhileEditing:(BOOL)a3;
- (void)discardPendingAvatarPosterEdits;
- (void)editAvatar;
- (void)editButtonTapped;
- (void)editButtonTappedWhileEditing:(BOOL)a3;
- (void)editPoster;
- (void)layoutSubviews;
- (void)preWarmPosterAndAvatarEditor;
- (void)presentAvatarPickerWithImageData:(id)a3;
- (void)presentPosterAndAvatarEditorWithMode:(int64_t)a3 isEditing:(BOOL)a4;
- (void)reloadDataPreservingChanges:(BOOL)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)saveContactPhoto;
- (void)setAllowsEditPhoto:(BOOL)a3;
- (void)setAllowsEditPhoto:(BOOL)a3 preservingChanges:(BOOL)a4;
- (void)setCachedPosterConfiguration:(id)a3;
- (void)setCarouselPreWarmer:(id)a3;
- (void)setEditButton:(id)a3;
- (void)setEditingPosterView:(id)a3;
- (void)setEditingWallpaperContact:(id)a3;
- (void)setFlowManager:(id)a3;
- (void)setIsOutOfProcess:(BOOL)a3;
- (void)setMaxButtonSize:(CGSize)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setRemoteAlertHandle:(id)a3;
- (void)setUpEditButton;
- (void)setUpPosterView;
- (void)updateConstraints;
- (void)updateContactWithEditedPropertyItem:(id)a3;
- (void)updateEditButtonTitle;
- (void)updateFontSizes;
- (void)updatePendingWallpaperContactWithEditedPropertyItem:(id)a3;
- (void)updatePosterViewImage;
- (void)updatePosterViewImageWithNewPosterConfiguration:(BOOL)a3;
- (void)updatePosterVisibility;
- (void)updateSizeDependentAttributes;
- (void)updateWithContacts:(id)a3;
@end

@implementation CNContactHeaderEditView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveContentManager, 0);
  objc_storeStrong((id *)&self->_editingWallpaperContact, 0);
  objc_storeStrong((id *)&self->_cachedPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_carouselPreWarmer, 0);
  objc_storeStrong((id *)&self->_flowManager, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_editingPosterView, 0);

  objc_storeStrong((id *)&self->_editButton, 0);
}

- (CNSensitiveContentAnalysisManager)sensitiveContentManager
{
  return self->_sensitiveContentManager;
}

- (void)setIsOutOfProcess:(BOOL)a3
{
  self->_isOutOfProcess = a3;
}

- (BOOL)isOutOfProcess
{
  return self->_isOutOfProcess;
}

- (void)setEditingWallpaperContact:(id)a3
{
}

- (CNMutableContact)editingWallpaperContact
{
  return self->_editingWallpaperContact;
}

- (void)setCachedPosterConfiguration:(id)a3
{
}

- (CNPRSPosterConfiguration)cachedPosterConfiguration
{
  return self->_cachedPosterConfiguration;
}

- (void)setCarouselPreWarmer:(id)a3
{
}

- (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer)carouselPreWarmer
{
  return self->_carouselPreWarmer;
}

- (void)setFlowManager:(id)a3
{
}

- (CNSNaPSetupFlowManager)flowManager
{
  return self->_flowManager;
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setEditingPosterView:(id)a3
{
}

- (_TtC10ContactsUI32CNHostingPosterSnapshotImageView)editingPosterView
{
  return self->_editingPosterView;
}

- (void)setEditButton:(id)a3
{
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (void)setMaxButtonSize:(CGSize)a3
{
  self->_maxButtonSize = a3;
}

- (CGSize)maxButtonSize
{
  double width = self->_maxButtonSize.width;
  double height = self->_maxButtonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)allowsEditPhoto
{
  return self->_allowsEditPhoto;
}

- (void)avatarPosterEditorFromFlowManagerDidCancel:(id)a3
{
  [(CNContactHeaderEditView *)self setFlowManager:0];

  [(CNContactHeaderEditView *)self discardPendingAvatarPosterEdits];
}

- (void)avatarPosterEditorFromFlowManager:(id)a3 didUpdateContact:(id)a4 withVisualIdentity:(id)a5
{
  id v6 = a4;
  [(CNContactHeaderEditView *)self updatePosterViewImageWithNewPosterConfiguration:1];
  v7 = [(CNContactHeaderView *)self photoView];
  [v7 updatePendingContactWithEditedContact:v6];

  [(CNContactHeaderEditView *)self updatePosterVisibility];

  [(CNContactHeaderEditView *)self setFlowManager:0];
}

- (void)discardPendingAvatarPosterEdits
{
  v3 = (void *)MEMORY[0x1E4F1B938];
  id v5 = [(CNContactHeaderEditView *)self editingWallpaperContact];
  v4 = [(CNContactHeaderEditView *)self mutableContact];
  [v3 updateMutableContact:v5 withImageAndWallpaperPropertiesFromContact:v4];
}

- (void)didTapPhotoViewWhileEditing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactHeaderEditView *)self allowsEditPhoto])
  {
    if ([(CNContactHeaderEditView *)self shouldUseStaticHeader])
    {
      [(CNContactHeaderEditView *)self presentPosterAndAvatarEditorWithMode:1 isEditing:v3];
    }
    else
    {
      [(CNContactHeaderEditView *)self editAvatar];
    }
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = CNUILogRemoteAlert();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = [v4 localizedDescription];
    int v7 = 138412290;
    v8 = v6;
    _os_log_error_impl(&dword_18B625000, v5, OS_LOG_TYPE_ERROR, "Remote alert handle did invalidate: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  BOOL v3 = CNUILogRemoteAlert();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_INFO, "Remote alert handle did deactivate", v4, 2u);
  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  BOOL v3 = CNUILogRemoteAlert();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_INFO, "Remote alert handle did activate", v4, 2u);
  }
}

- (void)_presentRemotePosterAndAvatarEditorWithMode:(int64_t)a3 isEditing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:@"com.apple.ContactsUI.Carousel" viewControllerClassName:@"CNContactPhotoCarouselRemoteAlertViewController"];
  id v8 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
  id v9 = objc_alloc(MEMORY[0x1E4F4F668]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __81__CNContactHeaderEditView__presentRemotePosterAndAvatarEditorWithMode_isEditing___block_invoke;
  v25[3] = &unk_1E54975E0;
  v25[4] = self;
  v10 = [MEMORY[0x1E4F4F670] responderWithHandler:v25];
  v11 = (void *)[v9 initWithInfo:0 responder:v10];

  v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
  [v8 setActions:v12];

  v13 = (void *)MEMORY[0x1E4F28DB0];
  v14 = [(CNContactHeaderEditView *)self editingWallpaperContact];
  id v24 = 0;
  v15 = [v13 archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v24];
  id v16 = v24;

  if (!(*(unsigned int (**)(void))(*MEMORY[0x1E4F5A268] + 16))())
  {
    v19 = (void *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v7 configurationContext:v8];
    [(CNContactHeaderEditView *)self setRemoteAlertHandle:v19];

    v17 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
    [v17 setReason:@"EditButtonTapped"];
    v26[0] = @"mode";
    v20 = [NSNumber numberWithInteger:a3];
    v27[0] = v20;
    v27[1] = v15;
    v26[1] = @"contactData";
    v26[2] = @"isEditing";
    v21 = [NSNumber numberWithBool:v4];
    v27[2] = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
    [v17 setUserInfo:v22];

    v23 = [(CNContactHeaderEditView *)self remoteAlertHandle];
    [v23 registerObserver:self];

    v18 = [(CNContactHeaderEditView *)self remoteAlertHandle];
    [v18 activateWithContext:v17];
    goto LABEL_5;
  }
  v17 = CNUILogRemoteAlert();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = [v16 localizedDescription];
    *(_DWORD *)buf = 138412290;
    v29 = v18;
    _os_log_error_impl(&dword_18B625000, v17, OS_LOG_TYPE_ERROR, "Could not archive editing wallpaper contact: %@", buf, 0xCu);
LABEL_5:
  }
}

void __81__CNContactHeaderEditView__presentRemotePosterAndAvatarEditorWithMode_isEditing___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [a2 info];
  BOOL v4 = [v3 objectForSetting:0];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A268] + 16))())
  {
    id v5 = CNUILogRemoteAlert();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v5, OS_LOG_TYPE_ERROR, "Response data returned from the remote Contacts carousel was empty", buf, 2u);
    }
  }
  else
  {
    id v11 = 0;
    id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v11];
    id v5 = v11;
    if (v6)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __81__CNContactHeaderEditView__presentRemotePosterAndAvatarEditorWithMode_isEditing___block_invoke_856;
      block[3] = &unk_1E549BF80;
      block[4] = *(void *)(a1 + 32);
      id v10 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      int v7 = CNUILogRemoteAlert();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [v5 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v13 = v8;
        _os_log_error_impl(&dword_18B625000, v7, OS_LOG_TYPE_ERROR, "Contact returned from the remote Contacts carousel could not be decoded: %@", buf, 0xCu);
      }
    }
  }
}

uint64_t __81__CNContactHeaderEditView__presentRemotePosterAndAvatarEditorWithMode_isEditing___block_invoke_856(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) wallpaper];
  [*(id *)(*(void *)(a1 + 32) + 632) setWallpaper:v2];

  BOOL v3 = [*(id *)(a1 + 32) photoView];
  [v3 updatePendingContactWithEditedContact:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) updatePosterViewImageWithNewPosterConfiguration:1];
  BOOL v4 = *(void **)(a1 + 32);

  return [v4 updatePosterVisibility];
}

- (void)preWarmPosterAndAvatarEditor
{
  BOOL v3 = [(CNContactHeaderEditView *)self window];
  id v13 = [v3 windowScene];

  BOOL v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1 && v13 != 0)
  {
    int v7 = [(CNContactHeaderEditView *)self editingWallpaperContact];
    id v8 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    id v9 = [v8 nicknameProvider];
    id v10 = [v9 nicknameAsContactForContact:v7];

    id v11 = [[_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer alloc] initWithContact:v7 contactForSharedProfile:v10];
    [(CNContactHeaderEditView *)self setCarouselPreWarmer:v11];

    v12 = [(CNContactHeaderEditView *)self carouselPreWarmer];
    [v12 preWarmFirstPosterSnapshotIn:v13];
  }
}

- (void)presentPosterAndAvatarEditorWithMode:(int64_t)a3 isEditing:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(CNContactHeaderEditView *)self isOutOfProcess]
    && ([MEMORY[0x1E4FB16C8] currentDevice],
        int v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 userInterfaceIdiom],
        v7,
        (v8 & 0xFFFFFFFFFFFFFFFBLL) != 1))
  {
    [(CNContactHeaderEditView *)self _presentRemotePosterAndAvatarEditorWithMode:a3 isEditing:v4];
  }
  else
  {
    id v9 = +[CNUIContactsEnvironment currentEnvironment];
    id v16 = [v9 inProcessContactStore];

    id v10 = [CNSNaPSetupFlowManager alloc];
    id v11 = [(CNContactHeaderView *)self presenterDelegate];
    v12 = [(CNSNaPSetupFlowManager *)v10 initWithPresenterDelegate:v11 contactStore:v16 mode:a3];
    [(CNContactHeaderEditView *)self setFlowManager:v12];

    id v13 = [(CNContactHeaderEditView *)self flowManager];
    [v13 setDelegate:self];

    uint64_t v14 = [(CNContactHeaderEditView *)self flowManager];
    v15 = [(CNContactHeaderEditView *)self editingWallpaperContact];
    [v14 startContactCardFlowForContact:v15 isEditing:v4];
  }
}

- (void)editPoster
{
  if ([(CNContactHeaderEditView *)self allowsEditPhoto])
  {
    [(CNContactHeaderEditView *)self presentPosterAndAvatarEditorWithMode:1 isEditing:1];
  }
}

- (void)editAvatar
{
  id v2 = [(CNContactHeaderView *)self photoView];
  [v2 presentPhotoPicker];
}

- (void)editButtonTappedWhileEditing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactHeaderEditView *)self shouldShowPoster]
    || [(CNContactHeaderEditView *)self shouldUseStaticHeader])
  {
    [(CNContactHeaderEditView *)self presentPosterAndAvatarEditorWithMode:1 isEditing:v3];
  }
  else
  {
    [(CNContactHeaderEditView *)self editAvatar];
  }
}

- (void)editButtonTapped
{
}

- (void)updatePendingWallpaperContactWithEditedPropertyItem:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 property];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F1ADF0]];
  int v7 = (uint64_t *)MEMORY[0x1E4F1AEE0];
  if (v6) {
    goto LABEL_8;
  }
  uint64_t v8 = [v4 property];
  if ([v8 isEqualToString:*MEMORY[0x1E4F1ADE0]])
  {
LABEL_7:

LABEL_8:
    uint64_t v11 = *v7;
    goto LABEL_9;
  }
  id v9 = [v4 property];
  if ([v9 isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
LABEL_6:

    goto LABEL_7;
  }
  id v10 = [v4 property];
  uint64_t v11 = *v7;
  if ([v10 isEqualToString:*v7])
  {

    goto LABEL_6;
  }
  v22 = [v4 property];
  char v23 = [v22 isEqualToString:*MEMORY[0x1E4F1AED8]];

  if ((v23 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_9:
  v12 = [v4 property];
  if (([v12 isEqualToString:v11] & 1) == 0)
  {

LABEL_13:
    v18 = [v4 property];
    if ([v18 isEqualToString:*MEMORY[0x1E4F1ADC8]])
    {
      v19 = [v4 labeledValue];

      if (v19)
      {
        uint64_t v14 = [(CNContactHeaderEditView *)self editingWallpaperContact];
        v15 = [v4 labeledValue];
        id v24 = v15;
        id v16 = (void *)MEMORY[0x1E4F1C978];
        v17 = &v24;
        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v14 = [(CNContactHeaderEditView *)self editingWallpaperContact];
    v15 = [v4 editingStringValue];
    v20 = [v4 property];
    [v14 setValue:v15 forKey:v20];
    goto LABEL_19;
  }
  id v13 = [v4 labeledValue];

  if (!v13) {
    goto LABEL_13;
  }
  uint64_t v14 = [(CNContactHeaderEditView *)self editingWallpaperContact];
  v15 = [v4 labeledValue];
  v25[0] = v15;
  id v16 = (void *)MEMORY[0x1E4F1C978];
  v17 = (void **)v25;
LABEL_16:
  v20 = [v16 arrayWithObjects:v17 count:1];
  v21 = [v4 property];
  [v14 setValue:v20 forKey:v21];

LABEL_19:
LABEL_20:
}

- (void)updateContactWithEditedPropertyItem:(id)a3
{
  id v4 = a3;
  [(CNContactHeaderEditView *)self updatePendingWallpaperContactWithEditedPropertyItem:v4];
  id v5 = [(CNContactHeaderView *)self photoView];
  [v5 updatePendingContactWithEditedPropertyItem:v4];
}

- (void)presentAvatarPickerWithImageData:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactHeaderView *)self photoView];
  [v5 presentPhotoPickerWithImageData:v4];
}

- (void)saveContactPhoto
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (![(CNContactHeaderEditView *)self wallpaperIsModified]) {
    goto LABEL_7;
  }
  BOOL v3 = CNUILogContactCard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Contact wallpaper modified, will save edits", (uint8_t *)&v21, 2u);
  }

  id v4 = [(CNContactHeaderEditView *)self mutableContact];
  [v4 setSharedPhotoDisplayPreference:2];

  id v5 = (void *)MEMORY[0x1E4F1B938];
  char v6 = [(CNContactHeaderEditView *)self mutableContact];
  [v5 updateMutableContact:v6 withWallpaperPropertiesFromContact:self->_editingWallpaperContact];

  int v7 = CNUILogContactCard();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v16 = [(CNMutableContact *)self->_editingWallpaperContact wallpaper];
    v17 = [v16 posterArchiveData];
    uint64_t v18 = [v17 length];
    v19 = [(CNMutableContact *)self->_editingWallpaperContact watchWallpaperImageData];
    uint64_t v20 = [v19 length];
    int v21 = 134218240;
    uint64_t v22 = v18;
    __int16 v23 = 2048;
    uint64_t v24 = v20;
    _os_log_debug_impl(&dword_18B625000, v7, OS_LOG_TYPE_DEBUG, "[Likeness Update] Wallpaper updated to archive data of length %ld, watch snapshot of length %ld", (uint8_t *)&v21, 0x16u);
  }
  uint64_t v8 = *MEMORY[0x1E4F5A268];
  id v9 = [(CNMutableContact *)self->_editingWallpaperContact imageData];
  LOBYTE(v8) = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  if ((v8 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E4F1B938];
    uint64_t v14 = [(CNContactHeaderEditView *)self mutableContact];
    [v15 updateMutableContact:v14 withImagePropertiesFromContact:self->_editingWallpaperContact];
  }
  else
  {
LABEL_7:
    id v10 = [(CNContactHeaderView *)self photoView];
    int v11 = [v10 modified];

    if (!v11) {
      return;
    }
    v12 = CNUILogContactCard();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_18B625000, v12, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Contact image modified, will save edits", (uint8_t *)&v21, 2u);
    }

    id v13 = [(CNContactHeaderView *)self photoView];
    [v13 saveEdits];

    uint64_t v14 = [(CNContactHeaderEditView *)self mutableContact];
    [v14 setSharedPhotoDisplayPreference:2];
  }
}

- (id)mutableContact
{
  objc_opt_class();
  BOOL v3 = [(CNContactHeaderView *)self contacts];
  id v4 = [v3 firstObject];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)wallpaperIsModified
{
  if ([(CNContactHeaderEditView *)self shouldUseStaticHeader])
  {
    id v5 = [(CNContactHeaderEditView *)self mutableContact];
    id v6 = [v5 wallpaper];
    if (v6
      || ([(CNContactHeaderEditView *)self editingWallpaperContact],
          id v2 = objc_claimAutoreleasedReturnValue(),
          [v2 wallpaper],
          (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v7 = [(CNContactHeaderEditView *)self mutableContact];
      uint64_t v8 = [v7 wallpaper];
      id v9 = [(CNContactHeaderEditView *)self editingWallpaperContact];
      id v10 = [v9 wallpaper];
      int v11 = [v8 isEqual:v10] ^ 1;

      if (v6)
      {
LABEL_9:

        return v11;
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }

    goto LABEL_9;
  }
  LOBYTE(v11) = 0;
  return v11;
}

- (BOOL)photoIsModified
{
  id v2 = [(CNContactHeaderView *)self photoView];
  char v3 = [v2 modified];

  return v3;
}

- (BOOL)hasWallpaper
{
  id v2 = [(CNMutableContact *)self->_editingWallpaperContact wallpaper];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasPhoto
{
  id v2 = [(CNContactHeaderView *)self photoView];
  char v3 = [v2 hasPhoto];

  return v3;
}

- (void)updateEditButtonTitle
{
  if ([(CNContactHeaderEditView *)self shouldShowPoster])
  {
    BOOL v3 = [(CNContactHeaderEditView *)self hasWallpaper];
    id v4 = CNContactsUIBundle();
    if (!v3)
    {
      id v5 = @"WALLPAPER_ADD_LABEL";
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  BOOL v6 = [(CNContactHeaderEditView *)self hasPhoto];
  id v4 = CNContactsUIBundle();
  if (v6)
  {
LABEL_5:
    id v5 = @"PHOTO_EDIT_LABEL";
    goto LABEL_7;
  }
  id v5 = @"PHOTO_ADD_LABEL";
LABEL_7:
  id v8 = [v4 localizedStringForKey:v5 value:&stru_1ED8AC728 table:@"Localized"];

  int v7 = [(CNContactHeaderEditView *)self editButton];
  [v7 setTitle:v8 forState:0];
}

- (void)updatePosterViewImageWithNewPosterConfiguration:(BOOL)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if ([(CNContactHeaderEditView *)self shouldShowPoster])
  {
    id v5 = [(CNContactHeaderEditView *)self posterPlaceholderImage];
    BOOL v6 = [(CNContactHeaderEditView *)self editingPosterView];
    [v6 setImage:v5];

    int v7 = [(CNMutableContact *)self->_editingWallpaperContact wallpaper];
    id v8 = [v7 posterArchiveData];
    char v9 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A268] + 16))();

    if (v9) {
      return;
    }
    id v10 = [(CNContactHeaderEditView *)self editingWallpaperContact];
    int v11 = [v10 wallpaper];
    uint64_t v12 = [v11 contentIsSensitive];

    id v13 = [(CNContactHeaderEditView *)self sensitiveContentManager];
    uint64_t v14 = [v13 shouldShowUIForPosterWithSensitiveContent:v12 forContact:v10];

    v15 = [(CNContactHeaderEditView *)self editingPosterView];
    [v15 setIsSensitiveContent:v14];

    self->_needsPosterCarouselPreWarming = 1;
    if (a3
      || ([(CNContactHeaderEditView *)self cachedPosterConfiguration],
          id v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          !v16))
    {
      v17 = [(CNMutableContact *)self->_editingWallpaperContact wallpaper];
      uint64_t v18 = [v17 posterArchiveData];
      id v46 = 0;
      v19 = +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:v18 error:&v46];
      id v20 = v46;
      cachedPosterConfiguration = self->_cachedPosterConfiguration;
      self->_cachedPosterConfiguration = v19;

      if (!self->_cachedPosterConfiguration)
      {
        uint64_t v22 = CNUILogPosters();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v36 = [v20 localizedDescription];
          *(_DWORD *)buf = 138412290;
          v48 = v36;
          _os_log_error_impl(&dword_18B625000, v22, OS_LOG_TYPE_ERROR, "Unable to unarchive poster configuration from data, %@", buf, 0xCu);
        }
      }
    }
    __int16 v23 = [(CNContactHeaderEditView *)self cachedPosterConfiguration];
    if (!v23) {
      goto LABEL_26;
    }
    v38 = [[CNPRUISIncomingCallPosterContext alloc] initWithContact:self->_editingWallpaperContact showName:0];
    uint64_t v24 = +[CNPRUISIncomingCallSnapshotDefinition contentsOnlySnapshotDefinitionWithContext:v38 attachmentIdentifiers:0];
    uint64_t v25 = +[CNPRUISPosterSnapshotRequest requestForConfiguration:v23 definition:v24 interfaceOrientation:1];
    v26 = objc_alloc_init(CNPRUISPosterSnapshotController);
    id v45 = 0;
    v27 = [(CNPRUISPosterSnapshotController *)v26 latestSnapshotBundleForRequest:v25 error:&v45];
    id v37 = v45;
    if (v27)
    {
      v28 = objc_msgSend(v24, "levelSets", v37);
      v29 = [v28 firstObject];
      uint64_t v30 = [v27 snapshotForLevelSet:v29];

      v31 = CNUILogPosters();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18B625000, v31, OS_LOG_TYPE_DEBUG, "Returning cached snapshot", buf, 2u);
      }

      if (v30)
      {
        v32 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __75__CNContactHeaderEditView_updatePosterViewImageWithNewPosterConfiguration___block_invoke;
        v43[3] = &unk_1E549BF80;
        v43[4] = self;
        id v44 = v30;
        id v33 = v30;
        [v32 performBlock:v43];

LABEL_25:
LABEL_26:

        return;
      }
    }
    else
    {
      v34 = CNUILogPosters();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B625000, v34, OS_LOG_TYPE_DEFAULT, "No snapshot found in cache", buf, 2u);
      }
    }
    v35 = CNUILogPosters();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B625000, v35, OS_LOG_TYPE_DEFAULT, "Requesting poster snapshot", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __75__CNContactHeaderEditView_updatePosterViewImageWithNewPosterConfiguration___block_invoke_832;
    v40[3] = &unk_1E54975B8;
    objc_copyWeak(&v42, (id *)buf);
    id v41 = v24;
    [(CNPRUISPosterSnapshotController *)v26 executeSnapshotRequest:v25 completion:v40];

    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)buf);
    goto LABEL_25;
  }
  id v39 = [(CNContactHeaderEditView *)self editingPosterView];
  [v39 setImage:0];
}

void __75__CNContactHeaderEditView_updatePosterViewImageWithNewPosterConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) editingPosterView];
  [v2 setImage:v1];
}

void __75__CNContactHeaderEditView_updatePosterViewImageWithNewPosterConfiguration___block_invoke_832(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    BOOL v6 = [v4 snapshotBundle];
    int v7 = [*(id *)(a1 + 32) levelSets];
    id v8 = [v7 firstObject];
    char v9 = [v6 snapshotForLevelSet:v8];

    if (v9)
    {
      id v10 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __75__CNContactHeaderEditView_updatePosterViewImageWithNewPosterConfiguration___block_invoke_2;
      v13[3] = &unk_1E549BF80;
      v13[4] = WeakRetained;
      id v14 = v9;
      [v10 performBlock:v13];
    }
    else
    {
      int v11 = CNUILogPosters();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_error_impl(&dword_18B625000, v11, OS_LOG_TYPE_ERROR, "Snapshot result returned a nil image", v12, 2u);
      }
    }
  }
  else
  {
    WeakRetained = CNUILogPosters();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_error_impl(&dword_18B625000, WeakRetained, OS_LOG_TYPE_ERROR, "Snapshot request returned no result", v12, 2u);
    }
  }
}

void __75__CNContactHeaderEditView_updatePosterViewImageWithNewPosterConfiguration___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) editingPosterView];
  [v2 setImage:v1];
}

- (void)updatePosterViewImage
{
}

- (void)setPresenterDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactHeaderEditView;
  id v4 = a3;
  [(CNContactHeaderView *)&v5 setPresenterDelegate:v4];
  -[CNSNaPSetupFlowManager setPresenterDelegate:](self->_flowManager, "setPresenterDelegate:", v4, v5.receiver, v5.super_class);
}

- (void)updateWithContacts:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNContactHeaderEditView;
  [(CNContactHeaderView *)&v8 updateWithContacts:v4];
  if (-[CNContactHeaderEditView shouldUseStaticHeader](self, "shouldUseStaticHeader") && [v4 count] == 1)
  {
    objc_super v5 = [v4 firstObject];
    BOOL v6 = (CNMutableContact *)[v5 mutableCopy];
    editingWallpaperContact = self->_editingWallpaperContact;
    self->_editingWallpaperContact = v6;

    [(CNContactHeaderEditView *)self updatePosterViewImageWithNewPosterConfiguration:1];
  }
  [(CNContactHeaderEditView *)self updateEditButtonTitle];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CNContactHeaderEditView;
  [(CNContactHeaderView *)&v11 layoutSubviews];
  if ([(CNContactHeaderEditView *)self shouldUseStaticHeader])
  {
    [(CNContactHeaderEditView *)self staticHeaderPhotoTopMargin];
    double v4 = v3;
    objc_super v5 = [(CNContactHeaderView *)self photoTopConstraint];
    [v5 constant];
    double v7 = v6;

    if (v7 != v4)
    {
      objc_super v8 = [(CNContactHeaderView *)self photoTopConstraint];
      [v8 setConstant:v4];
    }
    if (self->_needsPosterCarouselPreWarming)
    {
      self->_needsPosterCarouselPreWarming = 0;
      char v9 = CNUILogPosters();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEFAULT, "Pre-warming carousel poster snapshot", v10, 2u);
      }

      [(CNContactHeaderEditView *)self preWarmPosterAndAvatarEditor];
    }
  }
}

- (void)updateSizeDependentAttributes
{
  if (![(CNContactHeaderEditView *)self shouldUseStaticHeader])
  {
    v12.receiver = self;
    v12.super_class = (Class)CNContactHeaderEditView;
    [(CNContactHeaderView *)&v12 updateSizeDependentAttributes];
    [(CNContactHeaderEditView *)self bounds];
    if (v3 > 0.0)
    {
      [(CNContactHeaderView *)self currentHeightPercentMaximized];
      double v5 = v4;
      double v6 = pow(v4, 3.0);
      double v7 = [(CNContactHeaderEditView *)self editButton];
      [v7 setAlpha:v6];

      [(id)sCurrentTaglineFont _scaledValueForValue:16.0];
      char v9 = [(id)sCurrentTaglineFont fontWithSize:v5 * v8];
      id v10 = [(CNContactHeaderEditView *)self editButton];
      objc_super v11 = [v10 titleLabel];
      [v11 setFont:v9];
    }
  }
}

- (double)staticHeaderPhotoHeight
{
  double v3 = 0.0;
  if ([(CNContactHeaderEditView *)self shouldUseStaticHeader])
  {
    BOOL v4 = [(CNContactHeaderEditView *)self shouldShowPoster];
    double v5 = [(CNContactHeaderView *)self sizeAttributes];
    double v6 = v5;
    if (v4) {
      [v5 photoMinHeight];
    }
    else {
      [v5 photoMaxHeight];
    }
    double v3 = v7;

    if ([(CNContactHeaderView *)self isPhotoLowQuality])
    {
      double v8 = [(CNContactHeaderView *)self sizeAttributes];
      [v8 photoMaxHeightLowQuality];
      double v10 = v9;

      if (v3 >= v10) {
        return v10;
      }
    }
  }
  return v3;
}

- (void)updateConstraints
{
  v77[4] = *MEMORY[0x1E4F143B8];
  v73.receiver = self;
  v73.super_class = (Class)CNContactHeaderEditView;
  [(CNContactHeaderView *)&v73 updateConstraints];
  double v3 = (void *)MEMORY[0x1E4F1CA48];
  BOOL v4 = [(CNContactHeaderView *)self activatedConstraints];
  double v5 = [v3 arrayWithArray:v4];

  double v6 = [(CNContactHeaderView *)self photoView];
  double v7 = [v6 centerXAnchor];
  double v8 = [(CNContactHeaderEditView *)self centerXAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  v72 = v5;
  [v5 addObject:v9];

  if ([(CNContactHeaderEditView *)self shouldShowPoster])
  {
    double v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 bounds];
    double v12 = v11;

    id v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v13 bounds];
    double v15 = v14;

    if (v12 / v15 >= v15 / v12) {
      double v16 = v12 / v15;
    }
    else {
      double v16 = v15 / v12;
    }
    v70 = [(CNContactHeaderEditView *)self editingPosterView];
    v67 = [v70 view];
    v64 = [v67 topAnchor];
    v65 = [(CNContactHeaderView *)self photoView];
    v63 = [v65 bottomAnchor];
    v62 = [v64 constraintEqualToAnchor:v63 constant:16.0];
    v77[0] = v62;
    v61 = [(CNContactHeaderEditView *)self editingPosterView];
    v60 = [v61 view];
    v59 = [v60 centerXAnchor];
    v58 = [(CNContactHeaderEditView *)self centerXAnchor];
    v57 = [v59 constraintEqualToAnchor:v58];
    v77[1] = v57;
    v56 = [(CNContactHeaderEditView *)self editingPosterView];
    v55 = [v56 view];
    v17 = [v55 heightAnchor];
    uint64_t v18 = [(CNContactHeaderView *)self sizeAttributes];
    [v18 posterMaxHeight];
    v19 = objc_msgSend(v17, "constraintEqualToConstant:");
    v77[2] = v19;
    id v20 = (void *)MEMORY[0x1E4F28DC8];
    int v21 = [(CNContactHeaderEditView *)self editingPosterView];
    uint64_t v22 = [v21 view];
    __int16 v23 = [(CNContactHeaderEditView *)self editingPosterView];
    uint64_t v24 = [v23 view];
    uint64_t v25 = [v20 constraintWithItem:v22 attribute:8 relatedBy:0 toItem:v24 attribute:7 multiplier:v16 constant:0.0];
    v77[3] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:4];
    [v72 addObjectsFromArray:v26];
  }
  if ([(CNContactHeaderEditView *)self shouldUseStaticHeader])
  {
    [(CNContactHeaderEditView *)self staticHeaderPhotoTopMargin];
    double v28 = v27;
    v29 = [(CNContactHeaderView *)self photoTopConstraint];
    [v29 setConstant:v28];

    uint64_t v30 = [(CNContactHeaderView *)self photoTopConstraint];
    LODWORD(v31) = 1148846080;
    [v30 setPriority:v31];

    [(CNContactHeaderEditView *)self staticHeaderPhotoHeight];
    double v33 = v32;
    v34 = [(CNContactHeaderView *)self photoHeightConstraint];
    [v34 setConstant:v33];
  }
  if ([(CNContactHeaderEditView *)self shouldShowPoster])
  {
    v35 = [(CNContactHeaderEditView *)self editingPosterView];
    v36 = [v35 view];
    v71 = [v36 bottomAnchor];
  }
  else
  {
    v35 = [(CNContactHeaderView *)self photoView];
    v71 = [v35 bottomAnchor];
  }

  BOOL v37 = [(CNContactHeaderEditView *)self shouldUseStaticHeader];
  v68 = [(CNContactHeaderEditView *)self editButton];
  v38 = [v68 leadingAnchor];
  id v39 = [(CNContactHeaderEditView *)self leadingAnchor];
  if (v37)
  {
    v40 = [v38 constraintGreaterThanOrEqualToAnchor:v39];
    v76[0] = v40;
    id v41 = [(CNContactHeaderEditView *)self editButton];
    id v42 = [v41 trailingAnchor];
    v43 = [(CNContactHeaderEditView *)self trailingAnchor];
    id v44 = [v42 constraintLessThanOrEqualToAnchor:v43];
    v76[1] = v44;
    double v45 = 12.0;
    id v46 = v76;
  }
  else
  {
    v40 = [v38 constraintEqualToAnchor:v39];
    v75[0] = v40;
    id v41 = [(CNContactHeaderEditView *)self editButton];
    id v42 = [v41 trailingAnchor];
    v43 = [(CNContactHeaderEditView *)self trailingAnchor];
    id v44 = [v42 constraintEqualToAnchor:v43];
    v75[1] = v44;
    double v45 = 0.0;
    id v46 = v75;
  }
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  [v72 addObjectsFromArray:v47];

  v69 = [(CNContactHeaderEditView *)self editButton];
  v66 = [v69 centerXAnchor];
  v48 = [(CNContactHeaderView *)self photoView];
  uint64_t v49 = [v48 centerXAnchor];
  v50 = [v66 constraintEqualToAnchor:v49];
  v74[0] = v50;
  v51 = [(CNContactHeaderEditView *)self editButton];
  v52 = [v51 topAnchor];
  v53 = [v52 constraintEqualToAnchor:v71 constant:v45];
  v74[1] = v53;
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
  [v72 addObjectsFromArray:v54];

  [MEMORY[0x1E4F28DC8] activateConstraints:v72];
  [(CNContactHeaderView *)self setActivatedConstraints:v72];
}

- (void)updatePosterVisibility
{
  int v3 = [(CNContactHeaderEditView *)self shouldShowPoster];
  BOOL v4 = [(CNContactHeaderEditView *)self editingPosterView];
  double v5 = [v4 view];
  int v6 = [v5 isHidden];

  if (v3 == v6)
  {
    uint64_t v7 = [(CNContactHeaderEditView *)self shouldShowPoster] ^ 1;
    double v8 = [(CNContactHeaderEditView *)self editingPosterView];
    double v9 = [v8 view];
    [v9 setHidden:v7];

    id v10 = [(CNContactHeaderView *)self delegate];
    [v10 headerViewDidChangeHeight:self];
  }
}

- (void)updateFontSizes
{
  v14.receiver = self;
  v14.super_class = (Class)CNContactHeaderEditView;
  [(CNContactHeaderView *)&v14 updateFontSizes];
  int v3 = [(CNContactHeaderView *)self photoView];
  [v3 updateFontSizes];

  if ([(CNContactHeaderView *)self needsLabelSizeCalculation])
  {
    [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:0];
    if (![(CNContactHeaderEditView *)self shouldUseStaticHeader])
    {
      uint64_t v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
      double v5 = (void *)sCurrentTaglineFont;
      sCurrentTaglineFont = v4;

      [(id)sCurrentTaglineFont _scaledValueForValue:16.0];
      int v6 = objc_msgSend((id)sCurrentTaglineFont, "fontWithSize:");
      uint64_t v7 = [(CNContactHeaderEditView *)self editButton];
      double v8 = [v7 titleLabel];
      [v8 setFont:v6];
    }
    double v9 = [(CNContactHeaderEditView *)self editButton];
    id v10 = [v9 titleLabel];
    [(CNContactHeaderEditView *)self bounds];
    objc_msgSend(v10, "sizeThatFits:", v11, v12);
    -[CNContactHeaderEditView setMaxButtonSize:](self, "setMaxButtonSize:");

    id v13 = [(CNContactHeaderView *)self delegate];
    [v13 headerViewDidUpdateLabelSizes];
  }
}

- (void)calculateLabelSizesIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactHeaderEditView;
  [(CNContactHeaderView *)&v3 calculateLabelSizesIfNeeded];
  [(CNContactHeaderEditView *)self updateFontSizes];
}

- (double)staticHeaderPhotoAvatarOnlyTopMargin
{
  [(CNContactHeaderEditView *)self staticHeaderPhotoTopMarginOffset];
  double v4 = v3;
  double v5 = [(CNContactHeaderView *)self sizeAttributes];
  [v5 photoMaxTopMargin];
  double v7 = v6;

  return v4 + v7;
}

- (double)staticHeaderPhotoAvatarAndPosterTopMargin
{
  [(CNContactHeaderEditView *)self staticHeaderPhotoTopMarginOffset];
  double v4 = v3;
  double v5 = [(CNContactHeaderView *)self sizeAttributes];
  [v5 photoMinTopMargin];
  double v7 = v6;

  return v4 + v7;
}

- (double)staticHeaderPhotoTopMargin
{
  if ([(CNContactHeaderEditView *)self shouldShowPoster])
  {
    [(CNContactHeaderEditView *)self staticHeaderPhotoAvatarAndPosterTopMargin];
  }
  else
  {
    [(CNContactHeaderEditView *)self staticHeaderPhotoAvatarOnlyTopMargin];
  }
  return result;
}

- (double)staticHeaderPhotoTopMarginOffset
{
  double v3 = [(CNContactHeaderView *)self delegate];
  [v3 navigationBarHeight];
  double v5 = v4;

  double v6 = [(CNContactHeaderView *)self delegate];
  [v6 headerViewSafeAreaInsets];
  double v8 = v7;

  return v5 + v8;
}

- (double)staticEditingHeaderHeight
{
  [(CNContactHeaderEditView *)self maxButtonSize];
  if (v3 == 0.0) {
    [(CNContactHeaderEditView *)self calculateLabelSizesIfNeeded];
  }
  [(CNContactHeaderEditView *)self staticHeaderPhotoTopMargin];
  double v5 = v4;
  [(CNContactHeaderEditView *)self staticHeaderPhotoHeight];
  double v7 = v5 + v6;
  double v8 = [(CNContactHeaderEditView *)self editButton];
  char v9 = [v8 isHidden];

  if ((v9 & 1) == 0)
  {
    [(CNContactHeaderEditView *)self maxButtonSize];
    double v7 = v7 + v10 + 12.0 + 16.0;
  }
  BOOL v11 = [(CNContactHeaderEditView *)self shouldShowPoster];
  double v12 = [(CNContactHeaderView *)self sizeAttributes];
  id v13 = v12;
  if (v11)
  {
    [v12 posterMaxHeight];
    double v15 = v14 + 16.0;
    double v16 = [(CNContactHeaderView *)self sizeAttributes];
    [v16 photoMinBottomMargin];
    double v18 = v15 + v17;
  }
  else
  {
    [v12 photoMaxBottomMargin];
    double v18 = v19;
  }

  return v7 + v18;
}

- (double)defaultMaxHeight
{
  if ([(CNContactHeaderEditView *)self shouldUseStaticHeader])
  {
    [(CNContactHeaderEditView *)self staticEditingHeaderHeight];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNContactHeaderEditView;
    [(CNContactHeaderView *)&v7 defaultMaxHeight];
    double v5 = v4;
    [(CNContactHeaderEditView *)self maxButtonSize];
    return v5 + v6;
  }
  return result;
}

- (double)maxHeight
{
  if ([(CNContactHeaderEditView *)self shouldUseStaticHeader])
  {
    [(CNContactHeaderEditView *)self staticEditingHeaderHeight];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNContactHeaderEditView;
    [(CNContactHeaderView *)&v7 maxHeight];
    double v5 = v4;
    [(CNContactHeaderEditView *)self maxButtonSize];
    return v5 + v6;
  }
  return result;
}

- (double)minHeight
{
  if ([(CNContactHeaderEditView *)self shouldUseStaticHeader])
  {
    [(CNContactHeaderEditView *)self staticEditingHeaderHeight];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CNContactHeaderEditView;
    [(CNContactHeaderView *)&v4 minHeight];
  }
  return result;
}

- (BOOL)shouldUseStaticHeader
{
  id v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  double v3 = [v2 featureFlags];
  char v4 = [v3 isFeatureEnabled:16];

  return v4;
}

- (BOOL)shouldShowPoster
{
  if ([(CNContactHeaderView *)self showMonogramsOnly]
    || ![(CNContactHeaderEditView *)self shouldUseStaticHeader]
    || [(CNContactHeaderView *)self isPad])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    double v5 = [(CNContactHeaderView *)self contacts];
    if ([v5 count] == 1)
    {
      uint64_t v6 = *MEMORY[0x1E4F5A268];
      objc_super v7 = [(CNContactHeaderEditView *)self editingWallpaperContact];
      double v8 = [v7 wallpaper];
      char v9 = [v8 posterArchiveData];
      int v3 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v9) ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)setAllowsEditPhoto:(BOOL)a3 preservingChanges:(BOOL)a4
{
  if (self->_allowsEditPhoto != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_allowsEditPhoto = a3;
    objc_super v7 = [(CNContactHeaderView *)self photoView];
    [v7 setEditing:v5 preservingChanges:v4];

    id v8 = [(CNContactHeaderEditView *)self editButton];
    [v8 setHidden:v5 ^ 1];
  }
}

- (void)setAllowsEditPhoto:(BOOL)a3
{
}

- (void)didFinishUsing
{
  if ((CNContactHeaderEditView *)sEditingContactHeaderView == self)
  {
    sEditingContactHeaderView = 0;
  }
}

- (id)posterPlaceholderImage
{
  id v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;

  v11.double width = v4;
  v11.double height = v6;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  objc_super v7 = [MEMORY[0x1E4FB1618] lightGrayColor];
  [v7 setFill];

  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.double width = v4;
  v12.size.double height = v6;
  UIRectFill(v12);
  id v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v8;
}

- (void)setUpPosterView
{
  id v8 = objc_alloc_init(_TtC10ContactsUI32CNHostingPosterSnapshotImageView);
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_editPoster];
  CGFloat v4 = [(CNHostingPosterSnapshotImageView *)v8 view];
  [v4 addGestureRecognizer:v3];

  double v5 = [(CNHostingPosterSnapshotImageView *)v8 view];
  [v5 setUserInteractionEnabled:1];

  CGFloat v6 = [(CNHostingPosterSnapshotImageView *)v8 view];
  [v6 setHidden:1];

  objc_super v7 = [(CNHostingPosterSnapshotImageView *)v8 view];
  [(CNContactHeaderEditView *)self addSubview:v7];

  [(CNContactHeaderEditView *)self setEditingPosterView:v8];
}

- (void)setUpEditButton
{
  if ([(CNContactHeaderEditView *)self shouldUseStaticHeader])
  {
    double v3 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
    [v3 setCornerStyle:4];
    objc_msgSend(v3, "setContentInsets:", 8.0, 24.0, 8.0, 24.0);
    CGFloat v4 = [MEMORY[0x1E4FB1618] labelColor];
    [v3 setBaseForegroundColor:v4];

    double v5 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    [v3 setBaseBackgroundColor:v5];

    [v3 setTitleTextAttributesTransformer:&__block_literal_global_824];
    CGFloat v6 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v3 primaryAction:0];
  }
  else
  {
    CGFloat v6 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    objc_super v7 = [(UIButton *)v6 titleLabel];
    [v7 setNumberOfLines:3];

    id v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    char v9 = [(UIButton *)v6 titleLabel];
    [v9 setFont:v8];

    double v10 = [(UIButton *)v6 titleLabel];
    [v10 setAdjustsFontForContentSizeCategory:1];

    [(UIButton *)v6 setPointerInteractionEnabled:1];
  }
  [(UIButton *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)v6 addTarget:self action:sel_editButtonTapped forControlEvents:64];
  [(CNContactHeaderEditView *)self addSubview:v6];
  editButton = self->_editButton;
  self->_editButton = v6;
}

id __42__CNContactHeaderEditView_setUpEditButton__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 mutableCopy];
  double v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v3 _scaledValueForValue:16.0];
  CGFloat v4 = objc_msgSend(v3, "fontWithSize:");

  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v2;
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactHeaderEditView;
  -[CNContactHeaderView reloadDataPreservingChanges:](&v7, sel_reloadDataPreservingChanges_);
  if ([(CNContactHeaderEditView *)self shouldUseStaticHeader])
  {
    if (!a3)
    {
      double v5 = [(CNContactHeaderEditView *)self mutableContact];
      CGFloat v6 = (void *)[v5 mutableCopy];
      [(CNContactHeaderEditView *)self setEditingWallpaperContact:v6];
    }
    [(CNContactHeaderEditView *)self updatePosterViewImage];
    [(CNContactHeaderEditView *)self updatePosterVisibility];
  }
}

- (CNContactHeaderEditView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowTakePhotoAction:(BOOL)a5 delegate:(id)a6 showingNavBar:(BOOL)a7 monogramOnly:(BOOL)a8 isOutOfProcess:(BOOL)a9
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  BOOL v13 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v19 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CNContactHeaderEditView;
  id v20 = -[CNContactHeaderView initWithContact:frame:shouldAllowTakePhotoAction:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:](&v29, sel_initWithContact_frame_shouldAllowTakePhotoAction_shouldAllowImageDrops_showingNavBar_monogramOnly_delegate_, v19, v13, 1, v11, v10, a6, x, y, width, height);
  int v21 = v20;
  if (v20)
  {
    uint64_t v22 = [(CNContactHeaderView *)v20 photoView];
    [v22 setEditing:1];

    v21->_allowsEditPhoto = 1;
    v21->_isOutOfProcess = a9;
    uint64_t v23 = +[CNSensitiveContentAnalysisManager defaultManager];
    sensitiveContentManager = v21->_sensitiveContentManager;
    v21->_sensitiveContentManager = (CNSensitiveContentAnalysisManager *)v23;

    [(CNContactHeaderEditView *)v21 setUpEditButton];
    if ([(CNContactHeaderEditView *)v21 shouldUseStaticHeader])
    {
      uint64_t v25 = [v19 mutableCopy];
      editingWallpaperContact = v21->_editingWallpaperContact;
      v21->_editingWallpaperContact = (CNMutableContact *)v25;

      [(CNContactHeaderEditView *)v21 setUpPosterView];
    }
    double v27 = v21;
  }

  return v21;
}

- (CNContactHeaderEditView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowTakePhotoAction:(BOOL)a5 showingNavBar:(BOOL)a6 monogramOnly:(BOOL)a7 isOutOfProcess:(BOOL)a8 delegate:(id)a9
{
  return -[CNContactHeaderEditView initWithContact:frame:shouldAllowTakePhotoAction:delegate:showingNavBar:monogramOnly:isOutOfProcess:](self, "initWithContact:frame:shouldAllowTakePhotoAction:delegate:showingNavBar:monogramOnly:isOutOfProcess:", a3, a5, a9, a6, a7, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)sizeAttributesShowingNavBar:(BOOL)a3
{
  CGFloat v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  double v5 = [v4 featureFlags];
  int v6 = [v5 isFeatureEnabled:16];

  if (v6)
  {
    if (a3) {
      +[CNContactHeaderViewSizeAttributes staticEditingAttributesWithNavBar];
    }
    else {
      +[CNContactHeaderViewSizeAttributes staticEditingAttributes];
    }
  }
  else if (a3)
  {
    +[CNContactHeaderViewSizeAttributes editingAttributesWithNavBar];
  }
  else
  {
    +[CNContactHeaderViewSizeAttributes editingAttributes];
  objc_super v7 = };

  return v7;
}

+ (id)makePhotoViewWithShouldAllowTakePhotoAction:(BOOL)a3 shouldAllowImageDrops:(BOOL)a4 monogramOnly:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v8 = +[CNUIContactsEnvironment currentEnvironment];
  id v9 = objc_alloc(MEMORY[0x1E4F5A6E0]);
  BOOL v10 = [v8 inProcessContactStore];
  BOOL v11 = [v8 defaultSchedulerProvider];
  CGRect v12 = (void *)[v9 initWithContactStore:v10 schedulerProvider:v11];

  [v12 setProhibitedSources:8];
  if (v5)
  {
    BOOL v13 = [v8 cachingMonogramRenderer];
  }
  else
  {
    double v14 = (void *)MEMORY[0x1E4F5A6C0];
    double v15 = [v8 defaultSchedulerProvider];
    BOOL v13 = [v14 rendererWithLikenessResolver:v12 schedulerProvider:v15];
  }
  double v16 = [CNContactPhotoView alloc];
  double v17 = [v8 inProcessContactStore];
  double v18 = -[CNContactPhotoView initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:allowStaleRendering:](v16, "initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:allowStaleRendering:", v7, 1, v17, v6, v13, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v18;
}

+ (id)contactHeaderViewWithContact:(id)a3 shouldAllowTakePhotoAction:(BOOL)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 isOutOfProcess:(BOOL)a7 delegate:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a8;
  double v16 = [(id)sEditingContactHeaderView delegate];

  if (v16)
  {
    id v17 = objc_alloc((Class)a1);
    id v18 = (id)objc_msgSend(v17, "initWithContact:frame:shouldAllowTakePhotoAction:delegate:showingNavBar:monogramOnly:isOutOfProcess:", v14, v12, v15, v11, v10, v9, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
LABEL_3:
    id v19 = v18;
    [v18 updateEditButtonTitle];
    goto LABEL_6;
  }
  if (!sEditingContactHeaderView)
  {
    id v21 = objc_alloc((Class)a1);
    uint64_t v22 = objc_msgSend(v21, "initWithContact:frame:shouldAllowTakePhotoAction:delegate:showingNavBar:monogramOnly:isOutOfProcess:", v14, v12, v15, v11, v10, v9, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v23 = (void *)sEditingContactHeaderView;
    sEditingContactHeaderView = v22;

    id v18 = (id)sEditingContactHeaderView;
    goto LABEL_3;
  }
  id v19 = (id)sEditingContactHeaderView;
  [v19 setDelegate:v15];
  [v19 prepareForReuse];
  [v19 updateForShowingNavBar:v11];
  [v19 updateWithNewContact:v14];
LABEL_6:

  return v19;
}

+ (id)contactHeaderViewWithContact:(id)a3 shouldAllowTakePhotoAction:(BOOL)a4 monogramOnly:(BOOL)a5 isOutOfProcess:(BOOL)a6 delegate:(id)a7
{
  return (id)[a1 contactHeaderViewWithContact:a3 shouldAllowTakePhotoAction:a4 showingNavBar:0 monogramOnly:a5 isOutOfProcess:a6 delegate:a7];
}

@end