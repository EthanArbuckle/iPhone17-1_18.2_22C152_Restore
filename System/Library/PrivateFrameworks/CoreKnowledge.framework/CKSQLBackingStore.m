@interface CKSQLBackingStore
+ (NSURL)directory;
+ (void)setDirectory:(id)a3;
- (_TtC13CoreKnowledge17CKSQLBackingStore)initWithName:(id)a3;
@end

@implementation CKSQLBackingStore

- (_TtC13CoreKnowledge17CKSQLBackingStore)initWithName:(id)a3
{
  return self;
}

+ (NSURL)directory
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9731688);
  MEMORY[0x1F4188790](v2 - 8, v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1A77D6E7C();
  swift_beginAccess();
  sub_1A77DA43C(v6, (uint64_t)v5);
  uint64_t v7 = sub_1A783150C();
  v8 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7) != 1)
  {
    v8 = (void *)sub_1A78314BC();
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }
  return (NSURL *)v8;
}

+ (void)setDirectory:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9731688);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A78314EC();
    uint64_t v8 = sub_1A783150C();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = sub_1A783150C();
    uint64_t v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  uint64_t v10 = sub_1A77D6E7C();
  swift_beginAccess();
  sub_1A77DA378((uint64_t)v7, v10);
  swift_endAccess();
  sub_1A77DA3E0((uint64_t)v7, &qword_1E9731688);
}

@end