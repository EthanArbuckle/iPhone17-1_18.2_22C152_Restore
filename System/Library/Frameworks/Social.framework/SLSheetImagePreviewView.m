@interface SLSheetImagePreviewView
+ (id)fallbackPreviewImage;
- (BOOL)generatePreviewImageFromAttachments;
- (CGSize)intrinsicContentSize;
- (NSArray)principalAttachments;
- (SLSheetImagePreviewView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImageView)imageView;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPrincipalAttachments:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SLSheetImagePreviewView

- (SLSheetImagePreviewView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SLSheetImagePreviewView;
  return -[SLSheetImagePreviewView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)fallbackPreviewImage
{
  v2 = (void *)fallbackPreviewImage___fallbackPreviewImage;
  if (!fallbackPreviewImage___fallbackPreviewImage)
  {
    v9.width = 100.0;
    v9.height = 100.0;
    UIGraphicsBeginImageContext(v9);
    CurrentContext = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(CurrentContext);
    id v4 = [MEMORY[0x1E4F428B8] colorWithWhite:0.87 alpha:1.0];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v4 CGColor]);

    v10.origin.x = 0.0;
    v10.origin.y = 0.0;
    v10.size.width = 100.0;
    v10.size.height = 100.0;
    CGContextFillRect(CurrentContext, v10);
    UIGraphicsPopContext();
    uint64_t v5 = UIGraphicsGetImageFromCurrentImageContext();
    v6 = (void *)fallbackPreviewImage___fallbackPreviewImage;
    fallbackPreviewImage___fallbackPreviewImage = v5;

    UIGraphicsEndImageContext();
    v2 = (void *)fallbackPreviewImage___fallbackPreviewImage;
  }

  return v2;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  id v6 = [(SLSheetImagePreviewView *)self imageView];
  [v6 setImage:v5];
}

- (BOOL)generatePreviewImageFromAttachments
{
  return 0;
}

- (CGSize)intrinsicContentSize
{
  id v4 = [(SLSheetImagePreviewView *)self traitCollection];
  uint64_t v5 = [v4 verticalSizeClass];

  if (v5 == 1)
  {
    double v6 = 60.0;
  }
  else
  {
    v7 = [(SLSheetImagePreviewView *)self traitCollection];
    BOOL v8 = [v7 horizontalSizeClass] == 1;

    double v6 = dbl_1C2CFA8F0[v8];
  }
  CGSize v9 = NSNumber;
  CGRect v10 = [(SLSheetImagePreviewView *)self traitCollection];
  v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "horizontalSizeClass"));
  v12 = NSNumber;
  v13 = [(SLSheetImagePreviewView *)self traitCollection];
  v17 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "verticalSizeClass"));
  _SLLog(v2, 7, @"SLSheetImagePreviewView intrinsicContentSize horizontalSizeClass %@ verticalSizeClass %@");

  v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v6, v6, v11, v17);
  _SLLog(v2, 7, @"SLSheetImagePreviewView intrinsicContentSize returning %@");

  double v14 = v6;
  double v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"SLSheetImagePreviewView traitCollectionDidChange:");
  v11.receiver = self;
  v11.super_class = (Class)SLSheetImagePreviewView;
  [(SLSheetImagePreviewView *)&v11 traitCollectionDidChange:v5];
  double v6 = [(SLSheetImagePreviewView *)self traitCollection];
  uint64_t v7 = [v6 horizontalSizeClass];
  if (v7 == [v5 horizontalSizeClass])
  {
    BOOL v8 = [(SLSheetImagePreviewView *)self traitCollection];
    uint64_t v9 = [v8 verticalSizeClass];
    uint64_t v10 = [v5 verticalSizeClass];

    if (v9 == v10) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  _SLLog(v3, 7, @"SLSheetImagePreviewView traitCollectionDidChange: now invalidatingIntrinsicContentSize");
  [(SLSheetImagePreviewView *)self invalidateIntrinsicContentSize];
LABEL_6:
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NSArray)principalAttachments
{
  return self->_principalAttachments;
}

- (void)setPrincipalAttachments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_principalAttachments, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end