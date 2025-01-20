@interface CKTranscriptMessageContentCell
- (BOOL)drawerTextChanged;
- (BOOL)drawerWasVisible;
- (CGRect)drawerLabelFrame;
- (CGRect)messageDisplayViewFrame:(CGRect)a3 inContainerFrame:(CGRect)a4;
- (CGSize)drawerTextSize;
- (CGSize)messageDisplayViewRequestedSize;
- (CKTranscriptMessageContentCell)initWithFrame:(CGRect)a3;
- (NSAttributedString)drawerText;
- (UILabel)drawerLabel;
- (UIView)messageDisplayView;
- (double)layoutOffset;
- (double)swipeToReplyLayoutOffset;
- (id)messageDisplayViewLayoutAttributesForMessageDisplayViewFrame:(CGRect)a3 inContainerFrame:(CGRect)a4;
- (int64_t)animationPauseReasons;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)layoutSubviewsForDrawer;
- (void)setAnimationPauseReasons:(int64_t)a3;
- (void)setDrawerLabel:(id)a3;
- (void)setDrawerText:(id)a3;
- (void)setDrawerTextChanged:(BOOL)a3;
- (void)setDrawerTextSize:(CGSize)a3;
- (void)setDrawerWasVisible:(BOOL)a3;
- (void)setMessageDisplayViewRequestedSize:(CGSize)a3;
@end

@implementation CKTranscriptMessageContentCell

- (CKTranscriptMessageContentCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptMessageContentCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    drawerLabel = v3->_drawerLabel;
    v3->_drawerLabel = (UILabel *)v5;
  }
  return v3;
}

- (void)layoutSubviewsForDrawer
{
  v44.receiver = self;
  v44.super_class = (Class)CKTranscriptMessageContentCell;
  [(CKTranscriptCell *)&v44 layoutSubviewsForDrawer];
  [(CKTranscriptCell *)self drawerPercentRevealed];
  double v4 = v3;
  uint64_t v5 = [(CKTranscriptMessageContentCell *)self drawerLabel];
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  v12 = +[CKUIBehavior sharedBehaviors];
  if ((v4 != 0.0) != [(CKTranscriptMessageContentCell *)self drawerWasVisible])
  {
    if (v4 == 0.0) {
      [v5 removeFromSuperview];
    }
    else {
      [(CKTranscriptMessageContentCell *)self addSubview:v5];
    }
    [(CKTranscriptMessageContentCell *)self setDrawerWasVisible:v4 != 0.0];
  }
  BOOL v13 = [(CKTranscriptMessageContentCell *)self drawerTextChanged];
  if (v4 != 0.0 && v13)
  {
    v14 = [(CKTranscriptMessageContentCell *)self drawerText];
    [v5 setAttributedText:v14];
    [v14 size];
    double v16 = v15;
    double v18 = v17;
    if (CKMainScreenScale_once_16 != -1) {
      dispatch_once(&CKMainScreenScale_once_16, &__block_literal_global_43);
    }
    double v19 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_16 != 0.0) {
      double v19 = *(double *)&CKMainScreenScale_sMainScreenScale_16;
    }
    -[CKTranscriptMessageContentCell setDrawerTextSize:](self, "setDrawerTextSize:", ceil(v16 * v19) / v19, ceil(v18 * v19) / v19);
    [(CKTranscriptMessageContentCell *)self setDrawerTextChanged:0];
  }
  v41[1] = v9;
  uint64_t v43 = v11;
  [(CKTranscriptMessageContentCell *)self drawerTextSize];
  double v42 = v20;
  [(CKTranscriptMessageContentCell *)self willLayoutDrawerLabelFrame:v41];
  [(CKEditableCollectionViewCell *)self marginInsets];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  [(CKTranscriptMessageCell *)self safeAreaInsets];
  double v30 = v22 + v29;
  double v34 = v28 + v33;
  objc_msgSend(v12, "transcriptDrawerWidthForMarginInsets:", v30, v24 + v31, v26 + v32, v28 + v33);
  double v36 = v35;
  if ([(CKEditableCollectionViewCell *)self wantsDrawerLayout])
  {
    [(CKTranscriptMessageContentCell *)self bounds];
    double v38 = v37 - v4 * v36;
  }
  else
  {
    double v39 = (v34 - v42) * -0.5;
    [(CKTranscriptMessageContentCell *)self bounds];
    double v38 = v40 - v4 * (v34 + v39);
  }
  [v5 setFrame:v38 - (v42 - (v36 - v34))];
}

