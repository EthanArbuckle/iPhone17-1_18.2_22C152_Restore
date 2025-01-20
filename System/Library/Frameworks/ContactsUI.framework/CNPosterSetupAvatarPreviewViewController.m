@interface CNPosterSetupAvatarPreviewViewController
+ (CGSize)defaultItemSize;
+ (double)twentyFourPointFivePercentOfHeight:(double)a3;
+ (unint64_t)defaultImageTypeForWallpaperType:(id)a3;
- (BOOL)hideSkipOption;
- (BOOL)shouldShowCancelButton;
- (CGRect)cropRect;
- (CNAvatarEditingManager)memojiEditingManager;
- (CNContact)editingContact;
- (CNContactImage)contactImage;
- (CNPhotoPickerVariantsManager)variantsManager;
- (CNPosterSetupAvatarPreviewViewController)initWithContactImage:(id)a3 imageType:(unint64_t)a4 forEditingContact:(id)a5;
- (CNPosterSetupAvatarPreviewViewController)initWithPosterConfiguration:(id)a3 forEditingContact:(id)a4;
- (CNPosterSetupAvatarPreviewViewControllerDelegate)delegate;
- (CNVisualIdentityImagePickerController)imagePicker;
- (NSData)imageData;
- (NSString)wallpaperType;
- (UIColor)imagePickerCustomBackgroundColor;
- (UIImagePickerController)memojiImagePickerController;
- (_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper)avatarPreviewView;
- (id)animojiProviderItem:(id)a3 backgroundColor:(id)a4;
- (id)animojiProviderItemForAvatarImageData:(id)a3 backgroundColor:(id)a4;
- (id)closestColor:(id)a3 inColors:(id)a4;
- (id)editorViewControllerForProviderItem:(id)a3;
- (id)memojiEditingManagerForAvatarRecord:(id)a3 poseConfiguration:(id)a4;
- (id)monogramProviderItemForInitials:(id)a3 backgroundColor:(id)a4;
- (id)photoProviderItemForFullImageFromPosterConfiguration:(id)a3;
- (id)providerItemForRandomColoredMonogram;
- (id)providerItemWithSnapshotImage:(id)a3;
- (unint64_t)imageType;
- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4;
- (void)avatarPreviewViewDidFinishWithImageData:(id)a3 cropRect:(CGRect)a4;
- (void)avatarPreviewViewDidSelectChangeScale;
- (void)avatarPreviewViewDidSelectCustomizePhoto;
- (void)didTapCancel;
- (void)imagePickerController:(id)a3 didFinishWithProviderItem:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)photoPickerProviderItemFromPosterConfiguration:(id)a3 completionBlock:(id)a4;
- (void)photoProviderItemForSnapshotFromPosterConfiguration:(id)a3 completionBlock:(id)a4;
- (void)photoProviderItemFromPosterConfiguration:(id)a3 completionBlock:(id)a4;
- (void)presentPhotoFilterEditorForProviderItem:(id)a3;
- (void)setAvatarPreviewView:(id)a3;
- (void)setContactImage:(id)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setEditingContact:(id)a3;
- (void)setHideSkipOption:(BOOL)a3;
- (void)setImageData:(id)a3;
- (void)setImagePicker:(id)a3;
- (void)setImagePickerCustomBackgroundColor:(id)a3;
- (void)setImageType:(unint64_t)a3;
- (void)setMemojiEditingManager:(id)a3;
- (void)setMemojiImagePickerController:(id)a3;
- (void)setShouldShowCancelButton:(BOOL)a3;
- (void)setVariantsManager:(id)a3;
- (void)skipStep;
- (void)updateMemojiEditingManagerForProviderItem:(id)a3;
- (void)updateWithProviderItem:(id)a3;
- (void)viewDidLoad;
- (void)visualIdentityEditorController:(id)a3 didFinishWithProviderItem:(id)a4;
- (void)visualIdentityEditorControllerDidCancel:(id)a3;
@end

@implementation CNPosterSetupAvatarPreviewViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memojiImagePickerController, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_memojiEditingManager, 0);
  objc_storeStrong((id *)&self->_contactImage, 0);
  objc_storeStrong((id *)&self->_wallpaperType, 0);
  objc_storeStrong((id *)&self->_editingContact, 0);
  objc_storeStrong((id *)&self->_imagePickerCustomBackgroundColor, 0);
  objc_storeStrong((id *)&self->_imagePicker, 0);
  objc_storeStrong((id *)&self->_avatarPreviewView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_imageData, 0);
}

- (void)setMemojiImagePickerController:(id)a3
{
}

- (UIImagePickerController)memojiImagePickerController
{
  return self->_memojiImagePickerController;
}

