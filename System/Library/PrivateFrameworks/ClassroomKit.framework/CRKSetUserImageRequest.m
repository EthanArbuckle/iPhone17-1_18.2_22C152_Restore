@interface CRKSetUserImageRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (CRKSetUserImageRequest)initWithCoder:(id)a3;
- (DMFControlGroupIdentifier)courseIdentifier;
- (NSData)userImageData;
- (NSString)userIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setCourseIdentifier:(id)a3;
- (void)setUserIdentifier:(id)a3;
- (void)setUserImageData:(id)a3;
@end

@implementation CRKSetUserImageRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetUserImageRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRKSetUserImageRequest;
  v5 = [(CATTaskRequest *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"userIdentifier"];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"userImageData"];
    userImageData = v5->_userImageData;
    v5->_userImageData = (NSData *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"courseIdentifier"];
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRKSetUserImageRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v8 encodeWithCoder:v4];
  v5 = [(CRKSetUserImageRequest *)self userIdentifier];
  [v4 encodeObject:v5 forKey:@"userIdentifier"];

  v6 = [(CRKSetUserImageRequest *)self userImageData];
  [v4 encodeObject:v6 forKey:@"userImageData"];

  uint64_t v7 = [(CRKSetUserImageRequest *)self courseIdentifier];
  [v4 encodeObject:v7 forKey:@"courseIdentifier"];
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
}

- (NSData)userImageData
{
  return self->_userImageData;
}

- (void)setUserImageData:(id)a3
{
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_courseIdentifier, 0);
  objc_storeStrong((id *)&self->_userImageData, 0);

  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end