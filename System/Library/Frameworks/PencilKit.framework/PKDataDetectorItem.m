@interface PKDataDetectorItem
+ (id)dataDetectorItemWithQueryItem:(id)a3 sessionManager:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DDScannerResult)scannerResult;
- (PKDataDetectorItemDelegate)delegate;
- (__DDResult)coreResult;
- (id)_baselinePath;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewInContainerView:(id)a5 frame:(CGRect)a6;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4 view:(id)a5 identifier:(id)a6;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4 view:(id)a5 identifier:(id)a6 sourceRect:(CGRect)a7;
- (id)drawing;
- (id)strokeColor;
- (id)updatedDataDetectorContextForView:(id)a3 sourceRect:(CGRect)a4;
- (unint64_t)hash;
- (void)_highlightForView:(id)a3 viewTransform:(CGAffineTransform *)a4 drawingTransform:(CGAffineTransform *)a5 highlightTransform:(CGAffineTransform *)a6 completion:(id)a7;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)handleTapForMenuForInteraction:(id)a3 location:(CGPoint)a4 view:(id)a5 viewTransform:(CGAffineTransform *)a6 drawingTransform:(CGAffineTransform *)a7;
- (void)handleTapForMenuForInteraction:(id)a3 location:(CGPoint)a4 view:(id)a5 viewTransform:(CGAffineTransform *)a6 drawingTransform:(CGAffineTransform *)a7 highlightTransform:(CGAffineTransform *)a8 sourceRect:(CGRect)a9;
- (void)setDelegate:(id)a3;
@end

@implementation PKDataDetectorItem

+ (id)dataDetectorItemWithQueryItem:(id)a3 sessionManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 strokeIdentifiers];
  v8 = -[PKRecognitionSessionManager drawing](v6);
  int valid = HasValidInkForDetectionItem(v7, v8);

  if (valid)
  {
    v10 = [(PKDetectionItem *)[PKDataDetectorItem alloc] initWithSessionManager:v6];
    [(PKDetectionItem *)v10 setQueryItem:v5];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)drawing
{
  v2 = [(PKDetectionItem *)self sessionManager];
  v3 = -[PKRecognitionSessionManager drawing](v2);

  return v3;
}

- (id)_baselinePath
{
  v2 = [(PKDetectionItem *)self queryItem];
  v3 = [v2 baselinePath];

  return v3;
}

- (id)strokeColor
{
  v3 = [(PKDataDetectorItem *)self scannerResult];
  uint64_t v4 = [v3 coreResult];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  id v5 = (uint64_t (*)(uint64_t, void))_MergedGlobals_147;
  v21 = _MergedGlobals_147;
  if (!_MergedGlobals_147)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = ___ZL42getDDShouldUseLightLinksForResultSymbolLocv_block_invoke;
    v16 = &unk_1E64C8720;
    v17 = &v18;
    ___ZL42getDDShouldUseLightLinksForResultSymbolLocv_block_invoke((uint64_t)&v13);
    id v5 = (uint64_t (*)(uint64_t, void))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (v5)
  {
    int v6 = v5(v4, 0);

    if (v6)
    {
      v7 = [(PKDetectionItem *)self inkColor];

      if (!v7) {
        [(PKDetectionItem *)self _generatePaths];
      }
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x2050000000;
      v8 = (void *)qword_1EB3C60C0;
      v21 = (void *)qword_1EB3C60C0;
      if (!qword_1EB3C60C0)
      {
        uint64_t v13 = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        v15 = ___ZL29getDDDetectionControllerClassv_block_invoke;
        v16 = &unk_1E64C8720;
        v17 = &v18;
        ___ZL29getDDDetectionControllerClassv_block_invoke((uint64_t)&v13);
        v8 = (void *)v19[3];
      }
      id v9 = v8;
      _Block_object_dispose(&v18, 8);
      v10 = [(PKDetectionItem *)self inkColor];
      v11 = [v9 lightUnderlineColorFromTextColor:v10];
    }
    else
    {
      v11 = 0;
    }
    return v11;
  }
  else
  {
    dlerror();
    id result = (id)abort_report_np();
    __break(1u);
  }
  return result;
}

- (DDScannerResult)scannerResult
{
  v2 = [(PKDetectionItem *)self queryItem];
  v3 = [v2 scannerResult];

  return (DDScannerResult *)v3;
}

