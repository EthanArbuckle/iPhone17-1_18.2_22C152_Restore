@interface DTAppClipSettings
+ (BOOL)isAvailable;
- (DTAppClipSettings)init;
@end

@implementation DTAppClipSettings

+ (BOOL)isAvailable
{
  v2 = sub_1A1F4();
  BOOL v3 = v2 != 0;

  return v3;
}

- (DTAppClipSettings)init
{
  BOOL v3 = sub_1A1F4();
  v4 = (objc_class *)[v3 principalClass];

  v5 = (DTAppClipSettings *)objc_alloc_init(v4);
  return v5;
}

@end