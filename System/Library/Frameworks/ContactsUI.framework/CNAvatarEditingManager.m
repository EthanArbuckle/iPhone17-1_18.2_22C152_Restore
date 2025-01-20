@interface CNAvatarEditingManager
+ (id)log;
- (AVTAvatarRecord)avatarRecord;
- (AVTStickerConfiguration)poseConfiguration;
- (CGRect)computeFullscreenImageRectForScreenWithSize:(CGSize)a3;
- (CNAvatarEditingManager)initWithAvatarRecord:(id)a3 poseConfiguration:(id)a4 variantsManager:(id)a5;
- (CNAvatarEditingManager)initWithAvatarRecord:(id)a3 variantsManager:(id)a4;
- (CNAvatarEditingManagerDelegate)delegate;
- (CNPhotoPickerAnimojiProviderItem)originalItem;
- (CNPhotoPickerVariantsManager)variantsManager;
- (UIImage)imageWithAlpha;
- (UIViewController)viewController;
- (id)captureFlashViewWithSize:(CGSize)a3 alpha:(double)a4;
- (id)compositeImageDataForImage:(id)a3 backgroundColor:(id)a4;
- (id)createImagePickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4 customBackgroundColor:(id)a5;
- (id)croppedAndCenteredImageForGeneratedImage:(id)a3 toSize:(CGSize)a4;
- (id)fullScreenImageFromImage:(id)a3 inSize:(CGSize)a4;
- (id)imagePickerForItem:(id)a3;
- (id)initForEditingWithAvatarRecord:(id)a3 variantsManager:(id)a4 fromViewController:(id)a5;
- (id)renderImage:(id)a3 inRect:(CGRect)a4;
- (void)combinedPickerViewController:(id)a3 didSelectRecord:(id)a4 withStickerConfiguration:(id)a5;
- (void)combinedPickerViewControllerDidCancel:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)prepareAvatarImageForPicker:(id)a3 synchronousCompletion:(id)a4;
- (void)presentImagePickerForImage:(id)a3 cropRect:(CGRect)a4 fadeIn:(BOOL)a5 completion:(id)a6;
- (void)setAvatarRecord:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageWithAlpha:(id)a3;
- (void)setOriginalItem:(id)a3;
- (void)setPoseConfiguration:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation CNAvatarEditingManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageWithAlpha, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_poseConfiguration, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_originalItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setImageWithAlpha:(id)a3
{
}