- (__DDResult)coreResult
{
  v2 = [(PKDetectionItem *)self queryItem];
  v3 = [v2 scannerResult];
  uint64_t v4 = (__DDResult *)[v3 coreResult];

  return v4;
}

- (unint64_t)hash
{
  v2 = [(PKDetectionItem *)self queryItem];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKDataDetectorItem *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(PKDetectionItem *)self queryItem];
      int v6 = [(PKDetectionItem *)v4 queryItem];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (PKDataDetectorItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDataDetectorItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)updatedDataDetectorContextForView:(id)a3 sourceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = [(PKDataDetectorItem *)self delegate];
  v12 = [v11 dataDetectorItemAllItems:self];

  if (v12)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v13 = (void *)_MergedGlobals_151;
    uint64_t v32 = _MergedGlobals_151;
    if (!_MergedGlobals_151)
    {
      uint64_t v14 = (void *)DataDetectorsUILibrary();
      v30[3] = (uint64_t)dlsym(v14, "kDataDetectorsAllResultsKey");
      _MergedGlobals_151 = v30[3];
      uint64_t v13 = (void *)v30[3];
    }
    _Block_object_dispose(&v29, 8);
    if (!v13) {
      goto LABEL_16;
    }
    [v10 setObject:v12 forKeyedSubscript:*v13];
  }
  v15 = [(PKDataDetectorItem *)self scannerResult];
  v16 = [v15 value];
  uint64_t v17 = [v16 length];

  if (!v17) {
    goto LABEL_11;
  }
  uint64_t v18 = [(PKDataDetectorItem *)self scannerResult];
  v19 = [v18 value];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v20 = (void *)qword_1EB3C6128;
  uint64_t v32 = qword_1EB3C6128;
  if (!qword_1EB3C6128)
  {
    v21 = (void *)DataDetectorsUILibrary();
    v30[3] = (uint64_t)dlsym(v21, "kDataDetectorsMiddleText");
    qword_1EB3C6128 = v30[3];
    uint64_t v20 = (void *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v20)
  {
LABEL_16:
    dlerror();
    v28 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v29, 8);
    _Unwind_Resume(v28);
  }
  [v10 setObject:v19 forKeyedSubscript:*v20];

LABEL_11:
  v34.origin.double x = x;
  v34.origin.double y = y;
  v34.size.double width = width;
  v34.size.double height = height;
  if (CGRectIsEmpty(v34))
  {
    [v9 bounds];
    double x = v22;
    double y = v23;
    double width = v24;
    double height = v25;
  }
  v26 = objc_msgSend(getDDContextMenuActionClass(), "updateContext:withSourceRect:", v10, x, y, width, height);

  return v26;
}

