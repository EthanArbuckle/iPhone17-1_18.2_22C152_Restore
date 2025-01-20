@interface CKSharedQuickLookThumbnailCollectionViewCell
+ (id)placeHolderImage;
+ (id)reuseIdentifier;
- (void)configureWithAttachmentItem:(id)a3;
@end

@implementation CKSharedQuickLookThumbnailCollectionViewCell

+ (id)reuseIdentifier
{
  return @"CKSharedQuickLookThumbnailCollectionViewCell_reuseIdentifier";
}

+ (id)placeHolderImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CKSharedQuickLookThumbnailCollectionViewCell_placeHolderImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (placeHolderImage_onceToken != -1) {
    dispatch_once(&placeHolderImage_onceToken, block);
  }
  v2 = (void *)placeHolderImage_placeHolder;

  return v2;
}

void __64__CKSharedQuickLookThumbnailCollectionViewCell_placeHolderImage__block_invoke(uint64_t a1)
{
  [(id)objc_opt_class() defaultSize];
  double v3 = v2;
  double v5 = v4;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", v2, v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__CKSharedQuickLookThumbnailCollectionViewCell_placeHolderImage__block_invoke_2;
  v9[3] = &__block_descriptor_56_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v9[4] = v3;
  *(double *)&v9[5] = v5;
  v9[6] = *(void *)(a1 + 32);
  uint64_t v7 = [v6 imageWithActions:v9];
  v8 = (void *)placeHolderImage_placeHolder;
  placeHolderImage_placeHolder = v7;
}

void __64__CKSharedQuickLookThumbnailCollectionViewCell_placeHolderImage__block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = (void *)MEMORY[0x1E4F428B8];
  id v4 = a2;
  double v5 = [v3 tableBackgroundColor];
  [v5 setFill];

  v6 = (CGContext *)[v4 CGContext];
  v11.size.width = *(CGFloat *)(a1 + 32);
  v11.size.height = *(CGFloat *)(a1 + 40);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  CGContextFillRect(v6, v11);
  uint64_t v7 = (void *)MEMORY[0x1E4F42A80];
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v9 = [v7 imageNamed:@"ARKit" inBundle:v8];

  objc_msgSend(v9, "drawInRect:", *(double *)(a1 + 32) / 3.0, *(double *)(a1 + 40) / 3.0, *(double *)(a1 + 32) / 3.0, *(double *)(a1 + 32) / 3.0);
}

- (void)configureWithAttachmentItem:(id)a3
{
  id v4 = a3;
  double v5 = [(CKSharedAssetCollectionViewCell *)self previewTitleLabel];
  v6 = [v4 fileURL];
  uint64_t v7 = [v6 lastPathComponent];

  v8 = [(CKSharedAssetCollectionViewCell *)self formattedTitleFromPreviewTitle:v7];
  [v5 setAttributedText:v8];

  id v9 = [(CKSharedAssetCollectionViewCell *)self previewView];
  v10 = [v9 layer];

  [v10 setContentsGravity:*MEMORY[0x1E4F3A3E0]];
  [v10 setMasksToBounds:1];
  id v11 = [(id)objc_opt_class() placeHolderImage];
  objc_msgSend(v10, "setContents:", objc_msgSend(v11, "CGImage"));

  v12 = +[CKPreviewDispatchCache detailsPreviewCache];
  [v12 resume];

  v13 = [MEMORY[0x1E4F1C9C8] date];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__CKSharedQuickLookThumbnailCollectionViewCell_configureWithAttachmentItem___block_invoke;
  v16[3] = &unk_1E5628F90;
  id v17 = v13;
  id v18 = v10;
  id v14 = v10;
  id v15 = v13;
  [v4 generatePreviewWithCompletion:v16];
}

void __76__CKSharedQuickLookThumbnailCollectionViewCell_configureWithAttachmentItem___block_invoke(uint64_t a1, id a2)
{
  if (a2)
  {
    id v6 = [a2 CGImage];
    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v3 < -0.1)
    {
      id v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"contents"];
      double v5 = [*(id *)(a1 + 40) contents];
      [v4 setFromValue:v5];

      [v4 setToValue:v6];
      [v4 setDuration:0.12];
      [*(id *)(a1 + 40) addAnimation:v4 forKey:@"contents"];
    }
    [*(id *)(a1 + 40) setContents:v6];
  }
}

@end