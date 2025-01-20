@interface IFPDFDocument
- (CGPDFDocument)pdfDocument;
- (IFPDFDocument)initWithURL:(id)a3;
- (NSURL)url;
- (id)firstPage;
- (id)pageAtIndex:(unint64_t)a3;
- (unint64_t)numberOfPages;
- (void)dealloc;
- (void)setPdfDocument:(CGPDFDocument *)a3;
@end

@implementation IFPDFDocument

- (IFPDFDocument)initWithURL:(id)a3
{
  CFURLRef v5 = (const __CFURL *)a3;
  v9.receiver = self;
  v9.super_class = (Class)IFPDFDocument;
  v6 = [(IFPDFDocument *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v7->_pdfDocument = CGPDFDocumentCreateWithURL(v5);
  }

  return v7;
}

- (void)dealloc
{
  pdfDocument = self->_pdfDocument;
  if (pdfDocument) {
    CFRelease(pdfDocument);
  }
  v4.receiver = self;
  v4.super_class = (Class)IFPDFDocument;
  [(IFPDFDocument *)&v4 dealloc];
}

- (unint64_t)numberOfPages
{
  return CGPDFDocumentGetNumberOfPages(self->_pdfDocument);
}

- (id)pageAtIndex:(unint64_t)a3
{
  if ([(IFPDFDocument *)self numberOfPages] <= a3)
  {
    Page = 0;
  }
  else
  {
    Page = (IFPDFPage *)CGPDFDocumentGetPage(self->_pdfDocument, a3 + 1);
    if (Page) {
      Page = [[IFPDFPage alloc] initWithCGPDFPage:Page];
    }
  }

  return Page;
}

- (id)firstPage
{
  return [(IFPDFDocument *)self pageAtIndex:0];
}

- (CGPDFDocument)pdfDocument
{
  return self->_pdfDocument;
}

- (void)setPdfDocument:(CGPDFDocument *)a3
{
  self->_pdfDocument = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end