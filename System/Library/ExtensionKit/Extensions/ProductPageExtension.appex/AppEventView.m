@interface AppEventView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension12AppEventView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension12AppEventView)initWithFrame:(CGRect)a3;
- (_TtC20ProductPageExtension16AppEventCardView)accessibilityAppEventCardView;
- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)accessibilityFormattedDateView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)stateChangedFor:(id)a3;
@end

@implementation AppEventView

- (_TtC20ProductPageExtension12AppEventView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension12AppEventView *)sub_1002431C4();
}

- (_TtC20ProductPageExtension12AppEventView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension12AppEventView_clickAction;
  uint64_t v6 = sub_10000D280(&qword_10095FAE0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension12AppEventView_initialLongPressLocation;
  *(void *)v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  id v8 = a3;

  result = (_TtC20ProductPageExtension12AppEventView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension12AppEventView_longPressGestureRecognizer);
  v5 = self;
  [v4 removeTarget:v5 action:0];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(AppEventView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension12AppEventView_formattedDateView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension12AppEventView_appEventCardView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension12AppEventView_longPressGestureRecognizer));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension12AppEventView_clickAction, &qword_10095BF20);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100240798();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = type metadata accessor for AppEventCardLayout(0);
  __chkstk_darwin(v4 - 8);
  objc_super v6 = (uint64_t *)((char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = qword_100948F08;
  id v8 = self;
  if (v7 != -1) {
    swift_once();
  }
  sub_1002428A0((uint64_t)&unk_1009AAC38, (uint64_t)v8);
  double v10 = v9;
  v11 = *(Class *)((char *)&v8->super.super.super.isa
                 + OBJC_IVAR____TtC20ProductPageExtension12AppEventView_appEventCardView);
  sub_10014EA34((uint64_t)v6);
  sub_10024216C(v11, v6);
  double v13 = v12;
  double v15 = v14;
  sub_100022A74((uint64_t)v6);

  double v16 = v10 + v15;
  double v17 = v13;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)stateChangedFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100240B4C(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_100241948((uint64_t)v6, v7);

  return v9 & 1;
}

- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC20ProductPageExtension29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension12AppEventView_formattedDateView);
}

- (_TtC20ProductPageExtension16AppEventCardView)accessibilityAppEventCardView
{
  return (_TtC20ProductPageExtension16AppEventCardView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC20ProductPageExtension12AppEventView_appEventCardView));
}

@end