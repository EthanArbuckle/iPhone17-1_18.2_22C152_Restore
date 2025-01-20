@interface CPTemplateApplicationSceneGeometrySettingsDiffAction
- (UIApplicationSceneSettingsDiffInspector)sceneSettingsGeometryMutationDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_updateSceneGeometryWithSettingObserverContext:(id)a3 windowScene:(id)a4 transitionContext:(id)a5;
- (void)setSceneSettingsGeometryMutationDiffInspector:(id)a3;
@end

@implementation CPTemplateApplicationSceneGeometrySettingsDiffAction

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsGeometryMutationDiffInspector
{
  sceneSettingsGeometryMutationDiffInspector = self->_sceneSettingsGeometryMutationDiffInspector;
  if (!sceneSettingsGeometryMutationDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsGeometryMutationDiffInspector;
    self->_sceneSettingsGeometryMutationDiffInspector = v4;

    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsGeometryMutationDiffInspector observeFrameWithBlock:&__block_literal_global_17];
    sceneSettingsGeometryMutationDiffInspector = self->_sceneSettingsGeometryMutationDiffInspector;
  }

  return sceneSettingsGeometryMutationDiffInspector;
}

void __98__CPTemplateApplicationSceneGeometrySettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 = 1;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v10 = a3;
  id v14 = a5;
  id v15 = a7;
  id v11 = v14;
  id v12 = v15;
  id v13 = v10;
  _UISceneSettingsDiffActionPerformActionsWithDelayForTransitionContext();
}

uint64_t __166__CPTemplateApplicationSceneGeometrySettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  unsigned __int8 v4 = 0;
  v2 = [*(id *)(a1 + 32) sceneSettingsGeometryMutationDiffInspector];
  [v2 inspectDiff:*(void *)(a1 + 40) withContext:&v4];

  return [*(id *)(a1 + 32) _updateSceneGeometryWithSettingObserverContext:v4 windowScene:*(void *)(a1 + 48) transitionContext:*(void *)(a1 + 56)];
}

- (void)_updateSceneGeometryWithSettingObserverContext:(id)a3 windowScene:(id)a4 transitionContext:(id)a5
{
  id v6 = a4;
  v7 = v6;
  if (a3.var0)
  {
    id v8 = v6;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContext();
  }
}

void __133__CPTemplateApplicationSceneGeometrySettingsDiffAction__updateSceneGeometryWithSettingObserverContext_windowScene_transitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [v3 _allWindows];
  [v3 _computeMetricsForWindows:v4 animated:a2];
}

- (void)setSceneSettingsGeometryMutationDiffInspector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end