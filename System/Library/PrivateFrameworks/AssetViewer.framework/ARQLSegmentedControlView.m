@interface ARQLSegmentedControlView
- (_TtC11AssetViewer24ARQLSegmentedControlView)initWithCoder:(id)a3;
- (_TtC11AssetViewer24ARQLSegmentedControlView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ARQLSegmentedControlView

- (_TtC11AssetViewer24ARQLSegmentedControlView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC11AssetViewer24ARQLSegmentedControlView_visualEffectView;
  id v6 = objc_allocWithZone((Class)ASVBlurredBackgroundView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_backgroundStyle_controlStyle_, 0, 0, 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11AssetViewer24ARQLSegmentedControlView_controlStyle) = 0;

  result = (_TtC11AssetViewer24ARQLSegmentedControlView *)sub_1E2994D88();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ARQLSegmentedControlView();
  id v2 = v3.receiver;
  [(ARQLSegmentedControlView *)&v3 layoutSubviews];
  sub_1E2962B8C();
}

- (_TtC11AssetViewer24ARQLSegmentedControlView)initWithFrame:(CGRect)a3
{
  result = (_TtC11AssetViewer24ARQLSegmentedControlView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer24ARQLSegmentedControlView_visualEffectView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer24ARQLSegmentedControlView_segmentedControl);
}

@end