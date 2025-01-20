@interface BCUIBatteryAvocadoViewController
+ (id)imageForIconInfo:(BCUIIconImageInfo *)a3;
+ (void)initialize;
- (BCUIAvocadoViewController)_avocadoViewController;
- (BOOL)_canShowWhileLocked;
- (NSString)debugIdentifier;
- (double)scaleFactor;
- (id)_synthesizedDebugIdentifier;
- (int64_t)widgetFamily;
- (void)_configureAvocadoViewControllerIfNecessary;
- (void)_setAvocadoViewController:(id)a3;
- (void)connectedDevicesDidChange:(id)a3;
- (void)setDebugIdentifier:(id)a3;
- (void)setScaleFactor:(double)a3;
- (void)setWidgetFamily:(int64_t)a3;
- (void)setWidgetFamliy:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation BCUIBatteryAvocadoViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x1F410C7F8]();
  }
}

+ (id)imageForIconInfo:(BCUIIconImageInfo *)a3
{
  uint64_t v6 = v5;
  uint64_t v7 = v4;
  uint64_t v8 = v3;
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"icon-%fx%f@%f", v3, v4, v5);
  v11 = +[BCUIMappedImageCache sharedCache];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__BCUIBatteryAvocadoViewController_imageForIconInfo___block_invoke;
  v15[3] = &__block_descriptor_64_e18___UIImage_16__0_Q8l;
  v15[4] = a1;
  v15[5] = v8;
  v15[6] = v7;
  v15[7] = v6;
  v12 = [v11 imageForKey:v10 generatingIfNecessaryWithBlock:v15];

  v13 = [v12 imageFlippedForRightToLeftLayoutDirection];

  return v13;
}

id __53__BCUIBatteryAvocadoViewController_imageForIconInfo___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  uint64_t v3 = objc_msgSend(v2, "bsui_imageForIconInfo:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

  return v3;
}

- (void)setWidgetFamliy:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = NSStringFromWidgetFamily();
    [v8 handleFailureInMethod:a2, self, @"BCUIBatteryAvocadoViewController.m", 51, @"Unsupported avocado size: %@", v9 object file lineNumber description];
  }
  if (self->_widgetFamily != a3)
  {
    self->_widgetFamily = a3;
    uint64_t v5 = [(BCUIAvocadoViewController *)self->_avocadoViewController viewIfLoaded];
    [v5 removeFromSuperview];

    [(BCUIAvocadoViewController *)self->_avocadoViewController willMoveToParentViewController:0];
    [(BCUIAvocadoViewController *)self->_avocadoViewController removeFromParentViewController];
    avocadoViewController = self->_avocadoViewController;
    self->_avocadoViewController = 0;

    id v10 = [(BCUIBatteryAvocadoViewController *)self viewIfLoaded];
    [v10 setNeedsLayout];
  }
}

