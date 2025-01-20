@interface CKTranscriptStatusCell
+ (id)statusButton;
+ (void)transitionFromView:(id)a3 toView:(id)a4 duration:(double)a5 options:(unint64_t)a6 completion:(id)a7;
+ (void)zoomAnimation:(id)a3 completion:(id)a4;
- (BOOL)shouldHideDuringDarkFSM;
- (BOOL)wantsDrawerLayout;
- (NSAttributedString)attributedButtonText;
- (UIButton)statusButton;
- (UIEdgeInsets)buttonAlignmentInsets;
- (char)buttonAlignmentRelativeToContent;
- (double)prevBalloonWidth;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)performInsertion:(id)a3;
- (void)performReload:(id)a3 completion:(id)a4;
- (void)performRemoval:(id)a3;
- (void)prepareForReuse;
- (void)setAttributedButtonText:(id)a3;
- (void)setButtonAlignmentRelativeToContent:(char)a3;
- (void)setOrientation:(char)a3;
- (void)setPrevBalloonWidth:(double)a3;
- (void)setStatusButton:(id)a3;
@end

@implementation CKTranscriptStatusCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[CKTranscriptStatusCell setButtonAlignmentRelativeToContent:](self, "setButtonAlignmentRelativeToContent:", [v12 statusAlignment]);
    v53.receiver = self;
    v53.super_class = (Class)CKTranscriptStatusCell;
    [(CKTranscriptStampCell *)&v53 configureForChatItem:v12 context:v13 animated:v9 animationDuration:a7 animationCurve:a6];
    v14 = [v12 transcriptButtonText];
    [(CKTranscriptStatusCell *)self setAttributedButtonText:v14];

    v15 = [(CKTranscriptStatusCell *)self statusButton];
    [v15 contentEdgeInsets];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    [v12 buttonSize];
    double v25 = v24 + v19 + v23;
    double v27 = v26 + v17 + v21;
    [v15 frame];
    if (v29 != v25 || v28 != v27)
    {
      -[NSObject setFrame:](v15, "setFrame:");
      [(CKTranscriptStatusCell *)self setNeedsLayout];
    }
    v31 = [(CKTranscriptLabelCell *)self label];
    [v31 frame];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    [v31 setNumberOfLines:0];
    [v12 labelTextAlignmentInsets];
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    [v12 labelSize];
    if (v37 != v49 + v43 + v47 || v39 != v48 + v41 + v45)
    {
      objc_msgSend(v31, "setFrame:", v33, v35);
      [(CKTranscriptStatusCell *)self setNeedsLayout];
    }
    -[NSObject setUserInteractionEnabled:](v15, "setUserInteractionEnabled:", [v12 buttonType] != 0);
    if ([v12 shouldHideDuringDarkFSM])
    {
      BOOL v51 = [(CKTranscriptCell *)self shouldConfigureForDarkFSM];
      v52 = [(CKTranscriptStatusCell *)self statusButton];
      [v52 setHidden:v51];
    }
  }
  else
  {
    v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptStatusCell(CKChatItem) configureForChatItem:context:animated:animationDuration:animationCurve:]();
    }
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptStatusCell;
  [(CKTranscriptStampCell *)&v4 prepareForReuse];
  v3 = [(CKTranscriptStatusCell *)self statusButton];
  [v3 removeFromSuperview];

  [(CKTranscriptStatusCell *)self setStatusButton:0];
}

- (BOOL)shouldHideDuringDarkFSM
{
  return 1;
}

- (void)setOrientation:(char)a3
{
  uint64_t v3 = a3;
  if ([(CKEditableCollectionViewCell *)self orientation] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKTranscriptStatusCell;
    [(CKTranscriptStampCell *)&v5 setOrientation:v3];
    [(CKTranscriptStatusCell *)self setNeedsLayout];
    [(CKTranscriptStatusCell *)self layoutIfNeeded];
  }
}

