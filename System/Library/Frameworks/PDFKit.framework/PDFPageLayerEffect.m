@interface PDFPageLayerEffect
+ (id)createFlashEffectForPDFLinkAnnotation:(id)a3 withLayer:(id)a4 forType:(int64_t)a5;
+ (id)createPDFAnnotationLayerEffectForAnnotation:(id)a3 withLayer:(id)a4;
+ (id)createPDFCoachmarkLayerEffectsWithFrame:(CGRect)a3 withLayer:(id)a4;
+ (id)createPDFMarkupLayerEffectsForAnnotation:(id)a3 withLayer:(id)a4;
+ (id)createPDFNoteLayerEffectForAnnotation:(id)a3 withLayer:(id)a4;
+ (id)createPDFSelectionLayerEffectsForSelections:(id)a3 withLayer:(id)a4;
- (BOOL)shouldRotateContent;
- (CGRect)pageFrame;
- (PDFPageLayerEffect)initWithPDFPageLayer:(id)a3;
- (id)UUID;
- (id)annotation;
- (id)pdfResult;
- (void)setPageFrame:(CGRect)a3;
@end

@implementation PDFPageLayerEffect

- (PDFPageLayerEffect)initWithPDFPageLayer:(id)a3
{
  v20[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PDFPageLayerEffect;
  v5 = [(PDFPageLayerEffect *)&v18 init];
  if (v5)
  {
    v6 = objc_alloc_init(PDFPageLayerEffectPrivate);
    v7 = v5->_private;
    v5->_private = v6;

    objc_storeWeak((id *)&v5->_private->pageLayer, v4);
    uint64_t v8 = [MEMORY[0x263F08C38] UUID];
    v9 = v5->_private;
    uuid = v9->uuid;
    v9->uuid = (NSUUID *)v8;

    v5->_private->shouldRotateContent = 1;
    v19[0] = @"onOrderIn";
    v11 = [MEMORY[0x263EFF9D0] null];
    v20[0] = v11;
    v19[1] = @"onOrderOut";
    v12 = [MEMORY[0x263EFF9D0] null];
    v20[1] = v12;
    v19[2] = @"sublayers";
    v13 = [MEMORY[0x263EFF9D0] null];
    v20[2] = v13;
    v19[3] = @"contents";
    v14 = [MEMORY[0x263EFF9D0] null];
    v20[3] = v14;
    v19[4] = @"bounds";
    v15 = [MEMORY[0x263EFF9D0] null];
    v20[4] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:5];

    [(PDFPageLayerEffect *)v5 setActions:v16];
  }

  return v5;
}

- (id)UUID
{
  return self->_private->uuid;
}

- (CGRect)pageFrame
{
  v2 = self->_private;
  double x = v2->pageFrame.origin.x;
  double y = v2->pageFrame.origin.y;
  double width = v2->pageFrame.size.width;
  double height = v2->pageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPageFrame:(CGRect)a3
{
  self->_private->pageFrame = a3;
}

- (BOOL)shouldRotateContent
{
  return self->_private->shouldRotateContent;
}

- (id)annotation
{
  return 0;
}

- (id)pdfResult
{
  return 0;
}

+ (id)createPDFSelectionLayerEffectsForSelections:(id)a3 withLayer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[PDFPageLayerSelectionEffect alloc] initWithPDFPageLayer:v5];
  [v5 bounds];
  -[PDFPageLayerSelectionEffect setFrame:](v7, "setFrame:");
  [v5 bounds];
  -[PDFPageLayerEffect setPageFrame:](v7, "setPageFrame:");
  [(PDFPageLayerSelectionEffect *)v7 setZPosition:-300.0];
  [(PDFPageLayerSelectionEffect *)v7 setAllowsGroupBlending:0];
  [(PDFPageLayerSelectionEffect *)v7 setGeometryFlipped:1];
  [(PDFPageLayerSelectionEffect *)v7 setSelections:v6];

  [v5 addPageLayerEffect:v7];

  return v7;
}

