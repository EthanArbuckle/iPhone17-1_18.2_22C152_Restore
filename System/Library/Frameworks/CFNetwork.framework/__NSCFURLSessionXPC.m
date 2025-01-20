@interface __NSCFURLSessionXPC
+ (id)bgSessionClientInterface;
+ (id)bgSessionInterface;
+ (id)bgSessionManagerInterface;
+ (void)initialize;
@end

@implementation __NSCFURLSessionXPC

+ (id)bgSessionManagerInterface
{
  return (id)sBgSessionManagerInterface;
}

+ (void)initialize
{
  if (+[__NSCFURLSessionXPC initialize]::onceToken != -1) {
    dispatch_once(&+[__NSCFURLSessionXPC initialize]::onceToken, &__block_literal_global_19965);
  }
}

+ (id)bgSessionClientInterface
{
  return (id)sBgSessionClientInterface;
}

+ (id)bgSessionInterface
{
  return (id)sBgSessionInterface;
}

@end