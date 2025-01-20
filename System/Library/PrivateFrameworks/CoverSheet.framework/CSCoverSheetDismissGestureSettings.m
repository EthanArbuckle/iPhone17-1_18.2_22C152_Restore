@interface CSCoverSheetDismissGestureSettings
+ (id)settingsControllerModule;
- (BOOL)extendSwipeUpRegion;
- (BOOL)usesGrapeFlags;
- (double)edgeRegionSize;
- (double)extendedEdgeRegionSize;
- (double)extendedRegionInsetX;
- (double)recognizeAlongEdge;
- (void)setDefaultValues;
- (void)setEdgeRegionSize:(double)a3;
- (void)setExtendSwipeUpRegion:(BOOL)a3;
- (void)setExtendedEdgeRegionSize:(double)a3;
- (void)setExtendedRegionInsetX:(double)a3;
- (void)setRecognizeAlongEdge:(double)a3;
- (void)setUsesGrapeFlags:(BOOL)a3;
@end

@implementation CSCoverSheetDismissGestureSettings

- (BOOL)extendSwipeUpRegion
{
  return self->_extendSwipeUpRegion;
}

- (void)setDefaultValues
{
  if (SBFEffectiveHomeButtonType() == 2 && !MGGetBoolAnswer())
  {
    double v7 = 16.0;
    double v4 = 1.0;
    uint64_t v3 = 1;
    double v5 = 64.0;
    double v6 = 33.75;
  }
  else
  {
    uint64_t v3 = 0;
    double v4 = 0.0;
    double v5 = 33.75;
    double v6 = 72.0;
    double v7 = 0.0;
  }
  [(CSCoverSheetDismissGestureSettings *)self setEdgeRegionSize:v6];
  [(CSCoverSheetDismissGestureSettings *)self setUsesGrapeFlags:v3];
  [(CSCoverSheetDismissGestureSettings *)self setRecognizeAlongEdge:v4];
  [(CSCoverSheetDismissGestureSettings *)self setExtendSwipeUpRegion:v3];
  [(CSCoverSheetDismissGestureSettings *)self setExtendedEdgeRegionSize:v5];

  [(CSCoverSheetDismissGestureSettings *)self setExtendedRegionInsetX:v7];
}

+ (id)settingsControllerModule
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94148] rowWithTitle:@"Edge Region Size" valueKeyPath:@"edgeRegionSize"];
  v20 = [v2 between:10.0 and:512.0];

  v19 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Grape Flags" valueKeyPath:@"usesGrapeFlags"];
  uint64_t v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Recognizes Along Edge" valueKeyPath:@"recognizeAlongEdge"];
  double v4 = (void *)MEMORY[0x1E4F94160];
  v23[0] = v20;
  v23[1] = v19;
  v23[2] = v3;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  double v6 = [v4 sectionWithRows:v5];

  double v7 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Extend Edge Region" valueKeyPath:@"extendSwipeUpRegion"];
  v8 = [MEMORY[0x1E4F94148] rowWithTitle:@"Extended Region Size" valueKeyPath:@"extendedEdgeRegionSize"];
  v9 = [v8 between:30.0 and:800.0];

  v10 = [MEMORY[0x1E4F94148] rowWithTitle:@"Extended Region Inset X" valueKeyPath:@"extendedRegionInsetX"];
  v11 = [v10 between:0.0 and:150.0];

  v12 = (void *)MEMORY[0x1E4F94160];
  v22[0] = v7;
  v22[1] = v9;
  v22[2] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  v14 = [v12 sectionWithRows:v13];

  v15 = (void *)MEMORY[0x1E4F94160];
  v21[0] = v6;
  v21[1] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v17 = [v15 moduleWithTitle:@"Dismiss Gesture Settings" contents:v16];

  return v17;
}

- (BOOL)usesGrapeFlags
{
  return self->_usesGrapeFlags;
}

- (void)setUsesGrapeFlags:(BOOL)a3
{
  self->_usesGrapeFlags = a3;
}

- (double)edgeRegionSize
{
  return self->_edgeRegionSize;
}

- (void)setEdgeRegionSize:(double)a3
{
  self->_edgeRegionSize = a3;
}

- (double)recognizeAlongEdge
{
  return self->_recognizeAlongEdge;
}

- (void)setRecognizeAlongEdge:(double)a3
{
  self->_recognizeAlongEdge = a3;
}

- (void)setExtendSwipeUpRegion:(BOOL)a3
{
  self->_extendSwipeUpRegion = a3;
}

- (double)extendedEdgeRegionSize
{
  return self->_extendedEdgeRegionSize;
}

- (void)setExtendedEdgeRegionSize:(double)a3
{
  self->_extendedEdgeRegionSize = a3;
}

- (double)extendedRegionInsetX
{
  return self->_extendedRegionInsetX;
}

- (void)setExtendedRegionInsetX:(double)a3
{
  self->_extendedRegionInsetX = a3;
}

@end