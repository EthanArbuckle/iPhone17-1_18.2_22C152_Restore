@interface DividerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension11DividerView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension11DividerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DividerView

- (_TtC20ProductPageExtension11DividerView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension11DividerView *)sub_1005A52FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension11DividerView)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC20ProductPageExtension11DividerView_separatorInset);
  long long v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  _OWORD *v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v4[1] = v5;
  uint64_t v6 = OBJC_IVAR____TtC20ProductPageExtension11DividerView_style;
  uint64_t v7 = qword_100949288;
  id v8 = a3;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for DividerView.Style(0);
  uint64_t v10 = sub_10000D2C4(v9, (uint64_t)qword_1009AB8E8);
  sub_10020BBF0(v10, (uint64_t)self + v6);

  result = (_TtC20ProductPageExtension11DividerView *)sub_10077D120();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v5 = sub_10077D200();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DividerView.Style(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension11DividerView_style;
  swift_beginAccess();
  sub_10020BBF0((uint64_t)v12, (uint64_t)v11);
  uint64_t v13 = qword_100949280;
  v14 = self;
  if (v13 != -1) {
    swift_once();
  }
  double v15 = floor(*(double *)&qword_1009AB8E0);
  sub_100778FD0();
  sub_1007797E0();
  sub_100779260();
  double v17 = v16;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_10020BCB8((uint64_t)v11);

  double v18 = width;
  double v19 = v15 + v17;
  result.height = v19;
  result.CGFloat width = v18;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005A5788();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension11DividerView_separatorView));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension11DividerView_style;

  sub_10020BCB8((uint64_t)v3);
}

@end