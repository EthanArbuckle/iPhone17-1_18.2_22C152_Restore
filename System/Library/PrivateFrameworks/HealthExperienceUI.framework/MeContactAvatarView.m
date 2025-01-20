@interface MeContactAvatarView
- (_TtC18HealthExperienceUI19MeContactAvatarView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI19MeContactAvatarView)initWithFrame:(CGRect)a3;
@end

@implementation MeContactAvatarView

- (_TtC18HealthExperienceUI19MeContactAvatarView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18HealthExperienceUI19MeContactAvatarView_defaultAvatarImageSymbolConfiguration;
  v6 = self;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_configurationWithPointSize_weight_scale_, 4, 2, 28.0);

  result = (_TtC18HealthExperienceUI19MeContactAvatarView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI19MeContactAvatarView)initWithFrame:(CGRect)a3
{
  result = (_TtC18HealthExperienceUI19MeContactAvatarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI19MeContactAvatarView_defaultAvatarImageSymbolConfiguration));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI19MeContactAvatarView_publisherImageView);
}

@end