@interface _DKPlatform
+ (id)deviceUUID;
@end

@implementation _DKPlatform

+ (id)deviceUUID
{
  if (deviceUUID_onceToken != -1) {
    dispatch_once(&deviceUUID_onceToken, &__block_literal_global_82);
  }
  v2 = (void *)deviceUUID_deviceUUID_0;
  return v2;
}

@end