@interface SLSheetPhotoAlbumImageView
+ (unint64_t)displayedFrameMaximum;
- (BOOL)_shouldDisplayImageCountLabel;
- (CGSize)intrinsicContentSize;
- (SLSheetPhotoAlbumImageView)initWithPrincipalAttachments:(id)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (id)_itemCountString;
- (void)addPreviewImage:(id)a3;
- (void)layoutSubviews;
- (void)sizeToFit;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SLSheetPhotoAlbumImageView

+ (unint64_t)displayedFrameMaximum
{
  return 3;
}

- (SLSheetPhotoAlbumImageView)initWithPrincipalAttachments:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SLSheetPhotoAlbumImageView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[SLSheetImagePreviewView initWithFrame:](&v52, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  if (v9)
  {
    v9->_imageQuantity = [v4 count];
    v9->_allAttachmentsAreImages = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v49;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v49 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if ([v15 type] && objc_msgSend(v15, "type") != 2)
          {
            v9->_allAttachmentsAreImages = 0;
            goto LABEL_13;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    unint64_t v16 = [v10 count];
    if (v16 >= 3) {
      uint64_t v17 = 3;
    }
    else {
      uint64_t v17 = v16;
    }
    v18 = objc_msgSend(v10, "subarrayWithRange:", 0, v17);
    [(SLSheetImagePreviewView *)v9 setPrincipalAttachments:v18];

    uint64_t v19 = objc_opt_new();
    frameViews = v9->_frameViews;
    v9->_frameViews = (NSMutableArray *)v19;

    v47.receiver = v9;
    v47.super_class = (Class)SLSheetPhotoAlbumImageView;
    [(SLSheetImagePreviewView *)&v47 intrinsicContentSize];
    double v22 = v21;
    double v24 = v23;
    v25 = [(SLSheetImagePreviewView *)v9 principalAttachments];
    uint64_t v26 = [v25 count];

    if (v26)
    {
      unint64_t v27 = 0;
      double v28 = *MEMORY[0x1E4F44238];
      do
      {
        v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", 0.0, 0.0, v22, v24);
        [v29 setClipsToBounds:1];
        [(NSMutableArray *)v9->_frameViews addObject:v29];
        v30 = [MEMORY[0x1E4F428B8] colorWithWhite:0.8 alpha:1.0];
        [v29 setBackgroundColor:v30];

        [v29 setContentMode:2];
        [(SLSheetPhotoAlbumImageView *)v9 addSubview:v29];
        [v29 _setVisualAltitude:v28];
        ++v27;
        objc_msgSend(v29, "_setVisualAltitudeBias:", (double)(int)v27 * 0.333339989, (double)(int)v27 * 0.333339989);

        v31 = [(SLSheetImagePreviewView *)v9 principalAttachments];
        unint64_t v32 = [v31 count];
      }
      while (v32 > v27);
    }
    uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v5, v6, v7, v8);
    imageCountLabel = v9->_imageCountLabel;
    v9->_imageCountLabel = (UILabel *)v33;

    v35 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43888]];
    [(UILabel *)v9->_imageCountLabel setFont:v35];

    v36 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(UILabel *)v9->_imageCountLabel setTextColor:v36];

    v37 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)v9->_imageCountLabel setBackgroundColor:v37];

    v38 = [(SLSheetPhotoAlbumImageView *)v9 _itemCountString];
    [(UILabel *)v9->_imageCountLabel setText:v38];

    [(UILabel *)v9->_imageCountLabel setTextAlignment:1];
    [(UILabel *)v9->_imageCountLabel sizeToFit];
    LODWORD(v39) = 1144750080;
    [(SLSheetPhotoAlbumImageView *)v9 setContentHuggingPriority:0 forAxis:v39];
    LODWORD(v40) = 1144750080;
    [(SLSheetPhotoAlbumImageView *)v9 setContentHuggingPriority:1 forAxis:v40];
    LODWORD(v41) = 1144750080;
    [(SLSheetPhotoAlbumImageView *)v9 setContentCompressionResistancePriority:0 forAxis:v41];
    LODWORD(v42) = 1144750080;
    [(SLSheetPhotoAlbumImageView *)v9 setContentCompressionResistancePriority:1 forAxis:v42];
    [(SLSheetPhotoAlbumImageView *)v9 sizeToFit];
    v43 = [(SLSheetPhotoAlbumImageView *)v9 layer];
    [v43 setShouldRasterize:1];

    v44 = [(SLSheetPhotoAlbumImageView *)v9 layer];
    v45 = [MEMORY[0x1E4F42D90] mainScreen];
    [v45 scale];
    objc_msgSend(v44, "setRasterizationScale:");

    [(SLSheetPhotoAlbumImageView *)v9 setNeedsLayout];
  }

  return v9;
}

