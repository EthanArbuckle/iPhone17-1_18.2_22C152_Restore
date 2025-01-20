@interface FBSSceneUpdate
- (id)mutableSettings;
- (id)parentUpdate;
- (id)previousSettings;
- (id)settings;
- (id)settingsDiff;
- (id)transitionContext;
- (void)inspect:(id)a3;
@end

@implementation FBSSceneUpdate

- (id)previousSettings
{
  return self->_previousSettings;
}

- (id)settings
{
  return self->_settings;
}

- (id)mutableSettings
{
  return self->_mutableSettings;
}

- (id)transitionContext
{
  return self->_context;
}

- (id)settingsDiff
{
  return self->_diff;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instigatingUpdate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_diff, 0);
  objc_storeStrong((id *)&self->_previousSettings, 0);
  objc_storeStrong((id *)&self->_mutableSettings, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)inspect:(id)a3
{
}

- (id)parentUpdate
{
  return self->_instigatingUpdate;
}

@end