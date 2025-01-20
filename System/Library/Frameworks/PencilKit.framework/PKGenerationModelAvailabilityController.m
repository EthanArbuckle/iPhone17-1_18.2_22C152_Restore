@interface PKGenerationModelAvailabilityController
+ (id)sharedInstance;
- (BOOL)isGenerationModelAvailabilityUndetermined;
- (BOOL)isGenerationModelAvailable;
- (BOOL)isGenerationModelDisabled;
- (BOOL)presentEnrollmentScreenViewControllerIfNecessaryInWindow:(id)a3;
- (BOOL)presentGreymatterAvailabilityAlertControllerInWindow:(id)a3;
- (BOOL)shouldShowEnrollmentUI;
- (PKGenerationModelAvailabilityController)init;
- (id)nameAndAddressDescription;
- (id)stringRepresentationOfAvailabilityStatus:(int64_t)a3;
- (void)_handleModelAvailabilityStatusDidChange:(int64_t)a3 completion:(id)a4;
- (void)handleAvailabilityChange:(int64_t)a3;
- (void)queryGenerationModelAvailabilityStatus;
- (void)queryGenerationModelAvailabilityStatusWithCompletionHandler:(id)a3;
@end

@implementation PKGenerationModelAvailabilityController

void __103__PKGenerationModelAvailabilityController_queryGenerationModelAvailabilityStatusWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __103__PKGenerationModelAvailabilityController_queryGenerationModelAvailabilityStatusWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E64C67B8;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = a2;
  [WeakRetained _handleModelAvailabilityStatusDidChange:a2 completion:v5];
}

void __94__PKGenerationModelAvailabilityController__handleModelAvailabilityStatusDidChange_completion___block_invoke(void *a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  *(void *)(a1[4] + 8) = a1[6];
  id v6 = @"PKGenerationModelAvailabilityStatusKey";
  v2 = [NSNumber numberWithInteger:a1[6]];
  v7[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"PKGenerationModelAvailabilityStatusDidChangeNotification" object:a1[4] userInfo:v3];

  uint64_t v5 = a1[5];
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

void __81__PKGenerationModelAvailabilityController_queryGenerationModelAvailabilityStatus__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = os_log_create("com.apple.pencilkit", "ModelAvailability");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) nameAndAddressDescription];
    id v6 = [*(id *)(a1 + 32) stringRepresentationOfAvailabilityStatus:a2];
    int v7 = 138412546;
    v8 = v5;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "%@ New Status of Generation Model availability is: %@", (uint8_t *)&v7, 0x16u);
  }
}

uint64_t __103__PKGenerationModelAvailabilityController_queryGenerationModelAvailabilityStatusWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_handleModelAvailabilityStatusDidChange:(int64_t)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = os_log_create("com.apple.pencilkit", "ModelAvailability");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(PKGenerationModelAvailabilityController *)self nameAndAddressDescription];
    __int16 v9 = [(PKGenerationModelAvailabilityController *)self stringRepresentationOfAvailabilityStatus:a3];
    *(_DWORD *)buf = 138412546;
    v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "%@ Handling Model Availability status change to %@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__PKGenerationModelAvailabilityController__handleModelAvailabilityStatusDidChange_completion___block_invoke;
  v11[3] = &unk_1E64C6808;
  id v12 = v6;
  int64_t v13 = a3;
  v11[4] = self;
  id v10 = v6;
  PKPerformOnMainThread(v11);
}

- (id)stringRepresentationOfAvailabilityStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"unknown";
  }
  else {
    return off_1E64C6828[a3];
  }
}

- (void)queryGenerationModelAvailabilityStatusWithCompletionHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = os_log_create("com.apple.pencilkit", "ModelAvailability");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PKGenerationModelAvailabilityController *)self nameAndAddressDescription];
    int v7 = [(PKGenerationModelAvailabilityController *)self stringRepresentationOfAvailabilityStatus:self->_generationModelAvailabilityStatus];
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    __int16 v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "%@ Current Generative Model availability status is %@", buf, 0x16u);
  }
  if (!_os_feature_enabled_impl() || PKIsDeviceLocked()) {
    goto LABEL_9;
  }
  v8 = [MEMORY[0x1E4F28B50] mainBundle];
  __int16 v9 = [v8 bundleIdentifier];
  int v10 = [v9 isEqualToString:@"com.apple.mobilenotes"];

  if (!v10 || PKIsQuickNoteOnPhone())
  {
    uint64_t v11 = [MEMORY[0x1E4F28B50] mainBundle];
    id v12 = [v11 bundleIdentifier];

    if ((os_variant_has_internal_diagnostics() & 1) == 0)
    {

LABEL_9:
      self->_generationModelAvailabilityStatus = 1;
      v4[2](v4, 1);
      goto LABEL_10;
    }
    if (([v12 isEqualToString:@"com.apple.TestApp"] & 1) != 0
      || ([v12 isEqualToString:@"com.apple.ZoomTestApp"] & 1) != 0
      || [v12 isEqualToString:@"com.apple.PaperKitTestApp"])
    {
    }
    else
    {
      int v15 = [v12 isEqualToString:@"com.apple.pencilkit.MultiDrawingCanvasTestApp"];

      if (!v15) {
        goto LABEL_9;
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_9;
  }
  int64_t v13 = os_log_create("com.apple.pencilkit", "ModelAvailability");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(PKGenerationModelAvailabilityController *)self nameAndAddressDescription];
    *(_DWORD *)buf = 138412290;
    v20 = v14;
    _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "%@ Querying new Generative Model availability status", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103__PKGenerationModelAvailabilityController_queryGenerationModelAvailabilityStatusWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E64C67E0;
  objc_copyWeak(&v18, (id *)buf);
  v17 = v4;
  +[PKGenerationModelAvailabilityController generationModelAvailabilityForGenerationToolWithCompletionHandler:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
LABEL_10:
}

- (id)nameAndAddressDescription
{
  int v7 = self;
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = [v2 stringWithFormat:@"<%@: %p>", v4, &v7];

  return v5;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_118 != -1) {
    dispatch_once(&_MergedGlobals_118, &__block_literal_global_12);
  }
  v2 = (void *)qword_1EB3C5E68;

  return v2;
}

