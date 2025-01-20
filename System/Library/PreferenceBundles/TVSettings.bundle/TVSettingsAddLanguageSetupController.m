@interface TVSettingsAddLanguageSetupController
- (TVSettingsAddLanguageSetupController)initWithTopLevelController:(id)a3;
- (TopLevelSettingsController)topLevelController;
- (void)setTopLevelController:(id)a3;
@end

@implementation TVSettingsAddLanguageSetupController

- (TVSettingsAddLanguageSetupController)initWithTopLevelController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVSettingsAddLanguageSetupController;
  v6 = [(TVSettingsAddLanguageSetupController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_topLevelController, a3);
  }

  return v7;
}

- (TopLevelSettingsController)topLevelController
{
  return self->_topLevelController;
}

- (void)setTopLevelController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end