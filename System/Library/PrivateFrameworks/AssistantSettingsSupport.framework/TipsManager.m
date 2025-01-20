@interface TipsManager
+ (_TtC24AssistantSettingsSupport11TipsManager)shared;
- (BOOL)shouldShowTip;
- (_TtC24AssistantSettingsSupport11TipsManager)init;
- (void)configureTipsWithController:(id)a3;
- (void)setShouldShowTip:(BOOL)a3;
@end

@implementation TipsManager

+ (_TtC24AssistantSettingsSupport11TipsManager)shared
{
  if (qword_267F2BA70 != -1) {
    swift_once();
  }
  v2 = (void *)qword_267F2BC88;

  return (_TtC24AssistantSettingsSupport11TipsManager *)v2;
}

- (BOOL)shouldShowTip
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_shouldShowTip;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldShowTip:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_shouldShowTip;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)configureTipsWithController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_220C55244(a3);
}

- (_TtC24AssistantSettingsSupport11TipsManager)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_shouldShowTip) = 0;
  v2 = (char *)self + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_tipToDisplay;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((void *)v2 + 4) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_appleIntelligenceTipObservationTask) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_imageCreateTipObservationTask) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_hostController) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TipsManager();
  return [(TipsManager *)&v4 init];
}

- (void).cxx_destruct
{
  sub_220C54404((uint64_t)self + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_tipToDisplay, &qword_267F2BCC8);
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_hostController);
}

@end