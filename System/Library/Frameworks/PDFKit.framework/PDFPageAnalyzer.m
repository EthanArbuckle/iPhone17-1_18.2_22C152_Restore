@interface PDFPageAnalyzer
+ (CGAffineTransform)_normalizedToPageTransformForPageWithBounds:(SEL)a3;
+ (PDFPageAnalyzer)sharedInstance;
- (BOOL)_addTableFromAnalysis:(id)a3 bounds:(CGRect)a4 toPDFPage:(id)a5;
- (CGPoint)_testPixelsFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 compare:(id)a5;
- (PDFPageAnalyzer)init;
- (UIEdgeInsets)_computeEdgeInsetsForQuad:(id)a3 inImage:(CGImage *)a4 background:(unsigned __int8)a5 glyphCount:(unint64_t)a6;
- (id).cxx_construct;
- (id)_detectedAnnotationWithBounds:(CGRect)a3 intersectsAnnotationOnPage:(id)a4;
- (void)_addFormElementsFromAnalysis:(id)a3 bounds:(CGRect)a4 toPage:(id)a5;
- (void)_addFormElementsUsingDetectorToPage:(id)a3 displayBox:(int64_t)a4;
- (void)_addTextFromAnalysis:(id)a3 ofImage:(id)a4 bounds:(CGRect)a5 toPage:(id)a6;
- (void)_callCompletionBlock:(id)a3 onQueue:(id)a4 analysis:(id)a5 error:(id)a6 foundTable:(BOOL)a7;
- (void)_drawTextFromAnalysis:(id)a3 ofImage:(id)a4 intoContext:(CGContext *)a5 withBounds:(CGRect)a6;
- (void)analyzePage:(id)a3 analysisTypes:(unint64_t)a4 completionQueue:(id)a5 completionBlock:(id)a6;
- (void)proposedFormFieldBoundsNearestPoint:(CGPoint)a3 onPage:(id)a4 completionBlock:(id)a5;
@end

@implementation PDFPageAnalyzer

+ (PDFPageAnalyzer)sharedInstance
{
  if (+[PDFPageAnalyzer sharedInstance]::onceToken != -1) {
    dispatch_once(&+[PDFPageAnalyzer sharedInstance]::onceToken, &__block_literal_global_3);
  }
  v2 = (void *)+[PDFPageAnalyzer sharedInstance]::sharedInstance;

  return (PDFPageAnalyzer *)v2;
}

uint64_t __33__PDFPageAnalyzer_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = +[PDFPageAnalyzer sharedInstance]::sharedInstance;
  +[PDFPageAnalyzer sharedInstance]::sharedInstance = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (PDFPageAnalyzer)init
{
  v18.receiver = self;
  v18.super_class = (Class)PDFPageAnalyzer;
  id v2 = [(PDFPageAnalyzer *)&v18 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v5 = dispatch_queue_create("PDFKit.PDFPageAnalyzer.workQueue", v4);
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    dispatch_queue_t v7 = dispatch_queue_create("PDFKit.PDFPageAnalyzer.analyzerCallbackQueue", v4);
    v8 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v7;

    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v9 = (void *)getVKImageAnalyzerClass(void)::softClass;
    uint64_t v23 = getVKImageAnalyzerClass(void)::softClass;
    if (!getVKImageAnalyzerClass(void)::softClass)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = ___ZL23getVKImageAnalyzerClassv_block_invoke;
      v19[3] = &unk_264203E48;
      v19[4] = &v20;
      ___ZL23getVKImageAnalyzerClassv_block_invoke((uint64_t)v19);
      v9 = (void *)v21[3];
    }
    v10 = v9;
    _Block_object_dispose(&v20, 8);
    uint64_t v11 = [[v10 alloc] init];
    v12 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v11;

    [*((id *)v2 + 3) setCallbackQueue:*((void *)v2 + 2)];
    dispatch_semaphore_t v13 = dispatch_semaphore_create(8);
    v14 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v13;

    uint64_t v15 = objc_opt_new();
    v16 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v15;

    *((void *)v2 + 14) = 0x4000000000000000;
  }
  return (PDFPageAnalyzer *)v2;
}

- (void)analyzePage:(id)a3 analysisTypes:(unint64_t)a4 completionQueue:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    dispatch_semaphore_t v13 = (std::mutex *)((char *)self + 48);
    std::mutex::lock((std::mutex *)((char *)self + 48));
    v14 = [v10 document];
    uint64_t v15 = [v14 indexForPage:v10];

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v17 = (void *)(v15 + 1);
    _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePage: (page #%lu) START", v18, v19, v20, v21, v22, (uint64_t)v17);
    LODWORD(v14) = [v10 didPerformOCR];
    int v23 = [v10 didPerformFormDetection];
    unint64_t v24 = a4 & 0xFFFFFFFFFFFFFFFELL;
    if (!v14) {
      unint64_t v24 = a4;
    }
    if (v23) {
      v25 = (void *)(v24 & 0xFFFFFFFFFFFFFFFDLL);
    }
    else {
      v25 = (void *)v24;
    }
    if (v25)
    {
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x2020000000;
      char v41 = 0;
      if (([*((id *)self + 5) containsObject:v10] & 1) == 0)
      {
        [*((id *)self + 5) addObject:v10];
        objc_initWeak(&location, self);
        v26 = *((void *)self + 1);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __77__PDFPageAnalyzer_analyzePage_analysisTypes_completionQueue_completionBlock___block_invoke;
        block[3] = &unk_264203D58;
        objc_copyWeak(v38, &location);
        v38[1] = v17;
        v38[2] = *(id *)&Current;
        id v27 = v10;
        v38[3] = v25;
        id v34 = v27;
        v37 = v40;
        id v36 = v12;
        id v35 = v11;
        dispatch_async(v26, block);

        objc_destroyWeak(v38);
        objc_destroyWeak(&location);
      }
      _Block_object_dispose(v40, 8);
    }
    else
    {
      [(PDFPageAnalyzer *)self _callCompletionBlock:v12 onQueue:v11 analysis:0 error:0 foundTable:0];
      CFAbsoluteTimeGetCurrent();
      _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePage (page #%lu): (analysisTypes == 0), DONE (+%g secs)", v28, v29, v30, v31, v32, (uint64_t)v17);
    }
    std::mutex::unlock(v13);
  }
}

