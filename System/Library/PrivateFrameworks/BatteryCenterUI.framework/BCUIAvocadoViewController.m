@interface BCUIAvocadoViewController
+ (id)avocadoViewControllerForWidgetFamily:(int64_t)a3;
+ (void)initialize;
- (BOOL)_canShowWhileLocked;
- (BOOL)_includeEmptyDevices;
- (NSArray)batteryDevices;
- (NSMutableArray)_batteryDeviceViews;
- (NSString)debugIdentifier;
- (double)_columnWidthForBounds:(CGRect)a3 andMaxNumViews:(double)a4;
- (double)scaleFactor;
- (id)_newBatteryDeviceView;
- (id)_synthesizedDebugIdentifier;
- (unint64_t)_maximumNumberOfBatteryDeviceViews;
- (void)_configureBatteryDeviceView:(id)a3 withBatteryDevice:(id)a4 transitionCoordinator:(id)a5;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_validateBatteryDeviceViewsIfNecessary;
- (void)invalidateBatteryDeviceState;
- (void)setBatteryDevices:(id)a3;
- (void)setDebugIdentifier:(id)a3;
- (void)setScaleFactor:(double)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation BCUIAvocadoViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x1F410C7F8]();
  }
}

- (double)_columnWidthForBounds:(CGRect)a3 andMaxNumViews:(double)a4
{
  return (CGRectGetWidth(a3) + -38.0 + (a4 + -1.0) * -17.0) / a4;
}

+ (id)avocadoViewControllerForWidgetFamily:(int64_t)a3
{
  if (a3 == 3 || a3 == 2 || a3 == 1)
  {
    v3 = (objc_class *)objc_opt_class();
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = NSStringFromWidgetFamily();
    [v6 handleFailureInMethod:a2, a1, @"BCUIAvocadoViewController.m", 61, @"Unsupported size: %@", v7 object file lineNumber description];

    v3 = 0;
  }
  id v8 = objc_alloc_init(v3);

  return v8;
}

- (void)setBatteryDevices:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((BSEqualObjects() & 1) == 0)
  {
    v6 = (id)*MEMORY[0x1E4F4F9C0];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(BCUIAvocadoViewController *)v5 _synthesizedDebugIdentifier];
      int v10 = 138543618;
      v11 = v7;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_1DAD96000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) Updating battery devices : %{public}@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v8 = [v4 copy];
    batteryDevices = v5->_batteryDevices;
    v5->_batteryDevices = (NSArray *)v8;

    [(BCUIAvocadoViewController *)v5 invalidateBatteryDeviceState];
  }
  objc_sync_exit(v5);
}

- (void)setScaleFactor:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_scaleFactor != a3)
  {
    self->_scaleFactor = a3;
    if (self->_batteryDeviceViewsValid)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v4 = self->_batteryDeviceViews;
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v11;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "setScaleFactor:", self->_scaleFactor, (void)v10);
          }
          while (v6 != v8);
          uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v6);
      }

      v9 = [(BCUIAvocadoViewController *)self viewIfLoaded];
      [v9 setNeedsLayout];
    }
  }
}

- (void)invalidateBatteryDeviceState
{
  self->_batteryDeviceViewsValid = 0;
  id v2 = [(BCUIAvocadoViewController *)self view];
  [v2 setNeedsLayout];
}

- (void)viewDidLoad
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)BCUIAvocadoViewController;
  [(BCUIAvocadoViewController *)&v7 viewDidLoad];
  v3 = self;
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__BCUIAvocadoViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_1E6BE0A98;
  v6[4] = self;
  id v5 = (id)[(BCUIAvocadoViewController *)self registerForTraitChanges:v4 withHandler:v6];
}

