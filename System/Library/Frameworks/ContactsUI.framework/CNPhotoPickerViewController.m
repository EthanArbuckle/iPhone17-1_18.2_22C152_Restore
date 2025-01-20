@interface CNPhotoPickerViewController
+ (BOOL)canShowAvatarEditor;
+ (id)log;
+ (id)navigationControllerForPicker:(id)a3;
+ (id)photoPickerForGameCenterWithContact:(id)a3;
- (CNMutableContact)pendingEditContact;
- (CNPhotoPickerViewController)initWithContact:(id)a3 style:(id)a4 configuration:(id)a5;
- (CNPhotoPickerViewControllerDelegate)delegate;
- (id)contactViewCache;
- (void)cancel:(id)a3;
- (void)done:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPendingEditContact:(id)a3;
- (void)updateHeaderViewAvatar;
- (void)updatePendingEditContact;
@end

@implementation CNPhotoPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEditContact, 0);

  objc_destroyWeak((id *)&self->delegate);
}

- (void)setPendingEditContact:(id)a3
{
}

- (CNMutableContact)pendingEditContact
{
  return self->_pendingEditContact;
}

- (void)setDelegate:(id)a3
{
}

- (CNPhotoPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (CNPhotoPickerViewControllerDelegate *)WeakRetained;
}

- (id)contactViewCache
{
  v2 = [(CNVisualIdentityPickerViewController *)self dataSource];
  v3 = [v2 contactViewCache];

  return v3;
}

- (void)done:(id)a3
{
  [(CNPhotoPickerViewController *)self updatePendingEditContact];
  id v6 = [(CNVisualIdentityPickerViewController *)self contactImageForCurrentActiveItem];
  v4 = [(CNPhotoPickerViewController *)self delegate];
  v5 = [(CNPhotoPickerViewController *)self pendingEditContact];
  [v4 photoPicker:self didUpdatePhotoForContact:v5 withContactImage:v6];
}

- (void)cancel:(id)a3
{
  id v4 = [(CNPhotoPickerViewController *)self delegate];
  [v4 photoPickerDidCancel:self];
}

- (void)updatePendingEditContact
{
  v3 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  id v4 = [v3 imageData];
  v5 = [(CNPhotoPickerViewController *)self pendingEditContact];
  [v5 setImageData:v4];

  id v6 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  v7 = [v6 imageData];
  v8 = objc_msgSend(v7, "_cn_md5Hash");
  v9 = [(CNPhotoPickerViewController *)self pendingEditContact];
  [v9 setImageHash:v8];

  v10 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  [v10 cropRect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(CNPhotoPickerViewController *)self pendingEditContact];
  objc_msgSend(v19, "setCropRect:", v12, v14, v16, v18);

  v20 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  v21 = [v20 thumbnailImageData];
  v22 = [(CNPhotoPickerViewController *)self pendingEditContact];
  [v22 setThumbnailImageData:v21];

  v23 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  v24 = [v23 fullscreenImageData];
  v25 = [(CNPhotoPickerViewController *)self pendingEditContact];
  [v25 setFullscreenImageData:v24];

  v26 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  v27 = [v26 imageType];
  v28 = [(CNPhotoPickerViewController *)self pendingEditContact];
  [v28 setImageType:v27];

  v29 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  v30 = [v29 memojiMetadata];
  v31 = [(CNPhotoPickerViewController *)self pendingEditContact];
  [v31 setMemojiMetadata:v30];

  id v34 = [(CNVisualIdentityPickerViewController *)self pendingVisualIdentity];
  v32 = [v34 wallpaper];
  v33 = [(CNPhotoPickerViewController *)self pendingEditContact];
  [v33 setWallpaper:v32];
}

- (void)updateHeaderViewAvatar
{
  [(CNPhotoPickerViewController *)self updatePendingEditContact];
  v3.receiver = self;
  v3.super_class = (Class)CNPhotoPickerViewController;
  [(CNVisualIdentityPickerViewController *)&v3 updateHeaderViewAvatar];
}

- (CNPhotoPickerViewController)initWithContact:(id)a3 style:(id)a4 configuration:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = objc_alloc_init(CNContactViewCache);
  double v12 = [[CNVisualIdentity alloc] initWithContact:v10];
  double v13 = [[CNPhotoPickerDataSource alloc] initWithVisualIdentity:v12 contactViewCache:v11 photoPickerConfiguration:v8];
  uint64_t v14 = [v8 allowRotation];

  v18.receiver = self;
  v18.super_class = (Class)CNPhotoPickerViewController;
  double v15 = [(CNVisualIdentityPickerViewController *)&v18 initWithPhotosDataSource:v13 style:v9 allowRotation:v14];

  double v16 = (void *)[v10 mutableCopy];
  [(CNPhotoPickerViewController *)v15 setPendingEditContact:v16];

  return v15;
}

+ (BOOL)canShowAvatarEditor
{
  return +[CNPhotoPickerCapabilities allowsAvatarUI];
}

+ (id)navigationControllerForPicker:(id)a3
{
  return +[CNVisualIdentityPickerViewController navigationControllerForPicker:a3];
}

+ (id)photoPickerForGameCenterWithContact:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = (void *)[v4 mutableCopy];

  v7 = +[CNContactStyle currentStyle];
  id v8 = +[CNPhotoPickerConfiguration gameCenterConfiguration];
  id v9 = (void *)[v5 initWithContact:v6 style:v7 configuration:v8];

  return v9;
}

+ (id)log
{
  if (log_cn_once_token_1_51158 != -1) {
    dispatch_once(&log_cn_once_token_1_51158, &__block_literal_global_51159);
  }
  v2 = (void *)log_cn_once_object_1_51160;

  return v2;
}

void __34__CNPhotoPickerViewController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNPhotoPicker");
  v1 = (void *)log_cn_once_object_1_51160;
  log_cn_once_object_1_51160 = (uint64_t)v0;
}

@end