@interface GKThemeBrush
- (GKThemeBrush)initWithTheme:(id)a3;
- (GKUITheme)theme;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setTheme:(id)a3;
@end

@implementation GKThemeBrush

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKThemeBrush;
  id v4 = [(GKBrush *)&v7 copyWithZone:a3];
  v5 = [(GKThemeBrush *)self theme];
  [v4 setTheme:v5];

  return v4;
}

- (GKThemeBrush)initWithTheme:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKThemeBrush;
  v5 = [(GKThemeBrush *)&v8 init];
  v6 = v5;
  if (v5) {
    [(GKThemeBrush *)v5 setTheme:v4];
  }

  return v6;
}

- (GKUITheme)theme
{
  return self->_theme;
}

- (void)setTheme:(id)a3
{
}

- (void).cxx_destruct
{
}

@end