@interface FBAActionSheetController
- (BOOL)dismissesOnAction;
- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithRootViewController:(id)a3;
- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5;
- (void)addAction:(id)a3;
- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5;
- (void)setDismissesOnAction:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation FBAActionSheetController

- (BOOL)dismissesOnAction
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController);
  if (v2) {
    LOBYTE(self) = *(unsigned char *)(v2 + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_dismissesOnAction);
  }
  else {
    __break(1u);
  }
  return (char)self;
}

- (void)setDismissesOnAction:(BOOL)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController);
  if (v3) {
    *(unsigned char *)(v3 + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_dismissesOnAction) = a3;
  }
  else {
    __break(1u);
  }
}

- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5
{
  return (_TtC18Feedback_Assistant24FBAActionSheetController *)sub_100078528((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100077C80);
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_100077D94();
}

- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
}

- (void)addAction:(id)a3
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    id v7 = v3;
    sub_100078D90(v5);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FBAActionSheetController();
  return [(FBAActionSheetController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithRootViewController:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBAActionSheetController();
  return [(FBAActionSheetController *)&v5 initWithRootViewController:a3];
}

- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController) = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBAActionSheetController();
  v9 = [(FBAActionSheetController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBAActionSheetController();
  return [(FBAActionSheetController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController));
}

@end