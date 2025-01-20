@interface IMUnknownInternationalSenderChatItem
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation IMUnknownInternationalSenderChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v11 = objc_msgSend__initWithItem_(v4, v9, (uint64_t)v8, v10);

  return v11;
}

@end