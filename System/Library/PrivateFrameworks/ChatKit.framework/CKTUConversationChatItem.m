@interface CKTUConversationChatItem
- (BOOL)canAttachStickers;
- (BOOL)canCopy;
- (BOOL)canForward;
- (BOOL)canInlineReply;
- (BOOL)canSendAsTextMessage;
- (BOOL)canSendTapbacks;
- (BOOL)isSenderUnknown;
- (BOOL)isSendersUnknown;
- (BOOL)shouldCacheSize;
- (Class)balloonViewClass;
- (NSUUID)tuConversationUUID;
- (char)color;
- (id)faceTimeConversation;
- (id)message;
- (id)messageItem;
- (id)sender;
- (id)time;
- (int64_t)stewieConversationID;
- (unint64_t)conversationAVMode;
- (void)configureBalloonView:(id)a3;
@end

@implementation CKTUConversationChatItem

- (BOOL)canCopy
{
  return 0;
}

- (BOOL)canForward
{
  return 0;
}

- (BOOL)canSendAsTextMessage
{
  return 0;
}

- (BOOL)canInlineReply
{
  return 0;
}

- (BOOL)canAttachStickers
{
  return 0;
}

- (BOOL)canSendTapbacks
{
  return 0;
}

- (id)message
{
  return 0;
}

- (id)messageItem
{
  return 0;
}

- (int64_t)stewieConversationID
{
  return 0;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldCacheSize
{
  return 0;
}

- (void)configureBalloonView:(id)a3
{
}

- (id)time
{
  v2 = [(CKChatItem *)self IMChatItem];
  v3 = [v2 time];

  return v3;
}

- (id)sender
{
  v2 = [(CKChatItem *)self IMChatItem];
  v3 = [v2 conversationInitiator];

  return v3;
}

- (char)color
{
  v2 = (void *)MEMORY[0x1E4F6BCC0];
  v3 = [(CKTUConversationChatItem *)self faceTimeConversation];
  LODWORD(v2) = [v2 conversationIsAVLessSharePlay:v3];

  if (v2) {
    return -1;
  }
  else {
    return 7;
  }
}

- (NSUUID)tuConversationUUID
{
  v2 = [(CKChatItem *)self IMChatItem];
  v3 = [v2 tuConversationUUID];

  return (NSUUID *)v3;
}

- (id)faceTimeConversation
{
  v2 = [(CKChatItem *)self IMChatItem];
  v3 = [v2 tuConversation];

  return v3;
}

- (BOOL)isSendersUnknown
{
  v2 = [(CKChatItem *)self IMChatItem];
  v3 = [v2 message];
  if ([v3 isSenderUnknown])
  {
    v4 = [v2 chatContext];
    int v5 = [v4 hasResponded] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (unint64_t)conversationAVMode
{
  v2 = [(CKChatItem *)self IMChatItem];
  unint64_t v3 = [v2 conversationAVMode];

  return v3;
}

- (BOOL)isSenderUnknown
{
  return self->_senderUnknown;
}

@end