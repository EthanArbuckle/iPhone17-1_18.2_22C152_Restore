@interface NSObject
@end

@implementation NSObject

void __44__NSObject_NPHIdleTime__performBlockAtIdle___block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
  v3 = (void *)sIdleBlocks;
  sIdleBlocks = v2;

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel__NPHIdleTimeNotification_ name:@"NPHIdleNotification" object:0];
}

@end