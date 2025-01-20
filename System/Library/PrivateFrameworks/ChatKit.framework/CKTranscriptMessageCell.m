@interface CKTranscriptMessageCell
+ (double)failureButtonWidthPlusSpacing;
- (BOOL)chatEligibleForContactImage;
- (BOOL)failed;
- (BOOL)failureButtonAdjustsContentAlignmentRect;
- (BOOL)isFromMe;
- (BOOL)isReply;
- (BOOL)isReplyContextPreview;
- (BOOL)wantsContactImageLayout;
- (CGRect)contactImageViewFrame;
- (UIButton)failureButton;
- (UIEdgeInsets)safeAreaInsets;
- (id)contactImageView;
- (id)description;
- (void)layoutSubviewsForContents;
- (void)setChatEligibleForContactImage:(BOOL)a3;
- (void)setFailed:(BOOL)a3;
- (void)setFailureButton:(id)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setIsReply:(BOOL)a3;
- (void)setIsReplyContextPreview:(BOOL)a3;
- (void)setWantsContactImageLayout:(BOOL)a3;
@end

@implementation CKTranscriptMessageCell

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptMessageCell;
  v4 = [(CKEditableCollectionViewCell *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ wantsContactImageLayout:%d failed:%d", v4, -[CKTranscriptMessageCell wantsContactImageLayout](self, "wantsContactImageLayout"), -[CKTranscriptMessageCell failed](self, "failed")];

  return v5;
}

- (UIEdgeInsets)safeAreaInsets
{
  v22.receiver = self;
  v22.super_class = (Class)CKTranscriptMessageCell;
  [(CKTranscriptMessageCell *)&v22 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = v3;
  if (v6 > 0.0 || v3 > 0.0)
  {
    v11 = [(CKTranscriptMessageCell *)self window];
    v12 = [v11 windowScene];

    if (v12 && (unint64_t)([v12 interfaceOrientation] - 3) <= 1)
    {
      v13 = +[CKUIBehavior sharedBehaviors];
      [v13 landscapeKeyboardInsets];
      double v15 = v14;
      double v17 = v16;

      if (v7 > 0.0) {
        double v7 = v15;
      }
      if (v10 > 0.0) {
        double v10 = v17;
      }
    }
  }
  double v18 = v5;
  double v19 = v7;
  double v20 = v9;
  double v21 = v10;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)layoutSubviewsForContents
{
  v108.receiver = self;
  v108.super_class = (Class)CKTranscriptMessageCell;
  [(CKEditableCollectionViewCell *)&v108 layoutSubviewsForContents];
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int v11 = [(CKEditableCollectionViewCell *)self orientation];
  v12 = [(CKTranscriptMessageCell *)self failureButton];
  BOOL v13 = [(CKTranscriptMessageCell *)self wantsContactImageLayout];
  BOOL v14 = v13;
  if (v12 || v13)
  {
    double v102 = v8;
    double v105 = v10;
    [(CKEditableCollectionViewCell *)self contentAlignmentInsets];
    double v16 = v15;
    [(CKEditableCollectionViewCell *)self contentAlignmentInsets];
    double v18 = v17;
    [(CKTranscriptMessageCell *)self safeAreaInsets];
    double v20 = v18 - v19;
    [(CKEditableCollectionViewCell *)self contentAlignmentInsets];
    double v99 = v21;
    [(CKEditableCollectionViewCell *)self contentAlignmentInsets];
    double v23 = v22;
    [(CKTranscriptMessageCell *)self safeAreaInsets];
    double v97 = v23 - v24;
    v25 = +[CKUIBehavior sharedBehaviors];
    if ([v25 forceMinTranscriptMarginInsets])
    {
      v26 = +[CKUIBehavior sharedBehaviors];
      [v26 minTranscriptMarginInsets];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
    }
    else
    {
      [(CKEditableCollectionViewCell *)self marginInsets];
      double v28 = v35;
      double v30 = v36;
      double v32 = v37;
      double v34 = v38;
    }

    v39 = +[CKUIBehavior sharedBehaviors];
    [v39 contactPhotoTranscriptInsets];
    double v41 = v28 + v40;
    double v43 = v30 + v42;
    double v45 = v32 + v44;
    double v47 = v34 + v46;

    double v4 = v4 - v20 + v43;
    double v6 = v6 - v16 + v41;
    double v8 = v102 + v20 + v97 - (v43 + v47);
    double v10 = v105 + v16 + v99 - (v41 + v45);
    if (v12)
    {
      if ([(CKTranscriptMessageCell *)self failureButtonAdjustsContentAlignmentRect])
      {
        [v12 frame];
        double v49 = v48;
        double v106 = v50;
        [v12 frame];
        double v52 = v51;
        double v53 = v6;
        if (CKMainScreenScale_once_84 != -1) {
          dispatch_once(&CKMainScreenScale_once_84, &__block_literal_global_90_0);
        }
        double v54 = v8;
        double v55 = *(double *)&CKMainScreenScale_sMainScreenScale_84;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_84 == 0.0) {
          double v55 = 1.0;
        }
        double v56 = v52 * v55;
        double v57 = v53;
        double v58 = 1.0 / v55 * (v53 * v55 + floor((v10 * v55 - v56) * 0.5));
        double v59 = *MEMORY[0x1E4F437F8];
        double v103 = *(double *)(MEMORY[0x1E4F437F8] + 16);
        if (v11)
        {
          double v60 = *(double *)(MEMORY[0x1E4F437F8] + 8);
          v109.origin.x = v4;
          v109.origin.y = v57;
          double v100 = *MEMORY[0x1E4F437F8];
          double v61 = v49 + 1.0;
          double v62 = v49;
          double v63 = v58;
          v109.size.width = v54;
          v109.size.height = v10;
          CGFloat MaxX = CGRectGetMaxX(v109);
          double v58 = v63;
          double v49 = v62;
          double v65 = v61;
          double v59 = v100;
          double v66 = MaxX - v49;
        }
        else
        {
          double v60 = v49 + 1.0;
          double v65 = *(double *)(MEMORY[0x1E4F437F8] + 24);
          double v66 = v4;
        }
        objc_msgSend(v12, "setFrame:", v66, v58, v49, v106);
        double v4 = v4 + v60;
        double v8 = v54 - (v60 + v65);
        double v10 = v10 - (v59 + v103);
        double v6 = v57 + v59;
      }
    }
  }
  if (v14)
  {
    [(CKTranscriptMessageCell *)self contactImageViewFrame];
    double v68 = v67;
    double v70 = v69;
    v110.origin.x = v4;
    v110.origin.y = v6;
    v110.size.width = v8;
    CGFloat v107 = v10;
    v110.size.height = v10;
    double v71 = CGRectGetMaxY(v110) + 1.0;
    v72 = (double *)MEMORY[0x1E4F437F8];
    double v73 = 0.0;
    if ([(CKTranscriptMessageCell *)self isReplyContextPreview])
    {
      v74 = +[CKUIBehavior sharedBehaviors];
      [v74 transcriptContactImageDiameter];
      double v76 = v75;
      v77 = +[CKUIBehavior sharedBehaviors];
      [v77 transcriptReplyPreviewContextContactImageDiameter];
      double v73 = (v76 - v78) * 0.5;
    }
    double v96 = v71 - v70;
    double v98 = *v72;
    double v101 = v72[2];
    double v104 = v70;
    v79 = +[CKUIBehavior sharedBehaviors];
    [v79 contactPhotoBalloonMargin];
    double v81 = v80 + v73 * 2.0;

    double v82 = v68 + v81;
    if (v11)
    {
      double v83 = v72[1];
      v111.origin.x = v4;
      v111.origin.y = v6;
      v111.size.width = v8;
      double v84 = v107;
      v111.size.height = v107;
      double v85 = CGRectGetMaxX(v111) - v68 - v73;
    }
    else
    {
      double v83 = v68 + v81;
      double v82 = v72[3];
      double v85 = v4 + v73;
      double v84 = v107;
    }
    v86 = [(CKTranscriptMessageCell *)self contactImageView];
    objc_msgSend(v86, "setFrame:", v85, v96, v68, v104);
    [(CKEditableCollectionViewCell *)self contentInsets];
    double v88 = v98 + v87;
    double v90 = v83 + v89;
    double v4 = v4 + v90;
    double v6 = v6 + v88;
    double v8 = v8 - (v90 + v82 + v92);
    double v10 = v84 - (v88 + v101 + v91);
  }
  if ([(CKTranscriptMessageCell *)self isReplyContextPreview]
    && ![(CKTranscriptMessageCell *)self isFromMe]
    && v11 == 2)
  {
    v93 = +[CKUIBehavior sharedBehaviors];
    [v93 balloonMaskTailSizeForTailShape:1];
    double v95 = v94;

    double v4 = v4 - v95;
  }
  -[CKEditableCollectionViewCell setContentAlignmentRect:](self, "setContentAlignmentRect:", v4, v6, v8, v10);
}

- (CGRect)contactImageViewFrame
{
  BOOL v2 = [(CKTranscriptMessageCell *)self isReplyContextPreview];
  double v3 = +[CKUIBehavior sharedBehaviors];
  double v4 = v3;
  if (v2) {
    [v3 transcriptReplyPreviewContextContactImageDiameter];
  }
  else {
    [v3 transcriptContactImageDiameter];
  }
  double v6 = v5;

  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = v6;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)setWantsContactImageLayout:(BOOL)a3
{
  if (self->_wantsContactImageLayout != a3)
  {
    self->_wantsContactImageLayout = a3;
    [(CKTranscriptMessageCell *)self setNeedsLayout];
  }
}

- (void)setFailed:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKTranscriptMessageCell *)self failed] != a3)
  {
    double v5 = [(CKTranscriptMessageCell *)self failureButton];
    double v6 = v5;
    if (v3)
    {
      if (!v5)
      {
        double v7 = [MEMORY[0x1E4F427E0] buttonWithType:118];
        double v8 = +[CKUIBehavior sharedBehaviors];
        double v9 = [v8 theme];
        double v10 = [v9 statusFailureTextColor];
        [v7 setTintColor:v10];

        int v11 = [(CKEditableCollectionViewCell *)self contentView];
        [v11 addSubview:v7];

        [(CKTranscriptMessageCell *)self setFailureButton:v7];
        [v7 sizeToFit];
      }
    }
    else
    {
      [v5 removeFromSuperview];

      [(CKTranscriptMessageCell *)self setFailureButton:0];
    }
    [(CKTranscriptMessageCell *)self setNeedsLayout];
  }
}

