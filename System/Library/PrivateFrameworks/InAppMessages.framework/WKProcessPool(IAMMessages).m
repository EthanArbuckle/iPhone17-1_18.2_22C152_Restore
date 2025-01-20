@interface WKProcessPool(IAMMessages)
+ (id)webContentProcessPool;
@end

@implementation WKProcessPool(IAMMessages)

+ (id)webContentProcessPool
{
  if (webContentProcessPool_onceToken != -1) {
    dispatch_once(&webContentProcessPool_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)webContentProcessPool_contentProcessPool;

  return v0;
}

@end