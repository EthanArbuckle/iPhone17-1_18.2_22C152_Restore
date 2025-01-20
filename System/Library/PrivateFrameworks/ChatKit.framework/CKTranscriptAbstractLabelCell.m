@interface CKTranscriptAbstractLabelCell
+ (CGSize)sizeThatFits:(CGSize)a3 attributedText:(id)a4 displayScale:(double)a5;
- (BOOL)wantsContactImageLayout;
- (BOOL)wantsOffsetForReplyLine;
- (CGRect)contentAlignmentRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKTranscriptAbstractLabelCell)initWithFrame:(CGRect)a3;
- (NSAttributedString)attributedText;
- (id)cellView;
- (id)label;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)layoutSubviewsForAlignmentContents;
- (void)layoutSubviewsForContents;
- (void)prepareForReuse;
- (void)setAttributedText:(id)a3;
- (void)setWantsContactImageLayout:(BOOL)a3;
- (void)setWantsOffsetForReplyLine:(BOOL)a3;
@end

@implementation CKTranscriptAbstractLabelCell

- (CKTranscriptAbstractLabelCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptAbstractLabelCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CKUIBehavior sharedBehaviors];
    v5 = [v4 transcriptTextVibrancyEffect];
    [(CKEditableCollectionViewCell *)v3 setEffect:v5];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(CKTranscriptAbstractLabelCell *)self cellView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviewsForContents
{
  v43.receiver = self;
  v43.super_class = (Class)CKTranscriptAbstractLabelCell;
  [(CKEditableCollectionViewCell *)&v43 layoutSubviewsForContents];
  [(CKTranscriptAbstractLabelCell *)self contentAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(CKTranscriptAbstractLabelCell *)self wantsContactImageLayout])
  {
    if (![(CKEditableCollectionViewCell *)self orientation])
    {
      double v11 = +[CKUIBehavior sharedBehaviors];
      [v11 transcriptContactImageDiameter];
      double v13 = v12;
      v14 = +[CKUIBehavior sharedBehaviors];
      [v14 contactPhotoBalloonMargin];
      double v42 = v13 + v15;

      [(CKEditableCollectionViewCell *)self marginInsets];
      double v39 = v17;
      double v40 = v16;
      double v41 = v18;
      double v38 = v19;
      v20 = +[CKUIBehavior sharedBehaviors];
      [v20 balloonTranscriptInsets];
      double v22 = v21;
      double v24 = v23;
      double v36 = v25;
      double v37 = v26;

      v27 = +[CKUIBehavior sharedBehaviors];
      [v27 contactPhotoTranscriptInsets];
      double v29 = v28;
      double v31 = v30;
      double v34 = v33;
      double v35 = v32;

      -[CKEditableCollectionViewCell setContentAlignmentRect:](self, "setContentAlignmentRect:", v24 + v42 + v4 - (v39 + v24) + v39 + v31, v22 + v6 - (v40 + v22) + v40 + v29 + 0.0, v8 + v39 + v24 + v38 + v37 - (v39 + v31 + v38 + v34) - (v42 + 0.0) - (v24 + v37), v10 + v40 + v22 + v41 + v36 - (v40 + v29 + v41 + v35) - (v22 + v36));
    }
  }
}

