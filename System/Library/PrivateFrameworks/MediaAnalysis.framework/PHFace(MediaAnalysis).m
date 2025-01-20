@interface PHFace(MediaAnalysis)
- (BOOL)vcp_hasBody;
- (BOOL)vcp_hasFace;
- (double)vcp_normalizedBodyBounds;
- (double)vcp_normalizedFaceBounds;
@end

@implementation PHFace(MediaAnalysis)

- (BOOL)vcp_hasFace
{
  [a1 size];
  if (v2 != 0.0) {
    return 1;
  }
  [a1 centerX];
  if (v3 != 0.0) {
    return 1;
  }
  [a1 centerY];
  return v5 != 0.0;
}

- (double)vcp_normalizedFaceBounds
{
  [a1 size];
  double v3 = v2;
  uint64_t v4 = [a1 sourceWidth];
  uint64_t v5 = [a1 sourceHeight];
  if (v4 <= v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  double v7 = v3 * (double)v6 / (double)[a1 sourceWidth];
  [a1 sourceHeight];
  [a1 centerX];
  double v9 = fmax(v8 - v7 * 0.5, 0.0);
  [a1 centerY];
  [a1 centerX];
  [a1 centerY];
  return v9;
}

- (BOOL)vcp_hasBody
{
  [a1 bodyWidth];
  if (v2 != 0.0) {
    return 1;
  }
  [a1 bodyHeight];
  if (v3 != 0.0) {
    return 1;
  }
  [a1 bodyCenterX];
  if (v4 != 0.0) {
    return 1;
  }
  [a1 bodyCenterY];
  return v6 != 0.0;
}

- (double)vcp_normalizedBodyBounds
{
  [a1 bodyCenterX];
  double v3 = v2;
  [a1 bodyWidth];
  double v5 = v3 - v4 * 0.5;
  [a1 bodyCenterY];
  [a1 bodyHeight];
  [a1 bodyWidth];
  [a1 bodyHeight];
  return v5;
}

@end