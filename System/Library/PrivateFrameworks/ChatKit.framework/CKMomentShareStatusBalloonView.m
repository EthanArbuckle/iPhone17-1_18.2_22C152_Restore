@interface CKMomentShareStatusBalloonView
+ (CGSize)sizeThatFits:(CGSize)a3;
+ (id)_secondaryLabelString;
- (CGSize)_performLayoutInSize:(CGSize)a3 updateSubviewFrames:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKMomentShareStatusBalloonView)initWithFrame:(CGRect)a3;
- (char)color;
- (void)layoutSubviews;
@end

@implementation CKMomentShareStatusBalloonView

- (CKMomentShareStatusBalloonView)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CKMomentShareStatusBalloonView;
  v3 = -[CKColoredBalloonView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F42A80], "px_imageNamed:", @"PXMessagesPlaceholderIcon");
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v4];
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = (UIImageView *)v5;

    [(UIImageView *)v3->_iconImageView setContentMode:1];
    [(UIImageView *)v3->_iconImageView _setContinuousCornerRadius:10.0];
    [(UIImageView *)v3->_iconImageView setClipsToBounds:1];
    [(CKMomentShareStatusBalloonView *)v3 addSubview:v3->_iconImageView];
    v7 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43880]];
    v8 = [v7 fontDescriptorWithSymbolicTraits:2];

    v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    primaryLabel = v3->_primaryLabel;
    v3->_primaryLabel = v10;

    v12 = v3->_primaryLabel;
    v13 = CKFrameworkBundle();
    v14 = [v13 localizedStringForKey:@"CKMomentShareStatusBalloonViewTitle" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [(UILabel *)v12 setText:v14];

    [(UILabel *)v3->_primaryLabel setFont:v9];
    [(UILabel *)v3->_primaryLabel setNumberOfLines:0];
    [(CKMomentShareStatusBalloonView *)v3 addSubview:v3->_primaryLabel];
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    secondaryLabel = v3->_secondaryLabel;
    v3->_secondaryLabel = v15;

    v17 = v3->_secondaryLabel;
    v18 = [(id)objc_opt_class() _secondaryLabelString];
    [(UILabel *)v17 setText:v18];

    [(UILabel *)v3->_secondaryLabel setFont:v9];
    [(UILabel *)v3->_secondaryLabel setNumberOfLines:0];
    v19 = v3->_secondaryLabel;
    v20 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(UILabel *)v19 setTextColor:v20];

    [(CKMomentShareStatusBalloonView *)v3 addSubview:v3->_secondaryLabel];
  }
  return v3;
}

+ (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CKMomentShareStatusBalloonView_sizeThatFits___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sizeThatFits__predicate != -1) {
    dispatch_once(&sizeThatFits__predicate, block);
  }
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (width > 0.0 && height > 0.0)
  {
    objc_msgSend((id)sizeThatFits___measurementView, "setFrame:", 0.0, 0.0, width, height);
    objc_msgSend((id)sizeThatFits___measurementView, "sizeThatFits:", width, height);
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

void __47__CKMomentShareStatusBalloonView_sizeThatFits___block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sizeThatFits___measurementView;
  sizeThatFits___measurementView = (uint64_t)v1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CKMomentShareStatusBalloonView _performLayoutInSize:updateSubviewFrames:](self, "_performLayoutInSize:updateSubviewFrames:", 0, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CKMomentShareStatusBalloonView;
  [(CKColoredBalloonView *)&v5 layoutSubviews];
  [(CKMomentShareStatusBalloonView *)self bounds];
  -[CKMomentShareStatusBalloonView _performLayoutInSize:updateSubviewFrames:](self, "_performLayoutInSize:updateSubviewFrames:", 1, v3, v4);
}

+ (id)_secondaryLabelString
{
}

