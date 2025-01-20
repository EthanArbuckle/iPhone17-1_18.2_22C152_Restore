@interface MobileCalDayPlaceholderElement
- (CGRect)accessibilityFrame;
@end

@implementation MobileCalDayPlaceholderElement

- (CGRect)accessibilityFrame
{
  v2 = [(MobileCalDayPlaceholderElement *)self _accessibilityParentView];
  v3 = [v2 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  [v3 _accessibilityContentFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

@end