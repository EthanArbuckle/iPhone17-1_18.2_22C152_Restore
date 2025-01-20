@interface EFMutableByteSet
- (id)copyWithZone:(_NSZone *)a3;
- (void)addBytesInRange:(_NSRange)a3;
- (void)invert;
- (void)removeBytesInRange:(_NSRange)a3;
@end

@implementation EFMutableByteSet

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(EFByteSet);
  if (result)
  {
    long long v5 = *(_OWORD *)self->super._bitString.__first_;
    *(_OWORD *)((char *)result + 24) = *(_OWORD *)&self->super._bitString.__first_[2];
    *(_OWORD *)((char *)result + 8) = v5;
  }
  return result;
}

- (void)addBytesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = a3.location + a3.length;
  if (a3.location + a3.length >= 0x101)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    v9 = NSStringFromRange(a3);
    [v7 raise:v8, @"range extends beyond {0..255}: (NSRange) %@", v9 format];
  }
  if (location < v6)
  {
    uint64_t v10 = 256;
    if (location > 0x100) {
      uint64_t v10 = location;
    }
    do
    {
      if (v10 == location) {
        std::__throw_out_of_range[abi:ne180100]("bitset set argument out of range");
      }
      *(unint64_t *)((char *)self->super._bitString.__first_ + ((location >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << location;
      ++location;
      --length;
    }
    while (length);
  }
}

- (void)removeBytesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = a3.location + a3.length;
  if (a3.location + a3.length >= 0x101)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    v9 = NSStringFromRange(a3);
    [v7 raise:v8, @"range extends beyond {0..255}: (NSRange) %@", v9 format];
  }
  if (location < v6)
  {
    uint64_t v10 = 256;
    if (location > 0x100) {
      uint64_t v10 = location;
    }
    do
    {
      if (v10 == location) {
        std::__throw_out_of_range[abi:ne180100]("bitset reset argument out of range");
      }
      *(unint64_t *)((char *)self->super._bitString.__first_ + ((location >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << location);
      ++location;
      --length;
    }
    while (length);
  }
}

- (void)invert
{
  *(int8x16_t *)self->super._bitString.__first_ = vmvnq_s8(*(int8x16_t *)self->super._bitString.__first_);
  *(int8x16_t *)&self->super._bitString.__first_[2] = vmvnq_s8(*(int8x16_t *)&self->super._bitString.__first_[2]);
}

@end