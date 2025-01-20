@interface CATIBitVector
- (BOOL)testAtIndex:(unint64_t)a3;
- (CATIBitVector)initWithNumberOfBits:(unint64_t)a3;
- (id)data;
- (unint64_t)numberOfBits;
- (unint64_t)numberOfBytes;
- (void)dealloc;
- (void)setAtIndex:(unint64_t)a3;
@end

@implementation CATIBitVector

- (unint64_t)numberOfBytes
{
  return self->_numberOfBytes;
}

- (unint64_t)numberOfBits
{
  return self->_numberOfBits;
}

- (id)data
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:self->_data length:self->_numberOfBytes];
  return v2;
}

- (BOOL)testAtIndex:(unint64_t)a3
{
  return (self->_data[a3 >> self->_bitShift] >> (a3 % self->_bitsPerBlock)) & 1;
}

- (void)setAtIndex:(unint64_t)a3
{
  self->_data[a3 >> self->_bitShift] |= 1 << (a3 % self->_bitsPerBlock);
}

- (void)dealloc
{
  free(self->_data);
  v3.receiver = self;
  v3.super_class = (Class)CATIBitVector;
  [(CATIBitVector *)&v3 dealloc];
}

- (CATIBitVector)initWithNumberOfBits:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CATIBitVector;
  v4 = [(CATIBitVector *)&v8 init];
  v5 = (CATIBitVector *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 8) = xmmword_226615AE0;
    size_t v6 = vcvtps_u32_f32((float)a3 * 0.125);
    v5->_numberOfBits = a3;
    v5->_numberOfBytes = v6;
    v5->_data = (char *)malloc_type_calloc(v6, 1uLL, 0x100004077774924uLL);
  }
  return v5;
}

@end