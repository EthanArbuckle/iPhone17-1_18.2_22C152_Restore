@interface CKTranscriptCell
- (BOOL)insertingBeforeReplyPreview;
- (BOOL)insertingWithReplyPreview;
- (BOOL)shouldConfigureForDarkFSM;
- (BOOL)shouldFreezeReplyDecorationsForTimestampReveal;
- (BOOL)suppressesAnimationsForLineUpdates;
- (CKTranscriptCell)initWithFrame:(CGRect)a3;
- (NSArray)linkInteractions;
- (UIColor)debugBorderColor;
- (double)drawerPercentRevealed;
- (double)insertionBeginTime;
- (double)insertionDuration;
- (int64_t)emphasisState;
- (int64_t)insertionType;
- (void)_configureForDebugOutliningIfNeeded;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviews;
- (void)layoutSubviewsForDrawer;
- (void)prepareForReuse;
- (void)setDrawerPercentRevealed:(double)a3;
- (void)setEmphasisState:(int64_t)a3;
- (void)setInsertingBeforeReplyPreview:(BOOL)a3;
- (void)setInsertingWithReplyPreview:(BOOL)a3;
- (void)setInsertionBeginTime:(double)a3;
- (void)setInsertionDuration:(double)a3;
- (void)setInsertionType:(int64_t)a3;
- (void)setLinkInteractions:(id)a3;
- (void)setShouldConfigureForDarkFSM:(BOOL)a3;
- (void)setShouldFreezeReplyDecorationsForTimestampReveal:(BOOL)a3;
- (void)setSuppressAnimationsForLineUpdates:(BOOL)a3;
@end

@implementation CKTranscriptCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  id v15 = a3;
  [v15 contentInsets];
  -[CKEditableCollectionViewCell setContentInsets:](self, "setContentInsets:");
  uint64_t v8 = [v15 transcriptOrientation];
  if ([(CKEditableCollectionViewCell *)self orientation] != v8)
  {
    [(CKEditableCollectionViewCell *)self setOrientation:v8];
    [(CKTranscriptCell *)self setNeedsLayout];
  }
  int v9 = [v15 canBeSelectedInEditMode];
  if ([v15 itemIsReplyContextPreview])
  {
    int isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_opt_class();
  int v11 = objc_opt_isKindOfClass();
  objc_opt_class();
  int v12 = isKindOfClass | v11 | objc_opt_isKindOfClass();
  uint64_t v13 = 2;
  if (!v9) {
    uint64_t v13 = 0;
  }
  if (v12) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v13;
  }
  [(CKEditableCollectionViewCell *)self setEditingStyle:v14];
}

- (CKTranscriptCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKTranscriptCell *)v3 layer];
    [v5 setAllowsGroupOpacity:0];

    [(CKTranscriptCell *)v4 _configureForDebugOutliningIfNeeded];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptCell;
  [(CKEditableCollectionViewCell *)&v3 layoutSubviews];
  [(CKEditableCollectionViewCell *)self layoutSubviewsForContents];
  [(CKTranscriptCell *)self layoutSubviewsForDrawer];
  [(CKEditableCollectionViewCell *)self layoutSubviewsForAlignmentContents];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptCell;
  [(CKTranscriptCell *)&v5 prepareForReuse];
  [(CKEditableCollectionViewCell *)self clearFilters];
  [(CKTranscriptCell *)self setInsertionDuration:0.0];
  [(CKTranscriptCell *)self setInsertingBeforeReplyPreview:0];
  [(CKTranscriptCell *)self setInsertingWithReplyPreview:0];
  [(CKTranscriptCell *)self setSuppressAnimationsForLineUpdates:0];
  [(CKEditableCollectionViewCell *)self setIsInReplyContext:0];
  [(CKTranscriptCell *)self setShouldFreezeReplyDecorationsForTimestampReveal:0];
  [(CKTranscriptCell *)self setDrawerPercentRevealed:0.0];
  objc_super v3 = [(CKEditableCollectionViewCell *)self contentView];
  [v3 setAlpha:1.0];

  v4 = [(CKTranscriptCell *)self layer];
  [v4 setFilters:0];

  [(CKTranscriptCell *)self setEmphasisState:0];
}

