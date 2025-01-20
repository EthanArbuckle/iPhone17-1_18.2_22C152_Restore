@interface BackgroundSessionManagerHostConnection
- (void)beginWithRequest:(id)a3 completion:(id)a4;
- (void)createPresenceSessionWith:(id)a3 completion:(id)a4;
- (void)leaveWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateMembersWithIdentifier:(id)a3 members:(id)a4 completion:(id)a5;
- (void)updateShare:(id)a3 activityID:(id)a4 completion:(id)a5;
@end

@implementation BackgroundSessionManagerHostConnection

- (void)beginWithRequest:(id)a3 completion:(id)a4
{
}

- (void)leaveWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  BackgroundSessionManagerHostConnection.leave(identifier:completion:)((uint64_t)v9, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)updateMembersWithIdentifier:(id)a3 members:(id)a4 completion:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for TUHandle();
  lazy protocol witness table accessor for type AddressableMember and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type TUHandle and conformance NSObject, (void (*)(uint64_t))type metadata accessor for TUHandle);
  uint64_t v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v11);
  uint64_t v13 = self;
  specialized BackgroundSessionManagerHostConnection.updateMembers(identifier:members:completion:)((uint64_t)v10, v12, v13, (void (**)(void, void))v11);
  _Block_release(v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)updateShare:(id)a3 activityID:(id)a4 completion:(id)a5
{
  v29 = self;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = v9;
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  v16 = (char *)&v28 - v15;
  v17 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  uint64_t v19 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v9, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  unint64_t v20 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v21 = (v12 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = (char *)swift_allocObject();
  *((void *)v22 + 2) = 0;
  *((void *)v22 + 3) = 0;
  v23 = v29;
  *((void *)v22 + 4) = v29;
  *((void *)v22 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v22[v20], v14, v10);
  v24 = (void (**)(uint64_t))&v22[v21];
  *v24 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ();
  v24[1] = (void (*)(uint64_t))v18;
  id v25 = a3;
  v26 = v23;
  id v27 = v25;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v28, (uint64_t)&closure #1 in BackgroundSessionManagerHostConnection.updateShare(_:activityID:completion:)partial apply, (uint64_t)v22);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)createPresenceSessionWith:(id)a3 completion:(id)a4
{
}

@end