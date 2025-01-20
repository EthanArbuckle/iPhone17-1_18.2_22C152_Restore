@interface PDFPageLayerMarkupAnnotationEffect
- (id)UUID;
- (id)annotation;
- (void)_updateNoteLayer;
- (void)removeFromSuperlayer;
- (void)update;
@end

@implementation PDFPageLayerMarkupAnnotationEffect

- (id)annotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);

  return WeakRetained;
}

- (id)UUID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);
  v3 = [WeakRetained pdfAnnotationUUID];

  return v3;
}

- (void)update
{
  v63[5] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v54 = self;
    [WeakRetained bounds];
    double v6 = v5;
    double v8 = v7;
    v9 = [v4 quadrilateralPoints];
    uint64_t v10 = [v4 markupType];
    int v11 = [v9 count];
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v11 >= 4)
    {
      uint64_t v13 = 0;
      double v57 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v58 = *MEMORY[0x263F001A8];
      double v55 = *(double *)(MEMORY[0x263F001A8] + 24);
      double v56 = *(double *)(MEMORY[0x263F001A8] + 16);
      uint64_t v14 = v11 >> 2;
      v15 = (_OWORD *)MEMORY[0x263F000D0];
      do
      {
        v16 = [v9 objectAtIndex:4 * v13];
        [v16 PDFKitPDFPointValue];
        double v60 = v17;
        double v61 = v18;

        v19 = [v9 objectAtIndex:(4 * v13) | 1];
        [v19 PDFKitPDFPointValue];
        uint64_t v62 = v20;
        v63[0] = v21;

        v22 = [v9 objectAtIndex:(4 * v13) | 2];
        [v22 PDFKitPDFPointValue];
        v63[1] = v23;
        v63[2] = v24;

        v25 = [v9 objectAtIndex:(4 * v13) | 3];
        [v25 PDFKitPDFPointValue];
        v63[3] = v26;
        v63[4] = v27;

        uint64_t v28 = 0;
        while (1)
        {
          double v29 = *(double *)((char *)&v60 + v28);
          double v30 = *(double *)((char *)&v60 + v28 + 8);
          double v31 = fabs(v30);
          if (fabs(v29) == INFINITY || v31 == INFINITY) {
            break;
          }
          *(double *)((char *)&v60 + v28) = v6 + v29;
          *(double *)((char *)&v60 + v28 + 8) = v8 + v30;
          v28 += 16;
          if (v28 == 64)
          {
            uint64_t v33 = 0;
            double v34 = v60;
            double v35 = v61;
            double v36 = v60;
            double v37 = v61;
            do
            {
              double v38 = *(double *)&v63[v33 - 1];
              double v39 = *(double *)&v63[v33];
              if (v34 >= v38) {
                double v34 = *(double *)&v63[v33 - 1];
              }
              if (v35 >= v39) {
                double v35 = *(double *)&v63[v33];
              }
              if (v36 < v38) {
                double v36 = *(double *)&v63[v33 - 1];
              }
              if (v37 < v39) {
                double v37 = *(double *)&v63[v33];
              }
              v33 += 2;
            }
            while (v33 != 6);
            if (v10)
            {
              if (v10 == 1)
              {
                double height = fmax((v37 - v35) * 0.08, 1.0);
                double y = height * -0.5 + (v37 + v35) * 0.5;
                double width = v36 - v34;
LABEL_26:
                CGFloat x = v34;
              }
              else
              {
                double height = v55;
                double width = v56;
                double y = v57;
                CGFloat x = v58;
                if (v10 == 2)
                {
                  double height = fmax((v37 - v35) * 0.08, 1.0);
                  double width = v36 - v34;
                  double y = v35;
                  goto LABEL_26;
                }
              }
            }
            else
            {
              double v44 = v36 - v34;
              double v45 = v37 - v35;
              CGRect v64 = CGRectInset(*(CGRect *)&v34, -0.8, -0.8);
              CGFloat x = v64.origin.x;
              double y = v64.origin.y;
              double width = v64.size.width;
              double height = v64.size.height;
            }
            v46 = objc_alloc_init(SelectionRectInfo);
            v46->rect.origin.CGFloat x = x;
            v46->rect.origin.double y = y;
            v46->rect.size.double width = width;
            v46->rect.size.double height = height;
            long long v47 = v15[1];
            *(_OWORD *)&v46->transform.a = *v15;
            *(_OWORD *)&v46->transform.c = v47;
            *(_OWORD *)&v46->transform.tCGFloat x = v15[2];
            [v12 addObject:v46];

            break;
          }
        }
        ++v13;
      }
      while (v13 != v14);
    }
    if (!v54->super._private->markupEffectLayers)
    {
      v48 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v49 = v54->super._private;
      markupEffectLayers = v49->markupEffectLayers;
      v49->markupEffectLayers = v48;
    }
    id v51 = [v4 color];
    uint64_t v52 = [v51 CGColor];

    v53 = v54->super._private->markupEffectLayers;
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __44__PDFPageLayerMarkupAnnotationEffect_update__block_invoke;
    v59[3] = &unk_264204B00;
    v59[4] = v54;
    v59[5] = v52;
    UpdateRectTransformDictionary(v53, v12, v52, v59, &__block_literal_global_13);
    [(PDFPageLayerMarkupAnnotationEffect *)v54 _updateNoteLayer];
  }
}

id __44__PDFPageLayerMarkupAnnotationEffect_update__block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F157E8];
  v4 = a2;
  id v5 = objc_alloc_init(v3);
  double v6 = v4[2];
  double v7 = v4[3];
  double v8 = v4[4];
  double v9 = v4[5];

  objc_msgSend(v5, "setFrame:", v6, v7, v8, v9);
  [v5 setBackgroundColor:*(void *)(a1 + 40)];
  [v5 setNeedsDisplay];
  [*(id *)(a1 + 32) addSublayer:v5];

  return v5;
}

- (void)_updateNoteLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._private->pageLayer);
  id v3 = objc_loadWeakRetained((id *)&self->super._private->annotation);
  v4 = [v3 contents];
  noteLayer = self->super._private->noteLayer;
  if (v4)
  {
    if (noteLayer)
    {
      double v6 = [(PDFPageLayerEffect *)noteLayer UUID];
      [WeakRetained updatePageLayerEffectForID:v6];
    }
    else
    {
      uint64_t v9 = +[PDFPageLayerEffect createPDFNoteLayerEffectForAnnotation:v3 withLayer:WeakRetained];
      uint64_t v10 = self->super._private;
      double v6 = v10->noteLayer;
      v10->noteLayer = (PDFPageLayerEffect *)v9;
    }
  }
  else
  {
    double v7 = [(PDFPageLayerEffect *)noteLayer UUID];
    [WeakRetained removePageLayerEffectForID:v7];

    double v8 = self->super._private;
    double v6 = v8->noteLayer;
    v8->noteLayer = 0;
  }
}

- (void)removeFromSuperlayer
{
  v5.receiver = self;
  v5.super_class = (Class)PDFPageLayerMarkupAnnotationEffect;
  [(PDFPageLayerMarkupAnnotationEffect *)&v5 removeFromSuperlayer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._private->pageLayer);
  v4 = [(PDFPageLayerEffect *)self->super._private->noteLayer UUID];
  [WeakRetained removePageLayerEffectForID:v4];
}

@end