@interface HearingFlowNavigationController
- (_TtC21HearingModeSettingsUI31HearingFlowNavigationController)initWithCoder:(id)a3;
- (_TtC21HearingModeSettingsUI31HearingFlowNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC21HearingModeSettingsUI31HearingFlowNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC21HearingModeSettingsUI31HearingFlowNavigationController)initWithRootViewController:(id)a3;
- (_TtP21HearingModeSettingsUI25HearingFlowControllerType_)flowController;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setFlowController:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willShowViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation HearingFlowNavigationController

- (_TtP21HearingModeSettingsUI25HearingFlowControllerType_)flowController
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP21HearingModeSettingsUI25HearingFlowControllerType_ *)v2;
}

- (void)setFlowController:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC21HearingModeSettingsUI31HearingFlowNavigationController_flowController);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC21HearingModeSettingsUI31HearingFlowNavigationController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC21HearingModeSettingsUI31HearingFlowNavigationController_flowController) = 0;
  id v4 = a3;

  result = (_TtC21HearingModeSettingsUI31HearingFlowNavigationController *)sub_25126C8B8();
  __break(1u);
  return result;
}

- (void)willShowViewController:(id)a3 animated:(BOOL)a4
{
  if (a3)
  {
    uint64_t v6 = swift_dynamicCastObjCProtocolConditional();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.super.isa) + 0x58);
      id v9 = a3;
      v10 = self;
      objc_msgSend(v7, sel_setFlowController_, v8());

      swift_unknownObjectRelease();
    }
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = self;
  sub_251251530(a3);
  v14 = &unk_27022BAD8;
  uint64_t v9 = swift_dynamicCastObjCProtocolConditional();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)v8->super.super.super.super.super.isa) + 0x58);
    id v7 = v7;
    objc_msgSend(v10, sel_setFlowController_, v11());

    swift_unknownObjectRelease();
    v12.receiver = v8;
    v12.super_class = (Class)type metadata accessor for HearingFlowNavigationController();
    [(HearingFlowNavigationController *)&v12 pushViewController:v7 animated:v4];
  }
  else
  {
    v13.receiver = v8;
    v13.super_class = (Class)type metadata accessor for HearingFlowNavigationController();
    [(HearingFlowNavigationController *)&v13 pushViewController:v7 animated:v4];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HearingFlowNavigationController();
  id v4 = v6.receiver;
  [(HearingFlowNavigationController *)&v6 viewWillDisappear:v3];
  sub_25126BCA8();
  v5 = (void *)sub_25126BC88();
  sub_25126BC78();
}

- (_TtC21HearingModeSettingsUI31HearingFlowNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC21HearingModeSettingsUI31HearingFlowNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21HearingModeSettingsUI31HearingFlowNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC21HearingModeSettingsUI31HearingFlowNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21HearingModeSettingsUI31HearingFlowNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC21HearingModeSettingsUI31HearingFlowNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end