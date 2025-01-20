@interface DOCDownloadProgressView
+ (UIColor)defaultProgressColor;
+ (UIColor)defaultTrackColor;
+ (UIColor)defaultTrackColorOnSelectedBackground;
- (BOOL)canShowStopButton;
- (BOOL)graduallyIncreasingProgress;
- (BOOL)shouldStopObservingProgress;
- (CGSize)intrinsicContentSize;
- (DOCDeterminateProgressRingView)determinateProgressRingView;
- (DOCDownloadProgressView)initWithCoder:(id)a3;
- (DOCDownloadProgressView)initWithFrame:(CGRect)a3;
- (DOCGhostRingView)ghostRingView;
- (DOCIndeterminateProgressRingView)indeterminateProgressRingView;
- (NSProgress)observedProgress;
- (UIColor)activeStrokeColor;
- (UIColor)inactiveStrokeColor;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (double)progress;
- (void)_addToPendingAnimationQueue:(id)a3;
- (void)_setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_updateStatusPropertiesAnimated:(BOOL)a3 completion:(id)a4;
- (void)animateToFullRingAndHideWithCompletion:(id)a3;
- (void)beginGraduallyIncreasingProgress;
- (void)dealloc;
- (void)doc_commonInit;
- (void)fadeoutWithCompletion:(id)a3;
- (void)handleTap:(id)a3;
- (void)installSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActiveStrokeColor:(id)a3;
- (void)setCanShowStopButton:(BOOL)a3;
- (void)setDeterminateProgressRingView:(id)a3;
- (void)setGhostRingView:(id)a3;
- (void)setGraduallyIncreasingProgress:(BOOL)a3;
- (void)setInactiveStrokeColor:(id)a3;
- (void)setIndeterminateProgressRingView:(id)a3;
- (void)setObservedProgress:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
- (void)setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setShouldStopObservingProgress:(BOOL)a3;
- (void)setTapGestureRecognizer:(id)a3;
@end

@implementation DOCDownloadProgressView

- (DOCDownloadProgressView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DOCDownloadProgressView;
  v3 = [(DOCDownloadProgressView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(DOCDownloadProgressView *)v3 doc_commonInit];
    v5 = v4;
  }

  return v4;
}

- (DOCDownloadProgressView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DOCDownloadProgressView;
  v3 = -[DOCDownloadProgressView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(DOCDownloadProgressView *)v3 doc_commonInit];
    v5 = v4;
  }

  return v4;
}

+ (UIColor)defaultTrackColor
{
  return (UIColor *)[MEMORY[0x263F825C8] systemFillColor];
}

+ (UIColor)defaultTrackColorOnSelectedBackground
{
  v2 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:2];
  v3 = [MEMORY[0x263F825C8] secondaryLabelColor];
  v4 = [v3 resolvedColorWithTraitCollection:v2];

  return (UIColor *)v4;
}

+ (UIColor)defaultProgressColor
{
  v2 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:2];
  v3 = [MEMORY[0x263F825C8] labelColor];
  v4 = [v3 resolvedColorWithTraitCollection:v2];

  return (UIColor *)v4;
}

