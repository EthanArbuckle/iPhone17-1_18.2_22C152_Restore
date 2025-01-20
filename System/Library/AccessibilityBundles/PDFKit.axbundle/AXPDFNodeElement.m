@interface AXPDFNodeElement
- (AXPDFNodeElement)initWithAccessibilityContainer:(id)a3 withPage:(id)a4;
- (BOOL)didDetermineLastNodeStatus;
- (BOOL)isGatheringLeafDescendents;
- (BOOL)isLastNodeInPage;
- (BOOL)pdfViewRequiresPageTurning;
- (CGRect)axConvertBoundsFromPageToScreenCoordinates:(CGRect)a3;
- (PDFPage)page;
- (id)pdfView;
- (void)setDidDetermineLastNodeStatus:(BOOL)a3;
- (void)setIsGatheringLeafDescendents:(BOOL)a3;
- (void)setIsLastNodeInPage:(BOOL)a3;
- (void)setPage:(id)a3;
@end

@implementation AXPDFNodeElement

- (AXPDFNodeElement)initWithAccessibilityContainer:(id)a3 withPage:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AXPDFNodeElement;
  id v5 = a4;
  v6 = [(AXPDFNodeElement *)&v8 initWithAccessibilityContainer:a3];
  -[AXPDFNodeElement setPage:](v6, "setPage:", v5, v8.receiver, v8.super_class);

  return v6;
}

- (id)pdfView
{
  p_pdfView = &self->_pdfView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  id v5 = [WeakRetained window];

  if (!v5)
  {
    v6 = [(AXPDFNodeElement *)self _accessibilityAncestorIsKindOf:MEMORY[0x245659980](@"PDFView")];
    objc_storeWeak((id *)p_pdfView, v6);
  }
  id v7 = objc_loadWeakRetained((id *)p_pdfView);

  return v7;
}

- (BOOL)isLastNodeInPage
{
  v3 = [(AXPDFNodeElement *)self pdfView];

  if (!v3 || ![(AXPDFNodeElement *)self isAccessibilityElement]) {
    return 0;
  }
  if ([(AXPDFNodeElement *)self didDetermineLastNodeStatus]) {
    return self->_isLastNodeInPage;
  }
  if ([(AXPDFNodeElement *)self isGatheringLeafDescendents]) {
    return 0;
  }
  v6 = [(AXPDFNodeElement *)self accessibilityContainer];
  if (v6)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      uint64_t v7 = [v6 accessibilityContainer];

      v6 = (void *)v7;
    }
    while (v7);
  }
  objc_super v8 = [v6 _accessibilityValueForKey:@"AXValidElements"];
  if (!v8)
  {
    [(AXPDFNodeElement *)self setIsGatheringLeafDescendents:1];
    v9 = [MEMORY[0x263F81198] options];
    objc_super v8 = [v6 _accessibilityLeafDescendantsWithOptions:v9];

    [(AXPDFNodeElement *)self setIsGatheringLeafDescendents:0];
    [v6 _accessibilitySetRetainedValue:v8 forKey:@"AXValidElements"];
  }
  v10 = [v8 lastObject];
  self->_BOOL isLastNodeInPage = v10 == self;

  [(AXPDFNodeElement *)self setDidDetermineLastNodeStatus:1];
  BOOL isLastNodeInPage = self->_isLastNodeInPage;

  return isLastNodeInPage;
}

- (BOOL)pdfViewRequiresPageTurning
{
  v2 = [(AXPDFNodeElement *)self pdfView];
  BOOL v3 = ([v2 isUsingPageViewController] & 1) != 0
    || [v2 displayMode] == 2
    || [v2 displayMode] == 0;

  return v3;
}

- (CGRect)axConvertBoundsFromPageToScreenCoordinates:(CGRect)a3
{
  uint64_t v11 = 0;
  v12 = (double *)&v11;
  uint64_t v13 = 0x4010000000;
  v14 = &unk_2423CA025;
  CGRect v15 = a3;
  AXPerformSafeBlock();
  double v3 = v12[4];
  double v4 = v12[5];
  double v5 = v12[6];
  double v6 = v12[7];
  _Block_object_dispose(&v11, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

void __63__AXPDFNodeElement_axConvertBoundsFromPageToScreenCoordinates___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pdfView];
  double v3 = *(double **)(*(void *)(a1 + 40) + 8);
  double v4 = [*(id *)(a1 + 32) page];
  objc_msgSend(v2, "convertRect:fromPage:", v4, v3[4], v3[5], v3[6], v3[7]);
  double v5 = *(void **)(*(void *)(a1 + 40) + 8);
  v5[4] = v6;
  v5[5] = v7;
  v5[6] = v8;
  v5[7] = v9;

  double v10 = *(CGRect **)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = [*(id *)(a1 + 32) pdfView];
  *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = UIAccessibilityConvertFrameToScreenCoordinates(v10[1], v11);
}

- (BOOL)didDetermineLastNodeStatus
{
  return self->_didDetermineLastNodeStatus;
}

- (void)setDidDetermineLastNodeStatus:(BOOL)a3
{
  self->_didDetermineLastNodeStatus = a3;
}

- (BOOL)isGatheringLeafDescendents
{
  return self->_isGatheringLeafDescendents;
}

- (void)setIsGatheringLeafDescendents:(BOOL)a3
{
  self->_isGatheringLeafDescendents = a3;
}

- (void)setIsLastNodeInPage:(BOOL)a3
{
  self->_BOOL isLastNodeInPage = a3;
}

- (PDFPage)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);

  return (PDFPage *)WeakRetained;
}

- (void)setPage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_page);

  objc_destroyWeak((id *)&self->_pdfView);
}

@end