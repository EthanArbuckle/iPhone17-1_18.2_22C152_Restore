@interface SGBloomFilterChunkInMemory
- (BOOL)exists:(id)a3;
- (SGBloomFilterChunkInMemory)init;
- (unsigned)count;
- (void)add:(id)a3;
@end

@implementation SGBloomFilterChunkInMemory

- (BOOL)exists:(id)a3
{
  v3 = &self->_buf[6150 * (a3.var0 & 7)];
  if (((v3[(unint64_t)(a3.var1.var0 % 0x1806) >> 3] >> ((a3.var1.var0 % 0x1806) & 7)) & 1) == 0) {
    return 0;
  }
  unsigned int v4 = 2 * a3.var1.var0;
  unsigned int v5 = -1;
  while (v5 != 8)
  {
    unsigned int v6 = v3[(unint64_t)(v4 % 0x1806) >> 3];
    char v7 = (v4 % 0x1806) & 7;
    v4 += a3.var1.var0;
    ++v5;
    if (((v6 >> v7) & 1) == 0) {
      return v5 > 8;
    }
  }
  unsigned int v5 = 9;
  return v5 > 8;
}

- (void)add:(id)a3
{
  if (doInsert((uint64_t)self->_buf, a3.var1.var0, 7)) {
    ++self->_count;
  }
}

- (unsigned)count
{
  return self->_count;
}

- (SGBloomFilterChunkInMemory)init
{
  v3.receiver = self;
  v3.super_class = (Class)SGBloomFilterChunkInMemory;
  return [(SGBloomFilterChunkInMemory *)&v3 init];
}

@end