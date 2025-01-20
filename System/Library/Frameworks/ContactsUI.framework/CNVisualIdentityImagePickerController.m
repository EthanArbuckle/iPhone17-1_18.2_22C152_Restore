@interface CNVisualIdentityImagePickerController
+ (id)cameraImagePicker;
+ (id)imagePickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4;
+ (id)imagePickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4 backgroundColor:(id)a5;
+ (id)log;
+ (id)photoLibraryImagePickerWithIsMeContact:(BOOL)a3;
+ (id)photoPickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4 backgroundColor:(id)a5 isMeContact:(BOOL)a6;
+ (id)photoPickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4 isMeContact:(BOOL)a5;
- (BOOL)isMeContact;
- (CNContactStyle)contactStyle;
- (CNVisualIdentityImagePickerController)initWithContactStyle:(id)a3;
- (CNVisualIdentityImagePickerControllerDelegate)delegate;
- (CNVisualIdentityPickerPresenterDelegate)presenterDelegate;
- (NSString)photoLibraryAssetID;
- (id)providerItemFromImagePickerInfo:(id)a3;
- (void)imageDataFromPickerResult:(id)a3 completionHandler:(id)a4;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)presentCameraImagePickerFromViewController:(id)a3;
- (void)presentImagePicker:(id)a3 withStyle:(int64_t)a4 fromViewController:(id)a5;
- (void)presentImagePicker:(id)a3 withStyle:(int64_t)a4 fromViewController:(id)a5 forVisualIdentityPicker:(id)a6;
- (void)presentMoveAndScaleForImageData:(id)a3 withCropRect:(CGRect)a4 fromViewController:(id)a5;
- (void)presentMoveAndScaleForImageData:(id)a3 withCropRect:(CGRect)a4 fromViewController:(id)a5 backgroundColor:(id)a6;
- (void)presentPhotoLibraryPickerFromViewController:(id)a3 sourceView:(id)a4;
- (void)setContactStyle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsMeContact:(BOOL)a3;
- (void)setPhotoLibraryAssetID:(id)a3;
- (void)setPresenterDelegate:(id)a3;
@end

@implementation CNVisualIdentityImagePickerController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryAssetID, 0);
  objc_storeStrong((id *)&self->_contactStyle, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_presenterDelegate);
}

- (void)setPhotoLibraryAssetID:(id)a3
{
}

- (NSString)photoLibraryAssetID
{
  return self->_photoLibraryAssetID;
}

- (void)setContactStyle:(id)a3
{
}

- (CNContactStyle)contactStyle
{
  return self->_contactStyle;
}

- (void)setIsMeContact:(BOOL)a3
{
  self->_isMeContact = a3;
}

- (BOOL)isMeContact
{
  return self->_isMeContact;
}

- (void)setDelegate:(id)a3
{
}

- (CNVisualIdentityImagePickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNVisualIdentityImagePickerControllerDelegate *)WeakRetained;
}

- (void)setPresenterDelegate:(id)a3
{
}

- (CNVisualIdentityPickerPresenterDelegate)presenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);

  return (CNVisualIdentityPickerPresenterDelegate *)WeakRetained;
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    Class v8 = (Class)getPHObjectClass[0]();
    v9 = [v7 firstObject];
    v10 = [v9 assetIdentifier];
    v11 = [(objc_class *)v8 uuidFromLocalIdentifier:v10];
    [(CNVisualIdentityImagePickerController *)self setPhotoLibraryAssetID:v11];

    v12 = [v7 firstObject];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__CNVisualIdentityImagePickerController_picker_didFinishPicking___block_invoke;
    v14[3] = &unk_1E5499D98;
    v14[4] = self;
    id v15 = v6;
    [(CNVisualIdentityImagePickerController *)self imageDataFromPickerResult:v12 completionHandler:v14];
  }
  else
  {
    v13 = [(CNVisualIdentityImagePickerController *)self delegate];
    [v13 imagePickerControllerDidCancel:v6];
  }
}

