@interface MUGroupedActionsRowViewConfiguration
+ (id)defaultConfiguration;
- (BOOL)useVibrancy;
- (MUGroupedActionsRowViewConfiguration)initWithStyle:(int64_t)a3 useVibrancy:(BOOL)a4;
- (UIColor)itemBackgroundColor;
- (UIColor)itemHighlightColor;
- (UIColor)tintColor;
- (int64_t)style;
- (void)setItemBackgroundColor:(id)a3;
- (void)setItemHighlightColor:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTintColor:(id)a3;
- (void)setUseVibrancy:(BOOL)a3;
@end

@implementation MUGroupedActionsRowViewConfiguration

- (MUGroupedActionsRowViewConfiguration)initWithStyle:(int64_t)a3 useVibrancy:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MUGroupedActionsRowViewConfiguration;
  result = [(MUGroupedActionsRowViewConfiguration *)&v7 init];
  if (result)
  {
    result->_style = a3;
    result->_useVibrancy = a4;
  }
  return result;
}

+ (id)defaultConfiguration
{
  unsigned int IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v3 = [[MUGroupedActionsRowViewConfiguration alloc] initWithStyle:IsMacCatalyst useVibrancy:IsMacCatalyst ^ 1];
  if (MapKitIdiomIsMacCatalyst())
  {
    v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(MUGroupedActionsRowViewConfiguration *)v3 setTintColor:v4];

    v5 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    [(MUGroupedActionsRowViewConfiguration *)v3 setItemBackgroundColor:v5];
  }
  else
  {
    v6 = +[MUInfoCardStyle actionRowTintColor];
    [(MUGroupedActionsRowViewConfiguration *)v3 setTintColor:v6];

    objc_super v7 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    [(MUGroupedActionsRowViewConfiguration *)v3 setItemBackgroundColor:v7];

    v5 = +[MUInfoCardStyle rowSelectedColor];
    [(MUGroupedActionsRowViewConfiguration *)v3 setItemHighlightColor:v5];
  }

  return v3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (void)setUseVibrancy:(BOOL)a3
{
  self->_useVibrancy = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UIColor)itemBackgroundColor
{
  return self->_itemBackgroundColor;
}

- (void)setItemBackgroundColor:(id)a3
{
}

- (UIColor)itemHighlightColor
{
  return self->_itemHighlightColor;
}

- (void)setItemHighlightColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemHighlightColor, 0);
  objc_storeStrong((id *)&self->_itemBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end