@interface CNMeCardSharingEditAvatarFlowManager
+ (id)log;
- (CNAvatarEditingManager)avatarEditingManager;
- (CNMeCardSharingEditAvatarFlowManager)init;
- (CNMeCardSharingEditAvatarFlowManagerDelegate)delegate;
- (CNPhotoPickerVariantsManager)variantsManager;
- (CNVisualIdentityImagePickerController)imagePickerController;
- (UINavigationController)baseNavigationController;
- (id)editorViewControllerForProviderItem:(id)a3;
- (int64_t)defaultModalPresentationStyle;
- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4;
- (void)imagePickerController:(id)a3 didFinishWithProviderItem:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)presentAvatarEditorViewControllerForProviderItem:(id)a3;
- (void)presentEditorForAvatarSourceType:(int64_t)a3 visualIdentity:(id)a4 fromGalleryViewController:(id)a5;
- (void)presentMemojiPicker;
- (void)pushAvatarEditorViewControllerForProviderItem:(id)a3 fromViewController:(id)a4;
- (void)setAvatarEditingManager:(id)a3;
- (void)setBaseNavigationController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImagePickerController:(id)a3;
- (void)setVariantsManager:(id)a3;
- (void)visualIdentityEditorController:(id)a3 didFinishWithProviderItem:(id)a4;
- (void)visualIdentityEditorControllerDidCancel:(id)a3;
@end

@implementation CNMeCardSharingEditAvatarFlowManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarEditingManager, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_imagePickerController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_baseNavigationController, 0);
}

- (void)setAvatarEditingManager:(id)a3
{
}

- (CNAvatarEditingManager)avatarEditingManager
{
  return self->_avatarEditingManager;
}

- (void)setVariantsManager:(id)a3
{
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setImagePickerController:(id)a3
{
}

- (CNVisualIdentityImagePickerController)imagePickerController
{
  return self->_imagePickerController;
}

- (void)setDelegate:(id)a3
{
}

- (CNMeCardSharingEditAvatarFlowManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNMeCardSharingEditAvatarFlowManagerDelegate *)WeakRetained;
}

- (void)setBaseNavigationController:(id)a3
{
}

- (UINavigationController)baseNavigationController
{
  return self->_baseNavigationController;
}

- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 viewController];
  v9 = [v8 presentedViewController];

  v10 = [v6 viewController];
  v11 = v10;
  if (v9)
  {
    v12 = [v10 presentedViewController];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __87__CNMeCardSharingEditAvatarFlowManager_avatarEditingManager_didFinishWithProviderItem___block_invoke;
    v18[3] = &unk_1E549B800;
    v13 = (id *)v19;
    v19[0] = v7;
    v19[1] = self;
    id v20 = v6;
    id v14 = v7;
    [v12 dismissViewControllerAnimated:1 completion:v18];

    v11 = v20;
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __87__CNMeCardSharingEditAvatarFlowManager_avatarEditingManager_didFinishWithProviderItem___block_invoke_2;
    v16[3] = &unk_1E549BF80;
    v13 = (id *)v17;
    v17[0] = v7;
    v17[1] = self;
    id v15 = v7;
    [v11 dismissViewControllerAnimated:1 completion:v16];
  }
}

void __87__CNMeCardSharingEditAvatarFlowManager_avatarEditingManager_didFinishWithProviderItem___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = *(void **)(a1 + 40);
    id v3 = [*(id *)(a1 + 48) viewController];
    [v2 pushAvatarEditorViewControllerForProviderItem:v1 fromViewController:v3];
  }
}

uint64_t __87__CNMeCardSharingEditAvatarFlowManager_avatarEditingManager_didFinishWithProviderItem___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 40), "presentAvatarEditorViewControllerForProviderItem:");
  }
  return result;
}

- (void)visualIdentityEditorController:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNMeCardSharingEditAvatarFlowManager *)self delegate];
  [v8 sharingEditAvatarFlowManager:self didFinishWithProviderItem:v6 fromViewController:v7];
}

- (void)visualIdentityEditorControllerDidCancel:(id)a3
{
  v5 = [(CNMeCardSharingEditAvatarFlowManager *)self baseNavigationController];
  [v5 dismissViewControllerAnimated:a3 != 0 completion:0];

  id v6 = [(CNMeCardSharingEditAvatarFlowManager *)self delegate];
  [v6 sharingEditAvatarFlowManagerDidCancel:self];
}

- (void)imagePickerControllerDidCancel:(id)a3
{
}

