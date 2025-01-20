@interface DCDocumentEditorViewController
+ (BOOL)isAvailable;
+ (id)activityTypeOrder;
+ (id)docInfoCollectionFromScannedDocument:(id)a3 imageCache:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4;
- (BOOL)useCustomRecropTransition;
- (DCDocumentEditorViewController)initWithCoder:(id)a3;
- (DCDocumentEditorViewController)initWithDelegate:(id)a3 scannedDocument:(id)a4;
- (DCDocumentEditorViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (DCDocumentEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (DCDocumentEditorViewController)initWithRootViewController:(id)a3;
- (DCDocumentEditorViewControllerDelegate)docCamDelegate;
- (ICDocCamDocumentInfoCollection)docInfoCollection;
- (ICDocCamExtractedDocumentViewController)extractedDocumentController;
- (ICDocCamImageCache)imageCache;
- (NSIndexPath)indexPathForRecrop;
- (UIImage)filteredImageForRecrop;
- (UIImage)unfilteredImageForRecrop;
- (UIView)sourceViewForZoomTransition;
- (VNDocumentCameraScan)scannedDocument;
- (id)documentCameraControllerCreateDataCryptorIfNecessary;
- (id)extractedDocumentControllerMarkupModelDataForDocument:(id)a3;
- (id)extractedDocumentControllerTitle;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)scanDataDelegateWithIdentifier:(id)a3;
- (int64_t)orientationForRecrop;
- (void)_autoDismiss;
- (void)didReceiveMemoryWarning;
- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6;
- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7;
- (void)documentCameraControllerDidCancel:(id)a3;
- (void)extractedDocumentController:(id)a3 didTapRecrop:(id)a4 index:(int64_t)a5;
- (void)extractedDocumentController:(id)a3 shareDocument:(id)a4 sender:(id)a5;
- (void)extractedDocumentControllerDidChangeTitle:(id)a3;
- (void)extractedDocumentControllerDidSelectCopyFromMenuForDocument:(id)a3;
- (void)extractedDocumentControllerDidSelectShareFromMenuForDocument:(id)a3 sourceRect:(CGRect)a4 sourceView:(id)a5;
- (void)extractedDocumentControllerDidTapAddImage;
- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3;
- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3 scanDataDelegate:(id)a4;
- (void)extractedDocumentControllerDiscardMarkupModelDataForDocument:(id)a3;
- (void)remoteDocumentCameraController:(id)a3 didFailWithError:(id)a4;
- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4;
- (void)remoteDocumentCameraControllerDidCancel:(id)a3;
- (void)setDocCamDelegate:(id)a3;
- (void)setDocInfoCollection:(id)a3;
- (void)setExtractedDocumentController:(id)a3;
- (void)setFilteredImageForRecrop:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setIndexPathForRecrop:(id)a3;
- (void)setOrientationForRecrop:(int64_t)a3;
- (void)setScannedDocument:(id)a3;
- (void)setSourceViewForZoomTransition:(id)a3;
- (void)setUnfilteredImageForRecrop:(id)a3;
- (void)setUseCustomRecropTransition:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DCDocumentEditorViewController

+ (BOOL)isAvailable
{
  int v2 = MGGetBoolAnswer();
  if (v2) {
    LOBYTE(v2) = MGGetBoolAnswer() ^ 1;
  }
  return v2;
}

+ (id)docInfoCollectionFromScannedDocument:(id)a3 imageCache:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v35 = a4;
  v6 = [v5 docInfos];
  v7 = objc_alloc_init(ICDocCamDocumentInfoCollection);
  v34 = [(ICDocCamDocumentInfoCollection *)v7 docInfos];
  v38 = v5;
  v8 = [v5 title];
  v32 = v7;
  [(ICDocCamDocumentInfoCollection *)v7 setTitle:v8];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = v6;
  uint64_t v37 = [v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v37)
  {
    uint64_t v10 = *(void *)v42;
    v31 = v40;
    id v33 = v9;
    while (2)
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v9);
        }
        v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "croppedAndFilteredImageUUID", v31);
        v14 = [v38 getImage:v13];
        v15 = [v12 fullImageUUID];
        uint64_t v16 = [v38 getImage:v15];
        v17 = (void *)v16;
        if (v14) {
          BOOL v18 = v16 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        int v19 = !v18;
        if (v18)
        {
          v20 = (ICDocCamDocumentInfo *)os_log_create("com.apple.documentcamera", "");
          if (os_log_type_enabled(&v20->super, OS_LOG_TYPE_ERROR)) {
            +[DCDocumentEditorViewController docInfoCollectionFromScannedDocument:imageCache:](&buf, v31, &v20->super);
          }
        }
        else
        {
          v20 = [[ICDocCamDocumentInfo alloc] initWithDelegate:0];
          [v12 metaData];
          int v36 = v19;
          v22 = uint64_t v21 = v10;
          v23 = (void *)[v22 copy];
          [(ICDocCamDocumentInfo *)v20 setMetaData:v23];

          v24 = [v12 imageQuad];
          v25 = (void *)[v24 copy];
          [(ICDocCamDocumentInfo *)v20 setImageQuad:v25];

          v26 = [v35 setImage:v14 metaData:0];
          [(ICDocCamDocumentInfo *)v20 setCroppedAndFilteredImageUUID:v26];

          [(ICDocCamDocumentInfo *)v20 setCroppedButNotFilteredImageUUID:0];
          uint64_t v10 = v21;
          int v19 = v36;
          v27 = [v35 setImage:v17 metaData:0];
          [(ICDocCamDocumentInfo *)v20 setFullImageUUID:v27];

          id v9 = v33;
          [(ICDocCamDocumentInfo *)v20 setMeshAnimImageUUID:0];
          -[ICDocCamDocumentInfo setCurrentFilter:](v20, "setCurrentFilter:", [v12 currentFilter]);
          -[ICDocCamDocumentInfo setCurrentOrientation:](v20, "setCurrentOrientation:", [v12 currentOrientation]);
          [(ICDocCamDocumentInfo *)v20 setScanDataDelegateIdentifier:0];
          [v34 addObject:v20];
        }

        if (!v19)
        {

          v29 = 0;
          v28 = v32;
          goto LABEL_21;
        }
      }
      uint64_t v37 = [v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v37) {
        continue;
      }
      break;
    }
  }

  v28 = v32;
  v29 = v32;
