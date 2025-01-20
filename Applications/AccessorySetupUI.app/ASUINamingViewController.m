@interface ASUINamingViewController
- (_TtC16AccessorySetupUI24ASUINamingViewController)initWithContentView:(id)a3;
- (void)textFieldDidChange;
- (void)viewDidLoad;
@end

@implementation ASUINamingViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ASUINamingViewController *)&v3 viewDidLoad];
  [v2 setDismissalType:1];
}

- (void)textFieldDidChange
{
  id v2 = self;
  sub_100025FD4();
}

- (_TtC16AccessorySetupUI24ASUINamingViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  v5 = (_TtC16AccessorySetupUI24ASUINamingViewController *)sub_1000264C0((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  sub_10000CBC4(*(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_routingContext], *(void *)&self->type[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_routingContext], *(void *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_routingContext + 7]);
  sub_10000CC2C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_router]);

  objc_super v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_device];
}

@end