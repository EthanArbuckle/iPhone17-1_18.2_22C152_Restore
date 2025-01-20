@interface CKPinnedConversationMediaObjectBubble
- (BOOL)isAnimojiVideo;
- (BOOL)isSticker;
- (BOOL)supportsActivityItemViewContentScale;
- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame;
- (CGSize)_imageViewSize;
- (CKPinnedConversationMediaObjectActivityItem)mediaObjectActivityItem;
- (CKPinnedConversationMediaObjectBubble)initWithMediaObjectActivityItem:(id)a3;
- (NSLayoutConstraint)imageViewHeightConstraint;
- (NSLayoutConstraint)imageViewWidthConstraint;
- (UIEdgeInsets)contentViewPadding;
- (UIImageView)imageView;
- (double)contentViewHorizontalInsetForPillCornerRadius;
- (double)pillCornerRadius;
- (id)_previewImage;
- (int64_t)activityItemViewContentScale;
- (int64_t)contentViewContentMode;
- (void)_updateImageViewSizeConstraints;
- (void)_updateMediaObjectPreview;
- (void)_updatePillCornerRadius;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)setActivityItem:(id)a3;
- (void)setActivityItemViewContentScale:(int64_t)a3;
- (void)setImageView:(id)a3;
- (void)setImageViewHeightConstraint:(id)a3;
- (void)setImageViewWidthConstraint:(id)a3;
- (void)setParentAvatarViewSize:(CGSize)a3;
@end

@implementation CKPinnedConversationMediaObjectBubble

- (CKPinnedConversationMediaObjectBubble)initWithMediaObjectActivityItem:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F42AA0]);
  [v6 setContentMode:2];
  [v6 setClipsToBounds:1];
  v11.receiver = self;
  v11.super_class = (Class)CKPinnedConversationMediaObjectBubble;
  v7 = [(CKPinnedConversationTailedActivityItemView *)&v11 initWithActivityItem:v5 contentView:v6 needsContentViewStroke:1];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_mediaObjectActivityItem, a3);
    objc_storeStrong((id *)&v8->_imageView, v6);
    [(CKPinnedConversationMediaObjectBubble *)v8 _updateMediaObjectPreview];
    [(CKPinnedConversationMediaObjectBubble *)v8 _updatePillCornerRadius];
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v8 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4F43788] object:0];
  }
  return v8;
}

- (UIEdgeInsets)contentViewPadding
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_updatePillCornerRadius
{
  id v5 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43890] addingSymbolicTraits:0 options:1];
  double v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];
  [v3 lineHeight];
  UIRoundToViewScale();
  self->_pillCornerRadius = v4;
}

- (void)setActivityItem:(id)a3
{
  id v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKPinnedConversationMediaObjectBubble;
  [(CKPinnedConversationTailedActivityItemView *)&v6 setActivityItem:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_mediaObjectActivityItem, a3);
    [(CKPinnedConversationMediaObjectBubble *)self _updateMediaObjectPreview];
  }
}

- (BOOL)supportsActivityItemViewContentScale
{
  return 0;
}

- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame
{
  return 0;
}

- (id)_previewImage
{
  double v2 = [(CKPinnedConversationMediaObjectActivityItem *)self->_mediaObjectActivityItem mediaObject];
  double v3 = +[CKPinnedConversationMediaObjectActivityItem previewImageForMediaObject:v2];

  return v3;
}

- (void)_updateMediaObjectPreview
{
  id v5 = [(CKPinnedConversationMediaObjectBubble *)self _previewImage];
  [(UIImageView *)self->_imageView setImage:v5];
  int64_t v3 = [(CKPinnedConversationMediaObjectBubble *)self contentViewContentMode];
  if (v3) {
    uint64_t v4 = 2 * (v3 == 1);
  }
  else {
    uint64_t v4 = 1;
  }
  [(UIImageView *)self->_imageView setContentMode:v4];
  [(CKPinnedConversationMediaObjectBubble *)self setNeedsLayout];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  [(CKPinnedConversationMediaObjectBubble *)self _updatePillCornerRadius];

  [(CKPinnedConversationMediaObjectBubble *)self setNeedsLayout];
}

