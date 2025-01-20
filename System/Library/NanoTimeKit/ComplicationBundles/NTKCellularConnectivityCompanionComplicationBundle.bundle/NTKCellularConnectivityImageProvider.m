@interface NTKCellularConnectivityImageProvider
- (BOOL)animateSearchingState;
- (BOOL)cutoutImageFromPlatter;
- (BOOL)isDisconnected;
- (BOOL)needsPlatter;
- (BOOL)showsAsDots;
- (NSNumber)imageSize;
- (NSNumber)imageVerticalOffsetScaleFromWidth;
- (NTKCellularConnectivityImageProvider)init;
- (NTKCellularConnectivityImageProvider)initWithDotLayoutConstraints:(id)a3;
- (NTKExplorerDotColorOptions)dotColorOptions;
- (NTKExplorerDotLayoutConstraints)dotLayoutConstraints;
- (UIColor)imageOverrideColor;
- (UIColor)platterOverrideColor;
- (UIColor)tritiumPlatterColor;
- (double)imageAlpha;
- (double)platterAlpha;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)numDotsFilled;
- (void)finalizeWithPointSize:(id)a3 weight:(int64_t)a4 maxSDKSize:(CGSize)a5 maxDeviceSize:(CGSize)a6 maskToCircle:(BOOL)a7;
- (void)setAnimateSearchingState:(BOOL)a3;
- (void)setCutoutImageFromPlatter:(BOOL)a3;
- (void)setDisconnected:(BOOL)a3;
- (void)setDotColorOptions:(id)a3;
- (void)setDotLayoutConstraints:(id)a3;
- (void)setImageAlpha:(double)a3;
- (void)setImageOverrideColor:(id)a3;
- (void)setImageSize:(id)a3;
- (void)setImageVerticalOffsetScaleFromWidth:(id)a3;
- (void)setNeedsPlatter:(BOOL)a3;
- (void)setNumDotsFilled:(unint64_t)a3;
- (void)setPlatterAlpha:(double)a3;
- (void)setPlatterOverrideColor:(id)a3;
- (void)setShowsAsDots:(BOOL)a3;
- (void)setTritiumPlatterColor:(id)a3;
@end

@implementation NTKCellularConnectivityImageProvider

- (NTKCellularConnectivityImageProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCellularConnectivityImageProvider;
  v2 = [(NTKCellularConnectivityImageProvider *)&v5 initWithSystemName:@"antenna.radiowaves.left.and.right"];
  v3 = v2;
  if (v2) {
    [(NTKCellularConnectivityImageProvider *)v2 setImageViewCreationHandler:&stru_8268];
  }
  return v3;
}

- (NTKCellularConnectivityImageProvider)initWithDotLayoutConstraints:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCellularConnectivityImageProvider;
  v3 = [(NTKCellularConnectivityImageProvider *)&v6 initWithSystemName:@"antenna.radiowaves.left.and.right"];
  v4 = v3;
  if (v3) {
    [(NTKCellularConnectivityImageProvider *)v3 setImageViewCreationHandler:&stru_8288];
  }
  return v4;
}

- (void)finalizeWithPointSize:(id)a3 weight:(int64_t)a4 maxSDKSize:(CGSize)a5 maxDeviceSize:(CGSize)a6 maskToCircle:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.height;
  double width = a6.width;
  double v10 = a5.height;
  double v11 = a5.width;
  v14 = (NSNumber *)a3;
  if (!v14) {
    v14 = self->_imageSize;
  }
  v15.receiver = self;
  v15.super_class = (Class)NTKCellularConnectivityImageProvider;
  -[NTKCellularConnectivityImageProvider finalizeWithPointSize:weight:maxSDKSize:maxDeviceSize:maskToCircle:](&v15, "finalizeWithPointSize:weight:maxSDKSize:maxDeviceSize:maskToCircle:", v14, a4, v7, v11, v10, width, height);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NTKCellularConnectivityImageProvider;
  id v5 = -[NTKCellularConnectivityImageProvider copyWithZone:](&v12, "copyWithZone:");
  objc_super v6 = v5;
  if (v5)
  {
    [v5 setNeedsPlatter:self->_needsPlatter];
    [v6 setPlatterAlpha:self->_platterAlpha];
    id v7 = [(UIColor *)self->_platterOverrideColor copyWithZone:a3];
    [v6 setPlatterOverrideColor:v7];

    id v8 = [(NSNumber *)self->_imageSize copyWithZone:a3];
    [v6 setImageSize:v8];

    id v9 = [(NSNumber *)self->_imageVerticalOffsetScaleFromWidth copyWithZone:a3];
    [v6 setImageVerticalOffsetScaleFromWidth:v9];

    [v6 setImageAlpha:self->_imageAlpha];
    id v10 = [(UIColor *)self->_imageOverrideColor copyWithZone:a3];
    [v6 setImageOverrideColor:v10];

    [v6 setDotLayoutConstraints:self->_dotLayoutConstraints];
    [v6 setNumDotsFilled:self->_numDotsFilled];
    [v6 setShowsAsDots:self->_showsAsDots];
    [v6 setDisconnected:self->_disconnected];
    [v6 setAnimateSearchingState:self->_animateSearchingState];
    [v6 setDotColorOptions:self->_dotColorOptions];
  }
  return v6;
}

