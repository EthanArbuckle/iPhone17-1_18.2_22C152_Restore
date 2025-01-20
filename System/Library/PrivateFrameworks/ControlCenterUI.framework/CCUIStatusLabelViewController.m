@interface CCUIStatusLabelViewController
- (BOOL)_canShowWhileLocked;
- (CCUIStatusLabelViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CCUIStatusLabelViewControllerDelegate)delegate;
- (UIEdgeInsets)edgeInsets;
- (unint64_t)_advancePresentationStateFromFadeIn;
- (unint64_t)_advancePresentationStateFromPresenting;
- (unint64_t)_advancePresentationStateFromReady;
- (unint64_t)verticalAlignment;
- (void)_advancePresentationState;
- (void)_fadeInStatusLabel:(id)a3;
- (void)_fadeOutStatusLabel:(id)a3;
- (void)_notifyDelegateDidFinishStatusUpdates;
- (void)_notifyDelegateWillBeginStatusUpdates;
- (void)_resetPresentationStateAnimated:(BOOL)a3;
- (void)enqueueStatusUpdate:(id)a3 forIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setVerticalAlignment:(unint64_t)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CCUIStatusLabelViewController

- (void)viewWillLayoutSubviews
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)CCUIStatusLabelViewController;
  [(CCUIStatusLabelViewController *)&v17 viewWillLayoutSubviews];
  v3 = [(CCUIStatusLabelViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = self->_statusLabels;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "setFrame:", 0.0, 0.0, v5, v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(CCUIStatusLabelViewController *)self loadViewIfNeeded];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = self->_statusLabels;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "setEdgeInsets:", top, left, bottom, right, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (CCUIStatusLabelViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CCUIStatusLabelViewController;
  double v4 = [(CCUIStatusLabelViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    double v5 = objc_alloc_init(CCUIStatusUpdateQueue);
    updateQueue = v4->_updateQueue;
    v4->_updateQueue = v5;
  }
  return v4;
}

- (UIEdgeInsets)edgeInsets
{
  v2 = [(NSArray *)self->_statusLabels firstObject];
  [v2 edgeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.double right = v14;
  result.double bottom = v13;
  result.double left = v12;
  result.double top = v11;
  return result;
}

- (unint64_t)verticalAlignment
{
  v2 = [(NSArray *)self->_statusLabels firstObject];
  unint64_t v3 = [v2 verticalAlignment];

  return v3;
}

- (void)setVerticalAlignment:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(CCUIStatusLabelViewController *)self loadViewIfNeeded];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v5 = self->_statusLabels;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setVerticalAlignment:", a3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)enqueueStatusUpdate:(id)a3 forIdentifier:(id)a4
{
  [(CCUIStatusUpdateQueue *)self->_updateQueue enqueueStatusUpdate:a3 forIdentifier:a4];
  if (!self->_presentationState)
  {
    [(CCUIStatusLabelViewController *)self _advancePresentationState];
  }
}

- (void)viewDidLoad
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)CCUIStatusLabelViewController;
  [(CCUIStatusLabelViewController *)&v18 viewDidLoad];
  unint64_t v3 = objc_alloc_init(CCUIStatusLabel);
  v20[0] = v3;
  double v4 = objc_alloc_init(CCUIStatusLabel);
  v20[1] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  statusLabels = self->_statusLabels;
  self->_statusLabels = v5;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_statusLabels;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        long long v13 = [(CCUIStatusLabelViewController *)self view];
        [v13 addSubview:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }

  [(CCUIStatusLabelViewController *)self _resetPresentationStateAnimated:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CCUIStatusLabelViewController;
  -[CCUIStatusLabelViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(CCUIStatusLabelViewController *)self _resetPresentationStateAnimated:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIStatusLabelViewController;
  [(CCUIStatusLabelViewController *)&v4 viewDidDisappear:a3];
  [(CCUIStatusLabelViewController *)self _resetPresentationStateAnimated:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_resetPresentationStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CCUIStatusUpdateQueue *)self->_updateQueue removeAllStatusUpdates];
  [(NSTimer *)self->_presentationTimer invalidate];
  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke;
    v7[3] = &unk_1E6A898F8;
    v7[4] = self;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke_2;
    v6[3] = &unk_1E6A8A250;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:v6 completion:0.3];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke_4;
    v5[3] = &unk_1E6A898F8;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
  }
  self->_presentationState = 0;
}

