@interface CKDetailsCell
- (BOOL)indentBottomSeperator;
- (BOOL)indentTopSeperator;
- (CKDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIView)bottomSeperator;
- (UIView)topSeperator;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBottomSeperator:(id)a3;
- (void)setIndentBottomSeperator:(BOOL)a3;
- (void)setIndentTopSeperator:(BOOL)a3;
- (void)setTopSeperator:(id)a3;
@end

@implementation CKDetailsCell

- (CKDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)CKDetailsCell;
  v4 = [(CKDetailsCell *)&v16 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[CKUIBehavior sharedBehaviors];
    v6 = [v5 theme];
    v7 = [v6 detailsSelectedCellColor];

    if (v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      v9 = +[CKUIBehavior sharedBehaviors];
      v10 = [v9 theme];
      v11 = [v10 detailsSelectedCellColor];
      [v8 setBackgroundColor:v11];

      [(CKDetailsCell *)v4 setSelectedBackgroundView:v8];
      v12 = +[CKUIBehavior sharedBehaviors];
      v13 = [v12 theme];
      v14 = [v13 iosMacDetailsCellColor];
      [(CKDetailsCell *)v4 setBackgroundColor:v14];
    }
  }
  return v4;
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)CKDetailsCell;
  [(CKDetailsCell *)&v39 layoutSubviews];
  [(CKDetailsCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CKDetailsCell *)self layoutMargins];
  double v37 = v12;
  double v38 = v11;
  v13 = +[CKUIBehavior sharedBehaviors];
  int v14 = [v13 detailsSeperatorsFollowLayoutMargins];

  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  if (CKPixelWidth_once_3 != -1) {
    dispatch_once(&CKPixelWidth_once_3, &__block_literal_global_38);
  }
  double v16 = *(double *)&CKPixelWidth_sPixel_3;
  uint64_t v34 = CKPixelWidth_sPixel_3;
  v40.origin.x = v4;
  v40.origin.y = v6;
  v40.size.width = v8;
  v40.size.height = v10;
  CGFloat v36 = v10;
  double Width = CGRectGetWidth(v40);
  BOOL v18 = [(CKDetailsCell *)self indentTopSeperator];
  double v19 = 0.0;
  CGFloat v20 = v8;
  if (v18 | v14) {
    double v21 = v38;
  }
  else {
    double v21 = 0.0;
  }
  if (v14) {
    double v19 = v37;
  }
  CGFloat v22 = Width - v21 - v19;
  v23 = [(CKDetailsCell *)self topSeperator];
  objc_msgSend(v23, "setFrame:", v21, v15, v22, v16);

  v41.origin.x = v4;
  v41.origin.y = v6;
  v41.size.width = v20;
  v41.size.height = v36;
  double Height = CGRectGetHeight(v41);
  v42.origin.x = v21;
  v42.origin.y = v15;
  v42.size.width = v22;
  v42.size.height = v35;
  double v25 = Height - CGRectGetHeight(v42);
  v43.origin.x = v4;
  v43.origin.y = v6;
  v43.size.width = v20;
  v43.size.height = v36;
  double v26 = CGRectGetWidth(v43);
  int v27 = [(CKDetailsCell *)self indentBottomSeperator] | v14;
  double v28 = 0.0;
  if (v27) {
    double v29 = v38;
  }
  else {
    double v29 = 0.0;
  }
  if (v27) {
    double v28 = v37;
  }
  double v30 = v26 - v29 - v28;
  v31 = [(CKDetailsCell *)self bottomSeperator];
  objc_msgSend(v31, "setFrame:", v29, v25, v30, v35);

  v32 = [(CKDetailsCell *)self topSeperator];
  [(CKDetailsCell *)self bringSubviewToFront:v32];

  v33 = [(CKDetailsCell *)self bottomSeperator];
  [(CKDetailsCell *)self bringSubviewToFront:v33];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CKDetailsCell;
  [(CKDetailsCell *)&v5 prepareForReuse];
  double v3 = [(CKDetailsCell *)self topSeperator];
  [v3 setHidden:0];

  CGFloat v4 = [(CKDetailsCell *)self bottomSeperator];
  [v4 setHidden:0];

  [(CKDetailsCell *)self setIndentTopSeperator:0];
  [(CKDetailsCell *)self setIndentBottomSeperator:0];
}

- (UIView)topSeperator
{
  topSeperator = self->_topSeperator;
  if (!topSeperator)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    objc_super v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    CGFloat v6 = [MEMORY[0x1E4F428B8] separatorColor];
    [(UIView *)v5 setBackgroundColor:v6];

    [(CKDetailsCell *)self addSubview:v5];
    double v7 = self->_topSeperator;
    self->_topSeperator = v5;

    topSeperator = self->_topSeperator;
  }

  return topSeperator;
}

- (UIView)bottomSeperator
{
  bottomSeperator = self->_bottomSeperator;
  if (!bottomSeperator)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    objc_super v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    CGFloat v6 = [MEMORY[0x1E4F428B8] separatorColor];
    [(UIView *)v5 setBackgroundColor:v6];

    [(CKDetailsCell *)self addSubview:v5];
    double v7 = self->_bottomSeperator;
    self->_bottomSeperator = v5;

    bottomSeperator = self->_bottomSeperator;
  }

  return bottomSeperator;
}

- (void)setTopSeperator:(id)a3
{
}

- (void)setBottomSeperator:(id)a3
{
}

- (BOOL)indentTopSeperator
{
  return self->_indentTopSeperator;
}

- (void)setIndentTopSeperator:(BOOL)a3
{
  self->_indentTopSeperator = a3;
}

- (BOOL)indentBottomSeperator
{
  return self->_indentBottomSeperator;
}

- (void)setIndentBottomSeperator:(BOOL)a3
{
  self->_indentBottomSeperator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSeperator, 0);

  objc_storeStrong((id *)&self->_topSeperator, 0);
}

@end