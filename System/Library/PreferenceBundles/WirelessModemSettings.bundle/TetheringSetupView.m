@interface TetheringSetupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 inTableView:(id)a4 shouldSetSize:(BOOL)a5;
- (TetheringSetupView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
- (void)layoutSubviews;
@end

@implementation TetheringSetupView

- (TetheringSetupView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TetheringSetupView;
  v5 = [(TetheringSetupView *)&v19 init];
  if (v5)
  {
    v6 = [v4 propertyForKey:@"SupportsWifi"];
    v5->_showWifiView = [v6 BOOLValue];

    if (v5->_showWifiView)
    {
      v7 = [WiFiSetupView alloc];
      double v8 = *MEMORY[0x263F001A8];
      double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
      uint64_t v12 = -[WiFiSetupView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x263F001A8], v9, v10, v11);
      wifiView = v5->_wifiView;
      v5->_wifiView = (WiFiSetupView *)v12;

      [(WiFiSetupView *)v5->_wifiView setAutoresizingMask:2];
      [(TetheringSetupView *)v5 addSubview:v5->_wifiView];
    }
    else
    {
      double v8 = *MEMORY[0x263F001A8];
      double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
    v14 = -[BluetoothSetupView initWithFrame:]([BluetoothSetupView alloc], "initWithFrame:", v8, v9, v10, v11);
    btView = v5->_btView;
    v5->_btView = v14;

    [(BluetoothSetupView *)v5->_btView setAutoresizingMask:2];
    [(TetheringSetupView *)v5 addSubview:v5->_btView];
    v16 = -[USBSetupView initWithFrame:]([USBSetupView alloc], "initWithFrame:", v8, v9, v10, v11);
    usbView = v5->_usbView;
    v5->_usbView = v16;

    [(USBSetupView *)v5->_usbView setAutoresizingMask:2];
    [(TetheringSetupView *)v5 addSubview:v5->_usbView];
  }

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3 inTableView:(id)a4 shouldSetSize:(BOOL)a5
{
  BOOL v5 = a5;
  double width = a3.width;
  id v8 = a4;
  if (self->_showWifiView)
  {
    -[SetupView sizeThatFits:](self->_wifiView, "sizeThatFits:", width, 1.79769313e308);
    double v11 = v10;
    if (v5)
    {
      v27.size.double width = v9;
      v27.origin.x = 0.0;
      v27.origin.y = 20.0;
      v27.size.height = v11;
      CGRect v28 = CGRectIntegral(v27);
      -[WiFiSetupView setFrame:](self->_wifiView, "setFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
    }
    double v12 = v11 + 20.0 + 10.0;
  }
  else
  {
    double v12 = 20.0;
  }
  -[SetupView sizeThatFits:](self->_btView, "sizeThatFits:", width, 1.79769313e308);
  double v15 = v14;
  if (v5)
  {
    v29.size.double width = v13;
    v29.origin.x = 0.0;
    v29.origin.y = v12;
    v29.size.height = v15;
    CGRect v30 = CGRectIntegral(v29);
    -[BluetoothSetupView setFrame:](self->_btView, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  }
  double v16 = v12 + v15 + 10.0;
  -[SetupView sizeThatFits:](self->_usbView, "sizeThatFits:", width, 1.79769313e308);
  double v19 = v18;
  if (v5)
  {
    v31.size.double width = v17;
    v31.origin.x = 0.0;
    v31.origin.y = v16;
    v31.size.height = v19;
    CGRect v32 = CGRectIntegral(v31);
    -[USBSetupView setFrame:](self->_usbView, "setFrame:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
  }
  float v20 = width;
  double v21 = ceilf(v20);
  float v22 = v16 + v19 + 10.0;
  double v23 = ceilf(v22);

  double v24 = v21;
  double v25 = v23;
  result.height = v25;
  result.double width = v24;
  return result;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  -[TetheringSetupView sizeThatFits:inTableView:shouldSetSize:](self, "sizeThatFits:inTableView:shouldSetSize:", a4, 0, a3, 0.0);
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(TetheringSetupView *)self superview];
  -[TetheringSetupView sizeThatFits:inTableView:shouldSetSize:](self, "sizeThatFits:inTableView:shouldSetSize:", v6, 0, width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)TetheringSetupView;
  [(TetheringSetupView *)&v8 layoutSubviews];
  [(TetheringSetupView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(TetheringSetupView *)self superview];
  -[TetheringSetupView sizeThatFits:inTableView:shouldSetSize:](self, "sizeThatFits:inTableView:shouldSetSize:", v7, 1, v4, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usbView, 0);
  objc_storeStrong((id *)&self->_btView, 0);

  objc_storeStrong((id *)&self->_wifiView, 0);
}

@end