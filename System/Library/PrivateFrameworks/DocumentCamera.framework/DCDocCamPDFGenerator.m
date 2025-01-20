@interface DCDocCamPDFGenerator
+ (NSFileManager)fileManager;
+ (OS_dispatch_queue)fileQueue;
+ (OS_dispatch_queue)syncGeneratorQueue;
+ (id)blockingGeneratepdfURLForDocumentInfoCollection:(id)a3 imageCache:(id)a4 withProgress:(id)a5 error:(id *)a6;
+ (id)folderPathForDocumentInfoCollection:(id)a3;
+ (id)folderPathForDocumentInfoCollectionIdentifier:(id)a3;
+ (id)pdfURLForDocumentInfoCollection:(id)a3;
+ (id)rootPDFFolderPath;
+ (id)versionPDFPathForDocumentInfoCollection:(id)a3;
+ (id)versionfolderPathForDocumentInfoCollection:(id)a3;
+ (void)createEmptyPDFFileAtURLIFNecessaryForDocumentInfoCollection:(id)a3;
+ (void)createTmpDirectory:(id)a3;
+ (void)deleteAllDocCamPDFs;
+ (void)deletePDFFolderIfExistsForDocumentInfoCollection:(id)a3;
+ (void)generatePDFsIfNecessaryForDocumentInfoCollection:(id)a3 imageCache:(id)a4 displayWindow:(id)a5 presentingViewController:(id)a6 completionHandler:(id)a7;
+ (void)initialize;
+ (void)performPDFGenerationWithGenerator:(id)a3 docInfoCollection:(id)a4 imageCache:(id)a5 progress:(id)a6;
@end

@implementation DCDocCamPDFGenerator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v4 = [a1 rootPDFFolderPath];
    v3 = [a1 fileManager];
    [v3 removeItemAtPath:v4 error:0];
  }
}

+ (OS_dispatch_queue)syncGeneratorQueue
{
  if (syncGeneratorQueue_onceToken != -1) {
    dispatch_once(&syncGeneratorQueue_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)syncGeneratorQueue_sSyncGeneratorQueue;

  return (OS_dispatch_queue *)v2;
}

void __42__DCDocCamPDFGenerator_syncGeneratorQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("PDF Sync Generator Queue", v2);
  v1 = (void *)syncGeneratorQueue_sSyncGeneratorQueue;
  syncGeneratorQueue_sSyncGeneratorQueue = (uint64_t)v0;
}

+ (OS_dispatch_queue)fileQueue
{
  if (fileQueue_onceToken != -1) {
    dispatch_once(&fileQueue_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)fileQueue_sFileQueue;

  return (OS_dispatch_queue *)v2;
}

void __33__DCDocCamPDFGenerator_fileQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("PDF File Queue", v2);
  v1 = (void *)fileQueue_sFileQueue;
  fileQueue_sFileQueue = (uint64_t)v0;
}

+ (NSFileManager)fileManager
{
  return (NSFileManager *)[MEMORY[0x263F08850] defaultManager];
}

+ (id)rootPDFFolderPath
{
  if (rootPDFFolderPath_onceToken != -1) {
    dispatch_once(&rootPDFFolderPath_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)rootPDFFolderPath_path;

  return v2;
}

void __41__DCDocCamPDFGenerator_rootPDFFolderPath__block_invoke()
{
  NSTemporaryDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"docCamTempPDFFolder"];
  v1 = (void *)rootPDFFolderPath_path;
  rootPDFFolderPath_path = v0;
}

+ (id)folderPathForDocumentInfoCollectionIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [a1 rootPDFFolderPath];
  v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

+ (id)folderPathForDocumentInfoCollection:(id)a3
{
  id v4 = [a3 uniqueIdentifier];
  v5 = [a1 folderPathForDocumentInfoCollectionIdentifier:v4];

  return v5;
}

+ (id)versionfolderPathForDocumentInfoCollection:(id)a3
{
  id v4 = a3;
  v5 = [a1 folderPathForDocumentInfoCollection:v4];
  v6 = NSNumber;
  uint64_t v7 = [v4 docCamPDFVersion];

  v8 = [v6 numberWithInteger:v7];
  v9 = [v8 stringValue];
  v10 = [v5 stringByAppendingPathComponent:v9];

  return v10;
}

+ (id)versionPDFPathForDocumentInfoCollection:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  objc_msgSend(v5, "dc_sanitizedFilenameString");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (![(__CFString *)v6 length])
  {

    v6 = @"Scanned Documents";
  }
  uint64_t v7 = [a1 versionfolderPathForDocumentInfoCollection:v4];
  v8 = [v7 stringByAppendingPathComponent:v6];

  v9 = [v8 stringByAppendingPathExtension:@"pdf"];

  return v9;
}

