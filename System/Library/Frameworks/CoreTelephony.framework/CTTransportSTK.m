@interface CTTransportSTK
+ (BOOL)supportsSecureCoding;
- (CTTransportSTK)initWithCoder:(id)a3;
- (CTTransportSTK)initWithSTK:(id)a3 forIdx:(int)a4;
- (CTTransportSTK)initWithSTK:(id)a3 forIdx:(int)a4 epki:(id)a5;
- (NSData)key_epki;
- (NSData)stk;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)index;
- (void)encodeWithCoder:(id)a3;
- (void)setIndex:(int)a3;
- (void)setKey_epki:(id)a3;
- (void)setStk:(id)a3;
@end

@implementation CTTransportSTK

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", index=%d", -[CTTransportSTK index](self, "index")];
  v4 = [(CTTransportSTK *)self key_epki];
  [v3 appendFormat:@", epki=%@", v4];

  v5 = [(CTTransportSTK *)self stk];
  [v3 appendFormat:@", stk=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (CTTransportSTK)initWithSTK:(id)a3 forIdx:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTTransportSTK;
  v7 = [(CTTransportSTK *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(CTTransportSTK *)v7 setIndex:v4];
    [(CTTransportSTK *)v8 setStk:v6];
  }

  return v8;
}

- (CTTransportSTK)initWithSTK:(id)a3 forIdx:(int)a4 epki:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CTTransportSTK;
  objc_super v10 = [(CTTransportSTK *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(CTTransportSTK *)v10 setIndex:v6];
    [(CTTransportSTK *)v11 setKey_epki:v9];
    [(CTTransportSTK *)v11 setStk:v8];
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIndex:", -[CTTransportSTK index](self, "index"));
  v5 = [(CTTransportSTK *)self key_epki];
  uint64_t v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setKey_epki:", v6);

  v7 = [(CTTransportSTK *)self stk];
  id v8 = (void *)[v7 copy];
  [v4 setStk:v8];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[CTTransportSTK index](self, "index"), @"tkey_index");
  v5 = [(CTTransportSTK *)self key_epki];
  [v4 encodeObject:v5 forKey:@"tkey_epki"];

  id v6 = [(CTTransportSTK *)self stk];
  [v4 encodeObject:v6 forKey:@"tkey_value"];
}

- (CTTransportSTK)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTTransportSTK;
  v5 = [(CTTransportSTK *)&v11 init];
  if (v5)
  {
    v5->_index = [v4 decodeInt32ForKey:@"tkey_index"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tkey_epki"];
    key_epki = v5->_key_epki;
    v5->_key_epki = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tkey_value"];
    stk = v5->_stk;
    v5->_stk = (NSData *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)index
{
  return self->_index;
}

- (void)setIndex:(int)a3
{
  self->_index = a3;
}

- (NSData)key_epki
{
  return self->_key_epki;
}

- (void)setKey_epki:(id)a3
{
}

- (NSData)stk
{
  return self->_stk;
}

- (void)setStk:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stk, 0);

  objc_storeStrong((id *)&self->_key_epki, 0);
}

@end