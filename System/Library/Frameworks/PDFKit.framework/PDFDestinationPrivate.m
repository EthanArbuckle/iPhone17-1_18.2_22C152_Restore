@interface PDFDestinationPrivate
@end

@implementation PDFDestinationPrivate

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->page);

  objc_destroyWeak((id *)&self->document);
}

@end