@interface CNSmartPropertyFetcher
+ (BOOL)supportsSecureCoding;
- (CNSmartPropertyFetcher)initWithCoder:(id)a3;
- (id)_cn_ignorableKeys;
- (id)_cn_optionalKeys;
- (id)_cn_requiredKeys;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CNSmartPropertyFetcher

- (CNSmartPropertyFetcher)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNSmartPropertyFetcher;
  return [(CNSmartPropertyFetcher *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_class();

  return objc_alloc_init(v3);
}

- (id)_cn_requiredKeys
{
  return +[CNContactKeyVector keyVector];
}

- (id)_cn_optionalKeys
{
  return +[CNContactKeyVector keyVector];
}

- (id)_cn_ignorableKeys
{
  return +[CNContactKeyVector keyVector];
}

@end