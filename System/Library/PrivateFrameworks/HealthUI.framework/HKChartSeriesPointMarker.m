@interface HKChartSeriesPointMarker
+ (id)chartPointWithColor:(id)a3 radius:(double)a4 style:(int64_t)a5;
+ (id)chartPointWithLineSeriesPresentationStyle:(id)a3;
@end

@implementation HKChartSeriesPointMarker

+ (id)chartPointWithColor:(id)a3 radius:(double)a4 style:(int64_t)a5
{
  id v7 = a3;
  if (a5 == 2)
  {
    v8 = 0;
  }
  else
  {
    double v9 = a4 + a4;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v9, v9);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__HKChartSeriesPointMarker_chartPointWithColor_radius_style___block_invoke;
    v12[3] = &unk_1E6D523B8;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    int64_t v14 = a5;
    double v17 = v9;
    double v18 = v9;
    id v13 = v7;
    v8 = [v10 imageWithActions:v12];
  }
  return v8;
}

void __61__HKChartSeriesPointMarker_chartPointWithColor_radius_style___block_invoke(double *a1, void *a2)
{
  v3 = (CGContext *)[a2 CGContext];
  uint64_t v4 = *((void *)a1 + 5);
  if (v4 == 1)
  {
    v10 = (void *)*((void *)a1 + 4);
    CGFloat v11 = a1[6];
    CGFloat v12 = a1[7];
    CGFloat v13 = a1[8];
    CGFloat v14 = a1[9];
    _drawHollowCircleInContext(v3, v10, v11, v12, v13, v14);
  }
  else if (!v4)
  {
    v5 = (void *)*((void *)a1 + 4);
    CGFloat v6 = a1[6];
    CGFloat v7 = a1[7];
    CGFloat v8 = a1[8];
    CGFloat v9 = a1[9];
    _drawSolidCircleInContext(v3, v5, v6, v7, v8, v9);
  }
}

+ (id)chartPointWithLineSeriesPresentationStyle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 pointColor];
  [v3 radius];
  double v6 = v5;
  uint64_t v7 = [v3 pointMarkerStyle];

  CGFloat v8 = +[HKChartSeriesPointMarker chartPointWithColor:v4 radius:v7 style:v6];

  return v8;
}

@end