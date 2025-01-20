@interface _MKUILabel
- (id)_mapkit_themeColorProvider;
- (void)didMoveToWindow;
- (void)infoCardThemeChanged;
- (void)set_mapkit_themeColorProvider:(id)a3;
@end

@implementation _MKUILabel

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)_MKUILabel;
  [(_MKUILabel *)&v3 didMoveToWindow];
  if (self->__mapkit_themeColorProvider) {
    [(_MKUILabel *)self infoCardThemeChanged];
  }
}

- (void)set_mapkit_themeColorProvider:(id)a3
{
  v4 = (void *)[a3 copy];
  id mapkit_themeColorProvider = self->__mapkit_themeColorProvider;
  self->__id mapkit_themeColorProvider = v4;

  if (self->__mapkit_themeColorProvider)
  {
    [(_MKUILabel *)self infoCardThemeChanged];
  }
}

- (void)infoCardThemeChanged
{
  v6.receiver = self;
  v6.super_class = (Class)_MKUILabel;
  [(UIView *)&v6 infoCardThemeChanged];
  id mapkit_themeColorProvider = (void (**)(id, void *))self->__mapkit_themeColorProvider;
  if (mapkit_themeColorProvider)
  {
    v4 = [(UIView *)self mk_theme];
    v5 = mapkit_themeColorProvider[2](mapkit_themeColorProvider, v4);
    [(_MKUILabel *)self setTextColor:v5];
  }
}

- (id)_mapkit_themeColorProvider
{
  return self->__mapkit_themeColorProvider;
}

- (void).cxx_destruct
{
}

@end