void __65__CNVisualIdentityImagePickerController_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend((id)objc_opt_class(), "imagePickerForEditingImageData:withCropRect:", v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [v4 setDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) presentImagePicker:v4 withStyle:3 fromViewController:*(void *)(a1 + 40)];
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(CNVisualIdentityImagePickerController *)self delegate];
  [v5 imagePickerControllerDidCancel:v4];
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A270] + 16))())
  {
    Class v8 = [(CNVisualIdentityImagePickerController *)self delegate];
    [v8 imagePickerController:v6 didFinishWithProviderItem:0];
  }
  else
  {
    Class v8 = [(CNVisualIdentityImagePickerController *)self providerItemFromImagePickerInfo:v7];
    uint64_t v9 = [v6 sourceType];
    v10 = [v8 imageData];

    if (v10 && v9 == 1)
    {
      v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB2A28]];
      if (!v11)
      {
        v12 = (void *)MEMORY[0x1E4FB1818];
        v13 = [v8 imageData];
        v11 = [v12 imageWithData:v13];
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __93__CNVisualIdentityImagePickerController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke;
      v15[3] = &unk_1E5499D70;
      id v16 = v8;
      v17 = self;
      id v18 = v6;
      +[CNPhotoAssetCreationHelper createAssetFromImage:v11 completionHandler:v15];
    }
    else
    {
      v14 = [(CNVisualIdentityImagePickerController *)self delegate];
      [v14 imagePickerController:v6 didFinishWithProviderItem:v8];
    }
  }
}

void __93__CNVisualIdentityImagePickerController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setAssetIdentifier:a2];
  id v3 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__CNVisualIdentityImagePickerController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_2;
  v5[3] = &unk_1E549B800;
  id v4 = *(void **)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  id v6 = v4;
  id v7 = *(id *)(a1 + 32);
  [v3 performBlock:v5];
}

void __93__CNVisualIdentityImagePickerController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 imagePickerController:*(void *)(a1 + 40) didFinishWithProviderItem:*(void *)(a1 + 48)];
}

- (void)imageDataFromPickerResult:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = [a3 itemProvider];
  uint64_t v7 = *MEMORY[0x1E4F44400];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__CNVisualIdentityImagePickerController_imageDataFromPickerResult_completionHandler___block_invoke;
  v10[3] = &unk_1E5499D48;
  id v11 = v5;
  id v8 = v5;
  id v9 = (id)[v6 loadDataRepresentationForContentType:v7 completionHandler:v10];
}

void __85__CNVisualIdentityImagePickerController_imageDataFromPickerResult_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__CNVisualIdentityImagePickerController_imageDataFromPickerResult_completionHandler___block_invoke_2;
  v6[3] = &unk_1E549B710;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __85__CNVisualIdentityImagePickerController_imageDataFromPickerResult_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)providerItemFromImagePickerInfo:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB3230]];
  id v6 = (void *)MEMORY[0x1E4FB2A28];
  if (!v5)
  {
    uint64_t v7 = *MEMORY[0x1E4FB2A28];
    id v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB2A28]];

    if (v8)
    {
      id v9 = [v4 objectForKeyedSubscript:v7];
      id v5 = UIImageJPEGRepresentation(v9, 0.8);
    }
    else
    {
      id v5 = 0;
    }
  }
  v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB29F8]];
  v69 = v10;
  if (v10)
  {
    [v10 CGRectValue];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB28];
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  uint64_t v19 = *MEMORY[0x1E4FB2A30];
  v20 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB2A30]];

  if (v20)
  {
    v21 = [v4 objectForKeyedSubscript:v19];
    double v22 = (double)(unint64_t)[v21 pixelWidth];
    double v23 = (double)(unint64_t)[v21 pixelHeight];
    v24 = [v4 objectForKeyedSubscript:*v6];
    v25 = v24;
    double v26 = *MEMORY[0x1E4F1DB30];
    double v27 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (*MEMORY[0x1E4F1DB30] != v22 || v27 != v23)
    {
      [v24 size];
      if (v30 != v26 || v29 != v27)
      {
        [v25 size];
        if (v33 != v22 || v32 != v23)
        {
          v35 = [(id)objc_opt_class() log];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            [v25 size];
            double v37 = v36;
            [v25 size];
            *(_DWORD *)buf = 134219264;
            double v71 = v12;
            __int16 v72 = 2048;
            double v73 = v14;
            __int16 v74 = 2048;
            double v75 = v16;
            __int16 v76 = 2048;
            double v77 = v18;
            __int16 v78 = 2048;
            double v79 = v37;
            __int16 v80 = 2048;
            double v81 = v38;
            _os_log_impl(&dword_18B625000, v35, OS_LOG_TYPE_DEFAULT, "Adjusting cropRect, mismatch detected with returned crop rect {%.2f, %.2f, %.2f, %.2f} and original image size {%.2f, %.2f}", buf, 0x3Eu);
          }

          v39 = (void *)MEMORY[0x1E4F5A420];
          [v25 size];
          objc_msgSend(v39, "scaledCropRect:fromSize:toSize:", v12, v14, v16, v18, v22, v23, v40, v41);
          double v12 = v42;
          double v14 = v43;
          double v16 = v44;
          double v18 = v45;
        }
      }
    }
  }
  v46 = [MEMORY[0x1E4FB1818] imageWithData:v5];
  v47 = (void *)MEMORY[0x1E4F5A420];
  [v46 size];
  objc_msgSend(v47, "squareCropRect:toFitSize:", v12, v14, v16, v18, v48, v49);
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;
  v58 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB3218]];
  v59 = UIImageJPEGRepresentation(v58, 0.8);
  v60 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:]([CNPhotoPickerProviderItem alloc], "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v5, 0, v59, v51, v53, v55, v57);
  v61 = [v4 objectForKeyedSubscript:v19];
  v62 = [(CNVisualIdentityImagePickerController *)self photoLibraryAssetID];
  if (v62)
  {
    [(CNPhotoPickerProviderItem *)v60 setAssetIdentifier:v62];
  }
  else
  {
    v63 = [v61 localIdentifier];
    [(CNPhotoPickerProviderItem *)v60 setAssetIdentifier:v63];
  }
  v64 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    [v46 size];
    double v66 = v65;
    [v46 size];
    *(_DWORD *)buf = 134219264;
    double v71 = v66;
    __int16 v72 = 2048;
    double v73 = v67;
    __int16 v74 = 2048;
    double v75 = v51;
    __int16 v76 = 2048;
    double v77 = v53;
    __int16 v78 = 2048;
    double v79 = v55;
    __int16 v80 = 2048;
    double v81 = v57;
    _os_log_impl(&dword_18B625000, v64, OS_LOG_TYPE_DEFAULT, "Creating provider item with original image of size {%.2f, %.2f} and crop rect {%.2f, %.2f, %.2f, %.2f}", buf, 0x3Eu);
  }

  return v60;
}