void __77__PDFPageAnalyzer_analyzePage_analysisTypes_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  v72[2] = *MEMORY[0x263EF8340];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 64));
  WeakRetained[120] = GetDefaultsWriteDrawOCRQuads();
  uint64_t v3 = *(void *)(a1 + 72);
  CFAbsoluteTimeGetCurrent();
  _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) generating page image (+%g secs)", v4, v5, v6, v7, v8, v3);
  v9 = [*(id *)(a1 + 32) document];
  id v10 = [v9 renderingProperties];

  if (!v10) {
    id v10 = objc_opt_new();
  }
  uint64_t v11 = [v10 displayBox];
  [*(id *)(a1 + 32) boundsForBox:v11];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  double v18 = v12;
  double v19 = v13;
  double v20 = v12;
  double v21 = v13;
  if (v12 * v13 > 484704.0)
  {
    double v22 = sqrt(484704.0 / (v12 * v13));
    double v20 = v12 * v22;
    double v21 = v13 * v22;
  }
  double v23 = *((double *)WeakRetained + 14);
  v71[0] = @"PDFPageImageProperty_ColorSpace";
  CGColorSpaceRef v24 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00250]);
  v71[1] = @"PDFPageImageProperty_ForOCR";
  v72[0] = v24;
  v72[1] = MEMORY[0x263EFFA88];
  v25 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];

  v26 = objc_msgSend(*(id *)(a1 + 32), "imageOfSize:forBox:withOptions:", v11, v25, floor(v20 * v23), floor(v21 * v23));
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2050000000;
  id v27 = (void *)getVKImageAnalyzerRequestClass(void)::softClass;
  uint64_t v70 = getVKImageAnalyzerRequestClass(void)::softClass;
  if (!getVKImageAnalyzerRequestClass(void)::softClass)
  {
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = ___ZL30getVKImageAnalyzerRequestClassv_block_invoke;
    v66[3] = &unk_264203E48;
    v66[4] = &v67;
    ___ZL30getVKImageAnalyzerRequestClassv_block_invoke((uint64_t)v66);
    id v27 = (void *)v68[3];
  }
  uint64_t v28 = v27;
  _Block_object_dispose(&v67, 8);
  uint64_t v29 = (void *)[[v28 alloc] initWithImage:v26 requestType:1];
  objc_msgSend(v29, "set_wantsFormFieldDetection:", (*(void *)(a1 + 88) & 6) != 0);
  CFAbsoluteTimeGetCurrent();
  dispatch_semaphore_wait(*((dispatch_semaphore_t *)WeakRetained + 4), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v30 = *(void *)(a1 + 72);
  CFAbsoluteTimeGetCurrent();
  CFAbsoluteTimeGetCurrent();
  _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) GOT workload semaphore after (%g) sec wait (+%g secs)", v31, v32, v33, v34, v35, v30);
  uint64_t v36 = *(void *)(a1 + 72);
  CFAbsoluteTimeGetCurrent();
  _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) Analyzer request BEGIN (+%g secs)", v37, v38, v39, v40, v41, v36);
  v42 = (void *)*((void *)WeakRetained + 3);
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __77__PDFPageAnalyzer_analyzePage_analysisTypes_completionQueue_completionBlock___block_invoke_2;
  v53[3] = &unk_264203D30;
  uint64_t v43 = *(void *)(a1 + 72);
  v53[4] = WeakRetained;
  uint64_t v58 = v43;
  uint64_t v59 = *(void *)(a1 + 80);
  uint64_t v60 = *(void *)(a1 + 88);
  id v44 = v26;
  id v54 = v44;
  uint64_t v61 = v15;
  uint64_t v62 = v17;
  double v63 = v18;
  double v64 = v19;
  id v55 = *(id *)(a1 + 32);
  uint64_t v65 = v11;
  long long v52 = *(_OWORD *)(a1 + 48);
  id v45 = (id)v52;
  long long v57 = v52;
  id v56 = *(id *)(a1 + 40);
  if (![v42 processRequest:v29 progressHandler:0 completionHandler:v53])
  {
    uint64_t v46 = *(void *)(a1 + 72);
    CFAbsoluteTimeGetCurrent();
    _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu)  [VKImageAnalyzer processRequest:] returned 0(+%g secs)", v47, v48, v49, v50, v51, v46);
    std::mutex::lock((std::mutex *)(WeakRetained + 48));
    [*((id *)WeakRetained + 5) removeObject:*(void *)(a1 + 32)];
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)WeakRetained + 4));
    std::mutex::unlock((std::mutex *)(WeakRetained + 48));
  }
}

void __77__PDFPageAnalyzer_analyzePage_analysisTypes_completionQueue_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v46 = a2;
  id v5 = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 32));
  uint64_t v6 = *(void *)(a1 + 80);
  if (v46)
  {
    CFAbsoluteTimeGetCurrent();
    _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) Analyzer request COMPLETED (+%g secs)", v7, v8, v9, v10, v11, v6);
    uint64_t v12 = *(void *)(a1 + 96);
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "_addTextFromAnalysis:ofImage:bounds:toPage:", v46, *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
      [*(id *)(a1 + 48) setDidPerformOCR:1];
      uint64_t v13 = *(void *)(a1 + 80);
      CFAbsoluteTimeGetCurrent();
      _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) OCR digestion COMPLETED (+%g secs)", v14, v15, v16, v17, v18, v13);
      uint64_t v12 = *(void *)(a1 + 96);
    }
    if ((v12 & 2) != 0)
    {
      id v19 = (id)[*(id *)(a1 + 48) annotations];
      int IsVisionKitFormDetectionEnabled = PDFKitIsVisionKitFormDetectionEnabled();
      double v21 = *(void **)(a1 + 32);
      if (IsVisionKitFormDetectionEnabled)
      {
        objc_msgSend(v21, "_addFormElementsFromAnalysis:bounds:toPage:", v46, *(void *)(a1 + 48), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_addTableFromAnalysis:bounds:toPDFPage:", v46, *(void *)(a1 + 48), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
      }
      else
      {
        [v21 _addFormElementsUsingDetectorToPage:*(void *)(a1 + 48) displayBox:*(void *)(a1 + 136)];
      }
      uint64_t v27 = *(void *)(a1 + 80);
      CFAbsoluteTimeGetCurrent();
      _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) Form detection COMPLETED (+%g secs)", v28, v29, v30, v31, v32, v27);
      [*(id *)(a1 + 48) setDidPerformFormDetection:1];
      uint64_t v12 = *(void *)(a1 + 96);
    }
    if ((v12 & 4) != 0)
    {
      uint64_t v33 = *(void *)(a1 + 80);
      CFAbsoluteTimeGetCurrent();
      _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) Minimal analysis COMPLETED (+%g secs)", v34, v35, v36, v37, v38, v33);
    }
    [*(id *)(a1 + 32) _callCompletionBlock:*(void *)(a1 + 64) onQueue:*(void *)(a1 + 56) analysis:v46 error:0 foundTable:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    uint64_t v39 = *(void *)(a1 + 80);
    CFAbsoluteTimeGetCurrent();
    _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) Completion block COMPLETED (+%g secs)", v40, v41, v42, v43, v44, v39);
  }
  else
  {
    CFAbsoluteTimeGetCurrent();
    _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) Analyzer request FAILED (+%g secs)", v22, v23, v24, v25, v26, v6);
    [*(id *)(a1 + 32) _callCompletionBlock:*(void *)(a1 + 64) onQueue:*(void *)(a1 + 56) analysis:0 error:v5 foundTable:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  }
  id v45 = (std::mutex *)(*(void *)(a1 + 32) + 48);
  std::mutex::lock(v45);
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 48)];
  std::mutex::unlock(v45);
}

