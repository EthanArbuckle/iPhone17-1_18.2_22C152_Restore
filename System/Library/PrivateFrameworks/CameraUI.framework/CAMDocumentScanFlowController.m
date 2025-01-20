@interface CAMDocumentScanFlowController
+ (BOOL)isSupported;
+ (id)nameForDocumentWithDate:(id)a3;
- (CAMDocumentScanFlowController)init;
- (CAMDocumentScanFlowControllerDelegate)documentFlowDelegate;
- (NSURL)_url;
- (id)_pdfConversionQueue;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4;
- (void)_asyncConvertToPDFAndWrite:(id)a3 completionHandler:(id)a4;
- (void)_handlePDFResults:(id)a3;
- (void)documentCameraViewController:(id)a3 didFailWithError:(id)a4;
- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4;
- (void)documentCameraViewControllerDidCancel:(id)a3;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)setDocumentFlowDelegate:(id)a3;
- (void)set_url:(id)a3;
@end

@implementation CAMDocumentScanFlowController

- (CAMDocumentScanFlowController)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F3AA60]);
  v7.receiver = self;
  v7.super_class = (Class)CAMDocumentScanFlowController;
  v4 = [(CAMDocumentScanFlowController *)&v7 initWithRootViewController:v3];
  if (v4)
  {
    [v3 setDelegate:v4];
    [(CAMDocumentScanFlowController *)v4 setModalPresentationStyle:5];
    [(CAMDocumentScanFlowController *)v4 setModalTransitionStyle:2];
    [(CAMDocumentScanFlowController *)v4 setNavigationBarHidden:1];
    v5 = v4;
  }

  return v4;
}

+ (BOOL)isSupported
{
  return [MEMORY[0x263F3AA60] isSupported];
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__CAMDocumentScanFlowController_documentCameraViewController_didFinishWithScan___block_invoke;
  v8[3] = &unk_263FA3168;
  objc_copyWeak(&v9, &location);
  [(CAMDocumentScanFlowController *)self _asyncConvertToPDFAndWrite:v7 completionHandler:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __80__CAMDocumentScanFlowController_documentCameraViewController_didFinishWithScan___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handlePDFResults:v3];
}

- (void)_handlePDFResults:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    -[CAMDocumentScanFlowController set_url:](self, "set_url:");
    id v4 = objc_alloc_init(MEMORY[0x263F16098]);
    [v4 setModalPresentationStyle:0];
    [v4 setModalTransitionStyle:2];
    [v4 setDataSource:self];
    [v4 setDelegate:self];
    v24 = [MEMORY[0x263F827E8] systemImageNamed:@"trash"];
    v25 = [MEMORY[0x263F827E8] systemImageNamed:@"square.and.arrow.down"];
    v5 = (void *)MEMORY[0x263F823D0];
    id v6 = CAMLocalizedFrameworkString(@"DOCUMENT_SCANNING_SAVE_TO_FILES", 0);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __51__CAMDocumentScanFlowController__handlePDFResults___block_invoke;
    v27[3] = &unk_263FA3190;
    v27[4] = self;
    id v7 = [v5 actionWithTitle:v6 image:v25 identifier:@"save" handler:v27];

    v8 = (void *)MEMORY[0x263F823D0];
    id v9 = CAMLocalizedFrameworkString(@"DOCUMENT_SCANNING_DELETE", 0);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __51__CAMDocumentScanFlowController__handlePDFResults___block_invoke_2;
    v26[3] = &unk_263FA3190;
    v26[4] = self;
    v10 = [v8 actionWithTitle:v9 image:v24 identifier:@"delete" handler:v26];

    [v10 setAttributes:2];
    v11 = (void *)MEMORY[0x263F82940];
    v30[0] = v10;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    v13 = [v11 menuWithTitle:&stru_26BD78BA0 image:0 identifier:@"destructive.options" options:1 children:v12];

    v14 = (void *)MEMORY[0x263F82940];
    v29[0] = v7;
    v29[1] = v13;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
    v16 = [v14 menuWithChildren:v15];

    v17 = [v4 navigationItem];
    [v17 setHidesBackButton:1];

    id v18 = objc_alloc(MEMORY[0x263F824A8]);
    v19 = CAMLocalizedFrameworkString(@"DOCUMENT_SCANNING_DONE", 0);
    v20 = (void *)[v18 initWithTitle:v19 menu:v16];
    v21 = [v4 navigationItem];
    [v21 setLeftBarButtonItem:v20];

    id v28 = v4;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
    [(CAMDocumentScanFlowController *)self setViewControllers:v22 animated:1];
  }
  else
  {
    v23 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CAMDocumentScanFlowController _handlePDFResults:](v23);
    }

    id v4 = [(CAMDocumentScanFlowController *)self documentFlowDelegate];
    [v4 documentScanFlowControllerDidFail:self withError:0];
  }
}

