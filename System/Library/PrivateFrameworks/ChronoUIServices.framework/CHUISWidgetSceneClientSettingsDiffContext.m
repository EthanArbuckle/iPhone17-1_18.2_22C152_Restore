@interface CHUISWidgetSceneClientSettingsDiffContext
- (CHUISWidgetSceneClientSettings)currClientSettings;
- (CHUISWidgetSceneClientSettings)prevClientSettings;
- (CHUISWidgetSceneClientSettingsDiffContext)initWithPreviousClientSettings:(id)a3 currentClientSettings:(id)a4 transitionContext:(id)a5;
- (FBSSceneTransitionContext)transitionContext;
@end

@implementation CHUISWidgetSceneClientSettingsDiffContext

- (CHUISWidgetSceneClientSettingsDiffContext)initWithPreviousClientSettings:(id)a3 currentClientSettings:(id)a4 transitionContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CHUISWidgetSceneClientSettingsDiffContext;
  v12 = [(CHUISWidgetSceneClientSettingsDiffContext *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_prevClientSettings, a3);
    objc_storeStrong((id *)&v13->_currClientSettings, a4);
    uint64_t v14 = [v11 copy];
    transitionContext = v13->_transitionContext;
    v13->_transitionContext = (FBSSceneTransitionContext *)v14;
  }
  return v13;
}

- (CHUISWidgetSceneClientSettings)prevClientSettings
{
  return self->_prevClientSettings;
}

- (CHUISWidgetSceneClientSettings)currClientSettings
{
  return self->_currClientSettings;
}

- (FBSSceneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_currClientSettings, 0);

  objc_storeStrong((id *)&self->_prevClientSettings, 0);
}

@end