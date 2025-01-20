@interface MPContactSearchManager
- (MPContactSearchManager)init;
- (MPContactSearchManager)initWithType:(int64_t)a3 contactStore:(id)a4;
- (NSArray)contacts;
- (void)cancelPreviousSearch;
- (void)searchFor:(NSString *)a3 shouldRefreshResult:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation MPContactSearchManager

- (MPContactSearchManager)initWithType:(int64_t)a3 contactStore:(id)a4
{
  id v6 = a4;
  v7 = (MPContactSearchManager *)specialized ContactSearchManager.init(type:contactStore:)(a3, a4);

  return v7;
}

- (NSArray)contacts
{
  v2 = self;
  ContactSearchManager.contacts.getter();

  type metadata accessor for VMAccount(0, &lazy cache variable for type metadata for CNContact);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void)searchFor:(NSString *)a3 shouldRefreshResult:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in ContactSearchManager.search(for:shouldRefreshResult:);
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTATu;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v16);
  swift_release();
}

- (void)cancelPreviousSearch
{
  v2 = self;
  ContactSearchManager.cancelPreviousSearch()();
}

- (MPContactSearchManager)init
{
  result = (MPContactSearchManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSArray v3 = (char *)self + OBJC_IVAR___MPContactSearchManager_logger;
  uint64_t v4 = type metadata accessor for Logger();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end