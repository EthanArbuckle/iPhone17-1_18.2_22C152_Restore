@interface VKTourGuideAccessibilityElement
- (BOOL)pointInside:(CGPoint)a3;
- (CGRect)accessibilityFrame;
- (VKTourGuideAccessibilityElement)initWithAccessibilityContainer:(id)a3 userLocationMarker:(id)a4;
- (id)_accessibilityScrollStatus;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)userLocationMarker;
- (void)setUserLocationMarker:(id)a3;
@end

@implementation VKTourGuideAccessibilityElement

- (CGRect)accessibilityFrame
{
  v2 = [(VKTourGuideAccessibilityElement *)self userLocationMarker];
  [v2 accessibilityFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  CGFloat v11 = CGRectGetMidX(v16) + -60.0;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  double v12 = CGRectGetMidY(v17) + -60.0;
  double v13 = 120.0;
  double v14 = v11;
  double v15 = 120.0;
  result.size.height = v15;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v14;
  return result;
}

- (id)accessibilityLabel
{
  v2 = [(VKTourGuideAccessibilityElement *)self accessibilityContainer];
  double v3 = [v2 accessibilityTourStatus];

  return v3;
}

- (id)accessibilityPath
{
  [(VKTourGuideAccessibilityElement *)self accessibilityFrame];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  CGFloat v6 = (void *)MEMORY[0x263F1C478];
  double MidX = CGRectGetMidX(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v14) * 0.5;

  return (id)objc_msgSend(v6, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v9, 0.0, 6.28318531);
}

- (BOOL)pointInside:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(VKTourGuideAccessibilityElement *)self accessibilityFrame];
  v11.CGFloat x = x;
  v11.CGFloat y = y;
  BOOL result = 0;
  if (CGRectContainsPoint(v12, v11))
  {
    id v6 = [(VKTourGuideAccessibilityElement *)self accessibilityPath];
    double v7 = (const CGPath *)[v6 CGPath];
    v10.CGFloat x = x;
    v10.CGFloat y = y;
    BOOL v8 = CGPathContainsPoint(v7, 0, v10, 0);

    if (v8) {
      return 1;
    }
  }
  return result;
}

- (id)_accessibilityScrollStatus
{
  v2 = [(VKTourGuideAccessibilityElement *)self accessibilityContainer];
  double v3 = [v2 _accessibilityScrollStatus];

  return v3;
}

- (VKTourGuideAccessibilityElement)initWithAccessibilityContainer:(id)a3 userLocationMarker:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VKTourGuideAccessibilityElement;
  BOOL v8 = [(VKTourGuideAccessibilityElement *)&v11 initWithAccessibilityContainer:a3];
  double v9 = v8;
  if (v8) {
    objc_storeStrong(&v8->_userLocationMarker, a4);
  }

  return v9;
}

- (id)userLocationMarker
{
  return self->_userLocationMarker;
}

- (void)setUserLocationMarker:(id)a3
{
}

- (void).cxx_destruct
{
}

@end