@interface ICRemoteDocCamViewController
- (BOOL)_canShowWhileLocked;
- (ICDocCamImageCache)imageCache;
- (ICRemoteDocCamViewController)initWithImageCache:(id)a3;
- (ICRemoteDocCamViewControllerDelegate)delegate;
- (SidecarRequest)sidecarRequest;
- (SidecarService)sidecarService;
- (id)makeAlertControllerForError:(id)a3;
- (id)makeDevicesAlertController;
- (id)makeNoDevicesAlertController;
- (id)makeProgressAlertControllerForDevice:(id)a3;
- (id)progressAlertMessageForDevice:(id)a3;
- (uint64_t)viewDidLoad;
- (void)cancelSidecarRequest;
- (void)makeSidecarRequestToDevice:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setSidecarRequest:(id)a3;
- (void)setSidecarService:(id)a3;
- (void)sidecarRequestDidFinish;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ICRemoteDocCamViewController

- (ICRemoteDocCamViewController)initWithImageCache:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICRemoteDocCamViewController;
  v6 = [(ICRemoteDocCamViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_imageCache, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)ICRemoteDocCamViewController;
  [(ICRemoteDocCamViewController *)&v11 viewDidLoad];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v3 = (void *)getSidecarServiceClass_softClass;
  uint64_t v20 = getSidecarServiceClass_softClass;
  if (!getSidecarServiceClass_softClass)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __getSidecarServiceClass_block_invoke;
    v15 = &unk_2642A9738;
    v16 = &v17;
    __getSidecarServiceClass_block_invoke((uint64_t)&v12);
    v3 = (void *)v18[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v17, 8);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  id v5 = (id *)getSidecarServiceNameScanDocumentSymbolLoc_ptr;
  uint64_t v20 = getSidecarServiceNameScanDocumentSymbolLoc_ptr;
  if (!getSidecarServiceNameScanDocumentSymbolLoc_ptr)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __getSidecarServiceNameScanDocumentSymbolLoc_block_invoke;
    v15 = &unk_2642A9738;
    v16 = &v17;
    v6 = (void *)SidecarCoreLibrary();
    v7 = dlsym(v6, "SidecarServiceNameScanDocument");
    *(void *)(v16[1] + 24) = v7;
    getSidecarServiceNameScanDocumentSymbolLoc_ptr = *(void *)(v16[1] + 24);
    id v5 = (id *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v5)
  {
    v10 = (_Unwind_Exception *)-[ICRemoteDocCamViewController viewDidLoad]();
    _Block_object_dispose(&v17, 8);
    _Unwind_Resume(v10);
  }
  id v8 = *v5;
  objc_super v9 = [v4 serviceWithName:v8];
  [(ICRemoteDocCamViewController *)self setSidecarService:v9];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICRemoteDocCamViewController viewDidAppear:]();
  }

  v7.receiver = self;
  v7.super_class = (Class)ICRemoteDocCamViewController;
  [(ICRemoteDocCamViewController *)&v7 viewDidAppear:v3];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__ICRemoteDocCamViewController_viewDidAppear___block_invoke;
  v6[3] = &unk_2642A9250;
  v6[4] = self;
  dc_dispatchMainAfterDelay(v6, 0.3);
}

void __46__ICRemoteDocCamViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sidecarService];
  BOOL v3 = [v2 devices];
  uint64_t v4 = [v3 count];

  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v6 = [v5 sidecarService];
    objc_super v7 = [v6 devices];
    uint64_t v8 = [v7 count];

    objc_super v9 = *(void **)(a1 + 32);
    if (v8 == 1)
    {
      id v13 = [*(id *)(a1 + 32) sidecarService];
      v10 = [v13 devices];
      objc_super v11 = [v10 firstObject];
      [v9 makeSidecarRequestToDevice:v11];

      goto LABEL_7;
    }
    uint64_t v12 = [*(id *)(a1 + 32) makeDevicesAlertController];
  }
  else
  {
    uint64_t v12 = [v5 makeNoDevicesAlertController];
  }
  id v13 = (id)v12;
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:");
LABEL_7:
}