+ (id)createPDFCoachmarkLayerEffectsWithFrame:(CGRect)a3 withLayer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  if (PDFRectValid(x, y, width, height)
    && (v30.origin.double x = x, v30.origin.y = y, v30.size.width = width, v30.size.height = height, !PDFRectIsEmpty(v30)))
  {
    v31.origin.double x = x;
    v31.origin.double y = y;
    v31.size.double width = width;
    v31.size.double height = height;
    CGRect v32 = PDFRectInset(v31, width * -0.1, height * -0.1);
    double v10 = v32.origin.x;
    double v11 = v32.origin.y;
    double v12 = v32.size.width;
    double v13 = v32.size.height;
    id v14 = objc_alloc_init(MEMORY[0x263F157D0]);
    double v15 = 0.0;
    [v14 setFrame:PDFRectToCGRect(v14)];
    [v14 setCornerRadius:3.0];
    id v16 = objc_alloc(MEMORY[0x263EFF980]);
    PDFCGColorCreateGenericRGB(0.949019608, 0.937254902, 0.0, 1.0);
    id v17 = objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 CGColor];
    PDFCGColorCreateGenericRGB(0.929411765, 0.8, 0.0, 1.0);
    id v19 = objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v16, "initWithObjects:", v18, objc_msgSend(v19, "CGColor"), 0);

    v21 = [v8 page];
    uint64_t v22 = [v21 rotation];

    if (v22 >= 180) {
      [v20 exchangeObjectAtIndex:0 withObjectAtIndex:1];
    }
    [v14 setColors:v20];
    if (v22 == 90) {
      double v23 = 1.0;
    }
    else {
      double v23 = 0.0;
    }
    if (v22 == 90) {
      double v24 = 0.0;
    }
    else {
      double v24 = -1.0;
    }
    if (v22 == 180)
    {
      double v23 = 0.0;
      double v24 = 1.0;
    }
    if (v22 == 270) {
      double v25 = -1.0;
    }
    else {
      double v25 = v23;
    }
    if (v22 != 270) {
      double v15 = v24;
    }
    objc_msgSend(MEMORY[0x263F825C8], "blackColor", -1.0, v23);
    id v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShadowColor:", objc_msgSend(v26, "CGColor"));

    objc_msgSend(v14, "setShadowOffset:", v25, v15);
    LODWORD(v27) = 1061997773;
    [v14 setShadowOpacity:v27];
    [v14 setShadowRadius:1.0];
    [v14 setGeometryFlipped:1];
    v9 = [[PDFPageLayerEffect alloc] initWithPDFPageLayer:v8];
    [(PDFPageLayerEffect *)v9 setFrame:PDFRectToCGRect(v9)];
    -[PDFPageLayerEffect setPageFrame:](v9, "setPageFrame:", v10, v11, v12, v13);
    [(PDFPageLayerEffect *)v9 setZPosition:-500.0];
    [(PDFPageLayerEffect *)v9 setCompositingFilter:*MEMORY[0x263F15D18]];
    [(PDFPageLayerEffect *)v9 addSublayer:v14];
    [v8 addPageLayerEffect:v9];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)createPDFAnnotationLayerEffectForAnnotation:(id)a3 withLayer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_4;
  }
  [v5 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  if (!PDFRectValid(v7, v9, v11, v13)
    || (v27.origin.double x = v8, v27.origin.y = v10, v27.size.width = v12, v27.size.height = v14, PDFRectIsEmpty(v27)))
  {
LABEL_4:
    double v15 = 0;
    goto LABEL_5;
  }
  id v17 = [v5 valueForAnnotationKey:@"/Subtype"];
  int v18 = [v17 isEqualToString:@"/Link"];
  int v19 = [v17 isEqualToString:@"/Popup"];
  if (!v18) {
    goto LABEL_12;
  }
  v20 = [v5 border];
  v21 = v20;
  if (v20)
  {
    [v20 lineWidth];
    if (v22 > 0.0)
    {

LABEL_12:
      double v15 = [(PDFPageLayerEffect *)[PDFPageLayerAnnotationEffect alloc] initWithPDFPageLayer:v6];
      [(PDFPageLayerAnnotationEffect *)v15 setFrame:PDFRectToCGRect(v15)];
      double v23 = -200.0;
      if (v19) {
        double v23 = 0.0;
      }
      [(PDFPageLayerAnnotationEffect *)v15 setZPosition:v23];
      if ([v5 shouldDisplay])
      {
        double v24 = [v6 page];
        -[PDFPageLayerAnnotationEffect setHidden:](v15, "setHidden:", [v24 displaysAnnotations] ^ 1);
      }
      else
      {
        [(PDFPageLayerAnnotationEffect *)v15 setHidden:1];
      }
      [(PDFPageLayerAnnotationEffect *)v15 setContentsFormat:*MEMORY[0x263F159B8]];
      [(PDFPageLayerAnnotationEffect *)v15 setGeometryFlipped:1];
      [(PDFPageLayerAnnotationEffect *)v15 setNeedsDisplay];
      [(PDFPageLayerAnnotationEffect *)v15 setDrawsAsynchronously:1];
      objc_storeWeak((id *)&v15->super._private->annotation, v5);
      if ([v17 isEqualToString:@"/Text"])
      {
        v15->super._private->shouldRotateContent = 0;
      }
      else if ([v17 isEqualToString:@"/Ink"])
      {
        double v25 = [v5 valueForAnnotationKey:@"/IT"];
        if ([v25 isEqualToString:@"/InkHighlight"]) {
          [(PDFPageLayerAnnotationEffect *)v15 setCompositingFilter:*MEMORY[0x263F15D18]];
        }
      }
      [v6 addPageLayerEffect:v15];
      goto LABEL_25;
    }
  }

  double v15 = 0;
LABEL_25:

LABEL_5:

  return v15;
}

