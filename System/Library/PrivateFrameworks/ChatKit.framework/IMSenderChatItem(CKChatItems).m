@interface IMSenderChatItem(CKChatItems)
- (uint64_t)__ck_chatItemClass;
@end

@implementation IMSenderChatItem(CKChatItems)

- (uint64_t)__ck_chatItemClass
{
  return objc_opt_class();
}

@end