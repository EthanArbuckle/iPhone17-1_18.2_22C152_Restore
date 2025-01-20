@interface CKStickerReactionSession
- (BOOL)didSendSticker;
- (CKConversation)conversation;
- (CKMessagePartChatItem)chatItem;
- (CKStickerReactionSession)init;
- (CKStickerReactionSession)initWithConversation:(id)a3 chatItem:(id)a4 cell:(id)a5;
- (CKTranscriptBalloonCell)cell;
- (void)sendSticker:(id)a3;
- (void)setCell:(id)a3;
- (void)setChatItem:(id)a3;
- (void)setConversation:(id)a3;
@end

@implementation CKStickerReactionSession

- (CKConversation)conversation
{
  return (CKConversation *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___CKStickerReactionSession_conversation));
}

- (void)setConversation:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKStickerReactionSession_conversation);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKStickerReactionSession_conversation) = (Class)a3;
  id v3 = a3;
}

- (CKMessagePartChatItem)chatItem
{
  return (CKMessagePartChatItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___CKStickerReactionSession_chatItem));
}

- (void)setChatItem:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKStickerReactionSession_chatItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKStickerReactionSession_chatItem) = (Class)a3;
  id v3 = a3;
}

- (CKTranscriptBalloonCell)cell
{
  return (CKTranscriptBalloonCell *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___CKStickerReactionSession_cell));
}

- (void)setCell:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKStickerReactionSession_cell);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKStickerReactionSession_cell) = (Class)a3;
  id v3 = a3;
}

- (CKStickerReactionSession)initWithConversation:(id)a3 chatItem:(id)a4 cell:(id)a5
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CKStickerReactionSession__didSendSticker) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKStickerReactionSession_conversation) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKStickerReactionSession_chatItem) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKStickerReactionSession_cell) = (Class)a5;
  v11.receiver = self;
  v11.super_class = (Class)CKStickerReactionSession;
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  return [(CKStickerReactionSession *)&v11 init];
}

- (void)sendSticker:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F4ED744(v4);
}

- (BOOL)didSendSticker
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CKStickerReactionSession__didSendSticker);
}

- (CKStickerReactionSession)init
{
  result = (CKStickerReactionSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKStickerReactionSession_cell);
}

@end