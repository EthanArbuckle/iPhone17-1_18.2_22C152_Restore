@interface CKSendAnimationContext
- (BOOL)beginAnimationFromTranscriptPresentedState;
- (BOOL)isSender;
- (BOOL)shouldRepeat;
- (BOOL)shouldUseQuickReplySourceRect;
- (CABackdropLayer)backdropLayer;
- (CGRect)quickReplySourceRect;
- (NSArray)animatableTextViews;
- (NSArray)animatableViews;
- (NSArray)framesOfAddedChatItems;
- (NSArray)messages;
- (NSArray)throwBalloonViewAttributesCollection;
- (NSArray)throwBalloonViews;
- (NSString)impactIdentifier;
- (UIView)containerView;
- (void)setAnimatableTextViews:(id)a3;
- (void)setAnimatableViews:(id)a3;
- (void)setBackdropLayer:(id)a3;
- (void)setBeginAnimationFromTranscriptPresentedState:(BOOL)a3;
- (void)setContainerView:(id)a3;
- (void)setFramesOfAddedChatItems:(id)a3;
- (void)setImpactIdentifier:(id)a3;
- (void)setIsSender:(BOOL)a3;
- (void)setMessages:(id)a3;
- (void)setQuickReplySourceRect:(CGRect)a3;
- (void)setShouldRepeat:(BOOL)a3;
- (void)setThrowBalloonViewAttributesCollection:(id)a3;
- (void)setThrowBalloonViews:(id)a3;
@end

@implementation CKSendAnimationContext

- (BOOL)shouldUseQuickReplySourceRect
{
  return !CGRectEqualToRect(self->_quickReplySourceRect, *MEMORY[0x1E4F1DB28]);
}

- (NSArray)animatableViews
{
  return self->_animatableViews;
}

- (void)setAnimatableViews:(id)a3
{
}

- (NSArray)animatableTextViews
{
  return self->_animatableTextViews;
}

- (void)setAnimatableTextViews:(id)a3
{
}

- (NSString)impactIdentifier
{
  return self->_impactIdentifier;
}

- (void)setImpactIdentifier:(id)a3
{
}

- (BOOL)shouldRepeat
{
  return self->_shouldRepeat;
}

- (void)setShouldRepeat:(BOOL)a3
{
  self->_shouldRepeat = a3;
}

- (BOOL)isSender
{
  return self->_isSender;
}

- (void)setIsSender:(BOOL)a3
{
  self->_isSender = a3;
}

- (NSArray)throwBalloonViews
{
  return self->_throwBalloonViews;
}

- (void)setThrowBalloonViews:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (NSArray)framesOfAddedChatItems
{
  return self->_framesOfAddedChatItems;
}

- (void)setFramesOfAddedChatItems:(id)a3
{
}

- (CABackdropLayer)backdropLayer
{
  return self->_backdropLayer;
}

- (void)setBackdropLayer:(id)a3
{
}

- (NSArray)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
}

- (NSArray)throwBalloonViewAttributesCollection
{
  return self->_throwBalloonViewAttributesCollection;
}

- (void)setThrowBalloonViewAttributesCollection:(id)a3
{
}

- (BOOL)beginAnimationFromTranscriptPresentedState
{
  return self->_beginAnimationFromTranscriptPresentedState;
}

- (void)setBeginAnimationFromTranscriptPresentedState:(BOOL)a3
{
  self->_beginAnimationFromTranscriptPresentedState = a3;
}

- (CGRect)quickReplySourceRect
{
  double x = self->_quickReplySourceRect.origin.x;
  double y = self->_quickReplySourceRect.origin.y;
  double width = self->_quickReplySourceRect.size.width;
  double height = self->_quickReplySourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setQuickReplySourceRect:(CGRect)a3
{
  self->_quickReplySourceRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throwBalloonViewAttributesCollection, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_framesOfAddedChatItems, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_throwBalloonViews, 0);
  objc_storeStrong((id *)&self->_impactIdentifier, 0);
  objc_storeStrong((id *)&self->_animatableTextViews, 0);

  objc_storeStrong((id *)&self->_animatableViews, 0);
}

@end