@interface CHUISWidgetSceneSettingsDiffContext
- (CHUISWidgetSceneSettings)currSettings;
- (CHUISWidgetSceneSettings)prevSettings;
- (CHUISWidgetSceneSettingsDiffContext)initWithPreviousSettings:(id)a3 currentSettings:(id)a4 transitionContext:(id)a5;
- (FBSSceneTransitionContext)transitionContext;
@end

@implementation CHUISWidgetSceneSettingsDiffContext

- (CHUISWidgetSceneSettingsDiffContext)initWithPreviousSettings:(id)a3 currentSettings:(id)a4 transitionContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CHUISWidgetSceneSettingsDiffContext;
  v12 = [(CHUISWidgetSceneSettingsDiffContext *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_prevSettings, a3);
    objc_storeStrong((id *)&v13->_currSettings, a4);
    uint64_t v14 = [v11 copy];
    transitionContext = v13->_transitionContext;
    v13->_transitionContext = (FBSSceneTransitionContext *)v14;
  }
  return v13;
}

- (CHUISWidgetSceneSettings)prevSettings
{
  return self->_prevSettings;
}

- (CHUISWidgetSceneSettings)currSettings
{
  return self->_currSettings;
}

- (FBSSceneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_currSettings, 0);

  objc_storeStrong((id *)&self->_prevSettings, 0);
}

@end