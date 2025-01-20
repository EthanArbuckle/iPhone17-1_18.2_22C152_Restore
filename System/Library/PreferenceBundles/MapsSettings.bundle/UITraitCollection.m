@interface UITraitCollection
- (BOOL)isLuminanceReduced;
- (double)_maps_displayScaleOrMainScreenScale;
- (id)_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:(id)a3 maximumContentSizeCategory:(id)a4;
- (id)_maps_traitCollectionWithMaximumContentSizeCategory:(id)a3;
@end

@implementation UITraitCollection

- (double)_maps_displayScaleOrMainScreenScale
{
  [(UITraitCollection *)self displayScale];
  if (result == 0.0)
  {
    v3 = +[UIScreen mainScreen];
    [v3 scale];
    double v5 = v4;

    return v5;
  }
  return result;
}

- (id)_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:(id)a3 maximumContentSizeCategory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(UITraitCollection *)self preferredContentSizeCategory];
  MapsUIContentSizeCategoryClamp(v8, v7, v6);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v8
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, UIContentSizeCategoryUnspecified)
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, v9))
  {
    v14[0] = self;
    v10 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v9];
    v14[1] = v10;
    v11 = +[NSArray arrayWithObjects:v14 count:2];
    v12 = +[UITraitCollection traitCollectionWithTraitsFromCollections:v11];
  }
  else
  {
    v12 = self;
  }

  return v12;
}

- (id)_maps_traitCollectionWithMaximumContentSizeCategory:(id)a3
{
  return [(UITraitCollection *)self _maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:UIContentSizeCategoryExtraSmall maximumContentSizeCategory:a3];
}

- (BOOL)isLuminanceReduced
{
  return [(UITraitCollection *)self _backlightLuminance] == (char *)&dword_0 + 1;
}

@end