+ (void)createEmptyPDFFileAtURLIFNecessaryForDocumentInfoCollection:(id)a3
{
  id v4 = [a1 versionPDFPathForDocumentInfoCollection:a3];
  v5 = [NSURL fileURLWithPath:v4];
  v6 = [a1 fileQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__DCDocCamPDFGenerator_createEmptyPDFFileAtURLIFNecessaryForDocumentInfoCollection___block_invoke;
  v8[3] = &unk_2642A9298;
  id v9 = v5;
  id v10 = a1;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

void __84__DCDocCamPDFGenerator_createEmptyPDFFileAtURLIFNecessaryForDocumentInfoCollection___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v2 = *(void **)(a1 + 40);
    v3 = [*(id *)(a1 + 32) path];
    id v4 = [v3 stringByDeletingLastPathComponent];
    [v2 createTmpDirectory:v4];

    id v5 = [MEMORY[0x263EFF8F8] data];
    [v5 writeToURL:*(void *)(a1 + 32) atomically:1];
  }
}

+ (void)createTmpDirectory:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__DCDocCamPDFGenerator_createTmpDirectory___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v4 = createTmpDirectory__once;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&createTmpDirectory__once, block);
  }
  v6 = [a1 fileManager];
  [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];
}

void __43__DCDocCamPDFGenerator_createTmpDirectory___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *MEMORY[0x263F1D0E0];
  uint64_t v4 = [MEMORY[0x263F1C408] sharedApplication];
  [v5 addObserver:v2 selector:sel_applicationWillTerminate_ name:v3 object:v4];
}

+ (void)deletePDFFolderIfExistsForDocumentInfoCollection:(id)a3
{
  id v4 = a3;
  id v6 = [a1 fileManager];
  id v5 = [a1 folderPathForDocumentInfoCollection:v4];

  if ([v6 fileExistsAtPath:v5]) {
    [v6 removeItemAtPath:v5 error:0];
  }
}

+ (void)deleteAllDocCamPDFs
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_217885000, log, OS_LOG_TYPE_DEBUG, "Deleting All Doc Cam PDFs", v1, 2u);
}

void __43__DCDocCamPDFGenerator_deleteAllDocCamPDFs__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) fileManager];
  uint64_t v2 = [*(id *)(a1 + 32) rootPDFFolderPath];
  [v3 removeItemAtPath:v2 error:0];
}

+ (id)pdfURLForDocumentInfoCollection:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  id v5 = [a1 fileQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DCDocCamPDFGenerator_pdfURLForDocumentInfoCollection___block_invoke;
  block[3] = &unk_2642A9838;
  v11 = &v13;
  id v12 = a1;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __56__DCDocCamPDFGenerator_pdfURLForDocumentInfoCollection___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 48) versionPDFPathForDocumentInfoCollection:*(void *)(a1 + 32)];
  id v3 = [NSURL fileURLWithPath:v2];
  if ([v3 isFileURL])
  {
    id v4 = 0;
    if ([v3 getResourceValue:&v4 forKey:*MEMORY[0x263EFF688] error:0])
    {
      if ([v4 integerValue] >= 11
        && [v3 checkResourceIsReachableAndReturnError:0])
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
      }
    }
  }
}

+ (void)generatePDFsIfNecessaryForDocumentInfoCollection:(id)a3 imageCache:(id)a4 displayWindow:(id)a5 presentingViewController:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v13)
  {
    v16 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[DCDocCamPDFGenerator generatePDFsIfNecessaryForDocumentInfoCollection:imageCache:displayWindow:presentingViewController:completionHandler:](v16);
    }
  }
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  v17 = [v11 docInfos];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    char v39 = 0;
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    v19 = [v11 docInfos];
    uint64_t v20 = [v19 count];
    v35[3] = v20;

    v21 = [[DCLongRunningTaskController alloc] initWithWindow:v13 intervalBeforeOpeningProgressDialog:0.5];
    [(DCLongRunningTaskController *)v21 setProgressToStringTransformer:&__block_literal_global_30];
    [(DCLongRunningTaskController *)v21 setShouldShowCancelButton:1];
    [(DCLongRunningTaskController *)v21 setShouldShowCircularProgress:1];
    [(DCLongRunningTaskController *)v21 setViewControllerToPresentFrom:v14];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __141__DCDocCamPDFGenerator_generatePDFsIfNecessaryForDocumentInfoCollection_imageCache_displayWindow_presentingViewController_completionHandler___block_invoke_2;
    v27[3] = &unk_2642A9860;
    v31 = &v34;
    id v28 = v11;
    id v29 = v12;
    v32 = v38;
    v33 = v40;
    v22 = v21;
    v30 = v22;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __141__DCDocCamPDFGenerator_generatePDFsIfNecessaryForDocumentInfoCollection_imageCache_displayWindow_presentingViewController_completionHandler___block_invoke_3;
    v23[3] = &unk_2642A98B0;
    char v26 = 0;
    v25 = v38;
    id v24 = v15;
    [(DCLongRunningTaskController *)v22 startTask:v27 completionBlock:v23];

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(v38, 8);
  }
  else if (v15)
  {
    (*((void (**)(id, uint64_t))v15 + 2))(v15, 1);
  }
  _Block_object_dispose(v40, 8);
}

