@interface PUPickerUnavailableViewController
+ (id)unavailableViewController:(unint64_t)a3 configuration:(id)a4 error:(id)a5 delegate:(id)a6;
- (NSError)error;
- (PHPickerConfiguration)configuration;
- (PUPickerUnavailableViewController)init;
- (PUPickerUnavailableViewController)initWithCoder:(id)a3;
- (PUPickerUnavailableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUPickerUnavailableViewController)initWithReason:(unint64_t)a3 configuration:(id)a4 error:(id)a5;
- (_PUPickerUnavailableViewControllerDelegate)delegate;
- (id)reasonDebugDescription;
- (id)unavailableButtonTitle;
- (id)unavailableKey;
- (id)unavailableMessage;
- (id)unavailableTitle;
- (unint64_t)reason;
- (void)askDelegateToCancel;
- (void)askDelegateToRetry;
- (void)setDelegate:(id)a3;
- (void)updateReason:(unint64_t)a3 error:(id)a4;
- (void)updateUnavailableView;
- (void)viewDidLoad;
@end

@implementation PUPickerUnavailableViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (_PUPickerUnavailableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_PUPickerUnavailableViewControllerDelegate *)WeakRetained;
}

- (NSError)error
{
  return self->_error;
}

- (PHPickerConfiguration)configuration
{
  return self->_configuration;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)askDelegateToRetry
{
  id v3 = [(PUPickerUnavailableViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 _pickerUnavailableViewControllerRetryButtonTapped:self];
  }
}

- (void)askDelegateToCancel
{
  id v3 = [(PUPickerUnavailableViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 _pickerUnavailableViewControllerCancelButtonTapped:self];
  }
}

- (id)unavailableKey
{
  v2 = [(PUPickerUnavailableViewController *)self configuration];
  id v3 = [v2 filter];
  v4 = [v3 _puPickerFilter];
  uint64_t v5 = [v4 generatedPossibleAssetTypes];

  v6 = @"VIDEOS";
  if ((v5 & 0x3FE) != 0) {
    v6 = @"ITEMS";
  }
  if ((v5 & 0x1FC00) == 0) {
    v6 = @"PHOTOS";
  }
  if (v5) {
    return v6;
  }
  else {
    return @"ITEMS";
  }
}

- (id)reasonDebugDescription
{
  unint64_t v2 = [(PUPickerUnavailableViewController *)self reason];
  if (v2 - 1 > 3) {
    return @"unknown";
  }
  else {
    return off_2642C53D0[v2 - 1];
  }
}

- (id)unavailableButtonTitle
{
  unint64_t v2 = [(PUPickerUnavailableViewController *)self reason];
  if (v2 - 3 < 2 || v2 == 1)
  {
    v4 = 0;
  }
  else
  {
    if (v2 != 2) {
      MEMORY[0x21D4598C0]();
    }
    v4 = PLServicesLocalizedFrameworkString();
  }

  return v4;
}

- (id)unavailableMessage
{
  id v3 = [(PUPickerUnavailableViewController *)self unavailableKey];
  unint64_t v4 = [(PUPickerUnavailableViewController *)self reason];
  if (v4 != 1)
  {
    if (v4 == 4)
    {
      v6 = [NSString stringWithFormat:@"PHOTO_PICKER_CONTENT_UNAVAILABLE_MESSAGE_REASON_CANNOT_OPEN_PHOTO_LIBRARY_%@", v3];
      uint64_t v5 = PLServicesLocalizedFrameworkString();
LABEL_8:

      goto LABEL_10;
    }
    if (v4 == 3)
    {
      uint64_t v5 = PLServicesLocalizedFrameworkString();
      goto LABEL_10;
    }
    if (MEMORY[0x21D4598C0]())
    {
      v6 = [(PUPickerUnavailableViewController *)self error];
      v8 = [(PUPickerUnavailableViewController *)self reasonDebugDescription];
      uint64_t v5 = PFStringWithValidatedFormat();

      goto LABEL_8;
    }
  }
  uint64_t v5 = 0;
LABEL_10:

  return v5;
}

