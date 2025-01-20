@interface NSString(CNKeyDescriptor_Private)
- (CNContactKeyVector)_cn_requiredKeys;
- (id)_cn_executeGetterForRepresentedKeys:()CNKeyDescriptor_Private;
- (id)_cn_ignorableKeys;
- (id)_cn_optionalKeys;
@end

@implementation NSString(CNKeyDescriptor_Private)

- (CNContactKeyVector)_cn_requiredKeys
{
  return +[CNContactKeyVector keyVectorWithKey:a1];
}

- (id)_cn_optionalKeys
{
  return +[CNContactKeyVector keyVector];
}

- (id)_cn_ignorableKeys
{
  return +[CNContactKeyVector keyVector];
}

- (id)_cn_executeGetterForRepresentedKeys:()CNKeyDescriptor_Private
{
  return (id)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

@end