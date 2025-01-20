@interface CTDataUsed
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTDataUsage)native;
- (CTDataUsage)proxied;
- (CTDataUsed)initWithCoder:(id)a3;
- (CTDataUsed)initWithUsage:(id)a3 proxied:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)addNativeUsage:(id)a3;
- (void)addProxiedUsage:(id)a3;
- (void)addUsage:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTDataUsed

- (CTDataUsed)initWithUsage:(id)a3 proxied:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CTDataUsed;
  v9 = [(CTDataUsed *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_native, a3);
    objc_storeStrong((id *)&v10->_proxied, a4);
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTDataUsed *)self native];
  [v3 appendFormat:@", native = %@", v4];

  v5 = [(CTDataUsed *)self proxied];
  [v3 appendFormat:@", proxied = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(CTDataUsed *)self native];
  v6 = [v4 native];
  if ([v5 isEqual:v6])
  {
    id v7 = [(CTDataUsed *)self proxied];
    id v8 = [v4 proxied];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)addUsage:(id)a3
{
  id v4 = a3;
  v5 = [v4 native];
  [(CTDataUsed *)self addNativeUsage:v5];

  id v6 = [v4 proxied];

  [(CTDataUsed *)self addProxiedUsage:v6];
}

- (void)addNativeUsage:(id)a3
{
  id v4 = a3;
  id v5 = [(CTDataUsed *)self native];
  [v5 addUsage:v4];
}

- (void)addProxiedUsage:(id)a3
{
  id v4 = a3;
  id v5 = [(CTDataUsed *)self proxied];
  [v5 addUsage:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(CTDataUsed *)self native];
  id v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(CTDataUsed *)self proxied];
  id v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CTDataUsed *)self native];
  [v4 encodeObject:v5 forKey:@"native"];

  id v6 = [(CTDataUsed *)self proxied];
  [v4 encodeObject:v6 forKey:@"proxied"];
}

- (CTDataUsed)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTDataUsed;
  uint64_t v5 = [(CTDataUsed *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"native"];
    native = v5->_native;
    v5->_native = (CTDataUsage *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxied"];
    proxied = v5->_proxied;
    v5->_proxied = (CTDataUsage *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTDataUsage)native
{
  return self->_native;
}

- (CTDataUsage)proxied
{
  return self->_proxied;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxied, 0);

  objc_storeStrong((id *)&self->_native, 0);
}

@end