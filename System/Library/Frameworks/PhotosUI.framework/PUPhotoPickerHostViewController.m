@interface PUPhotoPickerHostViewController
- (BOOL)_isInvalidated;
- (NSExtensionContext)hostExtensionContext;
- (PUPhotoPickerHostViewControllerDelegate)delegate;
- (void)invalidate;
- (void)performPhotoPickerPreviewOfFirstAsset;
- (void)performTraitCollectionUpdateWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostExtensionContext:(id)a3;
- (void)set_invalidated:(BOOL)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation PUPhotoPickerHostViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_hostExtensionContext, 0);
}

- (void)set_invalidated:(BOOL)a3
{
  self->__invalidated = a3;
}

- (BOOL)_isInvalidated
{
  return self->__invalidated;
}

- (void)setDelegate:(id)a3
{
}

- (PUPhotoPickerHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PUPhotoPickerHostViewControllerDelegate *)WeakRetained;
}

- (void)setHostExtensionContext:(id)a3
{
}

- (NSExtensionContext)hostExtensionContext
{
  return self->_hostExtensionContext;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoPickerHostViewController;
  [(_UIRemoteViewController *)&v7 viewServiceDidTerminateWithError:v4];
  if (![(PUPhotoPickerHostViewController *)self _isInvalidated])
  {
    v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[PUPhotoPickerHostViewController viewServiceDidTerminateWithError:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_217C33000, v5, OS_LOG_TYPE_ERROR, "%s Error %@", buf, 0x16u);
    }

    v6 = [(PUPhotoPickerHostViewController *)self hostProxy];
    [v6 cancelPhotoPicker];
  }
}

- (void)performTraitCollectionUpdateWithCompletion:(id)a3
{
  v25[5] = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v4 = [(PUPhotoPickerHostViewController *)self traitCollection];
  v5 = (void *)MEMORY[0x263F82DA0];
  v6 = objc_msgSend(MEMORY[0x263F82DA0], "traitCollectionWithVerticalSizeClass:", objc_msgSend(v4, "verticalSizeClass"));
  v25[0] = v6;
  objc_super v7 = objc_msgSend(MEMORY[0x263F82DA0], "traitCollectionWithHorizontalSizeClass:", objc_msgSend(v4, "horizontalSizeClass"));
  v25[1] = v7;
  v8 = objc_msgSend(MEMORY[0x263F82DA0], "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v25[2] = v8;
  v9 = objc_msgSend(MEMORY[0x263F82DA0], "traitCollectionWithLayoutDirection:", objc_msgSend(v4, "layoutDirection"));
  v25[3] = v9;
  __int16 v10 = (void *)MEMORY[0x263F82DA0];
  id v11 = [v4 preferredContentSizeCategory];
  uint64_t v12 = [v10 traitCollectionWithPreferredContentSizeCategory:v11];
  v25[4] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:5];
  v14 = [v5 traitCollectionWithTraitsFromCollections:v13];

  id v20 = 0;
  v15 = [MEMORY[0x263F08910] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v20];
  id v16 = v20;
  if (v16)
  {
    v17 = PLUIGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[PUPhotoPickerHostViewController performTraitCollectionUpdateWithCompletion:]";
      __int16 v23 = 2112;
      id v24 = v16;
      _os_log_impl(&dword_217C33000, v17, OS_LOG_TYPE_ERROR, "%s Error %@", buf, 0x16u);
    }
  }
  v18 = [(PUPhotoPickerHostViewController *)self hostProxy];
  [v18 performTraitCollectionUpdateUsingData:v15 completion:v19];
}

- (void)performPhotoPickerPreviewOfFirstAsset
{
  id v2 = [(PUPhotoPickerHostViewController *)self hostProxy];
  [v2 performPhotoPickerPreviewOfFirstAsset];
}

- (void)invalidate
{
  if (![(PUPhotoPickerHostViewController *)self _isInvalidated])
  {
    [(PUPhotoPickerHostViewController *)self set_invalidated:1];
    v3 = [(PUPhotoPickerHostViewController *)self hostProxy];
    [v3 invalidatePhotoPickerHostServices];

    [(PUPhotoPickerHostViewController *)self setHostExtensionContext:0];
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setNavigationBarHidden:1];
  }
}

@end