@interface OBKStyleBulletListItemView
- (_TtC18HealthExperienceUI26OBKStyleBulletListItemView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI26OBKStyleBulletListItemView)initWithFrame:(CGRect)a3;
- (void)buttonWasTapped;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation OBKStyleBulletListItemView

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for OBKStyleBulletListItemView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(OBKStyleBulletListItemView *)&v6 traitCollectionDidChange:v4];
  objc_msgSend(v5, sel_setNeedsUpdateConstraints, v6.receiver, v6.super_class);
}

- (_TtC18HealthExperienceUI26OBKStyleBulletListItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s18HealthExperienceUI26OBKStyleBulletListItemViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)updateConstraints
{
  v2 = self;
  sub_1AD6F9194();
}

- (void)buttonWasTapped
{
  v2 = self;
  sub_1AD6F95C8();
}

- (_TtC18HealthExperienceUI26OBKStyleBulletListItemView)initWithFrame:(CGRect)a3
{
  result = (_TtC18HealthExperienceUI26OBKStyleBulletListItemView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26OBKStyleBulletListItemView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26OBKStyleBulletListItemView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26OBKStyleBulletListItemView_descriptionLabel));
  sub_1AD453B8C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI26OBKStyleBulletListItemView_buttonConfiguration), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI26OBKStyleBulletListItemView_buttonConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26OBKStyleBulletListItemView_button));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end