LABEL_21:

  return v29;
}

- (DCDocumentEditorViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  return 0;
}

- (DCDocumentEditorViewController)initWithRootViewController:(id)a3
{
  return 0;
}

- (DCDocumentEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (DCDocumentEditorViewController)initWithCoder:(id)a3
{
  return 0;
}

- (DCDocumentEditorViewController)initWithDelegate:(id)a3 scannedDocument:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[ICDocCamImageCache alloc] initWithDataCryptorDelegate:0];
  id v9 = +[DCDocumentEditorViewController docInfoCollectionFromScannedDocument:v7 imageCache:v8];
  uint64_t v10 = [[ICDocCamExtractedDocumentViewController alloc] initWithDelegate:self documentInfoCollection:v9 imageCache:v8 currentIndex:0 mode:1];
  v14.receiver = self;
  v14.super_class = (Class)DCDocumentEditorViewController;
  v11 = [(DCDocumentEditorViewController *)&v14 initWithRootViewController:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_extractedDocumentController, v10);
    objc_storeWeak((id *)&v12->_docCamDelegate, v6);
    objc_storeStrong((id *)&v12->_docInfoCollection, v9);
    objc_storeStrong((id *)&v12->_imageCache, v8);
    objc_storeStrong((id *)&v12->_scannedDocument, a4);
  }

  return v12;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)DCDocumentEditorViewController;
  [(DCDocumentEditorViewController *)&v2 viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)DCDocumentEditorViewController;
  [(DCDocumentEditorViewController *)&v2 didReceiveMemoryWarning];
}

