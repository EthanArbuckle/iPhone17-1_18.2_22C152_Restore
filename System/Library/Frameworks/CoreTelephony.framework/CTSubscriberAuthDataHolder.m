@interface CTSubscriberAuthDataHolder
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTSubscriberAuthDataHolder)initWithCoder:(id)a3;
- (CTSubscriberAuthDataHolder)initWithData:(id)a3;
- (NSDictionary)dict;
- (id)data;
- (void)encodeWithCoder:(id)a3;
- (void)setDict:(id)a3;
@end

@implementation CTSubscriberAuthDataHolder

- (CTSubscriberAuthDataHolder)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTSubscriberAuthDataHolder;
  v6 = [(CTSubscriberAuthDataHolder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dict, a3);
  }

  return v7;
}

- (id)data
{
  return self->_dict;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTSubscriberAuthDataHolder *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(CTSubscriberAuthDataHolder *)self dict];
      v6 = [(CTSubscriberAuthDataHolder *)v4 dict];
      if (v5 == v6)
      {
        char v9 = 1;
      }
      else
      {
        v7 = [(CTSubscriberAuthDataHolder *)self dict];
        v8 = [(CTSubscriberAuthDataHolder *)v4 dict];
        char v9 = [v7 isEqualToDictionary:v8];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTSubscriberAuthDataHolder)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CTSubscriberAuthDataHolder *)self initWithData:0];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    char v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"dict"];
    dict = v5->_dict;
    v5->_dict = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSDictionary)dict
{
  return self->_dict;
}

- (void)setDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end