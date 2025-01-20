@interface HKCDAPDFGenerator
+ (id)PDFTranslator;
- (HKCDAPDFGenerator)init;
- (void)_finishGenerationWithURL:(id)a3 tempFileDescriptor:(int)a4 completionHandler:(id)a5 error:(id)a6;
- (void)_pdfForHTML:(id)a3 completionHandler:(id)a4;
- (void)generatePDFForCDAXML:(id)a3 completionHandler:(id)a4;
@end

@implementation HKCDAPDFGenerator

- (HKCDAPDFGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKCDAPDFGenerator;
  return [(HKCDAPDFGenerator *)&v3 init];
}

- (void)generatePDFForCDAXML:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

void __60__HKCDAPDFGenerator_generatePDFForCDAXML_completionHandler___block_invoke(uint64_t a1)
{
  id v3 = +[HKCDAPDFGenerator PDFTranslator];
  v2 = [v3 convertToHTMLFromXML:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _pdfForHTML:v2 completionHandler:*(void *)(a1 + 48)];
}

- (void)_pdfForHTML:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HKCDAPDFGenerator__pdfForHTML_completionHandler___block_invoke;
  block[3] = &unk_1E6D51340;
  id v11 = v6;
  v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__HKCDAPDFGenerator__pdfForHTML_completionHandler___block_invoke(uint64_t a1)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v2 = -[HKCDAPDFPrintPageRenderer initWithPaperRect:horizontalMargin:verticalMargin:]([HKCDAPDFPrintPageRenderer alloc], "initWithPaperRect:horizontalMargin:verticalMargin:", 0.0, 0.0, 612.0, 792.0, 36.0, 72.0);
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F93498]) initWithMarkupText:*(void *)(a1 + 32)];
  [(UIPrintPageRenderer *)v2 addPrintFormatter:v3 startingAtPageAtIndex:0];
  v4 = NSTemporaryDirectory();
  v18[0] = v4;
  v18[1] = @"cda_report_XXXXXX.pdf";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

  id v6 = [NSString pathWithComponents:v5];
  strncpy(__dst, (const char *)[v6 UTF8String], 0x400uLL);
  __dst[1023] = 0;
  uint64_t v7 = mkstemps(__dst, 4);
  if ((v7 & 0x80000000) != 0)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Failed to create temporary file for generating PDF: %@", v6);
    [*(id *)(a1 + 40) _finishGenerationWithURL:0 tempFileDescriptor:v7 completionHandler:*(void *)(a1 + 48) error:v8];
  }
  else
  {
    id v8 = [NSString stringWithUTF8String:__dst];
    id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
    v10 = [MEMORY[0x1E4F934B0] sharedPrintController];
    [v10 setPrintPageRenderer:v2];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__HKCDAPDFGenerator__pdfForHTML_completionHandler___block_invoke_2;
    v13[3] = &unk_1E6D54328;
    v13[4] = *(void *)(a1 + 40);
    id v11 = v9;
    id v14 = v11;
    int v16 = v7;
    id v15 = *(id *)(a1 + 48);
    if (([v10 savePDFToURL:v11 completionHandler:v13] & 1) == 0)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Failed to generate PDF for Health Report");
      [*(id *)(a1 + 40) _finishGenerationWithURL:0 tempFileDescriptor:v7 completionHandler:*(void *)(a1 + 48) error:v12];
    }
  }
}

uint64_t __51__HKCDAPDFGenerator__pdfForHTML_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  id v5 = *(void **)(a1 + 32);
  if (a3)
  {
    uint64_t v6 = *(unsigned int *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = a4;
    uint64_t v6 = *(unsigned int *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v7 = 0;
  }
  return [v5 _finishGenerationWithURL:v7 tempFileDescriptor:v6 completionHandler:v8 error:v9];
}

- (void)_finishGenerationWithURL:(id)a3 tempFileDescriptor:(int)a4 completionHandler:(id)a5 error:(id)a6
{
  id v11 = a3;
  uint64_t v9 = (void (**)(id, BOOL))a5;
  id v10 = a6;
  v9[2](v9, v11 != 0);
  if ((a4 & 0x80000000) == 0) {
    close(a4);
  }
}

+ (id)PDFTranslator
{
  if (PDFTranslator_oncePredicate != -1) {
    dispatch_once(&PDFTranslator_oncePredicate, &__block_literal_global_53);
  }
  v2 = (void *)PDFTranslator_translator;
  return v2;
}

void __34__HKCDAPDFGenerator_PDFTranslator__block_invoke()
{
  v0 = HKHealthUIFrameworkBundle();
  id v5 = [v0 pathForResource:@"CDAPDFINTL" ofType:@"xsl"];

  v1 = [MEMORY[0x1E4F28CB8] defaultManager];
  v2 = [v1 contentsAtPath:v5];

  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F2B9B8]) initWithXSL:v2 localizationTableName:@"CDA" localizationOverride:0];
  v4 = (void *)PDFTranslator_translator;
  PDFTranslator_translator = v3;
}

@end