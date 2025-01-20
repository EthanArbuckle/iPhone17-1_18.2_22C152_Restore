@interface CKContactBalloonView
+ (BOOL)canShowChevron;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKContactBalloonView)initWithFrame:(CGRect)a3;
- (CKMediaObject)mediaObject;
- (NSString)description;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImageView)chevron;
- (UIImageView)contactImageView;
- (UILabel)nameLabel;
- (UILabel)organizationLabel;
- (id)_truncateNameIfNeeded:(id)a3;
- (void)addOverlaySubview:(id)a3;
- (void)configureForComposition:(id)a3;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5;
- (void)configureForMessagePart:(id)a3;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setChevron:(id)a3;
- (void)setContactImageView:(id)a3;
- (void)setMediaObject:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setOrganizationLabel:(id)a3;
@end

@implementation CKContactBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
  uint64_t v5 = a5;
  v9.receiver = self;
  v9.super_class = (Class)CKContactBalloonView;
  id v8 = a3;
  [(CKBalloonView *)&v9 configureForMediaObject:v8 previewWidth:v5 orientation:a4];
  -[CKContactBalloonView setMediaObject:](self, "setMediaObject:", v8, v9.receiver, v9.super_class);
}

- (void)configureForComposition:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKContactBalloonView;
  id v4 = a3;
  [(CKColoredBalloonView *)&v8 configureForComposition:v4];
  uint64_t v5 = objc_msgSend(v4, "mediaObjects", v8.receiver, v8.super_class);

  v6 = [v5 lastObject];
  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 previewMaxWidth];
  -[CKContactBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v6, 1);
}

+ (BOOL)canShowChevron
{
  return 1;
}

- (NSString)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKContactBalloonView;
  id v4 = [(CKColoredBalloonView *)&v11 description];
  uint64_t v5 = [(CKContactBalloonView *)self nameLabel];
  v6 = [v5 text];
  v7 = [(CKContactBalloonView *)self organizationLabel];
  objc_super v8 = [v7 text];
  objc_super v9 = [v3 stringWithFormat:@"%@ name:%@ organization:%@", v4, v6, v8];

  return (NSString *)v9;
}

- (CKContactBalloonView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CKContactBalloonView;
  v3 = -[CKColoredBalloonView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    objc_super v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    [v9 setContentMode:1];
    [(CKContactBalloonView *)v3 setContactImageView:v9];
    [(CKContactBalloonView *)v3 addSubview:v9];
    if ([(id)objc_opt_class() canShowChevron])
    {
      id v10 = objc_alloc(MEMORY[0x1E4F42AA0]);
      objc_super v11 = +[CKUIBehavior sharedBehaviors];
      v12 = [v11 chevronImageForColorType:0xFFFFFFFFLL];
      v13 = (void *)[v10 initWithImage:v12];

      [v13 setContentMode:4];
      [(CKContactBalloonView *)v3 setChevron:v13];
      [(CKContactBalloonView *)v3 addSubview:v13];
    }
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v5, v6, v7, v8);
    v15 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_emphasizedPreferredFontForTextStyle:", *MEMORY[0x1E4F438D8]);
    [v14 setFont:v15];

    [(CKContactBalloonView *)v3 setNameLabel:v14];
    [(CKContactBalloonView *)v3 addSubview:v14];
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v5, v6, v7, v8);
    v17 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_preferredFontForStyle:", *MEMORY[0x1E4F43880]);
    [v16 setFont:v17];

    [(CKContactBalloonView *)v3 setOrganizationLabel:v16];
    [(CKContactBalloonView *)v3 addSubview:v16];
  }
  return v3;
}

