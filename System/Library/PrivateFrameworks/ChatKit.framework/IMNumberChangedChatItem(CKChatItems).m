@interface IMNumberChangedChatItem(CKChatItems)
- (uint64_t)__ck_chatItemClass;
@end

@implementation IMNumberChangedChatItem(CKChatItems)

- (uint64_t)__ck_chatItemClass
{
  return objc_opt_class();
}

@end