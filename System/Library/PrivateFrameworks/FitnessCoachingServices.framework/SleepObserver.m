@interface SleepObserver
- (_TtC23FitnessCoachingServices13SleepObserver)init;
- (id)currentCalendar;
- (id)currentDate;
- (void)dealloc;
- (void)sleepDataProviderUserDayDidUpdate;
@end

@implementation SleepObserver

- (void)dealloc
{
  v2 = self;
  sub_1D3B5C408();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_dateProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_duetObserver);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_notificationCenter));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_state);
  unsigned __int8 v4 = self->dateProvider[OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_state];
  sub_1D3B5D33C(v3, v4);
}

- (_TtC23FitnessCoachingServices13SleepObserver)init
{
  result = (_TtC23FitnessCoachingServices13SleepObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)currentDate
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74670);
  MEMORY[0x1F4188790]();
  unsigned __int8 v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1D3C2E3F0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_dateProvider), *(void *)&self->dateProvider[OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_dateProvider + 16]);
  v9 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74970);
  sub_1D3C2E8F0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_1D3C2E3E0();
    sub_1D3B5D398((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  }

  v10 = (void *)sub_1D3C2E3A0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (id)currentCalendar
{
  uint64_t v3 = sub_1D3C2E4D0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_dateProvider), *(void *)&self->dateProvider[OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_dateProvider + 16]);
  uint64_t v7 = self;
  sub_1D3B61294();

  v8 = (void *)sub_1D3C2E470();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

- (void)sleepDataProviderUserDayDidUpdate
{
  v2 = self;
  sub_1D3B5CF74();
}

@end