- (void)doc_commonInit
{
  v3 = [DOCGhostRingView alloc];
  [(DOCDownloadProgressView *)self bounds];
  v4 = -[DOCGhostRingView initWithFrame:](v3, "initWithFrame:");
  ghostRingView = self->_ghostRingView;
  self->_ghostRingView = v4;

  v6 = [DOCIndeterminateProgressRingView alloc];
  [(DOCDownloadProgressView *)self bounds];
  objc_super v7 = -[DOCIndeterminateProgressRingView initWithFrame:](v6, "initWithFrame:");
  indeterminateProgressRingView = self->_indeterminateProgressRingView;
  self->_indeterminateProgressRingView = v7;

  v9 = [DOCDeterminateProgressRingView alloc];
  [(DOCDownloadProgressView *)self bounds];
  v10 = -[DOCDeterminateProgressRingView initWithFrame:](v9, "initWithFrame:");
  determinateProgressRingView = self->_determinateProgressRingView;
  self->_determinateProgressRingView = v10;

  [(DOCGhostRingView *)self->_ghostRingView setAlpha:0.0];
  [(DOCIndeterminateProgressRingView *)self->_indeterminateProgressRingView setAlpha:0.0];
  [(DOCDeterminateProgressRingView *)self->_determinateProgressRingView setAlpha:0.0];
  id v17 = [(id)objc_opt_class() defaultProgressColor];
  v12 = [(id)objc_opt_class() defaultTrackColor];
  [(DOCGhostRingView *)self->_ghostRingView setTintColor:v12];

  [(DOCIndeterminateProgressRingView *)self->_indeterminateProgressRingView setTintColor:v17];
  [(DOCDeterminateProgressRingView *)self->_determinateProgressRingView setTintColor:v17];
  [(DOCDownloadProgressView *)self installSubviews];
  v13 = (NSOperationQueue *)objc_opt_new();
  pendingAnimationQueue = self->_pendingAnimationQueue;
  self->_pendingAnimationQueue = v13;

  [(NSOperationQueue *)self->_pendingAnimationQueue setMaxConcurrentOperationCount:1];
  [(DOCDownloadProgressView *)self _updateStatusPropertiesAnimated:0 completion:0];
  v15 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleTap_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v15;

  [(DOCDownloadProgressView *)self addGestureRecognizer:self->_tapGestureRecognizer];
}

- (void)installSubviews
{
  v12[3] = *MEMORY[0x263EF8340];
  v2 = self;
  [(DOCDownloadProgressView *)v2 setAutoresizesSubviews:1];
  v3 = v2;
  if (DOCVibrancyFeatureEnabled())
  {
    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    [(DOCDownloadProgressView *)v2 bounds];
    v5 = objc_msgSend(v4, "initWithFrame:");
    v6 = [v5 asPrimaryStrokeViewDecoratorEmbeddable];
    v3 = v2;
    if (v6)
    {
      v3 = v5;

      [v6 setAutoresizingMask:18];
      [(DOCDownloadProgressView *)v2 bounds];
      objc_msgSend(v6, "setFrame:");
      [(DOCDownloadProgressView *)v2 addSubview:v6];
    }
  }
  v12[0] = v2->_indeterminateProgressRingView;
  v12[1] = v2->_ghostRingView;
  v12[2] = v2->_determinateProgressRingView;
  objc_super v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__DOCDownloadProgressView_installSubviews__block_invoke;
  v10[3] = &unk_2648FB6F8;
  v11 = v3;
  v8 = v3;
  [v7 enumerateObjectsUsingBlock:v10];
  v9 = objc_msgSend(MEMORY[0x263F827D8], "doc_circleWithInset:", -8.0);
  [(DOCDownloadProgressView *)v2 setHoverStyle:v9];
}

void __42__DOCDownloadProgressView_installSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAutoresizingMask:18];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v3, "setFrame:");
  [*(id *)(a1 + 32) addSubview:v3];
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_observedProgress && self->_shouldStopObservingProgress)
  {
    id v3 = (NSObject **)MEMORY[0x263F3AC88];
    id v4 = *MEMORY[0x263F3AC88];
    if (!*MEMORY[0x263F3AC88])
    {
      DOCInitLogging();
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      observedProgress = self->_observedProgress;
      *(_DWORD *)buf = 138543362;
      v9 = observedProgress;
      _os_log_impl(&dword_22BDC5000, v4, OS_LOG_TYPE_DEFAULT, "Progress: [Download Progress View] REMOVE-DEALLOC fractionCompleted observer for: %{public}@", buf, 0xCu);
    }
    [(NSProgress *)self->_observedProgress removeObserver:self forKeyPath:@"fractionCompleted"];
    [(NSProgress *)self->_observedProgress removeObserver:self forKeyPath:@"isIndeterminate"];
    self->_shouldStopObservingProgress = 0;
    v6 = self->_observedProgress;
    self->_observedProgress = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)DOCDownloadProgressView;
  [(DOCDownloadProgressView *)&v7 dealloc];
}

