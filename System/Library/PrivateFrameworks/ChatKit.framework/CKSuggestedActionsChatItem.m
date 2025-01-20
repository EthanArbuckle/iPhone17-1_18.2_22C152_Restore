@interface CKSuggestedActionsChatItem
- (BOOL)canAttachStickers;
- (BOOL)canCopy;
- (BOOL)canInlineReply;
- (BOOL)canPerformQuickAction;
- (BOOL)canSendTapbacks;
- (CKSuggestedActionsChatItem)init;
- (CKSuggestedActionsChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (CKSuggestedActionsChatItem)initWithNotification:(id)a3 maxWidth:(double)a4;
- (Class)balloonViewClass;
@end

@implementation CKSuggestedActionsChatItem

- (Class)balloonViewClass
{
  type metadata accessor for SuggestedActionsBalloonView();

  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)canSendTapbacks
{
  return 0;
}

- (BOOL)canPerformQuickAction
{
  return 0;
}

- (BOOL)canInlineReply
{
  return 0;
}

- (BOOL)canCopy
{
  return 0;
}

- (BOOL)canAttachStickers
{
  return 0;
}

- (CKSuggestedActionsChatItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SuggestedActionsChatItem();
  return [(CKMessagePartChatItem *)&v3 init];
}

- (CKSuggestedActionsChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  return (CKSuggestedActionsChatItem *)sub_18F6816E4(self, a4, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithIMChatItem_maxWidth_);
}

- (CKSuggestedActionsChatItem)initWithNotification:(id)a3 maxWidth:(double)a4
{
  return (CKSuggestedActionsChatItem *)sub_18F6816E4(self, a4, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithNotification_maxWidth_);
}

@end