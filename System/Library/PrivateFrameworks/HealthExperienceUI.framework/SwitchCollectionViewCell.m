@interface SwitchCollectionViewCell
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (_TtC18HealthExperienceUI24SwitchCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI24SwitchCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)switchTapped;
@end

@implementation SwitchCollectionViewCell

- (_TtC18HealthExperienceUI24SwitchCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI24SwitchCollectionViewCell *)sub_1AD2DF984(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI24SwitchCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD2E2984();
}

- (void)switchTapped
{
  v2 = self;
  sub_1AD2DFBD4();
}

- (BOOL)isHighlighted
{
  return 0;
}

- (BOOL)isSelected
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCollectionViewCell_switchView));
  swift_bridgeObjectRelease();
  sub_1AD206F10((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCollectionViewCell____lazy_storage___imageAccessory, (uint64_t (*)(void))sub_1AD2E2660);
  sub_1AD206F10((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCollectionViewCell____lazy_storage___switchViewAccessory, (uint64_t (*)(void))sub_1AD2E04B0);
}

@end