@interface WelcomeArtworkView
- (_TtC12GameCenterUI18WelcomeArtworkView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI18WelcomeArtworkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WelcomeArtworkView

- (_TtC12GameCenterUI18WelcomeArtworkView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI18WelcomeArtworkView *)sub_1AF56A204(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF56ADA4();
}

- (_TtC12GameCenterUI18WelcomeArtworkView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF56B3DC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView_achievementsImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView_dogImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView_leaderboardsImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView_manImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView_robotImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView_womanImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView____lazy_storage___manCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView____lazy_storage___manCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView____lazy_storage___dogCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView____lazy_storage___dogCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView____lazy_storage___achievementsCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView____lazy_storage___achievementsCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView____lazy_storage___womanCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView____lazy_storage___womanCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView____lazy_storage___robotCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView____lazy_storage___robotCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView____lazy_storage___leaderboardsCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView____lazy_storage___leaderboardsCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView____lazy_storage___logoCenterYConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView_logoImageView);
}

@end