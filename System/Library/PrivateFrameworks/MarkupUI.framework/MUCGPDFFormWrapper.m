@interface MUCGPDFFormWrapper
- (CGPDFForm)pdfForm;
- (MUCGPDFFormWrapper)initWithForm:(CGPDFForm *)a3;
- (void)dealloc;
@end

@implementation MUCGPDFFormWrapper

- (MUCGPDFFormWrapper)initWithForm:(CGPDFForm *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MUCGPDFFormWrapper;
  result = [(MUCGPDFFormWrapper *)&v5 init];
  if (result) {
    result->_pdfForm = a3;
  }
  return result;
}

- (void)dealloc
{
  if (self->_pdfForm) {
    CGPDFFormRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)MUCGPDFFormWrapper;
  [(MUCGPDFFormWrapper *)&v3 dealloc];
}

- (CGPDFForm)pdfForm
{
  return self->_pdfForm;
}

@end