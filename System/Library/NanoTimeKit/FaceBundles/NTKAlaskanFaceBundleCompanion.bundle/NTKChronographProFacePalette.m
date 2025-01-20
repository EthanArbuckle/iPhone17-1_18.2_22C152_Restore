@interface NTKChronographProFacePalette
- (BOOL)_isCloudBlueColor;
- (BOOL)_isGrayColor;
- (BOOL)_isWhiteColor;
- (BOOL)_shouldUseEvergreenColorScheme;
- (NTKChronographProFacePalette)init;
- (id)_backgroundChronometerMode;
- (id)_dialTicksSecondary;
- (id)_ring;
- (id)_subdialClockTicksSecondary;
@end

@implementation NTKChronographProFacePalette

- (NTKChronographProFacePalette)init
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)NTKChronographProFacePalette;
  return [(NTKChronographProFacePalette *)&v5 initWithFaceClass:v3];
}

- (id)_ring
{
  unsigned __int8 v3 = [(NTKChronographProFacePalette *)self _shouldUseEvergreenColorScheme];
  v4 = [(NTKChronographProFacePalette *)self primaryColor];
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = NTKColorByApplyingBlackOverlay();

    v4 = (void *)v5;
  }

  return v4;
}

- (id)_dialTicksSecondary
{
  v2 = [(NTKChronographProFacePalette *)self dialTicks];
  unsigned __int8 v3 = [v2 colorWithAlphaComponent:0.4];

  return v3;
}

- (id)_subdialClockTicksSecondary
{
  v2 = [(NTKChronographProFacePalette *)self subdialClockTicks];
  unsigned __int8 v3 = [v2 colorWithAlphaComponent:0.3];

  return v3;
}

- (id)_backgroundChronometerMode
{
  if ([(NTKChronographProFacePalette *)self _shouldUseEvergreenColorScheme]) {
    [(NTKChronographProFacePalette *)self ring];
  }
  else {
  unsigned __int8 v3 = [(NTKChronographProFacePalette *)self primaryColor];
  }
  v4 = NTKColorByApplyingBlackOverlay();

  return v4;
}

- (BOOL)_isWhiteColor
{
  v2 = [(NTKChronographProFacePalette *)self pigmentEditOption];
  unsigned __int8 v3 = [v2 fullname];
  if ([v3 isEqualToString:ntk_seasons_spring2015_white]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:ntk_evergreen_white];
  }

  return v4;
}

- (BOOL)_isGrayColor
{
  v2 = [(NTKChronographProFacePalette *)self pigmentEditOption];
  unsigned __int8 v3 = [v2 fullname];
  unsigned __int8 v4 = [v3 isEqualToString:ntk_standard_gray];

  return v4;
}

- (BOOL)_isCloudBlueColor
{
  v2 = [(NTKChronographProFacePalette *)self pigmentEditOption];
  unsigned __int8 v3 = [v2 fullname];
  unsigned __int8 v4 = [v3 isEqualToString:ntk_seasons_summer2021_cloudBlue];

  return v4;
}

- (BOOL)_shouldUseEvergreenColorScheme
{
  unsigned __int8 v3 = [(NTKChronographProFacePalette *)self isEvergreenCollection];
  unsigned __int8 v4 = [(NTKChronographProFacePalette *)self pigmentEditOption];
  uint64_t v5 = [v4 collectionName];
  if ([v5 isEqual:ntk_seasons_fall2021])
  {
    v6 = [(NTKChronographProFacePalette *)self pigmentEditOption];
    v7 = [v6 identifier];
    if ([v7 isEqual:ntk_seasons_fall2021_purple1])
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      v9 = [(NTKChronographProFacePalette *)self pigmentEditOption];
      v10 = [v9 identifier];
      unsigned int v8 = [v10 isEqual:ntk_seasons_fall2021_purple2] ^ 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v3 | v8;
}

@end