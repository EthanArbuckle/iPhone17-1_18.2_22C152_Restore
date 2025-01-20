@interface MULoadingOverlayController
- (MULoadingOverlayController)initWithParentView:(id)a3 contentView:(id)a4;
- (void)attachLoadingOverlay;
- (void)removeLoadingOverlayAnimated:(BOOL)a3 completion:(id)a4;
- (void)updateLayoutForBoundsChange;
@end

@implementation MULoadingOverlayController

- (MULoadingOverlayController)initWithParentView:(id)a3 contentView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MULoadingOverlayController;
  v8 = [(MULoadingOverlayController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_parentView, v6);
    objc_storeWeak((id *)&v9->_contentView, v7);
  }

  return v9;
}

- (void)attachLoadingOverlay
{
  [(MULoadingView *)self->_loadingView removeFromSuperview];
  if (!self->_loadingView)
  {
    v3 = [MULoadingView alloc];
    v4 = -[MULoadingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    loadingView = self->_loadingView;
    self->_loadingView = v4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  [WeakRetained addSubview:self->_loadingView];

  [(MULoadingOverlayController *)self updateLayoutForBoundsChange];
  id v7 = objc_loadWeakRetained((id *)&self->_contentView);
  [v7 setHidden:1];

  objc_initWeak(&location, self);
  dispatch_time_t v8 = dispatch_time(0, 200000002);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__MULoadingOverlayController_attachLoadingOverlay__block_invoke;
  v9[3] = &unk_1E574F3A8;
  objc_copyWeak(&v10, &location);
  dispatch_after(v8, MEMORY[0x1E4F14428], v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __50__MULoadingOverlayController_attachLoadingOverlay__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[1] setAlpha:1.0];
    [v2[1] beginAnimatingActivityIndicator];
    id WeakRetained = v2;
  }
}

- (void)removeLoadingOverlayAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(MULoadingView *)self->_loadingView endAnimatingActivityIndicatorWithError:0];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__MULoadingOverlayController_removeLoadingOverlayAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E574F3A8;
  objc_copyWeak(&v17, &location);
  id v7 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __70__MULoadingOverlayController_removeLoadingOverlayAnimated_completion___block_invoke_2;
  v13 = &unk_1E574F830;
  objc_copyWeak(&v15, &location);
  id v8 = v6;
  id v14 = v8;
  v9 = (void (**)(void *, uint64_t))_Block_copy(&v10);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:delay:options:animations:completion:", 2, v7, v9, 0.200000003, 0.0, v10, v11, v12, v13);
  }
  else
  {
    v7[2](v7);
    v9[2](v9, 1);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __70__MULoadingOverlayController_removeLoadingOverlayAnimated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[1] setAlpha:0.0];
    id v2 = objc_loadWeakRetained(v3 + 2);
    [v2 setHidden:0];

    id WeakRetained = v3;
  }
}

uint64_t __70__MULoadingOverlayController_removeLoadingOverlayAnimated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    [WeakRetained[1] removeFromSuperview];
    v3 = v5;
    id WeakRetained = *(id **)(a1 + 32);
    if (WeakRetained)
    {
      id WeakRetained = (id *)((uint64_t (*)(id *, id *))WeakRetained[2])(WeakRetained, v5);
      v3 = v5;
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

- (void)updateLayoutForBoundsChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  [WeakRetained bounds];
  -[MULoadingView setFrame:](self->_loadingView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentView);
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_loadingView, 0);
}

@end