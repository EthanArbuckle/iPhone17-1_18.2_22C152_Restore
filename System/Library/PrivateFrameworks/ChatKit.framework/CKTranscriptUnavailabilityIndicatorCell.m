@interface CKTranscriptUnavailabilityIndicatorCell
+ (id)reuseIdentifier;
+ (id)unavailableTitleLabel;
- (BOOL)displayingNotifyAnywayButton;
- (CKTranscriptUnavailabilityIndicatorCell)initWithFrame:(CGRect)a3;
- (NSAttributedString)unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
- (NSAttributedString)unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
- (UILabel)unavailableTitleLabel;
- (id)animationWithKeyPath:(id)a3 beginTime:(double)a4 duration:(double)a5 fromValue:(id)a6 toValue:(id)a7;
- (void)_fadeInLabelAtStartTime:(double)a3 completion:(id)a4;
- (void)_updateUnavailableTitleLabelAttributedTextAnimated:(BOOL)a3;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)displayNotifyAnywayButtonStateChanged:(id)a3;
- (void)layoutSubviewsForAlignmentContents;
- (void)performInsertion:(id)a3;
- (void)setDisplayingNotifyAnywayButton:(BOOL)a3;
- (void)setUnavailableTitleLabel:(id)a3;
- (void)setUnavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:(id)a3;
- (void)setUnavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton:(id)a3;
@end

@implementation CKTranscriptUnavailabilityIndicatorCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17.receiver = self;
    v17.super_class = (Class)CKTranscriptUnavailabilityIndicatorCell;
    [(CKTranscriptCell *)&v17 configureForChatItem:v12 context:v13 animated:v9 animationDuration:a7 animationCurve:a6];
    v14 = [v12 unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton];
    [(CKTranscriptUnavailabilityIndicatorCell *)self setUnavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:v14];

    v15 = [v12 unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton];
    [(CKTranscriptUnavailabilityIndicatorCell *)self setUnavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton:v15];

    -[CKTranscriptUnavailabilityIndicatorCell setDisplayingNotifyAnywayButton:](self, "setDisplayingNotifyAnywayButton:", [v12 displayNotifyAnywayButton]);
    v16 = [v12 imUnavailabilityIndicatorChatItem];
    [v16 addUnavailabilityIndicatorChatItemDelegate:self];
  }
  else
  {
    v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptUnavailabilityIndicatorCell(CKChatItem) configureForChatItem:context:animated:animationDuration:animationCurve:]();
    }
  }
}

- (CKTranscriptUnavailabilityIndicatorCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptUnavailabilityIndicatorCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [(id)objc_opt_class() unavailableTitleLabel];
    v5 = [(CKEditableCollectionViewCell *)v3 contentView];
    [v5 addSubview:v4];

    [(CKTranscriptUnavailabilityIndicatorCell *)v3 setUnavailableTitleLabel:v4];
    v6 = +[CKUIBehavior sharedBehaviors];
    v7 = [v6 transcriptTextVibrancyEffect];
    [(CKEditableCollectionViewCell *)v3 setEffect:v7];
  }
  return v3;
}

+ (id)reuseIdentifier
{
  return @"CKTranscriptUnavailabilityIndicatorCell";
}

- (void)displayNotifyAnywayButtonStateChanged:(id)a3
{
  uint64_t v4 = [a3 displayNotifyAnywayButton];

  [(CKTranscriptUnavailabilityIndicatorCell *)self setDisplayingNotifyAnywayButton:v4];
}

+ (id)unavailableTitleLabel
{
  id v2 = objc_alloc(MEMORY[0x1E4F42B38]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setNumberOfLines:0];
  [v3 setContentMode:4];
  [v3 setTextAlignment:1];

  return v3;
}

- (void)layoutSubviewsForAlignmentContents
{
  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptUnavailabilityIndicatorCell;
  [(CKEditableCollectionViewCell *)&v12 layoutSubviewsForAlignmentContents];
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKTranscriptUnavailabilityIndicatorCell *)self unavailableTitleLabel];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)setDisplayingNotifyAnywayButton:(BOOL)a3
{
  if (self->_displayingNotifyAnywayButton != a3)
  {
    self->_displayingNotifyAnywayButton = a3;
    [(CKTranscriptUnavailabilityIndicatorCell *)self _updateUnavailableTitleLabelAttributedTextAnimated:1];
  }
}

- (void)performInsertion:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if (![(CKTranscriptCell *)self insertingBeforeReplyPreview])
  {
    if ([(CKTranscriptCell *)self insertingWithReplyPreview]) {
      double v5 = 0.3;
    }
    else {
      double v5 = 0.0;
    }
  }
  int64_t v6 = [(CKTranscriptCell *)self insertionType];
  if ((unint64_t)(v6 - 1) >= 2)
  {
    if (v6 != 3)
    {
      v9.receiver = self;
      v9.super_class = (Class)CKTranscriptUnavailabilityIndicatorCell;
      [(CKEditableCollectionViewCell *)&v9 performInsertion:v4];
      goto LABEL_11;
    }
    [(CKTranscriptCell *)self insertionDuration];
    double v7 = v8 + -0.25;
  }
  else
  {
    [(CKTranscriptCell *)self insertionDuration];
  }
  [(CKTranscriptUnavailabilityIndicatorCell *)self _fadeInLabelAtStartTime:v4 completion:v5 + v7];
