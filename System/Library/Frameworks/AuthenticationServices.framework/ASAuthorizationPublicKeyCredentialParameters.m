@interface ASAuthorizationPublicKeyCredentialParameters
+ (BOOL)supportsSecureCoding;
- (ASAuthorizationPublicKeyCredentialParameters)initWithAlgorithm:(ASCOSEAlgorithmIdentifier)algorithm;
- (ASAuthorizationPublicKeyCredentialParameters)initWithCoder:(id)a3;
- (ASCOSEAlgorithmIdentifier)algorithm;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASAuthorizationPublicKeyCredentialParameters

- (ASAuthorizationPublicKeyCredentialParameters)initWithAlgorithm:(ASCOSEAlgorithmIdentifier)algorithm
{
  v8.receiver = self;
  v8.super_class = (Class)ASAuthorizationPublicKeyCredentialParameters;
  v4 = [(ASAuthorizationPublicKeyCredentialParameters *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_algorithm = algorithm;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  ASCOSEAlgorithmIdentifier v5 = [(ASAuthorizationPublicKeyCredentialParameters *)self algorithm];

  return (id)[v4 initWithAlgorithm:v5];
}

- (ASAuthorizationPublicKeyCredentialParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  ASCOSEAlgorithmIdentifier v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"algorithm"];

  v6 = -[ASAuthorizationPublicKeyCredentialParameters initWithAlgorithm:](self, "initWithAlgorithm:", [v5 integerValue]);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[ASAuthorizationPublicKeyCredentialParameters algorithm](self, "algorithm"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"algorithm"];
}

- (ASCOSEAlgorithmIdentifier)algorithm
{
  return self->_algorithm;
}

@end