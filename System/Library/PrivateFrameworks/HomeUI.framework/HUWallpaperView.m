@interface HUWallpaperView
- (BOOL)disableWallpaperUpdate;
- (CAGradientLayer)currentLayer;
- (HFHomeKitObject)hkObject;
- (HFWallpaper)wallpaper;
- (HUWallpaperView)initWithFrame:(CGRect)a3;
- (UIImage)currentImage;
- (id)refreshWallpaperForHomeKitObject:(id)a3 withAnimation:(BOOL)a4;
- (void)populateWallpaper:(id)a3 withAnimation:(BOOL)a4 onlyIfNeeded:(BOOL)a5;
- (void)setCurrentImage:(id)a3;
- (void)setCurrentImage:(id)a3 withAnimation:(BOOL)a4;
- (void)setCurrentLayer:(id)a3;
- (void)setCurrentLayer:(id)a3 withAnimation:(BOOL)a4;
- (void)setDisableWallpaperUpdate:(BOOL)a3;
- (void)setHkObject:(id)a3;
- (void)setWallpaper:(id)a3;
@end

@implementation HUWallpaperView

void __49__HUWallpaperView_setCurrentImage_withAnimation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained currentLayer];
  [v2 removeFromSuperlayer];

  [WeakRetained setImage:*(void *)(a1 + 32)];
  [WeakRetained setCurrentLayer:0];
}

- (void)setCurrentLayer:(id)a3
{
}

- (CAGradientLayer)currentLayer
{
  return self->_currentLayer;
}

- (HUWallpaperView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUWallpaperView;
  v3 = -[HUWallpaperView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HUWallpaperView *)v3 setClipsToBounds:1];
  }
  return v4;
}

id __66__HUWallpaperView_refreshWallpaperForHomeKitObject_withAnimation___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setWallpaper:v4];
  [WeakRetained populateWallpaper:v4 withAnimation:*(unsigned __int8 *)(a1 + 40) onlyIfNeeded:0];

  objc_super v6 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v6;
}

- (void)setWallpaper:(id)a3
{
}

- (void)populateWallpaper:(id)a3 withAnimation:(BOOL)a4 onlyIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([(HUWallpaperView *)self disableWallpaperUpdate])
  {
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "wallpaper update is currently disabled because an animation is in progress, wallpaper:%@ for view:%@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    if (v5)
    {
      v10 = [(HUWallpaperView *)self currentLayer];
      if (v10)
      {

        goto LABEL_14;
      }
      v11 = [(HUWallpaperView *)self currentImage];

      if (v11) {
        goto LABEL_14;
      }
    }
    v12 = [MEMORY[0x1E4F69780] sharedInstance];
    v13 = [(HUWallpaperView *)self traitCollection];
    v14 = objc_msgSend(v12, "wallpaperObjectForWallpaper:currentUserInterfaceStyle:", v8, objc_msgSend(v13, "userInterfaceStyle"));

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[HUWallpaperView setContentMode:](self, "setContentMode:", 2 * ([v8 type] != 2));
      [(HUWallpaperView *)self setCurrentImage:v14 withAnimation:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(HUWallpaperView *)self setCurrentLayer:v14 withAnimation:v6];
      }
    }
  }
LABEL_14:
}

- (void)setCurrentImage:(id)a3 withAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (UIImage *)a3;
  if (self->_currentImage != v7)
  {
    objc_storeStrong((id *)&self->_currentImage, a3);
    objc_initWeak(&location, self);
    id v8 = (void *)MEMORY[0x1E4F42FF0];
    if (v4) {
      double v9 = 2.0;
    }
    else {
      double v9 = 0.0;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__HUWallpaperView_setCurrentImage_withAnimation___block_invoke;
    v10[3] = &unk_1E63882F0;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    [v8 transitionWithView:self duration:5242880 options:v10 animations:0 completion:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (id)refreshWallpaperForHomeKitObject:(id)a3 withAnimation:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(HUWallpaperView *)self disableWallpaperUpdate])
  {
    v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "wallpaper update is currently disabled because an animation is in progress, hkObject:%@ for view:%@", buf, 0x16u);
    }

    id v8 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    [(HUWallpaperView *)self setHkObject:v6];
    objc_initWeak((id *)buf, self);
    double v9 = [MEMORY[0x1E4F69780] sharedInstance];
    v10 = [v9 wallpaperForHomeKitObject:v6];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__HUWallpaperView_refreshWallpaperForHomeKitObject_withAnimation___block_invoke;
    v12[3] = &unk_1E63892B8;
    objc_copyWeak(&v13, (id *)buf);
    BOOL v14 = a4;
    id v8 = [v10 flatMap:v12];
    objc_destroyWeak(&v13);

    objc_destroyWeak((id *)buf);
  }

  return v8;
}

- (BOOL)disableWallpaperUpdate
{
  return self->_disableWallpaperUpdate;
}

- (void)setHkObject:(id)a3
{
}

- (void)setCurrentLayer:(id)a3 withAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = [(CAGradientLayer *)self->_currentLayer colors];
  double v9 = [v7 colors];
  char v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    v11 = self->_currentLayer;
    [(HUWallpaperView *)self frame];
    objc_msgSend(v7, "setFrame:");
    objc_storeStrong((id *)&self->_currentLayer, a3);
    objc_initWeak(&location, self);
    id v12 = (void *)MEMORY[0x1E4F42FF0];
    if (v4) {
      double v13 = 2.0;
    }
    else {
      double v13 = 0.0;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__HUWallpaperView_setCurrentLayer_withAnimation___block_invoke;
    v15[3] = &unk_1E6385250;
    objc_copyWeak(&v18, &location);
    id v16 = v7;
    BOOL v14 = v11;
    __int16 v17 = v14;
    [v12 transitionWithView:self duration:5242880 options:v15 animations:0 completion:v13];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __49__HUWallpaperView_setCurrentLayer_withAnimation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setImage:0];
  v2 = [WeakRetained layer];
  [v2 addSublayer:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) removeFromSuperlayer];
  [WeakRetained setCurrentImage:0];
}

- (HFWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (void)setDisableWallpaperUpdate:(BOOL)a3
{
  self->_disableWallpaperUpdate = a3;
}

- (HFHomeKitObject)hkObject
{
  return self->_hkObject;
}

- (UIImage)currentImage
{
  return self->_currentImage;
}

- (void)setCurrentImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayer, 0);
  objc_storeStrong((id *)&self->_currentImage, 0);
  objc_storeStrong((id *)&self->_hkObject, 0);

  objc_storeStrong((id *)&self->_wallpaper, 0);
}

@end