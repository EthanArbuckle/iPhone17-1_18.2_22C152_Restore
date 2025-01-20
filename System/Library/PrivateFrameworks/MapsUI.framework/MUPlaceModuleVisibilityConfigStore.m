@interface MUPlaceModuleVisibilityConfigStore
+ (double)visibilityThresholdForModuleType:(int)a3;
@end

@implementation MUPlaceModuleVisibilityConfigStore

+ (double)visibilityThresholdForModuleType:(int)a3
{
  GEOConfigGetDouble();
  return result;
}

@end