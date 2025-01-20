@interface MRUVolumeController
- (MRUVolumeControllerCoordinationDelegate)coordinationDelegate;
- (MRUVolumeControllerDelegate)shadowDelegate;
- (NSNumber)optimisticValue;
- (float)volumeValue;
- (id)description;
- (void)beginEqualization;
- (void)finishEqualization;
- (void)restoreDelegate;
- (void)setCoordinationDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOptimisticValue:(id)a3;
- (void)setShadowDelegate:(id)a3;
- (void)setVolumeValue:(float)a3;
@end

@implementation MRUVolumeController

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPVolumeController *)self volumeControlLabel];
  v6 = [v3 stringWithFormat:@"<%@:%p (%@)>", v4, self, v5];

  return v6;
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRUVolumeController;
  id v4 = a3;
  [(MPVolumeController *)&v5 setDelegate:v4];
  objc_storeWeak((id *)&self->_shadowDelegate, v4);
}

- (float)volumeValue
{
  if (self->_optimisticValue)
  {
    optimisticValue = self->_optimisticValue;
    [(NSNumber *)optimisticValue floatValue];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MRUVolumeController;
    [(MPVolumeController *)&v4 volumeValue];
  }
  return result;
}

- (void)setVolumeValue:(float)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MRUVolumeController;
  -[MPVolumeController setVolumeValue:](&v9, sel_setVolumeValue_);
  *(float *)&double v5 = a3;
  v6 = [NSNumber numberWithFloat:v5];
  [(MRUVolumeController *)self setOptimisticValue:v6];

  v7 = [(MRUVolumeController *)self coordinationDelegate];
  *(float *)&double v8 = a3;
  [v7 volumeController:self volumeValueDidChange:v8];
}

- (void)setOptimisticValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_optimisticValue)
  {
    v6 = MCLogCategoryVolume();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      [v5 floatValue];
      *(_DWORD *)buf = 138412546;
      v16 = self;
      __int16 v17 = 2048;
      double v18 = v7;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%@ - Start optimistic state with: %.2f", buf, 0x16u);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)MRUVolumeController;
  [(MPVolumeController *)&v14 setDelegate:0];
  objc_storeStrong((id *)&self->_optimisticValue, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shadowDelegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_shadowDelegate);
    [v5 floatValue];
    objc_msgSend(v10, "volumeController:volumeValueDidChange:", self);
  }
  [(NSTimer *)self->_optimisticTimer invalidate];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__MRUVolumeController_setOptimisticValue___block_invoke;
  v13[3] = &unk_1E5F0DE50;
  v13[4] = self;
  v11 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v13 block:2.0];
  optimisticTimer = self->_optimisticTimer;
  self->_optimisticTimer = v11;
}

void __42__MRUVolumeController_setOptimisticValue___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 40) floatValue];
  float v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  float v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  [*(id *)(a1 + 32) restoreDelegate];
  double v8 = MCLogCategoryVolume();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = *(void **)(a1 + 32);
    [v9 volumeValue];
    int v11 = 138412802;
    v12 = v9;
    __int16 v13 = 2048;
    double v14 = v10;
    __int16 v15 = 2048;
    double v16 = v3;
    _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "%@ Finish optimistic state with value: %.2f (optimistic=%.2f)", (uint8_t *)&v11, 0x20u);
  }
}

- (void)beginEqualization
{
  p_shadowDelegate = &self->_shadowDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shadowDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_shadowDelegate);
    [v6 volumeControllerWillBeginEqualization:self];
  }
}

- (void)finishEqualization
{
  p_shadowDelegate = &self->_shadowDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shadowDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_shadowDelegate);
    [v6 volumeControllerDidFinishEqualization:self];
  }
}

- (void)restoreDelegate
{
  p_shadowDelegate = &self->_shadowDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shadowDelegate);
  v17.receiver = self;
  v17.super_class = (Class)MRUVolumeController;
  [(MPVolumeController *)&v17 setDelegate:WeakRetained];

  id v5 = objc_loadWeakRetained((id *)p_shadowDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    float v7 = [(MPVolumeController *)self delegate];
    [(MRUVolumeController *)self volumeValue];
    objc_msgSend(v7, "volumeController:volumeValueDidChange:", self);
  }
  id v8 = objc_loadWeakRetained((id *)p_shadowDelegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    float v10 = [(MPVolumeController *)self delegate];
    objc_msgSend(v10, "volumeController:volumeControlAvailableDidChange:", self, -[MPVolumeController isVolumeControlAvailable](self, "isVolumeControlAvailable"));
  }
  id v11 = objc_loadWeakRetained((id *)p_shadowDelegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    __int16 v13 = [(MPVolumeController *)self delegate];
    objc_msgSend(v13, "volumeController:volumeControlCapabilitiesDidChange:", self, -[MPVolumeController volumeCapabilities](self, "volumeCapabilities"));
  }
  id v14 = objc_loadWeakRetained((id *)p_shadowDelegate);
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    double v16 = [(MPVolumeController *)self delegate];
    objc_msgSend(v16, "volumeController:mutedStateDidChange:", self, -[MPVolumeController isMuted](self, "isMuted"));
  }
}

- (NSNumber)optimisticValue
{
  return self->_optimisticValue;
}

- (MRUVolumeControllerCoordinationDelegate)coordinationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinationDelegate);

  return (MRUVolumeControllerCoordinationDelegate *)WeakRetained;
}

- (void)setCoordinationDelegate:(id)a3
{
}

- (MRUVolumeControllerDelegate)shadowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shadowDelegate);

  return (MRUVolumeControllerDelegate *)WeakRetained;
}

- (void)setShadowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shadowDelegate);
  objc_destroyWeak((id *)&self->_coordinationDelegate);
  objc_storeStrong((id *)&self->_optimisticValue, 0);

  objc_storeStrong((id *)&self->_optimisticTimer, 0);
}

@end