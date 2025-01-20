@interface WFPageRenderer
- (BOOL)includeMargin;
- (BOOL)matchInputSize;
- (CGSize)inputSize;
- (CGSize)sizeForPageAtIndex:(int64_t)a3;
- (UIPrintPageRenderer)renderer;
- (double)margin;
- (id)renderToImage;
- (void)_renderToPDF:(id)a3 startingAtPage:(int64_t)a4 endingAtPage:(int64_t)a5 completionHandler:(id)a6;
- (void)renderPDFPageIndex:(int64_t)a3 pages:(int64_t)a4 measuredIndicesByFormatter:(id)a5 drawnIndicesByFormatter:(id)a6 linkMetricsByWebView:(id)a7 y:(double)a8 paperSize:(CGSize)a9 shouldDrawPageAtIndexHandler:(id)a10 completionHandler:(id)a11;
- (void)renderToPDF:(id)a3 startingAtPage:(int64_t)a4 endingAtPage:(int64_t)a5 completionHandler:(id)a6;
- (void)setIncludeMargin:(BOOL)a3;
- (void)setInputSize:(CGSize)a3;
- (void)setMatchInputSize:(BOOL)a3;
- (void)updateRendererSize;
@end

@implementation WFPageRenderer

- (void).cxx_destruct
{
}

- (BOOL)includeMargin
{
  return self->_includeMargin;
}

- (BOOL)matchInputSize
{
  return self->_matchInputSize;
}

- (CGSize)inputSize
{
  double width = self->_inputSize.width;
  double height = self->_inputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIncludeMargin:(BOOL)a3
{
  self->_includeMargin = a3;
  [(WFPageRenderer *)self updateRendererSize];
}

- (void)setMatchInputSize:(BOOL)a3
{
  self->_matchInputSize = a3;
  [(WFPageRenderer *)self updateRendererSize];
}

- (void)setInputSize:(CGSize)a3
{
  self->_inputSize = a3;
  [(WFPageRenderer *)self updateRendererSize];
}

- (double)margin
{
  BOOL v2 = [(WFPageRenderer *)self includeMargin];
  double result = 0.0;
  if (v2) {
    return 18.0;
  }
  return result;
}

- (void)updateRendererSize
{
  if ([(WFPageRenderer *)self matchInputSize])
  {
    [(WFPageRenderer *)self inputSize];
    uint64_t v4 = v3;
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0x4088C00000000000;
    uint64_t v4 = 0x4083200000000000;
  }
  if ([(WFPageRenderer *)self includeMargin]) {
    double v7 = 18.0;
  }
  else {
    double v7 = 0.0;
  }
  renderer = self->_renderer;
  WFPageRendererClass = (objc_class *)getWFPageRendererClass();
  InstanceVariable = class_getInstanceVariable(WFPageRendererClass, "_wf_inputSize");
  v16[0] = v4;
  v16[1] = v6;
  v11 = [MEMORY[0x263F08D40] valueWithBytes:v16 objCType:"{CGSize=dd}"];
  object_setIvarWithStrongDefault(renderer, InstanceVariable, v11);

  v12 = self->_renderer;
  v13 = (objc_class *)getWFPageRendererClass();
  v14 = class_getInstanceVariable(v13, "_wf_margin");
  v15 = [NSNumber numberWithDouble:v7];
  object_setIvarWithStrongDefault(v12, v14, v15);
}

- (UIPrintPageRenderer)renderer
{
  renderer = self->_renderer;
  if (!renderer)
  {
    getWFPageRendererClass();
    uint64_t v4 = (UIPrintPageRenderer *)objc_opt_new();
    uint64_t v5 = self->_renderer;
    self->_renderer = v4;

    [(WFPageRenderer *)self updateRendererSize];
    renderer = self->_renderer;
  }
  return renderer;
}

- (id)renderToImage
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WFPageRenderer *)self renderer];
  uint64_t v4 = [v3 numberOfPages];

  uint64_t v5 = [(WFPageRenderer *)self renderer];
  [v5 printableRect];
  double v7 = v6;
  double v9 = v8;

  double v10 = 0.0;
  softLinkUIGraphicsBeginImageContextWithOptions(0, v7, v9 * (double)v4, 0.0);
  v27 = self;
  v11 = [(WFPageRenderer *)self renderer];
  objc_msgSend(v11, "prepareForDrawingPages:", 0, v4);

  v12 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  uint64_t v26 = v4;
  if (v4 >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v14 = [(WFPageRenderer *)v27 renderer];
      v15 = [v14 printFormattersForPageAtIndex:v13];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            v21 = [v12 objectForKey:v20];
            uint64_t v22 = [v21 integerValue];

            objc_msgSend(v20, "drawInRect:forPageAtIndex:", v22, 0.0, v10, v7, v9);
            v23 = [NSNumber numberWithInteger:v22 + 1];
            [v12 setObject:v23 forKey:v20];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v17);
      }

      double v10 = v9 + v10;
      ++v13;
    }
    while (v13 != v26);
  }
  v24 = softLinkUIGraphicsGetImageFromCurrentImageContext();
  softLinkUIGraphicsEndImageContext();

  return v24;
}

