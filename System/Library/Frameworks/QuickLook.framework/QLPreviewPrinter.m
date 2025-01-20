@interface QLPreviewPrinter
- (QLPreviewPrinter)initWithPreviewPrinter:(id)a3;
- (QLPrintingProtocol)printer;
- (int64_t)numberOfPages;
- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4;
- (void)prepareForDrawingPages:(_NSRange)a3;
@end

@implementation QLPreviewPrinter

- (QLPreviewPrinter)initWithPreviewPrinter:(id)a3
{
  id v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)QLPreviewPrinter,
        v6 = [(QLPreviewPrinter *)&v9 init],
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_printer, a3);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)numberOfPages
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v3 = [(QLPreviewPrinter *)self printer];
  [(UIPrintPageRenderer *)self printableRect];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__QLPreviewPrinter_numberOfPages__block_invoke;
  v8[3] = &unk_2642F6630;
  v8[4] = &v9;
  objc_msgSend(v3, "numberOfPagesWithSize:completionHandler:", v8, v4, v5);

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __33__QLPreviewPrinter_numberOfPages__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)prepareForDrawingPages:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = [(QLPreviewPrinter *)self printer];
  [(UIPrintPageRenderer *)self printableRect];
  objc_msgSend(v8, "prepareForDrawingPages:ofSize:", location, length, v6, v7);
}

- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  id v21 = 0;
  double v6 = [(QLPreviewPrinter *)self printer];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __43__QLPreviewPrinter_drawPageAtIndex_inRect___block_invoke;
  v15[3] = &unk_2642F6658;
  v15[4] = &v16;
  [v6 pdfDataForPageAtIndex:a3 withCompletionHandler:v15];

  if (v17[5])
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    [(UIPrintPageRenderer *)self paperRect];
    CGContextTranslateCTM(CurrentContext, 0.0, v8);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    [(UIPrintPageRenderer *)self printableRect];
    CGFloat v10 = v9;
    [(UIPrintPageRenderer *)self printableRect];
    CGContextTranslateCTM(CurrentContext, v10, v11);
    uint64_t v12 = CGDataProviderCreateWithCFData((CFDataRef)v17[5]);
    v13 = CGPDFDocumentCreateWithProvider(v12);
    Page = CGPDFDocumentGetPage(v13, 1uLL);
    CGContextDrawPDFPage(CurrentContext, Page);
    CGPDFDocumentRelease(v13);
    CGDataProviderRelease(v12);
    CGContextRestoreGState(CurrentContext);
  }
  _Block_object_dispose(&v16, 8);
}

void __43__QLPreviewPrinter_drawPageAtIndex_inRect___block_invoke(uint64_t a1, void *a2)
{
}

- (QLPrintingProtocol)printer
{
  return (QLPrintingProtocol *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
}

@end