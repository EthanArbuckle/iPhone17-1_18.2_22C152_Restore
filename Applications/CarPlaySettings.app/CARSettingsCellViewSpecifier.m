@interface CARSettingsCellViewSpecifier
- (BOOL)canBecomeFocused;
- (BOOL)isFocused;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CARSettingsCellViewProtocol)cellView;
- (CARSettingsCellViewSpecifier)initWithView:(id)a3 actionBlock:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (UIView)view;
- (void)setFocused:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setView:(id)a3;
@end

@implementation CARSettingsCellViewSpecifier

- (CARSettingsCellViewSpecifier)initWithView:(id)a3 actionBlock:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CARSettingsCellViewSpecifier;
  v8 = [(CARSettingsCellSpecifier *)&v11 initWithTitle:0 image:0 accessoryType:0 actionBlock:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_view, a3);
  }

  return v9;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CARSettingsCellViewSpecifier *)self view];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(CARSettingsCellViewSpecifier *)self view];
  [v5 systemLayoutSizeFittingSize:width height];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CARSettingsCellViewProtocol)cellView
{
  double v3 = [(CARSettingsCellViewSpecifier *)self view];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___CARSettingsCellViewProtocol];

  if (v4)
  {
    double v5 = [(CARSettingsCellViewSpecifier *)self view];
  }
  else
  {
    double v5 = 0;
  }

  return (CARSettingsCellViewProtocol *)v5;
}

- (BOOL)canBecomeFocused
{
  v2 = [(CARSettingsCellViewSpecifier *)self view];
  unsigned __int8 v3 = [v2 canBecomeFocused];

  return v3;
}

- (void)setFocused:(BOOL)a3
{
  if (self->_focused != a3)
  {
    BOOL v3 = a3;
    self->_focused = a3;
    id v4 = [(CARSettingsCellViewSpecifier *)self cellView];
    [v4 setCellFocused:v3];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    BOOL v3 = a3;
    self->_highlighted = a3;
    id v4 = [(CARSettingsCellViewSpecifier *)self cellView];
    [v4 setCellHighlighted:v3];
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    BOOL v3 = a3;
    self->_selected = a3;
    id v4 = [(CARSettingsCellViewSpecifier *)self cellView];
    [v4 setCellSelected:v3];
  }
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
}

@end