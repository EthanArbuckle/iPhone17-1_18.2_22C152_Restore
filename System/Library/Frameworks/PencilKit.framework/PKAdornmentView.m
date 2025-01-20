@interface PKAdornmentView
+ (Class)classForSelectionType:(int64_t)a3;
- (BOOL)containsPoint:(CGPoint)a3 forInputType:(int64_t)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (PKAdornmentView)initWithFrame:(CGRect)a3 strokeSelection:(id)a4 selectionController:(id)a5 selectionType:(int64_t)a6;
- (PKSelectionController)selectionController;
- (PKSelectionRendering)selectionRenderer;
- (PKStrokeSelection)strokeSelection;
- (PKStrokeSelectionImage)strokeSelectionImage;
- (void)_hideStrokeSelectionImageView:(BOOL)a3 animated:(BOOL)a4;
- (void)_liftStrokesOutOfTiledView;
- (void)_putStrokesBackIntoTiledViewAnimated:(BOOL)a3;
- (void)hideStrokeImageView;
- (void)setSelectionController:(id)a3;
- (void)setSelectionRenderer:(id)a3;
- (void)setStrokeSelection:(id)a3;
- (void)setStrokeSelectionImage:(id)a3;
@end

@implementation PKAdornmentView

- (PKAdornmentView)initWithFrame:(CGRect)a3 strokeSelection:(id)a4 selectionController:(id)a5 selectionType:(int64_t)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PKAdornmentView;
  v16 = -[PKAdornmentView initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_strokeSelection, a4);
    p_selectionController = (id *)&v17->_selectionController;
    objc_storeWeak((id *)&v17->_selectionController, v15);
    if (+[PKAdornmentView classForSelectionType:a6])
    {
      id v19 = objc_alloc(+[PKAdornmentView classForSelectionType:a6]);
      id WeakRetained = objc_loadWeakRetained(p_selectionController);
      uint64_t v21 = [v19 initWithStrokeSelection:v14 renderingDelegate:WeakRetained];
      selectionRenderer = v17->_selectionRenderer;
      v17->_selectionRenderer = (PKSelectionRendering *)v21;

      [(PKSelectionRendering *)v17->_selectionRenderer _setupSelectionAdornment];
      v23 = [(PKAdornmentView *)v17 layer];
      v24 = [(PKSelectionRendering *)v17->_selectionRenderer adornmentLayer];
      [v23 addSublayer:v24];
    }
    v25 = (id *)objc_loadWeakRetained(p_selectionController);
    v26 = [(PKAdornmentView *)v17 strokeSelection];
    -[PKSelectionController setImageOnSelectionViewForStrokeSelection:withCompletion:](v25, v26, 0);
  }
  return v17;
}

+ (Class)classForSelectionType:(int64_t)a3
{
  if (a3 == 6)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_class();
  }
  return (Class)v4;
}

- (BOOL)containsPoint:(CGPoint)a3 forInputType:(int64_t)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(PKAdornmentView *)self bounds];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(PKAdornmentView *)self bounds];
  if (v9 < 44.0 || v8 < 44.0)
  {
    [(PKAdornmentView *)self bounds];
    UIRectGetCenter();
    UIRectCenteredAboutPoint();
    v15.double x = x;
    v15.double y = y;
    BOOL v13 = CGRectContainsPoint(v16, v15);
  }
  else
  {
    CGFloat v11 = [v7 touchesForView:self];
    v12 = [v11 anyObject];

    BOOL v13 = -[PKAdornmentView containsPoint:forInputType:](self, "containsPoint:forInputType:", [v12 type] == 2, x, y);
  }

  return v13;
}

- (void)setStrokeSelection:(id)a3
{
  v4 = (PKStrokeSelection *)a3;
  [(PKStrokeSelection *)v4 setStrokeImageWithHighlight:self->_strokeSelectionImage];
  strokeSelection = self->_strokeSelection;
  self->_strokeSelection = v4;
}

- (void)setStrokeSelectionImage:(id)a3
{
  id v17 = a3;
  p_strokeSelectionImage = &self->_strokeSelectionImage;
  objc_storeStrong((id *)&self->_strokeSelectionImage, a3);
  [(PKStrokeSelection *)self->_strokeSelection setStrokeImageWithHighlight:v17];
  if (!self->_strokeSelectionImageView)
  {
    uint64_t v6 = [PKImageView alloc];
    id v7 = [(PKStrokeSelectionImage *)*p_strokeSelectionImage image];
    double v8 = [(PKImageView *)v6 initWithImage:v7];
    strokeSelectionImageView = self->_strokeSelectionImageView;
    self->_strokeSelectionImageView = v8;

    [(PKImageView *)self->_strokeSelectionImageView setOpaque:0];
    CGFloat v10 = self->_strokeSelectionImageView;
    [(PKAdornmentView *)self bounds];
    -[PKImageView setFrame:](v10, "setFrame:");
    [(PKAdornmentView *)self addSubview:self->_strokeSelectionImageView];
    [(PKImageView *)self->_strokeSelectionImageView setHidden:1];
  }
  CGFloat v11 = [v17 image];
  [(PKImageView *)self->_strokeSelectionImageView setImage:v11];

  uint64_t v12 = [(PKStrokeSelectionImage *)*p_strokeSelectionImage addImage];
  [(PKImageView *)self->_strokeSelectionImageView setAddImage:v12];

  BOOL v13 = [(PKStrokeSelectionImage *)*p_strokeSelectionImage mulImage];
  [(PKImageView *)self->_strokeSelectionImageView setMulImage:v13];

  id v14 = [v17 config];
  [v14 imageViewBounds];
  LOBYTE(v12) = CGRectIsNull(v19);

  if ((v12 & 1) == 0)
  {
    CGPoint v15 = [(PKAdornmentView *)self superview];
    CGRect v16 = [v17 config];
    [v16 imageViewBounds];
    objc_msgSend(v15, "convertRect:toView:", self);
    -[PKImageView setFrame:](self->_strokeSelectionImageView, "setFrame:");
  }
}

