@interface IMMessageRetractionChatItem(CKChatItems)
- (uint64_t)__ck_chatItemClass;
@end

@implementation IMMessageRetractionChatItem(CKChatItems)

- (uint64_t)__ck_chatItemClass
{
  return objc_opt_class();
}

@end