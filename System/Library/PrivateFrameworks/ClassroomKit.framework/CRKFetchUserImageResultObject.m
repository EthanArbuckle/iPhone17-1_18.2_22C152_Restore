@interface CRKFetchUserImageResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchUserImageResultObject)initWithCoder:(id)a3;
- (NSData)userImageData;
- (void)encodeWithCoder:(id)a3;
- (void)setUserImageData:(id)a3;
@end

@implementation CRKFetchUserImageResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchUserImageResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFetchUserImageResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"userImageData"];
    userImageData = v5->_userImageData;
    v5->_userImageData = (NSData *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchUserImageResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchUserImageResultObject *)self userImageData];
  [v4 encodeObject:v5 forKey:@"userImageData"];
}

- (NSData)userImageData
{
  return self->_userImageData;
}

- (void)setUserImageData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end