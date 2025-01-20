@interface PDFDocumentViewControllerPrivate
@end

@implementation PDFDocumentViewControllerPrivate

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->scrollView);
  objc_storeStrong((id *)&self->weakPageViewControllers, 0);
  objc_storeStrong((id *)&self->pageBackgroundManager, 0);
  objc_destroyWeak((id *)&self->activePageView);
  objc_storeStrong((id *)&self->renderingProperties, 0);

  objc_destroyWeak((id *)&self->pdfView);
}

@end