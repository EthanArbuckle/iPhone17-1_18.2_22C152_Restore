@interface EmptyStateView
- (_TtC18ASMessagesProvider14EmptyStateView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider14EmptyStateView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EmptyStateView

- (_TtC18ASMessagesProvider14EmptyStateView)initWithFrame:(CGRect)a3
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for EmptyStateView());
  v4 = sub_6B9A00(0, 0, 0, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC18ASMessagesProvider14EmptyStateView *)v4;
}

- (_TtC18ASMessagesProvider14EmptyStateView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_6BACFC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_6BA438();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider14EmptyStateView_divider));
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider14EmptyStateView_descriptionTextSpace;
  uint64_t v4 = sub_77B1F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider14EmptyStateView_titleLabel));
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider14EmptyStateView_descriptionLabel);
}

@end