id __141__DCDocCamPDFGenerator_generatePDFsIfNecessaryForDocumentInfoCollection_imageCache_displayWindow_presentingViewController_completionHandler___block_invoke()
{
  return +[DCLocalization localizedStringForKey:@"Preparing…" value:@"Preparing…" table:@"Localizable"];
}

void __141__DCDocCamPDFGenerator_generatePDFsIfNecessaryForDocumentInfoCollection_imageCache_displayWindow_presentingViewController_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setTotalUnitCount:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  id v3 = +[DCDocCamPDFGenerator blockingGeneratepdfURLForDocumentInfoCollection:*(void *)(a1 + 32) imageCache:*(void *)(a1 + 40) withProgress:v4 error:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 48) isCancelled] ^ 1;
}

void __141__DCDocCamPDFGenerator_generatePDFsIfNecessaryForDocumentInfoCollection_imageCache_displayWindow_presentingViewController_completionHandler___block_invoke_3(uint64_t a1, char a2)
{
  if (*(unsigned char *)(a1 + 48))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __141__DCDocCamPDFGenerator_generatePDFsIfNecessaryForDocumentInfoCollection_imageCache_displayWindow_presentingViewController_completionHandler___block_invoke_4;
    v3[3] = &unk_2642A9888;
    id v4 = *(id *)(a1 + 32);
    char v5 = a2;
    dispatch_async(MEMORY[0x263EF83A0], v3);
  }
}

uint64_t __141__DCDocCamPDFGenerator_generatePDFsIfNecessaryForDocumentInfoCollection_imageCache_displayWindow_presentingViewController_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40) == 0);
}

+ (id)blockingGeneratepdfURLForDocumentInfoCollection:(id)a3 imageCache:(id)a4 withProgress:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  char v26 = __Block_byref_object_dispose__0;
  id v27 = [a1 pdfURLForDocumentInfoCollection:v9];
  id v12 = (void *)v23[5];
  if (!v12)
  {
    id v13 = [a1 syncGeneratorQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke;
    block[3] = &unk_2642A9928;
    id v21 = a1;
    id v17 = v9;
    id v18 = v10;
    id v19 = v11;
    uint64_t v20 = &v22;
    dispatch_sync(v13, block);

    id v12 = (void *)v23[5];
  }
  id v14 = v12;
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 64) versionPDFPathForDocumentInfoCollection:*(void *)(a1 + 32)];
  id v3 = [NSURL fileURLWithPath:v2];
  id v4 = [*(id *)(a1 + 32) title];
  char v5 = [*(id *)(a1 + 64) fileQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke_2;
  block[3] = &unk_2642A98D8;
  uint64_t v23 = *(void *)(a1 + 64);
  id v21 = *(id *)(a1 + 32);
  id v6 = v2;
  id v22 = v6;
  dispatch_sync(v5, block);

  id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
  v8 = [DCPDFGenerator alloc];
  if (v4) {
    id v9 = v4;
  }
  else {
    id v9 = &stru_26C7D5180;
  }
  id v10 = -[DCPDFGenerator initWithMutableData:pageRect:title:](v8, "initWithMutableData:pageRect:title:", v7, v9, *(double *)&kICPDFGeneratorDefaultPageRect, *(double *)algn_267BA40E8, *(double *)&qword_267BA40F0, unk_267BA40F8);
  [*(id *)(a1 + 64) performPDFGenerationWithGenerator:v10 docInfoCollection:*(void *)(a1 + 32) imageCache:*(void *)(a1 + 40) progress:*(void *)(a1 + 48)];
  if (v7)
  {
    id v11 = [*(id *)(a1 + 64) fileQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke_48;
    v15[3] = &unk_2642A9900;
    uint64_t v19 = *(void *)(a1 + 64);
    v16 = v3;
    id v12 = v7;
    uint64_t v13 = *(void *)(a1 + 56);
    id v17 = v12;
    uint64_t v18 = v13;
    dispatch_sync(v11, v15);

    id v14 = v16;
  }
  else
  {
    id v14 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke_cold_1(v14);
    }
  }
}