- (void)_autoDismiss
{
  id v2 = [(DCDocumentEditorViewController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3 scanDataDelegate:(id)a4
{
  id v5 = [(DCDocumentEditorViewController *)self docCamDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(DCDocumentEditorViewController *)self docInfoCollection];
    v8 = [v7 creationDate];
    id v9 = [(DCDocumentEditorViewController *)self docInfoCollection];
    uint64_t v10 = [v9 modificationDate];

    if (v8 != v10)
    {
      v11 = [(DCDocumentEditorViewController *)self scannedDocument];
      v12 = [(DCDocumentEditorViewController *)self docInfoCollection];
      v13 = [(DCDocumentEditorViewController *)self imageCache];
      [v11 replaceContentsWithDocInfoCollection:v12 imageCache:v13];
    }
    BOOL v14 = v8 != v10;
    v15 = [(DCDocumentEditorViewController *)self imageCache];
    [v15 deleteAllImages];

    +[DCDocCamPDFGenerator deleteAllDocCamPDFs];
    id v17 = [(DCDocumentEditorViewController *)self docCamDelegate];
    uint64_t v16 = [(DCDocumentEditorViewController *)self scannedDocument];
    [v17 documentEditorViewController:self didFinishWithDocument:v16 wasModified:v14];
  }
  else
  {
    [(DCDocumentEditorViewController *)self _autoDismiss];
  }
}

- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3
{
  v3 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[DCDocumentEditorViewController extractedDocumentControllerDidTapDone:](v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)extractedDocumentController:(id)a3 didTapRecrop:(id)a4 index:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = [(DCDocumentEditorViewController *)self imageCache];
    v11 = [v9 fullImageUUID];
    int v36 = v10;
    uint64_t v12 = [v10 getImage:v11];

    uint64_t v13 = [v9 imageQuad];
    uint64_t v14 = [v9 currentOrientation];
    v15 = [ICDocCamImageQuadEditViewController alloc];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __81__DCDocumentEditorViewController_extractedDocumentController_didTapRecrop_index___block_invoke;
    v38[3] = &unk_2642A9A68;
    id v16 = v9;
    id v39 = v16;
    v40 = self;
    id v17 = v8;
    id v41 = v17;
    int64_t v42 = a5;
    v34 = (void *)v13;
    id v35 = (void *)v12;
    BOOL v18 = [(ICDocCamImageQuadEditViewController *)v15 initWithImage:v12 quad:v13 scanDataDelegate:0 orientation:v14 completionHandler:v38];
    [(ICDocCamImageQuadEditViewController *)v18 setShowImageAsAspectFit:1];
    [(DCDocumentEditorViewController *)self setUseCustomRecropTransition:1];
    int v19 = [v17 navigationController];
    [v19 setDelegate:self];

    v20 = [(ICDocCamImageQuadEditViewController *)v18 navigationController];
    [v20 setDelegate:self];

    uint64_t v21 = [v16 croppedAndFilteredImageUUID];

    if (v21)
    {
      v22 = [(DCDocumentEditorViewController *)self imageCache];
      v23 = [v16 croppedAndFilteredImageUUID];
      v24 = [v22 getImage:v23];
    }
    else
    {
      v24 = [(DCDocumentEditorViewController *)self extractedDocumentControllerImageForDocument:v16];
    }
    id v37 = v8;
    v25 = [v16 croppedButNotFilteredImageUUID];

    if (v25)
    {
      v26 = [(DCDocumentEditorViewController *)self imageCache];
      v27 = [v16 croppedButNotFilteredImageUUID];
      v28 = [v26 getImage:v27];
    }
    else
    {
      v28 = [v17 croppedButNotFilteredImageForDocInfo:v16];
    }
    v29 = [MEMORY[0x263F088C8] indexPathForItem:a5 inSection:0];
    [(DCDocumentEditorViewController *)self setIndexPathForRecrop:v29];

    [(DCDocumentEditorViewController *)self setFilteredImageForRecrop:v24];
    id v30 = objc_alloc(MEMORY[0x263F1C6B0]);
    id v31 = v28;
    v32 = objc_msgSend(v30, "initWithCGImage:scale:orientation:", objc_msgSend(v31, "CGImage"), objc_msgSend(v16, "currentOrientation"), 1.0);
    [(DCDocumentEditorViewController *)self setUnfilteredImageForRecrop:v32];

    -[DCDocumentEditorViewController setOrientationForRecrop:](self, "setOrientationForRecrop:", [v16 currentOrientation]);
    id v33 = [v17 navigationController];
    [v33 pushViewController:v18 animated:1];

    id v8 = v37;
  }
}

void __81__DCDocumentEditorViewController_extractedDocumentController_didTapRecrop_index___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v28 = a3;
  id v7 = a4;
  if (a2)
  {
    [*(id *)(a1 + 32) setImageQuad:v7];
    id v8 = +[ICDocCamImageFilters perspectiveCorrectedImageFromImage:v28 normalizedImageQuad:v7];
    id v9 = +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:constantColor:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:constantColor:", v8, [*(id *)(a1 + 32) currentOrientation], objc_msgSend(*(id *)(a1 + 32), "currentFilter"), objc_msgSend(*(id *)(a1 + 32), "constantColor"));
    uint64_t v10 = [*(id *)(a1 + 40) imageCache];
    v11 = [*(id *)(a1 + 32) metaData];
    uint64_t v12 = [*(id *)(a1 + 32) croppedAndFilteredImageUUID];
    [v10 replaceImage:v9 metaData:v11 uuid:v12];

    [*(id *)(a1 + 48) didUpdateDocumentImage:*(void *)(a1 + 32)];
  }
  uint64_t v13 = [*(id *)(a1 + 32) croppedAndFilteredImageUUID];

  uint64_t v14 = *(void **)(a1 + 40);
  if (v13)
  {
    v15 = [v14 imageCache];
    id v16 = [*(id *)(a1 + 32) croppedAndFilteredImageUUID];
    id v17 = [v15 getImage:v16];
  }
  else
  {
    id v17 = [v14 extractedDocumentControllerImageForDocument:*(void *)(a1 + 32)];
  }
  BOOL v18 = [*(id *)(a1 + 32) croppedButNotFilteredImageUUID];

  if (v18)
  {
    int v19 = [*(id *)(a1 + 40) imageCache];
    v20 = [*(id *)(a1 + 32) croppedButNotFilteredImageUUID];
    uint64_t v21 = [v19 getImage:v20];
  }
  else
  {
    uint64_t v21 = [*(id *)(a1 + 48) croppedButNotFilteredImageForDocInfo:*(void *)(a1 + 32)];
  }
  v22 = [MEMORY[0x263F088C8] indexPathForItem:*(void *)(a1 + 56) inSection:0];
  [*(id *)(a1 + 40) setIndexPathForRecrop:v22];

  [*(id *)(a1 + 40) setFilteredImageForRecrop:v17];
  id v23 = objc_alloc(MEMORY[0x263F1C6B0]);
  id v24 = v21;
  v25 = objc_msgSend(v23, "initWithCGImage:scale:orientation:", objc_msgSend(v24, "CGImage"), objc_msgSend(*(id *)(a1 + 32), "currentOrientation"), 1.0);
  [*(id *)(a1 + 40) setUnfilteredImageForRecrop:v25];

  objc_msgSend(*(id *)(a1 + 40), "setOrientationForRecrop:", objc_msgSend(*(id *)(a1 + 32), "currentOrientation"));
  v26 = [*(id *)(a1 + 48) navigationController];
  id v27 = (id)[v26 popViewControllerAnimated:1];
}

