@interface UIView(AXPhotoSort)
- (uint64_t)_accessibilitySimpleSort:()AXPhotoSort;
@end

@implementation UIView(AXPhotoSort)

- (uint64_t)_accessibilitySimpleSort:()AXPhotoSort
{
  [a3 frame];
  double v5 = v4;
  [a1 frame];
  if (v5 > v6) {
    return -1;
  }
  else {
    return v5 < v6;
  }
}

@end