- (void)proposedFormFieldBoundsNearestPoint:(CGPoint)a3 onPage:(id)a4 completionBlock:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  id v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x5012000000;
  v21[3] = __Block_byref_object_copy_;
  v21[4] = __Block_byref_object_dispose_;
  v21[5] = &unk_21442F44B;
  long long v11 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
  long long v22 = *MEMORY[0x263F001A0];
  long long v23 = v11;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__PDFPageAnalyzer_proposedFormFieldBoundsNearestPoint_onPage_completionBlock___block_invoke;
  v14[3] = &unk_264203DA8;
  id v15 = v9;
  uint64_t v16 = self;
  CGFloat v19 = x;
  CGFloat v20 = y;
  id v17 = v10;
  uint64_t v18 = v21;
  id v12 = v10;
  id v13 = v9;
  [(PDFPageAnalyzer *)self analyzePage:v13 analysisTypes:4 completionQueue:0 completionBlock:v14];

  _Block_object_dispose(v21, 8);
}

void __78__PDFPageAnalyzer_proposedFormFieldBoundsNearestPoint_onPage_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && !v6)
  {
    uint64_t v8 = [*(id *)(a1 + 32) document];
    id v9 = [v8 renderingProperties];

    if (!v9) {
      id v9 = objc_opt_new();
    }
    objc_msgSend(*(id *)(a1 + 32), "boundsForBox:", objc_msgSend(v9, "displayBox"));
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    memset(&v57, 0, sizeof(v57));
    uint64_t v18 = objc_opt_class();
    if (v18) {
      objc_msgSend(v18, "_normalizedToPageTransformForPageWithBounds:", v11, v13, v15, v17);
    }
    else {
      memset(&v57, 0, sizeof(v57));
    }
    double v49 = v17;
    double v50 = v15;
    CGAffineTransform v55 = v57;
    memset(&v56, 0, sizeof(v56));
    CGAffineTransformInvert(&v56, &v55);
    double v19 = *(double *)(a1 + 64);
    double v20 = *(double *)(a1 + 72);
    double a = v56.a;
    double b = v56.b;
    double c = v56.c;
    double d = v56.d;
    tCGFloat x = v56.tx;
    tCGFloat y = v56.ty;
    v58.CGFloat x = v19;
    v58.CGFloat y = v20;
    uint64_t v27 = NSStringFromPoint(v58);
    CGFloat v28 = ty + v20 * d + b * v19;
    CGFloat v29 = tx + v20 * c + a * v19;
    v59.CGFloat x = v29;
    v59.CGFloat y = v28;
    uint64_t v48 = NSStringFromPoint(v59);
    _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"proposedFormField: pagePoint = %@, normalizedPoint = %@", v30, v31, v32, v33, v34, (uint64_t)v27);

    double v35 = PDFPointScale(v50, v49, *(double *)(*(void *)(a1 + 40) + 112));
    uint64_t v37 = objc_msgSend(v5, "proposedFormRegionForPoint:existingFields:formSize:", 0, v29, v28, v35, v36);
    uint64_t v38 = v37;
    if (v37)
    {
      uint64_t v39 = [v37 quad];
      [v39 boundingBox];
      CGAffineTransform v54 = v57;
      *(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8) + 48) = CGRectApplyAffineTransform(v60, &v54);

      uint64_t v40 = NSStringFromRect(*(NSRect *)(*(void *)(*(void *)(a1 + 56) + 8) + 48));
      _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"proposedFormField: formRegion bounds: %@", v41, v42, v43, v44, v45, (uint64_t)v40);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__PDFPageAnalyzer_proposedFormFieldBoundsNearestPoint_onPage_completionBlock___block_invoke_2;
  block[3] = &unk_264203D80;
  id v46 = *(id *)(a1 + 48);
  uint64_t v47 = *(void *)(a1 + 56);
  id v52 = v46;
  uint64_t v53 = v47;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __78__PDFPageAnalyzer_proposedFormFieldBoundsNearestPoint_onPage_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double, double, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 64), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 72));
}

- (void)_callCompletionBlock:(id)a3 onQueue:(id)a4 analysis:(id)a5 error:(id)a6 foundTable:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  double v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __74__PDFPageAnalyzer__callCompletionBlock_onQueue_analysis_error_foundTable___block_invoke;
      v15[3] = &unk_264203DD0;
      id v18 = v11;
      id v16 = v13;
      id v17 = v14;
      BOOL v19 = v7;
      dispatch_async(v12, v15);
    }
    else
    {
      (*((void (**)(id, id, id, BOOL))v11 + 2))(v11, v13, v14, v7);
    }
  }
}

uint64_t __74__PDFPageAnalyzer__callCompletionBlock_onQueue_analysis_error_foundTable___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

