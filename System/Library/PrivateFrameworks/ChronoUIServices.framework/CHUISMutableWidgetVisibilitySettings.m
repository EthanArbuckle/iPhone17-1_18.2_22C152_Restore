@interface CHUISMutableWidgetVisibilitySettings
- (id)copyWithZone:(_NSZone *)a3;
- (void)setSettled:(BOOL)a3;
- (void)setVisibleBounds:(CGRect)a3;
@end

@implementation CHUISMutableWidgetVisibilitySettings

- (void)setSettled:(BOOL)a3
{
  self->super._settled = a3;
}

- (void)setVisibleBounds:(CGRect)a3
{
  self->super._visibleBounds = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CHUISWidgetVisibilitySettings alloc];

  return [(CHUISWidgetVisibilitySettings *)v4 _initWithVisibilitySettings:self];
}

@end