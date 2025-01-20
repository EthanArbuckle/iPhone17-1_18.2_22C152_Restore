@interface PDFExtensionViewControllerPrivate
@end

@implementation PDFExtensionViewControllerPrivate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->searchResults, 0);
  objc_storeStrong((id *)&self->searchSelection, 0);
  objc_storeStrong((id *)&self->searchString, 0);
  objc_storeStrong((id *)&self->pdfView, 0);

  objc_storeStrong((id *)&self->hostProxy, 0);
}

@end