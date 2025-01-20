@interface AMSUIWebSnapshotView
+ (id)_imageViewForImage:(id)a3;
+ (void)_screenCapFromView:(id)a3 completion:(id)a4;
- (AMSUIWebSnapshotView)initWithView:(id)a3 completion:(id)a4;
- (BOOL)_visibilityUnmodified;
- (UIView)snapshot;
- (double)originalRatio;
- (id)removeSnapshot;
- (int64_t)originalInterfaceStyle;
- (unint64_t)visibilityModifiers;
- (void)layoutSubviews;
- (void)setOriginalInterfaceStyle:(int64_t)a3;
- (void)setOriginalRatio:(double)a3;
- (void)setSnapshot:(id)a3;
- (void)setVisibilityModifiers:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSnapshot:(id)a3;
@end

@implementation AMSUIWebSnapshotView

- (AMSUIWebSnapshotView)initWithView:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebSnapshotView;
  v8 = [(AMSUICommonView *)&v16 init];
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = objc_opt_class();
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__AMSUIWebSnapshotView_initWithView_completion___block_invoke;
    v12[3] = &unk_2643E5720;
    objc_copyWeak(&v14, &location);
    id v13 = v7;
    [v9 _screenCapFromView:v6 completion:v12];
    v10 = [(AMSUIWebSnapshotView *)v8 traitCollection];
    v8->_originalInterfaceStyle = [v10 userInterfaceStyle];

    v8->_visibilityModifiers = 0;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __48__AMSUIWebSnapshotView_initWithView_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6) {
    [WeakRetained updateSnapshot:v6];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)updateSnapshot:(id)a3
{
  [(AMSUIWebSnapshotView *)self setSnapshot:a3];
  v4 = [(AMSUIWebSnapshotView *)self snapshot];

  if (v4)
  {
    uint64_t v5 = [(AMSUIWebSnapshotView *)self snapshot];
    [(AMSUIWebSnapshotView *)self addSubview:v5];

    [(AMSUIWebSnapshotView *)self setNeedsLayout];
  }
}

- (id)removeSnapshot
{
  v3 = [(AMSUIWebSnapshotView *)self snapshot];
  v4 = [(AMSUIWebSnapshotView *)self snapshot];
  [v4 removeFromSuperview];

  [(AMSUIWebSnapshotView *)self setSnapshot:0];
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)AMSUIWebSnapshotView;
  [(AMSUIWebSnapshotView *)&v28 layoutSubviews];
  [(AMSUIWebSnapshotView *)self bounds];
  double v4 = v3;
  [(AMSUIWebSnapshotView *)self bounds];
  double v6 = v4 / v5;
  [(AMSUIWebSnapshotView *)self originalRatio];
  if (v7 == 0.0)
  {
    [(AMSUIWebSnapshotView *)self bounds];
    double v9 = v8;
    [(AMSUIWebSnapshotView *)self bounds];
    [(AMSUIWebSnapshotView *)self setOriginalRatio:v9 / v10];
  }
  [(AMSUIWebSnapshotView *)self originalRatio];
  if (v6 == v11)
  {
    [(AMSUIWebSnapshotView *)self setVisibilityModifiers:[(AMSUIWebSnapshotView *)self visibilityModifiers] & 0xFFFFFFFFFFFFFFFELL];
    if (![(AMSUIWebSnapshotView *)self _visibilityUnmodified]) {
      return;
    }
    v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v12)
    {
      v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      v15 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v14;
      __int16 v31 = 2114;
      v32 = v15;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Unhiding snapshot.", buf, 0x16u);
    }
    objc_super v16 = [(AMSUIWebSnapshotView *)self snapshot];
    [v16 setHidden:0];

    v17 = [(AMSUIWebSnapshotView *)self snapshot];
    v18 = v17;
    double v19 = 1.0;
  }
  else
  {
    v20 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v20)
    {
      v20 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_opt_class();
      v23 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v22;
      __int16 v31 = 2114;
      v32 = v23;
      _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding layout visibility modifier and hiding snapshot.", buf, 0x16u);
    }
    [(AMSUIWebSnapshotView *)self setVisibilityModifiers:[(AMSUIWebSnapshotView *)self visibilityModifiers] | 1];
    v24 = [(AMSUIWebSnapshotView *)self snapshot];
    [v24 setHidden:0];

    [(AMSUIWebSnapshotView *)self originalRatio];
    double v26 = v25 - v6;
    if (v26 >= 0.0) {
      double v26 = -v26;
    }
    double v27 = v26 * 100.0 + 1.0;
    v17 = [(AMSUIWebSnapshotView *)self snapshot];
    v18 = v17;
    double v19 = v27;
  }
  [v17 setAlpha:v19];
}

