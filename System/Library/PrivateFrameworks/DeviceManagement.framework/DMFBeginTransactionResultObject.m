@interface DMFBeginTransactionResultObject
+ (BOOL)supportsSecureCoding;
- (DMFBeginTransactionResultObject)initWithCoder:(id)a3;
- (DMFBeginTransactionResultObject)initWithUUID:(id)a3;
- (NSUUID)UUID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFBeginTransactionResultObject

- (DMFBeginTransactionResultObject)initWithUUID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFBeginTransactionResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFBeginTransactionResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFBeginTransactionResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFBeginTransactionResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFBeginTransactionResultObject *)self UUID];
  [v4 encodeObject:v5 forKey:@"UUID"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DMFBeginTransactionResultObject *)self UUID];
  objc_super v6 = [v3 stringWithFormat:@"<%@: %p {\n\tUUID: %@\n}>", v4, self, v5];

  return v6;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
}

@end