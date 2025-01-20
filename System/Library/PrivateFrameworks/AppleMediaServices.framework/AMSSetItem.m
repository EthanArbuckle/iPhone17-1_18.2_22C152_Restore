@interface AMSSetItem
+ (id)setItemWithObject:(id)a3 hashKey:(id)a4;
- (AMSSetItem)initWithObject:(id)a3 hashKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)hashKey;
- (id)object;
- (unint64_t)hash;
@end

@implementation AMSSetItem

+ (id)setItemWithObject:(id)a3 hashKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[AMSSetItem alloc] initWithObject:v6 hashKey:v5];

  return v7;
}

- (AMSSetItem)initWithObject:(id)a3 hashKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSSetItem;
  v9 = [(AMSSetItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_object, a3);
    objc_storeStrong((id *)&v10->_hashKey, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(AMSSetItem *)self hashKey];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 hashKey];
    id v6 = [(AMSSetItem *)self hashKey];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)object
{
  return self->_object;
}

- (NSString)hashKey
{
  return self->_hashKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashKey, 0);
  objc_storeStrong(&self->_object, 0);
}

@end