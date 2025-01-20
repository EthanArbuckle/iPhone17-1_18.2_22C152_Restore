@interface PUPickerExtensionHostContext
- (_PUPickerExtensionContextHostInterface)delegate;
- (void)_pickerDidFinishPicking:(id)a3;
- (void)_pickerDidPerformCancelAction;
- (void)_pickerDidPerformConfirmationAction;
- (void)_pickerDidSetModalInPresentation:(BOOL)a3;
- (void)_pickerDidSetOnboardingHeaderDismissed:(BOOL)a3;
- (void)_pickerDidSetOnboardingOverlayDismissed:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PUPickerExtensionHostContext

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (_PUPickerExtensionContextHostInterface)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_PUPickerExtensionContextHostInterface *)WeakRetained;
}

- (void)_pickerDidPerformConfirmationAction
{
}

void __67__PUPickerExtensionHostContext__pickerDidPerformConfirmationAction__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 _pickerDidPerformConfirmationAction];
}

- (void)_pickerDidPerformCancelAction
{
}

void __61__PUPickerExtensionHostContext__pickerDidPerformCancelAction__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 _pickerDidPerformCancelAction];
}

- (void)_pickerDidFinishPicking:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLDispatchOnMainQueue();
}

void __56__PUPickerExtensionHostContext__pickerDidFinishPicking___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _pickerDidFinishPicking:*(void *)(a1 + 40)];
}

- (void)_pickerDidSetModalInPresentation:(BOOL)a3
{
}

void __65__PUPickerExtensionHostContext__pickerDidSetModalInPresentation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _pickerDidSetModalInPresentation:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_pickerDidSetOnboardingHeaderDismissed:(BOOL)a3
{
}

void __71__PUPickerExtensionHostContext__pickerDidSetOnboardingHeaderDismissed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _pickerDidSetOnboardingHeaderDismissed:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_pickerDidSetOnboardingOverlayDismissed:(BOOL)a3
{
}

void __72__PUPickerExtensionHostContext__pickerDidSetOnboardingOverlayDismissed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 _pickerDidSetOnboardingOverlayDismissed:*(unsigned __int8 *)(a1 + 40)];
}

@end