- (void)layoutSubviewsForAlignmentContents
{
  uint64_t v3 = [(CKTranscriptLabelCell *)self label];
  [v3 frame];
  double v5 = v4;
  CGFloat v79 = v6;
  double v80 = v7;
  double v84 = v8;
  v85.receiver = self;
  v85.super_class = (Class)CKTranscriptStatusCell;
  [(CKTranscriptStampCell *)&v85 layoutSubviewsForAlignmentContents];
  int v9 = [(CKEditableCollectionViewCell *)self orientation];
  [(CKTranscriptStampCell *)self contentAlignmentRect];
  double v13 = v12;
  double rect = v14;
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v17 = *MEMORY[0x1E4F437F8];
  double v18 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  if (!v9)
  {
    double v29 = +[CKUIBehavior sharedBehaviors];
    [v29 balloonMaskTailSizeForTailShape:1];
    double v31 = v30;

    double v32 = +[CKUIBehavior sharedBehaviors];
    [v32 audioBalloonTimeInset];
    double v34 = v33;

    [(CKTranscriptStatusCell *)self prevBalloonWidth];
    if (v35 < 12.0) {
      double v35 = 12.0;
    }
    double v36 = v31 + v13;
    double v37 = v15 + v17;
    double v38 = v35 - (v34 + v31);
    double v39 = v16 - (v17 + v18);
    double v40 = v36;
    goto LABEL_13;
  }
  double v76 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v82 = v5;
  double v19 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  if (v9 == 2)
  {
    CGFloat v20 = v10;
    CGFloat v21 = v11;
    double v74 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    double v22 = +[CKUIBehavior sharedBehaviors];
    [v22 balloonMaskAlignmentRectInsetsWithTailShape:1];
    double v24 = v23 + 1.0;

    [(CKTranscriptStatusCell *)self prevBalloonWidth];
    if (v25 >= 12.0) {
      double v26 = v25;
    }
    else {
      double v26 = 12.0;
    }
    v86.origin.x = v13;
    v86.origin.y = rect;
    v86.size.width = v20;
    v86.size.height = v21;
    CGFloat MaxX = CGRectGetMaxX(v86);
    double v19 = v74;
    double v28 = MaxX - v26;
  }
  else
  {
    double v24 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v28 = *MEMORY[0x1E4F1DB28];
  }
  double v36 = v24 + v28;
  double v37 = v15 + v17;
  double v38 = v26 - (v19 + v24);
  double v39 = v76 - (v17 + v18);
  if (v9 == 2)
  {
    v87.origin.x = v36;
    v87.origin.y = v15 + v17;
    v87.size.width = v38;
    v87.size.height = v76 - (v17 + v18);
    double v40 = CGRectGetMaxX(v87) - v84;
LABEL_13:
    double v41 = v80;
    goto LABEL_15;
  }
  double v41 = v80;
  double v40 = v82;
LABEL_15:
  double v42 = [(CKTranscriptStatusCell *)self statusButton];
  double v43 = v42;
  if (v42)
  {
    double v83 = v40;
    [v42 frame];
    double v45 = v44;
    double v47 = v46;
    [(CKTranscriptStatusCell *)self buttonAlignmentInsets];
    double v77 = v48;
    double v75 = v48 + v49;
    double v50 = v45 - (v48 + v49);
    double v81 = v51;
    double v53 = v51 + v52;
    if ([(CKTranscriptStatusCell *)self buttonAlignmentRelativeToContent]
      || v38 <= v50)
    {
      v89.origin.x = v36;
      v89.origin.y = v37;
      v89.size.width = v38;
      v89.size.height = v39;
      double MinX = CGRectGetMaxX(v89) - v50;
    }
    else
    {
      v88.origin.x = v36;
      v88.origin.y = v37;
      v88.size.width = v38;
      v88.size.height = v39;
      double MinX = CGRectGetMinX(v88);
    }
    double v56 = v47 - v53;
    if (MinX < v36 && v9 == 0) {
      double v58 = v36;
    }
    else {
      double v58 = MinX;
    }
    v59 = [(CKTranscriptLabelCell *)self attributedText];

    if (v59)
    {
      double v60 = v84;
      if (v9 == 2) {
        double v61 = v36;
      }
      else {
        double v61 = v83;
      }
      double v62 = v61;
      double v55 = v79;
      CGFloat v63 = v79;
      double v64 = v41;
      if (CGRectGetMaxX(*(CGRect *)(&v60 - 2)) + 6.0 <= v58)
      {
        double MinX = v58;
      }
      else if (v9)
      {
        if (v9 == 2) {
          double v61 = MinX - (v84 + 6.0);
        }
        else {
          double v61 = v83;
        }
      }
      else
      {
        v90.origin.x = v61;
        v90.origin.y = v79;
        v90.size.width = v84;
        v90.size.height = v41;
        double MinX = CGRectGetMaxX(v90) + 6.0;
      }
    }
    else
    {
      double MinX = v58;
      double v61 = v83;
      double v55 = v79;
    }
    objc_msgSend(v43, "setFrame:", MinX - v77, rect - v81, v75 + v50, v53 + v56);
    objc_msgSend(v43, "__ck_ensureMinimumTouchInsets");
    double v40 = v61;
  }
  else
  {
    double v55 = v79;
  }
  v65 = [(CKTranscriptStatusCell *)self traitCollection];
  [v65 displayScale];
  if (v66 == 0.0)
  {
    if (CKMainScreenScale_once_100 != -1) {
      dispatch_once(&CKMainScreenScale_once_100, &__block_literal_global_88_0);
    }
    double v67 = *(double *)&CKMainScreenScale_sMainScreenScale_100;
    double v68 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_100 == 0.0) {
      double v67 = 1.0;
    }
    double v69 = floor(v40 * v67) / v67;
    double v66 = *(double *)&CKMainScreenScale_sMainScreenScale_100;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_100 == 0.0) {
      double v66 = 1.0;
    }
    double v70 = *(double *)&CKMainScreenScale_sMainScreenScale_100;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_100 == 0.0) {
      double v70 = 1.0;
    }
    double v71 = ceil(v84 * v70) / v70;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_100 != 0.0) {
      double v68 = *(double *)&CKMainScreenScale_sMainScreenScale_100;
    }
  }
  else
  {
    double v69 = floor(v40 * v66) / v66;
    double v68 = v66;
    double v71 = ceil(v84 * v66) / v66;
  }
  double v72 = floor(v55 * v66) / v66;
  double v73 = ceil(v41 * v68) / v68;

  objc_msgSend(v3, "setFrame:", v69, v72, v71, v73);
}

