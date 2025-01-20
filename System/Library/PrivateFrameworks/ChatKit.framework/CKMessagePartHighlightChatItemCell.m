@interface CKMessagePartHighlightChatItemCell
- (id)accessibilityIdentifier;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)performHide:(id)a3;
- (void)performInsertion:(id)a3;
- (void)performReload:(id)a3 completion:(id)a4;
- (void)performRemoval:(id)a3;
- (void)performReveal:(id)a3;
- (void)prepareForReuse;
- (void)setHighlightBalloonView:(id)a3;
@end

@implementation CKMessagePartHighlightChatItemCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKMessagePartHighlightChatItemCell;
  id v12 = a3;
  [(CKAssociatedMessageTranscriptCell *)&v15 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  v13 = (objc_class *)objc_opt_class();
  v14 = CKBalloonViewForClass(v13);
  -[CKMessagePartHighlightChatItemCell setHighlightBalloonView:](self, "setHighlightBalloonView:", v14, v15.receiver, v15.super_class);
  [v14 configureForMessagePartHighlightChatItem:v12];
}

- (void)setHighlightBalloonView:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKMessagePartHighlightChatItemCell;
  [(CKAssociatedMessageTranscriptCell *)&v3 setAssociatedItemView:a3];
}

- (id)accessibilityIdentifier
{
  return @"highlightBalloonViewIdentifier";
}

- (void)layoutSubviewsForAlignmentContents
{
  v48.receiver = self;
  v48.super_class = (Class)CKMessagePartHighlightChatItemCell;
  [(CKAssociatedMessageTranscriptCell *)&v48 layoutSubviewsForAlignmentContents];
  objc_super v3 = [(CKMessagePartHighlightChatItemCell *)self highlightBalloonView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(CKAssociatedMessageTranscriptCell *)self parentSize];
  double v13 = v12;
  v14 = +[CKUIBehavior sharedBehaviors];
  [v14 messageHighlightTranscriptBalloonRelativePosition];
  double v16 = v15;

  if ([(CKEditableCollectionViewCell *)self orientation])
  {
    if ([(CKEditableCollectionViewCell *)self orientation] == 2) {
      double v5 = v5 - v13 + v16;
    }
  }
  else
  {
    double v5 = v5 + v13 - v16;
  }
  [(CKAssociatedMessageTranscriptCell *)self cumulativeAssociatedOffset];
  if (v17 != 0.0)
  {
    [(CKAssociatedMessageTranscriptCell *)self cumulativeAssociatedOffset];
    double v5 = v5 + v18;
  }
  v19 = [(CKTranscriptMessageCell *)self failureButton];

  if (v19)
  {
    CGFloat v47 = v11;
    v20 = [(CKTranscriptMessageCell *)self failureButton];
    [v20 frame];
    double v22 = v21;
    CGFloat v24 = v23;
    double v26 = v25;
    double v28 = v27;

    if ([(CKEditableCollectionViewCell *)self orientation])
    {
      if ([(CKEditableCollectionViewCell *)self orientation] == 2)
      {
        v49.origin.x = v22;
        v49.origin.y = v24;
        v49.size.width = v26;
        v49.size.height = v28;
        double v22 = v5 - CGRectGetWidth(v49) + -1.0;
      }
      CGFloat v29 = v47;
    }
    else
    {
      v50.origin.x = v5;
      v50.origin.y = v7;
      v50.size.width = v9;
      CGFloat v29 = v47;
      v50.size.height = v47;
      double v22 = CGRectGetMaxX(v50) + 1.0;
    }
    v51.size.width = v9;
    v51.origin.x = v5;
    double v45 = v7;
    v51.origin.y = v7;
    v51.size.height = v29;
    double Height = CGRectGetHeight(v51);
    v52.origin.x = v22;
    v52.origin.y = v24;
    v52.size.width = v26;
    v52.size.height = v28;
    double v31 = (Height - CGRectGetHeight(v52)) * 0.5;
    if (CKMainScreenScale_once_104 != -1) {
      dispatch_once(&CKMainScreenScale_once_104, &__block_literal_global_274);
    }
    double v32 = *(double *)&CKMainScreenScale_sMainScreenScale_104;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_104 == 0.0) {
      double v32 = 1.0;
    }
    double v33 = round(v31 * v32) / v32;
    v34 = [(CKTranscriptMessageCell *)self failureButton];
    objc_msgSend(v34, "setFrame:", v22, v33, v26, v28);

    double v7 = v46;
    double v11 = v47;
  }
  v35 = [(CKMessagePartHighlightChatItemCell *)self traitCollection];
  [v35 displayScale];
  if (v36 == 0.0)
  {
    if (CKMainScreenScale_once_104 != -1) {
      dispatch_once(&CKMainScreenScale_once_104, &__block_literal_global_274);
    }
    double v37 = *(double *)&CKMainScreenScale_sMainScreenScale_104;
    double v38 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_104 == 0.0) {
      double v37 = 1.0;
    }
    double v39 = floor(v5 * v37) / v37;
    double v36 = *(double *)&CKMainScreenScale_sMainScreenScale_104;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_104 == 0.0) {
      double v36 = 1.0;
    }
    double v40 = *(double *)&CKMainScreenScale_sMainScreenScale_104;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_104 == 0.0) {
      double v40 = 1.0;
    }
    double v41 = ceil(v9 * v40) / v40;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_104 != 0.0) {
      double v38 = *(double *)&CKMainScreenScale_sMainScreenScale_104;
    }
  }
  else
  {
    double v39 = floor(v5 * v36) / v36;
    double v38 = v36;
    double v41 = ceil(v9 * v36) / v36;
  }
  double v42 = floor(v7 * v36) / v36;
  double v43 = ceil(v11 * v38) / v38;

  v44 = [(CKMessagePartHighlightChatItemCell *)self highlightBalloonView];
  objc_msgSend(v44, "setFrame:", v39, v42, v41, v43);
}

- (void)performInsertion:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMessagePartHighlightChatItemCell *)self highlightBalloonView];
  [v5 performTranscriptInsertionAnimation:v4];
}

- (void)performRemoval:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMessagePartHighlightChatItemCell *)self highlightBalloonView];
  [v5 performTranscriptRemovalAnimation:v4];
}

- (void)performHide:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMessagePartHighlightChatItemCell *)self highlightBalloonView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CKMessagePartHighlightChatItemCell_performHide___block_invoke;
  v7[3] = &unk_1E5622358;
  id v8 = v4;
  id v6 = v4;
  [v5 performTranscriptHideAnimation:v7];
}

uint64_t __50__CKMessagePartHighlightChatItemCell_performHide___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performReveal:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMessagePartHighlightChatItemCell *)self highlightBalloonView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CKMessagePartHighlightChatItemCell_performReveal___block_invoke;
  v7[3] = &unk_1E5622358;
  id v8 = v4;
  id v6 = v4;
  [v5 performTranscriptRevealAnimation:v7];
}

uint64_t __52__CKMessagePartHighlightChatItemCell_performReveal___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performReload:(id)a3 completion:(id)a4
{
  id v7 = a4;
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
  id v6 = [(CKMessagePartHighlightChatItemCell *)self highlightBalloonView];
  [v6 performTranscriptReloadAnimation:v7];
}

- (void)prepareForReuse
{
  objc_super v3 = [(CKMessagePartHighlightChatItemCell *)self highlightBalloonView];
  CKBalloonViewReuse(v3);

  v4.receiver = self;
  v4.super_class = (Class)CKMessagePartHighlightChatItemCell;
  [(CKAssociatedMessageTranscriptCell *)&v4 prepareForReuse];
}

@end