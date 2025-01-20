@interface ASUINumericComparisonViewController
- (_TtC16AccessorySetupUI35ASUINumericComparisonViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation ASUINumericComparisonViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ASUINumericComparisonViewController *)&v3 viewDidLoad];
  [v2 setDismissalType:1];
}

- (_TtC16AccessorySetupUI35ASUINumericComparisonViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_type] = 6;
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext];
  *(void *)v6 = 0;
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 1;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  *(void *)&self->type[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_router] = 0;
  swift_unknownObjectWeakInit();
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(ASUINumericComparisonViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
  sub_10000CBC4(*(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext], *(void *)&self->type[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext], *(void *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext+ 7]);
  objc_super v3 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_router];

  sub_10000CC2C((uint64_t)v3);
}

@end