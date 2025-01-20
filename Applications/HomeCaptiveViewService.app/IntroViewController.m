@interface IntroViewController
- (_TtC22HomeCaptiveViewService19IntroViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation IntroViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100002D10();
}

- (_TtC22HomeCaptiveViewService19IntroViewController)initWithContentView:(id)a3
{
  swift_unknownObjectWeakInit();
  v5 = &self->PRXIconContentViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_deviceName];
  v6 = (objc_class *)type metadata accessor for IntroViewController();
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(IntroViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

@end