@interface CKTranscriptTapbackSupplementaryView
+ (id)supplementaryViewKindPrefix;
- (CKAcknowledgmentBalloonView)balloonView;
- (CKTranscriptTapbackSupplementaryView)initWithFrame:(CGRect)a3;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBalloonView:(id)a3;
@end

@implementation CKTranscriptTapbackSupplementaryView

- (CKTranscriptTapbackSupplementaryView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptTapbackSupplementaryView;
  return -[CKTranscriptTapbackSupplementaryView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptTapbackSupplementaryView;
  [(CKTranscriptTapbackSupplementaryView *)&v12 layoutSubviews];
  [(CKTranscriptTapbackSupplementaryView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKTranscriptTapbackSupplementaryView *)self balloonView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptTapbackSupplementaryView;
  [(CKTranscriptTapbackSupplementaryView *)&v3 prepareForReuse];
  [(CKTranscriptTapbackSupplementaryView *)self setBalloonView:0];
}

- (void)setBalloonView:(id)a3
{
  double v5 = (CKAcknowledgmentBalloonView *)a3;
  p_balloonView = (void **)&self->_balloonView;
  balloonView = self->_balloonView;
  if (balloonView != v5)
  {
    double v8 = v5;
    [(CKAcknowledgmentBalloonView *)balloonView removeFromSuperview];
    CKBalloonViewReuse(*p_balloonView);
    objc_storeStrong((id *)&self->_balloonView, a3);
    [(CKTranscriptTapbackSupplementaryView *)self addSubview:*p_balloonView];
    double v5 = v8;
  }
}

+ (id)supplementaryViewKindPrefix
{
  return @"t:";
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CKTranscriptTapbackSupplementaryView;
  [(CKTranscriptCollectionSupplementaryView *)&v27 configureForChatItem:v12 context:v13 animated:v9 animationDuration:a7 animationCurve:a6];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v14 = objc_msgSend(v12, "visibleAssociatedMessageChatItems", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (!v15)
  {
    v17 = v14;
    goto LABEL_13;
  }
  uint64_t v16 = v15;
  v17 = 0;
  uint64_t v18 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v24 != v18) {
        objc_enumerationMutation(v14);
      }
      v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v20;

        v17 = v21;
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
  }
  while (v16);

  if (v17)
  {
    v22 = CKBalloonViewForClass((objc_class *)[v17 balloonViewClass]);
    [(CKTranscriptTapbackSupplementaryView *)self setBalloonView:v22];
    [v22 configureForAggregateAcknowledgmentChatItem:v17];

LABEL_13:
  }
}

- (CKAcknowledgmentBalloonView)balloonView
{
  return self->_balloonView;
}

- (void).cxx_destruct
{
}

@end