@interface CSHorizontalScrollFailureRecognizerSettings
+ (id)settingsControllerModule;
- (BOOL)enabled;
- (BOOL)viewDebugArea;
- (double)bottomAngle;
- (double)topAngle;
- (unint64_t)maxAllowableVerticalOffset;
- (void)setBottomAngle:(double)a3;
- (void)setDefaultValues;
- (void)setEnabled:(BOOL)a3;
- (void)setMaxAllowableVerticalOffset:(unint64_t)a3;
- (void)setTopAngle:(double)a3;
- (void)setViewDebugArea:(BOOL)a3;
@end

@implementation CSHorizontalScrollFailureRecognizerSettings

- (void)setDefaultValues
{
  [(CSHorizontalScrollFailureRecognizerSettings *)self setEnabled:1];
  [(CSHorizontalScrollFailureRecognizerSettings *)self setViewDebugArea:0];
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v5 = 130;
  }
  else {
    uint64_t v5 = 15;
  }
  [(CSHorizontalScrollFailureRecognizerSettings *)self setMaxAllowableVerticalOffset:v5];
  [(CSHorizontalScrollFailureRecognizerSettings *)self setTopAngle:34.0];

  [(CSHorizontalScrollFailureRecognizerSettings *)self setBottomAngle:34.0];
}

+ (id)settingsControllerModule
{
  v22[3] = *MEMORY[0x1E4F143B8];
  v19 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Failure Recognizer Enabled?" valueKeyPath:@"enabled"];
  v2 = [MEMORY[0x1E4F941F0] rowWithTitle:@"View Debug Area" valueKeyPath:@"viewDebugArea"];
  v3 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Vertical Offset" valueKeyPath:@"maxAllowableVerticalOffset"];
  uint64_t v4 = [v3 minValue:0.0 maxValue:480.0];

  uint64_t v5 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Top Angle" valueKeyPath:@"topAngle"];
  v6 = [v5 minValue:0.0 maxValue:90.0];

  v7 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Bottom Angle" valueKeyPath:@"bottomAngle"];
  v8 = [v7 minValue:0.0 maxValue:90.0];

  v9 = (void *)MEMORY[0x1E4F94160];
  v22[0] = v19;
  v22[1] = v2;
  v22[2] = v4;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  v11 = [v9 sectionWithRows:v10];

  v12 = (void *)MEMORY[0x1E4F94160];
  v21[0] = v6;
  v21[1] = v8;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v14 = [v12 sectionWithRows:v13];

  v15 = (void *)MEMORY[0x1E4F94160];
  v20[0] = v11;
  v20[1] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v17 = [v15 moduleWithTitle:@"Slide To Unlock Failure Recognizer Settings" contents:v16];

  return v17;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)viewDebugArea
{
  return self->_viewDebugArea;
}

- (void)setViewDebugArea:(BOOL)a3
{
  self->_viewDebugArea = a3;
}

- (unint64_t)maxAllowableVerticalOffset
{
  return self->_maxAllowableVerticalOffset;
}

- (void)setMaxAllowableVerticalOffset:(unint64_t)a3
{
  self->_maxAllowableVerticalOffset = a3;
}

- (double)topAngle
{
  return self->_topAngle;
}

- (void)setTopAngle:(double)a3
{
  self->_topAngle = a3;
}

- (double)bottomAngle
{
  return self->_bottomAngle;
}

- (void)setBottomAngle:(double)a3
{
  self->_bottomAngle = a3;
}

@end