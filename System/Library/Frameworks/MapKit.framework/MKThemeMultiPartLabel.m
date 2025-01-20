@interface MKThemeMultiPartLabel
- (id)_mapkit_themeColorProvider;
- (void)infoCardThemeChanged;
- (void)set_mapkit_themeColorProvider:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation MKThemeMultiPartLabel

- (void)willMoveToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKThemeMultiPartLabel;
  [(MKThemeMultiPartLabel *)&v4 willMoveToWindow:a3];
  if (self->__mapkit_themeColorProvider) {
    [(MKThemeMultiPartLabel *)self infoCardThemeChanged];
  }
}

- (void)set_mapkit_themeColorProvider:(id)a3
{
  objc_super v4 = (void *)[a3 copy];
  id mapkit_themeColorProvider = self->__mapkit_themeColorProvider;
  self->__id mapkit_themeColorProvider = v4;

  if (self->__mapkit_themeColorProvider)
  {
    [(MKThemeMultiPartLabel *)self infoCardThemeChanged];
  }
}

- (void)infoCardThemeChanged
{
  v6.receiver = self;
  v6.super_class = (Class)MKThemeMultiPartLabel;
  [(UIView *)&v6 infoCardThemeChanged];
  id mapkit_themeColorProvider = (void (**)(id, void *))self->__mapkit_themeColorProvider;
  if (mapkit_themeColorProvider)
  {
    objc_super v4 = [(UIView *)self mk_theme];
    v5 = mapkit_themeColorProvider[2](mapkit_themeColorProvider, v4);
    [(MKMultiPartLabel *)self setTextColor:v5];
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