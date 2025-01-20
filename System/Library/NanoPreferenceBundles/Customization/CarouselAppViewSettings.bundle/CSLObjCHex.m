@interface CSLObjCHex
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CSLObjCHex)init;
- (CSLObjCHex)initWithCoder:(id)a3;
- (CSLObjCHex)initWithHex:(Hex)a3;
- (Hex)hex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)q;
- (int)r;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHex:(Hex)a3;
- (void)setQ:(int)a3;
- (void)setR:(int)a3;
@end

@implementation CSLObjCHex

- (CSLObjCHex)initWithHex:(Hex)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSLObjCHex;
  result = [(CSLObjCHex *)&v5 init];
  if (result) {
    *(Hex *)&result->_q = a3;
  }
  return result;
}

- (CSLObjCHex)init
{
  return [(CSLObjCHex *)self initWithHex:0];
}

- (Hex)hex
{
  return *(Hex *)&self->_q;
}

- (void)setHex:(Hex)a3
{
  *(Hex *)&self->_q = a3;
}

- (unint64_t)hash
{
  uint64_t v3 = (uint64_t)[(CSLObjCHex *)self q] << 16;
  return v3 + [(CSLObjCHex *)self r];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CSLObjCHex *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      unsigned int v6 = [(CSLObjCHex *)self r];
      if (v6 == [(CSLObjCHex *)v5 r])
      {
        unsigned int v7 = [(CSLObjCHex *)self q];
        char v8 = v7 == [(CSLObjCHex *)v5 q];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  return +[NSString stringWithFormat:@"hex{%d,%d}", [(CSLObjCHex *)self q], [(CSLObjCHex *)self r]];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    *((_DWORD *)result + 2) = self->_q;
    *((_DWORD *)result + 3) = self->_r;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CSLObjCHex)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSLObjCHex;
  objc_super v5 = [(CSLObjCHex *)&v7 init];
  if (v5)
  {
    v5->_q = [v4 decodeIntForKey:@"q"];
    v5->_r = [v4 decodeIntForKey:@"r"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[CSLObjCHex q](self, "q"), @"q");
  objc_msgSend(v4, "encodeInt:forKey:", -[CSLObjCHex r](self, "r"), @"r");
}

- (int)q
{
  return self->_q;
}

- (void)setQ:(int)a3
{
  self->_q = a3;
}

- (int)r
{
  return self->_r;
}

- (void)setR:(int)a3
{
  self->_r = a3;
}

@end