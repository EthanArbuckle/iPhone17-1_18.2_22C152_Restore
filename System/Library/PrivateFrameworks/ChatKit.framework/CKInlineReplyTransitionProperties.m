@interface CKInlineReplyTransitionProperties
+ (id)defaultProperties;
- (CGPoint)swipeVelocity;
- (NSArray)associatedChatItemGUIDs;
- (NSArray)chatItemGUIDs;
- (double)initialBalloonOffsetX;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAssociatedChatItemGUIDs:(id)a3;
- (void)setChatItemGUIDs:(id)a3;
- (void)setInitialBalloonOffsetX:(double)a3;
- (void)setSwipeVelocity:(CGPoint)a3;
@end

@implementation CKInlineReplyTransitionProperties

+ (id)defaultProperties
{
  v2 = objc_alloc_init(CKInlineReplyTransitionProperties);
  [(CKInlineReplyTransitionProperties *)v2 setInitialBalloonOffsetX:0.0];
  uint64_t v3 = MEMORY[0x1E4F1CBF0];
  [(CKInlineReplyTransitionProperties *)v2 setChatItemGUIDs:MEMORY[0x1E4F1CBF0]];
  [(CKInlineReplyTransitionProperties *)v2 setAssociatedChatItemGUIDs:v3];
  -[CKInlineReplyTransitionProperties setSwipeVelocity:](v2, "setSwipeVelocity:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CKInlineReplyTransitionProperties);
  [(CKInlineReplyTransitionProperties *)self initialBalloonOffsetX];
  -[CKInlineReplyTransitionProperties setInitialBalloonOffsetX:](v4, "setInitialBalloonOffsetX:");
  v5 = [(CKInlineReplyTransitionProperties *)self chatItemGUIDs];
  v6 = (void *)[v5 copy];
  [(CKInlineReplyTransitionProperties *)v4 setChatItemGUIDs:v6];

  v7 = [(CKInlineReplyTransitionProperties *)self associatedChatItemGUIDs];
  v8 = (void *)[v7 copy];
  [(CKInlineReplyTransitionProperties *)v4 setAssociatedChatItemGUIDs:v8];

  [(CKInlineReplyTransitionProperties *)self swipeVelocity];
  -[CKInlineReplyTransitionProperties setSwipeVelocity:](v4, "setSwipeVelocity:");
  return v4;
}

- (double)initialBalloonOffsetX
{
  return self->_initialBalloonOffsetX;
}

- (void)setInitialBalloonOffsetX:(double)a3
{
  self->_initialBalloonOffsetX = a3;
}

- (NSArray)chatItemGUIDs
{
  return self->_chatItemGUIDs;
}

- (void)setChatItemGUIDs:(id)a3
{
}

- (NSArray)associatedChatItemGUIDs
{
  return self->_associatedChatItemGUIDs;
}

- (void)setAssociatedChatItemGUIDs:(id)a3
{
}

- (CGPoint)swipeVelocity
{
  double x = self->_swipeVelocity.x;
  double y = self->_swipeVelocity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSwipeVelocity:(CGPoint)a3
{
  self->_swipeVelocitdouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedChatItemGUIDs, 0);

  objc_storeStrong((id *)&self->_chatItemGUIDs, 0);
}

@end