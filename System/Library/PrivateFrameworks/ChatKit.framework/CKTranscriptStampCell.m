@interface CKTranscriptStampCell
+ (id)createStampTextView;
+ (id)reuseIdentifier;
- (BOOL)isRetractionStamp;
- (BOOL)wantsContactImageLayout;
- (BOOL)wantsOffsetForReplyLine;
- (CGRect)contentAlignmentRect;
- (CKTranscriptStampCell)initWithFrame:(CGRect)a3;
- (NSAttributedString)attributedText;
- (UIView)stampTextView;
- (id)animationWithKeyPath:(id)a3 beginTime:(double)a4 duration:(double)a5 fromValue:(id)a6 toValue:(id)a7;
- (id)debugBorderColor;
- (void)_fadeInLabelAtStartTime:(double)a3 completion:(id)a4;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)layoutSubviewsForContents;
- (void)performInsertion:(id)a3;
- (void)prepareForReuse;
- (void)setAttributedText:(id)a3;
- (void)setIsRetractionStamp:(BOOL)a3;
- (void)setOrientation:(char)a3;
- (void)setStampTextView:(id)a3;
- (void)setWantsContactImageLayout:(BOOL)a3;
- (void)setWantsOffsetForReplyLine:(BOOL)a3;
@end

@implementation CKTranscriptStampCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKTranscriptStampCell;
  id v12 = a3;
  [(CKTranscriptCell *)&v14 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  v13 = objc_msgSend(v12, "transcriptText", v14.receiver, v14.super_class);

  [(CKTranscriptStampCell *)self setAttributedText:v13];
}

+ (id)createStampTextView
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"CKTranscriptStampCell.m" lineNumber:21 description:@"Subclasses must implement createStampTextView"];

  return 0;
}

- (void)setAttributedText:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"CKTranscriptStampCell.m" lineNumber:26 description:@"Subclasses must implement setAttributedText:"];
}

- (NSAttributedString)attributedText
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CKTranscriptStampCell.m" lineNumber:30 description:@"Subclasses must implement attributedText"];

  return 0;
}

- (CKTranscriptStampCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptStampCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [(id)objc_opt_class() createStampTextView];
    id v5 = [(CKEditableCollectionViewCell *)v3 contentView];
    [v5 addSubview:v4];

    [(CKTranscriptStampCell *)v3 setStampTextView:v4];
    v6 = +[CKUIBehavior sharedBehaviors];
    v7 = [v6 transcriptTextVibrancyEffect];
    [(CKEditableCollectionViewCell *)v3 setEffect:v7];
  }
  return v3;
}

+ (id)reuseIdentifier
{
  return @"TS";
}

