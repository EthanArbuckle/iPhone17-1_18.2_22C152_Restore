@interface CKPluginMessageStatusCell
- (BOOL)hidesCheckmark;
- (CKPluginMessageStatusCell)initWithFrame:(CGRect)a3;
- (IMBalloonPluginDataSource)dataSource;
- (NSString)balloonBundleID;
- (UIImageView)imageView;
- (UIView)previousPluginSnapshot;
- (void)_updateBalloonPluginIconImage;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)dealloc;
- (void)layoutSubviewsForAlignmentContents;
- (void)performInsertion:(id)a3;
- (void)prepareForReuse;
- (void)setBalloonBundleID:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPreviousPluginSnapshot:(id)a3;
@end

@implementation CKPluginMessageStatusCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CKPluginMessageStatusCell;
  [(CKTranscriptStampCell *)&v29 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  v13 = [v12 IMChatItem];
  v14 = [v13 balloonBundleID];
  [(CKPluginMessageStatusCell *)self setBalloonBundleID:v14];

  v15 = [(CKTranscriptLabelCell *)self label];
  [v15 frame];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [v12 size];
  double v25 = v24;
  double v27 = v26;
  if (objc_opt_respondsToSelector())
  {
    [v12 iconSizePlusHorizontalPadding];
    double v25 = v25 - v28;
  }
  if (v21 != v25 || v23 != v27)
  {
    objc_msgSend(v15, "setFrame:", v17, v19, v25, v27);
    [(CKPluginMessageStatusCell *)self setNeedsLayout];
  }
}

- (CKPluginMessageStatusCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKPluginMessageStatusCell;
  v3 = -[CKTranscriptLabelCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v5 setContentMode:0];
    v6 = [(CKEditableCollectionViewCell *)v3 contentView];
    [v6 addSubview:v5];

    [(CKPluginMessageStatusCell *)v3 setImageView:v5];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v3 selector:sel__updateBalloonPluginIconImage name:*MEMORY[0x1E4F6B878] object:0];
  }
  return v3;
}