void __51__CAMDocumentScanFlowController__handlePDFResults___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F82698]);
  id v3 = [*(id *)(a1 + 32) _url];
  v6[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v5 = (void *)[v2 initForExportingURLs:v4 asCopy:1];

  [v5 setDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
}

void __51__CAMDocumentScanFlowController__handlePDFResults___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) documentFlowDelegate];
  [v2 documentScanFlowControllerDidFinish:*(void *)(a1 + 32)];
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  id v4 = [(CAMDocumentScanFlowController *)self documentFlowDelegate];
  [v4 documentScanFlowControllerDidCancel:self];
}

- (void)documentCameraViewController:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(CAMDocumentScanFlowController *)self documentFlowDelegate];
  [v6 documentScanFlowControllerDidFail:self withError:v5];
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  id v3 = [(CAMDocumentScanFlowController *)self _url];
  int64_t v4 = v3 != 0;

  return v4;
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  return 0;
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v5 = [(CAMDocumentScanFlowController *)self documentFlowDelegate];
  [v5 documentScanFlowControllerDidFinish:self];
}

- (id)_pdfConversionQueue
{
  if (_pdfConversionQueue_onceToken != -1) {
    dispatch_once(&_pdfConversionQueue_onceToken, &__block_literal_global_19);
  }
  id v2 = (void *)_pdfConversionQueue__conversionQueue;
  return v2;
}

void __52__CAMDocumentScanFlowController__pdfConversionQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.camera.pdf-conversion-queue", attr);
  id v2 = (void *)_pdfConversionQueue__conversionQueue;
  _pdfConversionQueue__conversionQueue = (uint64_t)v1;
}

- (void)_asyncConvertToPDFAndWrite:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_class();
  id v9 = [MEMORY[0x263EFF910] now];
  v10 = [v8 nameForDocumentWithDate:v9];

  v11 = [(CAMDocumentScanFlowController *)self _pdfConversionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__CAMDocumentScanFlowController__asyncConvertToPDFAndWrite_completionHandler___block_invoke;
  block[3] = &unk_263FA31E0;
  id v16 = v6;
  id v17 = v10;
  id v18 = v7;
  id v12 = v7;
  id v13 = v10;
  id v14 = v6;
  dispatch_async(v11, block);
}

void __78__CAMDocumentScanFlowController__asyncConvertToPDFAndWrite_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __78__CAMDocumentScanFlowController__asyncConvertToPDFAndWrite_completionHandler___block_invoke_2;
  v3[3] = &unk_263FA31B8;
  id v4 = *(id *)(a1 + 48);
  +[CAMPDFConverter convertToPDFAndWrite:v1 documentName:v2 completionHandler:v3];
}

void __78__CAMDocumentScanFlowController__asyncConvertToPDFAndWrite_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __78__CAMDocumentScanFlowController__asyncConvertToPDFAndWrite_completionHandler___block_invoke_3;
  v6[3] = &unk_263FA0C08;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __78__CAMDocumentScanFlowController__asyncConvertToPDFAndWrite_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)nameForDocumentWithDate:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateStyle:1];
  [v5 setTimeStyle:0];
  id v6 = [v5 stringFromDate:v4];
  id v7 = [MEMORY[0x263F08790] localizedStringFromDate:v4 dateStyle:0 timeStyle:2];

  id v8 = CAMLocalizedFrameworkString(@"DOCUMENT_SCANNING_FILENAME", @"Document Scanning component of the file name");
  id v9 = CAMLocalizedFrameworkString(@"DOCUMENT_SCANNING_FILENAME_FORMAT_STRING", @"General format string for the file name. English format is DOCUMENT_SCANNING_FILENAME DATE at TIME");
  v10 = [NSString stringWithValidatedFormat:v9, @"%@%@%@", 0, v8, v6, v7 validFormatSpecifiers error];
  v11 = [v10 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];

  id v12 = [v11 stringByReplacingOccurrencesOfString:@":" withString:@"."];

  return v12;
}

- (CAMDocumentScanFlowControllerDelegate)documentFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_documentFlowDelegate);
  return (CAMDocumentScanFlowControllerDelegate *)WeakRetained;
}

- (void)setDocumentFlowDelegate:(id)a3
{
}

- (NSURL)_url
{
  return self->__url;
}

- (void)set_url:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__url, 0);
  objc_destroyWeak((id *)&self->_documentFlowDelegate);
}

- (void)_handlePDFResults:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Document scanner: error converting scanned images to PDF", v1, 2u);
}

@end