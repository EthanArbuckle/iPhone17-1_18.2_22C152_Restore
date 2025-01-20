@interface GLKHashableBigInt
- (BOOL)isEqual:(id)a3;
- (GLKHashableBigInt)initWithBigInt:(GLKBigInt_s *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation GLKHashableBigInt

- (GLKHashableBigInt)initWithBigInt:(GLKBigInt_s *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GLKHashableBigInt;
  result = [(GLKHashableBigInt *)&v5 init];
  if (result) {
    result->_bigInt = *a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[GLKHashableBigInt allocWithZone:a3] init];
  *(GLKBigInt_s *)((char *)result + 8) = self->_bigInt;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  return *((void *)a3 + 1) == self->_bigInt.n0 && *((void *)a3 + 2) == self->_bigInt.n1;
}

- (unint64_t)hash
{
  unint64_t v2 = self;
  uint64_t v3 = 0;
  unint64_t v4 = self + 8;
  LODWORD(self) = -2128831035;
  do
    LODWORD(self) = (16777619 * self) ^ *(unsigned __int8 *)(v4 + v3++);
  while (v3 != 8);
  uint64_t v5 = 0;
  unint64_t v6 = v2 + 16;
  do
    self = (16777619 * self) ^ *(unsigned __int8 *)(v6 + v5++);
  while (v5 != 8);
  return self;
}

@end