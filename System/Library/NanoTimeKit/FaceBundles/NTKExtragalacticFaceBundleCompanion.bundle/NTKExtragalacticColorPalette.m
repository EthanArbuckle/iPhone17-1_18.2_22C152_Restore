@interface NTKExtragalacticColorPalette
- (NTKExtragalacticColorPalette)init;
@end

@implementation NTKExtragalacticColorPalette

- (NTKExtragalacticColorPalette)init
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)NTKExtragalacticColorPalette;
  return [(NTKFaceColorPalette *)&v5 initWithFaceClass:v3];
}

@end