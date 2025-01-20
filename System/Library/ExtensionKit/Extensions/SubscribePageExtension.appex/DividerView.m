@interface DividerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension11DividerView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension11DividerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DividerView

- (_TtC22SubscribePageExtension11DividerView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension11DividerView *)sub_1004D67C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension11DividerView)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC22SubscribePageExtension11DividerView_separatorInset);
  long long v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  _OWORD *v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v4[1] = v5;
  uint64_t v6 = OBJC_IVAR____TtC22SubscribePageExtension11DividerView_style;
  uint64_t v7 = qword_100931408;
  id v8 = a3;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for DividerView.Style(0);
  uint64_t v10 = sub_10001076C(v9, (uint64_t)qword_100993420);
  sub_10012A968(v10, (uint64_t)self + v6);

  result = (_TtC22SubscribePageExtension11DividerView *)sub_100768A40();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v5 = sub_100768B20();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DividerView.Style(0);
  __chkstk_darwin(v10, v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension11DividerView_style;
  swift_beginAccess();
  sub_10012A968((uint64_t)v14, (uint64_t)v13);
  uint64_t v15 = qword_100931400;
  v16 = self;
  if (v15 != -1) {
    swift_once();
  }
  double v17 = floor(*(double *)&qword_100993418);
  sub_100764970();
  sub_100765180();
  sub_100764C00();
  double v19 = v18;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  sub_10012AA30((uint64_t)v13);

  double v20 = width;
  double v21 = v17 + v19;
  result.height = v21;
  result.CGFloat width = v20;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004D6C4C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension11DividerView_separatorView));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension11DividerView_style;

  sub_10012AA30((uint64_t)v3);
}

@end