- (void)extractedDocumentControllerDidTapAddImage
{
  if ([(DCDocumentEditorViewController *)self documentCameraController:0 canAddImages:1])
  {
    v3 = [ICDocCamNavigationController alloc];
    uint64_t v4 = [(DCDocumentEditorViewController *)self imageCache];
    id v7 = [(ICDocCamNavigationController *)v3 initWithImageCache:v4 docCamDelegate:self remoteDocCamDelegate:self];

    [(ICDocCamNavigationController *)v7 setModalTransitionStyle:2];
    uint64_t v5 = [(DCDocumentEditorViewController *)self extractedDocumentController];
    uint64_t v6 = [v5 navigationController];
    [v6 presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    id v7 = [(DCDocumentEditorViewController *)self extractedDocumentController];
    +[ICDocCamViewController warnAboutMaxScansReachedForViewController:completionHandler:](ICDocCamViewController, "warnAboutMaxScansReachedForViewController:completionHandler:");
  }
}

- (void)extractedDocumentController:(id)a3 shareDocument:(id)a4 sender:(id)a5
{
  v46[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x263EFF8C0] array];
  uint64_t v12 = [v9 croppedAndFilteredImageUUID];

  if (!v12)
  {
    v15 = [(DCDocumentEditorViewController *)self extractedDocumentControllerImageForDocument:v9];
    if (!v15) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v13 = [(DCDocumentEditorViewController *)self imageCache];
  uint64_t v14 = [v9 croppedAndFilteredImageUUID];
  v15 = [v13 getImage:v14];

  if (v15)
  {
LABEL_3:
    id v39 = [v8 currentImageView];
    [v15 size];
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    v20 = [DCMarkupActivity alloc];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __83__DCDocumentEditorViewController_extractedDocumentController_shareDocument_sender___block_invoke;
    v45[3] = &__block_descriptor_48_e47__CGRect__CGPoint_dd__CGSize_dd__16__0__UIView_8l;
    v45[4] = v17;
    v45[5] = v19;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __83__DCDocumentEditorViewController_extractedDocumentController_shareDocument_sender___block_invoke_2;
    v41[3] = &unk_2642A9AB0;
    id v21 = v9;
    id v42 = v21;
    long long v43 = self;
    id v40 = v10;
    id v22 = v8;
    id v44 = v22;
    id v23 = [(DCMarkupActivity *)v20 initFromView:v39 presentingViewController:v22 frameBlock:v45 completionBlock:v41];
    [v23 setInkStyle:1];
    v46[0] = v23;
    id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:1];
    v25 = [DCMarkupActivityItem alloc];
    [(DCDocumentEditorViewController *)self imageCache];
    v26 = id v38 = v8;
    id v37 = [(DCMarkupActivityItem *)v25 initWithDocumentInfo:v21 imageCache:v26];

    id v27 = [v11 arrayByAddingObject:v37];

    id v28 = [DCDocumentInfoCollectionActivityItemSource alloc];
    v29 = [(DCDocumentEditorViewController *)self docInfoCollection];
    id v30 = [(DCActivityItemSource *)v28 initWithDocumentInfoCollection:v29];

    v11 = [v27 arrayByAddingObject:v30];

    id v31 = [[DCActivityViewController alloc] initWithActivityItems:v11 applicationActivities:v24];
    v32 = [(DCDocumentEditorViewController *)self docInfoCollection];
    [(DCActivityViewController *)v31 setDocumentInfoCollection:v32];

    id v33 = [(DCDocumentEditorViewController *)self imageCache];
    [(DCActivityViewController *)v31 setImageCache:v33];

    id v8 = v38;
    [(DCActivityViewController *)v31 setCompletionWithItemsHandler:&__block_literal_global_5];
    v34 = [(id)objc_opt_class() activityTypeOrder];
    [(DCActivityViewController *)v31 setActivityTypeOrder:v34];

    [(DCActivityViewController *)v31 setModalPresentationStyle:7];
    id v35 = v22;
    id v10 = v40;
    [v35 presentViewController:v31 animated:1 completion:0];
    int v36 = [(DCActivityViewController *)v31 popoverPresentationController];
    [v36 setBarButtonItem:v40];
    [v36 setPermittedArrowDirections:3];
  }
LABEL_4:
}

