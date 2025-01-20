@interface DBAudioNotificationViewController
- (_TtC9DashBoard33DBAudioNotificationViewController)initWithCoder:(id)a3;
- (_TtC9DashBoard33DBAudioNotificationViewController)initWithEnvironment:(id)a3;
- (_TtC9DashBoard33DBAudioNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)hideNotification;
- (void)loadView;
- (void)updateForService:(id)a3;
- (void)updateInterfaceWithStyle:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation DBAudioNotificationViewController

- (_TtC9DashBoard33DBAudioNotificationViewController)initWithEnvironment:(id)a3
{
  swift_unknownObjectRetain();
  v3 = (_TtC9DashBoard33DBAudioNotificationViewController *)sub_22D7F5280();
  swift_unknownObjectRelease();
  return v3;
}

- (_TtC9DashBoard33DBAudioNotificationViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC9DashBoard33DBAudioNotificationViewController_volumeSlider;
  type metadata accessor for DBVolumeSlider();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_22D81C668();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9DashBoard33DBAudioNotificationViewController_currentVolumeService) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9DashBoard33DBAudioNotificationViewController_currentTimer) = 0;

  result = (_TtC9DashBoard33DBAudioNotificationViewController *)sub_22D85EA28();
  __break(1u);
  return result;
}

- (void)loadView
{
  type metadata accessor for DBAudioView();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  id v5 = objc_msgSend(v3, sel_init);
  [(DBAudioNotificationViewController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2 = self;
  DBAudioNotificationViewController.viewDidLoad()();
}

- (void)updateForService:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DBAudioNotificationViewController.updateFor(service:)(v4);
}

- (void)hideNotification
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9DashBoard33DBAudioNotificationViewController_volumeSlider);
  id v5 = self;
  objc_msgSend(v2, sel_alpha);
  if (v3 > 0.0)
  {
    sub_22D85E758();
    sub_22D7E9754(0, (unint64_t *)&qword_26858A530);
    id v4 = (void *)sub_22D85E868();
    sub_22D85DBB8();

    sub_22D7F3E50(0);
  }
}

- (_TtC9DashBoard33DBAudioNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9DashBoard33DBAudioNotificationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22D7C465C((uint64_t)self + OBJC_IVAR____TtC9DashBoard33DBAudioNotificationViewController_environment);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard33DBAudioNotificationViewController_volumeSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard33DBAudioNotificationViewController_currentVolumeService));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9DashBoard33DBAudioNotificationViewController_currentTimer);
}

- (void)updateInterfaceWithStyle:(int64_t)a3
{
}

@end