- (void)setParentAvatarViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CKPinnedConversationTailedActivityItemView *)self parentAvatarViewSize];
  if (v7 != width || v6 != height)
  {
    v9.receiver = self;
    v9.super_class = (Class)CKPinnedConversationMediaObjectBubble;
    -[CKPinnedConversationTailedActivityItemView setParentAvatarViewSize:](&v9, sel_setParentAvatarViewSize_, width, height);
    [(CKPinnedConversationMediaObjectBubble *)self _updateImageViewSizeConstraints];
  }
}

- (CGSize)_imageViewSize
{
  [(CKPinnedConversationTailedActivityItemView *)self parentAvatarViewSize];
  double v4 = v3 * 0.55;
  double v6 = v5 * 0.55;
  int64_t v7 = [(CKPinnedConversationMediaObjectBubble *)self contentViewContentMode];
  if (v7 == 1)
  {
    double v8 = v6;
    double v9 = v4;
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
    if (!v7)
    {
      v10 = [(CKPinnedConversationMediaObjectBubble *)self _previewImage];
      [v10 size];
      BOOL v13 = v11 <= v12;
      double v14 = v6 * (v11 / v12);
      double v15 = v4 * (v12 / v11);
      if (v13) {
        double v9 = v14;
      }
      else {
        double v9 = v4;
      }
      if (v13) {
        double v8 = v6;
      }
      else {
        double v8 = v15;
      }
    }
  }
  double v16 = v9;
  double v17 = v8;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)_updateImageViewSizeConstraints
{
  [(CKPinnedConversationMediaObjectBubble *)self _imageViewSize];
  double v4 = v3;
  double v6 = v5;
  imageViewWidthConstraint = self->_imageViewWidthConstraint;
  if (imageViewWidthConstraint)
  {
    [(NSLayoutConstraint *)imageViewWidthConstraint setConstant:v3];
  }
  else
  {
    double v8 = [(CKPinnedConversationMediaObjectBubble *)self imageView];
    double v9 = [v8 widthAnchor];
    v10 = [v9 constraintEqualToConstant:v4];
    double v11 = self->_imageViewWidthConstraint;
    self->_imageViewWidthConstraint = v10;

    [(NSLayoutConstraint *)self->_imageViewWidthConstraint setActive:1];
  }
  imageViewHeightConstraint = self->_imageViewHeightConstraint;
  if (imageViewHeightConstraint)
  {
    [(NSLayoutConstraint *)imageViewHeightConstraint setConstant:v6];
  }
  else
  {
    BOOL v13 = [(CKPinnedConversationMediaObjectBubble *)self imageView];
    double v14 = [v13 heightAnchor];
    double v15 = [v14 constraintEqualToConstant:v6];
    double v16 = self->_imageViewHeightConstraint;
    self->_imageViewHeightConstraint = v15;

    double v17 = self->_imageViewHeightConstraint;
    [(NSLayoutConstraint *)v17 setActive:1];
  }
}

- (BOOL)isSticker
{
  double v2 = [(CKPinnedConversationMediaObjectActivityItem *)self->_mediaObjectActivityItem mediaObject];
  double v3 = [v2 transfer];
  char v4 = [v3 isSticker];

  return v4;
}

- (BOOL)isAnimojiVideo
{
  double v2 = [(CKPinnedConversationMediaObjectActivityItem *)self->_mediaObjectActivityItem mediaObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 isJellyfishVideo];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (int64_t)contentViewContentMode
{
  if ([(CKPinnedConversationMediaObjectBubble *)self isSticker]) {
    return 0;
  }
  else {
    return [(CKPinnedConversationMediaObjectBubble *)self isAnimojiVideo] ^ 1;
  }
}

- (double)contentViewHorizontalInsetForPillCornerRadius
{
  return 0.0;
}

- (double)pillCornerRadius
{
  return self->_pillCornerRadius;
}

- (int64_t)activityItemViewContentScale
{
  return self->_activityItemViewContentScale;
}

- (void)setActivityItemViewContentScale:(int64_t)a3
{
  self->_activityItemViewContentScale = a3;
}

- (CKPinnedConversationMediaObjectActivityItem)mediaObjectActivityItem
{
  return self->_mediaObjectActivityItem;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NSLayoutConstraint)imageViewWidthConstraint
{
  return self->_imageViewWidthConstraint;
}

- (void)setImageViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageViewHeightConstraint
{
  return self->_imageViewHeightConstraint;
}

- (void)setImageViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_mediaObjectActivityItem, 0);
}

@end