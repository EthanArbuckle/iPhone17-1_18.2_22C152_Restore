@interface FMFRefreshBarButtonItem
- (BOOL)anyLocationIsUpdating;
- (BOOL)isAnimating;
- (FMFRefreshBarButtonItem)initWithTarget:(id)a3 action:(SEL)a4;
- (FMFRefreshWrapperButton)wrapperButton;
- (FMFTintedActivityIndicatorView)aiv;
- (NSSet)locations;
- (UIImageView)imageView;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)locateNotification;
- (void)_updateLocateInProgress;
- (void)addLocation:(id)a3;
- (void)dealloc;
- (void)localTapped;
- (void)locatingInProgressChanged:(id)a3;
- (void)removeLocationForHandle:(id)a3;
- (void)setAiv:(id)a3;
- (void)setImageInsets:(UIEdgeInsets)a3;
- (void)setImageView:(id)a3;
- (void)setLocateNotification:(id)a3;
- (void)setLocations:(id)a3;
- (void)setWrapperButton:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation FMFRefreshBarButtonItem

- (FMFRefreshBarButtonItem)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263F1CB60]);
  v43.receiver = self;
  v43.super_class = (Class)FMFRefreshBarButtonItem;
  v8 = [(FMFRefreshBarButtonItem *)&v43 initWithCustomView:v7];

  if (v8)
  {
    v9 = [MEMORY[0x263F1C6C8] configurationWithScale:-1];
    v10 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"arrow.clockwise"];
    v11 = [v10 imageByApplyingSymbolConfiguration:v9];

    v12 = [[FMFTintedActivityIndicatorView alloc] initWithActivityIndicatorStyle:1];
    [(FMFRefreshBarButtonItem *)v8 setAiv:v12];

    v13 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v11];
    [(FMFRefreshBarButtonItem *)v8 setImageView:v13];

    v14 = [FMFRefreshWrapperButton alloc];
    v15 = [(FMFRefreshBarButtonItem *)v8 imageView];
    [v15 bounds];
    v16 = -[FMFRefreshWrapperButton initWithFrame:](v14, "initWithFrame:");
    [(FMFRefreshBarButtonItem *)v8 setWrapperButton:v16];

    v17 = [(FMFRefreshBarButtonItem *)v8 wrapperButton];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = [(FMFRefreshBarButtonItem *)v8 wrapperButton];
    [v18 addTarget:v6 action:a4 forControlEvents:64];

    v19 = [(FMFRefreshBarButtonItem *)v8 wrapperButton];
    [v19 addTarget:v8 action:sel_localTapped forControlEvents:64];

    v20 = [(FMFRefreshBarButtonItem *)v8 wrapperButton];
    [(FMFRefreshBarButtonItem *)v8 setCustomView:v20];

    v21 = [(FMFRefreshBarButtonItem *)v8 wrapperButton];
    v22 = [(FMFRefreshBarButtonItem *)v8 aiv];
    [v21 addSubview:v22];

    v23 = [(FMFRefreshBarButtonItem *)v8 aiv];
    v24 = [(FMFRefreshBarButtonItem *)v8 aiv];
    v25 = [v24 superview];
    [v23 centerHorizontalInView:v25];

    v26 = [(FMFRefreshBarButtonItem *)v8 aiv];
    v27 = [(FMFRefreshBarButtonItem *)v8 aiv];
    v28 = [v27 superview];
    [v26 centerVerticalInView:v28];

    v29 = [(FMFRefreshBarButtonItem *)v8 wrapperButton];
    v30 = [(FMFRefreshBarButtonItem *)v8 imageView];
    [v29 addSubview:v30];

    v31 = [(FMFRefreshBarButtonItem *)v8 wrapperButton];
    v32 = [v31 widthAnchor];
    v33 = [(FMFRefreshBarButtonItem *)v8 imageView];
    [v33 bounds];
    v35 = [v32 constraintEqualToConstant:v34];
    [v35 setActive:1];

    v36 = [(FMFRefreshBarButtonItem *)v8 wrapperButton];
    v37 = [v36 heightAnchor];
    v38 = [(FMFRefreshBarButtonItem *)v8 imageView];
    [v38 bounds];
    v40 = [v37 constraintEqualToConstant:v39];
    [v40 setActive:1];

    v41 = [MEMORY[0x263F08A00] defaultCenter];
    [v41 addObserver:v8 selector:sel_locatingInProgressChanged_ name:@"locatingInProgressChanged" object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"locatingInProgressChanged" object:0];

  v4.receiver = self;
  v4.super_class = (Class)FMFRefreshBarButtonItem;
  [(FMFRefreshBarButtonItem *)&v4 dealloc];
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v9.receiver = self;
  v9.super_class = (Class)FMFRefreshBarButtonItem;
  -[FMFRefreshBarButtonItem setImageInsets:](&v9, sel_setImageInsets_);
  v8 = [(FMFRefreshBarButtonItem *)self wrapperButton];
  objc_msgSend(v8, "setWrapperInsets:", -top, -left, -bottom, -right);
}

