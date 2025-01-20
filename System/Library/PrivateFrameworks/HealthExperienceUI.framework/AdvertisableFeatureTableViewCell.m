@interface AdvertisableFeatureTableViewCell
- (NSString)reuseIdentifier;
- (_TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation AdvertisableFeatureTableViewCell

- (NSString)reuseIdentifier
{
  _s18HealthExperienceUI32AdvertisableFeatureTableViewCellC15reuseIdentifierSSvgZ_0();
  v2 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell *)sub_1AD29AB28(v4, v5);
}

- (_TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell)initWithCoder:(id)a3
{
  uint64_t v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell_baseIdentifier);
  *uint64_t v4 = 0;
  v4[1] = 0;
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell_item;
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell____lazy_storage___featureContentView) = 0;
  id v6 = a3;

  result = (_TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1AD1E1AA8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell____lazy_storage___featureContentView);
}

@end