uint64_t __83__DCDocumentEditorViewController_extractedDocumentController_shareDocument_sender___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F1C6B0];
  [a2 bounds];

  return objc_msgSend(v2, "dc_aspectFitImageFrameForViewWithFrame:imageSize:");
}

void __83__DCDocumentEditorViewController_extractedDocumentController_shareDocument_sender___block_invoke_2(id *a1, uint64_t a2)
{
  if (a2)
  {
    v3 = [MEMORY[0x263F1C6B0] imageWithData:a2];
    if (v3)
    {
      id v8 = v3;
      uint64_t v4 = [a1[4] croppedAndFilteredImageUUID];

      uint64_t v5 = [a1[5] imageCache];
      uint64_t v6 = [a1[4] metaData];
      if (v4)
      {
        id v7 = [a1[4] croppedAndFilteredImageUUID];
        [v5 replaceImage:v8 metaData:v6 uuid:v7];
      }
      else
      {
        id v7 = [v5 setImage:v8 metaData:v6];
        [a1[4] setCroppedAndFilteredImageUUID:v7];
      }

      [a1[6] didUpdateDocumentImage:a1[4]];
      v3 = v8;
    }
  }
}

void __83__DCDocumentEditorViewController_extractedDocumentController_shareDocument_sender___block_invoke_3(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  id v12 = a2;
  id v8 = a4;
  id v9 = a5;
  if (a3) {
    NSLog(&cfstr_WeUsedActivity.isa, v12);
  }
  else {
    NSLog(&cfstr_WeDidnTWantToS.isa);
  }
  if (v9)
  {
    id v10 = [v9 localizedDescription];
    v11 = [v9 localizedFailureReason];
    NSLog(&cfstr_AnErrorOccurre.isa, v10, v11);
  }
}

+ (id)activityTypeOrder
{
  v6[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F1CFC0];
  v6[0] = @"com.apple.documentcamera.markup";
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x263F1CFB0];
  v6[2] = *MEMORY[0x263F1D008];
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];

  return v4;
}