- (UIImage)imageWithAlpha
{
  return self->_imageWithAlpha;
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setPoseConfiguration:(id)a3
{
}

- (AVTStickerConfiguration)poseConfiguration
{
  return self->_poseConfiguration;
}

- (void)setAvatarRecord:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setViewController:(id)a3
{
}

- (void)setOriginalItem:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (CNAvatarEditingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAvatarEditingManagerDelegate *)WeakRetained;
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  if (self->_viewController)
  {
    id v3 = [(CNAvatarEditingManager *)self viewController];
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    [a3 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(CNAvatarEditingManager *)self delegate];

  if (v8)
  {
    v9 = [(CNAvatarEditingManager *)self imageWithAlpha];
    v10 = UIImagePNGRepresentation(v9);

    v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB29F8]];
    v12 = v11;
    if (v11)
    {
      [v11 CGRectValue];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
    }
    else
    {
      double v14 = *MEMORY[0x1E4F1DB28];
      double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    [v6 dismissViewControllerAnimated:1 completion:0];
    v21 = [MEMORY[0x1E4FB1818] imageWithData:v10];
    [v21 size];
    double v23 = v22;
    double v25 = v24;

    v26 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB2A28]];
    [v26 size];
    double v28 = v27;
    double v30 = v29;

    if (v23 != v28 || v25 != v30)
    {
      v32 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = 134218752;
        double v50 = v28;
        __int16 v51 = 2048;
        double v52 = v30;
        __int16 v53 = 2048;
        double v54 = v23;
        __int16 v55 = 2048;
        double v56 = v25;
        _os_log_impl(&dword_18B625000, v32, OS_LOG_TYPE_DEFAULT, "Scaling cropRect, image size mismatch detected with returned UIImagePickerControllerOriginalImage {%.2f, %.2f} and original image provided on initialization {%.2f, %.2f}", (uint8_t *)&v49, 0x2Au);
      }

      objc_msgSend(MEMORY[0x1E4F5A420], "scaledCropRect:fromSize:toSize:", v14, v16, v18, v20, v28, v30, v23, v25);
      objc_msgSend(MEMORY[0x1E4F5A420], "squareCropRect:toFitSize:");
      double v14 = v33;
      double v16 = v34;
      double v18 = v35;
      double v20 = v36;
    }
    v37 = [(CNAvatarEditingManager *)self originalItem];
    v38 = [v37 backgroundColorVariant];
    v39 = v38;
    if (v38)
    {
      id v40 = v38;
    }
    else
    {
      v41 = [(CNAvatarEditingManager *)self variantsManager];
      v42 = [v41 avatarBackgrounds];
      id v40 = [v42 firstObject];
    }
    v43 = -[CNPhotoPickerAnimojiProviderItem initWithOriginalImageData:cropRect:backgroundColorVariant:]([CNPhotoPickerAnimojiProviderItem alloc], "initWithOriginalImageData:cropRect:backgroundColorVariant:", v10, v40, v14, v16, v18, v20);
    v44 = [(CNAvatarEditingManager *)self originalItem];
    [v44 originalImageSize];
    -[CNPhotoPickerAnimojiProviderItem setOriginalImageSize:](v43, "setOriginalImageSize:");

    v45 = [(CNAvatarEditingManager *)self avatarRecord];
    [(CNPhotoPickerAnimojiProviderItem *)v43 setAvatarRecord:v45];

    v46 = [(CNAvatarEditingManager *)self poseConfiguration];
    [(CNPhotoPickerAnimojiProviderItem *)v43 setPoseConfiguration:v46];

    v47 = [(CNAvatarEditingManager *)self originalItem];
    [v47 edgeInsets];
    -[CNPhotoPickerAnimojiProviderItem setEdgeInsets:](v43, "setEdgeInsets:");

    v48 = [(CNAvatarEditingManager *)self delegate];
    [v48 avatarEditingManager:self didFinishWithProviderItem:v43];
  }
}

- (id)createImagePickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4 customBackgroundColor:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v26[7] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  if (v11) {
    id v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1828]), "_initWithSourceImageData:cropRect:", v11, x, y, width, height);
  }
  else {
    id v13 = objc_alloc_init(MEMORY[0x1E4FB1828]);
  }
  double v14 = v13;
  [v13 setDelegate:self];
  if (v12)
  {
    id v15 = v12;
  }
  else
  {
    id v15 = +[CNUIColorRepository photoPickerCaptureBackgroundColor];
  }
  double v16 = v15;
  [v14 _setImagePickerSavingOptions:7];
  double v17 = (void *)MEMORY[0x1E4F1CA60];
  double v18 = [v14 _properties];
  double v19 = [v17 dictionaryWithDictionary:v18];

  uint64_t v20 = *MEMORY[0x1E4FB3250];
  v25[0] = *MEMORY[0x1E4FB29F0];
  v25[1] = v20;
  v26[0] = MEMORY[0x1E4F1CC38];
  v26[1] = MEMORY[0x1E4F1CC38];
  uint64_t v21 = *MEMORY[0x1E4FB3210];
  v25[2] = *MEMORY[0x1E4FB31D8];
  v25[3] = v21;
  v26[2] = MEMORY[0x1E4F1CC38];
  v26[3] = MEMORY[0x1E4F1CC38];
  uint64_t v22 = *MEMORY[0x1E4FB3240];
  v25[4] = *MEMORY[0x1E4FB31D0];
  v25[5] = v22;
  v26[4] = MEMORY[0x1E4F1CC38];
  v26[5] = MEMORY[0x1E4F1CC28];
  v25[6] = *MEMORY[0x1E4FB3200];
  v26[6] = v16;
  double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:7];
  [v19 addEntriesFromDictionary:v23];

  [v14 _setProperties:v19];

  return v14;
}

