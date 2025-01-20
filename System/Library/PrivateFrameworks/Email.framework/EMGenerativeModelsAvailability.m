@interface EMGenerativeModelsAvailability
+ (BOOL)isAvailable;
+ (BOOL)isRestricted;
- (_TtC5Email30EMGenerativeModelsAvailability)init;
- (void)dealloc;
@end

@implementation EMGenerativeModelsAvailability

+ (BOOL)isAvailable
{
  uint64_t v2 = sub_1BF0A9578();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  v8 = (char *)&v15 - v7;
  if (qword_1EB5BD008 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_1EB5BD000 + OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityState;
  swift_beginAccess();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  v10(v6, (uint64_t)v8, v2);
  int v11 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  int v12 = *MEMORY[0x1E4F63D30];
  v13 = *(void (**)(char *, uint64_t))(v3 + 8);
  if (v11 != *MEMORY[0x1E4F63D30]) {
    v13(v6, v2);
  }
  v13(v8, v2);
  return v11 == v12;
}

+ (BOOL)isRestricted
{
  uint64_t v2 = sub_1BF0A9578();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  v8 = (char *)&v13 - v7;
  if (qword_1EB5BD008 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_1EB5BD000 + OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityState;
  swift_beginAccess();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  v10(v6, (uint64_t)v8, v2);
  LOBYTE(v9) = (*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v6, v2) == *MEMORY[0x1E4F63C38];
  int v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v6, v2);
  v11(v8, v2);
  return v9;
}

- (_TtC5Email30EMGenerativeModelsAvailability)init
{
  return (_TtC5Email30EMGenerativeModelsAvailability *)sub_1BF0A4C50();
}

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityNotification))
  {
    uint64_t v3 = self;
    swift_retain();
    sub_1BF0A95B8();
    swift_release();
  }
  else
  {
    uint64_t v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EMGenerativeModelsAvailability();
  [(EMGenerativeModelsAvailability *)&v5 dealloc];
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availability;
  uint64_t v4 = sub_1BF0A95E8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_super v5 = (char *)self + OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityState;
  uint64_t v6 = sub_1BF0A9578();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
}

@end