- (id)makeNoDevicesAlertController
{
  BOOL v3 = +[DCLocalization localizedStringForKey:@"Can’t Scan Document" value:@"Can’t Scan Document" table:@"Localizable"];
  uint64_t v4 = +[DCLocalization localizedStringForKey:@"There are no nearby devices signed into the same iCloud account." value:@"There are no nearby devices signed into the same iCloud account." table:@"Localizable"];
  id v5 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v3 message:v4 preferredStyle:1];
  v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"ipad.and.iphone"];
  [v5 setImage:v6];

  objc_super v7 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v8 = +[DCLocalization localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__ICRemoteDocCamViewController_makeNoDevicesAlertController__block_invoke;
  v11[3] = &unk_2642A93D8;
  v11[4] = self;
  objc_super v9 = [v7 actionWithTitle:v8 style:1 handler:v11];
  [v5 addAction:v9];

  return v5;
}

void __60__ICRemoteDocCamViewController_makeNoDevicesAlertController__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteDocumentCameraControllerDidCancel:*(void *)(a1 + 32)];
}

- (id)makeDevicesAlertController
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[DCLocalization localizedStringForKey:@"Scan a Document" value:@"Scan a Document" table:@"Localizable"];
  v21 = +[DCLocalization localizedStringForKey:@"Select which device camera to use for scanning a document." value:@"Select which device camera to use for scanning a document." table:@"Localizable"];
  v22 = (void *)v3;
  uint64_t v4 = objc_msgSend(MEMORY[0x263F1C3F8], "alertControllerWithTitle:message:preferredStyle:", v3);
  id v5 = [MEMORY[0x263F1C6B0] systemImageNamed:@"ipad.and.iphone"];
  [v4 setImage:v5];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v6 = self;
  objc_super v7 = [(ICRemoteDocCamViewController *)self sidecarService];
  uint64_t v8 = [v7 devices];

  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x263F1C3F0];
        v15 = [v13 name];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __58__ICRemoteDocCamViewController_makeDevicesAlertController__block_invoke;
        v25[3] = &unk_2642A9388;
        v25[4] = v6;
        v25[5] = v13;
        v16 = [v14 actionWithTitle:v15 style:0 handler:v25];
        [v4 addAction:v16];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  uint64_t v17 = (void *)MEMORY[0x263F1C3F0];
  v18 = +[DCLocalization localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __58__ICRemoteDocCamViewController_makeDevicesAlertController__block_invoke_2;
  v24[3] = &unk_2642A93D8;
  v24[4] = v6;
  uint64_t v19 = [v17 actionWithTitle:v18 style:1 handler:v24];
  [v4 addAction:v19];

  return v4;
}

uint64_t __58__ICRemoteDocCamViewController_makeDevicesAlertController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeSidecarRequestToDevice:*(void *)(a1 + 40)];
}

uint64_t __58__ICRemoteDocCamViewController_makeDevicesAlertController__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelSidecarRequest];
}

- (id)progressAlertMessageForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 deviceType];
  id v5 = [MEMORY[0x263F1D920] importedTypeWithIdentifier:@"com.apple.iphone"];
  int v6 = [v4 conformsToType:v5];

  if (v6)
  {
    objc_super v7 = @"Using your iPhone’s camera to scan a document.";
  }
  else
  {
    uint64_t v8 = [v3 deviceType];
    uint64_t v9 = [MEMORY[0x263F1D920] importedTypeWithIdentifier:@"com.apple.ipad"];
    int v10 = [v8 conformsToType:v9];

    if (v10)
    {
      objc_super v7 = @"Using your iPad’s camera to scan a document.";
    }
    else
    {
      uint64_t v11 = [v3 deviceType];
      uint64_t v12 = [MEMORY[0x263F1D920] importedTypeWithIdentifier:@"com.apple.ipod"];
      int v13 = [v11 conformsToType:v12];

      if (v13) {
        objc_super v7 = @"Using your iPod’s camera to scan a document.";
      }
      else {
        objc_super v7 = @"Using your device’s camera to scan a document.";
      }
    }
  }
  v14 = +[DCLocalization localizedStringForKey:v7 value:v7 table:@"Localizable"];

  return v14;
}

