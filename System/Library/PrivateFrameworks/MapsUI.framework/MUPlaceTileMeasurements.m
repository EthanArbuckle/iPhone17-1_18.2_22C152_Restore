@interface MUPlaceTileMeasurements
+ (id)defaultMeasurements;
- (double)deviceScale;
- (double)maxFooterHeight;
- (double)maxSubtitleHeight;
- (double)maxTitleHeight;
- (double)tileWidth;
- (void)setDeviceScale:(double)a3;
- (void)setMaxFooterHeight:(double)a3;
- (void)setMaxSubtitleHeight:(double)a3;
- (void)setMaxTitleHeight:(double)a3;
- (void)setTileWidth:(double)a3;
@end

@implementation MUPlaceTileMeasurements

+ (id)defaultMeasurements
{
  v2 = [MEMORY[0x1E4F31038] sharedInstance];
  [v2 screenScale];
  double v4 = v3;

  v5 = objc_alloc_init(MUPlaceTileMeasurements);
  uint64_t v6 = *MEMORY[0x1E4FB28D0];
  v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
  v8 = objc_msgSend(v7, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  double v9 = *MEMORY[0x1E4FB09E0];
  v10 = objc_msgSend(v8, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);
  [v10 _scaledValueForValue:150.0];
  -[MUPlaceTileMeasurements setTileWidth:](v5, "setTileWidth:");

  v11 = (void *)MEMORY[0x1E4FB1930];
  v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v6];
  v13 = objc_msgSend(v12, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v14 = objc_msgSend(v13, "_mapkit_fontWithWeight:", v9);
  objc_msgSend(v11, "_mapsui_maximumHeightWithFont:numberOfLines:displayScale:", v14, 2, v4);
  -[MUPlaceTileMeasurements setMaxTitleHeight:](v5, "setMaxTitleHeight:");

  v15 = (void *)MEMORY[0x1E4FB1930];
  v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  objc_msgSend(v15, "_mapsui_maximumHeightWithFont:numberOfLines:displayScale:", v16, 2, v4);
  -[MUPlaceTileMeasurements setMaxSubtitleHeight:](v5, "setMaxSubtitleHeight:");

  v17 = (void *)MEMORY[0x1E4FB1930];
  v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v19 = objc_msgSend(v18, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  objc_msgSend(v17, "_mapsui_maximumHeightWithFont:numberOfLines:displayScale:", v19, 2, v4);
  -[MUPlaceTileMeasurements setMaxFooterHeight:](v5, "setMaxFooterHeight:");

  [(MUPlaceTileMeasurements *)v5 setDeviceScale:v4];
  return v5;
}

- (double)tileWidth
{
  return self->_tileWidth;
}

- (void)setTileWidth:(double)a3
{
  self->_tileWidth = a3;
}

- (double)maxTitleHeight
{
  return self->_maxTitleHeight;
}

- (void)setMaxTitleHeight:(double)a3
{
  self->_maxTitleHeight = a3;
}

- (double)maxSubtitleHeight
{
  return self->_maxSubtitleHeight;
}

- (void)setMaxSubtitleHeight:(double)a3
{
  self->_maxSubtitleHeight = a3;
}

- (double)maxFooterHeight
{
  return self->_maxFooterHeight;
}

- (void)setMaxFooterHeight:(double)a3
{
  self->_maxFooterHeight = a3;
}

- (double)deviceScale
{
  return self->_deviceScale;
}

- (void)setDeviceScale:(double)a3
{
  self->_deviceScale = a3;
}

@end