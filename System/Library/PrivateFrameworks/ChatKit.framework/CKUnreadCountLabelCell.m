@interface CKUnreadCountLabelCell
- (CKUnreadCountLabelCell)initWithFrame:(CGRect)a3;
- (UIView)leftSeparator;
- (UIView)rightSeparator;
- (void)layoutSubviewsForContents;
- (void)setLeftSeparator:(id)a3;
- (void)setRightSeparator:(id)a3;
@end

@implementation CKUnreadCountLabelCell

- (CKUnreadCountLabelCell)initWithFrame:(CGRect)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)CKUnreadCountLabelCell;
  v3 = -[CKTranscriptLabelCell initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    leftSeparator = v3->_leftSeparator;
    v3->_leftSeparator = v4;

    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    rightSeparator = v3->_rightSeparator;
    v3->_rightSeparator = v6;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v23[0] = v3->_leftSeparator;
    v23[1] = v3->_rightSeparator;
    v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 2, 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          [(CKUnreadCountLabelCell *)v3 addSubview:v13];
          v14 = +[CKUIBehavior sharedBehaviors];
          v15 = [v14 theme];
          v16 = [v15 transcriptTextColor];
          [v13 setBackgroundColor:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v10);
    }
  }
  return v3;
}

- (void)layoutSubviewsForContents
{
  v16.receiver = self;
  v16.super_class = (Class)CKUnreadCountLabelCell;
  [(CKTranscriptStampCell *)&v16 layoutSubviewsForContents];
  v3 = [(CKTranscriptLabelCell *)self label];
  [(CKTranscriptStampCell *)self contentAlignmentRect];
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  double v7 = v6;

  [(CKUnreadCountLabelCell *)self frame];
  double v9 = v8;
  [(CKUnreadCountLabelCell *)self frame];
  double v11 = v10;
  if (CKPixelWidth_once_19 != -1) {
    dispatch_once(&CKPixelWidth_once_19, &__block_literal_global_264);
  }
  double v12 = v11 * 0.5;
  double v13 = (v9 - v7 + -24.0) * 0.5;
  double v14 = *(double *)&CKPixelWidth_sPixel_19;
  -[UIView setFrame:](self->_leftSeparator, "setFrame:", 0.0, v12, v13, *(double *)&CKPixelWidth_sPixel_19);
  [(CKUnreadCountLabelCell *)self frame];
  -[UIView setFrame:](self->_rightSeparator, "setFrame:", v15 - v13, v12, v13, v14);
}

- (UIView)leftSeparator
{
  return self->_leftSeparator;
}

- (void)setLeftSeparator:(id)a3
{
}

- (UIView)rightSeparator
{
  return self->_rightSeparator;
}

- (void)setRightSeparator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSeparator, 0);

  objc_storeStrong((id *)&self->_leftSeparator, 0);
}

@end