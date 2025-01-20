@interface HearingAidTuningVoiceEntertainmentController
- (_TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController)initWithCoder:(id)a3;
- (_TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)hearingBoostEnabled;
- (id)specifiers;
- (id)swipeToGainEnabled;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)setHearingBoostWithEnabled:(id)a3;
- (void)setSwipeToGainEnabledWithEnabled:(id)a3;
- (void)viewDidLoad;
@end

@implementation HearingAidTuningVoiceEntertainmentController

- (_TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController *)HearingAidTuningVoiceEntertainmentController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_25124AA04();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_251247FAC();
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = sub_25124862C();

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

- (id)hearingBoostEnabled
{
  v2 = self;
  id result = sub_251247A70();
  if (result)
  {
    id v4 = result;
    uint64_t v5 = (void *)sub_25126BD68();

    sub_25126BE18();
    int v7 = v6;

    id v8 = objc_allocWithZone(NSNumber);
    LODWORD(v9) = v7;
    id v10 = objc_msgSend(v8, sel_initWithFloat_, v9);

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setHearingBoostWithEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_251247A70();
  if (v6)
  {
    int v7 = v6;
    id v8 = (id)sub_25126BD68();

    objc_msgSend(v4, sel_floatValue);
    sub_25126BE28();
  }
  else
  {
    __break(1u);
  }
}

- (id)swipeToGainEnabled
{
  v2 = self;
  id result = sub_251247A70();
  if (result)
  {
    id v4 = result;
    uint64_t v5 = (void *)sub_25126BD68();

    sub_25126BED8();
    id v6 = (void *)sub_251253C48();

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setSwipeToGainEnabledWithEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_251247A70();
  if (v6)
  {
    int v7 = v6;
    id v8 = (id)sub_25126BD68();

    objc_msgSend(v4, sel_BOOLValue);
    sub_25126BEE8();
  }
  else
  {
    __break(1u);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_25126BBB8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25126BB88();
  id v11 = a3;
  v12 = self;
  id v13 = sub_25124A4E4((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v13;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI44HearingAidTuningVoiceEntertainmentController__headphoneDevice));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end