- (void)renderPDFPageIndex:(int64_t)a3 pages:(int64_t)a4 measuredIndicesByFormatter:(id)a5 drawnIndicesByFormatter:(id)a6 linkMetricsByWebView:(id)a7 y:(double)a8 paperSize:(CGSize)a9 shouldDrawPageAtIndexHandler:(id)a10 completionHandler:(id)a11
{
  double height = a9.height;
  double width = a9.width;
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v19 = a5;
  id v63 = a6;
  id v64 = a7;
  v20 = (uint64_t (**)(id, int64_t))a10;
  id v21 = a11;
  double v22 = height;
  double v23 = width;
  if ([(WFPageRenderer *)self matchInputSize])
  {
    id v59 = v21;
    v60 = v20;
    double v23 = *MEMORY[0x263F001B0];
    double v22 = *(double *)(MEMORY[0x263F001B0] + 8);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v24 = [(WFPageRenderer *)self renderer];
    int64_t v61 = a3;
    v25 = [v24 printFormattersForPageAtIndex:a3];

    uint64_t v26 = [v25 countByEnumeratingWithState:&v94 objects:v98 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v95 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          long long v31 = [v19 objectForKey:v30];
          uint64_t v32 = [v31 integerValue];

          [v30 rectForPageAtIndex:v32];
          if (v33 == 0.0) {
            double v34 = width;
          }
          else {
            double v34 = v33;
          }
          if (v34 >= v23) {
            double v23 = v34;
          }
          [v30 rectForPageAtIndex:v32];
          if (v35 == 0.0) {
            double v36 = height;
          }
          else {
            double v36 = v35;
          }
          if (v36 >= v22) {
            double v22 = v36;
          }
          v37 = [NSNumber numberWithInteger:v32 + 1];
          [v19 setObject:v37 forKey:v30];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v94 objects:v98 count:16];
      }
      while (v27);
    }

    a3 = v61;
    id v21 = v59;
    v20 = v60;
  }
  BOOL v38 = [(WFPageRenderer *)self includeMargin];
  uint64_t v39 = 0;
  if (v38) {
    double v40 = 18.0;
  }
  else {
    double v40 = 0.0;
  }
  uint64_t v41 = 0;
  double v42 = v23;
  double v43 = v22;
  CGRect v100 = CGRectInset(*(CGRect *)&v39, v40, v40);
  CGFloat x = v100.origin.x;
  CGFloat y = v100.origin.y;
  CGFloat v46 = v100.size.width;
  CGFloat v62 = v100.size.height;
  v47 = [(WFPageRenderer *)self renderer];
  uint64_t v48 = [v47 printFormattersForPageAtIndex:a3];
  v49 = (void *)v48;
  v50 = (void *)MEMORY[0x263EFFA68];
  if (v48) {
    v50 = (void *)v48;
  }
  id v51 = v50;

  int v52 = v20[2](v20, a3);
  char v53 = v52;
  if (v52) {
    softLinkUIGraphicsBeginPDFPageWithInfo(0, 0.0, 0.0, v23, v22);
  }
  v79[0] = MEMORY[0x263EF8330];
  v79[1] = 3221225472;
  v79[2] = __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke;
  v79[3] = &unk_2642880C8;
  id v80 = v63;
  char v93 = v53;
  CGFloat v82 = x;
  CGFloat v83 = y;
  CGFloat v84 = v46;
  CGFloat v85 = v62;
  double v86 = a8;
  uint64_t v87 = 0;
  uint64_t v88 = 0;
  double v89 = v23;
  double v90 = v22;
  double v91 = v23;
  double v92 = v22;
  id v81 = v64;
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke_4;
  v66[3] = &unk_2642880F0;
  int64_t v72 = a3;
  int64_t v73 = a4;
  v66[4] = self;
  id v67 = v19;
  id v68 = v80;
  id v69 = v81;
  double v74 = a8;
  double v75 = v23;
  double v76 = v22;
  double v77 = width;
  double v78 = height;
  v70 = v20;
  id v71 = v21;
  id v54 = v21;
  v55 = v20;
  id v56 = v81;
  id v57 = v80;
  id v58 = v19;
  objc_msgSend(v51, "if_enumerateAsynchronouslyInSequence:completionHandler:", v79, v66);
}

