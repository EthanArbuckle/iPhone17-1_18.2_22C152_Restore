@interface CPSClusterManeuversCardView
+ (id)createPlatterView;
+ (id)maneuverViewWithManeuver:(id)a3;
@end

@implementation CPSClusterManeuversCardView

+ (id)createPlatterView
{
  v7[2] = a1;
  v7[1] = (id)a2;
  v3 = [CPSCardPlatterView alloc];
  id v5 = (id)objc_msgSend(MEMORY[0x263F1CB98], "crsui_clusterTurnCardETATrayBackgroundMaterial");
  id v4 = (id)[MEMORY[0x263F1C550] clearColor];
  v7[0] = -[CPSCardPlatterView initWithFrame:cornerRadius:maskedCorners:backgroundMaterial:backgroundColor:](v3, "initWithFrame:cornerRadius:maskedCorners:backgroundMaterial:backgroundColor:", 15, v5, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  [v7[0] setShadowWithRadius:20.0 opacity:0.4];
  [v7[0] setClipsToBounds:0];
  id v6 = v7[0];
  objc_storeStrong(v7, 0);

  return v6;
}

+ (id)maneuverViewWithManeuver:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [CPSClusterPrimaryManeuverView alloc];
  id v5 = [(CPSPrimaryManeuverView *)v3 initWithManeuver:location[0]];
  objc_storeStrong(location, 0);

  return v5;
}

@end