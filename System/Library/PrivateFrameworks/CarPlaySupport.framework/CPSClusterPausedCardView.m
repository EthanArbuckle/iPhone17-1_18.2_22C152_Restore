@interface CPSClusterPausedCardView
+ (id)createPlatterView;
+ (id)titleFont;
@end

@implementation CPSClusterPausedCardView

+ (id)titleFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:weight:", 17.0, *MEMORY[0x263F1D318], a2, a1);
}

+ (id)createPlatterView
{
  v7[2] = a1;
  v7[1] = (id)a2;
  v3 = [CPSCardPlatterView alloc];
  id v5 = (id)objc_msgSend(MEMORY[0x263F1CB98], "crsui_clusterTurnCardETATrayBackgroundMaterial");
  id v4 = (id)[MEMORY[0x263F1C550] clearColor];
  v7[0] = -[CPSCardPlatterView initWithFrame:cornerRadius:maskedCorners:backgroundMaterial:backgroundColor:](v3, "initWithFrame:cornerRadius:maskedCorners:backgroundMaterial:backgroundColor:", 15, v5, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  [v7[0] setShadowWithRadius:20.0 opacity:0.4];
  id v6 = v7[0];
  objc_storeStrong(v7, 0);

  return v6;
}

@end