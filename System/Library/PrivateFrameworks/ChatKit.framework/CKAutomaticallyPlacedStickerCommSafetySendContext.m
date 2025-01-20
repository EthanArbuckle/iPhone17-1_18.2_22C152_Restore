@interface CKAutomaticallyPlacedStickerCommSafetySendContext
+ (id)contextKey;
+ (id)contextWithAutomaticallyPlacedSticker:(id)a3 stickerReactionSession:(id)a4 chatItem:(id)a5 parentChatItem:(id)a6 stickerFrame:(CGRect)a7 animationCompletionHandler:(id)a8;
- (CGRect)stickerFrame;
- (CKAutomaticallyPlacedStickerCommSafetySendContext)initWithAutomaticallyPlacedSticker:(id)a3 stickerReactionSession:(id)a4 chatItem:(id)a5 parentChatItem:(id)a6 stickerFrame:(CGRect)a7 animationCompletionHandler:(id)a8;
- (CKMessagePartChatItem)chatItem;
- (CKMessagePartChatItem)parentChatItem;
- (CKStickerReactionSession)stickerReactionSession;
- (IMSticker)sticker;
- (id)animationCompletionHandler;
@end

@implementation CKAutomaticallyPlacedStickerCommSafetySendContext

+ (id)contextKey
{
  return @"CKCommSafetyContextKeyAutomaticallyPlacedStickerSend";
}

+ (id)contextWithAutomaticallyPlacedSticker:(id)a3 stickerReactionSession:(id)a4 chatItem:(id)a5 parentChatItem:(id)a6 stickerFrame:(CGRect)a7 animationCompletionHandler:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = -[CKAutomaticallyPlacedStickerCommSafetySendContext initWithAutomaticallyPlacedSticker:stickerReactionSession:chatItem:parentChatItem:stickerFrame:animationCompletionHandler:]([CKAutomaticallyPlacedStickerCommSafetySendContext alloc], "initWithAutomaticallyPlacedSticker:stickerReactionSession:chatItem:parentChatItem:stickerFrame:animationCompletionHandler:", v20, v19, v18, v17, v16, x, y, width, height);

  return v21;
}

- (CKAutomaticallyPlacedStickerCommSafetySendContext)initWithAutomaticallyPlacedSticker:(id)a3 stickerReactionSession:(id)a4 chatItem:(id)a5 parentChatItem:(id)a6 stickerFrame:(CGRect)a7 animationCompletionHandler:(id)a8
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v27 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  v28.receiver = self;
  v28.super_class = (Class)CKAutomaticallyPlacedStickerCommSafetySendContext;
  v22 = [(CKAutomaticallyPlacedStickerCommSafetySendContext *)&v28 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_sticker, a3);
    objc_storeStrong((id *)&v23->_stickerReactionSession, a4);
    objc_storeStrong((id *)&v23->_chatItem, a5);
    objc_storeStrong((id *)&v23->_parentChatItem, a6);
    v23->_stickerFrame.origin.CGFloat x = x;
    v23->_stickerFrame.origin.CGFloat y = y;
    v23->_stickerFrame.size.CGFloat width = width;
    v23->_stickerFrame.size.CGFloat height = height;
    v24 = _Block_copy(v21);
    id animationCompletionHandler = v23->_animationCompletionHandler;
    v23->_id animationCompletionHandler = v24;
  }
  return v23;
}

- (IMSticker)sticker
{
  return self->_sticker;
}

- (CKStickerReactionSession)stickerReactionSession
{
  return self->_stickerReactionSession;
}

- (CKMessagePartChatItem)chatItem
{
  return self->_chatItem;
}

- (CKMessagePartChatItem)parentChatItem
{
  return self->_parentChatItem;
}

- (CGRect)stickerFrame
{
  double x = self->_stickerFrame.origin.x;
  double y = self->_stickerFrame.origin.y;
  double width = self->_stickerFrame.size.width;
  double height = self->_stickerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)animationCompletionHandler
{
  return self->_animationCompletionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_parentChatItem, 0);
  objc_storeStrong((id *)&self->_chatItem, 0);
  objc_storeStrong((id *)&self->_stickerReactionSession, 0);

  objc_storeStrong((id *)&self->_sticker, 0);
}

@end