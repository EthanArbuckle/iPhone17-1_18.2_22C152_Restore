@interface LPVerticalTextStackView
- (CGSize)_layoutTextStackForSize:(CGSize)a3 applyingLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPVerticalTextStackView)initWithHost:(id)a3;
- (LPVerticalTextStackView)initWithHost:(id)a3 style:(id)a4;
- (int64_t)computedNumberOfLines;
- (void)addArrangedSubview:(id)a3;
- (void)layoutComponentView;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation LPVerticalTextStackView

- (LPVerticalTextStackView)initWithHost:(id)a3
{
  return 0;
}

- (LPVerticalTextStackView)initWithHost:(id)a3 style:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)LPVerticalTextStackView;
  v8 = [(LPComponentView *)&v17 initWithHost:v6];
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    items = v8->_items;
    v8->_items = v9;

    objc_storeStrong((id *)&v8->_style, a4);
    if (+[LPSettings showDebugIndicators])
    {
      id v11 = [MEMORY[0x1E4FB1618] purpleColor];
      uint64_t v12 = [v11 CGColor];
      v13 = [(LPVerticalTextStackView *)v8 layer];
      [v13 setBorderColor:v12];

      v14 = [(LPVerticalTextStackView *)v8 layer];
      [v14 setBorderWidth:0.5];
    }
    v15 = v8;
  }

  return v8;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
  }
}

- (void)addArrangedSubview:(id)a3
{
  id v4 = a3;
  if (self->_hasEverBuilt) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Trying to update a text stack after it has been laid out."];
  }
  [(NSMutableArray *)self->_items addObject:v4];
  [(LPVerticalTextStackView *)self addSubview:v4];
}

- (void)layoutComponentView
{
  [(LPVerticalTextStackView *)self bounds];
  double v4 = v3 - (self->_contentInset.left + self->_contentInset.right);
  double v6 = v5 - (self->_contentInset.top + self->_contentInset.bottom);

  -[LPVerticalTextStackView _layoutTextStackForSize:applyingLayout:](self, "_layoutTextStackForSize:applyingLayout:", 1, v4, v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  p_contentInset = &self->_contentInset;
  -[LPVerticalTextStackView _layoutTextStackForSize:applyingLayout:](self, "_layoutTextStackForSize:applyingLayout:", 0, a3.width - (self->_contentInset.left + self->_contentInset.right), a3.height - (self->_contentInset.top + self->_contentInset.bottom));
  double v6 = ceil(v4) - (-p_contentInset->right - p_contentInset->left);
  double v7 = ceil(v5) - (-p_contentInset->bottom - p_contentInset->top);
  result.height = v7;
  result.width = v6;
  return result;
}

- (int64_t)computedNumberOfLines
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_items;
  int64_t v3 = 0;
  uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v3 += objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "computedNumberOfLines", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return v3;
}

- (CGSize)_layoutTextStackForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  CGFloat width = a3.width;
  long long v8 = malloc_type_calloc([(NSMutableArray *)self->_items count], 0x10uLL, 0x1000040451B5BE8uLL);
  unsigned int v9 = [(LPVerticalTextStackViewStyle *)self->_style maximumNumberOfLines];
  BOOL v10 = v9 != 0;
  if (v9)
  {
    uint64_t v32 = 0;
    v33 = (double *)&v32;
    uint64_t v34 = 0x2020000000;
    v35 = 0;
    uint64_t v11 = [(LPVerticalTextStackViewStyle *)self->_style maximumNumberOfLines];
    v35 = (void *)(v11 - [(NSMutableArray *)self->_items count]);
    items = self->_items;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke;
    v39[3] = &unk_1E5B05A18;
    v39[4] = &v32;
    *(CGFloat *)&v39[5] = width;
    *(double *)&v39[6] = height;
    v39[7] = v8;
    BOOL v40 = v4;
    [(NSMutableArray *)items enumerateObjectsUsingBlock:v39];
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    uint64_t v13 = self->_items;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_2;
    v38[3] = &__block_descriptor_56_e49_v32__0__LPComponentView_LPTextStyleable__8Q16_B24l;
    v38[4] = v8;
    *(CGFloat *)&v38[5] = width;
    *(double *)&v38[6] = height;
    [(NSMutableArray *)v13 enumerateObjectsUsingBlock:v38];
  }
  v14 = malloc_type_calloc([(NSMutableArray *)self->_items count], 0x20uLL, 0x1000040E0EAB150uLL);
  uint64_t v32 = 0;
  v33 = (double *)&v32;
  uint64_t v34 = 0x3010000000;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  v35 = &unk_1A37209C1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_3;
  aBlock[3] = &unk_1E5B05A88;
  aBlock[5] = &v32;
  aBlock[6] = v14;
  *(CGFloat *)&aBlock[7] = width;
  *(double *)&aBlock[8] = height;
  aBlock[9] = v8;
  aBlock[4] = self;
  v15 = (void (**)(void))_Block_copy(aBlock);
  v15[2]();
  if (v33[5] > height)
  {
    v16 = self->_items;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_5;
    v24[3] = &unk_1E5B05AB0;
    v27 = v8;
    CGFloat v28 = width;
    double v29 = height;
    BOOL v30 = v4;
    v25 = v15;
    v26 = &v32;
    [(NSMutableArray *)v16 enumerateObjectsWithOptions:2 usingBlock:v24];
  }
  if (v4)
  {
    objc_super v17 = self->_items;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_6;
    v22[3] = &__block_descriptor_41_e49_v32__0__LPComponentView_LPTextStyleable__8Q16_B24l;
    BOOL v23 = v10;
    v22[4] = v14;
    [(NSMutableArray *)v17 enumerateObjectsUsingBlock:v22];
  }
  free(v8);
  free(v14);
  double v18 = v33[4];
  double v19 = v33[5];

  _Block_object_dispose(&v32, 8);
  double v20 = v18;
  double v21 = v19;
  result.double height = v21;
  result.CGFloat width = v20;
  return result;
}