- (void)handleTapForMenuForInteraction:(id)a3 location:(CGPoint)a4 view:(id)a5 viewTransform:(CGAffineTransform *)a6 drawingTransform:(CGAffineTransform *)a7
{
  long long v7 = *(_OWORD *)&a6->c;
  v12[0] = *(_OWORD *)&a6->a;
  v12[1] = v7;
  v12[2] = *(_OWORD *)&a6->tx;
  long long v8 = *(_OWORD *)&a7->c;
  v11[0] = *(_OWORD *)&a7->a;
  v11[1] = v8;
  v11[2] = *(_OWORD *)&a7->tx;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v10[0] = *MEMORY[0x1E4F1DAB8];
  v10[1] = v9;
  v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  -[PKDataDetectorItem handleTapForMenuForInteraction:location:view:viewTransform:drawingTransform:highlightTransform:sourceRect:](self, "handleTapForMenuForInteraction:location:view:viewTransform:drawingTransform:highlightTransform:sourceRect:", a3, a5, v12, v11, v10, a4.x, a4.y, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

- (void)handleTapForMenuForInteraction:(id)a3 location:(CGPoint)a4 view:(id)a5 viewTransform:(CGAffineTransform *)a6 drawingTransform:(CGAffineTransform *)a7 highlightTransform:(CGAffineTransform *)a8 sourceRect:(CGRect)a9
{
  double height = a9.size.height;
  double width = a9.size.width;
  double y = a9.origin.y;
  double x = a9.origin.x;
  CGFloat v17 = a4.y;
  CGFloat v18 = a4.x;
  id v20 = a3;
  id v21 = a5;
  objc_initWeak(&location, self);
  double v22 = -[PKDataDetectorItem updatedDataDetectorContextForView:sourceRect:](self, "updatedDataDetectorContextForView:sourceRect:", v21, x, y, width, height);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __148__PKDataDetectorItem_InteractionSupport__handleTapForMenuForInteraction_location_view_viewTransform_drawingTransform_highlightTransform_sourceRect___block_invoke;
  v32[3] = &unk_1E64C9C90;
  objc_copyWeak(v36, &location);
  id v23 = v21;
  id v33 = v23;
  v36[1] = *(id *)&v18;
  v36[2] = *(id *)&v17;
  id v24 = v20;
  id v34 = v24;
  id v25 = v22;
  id v35 = v25;
  long long v26 = *(_OWORD *)&a6->c;
  v31[0] = *(_OWORD *)&a6->a;
  v31[1] = v26;
  v31[2] = *(_OWORD *)&a6->tx;
  long long v27 = *(_OWORD *)&a7->c;
  v30[0] = *(_OWORD *)&a7->a;
  v30[1] = v27;
  v30[2] = *(_OWORD *)&a7->tx;
  long long v28 = *(_OWORD *)&a8->c;
  v29[0] = *(_OWORD *)&a8->a;
  v29[1] = v28;
  v29[2] = *(_OWORD *)&a8->tx;
  [(PKDataDetectorItem *)self _highlightForView:v23 viewTransform:v31 drawingTransform:v30 highlightTransform:v29 completion:v32];

  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
}

void __148__PKDataDetectorItem_InteractionSupport__handleTapForMenuForInteraction_location_view_viewTransform_drawingTransform_highlightTransform_sourceRect___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id DDContextMenuActionClass = getDDContextMenuActionClass();
    unint64_t v3 = [WeakRetained scannerResult];
    objc_msgSend(DDContextMenuActionClass, "performDefaultActionWithResult:inView:atLocation:withMenuInteraction:context:", objc_msgSend(v3, "coreResult"), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
}

- (void)_highlightForView:(id)a3 viewTransform:(CGAffineTransform *)a4 drawingTransform:(CGAffineTransform *)a5 highlightTransform:(CGAffineTransform *)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  uint64_t v50 = 0;
  v51 = (double *)&v50;
  uint64_t v52 = 0x3010000000;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  v53 = "";
  uint64_t v44 = 0;
  v45 = (double *)&v44;
  uint64_t v46 = 0x3010000000;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  v47 = "";
  id v14 = [(PKDetectionItem *)self itemSpaceBaselinePath];
  v15 = (const CGPath *)[v14 CGPath];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__PKDataDetectorItem_InteractionSupport___highlightForView_viewTransform_drawingTransform_highlightTransform_completion___block_invoke;
  block[3] = &unk_1E64C9CB8;
  block[4] = &v50;
  block[5] = &v44;
  CGPathApplyWithBlock(v15, block);

  v16 = [(PKDetectionItem *)self itemSpaceBoundsPath];
  CGFloat v17 = (void *)[v16 copy];

  long long v18 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v42.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v42.c = v18;
  *(_OWORD *)&v42.tdouble x = *(_OWORD *)&a5->tx;
  [v17 applyTransform:&v42];
  double v19 = atan2(v45[5] - v51[5], v45[4] - v51[4]);
  double v20 = fabs(v19);
  if (v20 > 0.157079633)
  {
    [v17 bounds];
    double v22 = v21;
    double v24 = v23;
    CGAffineTransformMakeTranslation(&v41, v21 * -0.5, v23 * -0.5);
    [v17 applyTransform:&v41];
    CGAffineTransformMakeRotation(&v40, -v19);
    [v17 applyTransform:&v40];
    CGAffineTransformMakeTranslation(&v39, v22 * 0.5, v24 * 0.5);
    [v17 applyTransform:&v39];
  }
  [v17 bounds];
  long long v25 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v42.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v42.c = v25;
  *(_OWORD *)&v42.tdouble x = *(_OWORD *)&a4->tx;
  CGRect v57 = CGRectApplyAffineTransform(v56, &v42);
  long long v26 = *(_OWORD *)&a6->c;
  *(_OWORD *)&v42.a = *(_OWORD *)&a6->a;
  *(_OWORD *)&v42.c = v26;
  *(_OWORD *)&v42.tdouble x = *(_OWORD *)&a6->tx;
  CGRect v58 = CGRectApplyAffineTransform(v57, &v42);
  long long v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB2140]), "initWithFrame:", v58.origin.x, v58.origin.y, v58.size.width, v58.size.height);
  [v27 setOpaque:0];
  if (v20 > 0.157079633)
  {
    CGAffineTransformMakeRotation(&v38, v19);
    CGAffineTransform v37 = v38;
    [v27 setTransform:&v37];
  }
  [v27 bounds];
  double v29 = v28 * 0.5;
  if (v28 * 0.5 > 6.0) {
    double v29 = 6.0;
  }
  [v27 setCornerRadius:v29];
  v30 = [MEMORY[0x1E4FB1618] colorWithWhite:0.101960784 alpha:0.3];
  [v27 setColor:v30];

  [v12 addSubview:v27];
  dispatch_time_t v31 = dispatch_time(0, 100000000);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __121__PKDataDetectorItem_InteractionSupport___highlightForView_viewTransform_drawingTransform_highlightTransform_completion___block_invoke_2;
  v34[3] = &unk_1E64C6B40;
  id v35 = v27;
  id v36 = v13;
  id v32 = v13;
  id v33 = v27;
  dispatch_after(v31, MEMORY[0x1E4F14428], v34);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);
}

