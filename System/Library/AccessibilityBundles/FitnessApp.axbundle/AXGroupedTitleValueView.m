@interface AXGroupedTitleValueView
- (AXGroupedTitleValueView)initWithAccessibilityContainer:(id)a3 titleView:(id)a4 valueView:(id)a5;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation AXGroupedTitleValueView

- (AXGroupedTitleValueView)initWithAccessibilityContainer:(id)a3 titleView:(id)a4 valueView:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 2, v8, v9);
  v13.receiver = self;
  v13.super_class = (Class)AXGroupedTitleValueView;
  v11 = [(AXGroupedTitleValueView *)&v13 initWithAccessibilityContainer:self representedElements:v10];

  if (v11)
  {
    objc_storeStrong(&v11->_titleView, a4);
    objc_storeStrong(&v11->_valueView, a5);
  }

  return v11;
}

- (BOOL)isAccessibilityElement
{
  v3 = [self->_titleView accessibilityLabel];
  if ([v3 length])
  {
    v4 = [self->_valueView accessibilityLabel];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)accessibilityLabel
{
  return [self->_titleView accessibilityLabel];
}

- (id)accessibilityValue
{
  return [self->_valueView accessibilityLabel];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueView, 0);

  objc_storeStrong(&self->_titleView, 0);
}

@end