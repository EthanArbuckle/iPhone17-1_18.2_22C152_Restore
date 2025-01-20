@interface CPApplicationLauncherSwift
- (CPApplicationLauncherSwift)init;
- (NSString)placementSceneIdentifier;
- (void)authorizePiPForActivitySession:(id)a3 completion:(id)a4;
- (void)launchAppForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5;
- (void)revokeBackgroundAuthorizationForBundleID:(id)a3;
- (void)revokeBackgroundAuthorizationForSession:(id)a3;
- (void)setPlacementSceneIdentifier:(id)a3;
@end

@implementation CPApplicationLauncherSwift

- (NSString)placementSceneIdentifier
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___CPApplicationLauncherSwift_placementSceneIdentifier);
  swift_beginAccess();
  uint64_t v3 = v2[1];
  if (v3)
  {
    uint64_t v4 = *v2;
    swift_bridgeObjectRetain();
    v5 = (void *)MEMORY[0x1B3EA1B00](v4, v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setPlacementSceneIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  ApplicationLauncher.placementSceneIdentifier.setter(v4, v6);
}

- (CPApplicationLauncherSwift)init
{
  return (CPApplicationLauncherSwift *)ApplicationLauncher.init()();
}

- (void)launchAppForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t (*)())_Block_copy(a5);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    v12 = thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool, @unowned NSError?) -> ()partial apply;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  v15[7] = v12;
  v15[8] = v13;
  swift_unknownObjectRetain_n();
  v16 = self;
  outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed NWConnection.State) -> ())?((uint64_t)v12);
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v11, (uint64_t)&closure #1 in ApplicationLauncher.launchApplication(for:options:completion:)partial apply, (uint64_t)v15);
  swift_release();
  _sxRi_zRi0_zlyytIseghHr_SgWOe((uint64_t)v12);

  swift_unknownObjectRelease();
}

- (void)revokeBackgroundAuthorizationForBundleID:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = v7;
  v11[6] = v9;
  v12 = self;
  swift_bridgeObjectRetain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v6, (uint64_t)&closure #1 in ApplicationLauncher.revokeBackgroundAuthorization(for:)partial apply, (uint64_t)v11);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)revokeBackgroundAuthorizationForSession:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  id v5 = objc_msgSend(a3, sel_activity);
  id v6 = objc_msgSend(v5, sel_bundleIdentifier);

  if (v6)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;

    (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v10->super.isa) + 0xC0))(v7, v9);
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

- (void)authorizePiPForActivitySession:(id)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CPApplicationLauncherSwift_pegasusLaunchBehavior);
  if (v12)
  {
    uint64_t v13 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = 0;
    v14[3] = 0;
    v14[4] = v12;
    v14[5] = a3;
    v14[6] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool, @unowned NSError?) -> ();
    v14[7] = v11;
    swift_unknownObjectRetain_n();
    v15 = self;
    _Block_copy(v10);
    swift_retain();
    swift_retain();
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in ApplicationLauncher.authorizePiP(for:completion:)partial apply, (uint64_t)v14);
    swift_release();
    swift_release();
    _Block_release(v10);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRetain();
    v18 = self;
    _Block_copy(v10);
    (*((void (**)(void *, void, void))v10 + 2))(v10, 0, 0);
    swift_release();
    _Block_release(v10);
    swift_unknownObjectRelease();
    v16 = v18;
  }
}

- (void).cxx_destruct
{
}

@end