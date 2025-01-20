@interface CPTemplateUISceneSettingsDiffAction
- (CPTemplateUISceneSettingsDiffAction)initWithInspectors:(id)a3;
- (NSArray)inspectors;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)setInspectors:(id)a3;
@end

@implementation CPTemplateUISceneSettingsDiffAction

- (CPTemplateUISceneSettingsDiffAction)initWithInspectors:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPTemplateUISceneSettingsDiffAction;
  v6 = [(CPTemplateUISceneSettingsDiffAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_inspectors, a3);
  }

  return v7;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v9 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = [(CPTemplateUISceneSettingsDiffAction *)self inspectors];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) inspectDiff:v9 withContext:0];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (NSArray)inspectors
{
  return self->_inspectors;
}

- (void)setInspectors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end