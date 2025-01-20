@interface CKBalloonImageView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)imageHidden;
- (BOOL)isContentsTransformAnimationEnabled;
- (BOOL)wantsTapbackPickerBackingBubble;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKBalloonImageView)init;
- (CKBalloonImageView)initWithFrame:(CGRect)a3;
- (NSString)stickerAccessibilityDescription;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImage)image;
- (UIImage)invisibleInkEffectImage;
- (int64_t)currentFrameIndex;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBounds:(CGRect)a3;
- (void)setContentsTransformAnimationEnabled:(BOOL)a3;
- (void)setCurrentFrameIndex:(int64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setImageHidden:(BOOL)a3;
- (void)setInvisibleInkEffectImage:(id)a3;
- (void)setStickerAccessibilityDescription:(id)a3;
@end

@implementation CKBalloonImageView

- (CKBalloonImageView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKBalloonImageView;
  result = -[CKBalloonImageView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_contentsTransformAnimationEnabled = 0;
  }
  return result;
}

- (CKBalloonImageView)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKBalloonImageView;
  result = -[CKBalloonImageView initWithFrame:](&v3, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (result) {
    result->_contentsTransformAnimationEnabled = 0;
  }
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"contentsTransform"])
  {
    unsigned __int8 contentsTransformAnimationEnabled = self->_contentsTransformAnimationEnabled;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKBalloonImageView;
    unsigned __int8 contentsTransformAnimationEnabled = [(CKBalloonImageView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return contentsTransformAnimationEnabled;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CKBalloonImageView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)CKBalloonImageView;
  -[CKBalloonImageView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(CKBalloonImageView *)self setNeedsLayout];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CKBalloonImageView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)CKBalloonImageView;
  -[CKBalloonImageView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(CKBalloonImageView *)self setNeedsLayout];
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  v2 = [(CKBalloonImageView *)self image];
  objc_super v3 = v2;
  if (!v2)
  {
    double v5 = *MEMORY[0x1E4F437F8];
    double v14 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    goto LABEL_8;
  }
  [v2 alignmentRectInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [v3 imageOrientation];
  if (!v12)
  {
LABEL_7:
    double v14 = v7;
    goto LABEL_8;
  }
  uint64_t v13 = v12;
  if (v12 != 4)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = objc_msgSend(NSString, "stringWithUTF8String:", "UIEdgeInsets CKEdgeInsetsWithImageOrientation(UIEdgeInsets, UIImageOrientation)");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"CKGeometry.h", 429, @"CKEdgeInsetsWithImageOrientation %ld hasn't been implemented", v13);

    goto LABEL_7;
  }
  double v14 = v11;
  double v11 = v7;
LABEL_8:

  double v17 = v5;
  double v18 = v14;
  double v19 = v9;
  double v20 = v11;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)CKBalloonImageView;
  [(CKBalloonImageView *)&v26 layoutSubviews];
  objc_super v3 = [(CKBalloonImageView *)self layer];
  double v4 = [(CKBalloonImageView *)self image];
  BOOL v5 = [(CKBalloonImageView *)self imageHidden];
  double v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isScheduledMessagesCoreEnabled];

  if (v7)
  {
    if (!v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_4;
      }
    }
  }
  else if (!v5)
  {
LABEL_4:
    id v8 = v4;
    objc_msgSend(v3, "setContents:", objc_msgSend(v8, "CGImage"));
    [v8 scale];
    objc_msgSend(v3, "setContentsScale:");
    goto LABEL_7;
  }
  [v3 setContents:0];
LABEL_7:
  [v4 size];
  double v10 = v9;
  double v12 = v11;
  [v4 capInsets];
  objc_msgSend(v3, "setContentsCenter:", v16 / v10, v13 / v12, (v10 - v16 - v14) / v10, (v12 - v13 - v15) / v12);
  if ([v4 imageOrientation] == 4)
  {
    [(CKBalloonImageView *)self bounds];
    long long v25 = 0uLL;
    long long v18 = v17;
    double v19 = -1.0;
    double v20 = 1.0;
  }
  else
  {
    double v19 = *MEMORY[0x1E4F1DAB8];
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 8);
    double v20 = *(double *)(MEMORY[0x1E4F1DAB8] + 24);
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  double v21 = v19;
  long long v22 = v25;
  double v23 = v20;
  long long v24 = v18;
  [v3 setContentsTransform:&v21];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_super v3 = [(CKBalloonImageView *)self image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)prepareForReuse
{
  [(CKBalloonImageView *)self setImageHidden:0];

  [(CKBalloonImageView *)self setCurrentFrameIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (void)setImageHidden:(BOOL)a3
{
  if (self->_imageHidden != a3)
  {
    self->_imageHidden = a3;
    [(CKBalloonImageView *)self setNeedsLayout];
  }
}

- (void)setImage:(id)a3
{
  double v4 = (UIImage *)a3;
  if (self->_image != v4)
  {
    double v6 = v4;
    double v5 = (UIImage *)[(UIImage *)v4 copy];

    objc_storeStrong((id *)&self->_image, v5);
    [(CKBalloonImageView *)self setNeedsLayout];
    double v4 = v5;
  }
}

- (BOOL)wantsTapbackPickerBackingBubble
{
  return 0;
}

- (UIImage)image
{
  return self->_image;
}

- (int64_t)currentFrameIndex
{
  return self->_currentFrameIndex;
}

- (void)setCurrentFrameIndex:(int64_t)a3
{
  self->_currentFrameIndedouble x = a3;
}

- (UIImage)invisibleInkEffectImage
{
  return self->_invisibleInkEffectImage;
}

- (void)setInvisibleInkEffectImage:(id)a3
{
}

- (BOOL)imageHidden
{
  return self->_imageHidden;
}

- (NSString)stickerAccessibilityDescription
{
  return self->_stickerAccessibilityDescription;
}

- (void)setStickerAccessibilityDescription:(id)a3
{
}

- (BOOL)isContentsTransformAnimationEnabled
{
  return self->_contentsTransformAnimationEnabled;
}

- (void)setContentsTransformAnimationEnabled:(BOOL)a3
{
  self->_unsigned __int8 contentsTransformAnimationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerAccessibilityDescription, 0);
  objc_storeStrong((id *)&self->_invisibleInkEffectImage, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end