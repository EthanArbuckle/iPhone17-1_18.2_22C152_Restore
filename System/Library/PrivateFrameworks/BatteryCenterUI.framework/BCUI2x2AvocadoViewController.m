@interface BCUI2x2AvocadoViewController
- (BOOL)_includeEmptyDevices;
- (id)_newBatteryDeviceView;
- (unint64_t)_maximumNumberOfBatteryDeviceViews;
- (void)_configureBatteryDeviceView:(id)a3 withBatteryDevice:(id)a4 transitionCoordinator:(id)a5;
- (void)viewWillLayoutSubviews;
@end

@implementation BCUI2x2AvocadoViewController

- (void)viewWillLayoutSubviews
{
  v42.receiver = self;
  v42.super_class = (Class)BCUI2x2AvocadoViewController;
  [(BCUIAvocadoViewController *)&v42 viewWillLayoutSubviews];
  v3 = [(BCUI2x2AvocadoViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  v12 = [(BCUIAvocadoViewController *)self batteryDevices];
  unint64_t v13 = [v12 count];

  int v14 = [v3 _shouldReverseLayoutDirection];
  v43.origin.CGFloat x = v5;
  v43.origin.CGFloat y = v7;
  v43.size.CGFloat width = v9;
  v43.size.CGFloat height = v11;
  CGRect v44 = CGRectInset(v43, 12.0, 12.0);
  CGFloat x = v44.origin.x;
  CGFloat y = v44.origin.y;
  CGFloat width = v44.size.width;
  CGFloat height = v44.size.height;
  double v19 = CGRectGetWidth(v44);
  double v20 = v19;
  if (v13 <= 1)
  {
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    CGFloat v23 = CGRectGetHeight(v46);
  }
  else
  {
    double v21 = (v19 + -11.0) * 0.5;
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = width;
    v45.size.CGFloat height = height;
    double v22 = (CGRectGetHeight(v45) + -11.0) * 0.5;
    if (v21 <= v22) {
      double v20 = v21;
    }
    else {
      double v20 = v22;
    }
    CGFloat v23 = v20;
  }
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  double v41 = 0.0;
  CGFloat v24 = x;
  CGFloat v25 = y;
  CGFloat v26 = width;
  CGFloat v27 = height;
  if (v14) {
    double MinX = CGRectGetMaxX(*(CGRect *)&v24) - v20;
  }
  else {
    double MinX = CGRectGetMinX(*(CGRect *)&v24);
  }
  double v41 = MinX;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  CGFloat MinY = 0.0;
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v47);
  v29 = [v3 window];
  if (v29)
  {
    v30 = [v3 window];
    v31 = [v30 screen];
    [v31 scale];
    uint64_t v33 = v32;
  }
  else
  {
    v30 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v30 scale];
    uint64_t v33 = v34;
  }

  v35 = [(BCUIAvocadoViewController *)self _batteryDeviceViews];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __54__BCUI2x2AvocadoViewController_viewWillLayoutSubviews__block_invoke;
  v36[3] = &unk_1E6BE09A0;
  v36[4] = v40;
  v36[5] = v38;
  *(double *)&v36[6] = v20;
  *(CGFloat *)&v36[7] = v23;
  char v37 = v14;
  v36[8] = v33;
  *(CGFloat *)&v36[9] = x;
  *(CGFloat *)&v36[10] = y;
  *(CGFloat *)&v36[11] = width;
  *(CGFloat *)&v36[12] = height;
  [v35 enumerateObjectsUsingBlock:v36];

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
}

void __54__BCUI2x2AvocadoViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  UIRectIntegralWithScale();
  objc_msgSend(v5, "setFrame:");

  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 96);
  if (*(unsigned char *)(a1 + 104)) {
    double MinX = CGRectGetMaxX(*(CGRect *)&v6) - *(double *)(a1 + 48);
  }
  else {
    double MinX = CGRectGetMinX(*(CGRect *)&v6);
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = MinX;
  if ((a3 & 1) == 0)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    double v12 = *(double *)(v11 + 24);
    double v13 = *(double *)(a1 + 48);
    double v14 = v12 - v13 + -11.0;
    double v15 = v12 + v13 + 11.0;
    if (*(unsigned char *)(a1 + 104)) {
      double v15 = v14;
    }
    *(double *)(v11 + 24) = v15;
  }
  if (a3 == 1) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 56)
  }
                                                                + 11.0
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
}

- (unint64_t)_maximumNumberOfBatteryDeviceViews
{
  return 4;
}

- (BOOL)_includeEmptyDevices
{
  v2 = [(BCUIAvocadoViewController *)self batteryDevices];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (id)_newBatteryDeviceView
{
  v2 = objc_alloc_init(BCUIRingItemView);
  [(BCUIRingItemView *)v2 setRingLineWidth:6.0];
  return v2;
}

- (void)_configureBatteryDeviceView:(id)a3 withBatteryDevice:(id)a4 transitionCoordinator:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BCUI2x2AvocadoViewController;
  [(BCUIAvocadoViewController *)&v15 _configureBatteryDeviceView:v8 withBatteryDevice:a4 transitionCoordinator:a5];
  uint64_t v9 = [(BCUIAvocadoViewController *)self batteryDevices];
  unint64_t v10 = [v9 count];

  uint64_t v11 = objc_opt_class();
  id v12 = v8;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      double v13 = v12;
    }
    else {
      double v13 = 0;
    }
  }
  else
  {
    double v13 = 0;
  }
  id v14 = v13;

  [v14 setRingItemViewStyle:2 * (v10 < 2)];
}

@end