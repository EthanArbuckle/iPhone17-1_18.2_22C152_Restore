@interface ASUIMigrationViewController
- (_TtC16AccessorySetupUI27ASUIMigrationViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation ASUIMigrationViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ASUIMigrationViewController *)&v3 viewDidLoad];
  [v2 setDismissalType:1];
}

- (_TtC16AccessorySetupUI27ASUIMigrationViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI27ASUIMigrationViewController_type] = 12;
  *(void *)&self->type[OBJC_IVAR____TtC16AccessorySetupUI27ASUIMigrationViewController_router] = 0;
  swift_unknownObjectWeakInit();
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI27ASUIMigrationViewController_routingContext];
  *(void *)v6 = 0;
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 1;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(ASUIMigrationViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end