- (UIEdgeInsets)buttonAlignmentInsets
{
  v2 = [(CKTranscriptStatusCell *)self statusButton];
  [v2 contentEdgeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)performInsertion:(id)a3
{
  id v4 = a3;
  double v5 = [(CKTranscriptLabelCell *)self label];
  double v6 = [(CKTranscriptStatusCell *)self statusButton];
  [(CKTranscriptStatusCell *)self layoutIfNeeded];
  CGAffineTransformMakeScale(&v31, 0.0, 0.0);
  [v5 setTransform:&v31];
  CGAffineTransformMakeScale(&v30, 0.0, 0.0);
  [v6 setTransform:&v30];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __43__CKTranscriptStatusCell_performInsertion___block_invoke;
  v27[3] = &unk_1E5620AF8;
  id v7 = v5;
  id v28 = v7;
  id v8 = v6;
  id v29 = v8;
  +[CKTranscriptStatusCell zoomAnimation:v27 completion:v4];

  double v9 = [v7 attributedText];
  if (![v9 length]) {
    goto LABEL_4;
  }
  double v10 = [v8 attributedTitleForState:0];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    [v7 center];
    double v13 = v12;
    uint64_t v15 = v14;
    [v8 center];
    uint64_t v17 = v16;
    double v19 = v18;
    objc_msgSend(v7, "setCenter:");
    objc_msgSend(v8, "setCenter:", v13, v19);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __43__CKTranscriptStatusCell_performInsertion___block_invoke_2;
    v20[3] = &unk_1E56285E8;
    id v21 = v7;
    double v23 = v13;
    uint64_t v24 = v15;
    id v22 = v8;
    uint64_t v25 = v17;
    double v26 = v19;
    +[CKTranscriptStatusCell zoomAnimation:v20 completion:0];

    double v9 = v21;
LABEL_4:
  }
}