- (id)imagePickerForItem:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1818];
  id v5 = a3;
  id v6 = [v5 originalImageData];
  id v7 = [v4 imageWithData:v6];
  [(CNAvatarEditingManager *)self setImageWithAlpha:v7];

  v8 = [v5 backgroundColorVariant];
  v9 = [v8 color];
  v10 = +[CNPhotoPickerVariantsManager nonAlphaColorForBackgroundColor:v9];

  id v11 = [(CNAvatarEditingManager *)self imageWithAlpha];
  id v12 = [(CNAvatarEditingManager *)self compositeImageDataForImage:v11 backgroundColor:v10];

  [v5 cropRect];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  uint64_t v21 = -[CNAvatarEditingManager createImagePickerForEditingImageData:withCropRect:customBackgroundColor:](self, "createImagePickerForEditingImageData:withCropRect:customBackgroundColor:", v12, v10, v14, v16, v18, v20);

  return v21;
}

- (id)croppedAndCenteredImageForGeneratedImage:(id)a3 toSize:(CGSize)a4
{
  v4 = -[CNAvatarEditingManager fullScreenImageFromImage:inSize:](self, "fullScreenImageFromImage:inSize:", a3, a4.width, a4.height);
  id v5 = +[CNAvatarImageUtilities croppedAndCenteredAvatarImageForImage:v4 widthMultiplier:1.1];

  return v5;
}

- (void)presentImagePickerForImage:(id)a3 cropRect:(CGRect)a4 fadeIn:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a6;
  id v14 = a3;
  [(CNAvatarEditingManager *)self setImageWithAlpha:v14];
  double v15 = [(CNAvatarEditingManager *)self compositeImageDataForImage:v14 backgroundColor:0];

  double v16 = -[CNAvatarEditingManager createImagePickerForEditingImageData:withCropRect:customBackgroundColor:](self, "createImagePickerForEditingImageData:withCropRect:customBackgroundColor:", v15, 0, x, y, width, height);
  [v16 setModalTransitionStyle:2];
  [v16 setModalPresentationStyle:3];
  if (v6)
  {
    double v17 = [v16 view];
    [v17 bounds];
    double v20 = -[CNAvatarEditingManager captureFlashViewWithSize:alpha:](self, "captureFlashViewWithSize:alpha:", v18, v19, 1.0);

    uint64_t v21 = [v16 view];
    [v21 addSubview:v20];

    uint64_t v22 = [(CNAvatarEditingManager *)self viewController];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __80__CNAvatarEditingManager_presentImagePickerForImage_cropRect_fadeIn_completion___block_invoke;
    v25[3] = &unk_1E549B710;
    id v26 = v20;
    id v27 = v13;
    id v23 = v20;
    [v22 presentViewController:v16 animated:0 completion:v25];
  }
  else
  {
    double v24 = [(CNAvatarEditingManager *)self viewController];
    [v24 presentViewController:v16 animated:1 completion:0];
  }
}

void __80__CNAvatarEditingManager_presentImagePickerForImage_cropRect_fadeIn_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__CNAvatarEditingManager_presentImagePickerForImage_cropRect_fadeIn_completion___block_invoke_2;
  v6[3] = &unk_1E549B488;
  id v7 = *(id *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__CNAvatarEditingManager_presentImagePickerForImage_cropRect_fadeIn_completion___block_invoke_3;
  v3[3] = &unk_1E549B8C8;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 animateWithDuration:0x20000 delay:v6 options:v3 animations:0.1 completion:0.0];
}

