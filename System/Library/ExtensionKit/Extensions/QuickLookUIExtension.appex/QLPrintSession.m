@interface QLPrintSession
- (CGDataProvider)dataProvider;
- (CGPDFDocument)pdfDocumentRef;
- (CGSize)printSize;
- (void)dealloc;
- (void)setDataProvider:(CGDataProvider *)a3;
- (void)setPdfDocumentRef:(CGPDFDocument *)a3;
- (void)setPrintSize:(CGSize)a3;
@end

@implementation QLPrintSession

- (void)setDataProvider:(CGDataProvider *)a3
{
  self->_dataProvider = CGDataProviderRetain(a3);
}

- (void)setPdfDocumentRef:(CGPDFDocument *)a3
{
  self->_pdfDocumentRef = CGPDFDocumentRetain(a3);
}

- (void)dealloc
{
  pdfDocumentRef = self->_pdfDocumentRef;
  if (pdfDocumentRef) {
    CGPDFDocumentRelease(pdfDocumentRef);
  }
  dataProvider = self->_dataProvider;
  if (dataProvider) {
    CGDataProviderRelease(dataProvider);
  }
  v5.receiver = self;
  v5.super_class = (Class)QLPrintSession;
  [(QLPrintSession *)&v5 dealloc];
}

- (CGSize)printSize
{
  objc_copyStruct(v4, &self->_printSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPrintSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_printSize, &v3, 16, 1, 0);
}

- (CGDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (CGPDFDocument)pdfDocumentRef
{
  return self->_pdfDocumentRef;
}

@end