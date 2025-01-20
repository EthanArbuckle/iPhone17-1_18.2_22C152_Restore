@interface SCNMaterialProperty(AVTExtension)
- (double)avt_simdContentsTransform;
- (uint64_t)avt_setSimdContentsTransform:()AVTExtension;
@end

@implementation SCNMaterialProperty(AVTExtension)

- (double)avt_simdContentsTransform
{
  [a1 contentsTransform];
  return v2;
}

- (uint64_t)avt_setSimdContentsTransform:()AVTExtension
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  v6[3] = a5;
  return [a1 setContentsTransform:v6];
}

@end