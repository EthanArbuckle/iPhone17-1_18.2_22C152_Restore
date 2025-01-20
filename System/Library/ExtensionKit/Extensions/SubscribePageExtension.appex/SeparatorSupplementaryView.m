@interface SeparatorSupplementaryView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension26SeparatorSupplementaryView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension26SeparatorSupplementaryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SeparatorSupplementaryView

- (_TtC22SubscribePageExtension26SeparatorSupplementaryView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension26SeparatorSupplementaryView *)sub_10052348C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension26SeparatorSupplementaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100523D5C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1005236EC(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3 = sub_10075C370();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  double v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v8 = (objc_class *)type metadata accessor for SeparatorSupplementaryView();
  v21.receiver = self;
  v21.super_class = v8;
  double v9 = self;
  [(SeparatorSupplementaryView *)&v21 layoutSubviews];
  v10 = *(Class *)((char *)&v9->super.super.super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension26SeparatorSupplementaryView_lineView);
  v11 = (char *)v9 + OBJC_IVAR____TtC22SubscribePageExtension26SeparatorSupplementaryView_separator;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v11, v3);
  [(SeparatorSupplementaryView *)v9 bounds];
  sub_10075C300();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  objc_msgSend(v10, "setFrame:", v13, v15, v17, v19);
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension26SeparatorSupplementaryView_separator;
  uint64_t v4 = sub_10075C370();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26SeparatorSupplementaryView_lineView));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension26SeparatorSupplementaryView_lineColor);
}

@end