- (void)layoutSubviews
{
  v51.receiver = self;
  v51.super_class = (Class)CKContactBalloonView;
  [(CKColoredBalloonView *)&v51 layoutSubviews];
  [(CKContactBalloonView *)self bounds];
  -[CKContactBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  char v11 = [(CKContactBalloonView *)self _shouldReverseLayoutDirection];
  v12 = [(CKContactBalloonView *)self contactImageView];
  if ([(id)objc_opt_class() canShowChevron])
  {
    v13 = [(CKContactBalloonView *)self chevron];
    v14 = [v13 image];
    [v14 size];
    double v16 = v15;

    double v17 = v4;
    double v18 = v6;
    CGFloat v19 = v8;
    double v20 = v10;
    if (v11) {
      double MinX = CGRectGetMinX(*(CGRect *)&v17);
    }
    else {
      double MinX = CGRectGetMaxX(*(CGRect *)&v17) - v16;
    }
    objc_msgSend(v13, "setFrame:", MinX, v6, v16, v10);
    if (v11)
    {
      v52.origin.x = MinX;
      v52.origin.y = v6;
      v52.size.width = v16;
      v52.size.height = v10;
      double MaxX = CGRectGetMaxX(v52);
      double v28 = 5.0;
    }
    else
    {
      double MaxX = MinX + -5.0;
      double v28 = -38.0;
    }
    double v26 = MaxX + v28;
  }
  else
  {
    double v22 = v4;
    double v23 = v6;
    CGFloat v24 = v8;
    double v25 = v10;
    if (v11) {
      double v26 = CGRectGetMinX(*(CGRect *)&v22);
    }
    else {
      double v26 = CGRectGetMaxX(*(CGRect *)&v22) + -38.0;
    }
  }
  objc_msgSend(v12, "setFrame:", v26, v6, 38.0, v10);
  v29 = [(CKContactBalloonView *)self nameLabel];
  v30 = [(CKContactBalloonView *)self organizationLabel];
  if (v11)
  {
    v53.origin.x = v4;
    v53.origin.y = v6;
    v53.size.width = v8;
    v53.size.height = v10;
    double v31 = CGRectGetMaxX(v53);
    v54.origin.x = v26;
    v54.origin.y = v6;
    v54.size.width = 38.0;
    v54.size.height = v10;
    double v32 = v31 - CGRectGetMaxX(v54) + -10.0;
    v55.origin.x = v4;
    v55.origin.y = v6;
    v55.size.width = v8;
    v55.size.height = v10;
    double v33 = CGRectGetMaxX(v55) - v32;
    v56.origin.x = v4;
    v56.origin.y = v6;
    v56.size.width = v8;
    v56.size.height = v10;
    double v34 = CGRectGetMaxX(v56);
    v57.origin.x = v33;
    v57.origin.y = v6;
    v57.size.width = v32;
    v57.size.height = v10;
    double v35 = v34 - CGRectGetWidth(v57);
  }
  else
  {
    double v32 = v26 + -10.0 - v4;
    double v33 = v4 + 0.0;
    double v35 = v4 + 0.0;
  }
  objc_msgSend(v29, "setFrame:", v35, v6, v32, v10);
  objc_msgSend(v30, "setFrame:", v35, v6, v32, v10);
  v36 = [v30 text];
  uint64_t v37 = [v36 length];

  if (v37)
  {
    v38 = [v30 font];
    [v38 _bodyLeading];
    double v40 = v39 * 0.59375;

    v41 = [v29 font];
    [v41 capHeight];
    double v43 = v40 + v42;
    v44 = [v30 font];
    [v44 capHeight];
    double v46 = v43 + v45;
    if (CKMainScreenScale_once_40 != -1) {
      dispatch_once(&CKMainScreenScale_once_40, &__block_literal_global_101);
    }
    double v47 = *(double *)&CKMainScreenScale_sMainScreenScale_40;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_40 == 0.0) {
      double v47 = 1.0;
    }
    double v48 = ceil(v46 * v47) / v47;

    if (CKMainScreenScale_once_40 != -1) {
      dispatch_once(&CKMainScreenScale_once_40, &__block_literal_global_101);
    }
    double v49 = *(double *)&CKMainScreenScale_sMainScreenScale_40;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_40 == 0.0) {
      double v49 = 1.0;
    }
    CGFloat v50 = 1.0 / v49 * (v6 * v49 + floor((v10 * v49 - v48 * v49) * 0.5));
    [v29 _setFirstLineCapFrameOriginY:v50];
    v58.origin.x = v33;
    v58.origin.y = v50;
    v58.size.width = v32;
    v58.size.height = v48;
    [v30 _setLastLineBaselineFrameOriginY:CGRectGetMaxY(v58)];
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  v6.receiver = self;
  v6.super_class = (Class)CKContactBalloonView;
  [(CKColoredBalloonView *)&v6 alignmentRectInsets];
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CKContactBalloonView;
  [(CKColoredBalloonView *)&v5 prepareForReuse];
  double v3 = [(CKContactBalloonView *)self chevron];
  [v3 setHidden:0];

  double v4 = [(CKContactBalloonView *)self nameLabel];
  [v4 setText:0];
}

