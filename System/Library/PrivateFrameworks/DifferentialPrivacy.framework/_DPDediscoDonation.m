@interface _DPDediscoDonation
+ (BOOL)supportsSecureCoding;
+ (id)requiredClasses;
- (NSData)share1;
- (NSData)share2;
- (NSDictionary)algorithmParameters;
- (NSDictionary)metadata;
- (NSString)key;
- (NSString)serverAlgorithm;
- (_DPDediscoDonation)initWithCoder:(id)a3;
- (_DPDediscoDonation)initWithKey:(id)a3 share1:(id)a4 share2:(id)a5 dimension:(int64_t)a6 metadata:(id)a7 serverAlgorithm:(id)a8 algorithmParameters:(id)a9;
- (int64_t)dimension;
- (void)encodeWithCoder:(id)a3;
- (void)setAlgorithmParameters:(id)a3;
- (void)setDimension:(int64_t)a3;
- (void)setKey:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setServerAlgorithm:(id)a3;
- (void)setShare1:(id)a3;
- (void)setShare2:(id)a3;
@end

@implementation _DPDediscoDonation

- (_DPDediscoDonation)initWithKey:(id)a3 share1:(id)a4 share2:(id)a5 dimension:(int64_t)a6 metadata:(id)a7 serverAlgorithm:(id)a8 algorithmParameters:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)_DPDediscoDonation;
  v18 = [(_DPDediscoDonation *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_key, a3);
    objc_storeStrong((id *)&v19->_share1, a4);
    objc_storeStrong((id *)&v19->_share2, a5);
    v19->_dimension = a6;
    objc_storeStrong((id *)&v19->_metadata, a7);
    objc_storeStrong((id *)&v19->_serverAlgorithm, a8);
    objc_storeStrong((id *)&v19->_algorithmParameters, a9);
  }

  return v19;
}

+ (id)requiredClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPDediscoDonation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"share1"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"share2"];
  uint64_t v8 = [v4 decodeInt64ForKey:@"dimension"];
  v9 = [v4 decodeObjectForKey:@"metadata"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverAlgorithm"];
  v11 = [v4 decodeObjectForKey:@"algorithmParameters"];

  v12 = [(_DPDediscoDonation *)self initWithKey:v5 share1:v6 share2:v7 dimension:v8 metadata:v9 serverAlgorithm:v10 algorithmParameters:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_DPDediscoDonation *)self key];
  [v4 encodeObject:v5 forKey:@"key"];

  uint64_t v6 = [(_DPDediscoDonation *)self share1];
  [v4 encodeObject:v6 forKey:@"share1"];

  v7 = [(_DPDediscoDonation *)self share2];
  [v4 encodeObject:v7 forKey:@"share2"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[_DPDediscoDonation dimension](self, "dimension"), @"dimension");
  uint64_t v8 = [(_DPDediscoDonation *)self metadata];
  [v4 encodeObject:v8 forKey:@"metadata"];

  v9 = [(_DPDediscoDonation *)self serverAlgorithm];
  [v4 encodeObject:v9 forKey:@"serverAlgorithm"];

  id v10 = [(_DPDediscoDonation *)self algorithmParameters];
  [v4 encodeObject:v10 forKey:@"algorithmParameters"];
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSData)share1
{
  return self->_share1;
}

- (void)setShare1:(id)a3
{
}

- (NSData)share2
{
  return self->_share2;
}

- (void)setShare2:(id)a3
{
}

- (int64_t)dimension
{
  return self->_dimension;
}

- (void)setDimension:(int64_t)a3
{
  self->_dimension = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSString)serverAlgorithm
{
  return self->_serverAlgorithm;
}

- (void)setServerAlgorithm:(id)a3
{
}

- (NSDictionary)algorithmParameters
{
  return self->_algorithmParameters;
}

- (void)setAlgorithmParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmParameters, 0);
  objc_storeStrong((id *)&self->_serverAlgorithm, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_share2, 0);
  objc_storeStrong((id *)&self->_share1, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end