- (void)presentImagePicker:(id)a3 withStyle:(int64_t)a4 fromViewController:(id)a5
{
}

- (void)presentImagePicker:(id)a3 withStyle:(int64_t)a4 fromViewController:(id)a5 forVisualIdentityPicker:(id)a6
{
  id v16 = a3;
  id v10 = a5;
  id v11 = a6;
  [v16 setModalPresentationStyle:a4];
  double v12 = [(CNVisualIdentityImagePickerController *)self contactStyle];
  objc_msgSend(v16, "setModalTransitionStyle:", objc_msgSend(v12, "modalTransitionStyle"));

  double v13 = [(CNVisualIdentityImagePickerController *)self presenterDelegate];
  char v14 = objc_opt_respondsToSelector();

  if (v11 && (v14 & 1) != 0)
  {
    double v15 = [(CNVisualIdentityImagePickerController *)self presenterDelegate];
    [v15 visualIdentityPicker:v11 presentViewController:v16];
  }
  else
  {
    [v10 presentViewController:v16 animated:1 completion:0];
  }
}

- (void)presentMoveAndScaleForImageData:(id)a3 withCropRect:(CGRect)a4 fromViewController:(id)a5 backgroundColor:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  objc_msgSend((id)objc_opt_class(), "imagePickerForEditingImageData:withCropRect:backgroundColor:", v15, v13, x, y, width, height);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  [v16 setDelegate:self];
  [(CNVisualIdentityImagePickerController *)self presentImagePicker:v16 withStyle:3 fromViewController:v14];
}

- (void)presentMoveAndScaleForImageData:(id)a3 withCropRect:(CGRect)a4 fromViewController:(id)a5
{
}

- (void)presentPhotoLibraryPickerFromViewController:(id)a3 sourceView:(id)a4
{
  id v5 = a3;
  objc_msgSend((id)objc_opt_class(), "photoLibraryImagePickerWithIsMeContact:", -[CNVisualIdentityImagePickerController isMeContact](self, "isMeContact"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setDelegate:self];
  [(CNVisualIdentityImagePickerController *)self presentImagePicker:v6 withStyle:3 fromViewController:v5];
}

- (void)presentCameraImagePickerFromViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() cameraImagePicker];
  [v5 setDelegate:self];
  [(CNVisualIdentityImagePickerController *)self presentImagePicker:v5 withStyle:0 fromViewController:v4];
}

- (CNVisualIdentityImagePickerController)initWithContactStyle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVisualIdentityImagePickerController;
  id v6 = [(CNVisualIdentityImagePickerController *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStyle, a3);
    id v8 = v7;
  }

  return v7;
}