- (void)setVariantsManager:(id)a3
{
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setMemojiEditingManager:(id)a3
{
}

- (CNAvatarEditingManager)memojiEditingManager
{
  return self->_memojiEditingManager;
}

- (void)setContactImage:(id)a3
{
}

- (CNContactImage)contactImage
{
  return self->_contactImage;
}

- (unint64_t)imageType
{
  return self->_imageType;
}

- (NSString)wallpaperType
{
  return self->_wallpaperType;
}

- (void)setEditingContact:(id)a3
{
}

- (CNContact)editingContact
{
  return self->_editingContact;
}

- (void)setImagePickerCustomBackgroundColor:(id)a3
{
}

- (UIColor)imagePickerCustomBackgroundColor
{
  return self->_imagePickerCustomBackgroundColor;
}

- (void)setImagePicker:(id)a3
{
}

- (CNVisualIdentityImagePickerController)imagePicker
{
  return self->_imagePicker;
}

- (void)setAvatarPreviewView:(id)a3
{
}

- (_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper)avatarPreviewView
{
  return self->_avatarPreviewView;
}

- (void)setShouldShowCancelButton:(BOOL)a3
{
  self->_shouldShowCancelButton = a3;
}

- (BOOL)shouldShowCancelButton
{
  return self->_shouldShowCancelButton;
}

- (void)setHideSkipOption:(BOOL)a3
{
  self->_hideSkipOption = a3;
}

- (BOOL)hideSkipOption
{
  return self->_hideSkipOption;
}

- (void)setDelegate:(id)a3
{
}

- (CNPosterSetupAvatarPreviewViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPosterSetupAvatarPreviewViewControllerDelegate *)WeakRetained;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v5 = a4;
  [(CNPosterSetupAvatarPreviewViewController *)self updateWithProviderItem:v5];
  v6 = [(CNPosterSetupAvatarPreviewViewController *)self memojiImagePickerController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__CNPosterSetupAvatarPreviewViewController_avatarEditingManager_didFinishWithProviderItem___block_invoke;
  v8[3] = &unk_1E549BF80;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 dismissViewControllerAnimated:1 completion:v8];
}

uint64_t __91__CNPosterSetupAvatarPreviewViewController_avatarEditingManager_didFinishWithProviderItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentPhotoFilterEditorForProviderItem:*(void *)(a1 + 40)];
}

- (void)visualIdentityEditorController:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6 = a3;
  [(CNPosterSetupAvatarPreviewViewController *)self updateWithProviderItem:a4];
  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)visualIdentityEditorControllerDidCancel:(id)a3
{
}

- (void)imagePickerControllerDidCancel:(id)a3
{
}

- (void)imagePickerController:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CNPosterSetupAvatarPreviewViewController *)self updateWithProviderItem:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__CNPosterSetupAvatarPreviewViewController_imagePickerController_didFinishWithProviderItem___block_invoke;
  v9[3] = &unk_1E549BF80;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 dismissViewControllerAnimated:1 completion:v9];
}

uint64_t __92__CNPosterSetupAvatarPreviewViewController_imagePickerController_didFinishWithProviderItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentPhotoFilterEditorForProviderItem:*(void *)(a1 + 40)];
}

- (id)editorViewControllerForProviderItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CNPhotoPickerVariantsManager);
  id v6 = [[CNVisualIdentityItemEditorViewController alloc] initWithProviderItem:v4 variantsManager:v5];

  id v7 = CNContactsUIBundle();
  id v8 = [v7 localizedStringForKey:@"DONE" value:&stru_1ED8AC728 table:@"Localized"];
  [(CNVisualIdentityItemEditorViewController *)v6 setDoneButtonTitle:v8];

  [(CNVisualIdentityItemEditorViewController *)v6 setDelegate:self];

  return v6;
}