- (void)_addTextFromAnalysis:(id)a3 ofImage:(id)a4 bounds:(CGRect)a5 toPage:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = (CGPDFDictionary *)CGDisplayListCreate();
  value[7] = v16;
  id v17 = (CGPDFDictionary *)CGDisplayListContextCreate();
  value[6] = v17;
  -[PDFPageAnalyzer _drawTextFromAnalysis:ofImage:intoContext:withBounds:](self, "_drawTextFromAnalysis:ofImage:intoContext:withBounds:", v13, v14, v17, x, y, width, height);
  CGContextFlush(v17);
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  value[5] = Mutable;
  BOOL v19 = CGDataConsumerCreateWithCFData(Mutable);
  value[4] = v19;
  double v20 = CGPDFContextCreate(v19, 0, 0);
  value[3] = v20;
  CGPDFContextBeginPage(v20, 0);
  CGContextDrawDisplayList();
  CGPDFContextEndPage(v20);
  CGPDFContextClose(v20);
  double v21 = CGDataProviderCreateWithCFData(Mutable);
  value[2] = v21;
  long long v22 = CGPDFDocumentCreateWithProvider(v21);
  value[1] = v22;
  Page = CGPDFDocumentGetPage(v22, 1uLL);
  Dictionardouble y = CGPDFPageGetDictionary(Page);
  value[0] = 0;
  if (CGPDFDictionaryGetDictionary(Dictionary, "Resources", value))
  {
    CGPDFDictionaryRef dict = 0;
    if (CGPDFDictionaryGetDictionary(value[0], "XObject", &dict))
    {
      CGPDFStreamRef stream = 0;
      if (CGPDFDictionaryGetStream(dict, "Fm1", &stream))
      {
        CGPDFStreamGetDictionary(stream);
        [v15 setExtraContentStream:stream steamDocument:v22];
      }
    }
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v16) {
    CFRelease(v16);
  }
}

- (BOOL)_addTableFromAnalysis:(id)a3 bounds:(CGRect)a4 toPDFPage:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v56 = a3;
  id v55 = a5;
  memset(&v73, 0, sizeof(v73));
  double v10 = objc_opt_class();
  if (v10) {
    objc_msgSend(v10, "_normalizedToPageTransformForPageWithBounds:", x, y, width, height);
  }
  else {
    memset(&v73, 0, sizeof(v73));
  }
  CGAffineTransform v54 = [v56 layoutComponents];
  CGAffineTransform v57 = objc_opt_new();
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = v54;
  uint64_t v60 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v60)
  {
    uint64_t v59 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v60; ++i)
      {
        if (*(void *)v70 != v59) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        if ([v11 type] == 64)
        {
          double v12 = [v11 boundingQuad];
          [v12 boundingBox];
          CGFloat v14 = v13;
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          CGFloat v20 = v19;

          CGAffineTransform v68 = v73;
          v77.origin.double x = v14;
          v77.origin.double y = v16;
          v77.size.double width = v18;
          v77.size.double height = v20;
          CGRect v78 = CGRectApplyAffineTransform(v77, &v68);
          double v21 = v78.origin.x;
          double v22 = v78.origin.y;
          double v23 = v78.size.width;
          double v24 = v78.size.height;
          uint64_t v61 = objc_opt_new();
          uint64_t v25 = objc_opt_new();
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          uint64_t v26 = [v11 children];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v64 objects:v74 count:16];
          if (v27)
          {
            uint64_t v28 = *(void *)v65;
            do
            {
              for (uint64_t j = 0; j != v27; ++j)
              {
                if (*(void *)v65 != v28) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v30 = *(void **)(*((void *)&v64 + 1) + 8 * j);
                uint64_t v31 = objc_opt_new();
                uint64_t v32 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v30, "rowRange"));
                [v31 setValue:v32 forKey:@"Row Index"];

                uint64_t v33 = [v30 boundingQuad];
                [v33 boundingBox];
                CGFloat v35 = v34;
                CGFloat v37 = v36;
                CGFloat v39 = v38;
                CGFloat v41 = v40;

                CGAffineTransform v63 = v73;
                v79.origin.double x = v35;
                v79.origin.double y = v37;
                v79.size.double width = v39;
                v79.size.double height = v41;
                CGRect v80 = CGRectApplyAffineTransform(v79, &v63);
                uint64_t v42 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v80.origin.x, v80.origin.y, v80.size.width, v80.size.height);
                [v31 setValue:v42 forKey:@"Rect"];

                [v25 addObject:v31];
              }
              uint64_t v27 = [v26 countByEnumeratingWithState:&v64 objects:v74 count:16];
            }
            while (v27);
          }

          uint64_t v43 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v21, v22, v23, v24);
          [v61 setValue:v43 forKey:@"Rect"];

          [v61 setValue:v25 forKey:@"Cells"];
          [v57 addObject:v61];
        }
      }
      uint64_t v60 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
    }
    while (v60);
  }

  if ([v57 count])
  {
    CFAbsoluteTimeGetCurrent();
    [v55 pageRef];
    id v44 = v57;
    insertedouble d = CGPDFPageInsertTableDescriptions();
    id v46 = [v55 document];
    uint64_t v47 = [v46 indexForPage:v55];
    CFAbsoluteTimeGetCurrent();
    _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"table insertion for page: (page #%lu) COMPLETED (+%g secs)", v48, v49, v50, v51, v52, v47 + 1);
  }
  else
  {
    insertedouble d = 0;
  }

  return inserted;
}

