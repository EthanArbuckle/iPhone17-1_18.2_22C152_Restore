@interface HPSAdaptiveVolumeSliderCell
- (_TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell)initWithCoder:(id)a3;
- (_TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation HPSAdaptiveVolumeSliderCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1E4C8059C(a3);
}

- (_TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_1E4CBF1F0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell *)sub_1E4C814FC(a3, v7, v9, a5);
}

- (_TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1E4CBF1F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_listeners) = (Class)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice) = 0;
  if (v7)
  {
    uint64_t v8 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for HPSAdaptiveVolumeSliderCell();
  uint64_t v9 = [(HPSAdaptiveVolumeSliderCell *)&v11 initWithStyle:a3 reuseIdentifier:v8];

  return v9;
}

- (_TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_listeners) = (Class)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HPSAdaptiveVolumeSliderCell();
  return [(HPSAdaptiveVolumeSliderCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice);
}

@end