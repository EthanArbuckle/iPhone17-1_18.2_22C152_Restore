@interface NotificationSettingsSharingCell
- (_TtC18HealthExperienceUI31NotificationSettingsSharingCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI31NotificationSettingsSharingCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation NotificationSettingsSharingCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1AD73CDB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73CD90();
  v8 = self;
  sub_1AD306614((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC18HealthExperienceUI31NotificationSettingsSharingCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31NotificationSettingsSharingCell_item;
  uint64_t v9 = (objc_class *)type metadata accessor for NotificationSettingsSharingCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[NotificationSettingsSharingCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI31NotificationSettingsSharingCell)initWithCoder:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31NotificationSettingsSharingCell_item;
  uint64_t v6 = (objc_class *)type metadata accessor for NotificationSettingsSharingCell();
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(NotificationSettingsSharingCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end