- (void)presentPhotoFilterEditorForProviderItem:(id)a3
{
  id v5 = [(CNPosterSetupAvatarPreviewViewController *)self editorViewControllerForProviderItem:a3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  [(CNPosterSetupAvatarPreviewViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)avatarPreviewViewDidSelectCustomizePhoto
{
  id v3 = [(CNPosterSetupAvatarPreviewViewController *)self delegate];
  [v3 avatarPreviewViewControllerDidSelectCustomizePhoto:self];
}

- (void)avatarPreviewViewDidSelectChangeScale
{
  v20 = objc_alloc_init(CNVisualIdentityImagePickerController);
  id v3 = [(CNPosterSetupAvatarPreviewViewController *)self contactImage];
  uint64_t v4 = [v3 source];

  if (v4 == 3)
  {
    id v5 = [(CNPosterSetupAvatarPreviewViewController *)self memojiEditingManager];
    id v6 = [(CNPosterSetupAvatarPreviewViewController *)self memojiEditingManager];
    id v7 = [v6 originalItem];
    id v8 = [v5 imagePickerForItem:v7];

    [(CNVisualIdentityImagePickerController *)v20 presentImagePicker:v8 withStyle:6 fromViewController:self];
    [(CNPosterSetupAvatarPreviewViewController *)self setMemojiImagePickerController:v8];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F5A6D8] unifiedMeContactMonitor];
    id v10 = [(CNPosterSetupAvatarPreviewViewController *)self editingContact];
    -[CNVisualIdentityImagePickerController setIsMeContact:](v20, "setIsMeContact:", [v9 isMeContact:v10]);

    id v8 = [(CNPosterSetupAvatarPreviewViewController *)self imageData];
    [(CNPosterSetupAvatarPreviewViewController *)self cropRect];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = [(CNPosterSetupAvatarPreviewViewController *)self imagePickerCustomBackgroundColor];
    -[CNVisualIdentityImagePickerController presentMoveAndScaleForImageData:withCropRect:fromViewController:backgroundColor:](v20, "presentMoveAndScaleForImageData:withCropRect:fromViewController:backgroundColor:", v8, self, v19, v12, v14, v16, v18);
  }
  [(CNVisualIdentityImagePickerController *)v20 setDelegate:self];
  [(CNPosterSetupAvatarPreviewViewController *)self setImagePicker:v20];
}

- (void)avatarPreviewViewDidFinishWithImageData:(id)a3 cropRect:(CGRect)a4
{
  id v6 = [(CNPosterSetupAvatarPreviewViewController *)self delegate];
  id v5 = [(CNPosterSetupAvatarPreviewViewController *)self contactImage];
  [v6 avatarPreviewViewController:self didFinishWithContactImage:v5];
}

- (id)closestColor:(id)a3 inColors:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v27 = 0;
  double v28 = 0.0;
  uint64_t v26 = 0;
  [v5 getHue:&v28 saturation:&v27 brightness:&v26 alpha:0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v23;
    double v12 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        double v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v20 = 0;
        double v21 = 0.0;
        uint64_t v19 = 0;
        double v15 = [v14 color];
        [v15 getHue:&v21 saturation:&v20 brightness:&v19 alpha:0];

        double v16 = vabdd_f64(v28, v21);
        if (v16 < v12)
        {
          id v17 = v14;

          double v12 = v16;
          id v10 = v17;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v29 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)monogramProviderItemForInitials:(id)a3 backgroundColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(CNVisualIdentity);
  [(CNVisualIdentity *)v8 setAbbreviatedName:v7];

  uint64_t v9 = [MEMORY[0x1E4F89D48] availableColors];
  id v10 = objc_msgSend(v9, "_cn_map:", &__block_literal_global_36177);

  uint64_t v11 = [(CNPosterSetupAvatarPreviewViewController *)self closestColor:v6 inColors:v10];

  BOOL v12 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1;
  [(id)objc_opt_class() defaultItemSize];
  double v14 = v13;
  double v16 = v15;
  id v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v17 scale];
  double v19 = v18;
  id v20 = objc_alloc(MEMORY[0x1E4F89D48]);
  double v21 = [v11 colorName];
  long long v22 = (void *)[v20 initWithColorName:v21];
  long long v23 = +[CNPhotoPickerMonogramProvider providerItemForVisualIdentity:size:scale:RTL:backgroundColor:](CNPhotoPickerMonogramProvider, "providerItemForVisualIdentity:size:scale:RTL:backgroundColor:", v8, v12, v22, v14, v16, v19);

  return v23;
}

CNPhotoPickerColorVariant *__92__CNPosterSetupAvatarPreviewViewController_monogramProviderItemForInitials_backgroundColor___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [CNPhotoPickerColorVariant alloc];
  uint64_t v4 = [v2 color];
  id v5 = [v2 colorName];

  id v6 = [(CNPhotoPickerColorVariant *)v3 initWithColor:v4 named:v5];

  return v6;
}

- (id)providerItemForRandomColoredMonogram
{
  id v3 = [CNVisualIdentity alloc];
  uint64_t v4 = [(CNPosterSetupAvatarPreviewViewController *)self editingContact];
  id v5 = [(CNVisualIdentity *)v3 initWithContact:v4];

  BOOL v6 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1;
  [(id)objc_opt_class() defaultItemSize];
  id v7 = +[CNPhotoPickerMonogramProvider providerItemWithRandomBackgroundColorForVisualIdentity:size:RTL:](CNPhotoPickerMonogramProvider, "providerItemWithRandomBackgroundColorForVisualIdentity:size:RTL:", v5, v6);

  return v7;
}

