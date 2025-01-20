@interface CRKSaveSignInHistoryRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (CRKSaveSignInHistoryRequest)initWithCoder:(id)a3;
- (CRKSignInHistoryItem)item;
- (void)encodeWithCoder:(id)a3;
- (void)setItem:(id)a3;
@end

@implementation CRKSaveSignInHistoryRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSaveSignInHistoryRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKSaveSignInHistoryRequest;
  v5 = [(CATTaskRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"item"];
    item = v5->_item;
    v5->_item = (CRKSignInHistoryItem *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKSaveSignInHistoryRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(CRKSaveSignInHistoryRequest *)self item];
  [v4 encodeObject:v5 forKey:@"item"];
}

- (CRKSignInHistoryItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end