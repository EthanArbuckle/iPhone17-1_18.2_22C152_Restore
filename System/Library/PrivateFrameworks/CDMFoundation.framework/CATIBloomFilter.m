@interface CATIBloomFilter
- (BOOL)contains:(id)a3;
- (CATIBloomFilter)initWithExceptedNumberOfItems:(unint64_t)a3 falsePositiveRate:(double)a4 seed:(unsigned int)a5;
- (double)falsePositiveRate;
- (unint64_t)expectedNumberOfItems;
- (unsigned)seed;
- (void)add:(id)a3;
@end

@implementation CATIBloomFilter

- (void).cxx_destruct
{
}

- (double)falsePositiveRate
{
  return self->_falsePositiveRate;
}

- (unint64_t)expectedNumberOfItems
{
  return self->_expectedNumberOfItems;
}

- (unsigned)seed
{
  return self->_seed;
}

- (BOOL)contains:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MurmurHash3 hash128WithKey:length:seed:](MurmurHash3, "hash128WithKey:length:seed:", [v4 bytes], objc_msgSend(v4, "length"), self->_seed);
  if (self->_numberHashes)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    uint64_t v9 = 0;
    int v10 = 0;
    do
    {
      BOOL v11 = [(CATIBitVector *)self->bitVector testAtIndex:(v7 + v9 * v8) % self->_numberOfBits];
      if (!v11) {
        break;
      }
      uint64_t v9 = ++v10;
    }
    while (self->_numberHashes > v10);
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (void)add:(id)a3
{
  id v10 = a3;
  uint64_t v4 = +[MurmurHash3 hash128WithKey:length:seed:](MurmurHash3, "hash128WithKey:length:seed:", [v10 bytes], objc_msgSend(v10, "length"), self->_seed);
  if (self->_numberHashes)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    uint64_t v8 = 0;
    int v9 = 0;
    do
    {
      [(CATIBitVector *)self->bitVector setAtIndex:(v6 + v8 * v7) % self->_numberOfBits];
      uint64_t v8 = ++v9;
    }
    while (self->_numberHashes > v9);
  }
}

- (CATIBloomFilter)initWithExceptedNumberOfItems:(unint64_t)a3 falsePositiveRate:(double)a4 seed:(unsigned int)a5
{
  v15.receiver = self;
  v15.super_class = (Class)CATIBloomFilter;
  uint64_t v8 = [(CATIBloomFilter *)&v15 init];
  int v9 = v8;
  if (v8)
  {
    v8->_seed = a5;
    unint64_t v10 = a3 + a5;
    v8->_expectedNumberOfItems = v10;
    v8->_falsePositiveRate = a4;
    unint64_t v11 = vcvtpd_u64_f64(log(a4) * (double)v10 / -0.480453014);
    v9->_numberOfBits = v11;
    v9->_numberHashes = vcvtpd_u64_f64((double)(v11 / v10) * 0.693147181);
    v12 = [[CATIBitVector alloc] initWithNumberOfBits:v9->_numberOfBits];
    bitVector = v9->bitVector;
    v9->bitVector = v12;
  }
  return v9;
}

@end