@interface LACUIRatchetViewModel
+ (id)mapError:(id)a3;
- (BOOL)isInvalidated;
- (_TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel)init;
- (void)dealloc;
- (void)ratchetStateDidChange:(id)a3;
- (void)setIsInvalidated:(BOOL)a3;
- (void)start;
- (void)stopWithReason:(id)a3 invalidate:(BOOL)a4;
@end

@implementation LACUIRatchetViewModel

- (BOOL)isInvalidated
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isInvalidated;
  swift_beginAccess();
  return *v2;
}

- (void)setIsInvalidated:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isInvalidated;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)dealloc
{
  v2 = self;
  LACUIRatchetViewModel.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_ratchetManager));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)self + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)self + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_expirationDate, &demangling cache variable for type metadata for Date?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)self + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_gracePeriodExpirationDate, &demangling cache variable for type metadata for Date?);
}

- (void)start
{
  v2 = self;
  LACUIRatchetViewModel.start()();
}

- (void)stopWithReason:(id)a3 invalidate:(BOOL)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 24) = 0;
  *(void *)(v13 + 32) = self;
  *(void *)(v13 + 40) = v9;
  *(void *)(v13 + 48) = v11;
  *(unsigned char *)(v13 + 56) = a4;
  v14 = self;
  swift_bridgeObjectRetain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v8, (uint64_t)&closure #1 in LACUIRatchetViewModel.stop(withReason:invalidate:)partial apply, v13);
  swift_release();
  swift_bridgeObjectRelease();
}

+ (id)mapError:(id)a3
{
  id v4 = a3;
  id v5 = specialized static LACUIRatchetViewModel.mapError(_:)(a3);

  if (v5)
  {
    uint64_t v6 = (void *)_convertErrorToNSError(_:)();
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (_TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel)init
{
  result = (_TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)ratchetStateDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LACUIRatchetViewModel.ratchetStateDidChange(_:)(v4);
}

@end