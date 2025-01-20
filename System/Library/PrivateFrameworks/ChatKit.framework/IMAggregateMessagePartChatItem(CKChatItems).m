@interface IMAggregateMessagePartChatItem(CKChatItems)
- (uint64_t)__ck_chatItemClass;
@end

@implementation IMAggregateMessagePartChatItem(CKChatItems)

- (uint64_t)__ck_chatItemClass
{
  return objc_opt_class();
}

@end