void __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 48) deletePDFForDocumentInfoCollectionIfExists:*(void *)(a1 + 32)];
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) stringByDeletingLastPathComponent];
  [v2 createTmpDirectory:v3];
}

void __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke_48(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 56) fileManager];
  [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];

  [*(id *)(a1 + 40) writeToURL:*(void *)(a1 + 32) atomically:1];
  id v3 = *(void **)(a1 + 32);
  id v4 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  objc_storeStrong(v4, v3);
}

+ (void)performPDFGenerationWithGenerator:(id)a3 docInfoCollection:(id)a4 imageCache:(id)a5 progress:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  [v9 startGenerating];
  uint64_t v13 = [v10 docInfos];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __96__DCDocCamPDFGenerator_performPDFGenerationWithGenerator_docInfoCollection_imageCache_progress___block_invoke;
  uint64_t v20 = &unk_2642A9978;
  id v14 = v12;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  uint64_t v24 = v25;
  id v16 = v9;
  id v23 = v16;
  [v13 enumerateObjectsUsingBlock:&v17];

  objc_msgSend(v16, "finishGenerating", v17, v18, v19, v20);
  _Block_object_dispose(v25, 8);
}

void __96__DCDocCamPDFGenerator_performPDFGenerationWithGenerator_docInfoCollection_imageCache_progress___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  if (v7 && [v7 isCancelled])
  {
    *a4 = 1;
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    id v9 = [v6 croppedAndFilteredImageUUID];
    id v10 = [v8 getImage:v9];

    if (v10)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      id v11 = *(void **)(a1 + 48);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __96__DCDocCamPDFGenerator_performPDFGenerationWithGenerator_docInfoCollection_imageCache_progress___block_invoke_2;
      v12[3] = &unk_2642A9950;
      id v13 = v10;
      [v11 addPageWithRenderBlock:v12];
    }
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  }
}

void __96__DCDocCamPDFGenerator_performPDFGenerationWithGenerator_docInfoCollection_imageCache_progress___block_invoke_2(uint64_t a1, CGContext *a2, double a3, double a4, double a5, double a6)
{
  CGRect v35 = CGRectInset(*(CGRect *)&a3, 32.0, 32.0);
  double x = v35.origin.x;
  double y = v35.origin.y;
  double width = v35.size.width;
  double height = v35.size.height;
  [*(id *)(a1 + 32) size];
  memset(&v34, 0, sizeof(v34));
  DCTransformFromImageOrientation([*(id *)(a1 + 32) imageOrientation], (uint64_t)&v34, v12, v13);
  id v14 = (void *)MEMORY[0x263F1C6B0];
  [*(id *)(a1 + 32) size];
  objc_msgSend(v14, "dc_aspectFitImageFrameForViewWithFrame:imageSize:", x, y, width, height, v15, v16);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGAffineTransform v32 = v34;
  CGAffineTransformInvert(&v33, &v32);
  v36.origin.double x = v18;
  v36.origin.double y = v20;
  v36.size.double width = v22;
  v36.size.double height = v24;
  CGRect v37 = CGRectApplyAffineTransform(v36, &v33);
  CGFloat v25 = v37.origin.x;
  CGFloat v26 = v37.origin.y;
  CGFloat v27 = v37.size.width;
  CGFloat v28 = v37.size.height;
  CGContextSaveGState(a2);
  CGAffineTransform v32 = v34;
  CGContextConcatCTM(a2, &v32);
  UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 0.6);
  CFDataRef v29 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v30 = CGDataProviderCreateWithCFData(v29);
  v31 = CGImageCreateWithJPEGDataProvider(v30, 0, 1, kCGRenderingIntentDefault);
  v38.origin.double x = v25;
  v38.origin.double y = v26;
  v38.size.double width = v27;
  v38.size.double height = v28;
  CGContextDrawImage(a2, v38, v31);
  CGContextRestoreGState(a2);
  CGDataProviderRelease(v30);
  CGImageRelease(v31);
}

+ (void)generatePDFsIfNecessaryForDocumentInfoCollection:(os_log_t)log imageCache:displayWindow:presentingViewController:completionHandler:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "displayWindow";
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v1, 0xCu);
}

void __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "data";
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v1, 0xCu);
}

@end