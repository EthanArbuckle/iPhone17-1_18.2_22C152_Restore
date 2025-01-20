@interface PDFAKPageAdaptorPrivate
@end

@implementation PDFAKPageAdaptorPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->akPageModelController, 0);

  objc_destroyWeak((id *)&self->pdfPage);
}

@end