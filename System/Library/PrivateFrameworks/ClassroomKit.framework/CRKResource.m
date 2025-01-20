@interface CRKResource
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHostedResource:(id)a3;
- (BOOL)isZippedBundle;
- (CRKResource)initWithCoder:(id)a3;
- (CRKResource)initWithDictionary:(id)a3;
- (CRKResource)initWithHostedURL:(id)a3 isZippedBundle:(BOOL)a4;
- (NSDictionary)dictionaryValue;
- (NSURL)hostedURL;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHostedURL:(id)a3;
- (void)setZippedBundle:(BOOL)a3;
@end

@implementation CRKResource

- (CRKResource)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"HostedURL"];
  v6 = [v4 objectForKeyedSubscript:@"IsZippedBundle"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass())))
  {
    self = -[CRKResource initWithHostedURL:isZippedBundle:](self, "initWithHostedURL:isZippedBundle:", v5, [v6 BOOLValue]);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CRKResource)initWithHostedURL:(id)a3 isZippedBundle:(BOOL)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CRKResource.m", 42, @"Invalid parameter not satisfying: %@", @"hostedURL" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)CRKResource;
  v9 = [(CRKResource *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hostedURL, a3);
    v10->_zippedBundle = a4;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(CRKResource *)self hostedURL];
  uint64_t v4 = [v3 hash];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKResource isZippedBundle](self, "isZippedBundle"));
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CRKResource *)self isEqualToHostedResource:v4];

  return v5;
}

- (BOOL)isEqualToHostedResource:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRKResource *)self hostedURL];
  unint64_t v6 = [v4 hostedURL];
  if ([v5 isEqual:v6])
  {
    BOOL v7 = [(CRKResource *)self isZippedBundle];
    int v8 = v7 ^ [v4 isZippedBundle] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(CRKResource *)self hostedURL];
  unint64_t v6 = [v5 absoluteString];
  BOOL v7 = [(CRKResource *)self isZippedBundle];
  int v8 = @"NO";
  if (v7) {
    int v8 = @"YES";
  }
  v9 = [v3 stringWithFormat:@"<%@: %p { hostedURL = %@, isZippedBundle = %@ }>", v4, self, v6, v8];

  return v9;
}

- (NSDictionary)dictionaryValue
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"HostedURL";
  v3 = [(CRKResource *)self hostedURL];
  v7[1] = @"IsZippedBundle";
  v8[0] = v3;
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKResource isZippedBundle](self, "isZippedBundle"));
  v8[1] = v4;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKResource)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKResource;
  BOOL v5 = [(CRKResource *)&v11 init];
  if (v5)
  {
    unint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"hostedURL"];
    hostedURL = v5->_hostedURL;
    v5->_hostedURL = (NSURL *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zippedBundle"];
    v5->_zippedBundle = [v9 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRKResource *)self hostedURL];
  [v4 encodeObject:v5 forKey:@"hostedURL"];

  objc_msgSend(NSNumber, "numberWithBool:", -[CRKResource isZippedBundle](self, "isZippedBundle"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"zippedBundle"];
}

- (NSURL)hostedURL
{
  return self->_hostedURL;
}

- (void)setHostedURL:(id)a3
{
}

- (BOOL)isZippedBundle
{
  return self->_zippedBundle;
}

- (void)setZippedBundle:(BOOL)a3
{
  self->_zippedBundle = a3;
}

- (void).cxx_destruct
{
}

@end