- (void)addPreviewImage:(id)a3
{
  id v6 = a3;
  unint64_t numPreviewImagesAdded = self->_numPreviewImagesAdded;
  if (numPreviewImagesAdded < [(NSMutableArray *)self->_frameViews count])
  {
    double v5 = [(NSMutableArray *)self->_frameViews objectAtIndexedSubscript:[(NSMutableArray *)self->_frameViews count] + ~self->_numPreviewImagesAdded];
    [v5 setImage:v6];
    ++self->_numPreviewImagesAdded;
  }
}

- (BOOL)_shouldDisplayImageCountLabel
{
  v3 = [(SLSheetPhotoAlbumImageView *)self traitCollection];
  BOOL v4 = [v3 verticalSizeClass] == 2
    && (unint64_t)[(NSMutableArray *)self->_frameViews count] > 1;

  return v4;
}

- (id)_itemCountString
{
  BOOL allAttachmentsAreImages = self->_allAttachmentsAreImages;
  BOOL v4 = NSString;
  double v5 = SLSocialFrameworkBundle();
  id v6 = v5;
  if (allAttachmentsAreImages) {
    double v7 = @"SHEET_IMAGE_COUNT_STRING";
  }
  else {
    double v7 = @"SHEET_ITEM_COUNT_STRING";
  }
  double v8 = [v5 localizedStringForKey:v7 value:&stru_1F1E28690 table:@"Localizable"];
  v9 = [NSNumber numberWithInteger:self->_imageQuantity];
  id v10 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v11 = [v9 descriptionWithLocale:v10];
  uint64_t v12 = objc_msgSend(v4, "stringWithFormat:", v8, v11);

  return v12;
}

- (CGSize)intrinsicContentSize
{
  v18.receiver = self;
  v18.super_class = (Class)SLSheetPhotoAlbumImageView;
  [(SLSheetImagePreviewView *)&v18 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;
  if ([(SLSheetPhotoAlbumImageView *)self _shouldDisplayImageCountLabel])
  {
    double v8 = v7 + 14.5;
  }
  else
  {
    v9 = [MEMORY[0x1E4F42D90] mainScreen];
    [v9 scale];
    double v11 = v10;

    if (v11 <= 1.0) {
      double v12 = 3.0;
    }
    else {
      double v12 = 2.5;
    }
    double v8 = v7 + v12 * (double)(unint64_t)([(NSMutableArray *)self->_frameViews count] - 1);
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v5, v8);
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[SLSheetPhotoAlbumImageView _shouldDisplayImageCountLabel](self, "_shouldDisplayImageCountLabel"));
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_frameViews, "count"));
  _SLLog(v2, 7, @"SLSheetPhotoAlbumImageView intrinsicContentSize returning %@ _shouldDisplayImageCountLabel %@ _frameViews.count %@");

  double v15 = v5;
  double v16 = v8;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SLSheetPhotoAlbumImageView;
  [(SLSheetImagePreviewView *)&v17 traitCollectionDidChange:v5];
  if ((unint64_t)[(NSMutableArray *)self->_frameViews count] >= 2)
  {
    double v6 = [(SLSheetPhotoAlbumImageView *)self traitCollection];
    uint64_t v7 = [v6 verticalSizeClass];
    uint64_t v8 = [v5 verticalSizeClass];

    if (v7 != v8)
    {
      v9 = NSNumber;
      double v10 = [(SLSheetPhotoAlbumImageView *)self traitCollection];
      double v16 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "verticalSizeClass"));
      _SLLog(v3, 7, @"SLSheetPhotoAlbumImageView will invalidateIntrinsicContentSize new verticalSizeClass %@");

      [(SLSheetPhotoAlbumImageView *)self invalidateIntrinsicContentSize];
    }
  }
  double v11 = [(SLSheetPhotoAlbumImageView *)self traitCollection];
  double v12 = [v11 preferredContentSizeCategory];
  uint64_t v13 = [v5 preferredContentSizeCategory];
  char v14 = [v12 isEqualToString:v13];

  if ((v14 & 1) == 0)
  {
    double v15 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43888]];
    [(UILabel *)self->_imageCountLabel setFont:v15];
  }
}