- (void)_drawTextFromAnalysis:(id)a3 ofImage:(id)a4 intoContext:(CGContext *)a5 withBounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v82 = a3;
  id v80 = a4;
  [v80 size];
  CGFloat v14 = v13;
  double v16 = v15;
  CGAffineTransformMakeTranslation(&v114, 0.0, v15);
  CGAffineTransform v112 = v114;
  CGAffineTransformScale(&v113, &v112, v14, -v16);
  CGAffineTransform v114 = v113;
  memset(&v113, 0, sizeof(v113));
  double v17 = objc_opt_class();
  if (v17) {
    objc_msgSend(v17, "_normalizedToPageTransformForPageWithBounds:", x, y, width, height);
  }
  else {
    memset(&v113, 0, sizeof(v113));
  }
  v99 = self;
  id v81 = v80;
  uint64_t v93 = [v81 CGImage];
  CGContextSaveGState(a5);
  v111[0] = 0;
  v111[1] = 0;
  v110 = (uint64_t *)v111;
  CGColorRef SRGB = CGColorCreateSRGB(1.0, 0.0, 0.0, 0.0);
  [v82 allLines];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v85 = [obj countByEnumeratingWithState:&v106 objects:v118 count:16];
  if (v85)
  {
    uint64_t v84 = *(void *)v107;
    uint64_t v91 = *MEMORY[0x263F03C60];
    uint64_t v92 = *MEMORY[0x263F039A0];
    allodouble c = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    do
    {
      for (uint64_t i = 0; i != v85; ++i)
      {
        if (*(void *)v107 != v84) {
          objc_enumerationMutation(obj);
        }
        CGFloat v18 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        v86 = [v18 children];
        v97 = [v86 lastObject];
        double v19 = [v18 quad];
        v87 = quadTransformedWithAffineTransform(v19, &v113.a);

        [v87 bottomLeft];
        double v21 = v20;
        double v23 = v22;
        [v87 bottomRight];
        long double angle = atan2(v24 - v23, v25 - v21);
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        id v89 = v86;
        uint64_t v26 = [v89 countByEnumeratingWithState:&v102 objects:v117 count:16];
        if (v26)
        {
          uint64_t v95 = *(void *)v103;
          do
          {
            uint64_t v98 = v26;
            for (uint64_t j = 0; j != v98; ++j)
            {
              if (*(void *)v103 != v95) {
                objc_enumerationMutation(v89);
              }
              uint64_t v28 = *(void **)(*((void *)&v102 + 1) + 8 * j);
              CGFloat v29 = [v28 quad];
              uint64_t v30 = quadTransformedWithAffineTransform(v29, &v113.a);

              [v30 bottomLeft];
              CGFloat v32 = v31;
              CGFloat v34 = v33;
              [v30 bottomRight];
              CGFloat v36 = v35;
              CGFloat v38 = v37;
              [v30 sideLength];
              double v40 = v39;
              double v43 = (v41 + v42) * 0.5;
              double v101 = round(v43 * 10.0) / 10.0;
              id v44 = [v28 string];
              uint64_t v45 = [v44 length];

              id v46 = [v28 quad];
              uint64_t v47 = quadTransformedWithAffineTransform(v46, &v114.a);

              [(PDFPageAnalyzer *)v99 _computeEdgeInsetsForQuad:v47 inImage:v93 background:0 glyphCount:v45];
              PDFRectScale(v48, v49, v50, v51, 1.0 / *((double *)v99 + 14));
              double v53 = v52;
              double v55 = v54;
              id v56 = (double *)v111[0];
              if (!v111[0]) {
                goto LABEL_24;
              }
              CGAffineTransform v57 = (double *)v111;
              do
              {
                NSPoint v58 = v56;
                uint64_t v59 = v57;
                double v60 = v56[4];
                if (v60 >= v101) {
                  CGAffineTransform v57 = v56;
                }
                else {
                  ++v56;
                }
                id v56 = *(double **)v56;
              }
              while (v56);
              if (v57 == (double *)v111) {
                goto LABEL_24;
              }
              if (v60 < v101) {
                NSPoint v58 = v59;
              }
              if (v101 >= v58[4])
              {
                uint64_t v61 = (void *)*((void *)v57 + 5);
              }
              else
              {
LABEL_24:
                CFTypeRef cf = CTFontCreateWithName(@"Times-Roman", v101, 0);
                std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::__emplace_unique_key_args<double,double &,applesauce::CF::ObjectRef<__CTFont const*>&>(&v110, &v101, &v101, &cf);
                uint64_t v61 = cf;
                if (cf) {
                  CFRelease(cf);
                }
              }
              uint64_t v62 = [v28 string];
              CGAffineTransform v63 = v62;
              if (v28 == v97) {
                long long v64 = @"\n";
              }
              else {
                long long v64 = @" ";
              }
              long long v65 = [v62 stringByAppendingString:v64];

              v115[0] = v92;
              v115[1] = v91;
              v116[0] = v61;
              v116[1] = SRGB;
              CFDictionaryRef v66 = [NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:2];
              CFAttributedStringRef v67 = CFAttributedStringCreate(alloc, v65, v66);
              CGAffineTransform v68 = CTLineCreateWithAttributedString(v67);
              CTLineRef JustifiedLine = CTLineCreateJustifiedLine(v68, 1.0, v40 - (v53 + v55));
              CGContextSaveGState(a5);
              CGContextTranslateCTM(a5, v32, v34);
              CGContextRotateCTM(a5, angle);
              CGContextTranslateCTM(a5, v53, v43 * 0.18);
              CGContextSetTextPosition(a5, 0.0, 0.0);
              if (JustifiedLine) {
                long long v70 = JustifiedLine;
              }
              else {
                long long v70 = v68;
              }
              CTLineDraw(v70, a5);
              CGContextRestoreGState(a5);
              if (*((unsigned char *)v99 + 120))
              {
                [v30 topLeft];
                CGFloat v72 = v71;
                CGFloat v74 = v73;
                [v30 topRight];
                CGFloat v76 = v75;
                CGFloat v78 = v77;
                CGMutablePathRef Mutable = CGPathCreateMutable();
                CFTypeRef cf = Mutable;
                CGPathMoveToPoint(Mutable, 0, v72, v74);
                CGPathAddLineToPoint(Mutable, 0, v76, v78);
                CGPathAddLineToPoint(Mutable, 0, v36, v38);
                CGPathAddLineToPoint(Mutable, 0, v32, v34);
                CGPathCloseSubpath(Mutable);
                CGContextAddPath(a5, Mutable);
                CGContextSaveGState(a5);
                CGContextStrokePath(a5);
                CGContextRestoreGState(a5);
                if (Mutable) {
                  CFRelease(Mutable);
                }
              }
              if (JustifiedLine) {
                CFRelease(JustifiedLine);
              }
              if (v68) {
                CFRelease(v68);
              }
              if (v67) {
                CFRelease(v67);
              }
            }
            uint64_t v26 = [v89 countByEnumeratingWithState:&v102 objects:v117 count:16];
          }
          while (v26);
        }
      }
      uint64_t v85 = [obj countByEnumeratingWithState:&v106 objects:v118 count:16];
    }
    while (v85);
  }

  CGContextRestoreGState(a5);
  std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::destroy((uint64_t)&v110, v111[0]);
  if (SRGB) {
    CFRelease(SRGB);
  }
}

