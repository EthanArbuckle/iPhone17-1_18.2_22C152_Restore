@interface FBAActionMenuController
- (_TtC18Feedback_Assistant23FBAActionMenuController)init;
- (_TtC18Feedback_Assistant23FBAActionMenuController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5;
- (id)buildMenu;
- (void)addAction:(id)a3;
- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5;
- (void)attachToBarButtonItem:(id)a3;
@end

@implementation FBAActionMenuController

- (_TtC18Feedback_Assistant23FBAActionMenuController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5
{
  return (_TtC18Feedback_Assistant23FBAActionMenuController *)sub_100078528((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000773E8);
}

- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
}

- (void)addAction:(id)a3
{
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant23FBAActionMenuController_actions);
  swift_beginAccess();
  id v6 = a3;
  v7 = self;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
}

- (id)buildMenu
{
  v2 = self;
  Class v3 = sub_10007773C();

  return v3;
}

- (void)attachToBarButtonItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  Class v6 = sub_10007773C();
  [v4 setMenu:v6];
}

- (_TtC18Feedback_Assistant23FBAActionMenuController)init
{
  result = (_TtC18Feedback_Assistant23FBAActionMenuController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end