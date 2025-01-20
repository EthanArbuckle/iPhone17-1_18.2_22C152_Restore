@interface CKPinnedConversationRichLinkBubble
- (BOOL)supportsActivityItemViewContentScale;
- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame;
- (CKPinnedConversationRichLinkActivityItem)richLinkActivityItem;
- (CKPinnedConversationRichLinkBubble)initWithRichLinkActivityItem:(id)a3;
- (LPLinkView)linkView;
- (UIEdgeInsets)contentViewPadding;
- (double)contentViewHorizontalInsetForPillCornerRadius;
- (double)pillCornerRadius;
- (int64_t)activityItemViewContentScale;
- (int64_t)contentViewContentMode;
- (void)_updateLinkMetadata;
- (void)_updatePillCornerRadius;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)linkViewNeedsResize:(id)a3;
- (void)setActivityItem:(id)a3;
- (void)setActivityItemViewContentScale:(int64_t)a3;
- (void)setLinkView:(id)a3;
@end

@implementation CKPinnedConversationRichLinkBubble

- (CKPinnedConversationRichLinkBubble)initWithRichLinkActivityItem:(id)a3
{
  id v5 = a3;
  v6 = [v5 linkPreviewContentView];
  [v6 setDelegate:self];
  v11.receiver = self;
  v11.super_class = (Class)CKPinnedConversationRichLinkBubble;
  v7 = [(CKPinnedConversationTailedActivityItemView *)&v11 initWithActivityItem:v5 contentView:v6 needsContentViewStroke:0];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_richLinkActivityItem, a3);
    objc_storeStrong((id *)&v8->_linkView, v6);
    [(CKPinnedConversationRichLinkBubble *)v8 addSubview:v8->_linkView];
    [(CKPinnedConversationRichLinkBubble *)v8 _updatePillCornerRadius];
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v8 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4F43788] object:0];
  }
  return v8;
}

- (UIEdgeInsets)contentViewPadding
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)contentViewHorizontalInsetForPillCornerRadius
{
  return 4.0;
}

- (void)_updatePillCornerRadius
{
  id v5 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43890] addingSymbolicTraits:0 options:1];
  double v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];
  [v3 lineHeight];
  UIRoundToViewScale();
  self->_pillCornerRadius = v4;
}

- (void)setActivityItem:(id)a3
{
  id v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKPinnedConversationRichLinkBubble;
  [(CKPinnedConversationTailedActivityItemView *)&v6 setActivityItem:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_richLinkActivityItem, a3);
    [(CKPinnedConversationRichLinkBubble *)self _updateLinkMetadata];
  }
}

- (BOOL)supportsActivityItemViewContentScale
{
  return 0;
}

- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame
{
  return 1;
}

- (void)_updateLinkMetadata
{
  id v7 = [(CKPinnedConversationRichLinkBubble *)self richLinkActivityItem];
  double v3 = [v7 message];
  double v4 = [v7 chatContext];
  id v5 = [v3 richLinkDataSourceWithChatContext:v4];

  objc_super v6 = [v5 richLinkMetadata];
  [(LPLinkView *)self->_linkView setMetadata:v6];
  [(CKPinnedConversationRichLinkBubble *)self setNeedsLayout];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  [(CKPinnedConversationRichLinkBubble *)self _updatePillCornerRadius];

  [(CKPinnedConversationRichLinkBubble *)self setNeedsLayout];
}

- (int64_t)contentViewContentMode
{
  return 0;
}

- (void)linkViewNeedsResize:(id)a3
{
  id v4 = [(CKPinnedConversationTailedActivityItemView *)self activityItemViewDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 activityItemViewNeedsResize:self];
  }
}

- (double)pillCornerRadius
{
  return self->_pillCornerRadius;
}

- (int64_t)activityItemViewContentScale
{
  return self->_activityItemViewContentScale;
}

- (void)setActivityItemViewContentScale:(int64_t)a3
{
  self->_activityItemViewContentScale = a3;
}

- (CKPinnedConversationRichLinkActivityItem)richLinkActivityItem
{
  return self->_richLinkActivityItem;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void)setLinkView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkView, 0);

  objc_storeStrong((id *)&self->_richLinkActivityItem, 0);
}

@end