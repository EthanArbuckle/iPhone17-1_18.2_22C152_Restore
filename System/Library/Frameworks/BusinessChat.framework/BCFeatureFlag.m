@interface BCFeatureFlag
+ (BOOL)isFeatureEnabledForFeature:(int64_t)a3;
@end

@implementation BCFeatureFlag

+ (BOOL)isFeatureEnabledForFeature:(int64_t)a3
{
  if (a3 == 1) {
    return MEMORY[0x270ED8070]("Messages", "BIA");
  }
  else {
    return 0;
  }
}

@end