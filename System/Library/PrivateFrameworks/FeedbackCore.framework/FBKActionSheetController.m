@interface FBKActionSheetController
- (BOOL)dismissesOnAction;
- (_TtC12FeedbackCore24FBKActionSheetController)initWithCoder:(id)a3;
- (_TtC12FeedbackCore24FBKActionSheetController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC12FeedbackCore24FBKActionSheetController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12FeedbackCore24FBKActionSheetController)initWithRootViewController:(id)a3;
- (_TtC12FeedbackCore24FBKActionSheetController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5;
- (void)addAction:(id)a3;
- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5;
- (void)setDismissesOnAction:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation FBKActionSheetController

- (BOOL)dismissesOnAction
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController);
  if (v2) {
    LOBYTE(self) = *(unsigned char *)(v2 + OBJC_IVAR____TtC12FeedbackCore25_FBKActionSheetController_dismissesOnAction);
  }
  else {
    __break(1u);
  }
  return (char)self;
}

- (void)setDismissesOnAction:(BOOL)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController);
  if (v3) {
    *(unsigned char *)(v3 + OBJC_IVAR____TtC12FeedbackCore25_FBKActionSheetController_dismissesOnAction) = a3;
  }
  else {
    __break(1u);
  }
}

- (_TtC12FeedbackCore24FBKActionSheetController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5
{
  return (_TtC12FeedbackCore24FBKActionSheetController *)sub_22A43B1C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_22A43A534);
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_22A43A648();
}

- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
}

- (void)addAction:(id)a3
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    id v7 = v3;
    sub_22A43BA28(v5);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC12FeedbackCore24FBKActionSheetController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FBKActionSheetController();
  return [(FBKActionSheetController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC12FeedbackCore24FBKActionSheetController)initWithRootViewController:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBKActionSheetController();
  return [(FBKActionSheetController *)&v5 initWithRootViewController:a3];
}

- (_TtC12FeedbackCore24FBKActionSheetController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_22A4B3458();
    *(Class *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController) = 0;
    id v6 = a4;
    objc_super v7 = (void *)sub_22A4B3418();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController) = 0;
    id v8 = a4;
    objc_super v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBKActionSheetController();
  v9 = [(FBKActionSheetController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC12FeedbackCore24FBKActionSheetController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBKActionSheetController();
  return [(FBKActionSheetController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController));
}

@end