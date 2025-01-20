@interface NSCollectionLayoutSize(MapsUILayout)
+ (id)_mapsui_layoutSizeWithFractionalWidth:()MapsUILayout fractionalHeight:;
+ (id)_mapsui_layoutSizeWithFractionalWidth:()MapsUILayout fractionalHeightUsingWidth:;
+ (id)_mapsui_layoutSizeWithFractionalWidth:()MapsUILayout height:;
@end

@implementation NSCollectionLayoutSize(MapsUILayout)

+ (id)_mapsui_layoutSizeWithFractionalWidth:()MapsUILayout fractionalHeight:
{
  v3 = (void *)MEMORY[0x1E4FB1338];
  v4 = objc_msgSend(MEMORY[0x1E4FB1308], "fractionalWidthDimension:");
  v5 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:a2];
  v6 = [v3 sizeWithWidthDimension:v4 heightDimension:v5];

  return v6;
}

+ (id)_mapsui_layoutSizeWithFractionalWidth:()MapsUILayout fractionalHeightUsingWidth:
{
  v3 = (void *)MEMORY[0x1E4FB1338];
  v4 = objc_msgSend(MEMORY[0x1E4FB1308], "fractionalWidthDimension:");
  v5 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:a2];
  v6 = [v3 sizeWithWidthDimension:v4 heightDimension:v5];

  return v6;
}

+ (id)_mapsui_layoutSizeWithFractionalWidth:()MapsUILayout height:
{
  v3 = (void *)MEMORY[0x1E4FB1338];
  v4 = objc_msgSend(MEMORY[0x1E4FB1308], "fractionalWidthDimension:");
  v5 = [MEMORY[0x1E4FB1308] absoluteDimension:a2];
  v6 = [v3 sizeWithWidthDimension:v4 heightDimension:v5];

  return v6;
}

@end