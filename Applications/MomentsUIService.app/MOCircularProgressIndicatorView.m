@interface MOCircularProgressIndicatorView
- (_TtC16MomentsUIService31MOCircularProgressIndicatorView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService31MOCircularProgressIndicatorView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)touchPlayback:(id)a3;
@end

@implementation MOCircularProgressIndicatorView

- (void)layoutSubviews
{
  v2 = self;
  MOCircularProgressIndicatorView.layoutSubviews()();
}

- (void)touchPlayback:(id)a3
{
  uint64_t v4 = one-time initialization token for shared;
  id v5 = a3;
  v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v7 = static MOMusicPlaybackCoordinator.shared;
  v10[3] = type metadata accessor for MOCircularProgressIndicatorView();
  v10[4] = &protocol witness table for MOCircularProgressIndicatorView;
  v10[0] = v6;
  v8 = *(void (**)(void *))(*(void *)v7 + 360);
  v9 = v6;
  v8(v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = MOCircularProgressIndicatorView.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (_TtC16MomentsUIService31MOCircularProgressIndicatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOCircularProgressIndicatorView.init(coder:)();
}

- (_TtC16MomentsUIService31MOCircularProgressIndicatorView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MomentsUIService31MOCircularProgressIndicatorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_borderLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_progressLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_config));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_playButtonConfig));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_blurMaterialView));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_borderPath);
}

@end