- (void)layoutSubviewsForAlignmentContents
{
  v45.receiver = self;
  v45.super_class = (Class)CKTranscriptMessageContentCell;
  [(CKEditableCollectionViewCell *)&v45 layoutSubviewsForAlignmentContents];
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double v3 = [(CKTranscriptMessageContentCell *)self messageDisplayView];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  double v4 = [(CKTranscriptMessageContentCell *)self messageDisplayView];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 transform];
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v42 = 0u;
  }

  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v41[0] = *MEMORY[0x1E4F1DAB8];
  v41[1] = v6;
  void v41[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v41];
  [v3 frame];
  -[CKTranscriptMessageContentCell messageDisplayViewFrame:inContainerFrame:](self, "messageDisplayViewFrame:inContainerFrame:");
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  objc_msgSend(v3, "setFrame:");
  v40[0] = v42;
  v40[1] = v43;
  v40[2] = v44;
  [v3 setTransform:v40];
  if (![(CKEditableCollectionViewCell *)self orientation])
  {
    double v15 = +[CKUIBehavior sharedBehaviors];
    [(CKTranscriptCell *)self drawerPercentRevealed];
    double v17 = v16;
    if ([v15 timestampsPushBalloons])
    {
      if (v17 > 0.0)
      {
        [(CKTranscriptMessageContentCell *)self drawerLabelFrame];
        [(CKEditableCollectionViewCell *)self marginInsets];
        double v39 = v17;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        objc_msgSend(v15, "transcriptDrawerWidthForMarginInsets:");
        double v37 = v26;
        [(CKTranscriptMessageContentCell *)self bounds];
        double v38 = v27 - v37;
        objc_msgSend(v15, "transcriptDrawerOverlapForMarginInsets:", v19, v21, v23, v25);
        double v29 = v28 - v25 + v38;
        v46.origin.x = v8;
        v46.origin.y = v10;
        v46.size.width = v12;
        v46.size.height = v14;
        double MaxX = CGRectGetMaxX(v46);
        if (MaxX > v29)
        {
          double v31 = MaxX;
          double v32 = [(CKEditableCollectionViewCell *)self contentView];
          [v32 frame];
          [v32 setFrame:-((v31 - v29) * v39)];
        }
      }
    }
  }
  if ([(CKTranscriptMessageCell *)self wantsContactImageLayout])
  {
    double v33 = 1.0;
    if ([(CKTranscriptMessageCell *)self isReplyContextPreview])
    {
      double v34 = +[CKUIBehavior sharedBehaviors];
      [v34 transcriptReplyPreviewContextContactAlpha];
      double v33 = v35;
    }
    double v36 = [(CKPhoneTranscriptMessageCell *)self contactImageView];
    [v36 setAlpha:v33];
  }
}

