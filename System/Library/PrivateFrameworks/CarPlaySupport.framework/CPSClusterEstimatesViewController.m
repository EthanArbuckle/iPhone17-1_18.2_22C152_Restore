@interface CPSClusterEstimatesViewController
+ (NSEdgeInsets)edgeInsets;
+ (id)createEstimatesView;
+ (id)createPlatterView;
@end

@implementation CPSClusterEstimatesViewController

+ (NSEdgeInsets)edgeInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (id)createEstimatesView
{
  double v2 = [CPSClusterEstimatesView alloc];
  double v3 = -[CPSDashboardEstimatesView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  return v3;
}

+ (id)createPlatterView
{
  v7[2] = a1;
  v7[1] = (id)a2;
  double v3 = [CPSCardPlatterView alloc];
  id v5 = (id)objc_msgSend(MEMORY[0x263F1CB98], "crsui_clusterTurnCardETATrayBackgroundMaterial");
  id v4 = (id)[MEMORY[0x263F1C550] clearColor];
  v7[0] = -[CPSCardPlatterView initWithFrame:cornerRadius:maskedCorners:backgroundMaterial:backgroundColor:](v3, "initWithFrame:cornerRadius:maskedCorners:backgroundMaterial:backgroundColor:", 15, v5, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), 12.0);

  [v7[0] setShadowWithRadius:3.0 opacity:0.4];
  id v6 = v7[0];
  objc_storeStrong(v7, 0);

  return v6;
}

@end