uint64_t __43__CKTranscriptStatusCell_performInsertion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v8 = *MEMORY[0x1E4F1DAB8];
  long long v6 = v8;
  long long v9 = v7;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v5 = v10;
  [v2 setTransform:&v8];
  double v3 = *(void **)(a1 + 40);
  long long v8 = v6;
  long long v9 = v7;
  long long v10 = v5;
  return [v3 setTransform:&v8];
}

uint64_t __43__CKTranscriptStatusCell_performInsertion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 64);
  double v4 = *(double *)(a1 + 72);

  return objc_msgSend(v2, "setCenter:", v3, v4);
}

- (void)performReload:(id)a3 completion:(id)a4
{
  id v21 = (void (**)(void))a3;
  id v6 = a4;
  long long v7 = [(CKTranscriptLabelCell *)self label];
  if (v7)
  {
    long long v8 = [(id)objc_opt_class() createStampLabelView];
    [(CKTranscriptStampCell *)self setStampTextView:v8];
  }
  long long v9 = [(CKTranscriptStatusCell *)self statusButton];
  if (v9)
  {
    long long v10 = [(id)objc_opt_class() statusButton];
    [(CKTranscriptStatusCell *)self setStatusButton:v10];
  }
  if (v21) {
    v21[2]();
  }
  [(CKTranscriptStatusCell *)self layoutIfNeeded];
  uint64_t v11 = [(CKTranscriptLabelCell *)self label];
  double v12 = [v7 attributedText];
  double v13 = [v11 attributedText];
  char v14 = [v12 isEqualToAttributedString:v13];

  if (v14)
  {
    uint64_t v15 = [v7 superview];
    [v15 addSubview:v11];

    [v7 removeFromSuperview];
  }
  else
  {
    [(id)objc_opt_class() transitionFromView:v7 toView:v11 duration:327680 options:v6 completion:0.5];

    id v6 = 0;
  }
  uint64_t v16 = [(CKTranscriptStatusCell *)self statusButton];
  uint64_t v17 = [v9 attributedTitleForState:0];
  double v18 = [v16 attributedTitleForState:0];
  char v19 = [v17 isEqualToAttributedString:v18];

  if (v19)
  {
    CGFloat v20 = [v9 superview];
    [v20 addSubview:v16];

    [v9 removeFromSuperview];
    if (!v6) {
      goto LABEL_15;
    }
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
  else
  {
    [(id)objc_opt_class() transitionFromView:v9 toView:v16 duration:327680 options:v6 completion:0.5];
  }

LABEL_15:
}

- (void)performRemoval:(id)a3
{
  id v4 = a3;
  long long v5 = [(CKTranscriptLabelCell *)self label];
  id v6 = [(CKTranscriptStatusCell *)self statusButton];
  long long v7 = (void *)MEMORY[0x1E4F42FF0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __41__CKTranscriptStatusCell_performRemoval___block_invoke;
  v15[3] = &unk_1E5620AF8;
  id v16 = v5;
  id v17 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__CKTranscriptStatusCell_performRemoval___block_invoke_2;
  v11[3] = &unk_1E56277A8;
  id v12 = v16;
  id v13 = v17;
  id v14 = v4;
  id v8 = v4;
  id v9 = v17;
  id v10 = v16;
  [v7 animateWithDuration:327680 delay:v15 options:v11 animations:0.25 completion:0.0];
}

uint64_t __41__CKTranscriptStatusCell_performRemoval___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

uint64_t __41__CKTranscriptStatusCell_performRemoval___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(a1 + 40) setAlpha:1.0];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setAttributedButtonText:(id)a3
{
  id v20 = a3;
  id v4 = [(CKTranscriptStatusCell *)self attributedButtonText];

  long long v5 = v20;
  if (v4 == v20) {
    goto LABEL_13;
  }
  id v6 = [(CKTranscriptStatusCell *)self attributedButtonText];
  long long v7 = [v6 string];
  id v8 = [v20 string];
  char v9 = [v7 isEqualToString:v8];

  long long v5 = v20;
  if (v9) {
    goto LABEL_13;
  }
  id v10 = [(CKTranscriptStatusCell *)self statusButton];
  uint64_t v11 = v20;
  if (!v20)
  {
    [v10 removeFromSuperview];
    [(CKTranscriptStatusCell *)self setStatusButton:0];
    uint64_t v12 = 0;
    goto LABEL_7;
  }
  if (!v10)
  {
    uint64_t v12 = [(id)objc_opt_class() statusButton];
    [(CKTranscriptStatusCell *)self setStatusButton:v12];
    id v10 = [(CKEditableCollectionViewCell *)self contentView];
    [v10 addSubview:v12];
LABEL_7:

    id v10 = (void *)v12;
    uint64_t v11 = v20;
  }
  id v13 = v11;
  if ([(CKTranscriptCell *)self shouldConfigureForDarkFSM])
  {
    id v14 = +[CKUIBehavior sharedBehaviors];
    uint64_t v15 = [v14 theme];
    id v16 = [v15 balloonColorsForColorType:0xFFFFFFFFLL];
    id v17 = [v16 lastObject];

    double v18 = (void *)[v13 mutableCopy];
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v17, 0, objc_msgSend(v18, "length"));
    uint64_t v19 = [v18 copy];

    id v13 = (id)v19;
  }
  [v10 setAttributedTitle:v13 forState:0];
  if (v10)
  {
    [(CKTranscriptStatusCell *)self setNeedsLayout];
    [(CKTranscriptStatusCell *)self layoutIfNeeded];
  }

  long long v5 = v20;
LABEL_13:
}

