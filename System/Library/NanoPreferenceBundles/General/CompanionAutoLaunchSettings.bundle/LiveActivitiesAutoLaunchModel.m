@interface LiveActivitiesAutoLaunchModel
- (_TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel)init;
- (void)dataSourceDidUpdate:(id)a3;
- (void)dealloc;
- (void)settingsModel:(id)a3 didAddSettings:(id)a4;
- (void)settingsModel:(id)a3 didChangeGlobalSettings:(id)a4;
- (void)settingsModel:(id)a3 didRemoveSettings:(id)a4;
- (void)settingsModel:(id)a3 didUpdateSettings:(id)a4;
- (void)twoWaySyncSettingDidUpdate:(id)a3;
@end

@implementation LiveActivitiesAutoLaunchModel

- (void)settingsModel:(id)a3 didAddSettings:(id)a4
{
}

- (void)settingsModel:(id)a3 didUpdateSettings:(id)a4
{
}

- (void)settingsModel:(id)a3 didRemoveSettings:(id)a4
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = self;
  v10[4] = sub_DABC;
  v10[5] = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_7040;
  v10[3] = &unk_35C60;
  v7 = _Block_copy(v10);
  v8 = self;
  id v9 = a3;
  swift_release();
  BSDispatchMain();
  _Block_release(v7);
}

- (void)settingsModel:(id)a3 didChangeGlobalSettings:(id)a4
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = self;
  v10[4] = sub_DABC;
  v10[5] = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_7040;
  v10[3] = &unk_35C10;
  v7 = _Block_copy(v10);
  v8 = self;
  id v9 = a3;
  swift_unknownObjectRetain();
  swift_release();
  BSDispatchMain();
  _Block_release(v7);

  swift_unknownObjectRelease();
}

- (_TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel)init
{
  return (_TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel *)sub_9F58();
}

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_remoteInstalledAppDataSource);
  v4 = self;
  if (v3) {
    [v3 invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LiveActivitiesAutoLaunchModel();
  [(LiveActivitiesAutoLaunchModel *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_remoteInstalledAppDataSource));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_appSpecificSettings);
}

- (void)dataSourceDidUpdate:(id)a3
{
  v4 = *(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & (uint64_t)self->super.isa) + 16];
  id v5 = a3;
  uint64_t v6 = self;
  v7 = (void *)v4();
  id v8 = [v7 globalSettings];

  sub_A22C((uint64_t)v8);

  swift_unknownObjectRelease();
}

- (void)twoWaySyncSettingDidUpdate:(id)a3
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_D120((unint64_t *)&qword_3BAD0, v5, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
  id v6 = a3;
  v7 = self;
  sub_279C0();
  sub_279D0();

  swift_release();
}

@end