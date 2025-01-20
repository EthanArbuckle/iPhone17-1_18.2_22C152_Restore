@interface ContextualContentUnavailableView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider32ContextualContentUnavailableView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider32ContextualContentUnavailableView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ContextualContentUnavailableView

- (_TtC18ASMessagesProvider32ContextualContentUnavailableView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_36742C();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(ContextualContentUnavailableView *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider32ContextualContentUnavailableView_emptyReason];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
  sub_366D38();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider32ContextualContentUnavailableView_emptyReason), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC18ASMessagesProvider32ContextualContentUnavailableView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC18ASMessagesProvider32ContextualContentUnavailableView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32ContextualContentUnavailableView_emptyReason));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider32ContextualContentUnavailableView_queryContext);
}

@end