@interface NTKHadesColorPalette
- (NTKHadesColorPalette)init;
- (UIColor)swatch;
- (id)_secondHand;
- (id)tritium_background;
- (id)tritium_numbers;
@end

@implementation NTKHadesColorPalette

- (NTKHadesColorPalette)init
{
  v3 = +[NTKHadesFace pigmentFaceDomain];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v9.receiver = self;
  v9.super_class = (Class)NTKHadesColorPalette;
  v5 = [(NTKHadesColorPalette *)&v9 initWithDomainName:v3 inBundle:v4];

  if (v5)
  {
    v6 = objc_alloc_init(NTKZeusColorPalette);
    zeusPalette = v5->_zeusPalette;
    v5->_zeusPalette = v6;
  }
  return v5;
}

- (id)_secondHand
{
  return [(NTKZeusColorPalette *)self->_zeusPalette orange];
}

- (UIColor)swatch
{
  v3 = [(NTKHadesColorPalette *)self pigmentEditOption];
  v4 = [v3 collectionName];
  unsigned int v5 = [v4 isEqual:@"hades.seasons.fall2021"];

  if (v5)
  {
    v6 = [(NTKHadesColorPalette *)self background];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKHadesColorPalette;
    v6 = [(NTKHadesColorPalette *)&v8 swatch];
  }

  return (UIColor *)v6;
}

- (id)tritium_numbers
{
  v3 = [(NTKHadesColorPalette *)self numbers];
  v4 = [(NTKHadesColorPalette *)self background];
  uint64_t v5 = CLKUICompareColorsByLightness();

  if (v5 == -1) {
    [(NTKHadesColorPalette *)self background];
  }
  else {
  v6 = [(NTKHadesColorPalette *)self numbers];
  }

  return v6;
}

- (id)tritium_background
{
  return +[UIColor blackColor];
}

- (void).cxx_destruct
{
}

@end