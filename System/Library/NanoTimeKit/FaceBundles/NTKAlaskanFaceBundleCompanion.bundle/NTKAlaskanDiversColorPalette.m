@interface NTKAlaskanDiversColorPalette
- (NTKAlaskanDiversColorPalette)init;
- (id)_activeBackground;
- (id)_activeDialTicks;
- (id)_activeStateDateComplication;
- (id)_dateComplication;
- (id)_markerOutlineColor;
- (id)_ring;
@end

@implementation NTKAlaskanDiversColorPalette

- (NTKAlaskanDiversColorPalette)init
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)NTKAlaskanDiversColorPalette;
  return [(NTKAlaskanDiversColorPalette *)&v5 initWithFaceClass:v3];
}

- (id)_activeDialTicks
{
  v2 = [(NTKAlaskanDiversColorPalette *)self markers];
  uint64_t v3 = [v2 colorWithAlphaComponent:0.6];

  return v3;
}

- (id)_markerOutlineColor
{
  if ([(NTKAlaskanDiversColorPalette *)self isEvergreenCollection])
  {
    uint64_t v3 = [(NTKAlaskanDiversColorPalette *)self markers];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_activeBackground
{
  [(NTKAlaskanDiversColorPalette *)self isEvergreenCollection];
  uint64_t v3 = [(NTKAlaskanDiversColorPalette *)self primaryColor];
  v4 = NTKColorByApplyingBlackOverlay();

  return v4;
}

- (id)_ring
{
  unsigned __int8 v3 = [(NTKAlaskanDiversColorPalette *)self isEvergreenCollection];
  v4 = [(NTKAlaskanDiversColorPalette *)self primaryColor];
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = NTKColorByApplyingBlackOverlay();

    v4 = (void *)v5;
  }

  return v4;
}

- (id)_activeStateDateComplication
{
  if ([(NTKAlaskanDiversColorPalette *)self isEvergreenCollection]) {
    [(NTKAlaskanDiversColorPalette *)self primaryColor];
  }
  else {
  unsigned __int8 v3 = [(NTKAlaskanDiversColorPalette *)self dateComplication];
  }

  return v3;
}

- (id)_dateComplication
{
  return +[UIColor whiteColor];
}

@end