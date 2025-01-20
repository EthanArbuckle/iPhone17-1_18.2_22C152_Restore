@interface CKReplyContextTranscriptPluginChatItem
- (BOOL)isReplyContextPreview;
- (BOOL)replyIsFromMe;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (Class)balloonViewClass;
- (LPLinkMetadata)linkMetadata;
- (char)color;
- (id)description;
- (id)mediaObject;
- (void)configureBalloonView:(id)a3;
@end

@implementation CKReplyContextTranscriptPluginChatItem

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CKReplyContextTranscriptPluginChatItem;
  v4 = [(CKMessagePartChatItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"[%@ attachmentContiguousType:%d]", v4, -[CKChatItem attachmentContiguousType](self, "attachmentContiguousType")];

  return v5;
}

- (void)configureBalloonView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 configureForTranscriptPlugin:self];
  }
}

- (Class)balloonViewClass
{
  v3 = [(CKReplyContextTranscriptPluginChatItem *)self _imChatItem];
  id v4 = [v3 type];
  if ([v4 containsString:*MEMORY[0x1E4F6CC10]])
  {
    uint64_t v5 = objc_opt_class();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKReplyContextTranscriptPluginChatItem;
    uint64_t v5 = [(CKBalloonChatItem *)&v8 balloonViewClass];
  }
  v6 = (void *)v5;

  return (Class)v6;
}

- (id)mediaObject
{
  return 0;
}

- (char)color
{
  return 9;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v13.receiver = self;
  v13.super_class = (Class)CKReplyContextTranscriptPluginChatItem;
  [(CKBalloonDescriptor_t *)&v13 balloonDescriptor];
  retstr->var2 = 1;
  retstr->var0 = 3;
  retstr->var10 = 1;
  retstr->var5 = [(CKReplyContextTranscriptPluginChatItem *)self color];
  uint64_t v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 theme];
  objc_super v7 = objc_msgSend(v6, "unfilledBalloonColorForColorType:", -[CKReplyContextTranscriptPluginChatItem color](self, "color"));
  [v7 ckColor];
  retstr->var6.red = v8;
  retstr->var6.green = v9;
  retstr->var6.blue = v10;
  retstr->var6.alpha = v11;

  retstr->var9 = 1;
  return result;
}

- (BOOL)isReplyContextPreview
{
  return 1;
}

- (BOOL)replyIsFromMe
{
  v2 = [(CKReplyContextTranscriptPluginChatItem *)self _imChatItem];
  char v3 = [v2 replyIsFromMe];

  return v3;
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void).cxx_destruct
{
}

@end