- (id)makeProgressAlertControllerForDevice:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  int v6 = +[DCLocalization localizedStringForKey:@"Scanning Document with “%@”…" value:@"Scanning Document with “%@”…" table:@"Localizable"];
  objc_super v7 = [v5 name];
  uint64_t v8 = objc_msgSend(v4, "localizedStringWithFormat:", v6, v7);

  uint64_t v9 = [(ICRemoteDocCamViewController *)self progressAlertMessageForDevice:v5];

  int v10 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v8 message:v9 preferredStyle:1];
  uint64_t v11 = [MEMORY[0x263F1C6B0] systemImageNamed:@"ipad.and.iphone"];
  [v10 setImage:v11];

  uint64_t v12 = (void *)MEMORY[0x263F1C3F0];
  int v13 = +[DCLocalization localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__ICRemoteDocCamViewController_makeProgressAlertControllerForDevice___block_invoke;
  v16[3] = &unk_2642A93D8;
  v16[4] = self;
  v14 = [v12 actionWithTitle:v13 style:1 handler:v16];
  [v10 addAction:v14];

  return v10;
}

void __69__ICRemoteDocCamViewController_makeProgressAlertControllerForDevice___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteDocumentCameraControllerDidCancel:*(void *)(a1 + 32)];
}

- (id)makeAlertControllerForError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F1C3F8];
  int v6 = [v4 localizedDescription];
  objc_super v7 = [v5 alertControllerWithTitle:v6 message:0 preferredStyle:1];

  uint64_t v8 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle"];
  [v7 setImage:v8];

  uint64_t v9 = (void *)MEMORY[0x263F1C3F0];
  int v10 = +[DCLocalization localizedStringForKey:@"OK" value:@"OK" table:@"Localizable"];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __60__ICRemoteDocCamViewController_makeAlertControllerForError___block_invoke;
  uint64_t v17 = &unk_2642A9388;
  v18 = self;
  id v19 = v4;
  id v11 = v4;
  uint64_t v12 = [v9 actionWithTitle:v10 style:1 handler:&v14];
  objc_msgSend(v7, "addAction:", v12, v14, v15, v16, v17, v18);

  return v7;
}

void __60__ICRemoteDocCamViewController_makeAlertControllerForError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteDocumentCameraController:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)makeSidecarRequestToDevice:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICRemoteDocCamViewController makeSidecarRequestToDevice:]();
  }

  int v6 = [(ICRemoteDocCamViewController *)self makeProgressAlertControllerForDevice:v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__ICRemoteDocCamViewController_makeSidecarRequestToDevice___block_invoke;
  v8[3] = &unk_2642A9360;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(ICRemoteDocCamViewController *)self presentViewController:v6 animated:1 completion:v8];
}

void __59__ICRemoteDocCamViewController_makeSidecarRequestToDevice___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id v2 = [*(id *)(a1 + 32) sidecarService];
  id v3 = [v2 makeRequestToDevice:v1[1]];
  [*v1 setSidecarRequest:v3];

  id v4 = [*v1 sidecarRequest];
  [v4 addObserver:*v1 forKeyPath:@"finished" options:0 context:&ICRemoteViewControllerKVOContext];

  id v5 = [*v1 sidecarRequest];
  [v5 start];

  int v6 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __59__ICRemoteDocCamViewController_makeSidecarRequestToDevice___block_invoke_cold_1(v1);
  }
}

- (void)cancelSidecarRequest
{
  v1 = [a1 sidecarRequest];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_217885000, v2, v3, "Canceling sidecar request… {request: %@}", v4, v5, v6, v7, v8);
}

void __52__ICRemoteDocCamViewController_cancelSidecarRequest__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sidecarRequest];
  [v2 cancel];

  [*(id *)(a1 + 32) setSidecarRequest:0];
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  [v3 remoteDocumentCameraControllerDidCancel:*(void *)(a1 + 32)];

  uint64_t v4 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __52__ICRemoteDocCamViewController_cancelSidecarRequest__block_invoke_cold_1();
  }
}

