@interface ListContentConfigurationHostCell
- (_TtC18HealthExperienceUI32ListContentConfigurationHostCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI32ListContentConfigurationHostCell)initWithFrame:(CGRect)a3;
- (int64_t)tintAdjustmentMode;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)setTintAdjustmentMode:(int64_t)a3;
@end

@implementation ListContentConfigurationHostCell

- (int64_t)tintAdjustmentMode
{
  v2 = self;
  id v3 = sub_1AD702CC8();

  return (int64_t)v3;
}

- (void)setTintAdjustmentMode:(int64_t)a3
{
  v4 = self;
  sub_1AD702FA4(a3);
}

- (_TtC18HealthExperienceUI32ListContentConfigurationHostCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI32ListContentConfigurationHostCell *)ListContentConfigurationHostCell.init(coder:)(a3);
}

- (_TtC18HealthExperienceUI32ListContentConfigurationHostCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI32ListContentConfigurationHostCell *)ListContentConfigurationHostCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1AD73CDB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73CD90();
  v8 = self;
  sub_1AD7044FC((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
}

@end