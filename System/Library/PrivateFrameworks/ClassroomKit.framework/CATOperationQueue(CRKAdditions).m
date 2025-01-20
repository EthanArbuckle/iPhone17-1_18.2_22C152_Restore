@interface CATOperationQueue(CRKAdditions)
+ (id)crk_backgroundQueue;
@end

@implementation CATOperationQueue(CRKAdditions)

+ (id)crk_backgroundQueue
{
  if (crk_backgroundQueue_onceToken != -1) {
    dispatch_once(&crk_backgroundQueue_onceToken, &__block_literal_global_66);
  }
  v0 = (void *)crk_backgroundQueue_backgroundQueue;

  return v0;
}

@end