- (void)sidecarRequestDidFinish
{
  v1 = [a1 sidecarRequest];
  uint64_t v2 = [v1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_217885000, v3, v4, "Sidecar request finished {error: %@}", v5, v6, v7, v8, v9);
}

uint64_t __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 32) sidecarRequest];
  uint64_t v3 = [v2 error];

  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_cold_1(v1, v4);
    }

    id v5 = *v1;
    uint64_t v6 = [*v1 sidecarRequest];
    uint64_t v7 = [v6 error];
    uint64_t v8 = [v5 makeAlertControllerForError:v7];

    [*v1 presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    uint8_t v9 = [*v1 sidecarRequest];
    int v10 = [v9 items];
    id v11 = [*v1 imageCache];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_69;
    v13[3] = &unk_2642A9C80;
    v13[4] = *v1;
    +[ICDocCamDocumentInfoCollection infoCollectionFromSidecarItems:v10 imageCache:v11 completion:v13];
  }
  return [*v1 setSidecarRequest:0];
}

void __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.documentcamera", "");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_69_cold_2();
    }

    uint64_t v6 = [*(id *)(a1 + 32) delegate];
    [v6 remoteDocumentCameraController:*(void *)(a1 + 32) didFinishWithInfoCollection:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_69_cold_1();
    }

    uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.documentcamera" code:2 userInfo:0];
    uint64_t v7 = [*(id *)(a1 + 32) delegate];
    [v7 remoteDocumentCameraController:*(void *)(a1 + 32) didFailWithError:v6];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a6 == &ICRemoteViewControllerKVOContext)
  {
    id v12 = [(ICRemoteDocCamViewController *)self sidecarRequest];
    if (v12 == v11)
    {
      int v13 = [v10 isEqualToString:@"finished"];

      if (v13)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __79__ICRemoteDocCamViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_2642A9250;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
    else
    {
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICRemoteDocCamViewController;
    [(ICRemoteDocCamViewController *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:a5 context:a6];
  }
}

uint64_t __79__ICRemoteDocCamViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sidecarRequestDidFinish];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (ICRemoteDocCamViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICRemoteDocCamViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SidecarService)sidecarService
{
  return self->_sidecarService;
}

- (void)setSidecarService:(id)a3
{
}

- (SidecarRequest)sidecarRequest
{
  return self->_sidecarRequest;
}

- (void)setSidecarRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidecarRequest, 0);
  objc_storeStrong((id *)&self->_sidecarService, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_imageCache, 0);
}

- (uint64_t)viewDidLoad
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[ICRemoteDocCamViewController viewDidAppear:](v0);
}

- (void)viewDidAppear:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217885000, v0, v1, "Starting remote document scan…", v2, v3, v4, v5, v6);
}

- (void)makeSidecarRequestToDevice:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_217885000, v0, OS_LOG_TYPE_DEBUG, "Making sidecar request… {device: %@}", v1, 0xCu);
}

void __59__ICRemoteDocCamViewController_makeSidecarRequestToDevice___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 sidecarRequest];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_217885000, v2, v3, "Made sidecar request {request: %@}", v4, v5, v6, v7, v8);
}

void __52__ICRemoteDocCamViewController_cancelSidecarRequest__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217885000, v0, v1, "Canceled sidecar request", v2, v3, v4, v5, v6);
}

void __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 sidecarRequest];
  uint64_t v4 = [v3 error];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_217885000, a2, OS_LOG_TYPE_ERROR, "Finishing remote document scan with error… {error: %@}", v5, 0xCu);
}

void __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_69_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_217885000, v0, OS_LOG_TYPE_ERROR, "Finishing remote document scan without collection…", v1, 2u);
}

void __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_69_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217885000, v0, v1, "Finishing remote document scan with collection…", v2, v3, v4, v5, v6);
}

@end