+ (id)photoPickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4 backgroundColor:(id)a5 isMeContact:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v16 = 0;
  uint64_t v7 = +[CNPhotoLibraryProvider photoLibraryWithError:](CNPhotoLibraryProvider, "photoLibraryWithError:", &v16, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  id v8 = v16;
  if (!v7)
  {
    id v9 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_error_impl(&dword_18B625000, v9, OS_LOG_TYPE_ERROR, "Unable to pick photos from photo library %@", buf, 0xCu);
    }
  }
  objc_super v10 = (void *)[objc_alloc((Class)getPHPickerConfigurationClass[0]()) initWithPhotoLibrary:v7];
  id v11 = [(Class)getPHPickerFilterClass[0]() imagesFilter];
  [v10 setFilter:v11];

  [v10 _setDisabledPrivateCapabilities:8];
  Class v12 = (Class)get_PHPickerSuggestionGroupClass[0]();
  if (v6) {
    [(objc_class *)v12 deviceOwnerSuggestionGroup];
  }
  else {
  id v13 = [(objc_class *)v12 wallpaperSuggestionGroup];
  }
  objc_msgSend(v10, "set_suggestionGroup:", v13);

  id v14 = (void *)[objc_alloc(getPHPickerViewControllerClass_44175()) initWithConfiguration:v10];

  return v14;
}

+ (id)photoPickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4 isMeContact:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(), "photoPickerForEditingImageData:withCropRect:backgroundColor:isMeContact:", v10, 0, v5, x, y, width, height);

  return v11;
}

+ (id)photoLibraryImagePickerWithIsMeContact:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_opt_class();
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);

  return (id)objc_msgSend(v4, "photoPickerForEditingImageData:withCropRect:isMeContact:", 0, v3, v5, v6, v7, v8);
}

+ (id)imagePickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4 backgroundColor:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v33[6] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (v10)
  {
    v35.origin.double x = x;
    v35.origin.double y = y;
    v35.size.double width = width;
    v35.size.double height = height;
    if (CGRectIsEmpty(v35))
    {
      Class v12 = [MEMORY[0x1E4FB1818] imageWithData:v10];
      [v12 size];
      double v14 = v13;
      [v12 size];
      objc_msgSend(MEMORY[0x1E4F5A420], "centeredSquareCropRectInRect:", 0.0, 0.0, v14, v15 + -1.0);
      double x = v16;
      double y = v17;
      double width = v18;
      double height = v19;
    }
    id v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1828]), "_initWithSourceImageData:cropRect:", v10, x, y, width, height);
  }
  else
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4FB1828]);
  }
  v21 = v20;
  [v20 _setImagePickerSavingOptions:7];
  double v22 = (void *)MEMORY[0x1E4F1CA60];
  double v23 = [v21 _properties];
  v24 = [v22 dictionaryWithDictionary:v23];

  uint64_t v25 = *MEMORY[0x1E4FB3250];
  v32[0] = *MEMORY[0x1E4FB29F0];
  v32[1] = v25;
  v33[0] = MEMORY[0x1E4F1CC38];
  v33[1] = MEMORY[0x1E4F1CC38];
  uint64_t v26 = *MEMORY[0x1E4FB3210];
  v32[2] = *MEMORY[0x1E4FB31D8];
  v32[3] = v26;
  v33[2] = MEMORY[0x1E4F1CC38];
  v33[3] = MEMORY[0x1E4F1CC38];
  uint64_t v27 = *MEMORY[0x1E4FB31D0];
  v33[4] = MEMORY[0x1E4F1CC38];
  uint64_t v28 = *MEMORY[0x1E4FB3200];
  double v29 = v11;
  v32[4] = v27;
  v32[5] = v28;
  if (!v11)
  {
    double v29 = +[CNUIColorRepository photoPickerCaptureBackgroundColor];
  }
  v33[5] = v29;
  double v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:6];
  [v24 addEntriesFromDictionary:v30];

  if (!v11) {
  [v21 _setProperties:v24];
  }

  return v21;
}

+ (id)imagePickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(), "imagePickerForEditingImageData:withCropRect:backgroundColor:", v8, 0, x, y, width, height);

  return v9;
}

+ (id)cameraImagePicker
{
  id v2 = objc_msgSend((id)objc_opt_class(), "imagePickerForEditingImageData:withCropRect:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v2 setSourceType:1];

  return v2;
}

+ (id)log
{
  if (log_cn_once_token_20_44193 != -1) {
    dispatch_once(&log_cn_once_token_20_44193, &__block_literal_global_44194);
  }
  id v2 = (void *)log_cn_once_object_20_44195;

  return v2;
}

void __44__CNVisualIdentityImagePickerController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNVisualIdentityImagePickerController");
  v1 = (void *)log_cn_once_object_20_44195;
  log_cn_once_object_20_44195 = (uint64_t)v0;
}

@end