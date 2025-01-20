@interface ActionDetailsView
- (_TtC27ActionButtonConfigurationUI17ActionDetailsView)initWithCoder:(id)a3;
- (_TtC27ActionButtonConfigurationUI17ActionDetailsView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)pageControlValueChanged;
@end

@implementation ActionDetailsView

- (_TtC27ActionButtonConfigurationUI17ActionDetailsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24740CDE4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24740C240();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = self;
  v9 = sub_24740CEDC(x, y);

  return v9;
}

- (void)pageControlValueChanged
{
  v2 = self;
  sub_24740C8C0();
}

- (_TtC27ActionButtonConfigurationUI17ActionDetailsView)initWithFrame:(CGRect)a3
{
  result = (_TtC27ActionButtonConfigurationUI17ActionDetailsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2473D81A0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_selectionHandler));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButton));
  swift_bridgeObjectRelease();
}

@end