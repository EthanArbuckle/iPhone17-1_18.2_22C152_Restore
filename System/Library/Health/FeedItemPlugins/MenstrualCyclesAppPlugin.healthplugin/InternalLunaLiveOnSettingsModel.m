@interface InternalLunaLiveOnSettingsModel
- (_TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel)init;
- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4;
- (void)settingsManagerDidUpdateAnalysisSettings:(id)a3;
- (void)sleepStore:(id)a3 sleepScheduleDidChange:(id)a4;
- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4;
@end

@implementation InternalLunaLiveOnSettingsModel

- (_TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel)init
{
  result = (_TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_settingsManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_analysisProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_analysis));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_menstrualCyclesStatusManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_wristTemperatureMeasurementsStatusManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_wristTemperatureInputStatusManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_sleepMeasurementConfigurationProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel_sleepStore));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalLunaLiveOnSettingsModel__requirements;
  sub_2413CBCEC(0, &qword_268CFE998, (uint64_t (*)(uint64_t))sub_2413C3BE4, MEMORY[0x263EFDE58]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2413CB138(v7);
}

- (void)settingsManagerDidUpdateAnalysisSettings:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2413C25BC();
}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2413CB514((uint64_t)&unk_26F5714F8, (uint64_t)sub_2413CBE30, (uint64_t)&unk_26F571510);
}

- (void)sleepStore:(id)a3 sleepScheduleDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2413CB514((uint64_t)&unk_26F5714A8, (uint64_t)sub_2413CB9E4, (uint64_t)&unk_26F5714C0);
}

@end