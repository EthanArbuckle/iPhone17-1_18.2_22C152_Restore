@interface HPSAdaptiveVolumeDetailController
- (_TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController)initWithCoder:(id)a3;
- (_TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)specifiers;
- (void)viewDidLoad;
@end

@implementation HPSAdaptiveVolumeDetailController

- (_TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E4CBF1F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController *)sub_1E4C81B1C(v5, v7, a4);
}

- (_TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_listeners) = (Class)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection) = 0;
  id v4 = a3;

  result = (_TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController *)sub_1E4CBF640();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1E4C8229C();
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = sub_1E4C828A4();

  if (v3)
  {
    id v4 = (void *)sub_1E4CBF290();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end