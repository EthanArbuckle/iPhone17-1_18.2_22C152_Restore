@interface MFAttachmentImageGenerator
+ (CGRect)imageRectForAttachment:(id)a3;
+ (double)defaultHeight;
+ (id)imageForAttachment:(id)a3;
+ (id)pngDataForAttachment:(id)a3;
- (CGRect)imageRect;
- (MFAttachmentImageGenerator)initWithAttachment:(id)a3;
- (id)image;
- (id)pngData;
- (void)drawRect:(CGRect)a3;
@end

@implementation MFAttachmentImageGenerator

- (MFAttachmentImageGenerator)initWithAttachment:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() defaultHeight];
  double v6 = v5;
  int v7 = [v4 isPass];
  if (!v7) {
    goto LABEL_18;
  }
  v8 = [v4 passWithError:0];
  if (!v8) {
    goto LABEL_18;
  }
  v9 = (void *)[objc_alloc(getPKPassViewClass()) initWithPass:v8 content:5];
  [v9 setSuppressedContent:6];
  v10 = [v9 snapshotOfFrontFace];
  [v10 size];
  double v6 = v11;

  if (!v10)
  {
LABEL_18:
    v12 = [v4 contentTypeIdentifier];
    if (!v12) {
      goto LABEL_6;
    }
    id v13 = objc_alloc_init(MEMORY[0x1E4F9F2F8]);
    v14 = [v4 fileName];
    [v13 setName:v14];

    [v13 setUTI:v12];
    v15 = [v13 icons];
    v10 = [v15 firstObject];

    if (!v10)
    {
LABEL_6:
      v16 = (void *)MEMORY[0x1E4FB1818];
      v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v10 = [v16 imageNamed:@"downloadinprogress" inBundle:v17];
    }
  }
  [v10 size];
  double v19 = v18;
  double v21 = v20;
  if (!sDownloadFont)
  {
    uint64_t v22 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
    v23 = (void *)sDownloadFont;
    sDownloadFont = v22;
  }
  v24 = [v4 fileName];
  objc_msgSend(v24, "_legacy_sizeWithFont:forWidth:lineBreakMode:", sDownloadFont, 5, 150.0);
  double v26 = v25;
  CGFloat v28 = v27;
  if (v25 >= v19) {
    double v19 = v25;
  }
  v34.receiver = self;
  v34.super_class = (Class)MFAttachmentImageGenerator;
  v29 = -[MFAttachmentImageGenerator initWithFrame:](&v34, sel_initWithFrame_, 0.0, 0.0, v19, v6);
  if (v29)
  {
    objc_msgSend(v4, "setImageDimensions:", v19, v6);
    v29->_textSize.width = v26;
    v29->_textSize.height = v28;
    uint64_t v30 = [v24 copy];
    displayString = v29->_displayString;
    v29->_displayString = (NSString *)v30;

    objc_storeStrong((id *)&v29->_image, v10);
    double v32 = 48.0;
    if (v7) {
      double v32 = v21;
    }
    v29->_maxImageHeight = v32;
    [(MFAttachmentImageGenerator *)v29 setOpaque:0];
  }

  return v29;
}

+ (double)defaultHeight
{
  return 72.0;
}

+ (id)pngDataForAttachment:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[objc_alloc((Class)a1) initWithAttachment:v4];
  double v6 = [v5 pngData];

  return v6;
}

+ (id)imageForAttachment:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[objc_alloc((Class)a1) initWithAttachment:v4];
  double v6 = [v5 image];

  return v6;
}

+ (CGRect)imageRectForAttachment:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[objc_alloc((Class)a1) initWithAttachment:v4];
  [v5 imageRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)pngData
{
  [(MFAttachmentImageGenerator *)self bounds];
  v10.width = v3;
  v10.height = v4;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  double v5 = [(MFAttachmentImageGenerator *)self layer];
  [v5 renderInContext:UIGraphicsGetCurrentContext()];

  UIGraphicsGetImageFromCurrentImageContext();
  double v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  double v7 = UIImagePNGRepresentation(v6);

  return v7;
}

- (id)image
{
  return self->_image;
}

- (CGRect)imageRect
{
  [(MFAttachmentImageGenerator *)self bounds];
  double v4 = v3;
  [(UIImage *)self->_image size];
  double v7 = v5;
  double maxImageHeight = self->_maxImageHeight;
  if (v6 <= maxImageHeight) {
    double maxImageHeight = v6;
  }
  else {
    double v7 = v5 * (maxImageHeight / v6);
  }
  double v9 = (v4 - v7) * 0.5;
  double v10 = 5.0;
  result.size.height = maxImageHeight;
  result.size.width = v7;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  [(MFAttachmentImageGenerator *)self bounds];
  double v5 = v4;
  [(MFAttachmentImageGenerator *)self imageRect];
  double v7 = v6;
  double v9 = v8;
  -[UIImage drawInRect:](self->_image, "drawInRect:");
  double v10 = [MEMORY[0x1E4FB1618] grayColor];
  [v10 set];

  displayString = self->_displayString;
  double v12 = (v5 - self->_textSize.width) * 0.5;
  uint64_t v13 = sDownloadFont;

  [(NSString *)displayString _legacy_drawAtPoint:v13 forWidth:5 withFont:v12 lineBreakMode:v7 + v9 + 5.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_displayString, 0);
}

@end