- (CGPoint)_testPixelsFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 compare:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  id v9 = (uint64_t (**)(id, uint64_t, uint64_t))a5;
  uint64_t v10 = (int)v8;
  uint64_t v11 = (int)v7;
  int v12 = (int)x;
  int v13 = (int)y;
  if ((int)x > (int)v10) {
    int v14 = 1;
  }
  else {
    int v14 = -1;
  }
  int v29 = v14;
  if (v12 - (int)v10 >= 0) {
    int v15 = (int)x - v10;
  }
  else {
    int v15 = v10 - (int)x;
  }
  if (v13 > (int)v11) {
    int v16 = 1;
  }
  else {
    int v16 = -1;
  }
  if (v13 - (int)v11 >= 0) {
    int v17 = v13 - v11;
  }
  else {
    int v17 = v11 - v13;
  }
  int v18 = -v17;
  int v19 = v15 - v17;
  while ((v9[2](v9, v10, v11) & 1) != 0)
  {
    if (v10 == v12 && v11 == (int)y) {
      goto LABEL_30;
    }
    int v20 = 2 * v19;
    int v21 = v29;
    if (2 * v19 < v18) {
      int v21 = 0;
    }
    uint64_t v10 = (v21 + v10);
    if (v20 >= v18) {
      int v22 = v17;
    }
    else {
      int v22 = 0;
    }
    int v23 = v19 - v22;
    BOOL v24 = v20 <= v15;
    if (v20 <= v15) {
      int v25 = v16;
    }
    else {
      int v25 = 0;
    }
    uint64_t v11 = (v25 + v11);
    if (v24) {
      int v26 = v15;
    }
    else {
      int v26 = 0;
    }
    int v19 = v23 + v26;
  }
  double x = (double)(int)v10;
  double y = (double)(int)v11;
LABEL_30:

  double v27 = x;
  double v28 = y;
  result.double y = v28;
  result.double x = v27;
  return result;
}

- (UIEdgeInsets)_computeEdgeInsetsForQuad:(id)a3 inImage:(CGImage *)a4 background:(unsigned __int8)a5 glyphCount:(unint64_t)a6
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v9 = a3;
  CGBuf::CGBuf((CGBuf *)v54, a4);
  BOOL v10 = v57 <= 1u && v56 == 8;
  if (!v10 || (v55 & 0x1Fu) - 1 <= 3)
  {
    NSLog(&cfstr_SInvalidImageM.isa, "-[PDFPageAnalyzer _computeEdgeInsetsForQuad:inImage:background:glyphCount:]");
LABEL_8:
    double v11 = *MEMORY[0x263F834E8];
    double v12 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v13 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v14 = *(double *)(MEMORY[0x263F834E8] + 24);
    goto LABEL_9;
  }
  if (!v54[3] || !v54[4])
  {
    NSLog(&cfstr_SInvalidImageM_0.isa, "-[PDFPageAnalyzer _computeEdgeInsetsForQuad:inImage:background:glyphCount:]");
    goto LABEL_8;
  }
  size_t Height = CGImageGetHeight(a4);
  double v20 = *MEMORY[0x263F834E8];
  double v21 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v13 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v22 = *(double *)(MEMORY[0x263F834E8] + 24);
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3321888768;
  v52[2] = __75__PDFPageAnalyzer__computeEdgeInsetsForQuad_inImage_background_glyphCount___block_invoke;
  v52[3] = &__block_descriptor_361_ea8_32c10_ZTS5CGBuf_e11_B16__0i8i12l;
  CGBuf::CGBuf((CGBuf *)v53, (const CGBuf *)v54);
  v53[328] = a5;
  int v23 = _Block_copy(v52);
  double v51 = v21;
  MEMORY[0x270FA5388]();
  divideQuadSideIntoSegments(v9, 0, v48);
  MEMORY[0x270FA5388]();
  divideQuadSideIntoSegments(v9, 1, v47);
  double v50 = v22;
  uint64_t v24 = 0;
  double v25 = (double)Height;
  double v26 = 1.79769313e308;
  do
  {
    double v27 = v48[v24];
    double v28 = v25 - v48[v24 + 1];
    double v29 = v47[v24];
    double v30 = v25 - v47[v24 + 1];
    -[PDFPageAnalyzer _testPixelsFromPoint:toPoint:compare:](self, "_testPixelsFromPoint:toPoint:compare:", v23, v27, v28, v29, v30);
    if (v31 != v29 || v32 != v30)
    {
      double v34 = (v32 - v28) * (v32 - v28) + (v31 - v27) * (v31 - v27);
      if (v26 >= v34) {
        double v26 = v34;
      }
    }
    v24 += 2;
  }
  while (v24 != 12);
  double v49 = v20;
  uint64_t v35 = 0;
  double v36 = sqrt(v26);
  double v37 = 1.79769313e308;
  if (v26 == 1.79769313e308) {
    double v12 = v51;
  }
  else {
    double v12 = v36;
  }
  do
  {
    double v38 = v47[v35];
    double v39 = v25 - v47[v35 + 1];
    double v40 = v48[v35];
    double v41 = v25 - v48[v35 + 1];
    -[PDFPageAnalyzer _testPixelsFromPoint:toPoint:compare:](self, "_testPixelsFromPoint:toPoint:compare:", v23, v38, v39, v40, v41);
    if (v42 != v40 || v43 != v41)
    {
      double v45 = (v43 - v39) * (v43 - v39) + (v42 - v38) * (v42 - v38);
      if (v37 >= v45) {
        double v37 = v45;
      }
    }
    v35 += 2;
  }
  while (v35 != 12);
  double v46 = sqrt(v37);
  if (v37 == 1.79769313e308) {
    double v14 = v50;
  }
  else {
    double v14 = v46;
  }

  double v11 = v49;
  CGBuf::~CGBuf((CGBuf *)v53);
LABEL_9:
  CGBuf::~CGBuf((CGBuf *)v54);

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

BOOL __75__PDFPageAnalyzer__computeEdgeInsetsForQuad_inImage_background_glyphCount___block_invoke(uint64_t a1, int a2, int a3)
{
  if (*(void *)(a1 + 64) <= (unint64_t)a3) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v3 = *(void *)(v3 + 32);
  }
  uint64_t v4 = *(void *)(a1 + 72) * a3;
  if (!v3) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4 + v3;
  if (!v5 || *(void *)(a1 + 56) <= (unint64_t)a2) {
    return 0;
  }
  int v6 = *(unsigned __int8 *)(v5 + a2) - *(unsigned __int8 *)(a1 + 360);
  if (v6 < 0) {
    int v6 = -v6;
  }
  return v6 > 0x7F;
}

