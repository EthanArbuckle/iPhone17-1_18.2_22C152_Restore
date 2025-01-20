@interface IMScheduledSectionDateChatItem(CKChatItems)
- (uint64_t)__ck_chatItemClass;
- (uint64_t)hash;
- (uint64_t)isEqual:()CKChatItems;
- (uint64_t)isEqualToScheduledDateChatItem:()CKChatItems;
@end

@implementation IMScheduledSectionDateChatItem(CKChatItems)

- (uint64_t)__ck_chatItemClass
{
  return objc_opt_class();
}

- (uint64_t)hash
{
  v1 = [a1 date];
  uint64_t v2 = [v1 hash];

  return v2;
}

- (uint64_t)isEqualToScheduledDateChatItem:()CKChatItems
{
  id v4 = a3;
  v5 = [a1 date];
  v6 = [v4 date];

  uint64_t v7 = [v5 isEqualToDate:v6];
  return v7;
}

- (uint64_t)isEqual:()CKChatItems
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = [a1 isEqualToScheduledDateChatItem:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

@end