- (NSAttributedString)attributedButtonText
{
  v2 = [(CKTranscriptStatusCell *)self statusButton];
  double v3 = [v2 attributedTitleForState:0];

  return (NSAttributedString *)v3;
}

- (void)setPrevBalloonWidth:(double)a3
{
  if (self->_prevBalloonWidth != a3)
  {
    self->_prevBalloonWidth = a3;
    [(CKTranscriptStatusCell *)self setNeedsLayout];
    [(CKTranscriptStatusCell *)self layoutIfNeeded];
  }
}

- (void)addFilter:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptStatusCell;
  id v4 = a3;
  [(CKTranscriptStampCell *)&v12 addFilter:v4];
  long long v5 = [(CKTranscriptStatusCell *)self statusButton];
  id v6 = [v5 layer];
  [v6 setAllowsGroupBlending:0];

  long long v7 = [v5 layer];
  [v7 setAllowsGroupOpacity:0];

  id v8 = [v5 layer];
  char v9 = [v4 textCompositingFilter];
  [v8 setCompositingFilter:v9];

  [v4 contentAlpha];
  double v11 = v10;

  [v5 setAlpha:v11];
}

- (void)clearFilters
{
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptStatusCell;
  [(CKTranscriptStampCell *)&v7 clearFilters];
  double v3 = [(CKTranscriptStatusCell *)self statusButton];
  id v4 = [v3 layer];
  [v4 setAllowsGroupBlending:1];

  long long v5 = [v3 layer];
  [v5 setAllowsGroupOpacity:1];

  id v6 = [v3 layer];
  [v6 setCompositingFilter:0];

  [v3 setAlpha:1.0];
}

