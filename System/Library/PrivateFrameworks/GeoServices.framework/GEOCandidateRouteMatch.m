@interface GEOCandidateRouteMatch
@end

@implementation GEOCandidateRouteMatch

uint64_t __44___GEOCandidateRouteMatch_comparatorByScore__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = a2;
  v5 = a3;
  double v6 = 0.0;
  double v7 = 0.0;
  if (v4) {
    double v7 = v4[2];
  }
  if (v5) {
    double v6 = v5[2];
  }
  if (v7 <= v6)
  {
    double v9 = 0.0;
    double v10 = 0.0;
    if (v4) {
      double v10 = v4[2];
    }
    if (v5) {
      double v9 = v5[2];
    }
    uint64_t v8 = v10 < v9;
  }
  else
  {
    uint64_t v8 = -1;
  }

  return v8;
}

@end