+ (id)createPDFMarkupLayerEffectsForAnnotation:(id)a3 withLayer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_4;
  }
  [v5 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  if (!PDFRectValid(v7, v9, v11, v13)) {
    goto LABEL_4;
  }
  v19.origin.double x = v8;
  v19.origin.double y = v10;
  v19.size.double width = v12;
  v19.size.double height = v14;
  if (!PDFRectIsEmpty(v19))
  {
    double v15 = [(PDFPageLayerEffect *)[PDFPageLayerMarkupAnnotationEffect alloc] initWithPDFPageLayer:v6];
    [(PDFPageLayerMarkupAnnotationEffect *)v15 setFrame:PDFRectToCGRect(v15)];
    [(PDFPageLayerMarkupAnnotationEffect *)v15 setZPosition:-400.0];
    if ([v5 shouldDisplay])
    {
      id v17 = [v6 page];
      -[PDFPageLayerMarkupAnnotationEffect setHidden:](v15, "setHidden:", [v17 displaysAnnotations] ^ 1);
    }
    else
    {
      [(PDFPageLayerMarkupAnnotationEffect *)v15 setHidden:1];
    }
    [(PDFPageLayerMarkupAnnotationEffect *)v15 setCompositingFilter:*MEMORY[0x263F15D18]];
    [(PDFPageLayerMarkupAnnotationEffect *)v15 setAllowsGroupBlending:0];
    [(PDFPageLayerMarkupAnnotationEffect *)v15 setGeometryFlipped:1];
    objc_storeWeak((id *)&v15->super._private->annotation, v5);
    [(PDFPageLayerMarkupAnnotationEffect *)v15 update];
    [v6 addPageLayerEffect:v15];
  }
  else
  {
LABEL_4:
    double v15 = 0;
  }

  return v15;
}

