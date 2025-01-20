@interface AirTagAppleIDViewController
- (_TtC18SharingViewService27AirTagAppleIDViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation AirTagAppleIDViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10006D234();
}

- (_TtC18SharingViewService27AirTagAppleIDViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService27AirTagAppleIDViewController_imageName];
  *(void *)v6 = 0;
  *((void *)v6 + 1) = 0;
  v7 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService27AirTagAppleIDViewController_onDoneURL];
  uint64_t v8 = type metadata accessor for URL();
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService27AirTagAppleIDViewController_buttonText];
  *(void *)v9 = 0;
  *((void *)v9 + 1) = 0;
  swift_unknownObjectWeakInit();
  v11.receiver = self;
  v11.super_class = ObjectType;
  return [(AirTagAppleIDViewController *)&v11 initWithContentView:a3];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100012CC4((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService27AirTagAppleIDViewController_onDoneURL]);
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

@end