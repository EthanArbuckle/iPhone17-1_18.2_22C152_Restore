@interface WelcomeView
- (_TtC27ActionButtonConfigurationUI11WelcomeView)initWithCoder:(id)a3;
- (_TtC27ActionButtonConfigurationUI11WelcomeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WelcomeView

- (_TtC27ActionButtonConfigurationUI11WelcomeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2473E60D8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2473E5E64();
}

- (_TtC27ActionButtonConfigurationUI11WelcomeView)initWithFrame:(CGRect)a3
{
  result = (_TtC27ActionButtonConfigurationUI11WelcomeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_spacerHeightConstraint));
  swift_bridgeObjectRelease();
}

@end