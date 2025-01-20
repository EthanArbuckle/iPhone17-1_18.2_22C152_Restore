@interface _CDLogging(CDUserContext)
+ (id)mdcsChannel;
@end

@implementation _CDLogging(CDUserContext)

+ (id)mdcsChannel
{
  if (mdcsChannel_onceToken != -1) {
    dispatch_once(&mdcsChannel_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)mdcsChannel_mdcsChannel;
  return v0;
}

@end