@interface HUPCSetupAccessoryContentController
- (HFServiceLikeItem)item;
- (HUHomeAccessoryTileView)homeAccessoryTileView;
- (HUPCSetupAccessoryContentController)initWithTitle:(id)a3 detailText:(id)a4 item:(id)a5;
- (double)_contentAspectRatio;
@end

@implementation HUPCSetupAccessoryContentController

- (HUPCSetupAccessoryContentController)initWithTitle:(id)a3 detailText:(id)a4 item:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [HUHomeAccessoryTileView alloc];
  v12 = -[HUHomeAccessoryTileView initWithFrame:item:iconOnlyTile:](v11, "initWithFrame:item:iconOnlyTile:", v8, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  v15.receiver = self;
  v15.super_class = (Class)HUPCSetupAccessoryContentController;
  v13 = [(HUPCCenterFillContentController *)&v15 initWithTitle:v10 detailText:v9 contentView:v12];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_homeAccessoryTileView, v12);
    -[HUPCCenterFillContentController setContentInsets:](v13, "setContentInsets:", 0.0, 24.0, 0.0, 24.0);
  }

  return v13;
}

- (HFServiceLikeItem)item
{
  v2 = [(HUPCSetupAccessoryContentController *)self homeAccessoryTileView];
  v3 = [v2 item];

  return (HFServiceLikeItem *)v3;
}

- (double)_contentAspectRatio
{
  v2 = [(HUPCSetupAccessoryContentController *)self homeAccessoryTileView];
  [v2 aspectRatio];
  double v4 = v3;

  return v4;
}

- (HUHomeAccessoryTileView)homeAccessoryTileView
{
  return self->_homeAccessoryTileView;
}

- (void).cxx_destruct
{
}

@end