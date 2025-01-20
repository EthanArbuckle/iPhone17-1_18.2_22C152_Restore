@interface CSDashBoardNotificationVersusPagingScrollSettings
+ (id)settingsControllerModule;
- (BOOL)colorsBackground;
- (double)leadingInset;
- (double)trailingInset;
- (void)setColorsBackground:(BOOL)a3;
- (void)setDefaultValues;
- (void)setLeadingInset:(double)a3;
- (void)setTrailingInset:(double)a3;
@end

@implementation CSDashBoardNotificationVersusPagingScrollSettings

- (void)setDefaultValues
{
  [(CSDashBoardNotificationVersusPagingScrollSettings *)self setColorsBackground:0];
  [(CSDashBoardNotificationVersusPagingScrollSettings *)self setLeadingInset:24.0];

  [(CSDashBoardNotificationVersusPagingScrollSettings *)self setTrailingInset:24.0];
}

+ (id)settingsControllerModule
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Colors Background" valueKeyPath:@"colorsBackground"];
  v3 = (void *)MEMORY[0x1E4F94160];
  v19[0] = v2;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v5 = [v3 sectionWithRows:v4];

  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"Leading" valueKeyPath:@"leadingInset"];
  v7 = [v6 between:0.0 and:256.0];

  v8 = [MEMORY[0x1E4F94148] rowWithTitle:@"Trailing" valueKeyPath:@"trailingInset"];
  v9 = [v8 between:0.0 and:256.0];

  v10 = (void *)MEMORY[0x1E4F94160];
  v18[0] = v7;
  v18[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v12 = [v10 sectionWithRows:v11 title:@"Portrait Phone Values"];

  v13 = (void *)MEMORY[0x1E4F94160];
  v17[0] = v5;
  v17[1] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v15 = [v13 moduleWithTitle:@"Dismiss Gesture Settings" contents:v14];

  return v15;
}

- (BOOL)colorsBackground
{
  return self->_colorsBackground;
}

- (void)setColorsBackground:(BOOL)a3
{
  self->_colorsBackground = a3;
}

- (double)leadingInset
{
  return self->_leadingInset;
}

- (void)setLeadingInset:(double)a3
{
  self->_leadingInset = a3;
}

- (double)trailingInset
{
  return self->_trailingInset;
}

- (void)setTrailingInset:(double)a3
{
  self->_trailingInset = a3;
}

@end