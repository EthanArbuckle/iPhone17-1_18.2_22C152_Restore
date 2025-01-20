@interface PKImageGenerationController
- (BOOL)isGenerationModelAvailable;
- (BOOL)isGenerationToolEnabled;
- (BOOL)isImageGenerationAllowed;
- (BOOL)shouldShowImageGenerationUI;
- (PKImageGenerationController)init;
- (PKImageGenerationControllerDelegate)delegate;
- (void)_handleGenerationModelAvailabilityDidChangeNotification:(id)a3;
- (void)_handleManagedConfigurationEffectiveSettingsDidChangeNotification:(id)a3;
- (void)_notifyStateDidChangeIfNecessary;
- (void)setDelegate:(id)a3;
@end

@implementation PKImageGenerationController

- (PKImageGenerationController)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKImageGenerationController;
  v2 = [(PKImageGenerationController *)&v10 init];
  v3 = v2;
  if (v2)
  {
    BOOL v4 = [(PKImageGenerationController *)v2 isGenerationToolEnabled];
    v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v12 = v4;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "isGenerationToolEnabled: %{BOOL}d", buf, 8u);
    }

    if (v4)
    {
      v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v7 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Observe generation model availability change notification", buf, 2u);
      }

      [v6 addObserver:v3 selector:sel__handleGenerationModelAvailabilityDidChangeNotification_ name:@"PKGenerationModelAvailabilityStatusDidChangeNotification" object:0];
      v8 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Observe managed configuration effective settings change notification", buf, 2u);
      }

      [v6 addObserver:v3 selector:sel__handleManagedConfigurationEffectiveSettingsDidChangeNotification_ name:*MEMORY[0x1E4F73EC0] object:0];
    }
    v3->_cachedShouldShowImageGenerationUI = [(PKImageGenerationController *)v3 shouldShowImageGenerationUI];
  }
  return v3;
}

- (void)_handleGenerationModelAvailabilityDidChangeNotification:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = [(PKImageGenerationController *)self isGenerationModelAvailable];
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Handle model availability did change notification, isGenerationModelAvailable: %{BOOL}d", (uint8_t *)v5, 8u);
  }

  [(PKImageGenerationController *)self _notifyStateDidChangeIfNecessary];
}

- (BOOL)isGenerationModelAvailable
{
  v2 = +[PKGenerationModelAvailabilityController sharedInstance];
  char v3 = [v2 isGenerationModelAvailable];

  return v3;
}

- (void)_notifyStateDidChangeIfNecessary
{
  BOOL v3 = [(PKImageGenerationController *)self shouldShowImageGenerationUI];
  if (self->_cachedShouldShowImageGenerationUI != v3)
  {
    self->_cachedShouldShowImageGenerationUI = v3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint64_t v6 = os_log_create("com.apple.pencilkit", "ToolPicker");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Notify generation tool controller's state did change", v8, 2u);
      }

      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 imageGenerationControllerShouldShowImageGenerationUIDidChange:self];
    }
  }
}

- (BOOL)shouldShowImageGenerationUI
{
  BOOL v3 = [(PKImageGenerationController *)self isGenerationToolEnabled];
  if (v3)
  {
    BOOL v3 = [(PKImageGenerationController *)self isImageGenerationAllowed];
    if (v3)
    {
      if ([(PKImageGenerationController *)self isGenerationModelAvailable])
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        BOOL v4 = +[PKGenerationModelAvailabilityController sharedInstance];
        char v5 = [v4 shouldShowEnrollmentUI];

        LOBYTE(v3) = v5;
      }
    }
  }
  return v3;
}

- (BOOL)isGenerationToolEnabled
{
  if (!_os_feature_enabled_impl() || PKIsDeviceLocked()) {
    return 0;
  }
  BOOL v3 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v4 = [v3 bundleIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.mobilenotes"];

  if (v5 && !PKIsQuickNoteOnPhone()) {
    return 1;
  }
  uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
  id v7 = [v6 bundleIdentifier];

  if (os_variant_has_internal_diagnostics())
  {
    if (([v7 isEqualToString:@"com.apple.TestApp"] & 1) != 0
      || ([v7 isEqualToString:@"com.apple.ZoomTestApp"] & 1) != 0
      || ([v7 isEqualToString:@"com.apple.PaperKitTestApp"] & 1) != 0)
    {
      char v2 = 1;
    }
    else
    {
      char v2 = [v7 isEqualToString:@"com.apple.pencilkit.MultiDrawingCanvasTestApp"];
    }
  }
  else
  {
    char v2 = 0;
  }

  return v2;
}

- (BOOL)isImageGenerationAllowed
{
  char v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isImageWandAllowed];

  return v3;
}

- (void)_handleManagedConfigurationEffectiveSettingsDidChangeNotification:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v4 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = [(PKImageGenerationController *)self isImageGenerationAllowed];
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Handle managed configuration effective settings did change notification, isImageGenerationAllowed: %{BOOL}d", (uint8_t *)v5, 8u);
  }

  [(PKImageGenerationController *)self _notifyStateDidChangeIfNecessary];
}

- (PKImageGenerationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKImageGenerationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end