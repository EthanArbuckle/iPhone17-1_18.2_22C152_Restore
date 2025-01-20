@interface WFImageContentItemCell
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (NSArray)items;
- (WFImageContentItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WFImageContentItemCellDelegate)delegate;
- (void)imageViewTapped:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setItems:(id)a3;
- (void)setSelected:(BOOL)a3 atIndex:(unint64_t)a4;
@end

@implementation WFImageContentItemCell

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_selectedImageViews, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_activityIndicators, 0);
}

- (void)setDelegate:(id)a3
{
}

- (WFImageContentItemCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFImageContentItemCellDelegate *)WeakRetained;
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  BOOL v8 = 0;
  if (isKindOfClass)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)imageViewTapped:(id)a3
{
  imageViews = self->_imageViews;
  id v5 = [a3 view];
  uint64_t v6 = [(NSMutableArray *)imageViews indexOfObject:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = [(WFImageContentItemCell *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(WFImageContentItemCell *)self delegate];
      [v9 cell:self didSelectImageViewAtIndex:v6];
    }
  }
}

- (void)setSelected:(BOOL)a3 atIndex:(unint64_t)a4
{
  BOOL v5 = a3;
  id v7 = [(NSMutableArray *)self->_selectedImageViews objectAtIndex:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v8 = 0;
  }
  else {
    char v8 = v7;
  }
  id v12 = v8;

  if (v5)
  {
    if (!v12)
    {
      id v7 = objc_alloc_init(MEMORY[0x263F82828]);
      [(WFImageContentItemCell *)self addSubview:v7];
    }
    [(NSMutableArray *)self->_selectedImageViews replaceObjectAtIndex:a4 withObject:v7];
    [(WFImageContentItemCell *)self setNeedsLayout];
    id v9 = v7;
  }
  else
  {
    [v12 removeFromSuperview];
    selectedImageViews = self->_selectedImageViews;
    v11 = [MEMORY[0x263EFF9D0] null];
    [(NSMutableArray *)selectedImageViews replaceObjectAtIndex:a4 withObject:v11];

    id v9 = v12;
  }
}

- (void)setItems:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (NSArray *)[v4 copy];
  items = self->_items;
  self->_items = v5;

  imageViews = self->_imageViews;
  if (imageViews)
  {
    while (1)
    {
      unint64_t v8 = [(NSMutableArray *)imageViews count];
      if (v8 >= [v4 count]) {
        break;
      }
      id v9 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_imageViewTapped_];
      [v9 setDelegate:self];
      v10 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
      [v10 stopAnimating];
      id v11 = objc_alloc_init(MEMORY[0x263F82828]);
      [v11 setUserInteractionEnabled:1];
      [v11 setContentMode:2];
      [v11 setClipsToBounds:1];
      [v11 addGestureRecognizer:v9];
      [v11 addSubview:v10];
      [(WFImageContentItemCell *)self addSubview:v11];
      [(NSMutableArray *)self->_imageViews addObject:v11];
      [(NSMapTable *)self->_activityIndicators setObject:v10 forKey:v11];

      imageViews = self->_imageViews;
      if (!imageViews) {
        goto LABEL_8;
      }
    }
    while (1)
    {
      v14 = self->_imageViews;
      if (!v14) {
        break;
      }
      unint64_t v12 = [(NSMutableArray *)v14 count];
      if (v12 <= [v4 count]) {
        break;
      }
      v13 = [(NSMutableArray *)self->_imageViews lastObject];
      [v13 removeFromSuperview];
      [(NSMutableArray *)self->_imageViews removeObject:v13];
    }
  }
LABEL_8:
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = self->_selectedImageViews;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v29 + 1) + 8 * v19);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v20 removeFromSuperview];
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v17);
  }

  [(NSMutableArray *)self->_selectedImageViews removeAllObjects];
  unint64_t v21 = [(NSMutableArray *)self->_selectedImageViews count];
  if (v21 < [v4 count])
  {
    do
    {
      selectedImageViews = self->_selectedImageViews;
      v23 = [MEMORY[0x263EFF9D0] null];
      [(NSMutableArray *)selectedImageViews addObject:v23];

      unint64_t v24 = [(NSMutableArray *)self->_selectedImageViews count];
    }
    while (v24 < [v4 count]);
  }
  v25 = [MEMORY[0x263F82B60] mainScreen];
  [v25 scale];
  uint64_t v27 = v26;

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __35__WFImageContentItemCell_setItems___block_invoke;
  v28[3] = &unk_264900798;
  v28[4] = self;
  v28[5] = v27;
  [v4 enumerateObjectsUsingBlock:v28];
  [(WFImageContentItemCell *)self setNeedsLayout];
}