- (id)animojiProviderItemForAvatarImageData:(id)a3 backgroundColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(CNPhotoPickerVariantsManager);
  uint64_t v9 = [(CNPhotoPickerVariantsManager *)v8 avatarBackgrounds];
  id v10 = [(CNPosterSetupAvatarPreviewViewController *)self closestColor:v7 inColors:v9];

  uint64_t v11 = [v10 color];
  BOOL v12 = +[CNPhotoPickerVariantsManager nonAlphaColorForBackgroundColor:v11];
  [(CNPosterSetupAvatarPreviewViewController *)self setImagePickerCustomBackgroundColor:v12];

  double v13 = [MEMORY[0x1E4FB1818] imageWithData:v6];
  uint64_t v27 = 0;
  double v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__36184;
  v31 = __Block_byref_object_dispose__36185;
  id v32 = 0;
  uint64_t v21 = 0;
  long long v22 = (double *)&v21;
  uint64_t v23 = 0x4010000000;
  long long v24 = &unk_18BA11DF2;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v25 = *MEMORY[0x1E4F1DB28];
  long long v26 = v14;
  double v15 = [(CNPosterSetupAvatarPreviewViewController *)self memojiEditingManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __98__CNPosterSetupAvatarPreviewViewController_animojiProviderItemForAvatarImageData_backgroundColor___block_invoke;
  v20[3] = &unk_1E5499468;
  v20[4] = &v27;
  v20[5] = &v21;
  [v15 prepareAvatarImageForPicker:v13 synchronousCompletion:v20];

  double v16 = [CNPhotoPickerAnimojiProviderItem alloc];
  id v17 = UIImagePNGRepresentation((UIImage *)v28[5]);
  double v18 = -[CNPhotoPickerAnimojiProviderItem initWithOriginalImageData:cropRect:backgroundColorVariant:](v16, "initWithOriginalImageData:cropRect:backgroundColorVariant:", v17, v10, v22[4], v22[5], v22[6], v22[7]);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v18;
}

void __98__CNPosterSetupAvatarPreviewViewController_animojiProviderItemForAvatarImageData_backgroundColor___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v12 = a2;
  double v13 = *(double **)(*(void *)(a1 + 40) + 8);
  v13[4] = a3;
  v13[5] = a4;
  v13[6] = a5;
  v13[7] = a6;
}

- (id)animojiProviderItem:(id)a3 backgroundColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  uint64_t v8 = [v7 imageData];
  uint64_t v9 = [(CNPosterSetupAvatarPreviewViewController *)self animojiProviderItemForAvatarImageData:v8 backgroundColor:v6];

  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  id v12 = [v7 poseConfiguration];
  [v11 setPoseConfiguration:v12];

  double v13 = [v7 avatarRecord];

  [v11 setAvatarRecord:v13];

  return v11;
}

- (id)providerItemWithSnapshotImage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (CGImage *)objc_msgSend(v3, "cnui_CGImageSnapshot");
  id v5 = (__CFData *)objc_opt_new();
  id v6 = CGImageDestinationCreateWithData(v5, @"public.png", 1uLL, 0);
  CGImageDestinationAddImage(v6, v4, 0);
  CGImageDestinationFinalize(v6);
  if (v6) {
    CFRelease(v6);
  }
  id v7 = (void *)MEMORY[0x1E4F5A420];
  [v3 size];
  double v9 = v8;
  [v3 size];
  objc_msgSend(v7, "centeredSquareCropRectInRect:", 0.0, 0.0, v9, v10);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  id v17 = objc_opt_class();
  [v3 size];
  double v19 = v18;

  [v17 twentyFourPointFivePercentOfHeight:v19];
  uint64_t v21 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:]([CNPhotoPickerProviderItem alloc], "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v5, 0, 0, v12, v20, v14, v16);

  return v21;
}

- (void)photoProviderItemForSnapshotFromPosterConfiguration:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = +[CNPRUISIncomingCallPosterContext emptyContext];
  double v9 = +[CNPRUISIncomingCallSnapshotDefinition contentsOnlySnapshotDefinitionWithContext:v8 attachmentIdentifiers:0];

  double v10 = +[CNPRUISPosterSnapshotRequest requestForConfiguration:v7 definition:v9 interfaceOrientation:1];

  double v11 = objc_alloc_init(CNPRUISPosterSnapshotController);
  id v26 = 0;
  double v12 = [(CNPRUISPosterSnapshotController *)v11 latestSnapshotBundleForRequest:v10 error:&v26];
  id v13 = v26;
  if (!v12) {
    goto LABEL_4;
  }
  double v14 = [v9 levelSets];
  double v15 = [v14 firstObject];
  double v16 = [v12 snapshotForLevelSet:v15];

  if (v16)
  {
    id v17 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke;
    v23[3] = &unk_1E549AFF8;
    v23[4] = self;
    id v18 = v16;
    id v24 = v18;
    id v25 = v6;
    [v17 performBlock:v23];
  }
  else
  {
LABEL_4:
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_2;
    v19[3] = &unk_1E5499440;
    id v22 = v6;
    id v20 = v9;
    uint64_t v21 = self;
    [(CNPRUISPosterSnapshotController *)v11 executeSnapshotRequest:v10 completion:v19];

    id v18 = 0;
  }
}

