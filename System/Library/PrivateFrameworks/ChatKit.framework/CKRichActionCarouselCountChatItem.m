@interface CKRichActionCarouselCountChatItem
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKRichActionCarouselCountChatItem)init;
- (CKRichActionCarouselCountChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (CKRichActionCarouselCountChatItem)initWithNotification:(id)a3 maxWidth:(double)a4;
- (UIEdgeInsets)contentInsets;
- (id)loadTranscriptText;
- (int64_t)selectedRichCardIndex;
- (int64_t)totalCount;
@end

@implementation CKRichActionCarouselCountChatItem

- (UIEdgeInsets)contentInsets
{
  double v2 = 0.0;
  double v3 = 16.0;
  double v4 = -4.0;
  double v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)loadTranscriptText
{
  double v2 = self;
  sub_18F6E5324();
  double v4 = v3;

  return v4;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  v6 = self;
  id v7 = [(CKRichActionCarouselCountChatItem *)v6 loadTranscriptText];
  objc_msgSend(v7, sel_boundingRectWithSize_options_context_, 3, 0, width, height);
  double v9 = v8;

  double v10 = 0.0;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (int64_t)selectedRichCardIndex
{
  return sub_18F6E5A9C(self, (uint64_t)a2, (SEL *)&selRef_selectedIndex);
}

- (int64_t)totalCount
{
  return sub_18F6E5A9C(self, (uint64_t)a2, (SEL *)&selRef_totalCount);
}

- (CKRichActionCarouselCountChatItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RichActionCarouselCountChatItem();
  return [(CKRichActionCarouselCountChatItem *)&v3 init];
}

- (CKRichActionCarouselCountChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  return (CKRichActionCarouselCountChatItem *)sub_18F6E5D5C(self, a4, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithIMChatItem_maxWidth_);
}

- (CKRichActionCarouselCountChatItem)initWithNotification:(id)a3 maxWidth:(double)a4
{
  return (CKRichActionCarouselCountChatItem *)sub_18F6E5D5C(self, a4, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithNotification_maxWidth_);
}

@end