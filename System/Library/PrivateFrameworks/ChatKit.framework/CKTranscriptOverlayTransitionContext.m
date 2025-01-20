@interface CKTranscriptOverlayTransitionContext
- (BOOL)isParentChatControllerShowingBanner;
- (BOOL)keyboardWasUpInMainTranscript;
- (BOOL)presentWithKeyboard;
- (BOOL)wantsModalPresentation;
- (BOOL)wantsUnanimatedPresentation;
- (CGRect)parentCollectionViewFrame;
- (CKInlineReplyTransitionProperties)replyTransitionProperties;
- (NSDictionary)visibleChatItemToFrameMap;
- (NSString)anchorChatItemGUID;
- (UIEdgeInsets)transcriptMarginInsets;
- (UIEdgeInsets)transcriptSafeAreaInsets;
- (id)description;
- (int64_t)navBarContext;
- (void)setAnchorChatItemGUID:(id)a3;
- (void)setIsParentChatControllerShowingBanner:(BOOL)a3;
- (void)setKeyboardWasUpInMainTranscript:(BOOL)a3;
- (void)setNavBarContext:(int64_t)a3;
- (void)setParentCollectionViewFrame:(CGRect)a3;
- (void)setPresentWithKeyboard:(BOOL)a3;
- (void)setReplyTransitionProperties:(id)a3;
- (void)setTranscriptMarginInsets:(UIEdgeInsets)a3;
- (void)setTranscriptSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setVisibleChatItemToFrameMap:(id)a3;
- (void)setWantsModalPresentation:(BOOL)a3;
- (void)setWantsUnanimatedPresentation:(BOOL)a3;
@end

@implementation CKTranscriptOverlayTransitionContext

- (id)description
{
  v3 = NSString;
  v4 = @"YES";
  if ([(CKTranscriptOverlayTransitionContext *)self wantsModalPresentation]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if (![(CKTranscriptOverlayTransitionContext *)self wantsUnanimatedPresentation]) {
    v4 = @"NO";
  }
  v6 = [(CKTranscriptOverlayTransitionContext *)self anchorChatItemGUID];
  v7 = [(CKTranscriptOverlayTransitionContext *)self visibleChatItemToFrameMap];
  v8 = [v3 stringWithFormat:@"modal %@ unanimated: %@ anchor GUID %@ frames: %@", v5, v4, v6, v7];

  return v8;
}

- (NSDictionary)visibleChatItemToFrameMap
{
  return self->_visibleChatItemToFrameMap;
}

- (void)setVisibleChatItemToFrameMap:(id)a3
{
}

- (NSString)anchorChatItemGUID
{
  return self->_anchorChatItemGUID;
}

- (void)setAnchorChatItemGUID:(id)a3
{
}

- (CKInlineReplyTransitionProperties)replyTransitionProperties
{
  return self->_replyTransitionProperties;
}

- (void)setReplyTransitionProperties:(id)a3
{
}

- (BOOL)wantsModalPresentation
{
  return self->_wantsModalPresentation;
}

- (void)setWantsModalPresentation:(BOOL)a3
{
  self->_wantsModalPresentation = a3;
}

- (BOOL)wantsUnanimatedPresentation
{
  return self->_wantsUnanimatedPresentation;
}

- (void)setWantsUnanimatedPresentation:(BOOL)a3
{
  self->_wantsUnanimatedPresentation = a3;
}

- (BOOL)presentWithKeyboard
{
  return self->_presentWithKeyboard;
}

- (void)setPresentWithKeyboard:(BOOL)a3
{
  self->_presentWithKeyboard = a3;
}

- (BOOL)keyboardWasUpInMainTranscript
{
  return self->_keyboardWasUpInMainTranscript;
}

- (void)setKeyboardWasUpInMainTranscript:(BOOL)a3
{
  self->_keyboardWasUpInMainTranscript = a3;
}

- (int64_t)navBarContext
{
  return self->_navBarContext;
}

- (void)setNavBarContext:(int64_t)a3
{
  self->_navBarContext = a3;
}

- (BOOL)isParentChatControllerShowingBanner
{
  return self->_isParentChatControllerShowingBanner;
}

- (void)setIsParentChatControllerShowingBanner:(BOOL)a3
{
  self->_isParentChatControllerShowingBanner = a3;
}

- (UIEdgeInsets)transcriptMarginInsets
{
  double top = self->_transcriptMarginInsets.top;
  double left = self->_transcriptMarginInsets.left;
  double bottom = self->_transcriptMarginInsets.bottom;
  double right = self->_transcriptMarginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTranscriptMarginInsets:(UIEdgeInsets)a3
{
  self->_transcriptMarginInsets = a3;
}

- (UIEdgeInsets)transcriptSafeAreaInsets
{
  double top = self->_transcriptSafeAreaInsets.top;
  double left = self->_transcriptSafeAreaInsets.left;
  double bottom = self->_transcriptSafeAreaInsets.bottom;
  double right = self->_transcriptSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTranscriptSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_transcriptSafeAreaInsets = a3;
}

- (CGRect)parentCollectionViewFrame
{
  double x = self->_parentCollectionViewFrame.origin.x;
  double y = self->_parentCollectionViewFrame.origin.y;
  double width = self->_parentCollectionViewFrame.size.width;
  double height = self->_parentCollectionViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setParentCollectionViewFrame:(CGRect)a3
{
  self->_parentCollectionViewFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyTransitionProperties, 0);
  objc_storeStrong((id *)&self->_anchorChatItemGUID, 0);

  objc_storeStrong((id *)&self->_visibleChatItemToFrameMap, 0);
}

@end