- (void)extractedDocumentControllerDidSelectShareFromMenuForDocument:(id)a3 sourceRect:(CGRect)a4 sourceView:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v22[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = [v11 croppedAndFilteredImageUUID];

  if (!v13)
  {
    uint64_t v16 = [(DCDocumentEditorViewController *)self extractedDocumentControllerImageForDocument:v11];
    if (!v16) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v14 = [(DCDocumentEditorViewController *)self imageCache];
  v15 = [v11 croppedAndFilteredImageUUID];
  uint64_t v16 = [v14 getImage:v15];

  if (v16)
  {
LABEL_3:
    id v17 = objc_alloc(MEMORY[0x263F1C3E8]);
    v22[0] = v16;
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
    uint64_t v19 = (void *)[v17 initWithActivityItems:v18 applicationActivities:MEMORY[0x263EFFA68]];

    [v19 setModalPresentationStyle:7];
    v20 = [(DCDocumentEditorViewController *)self extractedDocumentController];
    [v20 presentViewController:v19 animated:1 completion:0];

    id v21 = [v19 popoverPresentationController];
    objc_msgSend(v21, "setSourceRect:", x, y, width, height);
    [v21 setSourceView:v12];
    [v21 setPermittedArrowDirections:3];
  }
LABEL_4:
}

- (void)extractedDocumentControllerDidSelectCopyFromMenuForDocument:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 croppedAndFilteredImageUUID];

  if (v4)
  {
    uint64_t v5 = [(DCDocumentEditorViewController *)self imageCache];
    uint64_t v6 = [v9 croppedAndFilteredImageUUID];
    id v7 = [v5 getImage:v6];

    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v7 = [(DCDocumentEditorViewController *)self extractedDocumentControllerImageForDocument:v9];
  if (v7)
  {
LABEL_3:
    id v8 = [MEMORY[0x263F1C840] generalPasteboard];
    [v8 setImage:v7];
  }
LABEL_4:
}

- (id)extractedDocumentControllerTitle
{
  uint64_t v3 = [(DCDocumentEditorViewController *)self docInfoCollection];
  uint64_t v4 = [v3 title];

  if (v4)
  {
    uint64_t v5 = [(DCDocumentEditorViewController *)self docInfoCollection];
    uint64_t v6 = [v5 title];
  }
  else
  {
    uint64_t v6 = +[DCLocalization localizedStringForKey:@"Scanned Documents" value:@"Scanned Documents" table:@"Localizable"];
  }

  return v6;
}

- (void)extractedDocumentControllerDidChangeTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(DCDocumentEditorViewController *)self docInfoCollection];
  [v5 setTitle:v4];
}

- (id)extractedDocumentControllerMarkupModelDataForDocument:(id)a3
{
  return (id)[a3 markupModelData];
}

- (void)extractedDocumentControllerDiscardMarkupModelDataForDocument:(id)a3
{
  id v21 = a3;
  [v21 setMarkupModelData:0];
  id v4 = [v21 croppedAndFilteredImageUUID];

  if (v4)
  {
    id v5 = [(DCDocumentEditorViewController *)self imageCache];
    uint64_t v6 = [v21 fullImageUUID];
    id v7 = [v5 getImage:v6];

    id v8 = [v21 imageQuad];
    id v9 = +[ICDocCamImageFilters perspectiveCorrectedImageFromImage:v7 normalizedImageQuad:v8];

    id v10 = +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:constantColor:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:constantColor:", v9, [v21 currentOrientation], objc_msgSend(v21, "currentFilter"), objc_msgSend(v21, "constantColor"));
    id v11 = [(DCDocumentEditorViewController *)self imageCache];
    id v12 = [v21 metaData];
    uint64_t v13 = [v21 croppedAndFilteredImageUUID];
    [v11 replaceImage:v10 metaData:v12 uuid:v13];
  }
  uint64_t v14 = [v21 croppedButNotFilteredImageUUID];

  if (v14)
  {
    v15 = [(DCDocumentEditorViewController *)self imageCache];
    uint64_t v16 = [v21 croppedButNotFilteredImageUUID];
    [v15 deleteImage:v16];
  }
  id v17 = [v21 meshAnimImageUUID];

  if (v17)
  {
    uint64_t v18 = [(DCDocumentEditorViewController *)self imageCache];
    uint64_t v19 = [v21 meshAnimImageUUID];
    [v18 deleteImage:v19];
  }
  v20 = [(DCDocumentEditorViewController *)self extractedDocumentController];
  [v20 didUpdateDocumentImage:v21];
}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6
{
}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7
{
  BOOL v8 = a6;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v8 && !a7)
  {
    uint64_t v14 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[DCDocumentEditorViewController documentCameraController:didFinishWithDocInfoCollection:imageCache:warnUser:closeViewController:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  id v22 = objc_msgSend(v12, "docInfos", v42);
  uint64_t v23 = [v22 count];

  if (!v23)
  {
    id v24 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[DCDocumentEditorViewController documentCameraController:didFinishWithDocInfoCollection:imageCache:warnUser:closeViewController:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v32 = [v12 docInfos];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v46;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v45 + 1) + 8 * v36);
        id v38 = [(DCDocumentEditorViewController *)self docInfoCollection];
        id v39 = [v38 docInfos];
        [v39 addObject:v37];

        id v40 = [(DCDocumentEditorViewController *)self extractedDocumentController];
        [v40 didUpdateDocumentInfoArrayNewCurrentDocument:v37];

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [v32 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v34);
  }

  id v41 = [(DCDocumentEditorViewController *)self docInfoCollection];
  [v41 bumpModificationDate];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __130__DCDocumentEditorViewController_documentCameraController_didFinishWithDocInfoCollection_imageCache_warnUser_closeViewController___block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __130__DCDocumentEditorViewController_documentCameraController_didFinishWithDocInfoCollection_imageCache_warnUser_closeViewController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) extractedDocumentController];
  uint64_t v3 = [v2 navigationController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __130__DCDocumentEditorViewController_documentCameraController_didFinishWithDocInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2;
  v4[3] = &unk_2642A9250;
  v4[4] = *(void *)(a1 + 32);
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

void __130__DCDocumentEditorViewController_documentCameraController_didFinishWithDocInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) extractedDocumentController];
  [v1 becomeFirstResponder];
}