void __40__BCUIAvocadoViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [v1 traitCollection];
  id v2 = [v3 preferredContentSizeCategory];
  [v1 _contentSizeCategoryDidChange:v2];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BCUIAvocadoViewController;
  [(BCUIAvocadoViewController *)&v3 viewWillLayoutSubviews];
  [(BCUIAvocadoViewController *)self _validateBatteryDeviceViewsIfNecessary];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_validateBatteryDeviceViewsIfNecessary
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_batteryDeviceViewsValid)
  {
    id v4 = (void *)*MEMORY[0x1E4F4F9C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4F9C0], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      uint64_t v6 = [(BCUIAvocadoViewController *)self _synthesizedDebugIdentifier];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1DAD96000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) Validating device views", (uint8_t *)&buf, 0xCu);
    }
    objc_initWeak(&location, self);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    id v7 = objc_alloc_init(MEMORY[0x1E4FB23E8]);
    [v7 _setIsAnimated:1];
    uint64_t v8 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__BCUIAvocadoViewController__validateBatteryDeviceViewsIfNecessary__block_invoke;
    v13[3] = &unk_1E6BE0AE8;
    objc_copyWeak(v16, &location);
    v13[4] = self;
    v16[1] = (id)a2;
    id v14 = v7;
    p_long long buf = &buf;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__BCUIAvocadoViewController__validateBatteryDeviceViewsIfNecessary__block_invoke_3;
    v10[3] = &unk_1E6BE0B10;
    long long v12 = &buf;
    id v9 = v14;
    id v11 = v9;
    [v8 _animateUsingDefaultDampedSpringWithDelay:4 initialSpringVelocity:v13 options:v10 animations:0.0 completion:0.0];

    objc_destroyWeak(v16);
    _Block_object_dispose(&buf, 8);

    objc_destroyWeak(&location);
  }
}

void __67__BCUIAvocadoViewController__validateBatteryDeviceViewsIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (id *)WeakRetained;
    objc_sync_enter(v4);
    id v5 = (void *)[v4[124] copy];
    objc_sync_exit(v4);

    char v6 = [*(id *)(a1 + 32) _includeEmptyDevices];
    unint64_t v7 = [*(id *)(a1 + 32) _maximumNumberOfBatteryDeviceViews];
    if ((v6 & 1) == 0)
    {
      unint64_t v8 = [v5 count];
      if (v7 >= v8) {
        unint64_t v7 = v8;
      }
    }
    v28 = v3;
    if (v7)
    {
      unint64_t v9 = 0;
      v30 = v33;
      v31 = v5;
      do
      {
        if (v9 >= objc_msgSend(v5, "count", v28, v30))
        {
          long long v10 = 0;
        }
        else
        {
          long long v10 = [v5 objectAtIndex:v9];
        }
        unint64_t v11 = [v4[123] count];
        if (v11 <= v9)
        {
          uint64_t v12 = [*(id *)(a1 + 32) _newBatteryDeviceView];
        }
        else
        {
          uint64_t v12 = [v4[123] objectAtIndex:v9];
        }
        long long v13 = (void *)v12;
        if (!v12)
        {
          id v22 = [MEMORY[0x1E4F28B00] currentHandler];
          [v22 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"BCUIAvocadoViewController.m" lineNumber:133 description:@"Failed to obtain a battery device view"];
        }
        id v14 = v4[123];
        if (v11 <= v9)
        {
          if (!v14)
          {
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            id v16 = v4[123];
            v4[123] = v15;

            id v14 = v4[123];
          }
          [v14 addObject:v13];
          v17 = [*(id *)(a1 + 32) view];
          [v17 addSubview:v13];
        }
        else
        {
          [v14 replaceObjectAtIndex:v9 withObject:v13];
        }
        v18 = *(void **)(a1 + 32);
        uint64_t v19 = [*(id *)(a1 + 40) _transitionCoordinator];
        [v18 _configureBatteryDeviceView:v13 withBatteryDevice:v10 transitionCoordinator:v19];

        if (v11 <= v9)
        {
          v20 = (void *)MEMORY[0x1E4FB1EB0];
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v33[0] = __67__BCUIAvocadoViewController__validateBatteryDeviceViewsIfNecessary__block_invoke_2;
          v33[1] = &unk_1E6BE0AC0;
          id v21 = v13;
          id v34 = v21;
          [v20 performWithoutAnimation:v32];
          [v21 setAlpha:1.0];
        }
        else
        {
          [v13 layoutIfNeeded];
        }
        id v5 = v31;

        ++v9;
      }
      while (v7 != v9);
    }
    if (objc_msgSend(v4[123], "count", v28) > v7)
    {
      do
      {
        uint64_t v23 = [v4[123] lastObject];
        v24 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (!v24)
        {
          id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
          v27 = *(void **)(v26 + 40);
          *(void *)(v26 + 40) = v25;

          v24 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        }
        [v24 addObject:v23];
        [v23 setAlpha:0.0];
        [v4[123] removeObject:v23];
      }
      while ([v4[123] count] > v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "__runAlongsideAnimations");

    objc_super v3 = v29;
  }
}

