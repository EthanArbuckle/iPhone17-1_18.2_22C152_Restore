@interface ContentConfigurationHostCell
- (_TtC18HealthExperienceUI28ContentConfigurationHostCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI28ContentConfigurationHostCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)didLongPress:(id)a3;
- (void)layoutSubviews;
@end

@implementation ContentConfigurationHostCell

- (void)layoutSubviews
{
  v2 = self;
  sub_1AD1C154C();
}

- (_TtC18HealthExperienceUI28ContentConfigurationHostCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI28ContentConfigurationHostCell *)ContentConfigurationHostCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1AD73CDB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73CD90();
  v8 = self;
  sub_1AD1DC830((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC18HealthExperienceUI28ContentConfigurationHostCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI28ContentConfigurationHostCell *)ContentConfigurationHostCell.init(coder:)(a3);
}

- (void)didLongPress:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD55376C();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void).cxx_destruct
{
}

@end