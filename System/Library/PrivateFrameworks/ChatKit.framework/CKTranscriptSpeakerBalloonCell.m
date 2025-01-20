@interface CKTranscriptSpeakerBalloonCell
- (BOOL)adjustSpeakerForAcknowledgment;
- (BOOL)allowsSwipeToReply;
- (BOOL)isSpeakerEnabled;
- (BOOL)isSpeakerHidden;
- (BOOL)shouldShowText;
- (BOOL)speakerEnabledBeforeManualHide;
- (BOOL)speakerIsManuallyHidden;
- (CKSpeakerButton)speakerButton;
- (void)layoutSubviewsForAlignmentContents;
- (void)setAdjustSpeakerForAcknowledgment:(BOOL)a3;
- (void)setDrawerPercentRevealed:(double)a3;
- (void)setOrientation:(char)a3;
- (void)setShouldShowText:(BOOL)a3;
- (void)setSpeakerButton:(id)a3;
- (void)setSpeakerEnabled:(BOOL)a3;
- (void)setSpeakerEnabledBeforeManualHide:(BOOL)a3;
- (void)setSpeakerHidden:(BOOL)a3;
- (void)setSpeakerIsManuallyHidden:(BOOL)a3;
@end

@implementation CKTranscriptSpeakerBalloonCell

- (void)setOrientation:(char)a3
{
  uint64_t v3 = a3;
  if ([(CKEditableCollectionViewCell *)self orientation] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CKTranscriptSpeakerBalloonCell;
    [(CKEditableCollectionViewCell *)&v6 setOrientation:v3];
    v5 = [(CKTranscriptSpeakerBalloonCell *)self speakerButton];
    [v5 setOrientation:v3];

    [(CKTranscriptSpeakerBalloonCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviewsForAlignmentContents
{
  v19.receiver = self;
  v19.super_class = (Class)CKTranscriptSpeakerBalloonCell;
  [(CKTranscriptBalloonCell *)&v19 layoutSubviewsForAlignmentContents];
  uint64_t v3 = [(CKTranscriptSpeakerBalloonCell *)self speakerButton];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  v8 = [(CKTranscriptBalloonCell *)self balloonView];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;

  if ([(CKEditableCollectionViewCell *)self orientation])
  {
    double v17 = v10 + -7.0 - v5;
  }
  else
  {
    v20.origin.x = v10;
    v20.origin.y = v12;
    v20.size.width = v14;
    v20.size.height = v16;
    double v17 = CGRectGetMaxX(v20) + 7.0;
  }
  if (CKMainScreenScale_once_56 != -1) {
    dispatch_once(&CKMainScreenScale_once_56, &__block_literal_global_149);
  }
  double v18 = *(double *)&CKMainScreenScale_sMainScreenScale_56;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_56 == 0.0) {
    double v18 = 1.0;
  }
  objc_msgSend(v3, "setFrame:", v17, 1.0 / v18 * (v12 * v18 + floor((v16 * v18 - v7 * v18) * 0.5)), v5, v7);
}

- (void)setSpeakerEnabled:(BOOL)a3
{
  if (self->_speakerEnabled != a3)
  {
    BOOL v3 = a3;
    self->_speakerEnabled = a3;
    id v4 = [(CKTranscriptSpeakerBalloonCell *)self speakerButton];
    [v4 setSpeakerEnabled:v3];
  }
}

- (void)setSpeakerHidden:(BOOL)a3
{
  if ([(CKTranscriptSpeakerBalloonCell *)self isSpeakerHidden] == a3) {
    return;
  }
  double v5 = [(CKTranscriptSpeakerBalloonCell *)self speakerButton];
  if (a3)
  {
    id v8 = v5;
    uint64_t v6 = 1;
  }
  else
  {
    if (!v5)
    {
      id v8 = +[CKSpeakerButton buttonWithType:1];
      objc_msgSend(v8, "setOrientation:", -[CKEditableCollectionViewCell orientation](self, "orientation"));
      objc_msgSend(v8, "setSpeakerEnabled:", -[CKTranscriptSpeakerBalloonCell isSpeakerEnabled](self, "isSpeakerEnabled"));
      [v8 sizeToFit];
      double v7 = [(CKEditableCollectionViewCell *)self contentView];
      [v7 addSubview:v8];

      [(CKTranscriptSpeakerBalloonCell *)self setSpeakerButton:v8];
      [(CKTranscriptSpeakerBalloonCell *)self setNeedsLayout];
      goto LABEL_9;
    }
    id v8 = v5;
    uint64_t v6 = 0;
  }
  [v5 setHidden:v6];
LABEL_9:
}

- (BOOL)isSpeakerHidden
{
  v2 = [(CKTranscriptSpeakerBalloonCell *)self speakerButton];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 isHidden];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setDrawerPercentRevealed:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKTranscriptSpeakerBalloonCell;
  -[CKTranscriptCell setDrawerPercentRevealed:](&v6, sel_setDrawerPercentRevealed_);
  if (![(CKTranscriptSpeakerBalloonCell *)self speakerIsManuallyHidden]) {
    [(CKTranscriptSpeakerBalloonCell *)self setSpeakerEnabledBeforeManualHide:[(CKTranscriptSpeakerBalloonCell *)self isSpeakerHidden]];
  }
  BOOL v5 = a3 > 0.3
    || [(CKTranscriptSpeakerBalloonCell *)self speakerEnabledBeforeManualHide];
  [(CKTranscriptSpeakerBalloonCell *)self setSpeakerHidden:v5];
  [(CKTranscriptSpeakerBalloonCell *)self setSpeakerIsManuallyHidden:a3 > 0.3];
}

- (BOOL)allowsSwipeToReply
{
  return 0;
}

- (BOOL)isSpeakerEnabled
{
  return self->_speakerEnabled;
}

- (BOOL)adjustSpeakerForAcknowledgment
{
  return self->_adjustSpeakerForAcknowledgment;
}

- (void)setAdjustSpeakerForAcknowledgment:(BOOL)a3
{
  self->_adjustSpeakerForAcknowledgment = a3;
}

- (CKSpeakerButton)speakerButton
{
  return self->_speakerButton;
}

- (void)setSpeakerButton:(id)a3
{
}

- (BOOL)shouldShowText
{
  return self->_shouldShowText;
}

- (void)setShouldShowText:(BOOL)a3
{
  self->_shouldShowText = a3;
}

- (BOOL)speakerEnabledBeforeManualHide
{
  return self->_speakerEnabledBeforeManualHide;
}

- (void)setSpeakerEnabledBeforeManualHide:(BOOL)a3
{
  self->_speakerEnabledBeforeManualHide = a3;
}

- (BOOL)speakerIsManuallyHidden
{
  return self->_speakerIsManuallyHidden;
}

- (void)setSpeakerIsManuallyHidden:(BOOL)a3
{
  self->_speakerIsManuallyHidden = a3;
}

- (void).cxx_destruct
{
}

@end