- (void)sizeToFit
{
  [(SLSheetPhotoAlbumImageView *)self intrinsicContentSize];

  -[SLSheetPhotoAlbumImageView setBounds:](self, "setBounds:", 0.0, 0.0, v3, v4);
}

- (void)layoutSubviews
{
  [(SLSheetPhotoAlbumImageView *)self bounds];
  double v24 = NSStringFromCGRect(v28);
  _SLLog(v2, 7, @"SLSheetPhotoAlbumImageView bounds %@");

  v27.receiver = self;
  v27.super_class = (Class)SLSheetPhotoAlbumImageView;
  [(SLSheetImagePreviewView *)&v27 intrinsicContentSize];
  frameViews = self->_frameViews;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __44__SLSheetPhotoAlbumImageView_layoutSubviews__block_invoke;
  v26[3] = &unk_1E6467CF8;
  v26[5] = v5;
  v26[6] = v6;
  v26[4] = self;
  [(NSMutableArray *)frameViews enumerateObjectsUsingBlock:v26];
  BOOL v7 = [(SLSheetPhotoAlbumImageView *)self _shouldDisplayImageCountLabel];
  imageCountLabel = self->_imageCountLabel;
  if (v7)
  {
    v9 = [(UILabel *)imageCountLabel superview];

    if (!v9) {
      [(SLSheetPhotoAlbumImageView *)self addSubview:self->_imageCountLabel];
    }
    double v10 = [(NSMutableArray *)self->_frameViews lastObject];
    [v10 frame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    double v16 = v15;
    CGFloat v18 = v17;

    [(UILabel *)self->_imageCountLabel frame];
    double v20 = v19;
    double v22 = v21;
    v29.origin.x = v12;
    v29.origin.y = v14;
    v29.size.width = v16;
    v29.size.height = v18;
    CGFloat v23 = CGRectGetMaxY(v29) + 4.0;
    -[UILabel setFrame:](self->_imageCountLabel, "setFrame:", v20, v23, v16, v22);
    v30.origin.x = v20;
    v30.origin.y = v23;
    v30.size.width = v16;
    v30.size.height = v22;
    v25 = NSStringFromCGRect(v30);
    _SLLog(v2, 7, @"SLSheetPhotoAlbumImageView labelFrame %@");
  }
  else
  {
    [(UILabel *)imageCountLabel removeFromSuperview];
  }
}

void __44__SLSheetPhotoAlbumImageView_layoutSubviews__block_invoke(double *a1, void *a2, unint64_t a3)
{
  CGFloat v5 = a1[5];
  CGFloat v6 = a1[6];
  BOOL v7 = *(void **)(*((void *)a1 + 4) + 448);
  id v19 = a2;
  uint64_t v8 = [v7 count];
  CGFloat v9 = (float)((float)(v8 + ~a3) + (float)(v8 + ~a3));
  uint64_t v10 = [*(id *)(*((void *)a1 + 4) + 448) count];
  v21.origin.double x = 0.0;
  v21.origin.y = 0.0;
  v21.size.double width = v5;
  v21.size.double height = v6;
  CGRect v22 = CGRectInset(v21, v9, (float)((float)(v10 + ~a3) + (float)(v10 + ~a3)));
  double x = v22.origin.x;
  double width = v22.size.width;
  double height = v22.size.height;
  double v14 = (double)a3;
  double v15 = [MEMORY[0x1E4F42D90] mainScreen];
  [v15 scale];
  double v17 = v16;

  double v18 = 3.0;
  if (v17 > 1.0) {
    double v18 = 2.5;
  }
  objc_msgSend(v19, "setFrame:", x, v18 * v14, width, height);
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCountLabel, 0);
  objc_storeStrong((id *)&self->_frameViews, 0);
  objc_storeStrong((id *)&self->_glossLayer, 0);

  objc_storeStrong((id *)&self->_frameLayer, 0);
}

@end