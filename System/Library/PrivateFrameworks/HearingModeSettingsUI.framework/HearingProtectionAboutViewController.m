@interface HearingProtectionAboutViewController
- (_TtC21HearingModeSettingsUI36HearingProtectionAboutViewController)initWithCoder:(id)a3;
- (_TtC21HearingModeSettingsUI36HearingProtectionAboutViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)getFeatureVersion;
- (id)getUpdateVersion;
- (id)getYearOfRelease;
- (id)specifiers;
- (uint64_t)handleTotalAttenuationLearnMore;
- (void)viewDidLoad;
@end

@implementation HearingProtectionAboutViewController

- (_TtC21HearingModeSettingsUI36HearingProtectionAboutViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_25126C488();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC21HearingModeSettingsUI36HearingProtectionAboutViewController *)sub_2512355EC(v5, v7, a4);
}

- (_TtC21HearingModeSettingsUI36HearingProtectionAboutViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_25123D304();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_25123574C();
}

- (id)getFeatureVersion
{
  v2 = (void *)sub_25126C458();
  return v2;
}

- (id)getUpdateVersion
{
  v2 = self;
  sub_251239164();

  id v3 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)getYearOfRelease
{
  v2 = (void *)sub_25126C458();
  return v2;
}

- (id)specifiers
{
  v2 = self;
  id v3 = sub_25123936C();

  if (v3)
  {
    v4 = (void *)sub_25126C528();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_25126BBB8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25126BB88();
  double v9 = *MEMORY[0x263F839B8];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI36HearingProtectionAboutViewController_headphoneDevice));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (uint64_t)handleTotalAttenuationLearnMore
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF28);
  MEMORY[0x270FA5388](v0 - 8, v1);
  id v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25126BB28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  id v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25126BB18();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1) {
    return sub_25123DF98((uint64_t)v3, &qword_269B2AF28);
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v3, v4);
  id v10 = objc_msgSend(self, sel_sharedApplication);
  uint64_t v11 = (void *)sub_25126BB08();
  sub_251234C8C(MEMORY[0x263F8EE78]);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_25123DA0C(&qword_269B2AF30);
  v12 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_openURL_options_completionHandler_, v11, v12, 0);

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

@end