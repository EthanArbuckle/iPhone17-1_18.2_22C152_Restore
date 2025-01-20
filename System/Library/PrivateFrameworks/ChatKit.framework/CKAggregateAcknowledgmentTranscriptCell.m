@interface CKAggregateAcknowledgmentTranscriptCell
- (BOOL)parentMessageIsFromMe;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)performInsertion:(id)a3;
- (void)performInsertion:(id)a3 animated:(BOOL)a4;
- (void)prepareForReuse;
- (void)setParentMessageIsFromMe:(BOOL)a3;
@end

@implementation CKAggregateAcknowledgmentTranscriptCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKAggregateAcknowledgmentTranscriptCell;
  id v12 = a3;
  [(CKAssociatedMessageTranscriptCell *)&v14 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  v13 = CKBalloonViewForClass((objc_class *)objc_msgSend(v12, "balloonViewClass", v14.receiver, v14.super_class));
  [(CKAggregateAcknowledgmentTranscriptCell *)self setBalloonView:v13];
  [v13 configureForAggregateAcknowledgmentChatItem:v12];
}

- (void)layoutSubviewsForAlignmentContents
{
  v57.receiver = self;
  v57.super_class = (Class)CKAggregateAcknowledgmentTranscriptCell;
  [(CKAssociatedMessageTranscriptCell *)&v57 layoutSubviewsForAlignmentContents];
  v3 = [(CKAggregateAcknowledgmentTranscriptCell *)self balloonView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = +[CKUIBehavior sharedBehaviors];
  [v12 messageAcknowledgmentTranscriptBalloonRelativePosition];
  double v14 = v13;

  v15 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v16 = [v15 isEmojiTapbacksEnabled];

  if (v16)
  {
    v17 = +[CKUIBehavior sharedBehaviors];
    int v18 = [v17 usesFannedBubbleStyle];

    if (v18)
    {
      +[CKTapbackPileTemplate topOfPileBubbleRadius];
      double v14 = v9 - v19;
    }
  }
  [(CKAssociatedMessageTranscriptCell *)self parentSize];
  double v21 = v20;
  if ([(CKEditableCollectionViewCell *)self orientation])
  {
    if ([(CKEditableCollectionViewCell *)self orientation] == 2) {
      double v22 = v14 + v5 - v21;
    }
    else {
      double v22 = v5;
    }
  }
  else
  {
    double v22 = v5 + v21 - v14;
  }
  [(CKAssociatedMessageTranscriptCell *)self parentRotationOffset];
  double v24 = v22 + v23;
  [(CKAssociatedMessageTranscriptCell *)self cumulativeAssociatedOffset];
  if (v25 != 0.0)
  {
    [(CKAssociatedMessageTranscriptCell *)self cumulativeAssociatedOffset];
    double v24 = v24 + v26;
  }
  v27 = [(CKTranscriptMessageCell *)self failureButton];

  if (v27)
  {
    CGFloat v55 = v11;
    CGFloat v56 = v7;
    v28 = [(CKTranscriptMessageCell *)self failureButton];
    [v28 frame];
    double v30 = v29;
    CGFloat v32 = v31;
    double v34 = v33;
    double v36 = v35;

    if ([(CKEditableCollectionViewCell *)self orientation])
    {
      CGFloat v37 = v9;
      if ([(CKEditableCollectionViewCell *)self orientation] == 2)
      {
        v58.origin.x = v30;
        v58.origin.y = v32;
        v58.size.width = v34;
        v58.size.height = v36;
        double v30 = v24 - CGRectGetWidth(v58) + -1.0;
      }
      CGFloat v38 = v55;
      CGFloat v39 = v56;
    }
    else
    {
      v59.origin.x = v24;
      CGFloat v37 = v9;
      CGFloat v38 = v55;
      CGFloat v39 = v56;
      v59.origin.y = v56;
      v59.size.width = v37;
      v59.size.height = v55;
      double v30 = CGRectGetMaxX(v59) + 1.0;
    }
    v60.origin.x = v24;
    v60.origin.y = v39;
    v60.size.width = v37;
    v60.size.height = v38;
    double Height = CGRectGetHeight(v60);
    v61.origin.x = v30;
    v61.origin.y = v32;
    v61.size.width = v34;
    v61.size.height = v36;
    double v41 = (Height - CGRectGetHeight(v61)) * 0.5;
    double v9 = v37;
    if (CKMainScreenScale_once_69 != -1) {
      dispatch_once(&CKMainScreenScale_once_69, &__block_literal_global_176);
    }
    double v42 = *(double *)&CKMainScreenScale_sMainScreenScale_69;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_69 == 0.0) {
      double v42 = 1.0;
    }
    double v43 = round(v41 * v42) / v42;
    v44 = [(CKTranscriptMessageCell *)self failureButton];
    objc_msgSend(v44, "setFrame:", v30, v43, v34, v36);

    double v11 = v55;
    double v7 = v56;
  }
  v45 = [(CKAggregateAcknowledgmentTranscriptCell *)self traitCollection];
  [v45 displayScale];
  if (v46 == 0.0)
  {
    if (CKMainScreenScale_once_69 != -1) {
      dispatch_once(&CKMainScreenScale_once_69, &__block_literal_global_176);
    }
    double v47 = *(double *)&CKMainScreenScale_sMainScreenScale_69;
    double v48 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_69 == 0.0) {
      double v47 = 1.0;
    }
    double v49 = floor(v24 * v47) / v47;
    double v46 = *(double *)&CKMainScreenScale_sMainScreenScale_69;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_69 == 0.0) {
      double v46 = 1.0;
    }
    double v50 = *(double *)&CKMainScreenScale_sMainScreenScale_69;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_69 == 0.0) {
      double v50 = 1.0;
    }
    double v51 = ceil(v9 * v50) / v50;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_69 != 0.0) {
      double v48 = *(double *)&CKMainScreenScale_sMainScreenScale_69;
    }
  }
  else
  {
    double v49 = floor(v24 * v46) / v46;
    double v48 = v46;
    double v51 = ceil(v9 * v46) / v46;
  }
  double v52 = floor(v7 * v46) / v46;
  double v53 = ceil(v11 * v48) / v48;

  v54 = [(CKAggregateAcknowledgmentTranscriptCell *)self balloonView];
  objc_msgSend(v54, "setFrame:", v49, v52, v51, v53);
}

