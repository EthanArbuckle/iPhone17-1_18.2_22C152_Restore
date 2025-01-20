@interface CKKnowledgeStore
+ (CKKnowledgeStore)knowledgeStoreWithName:(id)a3;
+ (id)defaultKnowledgeStore;
+ (id)defaultSynchedKnowledgeStore;
+ (id)directoryURL;
+ (id)inMemoryKnowledgeStore;
+ (id)synchedKnowledgeStoreWithName:(id)a3;
+ (id)userDefaultsKnowledgeStore;
- (BOOL)inferLinkTo:(id)a3 withPredicate:(id)a4 when:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeAllValuesAndReturnError:(id *)a3;
- (BOOL)removeEntity:(id)a3 error:(id *)a4;
- (BOOL)removeValueForKey:(id)a3 error:(id *)a4;
- (BOOL)removeValuesForKeys:(id)a3 error:(id *)a4;
- (BOOL)removeValuesMatching:(id)a3 error:(id *)a4;
- (CKKnowledgeStore)init;
- (CKKnowledgeStoreDelegate)delegate;
- (NSString)name;
- (NSURL)filePathURL;
- (id)dictionaryRepresentationAndReturnError:(id *)a3;
- (id)dictionaryRepresentationForKeysMatching:(id)a3 error:(id *)a4;
- (id)entitiesAndReturnError:(id *)a3;
- (id)entityWithIdentifier:(id)a3;
- (id)keysAndReturnError:(id *)a3;
- (id)keysMatching:(id)a3 error:(id *)a4;
- (id)subgraphWithEntities:(id)a3;
- (id)triplesMatching:(id)a3 error:(id *)a4;
- (id)valueForKey:(id)a3;
- (id)valuesAndReturnError:(id *)a3;
- (id)valuesForKeysMatching:(id)a3 error:(id *)a4;
- (id)writeBatch;
- (int64_t)hash;
- (void)dictionaryRepresentationForKeysMatching:(id)a3 completionHandler:(id)a4;
- (void)dictionaryRepresentationWithCompletionHandler:(id)a3;
- (void)disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3;
- (void)entitiesWithCompletionHandler:(id)a3;
- (void)importContentsOfJSONLDAtPath:(id)a3 completionHandler:(id)a4;
- (void)inferLinkTo:(id)a3 withPredicate:(id)a4 when:(id)a5 completionHandler:(id)a6;
- (void)keysMatching:(id)a3 completionHandler:(id)a4;
- (void)keysWithCompletionHandler:(id)a3;
- (void)removeAllValuesWithCompletionHandler:(id)a3;
- (void)removeEntity:(id)a3 completionHandler:(id)a4;
- (void)removeValueForKey:(id)a3 completionHandler:(id)a4;
- (void)removeValuesForKeys:(id)a3 completionHandler:(id)a4;
- (void)removeValuesMatching:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5;
- (void)triplesMatching:(id)a3 completionHandler:(id)a4;
- (void)valueForKey:(id)a3 completionHandler:(id)a4;
- (void)valuesForKeys:(id)a3 completionHandler:(id)a4;
- (void)valuesForKeysMatching:(id)a3 completionHandler:(id)a4;
- (void)valuesWithCompletionHandler:(id)a3;
@end

@implementation CKKnowledgeStore

- (id)writeBatch
{
  v2 = self;
  v3 = (void *)CKKnowledgeStore.writeBatch()();

  return v3;
}

- (void)setValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  if (a3)
  {
    id v9 = a4;
    v10 = self;
    swift_unknownObjectRetain();
    sub_1A7831BBC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    id v11 = a4;
    v12 = self;
  }
  uint64_t v13 = sub_1A78317EC();
  unint64_t v15 = v14;

  _Block_copy(v8);
  sub_1A77BF364((uint64_t)v16, v13, v15, self, (void (**)(void, void))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  sub_1A77B9DB8((uint64_t)v16);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1A7831BBC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    id v8 = a4;
    id v9 = self;
  }
  uint64_t v10 = sub_1A78317EC();
  unint64_t v12 = v11;

  CKKnowledgeStore.setValue(_:forKey:)((uint64_t)v13, v10, v12);
  swift_bridgeObjectRelease();
  sub_1A77B9DB8((uint64_t)v13);
}

- (void)removeEntity:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)removeEntity:(id)a3 error:(id *)a4
{
  return sub_1A77C0EAC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))CKKnowledgeStore.removeEntity(_:));
}