- (void)documentCameraControllerDidCancel:(id)a3
{
  id v4 = [(DCDocumentEditorViewController *)self extractedDocumentController];
  id v5 = [v4 navigationController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__DCDocumentEditorViewController_documentCameraControllerDidCancel___block_invoke;
  v6[3] = &unk_2642A9250;
  v6[4] = self;
  [v5 dismissViewControllerAnimated:1 completion:v6];
}

void __68__DCDocumentEditorViewController_documentCameraControllerDidCancel___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) extractedDocumentController];
  [v1 becomeFirstResponder];
}

- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4
{
  id v5 = [(DCDocumentEditorViewController *)self docInfoCollection];
  uint64_t v6 = [v5 docInfos];
  LOBYTE(a4) = [v6 count] + a4 < 0x19;

  return a4;
}

- (id)documentCameraControllerCreateDataCryptorIfNecessary
{
  return 0;
}

- (id)scanDataDelegateWithIdentifier:(id)a3
{
  return 0;
}

- (void)remoteDocumentCameraControllerDidCancel:(id)a3
{
  id v4 = [(DCDocumentEditorViewController *)self extractedDocumentController];
  id v5 = [v4 navigationController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__DCDocumentEditorViewController_remoteDocumentCameraControllerDidCancel___block_invoke;
  v6[3] = &unk_2642A9250;
  v6[4] = self;
  [v5 dismissViewControllerAnimated:1 completion:v6];
}

void __74__DCDocumentEditorViewController_remoteDocumentCameraControllerDidCancel___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) extractedDocumentController];
  [v1 becomeFirstResponder];
}

- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = objc_msgSend(a4, "docInfos", a3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        id v11 = [(DCDocumentEditorViewController *)self docInfoCollection];
        id v12 = [v11 docInfos];
        [v12 addObject:v10];

        id v13 = [(DCDocumentEditorViewController *)self extractedDocumentController];
        [v13 didUpdateDocumentInfoArrayNewCurrentDocument:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v14 = [(DCDocumentEditorViewController *)self docInfoCollection];
  [v14 bumpModificationDate];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__DCDocumentEditorViewController_remoteDocumentCameraController_didFinishWithInfoCollection___block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __93__DCDocumentEditorViewController_remoteDocumentCameraController_didFinishWithInfoCollection___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) extractedDocumentController];
  uint64_t v3 = [v2 navigationController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __93__DCDocumentEditorViewController_remoteDocumentCameraController_didFinishWithInfoCollection___block_invoke_2;
  v4[3] = &unk_2642A9250;
  v4[4] = *(void *)(a1 + 32);
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

void __93__DCDocumentEditorViewController_remoteDocumentCameraController_didFinishWithInfoCollection___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) extractedDocumentController];
  [v1 becomeFirstResponder];
}

