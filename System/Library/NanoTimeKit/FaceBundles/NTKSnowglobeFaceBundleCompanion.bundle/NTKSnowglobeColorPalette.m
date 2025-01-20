@interface NTKSnowglobeColorPalette
- (id)_backlightColor;
- (id)backgroundObjectColors;
@end

@implementation NTKSnowglobeColorPalette

- (id)_backlightColor
{
  double v5 = 0.0;
  v2 = [(NTKSnowglobeColorPalette *)self background];
  [v2 getHue:&v5 saturation:0 brightness:0 alpha:0];

  v3 = [MEMORY[0x1E4F428B8] colorWithHue:v5 saturation:0.2 brightness:0.9 alpha:1.0];

  return v3;
}

- (id)backgroundObjectColors
{
  if (qword_1EA8FCF30 != -1) {
    dispatch_once(&qword_1EA8FCF30, &unk_1F3527FD8);
  }
  v3 = (void *)MEMORY[0x1E4F7A018];
  id v4 = (id)qword_1EA8FCF28;
  double v5 = [v3 sharedInstance];
  v6 = +[NTKSnowglobeFace pigmentFaceDomain];
  v7 = [v5 colorOptionsForDomain:v6 bundle:v4 slot:0];

  v8 = [(NTKSnowglobeColorPalette *)self background];
  v9 = objc_opt_new();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1DAFEE754;
  v14[3] = &unk_1E6BE5350;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  [v7 enumerateObjectsUsingBlock:v14];
  v12 = (void *)[v10 copy];

  return v12;
}

@end