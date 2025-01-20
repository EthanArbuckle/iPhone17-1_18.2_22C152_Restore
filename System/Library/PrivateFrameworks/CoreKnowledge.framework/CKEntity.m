@interface CKEntity
- (BOOL)isEqual:(id)a3;
- (BOOL)linkTo:(id)a3 withPredicate:(id)a4 error:(id *)a5;
- (CKEntity)init;
- (NSString)description;
- (id)linksTo:(id)a3 matchType:(int64_t)a4 error:(id *)a5;
- (id)valueForKey:(id)a3;
- (int64_t)hash;
- (void)linkTo:(id)a3 withPredicate:(id)a4 completionHandler:(id)a5;
- (void)linksTo:(id)a3 matchType:(int64_t)a4 completionHandler:(id)a5;
- (void)removeValueForKey:(id)a3 completionHandler:(id)a4;
- (void)removeWithCompletionHandler:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5;
- (void)setValuesForKeys:(id)a3 completionHandler:(id)a4;
- (void)valueForKey:(id)a3 completionHandler:(id)a4;
- (void)valuesForKeys:(id)a3 completionHandler:(id)a4;
@end

@implementation CKEntity

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A7831BBC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1A78021A0((uint64_t)v8);

  sub_1A77B9DB8((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_1A7802354();

  return v3;
}

- (NSString)description
{
  CKEntity.identifier.getter();
  v2 = (void *)sub_1A78317DC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)valueForKey:(id)a3
{
  uint64_t v4 = sub_1A78317EC();
  unint64_t v6 = v5;
  v7 = self;
  sub_1A7802430(v4, v6, &v15);

  swift_bridgeObjectRelease();
  uint64_t v8 = v16;
  if (v16)
  {
    v9 = __swift_project_boxed_opaque_existential_0(&v15, v16);
    uint64_t v10 = *(void *)(v8 - 8);
    MEMORY[0x1F4188790](v9, v9);
    v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    v13 = (void *)sub_1A7831DAC();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v15);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)valueForKey:(id)a3 completionHandler:(id)a4
{
}

- (void)valuesForKeys:(id)a3 completionHandler:(id)a4
{
  unint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A783198C();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = self;
  sub_1A7802C64(v6, (uint64_t)sub_1A780A128, v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)setValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  sub_1A7831BBC();
  swift_unknownObjectRelease();
  uint64_t v10 = sub_1A78317EC();
  uint64_t v12 = v11;

  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v7;
  sub_1A7802F80(v14, v10, v12, (uint64_t)sub_1A77C2630, v13);

  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
}

- (void)setValuesForKeys:(id)a3 completionHandler:(id)a4
{
  unint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A783178C();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  id v8 = self;
  sub_1A780369C(v6, (uint64_t)sub_1A77C2630, v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)removeValueForKey:(id)a3 completionHandler:(id)a4
{
}

- (void)linkTo:(id)a3 withPredicate:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_1A78317EC();
  unint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a3;
  uint64_t v12 = self;
  sub_1A7804158(v11, v8, v10, v12, v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (BOOL)linkTo:(id)a3 withPredicate:(id)a4 error:(id *)a5
{
  sub_1A78317EC();
  id v7 = a3;
  uint64_t v8 = self;
  sub_1A7804B30();
  swift_bridgeObjectRelease();

  return 1;
}

- (void)removeWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_1A780528C((uint64_t)sub_1A77C2624, v5);

  swift_release();
}

- (void)linksTo:(id)a3 matchType:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  unint64_t v10 = self;
  sub_1A7808384(v9, a4, v10, (void (**)(void, void, void))v8);
  _Block_release(v8);
}

- (id)linksTo:(id)a3 matchType:(int64_t)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = self;
  sub_1A7809214();

  uint64_t v8 = (void *)sub_1A783197C();
  swift_bridgeObjectRelease();
  return v8;
}

- (CKEntity)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  int64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKEntity_store);
}

@end