@interface CKTitledImageBalloonView
- (CKTitledImageBalloonView)initWithFrame:(CGRect)a3;
- (NSString)title;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImageView)chevron;
- (UILabel)titleLabel;
- (UIVisualEffectView)effectView;
- (void)configureForLocatingChatItem:(id)a3;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setChevron:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setOrientation:(char)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)tapGestureRecognized:(id)a3;
@end

@implementation CKTitledImageBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CKTitledImageBalloonView;
  id v10 = a3;
  [(CKImageBalloonView *)&v12 configureForMediaObject:v10 previewWidth:v7 orientation:v6 hasInvisibleInkEffect:a4];
  v11 = objc_msgSend(v10, "title", v12.receiver, v12.super_class);

  [(CKTitledImageBalloonView *)self setTitle:v11];
}

- (CKTitledImageBalloonView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CKTitledImageBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CKUIBehavior sharedBehaviors];
    id v5 = objc_alloc(MEMORY[0x1E4F42B38]);
    BOOL v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v6 setOpaque:0];
    [v6 setBackgroundColor:0];
    uint64_t v7 = [v4 previewTitleFont];
    [v6 setFont:v7];

    [(CKTitledImageBalloonView *)v3 addSubview:v6];
    [(CKTitledImageBalloonView *)v3 setTitleLabel:v6];
    if ([v4 showsBalloonChevron])
    {
      id v8 = objc_alloc(MEMORY[0x1E4F42AA0]);
      v9 = [v4 chevronImageForColorType:0xFFFFFFFFLL];
      id v10 = [v9 imageFlippedForRightToLeftLayoutDirection];
      v11 = (void *)[v8 initWithImage:v10];

      [v11 setContentMode:4];
      [(CKTitledImageBalloonView *)v3 addSubview:v11];
      [(CKTitledImageBalloonView *)v3 setChevron:v11];
    }
  }
  return v3;
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)CKTitledImageBalloonView;
  [(CKImageBalloonView *)&v47 layoutSubviews];
  [(CKTitledImageBalloonView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  -[CKTitledImageBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:", v4, v6, v8, v10);
  double v13 = v12;
  double rect = v14;
  v15 = +[CKUIBehavior sharedBehaviors];
  [v15 previewTitleBarHeight];
  double v17 = v16;

  v48.origin.x = v4;
  v48.origin.y = v6;
  v48.size.width = v8;
  v48.size.height = v10;
  double v18 = CGRectGetMaxY(v48) - v17;
  v19 = [(CKTitledImageBalloonView *)self effectView];
  objc_msgSend(v19, "setFrame:", 0.0, v10 - v17, v8, v17);

  v20 = [(CKTitledImageBalloonView *)self chevron];
  v21 = [v20 image];
  [v21 size];
  double v45 = v22;

  v23 = [(CKTitledImageBalloonView *)self titleLabel];
  [v23 _capOffsetFromBoundsTop];
  double v25 = v24;
  [v23 _baselineOffsetFromBottom];
  double v27 = v17 - (v25 + v26);
  if (CKMainScreenScale_once_34 != -1) {
    dispatch_once(&CKMainScreenScale_once_34, &__block_literal_global_85);
  }
  double v28 = *(double *)&CKMainScreenScale_sMainScreenScale_34;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_34 == 0.0) {
    double v28 = 1.0;
  }
  double v29 = rect * v28;
  double v30 = v27 * v28;
  double v31 = v13 * v28 + floor((v29 - v29) * 0.5);
  double v32 = v18 * v28 + floor((v17 * v28 - v27 * v28) * 0.5);
  double v33 = 1.0 / v28;
  double v34 = v33 * v31;
  double v35 = v33 * v32;
  double v36 = v29 * v33;
  double v37 = v30 * v33;
  v38 = +[CKUIBehavior sharedBehaviors];
  int v39 = [v38 showsBalloonChevron];

  double v40 = v45 + 10.0;
  if (!v39) {
    double v40 = 0.0;
  }
  double v41 = v36 - v40;
  if (v11)
  {
    v49.origin.x = v13;
    v49.origin.y = v18;
    CGFloat v42 = v34;
    v49.size.width = rect;
    v49.size.height = v17;
    double MaxX = CGRectGetMaxX(v49);
    v50.origin.x = v42;
    v50.origin.y = v35;
    v50.size.width = v41;
    v50.size.height = v37;
    objc_msgSend(v23, "setFrame:", MaxX - CGRectGetWidth(v50), v35, v41, v37);
    v51.origin.x = v13;
    v51.origin.y = v18;
    v51.size.width = rect;
    v51.size.height = v17;
    double MinX = CGRectGetMinX(v51);
  }
  else
  {
    objc_msgSend(v23, "setFrame:", v34, v35, v41, v37);
    v52.origin.x = v13;
    v52.origin.y = v18;
    v52.size.width = rect;
    v52.size.height = v17;
    double MinX = CGRectGetMaxX(v52) - v45;
  }
  objc_msgSend(v20, "setFrame:", MinX, v18, v45, v17);
}

- (void)prepareForDisplay
{
  v9.receiver = self;
  v9.super_class = (Class)CKTitledImageBalloonView;
  [(CKImageBalloonView *)&v9 prepareForDisplay];
  double v3 = [(CKTitledImageBalloonView *)self effectView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F43028]);
    double v5 = [MEMORY[0x1E4F427D8] effectWithStyle:6];
    double v6 = (void *)[v4 initWithEffect:v5];
    [(CKTitledImageBalloonView *)self setEffectView:v6];

    double v7 = [(CKTitledImageBalloonView *)self effectView];
    [(CKTitledImageBalloonView *)self addSubview:v7];
  }
  double v8 = [(CKTitledImageBalloonView *)self effectView];
  [(CKTitledImageBalloonView *)self sendSubviewToBack:v8];
}

