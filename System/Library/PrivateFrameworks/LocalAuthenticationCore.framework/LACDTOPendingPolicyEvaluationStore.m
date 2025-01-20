@interface LACDTOPendingPolicyEvaluationStore
+ (NSString)storeKey;
- (NSArray)pendingEvaluations;
- (_TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore)init;
- (_TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore)initWithPersistentStore:(id)a3 workQueue:(id)a4;
- (id)pendingEvaluationWithIdentifier:(id)a3;
- (void)addPendingEvaluation:(id)a3;
- (void)loadPersistedEvaluationsWithCompletion:(id)a3;
- (void)loadWithCompletionHandler:(id)a3;
- (void)persistEvaluations;
- (void)removePendingEvaluationWith:(id)a3;
@end

@implementation LACDTOPendingPolicyEvaluationStore

+ (NSString)storeKey
{
  v2 = (void *)MEMORY[0x25A282380](0xD000000000000012, 0x8000000254FD7B70);
  return (NSString *)v2;
}

- (NSArray)pendingEvaluations
{
  v2 = self;
  uint64_t v3 = swift_bridgeObjectRetain();
  specialized _copyCollectionToContiguousArray<A>(_:)(v3, (uint64_t (*)(uint64_t *, void *, uint64_t, uint64_t))specialized Sequence._copySequenceContents(initializing:));

  swift_bridgeObjectRelease();
  type metadata accessor for LACDTOMutablePendingPolicyEvaluation();
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release();
  return (NSArray *)v4.super.isa;
}

- (_TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore)initWithPersistentStore:(id)a3 workQueue:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = (_TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *)specialized LACDTOPendingPolicyEvaluationStore.init(persistentStore:workQueue:)((uint64_t)a3, v6);
  swift_unknownObjectRelease();

  return v7;
}

- (void)loadPersistedEvaluationsWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v11;
  v12[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> ();
  v12[6] = v9;
  v13 = self;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in LACDTOPendingPolicyEvaluationStore.loadPersistedEvaluations(completion:)partial apply, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)loadWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &async function pointer to partial apply for @objc closure #1 in LACDTOPendingPolicyEvaluationStore.load();
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &_sIeghH_IeAgH_TRTATu;
  v12[5] = v11;
  v13 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v7, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v12);
  swift_release();
}

- (void)persistEvaluations
{
  uint64_t ObjectType = swift_getObjectType();
  NSArray v4 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x88);
  uint64_t v5 = self;
  uint64_t v6 = v4();
  uint64_t v7 = *(uint64_t *)((char *)&v5->super.isa
                  + OBJC_IVAR____TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore_taskGroup);
  v8 = (void *)swift_allocObject();
  v8[2] = v5;
  v8[3] = v6;
  v8[4] = ObjectType;
  uint64_t v9 = *(void (**)(void *, void *))(*(void *)v7 + 120);
  uint64_t v10 = v5;
  v9(&closure #1 in LACDTOPendingPolicyEvaluationStore.persist()partial apply, v8);

  swift_release();
}

- (void)addPendingEvaluation:(id)a3
{
  NSArray v4 = (char *)a3;
  uint64_t v5 = self;
  LACDTOPendingPolicyEvaluationStore.addPendingEvaluation(_:)(v4);
}

- (id)pendingEvaluationWithIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8 = LACDTOPendingPolicyEvaluationStore.pendingEvaluation(withIdentifier:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)removePendingEvaluationWith:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore_pendingEvaluationsDict);
  uint64_t v7 = self;
  swift_bridgeObjectRetain();

  LACDTOPendingPolicyEvaluationStore.pendingEvaluationsDict.setter(v8);
  swift_bridgeObjectRelease();
}

- (_TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore)init
{
  result = (_TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore_workQueue));
  swift_release();
  swift_bridgeObjectRelease();
}

@end