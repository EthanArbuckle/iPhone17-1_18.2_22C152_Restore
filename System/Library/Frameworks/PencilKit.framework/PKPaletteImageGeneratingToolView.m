@interface PKPaletteImageGeneratingToolView
- (void)_reloadToolImage;
- (void)_updateSelectedViewTransformAnimated:(void *)a1;
- (void)_updateUI;
- (void)didMoveToWindow;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setScalingFactor:(double)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PKPaletteImageGeneratingToolView

- (void)didMoveToWindow
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaletteImageGeneratingToolView;
  [(PKPaletteImageGeneratingToolView *)&v8 didMoveToWindow];
  v3 = [(PKPaletteImageGeneratingToolView *)self window];

  if (v3)
  {
    v4 = os_log_create("com.apple.pencilkit", "PKPaletteImageGeneratingToolView");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "load image wand ca assets", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__PKPaletteImageGeneratingToolView_didMoveToWindow__block_invoke;
    v5[3] = &unk_1E64C8FE0;
    objc_copyWeak(&v6, buf);
    +[PKImageWandCAPackage loadPackageViewsWithHandler:]((uint64_t)PKImageWandCAPackage, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __51__PKPaletteImageGeneratingToolView_didMoveToWindow__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (v5 && WeakRetained)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__PKPaletteImageGeneratingToolView_didMoveToWindow__block_invoke_2;
    v8[3] = &unk_1E64C8FB8;
    char v10 = a3;
    v8[4] = WeakRetained;
    id v9 = v5;
    PKPerformOnMainThread(v8);
  }
}

uint64_t __51__PKPaletteImageGeneratingToolView_didMoveToWindow__block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = os_log_create("com.apple.pencilkit", "PKPaletteImageGeneratingToolView");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "image wand dark ca asset loaded", buf, 2u);
    }
    id v5 = &OBJC_IVAR___PKPaletteImageGeneratingToolView__animatedDarkToolView;
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "image wand light ca asset loaded", v11, 2u);
    }
    id v5 = &OBJC_IVAR___PKPaletteImageGeneratingToolView__animatedLightToolView;
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *v5;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(void **)(v6 + v7);
  *(void *)(v6 + v7) = v8;

  return [*(id *)(a1 + 32) _setToolImageNeedsReload];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaletteImageGeneratingToolView;
  [(PKPaletteToolView *)&v4 setSelected:a3];
  -[PKPaletteImageGeneratingToolView _updateUI](self);
}

- (void)_updateUI
{
  v24[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v2 = [a1 isSelected];
    uint64_t v3 = [a1 imageContentView];
    objc_super v4 = (void *)v3;
    if (v3 && *(unsigned __int8 *)(v3 + 408) != v2)
    {
      *(unsigned char *)(v3 + 408) = v2;
      -[PKPaletteToolImageContentView _updateUI](v3);
    }

    id v5 = [a1 imageContentView];
    -[PKPaletteToolImageContentView setSelectedView:]((uint64_t)v5, 0);

    id v23 = [a1 traitCollection];
    if ([v23 userInterfaceStyle] == 2 && a1[81])
    {

LABEL_13:
      if ([a1 isSelected])
      {
        id v8 = [a1 traitCollection];
        id v9 = objc_retain(*(id *)((char *)a1
                               + OBJC_IVAR___PKPaletteImageGeneratingToolView__animatedDarkToolView[[v8 userInterfaceStyle] != 2]));

        char v10 = [v9 layer];
        [v10 setBeginTime:0.0];

        v11 = [v9 layer];
        [v11 setTimeOffset:0.0];

        v12 = [v9 layer];
        LODWORD(v13) = 1.0;
        [v12 setSpeed:v13];

        [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
        v14 = (void *)MEMORY[0x1E4F28DC8];
        v15 = [v9 constraints];
        [v14 deactivateConstraints:v15];

        self;
        v16 = (void *)MEMORY[0x1E4F28DC8];
        v17 = [v9 widthAnchor];
        v18 = [v17 constraintEqualToConstant:138.0];
        v24[0] = v18;
        v19 = [v9 heightAnchor];
        v20 = [v19 constraintEqualToConstant:390.0];
        v24[1] = v20;
        v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
        [v16 activateConstraints:v21];

        v22 = [a1 imageContentView];
        -[PKPaletteToolImageContentView setSelectedView:]((uint64_t)v22, v9);

        -[PKPaletteImageGeneratingToolView _updateSelectedViewTransformAnimated:](a1, 0);
      }
      return;
    }
    uint64_t v6 = [a1 traitCollection];
    if ([v6 userInterfaceStyle] != 2)
    {
      uint64_t v7 = a1[80];

      if (!v7) {
        return;
      }
      goto LABEL_13;
    }
  }
}

- (void)setEdgeLocation:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaletteImageGeneratingToolView;
  [(PKPaletteToolView *)&v4 setEdgeLocation:a3];
  -[PKPaletteImageGeneratingToolView _updateUI](self);
}

- (void)setScalingFactor:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaletteImageGeneratingToolView;
  [(PKPaletteToolView *)&v4 setScalingFactor:a3];
  -[PKPaletteImageGeneratingToolView _updateSelectedViewTransformAnimated:](self, 1);
}

- (void)_updateSelectedViewTransformAnimated:(void *)a1
{
  if (a1)
  {
    if (([a1 isSelected] & 1) != 0
      || (([a1 imageContentView], v4 = objc_claimAutoreleasedReturnValue(), (id v5 = (void *)v4) == 0)
        ? (uint64_t v6 = 0)
        : (uint64_t v6 = *(void **)(v4 + 424)),
          id v7 = v6,
          v7,
          v5,
          !v7))
    {
      self;
      memset(&v16, 0, sizeof(v16));
      [a1 scalingFactor];
      CGFloat v9 = v8 * 0.333333333;
      [a1 scalingFactor];
      CGAffineTransformMakeScale(&v16, v9, v10 * 0.333333333);
      uint64_t v11 = [a1 edgeLocation];
      CGAffineTransform v14 = v16;
      PKCGAffineTransformRotateForEdge(&v14, v11, &v15);
      CGAffineTransform v16 = v15;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __73__PKPaletteImageGeneratingToolView__updateSelectedViewTransformAnimated___block_invoke;
      v12[3] = &unk_1E64C8F50;
      v12[4] = a1;
      CGAffineTransform v13 = v15;
      objc_msgSend(MEMORY[0x1E4F39CF8], "_pk_withDisabledActions:perform:", a2 ^ 1u, v12);
    }
  }
}

- (void)_reloadToolImage
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteImageGeneratingToolView;
  [(PKPaletteToolView *)&v3 _reloadToolImage];
  -[PKPaletteImageGeneratingToolView _updateUI](self);
}

void __73__PKPaletteImageGeneratingToolView__updateSelectedViewTransformAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "imageContentView", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
  int v2 = (void *)v1;
  if (v1) {
    objc_super v3 = *(void **)(v1 + 424);
  }
  else {
    objc_super v3 = 0;
  }
  id v4 = v3;
  [v4 setTransform:&v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedDarkToolView, 0);

  objc_storeStrong((id *)&self->_animatedLightToolView, 0);
}

@end