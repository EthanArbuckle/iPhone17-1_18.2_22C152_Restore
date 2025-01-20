@interface CKSuggestedRepliesMessagePartChatItem
- (BOOL)canSendTapbacks;
- (Class)balloonViewClass;
- (_TtC7ChatKit37CKSuggestedRepliesMessagePartChatItem)init;
- (_TtC7ChatKit37CKSuggestedRepliesMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (_TtC7ChatKit37CKSuggestedRepliesMessagePartChatItem)initWithNotification:(id)a3 maxWidth:(double)a4;
- (int64_t)selectedIndex;
@end

@implementation CKSuggestedRepliesMessagePartChatItem

- (int64_t)selectedIndex
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC7ChatKit37CKSuggestedRepliesMessagePartChatItem_selectedIndex);
}

- (_TtC7ChatKit37CKSuggestedRepliesMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  return (_TtC7ChatKit37CKSuggestedRepliesMessagePartChatItem *)CKSuggestedRepliesMessagePartChatItem.init(imChatItem:maxWidth:)(a3, a4);
}

- (BOOL)canSendTapbacks
{
  return 0;
}

- (Class)balloonViewClass
{
  type metadata accessor for CKSuggestedRepliesBalloonView();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC7ChatKit37CKSuggestedRepliesMessagePartChatItem)init
{
  result = (_TtC7ChatKit37CKSuggestedRepliesMessagePartChatItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7ChatKit37CKSuggestedRepliesMessagePartChatItem)initWithNotification:(id)a3 maxWidth:(double)a4
{
  id v4 = a3;
  result = (_TtC7ChatKit37CKSuggestedRepliesMessagePartChatItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end