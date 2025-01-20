@interface NBBridgeUtilities
+ (BOOL)isExplicitMaterialAllowed;
+ (CGSize)addAudiobookIconSize;
+ (CGSize)placeholderIconSize;
+ (id)addAudiobookBackgroundColor;
+ (id)audiobookArtworkPlaceholderImage;
+ (id)placeholderTintColor;
@end

@implementation NBBridgeUtilities

+ (CGSize)addAudiobookIconSize
{
  double v2 = 24.0;
  double v3 = 24.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)addAudiobookBackgroundColor
{
  return +[UIColor colorWithRed:0.247058824 green:0.247058824 blue:0.254901961 alpha:1.0];
}

+ (CGSize)placeholderIconSize
{
  double v2 = 144.0;
  double v3 = 144.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)placeholderTintColor
{
  return +[UIColor colorWithRed:0.68627451 green:0.705882353 blue:0.745098039 alpha:1.0];
}

+ (id)audiobookArtworkPlaceholderImage
{
  double v2 = NBBundle();
  double v3 = +[UIImage imageNamed:@"MissingArtworkHeadphones" inBundle:v2];
  v4 = [v3 imageWithRenderingMode:2];

  +[NMBUIMediaTableCell artworkSize];
  double v6 = v5;
  +[NMBUIMediaTableCell artworkSize];
  double height = v13.height;
  v13.width = v6;
  UIGraphicsBeginImageContextWithOptions(v13, 1, 0.0);
  v8 = +[NBBridgeUtilities addAudiobookBackgroundColor];
  [v8 set];

  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = v6;
  v14.size.double height = height;
  UIRectFill(v14);
  v9 = +[NBBridgeUtilities placeholderTintColor];
  [v9 set];

  objc_msgSend(v4, "drawInRect:", 0.0, 0.0, v6, height);
  v10 = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();

  return v10;
}

+ (BOOL)isExplicitMaterialAllowed
{
  double v2 = +[MCProfileConnection sharedConnection];
  unsigned int v3 = [v2 effectiveBoolValueForSetting:MCFeatureBookstoreEroticaAllowed];

  return v3 != 2;
}

@end