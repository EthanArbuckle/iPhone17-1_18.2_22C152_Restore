@interface CKPersistentStoreHandler
+ (id)inMemoryHandler;
- (BOOL)dropLinkWithLabel:(id)a3 between:(id)a4 and:(id)a5 error:(id *)a6;
- (BOOL)dropLinksBetween:(id)a3 and:(id)a4 error:(id *)a5;
- (BOOL)dropLinksWithLabel:(id)a3 from:(id)a4 error:(id *)a5;
- (BOOL)removeAllValuesAndReturnError:(id *)a3;
- (BOOL)removeValueForKey:(id)a3 error:(id *)a4;
- (BOOL)removeValuesForKeys:(id)a3 error:(id *)a4;
- (BOOL)removeValuesMatching:(id)a3 error:(id *)a4;
- (BOOL)saveKeysAndValues:(id)a3 error:(id *)a4;
- (BOOL)setWeightForLinkWithLabel:(id)a3 between:(id)a4 and:(id)a5 toValue:(int64_t)a6 error:(id *)a7;
- (CKPersistentStoreHandler)init;
- (CKPersistentStoreHandler)initWithName:(id)a3;
- (id)_valuesForKeys:(id)a3 error:(id *)a4;
- (id)keysAndReturnError:(id *)a3;
- (id)keysAndValuesAndReturnError:(id *)a3;
- (id)keysAndValuesForKeysMatching:(id)a3 error:(id *)a4;
- (id)keysMatching:(id)a3 error:(id *)a4;
- (id)tripleComponentsMatching:(id)a3 error:(id *)a4;
- (id)valuesAndReturnError:(id *)a3;
- (id)valuesForKeysMatching:(id)a3 error:(id *)a4;
- (int64_t)decreaseWeightForLinkWithLabel:(id)a3 between:(id)a4 and:(id)a5;
- (int64_t)increaseWeightForLinkWithLabel:(id)a3 between:(id)a4 and:(id)a5;
@end

@implementation CKPersistentStoreHandler

+ (id)inMemoryHandler
{
  id v2 = sub_1A77C707C();
  return v2;
}

- (CKPersistentStoreHandler)init
{
  return (CKPersistentStoreHandler *)sub_1A77C7934();
}

- (CKPersistentStoreHandler)initWithName:(id)a3
{
  sub_1A78317EC();
  CKPersistentStoreHandler.init(name:)();
  return result;
}

- (id)keysAndReturnError:(id *)a3
{
  return sub_1A77C8F7C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1A77C8614);
}

- (id)keysMatching:(id)a3 error:(id *)a4
{
  return sub_1A77C9328(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_1A77C895C);
}

- (id)valuesAndReturnError:(id *)a3
{
  return sub_1A77C8F7C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1A77C8BC4);
}

- (id)valuesForKeysMatching:(id)a3 error:(id *)a4
{
  return sub_1A77C9328(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_1A77C9048);
}

- (id)keysAndValuesAndReturnError:(id *)a3
{
  v3 = self;
  sub_1A77C9410();

  v4 = (void *)sub_1A783177C();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)keysAndValuesForKeysMatching:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_1A77C9A84();

  v7 = (void *)sub_1A783177C();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)_valuesForKeys:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_1A783198C();
  v6 = self;
  sub_1A77CA504(v5);
  swift_bridgeObjectRelease();

  v7 = (void *)sub_1A783197C();
  swift_bridgeObjectRelease();
  return v7;
}

- (BOOL)saveKeysAndValues:(id)a3 error:(id *)a4
{
  sub_1A783178C();
  uint64_t v5 = self;
  sub_1A77CAED0();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)removeValueForKey:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_1A78317EC();
  uint64_t v7 = v6;
  v8 = self;
  sub_1A77CB990(v5, v7);
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)removeValuesForKeys:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_1A783198C();
  uint64_t v6 = self;
  sub_1A77CC070(v5);
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)removeValuesMatching:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1A77CC38C(v5);

  return 1;
}

- (BOOL)removeAllValuesAndReturnError:(id *)a3
{
  v3 = self;
  sub_1A77CC4E0();

  return 1;
}

- (id)tripleComponentsMatching:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1A77CC828((char *)a3);

  type metadata accessor for CKTriple();
  v8 = (void *)sub_1A783197C();
  swift_bridgeObjectRelease();
  return v8;
}

- (BOOL)setWeightForLinkWithLabel:(id)a3 between:(id)a4 and:(id)a5 toValue:(int64_t)a6 error:(id *)a7
{
  uint64_t v9 = sub_1A78317EC();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1A78317EC();
  uint64_t v14 = v13;
  uint64_t v15 = sub_1A78317EC();
  uint64_t v17 = v16;
  v18 = self;
  sub_1A77CCE10(v9, v11, v12, v14, v15, v17, a6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (int64_t)increaseWeightForLinkWithLabel:(id)a3 between:(id)a4 and:(id)a5
{
  sub_1A77CE6C8();
  return result;
}

- (int64_t)decreaseWeightForLinkWithLabel:(id)a3 between:(id)a4 and:(id)a5
{
  sub_1A77CE6C8();
  return result;
}

- (BOOL)dropLinkWithLabel:(id)a3 between:(id)a4 and:(id)a5 error:(id *)a6
{
  uint64_t v7 = sub_1A78317EC();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1A78317EC();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1A78317EC();
  uint64_t v15 = v14;
  uint64_t v16 = self;
  sub_1A77CE784(v7, v9, v10, v12, v13, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)dropLinksWithLabel:(id)a3 from:(id)a4 error:(id *)a5
{
  if (a3)
  {
    uint64_t v6 = sub_1A78317EC();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = sub_1A78317EC();
  uint64_t v11 = v10;
  uint64_t v12 = self;
  sub_1A77CEB10(v6, v8, v9, v11);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)dropLinksBetween:(id)a3 and:(id)a4 error:(id *)a5
{
  sub_1A78317EC();
  sub_1A78317EC();
  uint64_t v6 = self;
  sub_1A77CF04C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (void).cxx_destruct
{
}

@end