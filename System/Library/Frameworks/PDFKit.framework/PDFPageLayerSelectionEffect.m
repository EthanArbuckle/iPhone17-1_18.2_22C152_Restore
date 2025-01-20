@interface PDFPageLayerSelectionEffect
- (PDFPageLayerSelectionEffect)initWithPDFPageLayer:(id)a3;
- (void)_generateRects;
- (void)addSelection:(id)a3;
- (void)setSelections:(id)a3;
- (void)updateColor:(unint64_t)a3;
@end

@implementation PDFPageLayerSelectionEffect

- (PDFPageLayerSelectionEffect)initWithPDFPageLayer:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFPageLayerSelectionEffect;
  v5 = [(PDFPageLayerEffect *)&v11 initWithPDFPageLayer:v4];
  if (v5)
  {
    v6 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    v7 = v5->super._private;
    rootSelectionLayer = v7->rootSelectionLayer;
    v7->rootSelectionLayer = v6;

    v9 = v5->super._private->rootSelectionLayer;
    [v4 bounds];
    -[CALayer setFrame:](v9, "setFrame:");
    [(PDFPageLayerSelectionEffect *)v5 addSublayer:v5->super._private->rootSelectionLayer];
    [(CALayer *)v5->super._private->rootSelectionLayer setCompositingFilter:*MEMORY[0x263F15D18]];
  }

  return v5;
}

- (void)setSelections:(id)a3
{
  uint64_t v4 = [a3 mutableCopy];
  v5 = self->super._private;
  selections = v5->selections;
  v5->selections = (NSMutableArray *)v4;

  [(PDFPageLayerSelectionEffect *)self _generateRects];
}

- (void)addSelection:(id)a3
{
  id v4 = a3;
  selections = self->super._private->selections;
  id v10 = v4;
  if (!selections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->super._private;
    v8 = v7->selections;
    v7->selections = v6;

    id v4 = v10;
    selections = self->super._private->selections;
  }
  v9 = (void *)[v4 copy];
  [(NSMutableArray *)selections addObject:v9];

  [(PDFPageLayerSelectionEffect *)self _generateRects];
}

- (void)updateColor:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(CALayer *)self->super._private->rootSelectionLayer sublayers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_super v11 = v10;
          v12 = (void *)v11[4];
          if (v12)
          {
            id v13 = v12;
            v14 = [v13 color];
            if (!v14)
            {
              if (a3) {
                +[PDFSelection defaultInactiveColor];
              }
              else {
              v14 = +[PDFSelection defaultActiveColor];
              }
            }
            id v15 = v14;
            objc_msgSend(v11, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  [MEMORY[0x263F158F8] commit];
}

- (void)_generateRects
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._private->pageLayer);
  v3 = [WeakRetained page];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    v5 = self->super._private->selections;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = v5;
    uint64_t v24 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v24)
    {
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          CFArrayRef v8 = (const __CFArray *)[v7 cgSelections];
          CFArrayRef v9 = v8;
          if (v8)
          {
            CFIndex Count = CFArrayGetCount(v8);
            if (Count >= 1)
            {
              CFIndex v11 = 0;
              while (1)
              {
                CFArrayGetValueAtIndex(v9, v11);
                uint64_t Page = CGPDFSelectionGetPage();
                if (Page == [v3 pageRef]) {
                  break;
                }
                if (Count == ++v11) {
                  goto LABEL_16;
                }
              }
              uint64_t NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
              if (NumberOfRectsAndTransforms >= 1)
              {
                for (uint64_t j = 0; j != NumberOfRectsAndTransforms; ++j)
                {
                  id v15 = objc_alloc_init(SelectionRectInfo);
                  CGPDFSelectionGetRectAndTransform();
                  objc_storeWeak((id *)&v15->selection, v7);
                  [v4 addObject:v15];
                }
              }
            }
          }
LABEL_16:
          ;
        }
        uint64_t v24 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v24);
    }

    long long v16 = self;
    if (!self->super._private->selectionEffectLayers)
    {
      long long v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v18 = self->super._private;
      selectionEffectLayers = v18->selectionEffectLayers;
      v18->selectionEffectLayers = v17;

      long long v16 = self;
    }
    objc_initWeak(&location, v16);
    v20 = self->super._private->selectionEffectLayers;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __45__PDFPageLayerSelectionEffect__generateRects__block_invoke;
    v25[3] = &unk_264204B48;
    objc_copyWeak(&v26, &location);
    UpdateRectTransformDictionary(v20, v4, 0, v25, &__block_literal_global_104);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

PDFSelectionLayer *__45__PDFPageLayerSelectionEffect__generateRects__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = objc_alloc_init(PDFSelectionLayer);
    double v6 = *((double *)v3 + 4);
    double v7 = *((double *)v3 + 5);
    -[PDFSelectionLayer setFrame:](v5, "setFrame:", *((double *)v3 + 10)+ (*((double *)v3 + 3) + v7 * 0.5) * *((double *)v3 + 8)+ *((double *)v3 + 6) * (*((double *)v3 + 2) + v6 * 0.5)- v6 * 0.5, *((double *)v3 + 11)+ (*((double *)v3 + 3) + v7 * 0.5) * *((double *)v3 + 9)+ *((double *)v3 + 7) * (*((double *)v3 + 2) + v6 * 0.5)- v7 * 0.5);
    long long v9 = *((_OWORD *)v3 + 4);
    v16[0] = *((_OWORD *)v3 + 3);
    v16[1] = v9;
    v16[2] = *((_OWORD *)v3 + 5);
    [(PDFSelectionLayer *)v5 setAffineTransform:v16];
    id v10 = objc_loadWeakRetained((id *)v3 + 1);
    CFIndex v11 = [v10 color];

    if (!v11)
    {
      CFIndex v11 = +[PDFSelection defaultActiveColor];
    }
    id v12 = v11;
    -[PDFSelectionLayer setBackgroundColor:](v5, "setBackgroundColor:", [v12 CGColor]);
    id v13 = (PDFSelection *)objc_loadWeakRetained((id *)v3 + 1);
    selection = v5->selection;
    v5->selection = v13;

    [(PDFSelectionLayer *)v5 setZPosition:-300.0];
    [(PDFSelectionLayer *)v5 setCompositingFilter:*MEMORY[0x263F15D18]];
    [*(id *)(WeakRetained[4] + 104) addSublayer:v5];
    CFArrayRef v8 = v5;
  }
  else
  {
    CFArrayRef v8 = 0;
  }

  return v8;
}

void __45__PDFPageLayerSelectionEffect__generateRects__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  long long v9 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (id *)v4;
    id WeakRetained = objc_loadWeakRetained(v9 + 1);
    objc_storeStrong(v5 + 4, WeakRetained);
    double v7 = [WeakRetained color];
    if (!v7)
    {
      double v7 = +[PDFSelection defaultActiveColor];
    }
    id v8 = v7;
    objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));
  }
}

@end