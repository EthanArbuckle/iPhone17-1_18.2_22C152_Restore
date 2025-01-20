@interface CKSyndicationOnboardingTailedBubble
- (CGRect)bubbleFrame;
- (CGRect)pillRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKSyndicationOnboardingTailedBubble)initWithFrame:(CGRect)a3 withAppName:(int64_t)a4 withLPLinkView:(id)a5;
- (NSAttributedString)bubbleText;
- (double)balloonTailHeight;
- (double)pillCornerRadius;
- (int64_t)appName;
- (void)layoutSubviews;
- (void)setAppName:(int64_t)a3;
- (void)setBubbleFrame:(CGRect)a3;
- (void)setBubbleText:(id)a3;
@end

@implementation CKSyndicationOnboardingTailedBubble

- (CKSyndicationOnboardingTailedBubble)initWithFrame:(CGRect)a3 withAppName:(int64_t)a4 withLPLinkView:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  [(CKSyndicationOnboardingTailedBubble *)self setAppName:a4];
  v12 = [[CKPinnedConversationRichLinkActivityItem alloc] initWithLinkView:v11];

  v16.receiver = self;
  v16.super_class = (Class)CKSyndicationOnboardingTailedBubble;
  v13 = [(CKPinnedConversationRichLinkBubble *)&v16 initWithRichLinkActivityItem:v12];
  v14 = v13;
  if (v13)
  {
    -[CKSyndicationOnboardingTailedBubble setBubbleFrame:](v13, "setBubbleFrame:", x, y, width, height);
    -[CKSyndicationOnboardingTailedBubble setBounds:](v14, "setBounds:", x, y, width, height);
    [(CKSyndicationOnboardingTailedBubble *)v14 setAppName:a4];
    if ([(CKSyndicationOnboardingTailedBubble *)v14 appName])
    {
      [(CKPinnedConversationTailedActivityItemView *)v14 setOriginationDirection:1];
      if ([(CKSyndicationOnboardingTailedBubble *)v14 appName] == 1) {
        [(CKPinnedConversationTailedActivityItemView *)v14 setOriginationHorizontalDirection:1];
      }
    }
    else
    {
      [(CKPinnedConversationTailedActivityItemView *)v14 setOriginationDirection:0];
    }
  }

  return v14;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKSyndicationOnboardingTailedBubble;
  [(CKPinnedConversationTailedActivityItemView *)&v3 layoutSubviews];
  if ([(CKSyndicationOnboardingTailedBubble *)self appName] == 1)
  {
    [(CKSyndicationOnboardingTailedBubble *)self bounds];
    [(CKPinnedConversationTailedActivityItemView *)self setPreferredTailAttachmentPointXCoordinate:CGRectGetMaxX(v4)];
  }
}

- (double)balloonTailHeight
{
  return 7.5;
}

- (double)pillCornerRadius
{
  return 10.0;
}

- (CGRect)pillRect
{
  [(CKSyndicationOnboardingTailedBubble *)self balloonTailHeight];
  double v4 = v3;
  [(CKSyndicationOnboardingTailedBubble *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  int64_t v13 = [(CKSyndicationOnboardingTailedBubble *)self appName];
  double v14 = 0.0;
  if (v13) {
    double v14 = v4;
  }
  double v15 = v8 + v14;
  double v16 = v12 - v4;
  double v17 = v6;
  double v18 = v10;
  result.size.double height = v16;
  result.size.double width = v18;
  result.origin.double y = v15;
  result.origin.double x = v17;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 155.0;
  double v4 = 100.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (int64_t)appName
{
  return self->_appName;
}

- (void)setAppName:(int64_t)a3
{
  self->_appName = a3;
}

- (CGRect)bubbleFrame
{
  double x = self->_bubbleFrame.origin.x;
  double y = self->_bubbleFrame.origin.y;
  double width = self->_bubbleFrame.size.width;
  double height = self->_bubbleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBubbleFrame:(CGRect)a3
{
  self->_bubbleFrame = a3;
}

- (NSAttributedString)bubbleText
{
  return self->_bubbleText;
}

- (void)setBubbleText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end