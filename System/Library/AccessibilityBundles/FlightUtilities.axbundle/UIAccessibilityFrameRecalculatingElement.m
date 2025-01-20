@interface UIAccessibilityFrameRecalculatingElement
- (CGRect)accessibilityFrame;
- (id)calculateFrame;
- (void)dealloc;
- (void)setCalculateFrame:(id)a3;
@end

@implementation UIAccessibilityFrameRecalculatingElement

- (CGRect)accessibilityFrame
{
  v2 = [(UIAccessibilityFrameRecalculatingElement *)self calculateFrame];
  double v3 = v2[2]();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)dealloc
{
  [(UIAccessibilityFrameRecalculatingElement *)self setCalculateFrame:0];
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityFrameRecalculatingElement;
  [(UIAccessibilityFrameRecalculatingElement *)&v3 dealloc];
}

- (id)calculateFrame
{
  return self->_calculateFrame;
}

- (void)setCalculateFrame:(id)a3
{
}

- (void).cxx_destruct
{
}

@end