- (void)_liftStrokesOutOfTiledView
{
  self->_isInteracting = 1;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  v4 = [(PKAdornmentView *)self strokeSelection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PKAdornmentView__liftStrokesOutOfTiledView__block_invoke;
  v5[3] = &unk_1E64C61C0;
  v5[4] = self;
  -[PKSelectionController setImageOnSelectionViewForStrokeSelection:withCompletion:](WeakRetained, v4, v5);
}

void __45__PKAdornmentView__liftStrokesOutOfTiledView__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 416))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 432));
    v4 = [*(id *)(a1 + 32) strokeSelection];
    v5 = [v4 strokes];
    uint64_t v6 = [v5 array];
    id v7 = +[PKStroke copyStrokes:v6 hidden:1];
    double v8 = [*(id *)(a1 + 32) strokeSelection];
    double v9 = [v8 drawing];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__PKAdornmentView__liftStrokesOutOfTiledView__block_invoke_2;
    v10[3] = &unk_1E64C61C0;
    v10[4] = *(void *)(a1 + 32);
    -[PKSelectionController _setAdditionalStrokes:inDrawing:completion:]((uint64_t)WeakRetained, v7, v9, v10);
  }
}

uint64_t __45__PKAdornmentView__liftStrokesOutOfTiledView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideStrokeSelectionImageView:0 animated:0];
}

- (void)_putStrokesBackIntoTiledViewAnimated:(BOOL)a3
{
  self->_isInteracting = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PKAdornmentView__putStrokesBackIntoTiledViewAnimated___block_invoke;
  v5[3] = &unk_1E64C61C0;
  v5[4] = self;
  -[PKSelectionController commitStrokesWithCompletion:]((uint64_t)WeakRetained, v5);
}

uint64_t __56__PKAdornmentView__putStrokesBackIntoTiledViewAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideStrokeSelectionImageView:1 animated:0];
}

- (void)hideStrokeImageView
{
}

- (void)_hideStrokeSelectionImageView:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    if (a4)
    {
      v5 = (void *)MEMORY[0x1E4FB1EB0];
      strokeSelectionImageView = self->_strokeSelectionImageView;
      BOOL v13 = self;
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      CGRect v16 = __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke_3;
      id v17 = &unk_1E64C61C0;
      v18 = self;
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      CGFloat v11 = __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke_4;
      uint64_t v12 = &unk_1E64C6730;
      id v7 = &v14;
      double v8 = &v9;
LABEL_6:
      objc_msgSend(v5, "transitionWithView:duration:options:animations:completion:", strokeSelectionImageView, 5242880, v7, v8, 0.0, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
      return;
    }
    [(PKAdornmentView *)self hideStrokeImageView];
  }
  else
  {
    if (a4)
    {
      [(PKImageView *)self->_strokeSelectionImageView setHidden:0];
      [(PKImageView *)self->_strokeSelectionImageView setAlpha:0.0];
      v5 = (void *)MEMORY[0x1E4FB1EB0];
      strokeSelectionImageView = self->_strokeSelectionImageView;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke;
      v20[3] = &unk_1E64C61C0;
      v20[4] = self;
      id v7 = v20;
      double v8 = 0;
      goto LABEL_6;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke_2;
    v19[3] = &unk_1E64C61C0;
    v19[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v19];
  }
}

uint64_t __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
}

uint64_t __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setHidden:0];
  v2 = *(void **)(*(void *)(a1 + 32) + 408);

  return [v2 setAlpha:1.0];
}

uint64_t __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
}

uint64_t __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideStrokeImageView];
}

- (PKStrokeSelection)strokeSelection
{
  return self->_strokeSelection;
}

- (PKSelectionController)selectionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);

  return (PKSelectionController *)WeakRetained;
}

- (void)setSelectionController:(id)a3
{
}

- (PKSelectionRendering)selectionRenderer
{
  return self->_selectionRenderer;
}

- (void)setSelectionRenderer:(id)a3
{
}

- (PKStrokeSelectionImage)strokeSelectionImage
{
  return self->_strokeSelectionImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeSelectionImage, 0);
  objc_storeStrong((id *)&self->_selectionRenderer, 0);
  objc_destroyWeak((id *)&self->_selectionController);
  objc_storeStrong((id *)&self->_strokeSelection, 0);

  objc_storeStrong((id *)&self->_strokeSelectionImageView, 0);
}

@end