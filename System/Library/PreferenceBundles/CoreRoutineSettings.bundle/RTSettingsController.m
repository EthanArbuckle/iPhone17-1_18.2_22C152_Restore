@interface RTSettingsController
- (_TtC19CoreRoutineSettings20RTSettingsController)init;
@end

@implementation RTSettingsController

- (_TtC19CoreRoutineSettings20RTSettingsController)init
{
  return (_TtC19CoreRoutineSettings20RTSettingsController *)sub_C648();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_routineManager));

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_sessionStartDate));
  v3 = (char *)self + OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController__settingsDetails;
  uint64_t v4 = sub_273C((uint64_t *)&unk_21CD8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_queue);
}

@end