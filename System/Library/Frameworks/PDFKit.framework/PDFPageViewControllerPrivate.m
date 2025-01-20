@interface PDFPageViewControllerPrivate
@end

@implementation PDFPageViewControllerPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->backgroundImage, 0);
  objc_storeStrong((id *)&self->pageView, 0);
  objc_storeStrong((id *)&self->pageViewContainerView, 0);
  objc_storeStrong((id *)&self->scrollView, 0);
  objc_storeStrong((id *)&self->page, 0);
  objc_destroyWeak((id *)&self->pdfView);

  objc_storeStrong((id *)&self->renderingProperties, 0);
}

@end