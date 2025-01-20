@interface ASDPurchaseRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDPurchaseRequestOptions)init;
- (ASDPurchaseRequestOptions)initWithCoder:(id)a3;
- (ASDPurchaseRequestOptions)initWithPurchases:(id)a3;
- (NSArray)purchases;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDPurchaseRequestOptions

- (ASDPurchaseRequestOptions)init
{
  return [(ASDPurchaseRequestOptions *)self initWithPurchases:MEMORY[0x1E4F1CBF0]];
}

- (ASDPurchaseRequestOptions)initWithPurchases:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDPurchaseRequestOptions;
  v6 = [(ASDPurchaseRequestOptions *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_purchases, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[ASDPurchaseRequestOptions allocWithZone:](ASDPurchaseRequestOptions, "allocWithZone:") init];
  uint64_t v6 = [(NSArray *)self->_purchases copyWithZone:a3];
  purchases = v5->_purchases;
  v5->_purchases = (NSArray *)v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurchaseRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDPurchaseRequestOptions *)self init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"purchases"];
    purchases = v5->_purchases;
    v5->_purchases = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDPurchaseRequestOptions *)self purchases];
  [v4 encodeObject:v5 forKey:@"purchases"];
}

- (NSArray)purchases
{
  return self->_purchases;
}

- (void).cxx_destruct
{
}

@end