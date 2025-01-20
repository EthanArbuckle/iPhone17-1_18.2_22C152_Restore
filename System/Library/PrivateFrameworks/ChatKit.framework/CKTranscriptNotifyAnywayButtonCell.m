@interface CKTranscriptNotifyAnywayButtonCell
+ (id)notifyAnywayButton;
+ (id)reuseIdentifier;
- (CKTranscriptNotifyAnywayButtonCell)initWithFrame:(CGRect)a3;
- (NSAttributedString)notifyAnywayButtonAttributedText;
- (UIButton)notifyAnywayButton;
- (id)animationWithKeyPath:(id)a3 beginTime:(double)a4 duration:(double)a5 fromValue:(id)a6 toValue:(id)a7;
- (void)_fadeInLabelAtStartTime:(double)a3 completion:(id)a4;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)performInsertion:(id)a3;
- (void)setNotifyAnywayButton:(id)a3;
- (void)setNotifyAnywayButtonAttributedText:(id)a3;
@end

@implementation CKTranscriptNotifyAnywayButtonCell

- (void)layoutSubviewsForAlignmentContents
{
  v19.receiver = self;
  v19.super_class = (Class)CKTranscriptNotifyAnywayButtonCell;
  [(CKEditableCollectionViewCell *)&v19 layoutSubviewsForAlignmentContents];
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKTranscriptNotifyAnywayButtonCell *)self notifyAnywayButton];
  LODWORD(v12) = 1112014848;
  LODWORD(v13) = 1148846080;
  objc_msgSend(v11, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, v10, v12, v13);
  double v15 = v14;
  double v17 = v16;

  v18 = [(CKTranscriptNotifyAnywayButtonCell *)self notifyAnywayButton];
  objc_msgSend(v18, "setFrame:", v4 + floor((v8 - v15) * 0.5), v6 + floor((v10 - v17) * 0.5), v15, v17);
}

- (void)_fadeInLabelAtStartTime:(double)a3 completion:(id)a4
{
  double v15 = (void (**)(id, uint64_t))a4;
  [(CKTranscriptCell *)self insertionDuration];
  double v7 = v6;
  [MEMORY[0x1E4F39CF8] begin];
  double v8 = [(CKTranscriptNotifyAnywayButtonCell *)self notifyAnywayButton];
  double v9 = [v8 layer];
  [v9 setOpacity:0.0];
  [(CKTranscriptCell *)self insertionBeginTime];
  objc_msgSend(v9, "convertTime:fromLayer:", 0);
  v11 = [(CKTranscriptNotifyAnywayButtonCell *)self animationWithKeyPath:@"opacity" beginTime:&unk_1EDF174C8 duration:&unk_1EDF174D8 fromValue:v10 + a3 toValue:v7];
  [v9 addAnimation:v11 forKey:@"buttonFadeIn"];
  LODWORD(v12) = 1.0;
  [v9 setOpacity:v12];
  [MEMORY[0x1E4F39CF8] commit];
  double v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v14 = [v13 fullTranscriptLoggingEnabled];

  if (v14 && _IMWillLog()) {
    _IMAlwaysLog();
  }
  if (v15) {
    v15[2](v15, 1);
  }
}

+ (id)notifyAnywayButton
{
  v2 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  double v3 = +[CKUIBehavior sharedBehaviors];
  [v3 transcriptButtonContentEdgeInsets];
  objc_msgSend(v2, "setContentEdgeInsets:");

  return v2;
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKTranscriptNotifyAnywayButtonCell;
  id v12 = a3;
  [(CKTranscriptCell *)&v14 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  double v13 = objc_msgSend(v12, "transcriptText", v14.receiver, v14.super_class);

  [(CKTranscriptNotifyAnywayButtonCell *)self setNotifyAnywayButtonAttributedText:v13];
}

- (CKTranscriptNotifyAnywayButtonCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptNotifyAnywayButtonCell;
  double v3 = -[CKTranscriptCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = [(id)objc_opt_class() notifyAnywayButton];
    double v5 = [(CKEditableCollectionViewCell *)v3 contentView];
    [v5 addSubview:v4];

    [(CKTranscriptNotifyAnywayButtonCell *)v3 setNotifyAnywayButton:v4];
    double v6 = +[CKUIBehavior sharedBehaviors];
    double v7 = [v6 transcriptTextVibrancyEffect];
    [(CKEditableCollectionViewCell *)v3 setEffect:v7];
  }
  return v3;
}

+ (id)reuseIdentifier
{
  return @"CKTranscriptNotifyAnywayButtonCell";
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
      v9.super_class = (Class)CKTranscriptNotifyAnywayButtonCell;
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
  [(CKTranscriptNotifyAnywayButtonCell *)self _fadeInLabelAtStartTime:v4 completion:v5 + v7];
LABEL_11:
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  id v11 = [(CKTranscriptNotifyAnywayButtonCell *)self notifyAnywayButton];
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
  id v5 = [(CKTranscriptNotifyAnywayButtonCell *)self notifyAnywayButton];
  v2 = [v5 layer];
  [v2 setAllowsGroupBlending:1];

  double v3 = [v5 layer];
  [v3 setAllowsGroupOpacity:1];

  id v4 = [v5 layer];
  [v4 setCompositingFilter:0];

  [v5 setAlpha:1.0];
}

- (void)setNotifyAnywayButtonAttributedText:(id)a3
{
  id v6 = a3;
  id v4 = [(CKTranscriptNotifyAnywayButtonCell *)self notifyAnywayButtonAttributedText];

  if (v4 != v6)
  {
    id v5 = [(CKTranscriptNotifyAnywayButtonCell *)self notifyAnywayButton];
    [v5 setAttributedTitle:v6 forState:0];

    [(CKTranscriptNotifyAnywayButtonCell *)self setNeedsLayout];
  }
}

- (NSAttributedString)notifyAnywayButtonAttributedText
{
  v2 = [(CKTranscriptNotifyAnywayButtonCell *)self notifyAnywayButton];
  double v3 = [v2 attributedTitleForState:0];

  return (NSAttributedString *)v3;
}

- (id)animationWithKeyPath:(id)a3 beginTime:(double)a4 duration:(double)a5 fromValue:(id)a6 toValue:(id)a7
{
  id v11 = (void *)MEMORY[0x1E4F39B48];
  id v12 = a7;
  id v13 = a6;
  objc_super v14 = [v11 animationWithKeyPath:a3];
  [v14 setFromValue:v13];

  [v14 setToValue:v12];
  [v14 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v14 setRemovedOnCompletion:1];
  [v14 setBeginTime:a4];
  [v14 setDuration:a5];

  return v14;
}

- (UIButton)notifyAnywayButton
{
  return self->_notifyAnywayButton;
}

- (void)setNotifyAnywayButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end