- (id)unavailableTitle
{
  id v3 = [(PUPickerUnavailableViewController *)self unavailableKey];
  switch([(PUPickerUnavailableViewController *)self reason])
  {
    case 1uLL:
      [NSString stringWithFormat:@"PHOTO_PICKER_CONTENT_UNAVAILABLE_TITLE_REASON_LOADING_%@", v3];
      goto LABEL_7;
    case 2uLL:
      [NSString stringWithFormat:@"PHOTO_PICKER_CONTENT_UNAVAILABLE_TITLE_REASON_CRASHED_%@", v3];
      goto LABEL_7;
    case 3uLL:
      unint64_t v4 = PLServicesLocalizedFrameworkString();
      goto LABEL_8;
    case 4uLL:
      [NSString stringWithFormat:@"PHOTO_PICKER_CONTENT_UNAVAILABLE_TITLE_REASON_CANNOT_OPEN_PHOTO_LIBRARY_%@", v3];
      goto LABEL_7;
    default:
      [NSString stringWithFormat:@"PHOTO_PICKER_CONTENT_UNAVAILABLE_TITLE_REASON_UNKNOWN_%@", v3];
      uint64_t v5 = LABEL_7:;
      unint64_t v4 = PLServicesLocalizedFrameworkString();

LABEL_8:
      return v4;
  }
}

- (void)updateUnavailableView
{
  if ([(PUPickerUnavailableViewController *)self reason] == 1)
  {
    id v3 = [MEMORY[0x263F82600] loadingConfiguration];
  }
  else
  {
    id v3 = [MEMORY[0x263F82600] emptyConfiguration];
    unint64_t v4 = [(PUPickerUnavailableViewController *)self unavailableTitle];
    [v3 setText:v4];

    uint64_t v5 = [(PUPickerUnavailableViewController *)self unavailableMessage];
    [v3 setSecondaryText:v5];

    uint64_t v6 = [(PUPickerUnavailableViewController *)self unavailableButtonTitle];
    if (v6
      && (v7 = (void *)v6,
          [(PUPickerUnavailableViewController *)self delegate],
          v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = objc_opt_respondsToSelector(),
          v8,
          v7,
          (v9 & 1) != 0))
    {
      objc_initWeak(&location, self);
      v10 = [(PUPickerUnavailableViewController *)self unavailableButtonTitle];
      v11 = [v3 buttonProperties];
      v12 = [v11 configuration];
      [v12 setTitle:v10];

      v13 = (void *)MEMORY[0x263F823D0];
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      v21 = __58__PUPickerUnavailableViewController_updateUnavailableView__block_invoke;
      v22 = &unk_2642C53B0;
      objc_copyWeak(&v23, &location);
      v14 = [v13 actionWithHandler:&v19];
      v15 = objc_msgSend(v3, "buttonProperties", v19, v20, v21, v22);
      [v15 setPrimaryAction:v14];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
    else
    {
      v16 = [v3 buttonProperties];
      v17 = [v16 configuration];
      [v17 setTitle:0];

      v18 = [v3 buttonProperties];
      [v18 setPrimaryAction:0];
    }
  }
  [(PUPickerUnavailableViewController *)self _setContentUnavailableConfiguration:v3];
}

void __58__PUPickerUnavailableViewController_updateUnavailableView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained askDelegateToRetry];
}

- (void)updateReason:(unint64_t)a3 error:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  self->_reason = a3;
  objc_storeStrong((id *)&self->_error, a4);
  [(PUPickerUnavailableViewController *)self updateUnavailableView];
  unint64_t v5 = [(PUPickerUnavailableViewController *)self reason];
  uint64_t v6 = PLPickerGetLog();
  v7 = v6;
  if (v5 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_217C33000, v7, OS_LOG_TYPE_DEBUG, "Showing picker loading UI (updated).", (uint8_t *)&v10, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = [(PUPickerUnavailableViewController *)self reasonDebugDescription];
    char v9 = [(PUPickerUnavailableViewController *)self error];
    int v10 = 138412546;
    v11 = v8;
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_217C33000, v7, OS_LOG_TYPE_ERROR, "Showing picker unavailable UI (updated) (reason: %@) with error: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);

  [(PUPickerUnavailableViewController *)self updateUnavailableView];
}

