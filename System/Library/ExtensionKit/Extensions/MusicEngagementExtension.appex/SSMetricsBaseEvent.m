@interface SSMetricsBaseEvent
- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4;
@end

@implementation SSMetricsBaseEvent

- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = thunk for @escaping @callee_unowned @convention(block) () -> ()partial apply;
  v8[5] = v7;
  id v9 = a3;
  v10 = self;
  id v11 = v9;
  swift_retain();
  specialized SSMetricsBaseEvent.setPropertiesForUserInterfaceState(with:completionHandler:)((uint64_t)partial apply for closure #1 in SSMetricsBaseEvent.setStandardProperties(with:completionHandler:), (uint64_t)v8);

  swift_release();

  swift_release();
}

@end