- (void)removeValueForKey:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)removeValueForKey:(id)a3 error:(id *)a4
{
  return sub_1A77C0EAC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))CKKnowledgeStore.removeValue(forKey:));
}

- (void)removeValuesForKeys:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  sub_1A783198C();
  *(void *)(swift_allocObject() + 16) = v5;
  id v6 = self;
  CKKnowledgeStore.removeValues(forKeys:completionHandler:)();

  swift_bridgeObjectRelease();
  swift_release();
}

- (BOOL)removeValuesForKeys:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_1A783198C();
  v7 = self;
  CKKnowledgeStore.removeValues(forKeys:)((Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();

  if (v8)
  {
    if (a4)
    {
      id v9 = (void *)sub_1A783148C();

      id v10 = v9;
      *a4 = v9;
    }
    else
    {
    }
  }
  return v8 == 0;
}

- (void)removeValuesMatching:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = a3;
  id v8 = self;
  CKKnowledgeStore.removeValues(matching:completionHandler:)();

  swift_release();
}

- (BOOL)removeValuesMatching:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  CKKnowledgeStore.removeValues(matching:)();

  return 1;
}

- (void)removeAllValuesWithCompletionHandler:(id)a3
{
}

- (BOOL)removeAllValuesAndReturnError:(id *)a3
{
  v4 = self;
  CKKnowledgeStore.removeAllValues()();

  if (v5)
  {
    if (a3)
    {
      uint64_t v6 = (void *)sub_1A783148C();

      id v7 = v6;
      *a3 = v6;
    }
    else
    {
    }
  }
  return v5 == 0;
}

- (void)disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3
{
}

- (void)dictionaryRepresentationWithCompletionHandler:(id)a3
{
}

- (id)dictionaryRepresentationAndReturnError:(id *)a3
{
  v3 = self;
  CKKnowledgeStore.dictionaryRepresentation()();

  v4 = (void *)sub_1A783177C();
  swift_bridgeObjectRelease();
  return v4;
}

- (void)dictionaryRepresentationForKeysMatching:(id)a3 completionHandler:(id)a4
{
}

- (id)dictionaryRepresentationForKeysMatching:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  CKKnowledgeStore.dictionaryRepresentation(forKeysMatching:)();

  id v7 = (void *)sub_1A783177C();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)keysWithCompletionHandler:(id)a3
{
}

- (id)keysAndReturnError:(id *)a3
{
  return sub_1A77D4F2C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))CKKnowledgeStore.keys());
}

- (void)keysMatching:(id)a3 completionHandler:(id)a4
{
}

- (id)keysMatching:(id)a3 error:(id *)a4
{
  return sub_1A77D5A84(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CKKnowledgeStore.keys(matching:));
}

- (void)valuesWithCompletionHandler:(id)a3
{
}

- (id)valuesAndReturnError:(id *)a3
{
  return sub_1A77D4F2C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))CKKnowledgeStore.values());
}

- (void)valueForKey:(id)a3 completionHandler:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A78317EC();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  id v10 = self;
  CKKnowledgeStore.value(forKey:completionHandler:)(v6, v8, (uint64_t)sub_1A77D6AF8, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (id)valueForKey:(id)a3
{
  uint64_t v4 = sub_1A78317EC();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  CKKnowledgeStore.value(forKey:)(v4, v6);

  swift_bridgeObjectRelease();
  uint64_t v8 = v16;
  if (v16)
  {
    uint64_t v9 = __swift_project_boxed_opaque_existential_0(v15, v16);
    uint64_t v10 = *(void *)(v8 - 8);
    MEMORY[0x1F4188790](v9, v9);
    unint64_t v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    uint64_t v13 = (void *)sub_1A7831DAC();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  }
  else
  {
    uint64_t v13 = 0;
  }
  return v13;
}

- (void)valuesForKeys:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_1A783198C();
  *(void *)(swift_allocObject() + 16) = v5;
  uint64_t v6 = self;
  CKKnowledgeStore.values(forKeys:completionHandler:)();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)valuesForKeysMatching:(id)a3 completionHandler:(id)a4
{
}

- (id)valuesForKeysMatching:(id)a3 error:(id *)a4
{
  return sub_1A77D5A84(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CKKnowledgeStore.values(forKeysMatching:));
}

- (id)entityWithIdentifier:(id)a3
{
  sub_1A78317EC();
  uint64_t v4 = self;
  id v5 = CKKnowledgeStore.entity(withIdentifier:)();

  swift_bridgeObjectRelease();
  return v5;
}

- (void)entitiesWithCompletionHandler:(id)a3
{
}