- (CGSize)_performLayoutInSize:(CGSize)a3 updateSubviewFrames:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = +[CKUIBehavior sharedBehaviors];
  [(CKColoredBalloonView *)self balloonDescriptor];
  [v6 balloonMaskTailSizeForTailShape:v55];
  double v8 = v7;

  int v9 = [(CKBalloonView *)self orientation];
  double v10 = 10.0;
  double v11 = v8 + 10.0;
  if (v9) {
    double v12 = 10.0;
  }
  else {
    double v12 = v8 + 10.0;
  }
  if (v9) {
    double v13 = v11;
  }
  else {
    double v13 = 10.0;
  }
  double v53 = v13;
  PXEdgeInsetsInsetSize();
  double v15 = v14;
  double v17 = v16;
  v57.origin.y = 10.0;
  v57.origin.x = v12;
  v57.size.double width = 50.0;
  v57.size.double height = 50.0;
  double v18 = fmax(v12, CGRectGetMaxX(v57));
  v58.origin.y = 10.0;
  CGFloat v46 = v12;
  v58.origin.x = v12;
  v58.size.double width = 50.0;
  v58.size.double height = 50.0;
  double v48 = fmax(CGRectGetMaxY(v58), 10.0);
  -[UILabel sizeThatFits:](self->_primaryLabel, "sizeThatFits:", v15 + -60.0, v17);
  double v20 = v19;
  double v22 = v21;
  CGFloat v44 = v17;
  -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", v15 + -60.0, v17);
  double v24 = v23;
  CGFloat v26 = v25;
  double v52 = v18;
  double v27 = v18 + 10.0;
  v59.origin.y = 10.0;
  v59.origin.x = v18 + 10.0;
  v59.size.double width = v20;
  v59.size.double height = v22;
  double MaxX = CGRectGetMaxX(v59);
  v60.origin.x = v18 + 10.0;
  v60.origin.y = v22 + 10.0 + 5.0;
  v60.size.double width = v24;
  v60.size.double height = v26;
  double v50 = CGRectGetMaxX(v60);
  v61.origin.y = 10.0;
  v61.origin.x = v18 + 10.0;
  v61.size.double width = v20;
  double v47 = v22;
  v61.size.double height = v22;
  double MaxY = CGRectGetMaxY(v61);
  v62.origin.x = v27;
  double v42 = v22 + 10.0 + 5.0;
  v62.origin.y = v42;
  v62.size.double width = v24;
  double v54 = v26;
  v62.size.double height = v26;
  double v49 = fmax(v48, fmax(MaxY, CGRectGetMaxY(v62)));
  v29 = [(CKMomentShareStatusBalloonView *)self traitCollection];
  [v29 displayScale];
  if (v30 == 0.0)
  {
    v31 = [MEMORY[0x1E4F42D90] mainScreen];
    [v31 scale];
  }
  PXFloatFloorToPixel();
  double v33 = v32 + 10.0;
  if (v33 + -10.0 <= 0.0) {
    double v33 = 10.0;
  }
  double rect = v33;
  PXFloatFloorToPixel();
  double v35 = v34 + 10.0 + -10.0;
  if (v35 <= 0.0) {
    double v36 = -0.0;
  }
  else {
    double v36 = v35;
  }
  if (v35 > 0.0) {
    double v10 = v35 + 10.0;
  }
  double v37 = v27;
  double v38 = v46;
  if ([(CKMomentShareStatusBalloonView *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    v63.origin.y = 10.0;
    v63.origin.x = v46;
    v63.size.double height = v44;
    v63.size.double width = v15;
    double v38 = CGRectGetMaxX(v63) + -50.0;
    v64.size.double width = 50.0;
    v64.origin.x = v38;
    v64.origin.y = rect;
    v64.size.double height = 50.0;
    CGFloat v39 = CGRectGetMinX(v64) + -10.0;
    double v37 = v39 - v20;
    double v27 = v39 - v24;
  }
  if (v4)
  {
    -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v38, rect, 50.0, 50.0);
    -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v37, v10, v20, v47);
    -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", v27, v43 + v36, v24, v54);
  }
  double v40 = v53 + fmax(v52, fmax(MaxX, v50));
  double v41 = v49 + 10.0;
  result.double height = v41;
  result.double width = v40;
  return result;
}

- (char)color
{
  return -1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end