@interface CHSWidgetRelevanceService
- (CHSChronoServicesConnectionClient)_connectionClient;
- (CHSWidgetRelevanceService)init;
- (CHSWidgetRelevanceService)initWithConnection:(id)a3 cacheURL:(id)a4 options:(unint64_t)a5;
- (CHSWidgetRelevanceService)initWithOptions:(unint64_t)a3;
- (NSArray)widgetRelevanceProperties;
- (NSDictionary)timelineEntryRelevances;
- (void)_syncOnInternalQueue;
- (void)acquireWidgetLifetimeAssertionForWidget:(id)a3 metrics:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)invalidate;
- (void)registerObserver:(id)a3;
- (void)reloadWidgetRelevanceForExtensionIdentity:(id)a3 kind:(id)a4 completion:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation CHSWidgetRelevanceService

- (CHSWidgetRelevanceService)initWithOptions:(unint64_t)a3
{
  uint64_t v5 = sub_190D415D8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(self, sel_sharedInstance);
  id v10 = CHSWidgetRelevanceServiceCacheDirectory();
  sub_190D41588();

  v11 = (void *)sub_190D414F8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = [(CHSWidgetRelevanceService *)self initWithConnection:v9 cacheURL:v11 options:a3];

  return v12;
}

- (CHSWidgetRelevanceService)initWithConnection:(id)a3 cacheURL:(id)a4 options:(unint64_t)a5
{
  uint64_t v7 = sub_190D415D8();
  MEMORY[0x1F4188790](v7 - 8);
  id v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_190D41588();
  return (CHSWidgetRelevanceService *)sub_190CEFBE0(a3, (uint64_t)v9, (char *)a5);
}

- (void)dealloc
{
  v2 = self;
  sub_190CF1348();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___CHSWidgetRelevanceService_keybagStateProvider);
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)invalidate
{
  v2 = self;
  CHSWidgetRelevanceService.invalidate()();
}

- (NSDictionary)timelineEntryRelevances
{
  v2 = self;
  CHSWidgetRelevanceService.timelineEntryRelevances.getter();

  sub_190C72C5C(0, &qword_1E92ABD50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92ABFD8);
  sub_190CF41CC((unint64_t *)&unk_1E92ABFE0, &qword_1E92ABD50);
  v3 = (void *)sub_190D418A8();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (NSArray)widgetRelevanceProperties
{
  v2 = self;
  CHSWidgetRelevanceService.widgetRelevanceProperties.getter();

  sub_190C72C5C(0, &qword_1E92AA348);
  v3 = (void *)sub_190D41BD8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)reloadWidgetRelevanceForExtensionIdentity:(id)a3 kind:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_190D41978();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  id v12 = a3;
  v13 = self;
  CHSWidgetRelevanceService.reloadWidgetRelevance(for:kind:completion:)(v12, v9, (uint64_t)a4, (uint64_t)sub_190CF4298, v11);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)acquireWidgetLifetimeAssertionForWidget:(id)a3 metrics:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  CHSWidgetRelevanceService.acquireWidgetLifetimeAssertion(for:metrics:completion:)(v10, v11, (uint64_t)sub_190CF4290, v9);

  swift_release();
}

- (CHSWidgetRelevanceService)init
{
  result = (CHSWidgetRelevanceService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CHSChronoServicesConnectionClient)_connectionClient
{
  return (CHSChronoServicesConnectionClient *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR___CHSWidgetRelevanceService_connectionClient));
}

- (void)_syncOnInternalQueue
{
  v2 = self;
  sub_190CF3D10();
}

@end