- (void)setActiveStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_activeStrokeColor, a3);
  id v5 = a3;
  [(DOCIndeterminateProgressRingView *)self->_indeterminateProgressRingView setTintColor:v5];
  [(DOCDeterminateProgressRingView *)self->_determinateProgressRingView setTintColor:v5];
}

- (void)setInactiveStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveStrokeColor, a3);
  id v5 = a3;
  [(DOCGhostRingView *)self->_ghostRingView setTintColor:v5];
}

- (void)_addToPendingAnimationQueue:(id)a3
{
  id v4 = a3;
  id v5 = self->_pendingAnimationQueue;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke;
  aBlock[3] = &unk_2648FB720;
  aBlock[4] = self;
  v6 = v5;
  v25 = v6;
  objc_super v7 = _Block_copy(aBlock);
  v8 = (NSObject **)MEMORY[0x263F3AC88];
  v9 = *MEMORY[0x263F3AC88];
  if (!*MEMORY[0x263F3AC88])
  {
    DOCInitLogging();
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[DOCDownloadProgressView _addToPendingAnimationQueue:]((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
  }
  pendingAnimationQueue = self->_pendingAnimationQueue;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_24;
  v20[3] = &unk_2648FB748;
  v20[4] = self;
  v21 = v6;
  id v22 = v4;
  id v23 = v7;
  id v17 = v7;
  id v18 = v4;
  v19 = v6;
  [(NSOperationQueue *)pendingAnimationQueue addOperationWithBlock:v20];
}

uint64_t __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke(uint64_t a1, char a2)
{
  id v4 = (NSObject **)MEMORY[0x263F3AC88];
  id v5 = *MEMORY[0x263F3AC88];
  if (!*MEMORY[0x263F3AC88])
  {
    DOCInitLogging();
    id v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_cold_1(a1, a2, v5);
  }
  return [*(id *)(a1 + 40) setSuspended:0];
}

void __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_24(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A48] mainQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_2;
  v4[3] = &unk_2648FB748;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 addOperationWithBlock:v4];
}

uint64_t __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_2(uint64_t a1)
{
  v2 = (NSObject **)MEMORY[0x263F3AC88];
  id v3 = *MEMORY[0x263F3AC88];
  if (!*MEMORY[0x263F3AC88])
  {
    DOCInitLogging();
    id v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_2_cold_2(a1, v3, v4, v5, v6, v7, v8, v9);
  }
  [*(id *)(a1 + 40) setSuspended:1];
  uint64_t v10 = *v2;
  if (!*v2)
  {
    DOCInitLogging();
    uint64_t v10 = *v2;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_2_cold_1(a1, v10, v11, v12, v13, v14, v15, v16);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_updateStatusPropertiesAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_progress == 0.0)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke;
    aBlock[3] = &unk_2648FB608;
    aBlock[4] = self;
    uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v8 = v7;
    if (v4)
    {
      uint64_t v9 = (void *)MEMORY[0x263F82E00];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_2;
      v18[3] = &unk_2648FB770;
      id v19 = v6;
      [v9 animateWithDuration:v8 animations:v18 completion:0.35];
    }
    else
    {
      v7[2](v7);
      if (v6) {
        (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
      }
    }
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_3;
    v17[3] = &unk_2648FB608;
    v17[4] = self;
    uint64_t v8 = (void (**)(void))_Block_copy(v17);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_4;
    v16[3] = &unk_2648FB608;
    v16[4] = self;
    uint64_t v10 = _Block_copy(v16);
    uint64_t v11 = v10;
    if (v4)
    {
      uint64_t v12 = (void *)MEMORY[0x263F82E00];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_5;
      v13[3] = &unk_2648FB798;
      uint64_t v14 = v8;
      id v15 = v6;
      [v12 animateWithDuration:v11 animations:v13 completion:0.35];
    }
    else
    {
      (*((void (**)(void *))v10 + 2))(v10);
      v8[2](v8);
      if (v6) {
        (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
      }
    }
  }
}

void __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) indeterminateProgressRingView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) ghostRingView];
  [v3 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) determinateProgressRingView];
  [v4 setAlpha:0.0];
}

