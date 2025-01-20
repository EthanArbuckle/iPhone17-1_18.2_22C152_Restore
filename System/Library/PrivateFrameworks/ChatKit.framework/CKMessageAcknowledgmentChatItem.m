@interface CKMessageAcknowledgmentChatItem
- (BOOL)wantsDrawerLayout;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (CKMessageAcknowledgmentChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (NSString)acknowledgmentImageName;
- (UIColor)acknowledgmentImageColor;
- (UIColor)selectedAcknowledgmentImageColor;
- (UIColor)selectedBalloonColor;
- (UIEdgeInsets)contentInsets;
- (char)balloonColorType;
- (char)balloonOrientation;
- (char)transcriptOrientation;
- (id)attributionImage;
- (id)attributionImageTintColor;
- (id)sender;
- (int64_t)messageAcknowledgmentType;
- (int64_t)themeColor;
- (int64_t)themeStyle;
@end

@implementation CKMessageAcknowledgmentChatItem

- (CKMessageAcknowledgmentChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CKMessageAcknowledgmentChatItem;
  v4 = [(CKChatItem *)&v8 initWithIMChatItem:a3 maxWidth:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(CKMessageAcknowledgmentChatItem *)v4 messageAcknowledgmentChatItem];
    v5->_messageAcknowledgmentType = CKMessageAcknowledgmentTypeFromIMAssociatedMessageType([v6 associatedMessageType]);
  }
  return v5;
}

- (UIEdgeInsets)contentInsets
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 balloonTranscriptInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double v4 = +[CKUIBehavior sharedBehaviors];
  [v4 messageAcknowledgmentTranscriptBalloonSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (NSString)acknowledgmentImageName
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  double v4 = objc_msgSend(v3, "messageAcknowledgmentImageNameForType:", -[CKMessageAcknowledgmentChatItem messageAcknowledgmentType](self, "messageAcknowledgmentType"));

  return (NSString *)v4;
}

- (id)sender
{
  v2 = [(CKAssociatedMessageChatItem *)self IMAssociatedMessageChatItem];
  double v3 = [v2 sender];

  return v3;
}

- (char)balloonOrientation
{
  return [(CKAssociatedMessageChatItem *)self parentMessageIsFromMe];
}

- (char)transcriptOrientation
{
  if ([(CKAssociatedMessageChatItem *)self parentMessageIsFromMe]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (char)balloonColorType
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  double v4 = [v3 theme];
  LOBYTE(self) = objc_msgSend(v4, "messageAcknowledgmentBalloonColorTypeForStyle:", -[CKMessageAcknowledgmentChatItem themeStyle](self, "themeStyle"));

  return (char)self;
}

- (int64_t)themeStyle
{
  return [(CKChatItem *)self isFromMe];
}

- (int64_t)themeColor
{
  return self->_messageAcknowledgmentType == 2000;
}

- (UIColor)acknowledgmentImageColor
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  double v4 = [v3 theme];
  double v5 = objc_msgSend(v4, "messageAcknowledgment:acknowledgmentImageColor:", -[CKMessageAcknowledgmentChatItem themeStyle](self, "themeStyle"), -[CKMessageAcknowledgmentChatItem themeColor](self, "themeColor"));

  return (UIColor *)v5;
}

- (UIColor)selectedAcknowledgmentImageColor
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  double v4 = [v3 theme];
  double v5 = objc_msgSend(v4, "messageAcknowledgment:selectedAcknowledgmentImageColor:", -[CKMessageAcknowledgmentChatItem themeStyle](self, "themeStyle"), -[CKMessageAcknowledgmentChatItem themeColor](self, "themeColor"));

  return (UIColor *)v5;
}

- (UIColor)selectedBalloonColor
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  double v4 = [v3 theme];
  double v5 = objc_msgSend(v4, "messageAcknowledgmentSelectedBalloonColorForStyle:", -[CKMessageAcknowledgmentChatItem themeStyle](self, "themeStyle"));

  return (UIColor *)v5;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v8.receiver = self;
  v8.super_class = (Class)CKMessageAcknowledgmentChatItem;
  [(CKBalloonDescriptor_t *)&v8 balloonDescriptor];
  *(_WORD *)&retstr->var0 = 514;
  retstr->var2 = 1;
  retstr->var4 = -1;
  *(_WORD *)&retstr->var9 = 256;
  retstr->var5 = [(CKMessageAcknowledgmentChatItem *)self balloonColorType];
  retstr->var3 = [(CKMessageAcknowledgmentChatItem *)self balloonOrientation];
  double v5 = [(CKChatItem *)self transcriptTraitCollection];
  retstr->var7 = [v5 userInterfaceStyle];

  double v6 = [(CKChatItem *)self transcriptTraitCollection];
  retstr->var8 = CKBackgroundLevelForTraitCollection();

  return result;
}

- (BOOL)wantsDrawerLayout
{
  return 1;
}

- (id)attributionImage
{
  double v3 = (void *)MEMORY[0x1E4F42A80];
  double v4 = +[CKUIBehavior sharedBehaviors];
  double v5 = objc_msgSend(v4, "largeMessageAcknowledgmentPollingImageNameForAcknowledgmentType:", -[CKMessageAcknowledgmentChatItem messageAcknowledgmentType](self, "messageAcknowledgmentType"));
  double v6 = [v3 ckTemplateImageNamed:v5];

  return v6;
}

- (id)attributionImageTintColor
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  double v4 = [v3 theme];
  double v5 = objc_msgSend(v4, "messageAcknowledgment:acknowledgmentImageColor:", 0, -[CKMessageAcknowledgmentChatItem themeColor](self, "themeColor"));

  return v5;
}

- (int64_t)messageAcknowledgmentType
{
  return self->_messageAcknowledgmentType;
}

@end