@interface LACPreboardController
- (BOOL)isRequired;
- (BOOL)launchPreboardWithError:(id *)a3;
- (_TtC23LocalAuthenticationCore21LACPreboardController)init;
- (id)acmContextForUUID:(id)a3 error:(id *)a4;
- (id)bundleIDForRequest:(id)a3;
- (id)uppTeamName;
- (int64_t)useCase;
- (void)enableCurrentUseCaseWithPasscode:(NSString *)a3 completion:(id)a4;
- (void)launchPreboardWithCompletion:(id)a3;
- (void)terminateWithCompletion:(id)a3;
@end

@implementation LACPreboardController

- (BOOL)isRequired
{
  v2 = self;
  unsigned __int8 v3 = LACPreboardController.isRequired.getter();

  return v3 & 1;
}

- (int64_t)useCase
{
  unsigned __int8 v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_useCaseProvider);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  int64_t v8 = v6(v4, v5);

  return v8;
}

- (id)uppTeamName
{
  unsigned __int8 v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_uppManager);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  uint64_t v8 = v6(v4, v5);
  uint64_t v10 = v9;

  if (v10)
  {
    v11 = (void *)MEMORY[0x25A282380](v8, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (BOOL)launchPreboardWithError:(id *)a3
{
  uint64_t v4 = self;
  LACPreboardController.launchPreboard()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)_convertErrorToNSError(_:)();

      id v7 = v6;
      *a3 = v6;
    }
    else
    {
    }
  }
  return v5 == 0;
}

- (void)launchPreboardWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &async function pointer to partial apply for @objc closure #1 in LACPreboardController.launchPreboard();
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &_sIeghH_IeAgH_TRTA_55Tu;
  v12[5] = v11;
  v13 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v7, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_60Tu, (uint64_t)v12);
  swift_release();
}

- (void)enableCurrentUseCaseWithPasscode:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in LACPreboardController.enableCurrentUseCase(withPasscode:);
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_40Tu;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_45Tu, (uint64_t)v14);
  swift_release();
}

- (void)terminateWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &async function pointer to partial apply for @objc closure #1 in LACPreboardController.terminate();
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &_sIeghH_IeAgH_TRTATu;
  v12[5] = v11;
  v13 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v7, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v12);
  swift_release();
}

- (_TtC23LocalAuthenticationCore21LACPreboardController)init
{
  result = (_TtC23LocalAuthenticationCore21LACPreboardController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_launcher);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_passcodeVerifier);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_uppManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_useCaseProvider);
  swift_unknownObjectRelease();
  unsigned __int8 v3 = (char *)self + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_uuid;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of AsyncStream<()>.Continuation?((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController____lazy_storage___contextProvider, &demangling cache variable for type metadata for LACACMContextProviding??);
  outlined consume of Result<(), Error>?(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_launchResult), self->contextProviderFactory[OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController_launchResult]);
  uint64_t v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC23LocalAuthenticationCore21LACPreboardController____lazy_storage___launchDispatchQueue);
}

- (id)acmContextForUUID:(id)a3 error:(id *)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = self;
  uint64_t v12 = LACPreboardController.acmContext(for:)((uint64_t)v8);
  unint64_t v14 = v13;
  outlined destroy of AsyncStream<()>.Continuation?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for UUID?);

  v15.super.isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v12, v14);
  return v15.super.isa;
}

- (id)bundleIDForRequest:(id)a3
{
  return 0;
}

@end