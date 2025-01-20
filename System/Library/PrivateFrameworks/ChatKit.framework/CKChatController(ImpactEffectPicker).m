@interface CKChatController(ImpactEffectPicker)
- (void)effectsPresenterViewController;
@end

@implementation CKChatController(ImpactEffectPicker)

- (void)effectsPresenterViewController
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "No CKChatController was found in hierarchy, effectsPresenterViewController() will return nil", v1, 2u);
}

@end