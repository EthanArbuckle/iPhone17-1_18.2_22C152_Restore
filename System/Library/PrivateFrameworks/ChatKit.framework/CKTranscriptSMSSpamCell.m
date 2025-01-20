@interface CKTranscriptSMSSpamCell
- (CKTranscriptSMSSpamCell)initWithFrame:(CGRect)a3;
- (NSAttributedString)attributedButtonText;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)setAttributedButtonText:(id)a3;
@end

@implementation CKTranscriptSMSSpamCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKTranscriptSMSSpamCell;
  id v12 = a3;
  [(CKTranscriptStampCell *)&v14 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  v13 = objc_msgSend(v12, "transcriptText", v14.receiver, v14.super_class);

  [(CKTranscriptLabelCell *)self setAttributedText:v13];
}

- (CKTranscriptSMSSpamCell)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptSMSSpamCell;
  return -[CKTranscriptLabelCell initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviewsForAlignmentContents
{
  v20.receiver = self;
  v20.super_class = (Class)CKTranscriptSMSSpamCell;
  [(CKTranscriptStampCell *)&v20 layoutSubviewsForAlignmentContents];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 transcriptBoldTextHeight];
  double v5 = v4;
  v6 = [(CKTranscriptLabelCell *)self label];
  [v6 setNumberOfLines:0];
  [(CKTranscriptStampCell *)self contentAlignmentRect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [(CKTranscriptLabelCell *)self label];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(CKTranscriptLabelCell *)self label];
    v16 = [v15 attributedText];

    if (v16)
    {
      v17 = [(CKTranscriptLabelCell *)self label];
      v18 = [v17 attributedText];
      objc_msgSend(v18, "boundingRectWithSize:options:context:", 1, 0, v12, 1.79769313e308);
      double v5 = v19;
    }
  }
  objc_msgSend(v6, "setFrame:", v8, v10, v12, v5);
}

- (void)addFilter:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptSMSSpamCell;
  [(CKTranscriptStampCell *)&v3 addFilter:a3];
}

- (void)clearFilters
{
  v2.receiver = self;
  v2.super_class = (Class)CKTranscriptSMSSpamCell;
  [(CKTranscriptStampCell *)&v2 clearFilters];
}

- (NSAttributedString)attributedButtonText
{
  return self->_attributedButtonText;
}

- (void)setAttributedButtonText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end