@interface AVWeakObservationBlockFactory
+ (id)weakObservationBlockForWeakObserver:(id)a3 passedToBlock:(id)a4;
@end

@implementation AVWeakObservationBlockFactory

uint64_t __83__AVWeakObservationBlockFactory_weakObservationBlockForWeakObserver_passedToBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) referencedObject];
  if (result)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

+ (id)weakObservationBlockForWeakObserver:(id)a3 passedToBlock:(id)a4
{
  v5 = [[AVWeakReference alloc] initWithReferencedObject:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__AVWeakObservationBlockFactory_weakObservationBlockForWeakObserver_passedToBlock___block_invoke;
  v8[3] = &unk_1E57B7548;
  v8[4] = v5;
  v8[5] = a4;
  v6 = (void *)[v8 copy];

  return v6;
}

@end