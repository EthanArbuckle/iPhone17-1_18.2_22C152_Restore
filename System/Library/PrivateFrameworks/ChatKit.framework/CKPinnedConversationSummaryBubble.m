@interface CKPinnedConversationSummaryBubble
- (BOOL)supportsActivityItemViewContentScale;
- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame;
- (CKPinnedConversationSummaryBubble)initWithSummaryBubbleActivityItem:(id)a3;
- (CKPinnedConversationSummaryBubbleActivityItem)summaryBubbleActivityItem;
- (NSAttributedString)summaryText;
- (UIEdgeInsets)contentViewPadding;
- (UILabel)summaryLabel;
- (double)pillCornerRadius;
- (id)_summaryLabelTextColor;
- (id)summaryLabelFont;
- (int64_t)contentViewContentMode;
- (void)_updateSummaryLabel;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)setActivityItem:(id)a3;
- (void)setActivityItemViewContentScale:(int64_t)a3;
- (void)setSummaryLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKPinnedConversationSummaryBubble

- (CKPinnedConversationSummaryBubble)initWithSummaryBubbleActivityItem:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  v11.receiver = self;
  v11.super_class = (Class)CKPinnedConversationSummaryBubble;
  v7 = [(CKPinnedConversationTailedActivityItemView *)&v11 initWithActivityItem:v5 contentView:v6 needsContentViewStroke:0];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_summaryBubbleActivityItem, a3);
    objc_storeStrong((id *)&v8->_summaryLabel, v6);
    [(UILabel *)v8->_summaryLabel setTextAlignment:1];
    [(UILabel *)v8->_summaryLabel setNumberOfLines:2];
    [(CKPinnedConversationSummaryBubble *)v8 _updateSummaryLabel];
    [(CKPinnedConversationSummaryBubble *)v8 addSubview:v8->_summaryLabel];
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v8 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4F43788] object:0];
  }
  return v8;
}

- (NSAttributedString)summaryText
{
  v2 = [(CKPinnedConversationSummaryBubble *)self summaryLabel];
  v3 = [v2 attributedText];

  return (NSAttributedString *)v3;
}

- (double)pillCornerRadius
{
  [(CKPinnedConversationSummaryBubble *)self contentViewPadding];
  v3 = [(CKPinnedConversationSummaryBubble *)self summaryLabel];
  [v3 setNumberOfLines:1];

  v4 = [(CKPinnedConversationSummaryBubble *)self summaryLabel];
  [v4 intrinsicContentSize];

  id v5 = [(CKPinnedConversationSummaryBubble *)self summaryLabel];
  [v5 setNumberOfLines:2];

  UIRoundToViewScale();
  return result;
}

- (void)setActivityItem:(id)a3
{
  id v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKPinnedConversationSummaryBubble;
  [(CKPinnedConversationTailedActivityItemView *)&v6 setActivityItem:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_summaryBubbleActivityItem, a3);
    [(CKPinnedConversationSummaryBubble *)self _updateSummaryLabel];
  }
}

- (void)_updateSummaryLabel
{
  summaryBubbleActivityItem = self->_summaryBubbleActivityItem;
  int64_t v4 = [(CKPinnedConversationTailedActivityItemView *)self activityItemViewContentScale];
  id v5 = [(CKPinnedConversationSummaryBubble *)self traitCollection];
  -[CKPinnedConversationSummaryBubbleActivityItem summaryAttributedStringForContentScale:userInterfaceStyle:](summaryBubbleActivityItem, "summaryAttributedStringForContentScale:userInterfaceStyle:", v4, [v5 userInterfaceStyle]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v6 = [(UILabel *)self->_summaryLabel attributedText];
  LOBYTE(v4) = [v6 isEqualToAttributedString:v7];

  if ((v4 & 1) == 0)
  {
    [(UILabel *)self->_summaryLabel setAttributedText:v7];
    [(CKPinnedConversationSummaryBubble *)self setNeedsLayout];
  }
}

- (BOOL)supportsActivityItemViewContentScale
{
  return 1;
}

- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame
{
  return 1;
}

- (void)setActivityItemViewContentScale:(int64_t)a3
{
  int64_t v5 = [(CKPinnedConversationTailedActivityItemView *)self activityItemViewContentScale];
  v6.receiver = self;
  v6.super_class = (Class)CKPinnedConversationSummaryBubble;
  [(CKPinnedConversationTailedActivityItemView *)&v6 setActivityItemViewContentScale:a3];
  if (v5 != a3) {
    [(CKPinnedConversationSummaryBubble *)self _updateSummaryLabel];
  }
}

- (id)summaryLabelFont
{
  summaryBubbleActivityItem = self->_summaryBubbleActivityItem;
  int64_t v3 = [(CKPinnedConversationTailedActivityItemView *)self activityItemViewContentScale];

  return [(CKPinnedConversationSummaryBubbleActivityItem *)summaryBubbleActivityItem summaryLabelFontForContentScale:v3];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  [(CKPinnedConversationSummaryBubble *)self _updateSummaryLabel];

  [(CKPinnedConversationSummaryBubble *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKPinnedConversationSummaryBubble;
  [(CKPinnedConversationTailedActivityItemView *)&v4 traitCollectionDidChange:a3];
  [(CKPinnedConversationSummaryBubble *)self _updateSummaryLabel];
}

- (id)_summaryLabelTextColor
{
  summaryBubbleActivityItem = self->_summaryBubbleActivityItem;
  int64_t v3 = [(CKPinnedConversationSummaryBubble *)self traitCollection];
  objc_super v4 = -[CKPinnedConversationSummaryBubbleActivityItem summaryLabelTextColorForUserInterfaceStyle:](summaryBubbleActivityItem, "summaryLabelTextColorForUserInterfaceStyle:", [v3 userInterfaceStyle]);

  return v4;
}

- (int64_t)contentViewContentMode
{
  return 0;
}

- (UIEdgeInsets)contentViewPadding
{
  int64_t v2 = [(CKPinnedConversationTailedActivityItemView *)self activityItemViewContentScale];
  double v3 = 0.0;
  if (v2 == 1) {
    double v3 = 7.0;
  }
  if (!v2) {
    double v3 = 5.0;
  }
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = v3;
  result.right = v5;
  result.bottom = v6;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CKPinnedConversationSummaryBubbleActivityItem)summaryBubbleActivityItem
{
  return self->_summaryBubbleActivityItem;
}

- (UILabel)summaryLabel
{
  return self->_summaryLabel;
}

- (void)setSummaryLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryLabel, 0);

  objc_storeStrong((id *)&self->_summaryBubbleActivityItem, 0);
}

@end