- (void)imagePickerController:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 presentingViewController];
  v9 = [(CNMeCardSharingEditAvatarFlowManager *)self baseNavigationController];

  if (v8 == v9)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__CNMeCardSharingEditAvatarFlowManager_imagePickerController_didFinishWithProviderItem___block_invoke_2;
    v14[3] = &unk_1E549BF80;
    v11 = &v15;
    v14[4] = self;
    id v15 = v7;
    id v13 = v7;
    [v6 dismissViewControllerAnimated:1 completion:v14];
  }
  else
  {
    v10 = [(CNMeCardSharingEditAvatarFlowManager *)self baseNavigationController];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__CNMeCardSharingEditAvatarFlowManager_imagePickerController_didFinishWithProviderItem___block_invoke;
    v16[3] = &unk_1E549BF80;
    v11 = &v17;
    void v16[4] = self;
    id v17 = v7;
    id v12 = v7;
    [v10 dismissViewControllerAnimated:1 completion:v16];
  }
}

uint64_t __88__CNMeCardSharingEditAvatarFlowManager_imagePickerController_didFinishWithProviderItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentAvatarEditorViewControllerForProviderItem:*(void *)(a1 + 40)];
}

uint64_t __88__CNMeCardSharingEditAvatarFlowManager_imagePickerController_didFinishWithProviderItem___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentAvatarEditorViewControllerForProviderItem:*(void *)(a1 + 40)];
}

- (void)presentMemojiPicker
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  id v3 = (void *)getAVTAvatarStoreClass_softClass_37450;
  uint64_t v28 = getAVTAvatarStoreClass_softClass_37450;
  if (!getAVTAvatarStoreClass_softClass_37450)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v30 = __getAVTAvatarStoreClass_block_invoke_37451;
    v31 = &unk_1E549AD00;
    v32 = &v25;
    __getAVTAvatarStoreClass_block_invoke_37451((uint64_t)&buf);
    id v3 = (void *)v26[3];
  }
  v4 = v3;
  _Block_object_dispose(&v25, 8);
  id v5 = objc_alloc_init(v4);
  id v6 = [getAVTAvatarFetchRequestClass_37452() requestForStorePrimaryAvatar];
  id v24 = 0;
  id v7 = [v5 avatarsForFetchRequest:v6 error:&v24];
  id v8 = v24;
  v9 = [v7 firstObject];

  if (v9)
  {
    id v10 = v8;
    v11 = v6;
LABEL_6:
    id v13 = +[CNPhotoPickerAnimojiProvider providerItemForAvatarRecord:v9];
    id v14 = [CNAvatarEditingManager alloc];
    id v15 = [v13 avatarRecord];
    v16 = [(CNMeCardSharingEditAvatarFlowManager *)self variantsManager];
    id v17 = [(CNAvatarEditingManager *)v14 initWithAvatarRecord:v15 variantsManager:v16];

    [(CNAvatarEditingManager *)v17 setDelegate:self];
    [(CNAvatarEditingManager *)v17 setOriginalItem:v13];
    [(CNMeCardSharingEditAvatarFlowManager *)self setAvatarEditingManager:v17];
    id v18 = objc_alloc(MEMORY[0x1E4FB19E8]);
    v19 = [(CNAvatarEditingManager *)v17 viewController];
    id v20 = (void *)[v18 initWithRootViewController:v19];

    objc_msgSend(v20, "setModalPresentationStyle:", -[CNMeCardSharingEditAvatarFlowManager defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
    v21 = [(CNMeCardSharingEditAvatarFlowManager *)self baseNavigationController];
    [v21 presentViewController:v20 animated:1 completion:0];

    goto LABEL_7;
  }
  v11 = [getAVTAvatarFetchRequestClass_37452() requestForAllAvatars];

  id v23 = v8;
  id v12 = [v5 avatarsForFetchRequest:v11 error:&v23];
  id v10 = v23;

  v9 = [v12 firstObject];

  if (v9) {
    goto LABEL_6;
  }
  v9 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v22 = [v10 debugDescription];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v22;
    _os_log_error_impl(&dword_18B625000, v9, OS_LOG_TYPE_ERROR, "Could not load avatar; %{public}@",
      (uint8_t *)&buf,
      0xCu);
  }
LABEL_7:
}

- (int64_t)defaultModalPresentationStyle
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 6;
  }
  else {
    return 0;
  }
}

- (void)pushAvatarEditorViewControllerForProviderItem:(id)a3 fromViewController:(id)a4
{
  id v6 = a4;
  id v8 = [(CNMeCardSharingEditAvatarFlowManager *)self editorViewControllerForProviderItem:a3];
  [v8 setCanCancel:0];
  id v7 = [v6 navigationController];

  [v7 pushViewController:v8 animated:1];
}

