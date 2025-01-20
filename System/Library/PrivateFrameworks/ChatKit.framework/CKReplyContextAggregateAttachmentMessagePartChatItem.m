@interface CKReplyContextAggregateAttachmentMessagePartChatItem
- (BOOL)canForward;
- (BOOL)isReplyContextPreview;
- (BOOL)replyIsFromMe;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)balloonViewClass;
- (Class)cellClass;
- (id)loadTranscriptDrawerText;
@end

@implementation CKReplyContextAggregateAttachmentMessagePartChatItem

- (id)loadTranscriptDrawerText
{
  return 0;
}

- (BOOL)canForward
{
  return 0;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  v20.receiver = self;
  v20.super_class = (Class)CKReplyContextAggregateAttachmentMessagePartChatItem;
  -[CKAggregateAttachmentMessagePartChatItem loadSizeThatFits:textAlignmentInsets:](&v20, sel_loadSizeThatFits_textAlignmentInsets_, a4, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  v8 = +[CKUIBehavior sharedBehaviors];
  [v8 textBalloonMinHeight];
  double v10 = v9 + v9;

  v11 = +[CKUIBehavior sharedBehaviors];
  [v11 replyPreviewBalloonMinWidth];
  double v13 = v12 + v12;

  if (v13 < v5 || v10 < v7)
  {
    double v15 = v13 / v5;
    double v16 = 0.0;
    if (v5 == 0.0) {
      double v15 = 0.0;
    }
    if (v7 != 0.0) {
      double v16 = v10 / v7;
    }
    double v17 = fmax(v15, v16);
    double v13 = ceil(v5 * v17);
    double v10 = ceil(v7 * v17);
  }
  double v18 = v13;
  double v19 = v10;
  result.height = v19;
  result.width = v18;
  return result;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
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