- (CGRect)messageDisplayViewFrame:(CGRect)a3 inContainerFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  CGFloat v43 = a3.size.width;
  CGFloat v44 = a3.size.height;
  double v9 = [(CKTranscriptMessageContentCell *)self messageDisplayViewLayoutAttributesForMessageDisplayViewFrame:a3.origin.x inContainerFrame:a3.origin.y];
  [v9 size];
  double v11 = v10;
  if ([(CKEditableCollectionViewCell *)self orientation])
  {
    v50.origin.double x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    double v12 = CGRectGetMaxX(v50) - v11;
  }
  else
  {
    double v12 = x;
  }
  [(CKEditableCollectionViewCell *)self associatedItemOffset];
  if (v13 != 0.0)
  {
    [(CKEditableCollectionViewCell *)self associatedItemOffset];
    double v15 = v12 + v14;
    if ([(CKEditableCollectionViewCell *)self orientation])
    {
      v51.origin.double x = x;
      v51.origin.CGFloat y = y;
      v51.size.CGFloat width = width;
      v51.size.CGFloat height = height;
      double v16 = CGRectGetMaxX(v51) - v11;
      if (v16 >= v15) {
        double v12 = v15;
      }
      else {
        double v12 = v16;
      }
    }
    else if (x >= v15)
    {
      double v12 = x;
    }
    else
    {
      double v12 = v15;
    }
  }
  [(CKTranscriptMessageContentCell *)self layoutOffset];
  if (v17 != 0.0)
  {
    [(CKTranscriptMessageContentCell *)self layoutOffset];
    double v19 = v18;
    if ([(CKEditableCollectionViewCell *)self orientation])
    {
      double v20 = v12 - v19;
      v52.origin.double x = x;
      v52.origin.CGFloat y = y;
      v52.size.CGFloat width = width;
      v52.size.CGFloat height = height;
      double v21 = CGRectGetMaxX(v52) - v11;
      double v12 = v21 >= v20 ? v20 : v21;
    }
    else
    {
      double v12 = x >= v12 + v19 ? x : v12 + v19;
    }
    if (IMOSLoggingEnabled())
    {
      double v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        [(CKTranscriptMessageContentCell *)self layoutOffset];
        *(_DWORD *)buf = 138412546;
        CGRect v46 = self;
        __int16 v47 = 2048;
        uint64_t v48 = v23;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "cell: %@, found non-zero layout offset: %f", buf, 0x16u);
      }
    }
  }
  [(CKTranscriptMessageContentCell *)self swipeToReplyLayoutOffset];
  if (v24 != 0.0)
  {
    [(CKTranscriptMessageContentCell *)self swipeToReplyLayoutOffset];
    double v26 = v12 + v25;
    double v12 = x >= v26 ? x : v26;
    if (IMOSLoggingEnabled())
    {
      double v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        [(CKTranscriptMessageContentCell *)self swipeToReplyLayoutOffset];
        *(_DWORD *)buf = 138412546;
        CGRect v46 = self;
        __int16 v47 = 2048;
        uint64_t v48 = v28;
        _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Swipe to reply is active on view: %@, updating with reply layout offset: %f", buf, 0x16u);
      }
    }
  }
  int v29 = [v9 wantsFrameClamping];
  CGFloat v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v29)
  {
    if ([(CKEditableCollectionViewCell *)self orientation])
    {
      if (v12 < x) {
        double v12 = v12 + x - v12;
      }
    }
    else
    {
      v53.origin.double x = v12;
      v53.origin.CGFloat y = v30;
      v53.size.CGFloat width = v43;
      v53.size.CGFloat height = v44;
      double MaxX = CGRectGetMaxX(v53);
      v54.origin.double x = x;
      v54.origin.CGFloat y = y;
      v54.size.CGFloat width = width;
      v54.size.CGFloat height = height;
      if (MaxX > CGRectGetMaxX(v54))
      {
        v55.origin.double x = v12;
        v55.origin.CGFloat y = v30;
        v55.size.CGFloat width = v43;
        v55.size.CGFloat height = v44;
        double v32 = CGRectGetMaxX(v55);
        v56.origin.double x = x;
        v56.origin.CGFloat y = y;
        v56.size.CGFloat width = width;
        v56.size.CGFloat height = height;
        double v12 = v12 - (v32 - CGRectGetMaxX(v56));
      }
    }
  }
  double v33 = [(CKTranscriptMessageContentCell *)self traitCollection];
  [v33 displayScale];
  double v35 = v34;
  if (v34 == 0.0)
  {
    if (CKMainScreenScale_once_16 != -1) {
      dispatch_once(&CKMainScreenScale_once_16, &__block_literal_global_43);
    }
    if (*(double *)&CKMainScreenScale_sMainScreenScale_16 == 0.0) {
      double v35 = 1.0;
    }
    else {
      double v35 = *(double *)&CKMainScreenScale_sMainScreenScale_16;
    }
  }

  double v36 = [(CKTranscriptMessageContentCell *)self traitCollection];
  [v36 displayScale];
  double v38 = v37;
  if (v37 == 0.0)
  {
    if (CKMainScreenScale_once_16 != -1) {
      dispatch_once(&CKMainScreenScale_once_16, &__block_literal_global_43);
    }
    if (*(double *)&CKMainScreenScale_sMainScreenScale_16 == 0.0) {
      double v38 = 1.0;
    }
    else {
      double v38 = *(double *)&CKMainScreenScale_sMainScreenScale_16;
    }
  }

  double v39 = floor(v12 * v35) / v35;
  double v40 = ceil(v11 * v38) / v38;
  double v41 = v30;
  double v42 = v44;
  result.size.CGFloat height = v42;
  result.size.CGFloat width = v40;
  result.origin.CGFloat y = v41;
  result.origin.double x = v39;
  return result;
}

