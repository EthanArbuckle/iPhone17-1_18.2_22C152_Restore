@interface AEMessagesShelfRoundButton
+ (CGSize)intrinsicContentSizeForStyle:(int64_t)a3;
+ (CGSize)preferredTapRegionSizeForStyle:(int64_t)a3;
+ (id)_imageForStyle:(int64_t)a3;
+ (id)roundButtonWithStyle:(int64_t)a3;
- (void)_commonAEMessagesRoundButtonInitializationWithStyle:(int64_t)a3;
@end

@implementation AEMessagesShelfRoundButton

- (void)_commonAEMessagesRoundButtonInitializationWithStyle:(int64_t)a3
{
  id v20 = [(id)objc_opt_class() _imageForStyle:a3];
  -[AEMessagesShelfRoundButton setImage:forState:](self, "setImage:forState:");
  [(id)objc_opt_class() preferredTapRegionSizeForStyle:a3];
  double v6 = v5;
  double v8 = v7;
  [(id)objc_opt_class() intrinsicContentSizeForStyle:a3];
  double v11 = v9;
  double v12 = v10;
  if ((unint64_t)(a3 - 1) >= 2)
  {
    double v14 = 0.0;
    double v13 = 0.0;
    double v18 = 0.0;
    double v19 = 0.0;
    if (!a3)
    {
      double v18 = v6 + -4.0 - v11;
      double v13 = v8 + -4.0 - v12;
      double v14 = 4.0;
      double v19 = 4.0;
    }
  }
  else
  {
    double v13 = v8 + -3.0 - v10;
    double v14 = v6 + -3.0 - v9;
    v15 = [(AEMessagesShelfRoundButton *)self imageView];
    v16 = [v15 layer];
    [v16 setCornerRadius:v11 * 0.5];

    v17 = [MEMORY[0x263F825C8] whiteColor];
    [v15 setBackgroundColor:v17];

    double v18 = 3.0;
    double v19 = 3.0;
  }
  -[AEMessagesShelfRoundButton setImageEdgeInsets:](self, "setImageEdgeInsets:", v19, v18, v13, v14);
}

+ (CGSize)intrinsicContentSizeForStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      double v3 = *MEMORY[0x263F001B0];
      double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59__AEMessagesShelfRoundButton_intrinsicContentSizeForStyle___block_invoke;
      block[3] = &__block_descriptor_48_e5_v8__0l;
      block[4] = a1;
      block[5] = 0;
      if (intrinsicContentSizeForStyle__onceToken != -1) {
        dispatch_once(&intrinsicContentSizeForStyle__onceToken, block);
      }
      double v3 = *(double *)&intrinsicContentSizeForStyle__imageSize_0;
      double v4 = *(double *)&intrinsicContentSizeForStyle__imageSize_1;
    }
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __59__AEMessagesShelfRoundButton_intrinsicContentSizeForStyle___block_invoke_2;
    v5[3] = &__block_descriptor_48_e5_v8__0l;
    v5[4] = a1;
    v5[5] = a3;
    if (intrinsicContentSizeForStyle__onceToken_11 != -1) {
      dispatch_once(&intrinsicContentSizeForStyle__onceToken_11, v5);
    }
    double v3 = *(double *)&intrinsicContentSizeForStyle__imageSize_10_0 + -2.0;
    double v4 = *(double *)&intrinsicContentSizeForStyle__imageSize_10_1 + -2.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

void __59__AEMessagesShelfRoundButton_intrinsicContentSizeForStyle___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _imageForStyle:*(void *)(a1 + 40)];
  [v3 size];
  intrinsicContentSizeForStyle__imageSize_0 = v1;
  intrinsicContentSizeForStyle__imageSize_1 = v2;
}

void __59__AEMessagesShelfRoundButton_intrinsicContentSizeForStyle___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _imageForStyle:*(void *)(a1 + 40)];
  [v3 size];
  intrinsicContentSizeForStyle__imageSize_10_0 = v1;
  intrinsicContentSizeForStyle__imageSize_10_1 = v2;
}

+ (CGSize)preferredTapRegionSizeForStyle:(int64_t)a3
{
  double v3 = 44.0;
  double v4 = 44.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)_imageForStyle:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      double v6 = (void *)MEMORY[0x263F827E8];
      double v4 = AssetExplorerBundle();
      double v7 = [v6 imageNamed:@"share-iris-off" inBundle:v4];
      uint64_t v8 = [MEMORY[0x263F825C8] blackColor];
LABEL_7:
      double v10 = (void *)v8;
      double v5 = [v7 _flatImageWithColor:v8];

      goto LABEL_8;
    case 1:
      double v9 = (void *)MEMORY[0x263F827E8];
      double v4 = AssetExplorerBundle();
      double v7 = [v9 imageNamed:@"share-iris-on" inBundle:v4];
      uint64_t v8 = [MEMORY[0x263F825C8] systemBlueColor];
      goto LABEL_7;
    case 0:
      double v3 = (void *)MEMORY[0x263F827E8];
      double v4 = AssetExplorerBundle();
      double v5 = [v3 imageNamed:@"Cancel-Button" inBundle:v4];
LABEL_8:

      goto LABEL_10;
  }
  double v5 = 0;
LABEL_10:
  return v5;
}

+ (id)roundButtonWithStyle:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      double v3 = +[AEMessagesShelfRoundButton buttonWithType:0];
      double v4 = v3;
      uint64_t v5 = 2;
      goto LABEL_7;
    case 1:
      double v3 = +[AEMessagesShelfRoundButton buttonWithType:0];
      double v4 = v3;
      uint64_t v5 = 1;
      goto LABEL_7;
    case 0:
      double v3 = +[AEMessagesShelfRoundButton buttonWithType:](AEMessagesShelfRoundButton, "buttonWithType:");
      double v4 = v3;
      uint64_t v5 = 0;
LABEL_7:
      [v3 _commonAEMessagesRoundButtonInitializationWithStyle:v5];
      goto LABEL_9;
  }
  double v4 = 0;
LABEL_9:
  return v4;
}

@end