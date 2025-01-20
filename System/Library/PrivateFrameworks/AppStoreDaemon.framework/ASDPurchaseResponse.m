@interface ASDPurchaseResponse
+ (BOOL)supportsSecureCoding;
- (ASDPurchaseResponse)initWithCoder:(id)a3;
- (ASDPurchaseResponse)initWithError:(id)a3;
- (ASDPurchaseResponse)initWithPurchaseResponseItems:(id)a3;
- (NSArray)items;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDPurchaseResponse

- (ASDPurchaseResponse)initWithPurchaseResponseItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDPurchaseResponse;
  v5 = [(ASDRequestResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    items = v5->_items;
    v5->_items = (NSArray *)v6;
  }
  return v5;
}

- (ASDPurchaseResponse)initWithError:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASDPurchaseResponse;
  v3 = [(ASDRequestResponse *)&v7 initWithError:a3];
  id v4 = v3;
  if (v3)
  {
    items = v3->_items;
    v3->_items = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ASDPurchaseResponse;
  v5 = -[ASDRequestResponse copyWithZone:](&v9, sel_copyWithZone_);
  uint64_t v6 = [(NSArray *)self->_items copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurchaseResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDPurchaseResponse;
  v5 = [(ASDRequestResponse *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"responseItems"];
    items = v5->_items;
    v5->_items = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASDPurchaseResponse;
  id v4 = a3;
  [(ASDRequestResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_items, @"responseItems", v5.receiver, v5.super_class);
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end