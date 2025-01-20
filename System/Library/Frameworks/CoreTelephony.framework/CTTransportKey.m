@interface CTTransportKey
+ (BOOL)supportsSecureCoding;
- (BOOL)last_resort;
- (CTTransportKey)initWithCoder:(id)a3;
- (CTTransportKey)initWithKey:(id)a3 epki:(id)a4 forIdx:(int)a5 toReplace:(id)a6 epki:(id)a7;
- (CTTransportKey)initWithKey:(id)a3 epki:(id)a4 forIdx:(int)a5 toReplaceEpki:(id)a6 isLastResort:(BOOL)a7;
- (CTTransportKey)initWithKey:(id)a3 forIdx:(int)a4 toReplace:(id)a5;
- (NSData)key;
- (NSData)key_epki;
- (NSData)retiredKey_epki;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)index;
- (void)encodeWithCoder:(id)a3;
- (void)setIndex:(int)a3;
- (void)setKey:(id)a3;
- (void)setKey_epki:(id)a3;
- (void)setLast_resort:(BOOL)a3;
- (void)setRetiredKey_epki:(id)a3;
@end

@implementation CTTransportKey

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", index=%d", -[CTTransportKey index](self, "index")];
  v4 = [(CTTransportKey *)self key];
  [v3 appendFormat:@", key=%@", v4];

  v5 = [(CTTransportKey *)self key_epki];
  [v3 appendFormat:@", epki=%@", v5];

  v6 = [(CTTransportKey *)self retiredKey_epki];
  [v3 appendFormat:@", retired epki=%@", v6];

  [v3 appendFormat:@", last resort=%d", -[CTTransportKey last_resort](self, "last_resort")];
  [v3 appendString:@">"];

  return v3;
}

- (CTTransportKey)initWithKey:(id)a3 epki:(id)a4 forIdx:(int)a5 toReplaceEpki:(id)a6 isLastResort:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CTTransportKey;
  v15 = [(CTTransportKey *)&v18 init];
  v16 = v15;
  if (v15)
  {
    [(CTTransportKey *)v15 setIndex:v9];
    [(CTTransportKey *)v16 setKey:v12];
    [(CTTransportKey *)v16 setKey_epki:v13];
    [(CTTransportKey *)v16 setRetiredKey_epki:v14];
    [(CTTransportKey *)v16 setLast_resort:v7];
  }

  return v16;
}

- (CTTransportKey)initWithKey:(id)a3 forIdx:(int)a4 toReplace:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTTransportKey;
  v8 = [(CTTransportKey *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(CTTransportKey *)v8 setIndex:v5];
    [(CTTransportKey *)v9 setKey:v7];
    [(CTTransportKey *)v9 setKey_epki:0];
    [(CTTransportKey *)v9 setRetiredKey_epki:0];
    [(CTTransportKey *)v9 setLast_resort:0];
  }

  return v9;
}

- (CTTransportKey)initWithKey:(id)a3 epki:(id)a4 forIdx:(int)a5 toReplace:(id)a6 epki:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)CTTransportKey;
  id v14 = [(CTTransportKey *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(CTTransportKey *)v14 setIndex:v8];
    [(CTTransportKey *)v15 setKey:v11];
    [(CTTransportKey *)v15 setKey_epki:v12];
    [(CTTransportKey *)v15 setRetiredKey_epki:v13];
    [(CTTransportKey *)v15 setLast_resort:0];
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIndex:", -[CTTransportKey index](self, "index"));
  uint64_t v5 = [(CTTransportKey *)self key];
  v6 = (void *)[v5 copy];
  [v4 setKey:v6];

  id v7 = [(CTTransportKey *)self key_epki];
  uint64_t v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setKey_epki:", v8);

  uint64_t v9 = [(CTTransportKey *)self retiredKey_epki];
  v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setRetiredKey_epki:", v10);

  objc_msgSend(v4, "setLast_resort:", -[CTTransportKey last_resort](self, "last_resort"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeInt32:forKey:", -[CTTransportKey index](self, "index"), @"tkey_index");
  v4 = [(CTTransportKey *)self key];
  [v7 encodeObject:v4 forKey:@"tkey_value"];

  uint64_t v5 = [(CTTransportKey *)self key_epki];
  [v7 encodeObject:v5 forKey:@"tkey_epki"];

  v6 = [(CTTransportKey *)self retiredKey_epki];
  [v7 encodeObject:v6 forKey:@"tkey_retired_epki"];

  objc_msgSend(v7, "encodeBool:forKey:", -[CTTransportKey last_resort](self, "last_resort"), @"last_resort");
}

- (CTTransportKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTTransportKey;
  uint64_t v5 = [(CTTransportKey *)&v13 init];
  if (v5)
  {
    v5->_index = [v4 decodeInt32ForKey:@"tkey_index"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tkey_value"];
    key = v5->_key;
    v5->_key = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tkey_epki"];
    key_epki = v5->_key_epki;
    v5->_key_epki = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tkey_retired_epki"];
    retiredKey_epki = v5->_retiredKey_epki;
    v5->_retiredKey_epki = (NSData *)v10;

    v5->_last_resort = [v4 decodeBoolForKey:@"last_resort"];
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

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSData)key_epki
{
  return self->_key_epki;
}

- (void)setKey_epki:(id)a3
{
}

- (NSData)retiredKey_epki
{
  return self->_retiredKey_epki;
}

- (void)setRetiredKey_epki:(id)a3
{
}

- (BOOL)last_resort
{
  return self->_last_resort;
}

- (void)setLast_resort:(BOOL)a3
{
  self->_last_resort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retiredKey_epki, 0);
  objc_storeStrong((id *)&self->_key_epki, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end