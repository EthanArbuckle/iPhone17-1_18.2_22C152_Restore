@interface PDFKitTextViewPrivate
@end

@implementation PDFKitTextViewPrivate

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->annotation);
  objc_destroyWeak((id *)&self->pdfPageView);
  objc_destroyWeak((id *)&self->pdfView);
  objc_storeStrong((id *)&self->textView, 0);

  objc_storeStrong((id *)&self->topLevelView, 0);
}

@end