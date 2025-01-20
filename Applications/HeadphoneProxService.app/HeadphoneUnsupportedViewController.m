@interface HeadphoneUnsupportedViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService34HeadphoneUnsupportedViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HeadphoneUnsupportedViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100068E08();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService34HeadphoneUnsupportedViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = &self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService34HeadphoneUnsupportedViewController_viewModel];
  uint64_t v7 = type metadata accessor for HeadphoneViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = &self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService34HeadphoneUnsupportedViewController_presenter];
  *(void *)v8 = 0;
  *((void *)v8 + 1) = 0;
  self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService34HeadphoneUnsupportedViewController_type] = 24;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return [(SoftwareUpdateRequiredViewController *)&v10 initWithContentView:a3];
}

- (void).cxx_destruct
{
  sub_100069410((uint64_t)self + OBJC_IVAR____TtC20HeadphoneProxService34HeadphoneUnsupportedViewController_viewModel);

  swift_unknownObjectRelease();
}

@end