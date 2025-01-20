@interface CTIPFilterEndpoint
+ (BOOL)supportsSecureCoding;
- (CTIPFilterEndpoint)initWithCoder:(id)a3;
- (NSNumber)maskLen;
- (NSNumber)port;
- (NSNumber)portRange;
- (NSString)addr;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAddr:(id)a3;
- (void)setMaskLen:(id)a3;
- (void)setPort:(id)a3;
- (void)setPortRange:(id)a3;
@end

@implementation CTIPFilterEndpoint

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTIPFilterEndpoint *)self addr];

  if (v4)
  {
    v5 = [(CTIPFilterEndpoint *)self addr];
    [v3 appendFormat:@", addr=%@", v5];
  }
  v6 = [(CTIPFilterEndpoint *)self maskLen];

  if (v6)
  {
    v7 = [(CTIPFilterEndpoint *)self maskLen];
    [v3 appendFormat:@", maskLen=%@", v7];
  }
  v8 = [(CTIPFilterEndpoint *)self port];

  if (v8)
  {
    v9 = [(CTIPFilterEndpoint *)self port];
    [v3 appendFormat:@", port=%@", v9];
  }
  v10 = [(CTIPFilterEndpoint *)self portRange];

  if (v10)
  {
    v11 = [(CTIPFilterEndpoint *)self portRange];
    [v3 appendFormat:@", portRange=%@", v11];
  }
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTIPFilterEndpoint *)self addr];
  v6 = (void *)[v5 copy];
  [v4 setAddr:v6];

  v7 = [(CTIPFilterEndpoint *)self maskLen];
  v8 = (void *)[v7 copy];
  [v4 setMaskLen:v8];

  v9 = [(CTIPFilterEndpoint *)self port];
  v10 = (void *)[v9 copy];
  [v4 setPort:v10];

  v11 = [(CTIPFilterEndpoint *)self portRange];
  v12 = (void *)[v11 copy];
  [v4 setPortRange:v12];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTIPFilterEndpoint *)self addr];
  [v4 encodeObject:v5 forKey:@"addr"];

  v6 = [(CTIPFilterEndpoint *)self maskLen];
  [v4 encodeObject:v6 forKey:@"maskLen"];

  v7 = [(CTIPFilterEndpoint *)self port];
  [v4 encodeObject:v7 forKey:@"port"];

  id v8 = [(CTIPFilterEndpoint *)self portRange];
  [v4 encodeObject:v8 forKey:@"portRange"];
}

- (CTIPFilterEndpoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTIPFilterEndpoint;
  v5 = [(CTIPFilterEndpoint *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"addr"];
    addr = v5->_addr;
    v5->_addr = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maskLen"];
    maskLen = v5->_maskLen;
    v5->_maskLen = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"port"];
    port = v5->_port;
    v5->_port = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"portRange"];
    portRange = v5->_portRange;
    v5->_portRange = (NSNumber *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)addr
{
  return self->_addr;
}

- (void)setAddr:(id)a3
{
}

- (NSNumber)maskLen
{
  return self->_maskLen;
}

- (void)setMaskLen:(id)a3
{
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
}

- (NSNumber)portRange
{
  return self->_portRange;
}

- (void)setPortRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portRange, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_maskLen, 0);

  objc_storeStrong((id *)&self->_addr, 0);
}

@end