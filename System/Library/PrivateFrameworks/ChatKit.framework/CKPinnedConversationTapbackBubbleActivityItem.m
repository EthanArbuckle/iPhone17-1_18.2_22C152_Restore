@interface CKPinnedConversationTapbackBubbleActivityItem
- (BOOL)activityItemAppearsWithAnimation;
- (BOOL)activityItemDisappearsWithAnimation;
- (CKPinnedConversationTapbackBubbleActivityItem)initWithMessage:(id)a3 contentScale:(double)a4 attachedContactItemIdentifier:(id)a5;
- (IMMessage)message;
- (NSString)activityItemIdentifier;
- (NSString)attachedContactItemIdentifier;
- (double)activityItemContentScale;
- (id)activityItemView;
@end

@implementation CKPinnedConversationTapbackBubbleActivityItem

- (CKPinnedConversationTapbackBubbleActivityItem)initWithMessage:(id)a3 contentScale:(double)a4 attachedContactItemIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CKPinnedConversationTapbackBubbleActivityItem;
  v11 = [(CKPinnedConversationTapbackBubbleActivityItem *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_message, a3);
    v12->_activityItemContentScale = a4;
    uint64_t v13 = [v10 copy];
    attachedContactItemIdentifier = v12->_attachedContactItemIdentifier;
    v12->_attachedContactItemIdentifier = (NSString *)v13;
  }
  return v12;
}

- (NSString)activityItemIdentifier
{
  return (NSString *)[(IMMessage *)self->_message guid];
}

- (BOOL)activityItemAppearsWithAnimation
{
  return 1;
}

- (BOOL)activityItemDisappearsWithAnimation
{
  return 1;
}

- (id)activityItemView
{
  v2 = [[CKPinnedConversationTapbackBubble alloc] initWithActivityItem:self];

  return v2;
}

- (NSString)attachedContactItemIdentifier
{
  return self->_attachedContactItemIdentifier;
}

- (double)activityItemContentScale
{
  return self->_activityItemContentScale;
}

- (IMMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_attachedContactItemIdentifier, 0);
}

@end