- (BOOL)failed
{
  BOOL v2 = [(CKTranscriptMessageCell *)self failureButton];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)failureButtonAdjustsContentAlignmentRect
{
  return 1;
}

- (id)contactImageView
{
  return 0;
}

+ (double)failureButtonWidthPlusSpacing
{
  if (failureButtonWidthPlusSpacing_onceToken != -1) {
    dispatch_once(&failureButtonWidthPlusSpacing_onceToken, &__block_literal_global_207);
  }
  return *(double *)&failureButtonWidthPlusSpacing_sFailureButtonWidthPlusSpacing;
}

void __56__CKTranscriptMessageCell_failureButtonWidthPlusSpacing__block_invoke()
{
  v1 = objc_alloc_init(CKTranscriptMessageCell);
  [(CKTranscriptMessageCell *)v1 setFailed:1];
  v0 = [(CKTranscriptMessageCell *)v1 failureButton];
  [v0 frame];
  *(double *)&failureButtonWidthPlusSpacing_sFailureButtonWidthPlusSpacing = CGRectGetWidth(v3) + 1.0;
}

- (BOOL)chatEligibleForContactImage
{
  return self->_chatEligibleForContactImage;
}

- (void)setChatEligibleForContactImage:(BOOL)a3
{
  self->_chatEligibleForContactImage = a3;
}

- (BOOL)wantsContactImageLayout
{
  return self->_wantsContactImageLayout;
}

- (BOOL)isReply
{
  return self->_isReply;
}

- (void)setIsReply:(BOOL)a3
{
  self->_isReply = a3;
}

- (BOOL)isReplyContextPreview
{
  return self->_isReplyContextPreview;
}

- (void)setIsReplyContextPreview:(BOOL)a3
{
  self->_isReplyContextPreview = a3;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (UIButton)failureButton
{
  return self->_failureButton;
}

- (void)setFailureButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end