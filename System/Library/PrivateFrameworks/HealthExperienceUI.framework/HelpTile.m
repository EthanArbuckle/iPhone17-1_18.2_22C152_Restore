@interface HelpTile
- (_TtC18HealthExperienceUI8HelpTile)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI8HelpTile)initWithFrame:(CGRect)a3;
- (void)actionTapped;
- (void)dismissTapped;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HelpTile

- (_TtC18HealthExperienceUI8HelpTile)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI8HelpTile *)sub_1AD4241D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI8HelpTile)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD4269AC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD424498(a3);
}

- (void)actionTapped
{
  id v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18HealthExperienceUI8HelpTile_actionHandler);
  swift_beginAccess();
  uint64_t v4 = *v3;
  swift_beginAccess();
  id v5 = *(void (**)(uint64_t))(v4 + 16);
  v6 = self;
  uint64_t v7 = swift_retain();
  v5(v7);

  swift_release();
}

- (void)dismissTapped
{
  id v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18HealthExperienceUI8HelpTile_actionHandler);
  swift_beginAccess();
  uint64_t v4 = *v3;
  swift_beginAccess();
  id v5 = *(void (**)(uint64_t))(v4 + 32);
  v6 = self;
  uint64_t v7 = swift_retain();
  v5(v7);

  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI8HelpTile_viewModel);
  uint64_t v4 = *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC18HealthExperienceUI8HelpTile_viewModel);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity
                  + OBJC_IVAR____TtC18HealthExperienceUI8HelpTile_viewModel);
  sub_1AD424018(v3, v4, v5);
}

@end