void __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  double v7 = a4;
  double v8 = [*(id *)(a1 + 32) objectForKey:v6];
  uint64_t v9 = [v8 integerValue];

  double v10 = *(void **)(a1 + 32);
  v11 = [NSNumber numberWithInteger:v9 + 1];
  [v10 setObject:v11 forKey:v6];

  if (*(unsigned char *)(a1 + 136))
  {
    v12 = 0;
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v12 = CGBitmapContextCreate(0, 1uLL, 1uLL, 8uLL, 4uLL, DeviceRGB, 1u);
    CGColorSpaceRelease(DeviceRGB);
    softLinkUIGraphicsPushContext((uint64_t)v12);
  }
  v14 = [(objc_class *)getUITraitCollectionClass() currentTraitCollection];
  Class UITraitCollectionClass = getUITraitCollectionClass();
  uint64_t v16 = [(objc_class *)getUITraitCollectionClass() traitCollectionWithUserInterfaceStyle:1];
  [(objc_class *)UITraitCollectionClass setCurrentTraitCollection:v16];

  if (*(double *)(a1 + 64) > 0.0 && *(double *)(a1 + 72) > 0.0) {
    objc_msgSend(v6, "drawInRect:forPageAtIndex:", v9, *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  [(objc_class *)getUITraitCollectionClass() setCurrentTraitCollection:v14];
  if (v12)
  {
    softLinkUIGraphicsPopContext();
    CGContextRelease(v12);
LABEL_16:
    v7[2](v7, 0);
    goto LABEL_17;
  }
  getUIViewPrintFormatterClass();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v17 = [v6 view];
  uint64_t v39 = 0;
  double v40 = &v39;
  uint64_t v41 = 0x2050000000;
  uint64_t v18 = (void *)getWKWebViewClass_softClass;
  uint64_t v42 = getWKWebViewClass_softClass;
  if (!getWKWebViewClass_softClass)
  {
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __getWKWebViewClass_block_invoke;
    v38[3] = &unk_26428AC60;
    v38[4] = &v39;
    __getWKWebViewClass_block_invoke((uint64_t)v38);
    uint64_t v18 = (void *)v40[3];
  }
  id v19 = v18;
  _Block_object_dispose(&v39, 8);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_16;
  }
  id v20 = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke_2;
  aBlock[3] = &unk_264288078;
  long long v21 = *(_OWORD *)(a1 + 64);
  long long v32 = *(_OWORD *)(a1 + 48);
  long long v33 = v21;
  uint64_t v34 = *(void *)(a1 + 80);
  long long v22 = *(_OWORD *)(a1 + 104);
  long long v35 = *(_OWORD *)(a1 + 88);
  long long v36 = v22;
  long long v37 = *(_OWORD *)(a1 + 120);
  long long v31 = v7;
  double v23 = (void (**)(void *, void *))_Block_copy(aBlock);
  v24 = [*(id *)(a1 + 40) objectForKey:v20];
  if (v24)
  {
    v23[2](v23, v24);
  }
  else
  {
    double v25 = *(double *)(a1 + 64);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke_3;
    v26[3] = &unk_2642880A0;
    id v27 = *(id *)(a1 + 40);
    id v28 = v20;
    long long v29 = v23;
    +[WFWebViewLinkExtractor extractLinksFromWKWebView:v28 withDestinationWidth:v26 completionHandler:v25];
  }
LABEL_17:
}

uint64_t __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 80);
  if (v1 < *(void *)(a1 + 88) - 1) {
    return objc_msgSend(*(id *)(a1 + 32), "renderPDFPageIndex:pages:measuredIndicesByFormatter:drawnIndicesByFormatter:linkMetricsByWebView:y:paperSize:shouldDrawPageAtIndexHandler:completionHandler:", v1 + 1, *(double *)(a1 + 96) + *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(void *)(a1 + 72));
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
  return v3();
}

