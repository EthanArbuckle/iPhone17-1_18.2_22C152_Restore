@interface InteractionHandlingView.UIViewType
- (_TtCV6Charts23InteractionHandlingView10UIViewType)initWithCoder:(id)a3;
- (_TtCV6Charts23InteractionHandlingView10UIViewType)initWithFrame:(CGRect)a3;
- (void)handleDragGesture:(id)a3;
- (void)handleHover:(id)a3;
@end

@implementation InteractionHandlingView.UIViewType

- (void)handleDragGesture:(id)a3
{
  v4 = a3;
  v5 = self;
  sub_21F7AFFE0(v4);
}

- (void)handleHover:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21F7B0218(v4);
}

- (_TtCV6Charts23InteractionHandlingView10UIViewType)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCV6Charts23InteractionHandlingView10UIViewType_onChanged);
  void *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCV6Charts23InteractionHandlingView10UIViewType_onEnd);
  void *v9 = 0;
  v9[1] = 0;
  uint64_t v10 = OBJC_IVAR____TtCV6Charts23InteractionHandlingView10UIViewType_panDelegate;
  id v11 = objc_allocWithZone((Class)type metadata accessor for InteractionHandlingView.UIViewType.PanDelegate());
  v12 = self;
  *(Class *)((char *)&self->super.super.super.isa + v10) = (Class)objc_msgSend(v11, sel_init);

  v14.receiver = v12;
  v14.super_class = (Class)type metadata accessor for InteractionHandlingView.UIViewType();
  return -[InteractionHandlingView.UIViewType initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
}

- (_TtCV6Charts23InteractionHandlingView10UIViewType)initWithCoder:(id)a3
{
  return (_TtCV6Charts23InteractionHandlingView10UIViewType *)sub_21F7B046C(a3);
}

- (void).cxx_destruct
{
  sub_21F76D5D8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCV6Charts23InteractionHandlingView10UIViewType_onChanged));
  sub_21F76D5D8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCV6Charts23InteractionHandlingView10UIViewType_onEnd));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCV6Charts23InteractionHandlingView10UIViewType_panDelegate);
}

@end