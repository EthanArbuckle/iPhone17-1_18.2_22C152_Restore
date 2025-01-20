@interface GuidedAccessDevicePINPane
- (void)layoutSubviews;
@end

@implementation GuidedAccessDevicePINPane

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)GuidedAccessDevicePINPane;
  [(DevicePINPane *)&v29 layoutSubviews];
  v3 = [(GuidedAccessDevicePINPane *)self safeUIViewForKey:@"_keypadContainerView"];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [(GuidedAccessDevicePINPane *)self frame];
  double v11 = v10;
  [v3 frame];
  double v13 = v12;
  v14 = [(GuidedAccessDevicePINPane *)self safeUIViewForKey:@"_pinView"];
  v15 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v14 == 0;
  }
  if (!v17)
  {
    [v14 frame];
    double v28 = v18;
    double v20 = v19;
    double v22 = v21;
    double v23 = v7;
    double v25 = v24 + -50.0;
    double v5 = v5 + -50.0;
    double v9 = v9 + 50.0;
    v26 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    [v3 setBackgroundColor:v26];

    double v27 = v25;
    double v7 = v23;
    objc_msgSend(v14, "setFrame:", v28, v20, v22, v27);
  }
  objc_msgSend(v3, "setFrame:", v11 * 0.5 - v13 * 0.5, v5, v7, v9);
}

@end