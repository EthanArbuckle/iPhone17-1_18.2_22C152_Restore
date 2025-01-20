@interface AppEventView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension12AppEventView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension12AppEventView)initWithFrame:(CGRect)a3;
- (_TtC22SubscribePageExtension16AppEventCardView)accessibilityAppEventCardView;
- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)accessibilityFormattedDateView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)stateChangedFor:(id)a3;
@end

@implementation AppEventView

- (_TtC22SubscribePageExtension12AppEventView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension12AppEventView *)sub_1006EFE60();
}

- (_TtC22SubscribePageExtension12AppEventView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_clickAction;
  uint64_t v6 = sub_10000FB44((uint64_t *)&unk_1009443A0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_initialLongPressLocation;
  *(void *)v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  id v8 = a3;

  result = (_TtC22SubscribePageExtension12AppEventView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_longPressGestureRecognizer);
  v5 = self;
  [v4 removeTarget:v5 action:0];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(AppEventView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_formattedDateView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_appEventCardView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_longPressGestureRecognizer));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_clickAction, &qword_1009443B0);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006ED434();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = type metadata accessor for AppEventCardLayout(0);
  __chkstk_darwin(v4 - 8, v5);
  v7 = (uint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = qword_100930488;
  v9 = self;
  if (v8 != -1) {
    swift_once();
  }
  sub_1006EF53C((uint64_t)&unk_10098FDB8, (uint64_t)v9);
  double v11 = v10;
  v12 = *(Class *)((char *)&v9->super.super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_appEventCardView);
  sub_10019D2E8((uint64_t)v7);
  sub_1006EEE08(v12, v7);
  double v14 = v13;
  double v16 = v15;
  sub_10002202C((uint64_t)v7);

  double v17 = v11 + v16;
  double v18 = v14;
  result.height = v17;
  result.width = v18;
  return result;
}

- (void)stateChangedFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1006ED7E8(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  char v9 = sub_1006EE5E4((uint64_t)v6, v7);

  return v9 & 1;
}

- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC22SubscribePageExtension29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_formattedDateView);
}

- (_TtC22SubscribePageExtension16AppEventCardView)accessibilityAppEventCardView
{
  return (_TtC22SubscribePageExtension16AppEventCardView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_appEventCardView);
}

@end