void __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 984);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "_fadeOutStatusLabel:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke_3;
  v11[3] = &unk_1E6A898F8;
  v11[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v11 animations:0.3];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 984);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setText:", 0, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v12 count:16];
    }
    while (v4);
  }
}

uint64_t __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateDidFinishStatusUpdates];
}

uint64_t __65__CCUIStatusLabelViewController__resetPresentationStateAnimated___block_invoke_4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 984);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_fadeOutStatusLabel:", v7, (void)v9);
        [v7 setText:0];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 32) _notifyDelegateDidFinishStatusUpdates];
}

- (void)_advancePresentationState
{
  switch(self->_presentationState)
  {
    case 0uLL:
      unint64_t v3 = [(CCUIStatusLabelViewController *)self _advancePresentationStateFromReady];
      goto LABEL_6;
    case 1uLL:
      unint64_t v3 = [(CCUIStatusLabelViewController *)self _advancePresentationStateFromFadeIn];
      goto LABEL_6;
    case 2uLL:
      unint64_t v3 = [(CCUIStatusLabelViewController *)self _advancePresentationStateFromPresenting];
      goto LABEL_6;
    case 3uLL:
      unint64_t v3 = [(CCUIStatusLabelViewController *)self _advancePresentationStateFromFadeOut];
LABEL_6:
      self->_presentationState = v3;
      break;
    default:
      return;
  }
}

- (unint64_t)_advancePresentationStateFromReady
{
  unint64_t v3 = [(CCUIStatusUpdateQueue *)self->_updateQueue dequeueNextStatusUpdate];
  if (v3)
  {
    unint64_t v4 = self->_currentStatusLabelIndex + 1;
    self->_currentStatusLabelIndex = v4 % [(NSArray *)self->_statusLabels count];
    uint64_t v5 = -[NSArray objectAtIndex:](self->_statusLabels, "objectAtIndex:");
    uint64_t v6 = [v3 message];
    [v5 setText:v6];
    long long v7 = [(CCUIStatusLabelViewController *)self view];
    [v7 setNeedsLayout];

    objc_initWeak(&location, self);
    long long v8 = (void *)MEMORY[0x1E4FB1EB0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke;
    v16[3] = &unk_1E6A898F8;
    v16[4] = self;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_2;
    v13[3] = &unk_1E6A8A2A0;
    objc_copyWeak(&v15, &location);
    id v9 = v5;
    id v14 = v9;
    [v8 animateWithDuration:v16 animations:v13 completion:0.3];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    unint64_t v10 = 1;
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_5;
    v12[3] = &unk_1E6A898F8;
    v12[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v12 animations:0.3];
    unint64_t v10 = 0;
  }

  return v10;
}

uint64_t __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateWillBeginStatusUpdates];
}

void __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    unint64_t v3 = (void *)MEMORY[0x1E4FB1EB0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_3;
    v7[3] = &unk_1E6A8A278;
    unint64_t v4 = (id *)(a1 + 40);
    objc_copyWeak(&v9, (id *)(a1 + 40));
    id v8 = *(id *)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_4;
    v5[3] = &unk_1E6A8A0C0;
    objc_copyWeak(&v6, v4);
    [v3 animateWithDuration:v7 animations:v5 completion:0.3];
    objc_destroyWeak(&v6);

    objc_destroyWeak(&v9);
  }
}

void __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fadeInStatusLabel:*(void *)(a1 + 32)];
}

void __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _advancePresentationState];
  }
}

uint64_t __67__CCUIStatusLabelViewController__advancePresentationStateFromReady__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateDidFinishStatusUpdates];
}