uint64_t __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) progress];
  double v3 = v2;
  id v4 = [*(id *)(a1 + 32) determinateProgressRingView];
  [v4 setProgress:v3];
}

void __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_4(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) indeterminateProgressRingView];
  [v2 setAlpha:0.0];

  double v3 = [*(id *)(a1 + 32) ghostRingView];
  [v3 setAlpha:1.0];

  id v4 = [*(id *)(a1 + 32) determinateProgressRingView];
  [v4 setAlpha:1.0];
}

void __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_5(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F82E00];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_6;
  v3[3] = &unk_2648FB770;
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v1 animateWithDuration:134 delay:v2 options:v3 animations:0.4 completion:0.0];
}

uint64_t __70__DOCDownloadProgressView__updateStatusPropertiesAnimated_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = (void (**)(void, void))v8;
  double progress = self->_progress;
  if (progress == a3)
  {
    if (v8) {
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
    }
  }
  else
  {
    self->_double progress = a3;
    if (a3 == 0.0 || progress == 0.0)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __60__DOCDownloadProgressView__setProgress_animated_completion___block_invoke;
      v17[3] = &unk_2648FB770;
      id v18 = v8;
      [(DOCDownloadProgressView *)self _updateStatusPropertiesAnimated:v5 completion:v17];
    }
    else
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __60__DOCDownloadProgressView__setProgress_animated_completion___block_invoke_2;
      aBlock[3] = &unk_2648FB5E0;
      aBlock[4] = self;
      *(double *)&void aBlock[5] = a3;
      uint64_t v11 = _Block_copy(aBlock);
      uint64_t v12 = v11;
      if (v5)
      {
        uint64_t v13 = (void *)MEMORY[0x263F82E00];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __60__DOCDownloadProgressView__setProgress_animated_completion___block_invoke_3;
        v14[3] = &unk_2648FB770;
        id v15 = v9;
        [v13 animateWithDuration:134 delay:v12 options:v14 animations:0.4 completion:0.0];
      }
      else
      {
        (*((void (**)(void *))v11 + 2))(v11);
        if (v9) {
          v9[2](v9, 1);
        }
      }
    }
  }
}

uint64_t __60__DOCDownloadProgressView__setProgress_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __60__DOCDownloadProgressView__setProgress_animated_completion___block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) determinateProgressRingView];
  [v2 setProgress:v1];
}

uint64_t __60__DOCDownloadProgressView__setProgress_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void))a5;
  uint64_t v9 = (NSObject **)MEMORY[0x263F3AC88];
  uint64_t v10 = *MEMORY[0x263F3AC88];
  if (!*MEMORY[0x263F3AC88])
  {
    DOCInitLogging();
    uint64_t v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 138412802;
    *(void *)&location[4] = self;
    __int16 v16 = 2048;
    double v17 = a3;
    __int16 v18 = 1024;
    BOOL v19 = v5;
    _os_log_debug_impl(&dword_22BDC5000, v10, OS_LOG_TYPE_DEBUG, "%@ | --setStatus--\tcalled with status: %f animated: %d", location, 0x1Cu);
  }
  if (self->_graduallyIncreasingProgress)
  {
    if (v8) {
      v8[2](v8, 0);
    }
  }
  else
  {
    objc_initWeak((id *)location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__DOCDownloadProgressView_setProgress_animated_completion___block_invoke;
    v11[3] = &unk_2648FB7C0;
    objc_copyWeak(v13, (id *)location);
    v13[1] = *(id *)&a3;
    BOOL v14 = v5;
    uint64_t v12 = v8;
    [(DOCDownloadProgressView *)self _addToPendingAnimationQueue:v11];

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)location);
  }
}

