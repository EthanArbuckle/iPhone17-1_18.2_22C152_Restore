@interface NTKPlumeriaColorPalette
- (id)swatchImageForSize:(CGSize)a3;
@end

@implementation NTKPlumeriaColorPalette

- (id)swatchImageForSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (qword_13568 != -1) {
    dispatch_once(&qword_13568, &stru_C3A0);
  }
  v6 = [(NTKPlumeriaColorPalette *)self configuration];
  v7 = [v6 uniqueId];
  v18.CGFloat width = width;
  v18.CGFloat height = height;
  v8 = NSStringFromCGSize(v18);
  v9 = +[NSString stringWithFormat:@"%@-%@", v7, v8];

  v10 = [(id)qword_13560 objectForKey:v9];
  if (!v10)
  {
    v11 = [(NTKPlumeriaColorPalette *)self configuration];
    v12 = [v11 colorOption];
    int v13 = NTKPlumeriaSettingIndexFromColorwayName(v12);

    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    if (!v14 || (NTKImageNamedFromBundle(), (v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v15 = generateColorArray(v13);
      v10 = NTKSwatchColorSectorsImage();
    }
    [(id)qword_13560 setObject:v10 forKey:v9];
  }

  return v10;
}

@end