- (void)prepareForDisplay
{
  v18.receiver = self;
  v18.super_class = (Class)CKContactBalloonView;
  [(CKColoredBalloonView *)&v18 prepareForDisplay];
  double v3 = [(CKContactBalloonView *)self mediaObject];
  double v4 = +[CKUIBehavior sharedBehaviors];
  objc_super v5 = [v4 theme];
  objc_super v6 = objc_msgSend(v5, "balloonTextColorForColorType:", -[CKBalloonView color](self, "color"));

  double v7 = [(CKContactBalloonView *)self chevron];
  CGFloat v8 = +[CKUIBehavior sharedBehaviors];
  double v9 = objc_msgSend(v8, "chevronImageForColorType:", -[CKBalloonView color](self, "color"));
  [v7 setImage:v9];

  double v10 = [(CKContactBalloonView *)self contactImageView];
  char v11 = [v3 icon];
  [v10 setImage:v11];

  v12 = [(CKContactBalloonView *)self nameLabel];
  v13 = [v3 title];
  v14 = [(CKContactBalloonView *)self _truncateNameIfNeeded:v13];

  [v12 setText:v14];
  [v12 setTextColor:v6];
  double v15 = [(CKContactBalloonView *)self organizationLabel];
  double v16 = [v3 subtitle];
  double v17 = [(CKContactBalloonView *)self _truncateNameIfNeeded:v16];

  [v15 setText:v17];
  [v15 setTextColor:v6];
}

- (id)_truncateNameIfNeeded:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] < 0xC9)
  {
    id v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "substringWithRange:", 0, 200);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_super v5 = v4;

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double width = a3.width;
  objc_super v6 = [(CKContactBalloonView *)self nameLabel];
  objc_msgSend(v6, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v8 = v7;
  double v10 = v9;

  char v11 = [(CKContactBalloonView *)self organizationLabel];
  objc_msgSend(v11, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v13 = v12;
  double v15 = v14;

  if (v8 < v13) {
    double v8 = v13;
  }
  [(CKContactBalloonView *)self alignmentRectInsets];
  double v17 = v8 + v16 + 0.0 + 10.0 + 38.0;
  if ([(id)objc_opt_class() canShowChevron])
  {
    objc_super v18 = [(CKContactBalloonView *)self chevron];
    CGFloat v19 = [v18 image];
    [v19 size];
    double v17 = v17 + v20 + 5.0;
  }
  [(CKContactBalloonView *)self alignmentRectInsets];
  double v22 = v21;
  double v23 = +[CKUIBehavior sharedBehaviors];
  [v23 contactBalloonMinWidth];
  double v25 = v24;

  if (CKMainScreenScale_once_40 != -1) {
    dispatch_once(&CKMainScreenScale_once_40, &__block_literal_global_101);
  }
  double v26 = v10 + 12.0 + v15 + 12.0;
  double v27 = v17 + v22;
  if (v25 >= v17 + v22) {
    double v27 = v25;
  }
  if (width < v27) {
    double v27 = width;
  }
  double v28 = *(double *)&CKMainScreenScale_sMainScreenScale_40;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_40 == 0.0) {
    double v28 = 1.0;
  }
  double v29 = ceil(v28 * 58.5) / v28;
  if (v26 < v29) {
    double v26 = v29;
  }
  result.height = v26;
  result.double width = v27;
  return result;
}

- (void)addOverlaySubview:(id)a3
{
  id v4 = a3;
  id v5 = [(CKContactBalloonView *)self contactImageView];
  [(CKContactBalloonView *)self insertSubview:v4 belowSubview:v5];
}

- (void)setMediaObject:(id)a3
{
  id v5 = (CKMediaObject *)a3;
  if (self->_mediaObject != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_mediaObject, a3);
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
    [(CKContactBalloonView *)self setNeedsLayout];
    id v5 = v6;
  }
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (UIImageView)chevron
{
  return self->_chevron;
}

- (void)setChevron:(id)a3
{
}

- (UIImageView)contactImageView
{
  return self->_contactImageView;
}

- (void)setContactImageView:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)organizationLabel
{
  return self->_organizationLabel;
}

- (void)setOrganizationLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_contactImageView, 0);
  objc_storeStrong((id *)&self->_chevron, 0);

  objc_storeStrong((id *)&self->_mediaObject, 0);
}

- (void)configureForMessagePart:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKContactBalloonView;
  id v4 = a3;
  [(CKColoredBalloonView *)&v10 configureForMessagePart:v4];
  id v5 = objc_msgSend(v4, "mediaObject", v10.receiver, v10.super_class);
  objc_super v6 = +[CKUIBehavior sharedBehaviors];
  [v6 previewMaxWidth];
  double v8 = v7;
  uint64_t v9 = [v4 balloonOrientation];

  [(CKContactBalloonView *)self configureForMediaObject:v5 previewWidth:v9 orientation:v8];
}

@end