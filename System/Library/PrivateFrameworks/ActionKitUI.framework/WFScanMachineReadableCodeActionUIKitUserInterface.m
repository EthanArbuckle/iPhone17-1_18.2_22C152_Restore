@interface WFScanMachineReadableCodeActionUIKitUserInterface
- (UINavigationController)navigationController;
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithCode:(id)a3 error:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)showWithCompletionHandler:(id)a3;
@end

@implementation WFScanMachineReadableCodeActionUIKitUserInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setNavigationController:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)finishWithCode:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(WFScanMachineReadableCodeActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    v8 = [(WFScanMachineReadableCodeActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFScanMachineReadableCodeActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __93__WFScanMachineReadableCodeActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFScanMachineReadableCodeActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __93__WFScanMachineReadableCodeActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithCode:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)showWithCompletionHandler:(id)a3
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v46 = [MEMORY[0x263F08690] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 45, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    id v5 = 0;
  }
  v78 = v5;
  -[WFScanMachineReadableCodeActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:");
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  objc_super v6 = (id *)getAVMetadataObjectTypeUPCECodeSymbolLoc_ptr;
  uint64_t v90 = getAVMetadataObjectTypeUPCECodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeUPCECodeSymbolLoc_ptr)
  {
    uint64_t v82 = MEMORY[0x263EF8330];
    uint64_t v83 = 3221225472;
    v84 = __getAVMetadataObjectTypeUPCECodeSymbolLoc_block_invoke;
    v85 = &unk_264900EF8;
    v86 = &v87;
    v7 = AVFoundationLibrary();
    v88[3] = (uint64_t)dlsym(v7, "AVMetadataObjectTypeUPCECode");
    getAVMetadataObjectTypeUPCECodeSymbolLoc_ptr = *(void *)(v86[1] + 24);
    objc_super v6 = (id *)v88[3];
  }
  _Block_object_dispose(&v87, 8);
  if (!v6)
  {
    v47 = [MEMORY[0x263F08690] currentHandler];
    v48 = [NSString stringWithUTF8String:"AVMetadataObjectType getAVMetadataObjectTypeUPCECode(void)"];
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 19, @"%s", dlerror());

    goto LABEL_56;
  }
  id v8 = *v6;
  v91[0] = v8;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  id v9 = (id *)getAVMetadataObjectTypeCode39CodeSymbolLoc_ptr;
  uint64_t v90 = getAVMetadataObjectTypeCode39CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeCode39CodeSymbolLoc_ptr)
  {
    uint64_t v82 = MEMORY[0x263EF8330];
    uint64_t v83 = 3221225472;
    v84 = __getAVMetadataObjectTypeCode39CodeSymbolLoc_block_invoke;
    v85 = &unk_264900EF8;
    v86 = &v87;
    v10 = AVFoundationLibrary();
    v88[3] = (uint64_t)dlsym(v10, "AVMetadataObjectTypeCode39Code");
    getAVMetadataObjectTypeCode39CodeSymbolLoc_ptr = *(void *)(v86[1] + 24);
    id v9 = (id *)v88[3];
  }
  _Block_object_dispose(&v87, 8);
  if (!v9)
  {
    v49 = [MEMORY[0x263F08690] currentHandler];
    v50 = [NSString stringWithUTF8String:"AVMetadataObjectType getAVMetadataObjectTypeCode39Code(void)"];
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 20, @"%s", dlerror());

    goto LABEL_56;
  }
  id v11 = *v9;
  v91[1] = v11;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  v12 = (id *)getAVMetadataObjectTypeCode39Mod43CodeSymbolLoc_ptr;
  uint64_t v90 = getAVMetadataObjectTypeCode39Mod43CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeCode39Mod43CodeSymbolLoc_ptr)
  {
    uint64_t v82 = MEMORY[0x263EF8330];
    uint64_t v83 = 3221225472;
    v84 = __getAVMetadataObjectTypeCode39Mod43CodeSymbolLoc_block_invoke;
    v85 = &unk_264900EF8;
    v86 = &v87;
    v13 = AVFoundationLibrary();
    v88[3] = (uint64_t)dlsym(v13, "AVMetadataObjectTypeCode39Mod43Code");
    getAVMetadataObjectTypeCode39Mod43CodeSymbolLoc_ptr = *(void *)(v86[1] + 24);
    v12 = (id *)v88[3];
  }
  _Block_object_dispose(&v87, 8);
  if (!v12)
  {
    v51 = [MEMORY[0x263F08690] currentHandler];
    v52 = [NSString stringWithUTF8String:"AVMetadataObjectType getAVMetadataObjectTypeCode39Mod43Code(void)"];
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 21, @"%s", dlerror());

    goto LABEL_56;
  }
  id v14 = *v12;
  v91[2] = v14;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  v15 = (id *)getAVMetadataObjectTypeEAN13CodeSymbolLoc_ptr;
  uint64_t v90 = getAVMetadataObjectTypeEAN13CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeEAN13CodeSymbolLoc_ptr)
  {
    uint64_t v82 = MEMORY[0x263EF8330];
    uint64_t v83 = 3221225472;
    v84 = __getAVMetadataObjectTypeEAN13CodeSymbolLoc_block_invoke;
    v85 = &unk_264900EF8;
    v86 = &v87;
    v16 = AVFoundationLibrary();
    v88[3] = (uint64_t)dlsym(v16, "AVMetadataObjectTypeEAN13Code");
    getAVMetadataObjectTypeEAN13CodeSymbolLoc_ptr = *(void *)(v86[1] + 24);
    v15 = (id *)v88[3];
  }
  _Block_object_dispose(&v87, 8);
  if (!v15)
  {
    v53 = [MEMORY[0x263F08690] currentHandler];
    v54 = [NSString stringWithUTF8String:"AVMetadataObjectType getAVMetadataObjectTypeEAN13Code(void)"];
    objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 22, @"%s", dlerror());

    goto LABEL_56;
  }
  id v77 = *v15;
  v91[3] = v77;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  v17 = (id *)getAVMetadataObjectTypeEAN8CodeSymbolLoc_ptr;
  uint64_t v90 = getAVMetadataObjectTypeEAN8CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeEAN8CodeSymbolLoc_ptr)
  {
    uint64_t v82 = MEMORY[0x263EF8330];
    uint64_t v83 = 3221225472;
    v84 = __getAVMetadataObjectTypeEAN8CodeSymbolLoc_block_invoke;
    v85 = &unk_264900EF8;
    v86 = &v87;
    v18 = AVFoundationLibrary();
    v88[3] = (uint64_t)dlsym(v18, "AVMetadataObjectTypeEAN8Code");
    getAVMetadataObjectTypeEAN8CodeSymbolLoc_ptr = *(void *)(v86[1] + 24);
    v17 = (id *)v88[3];
  }
  _Block_object_dispose(&v87, 8);
  if (!v17)
  {
    v55 = [MEMORY[0x263F08690] currentHandler];
    v56 = [NSString stringWithUTF8String:"AVMetadataObjectType getAVMetadataObjectTypeEAN8Code(void)"];
    objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 23, @"%s", dlerror());

    goto LABEL_56;
  }
  id v76 = *v17;
  v91[4] = v76;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  v19 = (id *)getAVMetadataObjectTypeCode93CodeSymbolLoc_ptr;
  uint64_t v90 = getAVMetadataObjectTypeCode93CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeCode93CodeSymbolLoc_ptr)
  {
    uint64_t v82 = MEMORY[0x263EF8330];
    uint64_t v83 = 3221225472;
    v84 = __getAVMetadataObjectTypeCode93CodeSymbolLoc_block_invoke;
    v85 = &unk_264900EF8;
    v86 = &v87;
    v20 = AVFoundationLibrary();
    v88[3] = (uint64_t)dlsym(v20, "AVMetadataObjectTypeCode93Code");
    getAVMetadataObjectTypeCode93CodeSymbolLoc_ptr = *(void *)(v86[1] + 24);
    v19 = (id *)v88[3];
  }
  _Block_object_dispose(&v87, 8);
  if (!v19)
  {
    v57 = [MEMORY[0x263F08690] currentHandler];
    v58 = [NSString stringWithUTF8String:"AVMetadataObjectType getAVMetadataObjectTypeCode93Code(void)"];
    objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 24, @"%s", dlerror());

    goto LABEL_56;
  }
  id v21 = *v19;
  v91[5] = v21;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  v22 = (id *)getAVMetadataObjectTypeCode128CodeSymbolLoc_ptr;
  uint64_t v90 = getAVMetadataObjectTypeCode128CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeCode128CodeSymbolLoc_ptr)
  {
    uint64_t v82 = MEMORY[0x263EF8330];
    uint64_t v83 = 3221225472;
    v84 = __getAVMetadataObjectTypeCode128CodeSymbolLoc_block_invoke;
    v85 = &unk_264900EF8;
    v86 = &v87;
    v23 = AVFoundationLibrary();
    v88[3] = (uint64_t)dlsym(v23, "AVMetadataObjectTypeCode128Code");
    getAVMetadataObjectTypeCode128CodeSymbolLoc_ptr = *(void *)(v86[1] + 24);
    v22 = (id *)v88[3];
  }
  _Block_object_dispose(&v87, 8);
  if (!v22)
  {
    v59 = [MEMORY[0x263F08690] currentHandler];
    v60 = [NSString stringWithUTF8String:"AVMetadataObjectType getAVMetadataObjectTypeCode128Code(void)"];
    objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 25, @"%s", dlerror());

    goto LABEL_56;
  }
  id v24 = *v22;
  v91[6] = v24;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  v25 = (id *)getAVMetadataObjectTypePDF417CodeSymbolLoc_ptr;
  uint64_t v90 = getAVMetadataObjectTypePDF417CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypePDF417CodeSymbolLoc_ptr)
  {
    uint64_t v82 = MEMORY[0x263EF8330];
    uint64_t v83 = 3221225472;
    v84 = __getAVMetadataObjectTypePDF417CodeSymbolLoc_block_invoke;
    v85 = &unk_264900EF8;
    v86 = &v87;
    v26 = AVFoundationLibrary();
    v88[3] = (uint64_t)dlsym(v26, "AVMetadataObjectTypePDF417Code");
    getAVMetadataObjectTypePDF417CodeSymbolLoc_ptr = *(void *)(v86[1] + 24);
    v25 = (id *)v88[3];
  }
  _Block_object_dispose(&v87, 8);
  if (!v25)
  {
    v61 = [MEMORY[0x263F08690] currentHandler];
    v62 = [NSString stringWithUTF8String:"AVMetadataObjectType getAVMetadataObjectTypePDF417Code(void)"];
    objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 26, @"%s", dlerror());

    goto LABEL_56;
  }
  id v27 = *v25;
  v91[7] = v27;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  v28 = (id *)getAVMetadataObjectTypeQRCodeSymbolLoc_ptr;
  uint64_t v90 = getAVMetadataObjectTypeQRCodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeQRCodeSymbolLoc_ptr)
  {
    uint64_t v82 = MEMORY[0x263EF8330];
    uint64_t v83 = 3221225472;
    v84 = __getAVMetadataObjectTypeQRCodeSymbolLoc_block_invoke;
    v85 = &unk_264900EF8;
    v86 = &v87;
    v29 = AVFoundationLibrary();
    v88[3] = (uint64_t)dlsym(v29, "AVMetadataObjectTypeQRCode");
    getAVMetadataObjectTypeQRCodeSymbolLoc_ptr = *(void *)(v86[1] + 24);
    v28 = (id *)v88[3];
  }
  _Block_object_dispose(&v87, 8);
  if (!v28)
  {
    v63 = [MEMORY[0x263F08690] currentHandler];
    v64 = [NSString stringWithUTF8String:"AVMetadataObjectType getAVMetadataObjectTypeQRCode(void)"];
    objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 27, @"%s", dlerror());

    goto LABEL_56;
  }
  v74 = v8;
  v75 = v11;
  v73 = self;
  id v30 = *v28;
  v91[8] = v30;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  v31 = (id *)getAVMetadataObjectTypeAztecCodeSymbolLoc_ptr;
  uint64_t v90 = getAVMetadataObjectTypeAztecCodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeAztecCodeSymbolLoc_ptr)
  {
    uint64_t v82 = MEMORY[0x263EF8330];
    uint64_t v83 = 3221225472;
    v84 = __getAVMetadataObjectTypeAztecCodeSymbolLoc_block_invoke;
    v85 = &unk_264900EF8;
    v86 = &v87;
    v32 = AVFoundationLibrary();
    v88[3] = (uint64_t)dlsym(v32, "AVMetadataObjectTypeAztecCode");
    getAVMetadataObjectTypeAztecCodeSymbolLoc_ptr = *(void *)(v86[1] + 24);
    v31 = (id *)v88[3];
  }
  _Block_object_dispose(&v87, 8);
  if (!v31)
  {
    v65 = [MEMORY[0x263F08690] currentHandler];
    v66 = [NSString stringWithUTF8String:"AVMetadataObjectType getAVMetadataObjectTypeAztecCode(void)"];
    objc_msgSend(v65, "handleFailureInFunction:file:lineNumber:description:", v66, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 28, @"%s", dlerror());

    goto LABEL_56;
  }
  id v33 = *v31;
  v91[9] = v33;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  v34 = (id *)getAVMetadataObjectTypeInterleaved2of5CodeSymbolLoc_ptr;
  uint64_t v90 = getAVMetadataObjectTypeInterleaved2of5CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeInterleaved2of5CodeSymbolLoc_ptr)
  {
    uint64_t v82 = MEMORY[0x263EF8330];
    uint64_t v83 = 3221225472;
    v84 = __getAVMetadataObjectTypeInterleaved2of5CodeSymbolLoc_block_invoke;
    v85 = &unk_264900EF8;
    v86 = &v87;
    v35 = AVFoundationLibrary();
    v88[3] = (uint64_t)dlsym(v35, "AVMetadataObjectTypeInterleaved2of5Code");
    getAVMetadataObjectTypeInterleaved2of5CodeSymbolLoc_ptr = *(void *)(v86[1] + 24);
    v34 = (id *)v88[3];
  }
  _Block_object_dispose(&v87, 8);
  if (!v34)
  {
    v67 = [MEMORY[0x263F08690] currentHandler];
    v68 = [NSString stringWithUTF8String:"AVMetadataObjectType getAVMetadataObjectTypeInterleaved2of5Code(void)"];
    objc_msgSend(v67, "handleFailureInFunction:file:lineNumber:description:", v68, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 29, @"%s", dlerror());

    goto LABEL_56;
  }
  id v36 = *v34;
  v91[10] = v36;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  v37 = (id *)getAVMetadataObjectTypeITF14CodeSymbolLoc_ptr;
  uint64_t v90 = getAVMetadataObjectTypeITF14CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeITF14CodeSymbolLoc_ptr)
  {
    uint64_t v82 = MEMORY[0x263EF8330];
    uint64_t v83 = 3221225472;
    v84 = __getAVMetadataObjectTypeITF14CodeSymbolLoc_block_invoke;
    v85 = &unk_264900EF8;
    v86 = &v87;
    v38 = AVFoundationLibrary();
    v88[3] = (uint64_t)dlsym(v38, "AVMetadataObjectTypeITF14Code");
    getAVMetadataObjectTypeITF14CodeSymbolLoc_ptr = *(void *)(v86[1] + 24);
    v37 = (id *)v88[3];
  }
  _Block_object_dispose(&v87, 8);
  if (!v37)
  {
    v69 = [MEMORY[0x263F08690] currentHandler];
    v70 = [NSString stringWithUTF8String:"AVMetadataObjectType getAVMetadataObjectTypeITF14Code(void)"];
    objc_msgSend(v69, "handleFailureInFunction:file:lineNumber:description:", v70, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 30, @"%s", dlerror());

    goto LABEL_56;
  }
  id v39 = *v37;
  v91[11] = v39;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  v40 = (id *)getAVMetadataObjectTypeDataMatrixCodeSymbolLoc_ptr;
  uint64_t v90 = getAVMetadataObjectTypeDataMatrixCodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeDataMatrixCodeSymbolLoc_ptr)
  {
    uint64_t v82 = MEMORY[0x263EF8330];
    uint64_t v83 = 3221225472;
    v84 = __getAVMetadataObjectTypeDataMatrixCodeSymbolLoc_block_invoke;
    v85 = &unk_264900EF8;
    v86 = &v87;
    v41 = AVFoundationLibrary();
    v88[3] = (uint64_t)dlsym(v41, "AVMetadataObjectTypeDataMatrixCode");
    getAVMetadataObjectTypeDataMatrixCodeSymbolLoc_ptr = *(void *)(v86[1] + 24);
    v40 = (id *)v88[3];
  }
  _Block_object_dispose(&v87, 8);
  if (!v40)
  {
    v71 = [MEMORY[0x263F08690] currentHandler];
    v72 = [NSString stringWithUTF8String:"AVMetadataObjectType getAVMetadataObjectTypeDataMatrixCode(void)"];
    objc_msgSend(v71, "handleFailureInFunction:file:lineNumber:description:", v72, @"WFScanMachineReadableCodeActionUIKitUserInterface.m", 31, @"%s", dlerror());

LABEL_56:
    __break(1u);
  }
  id v92 = *v40;
  v42 = (void *)MEMORY[0x263EFF8C0];
  id v43 = v92;
  v44 = [v42 arrayWithObjects:v91 count:13];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke;
  block[3] = &unk_264900E88;
  id v80 = v44;
  v81 = v73;
  id v45 = v44;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [[CDZQRScanningViewController alloc] initWithMetadataObjectTypes:*(void *)(a1 + 32)];
  v3 = WFLocalizedString(@"Scan Code");
  [(CDZQRScanningViewController *)v2 setTitle:v3];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_264900318;
  v7[4] = *(void *)(a1 + 40);
  [(CDZQRScanningViewController *)v2 setResultBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_4;
  v6[3] = &unk_264900340;
  v6[4] = *(void *)(a1 + 40);
  [(CDZQRScanningViewController *)v2 setErrorBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_6;
  v5[3] = &unk_264900E20;
  v5[4] = *(void *)(a1 + 40);
  [(CDZQRScanningViewController *)v2 setCancelBlock:v5];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v2];
  [v4 setModalPresentationStyle:0];
  [*(id *)(a1 + 40) setNavigationController:v4];
  [*(id *)(a1 + 40) presentContent:v4];
}

void __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) navigationController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_264900E88;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  [v4 dismissViewControllerAnimated:1 completion:v7];
}

void __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) navigationController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_5;
  v6[3] = &unk_264900E88;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [v4 dismissViewControllerAnimated:1 completion:v6];
}

void __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationController];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_7;
  v3[3] = &unk_264900E20;
  v3[4] = *(void *)(a1 + 32);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

void __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] userCancelledError];
  [v1 finishWithCode:0 error:v2];
}

uint64_t __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithCode:0 error:*(void *)(a1 + 40)];
}

void __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F23220]) initWithMachineReadableCodeObject:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) finishWithCode:v2 error:0];
}

@end