void __59__DOCDownloadProgressView_setProgress_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v5 = *(double *)(a1 + 48);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__DOCDownloadProgressView_setProgress_animated_completion___block_invoke_2;
  v8[3] = &unk_2648FB798;
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v7 = v3;
  [WeakRetained _setProgress:v6 animated:v8 completion:v5];
}

uint64_t __59__DOCDownloadProgressView_setProgress_animated_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &DOCDownloadProgressViewKVOContext)
  {
    id v7 = [(DOCDownloadProgressView *)self observedProgress];
    int v8 = [v7 isIndeterminate];

    if (v8)
    {
      [(DOCDownloadProgressView *)self setProgress:1 animated:0.0];
    }
    else
    {
      id v9 = [(DOCDownloadProgressView *)self observedProgress];
      [v9 fractionCompleted];
      -[DOCDownloadProgressView setProgress:animated:](self, "setProgress:animated:", 1);
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)DOCDownloadProgressView;
    -[DOCDownloadProgressView observeValueForKeyPath:ofObject:change:context:](&v10, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setObservedProgress:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v5 = (NSProgress *)a3;
  p_observedProgress = (id *)&self->_observedProgress;
  observedProgress = self->_observedProgress;
  if (observedProgress != v5)
  {
    if (observedProgress) {
      BOOL v8 = !self->_shouldStopObservingProgress;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      id v9 = (NSObject **)MEMORY[0x263F3AC88];
      objc_super v10 = *MEMORY[0x263F3AC88];
      if (!*MEMORY[0x263F3AC88])
      {
        DOCInitLogging();
        objc_super v10 = *v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = *p_observedProgress;
        int v18 = 138543362;
        id v19 = v11;
        _os_log_impl(&dword_22BDC5000, v10, OS_LOG_TYPE_DEFAULT, "Progress: [Download Progress View] REMOVE fractionCompleted observer for: %{public}@", (uint8_t *)&v18, 0xCu);
      }
      [*p_observedProgress removeObserver:self forKeyPath:@"fractionCompleted"];
      [*p_observedProgress removeObserver:self forKeyPath:@"isIndeterminate"];
      [(DOCDownloadProgressView *)self setShouldStopObservingProgress:0];
    }
    objc_storeStrong((id *)&self->_observedProgress, a3);
    if (*p_observedProgress && ([*p_observedProgress isFinished] & 1) == 0)
    {
      uint64_t v12 = [(DOCDownloadProgressView *)self observedProgress];
      int v13 = [v12 isIndeterminate];

      if (v13)
      {
        [(DOCDownloadProgressView *)self setProgress:1 animated:0.0];
      }
      else
      {
        BOOL v14 = [(DOCDownloadProgressView *)self observedProgress];
        [v14 fractionCompleted];
        -[DOCDownloadProgressView setProgress:animated:](self, "setProgress:animated:", 1);
      }
      id v15 = (NSObject **)MEMORY[0x263F3AC88];
      __int16 v16 = *MEMORY[0x263F3AC88];
      if (!*MEMORY[0x263F3AC88])
      {
        DOCInitLogging();
        __int16 v16 = *v15;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = *p_observedProgress;
        int v18 = 138543362;
        id v19 = v17;
        _os_log_impl(&dword_22BDC5000, v16, OS_LOG_TYPE_DEFAULT, "Progress: [Download Progress View] ADD fractionCompleted observer for: %{public}@", (uint8_t *)&v18, 0xCu);
      }
      [*p_observedProgress addObserver:self forKeyPath:@"fractionCompleted" options:1 context:&DOCDownloadProgressViewKVOContext];
      [*p_observedProgress addObserver:self forKeyPath:@"isIndeterminate" options:1 context:&DOCDownloadProgressViewKVOContext];
      self->_shouldStopObservingProgress = 1;
    }
    else
    {
      [(DOCDownloadProgressView *)self setProgress:1 animated:0.0];
    }
  }
}

- (void)beginGraduallyIncreasingProgress
{
  self->_graduallyIncreasingProgress = 1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke;
  aBlock[3] = &unk_2648FB608;
  aBlock[4] = self;
  uint64_t v3 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_4;
  v5[3] = &unk_2648FB7E8;
  v5[4] = self;
  objc_copyWeak(&v7, &location);
  id v4 = v3;
  id v6 = v4;
  [(DOCDownloadProgressView *)self _addToPendingAnimationQueue:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_2;
  v3[3] = &unk_2648FB608;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_3;
  v2[3] = &unk_2648FB518;
  v2[4] = v4;
  return [MEMORY[0x263F82E00] animateWithDuration:134 delay:v3 options:v2 animations:5.0 completion:0.0];
}

uint64_t __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setProgress:0 animated:0 completion:1.0];
}

