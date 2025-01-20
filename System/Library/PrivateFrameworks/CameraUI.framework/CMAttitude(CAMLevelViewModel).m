@interface CMAttitude(CAMLevelViewModel)
- (uint64_t)cam_getDistanceFromFlat:()CAMLevelViewModel relativeRoll:;
@end

@implementation CMAttitude(CAMLevelViewModel)

- (uint64_t)cam_getDistanceFromFlat:()CAMLevelViewModel relativeRoll:
{
  [a1 pitch];
  double v8 = v7;
  uint64_t result = [a1 roll];
  float v11 = v10;
  double v12 = v11;
  if (v11 <= 1.57079633)
  {
    if (v12 >= -1.57079633) {
      goto LABEL_6;
    }
    double v13 = 3.14159265;
  }
  else
  {
    double v13 = -3.14159265;
  }
  float v11 = v12 + v13;
LABEL_6:
  if (a3)
  {
    float v14 = v8;
    *a3 = sqrtf((float)(v11 * v11) + (float)(v14 * v14));
  }
  if (a4) {
    *a4 = v11;
  }
  return result;
}

@end