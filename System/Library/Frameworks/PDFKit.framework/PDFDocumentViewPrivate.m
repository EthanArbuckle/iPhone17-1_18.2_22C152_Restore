@interface PDFDocumentViewPrivate
@end

@implementation PDFDocumentViewPrivate

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->pointerTrackingView);
  objc_storeStrong((id *)&self->pageBackgroundManager, 0);
  objc_storeStrong((id *)&self->pageFrames, 0);
  objc_storeStrong((id *)&self->pageViews, 0);
  objc_storeStrong((id *)&self->contentView, 0);
  objc_destroyWeak((id *)&self->renderingProperties);
  objc_destroyWeak((id *)&self->document);

  objc_destroyWeak((id *)&self->pdfView);
}

@end