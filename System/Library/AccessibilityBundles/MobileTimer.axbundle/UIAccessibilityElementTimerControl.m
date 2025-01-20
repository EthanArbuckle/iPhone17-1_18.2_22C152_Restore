@interface UIAccessibilityElementTimerControl
- (CGRect)accessibilityFrame;
- (UILabel)icon;
- (UILabel)name;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setIcon:(id)a3;
- (void)setName:(id)a3;
@end

@implementation UIAccessibilityElementTimerControl

- (CGRect)accessibilityFrame
{
  v3 = [(UIAccessibilityElementTimerControl *)self icon];
  [v3 accessibilityFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  v12 = [(UIAccessibilityElementTimerControl *)self name];
  [v12 accessibilityFrame];
  v28.origin.CGFloat x = v13;
  v28.origin.CGFloat y = v14;
  v28.size.CGFloat width = v15;
  v28.size.CGFloat height = v16;
  v25.origin.CGFloat x = v5;
  v25.origin.CGFloat y = v7;
  v25.size.CGFloat width = v9;
  v25.size.CGFloat height = v11;
  CGRect v26 = CGRectUnion(v25, v28);
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (id)accessibilityLabel
{
  v3 = NSString;
  double v4 = accessibilityLocalizedString(@"timer.alert.tone");
  CGFloat v5 = [(UIAccessibilityElementTimerControl *)self name];
  double v6 = [v5 accessibilityLabel];
  CGFloat v7 = objc_msgSend(v3, "stringWithFormat:", v4, v6);

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3 = [(UIAccessibilityElementTimerControl *)self icon];
  uint64_t v4 = [v3 accessibilityTraits];
  CGFloat v5 = [(UIAccessibilityElementTimerControl *)self name];
  unint64_t v6 = [v5 accessibilityTraits] | v4;

  return v6;
}

- (UILabel)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (UILabel)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_icon, 0);
}

@end