uint64_t __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _setProgress:0 animated:0 completion:0.0];
  }
  return result;
}

void __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_4(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] progress];
  if (v4 == 0.0)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_5;
    v6[3] = &unk_2648FB798;
    id v7 = a1[5];
    id v8 = v3;
    [WeakRetained _setProgress:1 animated:v6 completion:0.0];
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }
}

uint64_t __59__DOCDownloadProgressView_beginGraduallyIncreasingProgress__block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)fadeoutWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__DOCDownloadProgressView_fadeoutWithCompletion___block_invoke;
  v6[3] = &unk_2648FB838;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(DOCDownloadProgressView *)self _addToPendingAnimationQueue:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__DOCDownloadProgressView_fadeoutWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F82E00];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__DOCDownloadProgressView_fadeoutWithCompletion___block_invoke_2;
  v9[3] = &unk_2648FB810;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__DOCDownloadProgressView_fadeoutWithCompletion___block_invoke_3;
  v6[3] = &unk_2648FB798;
  id v7 = *(id *)(a1 + 32);
  id v5 = v3;
  id v8 = v5;
  [v4 animateWithDuration:v9 animations:v6 completion:0.25];

  objc_destroyWeak(&v10);
}

void __49__DOCDownloadProgressView_fadeoutWithCompletion___block_invoke_2(uint64_t a1)
{
  double v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained determinateProgressRingView];
  [v3 setAlpha:0.0];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = [v4 ghostRingView];
  [v5 setAlpha:0.0];

  id v7 = objc_loadWeakRetained(v1);
  id v6 = [v7 indeterminateProgressRingView];
  [v6 setAlpha:0.0];
}

uint64_t __49__DOCDownloadProgressView_fadeoutWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)animateToFullRingAndHideWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke;
  v6[3] = &unk_2648FB838;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(DOCDownloadProgressView *)self _addToPendingAnimationQueue:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained determinateProgressRingView];
  id v6 = [v5 layer];
  id v7 = [v6 presentationLayer];
  [v7 strokeEnd];
  double v9 = v8;

  id v10 = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = [v10 determinateProgressRingView];
  uint64_t v12 = [v11 layer];
  [v12 removeAllAnimations];

  id v13 = objc_loadWeakRetained((id *)(a1 + 40));
  [v13 _setProgress:0 animated:0 completion:v9];

  id v14 = objc_loadWeakRetained((id *)(a1 + 40));
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke_2;
  v16[3] = &unk_2648FB888;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  id v17 = *(id *)(a1 + 32);
  id v15 = v3;
  id v18 = v15;
  [v14 _setProgress:1 animated:v16 completion:1.0];

  objc_destroyWeak(&v19);
}

