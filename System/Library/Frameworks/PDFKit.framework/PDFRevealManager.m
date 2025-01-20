@interface PDFRevealManager
- (PDFRevealManager)initWithPDFView:(id)a3;
- (id)PDFRVDocumentContextForPage:(id)a3;
- (id)PDFRVPresenter;
- (id)PDFRVPresentingContextAtPoint:(CGPoint)a3;
- (void)reset;
@end

@implementation PDFRevealManager

- (PDFRevealManager)initWithPDFView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDFRevealManager;
  v5 = [(PDFRevealManager *)&v9 init];
  if (v5)
  {
    v6 = objc_alloc_init(PDFRevealManagerPrivate);
    v7 = v5->_private;
    v5->_private = v6;

    objc_storeWeak((id *)&v5->_private->pdfView, v4);
  }

  return v5;
}

- (id)PDFRVPresentingContextAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)PDFRVPresenter
{
  rvPresenter = self->_private->rvPresenter;
  if (!rvPresenter)
  {
    if (loadReveal_onceToken != -1) {
      dispatch_once(&loadReveal_onceToken, &__block_literal_global_10);
    }
    id v4 = (RVPresenter *)objc_alloc_init(0);
    v5 = self->_private;
    v6 = v5->rvPresenter;
    v5->rvPresenter = v4;

    rvPresenter = self->_private->rvPresenter;
  }

  return rvPresenter;
}

- (id)PDFRVDocumentContextForPage:(id)a3
{
  return 0;
}

- (void)reset
{
  v2 = self->_private;
  rvPresenter = v2->rvPresenter;
  v2->rvPresenter = 0;
}

- (void).cxx_destruct
{
}

@end