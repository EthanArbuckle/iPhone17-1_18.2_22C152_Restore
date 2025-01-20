@interface _CDUncachedSentinel
+ (id)sharedInstance;
- (BOOL)isUncachedSentinel;
- (id)interactionIfCached;
@end

@implementation _CDUncachedSentinel

+ (id)sharedInstance
{
  self;
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_165);
  }
  v0 = (void *)sharedInstance__pasExprOnceResult;
  return v0;
}

- (id)interactionIfCached
{
  return 0;
}

- (BOOL)isUncachedSentinel
{
  return 1;
}

@end