@interface GroupActivitySharingController
- (BOOL)startStagedActivity;
- (NSString)shareSheetSessionID;
- (_TtC22_GroupActivities_UIKit30GroupActivitySharingController)initWithCoder:(id)a3;
- (_TtC22_GroupActivities_UIKit30GroupActivitySharingController)initWithItemProvider:(id)a3;
- (_TtC22_GroupActivities_UIKit30GroupActivitySharingController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)modalPresentationStyle;
- (void)registerWithResultHandler:(id)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setShareSheetSessionID:(id)a3;
- (void)setStartStagedActivity:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GroupActivitySharingController

- (NSString)shareSheetSessionID
{
  v2 = *(uint64_t (**)(void))((**(void **)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC22_GroupActivities_UIKit30GroupActivitySharingController_controller) & *MEMORY[0x263F8EED0])
                           + 0xC0);
  v3 = self;
  uint64_t v4 = v2();
  uint64_t v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x230F7FB90](v4, v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (void)setShareSheetSessionID:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & **(void **)((char *)&self->super.super.super.isa
                                                                                     + OBJC_IVAR____TtC22_GroupActivities_UIKit30GroupActivitySharingController_controller))
                                               + 0xC8);
  v8 = self;
  v7(v4, v6);
}

- (BOOL)startStagedActivity
{
  v2 = *(uint64_t (**)(void))((**(void **)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC22_GroupActivities_UIKit30GroupActivitySharingController_controller) & *MEMORY[0x263F8EED0])
                           + 0xD8);
  v3 = self;
  char v4 = v2();

  return v4 & 1;
}

- (void)setStartStagedActivity:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = *(void (**)(BOOL))((**(void **)((char *)&self->super.super.super.isa
                                                    + OBJC_IVAR____TtC22_GroupActivities_UIKit30GroupActivitySharingController_controller) & *MEMORY[0x263F8EED0])
                                     + 0xE0);
  uint64_t v5 = self;
  v4(v3);
}

- (int64_t)modalPresentationStyle
{
  return 1;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GroupActivitySharingController();
  [(GroupActivitySharingController *)&v3 setModalPresentationStyle:1];
}

- (_TtC22_GroupActivities_UIKit30GroupActivitySharingController)initWithItemProvider:(id)a3
{
  return (_TtC22_GroupActivities_UIKit30GroupActivitySharingController *)GroupActivitySharingController.init(itemProvider:)(a3);
}

- (_TtC22_GroupActivities_UIKit30GroupActivitySharingController)initWithCoder:(id)a3
{
  return (_TtC22_GroupActivities_UIKit30GroupActivitySharingController *)GroupActivitySharingController.init(coder:)(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  char v4 = self;
  GroupActivitySharingController.viewWillAppear(_:)(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  GroupActivitySharingController.viewDidLoad()();
}

- (_TtC22_GroupActivities_UIKit30GroupActivitySharingController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22_GroupActivities_UIKit30GroupActivitySharingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22_GroupActivities_UIKit30GroupActivitySharingController_controller));
  swift_release();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC22_GroupActivities_UIKit30GroupActivitySharingController__resultValue;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<GroupActivitySharingResult?>);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

- (void)registerWithResultHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  GroupActivitySharingController.registerResultHandler(_:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> (), v5);

  swift_release();
}

@end