- (id)messageDisplayViewLayoutAttributesForMessageDisplayViewFrame:(CGRect)a3 inContainerFrame:(CGRect)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(CKTranscriptMessageContentCell *)self swipeToReplyLayoutOffset];
  double v7 = -[CKMessageDisplayViewLayoutAttributes initWithSize:wantsFrameClamping:]([_TtC7ChatKit36CKMessageDisplayViewLayoutAttributes alloc], "initWithSize:wantsFrameClamping:", v6 == 0.0, width, height);

  return v7;
}

- (CGRect)drawerLabelFrame
{
  v2 = [(CKTranscriptMessageContentCell *)self drawerLabel];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.CGFloat y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setDrawerText:(id)a3
{
  double v4 = (NSAttributedString *)a3;
  if (self->_drawerText != v4)
  {
    double v6 = v4;
    double v5 = (NSAttributedString *)[(NSAttributedString *)v4 copy];

    objc_storeStrong((id *)&self->_drawerText, v5);
    [(CKTranscriptMessageContentCell *)self setDrawerTextChanged:1];
    [(CKTranscriptMessageContentCell *)self setNeedsLayout];
    double v4 = v5;
  }
}

- (UIView)messageDisplayView
{
  return 0;
}

- (double)layoutOffset
{
  return 0.0;
}

- (double)swipeToReplyLayoutOffset
{
  return 0.0;
}

- (NSAttributedString)drawerText
{
  return self->_drawerText;
}

- (CGSize)messageDisplayViewRequestedSize
{
  double width = self->_messageDisplayViewRequestedSize.width;
  double height = self->_messageDisplayViewRequestedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMessageDisplayViewRequestedSize:(CGSize)a3
{
  self->_messageDisplayViewRequestedSize = a3;
}

- (int64_t)animationPauseReasons
{
  return self->_animationPauseReasons;
}

- (void)setAnimationPauseReasons:(int64_t)a3
{
  self->_animationPauseReasons = a3;
}

- (UILabel)drawerLabel
{
  return self->_drawerLabel;
}

- (void)setDrawerLabel:(id)a3
{
}

- (BOOL)drawerWasVisible
{
  return self->_drawerWasVisible;
}

- (void)setDrawerWasVisible:(BOOL)a3
{
  self->_drawerWasVisible = a3;
}

- (BOOL)drawerTextChanged
{
  return self->_drawerTextChanged;
}

- (void)setDrawerTextChanged:(BOOL)a3
{
  self->_drawerTextChanged = a3;
}

- (CGSize)drawerTextSize
{
  double width = self->_drawerTextSize.width;
  double height = self->_drawerTextSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDrawerTextSize:(CGSize)a3
{
  self->_drawerTextSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawerLabel, 0);

  objc_storeStrong((id *)&self->_drawerText, 0);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKTranscriptMessageContentCell;
  id v12 = a3;
  [(CKTranscriptCell *)&v15 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  double v13 = objc_msgSend(v12, "transcriptDrawerText", v15.receiver, v15.super_class);
  [(CKTranscriptMessageContentCell *)self setDrawerText:v13];

  [v12 size];
  -[CKTranscriptMessageContentCell setMessageDisplayViewRequestedSize:](self, "setMessageDisplayViewRequestedSize:");
  -[CKTranscriptMessageCell setIsReply:](self, "setIsReply:", [v12 itemIsReply]);
  -[CKTranscriptMessageCell setIsReplyContextPreview:](self, "setIsReplyContextPreview:", [v12 itemIsReplyContextPreview]);
  double v14 = [v12 IMChatItem];

  -[CKTranscriptMessageCell setIsFromMe:](self, "setIsFromMe:", [v14 isFromMe]);
}

@end