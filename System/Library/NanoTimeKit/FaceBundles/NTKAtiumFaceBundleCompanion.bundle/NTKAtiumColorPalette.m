@interface NTKAtiumColorPalette
- (BOOL)isRainbow;
- (BOOL)isThreeColor;
- (NTKAtiumColorPalette)init;
- (float)tritiumMaskMultiplier;
- (id)_handsColor;
- (id)_lightColor1;
- (id)_lightColor2;
- (id)_lightColor3;
- (id)swatchImageForSize:(CGSize)a3;
@end

@implementation NTKAtiumColorPalette

- (NTKAtiumColorPalette)init
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)NTKAtiumColorPalette;
  return [(NTKAtiumColorPalette *)&v5 initWithFaceClass:v3];
}

- (id)_lightColor1
{
  v2 = [(NTKAtiumColorPalette *)self primaryColor];
  uint64_t v3 = NTKColorByModifyingHSB();

  return v3;
}

- (id)_lightColor2
{
  double v10 = 0.0;
  double v11 = 0.0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v3 = [(NTKAtiumColorPalette *)self primaryColor];
  unsigned int v4 = [v3 getHue:&v11 saturation:&v10 brightness:&v9 alpha:&v8];

  if (v4)
  {
    double v5 = 0.3;
    if (v10 * 0.5 <= 0.3) {
      double v5 = v10 * 0.5;
    }
    double v10 = v5;
    uint64_t v9 = 0x3FF0000000000000;
    v6 = +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v11);
  }
  else
  {
    v6 = [(NTKAtiumColorPalette *)self primaryColor];
  }

  return v6;
}

- (id)_lightColor3
{
  v2 = [(NTKAtiumColorPalette *)self primaryColor];
  uint64_t v3 = NTKColorByModifyingHSB();

  return v3;
}

- (id)_handsColor
{
  if ([(NTKAtiumColorPalette *)self hasPrimaryColorRange])
  {
    uint64_t v3 = [(NTKAtiumColorPalette *)self primaryColorWithFraction:0.0];
  }
  else
  {
    unsigned int v4 = [(NTKAtiumColorPalette *)self lightColor1];
    uint64_t v3 = NTKColorByApplyingWhiteOverlay();
  }

  return v3;
}

- (BOOL)isThreeColor
{
  uint64_t v3 = [(NTKAtiumColorPalette *)self configuration];
  unsigned int v4 = [v3 colorOption];
  if ([v4 containsString:@"threecolor"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKAtiumColorPalette;
    unsigned __int8 v5 = [(NTKAtiumColorPalette *)&v7 isUnityColor];
  }

  return v5;
}

- (BOOL)isRainbow
{
  v2 = [(NTKAtiumColorPalette *)self configuration];
  uint64_t v3 = [v2 colorOption];
  unsigned __int8 v4 = [v3 isEqualToString:@"rainbow"];

  return v4;
}

- (float)tritiumMaskMultiplier
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAtiumColorPalette;
  unsigned int v2 = [(NTKAtiumColorPalette *)&v4 isUnityColor];
  float result = 1.0;
  if (v2) {
    return 2.0;
  }
  return result;
}

- (id)swatchImageForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(NTKAtiumColorPalette *)self isRainbow])
  {
    v18.receiver = self;
    v18.super_class = (Class)NTKAtiumColorPalette;
    -[NTKAtiumColorPalette swatchImageForSize:](&v18, "swatchImageForSize:", width, height);
    v6 = LABEL_5:;
    goto LABEL_6;
  }
  v17.receiver = self;
  v17.super_class = (Class)NTKAtiumColorPalette;
  if ([(NTKAtiumColorPalette *)&v17 isUnityColor])
  {
    v16.receiver = self;
    v16.super_class = (Class)NTKAtiumColorPalette;
    -[NTKAtiumColorPalette swatchImageForSize:](&v16, "swatchImageForSize:", width, height);
    goto LABEL_5;
  }
  if ([(NTKAtiumColorPalette *)self isThreeColor])
  {
    if (qword_121F8 != -1) {
      dispatch_once(&qword_121F8, &stru_C488);
    }
    uint64_t v8 = [(NTKAtiumColorPalette *)self configuration];
    uint64_t v9 = [v8 uniqueId];
    v21.double width = width;
    v21.double height = height;
    double v10 = NSStringFromCGSize(v21);
    double v11 = +[NSString stringWithFormat:@"%@-%@", v9, v10];

    v6 = [(id)qword_121F0 objectForKey:v11];
    if (!v6)
    {
      v12 = [(NTKAtiumColorPalette *)self lightColor1];
      v19[0] = v12;
      v13 = [(NTKAtiumColorPalette *)self lightColor2];
      v19[1] = v13;
      v14 = [(NTKAtiumColorPalette *)self lightColor3];
      v19[2] = v14;
      v15 = +[NSArray arrayWithObjects:v19 count:3];

      v6 = NTKSwatchColorSectorsImage();
      [(id)qword_121F0 setObject:v6 forKey:v11];
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_6:

  return v6;
}

@end