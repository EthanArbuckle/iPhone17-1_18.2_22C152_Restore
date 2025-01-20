@interface TypicalDayProvider
- (BOOL)enumerateActivitySummariesFromDateComponents:(id)a3 toDateComponents:(id)a4 error:(id *)a5 handler:(id)a6;
- (_TtC23FitnessCoachingServices18TypicalDayProvider)init;
- (id)currentCalendar;
- (id)currentDate;
- (id)firstOnWristDateToday;
@end

@implementation TypicalDayProvider

- (_TtC23FitnessCoachingServices18TypicalDayProvider)init
{
  result = (_TtC23FitnessCoachingServices18TypicalDayProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_dataSource);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_state);
}

- (id)currentDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74670);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1D3C2E3F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_dataSource), *(void *)&self->dataSource[OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_dataSource + 16]);
  __swift_project_boxed_opaque_existential_1((void *)(*v10 + OBJC_IVAR____TtC23FitnessCoachingServices20TypicalDayDataSource_dateProvider), *(void *)(*v10 + OBJC_IVAR____TtC23FitnessCoachingServices20TypicalDayDataSource_dateProvider + 24));
  v11 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74970);
  sub_1D3C2E8F0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1D3C2E3E0();
    sub_1D3B5D398((uint64_t)v5);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
  }

  v12 = (void *)sub_1D3C2E3A0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)currentCalendar
{
  uint64_t v3 = sub_1D3C2E4D0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_dataSource), *(void *)&self->dataSource[OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_dataSource + 16]);
  __swift_project_boxed_opaque_existential_1((void *)(*v7 + OBJC_IVAR____TtC23FitnessCoachingServices20TypicalDayDataSource_dateProvider), *(void *)(*v7 + OBJC_IVAR____TtC23FitnessCoachingServices20TypicalDayDataSource_dateProvider + 24));
  uint64_t v8 = self;
  sub_1D3B61294();

  v9 = (void *)sub_1D3C2E470();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v9;
}

- (id)firstOnWristDateToday
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74670);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_dataSource), *(void *)&self->dataSource[OBJC_IVAR____TtC23FitnessCoachingServices18TypicalDayProvider_dataSource + 16]);
  uint64_t v6 = self;
  sub_1D3BC01A8((uint64_t)v5);

  uint64_t v7 = sub_1D3C2E3F0();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1D3C2E3A0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return v9;
}

- (BOOL)enumerateActivitySummariesFromDateComponents:(id)a3 toDateComponents:(id)a4 error:(id *)a5 handler:(id)a6
{
  uint64_t v8 = sub_1D3C2E1B0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = &v19[-v13];
  v15 = _Block_copy(a6);
  sub_1D3C2E190();
  sub_1D3C2E190();
  _Block_copy(v15);
  v16 = self;
  sub_1D3C0D654((uint64_t)v14, (uint64_t)v12, (uint64_t)v16, (uint64_t)v15);
  _Block_release(v15);

  v17 = *(void (**)(unsigned char *, uint64_t))(v9 + 8);
  v17(v12, v8);
  v17(v14, v8);
  _Block_release(v15);
  return 1;
}

@end