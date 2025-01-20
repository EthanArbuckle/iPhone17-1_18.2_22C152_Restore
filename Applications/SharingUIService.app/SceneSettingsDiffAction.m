@interface SceneSettingsDiffAction
- (_TtC16SharingUIService23SceneSettingsDiffAction)init;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
@end

@implementation SceneSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  if (a3)
  {
    v13 = self;
    id v14 = a3;
    id v15 = a4;
    id v16 = a5;
    id v18 = a6;
    id v17 = a7;
    if ([v14 delegate])
    {
      type metadata accessor for SceneDelegate();
      if (swift_dynamicCastClass()) {
        sub_1000178B0(v14);
      }

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
  else
  {
    __break(1u);
  }
}

- (_TtC16SharingUIService23SceneSettingsDiffAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneSettingsDiffAction();
  return [(SceneSettingsDiffAction *)&v3 init];
}

@end