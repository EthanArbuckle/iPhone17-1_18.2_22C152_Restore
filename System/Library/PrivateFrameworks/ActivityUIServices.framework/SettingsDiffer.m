@interface SettingsDiffer
- (_TtC18ActivityUIServices14SettingsDiffer)init;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
@end

@implementation SettingsDiffer

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  v21[1] = *MEMORY[0x263EF8340];
  if (a5)
  {
    sub_23C982110();
    id v14 = a3;
    id v15 = a4;
    id v16 = a6;
    id v17 = a7;
    v18 = self;
    id v19 = a5;
    v21[0] = sub_23C991220();
    [(FBSSettingsDiffInspector *)v18 inspectDiff:v19 withContext:v21];
    v20 = (void *)v21[0];
  }
}

- (_TtC18ActivityUIServices14SettingsDiffer)init
{
  uint64_t v3 = OBJC_IVAR____TtC18ActivityUIServices14SettingsDiffer_subjects;
  v4 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)sub_23C96A028(MEMORY[0x263F8EE78]);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SettingsDiffer();
  return [(FBSSceneSettingsDiffInspector *)&v6 init];
}

- (void).cxx_destruct
{
}

@end