- (void)presentAvatarEditorViewControllerForProviderItem:(id)a3
{
  id v6 = [(CNMeCardSharingEditAvatarFlowManager *)self editorViewControllerForProviderItem:a3];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
  objc_msgSend(v4, "setModalPresentationStyle:", -[CNMeCardSharingEditAvatarFlowManager defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
  id v5 = [(CNMeCardSharingEditAvatarFlowManager *)self baseNavigationController];
  [v5 presentViewController:v4 animated:1 completion:0];
}

- (id)editorViewControllerForProviderItem:(id)a3
{
  id v4 = a3;
  id v5 = [CNVisualIdentityItemEditorViewController alloc];
  id v6 = [(CNMeCardSharingEditAvatarFlowManager *)self variantsManager];
  id v7 = [(CNVisualIdentityItemEditorViewController *)v5 initWithProviderItem:v4 variantsManager:v6];

  id v8 = CNContactsUIBundle();
  v9 = [v8 localizedStringForKey:@"NEXT" value:&stru_1ED8AC728 table:@"Localized"];
  [(CNVisualIdentityItemEditorViewController *)v7 setDoneButtonTitle:v9];

  [(CNVisualIdentityItemEditorViewController *)v7 setDelegate:self];

  return v7;
}

- (void)presentEditorForAvatarSourceType:(int64_t)a3 visualIdentity:(id)a4 fromGalleryViewController:(id)a5
{
  id v17 = a4;
  id v8 = a5;
  v9 = [MEMORY[0x1E4F5A6D8] unifiedMeContactMonitor];
  id v10 = [v17 contacts];
  v11 = [v10 firstObject];
  uint64_t v12 = [v9 isMeContact:v11];
  id v13 = [(CNMeCardSharingEditAvatarFlowManager *)self imagePickerController];
  [v13 setIsMeContact:v12];

  switch(a3)
  {
    case 0:
      id v14 = [(CNMeCardSharingEditAvatarFlowManager *)self imagePickerController];
      [v14 presentCameraImagePickerFromViewController:v8];
      goto LABEL_4;
    case 1:
      id v14 = [(CNMeCardSharingEditAvatarFlowManager *)self imagePickerController];
      [v14 presentPhotoLibraryPickerFromViewController:v8 sourceView:0];
LABEL_4:

      break;
    case 2:
      [(CNMeCardSharingEditAvatarFlowManager *)self presentMemojiPicker];
      break;
    case 3:
      +[CNPhotoPickerMonogramProvider providerItemForVisualIdentity:size:RTL:](CNPhotoPickerMonogramProvider, "providerItemForVisualIdentity:size:RTL:", v17, 0, 212.0, 212.0);
      id v15 = (CNPhotoPickerEmojiProviderItem *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      id v15 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:]([CNPhotoPickerEmojiProviderItem alloc], "initWithStringRepresentation:backgroundColorVariant:size:", &stru_1ED8AC728, 0, 212.0, 212.0);
LABEL_8:
      v16 = v15;
      [(CNMeCardSharingEditAvatarFlowManager *)self presentAvatarEditorViewControllerForProviderItem:v15];

      break;
    default:
      break;
  }
}

- (CNMeCardSharingEditAvatarFlowManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)CNMeCardSharingEditAvatarFlowManager;
  v2 = [(CNMeCardSharingEditAvatarFlowManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [CNVisualIdentityImagePickerController alloc];
    id v4 = +[CNContactStyle defaultStyle];
    uint64_t v5 = [(CNVisualIdentityImagePickerController *)v3 initWithContactStyle:v4];
    imagePickerController = v2->_imagePickerController;
    v2->_imagePickerController = (CNVisualIdentityImagePickerController *)v5;

    [(CNVisualIdentityImagePickerController *)v2->_imagePickerController setDelegate:v2];
    id v7 = objc_alloc_init(CNPhotoPickerVariantsManager);
    variantsManager = v2->_variantsManager;
    v2->_variantsManager = v7;

    v9 = v2;
  }

  return v2;
}

+ (id)log
{
  if (log_cn_once_token_1_37501 != -1) {
    dispatch_once(&log_cn_once_token_1_37501, &__block_literal_global_37502);
  }
  v2 = (void *)log_cn_once_object_1_37503;

  return v2;
}

void __43__CNMeCardSharingEditAvatarFlowManager_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "MeCardSharingEditAvatarFlowManager");
  uint64_t v1 = (void *)log_cn_once_object_1_37503;
  log_cn_once_object_1_37503 = (uint64_t)v0;
}

@end