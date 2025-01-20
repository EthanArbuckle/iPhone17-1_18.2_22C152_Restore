@interface UIFont(MapsUIExtras)
+ (id)_mapsui_preferredFontForTextStyle:()MapsUIExtras maxContentSizeCategory:weight:withSymbolicTraits:;
- (id)_mapsui_fontWithMonospacedNumbers;
@end

@implementation UIFont(MapsUIExtras)

+ (id)_mapsui_preferredFontForTextStyle:()MapsUIExtras maxContentSizeCategory:weight:withSymbolicTraits:
{
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4FB1438] sharedApplication];
  v12 = [v11 preferredContentSizeCategory];

  id v13 = v10;
  id v14 = v13;
  if ((id)*MEMORY[0x1E4FB27F0] != v13)
  {
    id v14 = v13;
    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v12, (UIContentSizeCategory)v13) == NSOrderedAscending)
    {
      id v14 = v12;
    }
  }
  v15 = objc_msgSend(MEMORY[0x1E4FB08E0], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", v9, v14, a6, a1);

  return v15;
}

- (id)_mapsui_fontWithMonospacedNumbers
{
  [a1 pointSize];
  double v3 = v2;
  v4 = (void *)MEMORY[0x1E4FB08E0];
  v5 = [a1 fontDescriptor];
  v6 = objc_msgSend(v5, "_mapkit_fontDescriptorByAddingFeaturesForTabularFigures");
  v7 = [v4 fontWithDescriptor:v6 size:v3];

  return v7;
}

@end