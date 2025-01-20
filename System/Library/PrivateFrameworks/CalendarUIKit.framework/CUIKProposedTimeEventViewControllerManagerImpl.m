@interface CUIKProposedTimeEventViewControllerManagerImpl
- (UIViewController)viewController;
- (_TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl)init;
- (_TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl)initWithDelegate:(id)a3 proposedTime:(id)a4;
- (void)setViewController:(id)a3;
@end

@implementation CUIKProposedTimeEventViewControllerManagerImpl

- (_TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl)initWithDelegate:(id)a3 proposedTime:(id)a4
{
  uint64_t v5 = sub_1BE06EEE0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE06EEC0();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl_subscribers) = (Class)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl____lazy_storage___viewController) = 0;
  swift_unknownObjectWeakAssign();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)self + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl_proposedTime, v8, v5);
  v9 = (objc_class *)type metadata accessor for CUIKProposedTimeEventViewControllerManagerImpl();
  v12.receiver = self;
  v12.super_class = v9;
  v10 = [(CUIKProposedTimeEventViewControllerManagerImpl *)&v12 init];
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (UIViewController)viewController
{
  v2 = self;
  id v3 = sub_1BDFD4060();

  return (UIViewController *)v3;
}

- (void)setViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl____lazy_storage___viewController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl____lazy_storage___viewController) = (Class)a3;
  id v3 = a3;
}

- (_TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl)init
{
  result = (_TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BDFBE794((uint64_t)self + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl_delegate);
  id v3 = (char *)self + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl_proposedTime;
  uint64_t v4 = sub_1BE06EEE0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl____lazy_storage___viewController);
}

@end