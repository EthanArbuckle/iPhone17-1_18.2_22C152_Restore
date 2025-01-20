@interface CKTranscriptSatelliteAvailabilityCell
+ (id)reuseIdentifier;
+ (id)satelliteAvailabilityTitleLabel;
- (CKTranscriptSatelliteAvailabilityCell)initWithFrame:(CGRect)a3;
- (NSAttributedString)satelliteAvailabilityTitleLabelAttributedText;
- (UILabel)satelliteAvailabilityTitleLabel;
- (id)animationWithKeyPath:(id)a3 beginTime:(double)a4 duration:(double)a5 fromValue:(id)a6 toValue:(id)a7;
- (void)_fadeInLabelAtStartTime:(double)a3 completion:(id)a4;
- (void)_updateSatelliteAvailabilityTitleLabelAttributedTextAnimated:(BOOL)a3;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)performInsertion:(id)a3;
- (void)setSatelliteAvailabilityTitleLabel:(id)a3;
- (void)setSatelliteAvailabilityTitleLabelAttributedText:(id)a3;
@end

@implementation CKTranscriptSatelliteAvailabilityCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15.receiver = self;
    v15.super_class = (Class)CKTranscriptSatelliteAvailabilityCell;
    [(CKTranscriptCell *)&v15 configureForChatItem:v12 context:v13 animated:v9 animationDuration:a7 animationCurve:a6];
    v14 = [v12 satelliteAvailabilityTitleLabelAttributedText];
    [(CKTranscriptSatelliteAvailabilityCell *)self setSatelliteAvailabilityTitleLabelAttributedText:v14];
  }
  else
  {
    v14 = IMLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptSatelliteAvailabilityCell(CKChatItem) configureForChatItem:context:animated:animationDuration:animationCurve:]();
    }
  }
}

- (CKTranscriptSatelliteAvailabilityCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptSatelliteAvailabilityCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [(id)objc_opt_class() satelliteAvailabilityTitleLabel];
    v5 = [(CKEditableCollectionViewCell *)v3 contentView];
    [v5 addSubview:v4];

    [(CKTranscriptSatelliteAvailabilityCell *)v3 setSatelliteAvailabilityTitleLabel:v4];
    v6 = +[CKUIBehavior sharedBehaviors];
    v7 = [v6 transcriptTextVibrancyEffect];
    [(CKEditableCollectionViewCell *)v3 setEffect:v7];
  }
  return v3;
}

+ (id)reuseIdentifier
{
  return @"CKTranscriptSatelliteAvailabilityCell";
}

+ (id)satelliteAvailabilityTitleLabel
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
  v12.super_class = (Class)CKTranscriptSatelliteAvailabilityCell;
  [(CKEditableCollectionViewCell *)&v12 layoutSubviewsForAlignmentContents];
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKTranscriptSatelliteAvailabilityCell *)self satelliteAvailabilityTitleLabel];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
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
      v9.super_class = (Class)CKTranscriptSatelliteAvailabilityCell;
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
  [(CKTranscriptSatelliteAvailabilityCell *)self _fadeInLabelAtStartTime:v4 completion:v5 + v7];
LABEL_11:
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  id v11 = [(CKTranscriptSatelliteAvailabilityCell *)self satelliteAvailabilityTitleLabel];
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
  id v5 = [(CKTranscriptSatelliteAvailabilityCell *)self satelliteAvailabilityTitleLabel];
  id v2 = [v5 layer];
  [v2 setAllowsGroupBlending:1];

  double v3 = [v5 layer];
  [v3 setAllowsGroupOpacity:1];

  id v4 = [v5 layer];
  [v4 setCompositingFilter:0];

  [v5 setAlpha:1.0];
}

- (void)_updateSatelliteAvailabilityTitleLabelAttributedTextAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = self->_satelliteAvailabilityTitleLabelAttributedText;
  if (v5)
  {
    int64_t v6 = [(CKTranscriptSatelliteAvailabilityCell *)self satelliteAvailabilityTitleLabel];
    double v7 = v6;
    if (v3)
    {
      double v8 = (void *)MEMORY[0x1E4F42FF0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __102__CKTranscriptSatelliteAvailabilityCell__updateSatelliteAvailabilityTitleLabelAttributedTextAnimated___block_invoke;
      v10[3] = &unk_1E5620AF8;
      id v11 = v6;
      objc_super v12 = v5;
      [v8 transitionWithView:v11 duration:5242880 options:v10 animations:0 completion:0.25];
    }
    else
    {
      double v9 = [(CKTranscriptSatelliteAvailabilityCell *)self satelliteAvailabilityTitleLabel];
      [v9 setAttributedText:v5];
    }
  }
}

uint64_t __102__CKTranscriptSatelliteAvailabilityCell__updateSatelliteAvailabilityTitleLabelAttributedTextAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAttributedText:*(void *)(a1 + 40)];
}

- (void)setSatelliteAvailabilityTitleLabelAttributedText:(id)a3
{
  id v5 = (NSAttributedString *)a3;
  if (self->_satelliteAvailabilityTitleLabelAttributedText != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_satelliteAvailabilityTitleLabelAttributedText, a3);
    [(CKTranscriptSatelliteAvailabilityCell *)self _updateSatelliteAvailabilityTitleLabelAttributedTextAnimated:0];
    id v5 = v6;
  }
}

- (void)_fadeInLabelAtStartTime:(double)a3 completion:(id)a4
{
  objc_super v15 = (void (**)(id, uint64_t))a4;
  [(CKTranscriptCell *)self insertionDuration];
  double v7 = v6;
  [MEMORY[0x1E4F39CF8] begin];
  double v8 = [(CKTranscriptSatelliteAvailabilityCell *)self satelliteAvailabilityTitleLabel];
  double v9 = [v8 layer];
  [v9 setOpacity:0.0];
  [(CKTranscriptCell *)self insertionBeginTime];
  objc_msgSend(v9, "convertTime:fromLayer:", 0);
  id v11 = [(CKTranscriptSatelliteAvailabilityCell *)self animationWithKeyPath:@"opacity" beginTime:&unk_1EDF177D8 duration:&unk_1EDF177E8 fromValue:v10 + a3 toValue:v7];
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

- (NSAttributedString)satelliteAvailabilityTitleLabelAttributedText
{
  return self->_satelliteAvailabilityTitleLabelAttributedText;
}

- (UILabel)satelliteAvailabilityTitleLabel
{
  return self->_satelliteAvailabilityTitleLabel;
}

- (void)setSatelliteAvailabilityTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satelliteAvailabilityTitleLabel, 0);

  objc_storeStrong((id *)&self->_satelliteAvailabilityTitleLabelAttributedText, 0);
}

@end