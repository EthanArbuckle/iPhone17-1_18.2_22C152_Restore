@interface CALNNullRemoteMutator
+ (CALNNullRemoteMutator)sharedInstance;
- (BOOL)deleteEvent:(id)a3 withSpan:(int64_t)a4;
@end

@implementation CALNNullRemoteMutator

+ (CALNNullRemoteMutator)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_sharedInstance_4;
  return (CALNNullRemoteMutator *)v2;
}

uint64_t __39__CALNNullRemoteMutator_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_4 = objc_alloc_init(CALNNullRemoteMutator);
  return MEMORY[0x270F9A758]();
}

- (BOOL)deleteEvent:(id)a3 withSpan:(int64_t)a4
{
  return 0;
}

@end