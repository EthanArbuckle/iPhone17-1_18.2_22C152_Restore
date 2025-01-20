@interface SSMetricsLoadURLEvent
- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4;
@end

@implementation SSMetricsLoadURLEvent

- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  id v9 = a3;
  specialized SSMetricsLoadURLEvent.setSamplingProperties(with:completionHandler:)(a3, v8, v8, (uint64_t)a3, (uint64_t)thunk for @escaping @callee_unowned @convention(block) () -> ()partial apply, v7);

  swift_release();
}

@end