- (id)_detectedAnnotationWithBounds:(CGRect)a3 intersectsAnnotationOnPage:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  id v9 = &v35;
  double v34 = (uint64_t *)&v35;
  [v8 annotations];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v10);
        }
        double v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        [v14 bounds];
        v43.origin.CGFloat x = v15;
        v43.origin.CGFloat y = v16;
        double v18 = v17;
        double v20 = v19;
        v41.origin.CGFloat x = x;
        v41.origin.CGFloat y = y;
        v41.size.CGFloat width = width;
        v41.size.CGFloat height = height;
        v43.size.CGFloat width = v18;
        v43.size.CGFloat height = v20;
        CGRect v42 = CGRectIntersection(v41, v43);
        double v21 = v42.size.width;
        double v22 = v42.size.height;
        if (!CGRectIsNull(v42))
        {
          double v29 = v21 * v22 / (v18 * v20);
          double v37 = &v29;
          int v23 = std::__tree<std::__value_type<double,PDFAnnotation * {__strong}>,std::__map_value_compare<double,std::__value_type<double,PDFAnnotation * {__strong}>,std::less<double>,true>,std::allocator<std::__value_type<double,PDFAnnotation * {__strong}>>>::__emplace_unique_key_args<double,std::piecewise_construct_t const&,std::tuple<double const&>,std::tuple<>>(&v34, &v29, (uint64_t)&std::piecewise_construct, (uint64_t **)&v37);
          objc_storeStrong((id *)v23 + 5, v14);
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v11);
  }

  if (!v36) {
    goto LABEL_16;
  }
  uint64_t v24 = v35;
  if (v35)
  {
    do
    {
      double v25 = v24;
      uint64_t v24 = (void *)v24[1];
    }
    while (v24);
  }
  else
  {
    do
    {
      double v25 = v9[2];
      BOOL v26 = *v25 == (void)v9;
      id v9 = (void **)v25;
    }
    while (v26);
  }
  if (*((double *)v25 + 4) > 0.5) {
    id v27 = (id)v25[5];
  }
  else {
LABEL_16:
  }
    id v27 = 0;

  std::__tree<std::__value_type<double,PDFAnnotation * {__strong}>,std::__map_value_compare<double,std::__value_type<double,PDFAnnotation * {__strong}>,std::less<double>,true>,std::allocator<std::__value_type<double,PDFAnnotation * {__strong}>>>::destroy((uint64_t)&v34, v35);

  return v27;
}

- (void)_addFormElementsFromAnalysis:(id)a3 bounds:(CGRect)a4 toPage:(id)a5
{
  double width = a4.size.width;
  double height = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v54 = a3;
  id v7 = a5;
  double v53 = [v7 annotations];
  int v55 = [MEMORY[0x263EFF980] array];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  obuint64_t j = v53;
  uint64_t v8 = [obj countByEnumeratingWithState:&v90 objects:v96 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v91 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        if ([v11 isSynthesizedFormField])
        {
          uint64_t v12 = [v11 contents];
          BOOL v13 = [v12 length] == 0;

          if (v13) {
            [v55 addObject:v11];
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v90 objects:v96 count:16];
    }
    while (v8);
  }

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v62 = v55;
  uint64_t v14 = [v62 countByEnumeratingWithState:&v86 objects:v95 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v87;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v87 != v15) {
          objc_enumerationMutation(v62);
        }
        [v7 removeAnnotation:*(void *)(*((void *)&v86 + 1) + 8 * j)];
      }
      uint64_t v14 = [v62 countByEnumeratingWithState:&v86 objects:v95 count:16];
    }
    while (v14);
  }

  unint64_t v17 = [v54 recognitionConfidence];
  if (v17 < 3) {
    [v7 setDetectedFormFieldsRecognitionConfidence:v17 + 1];
  }
  uint64_t v61 = [MEMORY[0x263EFF980] array];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v83 = 0u;
  double v18 = objc_opt_class();
  if (v18)
  {
    objc_msgSend(v18, "_normalizedToPageTransformForPageWithBounds:", x, y, width, height);
  }
  else
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v83 = 0u;
  }
  double v19 = (void *)MEMORY[0x263F82760];
  double v20 = +[PDFAnnotation detectedFormFieldDefaultFontName];
  +[PDFAnnotation detectedFormFieldDefaultFontSize];
  uint64_t v59 = objc_msgSend(v19, "fontWithName:size:", v20);

  double v21 = (void *)MEMORY[0x263F82760];
  +[PDFAnnotation detectedFormFieldDefaultFontSize];
  double v60 = objc_msgSend(v21, "monospacedSystemFontOfSize:weight:");
  double v22 = [v7 annotations];
  int v23 = [v54 formRegionsExcluding:v22 updateExcludedFields:1];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v24 = v23;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v79 objects:v94 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v80;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v80 != v26) {
          objc_enumerationMutation(v24);
        }
        double v28 = *(void **)(*((void *)&v79 + 1) + 8 * v27);
        id v29 = [v28 quad];
        [v29 topLeft];
        double v31 = v30;
        double v33 = v32;
        [v29 topRight];
        double v35 = v34;
        double v37 = v36;
        [v29 bottomLeft];
        double v39 = v38;
        double v41 = v40;
        [v29 bottomRight];
        if (v33 != v37 || v41 != v43)
        {

LABEL_41:
          goto LABEL_42;
        }
        BOOL v45 = v35 == v42 && v31 == v39;

        if (v45)
        {
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 3221225472;
          aBlock[2] = __62__PDFPageAnalyzer__addFormElementsFromAnalysis_bounds_toPage___block_invoke;
          aBlock[3] = &unk_264203DF8;
          long long v72 = v83;
          long long v73 = v84;
          long long v74 = v85;
          id v68 = v60;
          id v69 = v59;
          double v75 = x;
          double v76 = y;
          double v77 = width;
          double v78 = height;
          id v46 = v7;
          id v70 = v46;
          id v71 = v61;
          uint64_t v47 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
          if ([v28 fieldType] == 1 || objc_msgSend(v28, "fieldType") == 2)
          {
            id v48 = (id)v47[2](v47, v28);
          }
          else if (![v28 fieldType])
          {
            double v49 = [v28 children];
            id v50 = objc_alloc_init(MEMORY[0x263EFF9B0]);
            v64[0] = MEMORY[0x263EF8330];
            v64[1] = 3221225472;
            v64[2] = __62__PDFPageAnalyzer__addFormElementsFromAnalysis_bounds_toPage___block_invoke_2;
            v64[3] = &unk_264203E20;
            CFDictionaryRef v66 = v47;
            id v51 = v50;
            id v65 = v51;
            [v49 enumerateObjectsUsingBlock:v64];
            if ([v51 count]) {
              [v46 addFormFieldGroup:v51];
            }
          }
          id v29 = v68;
          goto LABEL_41;
        }
