@interface SecureAssetTypeUtils
+ (id)getAssetFileName:(unsigned int)a3;
+ (id)getBundle:(unsigned int)a3;
- (SecureAssetTypeUtils)init;
@end

@implementation SecureAssetTypeUtils

+ (id)getBundle:(unsigned int)a3
{
  id v3 = _sSo20SecureAssetTypeUtilsC010CoreSpeechD0E9getBundleySo8NSBundleCSgs6UInt32VFZ_0(a3);
  return v3;
}

+ (id)getAssetFileName:(unsigned int)a3
{
  _sSo20SecureAssetTypeUtilsC010CoreSpeechD0E03getB8FileNameySSSgs6UInt32VFZ_0(a3);
  if (v3)
  {
    v4 = (void *)sub_24C78B7F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (SecureAssetTypeUtils)init
{
  v3.receiver = self;
  v3.super_class = (Class)SecureAssetTypeUtils;
  return [(SecureAssetTypeUtils *)&v3 init];
}

@end