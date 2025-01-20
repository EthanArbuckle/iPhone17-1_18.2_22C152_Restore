@interface MFContainedCardView
- (_TtC16MagnifierSupport19MFContainedCardView)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport19MFContainedCardView)initWithFrame:(CGRect)a3;
@end

@implementation MFContainedCardView

- (_TtC16MagnifierSupport19MFContainedCardView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport19MFContainedCardView_dynamicConstraints) = (Class)MEMORY[0x263F8EE78];
  id v4 = a3;

  result = (_TtC16MagnifierSupport19MFContainedCardView *)sub_23594A968();
  __break(1u);
  return result;
}

- (_TtC16MagnifierSupport19MFContainedCardView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MagnifierSupport19MFContainedCardView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFContainedCardView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFContainedCardView_footerView));
  swift_bridgeObjectRelease();
}

@end