- (id)entitiesAndReturnError:(id *)a3
{
  v3 = self;
  CKKnowledgeStore.entities()();

  type metadata accessor for CKEntity();
  uint64_t v4 = (void *)sub_1A783197C();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)triplesMatching:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  CKKnowledgeStore.triples(matching:)();

  type metadata accessor for CKTriple();
  uint64_t v7 = (void *)sub_1A783197C();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)triplesMatching:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = a3;
  uint64_t v8 = self;
  CKKnowledgeStore.triples(matching:completionHandler:)();

  swift_release();
}

- (id)subgraphWithEntities:(id)a3
{
  uint64_t v4 = sub_1A783198C();
  id v5 = self;
  id v6 = CKKnowledgeStore.subgraph(withEntities:)(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (void)importContentsOfJSONLDAtPath:(id)a3 completionHandler:(id)a4
{
  id v5 = _Block_copy(a4);
  sub_1A78317EC();
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    id v5 = sub_1A77C2624;
  }
  id v6 = self;
  CKKnowledgeStore.importContentsOfJSONLD(atPath:completionHandler:)();
  sub_1A77ED48C((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (BOOL)inferLinkTo:(id)a3 withPredicate:(id)a4 when:(id)a5 error:(id *)a6
{
  uint64_t v9 = sub_1A78317EC();
  uint64_t v11 = v10;
  id v12 = a3;
  id v13 = a5;
  unint64_t v14 = self;
  CKKnowledgeStore.inferLink(to:withPredicate:when:)(v12, v9, v11, v13);
  swift_bridgeObjectRelease();

  return 1;
}

- (void)inferLinkTo:(id)a3 withPredicate:(id)a4 when:(id)a5 completionHandler:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  uint64_t v10 = sub_1A78317EC();
  unint64_t v12 = v11;
  _Block_copy(v9);
  id v13 = a3;
  unint64_t v14 = a5;
  unint64_t v15 = self;
  sub_1A77FB4D0(v13, v10, v12, v14, v15, (void (**)(void, void))v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (CKKnowledgeStoreDelegate)delegate
{
  v2 = (void *)sub_1A780B314();
  return (CKKnowledgeStoreDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1A780B358();
}

- (NSString)name
{
  v2 = self;
  sub_1A780B4B8();

  v3 = (void *)sub_1A78317DC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (id)directoryURL
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9731688);
  MEMORY[0x1F4188790](v2 - 8, v3);
  id v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static CKKnowledgeStore.directory()((uint64_t)v5);
  uint64_t v6 = sub_1A783150C();
  id v7 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) != 1)
  {
    id v7 = (void *)sub_1A78314BC();
    (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  return v7;
}

- (NSURL)filePathURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9731688);
  MEMORY[0x1F4188790](v3 - 8, v4);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = self;
  sub_1A780B514((uint64_t)v6);

  uint64_t v8 = sub_1A783150C();
  uint64_t v9 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8) != 1)
  {
    uint64_t v9 = (void *)sub_1A78314BC();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
  }
  return (NSURL *)v9;
}

- (int64_t)hash
{
  uint64_t v2 = self;
  int64_t v3 = sub_1A780C3BC();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1A7831BBC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_1A780C424((uint64_t)v8);

  sub_1A77D1F88((uint64_t)v8, &qword_1EB59FC90);
  return v6 & 1;
}

+ (id)defaultKnowledgeStore
{
  id v2 = sub_1A780B784();
  return v2;
}

+ (id)defaultSynchedKnowledgeStore
{
  id v2 = sub_1A780B7A4();
  return v2;
}

+ (id)inMemoryKnowledgeStore
{
  id v2 = sub_1A780B7C4();
  return v2;
}

+ (id)userDefaultsKnowledgeStore
{
  id v2 = sub_1A780B7F8();
  return v2;
}

+ (CKKnowledgeStore)knowledgeStoreWithName:(id)a3
{
  return (CKKnowledgeStore *)sub_1A780C6C0((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1A780B834);
}

+ (id)synchedKnowledgeStoreWithName:(id)a3
{
  return sub_1A780C6C0((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1A780B930);
}

- (CKKnowledgeStore)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___CKKnowledgeStore_backingStore);

  sub_1A77FA160(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CKKnowledgeStore_location), *(void *)&self->backingStore[OBJC_IVAR___CKKnowledgeStore_location], self->backingStore[OBJC_IVAR___CKKnowledgeStore_location + 8]);
  int64_t v3 = (char *)self + OBJC_IVAR___CKKnowledgeStore_delegate;
  sub_1A780D570((uint64_t)v3);
}

@end