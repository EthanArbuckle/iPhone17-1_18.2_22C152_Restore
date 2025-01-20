@interface PDFViewLayoutPrivate
@end

@implementation PDFViewLayoutPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pageLayoutLock, 0);
  objc_destroyWeak((id *)&self->document);

  objc_destroyWeak(&self->delegate);
}

@end