- (void)setScaleFactor:(double)a3
{
  if (self->_scaleFactor != a3)
  {
    self->_scaleFactor = a3;
    -[BCUIAvocadoViewController setScaleFactor:](self->_avocadoViewController, "setScaleFactor:");
  }
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)BCUIBatteryAvocadoViewController;
  [(BCUIBatteryAvocadoViewController *)&v12 viewDidLoad];
  [(BCUIBatteryAvocadoViewController *)self _configureAvocadoViewControllerIfNecessary];
  uint64_t v3 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x1E4F4F9D0]);
  batteryDeviceController = self->_batteryDeviceController;
  self->_batteryDeviceController = v3;

  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 bundleIdentifier];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  v9 = [v6 stringByAppendingFormat:@".%@", v8];
  SerialWithQoS = (OS_dispatch_queue *)BSDispatchQueueCreateSerialWithQoS();
  queue = self->_queue;
  self->_queue = SerialWithQoS;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BCUIBatteryAvocadoViewController;
  [(BCUIBatteryAvocadoViewController *)&v3 viewWillLayoutSubviews];
  [(BCUIBatteryAvocadoViewController *)self _configureAvocadoViewControllerIfNecessary];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)*MEMORY[0x1E4F4F9C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4F9C0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(BCUIBatteryAvocadoViewController *)self _synthesizedDebugIdentifier];
    *(_DWORD *)buf = 138543618;
    id v10 = v7;
    __int16 v11 = 2082;
    objc_super v12 = "-[BCUIBatteryAvocadoViewController viewWillAppear:]";
    _os_log_impl(&dword_1DAD96000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) %{public}s", buf, 0x16u);
  }
  v8.receiver = self;
  v8.super_class = (Class)BCUIBatteryAvocadoViewController;
  [(BCUIBatteryAvocadoViewController *)&v8 viewWillAppear:v3];
  [(BCBatteryDeviceController *)self->_batteryDeviceController addBatteryDeviceObserver:self queue:self->_queue];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)*MEMORY[0x1E4F4F9C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4F9C0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(BCUIBatteryAvocadoViewController *)self _synthesizedDebugIdentifier];
    *(_DWORD *)buf = 138543618;
    id v10 = v7;
    __int16 v11 = 2082;
    objc_super v12 = "-[BCUIBatteryAvocadoViewController viewDidAppear:]";
    _os_log_impl(&dword_1DAD96000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) %{public}s", buf, 0x16u);
  }
  v8.receiver = self;
  v8.super_class = (Class)BCUIBatteryAvocadoViewController;
  [(BCUIBatteryAvocadoViewController *)&v8 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)*MEMORY[0x1E4F4F9C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4F9C0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(BCUIBatteryAvocadoViewController *)self _synthesizedDebugIdentifier];
    *(_DWORD *)buf = 138543618;
    id v10 = v7;
    __int16 v11 = 2082;
    objc_super v12 = "-[BCUIBatteryAvocadoViewController viewWillDisappear:]";
    _os_log_impl(&dword_1DAD96000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) %{public}s", buf, 0x16u);
  }
  v8.receiver = self;
  v8.super_class = (Class)BCUIBatteryAvocadoViewController;
  [(BCUIBatteryAvocadoViewController *)&v8 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)*MEMORY[0x1E4F4F9C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4F9C0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(BCUIBatteryAvocadoViewController *)self _synthesizedDebugIdentifier];
    *(_DWORD *)buf = 138543618;
    id v10 = v7;
    __int16 v11 = 2082;
    objc_super v12 = "-[BCUIBatteryAvocadoViewController viewDidDisappear:]";
    _os_log_impl(&dword_1DAD96000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) %{public}s", buf, 0x16u);
  }
  v8.receiver = self;
  v8.super_class = (Class)BCUIBatteryAvocadoViewController;
  [(BCUIBatteryAvocadoViewController *)&v8 viewDidDisappear:v3];
  [(BCBatteryDeviceController *)self->_batteryDeviceController removeBatteryDeviceObserver:self];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)connectedDevicesDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__BCUIBatteryAvocadoViewController_connectedDevicesDidChange___block_invoke;
  block[3] = &unk_1E6BE0DB0;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__BCUIBatteryAvocadoViewController_connectedDevicesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = (void *)*MEMORY[0x1E4F4F9C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4F9C0], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = [WeakRetained _synthesizedDebugIdentifier];
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138543618;
    v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1DAD96000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) Connected devices did change: '%{public}@'", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [WeakRetained _avocadoViewController];
  [v7 setBatteryDevices:*(void *)(a1 + 32)];
}

- (void)_configureAvocadoViewControllerIfNecessary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_avocadoViewController)
  {
    BOOL v3 = (void *)*MEMORY[0x1E4F4F9C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4F9C0], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      id v5 = [(BCUIBatteryAvocadoViewController *)self _synthesizedDebugIdentifier];
      uint64_t v6 = NSStringFromWidgetFamily();
      int v14 = 138543618;
      v15 = v5;
      __int16 v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_1DAD96000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) Configuring view controller for size '%{public}@'", (uint8_t *)&v14, 0x16u);
    }
    id v7 = +[BCUIAvocadoViewController avocadoViewControllerForWidgetFamily:self->_widgetFamily];
    avocadoViewController = self->_avocadoViewController;
    self->_avocadoViewController = v7;

    v9 = self->_avocadoViewController;
    __int16 v10 = [(BCUIBatteryAvocadoViewController *)self _synthesizedDebugIdentifier];
    [(BCUIAvocadoViewController *)v9 setDebugIdentifier:v10];

    double scaleFactor = self->_scaleFactor;
    if (scaleFactor == 0.0) {
      double scaleFactor = 1.0;
    }
    [(BCUIAvocadoViewController *)self->_avocadoViewController setScaleFactor:scaleFactor];
    [(BCUIBatteryAvocadoViewController *)self addChildViewController:self->_avocadoViewController];
    [(BCUIAvocadoViewController *)self->_avocadoViewController didMoveToParentViewController:self];
    uint64_t v12 = [(BCUIBatteryAvocadoViewController *)self view];
    uint64_t v13 = [(BCUIAvocadoViewController *)self->_avocadoViewController view];
    [v12 bounds];
    objc_msgSend(v13, "setFrame:");
    [v13 setAutoresizingMask:18];
    [v12 addSubview:v13];
  }
}

- (id)_synthesizedDebugIdentifier
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = v4;
  if (self->_debugIdentifier)
  {
    uint64_t v6 = [NSString stringWithFormat:@" [%@]", self->_debugIdentifier];
    id v7 = [v3 stringWithFormat:@"<%@%@: %p>", v5, v6, self];
  }
  else
  {
    id v7 = [v3 stringWithFormat:@"<%@%@: %p>", v4, &stru_1F35146C8, self];
  }

  return v7;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (void)setWidgetFamily:(int64_t)a3
{
  self->_widgetFamily = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
}

- (BCUIAvocadoViewController)_avocadoViewController
{
  return self->_avocadoViewController;
}

- (void)_setAvocadoViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avocadoViewController, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
}

@end