- (void)layoutSubviewsForAlignmentContents
{
  v41.receiver = self;
  v41.super_class = (Class)CKTranscriptAbstractLabelCell;
  [(CKEditableCollectionViewCell *)&v41 layoutSubviewsForAlignmentContents];
  [(CKTranscriptAbstractLabelCell *)self contentAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CKTranscriptAbstractLabelCell *)self cellView];
  objc_msgSend(v11, "sizeThatFits:", v8, 1.79769313e308);
  double v13 = v12;
  double v15 = v14;

  double v16 = floor((v10 - v15) * 0.5);
  double v17 = *(double *)(MEMORY[0x1E4F424F0] + 8);
  double v18 = *(double *)(MEMORY[0x1E4F424F0] + 24);
  double v19 = [(CKTranscriptAbstractLabelCell *)self cellView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v21 = [(CKTranscriptAbstractLabelCell *)self cellView];
    double v22 = [v21 configuration];
    double v23 = [v22 background];
    [v23 cornerRadius];
    double v25 = v24;

    if (v25 > 0.0)
    {
      double v26 = [v21 configuration];
      [v26 contentInsets];
      double v17 = v27;
      double v18 = v28;
    }
  }
  double v29 = v6 + v16;
  if ([(CKEditableCollectionViewCell *)self orientation] == 2)
  {
    [(CKTranscriptAbstractLabelCell *)self bounds];
    double Width = CGRectGetWidth(v42);
    [(CKEditableCollectionViewCell *)self marginInsets];
    double v32 = Width - v31;
    v43.origin.x = v4;
    v43.origin.y = v29;
    v43.size.double width = v13;
    v43.size.double height = v15;
    double v33 = v32 - CGRectGetWidth(v43);
    [(CKTranscriptAbstractLabelCell *)self safeAreaInsets];
    double v35 = v18 + v33 - v34;
  }
  else if ([(CKTranscriptAbstractLabelCell *)self wantsContactImageLayout])
  {
    double v35 = v4 - v17;
  }
  else
  {
    [(CKEditableCollectionViewCell *)self marginInsets];
    double v37 = v36;
    [(CKTranscriptAbstractLabelCell *)self safeAreaInsets];
    double v35 = v37 + v38 - v17;
  }
  double v39 = [(CKTranscriptAbstractLabelCell *)self cellView];
  if (CKMainScreenScale_once_82 != -1) {
    dispatch_once(&CKMainScreenScale_once_82, &__block_literal_global_205);
  }
  if (*(double *)&CKMainScreenScale_sMainScreenScale_82 == 0.0) {
    double v40 = 1.0;
  }
  else {
    double v40 = *(double *)&CKMainScreenScale_sMainScreenScale_82;
  }
  objc_msgSend(v39, "setFrame:", round(v35 * v40) / v40, round(v29 * v40) / v40, round(v13 * v40) / v40, round(v15 * v40) / v40);
}

- (CGRect)contentAlignmentRect
{
  v20.receiver = self;
  v20.super_class = (Class)CKTranscriptAbstractLabelCell;
  [(CKEditableCollectionViewCell *)&v20 contentAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(CKTranscriptAbstractLabelCell *)self wantsOffsetForReplyLine]
    && ![(CKEditableCollectionViewCell *)self orientation])
  {
    double v11 = +[CKUIBehavior sharedBehaviors];
    [v11 replyLineWidth];
    double v13 = v12;
    double v14 = +[CKUIBehavior sharedBehaviors];
    [v14 replyLineViewHorizontalPadding];
    double v4 = v4 + v13 + v15;
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)addFilter:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptAbstractLabelCell;
  id v4 = a3;
  [(CKEditableCollectionViewCell *)&v8 addFilter:v4];
  double v5 = [(CKTranscriptAbstractLabelCell *)self label];
  [v4 contentAlpha];
  double v7 = v6;

  [v5 setAlpha:v7];
}

- (void)clearFilters
{
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptAbstractLabelCell;
  [(CKEditableCollectionViewCell *)&v4 clearFilters];
  double v3 = [(CKTranscriptAbstractLabelCell *)self label];
  [v3 setAlpha:1.0];
}

- (void)setWantsContactImageLayout:(BOOL)a3
{
  if (self->_wantsContactImageLayout != a3)
  {
    self->_wantsContactImageLayout = a3;
    [(CKTranscriptAbstractLabelCell *)self setNeedsLayout];
  }
}

- (void)setWantsOffsetForReplyLine:(BOOL)a3
{
  if (self->_wantsOffsetForReplyLine != a3)
  {
    self->_wantsOffsetForReplyLine = a3;
    [(CKTranscriptAbstractLabelCell *)self setNeedsLayout];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptAbstractLabelCell;
  [(CKTranscriptCell *)&v3 prepareForReuse];
  [(CKTranscriptAbstractLabelCell *)self setWantsOffsetForReplyLine:0];
}

+ (CGSize)sizeThatFits:(CGSize)a3 attributedText:(id)a4 displayScale:(double)a5
{
  id v6 = a4;
  double v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  double v9 = NSString;
  double v10 = NSStringFromSelector(a2);
  double v11 = [v9 stringWithFormat:@"%@ is not implemented", v10];
  id v12 = [v7 exceptionWithName:v8 reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  double v7 = NSString;
  uint64_t v8 = NSStringFromSelector(a2);
  double v9 = [v7 stringWithFormat:@"%@ is not implemented", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (NSAttributedString)attributedText
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  double v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is not implemented", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)cellView
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  double v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is not implemented", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)label
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  double v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is not implemented", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)wantsContactImageLayout
{
  return self->_wantsContactImageLayout;
}

- (BOOL)wantsOffsetForReplyLine
{
  return self->_wantsOffsetForReplyLine;
}

@end