@interface SessionItemView
- (_TtC13MediaControls15SessionItemView)initWithCoder:(id)a3;
- (_TtC13MediaControls15SessionItemView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)updateFonts;
@end

@implementation SessionItemView

- (void)dealloc
{
  v2 = self;
  sub_1AE91115C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_symbolImageView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_accessoryContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_accessoryImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_accessoryPackageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_equalizerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView____lazy_storage___labelsVStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView____lazy_storage___centerHStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_contentView));
  sub_1AE9162D8((uint64_t)self + OBJC_IVAR____TtC13MediaControls15SessionItemView_viewModel, type metadata accessor for SessionItemViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_symbolConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_absoluteVolumeView));
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls15SessionItemView_stylingProvider);
}

- (_TtC13MediaControls15SessionItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AE915AB0();
}

- (void)updateFonts
{
  v2 = self;
  sub_1AE9156F0();
}

- (_TtC13MediaControls15SessionItemView)initWithFrame:(CGRect)a3
{
  result = (_TtC13MediaControls15SessionItemView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end