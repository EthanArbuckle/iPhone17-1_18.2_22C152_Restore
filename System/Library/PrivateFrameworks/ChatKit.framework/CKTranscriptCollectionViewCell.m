@interface CKTranscriptCollectionViewCell
+ (id)reuseIdentifier;
- (BOOL)isAnimatingInDarkEffect;
- (BOOL)isInReplyContext;
- (BOOL)wantsDrawerLayout;
- (CGRect)contentAlignmentRect;
- (NSString)description;
- (UILabel)debugLabel;
- (char)orientation;
- (double)associatedItemOffset;
- (double)drawerPercentRevealed;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAssociatedItemOffset:(double)a3;
- (void)setContentAlignmentRect:(CGRect)a3;
- (void)setDebugLabel:(id)a3;
- (void)setDrawerPercentRevealed:(double)a3;
- (void)setIsAnimatingInDarkEffect:(BOOL)a3;
- (void)setIsInReplyContext:(BOOL)a3;
- (void)setOrientation:(char)a3;
- (void)setWantsDrawerLayout:(BOOL)a3;
@end

@implementation CKTranscriptCollectionViewCell

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)CKTranscriptCollectionViewCell;
  [(CKTranscriptCollectionViewCell *)&v16 layoutSubviews];
  v3 = [(CKTranscriptCollectionViewCell *)self debugLabel];

  if (v3)
  {
    v4 = [(CKTranscriptCollectionViewCell *)self contentView];
    v5 = [MEMORY[0x1E4F428B8] systemPinkColor];
    [v4 setBackgroundColor:v5];

    v6 = [(CKTranscriptCollectionViewCell *)self contentView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    v15 = [(CKTranscriptCollectionViewCell *)self debugLabel];
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptCollectionViewCell;
  [(CKTranscriptCollectionViewCell *)&v4 prepareForReuse];
  v3 = [(CKTranscriptCollectionViewCell *)self debugLabel];
  [v3 setText:0];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CKTranscriptCollectionViewCell *)self debugLabel];
  v6 = [v5 text];
  double v7 = [v3 stringWithFormat:@"%@-%p %@", v4, self, v6];

  return (NSString *)v7;
}

+ (id)reuseIdentifier
{
  return @"TC";
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  id v8 = a3;
  double v9 = [(CKTranscriptCollectionViewCell *)self debugLabel];

  if (!v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v11 setAdjustsFontSizeToFitWidth:1];
    [v11 setNumberOfLines:0];
    double v12 = [(CKTranscriptCollectionViewCell *)self contentView];
    [v12 addSubview:v11];

    [(CKTranscriptCollectionViewCell *)self setDebugLabel:v11];
  }
  double v13 = NSString;
  uint64_t v14 = objc_opt_class();
  v15 = [v8 IMChatItem];

  objc_super v16 = [v15 guid];
  id v18 = [v13 stringWithFormat:@"%@-%@", v14, v16];

  v17 = [(CKTranscriptCollectionViewCell *)self debugLabel];
  [v17 setText:v18];
}

- (BOOL)isAnimatingInDarkEffect
{
  return self->isAnimatingInDarkEffect;
}

- (void)setIsAnimatingInDarkEffect:(BOOL)a3
{
  self->isAnimatingInDarkEffect = a3;
}

- (CGRect)contentAlignmentRect
{
  double x = self->contentAlignmentRect.origin.x;
  double y = self->contentAlignmentRect.origin.y;
  double width = self->contentAlignmentRect.size.width;
  double height = self->contentAlignmentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentAlignmentRect:(CGRect)a3
{
  self->contentAlignmentRect = a3;
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (void)setDebugLabel:(id)a3
{
}

- (BOOL)wantsDrawerLayout
{
  return self->_wantsDrawerLayout;
}

- (void)setWantsDrawerLayout:(BOOL)a3
{
  self->_wantsDrawerLayout = a3;
}

- (char)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(char)a3
{
  self->_orientation = a3;
}

- (double)drawerPercentRevealed
{
  return self->_drawerPercentRevealed;
}

- (void)setDrawerPercentRevealed:(double)a3
{
  self->_drawerPercentRevealed = a3;
}

- (double)associatedItemOffset
{
  return self->_associatedItemOffset;
}

- (void)setAssociatedItemOffset:(double)a3
{
  self->_associatedItemOffset = a3;
}

- (BOOL)isInReplyContext
{
  return self->_isInReplyContext;
}

- (void)setIsInReplyContext:(BOOL)a3
{
  self->_isInReplyContext = a3;
}

- (void).cxx_destruct
{
}

@end