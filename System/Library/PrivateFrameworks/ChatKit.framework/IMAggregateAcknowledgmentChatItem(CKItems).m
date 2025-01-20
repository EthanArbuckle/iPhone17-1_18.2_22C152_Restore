@interface IMAggregateAcknowledgmentChatItem(CKItems)
- (uint64_t)__ck_chatItemClass;
@end

@implementation IMAggregateAcknowledgmentChatItem(CKItems)

- (uint64_t)__ck_chatItemClass
{
  return objc_opt_class();
}

@end