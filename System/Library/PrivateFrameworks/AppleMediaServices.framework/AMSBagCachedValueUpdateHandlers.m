@interface AMSBagCachedValueUpdateHandlers
+ (unint64_t)uninitializedToken;
- (AMSBagCachedValueUpdateHandlers)init;
- (AMSBagCachedValueUpdateHandlers)initWithHandlerQueue:(id)a3;
- (unint64_t)addHandlerWithKeys:(id)a3 initialValues:(id)a4 handler:(id)a5;
- (unint64_t)addHandlerWithKeys:(id)a3 initialValues:(id)a4 metricsTracker:(id)a5 handler:(id)a6;
- (void)callHandlersUsingNewBagDictionary:(id)a3 changedKeys:(id)a4;
- (void)removeHandlerWithToken:(unint64_t)a3;
@end

@implementation AMSBagCachedValueUpdateHandlers

- (void)removeHandlerWithToken:(unint64_t)a3
{
  v4 = self;
  BagCachedValueUpdateHandlers.removeHandler(token:)(a3);
}

- (AMSBagCachedValueUpdateHandlers)init
{
  return (AMSBagCachedValueUpdateHandlers *)BagCachedValueUpdateHandlers.init()();
}

- (AMSBagCachedValueUpdateHandlers)initWithHandlerQueue:(id)a3
{
  return (AMSBagCachedValueUpdateHandlers *)BagCachedValueUpdateHandlers.init(handlerQueue:)((uint64_t)a3);
}

- (unint64_t)addHandlerWithKeys:(id)a3 initialValues:(id)a4 metricsTracker:(id)a5 handler:(id)a6
{
  v8 = _Block_copy(a6);
  uint64_t v9 = sub_18DD4E330();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB38A4B8);
  v10 = (void *)sub_18DD4DDA0();
  *(void *)(swift_allocObject() + 16) = v8;
  id v11 = a5;
  v12 = self;
  unint64_t v13 = BagCachedValueUpdateHandlers.addHandler(keys:initialValues:metricsTracker:handler:)(v9, v10, (uint64_t)a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v13;
}

- (void)callHandlersUsingNewBagDictionary:(id)a3 changedKeys:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB38A4B8);
  uint64_t v5 = sub_18DD4DDA0();
  uint64_t v6 = sub_18DD4E330();
  v7 = self;
  BagCachedValueUpdateHandlers.callUpdateHandlers(newBagDictionary:changedKeys:)(v5, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (unint64_t)uninitializedToken
{
  return -1;
}

- (unint64_t)addHandlerWithKeys:(id)a3 initialValues:(id)a4 handler:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = sub_18DD4E330();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB38A4B8);
  v8 = (void *)sub_18DD4DDA0();
  *(void *)(swift_allocObject() + 16) = v6;
  uint64_t v9 = self;
  unint64_t v10 = BagCachedValueUpdateHandlers.addHandler(keys:initialValues:handler:)(v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v10;
}

- (void).cxx_destruct
{
  swift_release();
}

@end