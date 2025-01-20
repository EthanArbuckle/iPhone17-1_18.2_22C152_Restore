@interface CMLClientConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClientConfig:(id)a3;
- (CMLClientConfig)initWithCoder:(id)a3;
- (CMLClientConfig)initWithUseCase:(id)a3;
- (CMLClientConfig)initWithUseCase:(id)a3 sourceApplicationBundleIdentifier:(id)a4;
- (NSString)sourceApplicationBundleIdentifier;
- (NSString)useCase;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMLClientConfig

- (CMLClientConfig)initWithUseCase:(id)a3 sourceApplicationBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CMLClientConfig;
  v9 = [(CMLClientConfig *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_useCase, a3);
    objc_storeStrong((id *)&v10->_sourceApplicationBundleIdentifier, a4);
  }

  return v10;
}

- (CMLClientConfig)initWithUseCase:(id)a3
{
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 mainBundle];
  id v7 = [v6 bundleIdentifier];
  id v8 = [(CMLClientConfig *)self initWithUseCase:v5 sourceApplicationBundleIdentifier:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CMLClientConfig *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CMLClientConfig *)self isEqualToClientConfig:v5];

  return v6;
}

- (BOOL)isEqualToClientConfig:(id)a3
{
  id v4 = a3;
  id v5 = [(CMLClientConfig *)self sourceApplicationBundleIdentifier];
  BOOL v6 = [v4 sourceApplicationBundleIdentifier];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    id v7 = [(CMLClientConfig *)self sourceApplicationBundleIdentifier];
    id v8 = [v4 sourceApplicationBundleIdentifier];
    char v9 = [v7 isEqual:v8];
  }
  v10 = [(CMLClientConfig *)self useCase];
  v11 = [v4 useCase];
  char v12 = [v10 isEqual:v11] & v9;

  return v12;
}

- (unint64_t)hash
{
  v3 = [(CMLClientConfig *)self useCase];
  uint64_t v4 = [v3 hash];
  id v5 = [(CMLClientConfig *)self sourceApplicationBundleIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLClientConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"useCase"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceApplicationBundleIdentifier"];

  id v7 = [(CMLClientConfig *)self initWithUseCase:v5 sourceApplicationBundleIdentifier:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CMLClientConfig *)self useCase];
  [v4 encodeObject:v5 forKey:@"useCase"];

  id v6 = [(CMLClientConfig *)self sourceApplicationBundleIdentifier];
  [v4 encodeObject:v6 forKey:@"sourceApplicationBundleIdentifier"];
}

- (NSString)useCase
{
  return self->_useCase;
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
}

@end