+ (id)createPDFNoteLayerEffectForAnnotation:(id)a3 withLayer:(id)a4
{
  id v4 = (PDFPageLayerNoteEffect *)a3;
  if (a3)
  {
    id v5 = a4;
    id v6 = v4;
    id v4 = [(PDFPageLayerEffect *)[PDFPageLayerNoteEffect alloc] initWithPDFPageLayer:v5];
    [(PDFPageLayerNoteEffect *)v4 setBorderWidth:1.0];
    [(PDFPageLayerNoteEffect *)v4 setCornerRadius:1.0];
    objc_storeWeak((id *)&v4->super._private->annotation, v6);

    [(PDFPageLayerNoteEffect *)v4 update];
    [v5 addPageLayerEffect:v4];
  }

  return v4;
}

+ (id)createFlashEffectForPDFLinkAnnotation:(id)a3 withLayer:(id)a4 forType:(int64_t)a5
{
  id v7 = a4;
  if (a3)
  {
    id v8 = a3;
    double v9 = [[PDFPageLayerEffect alloc] initWithPDFPageLayer:v7];
    [v8 bounds];
    double x = v10;
    double y = v12;
    double width = v14;
    double height = v16;

    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    if (a5 == 1)
    {
      double v18 = 0.2;
    }
    else
    {
      if (a5 != 2)
      {
        [(PDFPageLayerEffect *)v9 setCornerRadius:1.5];
        CGRect v19 = +[PDFSelection defaultActiveColor];
        double v20 = 0.25;
        double v18 = 0.25;
        goto LABEL_8;
      }
      double v18 = 0.75;
    }
    v38.origin.double x = x;
    v38.origin.double y = y;
    v38.size.double width = width;
    v38.size.double height = height;
    CGRect v39 = PDFRectInset(v38, -3.0, -3.0);
    double x = v39.origin.x;
    double y = v39.origin.y;
    double width = v39.size.width;
    double height = v39.size.height;
    [(PDFPageLayerEffect *)v9 setCornerRadius:3.0];
    CGRect v19 = [MEMORY[0x263F825C8] colorWithRed:0.101960784 green:0.101960784 blue:0.101960784 alpha:0.3];
    double v20 = 0.0;
LABEL_8:
    id v21 = v19;
    -[PDFPageLayerEffect setBackgroundColor:](v9, "setBackgroundColor:", [v21 CGColor]);

    [(PDFPageLayerEffect *)v9 setFrame:PDFRectToCGRect(v22)];
    -[PDFPageLayerEffect setPageFrame:](v9, "setPageFrame:", x, y, width, height);
    [(PDFPageLayerEffect *)v9 setCompositingFilter:*MEMORY[0x263F15D18]];
    [(PDFPageLayerEffect *)v9 setZPosition:-500.0];
    double v23 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v23 setBeginTime:v18 + CACurrentMediaTime()];
    LODWORD(v24) = 1.0;
    double v25 = [NSNumber numberWithFloat:v24];
    [v23 setFromValue:v25];

    id v26 = [NSNumber numberWithFloat:0.0];
    [v23 setToValue:v26];

    [v23 setDuration:v20];
    LODWORD(v27) = 1.0;
    [v23 setRepeatCount:v27];
    [v23 setRemovedOnCompletion:0];
    [v23 setFillMode:*MEMORY[0x263F15AB0]];
    v28 = (void *)MEMORY[0x263F158F8];
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    v33 = __78__PDFPageLayerEffect_createFlashEffectForPDFLinkAnnotation_withLayer_forType___block_invoke;
    v34 = &unk_264203F98;
    id v29 = v7;
    id v35 = v29;
    a3 = v9;
    id v36 = a3;
    [v28 setCompletionBlock:&v31];
    objc_msgSend(a3, "addAnimation:forKey:", v23, @"fadeAnimation", v31, v32, v33, v34);

    [MEMORY[0x263F158F8] commit];
    [v29 addPageLayerEffect:a3];
  }

  return a3;
}

void __78__PDFPageLayerEffect_createFlashEffectForPDFLinkAnnotation_withLayer_forType___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) UUID];
  [v1 removePageLayerEffectForID:v2];
}

- (void).cxx_destruct
{
}

@end