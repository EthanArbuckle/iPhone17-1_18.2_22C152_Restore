@interface UIScreen(Orientation)
- (uint64_t)currentOrientation;
@end

@implementation UIScreen(Orientation)

- (uint64_t)currentOrientation
{
  v2 = [a1 coordinateSpace];
  v3 = [a1 fixedCoordinateSpace];
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_msgSend(v2, "convertPoint:toCoordinateSpace:", v3, *MEMORY[0x1E4F1DAD8], v5);
  double v7 = v6;
  double v9 = v8;

  if (v7 == v4 && v9 == v5) {
    return 1;
  }
  if (v7 != 0.0 && v9 != 0.0) {
    return 2;
  }
  if (v7 == 0.0 && v9 != 0.0) {
    return 4;
  }
  if (v9 != 0.0 || v7 == 0.0) {
    return 0;
  }
  else {
    return 3;
  }
}

@end