uint64_t __80__CNAvatarEditingManager_presentImagePickerForImage_cropRect_fadeIn_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __80__CNAvatarEditingManager_presentImagePickerForImage_cropRect_fadeIn_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)prepareAvatarImageForPicker:(id)a3 synchronousCompletion:(id)a4
{
  BOOL v6 = (void (**)(id, void *, double, double, double, double))a4;
  id v7 = a3;
  +[CNAvatarImageUtilities transparencyInsetsForImage:v7 requiringFullOpacity:0];
  double v9 = v8;
  [v7 size];
  double v11 = v10;
  [v7 size];
  -[CNAvatarEditingManager croppedAndCenteredImageForGeneratedImage:toSize:](self, "croppedAndCenteredImageForGeneratedImage:toSize:", v7, v11, v12 + v12);
  id v50 = (id)objc_claimAutoreleasedReturnValue();
  +[CNAvatarImageUtilities transparencyInsetsForImage:v50 requiringFullOpacity:0];
  double v14 = v13;
  double v15 = (void *)MEMORY[0x1E4F5A420];
  [v50 size];
  double v17 = v16;
  [v50 size];
  objc_msgSend(v15, "centeredSquareCropRectInRect:", 0.0, 0.0, v17, v18);
  CGFloat v20 = v19;
  double v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  [v50 size];
  double v28 = v27;
  [v7 scale];
  double v30 = v28 - v14 / v29;
  v52.origin.double x = v20;
  v52.origin.double y = v22;
  v52.size.double width = v24;
  v52.size.double height = v26;
  double v31 = v30 - CGRectGetMaxY(v52);
  [v7 scale];
  double v33 = v31 - v32;
  if (v9 != 0.0) {
    double v33 = 0.0;
  }
  CGFloat v34 = v22 + v33;
  [v50 size];
  CGFloat v36 = v35 * 0.1;
  v37 = +[CNAvatarImageUtilities paddedImage:v50 withPadding:v35 * 0.1];
  v53.origin.double x = v20;
  v53.origin.double y = v34;
  v53.size.double width = v24;
  v53.size.double height = v26;
  CGRect v54 = CGRectOffset(v53, v36, v36);
  double x = v54.origin.x;
  double y = v54.origin.y;
  double width = v54.size.width;
  double height = v54.size.height;
  [v7 scale];
  double v43 = v42 * x;
  [v7 scale];
  double v45 = y * v44;
  [v7 scale];
  double v47 = width * v46;
  [v7 scale];
  double v49 = v48;

  v6[2](v6, v37, v43, v45, v47, height * v49);
}

- (id)compositeImageDataForImage:(id)a3 backgroundColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    double v10 = [(CNAvatarEditingManager *)self viewController];
    double v11 = [v10 traitCollection];
    if ([v11 userInterfaceStyle] == 2) {
      +[CNUIColorRepository photoPickerCaptureDarkBackgroundColor];
    }
    else {
    id v9 = +[CNUIColorRepository photoPickerCaptureLightBackgroundColor];
    }
  }
  [v6 size];
  double v13 = v12;
  [v6 size];
  double v15 = v14;
  [v6 scale];
  CGFloat v17 = v16;
  v22.double width = v13;
  v22.double height = v15;
  UIGraphicsBeginImageContextWithOptions(v22, 0, v17);
  [v9 setFill];
  v23.origin.double x = 0.0;
  v23.origin.double y = 0.0;
  v23.size.double width = v13;
  v23.size.double height = v15;
  UIRectFill(v23);
  objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v13, v15);
  UIGraphicsGetImageFromCurrentImageContext();
  double v18 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  double v19 = UIImagePNGRepresentation(v18);

  return v19;
}

- (id)renderImage:(id)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  double width = a4.size.width;
  id v6 = a3;
  [v6 size];
  [v6 size];
  [v6 scale];
  UIRoundToScale();
  double v8 = v7;
  [v6 scale];
  UIRoundToScale();
  double v10 = v9;
  [v6 scale];
  CGFloat v12 = v11;
  v17.double width = width;
  v17.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v12);
  id v13 = UIGraphicsGetImageFromCurrentImageContext();
  objc_msgSend(v6, "drawInRect:", 0.0, v10, width, v8);

  double v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v14;
}