void __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) providerItemWithSnapshotImage:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    id v7 = [a3 snapshotBundle];
    double v8 = [*(id *)(a1 + 32) levelSets];
    double v9 = [v8 firstObject];
    double v10 = [v7 snapshotForLevelSet:v9];

    if (v10)
    {
      double v11 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_2_39;
      v18[3] = &unk_1E549AFF8;
      v18[4] = *(void *)(a1 + 40);
      id v12 = v10;
      id v19 = v12;
      id v20 = *(id *)(a1 + 48);
      [v11 performBlock:v18];
    }
    else
    {
      double v15 = CNUILogPosters();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18B625000, v15, OS_LOG_TYPE_ERROR, "Snapshot of poster returned nil", buf, 2u);
      }

      double v16 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_38;
      v21[3] = &unk_1E549B8A0;
      id v22 = *(id *)(a1 + 48);
      [v16 performBlock:v21];

      id v12 = 0;
    }
  }
  else
  {
    id v13 = CNUILogPosters();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v26 = v17;
      _os_log_error_impl(&dword_18B625000, v13, OS_LOG_TYPE_ERROR, "Failed to snapshot poster with error: %@", buf, 0xCu);
    }
    double v14 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_37;
    v23[3] = &unk_1E549B8A0;
    id v24 = *(id *)(a1 + 48);
    [v14 performBlock:v23];

    id v12 = v24;
  }
}

uint64_t __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_2_39(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) providerItemWithSnapshotImage:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)photoProviderItemFromPosterConfiguration:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  double v8 = [(CNPosterSetupAvatarPreviewViewController *)self photoProviderItemForFullImageFromPosterConfiguration:v6];
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    double v9 = CNUILogPosters();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEFAULT, "Unable to get original image data for Photos poster, falling back to poster snapshot", v10, 2u);
    }

    [(CNPosterSetupAvatarPreviewViewController *)self photoProviderItemForSnapshotFromPosterConfiguration:v6 completionBlock:v7];
  }
}

- (id)photoProviderItemForFullImageFromPosterConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[CNPhotosPosterConfigurationReader alloc] initWithPosterConfiguration:v3];

  id v5 = [(CNPhotosPosterConfigurationReader *)v4 fullExtentPreviewImageData];
  [(CNPhotosPosterConfigurationReader *)v4 fullExtentPreviewImageSize];
  double v7 = v6;
  double v9 = v8;
  [(CNPhotosPosterConfigurationReader *)v4 fullExtentPreviewImageFaceRect];
  double x = v21.origin.x;
  double y = v21.origin.y;
  double width = v21.size.width;
  double height = v21.size.height;
  if (CGRectEqualToRect(v21, *MEMORY[0x1E4F1DB28]))
  {
    objc_msgSend(MEMORY[0x1E4F5A420], "centeredSquareCropRectInRect:", 0.0, 0.0, v7, v9);
    double x = v14;
    double y = v15;
    double width = v16;
    double height = v17;
  }
  id v18 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:]([CNPhotoPickerProviderItem alloc], "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v5, 0, 0, x, y, width, height);

  return v18;
}

