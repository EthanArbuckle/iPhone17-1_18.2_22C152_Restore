@interface HKCollectionViewLayoutEngineDefaults
+ (NSDirectionalEdgeInsets)edgeInsetsForWidthDesignation:(int64_t)a3;
+ (double)interItemSpacingForWidthDesignation:(int64_t)a3;
+ (double)interRowSpacingForWidthDesignation:(int64_t)a3;
+ (id)accessibilitySizeThresholdForAdjustedLayout;
+ (id)interSectionSpacing;
@end

@implementation HKCollectionViewLayoutEngineDefaults

+ (id)interSectionSpacing
{
  return (id)[MEMORY[0x1E4FB1340] fixedSpacing:20.0];
}

+ (double)interItemSpacingForWidthDesignation:(int64_t)a3
{
  double result = 10.0;
  if ((unint64_t)(a3 - 3) <= 3) {
    return dbl_1E0F06060[a3 - 3];
  }
  return result;
}

+ (NSDirectionalEdgeInsets)edgeInsetsForWidthDesignation:(int64_t)a3
{
  double v3 = 0.0;
  if ((unint64_t)(a3 - 1) <= 5) {
    double v3 = dbl_1E0F06030[a3 - 1];
  }
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = v3;
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v3;
  result.top = v4;
  return result;
}

+ (id)accessibilitySizeThresholdForAdjustedLayout
{
  return (id)*MEMORY[0x1E4FB2798];
}

+ (double)interRowSpacingForWidthDesignation:(int64_t)a3
{
  double result = 10.0;
  if ((unint64_t)(a3 - 3) <= 3) {
    return dbl_1E0F06060[a3 - 3];
  }
  return result;
}

@end