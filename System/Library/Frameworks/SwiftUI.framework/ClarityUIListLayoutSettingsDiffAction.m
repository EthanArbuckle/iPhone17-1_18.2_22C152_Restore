@interface ClarityUIListLayoutSettingsDiffAction
- (_TtC7SwiftUI37ClarityUIListLayoutSettingsDiffAction)init;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
@end

@implementation ClarityUIListLayoutSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = self;
  specialized ClarityUIListLayoutSettingsDiffAction._performActions(for:withUpdatedFBSScene:settingsDiff:from:transitionContext:lifecycleActionType:)(a5);
}

- (_TtC7SwiftUI37ClarityUIListLayoutSettingsDiffAction)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7SwiftUI37ClarityUIListLayoutSettingsDiffAction____lazy_storage___diffInspector) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClarityUIListLayoutSettingsDiffAction();
  return [(ClarityUIListLayoutSettingsDiffAction *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUI37ClarityUIListLayoutSettingsDiffAction____lazy_storage___diffInspector));
}

@end