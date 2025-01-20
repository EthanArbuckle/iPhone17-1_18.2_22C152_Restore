@interface UIColor(AVTAdditions)
+ (uint64_t)avt_colorWithColor4:()AVTAdditions;
- (float32x2_t)avt_colorToColor4;
@end

@implementation UIColor(AVTAdditions)

+ (uint64_t)avt_colorWithColor4:()AVTAdditions
{
  return [MEMORY[0x263F1C550] colorWithRed:a1.n128_f32[0] green:a1.n128_f32[1] blue:a1.n128_f32[2] alpha:a1.n128_f32[3]];
}

- (float32x2_t)avt_colorToColor4
{
  v1 = (CGColor *)[a1 CGColor];
  int NumberOfComponents = CGColorGetNumberOfComponents(v1);
  Components = (float64x2_t *)CGColorGetComponents(v1);
  switch(NumberOfComponents)
  {
    case 3:
      float32x2_t result = vcvt_f32_f64(*Components);
      break;
    case 2:
      *(float32x2_t *)v4.i8 = vcvt_f32_f64(*Components);
      return (float32x2_t)vzip1q_s32(v4, v4).u64[0];
    case 1:
      int32x2_t v5 = *(int32x2_t *)&Components->f64[0];
      *(float *)v5.i32 = Components->f64[0];
      return (float32x2_t)vdupq_lane_s32(v5, 0).u64[0];
    default:
      return (float32x2_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*Components), Components[1]).u64[0];
  }
  return result;
}

@end