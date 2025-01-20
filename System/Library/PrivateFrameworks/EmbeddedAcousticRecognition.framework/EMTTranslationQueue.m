@interface EMTTranslationQueue
+ (id)createTranslationQueue;
+ (id)globalTranslationQueue;
@end

@implementation EMTTranslationQueue

+ (id)createTranslationQueue
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.sequoia", 0);
  return v2;
}

+ (id)globalTranslationQueue
{
  if (+[EMTTranslationQueue globalTranslationQueue]::once != -1) {
    dispatch_once(&+[EMTTranslationQueue globalTranslationQueue]::once, &__block_literal_global_5);
  }
  dispatch_queue_t v2 = (void *)+[EMTTranslationQueue globalTranslationQueue]::queue;
  return v2;
}

void __45__EMTTranslationQueue_globalTranslationQueue__block_invoke()
{
  uint64_t v0 = +[EMTTranslationQueue createTranslationQueue];
  v1 = (void *)+[EMTTranslationQueue globalTranslationQueue]::queue;
  +[EMTTranslationQueue globalTranslationQueue]::queue = v0;
}

@end