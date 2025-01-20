@interface CABackdropLayer(CoreMaterial_Internal)
+ (BOOL)mt_colorMatrixForOpacity:()CoreMaterial_Internal;
+ (id)mt_keyPathForColorMatrixDrivenInoperativeOpacity;
+ (id)mt_keyPathForColorMatrixDrivenOpacity;
@end

@implementation CABackdropLayer(CoreMaterial_Internal)

+ (BOOL)mt_colorMatrixForOpacity:()CoreMaterial_Internal
{
  v4 = (_OWORD *)MEMORY[0x1E4F39AD8];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = v4[4];
  long long v6 = v4[1];
  *(_OWORD *)a1 = *v4;
  *(_OWORD *)(a1 + 16) = v6;
  BOOL result = MTFloatIsOne(a2);
  if (!result)
  {
    float v8 = a2;
    *(float *)(a1 + 72) = v8;
  }
  return result;
}

+ (id)mt_keyPathForColorMatrixDrivenOpacity
{
  v0 = MTFilterKeyPathForFilter(@"opacityColorMatrix");
  v1 = [v0 stringByAppendingFormat:@".%@", @"inputColorMatrix"];

  return v1;
}

+ (id)mt_keyPathForColorMatrixDrivenInoperativeOpacity
{
  v0 = MTFilterKeyPathForFilter(@"inoperativeColorMatrix");
  v1 = [v0 stringByAppendingFormat:@".%@", @"inputColorMatrix"];

  return v1;
}

@end