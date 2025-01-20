@interface MiniPlayerContainerView
- (_TtC11MediaCoreUI23MiniPlayerContainerView)init;
- (_TtC11MediaCoreUI23MiniPlayerContainerView)initWithCoder:(id)a3;
- (_TtC11MediaCoreUI23MiniPlayerContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MiniPlayerContainerView

- (_TtC11MediaCoreUI23MiniPlayerContainerView)init
{
  return (_TtC11MediaCoreUI23MiniPlayerContainerView *)sub_255AB4A20();
}

- (_TtC11MediaCoreUI23MiniPlayerContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_255AB5990();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_255AB4C14();
}

- (_TtC11MediaCoreUI23MiniPlayerContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC11MediaCoreUI23MiniPlayerContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUI23MiniPlayerContainerView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUI23MiniPlayerContainerView_gradientLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MediaCoreUI23MiniPlayerContainerView_contentView);
}

@end