@interface CNModernAtomIconView
- (CGPoint)drawingOffset;
- (CNModernAtomIconView)initWithFrame:(CGRect)a3;
- (NSArray)iconImages;
- (NUIContainerStackView)stackView;
- (double)iconPadding;
- (double)preferredWidth;
- (void)setDrawingOffset:(CGPoint)a3;
- (void)setIconImages:(id)a3;
- (void)setIconPadding:(double)a3;
- (void)setStackView:(id)a3;
@end

@implementation CNModernAtomIconView

- (CNModernAtomIconView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNModernAtomIconView;
  v3 = -[CNModernAtomIconView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F4BF00]);
    [(CNModernAtomIconView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    stackView = v3->_stackView;
    v3->_stackView = (NUIContainerStackView *)v5;

    [(NUIContainerStackView *)v3->_stackView setAutoresizingMask:18];
    [(NUIContainerStackView *)v3->_stackView setAlignment:3];
    [(NUIContainerStackView *)v3->_stackView setDistribution:3];
    [(CNModernAtomIconView *)v3 addSubview:v3->_stackView];
  }
  return v3;
}

- (void)setIconPadding:(double)a3
{
}

- (double)iconPadding
{
  [(NUIContainerStackView *)self->_stackView spacing];
  return result;
}

- (void)setIconImages:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSArray *)a3;
  if (self->_iconImages != v5)
  {
    objc_storeStrong((id *)&self->_iconImages, a3);
    [(NUIContainerStackView *)self->_stackView setArrangedSubviews:0];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = v5;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v12 = objc_alloc(MEMORY[0x1E4F42AA0]);
          v13 = objc_msgSend(v12, "initWithImage:", v11, (void)v14);
          [v13 setContentMode:1];
          [(NUIContainerStackView *)self->_stackView addArrangedSubview:v13];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (double)preferredWidth
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(CNModernAtomIconView *)self iconImages];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__CNModernAtomIconView_preferredWidth__block_invoke;
  v6[3] = &unk_1E6128D30;
  v6[4] = self;
  v6[5] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __38__CNModernAtomIconView_preferredWidth__block_invoke(uint64_t a1, void *a2)
{
  [a2 size];
  [*(id *)(*(void *)(a1 + 32) + 416) spacing];
  UIRoundToViewScale();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

- (NSArray)iconImages
{
  return self->_iconImages;
}

- (NUIContainerStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (CGPoint)drawingOffset
{
  double x = self->_drawingOffset.x;
  double y = self->_drawingOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDrawingOffset:(CGPoint)a3
{
  self->_drawingOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_storeStrong((id *)&self->_iconImages, 0);
}

@end