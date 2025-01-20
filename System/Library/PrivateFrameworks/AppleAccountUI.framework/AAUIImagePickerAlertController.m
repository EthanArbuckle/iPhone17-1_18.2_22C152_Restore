@interface AAUIImagePickerAlertController
+ (id)alertControllerWithSelectionHandler:(id)a3;
- (id)_propertiesForImagePickerController:(id)a3;
- (id)selectionHandler;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)modalPresentationStyle;
- (void)_callSelectionHandlerWithImage:(id)a3 cropRect:(id)a4;
- (void)_dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_presentDocumentPickerAnimated:(BOOL)a3;
- (void)_presentImagePickerAnimated:(BOOL)a3;
- (void)_presentImagePickerWithSourceType:(int64_t)a3 animated:(BOOL)a4;
- (void)_presentImageSourcePickerAnimated:(BOOL)a3;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setSelectionHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AAUIImagePickerAlertController

+ (id)alertControllerWithSelectionHandler:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setSelectionHandler:v3];

  return v4;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)AAUIImagePickerAlertController;
  [(AAUIImagePickerAlertController *)&v4 viewDidLoad];
  id v3 = [(AAUIImagePickerAlertController *)self view];
  [v3 setBackgroundColor:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AAUIImagePickerAlertController;
  [(AAUIImagePickerAlertController *)&v5 viewDidAppear:a3];
  objc_super v4 = [(AAUIImagePickerAlertController *)self presentingViewController];
  [(AAUIImagePickerAlertController *)self _presentImagePickerAnimated:v4 != 0];
}

- (int64_t)modalPresentationStyle
{
  return 6;
}

- (void)_presentImagePickerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [MEMORY[0x263F82808] isSourceTypeAvailable:1];
  char v6 = [MEMORY[0x263F82808] isSourceTypeAvailable:0];
  if (v5 & 1) != 0 || (v6)
  {
    [(AAUIImagePickerAlertController *)self _presentImageSourcePickerAnimated:v3];
  }
  else
  {
    [(AAUIImagePickerAlertController *)self _presentDocumentPickerAnimated:v3];
  }
}

- (void)_presentImageSourcePickerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [MEMORY[0x263F82418] alertWithTitle:0 message:0];
  char v6 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  [v5 setPreferredStyle:(v7 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Presenting image source picker...", buf, 2u);
  }

  if ([MEMORY[0x263F82808] isSourceTypeAvailable:1])
  {
    v9 = (void *)MEMORY[0x263F82400];
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"PROFILE_TAKE_PHOTO" value:&stru_26BD39CD8 table:@"Localizable"];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke;
    v30[3] = &unk_263F93C10;
    v30[4] = self;
    BOOL v31 = v3;
    v12 = [v9 actionWithTitle:v11 style:0 handler:v30];
    [v5 addAction:v12];
  }
  if ([MEMORY[0x263F82808] isSourceTypeAvailable:0])
  {
    v13 = (void *)MEMORY[0x263F82400];
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"PROFILE_CHOOSE_PHOTO" value:&stru_26BD39CD8 table:@"Localizable"];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke_49;
    v28[3] = &unk_263F93C10;
    v28[4] = self;
    BOOL v29 = v3;
    v16 = [v13 actionWithTitle:v15 style:0 handler:v28];
    [v5 addAction:v16];
  }
  v17 = (void *)MEMORY[0x263F82400];
  v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"PROFILE_BROWSE_PHOTO" value:&stru_26BD39CD8 table:@"Localizable"];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke_53;
  v26[3] = &unk_263F93C10;
  v26[4] = self;
  BOOL v27 = v3;
  v20 = [v17 actionWithTitle:v19 style:0 handler:v26];
  [v5 addAction:v20];

  v21 = (void *)MEMORY[0x263F82400];
  v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v23 = [v22 localizedStringForKey:@"CANCEL" value:&stru_26BD39CD8 table:@"Localizable"];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke_57;
  v25[3] = &unk_263F927A8;
  v25[4] = self;
  v24 = [v21 actionWithTitle:v23 style:1 handler:v25];
  [v5 addAction:v24];

  [(AAUIImagePickerAlertController *)self presentViewController:v5 animated:v3 completion:0];
}

uint64_t __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "User opted to select image from camera.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _presentImagePickerWithSourceType:1 animated:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke_49(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "User opted to select image from photo library.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _presentImagePickerWithSourceType:0 animated:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke_53(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "User opted to select image from document browser.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _presentDocumentPickerAnimated:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke_57(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "User opted to cancel photo selection, bailing!", v4, 2u);
  }

  return [*(id *)(a1 + 32) _callSelectionHandlerWithImage:0 cropRect:0];
}

- (void)_presentImagePickerWithSourceType:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [NSNumber numberWithInteger:a3];
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "Presenting image picker controller with source type: %@", buf, 0xCu);
  }
  id v9 = objc_alloc_init(MEMORY[0x263F82808]);
  v10 = [v9 presentationController];
  [v10 setDelegate:self];

  [v9 setSourceType:a3];
  uint64_t v13 = *MEMORY[0x263F01A68];
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  [v9 setMediaTypes:v11];

  [v9 setDelegate:self];
  [v9 _setImagePickerSavingOptions:3];
  v12 = [(AAUIImagePickerAlertController *)self _propertiesForImagePickerController:v9];
  [v9 _setProperties:v12];

  [(AAUIImagePickerAlertController *)self presentViewController:v9 animated:v4 completion:0];
}

