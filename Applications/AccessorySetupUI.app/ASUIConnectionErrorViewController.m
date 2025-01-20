@interface ASUIConnectionErrorViewController
- (_TtC16AccessorySetupUI33ASUIConnectionErrorViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation ASUIConnectionErrorViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  [(ASUIConnectionErrorViewController *)&v2 viewDidLoad];
}

- (_TtC16AccessorySetupUI33ASUIConnectionErrorViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_type] = 11;
  *(void *)&self->type[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_router] = 0;
  swift_unknownObjectWeakInit();
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_routingContext];
  *(void *)v6 = 0;
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 1;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(ASUIConnectionErrorViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end