- (BOOL)hidesCheckmark
{
  if (IMGetDomainBoolForKey()) {
    return ![(CKTranscriptStampCell *)self isRetractionStamp];
  }
  else {
    return 1;
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKPluginMessageStatusCell;
  [(CKPluginMessageStatusCell *)&v4 dealloc];
}

- (void)_updateBalloonPluginIconImage
{
  v3 = [MEMORY[0x1E4F6BC18] sharedInstance];
  objc_super v4 = [(CKPluginMessageStatusCell *)self balloonBundleID];
  v5 = [v3 balloonPluginForBundleID:v4];

  v6 = [v5 identifier];
  v7 = IMBalloonExtensionIDWithSuffix();
  char v8 = [v6 isEqualToString:v7];

  char v9 = [v5 shouldBreadcrumbHideAppIcon] | v8;
  if (v5
    || ([(CKPluginMessageStatusCell *)self balloonBundleID],
        (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((v9 & 1) == 0)
    {
      id location = 0;
      objc_initWeak(&location, self);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __58__CKPluginMessageStatusCell__updateBalloonPluginIconImage__block_invoke;
      v11[3] = &unk_1E562C4A8;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v5, "__ck_generateStatusImage:", v11);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __58__CKPluginMessageStatusCell__updateBalloonPluginIconImage__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained imageView];
    id v6 = [v5 image];

    if (v6 != v8)
    {
      v7 = [v4 imageView];
      [v7 setImage:v8];

      [v4 setNeedsLayout];
    }
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKPluginMessageStatusCell;
  [(CKTranscriptStampCell *)&v3 prepareForReuse];
  [(CKPluginMessageStatusCell *)self setPreviousPluginSnapshot:0];
  [(CKPluginMessageStatusCell *)self setDataSource:0];
}

- (void)layoutSubviewsForAlignmentContents
{
  objc_super v3 = +[CKUIBehavior sharedBehaviors];
  objc_super v4 = [(CKTranscriptLabelCell *)self label];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  v43.receiver = self;
  v43.super_class = (Class)CKPluginMessageStatusCell;
  [(CKTranscriptStampCell *)&v43 layoutSubviewsForAlignmentContents];
  char v9 = [(CKPluginMessageStatusCell *)self imageView];
  v10 = [v9 image];

  v11 = +[CKUIBehavior sharedBehaviors];
  [v11 iMessageAppIconSize];
  double v13 = v12;
  double v42 = v14;

  if (v10)
  {
    [v3 transcriptCustomStatusImagePadding];
    double v16 = v13 + v15;
  }
  else
  {
    double v16 = 0.0;
  }
  [(CKTranscriptStampCell *)self contentAlignmentRect];
  double v18 = v17;
  double v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  int v25 = [(CKEditableCollectionViewCell *)self orientation];
  if (v25 == 2)
  {
    v45.origin.x = v18;
    v45.origin.y = v20;
    v45.size.width = v22;
    v45.size.height = v24;
    double MaxX = CGRectGetMaxX(v45);
    v46.origin.x = v18;
    v46.origin.y = v20;
    v46.size.width = v6;
    v46.size.height = v8;
    double v18 = MaxX - CGRectGetWidth(v46);
  }
  else if (v25 == 1)
  {
    v47.origin.x = v18;
    v47.origin.y = v20;
    v47.size.width = v22;
    v47.size.height = v24;
    double MidX = CGRectGetMidX(v47);
    v48.origin.x = v18;
    v48.origin.y = v20;
    v48.size.width = v6;
    v48.size.height = v8;
    double v18 = MidX + (v16 + CGRectGetWidth(v48)) * -0.5;
  }
  else if (!(_BYTE)v25)
  {
    v44.origin.x = v18;
    v44.origin.y = v20;
    v44.size.width = v22;
    v44.size.height = v24;
    double v18 = v16 + CGRectGetMinX(v44);
  }
  objc_msgSend(v4, "setFrame:", v18, v20, v6, v8);
  if (v10)
  {
    double v28 = [v3 transcriptTextFont];
    [v28 lineHeight];
    double v30 = v20 + (v29 - v42) * 0.5;

    v31 = [(CKPluginMessageStatusCell *)self imageView];
    [v3 transcriptCustomStatusImageEdgeInsets];
    double v33 = v18 - v16 + v32;
    double v35 = v30 + v34;
    double v37 = v13 - (v32 + v36);
    double v39 = v42 - (v34 + v38);
    v40 = [v31 layer];
    v41 = [v40 mask];
    objc_msgSend(v41, "setFrame:", 0.0, 0.0, v37, v39);

    objc_msgSend(v31, "setFrame:", v33, v35, v37, v39);
  }
}

- (void)performInsertion:(id)a3
{
  id v4 = a3;
  double v5 = [(CKPluginMessageStatusCell *)self previousPluginSnapshot];
  if (v5)
  {
    previousPluginSnapshot = self->_previousPluginSnapshot;
    self->_previousPluginSnapshot = 0;

    double v7 = (void *)MEMORY[0x1E4F42FF0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__CKPluginMessageStatusCell_performInsertion___block_invoke;
    v11[3] = &unk_1E5620AF8;
    void v11[4] = self;
    id v12 = v5;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__CKPluginMessageStatusCell_performInsertion___block_invoke_2;
    v8[3] = &unk_1E5622750;
    id v9 = v12;
    id v10 = v4;
    [v7 animateWithDuration:0x10000 delay:v11 options:v8 animations:0.3 completion:0.0];
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

void __46__CKPluginMessageStatusCell_performInsertion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageView];
  objc_super v3 = [v2 image];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) imageView];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    [*(id *)(a1 + 40) frame];
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
    double v12 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", v6, v8, v10, v12);
  [*(id *)(a1 + 40) setAlpha:0.0];
  double v16 = [*(id *)(a1 + 32) imageView];
  [v16 setAlpha:1.0];

  id v17 = [*(id *)(a1 + 32) label];
  [v17 setAlpha:1.0];
}

uint64_t __46__CKPluginMessageStatusCell_performInsertion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    objc_super v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setDataSource:(id)a3
{
  id v10 = a3;
  double v5 = [v10 pluginPayload];
  double v6 = [v5 pluginBundleID];

  balloonBundleID = self->_balloonBundleID;
  if (balloonBundleID != v6 && ![(NSString *)balloonBundleID isEqualToString:v6]
    || ([(CKPluginMessageStatusCell *)self imageView],
        double v8 = objc_claimAutoreleasedReturnValue(),
        [v8 image],
        double v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
    objc_storeStrong((id *)&self->_dataSource, a3);
    [(CKPluginMessageStatusCell *)self _updateBalloonPluginIconImage];
  }
}

- (void)setBalloonBundleID:(id)a3
{
  double v5 = (NSString *)a3;
  balloonBundleID = self->_balloonBundleID;
  double v9 = v5;
  if (balloonBundleID != v5 && ![(NSString *)balloonBundleID isEqualToString:v5]
    || ([(CKPluginMessageStatusCell *)self imageView],
        double v7 = objc_claimAutoreleasedReturnValue(),
        [v7 image],
        double v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    objc_storeStrong((id *)&self->_balloonBundleID, a3);
    [(CKPluginMessageStatusCell *)self _updateBalloonPluginIconImage];
  }
}

- (void)setPreviousPluginSnapshot:(id)a3
{
  double v5 = (UIView *)a3;
  p_previousPluginSnapshot = &self->_previousPluginSnapshot;
  previousPluginSnapshot = self->_previousPluginSnapshot;
  if (previousPluginSnapshot != v5)
  {
    double v13 = v5;
    [(UIView *)previousPluginSnapshot removeFromSuperview];
    objc_storeStrong((id *)&self->_previousPluginSnapshot, a3);
    double v8 = *p_previousPluginSnapshot;
    double v9 = [(CKPluginMessageStatusCell *)self imageView];
    id v10 = v9;
    if (v8)
    {
      [v9 setAlpha:0.0];

      double v11 = [(CKTranscriptLabelCell *)self label];
      [v11 setAlpha:0.0];

      [(CKPluginMessageStatusCell *)self insertSubview:*p_previousPluginSnapshot atIndex:0];
    }
    else
    {
      [v9 setAlpha:1.0];

      double v12 = [(CKTranscriptLabelCell *)self label];
      [v12 setAlpha:1.0];
    }
    double v5 = v13;
  }
}

- (NSString)balloonBundleID
{
  return self->_balloonBundleID;
}

- (IMBalloonPluginDataSource)dataSource
{
  return self->_dataSource;
}

- (UIView)previousPluginSnapshot
{
  return self->_previousPluginSnapshot;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_previousPluginSnapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_balloonBundleID, 0);
}

@end