- (BOOL)needsPlatter
{
  return self->_needsPlatter;
}

- (void)setNeedsPlatter:(BOOL)a3
{
  self->_needsPlatter = a3;
}

- (double)platterAlpha
{
  return self->_platterAlpha;
}

- (void)setPlatterAlpha:(double)a3
{
  self->_platterAlpha = a3;
}

- (BOOL)cutoutImageFromPlatter
{
  return self->_cutoutImageFromPlatter;
}

- (void)setCutoutImageFromPlatter:(BOOL)a3
{
  self->_cutoutImageFromPlatter = a3;
}

- (UIColor)platterOverrideColor
{
  return self->_platterOverrideColor;
}

- (void)setPlatterOverrideColor:(id)a3
{
}

- (UIColor)tritiumPlatterColor
{
  return self->_tritiumPlatterColor;
}

- (void)setTritiumPlatterColor:(id)a3
{
}

- (NSNumber)imageSize
{
  return self->_imageSize;
}

- (void)setImageSize:(id)a3
{
}

- (NSNumber)imageVerticalOffsetScaleFromWidth
{
  return self->_imageVerticalOffsetScaleFromWidth;
}

- (void)setImageVerticalOffsetScaleFromWidth:(id)a3
{
}

- (BOOL)showsAsDots
{
  return self->_showsAsDots;
}

- (void)setShowsAsDots:(BOOL)a3
{
  self->_showsAsDots = a3;
}

- (BOOL)isDisconnected
{
  return self->_disconnected;
}

- (void)setDisconnected:(BOOL)a3
{
  self->_disconnected = a3;
}

- (double)imageAlpha
{
  return self->_imageAlpha;
}

- (void)setImageAlpha:(double)a3
{
  self->_imageAlpha = a3;
}

- (UIColor)imageOverrideColor
{
  return self->_imageOverrideColor;
}

- (void)setImageOverrideColor:(id)a3
{
}

- (NTKExplorerDotLayoutConstraints)dotLayoutConstraints
{
  return self->_dotLayoutConstraints;
}

- (void)setDotLayoutConstraints:(id)a3
{
}

- (NTKExplorerDotColorOptions)dotColorOptions
{
  return self->_dotColorOptions;
}

- (void)setDotColorOptions:(id)a3
{
}

- (unint64_t)numDotsFilled
{
  return self->_numDotsFilled;
}

- (void)setNumDotsFilled:(unint64_t)a3
{
  self->_numDotsFilled = a3;
}

- (BOOL)animateSearchingState
{
  return self->_animateSearchingState;
}

- (void)setAnimateSearchingState:(BOOL)a3
{
  self->_animateSearchingState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotColorOptions, 0);
  objc_storeStrong((id *)&self->_dotLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_imageOverrideColor, 0);
  objc_storeStrong((id *)&self->_imageVerticalOffsetScaleFromWidth, 0);
  objc_storeStrong((id *)&self->_imageSize, 0);
  objc_storeStrong((id *)&self->_tritiumPlatterColor, 0);

  objc_storeStrong((id *)&self->_platterOverrideColor, 0);
}

@end