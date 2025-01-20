@interface BCUI4x4AvocadoViewController
- (BOOL)_includeEmptyDevices;
- (id)_newBatteryDeviceView;
- (unint64_t)_maximumNumberOfBatteryDeviceViews;
- (void)_configureBatteryDeviceView:(id)a3 withBatteryDevice:(id)a4 transitionCoordinator:(id)a5;
- (void)viewWillLayoutSubviews;
@end

@implementation BCUI4x4AvocadoViewController

- (void)viewWillLayoutSubviews
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)BCUI4x4AvocadoViewController;
  [(BCUIAvocadoViewController *)&v34 viewWillLayoutSubviews];
  v3 = [(BCUI4x4AvocadoViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = BCUI6x8RowHeightForBounds(v5, v7, v9, v11);
  v13 = [(BCUI4x4AvocadoViewController *)self traitCollection];
  uint64_t v14 = [v13 preferredContentSizeCategory];

  v29 = (void *)v14;
  long long v30 = 0u;
  long long v31 = 0u;
  if (+[BCUIRowView isAX3PlusLayoutRequiredForContentSizeCategory:v14])
  {
    double v12 = v12 + v12;
  }
  long long v32 = 0uLL;
  long long v33 = 0uLL;
  v15 = [(BCUIAvocadoViewController *)self _batteryDeviceViews];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    double MaxY = 0.0;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v22 = objc_opt_class();
        id v23 = v21;
        if (v22)
        {
          if (objc_opt_isKindOfClass()) {
            v24 = v23;
          }
          else {
            v24 = 0;
          }
        }
        else
        {
          v24 = 0;
        }
        id v25 = v24;

        v26 = [(BCUIAvocadoViewController *)self _batteryDeviceViews];
        id v27 = [v26 lastObject];
        [v25 setSeparatorVisible:v23 != v27];

        v37.origin.x = v5;
        v37.origin.y = v7;
        v37.size.width = v9;
        v37.size.height = v11;
        double Width = CGRectGetWidth(v37);
        objc_msgSend(v23, "setFrame:", 0.0, MaxY, Width, v12);
        v38.origin.x = 0.0;
        v38.origin.y = MaxY;
        v38.size.width = Width;
        v38.size.height = v12;
        double MaxY = CGRectGetMaxY(v38);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v17);
  }
}

- (unint64_t)_maximumNumberOfBatteryDeviceViews
{
  v2 = [(BCUI4x4AvocadoViewController *)self traitCollection];
  v3 = [v2 preferredContentSizeCategory];

  if (+[BCUIRowView isAX3PlusLayoutRequiredForContentSizeCategory:v3])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 6;
  }

  return v4;
}

- (BOOL)_includeEmptyDevices
{
  return 1;
}

- (id)_newBatteryDeviceView
{
  return objc_alloc_init(BCUIRowView);
}

- (void)_configureBatteryDeviceView:(id)a3 withBatteryDevice:(id)a4 transitionCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 setEmpty:v9 == 0];
  if (objc_opt_respondsToSelector()) {
    [v8 setTransitionCoordinator:v10];
  }
  if (v9)
  {
    v11.receiver = self;
    v11.super_class = (Class)BCUI4x4AvocadoViewController;
    [(BCUIAvocadoViewController *)&v11 _configureBatteryDeviceView:v8 withBatteryDevice:v9 transitionCoordinator:v10];
  }
}

@end