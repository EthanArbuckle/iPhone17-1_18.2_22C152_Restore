@interface AAProcessorManager
- (AAProcessorManager)init;
- (void)addEventProcessor:(id)a3;
- (void)flushWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)removeEventProcessor:(id)a3;
- (void)resumeBackgroundProcessingForIdentifier:(id)a3 completion:(id)a4;
@end

@implementation AAProcessorManager

- (AAProcessorManager)init
{
  result = (AAProcessorManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)addEventProcessor:(id)a3
{
}

- (void)removeEventProcessor:(id)a3
{
}

- (void)resumeBackgroundProcessingForIdentifier:(id)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);

  _Block_release(v4);
}

- (void)flushWithCallbackQueue:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1A90BA534;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_1A9090C9C((uint64_t)v8, (uint64_t)v6, v7);
  sub_1A909E0EC((uint64_t)v6);
}

@end