- (unint64_t)_advancePresentationStateFromFadeIn
{
  objc_initWeak(&location, self);
  unint64_t v3 = (void *)MEMORY[0x1E4F1CB00];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__CCUIStatusLabelViewController__advancePresentationStateFromFadeIn__block_invoke;
  v7[3] = &unk_1E6A8A2C8;
  objc_copyWeak(&v8, &location);
  unint64_t v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:v7 block:1.0];
  presentationTimer = self->_presentationTimer;
  self->_presentationTimer = v4;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return 2;
}

void __68__CCUIStatusLabelViewController__advancePresentationStateFromFadeIn__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[126];
    WeakRetained[126] = 0;
    id v3 = WeakRetained;

    [v3 _advancePresentationState];
    id WeakRetained = v3;
  }
}

- (unint64_t)_advancePresentationStateFromPresenting
{
  id v3 = [(CCUIStatusUpdateQueue *)self->_updateQueue dequeueNextStatusUpdate];
  unint64_t v4 = [(NSArray *)self->_statusLabels objectAtIndex:self->_currentStatusLabelIndex];
  if (v3)
  {
    unint64_t v5 = self->_currentStatusLabelIndex + 1;
    self->_currentStatusLabelIndex = v5 % [(NSArray *)self->_statusLabels count];
    id v6 = -[NSArray objectAtIndex:](self->_statusLabels, "objectAtIndex:");
    long long v7 = [v3 message];
    [v6 setText:v7];

    id v8 = [(CCUIStatusLabelViewController *)self view];
    [v8 setNeedsLayout];

    objc_initWeak(&location, self);
    id v9 = (void *)MEMORY[0x1E4FB1EB0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke;
    v22[3] = &unk_1E6A8A278;
    objc_copyWeak(&v24, &location);
    id v23 = v4;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_2;
    v19[3] = &unk_1E6A8A2A0;
    objc_copyWeak(&v21, &location);
    id v10 = v6;
    id v20 = v10;
    [v9 animateWithDuration:v22 animations:v19 completion:0.3];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

    unint64_t v11 = 1;
  }
  else
  {
    objc_initWeak(&location, self);
    long long v12 = (void *)MEMORY[0x1E4FB1EB0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_5;
    v16[3] = &unk_1E6A8A278;
    objc_copyWeak(&v18, &location);
    id v17 = v4;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_6;
    v14[3] = &unk_1E6A8A0C0;
    objc_copyWeak(&v15, &location);
    [v12 animateWithDuration:v16 animations:v14 completion:1.0];
    objc_destroyWeak(&v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    unint64_t v11 = 3;
  }

  return v11;
}

void __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fadeOutStatusLabel:*(void *)(a1 + 32)];
}

void __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = (void *)MEMORY[0x1E4FB1EB0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_3;
    v7[3] = &unk_1E6A8A278;
    unint64_t v4 = (id *)(a1 + 40);
    objc_copyWeak(&v9, (id *)(a1 + 40));
    id v8 = *(id *)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_4;
    v5[3] = &unk_1E6A8A0C0;
    objc_copyWeak(&v6, v4);
    [v3 animateWithDuration:v7 animations:v5 completion:0.3];
    objc_destroyWeak(&v6);

    objc_destroyWeak(&v9);
  }
}

void __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fadeInStatusLabel:*(void *)(a1 + 32)];
}

void __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _advancePresentationState];
  }
}

void __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fadeOutStatusLabel:*(void *)(a1 + 32)];
}

void __72__CCUIStatusLabelViewController__advancePresentationStateFromPresenting__block_invoke_6(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _advancePresentationState];
  }
}

- (void)_fadeInStatusLabel:(id)a3
{
}

- (void)_fadeOutStatusLabel:(id)a3
{
}

- (void)_notifyDelegateWillBeginStatusUpdates
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 statusLabelViewControllerWillBeginStatusUpdates:self];
  }
}

- (void)_notifyDelegateDidFinishStatusUpdates
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 statusLabelViewControllerDidFinishStatusUpdates:self];
  }
}

- (CCUIStatusLabelViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CCUIStatusLabelViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentationTimer, 0);
  objc_storeStrong((id *)&self->_statusLabels, 0);

  objc_storeStrong((id *)&self->_updateQueue, 0);
}

@end