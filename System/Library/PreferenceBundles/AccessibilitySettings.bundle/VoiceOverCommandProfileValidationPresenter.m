@interface VoiceOverCommandProfileValidationPresenter
+ (id)presenterWithValidation:(id)a3;
- (id)_initWithValidation:(id)a3;
- (id)userAcceptedValidationResolutionBlock;
- (id)userRejectedValidationResolutionBlock;
- (void)presentWithController:(id)a3;
- (void)setUserAcceptedValidationResolutionBlock:(id)a3;
- (void)setUserRejectedValidationResolutionBlock:(id)a3;
@end

@implementation VoiceOverCommandProfileValidationPresenter

+ (id)presenterWithValidation:(id)a3
{
  id v3 = a3;
  id v4 = [[VoiceOverCommandProfileValidationPresenter alloc] _initWithValidation:v3];

  return v4;
}

- (id)_initWithValidation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VoiceOverCommandProfileValidationPresenter;
  v6 = [(VoiceOverCommandProfileValidationPresenter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_validation, a3);
  }

  return v7;
}

- (void)presentWithController:(id)a3
{
  id v4 = a3;
  id v5 = [(VOSCommandProfileValidation *)self->_validation localizedErrorTitle];
  v6 = [(VOSCommandProfileValidation *)self->_validation localizedErrorMessage];
  v7 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  v8 = settingsLocString(@"vo.cancel", @"VoiceOverSettings");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __68__VoiceOverCommandProfileValidationPresenter_presentWithController___block_invoke;
  v13[3] = &unk_208B68;
  v13[4] = self;
  objc_super v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:v13];

  [v7 addAction:v9];
  if (([(VOSCommandProfileValidation *)self->_validation isGestureAssignedToOtherCommand] & 1) != 0|| [(VOSCommandProfileValidation *)self->_validation isKeyboardShortcutAssignedToOtherCommand])
  {
    v10 = settingsLocString(@"vo.assign", @"VoiceOverSettings");
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __68__VoiceOverCommandProfileValidationPresenter_presentWithController___block_invoke_2;
    v12[3] = &unk_208B68;
    v12[4] = self;
    v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v12];

    [v7 addAction:v11];
  }
  [v4 presentViewController:v7 animated:1 completion:0];
}

void __68__VoiceOverCommandProfileValidationPresenter_presentWithController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userRejectedValidationResolutionBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) userRejectedValidationResolutionBlock];
    v3[2]();
  }
}

void __68__VoiceOverCommandProfileValidationPresenter_presentWithController___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userAcceptedValidationResolutionBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) userAcceptedValidationResolutionBlock];
    v3[2]();
  }
}

- (id)userAcceptedValidationResolutionBlock
{
  return self->_userAcceptedValidationResolutionBlock;
}

- (void)setUserAcceptedValidationResolutionBlock:(id)a3
{
}

- (id)userRejectedValidationResolutionBlock
{
  return self->_userRejectedValidationResolutionBlock;
}

- (void)setUserRejectedValidationResolutionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userRejectedValidationResolutionBlock, 0);
  objc_storeStrong(&self->_userAcceptedValidationResolutionBlock, 0);

  objc_storeStrong((id *)&self->_validation, 0);
}

@end