void __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  CurrentContext = (CGContext *)softLinkUIGraphicsGetCurrentContext();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "rect", (void)v27);
        double v12 = v11;
        double v14 = v13;
        CGFloat v16 = v15;
        double v18 = v17;
        double v19 = *(double *)(a1 + 40);
        double v20 = *(double *)(a1 + 48);
        double v21 = *(double *)(a1 + 72);
        double v22 = *(double *)(a1 + 104);
        double v23 = [v10 href];
        if (v23)
        {
          double v24 = v22 - (v20 + v14 - v21) - v18;
          double v25 = *(double *)(a1 + 120);

          if (v18 + v24 < v25)
          {
            CFURLRef v26 = [v10 href];
            v33.origin.CGFloat x = v12 + v19;
            v33.origin.CGFloat y = v24;
            v33.size.double width = v16;
            v33.size.double height = v18;
            CGPDFContextSetURLForRect(CurrentContext, v26, v33);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    [*(id *)(a1 + 32) setObject:v3 forKey:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_renderToPDF:(id)a3 startingAtPage:(int64_t)a4 endingAtPage:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  double v11 = [a3 path];
  double v12 = [(WFPageRenderer *)self renderer];
  [v12 paperRect];
  softLinkUIGraphicsBeginPDFContextToFile(v11, 0, v13, v14, v15, v16);

  double v17 = [(WFPageRenderer *)self renderer];
  uint64_t v18 = [v17 numberOfPages];

  double v19 = [(WFPageRenderer *)self renderer];
  objc_msgSend(v19, "prepareForDrawingPages:", 0, v18);

  double v20 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  double v21 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  double v22 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  double v23 = [(WFPageRenderer *)self renderer];
  [v23 paperRect];
  double v25 = v24;
  double v27 = v26;

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __77__WFPageRenderer__renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke;
  v31[3] = &__block_descriptor_48_e8_B16__0q8l;
  v31[4] = a4;
  v31[5] = a5;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __77__WFPageRenderer__renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke_2;
  v29[3] = &unk_26428B068;
  id v30 = v10;
  id v28 = v10;
  -[WFPageRenderer renderPDFPageIndex:pages:measuredIndicesByFormatter:drawnIndicesByFormatter:linkMetricsByWebView:y:paperSize:shouldDrawPageAtIndexHandler:completionHandler:](self, "renderPDFPageIndex:pages:measuredIndicesByFormatter:drawnIndicesByFormatter:linkMetricsByWebView:y:paperSize:shouldDrawPageAtIndexHandler:completionHandler:", 0, v18, v20, v21, v22, v31, 0.0, v25, v27, v29);
}

BOOL __77__WFPageRenderer__renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) <= a2 && *(void *)(a1 + 40) >= a2;
}

uint64_t __77__WFPageRenderer__renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke_2(uint64_t a1)
{
  softLinkUIGraphicsEndPDFContext();
  BOOL v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

- (void)renderToPDF:(id)a3 startingAtPage:(int64_t)a4 endingAtPage:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (renderToPDF_startingAtPage_endingAtPage_completionHandler__onceToken != -1) {
    dispatch_once(&renderToPDF_startingAtPage_endingAtPage_completionHandler__onceToken, &__block_literal_global_11659);
  }
  double v12 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__WFPageRenderer_renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke_2;
  block[3] = &unk_264288030;
  block[4] = self;
  id v16 = v10;
  int64_t v18 = a4;
  int64_t v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

void __76__WFPageRenderer_renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_wait((dispatch_semaphore_t)renderToPDF_startingAtPage_endingAtPage_completionHandler__semaphore, 0xFFFFFFFFFFFFFFFFLL);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__WFPageRenderer_renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke_3;
  block[3] = &unk_264288030;
  BOOL v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  long long v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

intptr_t __76__WFPageRenderer_renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _renderToPDF:*(void *)(a1 + 40) startingAtPage:*(void *)(a1 + 56) endingAtPage:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 48)];
  uint64_t v1 = renderToPDF_startingAtPage_endingAtPage_completionHandler__semaphore;
  return dispatch_semaphore_signal(v1);
}

uint64_t __76__WFPageRenderer_renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke()
{
  renderToPDF_startingAtPage_endingAtPage_completionHandler__semaphore = (uint64_t)dispatch_semaphore_create(1);
  return MEMORY[0x270F9A758]();
}

- (CGSize)sizeForPageAtIndex:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  double v6 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  uint64_t v7 = [(WFPageRenderer *)self renderer];
  [v7 paperRect];
  double v9 = v8;
  double v11 = v10;

  double v12 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = [(WFPageRenderer *)self renderer];
  id v14 = [v13 printFormattersForPageAtIndex:a3];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        int64_t v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        double v20 = [v12 objectForKey:v19];
        uint64_t v21 = [v20 integerValue];

        [v19 rectForPageAtIndex:v21];
        if (v22 == 0.0) {
          double v23 = v9;
        }
        else {
          double v23 = v22;
        }
        if (v23 >= v6) {
          double v6 = v23;
        }
        [v19 rectForPageAtIndex:v21];
        if (v24 == 0.0) {
          double v25 = v11;
        }
        else {
          double v25 = v24;
        }
        if (v25 >= v5) {
          double v5 = v25;
        }
        double v26 = [NSNumber numberWithInteger:v21 + 1];
        [v12 setObject:v26 forKey:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v16);
  }

  double v27 = v6;
  double v28 = v5;
  result.double height = v28;
  result.double width = v27;
  return result;
}

@end