void __35__WFImageContentItemCell_setItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1024) objectAtIndex:a3];
  id v7 = [*(id *)(*(void *)(a1 + 32) + 1016) objectForKey:v6];
  [v6 setImage:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [v7 startAnimating];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __35__WFImageContentItemCell_setItems___block_invoke_2;
      v26[3] = &unk_264900720;
      v26[4] = *(void *)(a1 + 32);
      v29[1] = a3;
      unint64_t v8 = &v27;
      id v9 = v5;
      id v27 = v9;
      v10 = &v28;
      id v28 = v6;
      id v11 = (id *)v29;
      v29[0] = v7;
      [v9 getObjectRepresentation:v26 forClass:objc_opt_class()];
LABEL_8:

      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 32) bounds];
      double v15 = floor((CGRectGetWidth(v30)- (double)(unint64_t)[*(id *)(*(void *)(a1 + 32) + 1024) count]+ 1.0)/ (double)(unint64_t)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1024), "count"));
      CGAffineTransformMakeScale(&v25, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
      float64x2_t v16 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v25.c, v15), *(float64x2_t *)&v25.a, v15);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __35__WFImageContentItemCell_setItems___block_invoke_4;
      v21[3] = &unk_264900748;
      v21[4] = *(void *)(a1 + 32);
      v24[1] = a3;
      unint64_t v8 = &v22;
      id v12 = v5;
      id v22 = v12;
      v10 = &v23;
      id v23 = v6;
      id v11 = (id *)v24;
      v24[0] = v7;
      [v12 getThumbnail:v21 ofSize:*(_OWORD *)&v16];
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __35__WFImageContentItemCell_setItems___block_invoke_6;
      v17[3] = &unk_264900770;
      v17[4] = *(void *)(a1 + 32);
      v20[1] = a3;
      unint64_t v8 = &v18;
      id v13 = v5;
      id v18 = v13;
      v10 = &v19;
      id v19 = v6;
      id v11 = (id *)v20;
      v20[0] = v7;
      v14 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAD0]];
      [v13 getFileRepresentation:v17 forType:v14];

      goto LABEL_8;
    }
  }
LABEL_9:
}

void __35__WFImageContentItemCell_setItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__WFImageContentItemCell_setItems___block_invoke_3;
  v7[3] = &unk_2649006F8;
  uint64_t v4 = *(void *)(a1 + 64);
  id v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  uint64_t v12 = v4;
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __35__WFImageContentItemCell_setItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__WFImageContentItemCell_setItems___block_invoke_5;
  v7[3] = &unk_2649006F8;
  uint64_t v4 = *(void *)(a1 + 64);
  id v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  uint64_t v12 = v4;
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __35__WFImageContentItemCell_setItems___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F85308];
  uint64_t v4 = [a2 data];
  id v5 = [v3 imageWithData:v4];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__WFImageContentItemCell_setItems___block_invoke_7;
  v9[3] = &unk_2649006F8;
  uint64_t v6 = *(void *)(a1 + 64);
  id v7 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  uint64_t v14 = v6;
  id v10 = v7;
  id v11 = *(id *)(a1 + 48);
  id v12 = v5;
  id v13 = *(id *)(a1 + 56);
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __35__WFImageContentItemCell_setItems___block_invoke_7(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) items];
  id v3 = [v2 objectAtIndex:*(void *)(a1 + 72)];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 56) UIImage];
    [*(id *)(a1 + 48) setImage:v5];
  }
  uint64_t v6 = *(void **)(a1 + 64);
  return [v6 stopAnimating];
}

uint64_t __35__WFImageContentItemCell_setItems___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) items];
  id v3 = [v2 objectAtIndex:*(void *)(a1 + 72)];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 56) UIImage];
    [*(id *)(a1 + 48) setImage:v5];
  }
  uint64_t v6 = *(void **)(a1 + 64);
  return [v6 stopAnimating];
}