- (void)photoPickerProviderItemFromPosterConfiguration:(id)a3 completionBlock:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void (**)(id, void *))a4;
  [(CNPosterSetupAvatarPreviewViewController *)self setImagePickerCustomBackgroundColor:0];
  id v43 = 0;
  double v8 = [v6 loadUserInfoWithError:&v43];
  id v9 = v43;
  int v10 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A270] + 16))();
  if (v10)
  {
    double v11 = CNUILogPosters();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_error_impl(&dword_18B625000, v11, OS_LOG_TYPE_ERROR, "Error loading user info for configuration: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  id v12 = [MEMORY[0x1E4F1BAE0] wallpaperTypeFromConfiguration:v6];
  if (((v10 | [v12 isEqualToString:*MEMORY[0x1E4F1B880]] ^ 1) & 1) != 0
    || !+[CNMonogramPosterConfigurationReader canReadConfiguration])
  {
    if (((v10 | [v12 isEqualToString:*MEMORY[0x1E4F1B878]] ^ 1) & 1) != 0
      || !+[CNMemojiPosterConfigurationReader canReadConfiguration])
    {
      if ([v12 isEqualToString:*MEMORY[0x1E4F1B888]])
      {
        [(CNPosterSetupAvatarPreviewViewController *)self photoProviderItemFromPosterConfiguration:v6 completionBlock:v7];
      }
      else
      {
        uint64_t v23 = [(CNPosterSetupAvatarPreviewViewController *)self providerItemForRandomColoredMonogram];
        v7[2](v7, v23);
      }
    }
    else
    {
      v42 = [[_TtC10ContactsUI33CNMemojiPosterConfigurationReader alloc] initWithPosterConfigurationUserInfo:v8];
      double v17 = [(CNMemojiPosterConfigurationReader *)v42 avatarRecordData];
      uint64_t v18 = *MEMORY[0x1E4F5A268];
      char v19 = (*(uint64_t (**)(void, void *))(*MEMORY[0x1E4F5A268] + 16))(*MEMORY[0x1E4F5A268], v17);

      if (v19)
      {
        id v20 = [(CNMemojiPosterConfigurationReader *)v42 avatarImageData];
        char v21 = (*(uint64_t (**)(uint64_t, void *))(v18 + 16))(v18, v20);

        if (v21)
        {
          id v22 = [(CNPosterSetupAvatarPreviewViewController *)self providerItemForRandomColoredMonogram];
        }
        else
        {
          v37 = [(CNPosterSetupAvatarPreviewViewController *)self memojiEditingManagerForAvatarRecord:0 poseConfiguration:0];
          memojiEditingManager = self->_memojiEditingManager;
          self->_memojiEditingManager = v37;

          v39 = [(CNMemojiPosterConfigurationReader *)v42 avatarImageData];
          v40 = [(CNMemojiPosterConfigurationReader *)v42 backgroundColor];
          id v22 = [(CNPosterSetupAvatarPreviewViewController *)self animojiProviderItemForAvatarImageData:v39 backgroundColor:v40];
        }
      }
      else
      {
        uint64_t v44 = 0;
        v45 = &v44;
        uint64_t v46 = 0x2050000000;
        id v24 = (void *)getAVTAvatarRecordSerializerClass_softClass;
        uint64_t v47 = getAVTAvatarRecordSerializerClass_softClass;
        if (!getAVTAvatarRecordSerializerClass_softClass)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          v49 = __getAVTAvatarRecordSerializerClass_block_invoke;
          v50 = &unk_1E549AD00;
          v51 = &v44;
          __getAVTAvatarRecordSerializerClass_block_invoke((uint64_t)&buf);
          id v24 = (void *)v45[3];
        }
        id v25 = v24;
        _Block_object_dispose(&v44, 8);
        id v26 = [(CNMemojiPosterConfigurationReader *)v42 avatarRecordData];
        uint64_t v27 = [v25 avatarRecordFromData:v26];

        double v28 = (void *)MEMORY[0x1E4F1BA30];
        uint64_t v29 = [(CNMemojiPosterConfigurationReader *)v42 avatarPoseData];
        v41 = [v28 poseConfigurationForData:v29 withAvatarRecord:v27];

        uint64_t v30 = [(CNPosterSetupAvatarPreviewViewController *)self memojiEditingManagerForAvatarRecord:v27 poseConfiguration:v41];
        v31 = self->_memojiEditingManager;
        self->_memojiEditingManager = v30;

        id v32 = [(CNPosterSetupAvatarPreviewViewController *)self memojiEditingManager];
        v33 = [v32 originalItem];

        [v33 setPoseConfiguration:v41];
        id v34 = (id)[v33 generateImageDataIfNeeded];
        v35 = [(CNMemojiPosterConfigurationReader *)v42 backgroundColor];
        id v22 = [(CNPosterSetupAvatarPreviewViewController *)self animojiProviderItem:v33 backgroundColor:v35];

        v36 = [(CNPosterSetupAvatarPreviewViewController *)self memojiEditingManager];
        [v36 setOriginalItem:v22];
      }
      v7[2](v7, v22);
    }
  }
  else
  {
    id v13 = [[_TtC10ContactsUI35CNMonogramPosterConfigurationReader alloc] initWithPosterConfigurationUserInfo:v8];
    double v14 = [(CNMonogramPosterConfigurationReader *)v13 initials];
    double v15 = [(CNMonogramPosterConfigurationReader *)v13 backgroundColor];
    double v16 = [(CNPosterSetupAvatarPreviewViewController *)self monogramProviderItemForInitials:v14 backgroundColor:v15];

    v7[2](v7, v16);
  }
}

