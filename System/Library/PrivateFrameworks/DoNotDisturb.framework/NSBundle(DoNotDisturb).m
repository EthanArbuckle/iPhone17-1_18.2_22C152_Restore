@interface NSBundle(DoNotDisturb)
+ (id)dnd_doNotDisturbLocalizationBundle;
+ (id)dnd_locationBundle;
@end

@implementation NSBundle(DoNotDisturb)

+ (id)dnd_doNotDisturbLocalizationBundle
{
  if (dnd_doNotDisturbLocalizationBundle_onceToken != -1) {
    dispatch_once(&dnd_doNotDisturbLocalizationBundle_onceToken, &__block_literal_global_14);
  }
  v0 = (void *)dnd_doNotDisturbLocalizationBundle_bundle;
  return v0;
}

+ (id)dnd_locationBundle
{
  if (dnd_locationBundle_onceToken != -1) {
    dispatch_once(&dnd_locationBundle_onceToken, &__block_literal_global_11);
  }
  v0 = (void *)dnd_locationBundle_bundle;
  return v0;
}

@end