- (BOOL)isGenerationModelAvailable
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    if (PKIsDeviceLocked())
    {
LABEL_7:
      LOBYTE(v3) = 0;
      return v3;
    }
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v5 = [v4 bundleIdentifier];
    int v6 = [v5 isEqualToString:@"com.apple.mobilenotes"];

    if (!v6 || PKIsQuickNoteOnPhone())
    {
      int v7 = [MEMORY[0x1E4F28B50] mainBundle];
      v8 = [v7 bundleIdentifier];

      if ((os_variant_has_internal_diagnostics() & 1) == 0)
      {

        goto LABEL_7;
      }
      if (([v8 isEqualToString:@"com.apple.TestApp"] & 1) != 0
        || ([v8 isEqualToString:@"com.apple.ZoomTestApp"] & 1) != 0
        || [v8 isEqualToString:@"com.apple.PaperKitTestApp"])
      {
      }
      else
      {
        int v9 = [v8 isEqualToString:@"com.apple.pencilkit.MultiDrawingCanvasTestApp"];

        if (!v9) {
          goto LABEL_7;
        }
      }
    }
    LOBYTE(v3) = (self->_generationModelAvailabilityStatus & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  return v3;
}

- (void)queryGenerationModelAvailabilityStatus
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __81__PKGenerationModelAvailabilityController_queryGenerationModelAvailabilityStatus__block_invoke;
  v2[3] = &unk_1E64C6790;
  v2[4] = self;
  [(PKGenerationModelAvailabilityController *)self queryGenerationModelAvailabilityStatusWithCompletionHandler:v2];
}

void __57__PKGenerationModelAvailabilityController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKGenerationModelAvailabilityController);
  v1 = (void *)qword_1EB3C5E68;
  qword_1EB3C5E68 = (uint64_t)v0;
}

- (PKGenerationModelAvailabilityController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKGenerationModelAvailabilityController;
  v2 = [(PKGenerationModelAvailabilityController *)&v5 init];
  int v3 = v2;
  if (v2)
  {
    v2->_generationModelAvailabilityStatus = 3;
    [(PKGenerationModelAvailabilityController *)v2 queryGenerationModelAvailabilityStatus];
  }
  return v3;
}

- (void)handleAvailabilityChange:(int64_t)a3
{
}

- (BOOL)isGenerationModelAvailabilityUndetermined
{
  return self->_generationModelAvailabilityStatus == 3;
}

- (BOOL)isGenerationModelDisabled
{
  return self->_generationModelAvailabilityStatus == 2;
}

- (BOOL)presentGreymatterAvailabilityAlertControllerInWindow:(id)a3
{
  id v4 = a3;
  if ([(PKGenerationModelAvailabilityController *)self presentEnrollmentScreenViewControllerIfNecessaryInWindow:v4])
  {
    BOOL v5 = 1;
  }
  else if ([(PKGenerationModelAvailabilityController *)self isGenerationModelDisabled])
  {
    BOOL v5 = 1;
    int v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"On Device Intelligence Model Required" message:@"Features will download when your device is charging and connected to Wi-Fi." preferredStyle:1];
    int v7 = (void *)MEMORY[0x1E4FB1410];
    v8 = _PencilKitBundle();
    int v9 = [v8 localizedStringForKey:@"Done" value:@"Done" table:@"Localizable"];
    int v10 = [v7 actionWithTitle:v9 style:1 handler:0];
    [v6 addAction:v10];

    uint64_t v11 = [v4 rootViewController];
    [v11 presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)presentEnrollmentScreenViewControllerIfNecessaryInWindow:(id)a3
{
  id v4 = a3;
  if (+[PKGenerationModelAvailabilityController shouldShowEnrollmentScreen])
  {
    BOOL v5 = +[PKToolPicker activeToolPickerForWindow:v4];
    [v5 setKeyboardSceneDelegateVisibilityObserver:self];
    int v6 = +[PKGenerationModelAvailabilityController enrollmentScreenViewController];
    BOOL v7 = v6 != 0;
    if (v6)
    {
      v8 = [v4 rootViewController];
      [v8 presentViewController:v6 animated:1 completion:0];
    }
    else
    {
      v8 = os_log_create("com.apple.pencilkit", "ModelAvailability");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v10 = 0;
        _os_log_error_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_ERROR, "Unable to present Enrollment UI", v10, 2u);
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)shouldShowEnrollmentUI
{
  return +[PKGenerationModelAvailabilityController shouldShowEnrollmentScreen];
}

@end