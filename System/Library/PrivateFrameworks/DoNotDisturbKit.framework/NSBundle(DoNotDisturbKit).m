@interface NSBundle(DoNotDisturbKit)
+ (id)dndk_localizationBundle;
@end

@implementation NSBundle(DoNotDisturbKit)

+ (id)dndk_localizationBundle
{
  if (dndk_localizationBundle_onceToken != -1) {
    dispatch_once(&dndk_localizationBundle_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)dndk_localizationBundle_bundle;
  return v0;
}

@end