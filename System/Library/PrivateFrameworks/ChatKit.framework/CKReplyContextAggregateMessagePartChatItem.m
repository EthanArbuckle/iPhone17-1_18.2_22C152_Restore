@interface CKReplyContextAggregateMessagePartChatItem
- (BOOL)isReplyContextPreview;
- (BOOL)replyIsFromMe;
- (BOOL)wantsOutline;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (Class)balloonViewClass;
- (char)balloonStyle;
- (char)color;
- (id)bodyTextFont;
- (id)loadTranscriptDrawerText;
@end

@implementation CKReplyContextAggregateMessagePartChatItem

- (id)bodyTextFont
{
  v2 = +[CKUIBehavior sharedBehaviors];
  v3 = [v2 replyBalloonTextFont];

  return v3;
}

- (id)loadTranscriptDrawerText
{
  return 0;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (char)color
{
  v3 = [(CKChatItem *)self IMChatItem];
  int v4 = [v3 isFromMe];

  if (!v4) {
    return 9;
  }
  v5 = (void *)MEMORY[0x1E4F6BDB8];
  v6 = [(CKChatItem *)self IMChatItem];
  v7 = [v6 serviceName];
  v8 = [v5 serviceWithName:v7];
  char v9 = objc_msgSend(v8, "__ck_displayReplyColor");

  return v9;
}

- (char)balloonStyle
{
  return 1;
}

- (BOOL)wantsOutline
{
  return 1;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v10.receiver = self;
  v10.super_class = (Class)CKReplyContextAggregateMessagePartChatItem;
  [(CKBalloonDescriptor_t *)&v10 balloonDescriptor];
  retstr->var2 = [(CKReplyContextAggregateMessagePartChatItem *)self balloonStyle];
  retstr->var0 = 3;
  retstr->var10 = 1;
  retstr->var5 = [(CKReplyContextAggregateMessagePartChatItem *)self color];
  [(CKMessagePartChatItem *)self strokeColor];
  retstr->var6.red = v5;
  retstr->var6.green = v6;
  retstr->var6.blue = v7;
  retstr->var6.alpha = v8;
  retstr->var9 = 0;
  result = (CKBalloonDescriptor_t *)[(CKBalloonChatItem *)self balloonOrientation];
  retstr->var3 = (char)result;
  return result;
}

- (BOOL)isReplyContextPreview
{
  return 1;
}

- (BOOL)replyIsFromMe
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 replyIsFromMe];

  return v3;
}

@end