- (void)viewDidLoad
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)PUPickerUnavailableViewController;
  [(PUPickerUnavailableViewController *)&v12 viewDidLoad];
  [(PUPickerUnavailableViewController *)self updateUnavailableView];
  id v3 = [(PUPickerUnavailableViewController *)self view];
  unint64_t v4 = [(PUPickerUnavailableViewController *)self configuration];
  char v5 = [v4 _disabledPrivateCapabilities];

  if ((v5 & 0x10) != 0) {
    [MEMORY[0x263F825C8] clearColor];
  }
  else {
  uint64_t v6 = [MEMORY[0x263F825C8] systemBackgroundColor];
  }
  [v3 setBackgroundColor:v6];

  unint64_t v7 = [(PUPickerUnavailableViewController *)self reason];
  v8 = PLPickerGetLog();
  char v9 = v8;
  if (v7 == 1)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217C33000, v9, OS_LOG_TYPE_DEBUG, "Showing picker loading UI.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v10 = [(PUPickerUnavailableViewController *)self reasonDebugDescription];
    v11 = [(PUPickerUnavailableViewController *)self error];
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_217C33000, v9, OS_LOG_TYPE_ERROR, "Showing picker unavailable UI (reason: %@) with error: %@", buf, 0x16u);
  }
}

- (PUPickerUnavailableViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (PUPickerUnavailableViewController *)_PFAssertFailHandler();
  return [(PUPickerUnavailableViewController *)v4 initWithNibName:v6 bundle:v7];
}

- (PUPickerUnavailableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (PUPickerUnavailableViewController *)_PFAssertFailHandler();
  return [(PUPickerUnavailableViewController *)v7 init];
}

- (PUPickerUnavailableViewController)init
{
  unint64_t v2 = (PUPickerUnavailableViewController *)_PFAssertFailHandler();
  return [(PUPickerUnavailableViewController *)v2 initWithReason:v4 configuration:v5 error:v6];
}

- (PUPickerUnavailableViewController)initWithReason:(unint64_t)a3 configuration:(id)a4 error:(id)a5
{
  SEL v8 = (PHPickerConfiguration *)a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PUPickerUnavailableViewController;
  int v10 = [(PUPickerUnavailableViewController *)&v14 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    v10->_reason = a3;
    objc_storeStrong((id *)&v10->_error, a5);
    objc_super v12 = v8;
    if (!v8) {
      objc_super v12 = objc_alloc_init(PHPickerConfiguration);
    }
    objc_storeStrong((id *)&v11->_configuration, v12);
    if (!v8) {
  }
    }
  return v11;
}

+ (id)unavailableViewController:(unint64_t)a3 configuration:(id)a4 error:(id)a5 delegate:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  objc_super v12 = [[PUPickerUnavailableViewController alloc] initWithReason:a3 configuration:v9 error:v11];

  [(PUPickerUnavailableViewController *)v12 setDelegate:v10];
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0
    || ([v9 disabledCapabilities] & 8) != 0
    || ([v9 edgesWithoutContentMargins] & 1) != 0)
  {
    uint64_t v19 = v12;
  }
  else
  {
    v13 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v12 action:sel_cancelButtonTapped_];
    objc_super v14 = [(PUPickerUnavailableViewController *)v12 navigationItem];
    [v14 setLeftBarButtonItem:v13];

    __int16 v15 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v12];
    v16 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v17 = [v16 bundleIdentifier];
    int v18 = [v17 isEqualToString:@"com.apple.Preferences"];

    if (v18)
    {
      uint64_t v19 = v15;
    }
    else
    {
      id v21 = objc_alloc_init(MEMORY[0x263F82E10]);
      uint64_t v19 = (PUPickerUnavailableViewController *)[objc_alloc(MEMORY[0x263F82BE8]) initWithStyle:1];
      [(PUPickerUnavailableViewController *)v19 setViewController:v21 forColumn:0];
      [(PUPickerUnavailableViewController *)v19 setViewController:v15 forColumn:2];
      [(PUPickerUnavailableViewController *)v19 setViewController:v15 forColumn:3];
      [(PUPickerUnavailableViewController *)v19 setPrimaryBackgroundStyle:1];
      [(PUPickerUnavailableViewController *)v19 setPreferredSplitBehavior:1];
      [(PUPickerUnavailableViewController *)v19 setPresentsWithGesture:0];
      [(PUPickerUnavailableViewController *)v19 setPreferredDisplayMode:1];
    }
  }

  return v19;
}

@end