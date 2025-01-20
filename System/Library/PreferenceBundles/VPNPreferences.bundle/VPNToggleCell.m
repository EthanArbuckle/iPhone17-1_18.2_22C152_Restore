@interface VPNToggleCell
- (void)layoutSubviews;
@end

@implementation VPNToggleCell

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)VPNToggleCell;
  [(PSSwitchTableCell *)&v19 layoutSubviews];
  uint64_t v3 = [(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection];
  v4 = [(VPNToggleCell *)self detailTextLabel];
  [v4 frame];
  double v6 = v5;

  double v7 = 10.0;
  if (!v3) {
    double v7 = -10.0;
  }
  double v8 = v6 + v7;
  v9 = [(VPNToggleCell *)self detailTextLabel];
  [v9 frame];
  double v11 = v10;
  v12 = [(VPNToggleCell *)self detailTextLabel];
  [v12 frame];
  double v14 = v13;
  v15 = [(VPNToggleCell *)self detailTextLabel];
  [v15 frame];
  double v17 = v16;
  v18 = [(VPNToggleCell *)self detailTextLabel];
  objc_msgSend(v18, "setFrame:", v8, v11, v14, v17);
}

@end