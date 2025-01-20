@interface MUPhotoOptionsMenuButton
+ (BOOL)_supportsCamera;
+ (BOOL)_supportsPhotoLibrary;
+ (id)buttonWithDelegate:(id)a3;
+ (id)menuForPhotoOptionsMenuButtonWithCameraCompletion:(id)a3 libraryCompletion:(id)a4;
+ (id)menuForPhotoOptionsMenuButtonWithTitle:(id)a3 symbol:(id)a4 cameraCompletion:(id)a5 libraryCompletion:(id)a6;
+ (int64_t)preferredEntryPoint;
+ (unint64_t)_numberOfSupportedSourceTypes;
- (MUPhotoOptionsMenuButton)initWithFrame:(CGRect)a3;
- (MUPhotoOptionsMenuButtonDelegate)delegate;
- (void)_captureUserAction:(int)a3;
- (void)_didSelectAddFromLibrary;
- (void)_didSelectTakePhoto;
- (void)_didTapOnMenuButton;
- (void)_setActionMenu;
- (void)_setTouchEvent;
- (void)setDelegate:(id)a3;
@end

@implementation MUPhotoOptionsMenuButton

+ (id)buttonWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = +[MUPhotoOptionsMenuButton buttonWithType:0];
  [v4 setDelegate:v3];

  if (+[MUPhotoOptionsMenuButton _numberOfSupportedSourceTypes] < 2)
  {
    [v4 _setTouchEvent];
  }
  else
  {
    [v4 setShowsMenuAsPrimaryAction:1];
    [v4 _setActionMenu];
  }
  return v4;
}

+ (id)menuForPhotoOptionsMenuButtonWithCameraCompletion:(id)a3 libraryCompletion:(id)a4
{
  return (id)[a1 menuForPhotoOptionsMenuButtonWithTitle:0 symbol:0 cameraCompletion:a3 libraryCompletion:a4];
}

+ (id)menuForPhotoOptionsMenuButtonWithTitle:(id)a3 symbol:(id)a4 cameraCompletion:(id)a5 libraryCompletion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  BOOL v14 = +[MUPhotoOptionsMenuButton _supportsCamera];
  if (+[MUPhotoOptionsMenuButton _supportsPhotoLibrary])
  {
    v15 = (void *)MEMORY[0x1E4FB13F0];
    v16 = _MULocalizedStringFromThisBundle(@"Choose Existing [Placecard]");
    v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"photo.on.rectangle"];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __109__MUPhotoOptionsMenuButton_menuForPhotoOptionsMenuButtonWithTitle_symbol_cameraCompletion_libraryCompletion___block_invoke;
    v30[3] = &unk_1E574FD58;
    id v31 = v12;
    v18 = [v15 actionWithTitle:v16 image:v17 identifier:0 handler:v30];

    [v18 setAccessibilityIdentifier:@"ChooseExistingPhotoMenuAction"];
    [v13 addObject:v18];
  }
  if (v14)
  {
    v19 = (void *)MEMORY[0x1E4FB13F0];
    v20 = _MULocalizedStringFromThisBundle(@"Take New Photo [Placecard]");
    v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"camera"];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __109__MUPhotoOptionsMenuButton_menuForPhotoOptionsMenuButtonWithTitle_symbol_cameraCompletion_libraryCompletion___block_invoke_2;
    v28 = &unk_1E574FD58;
    id v29 = v11;
    v22 = [v19 actionWithTitle:v20 image:v21 identifier:0 handler:&v25];

    objc_msgSend(v22, "setAccessibilityIdentifier:", @"TakeNewPhotoMenuAction", v25, v26, v27, v28);
    [v13 addObject:v22];
  }
  if ((unint64_t)[v13 count] < 2)
  {
    v23 = 0;
  }
  else
  {
    v23 = [MEMORY[0x1E4FB1970] menuWithTitle:v9 image:v10 identifier:0 options:0 children:v13];
    [v23 setAccessibilityIdentifier:@"AddPhotosMenuAction"];
  }

  return v23;
}

