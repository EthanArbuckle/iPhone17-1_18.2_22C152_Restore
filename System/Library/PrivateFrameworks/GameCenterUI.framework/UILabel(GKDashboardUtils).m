@interface UILabel(GKDashboardUtils)
- (void)_gkUpdateShadowForFocusChange:()GKDashboardUtils;
@end

@implementation UILabel(GKDashboardUtils)

- (void)_gkUpdateShadowForFocusChange:()GKDashboardUtils
{
  if (a3)
  {
    id v3 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v6 = [v3 CGColor];
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = [a1 layer];
  [v7 setShadowColor:v6];

  if (a3)
  {

    v8 = [a1 layer];
    LODWORD(v9) = 1053609165;
    [v8 setShadowOpacity:v9];

    double v10 = 0.0;
    double v11 = 2.0;
    double v12 = 4.0;
  }
  else
  {
    v13 = [a1 layer];
    LODWORD(v14) = 1053609165;
    [v13 setShadowOpacity:v14];

    double v10 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v12 = 0.0;
  }
  v15 = [a1 layer];
  objc_msgSend(v15, "setShadowOffset:", v10, v11);

  id v16 = [a1 layer];
  [v16 setShadowRadius:v12];
}

@end