- (void)performInsertion:(id)a3
{
}

- (void)performInsertion:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [MEMORY[0x1E4F39CF8] flush];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:2.0];
  double v7 = [(CKAggregateAcknowledgmentTranscriptCell *)self balloonView];
  double v8 = [v7 layer];
  [v8 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v10 = v9;

  double v11 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v11 setFromValue:&unk_1EDF168E0];
  [v11 setMass:1.0];
  [v11 setStiffness:80.0];
  [v11 setDamping:20.0];
  [v11 setBeginTime:v10];
  LODWORD(v12) = 3.0;
  [v11 setSpeed:v12];
  [v11 setDuration:1.0];
  [v11 setFillMode:*MEMORY[0x1E4F39FA8]];
  if (v4)
  {
    double v13 = [(CKAggregateAcknowledgmentTranscriptCell *)self balloonView];
    double v14 = [v13 layer];
    [v14 addAnimation:v11 forKey:@"transform.scale.xy"];

    v15 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    LODWORD(v14) = [v15 isEmojiTapbacksEnabled];

    int v16 = [(CKAggregateAcknowledgmentTranscriptCell *)self balloonView];
    v17 = v16;
    if (!v14)
    {
      double v19 = [v16 glyphView];

      [v19 animationDuration];
      [v19 animateWithBeginTime:0 completionDelay:v10 completion:v20];
      goto LABEL_6;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v19 = [(CKAggregateAcknowledgmentTranscriptCell *)self balloonView];
      [v19 playInsertionAnimationOnTopPlatter];
LABEL_6:
    }
  }
  double v21 = (void *)MEMORY[0x1E4F39CF8];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __69__CKAggregateAcknowledgmentTranscriptCell_performInsertion_animated___block_invoke;
  v23[3] = &unk_1E5620F48;
  id v24 = v6;
  id v22 = v6;
  [v21 setCompletionBlock:v23];
  [MEMORY[0x1E4F39CF8] commit];
  [MEMORY[0x1E4F39CF8] flush];
}

uint64_t __69__CKAggregateAcknowledgmentTranscriptCell_performInsertion_animated___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)prepareForReuse
{
  v3 = [(CKAggregateAcknowledgmentTranscriptCell *)self balloonView];
  CKBalloonViewReuse(v3);

  v4.receiver = self;
  v4.super_class = (Class)CKAggregateAcknowledgmentTranscriptCell;
  [(CKAssociatedMessageTranscriptCell *)&v4 prepareForReuse];
}

- (BOOL)parentMessageIsFromMe
{
  return self->_parentMessageIsFromMe;
}

- (void)setParentMessageIsFromMe:(BOOL)a3
{
  self->_parentMessageIsFromMe = a3;
}

@end