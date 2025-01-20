@interface STKDeclarations
+ (id)appFromBalloonPlugin:(id)a3;
+ (void)setIsAppInstallationAvailable:(BOOL)a3 forBalloonPluginManager:(id)a4;
+ (void)setStickerEffectType:(unint64_t)a3 onSticker:(id)a4;
@end

@implementation STKDeclarations

+ (void)setStickerEffectType:(unint64_t)a3 onSticker:(id)a4
{
}

+ (void)setIsAppInstallationAvailable:(BOOL)a3 forBalloonPluginManager:(id)a4
{
}

+ (id)appFromBalloonPlugin:(id)a3
{
  return (id)[a3 app];
}

@end