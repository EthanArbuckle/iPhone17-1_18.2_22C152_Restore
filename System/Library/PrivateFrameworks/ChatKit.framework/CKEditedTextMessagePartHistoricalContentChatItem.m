@interface CKEditedTextMessagePartHistoricalContentChatItem
- (BOOL)canBeSelectedInEditMode;
- (BOOL)wantsOutline;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (Class)balloonViewClass;
- (char)balloonStyle;
- (char)color;
- (id)historicalContent;
- (id)meMentionsTextColor;
- (id)time;
- (int64_t)bigEmojiStyle;
@end

@implementation CKEditedTextMessagePartHistoricalContentChatItem

- (id)meMentionsTextColor
{
  v2 = +[CKUIBehavior sharedBehaviors];
  v3 = [v2 theme];
  v4 = [v3 balloonTextColorForColorType:10];

  return v4;
}

- (id)time
{
  v2 = [(CKEditedTextMessagePartHistoricalContentChatItem *)self historicalContent];
  v3 = [v2 dateSent];

  return v3;
}

- (int64_t)bigEmojiStyle
{
  return 0;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (id)historicalContent
{
  v2 = [(CKEditedTextMessagePartHistoricalContentChatItem *)self editedMessagePartChatItem];
  v3 = [v2 historicalContent];

  return v3;
}

- (char)color
{
  v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isPriusEnabled];

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)CKEditedTextMessagePartHistoricalContentChatItem;
    return [(CKMessagePartChatItem *)&v8 color];
  }
  else
  {
    v6 = [(CKChatItem *)self IMChatItem];
    if ([v6 isFromMe]) {
      char v5 = 1;
    }
    else {
      char v5 = -1;
    }
  }
  return v5;
}

- (char)balloonStyle
{
  return 0;
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
  v13.super_class = (Class)CKEditedTextMessagePartHistoricalContentChatItem;
  [(CKBalloonDescriptor_t *)&v13 balloonDescriptor];
  retstr->var2 = [(CKEditedTextMessagePartHistoricalContentChatItem *)self balloonStyle];
  retstr->var0 = 0;
  retstr->var10 = 0;
  retstr->var5 = [(CKEditedTextMessagePartHistoricalContentChatItem *)self color];
  char v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 theme];
  v7 = objc_msgSend(v6, "unfilledBalloonColorForColorType:", -[CKEditedTextMessagePartHistoricalContentChatItem color](self, "color"));
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

@end