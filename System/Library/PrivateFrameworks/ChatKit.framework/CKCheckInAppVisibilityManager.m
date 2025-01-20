@interface CKCheckInAppVisibilityManager
+ (BOOL)isCheckInVisibleInConversation:(id)a3;
- (CKCheckInAppVisibilityManager)init;
@end

@implementation CKCheckInAppVisibilityManager

+ (BOOL)isCheckInVisibleInConversation:(id)a3
{
  id v3 = a3;
  id v4 = a3;
  LOBYTE(v3) = _s7ChatKit23CheckInSendMenuListItemC09isVisibleD12ConversationySbSo14CKConversationCSgFZ_0(v3);

  return v3 & 1;
}

- (CKCheckInAppVisibilityManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CheckInAppVisibilityManager();
  return [(CKCheckInAppVisibilityManager *)&v3 init];
}

@end