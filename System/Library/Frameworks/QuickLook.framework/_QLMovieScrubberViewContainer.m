@interface _QLMovieScrubberViewContainer
- (CGSize)intrinsicContentSize;
- (_QLMovieScrubberViewContainer)init;
@end

@implementation _QLMovieScrubberViewContainer

- (_QLMovieScrubberViewContainer)init
{
  v5.receiver = self;
  v5.super_class = (Class)_QLMovieScrubberViewContainer;
  v2 = [(_QLMovieScrubberViewContainer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_QLMovieScrubberViewContainer *)v2 setAccessibilityIdentifier:@"QLMovieScrubberViewContainerAccessibilityIdentifier"];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(_QLMovieScrubberViewContainer *)self superview];
  [v2 frame];
  CGFloat Width = CGRectGetWidth(v7);

  double v4 = 40.0;
  double v5 = Width;
  result.height = v4;
  result.width = v5;
  return result;
}

@end