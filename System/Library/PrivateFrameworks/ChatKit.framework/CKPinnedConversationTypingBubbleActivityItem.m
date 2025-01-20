@interface CKPinnedConversationTypingBubbleActivityItem
- (BOOL)activityItemAppearsWithAnimation;
- (BOOL)activityItemDisappearsWithAnimation;
- (NSString)activityItemIdentifier;
- (NSString)attachedContactItemIdentifier;
- (double)activityItemContentScale;
- (id)activityItemView;
@end

@implementation CKPinnedConversationTypingBubbleActivityItem

- (NSString)activityItemIdentifier
{
  return (NSString *)@"typing";
}

- (BOOL)activityItemAppearsWithAnimation
{
  return 1;
}

- (BOOL)activityItemDisappearsWithAnimation
{
  return 0;
}

- (id)activityItemView
{
  v2 = [[CKPinnedConversationTypingBubble alloc] initWithActivityItem:self];

  return v2;
}

- (double)activityItemContentScale
{
  return 1.0;
}

- (NSString)attachedContactItemIdentifier
{
  return 0;
}

@end