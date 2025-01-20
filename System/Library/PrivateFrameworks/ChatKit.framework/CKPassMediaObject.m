@interface CKPassMediaObject
- (CKPassMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5;
- (UIImage)icon;
- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4;
- (id)passView;
- (id)subtitle;
- (id)title;
- (void)setIcon:(id)a3;
@end

@implementation CKPassMediaObject

- (CKPassMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CKPassMediaObject;
  v5 = [(CKMediaObject *)&v10 initWithTransfer:a3 context:a4 forceInlinePreview:a5];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      id v8 = [(CKPassMediaObject *)v5 icon];
    }
  }
  return v5;
}

- (id)title
{
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    v6.receiver = self;
    v6.super_class = (Class)CKPassMediaObject;
    v3 = [(CKMediaObject *)&v6 title];
  }
  else
  {
    v4 = [(CKPassbookMediaObject *)self pass];
    v3 = +[CKPassKitHelper localizedNameForPass:v4];
  }

  return v3;
}

- (id)subtitle
{
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    v6.receiver = self;
    v6.super_class = (Class)CKPassMediaObject;
    v3 = [(CKMediaObject *)&v6 subtitle];
  }
  else
  {
    v4 = [(CKPassbookMediaObject *)self pass];
    v3 = +[CKPassKitHelper organizationNameForPass:v4];
  }

  return v3;
}

- (UIImage)icon
{
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    v25.receiver = self;
    v25.super_class = (Class)CKPassMediaObject;
    v3 = [(CKMediaObject *)&v25 icon];
  }
  else
  {
    icon = self->_icon;
    if (!icon)
    {
      v5 = [(CKPassbookMediaObject *)self pass];
      objc_super v6 = +[CKPassKitHelper mailAttachmentIconForPass:v5];

      if (v6)
      {
        double v7 = *MEMORY[0x1E4F1DB28];
        double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        v9 = +[CKUIBehavior sharedBehaviors];
        objc_super v10 = [v9 genericDocumentIcon];
        [v10 size];
        double v12 = v11;
        double v14 = v13;

        [v6 size];
        double v17 = v12 / v15;
        double v18 = 0.0;
        if (v15 == 0.0) {
          double v17 = 0.0;
        }
        if (v16 != 0.0) {
          double v18 = v14 / v16;
        }
        double v19 = fmax(v17, v18);
        v27.CGFloat width = v15 * v19;
        CGFloat width = v27.width;
        v27.CGFloat height = v16 * v19;
        CGFloat height = v27.height;
        UIGraphicsBeginImageContextWithOptions(v27, 0, 0.0);
        objc_msgSend(v6, "drawInRect:", v7, v8, width, height);
        UIGraphicsGetImageFromCurrentImageContext();
        v22 = (UIImage *)objc_claimAutoreleasedReturnValue();
        v23 = self->_icon;
        self->_icon = v22;

        UIGraphicsEndImageContext();
      }

      icon = self->_icon;
    }
    v3 = icon;
  }

  return v3;
}

- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4
{
  double height = a3.height;
  double width = a3.width;
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    _IMWarn();
    double v7 = 0;
  }
  else
  {
    double v8 = [(CKPassMediaObject *)self passView];
    v9 = [v8 snapshotOfFrontFace];

    [v9 size];
    double v12 = width / v11;
    BOOL v13 = v11 == 0.0;
    double v14 = 0.0;
    if (v13) {
      double v12 = 0.0;
    }
    if (v10 != 0.0) {
      double v14 = height / v10;
    }
    double v15 = fmax(v12, v14);
    double v16 = [MEMORY[0x1E4F42D90] mainScreen];
    [v16 scale];
    double v18 = v17 / v15;

    id v19 = objc_alloc(MEMORY[0x1E4F42A80]);
    id v20 = v9;
    double v7 = objc_msgSend(v19, "initWithCGImage:scale:orientation:", objc_msgSend(v20, "CGImage"), 0, v18);
  }

  return v7;
}

- (id)passView
{
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    _IMWarn();
    v3 = 0;
  }
  else
  {
    if (passView_onceToken != -1) {
      dispatch_once(&passView_onceToken, &__block_literal_global_128);
    }
    v4 = [(CKPassbookMediaObject *)self pass];
    v3 = +[CKPassKitHelper passViewForPass:v4 content:5];

    [v3 setSuppressedContent:6];
    v5 = [MEMORY[0x1E4F428B8] clearColor];
    [v3 setBackgroundColor:v5];
  }

  return v3;
}

uint64_t __29__CKPassMediaObject_passView__block_invoke()
{
  uint64_t result = MEMORY[0x192FBA860](@"PKPassView", @"PassKitUI");
  sPKPassViewClass = result;
  return result;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end