- (void)didTapCancel
{
  [(CNPosterSetupAvatarPreviewViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v3 = [(CNPosterSetupAvatarPreviewViewController *)self delegate];
  [v3 avatarPreviewViewControllerDidCancel:self];
}

- (void)skipStep
{
  id v3 = [(CNPosterSetupAvatarPreviewViewController *)self delegate];
  [v3 avatarPreviewViewControllerDidSelectCustomizeLater:self];
}

- (void)viewDidLoad
{
  v51[4] = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)CNPosterSetupAvatarPreviewViewController;
  [(CNPosterSetupAvatarPreviewViewController *)&v50 viewDidLoad];
  id v3 = CNContactsUIBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"SNAP_POSTER_AVATAR_PREVIEW_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  [(CNPosterSetupAvatarPreviewViewController *)self setTitle:v4];

  id v5 = [(CNPosterSetupAvatarPreviewViewController *)self navigationController];
  id v6 = [v5 viewControllers];
  double v7 = [v6 firstObject];
  if (v7 == self)
  {
    double v11 = self;
  }
  else
  {
    double v8 = v7;
    BOOL v9 = [(CNPosterSetupAvatarPreviewViewController *)self hideSkipOption];

    if (v9) {
      goto LABEL_6;
    }
    id v10 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v5 = CNContactsUIBundle();
    id v6 = [v5 localizedStringForKey:@"SNAP_POSTER_PREVIEW_SKIP" value:&stru_1ED8AC728 table:@"Localized"];
    double v11 = (CNPosterSetupAvatarPreviewViewController *)[v10 initWithTitle:v6 style:0 target:self action:sel_skipStep];
    id v12 = [(CNPosterSetupAvatarPreviewViewController *)self navigationItem];
    [v12 setRightBarButtonItem:v11];
  }
LABEL_6:
  if ([(CNPosterSetupAvatarPreviewViewController *)self shouldShowCancelButton])
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_didTapCancel];
    double v14 = [(CNPosterSetupAvatarPreviewViewController *)self navigationItem];
    [v14 setLeftBarButtonItem:v13];
  }
  double v15 = [(CNPosterSetupAvatarPreviewViewController *)self imageData];
  double v16 = [(CNPosterSetupAvatarPreviewViewController *)self contactImage];
  double v17 = [v16 variant];
  v49 = +[CNPhotoPickerProviderItem generateImageDataWithData:v15 filterName:v17];

  uint64_t v18 = [_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper alloc];
  [(CNPosterSetupAvatarPreviewViewController *)self cropRect];
  uint64_t v23 = -[CNPosterSetupAvatarPreviewViewWrapper initWithImageData:cropRect:imageType:delegate:](v18, "initWithImageData:cropRect:imageType:delegate:", v49, [(CNPosterSetupAvatarPreviewViewController *)self imageType], self, v19, v20, v21, v22);
  id v24 = [(CNPosterSetupAvatarPreviewViewWrapper *)v23 hostingController];
  id v25 = [v24 view];

  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNPosterSetupAvatarPreviewViewController *)self setAvatarPreviewView:v23];
  id v26 = [(CNPosterSetupAvatarPreviewViewWrapper *)v23 hostingController];
  [v26 willMoveToParentViewController:self];

  v48 = v23;
  uint64_t v27 = [(CNPosterSetupAvatarPreviewViewWrapper *)v23 hostingController];
  [(CNPosterSetupAvatarPreviewViewController *)self addChildViewController:v27];

  double v28 = [(CNPosterSetupAvatarPreviewViewController *)self view];
  [v28 addSubview:v25];

  uint64_t v29 = [(CNPosterSetupAvatarPreviewViewWrapper *)v23 hostingController];
  [v29 didMoveToParentViewController:self];

  v40 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v46 = [v25 leadingAnchor];
  uint64_t v47 = [(CNPosterSetupAvatarPreviewViewController *)self view];
  v45 = [v47 leadingAnchor];
  uint64_t v44 = [v46 constraintEqualToAnchor:v45];
  v51[0] = v44;
  v42 = [v25 trailingAnchor];
  id v43 = [(CNPosterSetupAvatarPreviewViewController *)self view];
  v41 = [v43 trailingAnchor];
  v39 = [v42 constraintEqualToAnchor:v41];
  v51[1] = v39;
  uint64_t v30 = [v25 topAnchor];
  v31 = [(CNPosterSetupAvatarPreviewViewController *)self view];
  id v32 = [v31 topAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  v51[2] = v33;
  id v34 = [v25 bottomAnchor];
  v35 = [(CNPosterSetupAvatarPreviewViewController *)self view];
  v36 = [v35 bottomAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  v51[3] = v37;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:4];
  [v40 activateConstraints:v38];
}

- (void)updateWithProviderItem:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 imageData];
  [(CNPosterSetupAvatarPreviewViewController *)self setImageData:v4];

  [v6 cropRect];
  -[CNPosterSetupAvatarPreviewViewController setCropRect:](self, "setCropRect:");
  -[CNPosterSetupAvatarPreviewViewController setImageType:](self, "setImageType:", [v6 imageType]);
  id v5 = [v6 contactImageForMetadataStore];
  [(CNPosterSetupAvatarPreviewViewController *)self setContactImage:v5];

  [(CNPosterSetupAvatarPreviewViewController *)self updateMemojiEditingManagerForProviderItem:v6];
}

- (id)memojiEditingManagerForAvatarRecord:(id)a3 poseConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(CNPosterSetupAvatarPreviewViewController *)self variantsManager];

  if (!v8)
  {
    BOOL v9 = objc_alloc_init(CNPhotoPickerVariantsManager);
    variantsManager = self->_variantsManager;
    self->_variantsManager = v9;
  }
  double v11 = [[CNAvatarEditingManager alloc] initWithAvatarRecord:v7 poseConfiguration:v6 variantsManager:self->_variantsManager];

  [(CNAvatarEditingManager *)v11 setDelegate:self];

  return v11;
}

