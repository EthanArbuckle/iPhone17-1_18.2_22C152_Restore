@interface InfiniteScrollFooterView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider24InfiniteScrollFooterView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider24InfiniteScrollFooterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation InfiniteScrollFooterView

- (_TtC18ASMessagesProvider24InfiniteScrollFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider24InfiniteScrollFooterView *)sub_5403C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider24InfiniteScrollFooterView)initWithCoder:(id)a3
{
  result = (_TtC18ASMessagesProvider24InfiniteScrollFooterView *)sub_77EB20();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = self;
  id v5 = [(InfiniteScrollFooterView *)v4 traitCollection];
  if (qword_94F568 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_77B1F0();
  sub_FDF4(v6, (uint64_t)qword_9B3E60);
  sub_77B760();
  sub_FD50(&qword_951820);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_78FCC0;
  *(void *)(v7 + 32) = v5;
  id v8 = v5;
  v9 = (void *)sub_77B770();
  sub_77AC50();
  double v11 = v10;

  double v12 = width;
  double v13 = v11;
  result.height = v13;
  result.CGFloat width = v12;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(InfiniteScrollFooterView *)v2 traitCollection];
  if (qword_94F568 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_77B1F0();
  sub_FDF4(v4, (uint64_t)qword_9B3E60);
  sub_77B760();
  sub_FD50(&qword_951820);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_78FCC0;
  *(void *)(v5 + 32) = v3;
  id v6 = v3;
  uint64_t v7 = (void *)sub_77B770();
  sub_77AC50();
  double v9 = v8;

  double v10 = UIViewNoIntrinsicMetric;
  double v11 = v9;
  result.height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)swift_getObjectType();
  v2 = (char *)v17.receiver;
  [(InfiniteScrollFooterView *)&v17 layoutSubviews];
  objc_msgSend(v2, "bounds", v17.receiver, v17.super_class);
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider24InfiniteScrollFooterView_activityIndicator];
  objc_msgSend(v11, "sizeThatFits:", v7, v9);
  double v13 = v12;
  double v15 = v14;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.CGFloat width = v8;
  v18.size.height = v10;
  CGFloat v16 = CGRectGetMidX(v18) - v13 * 0.5;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.CGFloat width = v8;
  v19.size.height = v10;
  objc_msgSend(v11, "setFrame:", v16, CGRectGetMidY(v19) - v15 * 0.5, v13, v15);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(InfiniteScrollFooterView *)&v3 prepareForReuse];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC18ASMessagesProvider24InfiniteScrollFooterView_activityIndicator], "stopAnimating", v3.receiver, v3.super_class);
}

- (void)willMoveToWindow:(id)a3
{
}

- (void)willMoveToSuperview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider24InfiniteScrollFooterView_activityIndicator));
}

@end