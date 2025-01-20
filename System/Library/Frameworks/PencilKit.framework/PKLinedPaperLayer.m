@interface PKLinedPaperLayer
- (PKLinedPaperLayer)initWithLinedPaperLayerDelegate:(id)a3;
- (PKLinedPaperLayerDelegate)linedPaperLayerDelegate;
- (id)_attachmentContainerView;
- (id)_linedPaper;
- (id)_traitCollection;
- (void)updateLinesFromAttachmentBounds:(CGRect)a3;
- (void)updateSublayersFromAttachmentBounds:(CGRect)a3;
@end

@implementation PKLinedPaperLayer

- (PKLinedPaperLayer)initWithLinedPaperLayerDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKLinedPaperLayer;
  v5 = [(PKLinedPaperLayer *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_linedPaperLayerDelegate, v4);
  }

  return v6;
}

- (id)_traitCollection
{
  v3 = [(PKLinedPaperLayer *)self linedPaperLayerDelegate];
  id v4 = [v3 linedPaperLayerTraitCollection:self];

  return v4;
}

- (id)_attachmentContainerView
{
  v3 = [(PKLinedPaperLayer *)self linedPaperLayerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(PKLinedPaperLayer *)self linedPaperLayerDelegate];
    v6 = [v5 linedPaperLayerAttachmentContainerView:self];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_linedPaper
{
  v3 = [(PKLinedPaperLayer *)self linedPaperLayerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(PKLinedPaperLayer *)self linedPaperLayerDelegate];
    v6 = [v5 linedPaperLayerLinedPaper:self];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)updateLinesFromAttachmentBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  objc_msgSend(MEMORY[0x1E4F39CF8], "begin", a3.origin.x, a3.origin.y);
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  v5 = [(PKLinedPaperLayer *)self _linedPaper];
  memset(&v27, 0, sizeof(v27));
  v6 = [(PKLinedPaperLayer *)self linedPaperLayerDelegate];
  v7 = v6;
  if (v6) {
    [v6 drawingTransform];
  }
  else {
    memset(&v27, 0, sizeof(v27));
  }

  double v8 = sqrt(v27.b * v27.b + v27.a * v27.a);
  v28.size.double height = height / v8;
  CGAffineTransform v26 = v27;
  v28.size.double width = 768.0;
  v28.origin.CGFloat x = 0.0;
  v28.origin.double y = 0.0;
  CGRect v29 = CGRectApplyAffineTransform(v28, &v26);
  CGFloat x = v29.origin.x;
  double y = v29.origin.y;
  CGFloat v11 = v29.size.width;
  CGFloat v12 = v29.size.height;
  [v5 horizontalInset];
  CGFloat v14 = v8 * v13;
  double v15 = x;
  v30.origin.CGFloat x = x;
  v30.origin.double y = y;
  double v16 = v11;
  v30.size.double width = v11;
  double v25 = v12;
  v30.size.double height = v12;
  CGRect v31 = CGRectInset(v30, v14, 0.0);
  double v17 = v31.origin.x;
  double v18 = v31.origin.y;
  double v19 = v31.size.width;
  double v20 = v31.size.height;
  [v5 lineSpacing];
  double v22 = v8 * v21;
  if (v8 * v21 > 0.0)
  {
    double v23 = floor(width * y / -768.0);
    double v18 = v18 + v23 - ceil(v23 / v22) * v22;
    double v20 = v20 + v22;
  }
  -[PKLinedPaperLayer setFrame:](self, "setFrame:", v17, v18, v19, v20);
  -[PKLinedPaperLayer updateSublayersFromAttachmentBounds:](self, "updateSublayersFromAttachmentBounds:", v15, y, v16, v25);
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)updateSublayersFromAttachmentBounds:(CGRect)a3
{
  double width = a3.size.width;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v5 = [(PKLinedPaperLayer *)self _linedPaper];
  v59 = [(PKLinedPaperLayer *)self _attachmentContainerView];
  if (v5 && v59)
  {
    [(PKLinedPaperLayer *)self bounds];
    double v7 = v6;
    [(PKLinedPaperLayer *)self bounds];
    double v9 = v8;
    v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 scale];
    double v12 = v11;

    [v5 lineSpacing];
    double v57 = v13;
    double v58 = v14;
    double v15 = [(PKLinedPaperLayer *)self sublayers];
    uint64_t v16 = [v15 count];

    [(PKLinedPaperLayer *)self bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v25 = [v59 layer];
    -[PKLinedPaperLayer convertRect:toLayer:](self, "convertRect:toLayer:", v25, v18, v20, v22, v24);
    double v27 = v26;
    long double v29 = v28;

    CGRect v30 = [(PKLinedPaperLayer *)self _traitCollection];
    if ([v30 userInterfaceStyle] == 2) {
      objc_msgSend(MEMORY[0x1E4FB1618], "pk_linedPaperLineColor_dark");
    }
    else {
    v36 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_linedPaperLineColor_light");
    }

    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x2020000000;
    uint64_t v71 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PKLinedPaperLayer_updateSublayersFromAttachmentBounds___block_invoke;
    aBlock[3] = &unk_1E64CA530;
    v66 = &v68;
    uint64_t v67 = v16;
    aBlock[4] = self;
    id v32 = v36;
    id v65 = v32;
    v37 = (void (**)(void))_Block_copy(aBlock);
    [v5 lineSpacing];
    double v38 = width / 768.0;
    if (v39 > 1.0)
    {
      double v40 = fmod(v29, v38 * v58);
      uint64_t v41 = 0;
      do
      {
        v42 = v37[2](v37);
        objc_msgSend(v42, "setFrame:", 0.0, round(v12 * (v38 * v58 * (double)v41)) / v12 - v40, v7, 1.0);
        [v42 frame];
        BOOL v44 = v43 + 1.0 <= v9;

        ++v41;
      }
      while (v44);
    }
    [v5 lineSpacing];
    if (v45 > 1.0)
    {
      uint64_t v46 = 0;
      double v47 = v38 * v57;
      do
      {
        v48 = v37[2](v37);
        objc_msgSend(v48, "setFrame:", round(v12 * (v27 + (double)v46 * v47)) / v12 + -0.5 - v27, 0.0, 1.0, v9);
        [v48 frame];
        BOOL v50 = v49 + 1.0 <= v7;

        ++v46;
      }
      while (v50);
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v51 = [(PKLinedPaperLayer *)self sublayers];
    uint64_t v52 = [v51 countByEnumeratingWithState:&v60 objects:v76 count:16];
    if (v52)
    {
      uint64_t v53 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v61 != v53) {
            objc_enumerationMutation(v51);
          }
          objc_msgSend(*(id *)(*((void *)&v60 + 1) + 8 * i), "setBackgroundColor:", objc_msgSend(v32, "CGColor"));
        }
        uint64_t v52 = [v51 countByEnumeratingWithState:&v60 objects:v76 count:16];
      }
      while (v52);
    }

    while (v16 > v69[3])
    {
      v55 = [(PKLinedPaperLayer *)self sublayers];
      v56 = [v55 objectAtIndexedSubscript:--v16];
      [v56 removeFromSuperlayer];
    }
    _Block_object_dispose(&v68, 8);
  }
  else
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    CGRect v31 = [(PKLinedPaperLayer *)self sublayers];
    id v32 = (id)[v31 copy];

    uint64_t v33 = [v32 countByEnumeratingWithState:&v72 objects:v77 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v73;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v73 != v34) {
            objc_enumerationMutation(v32);
          }
          [*(id *)(*((void *)&v72 + 1) + 8 * j) removeFromSuperlayer];
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v72 objects:v77 count:16];
      }
      while (v33);
    }
  }
}

id __57__PKLinedPaperLayer_updateSublayersFromAttachmentBounds___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 56))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(*(id *)(a1 + 40), "CGColor"));
    [*(id *)(a1 + 32) addSublayer:v3];
  }
  else
  {
    v2 = [*(id *)(a1 + 32) sublayers];
    id v3 = [v2 objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  return v3;
}

- (PKLinedPaperLayerDelegate)linedPaperLayerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linedPaperLayerDelegate);

  return (PKLinedPaperLayerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end