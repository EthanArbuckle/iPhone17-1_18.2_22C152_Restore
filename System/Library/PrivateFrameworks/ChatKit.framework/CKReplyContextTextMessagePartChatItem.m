@interface CKReplyContextTextMessagePartChatItem
- (BOOL)canBeSelectedInEditMode;
- (BOOL)isReplyContextPreview;
- (BOOL)replyIsFromMe;
- (BOOL)wantsOutline;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (Class)balloonViewClass;
- (char)balloonStyle;
- (char)color;
- (id)bodyTextFont;
- (id)loadTranscriptDrawerText;
- (id)meMentionsTextColor;
- (int64_t)bigEmojiStyle;
@end

@implementation CKReplyContextTextMessagePartChatItem

- (id)bodyTextFont
{
  v2 = +[CKUIBehavior sharedBehaviors];
  v3 = [v2 replyBalloonTextFont];

  return v3;
}

- (id)meMentionsTextColor
{
  v2 = +[CKUIBehavior sharedBehaviors];
  v3 = [v2 theme];
  v4 = [v3 balloonTextColorForColorType:10];

  return v4;
}

- (id)loadTranscriptDrawerText
{
  return 0;
}

- (int64_t)bigEmojiStyle
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
  v13.receiver = self;
  v13.super_class = (Class)CKReplyContextTextMessagePartChatItem;
  [(CKBalloonDescriptor_t *)&v13 balloonDescriptor];
  retstr->var2 = [(CKReplyContextTextMessagePartChatItem *)self balloonStyle];
  retstr->var0 = 3;
  retstr->var10 = 1;
  retstr->var5 = [(CKReplyContextTextMessagePartChatItem *)self color];
  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 theme];
  v7 = objc_msgSend(v6, "unfilledBalloonColorForColorType:", -[CKReplyContextTextMessagePartChatItem color](self, "color"));
  [v7 ckColor];
  retstr->var6.red = v8;
  retstr->var6.green = v9;
  retstr->var6.blue = v10;
  retstr->var6.alpha = v11;

  retstr->var9 = 0;
  result = (CKBalloonDescriptor_t *)[(CKBalloonChatItem *)self balloonOrientation];
  retstr->var3 = (char)result;
  return result;
}

- (BOOL)canBeSelectedInEditMode
{
  return 0;
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