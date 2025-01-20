@interface CKTranscriptPhotoStackCell
- (BOOL)allowsSwipeToReply;
- (CKTranscriptPhotoStackCellDelegate)delegate;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)handlePinchGesture:(id)a3;
- (void)layoutSubviews;
- (void)layoutSubviewsForAlignmentContents;
- (void)setDelegate:(id)a3;
- (void)setPinchGestureRecognizer:(id)a3;
- (void)setWantsContactImageLayout:(BOOL)a3;
@end

@implementation CKTranscriptPhotoStackCell

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptPhotoStackCell;
  [(CKTranscriptCell *)&v7 layoutSubviews];
  v3 = [(CKTranscriptPhotoStackCell *)self photoStackBalloonView];
  objc_msgSend(v3, "setWantsContactImageLayout:", -[CKTranscriptMessageCell wantsContactImageLayout](self, "wantsContactImageLayout"));

  v4 = [(CKTranscriptPhotoStackCell *)self pinchGestureRecognizer];

  if (!v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F42C80]) initWithTarget:self action:sel_handlePinchGesture_];
    [(CKTranscriptPhotoStackCell *)self setPinchGestureRecognizer:v5];

    v6 = [(CKTranscriptPhotoStackCell *)self pinchGestureRecognizer];
    [(CKTranscriptPhotoStackCell *)self addGestureRecognizer:v6];
  }
}

- (void)layoutSubviewsForAlignmentContents
{
  *(void *)&recta.origin.y = self;
  *(void *)&recta.size.width = CKTranscriptPhotoStackCell;
  [(CGFloat *)(objc_super *)&recta.origin.y layoutSubviewsForAlignmentContents];
  v3 = [(CKTranscriptPhotoStackCell *)self photoStackBalloonView];
  int v4 = [(CKEditableCollectionViewCell *)self orientation];
  BOOL v5 = [(CKTranscriptMessageCell *)self wantsContactImageLayout];
  [v3 frame];
  recta.origin.x = v6;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_msgSend(v3, "horizontalContentMarginForSize:", v9, v11);
  double v14 = v13;
  if (v5) {
    double v15 = 7.0;
  }
  else {
    double v15 = 25.0;
  }
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double MinX = CGRectGetMinX(v47);
  [(CKTranscriptPhotoStackCell *)self bounds];
  double MaxX = CGRectGetMaxX(v48);
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double v18 = MaxX - CGRectGetMaxX(v49);
  if (v4)
  {
    [(CKTranscriptPhotoStackCell *)self bounds];
    double Width = CGRectGetWidth(v50);
    v51.origin.x = recta.origin.x;
    v51.origin.y = v8;
    v51.size.width = v10;
    v51.size.height = v12;
    double v20 = v14 + Width - CGRectGetWidth(v51) - v15 - v18;
  }
  else
  {
    double v20 = v15 + MinX - v14;
  }
  objc_msgSend(v3, "setFrame:", v20, v8, v10, v12);
  if (!v5)
  {
    if (v4)
    {
      if (v4 != 2) {
        goto LABEL_13;
      }
      [(CKEditableCollectionViewCell *)self contentInsets];
      double v22 = v18 - v21;
      v52.origin.x = v20;
      v52.origin.y = v8;
      v52.size.width = v10;
      v52.size.height = v12;
      CGFloat v23 = CGRectGetMaxX(v52) - v14;
      [(CKTranscriptPhotoStackCell *)self frame];
      double v24 = CGRectGetWidth(v53) - v23 - v22;
      v25 = v3;
      uint64_t v26 = 1;
    }
    else
    {
      [(CKEditableCollectionViewCell *)self contentInsets];
      double v24 = v14 + v20 - (MinX - v27);
      v25 = v3;
      uint64_t v26 = 0;
    }
    [v25 setHorizontalContentMarginAdjustment:v26 edge:v24];
  }
LABEL_13:
  v28 = [(CKTranscriptBalloonCell *)self quickActionButton];

  if (v28)
  {
    CGFloat v29 = v8;
    v30 = [(CKTranscriptBalloonCell *)self quickActionButton];
    [v30 frame];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;

    if ([(CKEditableCollectionViewCell *)self orientation])
    {
      if ([(CKEditableCollectionViewCell *)self orientation] != 2)
      {
LABEL_19:
        v45 = [(CKTranscriptBalloonCell *)self quickActionButton];
        objc_msgSend(v45, "setFrame:", v32, v34, v36, v38);

        goto LABEL_20;
      }
      v39 = +[CKUIBehavior sharedBehaviors];
      [v39 transcriptQuickActionButtonHorizontalSpacing];
      double v41 = v20 - v36 - v40;
      double v42 = 17.0;
    }
    else
    {
      v54.origin.x = v20;
      v54.origin.y = v29;
      v54.size.width = v10;
      v54.size.height = v12;
      double v43 = CGRectGetMaxX(v54);
      v39 = +[CKUIBehavior sharedBehaviors];
      [v39 transcriptQuickActionButtonHorizontalSpacing];
      double v41 = v43 + v44;
      double v42 = -17.0;
    }
    double v32 = v41 + v42;

    goto LABEL_19;
  }
LABEL_20:
}

- (void)setWantsContactImageLayout:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKTranscriptMessageCell *)self wantsContactImageLayout] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CKTranscriptPhotoStackCell;
    [(CKTranscriptMessageCell *)&v6 setWantsContactImageLayout:v3];
    BOOL v5 = [(CKTranscriptPhotoStackCell *)self photoStackBalloonView];
    [v5 setWantsContactImageLayout:v3];
  }
}

- (void)handlePinchGesture:(id)a3
{
  id v6 = a3;
  if ([v6 state] == 2)
  {
    [v6 scale];
    if (v4 > 1.5)
    {
      BOOL v5 = [(CKTranscriptPhotoStackCell *)self delegate];
      [v5 didPinchPhotoStackCell:self];
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(CKTranscriptMessageCell *)self failureButton];
  if (v8
    && (-[CKTranscriptPhotoStackCell convertPoint:toView:](self, "convertPoint:toView:", v8, x, y),
        CGFloat v10 = v9,
        CGFloat v12 = v11,
        [v8 bounds],
        v18.double x = v10,
        v18.double y = v12,
        CGRectContainsPoint(v19, v18)))
  {
    id v13 = v8;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CKTranscriptPhotoStackCell;
    -[CKTranscriptPhotoStackCell hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v14 = v13;

  return v14;
}

- (BOOL)allowsSwipeToReply
{
  return 0;
}

- (CKTranscriptPhotoStackCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKTranscriptPhotoStackCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setPinchGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end