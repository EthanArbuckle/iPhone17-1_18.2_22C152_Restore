@interface MTPillView
- (MTPillView)init;
- (MTPillView)initWithFrame:(CGRect)a3;
- (MTPillView)initWithFrame:(CGRect)a3 settings:(id)a4;
@end

@implementation MTPillView

- (MTPillView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  BSDispatchQueueAssertMain();
  v19.receiver = self;
  v19.super_class = (Class)MTPillView;
  v10 = -[MTPillView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v12 = [v9 cornerMask];
    v13 = @"lumaDodgePillCorners-thin";
    if (v12 != 1) {
      v13 = 0;
    }
    if (v12) {
      v14 = v13;
    }
    else {
      v14 = @"lumaDodgePillCorners";
    }
    v15 = [MEMORY[0x263F1C6B0] imageNamed:v14 inBundle:v11];
    v16 = [(MTPillView *)v10 layer];
    id v17 = v15;
    objc_msgSend(v16, "setCornerContents:", objc_msgSend(v17, "CGImage"));
    objc_msgSend(v16, "setCornerContentsCenter:", 0.5, 0.5, 0.0, 0.0);
    [v9 cornerRadius];
    objc_msgSend(v16, "setCornerRadius:");
    [v16 setMasksToBounds:1];
  }
  return v10;
}

- (MTPillView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = +[MTLumaDodgePillDomain rootSettings];
  id v9 = -[MTPillView initWithFrame:settings:](self, "initWithFrame:settings:", v8, x, y, width, height);

  return v9;
}

- (MTPillView)init
{
  v3 = +[MTLumaDodgePillDomain rootSettings];
  [v3 minWidth];
  double v5 = v4;
  [v3 height];
  v7 = -[MTPillView initWithFrame:settings:](self, "initWithFrame:settings:", v3, 0.0, 0.0, v5, v6);

  return v7;
}

@end