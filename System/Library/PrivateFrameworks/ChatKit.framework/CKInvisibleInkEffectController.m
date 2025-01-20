@interface CKInvisibleInkEffectController
- (BOOL)effectViewNeedsReset;
- (BOOL)isEnabled;
- (BOOL)isPaused;
- (BOOL)isSuspended;
- (CKInvisibleInkEffectController)initWithHostView:(id)a3;
- (CKInvisibleInkEffectHostView)hostView;
- (CKInvisibleInkEffectView)effectView;
- (NSTimer)resumeTimer;
- (UIView)borrowedEffectViewSnapshot;
- (id)borrowEffectView;
- (void)_updateBorrowedEffectViewSnapshot;
- (void)dealloc;
- (void)hostViewDidLayoutSubviews;
- (void)hostViewDidUpdateSnapshot:(id)a3;
- (void)invisibleInkEffectViewWasUncovered:(id)a3;
- (void)prepareForDisplay;
- (void)resumeTimerFired:(id)a3;
- (void)returnBorrowedEffectView;
- (void)setBorrowedEffectViewSnapshot:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setEffectViewNeedsReset:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHostView:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setResumeTimer:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)suspendForTimeInterval:(double)a3;
@end

@implementation CKInvisibleInkEffectController

- (CKInvisibleInkEffectController)initWithHostView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKInvisibleInkEffectController;
  v5 = [(CKInvisibleInkEffectController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_hostView, v4);
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(CKInvisibleInkEffectController *)self resumeTimer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)CKInvisibleInkEffectController;
  [(CKInvisibleInkEffectController *)&v4 dealloc];
}

- (void)setEnabled:(BOOL)a3
{
  if (((!self->_enabled ^ a3) & 1) == 0)
  {
    self->_enabled = a3;
    [(CKInvisibleInkEffectController *)self setEffectViewNeedsReset:1];
    [(CKInvisibleInkEffectController *)self setSuspended:0];
    objc_super v4 = [(CKInvisibleInkEffectController *)self resumeTimer];
    [v4 invalidate];

    if (!self->_enabled)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__CKInvisibleInkEffectController_setEnabled___block_invoke;
      block[3] = &unk_1E5620C40;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __45__CKInvisibleInkEffectController_setEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 8) && *(void *)(v2 + 16))
  {
    v3 = [(id)v2 hostView];
    [v3 detachInvisibleInkEffectView];

    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;
  }
}

