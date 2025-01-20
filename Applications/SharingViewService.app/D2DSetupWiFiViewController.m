@interface D2DSetupWiFiViewController
- (_TtC18SharingViewService26D2DSetupWiFiViewController)initWithContentView:(id)a3;
@end

@implementation D2DSetupWiFiViewController

- (_TtC18SharingViewService26D2DSetupWiFiViewController)initWithContentView:(id)a3
{
  *(void *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService26D2DSetupWiFiViewController_imageView] = 0;
  *(void *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService26D2DSetupWiFiViewController_action] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for D2DSetupWiFiViewController();
  return [(D2DSetupBaseViewController *)&v5 initWithContentView:a3];
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService26D2DSetupWiFiViewController_action];
}

@end