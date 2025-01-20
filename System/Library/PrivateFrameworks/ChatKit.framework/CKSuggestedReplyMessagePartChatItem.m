@interface CKSuggestedReplyMessagePartChatItem
- (BOOL)canSendTapbacks;
- (Class)balloonViewClass;
- (_TtC7ChatKit35CKSuggestedReplyMessagePartChatItem)init;
- (_TtC7ChatKit35CKSuggestedReplyMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (_TtC7ChatKit35CKSuggestedReplyMessagePartChatItem)initWithNotification:(id)a3 maxWidth:(double)a4;
@end

@implementation CKSuggestedReplyMessagePartChatItem

- (_TtC7ChatKit35CKSuggestedReplyMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  return (_TtC7ChatKit35CKSuggestedReplyMessagePartChatItem *)CKSuggestedReplyMessagePartChatItem.init(imChatItem:maxWidth:)(a3, a4);
}

- (BOOL)canSendTapbacks
{
  return 0;
}

- (Class)balloonViewClass
{
  type metadata accessor for CKSuggestedReplyBalloonView();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC7ChatKit35CKSuggestedReplyMessagePartChatItem)init
{
  result = (_TtC7ChatKit35CKSuggestedReplyMessagePartChatItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7ChatKit35CKSuggestedReplyMessagePartChatItem)initWithNotification:(id)a3 maxWidth:(double)a4
{
  id v4 = a3;
  result = (_TtC7ChatKit35CKSuggestedReplyMessagePartChatItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit35CKSuggestedReplyMessagePartChatItem_suggestedReply));
}

@end