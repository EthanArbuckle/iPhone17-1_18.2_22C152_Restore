@interface CKOrganicTranscriptBalloonCell
- (CKOrganicImageLayoutRecipe)layoutRecipe;
- (double)layoutOffset;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)setLayoutRecipe:(id)a3;
@end

@implementation CKOrganicTranscriptBalloonCell

- (double)layoutOffset
{
  v2 = [(CKOrganicTranscriptBalloonCell *)self layoutRecipe];
  [v2 offset];
  double v4 = v3;

  return v4;
}

- (void)layoutSubviewsForAlignmentContents
{
  v30.receiver = self;
  v30.super_class = (Class)CKOrganicTranscriptBalloonCell;
  [(CKTranscriptBalloonCell *)&v30 layoutSubviewsForAlignmentContents];
  uint64_t v3 = [(CKTranscriptBalloonCell *)self quickActionButton];
  if (v3)
  {
    double v4 = (void *)v3;
    v5 = [(CKOrganicTranscriptBalloonCell *)self layoutRecipe];
    v6 = [v5 relativeGroupCenter];

    if (v6)
    {
      v7 = [(CKOrganicTranscriptBalloonCell *)self layoutRecipe];
      v8 = [v7 relativeGroupCenter];
      [v8 doubleValue];
      double v10 = v9;

      v11 = [(CKOrganicTranscriptBalloonCell *)self layoutRecipe];
      v12 = [v11 groupMaxX];
      [v12 doubleValue];
      double v14 = v13;

      v15 = [(CKTranscriptBalloonCell *)self quickActionButton];
      [v15 frame];
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      double v21 = v20;
      double v23 = v22;

      v31.origin.x = v17;
      v31.origin.y = v19;
      v31.size.width = v21;
      v31.size.height = v23;
      double v24 = v10 + CGRectGetHeight(v31) * -0.5;
      [(CKEditableCollectionViewCell *)self contentAlignmentRect];
      double v25 = v14 + CGRectGetMinX(v32);
      v26 = +[CKUIBehavior sharedBehaviors];
      [v26 transcriptQuickActionButtonHorizontalSpacing];
      double v28 = v25 + v27;

      v29 = [(CKTranscriptBalloonCell *)self quickActionButton];
      objc_msgSend(v29, "setFrame:", v28, v24, v21, v23);
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(CKTranscriptBalloonCell *)self quickActionButton];
  [v8 frame];
  v20.double x = x;
  v20.double y = y;
  BOOL v9 = CGRectContainsPoint(v21, v20);

  if (v9)
  {
    double v10 = [(CKTranscriptBalloonCell *)self quickActionButton];
    -[CKOrganicTranscriptBalloonCell convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
    double v12 = v11;
    double v14 = v13;

    v15 = [(CKTranscriptBalloonCell *)self quickActionButton];
    double v16 = objc_msgSend(v15, "hitTest:withEvent:", v7, v12, v14);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CKOrganicTranscriptBalloonCell;
    double v16 = -[CKOrganicTranscriptBalloonCell hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
  }

  return v16;
}

- (CKOrganicImageLayoutRecipe)layoutRecipe
{
  return self->_layoutRecipe;
}

- (void)setLayoutRecipe:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKOrganicTranscriptBalloonCell;
  id v12 = a3;
  [(CKTranscriptBalloonCell *)&v14 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  double v13 = objc_msgSend(v12, "layoutRecipe", v14.receiver, v14.super_class);

  [(CKOrganicTranscriptBalloonCell *)self setLayoutRecipe:v13];
}

@end