uint64_t __35__WFImageContentItemCell_setItems___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) items];
  id v3 = [v2 objectAtIndex:*(void *)(a1 + 72)];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4) {
    [*(id *)(a1 + 48) setImage:*(void *)(a1 + 56)];
  }
  id v5 = *(void **)(a1 + 64);
  return [v5 stopAnimating];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)WFImageContentItemCell;
  [(WFImageContentItemCell *)&v10 layoutSubviews];
  if (layoutSubviews_onceToken != -1) {
    dispatch_once(&layoutSubviews_onceToken, &__block_literal_global_3132);
  }
  [(WFImageContentItemCell *)self bounds];
  double Width = CGRectGetWidth(v11);
  double v4 = Width - (double)(unint64_t)[(NSMutableArray *)self->_imageViews count] + 1.0;
  double v5 = v4 / (double)(unint64_t)[(NSMutableArray *)self->_imageViews count];
  imageViews = self->_imageViews;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__WFImageContentItemCell_layoutSubviews__block_invoke_2;
  v9[3] = &unk_2649006D0;
  *(double *)&void v9[5] = v5;
  v9[4] = self;
  [(NSMutableArray *)imageViews enumerateObjectsUsingBlock:v9];
  selectedImageViews = self->_selectedImageViews;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__WFImageContentItemCell_layoutSubviews__block_invoke_3;
  v8[3] = &unk_2649006D0;
  *(double *)&v8[5] = v5;
  v8[4] = self;
  [(NSMutableArray *)selectedImageViews enumerateObjectsUsingBlock:v8];
}

void __40__WFImageContentItemCell_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  double v4 = *(double *)(a1 + 40);
  double v5 = (v4 + 1.0) * (double)a3;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  [v6 bounds];
  objc_msgSend(v7, "setFrame:", v5, 0.0, v4, CGRectGetHeight(v19) + -1.0);
  id v17 = [*(id *)(*(void *)(a1 + 32) + 1016) objectForKey:v7];
  [v17 sizeToFit];
  [v7 bounds];
  double MidX = CGRectGetMidX(v20);
  [v7 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v21.origin.x = v10;
  v21.origin.y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  objc_msgSend(v17, "setCenter:", MidX, CGRectGetMidY(v21));
}

void __40__WFImageContentItemCell_layoutSubviews__block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v5 = *(double *)(a1 + 40);
    [*(id *)(a1 + 32) bounds];
    objc_msgSend(v6, "setFrame:", (v5 + 1.0) * (double)a3, 0.0, v5, CGRectGetHeight(v8) + -1.0);
    [v6 setImage:layoutSubviews_selectedImage];
  }
}

void __40__WFImageContentItemCell_layoutSubviews__block_invoke()
{
  v11.width = 38.0;
  v11.height = 38.0;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", 0.0, 0.0, 38.0, 38.0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x263F824C0];
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = 38.0;
  v12.size.height = 38.0;
  CGRect v13 = CGRectInset(v12, 7.0, 7.0);
  v1 = objc_msgSend(v0, "bezierPathWithOvalInRect:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  v2 = [MEMORY[0x263F824C0] bezierPath];
  objc_msgSend(v2, "moveToPoint:", 13.0, 19.0);
  objc_msgSend(v2, "addLineToPoint:", 17.0, 23.0);
  objc_msgSend(v2, "addLineToPoint:", 25.0, 16.0);
  id v3 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.300000012];
  [v3 setFill];

  [v9 fill];
  double v4 = [MEMORY[0x263F825C8] colorWithRed:0.071 green:0.337 blue:0.843 alpha:1.0];
  [v4 setFill];

  [v1 fill];
  double v5 = [MEMORY[0x263F825C8] whiteColor];
  [v5 setStroke];

  [v1 stroke];
  [v2 stroke];
  id v6 = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v7 = objc_msgSend(v6, "resizableImageWithCapInsets:", 0.0, 0.0, 34.0, 34.0);
  CGRect v8 = (void *)layoutSubviews_selectedImage;
  layoutSubviews_selectedImage = v7;

  UIGraphicsEndImageContext();
}

- (WFImageContentItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)WFImageContentItemCell;
  double v4 = [(WFImageContentItemCell *)&v16 initWithStyle:a3 reuseIdentifier:a4];
  double v5 = v4;
  if (v4)
  {
    [(WFImageContentItemCell *)v4 setSelectionStyle:0];
    id v6 = [(WFImageContentItemCell *)v5 textLabel];
    [v6 setHidden:1];

    uint64_t v7 = [(WFImageContentItemCell *)v5 detailTextLabel];
    [v7 setHidden:1];

    CGRect v8 = [(WFImageContentItemCell *)v5 imageView];
    [v8 setHidden:1];

    uint64_t v9 = [MEMORY[0x263F08968] weakToWeakObjectsMapTable];
    activityIndicators = v5->_activityIndicators;
    v5->_activityIndicators = (NSMapTable *)v9;

    uint64_t v11 = [MEMORY[0x263EFF980] array];
    imageViews = v5->_imageViews;
    v5->_imageViews = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    selectedImageViews = v5->_selectedImageViews;
    v5->_selectedImageViews = (NSMutableArray *)v13;
  }
  return v5;
}

@end