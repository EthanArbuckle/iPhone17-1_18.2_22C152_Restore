@interface IMTranscriptLocationChatItem(CKItems)
- (uint64_t)__ck_chatItemClass;
@end

@implementation IMTranscriptLocationChatItem(CKItems)

- (uint64_t)__ck_chatItemClass
{
  return objc_opt_class();
}

@end