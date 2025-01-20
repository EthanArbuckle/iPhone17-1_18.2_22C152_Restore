@interface HUSetupAccessoryOBWelcomeController
- (HFServiceLikeItem)item;
- (HUHomeAccessoryTileView)homeAccessoryTileView;
- (HUSetupAccessoryOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6;
- (HUSetupAccessoryOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 item:(id)a6;
- (double)_contentAspectRatio;
@end

@implementation HUSetupAccessoryOBWelcomeController

- (HUSetupAccessoryOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 item:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [HUHomeAccessoryTileView alloc];
  v15 = -[HUHomeAccessoryTileView initWithFrame:item:iconOnlyTile:](v14, "initWithFrame:item:iconOnlyTile:", v10, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  v18.receiver = self;
  v18.super_class = (Class)HUSetupAccessoryOBWelcomeController;
  v16 = [(HUCenterFillOBWelcomeController *)&v18 initWithTitle:v13 detailText:v12 icon:v11 contentView:v15];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_homeAccessoryTileView, v15);
    -[HUCenterFillOBWelcomeController setContentInsets:](v16, "setContentInsets:", 0.0, 24.0, 0.0, 24.0);
  }

  return v16;
}

- (HUSetupAccessoryOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithTitle_detailText_icon_item_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSetupAccessoryOBWelcomeController.m", 33, @"%s is unavailable; use %@ instead",
    "-[HUSetupAccessoryOBWelcomeController initWithTitle:detailText:icon:contentView:]",
    v9);

  return 0;
}

- (HFServiceLikeItem)item
{
  v2 = [(HUSetupAccessoryOBWelcomeController *)self homeAccessoryTileView];
  v3 = [v2 item];

  return (HFServiceLikeItem *)v3;
}

- (double)_contentAspectRatio
{
  v2 = [(HUSetupAccessoryOBWelcomeController *)self homeAccessoryTileView];
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