void __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v19 = a2;
  [v19 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [v19 overrideMaximumNumberOfLines];
  [v19 setOverrideMaximumNumberOfLines:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 1];
  objc_msgSend(v19, "sizeThatFits:", *(double *)(a1 + 40), 1.79769313e308);
  v14 = (double *)(*(void *)(a1 + 56) + 16 * a3);
  double *v14 = v15;
  v14[1] = v16;
  objc_msgSend(v19, "setFrame:", 0.0, 0.0, v15, v16);
  uint64_t v17 = [v19 computedNumberOfLines];
  objc_msgSend(v19, "setFrame:", v6, v8, v10, v12);
  if (!*(unsigned char *)(a1 + 64)) {
    [v19 setOverrideMaximumNumberOfLines:v13];
  }
  if (v17 <= 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = v17;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24)
                                                              - v18
                                                              + 1;
}

void __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  objc_msgSend(v5, "sizeThatFits:", *(double *)(a1 + 40), 1.79769313e308);
  double v7 = (void *)(v6 + 16 * a3);
  *double v7 = v8;
  v7[1] = v9;
}

void __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_3(uint64_t a1)
{
  uint64_t v20 = 0;
  double v21 = (double *)&v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v23 = *(void *)(v3 + 432);
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  BOOL v4 = *(void **)(v3 + 416);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_4;
  v13[3] = &unk_1E5B05A60;
  v13[4] = v3;
  v13[5] = &v20;
  uint64_t v5 = *(void *)(a1 + 48);
  long long v14 = *(_OWORD *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 72);
  v13[6] = &v16;
  v13[7] = v5;
  [v4 enumerateObjectsUsingBlock:v13];
  uint64_t v6 = v17[3];
  double v7 = v21[3];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 416) lastObject];
  [v8 lastLineDescent];
  double v10 = v9;
  if (v9 == 0.0)
  {
    v1 = [*(id *)(*(void *)(a1 + 32) + 464) lastLineDescent];
    [v1 value];
  }
  double v11 = v7 + v9 - *(double *)(*(void *)(a1 + 32) + 432);
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v12 + 32) = v6;
  *(double *)(v12 + 40) = v11;
  if (v10 == 0.0) {

  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

void __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_4(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v18 = v5;
  if (a3)
  {
    [v5 firstLineLeading];
    double v7 = v6;
  }
  else
  {
    uint64_t v8 = [*(id *)(a1[4] + 464) firstLineLeading];
    [v8 value];
    double v7 = v9;
  }
  if (v7 != 0.0)
  {
    double v10 = *(double *)(*(void *)(a1[5] + 8) + 24);
    [v18 ascender];
    *(double *)(*(void *)(a1[5] + 8) + 24) = floor(v7 + v10 - v11);
  }
  uint64_t v12 = a1[7] + 32 * a3;
  uint64_t v13 = *(void *)(*(void *)(a1[5] + 8) + 24);
  uint64_t v14 = a1[8];
  *(void *)uint64_t v12 = *(void *)(a1[4] + 440);
  *(void *)(v12 + 8) = v13;
  *(void *)(v12 + 16) = v14;
  *(void *)(v12 + 24) = 0;
  uint64_t v15 = (double *)(a1[10] + 16 * a3);
  double v16 = *v15;
  *(double *)(v12 + 24) = v15[1];
  *(double *)(*(void *)(a1[6] + 8) + 24) = fmax(*(double *)(*(void *)(a1[6] + 8) + 24), v16);
  *(CGFloat *)(*(void *)(a1[5] + 8) + 24) = CGRectGetMaxY(*(CGRect *)v12);
  if ([*(id *)(a1[4] + 464) shouldAlignToBaselines])
  {
    [v18 descender];
    *(double *)(*(void *)(a1[5] + 8) + 24) = v17 + *(double *)(*(void *)(a1[5] + 8) + 24);
  }
}

void __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v7 = [v12 overrideMaximumNumberOfLines];
  [v12 setOverrideMaximumNumberOfLines:1];
  uint64_t v8 = *(void *)(a1 + 48);
  objc_msgSend(v12, "sizeThatFits:", *(double *)(a1 + 56), 1.79769313e308);
  double v9 = (void *)(v8 + 16 * a3);
  void *v9 = v10;
  v9[1] = v11;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!*(unsigned char *)(a1 + 72)) {
    [v12 setOverrideMaximumNumberOfLines:v7];
  }
  if (*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) <= *(double *)(a1 + 64)) {
    *a4 = 1;
  }
}

void __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!*(unsigned char *)(a1 + 40)) {
    [v5 setOverrideMaximumNumberOfLines:0];
  }
  objc_msgSend(v5, "setFrame:", *(double *)(*(void *)(a1 + 32) + 32 * a3), *(double *)(*(void *)(a1 + 32) + 32 * a3 + 8), *(double *)(*(void *)(a1 + 32) + 32 * a3 + 16), *(double *)(*(void *)(a1 + 32) + 32 * a3 + 24));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end