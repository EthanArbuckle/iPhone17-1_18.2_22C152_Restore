@interface CRSUIInstrumentClusterSettingsDiffAction
- (CRSUIInstrumentClusterSettingsDiffInspector)instrumentClusterSettingsDiffInspector;
- (id)sceneSettingsGeometryMutationDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)setInstrumentClusterSettingsDiffInspector:(id)a3;
@end

@implementation CRSUIInstrumentClusterSettingsDiffAction

- (id)sceneSettingsGeometryMutationDiffInspector
{
  instrumentClusterSettingsDiffInspector = self->_instrumentClusterSettingsDiffInspector;
  if (!instrumentClusterSettingsDiffInspector)
  {
    v4 = (CRSUIInstrumentClusterSettingsDiffInspector *)objc_opt_new();
    v5 = self->_instrumentClusterSettingsDiffInspector;
    self->_instrumentClusterSettingsDiffInspector = v4;

    [(CRSUIInstrumentClusterSettingsDiffInspector *)self->_instrumentClusterSettingsDiffInspector observeShowETAWithBlock:&__block_literal_global_0];
    [(CRSUIInstrumentClusterSettingsDiffInspector *)self->_instrumentClusterSettingsDiffInspector observeShowCompassWithBlock:&__block_literal_global_2];
    [(CRSUIInstrumentClusterSettingsDiffInspector *)self->_instrumentClusterSettingsDiffInspector observeShowSpeedLimitWithBlock:&__block_literal_global_4_0];
    [(CRSUIInstrumentClusterSettingsDiffInspector *)self->_instrumentClusterSettingsDiffInspector observeItemTypeWithBlock:&__block_literal_global_6_0];
    [(CRSUIInstrumentClusterSettingsDiffInspector *)self->_instrumentClusterSettingsDiffInspector observeItemTypeWithBlock:&__block_literal_global_8];
    instrumentClusterSettingsDiffInspector = self->_instrumentClusterSettingsDiffInspector;
  }
  return instrumentClusterSettingsDiffInspector;
}

void __86__CRSUIInstrumentClusterSettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 = 1;
  a2[3] = 1;
}

void __86__CRSUIInstrumentClusterSettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke_2(uint64_t a1, _WORD *a2)
{
  *a2 = 257;
}

void __86__CRSUIInstrumentClusterSettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke_3(uint64_t a1, unsigned char *a2)
{
  *a2 = 1;
  a2[2] = 1;
}

void __86__CRSUIInstrumentClusterSettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke_4(uint64_t a1, unsigned char *a2)
{
  *a2 = 1;
  a2[4] = 1;
}

void __86__CRSUIInstrumentClusterSettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke_5(uint64_t a1, unsigned char *a2)
{
  *a2 = 1;
  a2[5] = 1;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v14 = v11;
  if ([v14 conformsToProtocol:&unk_26C95C2F0])
  {
    id v15 = v14;
    __int16 v19 = 0;
    int v18 = 0;
    v16 = [(CRSUIInstrumentClusterSettingsDiffAction *)self sceneSettingsGeometryMutationDiffInspector];
    [v16 inspectDiff:v12 withContext:&v18];

    if ((_BYTE)v18)
    {
      id v17 = v15;
      _UISceneSettingsDiffActionPerformChangesWithTransitionContext();
    }
  }
}

uint64_t __154__CRSUIInstrumentClusterSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 41))
  {
    result = objc_opt_respondsToSelector();
    if (result) {
      result = [*(id *)(v1 + 32) updateSceneForNewCompassSetting];
    }
  }
  if (*(unsigned char *)(v1 + 42))
  {
    result = objc_opt_respondsToSelector();
    if (result) {
      result = [*(id *)(v1 + 32) updateSceneForNewSpeedLimitSetting];
    }
  }
  if (*(unsigned char *)(v1 + 44))
  {
    result = objc_opt_respondsToSelector();
    if (result) {
      result = [*(id *)(v1 + 32) updateSceneForNewItemTypeSetting];
    }
  }
  if (*(unsigned char *)(v1 + 43))
  {
    result = objc_opt_respondsToSelector();
    if (result)
    {
      v2 = *(void **)(v1 + 32);
      return [v2 updateSceneForNewItemTypeSetting];
    }
  }
  return result;
}

- (CRSUIInstrumentClusterSettingsDiffInspector)instrumentClusterSettingsDiffInspector
{
  return self->_instrumentClusterSettingsDiffInspector;
}

- (void)setInstrumentClusterSettingsDiffInspector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end