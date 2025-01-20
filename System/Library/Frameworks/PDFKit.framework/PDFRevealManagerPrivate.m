@interface PDFRevealManagerPrivate
@end

@implementation PDFRevealManagerPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->rvPresenter, 0);

  objc_destroyWeak((id *)&self->pdfView);
}

@end