@interface IMSharedUtilitiesSoftLinkingWrapper
- (BOOL)isRCSChatBot:(id)a3;
- (id)defaultSubscriptionContextFromSubscriptionInfo;
- (id)subscriptionContextForSimID:(id)a3;
@end

@implementation IMSharedUtilitiesSoftLinkingWrapper

- (BOOL)isRCSChatBot:(id)a3
{
  return objc_msgSend(a3, "__im_isChatBot");
}

- (id)subscriptionContextForSimID:(id)a3
{
  return 0;
}

- (id)defaultSubscriptionContextFromSubscriptionInfo
{
  return 0;
}

@end