@interface UIVisualEffect(HUAdditions)
+ (id)hu_categoryDashboardBackgroundEffects;
+ (id)hu_dashboardBarEffects;
+ (id)hu_gridCellBackgroundOffEffects;
+ (id)hu_gridCellBackgroundOnEffects;
@end

@implementation UIVisualEffect(HUAdditions)

+ (id)hu_gridCellBackgroundOffEffects
{
  if (qword_1EBA47960 != -1) {
    dispatch_once(&qword_1EBA47960, &__block_literal_global_33_2);
  }
  v0 = (void *)qword_1EBA47968;

  return v0;
}

+ (id)hu_dashboardBarEffects
{
  if (_MergedGlobals_635 != -1) {
    dispatch_once(&_MergedGlobals_635, &__block_literal_global_7_1);
  }
  v0 = (void *)qword_1EBA47948;

  return v0;
}

+ (id)hu_gridCellBackgroundOnEffects
{
  if (qword_1EBA47970 != -1) {
    dispatch_once(&qword_1EBA47970, &__block_literal_global_40_1);
  }
  v0 = (void *)qword_1EBA47978;

  return v0;
}

+ (id)hu_categoryDashboardBackgroundEffects
{
  if (qword_1EBA47950 != -1) {
    dispatch_once(&qword_1EBA47950, &__block_literal_global_20_3);
  }
  v0 = (void *)qword_1EBA47958;

  return v0;
}

@end