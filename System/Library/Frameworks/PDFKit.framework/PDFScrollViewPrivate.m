@interface PDFScrollViewPrivate
@end

@implementation PDFScrollViewPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pageSyncDate, 0);
  objc_storeStrong((id *)&self->boundsUpdateTimer, 0);
  objc_destroyWeak((id *)&self->documentView);
  objc_destroyWeak((id *)&self->document);

  objc_destroyWeak((id *)&self->pdfView);
}

@end