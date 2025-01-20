@interface AXActivityWidgetHeaderValueView
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)headerView;
- (id)valueView;
- (void)setHeaderView:(id)a3;
- (void)setValueView:(id)a3;
@end

@implementation AXActivityWidgetHeaderValueView

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(AXActivityWidgetHeaderValueView *)self headerView];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(AXActivityWidgetHeaderValueView *)self valueView];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (id)valueView
{
  return self->_valueView;
}

- (void)setValueView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueView, 0);

  objc_storeStrong(&self->_headerView, 0);
}

@end