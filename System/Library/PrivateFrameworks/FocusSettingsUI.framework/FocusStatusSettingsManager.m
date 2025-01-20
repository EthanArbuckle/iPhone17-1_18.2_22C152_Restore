@interface FocusStatusSettingsManager
- (_TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager)init;
- (void)dealloc;
- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4;
@end

@implementation FocusStatusSettingsManager

- (void)dealloc
{
  if (*((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager_isListeningToModeConfigurationService) == 1)
    objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager_modeConfigurationService), sel_removeListener_, self);
  else {
    v3 = self;
  }
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FocusStatusSettingsManager();
  [(FocusStatusSettingsManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager_modeConfigurationService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager_globalConfigurationService));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager)init
{
  result = (_TtC15FocusSettingsUIP33_505BD96902FEE6013A0D99281DBB05A426FocusStatusSettingsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  id v5 = a3;
  v6 = self;
  sub_220E9A808();
}

@end