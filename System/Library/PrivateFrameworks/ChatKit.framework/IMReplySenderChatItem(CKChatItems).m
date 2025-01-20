@interface IMReplySenderChatItem(CKChatItems)
- (uint64_t)__ck_chatItemClass;
@end

@implementation IMReplySenderChatItem(CKChatItems)

- (uint64_t)__ck_chatItemClass
{
  return objc_opt_class();
}

@end