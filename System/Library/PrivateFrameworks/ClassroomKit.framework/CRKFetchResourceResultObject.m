@interface CRKFetchResourceResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchResourceResultObject)initWithCoder:(id)a3;
- (NSData)resourceData;
- (void)encodeWithCoder:(id)a3;
- (void)setResourceData:(id)a3;
@end

@implementation CRKFetchResourceResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchResourceResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFetchResourceResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"resourceData"];
    resourceData = v5->_resourceData;
    v5->_resourceData = (NSData *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchResourceResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchResourceResultObject *)self resourceData];
  [v4 encodeObject:v5 forKey:@"resourceData"];
}

- (NSData)resourceData
{
  return self->_resourceData;
}

- (void)setResourceData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end