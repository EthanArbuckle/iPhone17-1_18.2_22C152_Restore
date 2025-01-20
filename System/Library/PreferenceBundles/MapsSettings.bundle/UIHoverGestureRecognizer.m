@interface UIHoverGestureRecognizer
- (BOOL)_maps_isHovering;
@end

@implementation UIHoverGestureRecognizer

- (BOOL)_maps_isHovering
{
  v3 = (char *)[(UIHoverGestureRecognizer *)self state];
  if (v3 != (unsigned char *)&dword_0 + 1) {
    LOBYTE(v3) = [(UIHoverGestureRecognizer *)self state] == (char *)&dword_0 + 2;
  }
  return (char)v3;
}

@end