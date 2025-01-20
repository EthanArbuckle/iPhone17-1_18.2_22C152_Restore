@interface LockupPlaceholderView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC18ASMessagesProvider21LockupPlaceholderView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider21LockupPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LockupPlaceholderView

- (_TtC18ASMessagesProvider21LockupPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider21LockupPlaceholderView *)sub_19AD24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider21LockupPlaceholderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_19C514();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_19AFEC(v18);
  sub_FB9C(v18, v18[3]);
  sub_77AB10();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v18);
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_19BFA4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21LockupPlaceholderView_iconPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21LockupPlaceholderView_headingPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21LockupPlaceholderView_titlePlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21LockupPlaceholderView_subtitlePlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21LockupPlaceholderView_offerButtonPlaceholder));
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider21LockupPlaceholderView_contentType;
  uint64_t v4 = sub_779650();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end