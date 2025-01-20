@interface SilenceUnknownCallersModule
+ (id)defaults;
- (BOOL)isSelected;
- (id)iconGlyph;
- (id)selectedColor;
- (id)selectedIconGlyph;
- (void)setSelected:(BOOL)a3;
@end

@implementation SilenceUnknownCallersModule

+ (id)defaults
{
  if (qword_8148 != -1) {
    dispatch_once(&qword_8148, &stru_4088);
  }
  v2 = (void *)qword_8140;

  return v2;
}

- (BOOL)isSelected
{
  v2 = +[SilenceUnknownCallersModule defaults];
  unsigned __int8 v3 = [v2 BOOLForKey:TUCallFilteringPreferencesContactsOnlyKey];

  return v3;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[SilenceUnknownCallersModule defaults];
  [v5 setBool:v3 forKey:TUCallFilteringPreferencesContactsOnlyKey];

  [(SilenceUnknownCallersModule *)self refreshState];
}

- (id)iconGlyph
{
  return +[UIImage systemImageNamed:@"questionmark.square.dashed"];
}

- (id)selectedIconGlyph
{
  return +[UIImage systemImageNamed:@"questionmark.square.dashed"];
}

- (id)selectedColor
{
  return +[UIColor colorWithRed:1.0 green:0.337254902 blue:0.337254902 alpha:1.0];
}

@end