@interface FBKActionMenuController
- (_TtC12FeedbackCore23FBKActionMenuController)init;
- (_TtC12FeedbackCore23FBKActionMenuController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5;
- (id)buildMenu;
- (void)addAction:(id)a3;
- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5;
- (void)attachToBarButtonItem:(id)a3;
@end

@implementation FBKActionMenuController

- (_TtC12FeedbackCore23FBKActionMenuController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5
{
  return (_TtC12FeedbackCore23FBKActionMenuController *)sub_22A43B1C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_22A439CC0);
}

- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
}

- (void)addAction:(id)a3
{
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore23FBKActionMenuController_actions);
  swift_beginAccess();
  id v6 = a3;
  v7 = self;
  MEMORY[0x22A6C9260]();
  if (*(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_22A4B3658();
  }
  sub_22A4B3678();
  sub_22A4B3648();
  swift_endAccess();
}

- (id)buildMenu
{
  v2 = self;
  v3 = (void *)sub_22A43A014();

  return v3;
}

- (void)attachToBarButtonItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (id)sub_22A43A014();
  objc_msgSend(v4, sel_setMenu_, v6);
}

- (_TtC12FeedbackCore23FBKActionMenuController)init
{
  result = (_TtC12FeedbackCore23FBKActionMenuController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end