__n128 __121__PKDataDetectorItem_InteractionSupport___highlightForView_viewTransform_drawingTransform_highlightTransform_completion___block_invoke(uint64_t a1, uint64_t a2, __n128 result)
{
  switch(*(_DWORD *)a2)
  {
    case 0:
      uint64_t v3 = *(void *)(a1 + 32);
      goto LABEL_4;
    case 1:
      uint64_t v3 = *(void *)(a1 + 40);
LABEL_4:
      uint64_t v4 = *(__n128 **)(v3 + 8);
      id result = *(__n128 *)*(void *)(a2 + 8);
      goto LABEL_6;
    case 2:
      uint64_t v4 = *(__n128 **)(*(void *)(a1 + 40) + 8);
      id result = *(__n128 *)(*(void *)(a2 + 8) + 16);
LABEL_6:
      v4[2] = result;
      break;
    case 3:
      id result = *(__n128 *)(*(void *)(a2 + 8) + 32);
      *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __121__PKDataDetectorItem_InteractionSupport___highlightForView_viewTransform_drawingTransform_highlightTransform_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4 view:(id)a5 identifier:(id)a6
{
  return -[PKDataDetectorItem contextMenuInteraction:configurationForMenuAtLocation:view:identifier:sourceRect:](self, "contextMenuInteraction:configurationForMenuAtLocation:view:identifier:sourceRect:", a3, a5, a6, a4.x, a4.y, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4 view:(id)a5 identifier:(id)a6 sourceRect:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v13 = a6;
  id v14 = a5;
  id DDContextMenuActionClass = getDDContextMenuActionClass();
  v16 = [(PKDataDetectorItem *)self scannerResult];
  uint64_t v17 = [v16 coreResult];
  long long v18 = -[PKDataDetectorItem updatedDataDetectorContextForView:sourceRect:](self, "updatedDataDetectorContextForView:sourceRect:", v14, x, y, width, height);
  double v19 = [DDContextMenuActionClass contextMenuConfigurationWithResult:v17 inView:v14 context:v18 menuIdentifier:v13];

  return v19;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewInContainerView:(id)a5 frame:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v11 = a5;
  id v12 = [(PKDetectionItem *)self image];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v12];
  objc_msgSend(v13, "setFrame:", 0.0, 0.0, width, height);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  double MidX = CGRectGetMidX(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  double MidY = CGRectGetMidY(v23);
  id v16 = objc_alloc(MEMORY[0x1E4FB1D48]);
  id v17 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  long long v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1B38]), "initWithContainer:center:", v11, MidX, MidY);

  double v19 = (void *)[v16 initWithView:v13 parameters:v17 target:v18];

  return v19;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v10 = (void *)getDDContextMenuConfigurationClass_softClass;
  uint64_t v16 = getDDContextMenuConfigurationClass_softClass;
  if (!getDDContextMenuConfigurationClass_softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getDDContextMenuConfigurationClass_block_invoke;
    _OWORD v12[3] = &unk_1E64C5478;
    v12[4] = &v13;
    __getDDContextMenuConfigurationClass_block_invoke((uint64_t)v12);
    v10 = (void *)v14[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v13, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 performPreviewActionForMenuWithAnimator:v9];
  }
}

@end