+ (id)_imageViewForImage:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x263F82828];
  id v4 = a3;
  double v5 = (void *)[[v3 alloc] initWithImage:v4];

  return v5;
}

+ (void)_screenCapFromView:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v20 = v6;
  double v8 = [v6 subviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v25;
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v14 = v11;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(id *)(*((void *)&v24 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v11 = v15;
        }
        else {
          id v11 = 0;
        }

        uint64_t v16 = [v11 underlyingWebView];
        if (v16)
        {
          v17 = (void *)v16;

          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __54__AMSUIWebSnapshotView__screenCapFromView_completion___block_invoke;
          v21[3] = &unk_2643E5748;
          id v23 = v7;
          id v11 = v11;
          id v22 = v11;
          [v11 takeSnapshotWithCompletion:v21];

          v18 = v23;
          double v19 = v20;
          goto LABEL_16;
        }
        ++v13;
        uint64_t v14 = v11;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v11 = 0;
  }

  double v19 = v20;
  v17 = [v20 snapshotViewAfterScreenUpdates:0];
  v18 = [a1 _imageViewForImage:v17];
  (*((void (**)(id, id, void *, void))v7 + 2))(v7, v11, v18, 0);
LABEL_16:
}

uint64_t __54__AMSUIWebSnapshotView__screenCapFromView_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebSnapshotView;
  [(AMSUIWebSnapshotView *)&v18 traitCollectionDidChange:a3];
  id v4 = [(AMSUIWebSnapshotView *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];
  int64_t v6 = [(AMSUIWebSnapshotView *)self originalInterfaceStyle];

  if (v5 == v6)
  {
    [(AMSUIWebSnapshotView *)self setVisibilityModifiers:[(AMSUIWebSnapshotView *)self visibilityModifiers] & 0xFFFFFFFFFFFFFFFDLL];
    if (![(AMSUIWebSnapshotView *)self _visibilityUnmodified]) {
      return;
    }
    id v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v7)
    {
      id v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      id v22 = v10;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Unhiding snapshot.", buf, 0x16u);
    }
    id v11 = [(AMSUIWebSnapshotView *)self snapshot];
    uint64_t v12 = v11;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v14)
    {
      uint64_t v14 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      v17 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      id v22 = v17;
      _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding interface style visibility modifier and hiding snapshot.", buf, 0x16u);
    }
    [(AMSUIWebSnapshotView *)self setVisibilityModifiers:[(AMSUIWebSnapshotView *)self visibilityModifiers] | 2];
    id v11 = [(AMSUIWebSnapshotView *)self snapshot];
    uint64_t v12 = v11;
    uint64_t v13 = 1;
  }
  [v11 setHidden:v13];
}

- (BOOL)_visibilityUnmodified
{
  return [(AMSUIWebSnapshotView *)self visibilityModifiers] == 0;
}

- (UIView)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (double)originalRatio
{
  return self->_originalRatio;
}

- (void)setOriginalRatio:(double)a3
{
  self->_originalRatio = a3;
}

- (int64_t)originalInterfaceStyle
{
  return self->_originalInterfaceStyle;
}

- (void)setOriginalInterfaceStyle:(int64_t)a3
{
  self->_originalInterfaceStyle = a3;
}

- (unint64_t)visibilityModifiers
{
  return self->_visibilityModifiers;
}

- (void)setVisibilityModifiers:(unint64_t)a3
{
  self->_visibilityModifiers = a3;
}

- (void).cxx_destruct
{
}

@end