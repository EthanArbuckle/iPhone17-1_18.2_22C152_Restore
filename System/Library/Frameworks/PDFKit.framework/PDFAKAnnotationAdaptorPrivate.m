@interface PDFAKAnnotationAdaptorPrivate
@end

@implementation PDFAKAnnotationAdaptorPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->akAnnotation, 0);

  objc_destroyWeak((id *)&self->pdfAnnotation);
}

@end