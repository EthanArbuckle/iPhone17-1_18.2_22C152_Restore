@interface ContactQuickActionView
- (_TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView)initWithCoder:(id)a3;
- (void)buttonTapped:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ContactQuickActionView

- (_TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD661314();
}

- (void)buttonTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD661404();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD66000C(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1AD24D3D8((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView_contactButtonDelegate);
  sub_1AD1E4514(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView_didTapAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView____lazy_storage___contactIconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView____lazy_storage___label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_67EC7A45FB9328F5A1BEF31B99AA524322ContactQuickActionView____lazy_storage___labelWithIconView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end