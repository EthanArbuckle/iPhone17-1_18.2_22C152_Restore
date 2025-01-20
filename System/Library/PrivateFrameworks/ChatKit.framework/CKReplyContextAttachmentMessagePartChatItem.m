@interface CKReplyContextAttachmentMessagePartChatItem
- (BOOL)isReplyContextPreview;
- (BOOL)replyIsFromMe;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (Class)balloonViewClass;
- (char)balloonStyle;
- (char)color;
- (id)loadTranscriptDrawerText;
@end

@implementation CKReplyContextAttachmentMessagePartChatItem

- (id)loadTranscriptDrawerText
{
  return 0;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  int v9 = [v8 mediaType];

  if ((v9 & 0xFFFFFFFE) == 2)
  {
    v29.receiver = self;
    v29.super_class = (Class)CKReplyContextAttachmentMessagePartChatItem;
    -[CKAttachmentMessagePartChatItem loadSizeThatFits:textAlignmentInsets:](&v29, sel_loadSizeThatFits_textAlignmentInsets_, a4, width, height);
    double v11 = v10;
    double v13 = v12;
    v14 = +[CKUIBehavior sharedBehaviors];
    [v14 textBalloonMinHeight];
    double v16 = v15;

    v17 = +[CKUIBehavior sharedBehaviors];
    [v17 replyPreviewBalloonMinWidth];
    double v19 = v18;

    if (v19 < v11 || v16 < v13)
    {
      double v21 = v19 / v11;
      double v22 = 0.0;
      if (v11 == 0.0) {
        double v21 = 0.0;
      }
      if (v13 != 0.0) {
        double v22 = v16 / v13;
      }
      double v23 = fmax(v21, v22);
      double v19 = ceil(v11 * v23);
      double v16 = ceil(v13 * v23);
    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)CKReplyContextAttachmentMessagePartChatItem;
    -[CKAttachmentMessagePartChatItem loadSizeThatFits:textAlignmentInsets:](&v28, sel_loadSizeThatFits_textAlignmentInsets_, a4, width, height);
    double v19 = v24;
    double v16 = v25;
  }
  double v26 = v19;
  double v27 = v16;
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (Class)balloonViewClass
{
  v2 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  v3 = (objc_class *)(id)[v2 replyContextBalloonViewClass];

  return v3;
}

- (char)color
{
  v3 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  int v4 = [v3 mediaType];

  if ((v4 - 7) < 4 || ![(CKMessagePartChatItem *)self isFromMe]) {
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
  v2 = [(CKReplyContextAttachmentMessagePartChatItem *)self balloonViewClass];
  return v2 != (objc_class *)objc_opt_class();
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v13.receiver = self;
  v13.super_class = (Class)CKReplyContextAttachmentMessagePartChatItem;
  [(CKBalloonDescriptor_t *)&v13 balloonDescriptor];
  retstr->var2 = [(CKReplyContextAttachmentMessagePartChatItem *)self balloonStyle];
  retstr->var0 = 4;
  retstr->var10 = 1;
  retstr->var3 = [(CKBalloonChatItem *)self balloonOrientation];
  retstr->var5 = [(CKReplyContextAttachmentMessagePartChatItem *)self color];
  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 theme];
  v7 = objc_msgSend(v6, "unfilledBalloonColorForColorType:", -[CKReplyContextAttachmentMessagePartChatItem color](self, "color"));
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
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 replyIsFromMe];

  return v3;
}

@end