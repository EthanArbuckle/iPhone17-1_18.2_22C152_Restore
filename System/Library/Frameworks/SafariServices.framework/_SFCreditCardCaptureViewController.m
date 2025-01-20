@interface _SFCreditCardCaptureViewController
+ (BOOL)canCapture;
- (_SFCreditCardCaptureViewController)init;
- (void)_cancel:(id)a3;
- (void)cameraReader:(id)a3 didFailWithError:(id)a4;
- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4;
- (void)cameraReaderDidCancel:(id)a3;
- (void)cameraReaderDidEnd:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation _SFCreditCardCaptureViewController

+ (BOOL)canCapture
{
  return [getCRCameraReaderClass() supportedCameraCount] != 0;
}

- (_SFCreditCardCaptureViewController)init
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)_SFCreditCardCaptureViewController;
  v2 = [(_SFCreditCardCaptureViewController *)&v30 init];
  if (v2)
  {
    v3 = (CRCameraReader *)objc_alloc_init((Class)getCRCameraReaderClass());
    reader = v2->_reader;
    v2->_reader = v3;

    v5 = [(CRCameraReader *)v2->_reader view];
    v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 bounds];
    objc_msgSend(v5, "setFrame:");

    [(CRCameraReader *)v2->_reader setDelegate:v2];
    v7 = v2->_reader;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    v8 = (id *)getCROutputTypeCreditCardCardholderNameSymbolLoc_ptr;
    uint64_t v39 = getCROutputTypeCreditCardCardholderNameSymbolLoc_ptr;
    if (!getCROutputTypeCreditCardCardholderNameSymbolLoc_ptr)
    {
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __getCROutputTypeCreditCardCardholderNameSymbolLoc_block_invoke;
      v34 = &unk_1E5C723B0;
      v35 = &v36;
      v9 = (void *)CoreRecognitionLibrary();
      v10 = dlsym(v9, "CROutputTypeCreditCardCardholderName");
      *(void *)(v35[1] + 24) = v10;
      getCROutputTypeCreditCardCardholderNameSymbolLoc_ptr = *(void *)(v35[1] + 24);
      v8 = (id *)v37[3];
    }
    _Block_object_dispose(&v36, 8);
    if (!v8) {
      goto LABEL_13;
    }
    id v11 = *v8;
    v40[0] = v11;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    v12 = (id *)getCROutputTypeCreditCardExpirationDateSymbolLoc_ptr;
    uint64_t v39 = getCROutputTypeCreditCardExpirationDateSymbolLoc_ptr;
    if (!getCROutputTypeCreditCardExpirationDateSymbolLoc_ptr)
    {
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __getCROutputTypeCreditCardExpirationDateSymbolLoc_block_invoke;
      v34 = &unk_1E5C723B0;
      v35 = &v36;
      v13 = (void *)CoreRecognitionLibrary();
      v14 = dlsym(v13, "CROutputTypeCreditCardExpirationDate");
      *(void *)(v35[1] + 24) = v14;
      getCROutputTypeCreditCardExpirationDateSymbolLoc_ptr = *(void *)(v35[1] + 24);
      v12 = (id *)v37[3];
    }
    _Block_object_dispose(&v36, 8);
    if (!v12) {
      goto LABEL_13;
    }
    id v15 = *v12;
    v40[1] = v15;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    v16 = (id *)getCROutputTypeCreditCardNumberSymbolLoc_ptr;
    uint64_t v39 = getCROutputTypeCreditCardNumberSymbolLoc_ptr;
    if (!getCROutputTypeCreditCardNumberSymbolLoc_ptr)
    {
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __getCROutputTypeCreditCardNumberSymbolLoc_block_invoke;
      v34 = &unk_1E5C723B0;
      v35 = &v36;
      v17 = (void *)CoreRecognitionLibrary();
      v18 = dlsym(v17, "CROutputTypeCreditCardNumber");
      *(void *)(v35[1] + 24) = v18;
      getCROutputTypeCreditCardNumberSymbolLoc_ptr = *(void *)(v35[1] + 24);
      v16 = (id *)v37[3];
    }
    _Block_object_dispose(&v36, 8);
    if (!v16)
    {
LABEL_13:
      -[SFDefaultBrowserListView productDetailsUserDidInteractWithApp:interactionType:]();
      __break(1u);
    }
    id v41 = *v16;
    v19 = (void *)MEMORY[0x1E4F1C978];
    id v20 = v41;
    v21 = [v19 arrayWithObjects:v40 count:3];
    [(CRCameraReader *)v7 setOutputObjectTypes:v21];

    [(_SFCreditCardCaptureViewController *)v2 pushViewController:v2->_reader animated:0];
    v22 = [(CRCameraReader *)v2->_reader navigationController];
    v23 = [v22 navigationBar];

    v24 = [v23 standardAppearance];
    [v23 setScrollEdgeAppearance:v24];

    v25 = [(CRCameraReader *)v2->_reader navigationItem];
    v26 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v2 action:sel__cancel_];
    [v25 setLeftBarButtonItem:v26];

    v27 = _WBSLocalizedString();
    [v25 setTitle:v27];

    v28 = v2;
  }

  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFCreditCardCaptureViewController;
  [(_SFCreditCardCaptureViewController *)&v4 viewDidAppear:a3];
  [(CRCameraReader *)self->_reader start];
}

- (void)_cancel:(id)a3
{
}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  v5 = [(_SFCreditCardCaptureViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68___SFCreditCardCaptureViewController_cameraReader_didFailWithError___block_invoke;
    block[3] = &unk_1E5C724D8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)cameraReaderDidEnd:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___SFCreditCardCaptureViewController_cameraReaderDidEnd___block_invoke;
  block[3] = &unk_1E5C724D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)cameraReaderDidCancel:(id)a3
{
  objc_super v4 = [(_SFCreditCardCaptureViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60___SFCreditCardCaptureViewController_cameraReaderDidCancel___block_invoke;
    block[3] = &unk_1E5C724D8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  char v5 = (objc_class *)MEMORY[0x1E4F98A88];
  id v6 = a4;
  v7 = (WBSCreditCardData *)[[v5 alloc] initWithCameraReaderOutput:v6];

  receivedCardData = self->_receivedCardData;
  self->_receivedCardData = v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedCardData, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end