void __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke_2(id *a1)
{
  id v2 = (void *)MEMORY[0x263F82E00];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke_3;
  v8[3] = &unk_2648FB810;
  id v3 = a1 + 6;
  objc_copyWeak(&v9, a1 + 6);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke_4;
  v4[3] = &unk_2648FB860;
  id v5 = a1[4];
  objc_copyWeak(&v7, v3);
  id v6 = a1[5];
  [v2 animateWithDuration:v8 animations:v4 completion:0.25];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
}

void __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke_3(uint64_t a1)
{
  double v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained determinateProgressRingView];
  [v3 setAlpha:0.0];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = [v4 ghostRingView];
  [v5 setAlpha:0.0];

  id v7 = objc_loadWeakRetained(v1);
  id v6 = [v7 indeterminateProgressRingView];
  [v6 setAlpha:0.0];
}

uint64_t __66__DOCDownloadProgressView_animateToFullRingAndHideWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setGraduallyIncreasingProgress:0];

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

- (CGSize)intrinsicContentSize
{
  double v2 = 36.0;
  double v3 = 36.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setCanShowStopButton:(BOOL)a3
{
  self->_canShowStopButton = a3;
  -[DOCDeterminateProgressRingView setCanShowStopButton:](self->_determinateProgressRingView, "setCanShowStopButton:");
}

- (void)handleTap:(id)a3
{
  if ([a3 state] == 3)
  {
    observedProgress = self->_observedProgress;
    if (observedProgress)
    {
      [(NSProgress *)observedProgress cancel];
    }
  }
}

- (UIColor)inactiveStrokeColor
{
  return self->_inactiveStrokeColor;
}

- (UIColor)activeStrokeColor
{
  return self->_activeStrokeColor;
}

- (NSProgress)observedProgress
{
  return self->_observedProgress;
}

- (BOOL)canShowStopButton
{
  return self->_canShowStopButton;
}

- (DOCGhostRingView)ghostRingView
{
  return self->_ghostRingView;
}

- (void)setGhostRingView:(id)a3
{
}

- (DOCDeterminateProgressRingView)determinateProgressRingView
{
  return self->_determinateProgressRingView;
}

- (void)setDeterminateProgressRingView:(id)a3
{
}

- (DOCIndeterminateProgressRingView)indeterminateProgressRingView
{
  return self->_indeterminateProgressRingView;
}

- (void)setIndeterminateProgressRingView:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_double progress = a3;
}

- (BOOL)graduallyIncreasingProgress
{
  return self->_graduallyIncreasingProgress;
}

- (void)setGraduallyIncreasingProgress:(BOOL)a3
{
  self->_graduallyIncreasingProgress = a3;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (BOOL)shouldStopObservingProgress
{
  return self->_shouldStopObservingProgress;
}

- (void)setShouldStopObservingProgress:(BOOL)a3
{
  self->_shouldStopObservingProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indeterminateProgressRingView, 0);
  objc_storeStrong((id *)&self->_determinateProgressRingView, 0);
  objc_storeStrong((id *)&self->_ghostRingView, 0);
  objc_storeStrong((id *)&self->_observedProgress, 0);
  objc_storeStrong((id *)&self->_activeStrokeColor, 0);
  objc_storeStrong((id *)&self->_inactiveStrokeColor, 0);

  objc_storeStrong((id *)&self->_pendingAnimationQueue, 0);
}

- (void)_addToPendingAnimationQueue:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_cold_1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2 & 1;
  _os_log_debug_impl(&dword_22BDC5000, log, OS_LOG_TYPE_DEBUG, "%@ | --_addToPendingAnimationQueue--\tResuming queue. Anim finished: %d.", (uint8_t *)&v4, 0x12u);
}

void __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__DOCDownloadProgressView__addToPendingAnimationQueue___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end