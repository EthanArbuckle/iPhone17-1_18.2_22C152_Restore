@interface HearingAidSettingsViewController
- (_TtC21HearingModeSettingsUI32HearingAidSettingsViewController)initWithCoder:(id)a3;
- (_TtC21HearingModeSettingsUI32HearingAidSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)getPMEMedia:(id)a3;
- (id)getPMEVoice:(id)a3;
- (id)mediaAssistEnabled;
- (id)specifiers;
- (uint64_t)hearingOptionsInControllcenterTapped;
- (void)openHearingAssistFooterLink;
- (void)openMediaAssistFooterLink;
- (void)setMediaAssistWithEnabled:(id)a3;
- (void)setPMEMediaWithEnabled:(id)a3;
- (void)setPMEVoiceWithEnabled:(id)a3;
- (void)useNewTestResultTapped;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HearingAidSettingsViewController

- (_TtC21HearingModeSettingsUI32HearingAidSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC21HearingModeSettingsUI32HearingAidSettingsViewController *)HearingAidSettingsViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC21HearingModeSettingsUI32HearingAidSettingsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_251263BA4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_25126144C();
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = sub_25126260C();

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

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HearingAidSettingsViewController();
  id v4 = v5.receiver;
  [(HearingAidSettingsViewController *)&v5 viewWillAppear:v3];
  objc_msgSend(v4, sel_reloadSpecifiers, v5.receiver, v5.super_class);
}

- (id)mediaAssistEnabled
{
  v2 = self;
  id result = sub_25125EC80();
  if (result)
  {
    id v4 = result;
    sub_25123DFF4(0, &qword_269B2B400);
    objc_super v5 = (void *)sub_25126BD68();

    sub_25126BF48();
    uint64_t v6 = (void *)sub_25126C708();

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setMediaAssistWithEnabled:(id)a3
{
}

- (void)openHearingAssistFooterLink
{
}

- (void)openMediaAssistFooterLink
{
}

- (void)useNewTestResultTapped
{
  v2 = self;
  sub_251262F94();
}

- (id)getPMEMedia:(id)a3
{
  return sub_251263568(self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x263F42910]);
}

- (void)setPMEMediaWithEnabled:(id)a3
{
}

- (id)getPMEVoice:(id)a3
{
  return sub_251263568(self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x263F42920]);
}

- (void)setPMEVoiceWithEnabled:(id)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HearingAidSettingsViewController();
  id v4 = v6.receiver;
  id v5 = [(HearingAidSettingsViewController *)&v6 viewDidDisappear:v3];
  (*(void (**)(id))((*MEMORY[0x263F8EED0] & *v4) + 0x188))(v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__headphoneDevice));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI32HearingAidSettingsViewController__hmsClient));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (uint64_t)hearingOptionsInControllcenterTapped
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF28);
  MEMORY[0x270FA5388](v0 - 8, v1);
  BOOL v3 = (char *)v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25126BB28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  id v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25126BB18();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1) {
    return sub_25123DF98((uint64_t)v3, &qword_269B2AF28);
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v3, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B6A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25126E8B0;
  *(void *)(inited + 32) = sub_25126C488();
  *(void *)(inited + 40) = v11;
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 56) = sub_25126C488();
  *(void *)(inited + 64) = v12;
  *(unsigned char *)(inited + 72) = 1;
  unint64_t v13 = sub_251260F9C(inited);
  id v14 = objc_msgSend(self, sel_defaultWorkspace);
  if (v14)
  {
    v15 = v14;
    v16 = (void *)sub_25126BB08();
    sub_2512630F4(v13);
    swift_bridgeObjectRelease();
    uint64_t v17 = MEMORY[0x263F8D310];
    v18 = (void *)sub_25126C3B8();
    swift_bridgeObjectRelease();
    id v28 = 0;
    unsigned int v19 = objc_msgSend(v15, sel_openSensitiveURL_withOptions_error_, v16, v18, &v28);

    if (v19)
    {
      v20 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
      id v21 = v28;
      return v20(v8, v4);
    }
    else
    {
      id v22 = v28;
      v23 = (void *)sub_25126BAF8();

      swift_willThrow();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B2AF50);
      uint64_t v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_25126E8C0;
      id v28 = 0;
      unint64_t v29 = 0xE000000000000000;
      sub_25126C7E8();
      sub_25126C4D8();
      v27[1] = v23;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B2B6B0);
      sub_25126C898();
      id v25 = v28;
      unint64_t v26 = v29;
      *(void *)(v24 + 56) = v17;
      *(void *)(v24 + 32) = v25;
      *(void *)(v24 + 40) = v26;
      sub_25126C9B8();
      swift_bridgeObjectRelease();

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    return swift_bridgeObjectRelease();
  }
}

@end