@interface AKPDFDocumentWrapper
- (AKPDFDocumentWrapper)init;
- (AKPDFDocumentWrapper)initWithPDF:(CGPDFDocument *)a3;
- (CGPDFDocument)pdfDocument;
- (void)dealloc;
@end

@implementation AKPDFDocumentWrapper

- (AKPDFDocumentWrapper)initWithPDF:(CGPDFDocument *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKPDFDocumentWrapper;
  v4 = [(AKPDFDocumentWrapper *)&v6 init];
  if (v4) {
    v4->_pdfDocument = CGPDFDocumentRetain(a3);
  }
  return v4;
}

- (AKPDFDocumentWrapper)init
{
  return [(AKPDFDocumentWrapper *)self initWithPDF:0];
}

- (void)dealloc
{
  pdfDocument = self->_pdfDocument;
  if (pdfDocument)
  {
    CGPDFDocumentRelease(pdfDocument);
    self->_pdfDocument = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AKPDFDocumentWrapper;
  [(AKPDFDocumentWrapper *)&v4 dealloc];
}

- (CGPDFDocument)pdfDocument
{
  return self->_pdfDocument;
}

@end