LABEL_42:
        ++v27;
      }
      while (v25 != v27);
      uint64_t v52 = [v24 countByEnumeratingWithState:&v79 objects:v94 count:16];
      uint64_t v25 = v52;
    }
    while (v52);
  }

  if ([v61 count] && objc_msgSend(v61, "count")) {
    [v7 addDetectedAnnotations:v61];
  }
}

id __62__PDFPageAnalyzer__addFormElementsFromAnalysis_bounds_toPage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 quad];
  [v4 boundingBox];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;

  long long v13 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v31.double a = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v31.double c = v13;
  *(_OWORD *)&v31.tdouble x = *(_OWORD *)(a1 + 96);
  uint64_t v14 = v6;
  *(void *)&long long v13 = v8;
  uint64_t v15 = v10;
  uint64_t v16 = v12;
  CGRect v33 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v13 - 8), &v31);
  double x = v33.origin.x;
  double y = v33.origin.y;
  double width = v33.size.width;
  double height = v33.size.height;
  uint64_t v21 = [v3 maxCharacterCount];
  uint64_t v22 = 40;
  if (v21 > 0) {
    uint64_t v22 = 32;
  }
  id v23 = *(id *)(a1 + v22);
  [v3 suggestedLineHeight];
  if (v24 != 0.0)
  {
    [v3 suggestedLineHeight];
    uint64_t v26 = [v23 fontWithSize:v25 * *(double *)(a1 + 136) * 0.75];

    id v23 = (id)v26;
  }
  uint64_t v27 = [v3 autoFillContentType];
  double v28 = +[PDFAnnotation createDetectedTextFieldWithBounds:font:textContentType:page:](PDFAnnotation, "createDetectedTextFieldWithBounds:font:textContentType:page:", v23, v27, *(void *)(a1 + 48), x, y, width, height);

  objc_msgSend(v28, "setFormContentType:", objc_msgSend(v3, "contentType"));
  id v29 = [v3 labelText];
  [v28 setLabelText:v29];

  if ([v3 contentType] == 50) {
    [v28 setIsDetectedSignature:1];
  }
  if ([v3 fieldType] == 2) {
    [v28 setIsDetectedCheckbox:1];
  }
  objc_msgSend(v28, "setAutofillNewContextStart:", objc_msgSend(v3, "autofillNewContextStart"));
  if ([v3 fieldType] == 1 && objc_msgSend(v3, "maxCharacterCount") >= 1)
  {
    [v28 setComb:1];
    objc_msgSend(v28, "setMaximumLength:", objc_msgSend(v3, "maxCharacterCount"));
  }
  [*(id *)(a1 + 56) addObject:v28];

  return v28;
}

void __62__PDFPageAnalyzer__addFormElementsFromAnalysis_bounds_toPage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    [v5 setAutoFillTextContentType:0];
    [v5 setFormContentType:1];
  }
  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)_addFormElementsUsingDetectorToPage:(id)a3 displayBox:(int64_t)a4
{
  id v31 = a3;
  uint64_t v6 = [[PDFDetectedForm alloc] initWithPage:v31 displayBox:a4];
  uint64_t v7 = (void *)MEMORY[0x263F82760];
  uint64_t v8 = +[PDFAnnotation detectedFormFieldDefaultFontName];
  +[PDFAnnotation detectedFormFieldDefaultFontSize];
  uint64_t v9 = objc_msgSend(v7, "fontWithName:size:", v8);

  uint64_t v10 = [MEMORY[0x263EFF980] array];
  uint64_t v11 = [(PDFDetectedForm *)v6 count];
  if (v11)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      long long v13 = -[PDFDetectedForm detectedFormFieldAtIndex:](v6, "detectedFormFieldAtIndex:", i, v31);
      [v13 rect];
      double x = v35.origin.x;
      double y = v35.origin.y;
      CGFloat width = v35.size.width;
      CGFloat height = v35.size.height;
      double MinY = CGRectGetMinY(v35);
      v36.origin.double x = x;
      v36.origin.double y = y;
      v36.size.CGFloat width = width;
      v36.size.CGFloat height = height;
      double rect = width;
      objc_msgSend(v9, "ascender", CGRectGetHeight(v36));
      double v20 = v19;
      [v9 descender];
      double v22 = v21;
      [v9 leading];
      double v24 = v23;
      [v9 ascender];
      double v25 = ceil(v20 - v22 + v24);
      double v27 = MinY + v26 - v25;
      if ([v13 kind] == 2 || objc_msgSend(v13, "kind") == 3)
      {
        v37.origin.double x = x;
        v37.origin.double y = y;
        v37.size.CGFloat width = width;
        v37.size.CGFloat height = height;
        double v28 = CGRectGetHeight(v37);
        v38.origin.double x = x;
        v38.origin.double y = v27;
        v38.size.CGFloat width = rect;
        v38.size.CGFloat height = v25;
        double v27 = y + (v28 - CGRectGetHeight(v38)) * 0.5;
      }
      id v29 = -[PDFPageAnalyzer _detectedAnnotationWithBounds:intersectsAnnotationOnPage:](self, "_detectedAnnotationWithBounds:intersectsAnnotationOnPage:", v31, x, v27 + -2.0, rect, v25);

      if (!v29)
      {
        double v30 = +[PDFAnnotation createDetectedTextFieldWithBounds:font:textContentType:page:](PDFAnnotation, "createDetectedTextFieldWithBounds:font:textContentType:page:", v9, 0, v31, x, v27 + -2.0, rect, v25);
        if ([v13 kind] == 3)
        {
          [v30 setComb:1];
          objc_msgSend(v30, "setMaximumLength:", objc_msgSend(v13, "numberOfSegments"));
        }
        [v10 addObject:v30];
      }
    }
  }
  if (objc_msgSend(v10, "count", v31)) {
    [v32 addDetectedAnnotations:v10];
  }
}

+ (CGAffineTransform)_normalizedToPageTransformForPageWithBounds:(SEL)a3
{
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  CGAffineTransformMakeTranslation(retstr, a4.origin.x, a4.size.height + a4.origin.y);
  long long v7 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v10.double a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v10.double c = v7;
  *(_OWORD *)&v10.tdouble x = *(_OWORD *)&retstr->tx;
  UIEdgeInsets result = CGAffineTransformScale(&v11, &v10, width, -height);
  long long v9 = *(_OWORD *)&v11.c;
  *(_OWORD *)&retstr->double a = *(_OWORD *)&v11.a;
  *(_OWORD *)&retstr->double c = v9;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v11.tx;
  return result;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 48));
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);

  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 850045863;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((void *)self + 13) = 0;
  return self;
}

@end