@interface PDFScannerResultPrivate
@end

@implementation PDFScannerResultPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->rects, 0);
  objc_destroyWeak((id *)&self->page);

  objc_storeStrong((id *)&self->ddResult, 0);
}

@end