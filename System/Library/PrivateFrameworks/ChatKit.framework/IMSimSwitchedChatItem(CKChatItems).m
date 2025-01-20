@interface IMSimSwitchedChatItem(CKChatItems)
- (uint64_t)__ck_chatItemClass;
@end

@implementation IMSimSwitchedChatItem(CKChatItems)

- (uint64_t)__ck_chatItemClass
{
  return objc_opt_class();
}

@end