uint64_t __109__MUPhotoOptionsMenuButton_menuForPhotoOptionsMenuButtonWithTitle_symbol_cameraCompletion_libraryCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __109__MUPhotoOptionsMenuButton_menuForPhotoOptionsMenuButtonWithTitle_symbol_cameraCompletion_libraryCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setActionMenu
{
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MUPhotoOptionsMenuButton__setActionMenu__block_invoke;
  v6[3] = &unk_1E574F3A8;
  objc_copyWeak(&v7, &location);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__MUPhotoOptionsMenuButton__setActionMenu__block_invoke_2;
  v4[3] = &unk_1E574F3A8;
  objc_copyWeak(&v5, &location);
  id v3 = +[MUPhotoOptionsMenuButton menuForPhotoOptionsMenuButtonWithCameraCompletion:v6 libraryCompletion:v4];
  [(MUPhotoOptionsMenuButton *)self setMenu:v3];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __42__MUPhotoOptionsMenuButton__setActionMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _didSelectTakePhoto];
    id WeakRetained = v2;
  }
}

void __42__MUPhotoOptionsMenuButton__setActionMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _didSelectAddFromLibrary];
    id WeakRetained = v2;
  }
}

- (MUPhotoOptionsMenuButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUPhotoOptionsMenuButton;
  id v3 = -[MUPhotoOptionsMenuButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MUPhotoOptionsMenuButton *)v3 setPreferredMenuElementOrder:2];
  }
  return v4;
}

- (void)_setTouchEvent
{
}

- (void)_didTapOnMenuButton
{
  BOOL v3 = +[MUPhotoOptionsMenuButton _supportsCamera];
  BOOL v4 = +[MUPhotoOptionsMenuButton _supportsPhotoLibrary];
  if (v3)
  {
    [(MUPhotoOptionsMenuButton *)self _didSelectTakePhoto];
  }
  else if (v4)
  {
    [(MUPhotoOptionsMenuButton *)self _didSelectAddFromLibrary];
  }
}

- (void)_didSelectTakePhoto
{
  [(MUPhotoOptionsMenuButton *)self _captureUserAction:2146];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained photoOptionsMenuButtonDidSelectTakePhoto];
}

- (void)_didSelectAddFromLibrary
{
  [(MUPhotoOptionsMenuButton *)self _captureUserAction:2145];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained photoOptionsMenuButtonDidSelectAddFromLibrary];
}

- (void)_captureUserAction:(int)a3
{
}

+ (BOOL)_supportsCamera
{
  if (![MEMORY[0x1E4FB1828] isSourceTypeAvailable:1]) {
    return 0;
  }
  id v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] != 5;

  return v3;
}

+ (BOOL)_supportsPhotoLibrary
{
  return [MEMORY[0x1E4FB1828] isSourceTypeAvailable:0];
}

+ (unint64_t)_numberOfSupportedSourceTypes
{
  BOOL v2 = +[MUPhotoOptionsMenuButton _supportsCamera];
  BOOL v3 = +[MUPhotoOptionsMenuButton _supportsPhotoLibrary];
  unint64_t v4 = 1;
  if (v2) {
    unint64_t v4 = 2;
  }
  if (v3) {
    return v4;
  }
  else {
    return v2;
  }
}

+ (int64_t)preferredEntryPoint
{
  BOOL v2 = +[MUPhotoOptionsMenuButton _supportsCamera];
  BOOL v3 = +[MUPhotoOptionsMenuButton _supportsPhotoLibrary];
  int64_t v4 = 2;
  if (!v3) {
    int64_t v4 = 0;
  }
  if (v2) {
    return !v3;
  }
  else {
    return v4;
  }
}

- (MUPhotoOptionsMenuButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPhotoOptionsMenuButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end