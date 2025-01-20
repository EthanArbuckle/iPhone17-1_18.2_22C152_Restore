@interface FPPair
+ (id)pairWithFirst:(id)a3 second:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPair:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)first;
- (id)second;
- (unint64_t)hash;
- (void)setFirst:(id)a3;
- (void)setSecond:(id)a3;
@end

@implementation FPPair

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  v9 = (id *)v8;
  if (v8)
  {
    objc_storeStrong((id *)(v8 + 8), a3);
    objc_storeStrong(v9 + 2, a4);
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_first hash];
  return [self->_second hash] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqualToPair:(id)a3
{
  v4 = a3;
  id first = self->_first;
  if (first == (id)v4[1] || objc_msgSend(first, "isEqual:"))
  {
    id second = self->_second;
    if (second == (id)v4[2]) {
      char v7 = 1;
    }
    else {
      char v7 = objc_msgSend(second, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FPPair *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(FPPair *)self isEqualToPair:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p first:%@ second:%@>", objc_opt_class(), self, self->_first, self->_second];
}

- (id)first
{
  return self->_first;
}

- (void)setFirst:(id)a3
{
}

- (id)second
{
  return self->_second;
}

- (void)setSecond:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);

  objc_storeStrong(&self->_first, 0);
}

@end