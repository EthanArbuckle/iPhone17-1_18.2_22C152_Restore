@interface EmptyStateView
- (_TtC20ProductPageExtension14EmptyStateView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension14EmptyStateView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EmptyStateView

- (_TtC20ProductPageExtension14EmptyStateView)initWithFrame:(CGRect)a3
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for EmptyStateView());
  v4 = sub_10070FFFC(0, 0, 0, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC20ProductPageExtension14EmptyStateView *)v4;
}

- (_TtC20ProductPageExtension14EmptyStateView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1007112F8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100710A34();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension14EmptyStateView_divider));
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension14EmptyStateView_descriptionTextSpace;
  uint64_t v4 = sub_1007797E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension14EmptyStateView_titleLabel));
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension14EmptyStateView_descriptionLabel);
}

@end