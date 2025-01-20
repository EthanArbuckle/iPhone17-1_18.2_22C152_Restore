@interface CTStewieRequestContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequestContext:(id)a3;
- (CTStewieRequestContext)initWithCoder:(id)a3;
- (NSData)epki;
- (NSData)shared;
- (NSDictionary)metadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)reason;
- (void)encodeWithCoder:(id)a3;
- (void)setEpki:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setReason:(int64_t)a3;
- (void)setShared:(id)a3;
@end

@implementation CTStewieRequestContext

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  unint64_t v4 = [(CTStewieRequestContext *)self reason];
  if (v4 > 0xA) {
    v5 = "???";
  }
  else {
    v5 = off_1E5267510[v4];
  }
  [v3 appendFormat:@", reason=%s", v5];
  v6 = [(CTStewieRequestContext *)self metadata];
  [v3 appendFormat:@", metadata=%@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToRequestContext:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTStewieRequestContext *)self reason];
  if (v5 == [v4 reason])
  {
    v6 = [(CTStewieRequestContext *)self metadata];
    v7 = [v4 metadata];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(CTStewieRequestContext *)self metadata];
      v9 = [v4 metadata];
      char v10 = [v8 isEqualToDictionary:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTStewieRequestContext *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieRequestContext *)self isEqualToRequestContext:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setReason:", -[CTStewieRequestContext reason](self, "reason"));
  v6 = [(CTStewieRequestContext *)self metadata];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setMetadata:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieRequestContext reason](self, "reason"), @"reason");
  id v4 = [(CTStewieRequestContext *)self metadata];
  [v5 encodeObject:v4 forKey:@"metadata"];
}

- (CTStewieRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTStewieRequestContext;
  id v5 = [(CTStewieRequestContext *)&v15 init];
  if (v5)
  {
    v5->_reason = [v4 decodeIntegerForKey:@"reason"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSData)epki
{
  return self->_epki;
}

- (void)setEpki:(id)a3
{
}

- (NSData)shared
{
  return self->_shared;
}

- (void)setShared:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shared, 0);
  objc_storeStrong((id *)&self->_epki, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end