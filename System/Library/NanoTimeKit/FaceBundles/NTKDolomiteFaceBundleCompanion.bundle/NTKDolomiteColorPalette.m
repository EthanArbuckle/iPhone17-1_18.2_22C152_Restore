@interface NTKDolomiteColorPalette
+ (id)defaultColorPalette;
- (BOOL)isDynamic;
- (NSNumber)dynamicPercent;
- (NSNumber)isHardwareColor;
- (NSNumber)isJetBlack;
- (id)swatchImageForSize:(CGSize)a3;
@end

@implementation NTKDolomiteColorPalette

+ (id)defaultColorPalette
{
  v2 = objc_opt_new();

  return v2;
}

- (NSNumber)dynamicPercent
{
  *(float *)&double v2 = (float)[(NTKDolomiteColorPalette *)self isDynamic];

  return +[NSNumber numberWithFloat:v2];
}

- (id)swatchImageForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(NTKDolomiteColorPalette *)self isDynamic])
  {
    v30.receiver = self;
    v30.super_class = (Class)NTKDolomiteColorPalette;
    v6 = -[NTKDolomiteColorPalette swatchImageForSize:](&v30, "swatchImageForSize:", width, height);
    goto LABEL_23;
  }
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    +[NTKEditOption sizeForSwatchStyle:0];
    double width = v8;
    double height = v9;
  }
  v10 = [(NTKDolomiteColorPalette *)self northColor];
  v11 = [(NTKDolomiteColorPalette *)self southColor];
  double v29 = 0.0;
  double v27 = 0.0;
  double v28 = 0.0;
  uint64_t v26 = 0;
  [v10 getRed:&v29 green:&v28 blue:&v27 alpha:&v26];
  if (v29 < 2.22044605e-16 && v28 < 2.22044605e-16 && v27 < 2.22044605e-16)
  {
    uint64_t v16 = +[UIColor colorWithRed:0.101960786 green:0.101960786 blue:0.101960786 alpha:1.0];
    v15 = v10;
    v10 = (void *)v16;
  }
  else
  {
    objc_msgSend(v11, "getRed:green:blue:alpha:", &v29, &v28, &v27, &v26, 2.22044605e-16, v28, v27);
    if (v29 >= 2.22044605e-16 || v28 >= 2.22044605e-16 || v27 >= 2.22044605e-16) {
      goto LABEL_22;
    }
    uint64_t v14 = +[UIColor colorWithRed:0.101960786 green:0.101960786 blue:0.101960786 alpha:1.0];
    v15 = v11;
    v11 = (void *)v14;
  }

LABEL_22:
  id v17 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", width, height);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1640;
  v21[3] = &unk_D583F8;
  double v24 = width;
  double v25 = height;
  id v22 = v10;
  id v23 = v11;
  id v18 = v11;
  id v19 = v10;
  v6 = [v17 imageWithActions:v21];

LABEL_23:

  return v6;
}

- (BOOL)isDynamic
{
  double v2 = [(NTKDolomiteColorPalette *)self configuration];
  v3 = [v2 colorOption];
  unsigned __int8 v4 = [v3 isEqualToString:@"dynamic"];

  return v4;
}

- (NSNumber)isHardwareColor
{
  v3 = [(NTKDolomiteColorPalette *)self configuration];
  unsigned __int8 v4 = [v3 colorOption];
  if ([v4 containsString:@"silver"]) {
    goto LABEL_4;
  }
  v5 = [(NTKDolomiteColorPalette *)self configuration];
  v6 = [v5 colorOption];
  if ([v6 containsString:@"rosegold"])
  {

LABEL_4:
    LODWORD(v7) = 1.0;
    goto LABEL_7;
  }
  double v8 = [(NTKDolomiteColorPalette *)self configuration];
  double v9 = [v8 colorOption];
  unsigned int v10 = [v9 containsString:@"jetblack"];

  double v7 = 0.0;
  if (v10) {
    *(float *)&double v7 = 1.0;
  }
LABEL_7:
  v11 = +[NSNumber numberWithFloat:v7];

  return (NSNumber *)v11;
}

- (NSNumber)isJetBlack
{
  double v2 = [(NTKDolomiteColorPalette *)self configuration];
  v3 = [v2 colorOption];
  unsigned int v4 = [v3 containsString:@"jetblack"];

  double v5 = 0.0;
  if (v4) {
    *(float *)&double v5 = 1.0;
  }
  v6 = +[NSNumber numberWithFloat:v5];

  return (NSNumber *)v6;
}

@end