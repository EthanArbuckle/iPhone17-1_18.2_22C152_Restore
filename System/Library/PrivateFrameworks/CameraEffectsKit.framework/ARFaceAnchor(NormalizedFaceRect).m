@interface ARFaceAnchor(NormalizedFaceRect)
- (CGFloat)normalizedFaceRect;
@end

@implementation ARFaceAnchor(NormalizedFaceRect)

- (CGFloat)normalizedFaceRect
{
  CGSize v1 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v7.origin = (CGPoint)*MEMORY[0x263F001A8];
  v7.size = v1;
  v2 = [a1 trackingData];
  v3 = v2;
  if (v2)
  {
    CFDictionaryRef v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F269D0]];
    CFDictionaryRef v5 = v4;
    if (v4) {
      CGRectMakeWithDictionaryRepresentation(v4, &v7);
    }
  }
  return v7.origin.x;
}

@end