- (CGRect)computeFullscreenImageRectForScreenWithSize:(CGSize)a3
{
  if (a3.width <= a3.height) {
    double width = a3.width;
  }
  else {
    double width = a3.height;
  }
  if (a3.width <= a3.height) {
    double height = a3.height;
  }
  else {
    double height = a3.width;
  }
  double v5 = 0.0;
  double v6 = 0.0;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (id)fullScreenImageFromImage:(id)a3 inSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  -[CNAvatarEditingManager computeFullscreenImageRectForScreenWithSize:](self, "computeFullscreenImageRectForScreenWithSize:", width, height);
  double v8 = -[CNAvatarEditingManager renderImage:inRect:](self, "renderImage:inRect:", v7);

  return v8;
}

- (void)combinedPickerViewController:(id)a3 didSelectRecord:(id)a4 withStickerConfiguration:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [(CNAvatarEditingManager *)self setAvatarRecord:v8];
  double v9 = +[CNPhotoPickerAnimojiProvider providerItemForAvatarRecord:v8];

  [v9 setPoseConfiguration:v7];
  double v10 = [(CNAvatarEditingManager *)self originalItem];
  [v10 originalImageSize];
  objc_msgSend(v9, "setOriginalImageSize:");

  double v11 = [(CNAvatarEditingManager *)self originalItem];
  [v11 edgeInsets];
  objc_msgSend(v9, "setEdgeInsets:");

  [(CNAvatarEditingManager *)self setPoseConfiguration:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__CNAvatarEditingManager_combinedPickerViewController_didSelectRecord_withStickerConfiguration___block_invoke;
  v13[3] = &unk_1E549BF80;
  v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  [v12 applyVariantEffectToFullsizeImageWithCompletion:v13];
}

void __96__CNAvatarEditingManager_combinedPickerViewController_didSelectRecord_withStickerConfiguration___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) originalItem];
  [v2 edgeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [*(id *)(a1 + 40) edgeInsets];
  if (v6 != v14 || v4 != v11 || v10 != v13)
  {

LABEL_10:
    [*(id *)(a1 + 40) edgeInsets];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    CGFloat v26 = [*(id *)(a1 + 32) originalItem];
    objc_msgSend(v26, "setEdgeInsets:", v19, v21, v23, v25);

    goto LABEL_11;
  }
  double v17 = v12;

  if (v8 != v17) {
    goto LABEL_10;
  }
LABEL_11:
  [*(id *)(a1 + 40) originalImageSize];
  double v28 = v27;
  double v30 = v29;
  double v31 = [*(id *)(a1 + 32) originalItem];
  objc_msgSend(v31, "setOriginalImageSize:", v28, v30);

  double v32 = (void *)MEMORY[0x1E4FB1818];
  double v33 = [*(id *)(a1 + 40) imageData];
  CGFloat v34 = objc_msgSend(v32, "cnui_imageWithDataPreservingScale:", v33);

  uint64_t v44 = 0;
  double v45 = &v44;
  uint64_t v46 = 0x3032000000;
  double v47 = __Block_byref_object_copy__34017;
  double v48 = __Block_byref_object_dispose__34018;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = (double *)&v38;
  uint64_t v40 = 0x4010000000;
  v41 = &unk_18BA11DF2;
  long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v42 = *MEMORY[0x1E4F1DB28];
  long long v43 = v35;
  CGFloat v36 = *(void **)(a1 + 32);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __96__CNAvatarEditingManager_combinedPickerViewController_didSelectRecord_withStickerConfiguration___block_invoke_6;
  v37[3] = &unk_1E5499468;
  v37[4] = &v44;
  v37[5] = &v38;
  [v36 prepareAvatarImageForPicker:v34 synchronousCompletion:v37];
  objc_msgSend(*(id *)(a1 + 32), "presentImagePickerForImage:cropRect:fadeIn:completion:", v45[5], 0, 0, v39[4], v39[5], v39[6], v39[7]);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
}