- (void)_presentDocumentPickerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Presenting document picker view controller", v9, 2u);
  }

  char v6 = [MEMORY[0x263EFF8C0] arrayWithObject:*MEMORY[0x263F01A68]];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F82698]) initWithDocumentTypes:v6 inMode:0];
  v8 = [v7 presentationController];
  [v8 setDelegate:self];

  [v7 setShouldShowFileExtensions:0];
  [v7 setAllowsMultipleSelection:0];
  [v7 setDelegate:self];
  [(AAUIImagePickerAlertController *)self presentViewController:v7 animated:v3 completion:0];
}

- (void)_callSelectionHandlerWithImage:(id)a3 cropRect:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(AAUIImagePickerAlertController *)self selectionHandler];

  if (v7)
  {
    v8 = [(AAUIImagePickerAlertController *)self selectionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);

    [(AAUIImagePickerAlertController *)self setSelectionHandler:0];
  }
  [(AAUIImagePickerAlertController *)self _dismissViewController:self animated:0 completion:0];
}

- (id)_propertiesForImagePickerController:(id)a3
{
  v12[5] = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x263EFF9A0];
  BOOL v4 = [a3 _properties];
  char v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = *MEMORY[0x263F83D80];
  v11[0] = *MEMORY[0x263F83660];
  v11[1] = v6;
  v12[0] = MEMORY[0x263EFFA88];
  v12[1] = MEMORY[0x263EFFA88];
  uint64_t v7 = *MEMORY[0x263F83D20];
  v11[2] = *MEMORY[0x263F83CC8];
  v11[3] = v7;
  v12[2] = MEMORY[0x263EFFA88];
  v12[3] = MEMORY[0x263EFFA88];
  v11[4] = *MEMORY[0x263F83CC0];
  v12[4] = MEMORY[0x263EFFA88];
  v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];
  [v5 addEntriesFromDictionary:v8];

  id v9 = (void *)[v5 copy];
  return v9;
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x263F836A0];
  id v8 = a4;
  id v9 = [v8 objectForKeyedSubscript:v7];
  v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F83668]];

  v11 = _AAUILogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    __int16 v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "User selected new profile picture: %@, crop rect: %@", buf, 0x16u);
  }

  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    uint64_t v13 = v10;
  }
  else
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263F82808], "aaui_fixedCropRect:forOriginalImage:", v10, v9);

    v14 = _AAUILogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl(&dword_209754000, v14, OS_LOG_TYPE_DEFAULT, "Updated profile picture crop rect: %@", buf, 0xCu);
    }
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __86__AAUIImagePickerAlertController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke;
  v18[3] = &unk_263F92758;
  v18[4] = self;
  id v19 = v9;
  id v20 = v13;
  id v16 = v13;
  id v17 = v9;
  [(AAUIImagePickerAlertController *)self _dismissViewController:v6 animated:1 completion:v18];
}

uint64_t __86__AAUIImagePickerAlertController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callSelectionHandlerWithImage:*(void *)(a1 + 40) cropRect:*(void *)(a1 + 48)];
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4 = a3;
  char v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "User canceled image picker controller.", buf, 2u);
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__AAUIImagePickerAlertController_imagePickerControllerDidCancel___block_invoke;
  v6[3] = &unk_263F92168;
  v6[4] = self;
  [(AAUIImagePickerAlertController *)self _dismissViewController:v4 animated:1 completion:v6];
}

uint64_t __65__AAUIImagePickerAlertController_imagePickerControllerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callSelectionHandlerWithImage:0 cropRect:0];
}

- (void)_dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v12 = a5;
  uint64_t v8 = [a3 presentingViewController];
  id v9 = (void *)v8;
  if (v8) {
    v10 = (AAUIImagePickerAlertController *)v8;
  }
  else {
    v10 = self;
  }
  v11 = v10;

  [(AAUIImagePickerAlertController *)v11 dismissViewControllerAnimated:v5 completion:v12];
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  BOOL v5 = (void *)MEMORY[0x263EFF8F8];
  id v6 = objc_msgSend(a4, "firstObject", a3);
  id v13 = [v5 dataWithContentsOfURL:v6 options:0 error:0];

  if (v13)
  {
    id v7 = objc_alloc(MEMORY[0x263F82808]);
    uint64_t v8 = objc_msgSend(v7, "_initWithSourceImageData:cropRect:", v13, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v9 = [v8 presentationController];
    [v9 setDelegate:self];

    [v8 setModalInPresentation:1];
    v10 = [(AAUIImagePickerAlertController *)self _propertiesForImagePickerController:v8];
    [v8 _setProperties:v10];

    [v8 setDelegate:self];
    v11 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      [v8 setModalPresentationStyle:0];
    }
    [(AAUIImagePickerAlertController *)self presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    [(AAUIImagePickerAlertController *)self _callSelectionHandlerWithImage:0 cropRect:0];
  }
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "User cancelled document picker view controller.", v5, 2u);
  }

  [(AAUIImagePickerAlertController *)self _callSelectionHandlerWithImage:0 cropRect:0];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v3 = a3;
  id v4 = [v3 presentedViewController];
  uint64_t v5 = [v4 modalPresentationStyle];

  id v6 = [v3 presentedViewController];

  if (v5 == -2) {
    uint64_t v7 = [v6 _preferredModalPresentationStyle];
  }
  else {
    uint64_t v7 = [v6 modalPresentationStyle];
  }
  int64_t v8 = v7;

  return v8;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Presentation controller did dismiss with card UI swipe.", v5, 2u);
  }

  [(AAUIImagePickerAlertController *)self _callSelectionHandlerWithImage:0 cropRect:0];
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end