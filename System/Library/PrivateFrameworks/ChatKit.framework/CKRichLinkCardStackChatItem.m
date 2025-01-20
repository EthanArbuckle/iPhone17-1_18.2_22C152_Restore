@interface CKRichLinkCardStackChatItem
- (BOOL)canCopy;
- (BOOL)canSendTapbacks;
- (CKRichLinkCardStackChatItem)init;
- (CKRichLinkCardStackChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (CKRichLinkCardStackChatItem)initWithNotification:(id)a3 maxWidth:(double)a4;
- (Class)balloonViewClass;
- (IMRichCards)richCards;
- (UIEdgeInsets)contentInsets;
@end

@implementation CKRichLinkCardStackChatItem

- (BOOL)canSendTapbacks
{
  return 0;
}

- (BOOL)canCopy
{
  return 0;
}

- (UIEdgeInsets)contentInsets
{
  v2 = self;
  double v3 = sub_18F7642F4();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (Class)balloonViewClass
{
  v2 = self;
  uint64_t v3 = sub_18F764504();

  if (!v3) {
    return 0;
  }

  return (Class)swift_getObjCClassFromMetadata();
}

- (IMRichCards)richCards
{
  v2 = self;
  uint64_t v3 = [(CKChatItem *)v2 IMChatItem];
  if (v3)
  {
    self;
    double v4 = (void *)swift_dynamicCastObjCClass();
    if (!v4) {

    }
    uint64_t v3 = (IMTranscriptChatItem *)objc_msgSend(v4, sel_richCards);
  }
  else
  {
    double v4 = v2;
  }

  return v3;
}

- (CKRichLinkCardStackChatItem)init
{
  uint64_t v3 = OBJC_IVAR___CKRichLinkCardStackChatItem_viewClass;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)type metadata accessor for RichLinkCardStackItemView();
  *(int64x2_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKRichLinkCardStackChatItem_balloonSize) = vdupq_n_s64(0x407F400000000000uLL);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RichLinkCardStackChatItem();
  return [(CKMessagePartChatItem *)&v5 init];
}

- (CKRichLinkCardStackChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  return (CKRichLinkCardStackChatItem *)sub_18F764964((char *)self, a4, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithIMChatItem_maxWidth_);
}

- (CKRichLinkCardStackChatItem)initWithNotification:(id)a3 maxWidth:(double)a4
{
  return (CKRichLinkCardStackChatItem *)sub_18F764964((char *)self, a4, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithNotification_maxWidth_);
}

@end