void __96__CNAvatarEditingManager_combinedPickerViewController_didSelectRecord_withStickerConfiguration___block_invoke_6(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v12 = a2;
  double v13 = *(double **)(*(void *)(a1 + 40) + 8);
  v13[4] = a3;
  void v13[5] = a4;
  v13[6] = a5;
  v13[7] = a6;
}

- (void)combinedPickerViewControllerDidCancel:(id)a3
{
  id v4 = [(CNAvatarEditingManager *)self delegate];
  [v4 avatarEditingManager:self didFinishWithProviderItem:0];
}

- (id)captureFlashViewWithSize:(CGSize)a3 alpha:(double)a4
{
  double v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, a3.width, a3.height);
  double v6 = [MEMORY[0x1E4FB1618] blackColor];
  [v5 setBackgroundColor:v6];

  [v5 setAlpha:a4];

  return v5;
}

- (UIViewController)viewController
{
  viewController = self->_viewController;
  if (!viewController)
  {
    uint64_t v12 = 0;
    double v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v4 = (void *)getAVTCombinedPickerViewControllerClass_softClass;
    uint64_t v15 = getAVTCombinedPickerViewControllerClass_softClass;
    if (!getAVTCombinedPickerViewControllerClass_softClass)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getAVTCombinedPickerViewControllerClass_block_invoke;
      v11[3] = &unk_1E549AD00;
      v11[4] = &v12;
      __getAVTCombinedPickerViewControllerClass_block_invoke((uint64_t)v11);
      id v4 = (void *)v13[3];
    }
    double v5 = v4;
    _Block_object_dispose(&v12, 8);
    id v6 = [v5 alloc];
    double v7 = [(CNAvatarEditingManager *)self avatarRecord];
    double v8 = (UIViewController *)[v6 initWithSelectedRecord:v7];

    [(UIViewController *)v8 setDelegate:self];
    double v9 = self->_viewController;
    self->_viewController = v8;

    viewController = self->_viewController;
  }

  return viewController;
}

- (CNPhotoPickerAnimojiProviderItem)originalItem
{
  originalItem = self->_originalItem;
  if (!originalItem)
  {
    id v4 = [(CNAvatarEditingManager *)self avatarRecord];
    double v5 = +[CNPhotoPickerAnimojiProvider providerItemForAvatarRecord:v4];
    id v6 = self->_originalItem;
    self->_originalItem = v5;

    originalItem = self->_originalItem;
  }

  return originalItem;
}

- (id)initForEditingWithAvatarRecord:(id)a3 variantsManager:(id)a4 fromViewController:(id)a5
{
  id v9 = a5;
  double v10 = [(CNAvatarEditingManager *)self initWithAvatarRecord:a3 variantsManager:a4];
  double v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_viewController, a5);
    uint64_t v12 = v11;
  }

  return v11;
}

- (CNAvatarEditingManager)initWithAvatarRecord:(id)a3 poseConfiguration:(id)a4 variantsManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNAvatarEditingManager;
  uint64_t v12 = [(CNAvatarEditingManager *)&v16 init];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_avatarRecord, a3);
    objc_storeStrong((id *)&v13->_poseConfiguration, a4);
    objc_storeStrong((id *)&v13->_variantsManager, a5);
    uint64_t v14 = v13;
  }

  return v13;
}

- (CNAvatarEditingManager)initWithAvatarRecord:(id)a3 variantsManager:(id)a4
{
  return [(CNAvatarEditingManager *)self initWithAvatarRecord:a3 poseConfiguration:0 variantsManager:a4];
}

+ (id)log
{
  if (log_cn_once_token_1_34039 != -1) {
    dispatch_once(&log_cn_once_token_1_34039, &__block_literal_global_34040);
  }
  v2 = (void *)log_cn_once_object_1_34041;

  return v2;
}

void __29__CNAvatarEditingManager_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNVisualIdentityPicker");
  v1 = (void *)log_cn_once_object_1_34041;
  log_cn_once_object_1_34041 = (uint64_t)v0;
}

@end