LABEL_11:
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  id v11 = [(CKTranscriptUnavailabilityIndicatorCell *)self unavailableTitleLabel];
  double v5 = [v11 layer];
  [v5 setAllowsGroupBlending:0];

  int64_t v6 = [v11 layer];
  [v6 setAllowsGroupOpacity:0];

  double v7 = [v11 layer];
  double v8 = [v4 textCompositingFilter];
  [v7 setCompositingFilter:v8];

  [v4 contentAlpha];
  double v10 = v9;

  [v11 setAlpha:v10];
}

- (void)clearFilters
{
  id v5 = [(CKTranscriptUnavailabilityIndicatorCell *)self unavailableTitleLabel];
  id v2 = [v5 layer];
  [v2 setAllowsGroupBlending:1];

  double v3 = [v5 layer];
  [v3 setAllowsGroupOpacity:1];

  id v4 = [v5 layer];
  [v4 setCompositingFilter:0];

  [v5 setAlpha:1.0];
}

- (void)_updateUnavailableTitleLabelAttributedTextAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_displayingNotifyAnywayButton) {
    id v5 = &OBJC_IVAR___CKTranscriptUnavailabilityIndicatorCell__unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
  }
  else {
    id v5 = &OBJC_IVAR___CKTranscriptUnavailabilityIndicatorCell__unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
  }
  id v6 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v5);
  if (v6)
  {
    double v7 = [(CKTranscriptUnavailabilityIndicatorCell *)self unavailableTitleLabel];
    double v8 = v7;
    if (v3)
    {
      double v9 = (void *)MEMORY[0x1E4F42FF0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __94__CKTranscriptUnavailabilityIndicatorCell__updateUnavailableTitleLabelAttributedTextAnimated___block_invoke;
      v11[3] = &unk_1E5620AF8;
      id v12 = v7;
      id v13 = v6;
      [v9 transitionWithView:v12 duration:5242880 options:v11 animations:0 completion:0.25];
    }
    else
    {
      double v10 = [(CKTranscriptUnavailabilityIndicatorCell *)self unavailableTitleLabel];
      [v10 setAttributedText:v6];
    }
  }
}

uint64_t __94__CKTranscriptUnavailabilityIndicatorCell__updateUnavailableTitleLabelAttributedTextAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAttributedText:*(void *)(a1 + 40)];
}

- (void)setUnavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:(id)a3
{
  id v5 = (NSAttributedString *)a3;
  if (self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton != v5)
  {
    objc_storeStrong((id *)&self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton, a3);
    if (self->_displayingNotifyAnywayButton) {
      [(CKTranscriptUnavailabilityIndicatorCell *)self _updateUnavailableTitleLabelAttributedTextAnimated:0];
    }
  }
}

- (void)setUnavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton:(id)a3
{
  id v5 = (NSAttributedString *)a3;
  if (self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton, a3);
    id v5 = v6;
    if (!self->_displayingNotifyAnywayButton)
    {
      [(CKTranscriptUnavailabilityIndicatorCell *)self _updateUnavailableTitleLabelAttributedTextAnimated:0];
      id v5 = v6;
    }
  }
}

- (void)_fadeInLabelAtStartTime:(double)a3 completion:(id)a4
{
  v15 = (void (**)(id, uint64_t))a4;
  [(CKTranscriptCell *)self insertionDuration];
  double v7 = v6;
  [MEMORY[0x1E4F39CF8] begin];
  double v8 = [(CKTranscriptUnavailabilityIndicatorCell *)self unavailableTitleLabel];
  double v9 = [v8 layer];
  [v9 setOpacity:0.0];
  [(CKTranscriptCell *)self insertionBeginTime];
  objc_msgSend(v9, "convertTime:fromLayer:", 0);
  id v11 = [(CKTranscriptUnavailabilityIndicatorCell *)self animationWithKeyPath:@"opacity" beginTime:&unk_1EDF17488 duration:&unk_1EDF17498 fromValue:v10 + a3 toValue:v7];
  [v9 addAnimation:v11 forKey:@"labelFadeIn"];
  LODWORD(v12) = 1.0;
  [v9 setOpacity:v12];
  [MEMORY[0x1E4F39CF8] commit];
  id v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v14 = [v13 fullTranscriptLoggingEnabled];

  if (v14 && _IMWillLog()) {
    _IMAlwaysLog();
  }
  if (v15) {
    v15[2](v15, 1);
  }
}

- (id)animationWithKeyPath:(id)a3 beginTime:(double)a4 duration:(double)a5 fromValue:(id)a6 toValue:(id)a7
{
  id v11 = (void *)MEMORY[0x1E4F39B48];
  id v12 = a7;
  id v13 = a6;
  int v14 = [v11 animationWithKeyPath:a3];
  [v14 setFromValue:v13];

  [v14 setToValue:v12];
  [v14 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v14 setRemovedOnCompletion:1];
  [v14 setBeginTime:a4];
  [v14 setDuration:a5];

  return v14;
}

- (NSAttributedString)unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton
{
  return self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
}

- (NSAttributedString)unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton
{
  return self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
}

- (BOOL)displayingNotifyAnywayButton
{
  return self->_displayingNotifyAnywayButton;
}

- (UILabel)unavailableTitleLabel
{
  return self->_unavailableTitleLabel;
}

- (void)setUnavailableTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableTitleLabel, 0);
  objc_storeStrong((id *)&self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton, 0);

  objc_storeStrong((id *)&self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton, 0);
}

@end