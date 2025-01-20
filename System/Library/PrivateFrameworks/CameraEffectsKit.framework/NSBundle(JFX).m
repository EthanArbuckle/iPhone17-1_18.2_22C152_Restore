@interface NSBundle(JFX)
+ (id)jfxBundle;
@end

@implementation NSBundle(JFX)

+ (id)jfxBundle
{
  if (jfxBundle_onceToken != -1) {
    dispatch_once(&jfxBundle_onceToken, &__block_literal_global_28);
  }
  v0 = (void *)jfxBundle_jfxBundle;
  return v0;
}

@end