- (void)startAnimating
{
  if (![(FMFRefreshBarButtonItem *)self isAnimating])
  {
    v3 = [(FMFRefreshBarButtonItem *)self imageView];
    [v3 setHidden:1];

    objc_super v4 = [(FMFRefreshBarButtonItem *)self aiv];
    [v4 startAnimating];

    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v6 localizedStringForKey:@"ACCESSIBILITY_REFRESH_BUTTON_VALUE_REFRESHING" value:&stru_26CA0AD00 table:@"LocalizableUI"];
    [(FMFRefreshBarButtonItem *)self setAccessibilityValue:v5];
  }
}

- (void)stopAnimating
{
  if ([(FMFRefreshBarButtonItem *)self isAnimating])
  {
    v3 = [(FMFRefreshBarButtonItem *)self imageView];
    [v3 setHidden:0];

    objc_super v4 = [(FMFRefreshBarButtonItem *)self aiv];
    [v4 stopAnimating];

    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v6 localizedStringForKey:@"ACCESSIBILITY_REFRESH_BUTTON_VALUE_NOT_REFRESHING" value:&stru_26CA0AD00 table:@"LocalizableUI"];
    [(FMFRefreshBarButtonItem *)self setAccessibilityValue:v5];
  }
}

- (BOOL)isAnimating
{
  v2 = [(FMFRefreshBarButtonItem *)self aiv];
  char v3 = [v2 isAnimating];

  return v3;
}

- (void)setLocations:(id)a3
{
  objc_storeStrong((id *)&self->_locations, a3);
  [(FMFRefreshBarButtonItem *)self _updateLocateInProgress];
}

- (void)addLocation:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(FMFRefreshBarButtonItem *)self locations];
  id v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    id v6 = [MEMORY[0x263EFF9C0] set];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v16 = self;
  id v7 = [(FMFRefreshBarButtonItem *)self locations];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = [v12 handle];
        v14 = [v4 handle];
        int v15 = [v13 isEqual:v14];

        if (v15)
        {
          [v6 removeObject:v12];
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  [v6 addObject:v4];
  [(FMFRefreshBarButtonItem *)v16 setLocations:v6];
  [(FMFRefreshBarButtonItem *)v16 _updateLocateInProgress];
}

- (void)removeLocationForHandle:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = [(FMFRefreshBarButtonItem *)self locations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
      v11 = [v10 handle];
      char v12 = [v11 isEqual:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v13 = v10;

    if (!v13) {
      goto LABEL_13;
    }
    v14 = [(FMFRefreshBarButtonItem *)self locations];
    int v15 = (void *)[v14 mutableCopy];

    [v15 removeObject:v13];
    [(FMFRefreshBarButtonItem *)self setLocations:v15];

    v5 = v13;
  }
LABEL_12:

LABEL_13:
}

- (void)localTapped
{
  [(FMFRefreshBarButtonItem *)self _updateLocateInProgress];
  [(FMFRefreshBarButtonItem *)self startAnimating];
  dispatch_time_t v3 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__FMFRefreshBarButtonItem_localTapped__block_invoke;
  block[3] = &unk_2643438F0;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

uint64_t __38__FMFRefreshBarButtonItem_localTapped__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLocateInProgress];
}

- (void)locatingInProgressChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__FMFRefreshBarButtonItem_locatingInProgressChanged___block_invoke;
  block[3] = &unk_2643438F0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __53__FMFRefreshBarButtonItem_locatingInProgressChanged___block_invoke(uint64_t a1)
{
  v2 = LogCategory_Daemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2188D1000, v2, OS_LOG_TYPE_DEFAULT, "locatingInProgressChanged in FMFRefreshBarButtonItem", v4, 2u);
  }

  return [*(id *)(a1 + 32) performSelector:sel__updateLocateInProgress withObject:0 afterDelay:0.200000003];
}

- (void)_updateLocateInProgress
{
  dispatch_time_t v3 = [(FMFRefreshBarButtonItem *)self locations];

  if (v3 && [(FMFRefreshBarButtonItem *)self anyLocationIsUpdating])
  {
    [(FMFRefreshBarButtonItem *)self startAnimating];
  }
  else
  {
    [(FMFRefreshBarButtonItem *)self stopAnimating];
  }
}

- (BOOL)anyLocationIsUpdating
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(FMFRefreshBarButtonItem *)self locations];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isLocatingInProgress])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)accessibilityLabel
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"ACCESSIBILITY_REFRESH_BUTTON_LABEL" value:&stru_26CA0AD00 table:@"LocalizableUI"];

  return v3;
}

- (id)accessibilityHint
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"ACCESSIBILITY_REFRESH_BUTTON_HINT" value:&stru_26CA0AD00 table:@"LocalizableUI"];

  return v3;
}

- (NSSet)locations
{
  return self->_locations;
}

- (FMFRefreshWrapperButton)wrapperButton
{
  return self->_wrapperButton;
}

- (void)setWrapperButton:(id)a3
{
}

- (FMFTintedActivityIndicatorView)aiv
{
  return self->_aiv;
}

- (void)setAiv:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (id)locateNotification
{
  return self->_locateNotification;
}

- (void)setLocateNotification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locateNotification, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_aiv, 0);
  objc_storeStrong((id *)&self->_wrapperButton, 0);
  objc_storeStrong((id *)&self->_locations, 0);
}

@end