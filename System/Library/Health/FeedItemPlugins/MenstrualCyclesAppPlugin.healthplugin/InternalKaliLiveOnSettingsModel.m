@interface InternalKaliLiveOnSettingsModel
- (_TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel)init;
- (void)sleepStore:(id)a3 sleepScheduleDidChange:(id)a4;
- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4;
@end

@implementation InternalKaliLiveOnSettingsModel

- (_TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel)init
{
  return (_TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel *)sub_2413C3ED0();
}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2413CB514((uint64_t)&unk_26F571430, (uint64_t)sub_2413CBE24, (uint64_t)&unk_26F571448);
}

- (void)sleepStore:(id)a3 sleepScheduleDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2413CB514((uint64_t)&unk_26F5713E0, (uint64_t)sub_2413CB828, (uint64_t)&unk_26F5713F8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel_wristTemperatureMeasurementsStatusManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel_sleepMeasurementConfigurationProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel_sleepStore));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31InternalKaliLiveOnSettingsModel__requirements;
  sub_2413CBCEC(0, &qword_268CFE998, (uint64_t (*)(uint64_t))sub_2413C3BE4, MEMORY[0x263EFDE58]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end