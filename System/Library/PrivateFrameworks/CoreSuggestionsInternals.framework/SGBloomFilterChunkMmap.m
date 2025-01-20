@interface SGBloomFilterChunkMmap
- (BOOL)exists:(id)a3;
- (NSString)path;
- (SGBloomFilterChunkMmap)initWithPath:(id)a3;
- (unsigned)count;
- (void)add:(id)a3;
- (void)close;
- (void)dealloc;
@end

@implementation SGBloomFilterChunkMmap

- (void).cxx_destruct
{
}

- (BOOL)exists:(id)a3
{
  unsigned int mask = self->_mask;
  v4 = &self->_buf[6150 * (a3.var0 & 7)];
  if (((v4[(unint64_t)(a3.var1.var0 % 0x1806) >> 3] >> ((a3.var1.var0 % 0x1806) & mask)) & 1) == 0) {
    return 0;
  }
  unsigned int v5 = 2 * a3.var1.var0;
  unsigned int v6 = -1;
  while (v6 != 8)
  {
    unsigned int v7 = v4[(unint64_t)(v5 % 0x1806) >> 3];
    char v8 = (v5 % 0x1806) & mask;
    v5 += a3.var1.var0;
    ++v6;
    if (((v7 >> v8) & 1) == 0) {
      return v6 > 8;
    }
  }
  unsigned int v6 = 9;
  return v6 > 8;
}

- (void)add:(id)a3
{
  if (doInsert((uint64_t)self->_buf, a3.var1.var0, self->_mask)) {
    ++*self->_countPtr;
  }
}

- (NSString)path
{
  return self->_path;
}

- (unsigned)count
{
  return *self->_countPtr;
}

- (void)close
{
  if ((self->_fd & 0x80000000) == 0)
  {
    msync(self->_countPtr, 0xC034uLL, 1);
    munmap(self->_countPtr, 0xC034uLL);
    self->_countPtr = 0;
    close(self->_fd);
    self->_fd = -1;
  }
}

- (void)dealloc
{
  [(SGBloomFilterChunkMmap *)self close];
  v3.receiver = self;
  v3.super_class = (Class)SGBloomFilterChunkMmap;
  [(SGBloomFilterChunkMmap *)&v3 dealloc];
}

- (SGBloomFilterChunkMmap)initWithPath:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SGBloomFilterChunkMmap;
  unsigned int v7 = [(SGBloomFilterChunkMmap *)&v19 init];
  char v8 = v7;
  if (!v7) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v7->_path, a3);
  if (([v6 hasSuffix:@".bf2-head"] & 1) != 0
    || [v6 hasSuffix:@".bf2-tail"])
  {
    int v9 = 7;
LABEL_5:
    v8->_unsigned int mask = v9;
    goto LABEL_6;
  }
  if (([v6 hasSuffix:@".bf-head"] & 1) != 0
    || [v6 hasSuffix:@".bf-tail"])
  {
    int v9 = 3;
    goto LABEL_5;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, v8, @"SGBloomFilter.m", 314, @"Invalid file extension for Bloom filter chunk: %@", v6 object file lineNumber description];

LABEL_6:
  int v10 = open_dprotected_np([(NSString *)v8->_path UTF8String], 514, 3, 0, 384);
  v8->_fd = v10;
  if (v10 == -1)
  {
    v13 = sgLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = *__error();
      *(_DWORD *)buf = 67109120;
      int v21 = v17;
      _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "Could not open Bloom filter file. errno = %i", buf, 8u);
    }

    v12 = 0;
  }
  else
  {
    ftruncate(v10, 49204);
    v11 = (char *)mmap(0, 0xC034uLL, 3, 1, v8->_fd, 0);
    v8->_countPtr = (unsigned int *)v11;
    if (v11 != (char *)-1)
    {
      v8->_buf = v11 + 4;
LABEL_9:
      v12 = v8;
      goto LABEL_19;
    }
    v14 = sgLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v18 = *__error();
      *(_DWORD *)buf = 67109120;
      int v21 = v18;
      _os_log_error_impl(&dword_1CA650000, v14, OS_LOG_TYPE_ERROR, "Could not mmap Bloom filter file. errno = %i", buf, 8u);
    }

    close(v8->_fd);
    v12 = 0;
    v8->_fd = -1;
  }
LABEL_19:

  return v12;
}

@end