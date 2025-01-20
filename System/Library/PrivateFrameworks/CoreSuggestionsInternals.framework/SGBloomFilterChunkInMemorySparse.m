@interface SGBloomFilterChunkInMemorySparse
- (BOOL)exists:(id)a3;
- (SGBloomFilterChunkInMemorySparse)init;
- (unsigned)count;
- (void)add:(id)a3;
@end

@implementation SGBloomFilterChunkInMemorySparse

- (void).cxx_destruct
{
}

- (BOOL)exists:(id)a3
{
  hashes = self->_hashes;
  v4 = [NSNumber numberWithUnsignedLongLong:a3.var0];
  LOBYTE(hashes) = [(NSMutableSet *)hashes containsObject:v4];

  return (char)hashes;
}

- (void)add:(id)a3
{
  hashes = self->_hashes;
  id v4 = [NSNumber numberWithUnsignedLongLong:a3.var0];
  [(NSMutableSet *)hashes addObject:v4];
}

- (unsigned)count
{
  return [(NSMutableSet *)self->_hashes count];
}

- (SGBloomFilterChunkInMemorySparse)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGBloomFilterChunkInMemorySparse;
  v2 = [(SGBloomFilterChunkInMemorySparse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    hashes = v2->_hashes;
    v2->_hashes = (NSMutableSet *)v3;
  }
  return v2;
}

@end