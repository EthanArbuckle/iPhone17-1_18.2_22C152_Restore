@interface ATXDateRelevantContext
- (ATXDateRelevantContext)init;
- (ATXDateRelevantContext)initWithStartDate:(id)a3 endDate:(id)a4;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
@end

@implementation ATXDateRelevantContext

- (NSDate)startDate
{
  v2 = (void *)sub_1D13F1F48();
  return (NSDate *)v2;
}

- (NSDate)endDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD239C8);
  MEMORY[0x1F4188790](v3 - 8, v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D1386614((uint64_t)self + OBJC_IVAR___ATXDateRelevantContext_endDate, (uint64_t)v6);
  uint64_t v7 = sub_1D13F1FA8();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    v9 = (void *)sub_1D13F1F48();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  return (NSDate *)v9;
}

- (ATXDateRelevantContext)initWithStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD239C8);
  MEMORY[0x1F4188790](v6 - 8, v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1D13F1FA8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10, v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D13F1F78();
  if (a4)
  {
    sub_1D13F1F78();
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, v15, 1, v10);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))((char *)self + OBJC_IVAR___ATXDateRelevantContext_startDate, v14, v10);
  sub_1D1386614((uint64_t)v9, (uint64_t)self + OBJC_IVAR___ATXDateRelevantContext_endDate);
  v16 = (objc_class *)type metadata accessor for DateRelevantContext();
  v19.receiver = self;
  v19.super_class = v16;
  v17 = [(ATXDateRelevantContext *)&v19 init];
  sub_1D139E01C((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  return v17;
}

- (NSString)description
{
  v2 = self;
  sub_1D13B6A4C();

  uint64_t v3 = (void *)sub_1D13F2678();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (ATXDateRelevantContext)init
{
  result = (ATXDateRelevantContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___ATXDateRelevantContext_startDate;
  uint64_t v4 = sub_1D13F1FA8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR___ATXDateRelevantContext_endDate;
  sub_1D139E01C((uint64_t)v5);
}

@end