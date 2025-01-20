@interface UtilityProgram
- (NSString)enrollmentStatus;
- (NSString)programDescription;
- (NSString)programID;
- (_TtC19HomeUtilityServices14UtilityProgram)init;
- (_TtC19HomeUtilityServices14UtilityProgram)initWithProgramID:(id)a3 programDescription:(id)a4 enrollmentStatus:(id)a5;
@end

@implementation UtilityProgram

- (NSString)programID
{
  return (NSString *)sub_25278CACC();
}

- (NSString)programDescription
{
  return (NSString *)sub_25278CACC();
}

- (NSString)enrollmentStatus
{
  return (NSString *)sub_25278CACC();
}

- (_TtC19HomeUtilityServices14UtilityProgram)initWithProgramID:(id)a3 programDescription:(id)a4 enrollmentStatus:(id)a5
{
  uint64_t v6 = sub_2528312A8();
  uint64_t v8 = v7;
  uint64_t v9 = sub_2528312A8();
  uint64_t v11 = v10;
  uint64_t v12 = sub_2528312A8();
  v13 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices14UtilityProgram_programID);
  uint64_t *v13 = v6;
  v13[1] = v8;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices14UtilityProgram_programDescription);
  uint64_t *v14 = v9;
  v14[1] = v11;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices14UtilityProgram_enrollmentStatus);
  uint64_t *v15 = v12;
  v15[1] = v16;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for UtilityProgram();
  return [(UtilityProgram *)&v18 init];
}

- (_TtC19HomeUtilityServices14UtilityProgram)init
{
  result = (_TtC19HomeUtilityServices14UtilityProgram *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end