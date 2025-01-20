@interface IMDateChatItem(CKChatItems)
- (uint64_t)__ck_chatItemClass;
@end

@implementation IMDateChatItem(CKChatItems)

- (uint64_t)__ck_chatItemClass
{
  return objc_opt_class();
}

@end