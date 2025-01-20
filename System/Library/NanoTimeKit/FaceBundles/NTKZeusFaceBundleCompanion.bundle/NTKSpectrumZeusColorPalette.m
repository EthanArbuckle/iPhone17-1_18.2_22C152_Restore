@interface NTKSpectrumZeusColorPalette
- (NTKSpectrumZeusColorPalette)init;
- (id)_secondHandColor;
@end

@implementation NTKSpectrumZeusColorPalette

- (NTKSpectrumZeusColorPalette)init
{
  uint64_t v3 = objc_opt_class();

  return [(NTKSpectrumZeusColorPalette *)self initWithFaceClass:v3];
}

- (id)_secondHandColor
{
  return +[UIColor clearColor];
}

@end