- (void)remoteDocumentCameraController:(id)a3 didFailWithError:(id)a4
{
  id v5 = [(DCDocumentEditorViewController *)self extractedDocumentController];
  uint64_t v6 = [v5 navigationController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__DCDocumentEditorViewController_remoteDocumentCameraController_didFailWithError___block_invoke;
  v7[3] = &unk_2642A9250;
  v7[4] = self;
  [v6 dismissViewControllerAnimated:1 completion:v7];
}

void __82__DCDocumentEditorViewController_remoteDocumentCameraController_didFailWithError___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) extractedDocumentController];
  [v1 becomeFirstResponder];
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  if ([(DCDocumentEditorViewController *)self useCustomRecropTransition])
  {
    uint64_t v8 = [ICDocCamRecropTransitionAnimator alloc];
    uint64_t v9 = [(DCDocumentEditorViewController *)self filteredImageForRecrop];
    uint64_t v10 = [(DCDocumentEditorViewController *)self unfilteredImageForRecrop];
    int64_t v11 = [(DCDocumentEditorViewController *)self orientationForRecrop];
    id v12 = [(DCDocumentEditorViewController *)self indexPathForRecrop];
    id v13 = [(ICDocCamRecropTransitionAnimator *)v8 initWithImage:v9 unfilteredImage:v10 orientation:v11 indexPath:v12 duration:0 completion:0.65];

    [(DCDocumentEditorViewController *)self setFilteredImageForRecrop:0];
    [(DCDocumentEditorViewController *)self setUnfilteredImageForRecrop:0];
    [(ICDocCamRecropTransitionAnimator *)v13 setPresenting:a4 == 1];
    if (![(ICDocCamRecropTransitionAnimator *)v13 presenting]) {
      [(DCDocumentEditorViewController *)self setUseCustomRecropTransition:0];
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICDocCamExtractedDocumentViewController)extractedDocumentController
{
  return self->_extractedDocumentController;
}

- (void)setExtractedDocumentController:(id)a3
{
}

- (DCDocumentEditorViewControllerDelegate)docCamDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_docCamDelegate);

  return (DCDocumentEditorViewControllerDelegate *)WeakRetained;
}

- (void)setDocCamDelegate:(id)a3
{
}

- (VNDocumentCameraScan)scannedDocument
{
  return self->_scannedDocument;
}

- (void)setScannedDocument:(id)a3
{
}

- (ICDocCamDocumentInfoCollection)docInfoCollection
{
  return self->_docInfoCollection;
}

- (void)setDocInfoCollection:(id)a3
{
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (BOOL)useCustomRecropTransition
{
  return self->_useCustomRecropTransition;
}

- (void)setUseCustomRecropTransition:(BOOL)a3
{
  self->_useCustomRecropTransition = a3;
}

- (int64_t)orientationForRecrop
{
  return self->_orientationForRecrop;
}

- (void)setOrientationForRecrop:(int64_t)a3
{
  self->_orientationForRecrop = a3;
}

- (NSIndexPath)indexPathForRecrop
{
  return self->_indexPathForRecrop;
}

- (void)setIndexPathForRecrop:(id)a3
{
}

- (UIImage)filteredImageForRecrop
{
  return self->_filteredImageForRecrop;
}

- (void)setFilteredImageForRecrop:(id)a3
{
}

- (UIImage)unfilteredImageForRecrop
{
  return self->_unfilteredImageForRecrop;
}

- (void)setUnfilteredImageForRecrop:(id)a3
{
}

- (UIView)sourceViewForZoomTransition
{
  return self->_sourceViewForZoomTransition;
}

- (void)setSourceViewForZoomTransition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceViewForZoomTransition, 0);
  objc_storeStrong((id *)&self->_unfilteredImageForRecrop, 0);
  objc_storeStrong((id *)&self->_filteredImageForRecrop, 0);
  objc_storeStrong((id *)&self->_indexPathForRecrop, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_docInfoCollection, 0);
  objc_storeStrong((id *)&self->_scannedDocument, 0);
  objc_destroyWeak((id *)&self->_docCamDelegate);

  objc_storeStrong((id *)&self->_extractedDocumentController, 0);
}

+ (void)docInfoCollectionFromScannedDocument:(os_log_t)log imageCache:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "File missing", buf, 2u);
}

- (void)extractedDocumentControllerDidTapDone:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)documentCameraController:(uint64_t)a3 didFinishWithDocInfoCollection:(uint64_t)a4 imageCache:(uint64_t)a5 warnUser:(uint64_t)a6 closeViewController:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)documentCameraController:(uint64_t)a3 didFinishWithDocInfoCollection:(uint64_t)a4 imageCache:(uint64_t)a5 warnUser:(uint64_t)a6 closeViewController:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end