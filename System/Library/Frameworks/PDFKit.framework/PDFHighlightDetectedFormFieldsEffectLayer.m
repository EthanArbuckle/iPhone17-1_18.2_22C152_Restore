@interface PDFHighlightDetectedFormFieldsEffectLayer
- (PDFHighlightDetectedFormFieldsEffectLayer)initWithPage:(id)a3;
- (id)_addRect:(CGRect)a3 withColor:(id)a4 backgroundColor:(id)a5 labelText:(id)a6 itemIndex:(unint64_t)a7;
- (void)setDisplayBox:(int64_t)a3;
- (void)updateVisibleLayers;
@end

@implementation PDFHighlightDetectedFormFieldsEffectLayer

- (PDFHighlightDetectedFormFieldsEffectLayer)initWithPage:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PDFHighlightDetectedFormFieldsEffectLayer;
  v5 = [(PDFHighlightDetectedFormFieldsEffectLayer *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_page, v4);
    v6->_displayBox = 1;
    [v4 boundsForBox:1];
    v6->_cropBox.origin.x = v7;
    v6->_cropBox.origin.y = v8;
    v6->_cropBox.size.width = v9;
    v6->_cropBox.size.height = v10;
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    addedSublayers = v6->_addedSublayers;
    v6->_addedSublayers = (NSMutableArray *)v11;
  }
  return v6;
}

- (void)setDisplayBox:(int64_t)a3
{
  self->_displayBox = a3;
}

- (void)updateVisibleLayers
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_addedSublayers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v7++) removeFromSuperlayer];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_addedSublayers removeAllObjects];
  if (GetDefaultsWriteHighlightDetectedAnnotations())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
    CGFloat v9 = objc_opt_new();
    CGFloat v10 = [WeakRetained annotationsIfAvail];
    if (v10) {
      [v9 addObjectsFromArray:v10];
    }
    uint64_t v11 = [WeakRetained detectedAnnotations];

    if (v11) {
      [v9 addObjectsFromArray:v11];
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__PDFHighlightDetectedFormFieldsEffectLayer_updateVisibleLayers__block_invoke;
    v12[3] = &unk_2642053B0;
    v12[4] = self;
    [v9 enumerateObjectsUsingBlock:v12];
  }
  [MEMORY[0x263F158F8] commit];
}

void __64__PDFHighlightDetectedFormFieldsEffectLayer_updateVisibleLayers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v22 = a2;
  if ([v22 fieldType] != -1)
  {
    uint64_t v5 = [v22 valueForAnnotationKey:@"/AAPL:SFF"];

    if (v5) {
      [MEMORY[0x263F825C8] systemRedColor];
    }
    else {
    uint64_t v6 = [MEMORY[0x263F825C8] systemBlueColor];
    }
    [v22 bounds];
    double v8 = v7;
    CGFloat v10 = v9;
    double v12 = v11;
    double v14 = v13;
    if ([v22 isAutofillNewContextStart])
    {
      long long v15 = [MEMORY[0x263F825C8] systemGreenColor];
      long long v16 = [v15 colorWithAlphaComponent:0.25];
    }
    else
    {
      long long v16 = 0;
    }
    [*(id *)(a1 + 32) bounds];
    double v18 = v17;
    v24.origin.x = v8;
    v24.origin.y = v10;
    v24.size.width = v12;
    v24.size.height = v14;
    double v19 = v18 - CGRectGetMaxY(v24);
    v20 = [v22 autoFillTextContentType];
    v21 = objc_msgSend(*(id *)(a1 + 32), "_addRect:withColor:backgroundColor:labelText:itemIndex:", v6, v16, v20, a3, v8, v19, v12, v14);
    [*(id *)(*(void *)(a1 + 32) + 80) addObject:v21];
  }
}

- (id)_addRect:(CGRect)a3 withColor:(id)a4 backgroundColor:(id)a5 labelText:(id)a6 itemIndex:(unint64_t)a7
{
  double width = a3.size.width;
  double height = a3.size.height;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  double v16 = x - self->_cropBox.origin.x;
  double v17 = y - self->_cropBox.origin.y;
  uint64_t v18 = *MEMORY[0x263F000D0];
  double v19 = *(double *)(MEMORY[0x263F000D0] + 8);
  double v20 = *(double *)(MEMORY[0x263F000D0] + 16);
  double v21 = *(double *)(MEMORY[0x263F000D0] + 24);
  double v22 = *(double *)(MEMORY[0x263F000D0] + 32);
  double v23 = *(double *)(MEMORY[0x263F000D0] + 40);
  double v24 = v22 + v17 * v20 + *MEMORY[0x263F000D0] * v16;
  double v25 = v23 + v17 * v21 + v19 * v16;
  id v26 = objc_alloc_init(MEMORY[0x263F157E8]);
  objc_msgSend(v26, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  v34[0] = v18;
  *(double *)&v34[1] = v19;
  *(double *)&v34[2] = v20;
  *(double *)&v34[3] = v21;
  *(double *)&v34[4] = v22;
  *(double *)&v34[5] = v23;
  [v26 setAffineTransform:v34];
  objc_msgSend(v26, "setPosition:", v24, v25);
  objc_msgSend(v26, "setBounds:", 0.0, 0.0, width, height);
  id v27 = v13;
  objc_msgSend(v26, "setBorderColor:", objc_msgSend(v27, "CGColor"));
  [v26 setBorderWidth:1.0];
  if (v14) {
    objc_msgSend(v26, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));
  }
  if (v15)
  {
    id v28 = objc_alloc_init(MEMORY[0x263F158E8]);
    [v28 setFont:@"Helvetica-Bold"];
    [v28 setFontSize:8.0];
    [v26 bounds];
    CGRect v37 = CGRectInset(v36, 2.0, 0.0);
    objc_msgSend(v28, "setFrame:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
    [v28 setString:v15];
    [v28 setAlignmentMode:*MEMORY[0x263F15938]];
    objc_msgSend(v28, "setForegroundColor:", objc_msgSend(v27, "CGColor"));
    [v28 setContentsScale:4.0];
    [v26 addSublayer:v28];
  }
  if (a7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v29 = objc_alloc_init(MEMORY[0x263F158E8]);
    [v29 setFont:@"Helvetica-Bold"];
    [v29 setFontSize:8.0];
    [v26 bounds];
    CGRect v39 = CGRectInset(v38, 2.0, 0.0);
    objc_msgSend(v29, "setFrame:", v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
    v30 = objc_msgSend(NSString, "stringWithFormat:", @"(%lu)", a7);
    [v29 setString:v30];

    [v29 setAlignmentMode:*MEMORY[0x263F15948]];
    objc_msgSend(v29, "setForegroundColor:", objc_msgSend(v27, "CGColor"));
    [v29 setContentsScale:4.0];
    [v26 addSublayer:v29];
  }
  [v26 setZPosition:100.0];
  [(PDFHighlightDetectedFormFieldsEffectLayer *)self addSublayer:v26];

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedSublayers, 0);

  objc_destroyWeak((id *)&self->_page);
}

@end