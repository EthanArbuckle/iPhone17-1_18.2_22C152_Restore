@interface WalkSuggestionProvider
- (BOOL)enumerateActivitySummariesFromDateComponents:(id)a3 toDateComponents:(id)a4 error:(id *)a5 handler:(id)a6;
- (_TtC23FitnessCoachingServices22WalkSuggestionProvider)init;
- (id)currentCalendar;
- (id)currentDate;
- (id)firstOnWristDateToday;
@end

@implementation WalkSuggestionProvider

- (_TtC23FitnessCoachingServices22WalkSuggestionProvider)init
{
  result = (_TtC23FitnessCoachingServices22WalkSuggestionProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23FitnessCoachingServices22WalkSuggestionProvider_dateProvider);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC23FitnessCoachingServices22WalkSuggestionProvider_healthStore);
}

- (id)currentDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD74670);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1D3C2E3F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices22WalkSuggestionProvider_dateProvider), *(void *)&self->dateProvider[OBJC_IVAR____TtC23FitnessCoachingServices22WalkSuggestionProvider_dateProvider + 16]);
  v10 = self;
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

  v11 = (void *)sub_1D3C2E3A0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (id)currentCalendar
{
  uint64_t v3 = sub_1D3C2E4D0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23FitnessCoachingServices22WalkSuggestionProvider_dateProvider), *(void *)&self->dateProvider[OBJC_IVAR____TtC23FitnessCoachingServices22WalkSuggestionProvider_dateProvider + 16]);
  uint64_t v7 = self;
  sub_1D3B61294();

  uint64_t v8 = (void *)sub_1D3C2E470();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

- (id)firstOnWristDateToday
{
  return 0;
}

- (BOOL)enumerateActivitySummariesFromDateComponents:(id)a3 toDateComponents:(id)a4 error:(id *)a5 handler:(id)a6
{
  uint64_t v7 = sub_1D3C2E1B0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v17 - v12;
  v14 = _Block_copy(a6);
  sub_1D3C2E190();
  sub_1D3C2E190();
  v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  v15(v13, v7);
  _Block_release(v14);
  return 1;
}

@end