- (void)layoutSubviewsForContents
{
  v43.receiver = self;
  v43.super_class = (Class)CKTranscriptStampCell;
  [(CKEditableCollectionViewCell *)&v43 layoutSubviewsForContents];
  [(CKTranscriptStampCell *)self contentAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(CKTranscriptStampCell *)self wantsContactImageLayout])
  {
    if (![(CKEditableCollectionViewCell *)self orientation])
    {
      v11 = +[CKUIBehavior sharedBehaviors];
      [v11 transcriptContactImageDiameter];
      double v13 = v12;
      objc_super v14 = +[CKUIBehavior sharedBehaviors];
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
  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptStampCell;
  [(CKEditableCollectionViewCell *)&v12 layoutSubviewsForAlignmentContents];
  [(CKTranscriptStampCell *)self contentAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKTranscriptStampCell *)self stampTextView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (CGRect)contentAlignmentRect
{
  v20.receiver = self;
  v20.super_class = (Class)CKTranscriptStampCell;
  [(CKEditableCollectionViewCell *)&v20 contentAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (![(CKEditableCollectionViewCell *)self orientation]
    && [(CKTranscriptStampCell *)self wantsOffsetForReplyLine])
  {
    BOOL v11 = [(CKTranscriptStampCell *)self wantsContactImageLayout];
    objc_super v12 = +[CKUIBehavior sharedBehaviors];
    double v13 = v12;
    if (v11) {
      [v12 replyLineViewContactImageLayoutHorizontalPadding];
    }
    else {
      [v12 replyLineViewHorizontalPadding];
    }
    double v15 = v14;

    double v4 = v4 + v15;
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
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
      v9.super_class = (Class)CKTranscriptStampCell;
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
  [(CKTranscriptStampCell *)self _fadeInLabelAtStartTime:v4 completion:v5 + v7];
LABEL_11:
}

- (void)setOrientation:(char)a3
{
  int v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptStampCell;
  -[CKEditableCollectionViewCell setOrientation:](&v9, sel_setOrientation_);
  double v5 = [(CKTranscriptStampCell *)self stampTextView];
  int64_t v6 = v5;
  uint64_t v7 = 4;
  if (v3 == 2) {
    uint64_t v7 = 8;
  }
  if (v3) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 7;
  }
  [v5 setContentMode:v8];
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  id v9 = [(CKTranscriptStampCell *)self stampTextView];
  double v5 = [v9 layer];
  [v5 setAllowsGroupBlending:0];
  [v5 setAllowsGroupOpacity:0];
  int64_t v6 = [v4 textCompositingFilter];
  [v5 setCompositingFilter:v6];

  [v4 contentAlpha];
  double v8 = v7;

  [v9 setAlpha:v8];
}

- (void)clearFilters
{
  id v3 = [(CKTranscriptStampCell *)self stampTextView];
  v2 = [v3 layer];
  [v2 setAllowsGroupBlending:1];
  [v2 setAllowsGroupOpacity:1];
  [v2 setCompositingFilter:0];
  [v3 setAlpha:1.0];
}

- (void)setWantsContactImageLayout:(BOOL)a3
{
  if (self->_wantsContactImageLayout != a3)
  {
    self->_wantsContactImageLayout = a3;
    [(CKTranscriptStampCell *)self setNeedsLayout];
  }
}

- (void)setWantsOffsetForReplyLine:(BOOL)a3
{
  if (self->_wantsOffsetForReplyLine != a3)
  {
    self->_wantsOffsetForReplyLine = a3;
    [(CKTranscriptStampCell *)self setNeedsLayout];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptStampCell;
  [(CKTranscriptCell *)&v3 prepareForReuse];
  [(CKTranscriptStampCell *)self setWantsOffsetForReplyLine:0];
}

- (void)_fadeInLabelAtStartTime:(double)a3 completion:(id)a4
{
  double v15 = (void (**)(id, uint64_t))a4;
  [(CKTranscriptCell *)self insertionDuration];
  double v7 = v6;
  [MEMORY[0x1E4F39CF8] begin];
  double v8 = [(CKTranscriptStampCell *)self stampTextView];
  id v9 = [v8 layer];
  [v9 setOpacity:0.0];
  [(CKTranscriptCell *)self insertionBeginTime];
  objc_msgSend(v9, "convertTime:fromLayer:", 0);
  BOOL v11 = [(CKTranscriptStampCell *)self animationWithKeyPath:@"opacity" beginTime:&unk_1EDF174A8 duration:&unk_1EDF174B8 fromValue:v10 + a3 toValue:v7];
  [v9 addAnimation:v11 forKey:@"labelFadeIn"];
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

- (id)animationWithKeyPath:(id)a3 beginTime:(double)a4 duration:(double)a5 fromValue:(id)a6 toValue:(id)a7
{
  BOOL v11 = (void *)MEMORY[0x1E4F39B48];
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

- (id)debugBorderColor
{
  return (id)[MEMORY[0x1E4F428B8] greenColor];
}

- (BOOL)wantsContactImageLayout
{
  return self->_wantsContactImageLayout;
}

- (BOOL)wantsOffsetForReplyLine
{
  return self->_wantsOffsetForReplyLine;
}

- (BOOL)isRetractionStamp
{
  return self->_isRetractionStamp;
}

- (void)setIsRetractionStamp:(BOOL)a3
{
  self->_isRetractionStamp = a3;
}

- (UIView)stampTextView
{
  return self->_stampTextView;
}

- (void)setStampTextView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end