+ (id)statusButton
{
  v2 = [MEMORY[0x1E4F427E8] borderlessButtonConfiguration];
  objc_msgSend(v2, "setContentInsets:", *MEMORY[0x1E4F424F0], *(double *)(MEMORY[0x1E4F424F0] + 8), *(double *)(MEMORY[0x1E4F424F0] + 16), *(double *)(MEMORY[0x1E4F424F0] + 24));
  double v3 = [MEMORY[0x1E4F427E0] buttonWithConfiguration:v2 primaryAction:0];
  [v3 setConfigurationUpdateHandler:&__block_literal_global_263];
  [v3 setEnabled:CKIsRunningInMessagesNotificationExtension() == 0];

  return v3;
}

void __38__CKTranscriptStatusCell_statusButton__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [v2 traitCollection];
  uint64_t v4 = qword_18F81D950[[v3 userInterfaceStyle] == 2];

  long long v5 = (void *)MEMORY[0x1E4F42FF0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CKTranscriptStatusCell_statusButton__block_invoke_2;
  v7[3] = &unk_1E5622950;
  id v8 = v2;
  uint64_t v9 = v4;
  id v6 = v2;
  [v5 animateWithDuration:327684 delay:v7 options:0 animations:0.2 completion:0.0];
}

uint64_t __38__CKTranscriptStatusCell_statusButton__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isHighlighted];
  double v3 = 1.0;
  if (v2) {
    double v3 = *(double *)(a1 + 40);
  }
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 setAlpha:v3];
}

+ (void)zoomAnimation:(id)a3 completion:(id)a4
{
}

+ (void)transitionFromView:(id)a3 toView:(id)a4 duration:(double)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  double v13 = a5 * 0.5;
  id v14 = a7;
  uint64_t v15 = [v11 superview];
  [v15 addSubview:v12];

  [v12 setAlpha:0.0];
  id v16 = (void *)MEMORY[0x1E4F42FF0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __80__CKTranscriptStatusCell_transitionFromView_toView_duration_options_completion___block_invoke;
  v24[3] = &unk_1E5620C40;
  id v25 = v11;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__CKTranscriptStatusCell_transitionFromView_toView_duration_options_completion___block_invoke_2;
  v22[3] = &unk_1E5620BF0;
  id v23 = v25;
  id v17 = v25;
  [v16 animateWithDuration:a6 delay:v24 options:v22 animations:v13 completion:0.0];
  double v18 = (void *)MEMORY[0x1E4F42FF0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80__CKTranscriptStatusCell_transitionFromView_toView_duration_options_completion___block_invoke_3;
  v20[3] = &unk_1E5620C40;
  id v21 = v12;
  id v19 = v12;
  [v18 animateWithDuration:a6 delay:v20 options:v14 animations:v13 completion:v13];
}

uint64_t __80__CKTranscriptStatusCell_transitionFromView_toView_duration_options_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __80__CKTranscriptStatusCell_transitionFromView_toView_duration_options_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __80__CKTranscriptStatusCell_transitionFromView_toView_duration_options_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (BOOL)wantsDrawerLayout
{
  return 1;
}

- (UIButton)statusButton
{
  return self->_statusButton;
}

- (void)setStatusButton:(id)a3
{
}

- (char)buttonAlignmentRelativeToContent
{
  return self->_buttonAlignmentRelativeToContent;
}

- (void)setButtonAlignmentRelativeToContent:(char)a3
{
  self->_buttonAlignmentRelativeToContent = a3;
}

- (double)prevBalloonWidth
{
  return self->_prevBalloonWidth;
}

- (void).cxx_destruct
{
}

@end