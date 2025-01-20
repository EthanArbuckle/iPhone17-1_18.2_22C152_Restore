@interface CSDashBoardQuickActionsButtonSettings
+ (id)settingsControllerModule;
- (BOOL)allowsOnPad;
- (BOOL)colorsBackground;
- (BOOL)showsButtons;
- (BOOL)usesStrictTouchAllowance;
- (double)bottomOutset;
- (double)leadingOutset;
- (double)maximumTouchDuration;
- (double)strictTouchExtraRadius;
- (double)topOutset;
- (double)trailingOutset;
- (void)setAllowsOnPad:(BOOL)a3;
- (void)setBottomOutset:(double)a3;
- (void)setColorsBackground:(BOOL)a3;
- (void)setDefaultValues;
- (void)setLeadingOutset:(double)a3;
- (void)setMaximumTouchDuration:(double)a3;
- (void)setShowsButtons:(BOOL)a3;
- (void)setStrictTouchExtraRadius:(double)a3;
- (void)setTopOutset:(double)a3;
- (void)setTrailingOutset:(double)a3;
- (void)setUsesStrictTouchAllowance:(BOOL)a3;
@end

@implementation CSDashBoardQuickActionsButtonSettings

- (void)setDefaultValues
{
  [(CSDashBoardQuickActionsButtonSettings *)self setShowsButtons:1];
  [(CSDashBoardQuickActionsButtonSettings *)self setColorsBackground:0];
  [(CSDashBoardQuickActionsButtonSettings *)self setTopOutset:18.0];
  [(CSDashBoardQuickActionsButtonSettings *)self setLeadingOutset:18.0];
  [(CSDashBoardQuickActionsButtonSettings *)self setTrailingOutset:18.0];
  [(CSDashBoardQuickActionsButtonSettings *)self setBottomOutset:18.0];
  [(CSDashBoardQuickActionsButtonSettings *)self setUsesStrictTouchAllowance:1];
  [(CSDashBoardQuickActionsButtonSettings *)self setStrictTouchExtraRadius:8.0];
  [(CSDashBoardQuickActionsButtonSettings *)self setMaximumTouchDuration:2.0];

  [(CSDashBoardQuickActionsButtonSettings *)self setAllowsOnPad:0];
}

+ (id)settingsControllerModule
{
  v34[3] = *MEMORY[0x1E4F143B8];
  v30 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Shows Buttons" valueKeyPath:@"showsButtons"];
  v29 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Colors Background" valueKeyPath:@"colorsBackground"];
  v28 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Supports iPad" valueKeyPath:@"allowsOnPad"];
  v2 = (void *)MEMORY[0x1E4F94160];
  v34[0] = v30;
  v34[1] = v29;
  v34[2] = v28;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  v27 = [v2 sectionWithRows:v3];

  v26 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Touch Gating" valueKeyPath:@"usesStrictTouchAllowance"];
  v4 = [MEMORY[0x1E4F94148] rowWithTitle:@"Extra Touch Radius" valueKeyPath:@"strictTouchExtraRadius"];
  v25 = [v4 between:0.0 and:20.0];

  v5 = [MEMORY[0x1E4F94148] rowWithTitle:@"Maximum Duration" valueKeyPath:@"maximumTouchDuration"];
  v24 = [v5 between:0.0 and:12.0];

  v6 = (void *)MEMORY[0x1E4F94160];
  v33[0] = v26;
  v33[1] = v25;
  v33[2] = v24;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  v8 = [v6 sectionWithRows:v7 title:@"Pocket Touch Protections"];

  v9 = [MEMORY[0x1E4F94148] rowWithTitle:@"Top" valueKeyPath:@"topOutset"];
  v10 = [v9 between:0.0 and:64.0];

  v11 = [MEMORY[0x1E4F94148] rowWithTitle:@"Leading" valueKeyPath:@"leadingOutset"];
  v12 = [v11 between:0.0 and:64.0];

  v13 = [MEMORY[0x1E4F94148] rowWithTitle:@"Trailing" valueKeyPath:@"trailingOutset"];
  v14 = [v13 between:0.0 and:64.0];

  v15 = [MEMORY[0x1E4F94148] rowWithTitle:@"Bottom" valueKeyPath:@"bottomOutset"];
  v16 = [v15 between:0.0 and:64.0];

  v17 = (void *)MEMORY[0x1E4F94160];
  v32[0] = v10;
  v32[1] = v12;
  v32[2] = v14;
  v32[3] = v16;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  v19 = [v17 sectionWithRows:v18 title:@"Button Outsets"];

  v20 = (void *)MEMORY[0x1E4F94160];
  v31[0] = v27;
  v31[1] = v8;
  v31[2] = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
  v22 = [v20 moduleWithTitle:@"Dismiss Gesture Settings" contents:v21];

  return v22;
}

- (BOOL)showsButtons
{
  return self->_showsButtons;
}

- (void)setShowsButtons:(BOOL)a3
{
  self->_showsButtons = a3;
}

- (BOOL)colorsBackground
{
  return self->_colorsBackground;
}

- (void)setColorsBackground:(BOOL)a3
{
  self->_colorsBackground = a3;
}

- (double)topOutset
{
  return self->_topOutset;
}

- (void)setTopOutset:(double)a3
{
  self->_topOutset = a3;
}

- (double)leadingOutset
{
  return self->_leadingOutset;
}

- (void)setLeadingOutset:(double)a3
{
  self->_leadingOutset = a3;
}

- (double)trailingOutset
{
  return self->_trailingOutset;
}

- (void)setTrailingOutset:(double)a3
{
  self->_trailingOutset = a3;
}

- (double)bottomOutset
{
  return self->_bottomOutset;
}

- (void)setBottomOutset:(double)a3
{
  self->_bottomOutset = a3;
}

- (BOOL)usesStrictTouchAllowance
{
  return self->_usesStrictTouchAllowance;
}

- (void)setUsesStrictTouchAllowance:(BOOL)a3
{
  self->_usesStrictTouchAllowance = a3;
}

- (double)strictTouchExtraRadius
{
  return self->_strictTouchExtraRadius;
}

- (void)setStrictTouchExtraRadius:(double)a3
{
  self->_strictTouchExtraRadius = a3;
}

- (double)maximumTouchDuration
{
  return self->_maximumTouchDuration;
}

- (void)setMaximumTouchDuration:(double)a3
{
  self->_maximumTouchDuration = a3;
}

- (BOOL)allowsOnPad
{
  return self->_allowsOnPad;
}

- (void)setAllowsOnPad:(BOOL)a3
{
  self->_allowsOnPad = a3;
}

@end