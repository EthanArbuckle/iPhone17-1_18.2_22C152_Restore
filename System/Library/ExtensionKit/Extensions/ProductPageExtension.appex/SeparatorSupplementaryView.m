@interface SeparatorSupplementaryView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension26SeparatorSupplementaryView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension26SeparatorSupplementaryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SeparatorSupplementaryView

- (_TtC20ProductPageExtension26SeparatorSupplementaryView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension26SeparatorSupplementaryView *)sub_10063798C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension26SeparatorSupplementaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10063825C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_100637BEC(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3 = sub_100770870();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  double v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v7 = (objc_class *)type metadata accessor for SeparatorSupplementaryView();
  v20.receiver = self;
  v20.super_class = v7;
  double v8 = self;
  [(SeparatorSupplementaryView *)&v20 layoutSubviews];
  double v9 = *(Class *)((char *)&v8->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension26SeparatorSupplementaryView_lineView);
  v10 = (char *)v8 + OBJC_IVAR____TtC20ProductPageExtension26SeparatorSupplementaryView_separator;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v10, v3);
  [(SeparatorSupplementaryView *)v8 bounds];
  sub_100770800();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  objc_msgSend(v9, "setFrame:", v12, v14, v16, v18);
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension26SeparatorSupplementaryView_separator;
  uint64_t v4 = sub_100770870();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26SeparatorSupplementaryView_lineView));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension26SeparatorSupplementaryView_lineColor);
}

@end