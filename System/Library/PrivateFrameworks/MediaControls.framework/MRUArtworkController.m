@interface MRUArtworkController
- (CGSize)artworkFittingSize;
- (CGSize)preferredContentSize;
- (MPArtworkCatalog)catalog;
- (MRUArtworkController)init;
- (MRUArtworkControllerDelegate)delegate;
- (MRUImageLoader)imageLoader;
- (MSVTimer)artworkTimer;
- (double)artworkLoadingTimeout;
- (void)setArtworkFittingSize:(CGSize)a3;
- (void)setArtworkLoadingTimeout:(double)a3;
- (void)setArtworkTimer:(id)a3;
- (void)setCatalog:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageLoader:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)updateArtworkFittingSize;
@end

@implementation MRUArtworkController

- (MRUArtworkController)init
{
  v4.receiver = self;
  v4.super_class = (Class)MRUArtworkController;
  result = [(MRUArtworkController *)&v4 init];
  if (result)
  {
    result->_artworkLoadingTimeout = 1.0;
    CGSize v3 = (CGSize)*MEMORY[0x1E4F1DB30];
    result->_preferredContentSize = (CGSize)*MEMORY[0x1E4F1DB30];
    result->_artworkFittingSize = v3;
  }
  return result;
}

- (void)setCatalog:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_catalog, a3);
  v6 = [(MRUArtworkController *)self imageLoader];

  if (v6)
  {
    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v7 = [MRUImageLoader alloc];
    v8 = [(MRUArtworkController *)self delegate];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __35__MRUArtworkController_setCatalog___block_invoke;
    v28[3] = &unk_1E5F0D848;
    objc_copyWeak(&v29, &location);
    v9 = [(MRUImageLoader *)v7 initWithDestination:v8 imageHandler:v28];
    [(MRUArtworkController *)self setImageLoader:v9];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    if (!v5) {
      goto LABEL_9;
    }
  }
  v10 = [(MRUArtworkController *)self imageLoader];
  int v11 = [v10 wouldLoadNewImageForCatalog:v5];

  if (v11)
  {
    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x1E4F77A30];
    [(MRUArtworkController *)self artworkLoadingTimeout];
    double v14 = v13;
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __35__MRUArtworkController_setCatalog___block_invoke_2;
    v25 = &unk_1E5F0D870;
    objc_copyWeak(&v27, &location);
    id v15 = v5;
    id v26 = v15;
    v16 = [v12 timerWithInterval:0 repeats:&v22 block:v14];
    artworkTimer = self->_artworkTimer;
    self->_artworkTimer = v16;

    v18 = [(MRUArtworkController *)self delegate];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      v20 = [(MRUArtworkController *)self delegate];
      [v20 controller:self didStartLoadingImageForCatalog:v15];
    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
LABEL_9:
  [(MRUArtworkController *)self updateArtworkFittingSize];
  v21 = [(MRUArtworkController *)self imageLoader];
  [v21 updateCatalog:v5];
}

void __35__MRUArtworkController_setCatalog___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = [WeakRetained delegate];
  if (v8)
  {
    if (v6)
    {
      v9 = MCLogCategoryImageLoading();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412802;
        uint64_t v12 = objc_opt_class();
        __int16 v13 = 2048;
        id v14 = WeakRetained;
        __int16 v15 = 2114;
        id v16 = v6;
        _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_ERROR, "%@<%p> Image load failed with error: %{public}@.", (uint8_t *)&v11, 0x20u);
      }
    }
    v10 = [WeakRetained artworkTimer];
    [v10 invalidate];

    [v8 controller:WeakRetained didLoadArtworkImage:v5];
  }
}

void __35__MRUArtworkController_setCatalog___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  CGSize v3 = [WeakRetained delegate];
  objc_super v4 = MCLogCategoryImageLoading();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    id v10 = WeakRetained;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_ERROR, "%@<%p> clearing old artwork while waiting for catalog=%p", (uint8_t *)&v7, 0x20u);
  }

  [v3 artworkLoadingDidTimeoutInController:WeakRetained];
}

- (void)setPreferredContentSize:(CGSize)a3
{
  if (self->_preferredContentSize.width != a3.width || self->_preferredContentSize.height != a3.height)
  {
    self->_preferredContentSize = a3;
    [(MRUArtworkController *)self updateArtworkFittingSize];
  }
}

- (void)setArtworkFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_artworkFittingSize.width != a3.width || self->_artworkFittingSize.height != a3.height)
  {
    self->_artworkFittingSize = a3;
    id v10 = [(MRUArtworkController *)self imageLoader];
    int v7 = [(MRUArtworkController *)self delegate];
    uint64_t v8 = [v7 traitCollection];
    [v8 displayScale];
    objc_msgSend(v10, "updateFittingSize:scale:", width, height, v9);
  }
}

- (void)updateArtworkFittingSize
{
  uint64_t v3 = [(MRUArtworkController *)self delegate];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    uint64_t v5 = [(MRUArtworkController *)self imageLoader];

    if (v5)
    {
      if (self->_preferredContentSize.width == *MEMORY[0x1E4F1DB30]
        && self->_preferredContentSize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        id v9 = [(MRUArtworkController *)self delegate];
        [v9 bounds];
        -[MRUArtworkController setArtworkFittingSize:](self, "setArtworkFittingSize:", v7, v8);
      }
      else
      {
        -[MRUArtworkController setArtworkFittingSize:](self, "setArtworkFittingSize:");
      }
    }
  }
}

- (double)artworkLoadingTimeout
{
  return self->_artworkLoadingTimeout;
}

- (void)setArtworkLoadingTimeout:(double)a3
{
  self->_artworkLoadingTimeout = a3;
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (MPArtworkCatalog)catalog
{
  return self->_catalog;
}

- (MRUArtworkControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUArtworkControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRUImageLoader)imageLoader
{
  return self->_imageLoader;
}

- (void)setImageLoader:(id)a3
{
}

- (MSVTimer)artworkTimer
{
  return self->_artworkTimer;
}

- (void)setArtworkTimer:(id)a3
{
}

- (CGSize)artworkFittingSize
{
  double width = self->_artworkFittingSize.width;
  double height = self->_artworkFittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkTimer, 0);
  objc_storeStrong((id *)&self->_imageLoader, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_catalog, 0);
}

@end