- (void)updateMemojiEditingManagerForProviderItem:(id)a3
{
  id v11 = a3;
  if ([(CNPosterSetupAvatarPreviewViewController *)self imageType] == 3)
  {
    objc_opt_class();
    id v4 = v11;
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    if (v6)
    {
      id v7 = [v6 avatarRecord];
      double v8 = [v6 poseConfiguration];
      BOOL v9 = [(CNPosterSetupAvatarPreviewViewController *)self memojiEditingManagerForAvatarRecord:v7 poseConfiguration:v8];

      [(CNAvatarEditingManager *)v9 setOriginalItem:v6];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  memojiEditingManager = self->_memojiEditingManager;
  self->_memojiEditingManager = v9;
}

- (void)setImageType:(unint64_t)a3
{
  self->_imageType = a3;
  id v4 = [(CNPosterSetupAvatarPreviewViewController *)self avatarPreviewView];
  [v4 setImageType:a3];
}

- (void)setCropRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_cropRect = a3;
  id v7 = [(CNPosterSetupAvatarPreviewViewController *)self avatarPreviewView];
  objc_msgSend(v7, "setCropRect:", x, y, width, height);
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
  id v5 = a3;
  id v6 = [(CNPosterSetupAvatarPreviewViewController *)self avatarPreviewView];
  [v6 setImageData:v5];
}

- (CNPosterSetupAvatarPreviewViewController)initWithContactImage:(id)a3 imageType:(unint64_t)a4 forEditingContact:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CNPosterSetupAvatarPreviewViewController;
  id v11 = [(CNPosterSetupAvatarPreviewViewController *)&v21 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_editingContact, a5);
    objc_storeStrong((id *)&v12->_contactImage, a3);
    uint64_t v13 = [v9 imageData];
    imageData = v12->_imageData;
    v12->_imageData = (NSData *)v13;

    [v9 cropRect];
    v12->_cropRect.origin.double x = v15;
    v12->_cropRect.origin.double y = v16;
    v12->_cropRect.size.double width = v17;
    v12->_cropRect.size.double height = v18;
    v12->_imageType = a4;
    double v19 = v12;
  }

  return v12;
}

- (CNPosterSetupAvatarPreviewViewController)initWithPosterConfiguration:(id)a3 forEditingContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CNPosterSetupAvatarPreviewViewController;
  double v8 = [(CNPosterSetupAvatarPreviewViewController *)&v21 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_editingContact, a4);
    uint64_t v10 = [MEMORY[0x1E4F1BAE0] wallpaperTypeFromConfiguration:v6];
    wallpaperType = v9->_wallpaperType;
    v9->_wallpaperType = (NSString *)v10;

    v9->_imageType = [(id)objc_opt_class() defaultImageTypeForWallpaperType:v9->_wallpaperType];
    objc_initWeak(&location, v9);
    id v12 = dispatch_get_global_queue(25, 0);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__CNPosterSetupAvatarPreviewViewController_initWithPosterConfiguration_forEditingContact___block_invoke;
    v16[3] = &unk_1E549BBD0;
    uint64_t v13 = v9;
    CGFloat v17 = v13;
    id v18 = v6;
    objc_copyWeak(&v19, &location);
    dispatch_async(v12, v16);

    double v14 = v13;
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }

  return v9;
}

void __90__CNPosterSetupAvatarPreviewViewController_initWithPosterConfiguration_forEditingContact___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __90__CNPosterSetupAvatarPreviewViewController_initWithPosterConfiguration_forEditingContact___block_invoke_2;
  v3[3] = &unk_1E5499418;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  [v1 photoPickerProviderItemFromPosterConfiguration:v2 completionBlock:v3];
  objc_destroyWeak(&v4);
}

void __90__CNPosterSetupAvatarPreviewViewController_initWithPosterConfiguration_forEditingContact___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 generateAllImageDatasIfNeeded];
  objc_initWeak(&location, WeakRetained);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__CNPosterSetupAvatarPreviewViewController_initWithPosterConfiguration_forEditingContact___block_invoke_3;
  block[3] = &unk_1E549B670;
  objc_copyWeak(&v8, &location);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __90__CNPosterSetupAvatarPreviewViewController_initWithPosterConfiguration_forEditingContact___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateWithProviderItem:*(void *)(a1 + 32)];
}

+ (double)twentyFourPointFivePercentOfHeight:(double)a3
{
  return a3 * 0.245000005;
}

+ (CGSize)defaultItemSize
{
  +[CNVisualIdentityPickerViewController defaultItemSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (unint64_t)defaultImageTypeForWallpaperType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F1B878]])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B880]])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

@end