uint64_t __67__BCUIAvocadoViewController__validateBatteryDeviceViewsIfNecessary__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  id v2 = *(void **)(a1 + 32);

  return [v2 setAlpha:0.0];
}

uint64_t __67__BCUIAvocadoViewController__validateBatteryDeviceViewsIfNecessary__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "removeFromSuperview", (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return [*(id *)(a1 + 32) completeTransition:a2];
}

- (id)_synthesizedDebugIdentifier
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = v4;
  if (self->_debugIdentifier)
  {
    uint64_t v6 = [NSString stringWithFormat:@" [%@]", self->_debugIdentifier];
    uint64_t v7 = [v3 stringWithFormat:@"<%@%@: %p>", v5, v6, self];
  }
  else
  {
    uint64_t v7 = [v3 stringWithFormat:@"<%@%@: %p>", v4, &stru_1F35146C8, self];
  }

  return v7;
}

- (NSArray)batteryDevices
{
  return self->_batteryDevices;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_batteryDevices, 0);

  objc_storeStrong((id *)&self->_batteryDeviceViews, 0);
}

- (NSMutableArray)_batteryDeviceViews
{
  return self->_batteryDeviceViews;
}

- (unint64_t)_maximumNumberOfBatteryDeviceViews
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BCUIAvocadoViewController.m" lineNumber:195 description:@"ABSTRACT"];

  return 0;
}

- (BOOL)_includeEmptyDevices
{
  return 0;
}

- (id)_newBatteryDeviceView
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BCUIAvocadoViewController.m" lineNumber:204 description:@"ABSTRACT"];

  return 0;
}

- (void)_configureBatteryDeviceView:(id)a3 withBatteryDevice:(id)a4 transitionCoordinator:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"BCUIAvocadoViewController.m", 209, @"Invalid parameter not satisfying: %@", @"batteryDeviceView" object file lineNumber description];
  }
  long long v12 = (void *)*MEMORY[0x1E4F4F9C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4F9C0], OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = v12;
    id v14 = [(BCUIAvocadoViewController *)self _synthesizedDebugIdentifier];
    *(_DWORD *)long long buf = 138543874;
    v20 = v14;
    __int16 v21 = 2114;
    id v22 = v9;
    __int16 v23 = 2114;
    id v24 = v10;
    _os_log_impl(&dword_1DAD96000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) Configuring battery device view '%{public}@' with battery device: %{public}@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector()) {
    [v9 setTransitionCoordinator:v11];
  }
  if (objc_opt_respondsToSelector()) {
    [v9 setEmpty:v10 == 0];
  }
  if (v10)
  {
    objc_msgSend(v9, "setPercentCharge:", objc_msgSend(v10, "percentCharge"));
    objc_msgSend(v9, "setLowCharge:", objc_msgSend(v10, "isLowBattery"));
    objc_msgSend(v9, "setCharging:", objc_msgSend(v10, "isCharging"));
    uint64_t v15 = [v10 isLowPowerModeActive];
  }
  else
  {
    [v9 setPercentCharge:0];
    [v9 setLowCharge:0];
    [v9 setCharging:0];
    uint64_t v15 = 0;
  }
  [v9 setLowPowerModeEnabled:v15];
  id v16 = [v10 batteryWidgetGlyph];
  [v9 setGlyph:v16];

  if (objc_opt_respondsToSelector())
  {
    v17 = [v10 name];
    [v9 setName:v17];
  }
  [v9 setScaleFactor:self->_scaleFactor];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v3 = [(BCUIAvocadoViewController *)self view];
  [v3 setNeedsLayout];
}

@end