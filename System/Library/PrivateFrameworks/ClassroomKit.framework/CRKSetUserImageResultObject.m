@interface CRKSetUserImageResultObject
+ (BOOL)supportsSecureCoding;
- (CRKSetUserImageResultObject)initWithCoder:(id)a3;
- (NSString)imageIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setImageIdentifier:(id)a3;
@end

@implementation CRKSetUserImageResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetUserImageResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKSetUserImageResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"imageIdentifier"];
    imageIdentifier = v5->_imageIdentifier;
    v5->_imageIdentifier = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKSetUserImageResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKSetUserImageResultObject *)self imageIdentifier];
  [v4 encodeObject:v5 forKey:@"imageIdentifier"];
}

- (NSString)imageIdentifier
{
  return self->_imageIdentifier;
}

- (void)setImageIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end