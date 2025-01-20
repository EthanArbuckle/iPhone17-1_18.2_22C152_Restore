@interface NSStream(_SY_NSStreamDispatchQueueIntegration)
- (uint64_t)_SY_notifyOnQueue:()_SY_NSStreamDispatchQueueIntegration handler:;
@end

@implementation NSStream(_SY_NSStreamDispatchQueueIntegration)

- (uint64_t)_SY_notifyOnQueue:()_SY_NSStreamDispatchQueueIntegration handler:
{
  uint64_t v4 = objc_opt_class();
  return MEMORY[0x270EF2BB8](a1, a2, v4);
}

@end