- (void)setSuspended:(BOOL)a3
{
  if (((!self->_suspended ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    self->_suspended = a3;
    -[CKInvisibleInkEffectView setSuspended:](self->_effectView, "setSuspended:");
    v5 = [(CKInvisibleInkEffectController *)self hostView];
    v6 = v5;
    if (v4) {
      [v5 invisibleInkEffectViewWasSuspended];
    }
    else {
      [v5 invisibleInkEffectViewWasResumed];
    }
  }
  id v7 = [(CKInvisibleInkEffectController *)self resumeTimer];
  [v7 invalidate];
}

- (void)resumeTimerFired:(id)a3
{
}

- (void)suspendForTimeInterval:(double)a3
{
  [(CKInvisibleInkEffectController *)self setSuspended:1];
  v5 = [(CKInvisibleInkEffectController *)self resumeTimer];
  int v6 = [v5 isValid];

  if (v6)
  {
    id v8 = [(CKInvisibleInkEffectController *)self resumeTimer];
    id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
    [v8 setFireDate:v7];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_resumeTimerFired_ selector:0 userInfo:0 repeats:a3];
    -[CKInvisibleInkEffectController setResumeTimer:](self, "setResumeTimer:");
  }
}

- (void)prepareForDisplay
{
  id v11 = [(CKInvisibleInkEffectController *)self hostView];
  BOOL v3 = [(CKInvisibleInkEffectController *)self isEnabled];
  effectView = self->_effectView;
  if (v3)
  {
    if (effectView)
    {
      if ([(CKInvisibleInkEffectController *)self effectViewNeedsReset]) {
        [(CKInvisibleInkEffectView *)self->_effectView reset];
      }
    }
    else
    {
      int v6 = [(CKInvisibleInkEffectController *)self hostView];
      id v7 = objc_alloc((Class)[v6 invisibleInkEffectViewClass]);
      [v11 bounds];
      id v8 = (CKInvisibleInkEffectView *)objc_msgSend(v7, "initWithFrame:");
      v9 = self->_effectView;
      self->_effectView = v8;

      [(CKInvisibleInkEffectView *)self->_effectView setAutoresizingMask:18];
      v10 = objc_alloc_init(CKInvisibleInkGestureRecognizer);
      [(CKInvisibleInkGestureRecognizer *)v10 setCancelsTouchesInView:0];
      [(CKInvisibleInkEffectView *)self->_effectView addGestureRecognizer:v10];
      [(CKInvisibleInkEffectView *)self->_effectView setDelegate:self];
      [(CKInvisibleInkEffectView *)self->_effectView setPaused:[(CKInvisibleInkEffectController *)self isPaused]];
      [(CKInvisibleInkEffectView *)self->_effectView setSuspended:[(CKInvisibleInkEffectController *)self isSuspended]];
      [v11 attachInvisibleInkEffectView];
    }
    [(CKInvisibleInkEffectController *)self setEffectViewNeedsReset:0];
  }
  else if (effectView)
  {
    [v11 detachInvisibleInkEffectView];
    v5 = self->_effectView;
    self->_effectView = 0;
  }
}

- (void)hostViewDidLayoutSubviews
{
  if ([(CKInvisibleInkEffectController *)self isEnabled])
  {
    effectView = self->_effectView;
    id v5 = [(CKInvisibleInkEffectController *)self hostView];
    BOOL v4 = [v5 imageForInvisibleInkEffectView];
    [(CKInvisibleInkEffectView *)effectView setImage:v4];
  }
}

- (void)hostViewDidUpdateSnapshot:(id)a3
{
  id v4 = a3;
  if ([(CKInvisibleInkEffectController *)self isEnabled]) {
    [(CKInvisibleInkEffectView *)self->_effectView setImage:v4];
  }
}

- (void)setPaused:(BOOL)a3
{
  if (((!self->_paused ^ a3) & 1) == 0)
  {
    self->_paused = a3;
    -[CKInvisibleInkEffectView setPaused:](self->_effectView, "setPaused:");
  }
}

- (void)_updateBorrowedEffectViewSnapshot
{
  id v4 = [(CKInvisibleInkEffectView *)self->_effectView snapshotViewAfterScreenUpdates:0];
  BOOL v3 = [(CKInvisibleInkEffectController *)self hostView];
  [v3 detachInvisibleInkEffectView];
  [(CKInvisibleInkEffectController *)self setBorrowedEffectViewSnapshot:v4];
  [v3 attachInvisibleInkEffectView];
}

- (id)borrowEffectView
{
  BOOL v3 = [(CKInvisibleInkEffectController *)self borrowedEffectViewSnapshot];

  if (!v3) {
    [(CKInvisibleInkEffectController *)self _updateBorrowedEffectViewSnapshot];
  }
  effectView = self->_effectView;

  return effectView;
}

- (void)returnBorrowedEffectView
{
  BOOL v3 = [(CKInvisibleInkEffectController *)self borrowedEffectViewSnapshot];

  if (v3)
  {
    id v4 = [(CKInvisibleInkEffectController *)self hostView];
    [v4 detachInvisibleInkEffectView];
    [(CKInvisibleInkEffectController *)self setBorrowedEffectViewSnapshot:0];
    effectView = self->_effectView;
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v8[0] = *MEMORY[0x1E4F1DAB8];
    v8[1] = v6;
    v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(CKInvisibleInkEffectView *)effectView setTransform:v8];
    id v7 = self->_effectView;
    [v4 bounds];
    -[CKInvisibleInkEffectView setFrame:](v7, "setFrame:");
    [v4 attachInvisibleInkEffectView];
  }
}

- (CKInvisibleInkEffectView)effectView
{
  borrowedEffectViewSnapshot = (CKInvisibleInkEffectView *)self->_borrowedEffectViewSnapshot;
  if (!borrowedEffectViewSnapshot) {
    borrowedEffectViewSnapshot = self->_effectView;
  }
  return borrowedEffectViewSnapshot;
}

- (void)invisibleInkEffectViewWasUncovered:(id)a3
{
  id v3 = [(CKInvisibleInkEffectController *)self hostView];
  [v3 invisibleInkEffectViewWasUncovered];
}

- (void)setEffectView:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (CKInvisibleInkEffectHostView)hostView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);

  return (CKInvisibleInkEffectHostView *)WeakRetained;
}

- (void)setHostView:(id)a3
{
}

- (BOOL)effectViewNeedsReset
{
  return self->_effectViewNeedsReset;
}

- (void)setEffectViewNeedsReset:(BOOL)a3
{
  self->_effectViewNeedsReset = a3;
}

- (NSTimer)resumeTimer
{
  return self->_resumeTimer;
}

- (void)setResumeTimer:(id)a3
{
}

- (UIView)borrowedEffectViewSnapshot
{
  return self->_borrowedEffectViewSnapshot;
}

- (void)setBorrowedEffectViewSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borrowedEffectViewSnapshot, 0);
  objc_storeStrong((id *)&self->_resumeTimer, 0);
  objc_destroyWeak((id *)&self->_hostView);

  objc_storeStrong((id *)&self->_effectView, 0);
}

@end