- (UIEdgeInsets)alignmentRectInsets
{
  int v3 = [(CKBalloonView *)self orientation];
  id v4 = +[CKUIBehavior sharedBehaviors];
  [(CKBalloonView *)self balloonDescriptor];
  [v4 balloonMaskAlignmentRectInsetsWithTailShape:v17];
  double v8 = v7;
  double v10 = v9;
  if (v3) {
    double v11 = v5;
  }
  else {
    double v11 = v6;
  }
  if (v3) {
    double v12 = v6;
  }
  else {
    double v12 = v5;
  }

  double v13 = v8;
  double v14 = v11;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKTitledImageBalloonView;
  [(CKImageBalloonView *)&v4 prepareForReuse];
  int v3 = [(CKTitledImageBalloonView *)self chevron];
  [v3 setHidden:0];
}

- (void)tapGestureRecognized:(id)a3
{
  id v4 = a3;
  double v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 handlesBalloonViewTitleTapsSeparately];

  if (v6)
  {
    double v7 = +[CKUIBehavior sharedBehaviors];
    [v7 locationShareBalloonButtonHeight];
    CGFloat v9 = v8;

    memset(&remainder, 0, sizeof(remainder));
    memset(&slice, 0, sizeof(slice));
    [(CKTitledImageBalloonView *)self bounds];
    CGRectDivide(v18, &slice, &remainder, v9, CGRectMaxYEdge);
    [v4 locationInView:self];
    v17.x = v10;
    v17.y = v11;
    if (CGRectContainsPoint(slice, v17))
    {
      double v12 = [(CKBalloonView *)self delegate];
      [v12 balloonViewTitleTapped:self];
    }
    else
    {
      -[CKImageBalloonView tapGestureRecognized:](&v14, sel_tapGestureRecognized_, v4, v13.receiver, v13.super_class, self, CKTitledImageBalloonView);
    }
  }
  else
  {
    -[CKImageBalloonView tapGestureRecognized:](&v13, sel_tapGestureRecognized_, v4, self, CKTitledImageBalloonView, v14.receiver, v14.super_class);
  }
}

- (void)setOrientation:(char)a3
{
  uint64_t v3 = a3;
  if ([(CKBalloonView *)self orientation] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKTitledImageBalloonView;
    [(CKBalloonView *)&v5 setOrientation:v3];
    [(CKTitledImageBalloonView *)self setNeedsLayout];
  }
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  id v4 = [(CKTitledImageBalloonView *)self title];
  char v5 = [v4 isEqualToString:v7];

  if ((v5 & 1) == 0)
  {
    int v6 = [(CKTitledImageBalloonView *)self titleLabel];
    [v6 setText:v7];

    [(CKTitledImageBalloonView *)self setNeedsLayout];
  }
}

- (NSString)title
{
  v2 = [(CKTitledImageBalloonView *)self titleLabel];
  uint64_t v3 = [v2 text];

  return (NSString *)v3;
}

- (UIImageView)chevron
{
  return self->_chevron;
}

- (void)setChevron:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_chevron, 0);
}

- (void)configureForLocatingChatItem:(id)a3
{
  id v4 = a3;
  -[CKTitledImageBalloonView setOrientation:](self, "setOrientation:", [v4 balloonOrientation]);
  -[CKImageBalloonView setHasTail:](self, "setHasTail:", [v4 hasTail]);
  -[CKBalloonView setBalloonCorners:](self, "setBalloonCorners:", [v4 balloonCorners]);
  [v4 textAlignmentInsets];
  -[CKBalloonView setTextAlignmentInsets:](self, "setTextAlignmentInsets:");
  char v5 = +[CKUIBehavior sharedBehaviors];
  [v5 mapPreviewMaxWidth];
  +[CKLocationMediaObject placeholderPreviewForWidth:orientation:](CKLocationMediaObject, "placeholderPreviewForWidth:orientation:", [v4 balloonOrientation], v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [(CKImageBalloonView *)self setImage:v8];
  id v7 = [v4 locationText];

  [(CKTitledImageBalloonView *)self setTitle:v7];
}

@end