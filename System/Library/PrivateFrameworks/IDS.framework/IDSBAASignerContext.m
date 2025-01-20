@interface IDSBAASignerContext
+ (BOOL)supportsSecureCoding;
- (IDSBAASignerContext)initWithCoder:(id)a3;
- (IDSBAASignerContext)initWithSigningDigest:(id)a3;
- (NSString)signingDigest;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSBAASignerContext

- (IDSBAASignerContext)initWithSigningDigest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSBAASignerContext;
  v6 = [(IDSBAASignerContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_signingDigest, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSBAASignerContext *)self signingDigest];
  [v4 encodeObject:v5 forKey:@"SigningDigest"];
}

- (IDSBAASignerContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SigningDigest"];

  v9.receiver = self;
  v9.super_class = (Class)IDSBAASignerContext;
  v6 = [(IDSBAASignerContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_signingDigest, v5);
  }

  return v7;
}

- (NSString)signingDigest
{
  return self->_signingDigest;
}

- (void).cxx_destruct
{
}

@end