- (void)setDrawerPercentRevealed:(double)a3
{
  if (self->_drawerPercentRevealed != a3)
  {
    self->_drawerPercentRevealed = a3;
    [(CKTranscriptCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviewsForDrawer
{
  v37.receiver = self;
  v37.super_class = (Class)CKTranscriptCell;
  [(CKEditableCollectionViewCell *)&v37 layoutSubviewsForDrawer];
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int v11 = [(CKEditableCollectionViewCell *)self contentView];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = +[CKUIBehavior sharedBehaviors];
  if ([(CKEditableCollectionViewCell *)self wantsDrawerLayout])
  {
    if ([(CKEditableCollectionViewCell *)self orientation])
    {
      if ([(CKEditableCollectionViewCell *)self orientation] == 2)
      {
        [(CKTranscriptCell *)self drawerPercentRevealed];
        double v35 = v21;
        [(CKEditableCollectionViewCell *)self marginInsets];
        double v23 = v22;
        double v32 = v25;
        double v33 = v24;
        double v31 = v26;
        objc_msgSend(v20, "transcriptDrawerWidthForMarginInsets:");
        double v34 = v27;
        objc_msgSend(v20, "transcriptDrawerOverlapForMarginInsets:", v23, v33, v32, v31);
        double v13 = -((v34 - v28) * v35);
      }
    }
    else if (([v20 timestampsPushBalloons] & 1) == 0)
    {
      [(CKTranscriptCell *)self drawerPercentRevealed];
      double v36 = v29;
      double v13 = -(v4 * v29);
      [(CKEditableCollectionViewCell *)self contentAlignmentInsets];
      double v4 = v4 + v36 * v30;
    }
  }
  -[CKEditableCollectionViewCell setContentAlignmentRect:](self, "setContentAlignmentRect:", v4, v6, v8, v10);
  objc_msgSend(v11, "setFrame:", v13, v15, v17, v19);
}

- (void)setLinkInteractions:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  linkInteractions = self->_linkInteractions;
  if (linkInteractions)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v6 = linkInteractions;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          [(CKTranscriptCell *)self removeInteraction:*(void *)(*((void *)&v23 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
  }
  int v11 = (NSArray *)[v4 copy];
  double v12 = self->_linkInteractions;
  self->_linkInteractions = v11;

  double v13 = self->_linkInteractions;
  if (v13)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v14 = v13;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          -[CKTranscriptCell addInteraction:](self, "addInteraction:", *(void *)(*((void *)&v19 + 1) + 8 * v18++), (void)v19);
        }
        while (v16 != v18);
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }
  }
}

- (UIColor)debugBorderColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] redColor];
}

- (void)_configureForDebugOutliningIfNeeded
{
  if (_configureForDebugOutliningIfNeeded_onceToken != -1) {
    dispatch_once(&_configureForDebugOutliningIfNeeded_onceToken, &__block_literal_global_275);
  }
  if (_configureForDebugOutliningIfNeeded_wantsDebugOutlining)
  {
    double v3 = [(CKEditableCollectionViewCell *)self contentView];
    id v7 = [v3 layer];

    [v7 setBorderWidth:1.0];
    id v4 = [(CKTranscriptCell *)self debugBorderColor];
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v4, "CGColor"));

    double v5 = [(CKTranscriptCell *)self debugBorderColor];
    id v6 = [v5 colorWithAlphaComponent:0.12];
    objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));
  }
}

void __55__CKTranscriptCell__configureForDebugOutliningIfNeeded__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v1 = [v0 BOOLForKey:@"showTranscriptCellDebugBorders"];

  v2 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v3 = [v2 isInternalInstall];

  _configureForDebugOutliningIfNeeded_wantsDebugOutlining = v1 & v3;
}

- (double)drawerPercentRevealed
{
  return self->_drawerPercentRevealed;
}

- (BOOL)shouldConfigureForDarkFSM
{
  return self->_shouldConfigureForDarkFSM;
}

- (void)setShouldConfigureForDarkFSM:(BOOL)a3
{
  self->_shouldConfigureForDarkFSM = a3;
}

- (int64_t)emphasisState
{
  return self->_emphasisState;
}

- (void)setEmphasisState:(int64_t)a3
{
  self->_emphasisState = a3;
}

- (int64_t)insertionType
{
  return self->_insertionType;
}

- (void)setInsertionType:(int64_t)a3
{
  self->_insertionType = a3;
}

- (double)insertionDuration
{
  return self->_insertionDuration;
}

- (void)setInsertionDuration:(double)a3
{
  self->_insertionDuration = a3;
}

- (double)insertionBeginTime
{
  return self->_insertionBeginTime;
}

- (void)setInsertionBeginTime:(double)a3
{
  self->_insertionBeginTime = a3;
}

- (BOOL)insertingBeforeReplyPreview
{
  return self->_insertingBeforeReplyPreview;
}

- (void)setInsertingBeforeReplyPreview:(BOOL)a3
{
  self->_insertingBeforeReplyPreview = a3;
}

- (BOOL)insertingWithReplyPreview
{
  return self->_insertingWithReplyPreview;
}

- (void)setInsertingWithReplyPreview:(BOOL)a3
{
  self->_insertingWithReplyPreview = a3;
}

- (BOOL)suppressesAnimationsForLineUpdates
{
  return self->_suppressAnimationsForLineUpdates;
}

- (void)setSuppressAnimationsForLineUpdates:(BOOL)a3
{
  self->_suppressAnimationsForLineUpdates = a3;
}

- (BOOL)shouldFreezeReplyDecorationsForTimestampReveal
{
  return self->_shouldFreezeReplyDecorationsForTimestampReveal;
}

- (void)setShouldFreezeReplyDecorationsForTimestampReveal:(BOOL)a3
{
  self->_shouldFreezeReplyDecorationsForTimestampReveal = a3;
}

- (NSArray)linkInteractions
{
  return self->_linkInteractions;
}

- (void).cxx_destruct
{
}

@end