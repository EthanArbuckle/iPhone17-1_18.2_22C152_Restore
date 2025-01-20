@interface EmptyStateView
- (_TtC22SubscribePageExtension14EmptyStateView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension14EmptyStateView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EmptyStateView

- (_TtC22SubscribePageExtension14EmptyStateView)initWithFrame:(CGRect)a3
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for EmptyStateView());
  v4 = sub_100430ED8(0, 0, 0, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC22SubscribePageExtension14EmptyStateView *)v4;
}

- (_TtC22SubscribePageExtension14EmptyStateView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004321D4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100431910();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14EmptyStateView_divider));
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension14EmptyStateView_descriptionTextSpace;
  uint64_t v4 = sub_100765180();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14EmptyStateView_titleLabel));
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension14EmptyStateView_descriptionLabel);
}

@end