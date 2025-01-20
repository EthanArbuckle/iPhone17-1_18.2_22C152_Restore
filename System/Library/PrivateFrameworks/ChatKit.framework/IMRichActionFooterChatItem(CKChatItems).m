@interface IMRichActionFooterChatItem(CKChatItems)
- (uint64_t)__ck_chatItemClass;
@end

@implementation IMRichActionFooterChatItem(CKChatItems)

- (uint64_t)__ck_chatItemClass
{
  return objc_opt_class();
}

@end