@interface BMMemoryMapping
- (BMMemoryMapping)initWithSize:(unint64_t)a3 protection:(int)a4 advice:(int)a5 offset:(int64_t)a6;
- (BOOL)atomicUpdateOffset:(unint64_t)a3 withValue:(id)a4 shouldReplace:(id)a5;
- (BOOL)canAtomicallyAccessOffset:(unint64_t)a3;
- (BOOL)isValidReadFromOffset:(unint64_t)a3 withLength:(unint64_t)a4;
- (BOOL)isValidReadFromOffsetV2:(unint64_t)a3 withLength:(unint64_t)a4 currentFrameCount:(unsigned int)a5;
- (BOOL)isWritable;
- (BOOL)mapWithFileHandle:(id)a3 fileSize:(unint64_t)a4;
- (char)end;
- (id)dataAtOffset:(unint64_t)a3 withLength:(unint64_t)a4 makeCopy:(BOOL)a5;
- (int64_t)offset;
- (uint64_t)isValidWriteToDestinationOffset:(uint64_t)a3 withLength:(uint64_t)a4 bytes:;
- (uint64_t)mappedAddress;
- (uint64_t)offsetSpace;
- (uint64_t)pageAlignedSize;
- (uint64_t)setMappedAddress:(uint64_t)result;
- (uint64_t)setOffset:(uint64_t)result;
- (uint64_t)setOffsetSpace:(uint64_t)result;
- (uint64_t)setPageAlignedSize:(uint64_t)result;
- (uint64_t)setSize:(uint64_t)result;
- (uint64_t)setStart:(uint64_t)result;
- (unint64_t)currentWriteOffset;
- (unint64_t)freeSpace;
- (unint64_t)size;
- (unsigned)atomicReadAtOffset:(unint64_t)a3 value:(id *)a4;
- (unsigned)atomicWriteEightBytes:(unint64_t)a3 toOffset:(unint64_t)a4 expected:(unint64_t *)a5;
- (void)currentPosition;
- (void)dealloc;
- (void)start;
- (void)sync;
- (void)unmap;
- (void)updateToMaxOfCurrentWriteOffsetAnd:(unint64_t)a3;
- (void)writeBytes:(const void *)a3 toOffset:(unint64_t)a4 length:(unint64_t)a5;
@end

@implementation BMMemoryMapping

- (BOOL)mapWithFileHandle:(id)a3 fileSize:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  NSUInteger v7 = [(BMMemoryMapping *)self offset];
  if ((v7 & 0x8000000000000000) != 0)
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BMMemoryMapping mapWithFileHandle:fileSize:]((uint64_t)self, v6);
    }
    goto LABEL_21;
  }
  NSUInteger v8 = v7;
  if (v7 > a4)
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      unint64_t size = self->_size;
      v11 = (void *)MEMORY[0x1E4F4FB78];
      v12 = [v6 attributes];
      v13 = [v12 path];
      v14 = [v11 privacyPathname:v13];
      int v37 = 134218754;
      unint64_t v38 = size;
      __int16 v39 = 2048;
      *(void *)v40 = a4;
      *(_WORD *)&v40[8] = 2048;
      *(void *)&v40[10] = v8;
      *(_WORD *)&v40[18] = 2114;
      *(void *)&v40[20] = v14;
      _os_log_fault_impl(&dword_1AD076000, v9, OS_LOG_TYPE_FAULT, "Offset too large, frame size:%zu fileSize:%zu offset:%lld file:%{public}@", (uint8_t *)&v37, 0x2Au);

LABEL_20:
    }
LABEL_21:
    BOOL v21 = 0;
    goto LABEL_22;
  }
  off_t v15 = NSRoundDownToMultipleOfPageSize(v7);
  self->_offsetSpace = v8 - v15;
  size_t v16 = NSRoundUpToMultipleOfPageSize(self->_size + v8 - v15);
  if (!v16)
  {
    v9 = __biome_log_for_category();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_21;
    }
    unint64_t v28 = self->_size;
    int64_t offset = self->_offset;
    v30 = (void *)MEMORY[0x1E4F4FB78];
    v31 = [v6 attributes];
    v32 = [v31 path];
    v14 = [v30 privacyPathname:v32];
    int v37 = 134218498;
    unint64_t v38 = v28;
    __int16 v39 = 2048;
    *(void *)v40 = offset;
    *(_WORD *)&v40[8] = 2114;
    *(void *)&v40[10] = v14;
    _os_log_fault_impl(&dword_1AD076000, v9, OS_LOG_TYPE_FAULT, "Attempt to map zero bytes, size:%zu offset:%lld file:%{public}@", (uint8_t *)&v37, 0x20u);

LABEL_19:
    goto LABEL_20;
  }
  unint64_t v17 = v16;
  v18 = (char *)mmap(0, v16, self->_protection, 1, [v6 fd], v15);
  if (v18 == (char *)-1)
  {
    v9 = __biome_log_for_category();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_21;
    }
    v33 = (void *)MEMORY[0x1E4F4FB78];
    v31 = [v6 attributes];
    v34 = [v31 path];
    v14 = [v33 privacyPathname:v34];
    int v35 = *__error();
    int v37 = 138544130;
    unint64_t v38 = (unint64_t)v14;
    __int16 v39 = 1026;
    *(_DWORD *)v40 = v35;
    *(_WORD *)&v40[4] = 2048;
    *(void *)&v40[6] = v17;
    *(_WORD *)&v40[14] = 2048;
    *(void *)&v40[16] = v15;
    _os_log_fault_impl(&dword_1AD076000, v9, OS_LOG_TYPE_FAULT, "Unable to mmap storage file %{public}@ because %{public, darwin.errno}d, size:%zu, offset:%ld", (uint8_t *)&v37, 0x26u);

    goto LABEL_19;
  }
  v19 = v18;
  self->_mappedAddress = v18;
  self->_pageAlignedSize = v17;
  self->_start = &v18[self->_offsetSpace];
  atomic_store(0, &self->_currentWriteOffset);
  if (madvise(v18, v17, self->_advice) < 0)
  {
    v20 = __biome_log_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BMMemoryMapping mapWithFileHandle:fileSize:]();
    }
  }
  v9 = __biome_log_for_category();
  BOOL v21 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v22 = (void *)MEMORY[0x1E4F4FB78];
    v23 = [v6 attributes];
    v24 = [v23 path];
    v25 = [v22 privacyPathname:v24];
    unint64_t v27 = self->_size;
    int64_t v26 = self->_offset;
    int v37 = 138544131;
    unint64_t v38 = (unint64_t)v25;
    __int16 v39 = 2049;
    *(void *)v40 = v19;
    *(_WORD *)&v40[8] = 2048;
    *(void *)&v40[10] = v26;
    *(_WORD *)&v40[18] = 2048;
    *(void *)&v40[20] = v27;
    BOOL v21 = 1;
    _os_log_impl(&dword_1AD076000, v9, OS_LOG_TYPE_INFO, "Successfully mapped file: %{public}@ address: 0x%{private}llx offset:%llu size:%llu", (uint8_t *)&v37, 0x2Au);
  }
LABEL_22:

  return v21;
}

- (int64_t)offset
{
  return self->_offset;
}

- (BMMemoryMapping)initWithSize:(unint64_t)a3 protection:(int)a4 advice:(int)a5 offset:(int64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)BMMemoryMapping;
  result = [(BMMemoryMapping *)&v11 init];
  if (result)
  {
    result->_protection = a4;
    result->_advice = a5;
    result->_unint64_t size = a3;
    result->_int64_t offset = a6;
    atomic_store(0, &result->_currentWriteOffset);
  }
  return result;
}

- (void)start
{
  return self->_start;
}

- (char)end
{
  return (char *)self->_start + self->_size;
}

- (unint64_t)size
{
  return self->_size;
}

- (BOOL)isValidReadFromOffsetV2:(unint64_t)a3 withLength:(unint64_t)a4 currentFrameCount:(unsigned int)a5
{
  if (self)
  {
    if (self->_mappedAddress)
    {
      unint64_t v7 = [(BMMemoryMapping *)self size] - 16 * a5;
      BOOL v8 = a3 + a4 + 24 <= v7;
      if (v7 <= a3) {
        BOOL v8 = 0;
      }
      LOBYTE(self) = (uint64_t)v7 >= 1 && v8;
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (void)dealloc
{
  [(BMMemoryMapping *)self unmap];
  v3.receiver = self;
  v3.super_class = (Class)BMMemoryMapping;
  [(BMMemoryMapping *)&v3 dealloc];
}

- (void)unmap
{
  __error();
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

- (void)sync
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3[0] = 67240192;
  v3[1] = v2;
  _os_log_error_impl(&dword_1AD076000, a1, OS_LOG_TYPE_ERROR, "Failed to msync because %{public, darwin.errno}d", (uint8_t *)v3, 8u);
}

- (void)writeBytes:(const void *)a3 toOffset:(unint64_t)a4 length:(unint64_t)a5
{
  if (self)
  {
    BOOL v9 = [(BMMemoryMapping *)self isWritable];
    if (a3)
    {
      if (v9 && [(BMMemoryMapping *)self isValidReadFromOffset:a4 withLength:a5])
      {
        v10 = [(BMMemoryMapping *)self start] + a4;
        memcpy(v10, a3, a5);
      }
    }
  }
}

- (unsigned)atomicWriteEightBytes:(unint64_t)a3 toOffset:(unint64_t)a4 expected:(unint64_t *)a5
{
  if ([(BMMemoryMapping *)self canAtomicallyAccessOffset:a4])
  {
    if (self)
    {
      int v9 = [(BMMemoryMapping *)self isWritable];
      if (v9)
      {
        int v9 = [(BMMemoryMapping *)self isValidReadFromOffset:a4 withLength:8];
        if (v9)
        {
          v10 = [(BMMemoryMapping *)self start];
          unint64_t v11 = *a5;
          unint64_t v12 = *a5;
          atomic_compare_exchange_strong((atomic_ullong *volatile)&v10[a4], &v12, a3);
          if (v12 == v11)
          {
            LOBYTE(v9) = 1;
          }
          else
          {
            *a5 = v12;
            LOBYTE(v9) = 2;
          }
        }
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 3;
  }
  return v9;
}

- (BOOL)isWritable
{
  return (LOBYTE(self->_protection) >> 1) & 1;
}

- (BOOL)isValidReadFromOffset:(unint64_t)a3 withLength:(unint64_t)a4
{
  if (self)
  {
    uint64_t v4 = self;
    LOBYTE(self) = self->_mappedAddress
                && [(BMMemoryMapping *)self size] > a3
                && [(BMMemoryMapping *)v4 size] - a3 >= a4;
  }
  return (char)self;
}

- (BOOL)canAtomicallyAccessOffset:(unint64_t)a3
{
  return (a3 & 7) == 0;
}

- (unint64_t)currentWriteOffset
{
  return atomic_load(&self->_currentWriteOffset);
}

- (uint64_t)setPageAlignedSize:(uint64_t)result
{
  if (result) {
    *(void *)(result + 56) = a2;
  }
  return result;
}

- (uint64_t)setMappedAddress:(uint64_t)result
{
  if (result) {
    *(void *)(result + 48) = a2;
  }
  return result;
}

- (uint64_t)setStart:(uint64_t)result
{
  if (result) {
    *(void *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)pageAlignedSize
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)mappedAddress
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)offsetSpace
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (uint64_t)isValidWriteToDestinationOffset:(uint64_t)a3 withLength:(uint64_t)a4 bytes:
{
  if (!a1) {
    return 0;
  }
  int v8 = [a1 isWritable];
  if (!a4 || !v8) {
    return 0;
  }
  return [a1 isValidReadFromOffset:a2 withLength:a3];
}

- (id)dataAtOffset:(unint64_t)a3 withLength:(unint64_t)a4 makeCopy:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (-[BMMemoryMapping isValidReadFromOffset:withLength:](self, "isValidReadFromOffset:withLength:"))
  {
    int v9 = [(BMMemoryMapping *)self start] + a3;
    if (v5) {
      [MEMORY[0x1E4F1C9B8] dataWithBytes:v9 length:a4];
    }
    else {
    v10 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v9 length:a4 freeWhenDone:0];
    }
  }
  else
  {
    unint64_t v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 134218496;
      unint64_t v14 = a3;
      __int16 v15 = 2048;
      unint64_t v16 = a4;
      __int16 v17 = 2048;
      unint64_t v18 = [(BMMemoryMapping *)self size];
      _os_log_error_impl(&dword_1AD076000, v11, OS_LOG_TYPE_ERROR, "Cannot read data from offset: %lld with length: %lld. Size (%lld) too small", (uint8_t *)&v13, 0x20u);
    }

    v10 = 0;
  }
  return v10;
}

- (unsigned)atomicReadAtOffset:(unint64_t)a3 value:(id *)a4
{
  if (-[BMMemoryMapping canAtomicallyAccessOffset:](self, "canAtomicallyAccessOffset:"))
  {
    if ([(BMMemoryMapping *)self isValidReadFromOffset:a3 withLength:8])
    {
      unint64_t v7 = atomic_load((unint64_t *)([(BMMemoryMapping *)self start] + a3));
      a4->var0 = v7;
      return 1;
    }
    else
    {
      v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[BMMemoryMapping atomicReadAtOffset:value:]();
      }

      return 0;
    }
  }
  else
  {
    int v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMMemoryMapping atomicReadAtOffset:value:](a3, v9);
    }

    return 3;
  }
}

- (BOOL)atomicUpdateOffset:(unint64_t)a3 withValue:(id)a4 shouldReplace:(id)a5
{
  int v8 = (unsigned int (**)(id, void, unint64_t))a5;
  if (![(BMMemoryMapping *)self canAtomicallyAccessOffset:a3])
  {
    unint64_t v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMMemoryMapping atomicReadAtOffset:value:](a3, v11);
    }
    goto LABEL_15;
  }
  if (!self
    || ![(BMMemoryMapping *)self isWritable]
    || ![(BMMemoryMapping *)self isValidReadFromOffset:a3 withLength:8])
  {
    unint64_t v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMMemoryMapping atomicUpdateOffset:withValue:shouldReplace:]();
    }
LABEL_15:

LABEL_16:
    BOOL v10 = 0;
    goto LABEL_17;
  }
  uint64_t v14 = 0;
  if ([(BMMemoryMapping *)self atomicReadAtOffset:a3 value:&v14] != 1
    || !v8[2](v8, v14, a4.var0))
  {
    goto LABEL_16;
  }
  uint64_t v13 = v14;
  do
  {
    int v9 = [(BMMemoryMapping *)self atomicWriteEightBytes:a4.var0 toOffset:a3 expected:&v13];
    BOOL v10 = v9 == 1;
    if (v9 == 1) {
      break;
    }
    uint64_t v14 = v13;
  }
  while ((((uint64_t (*)(unsigned int (**)(id, void, unint64_t)))v8[2])(v8) & 1) != 0);
LABEL_17:

  return v10;
}

- (void)updateToMaxOfCurrentWriteOffsetAnd:(unint64_t)a3
{
  unint64_t v3 = a3;
  p_unint64_t size = (uint64_t *)&self->_size;
  if (self->_size < a3)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMMemoryMapping *)p_size updateToMaxOfCurrentWriteOffsetAnd:v6];
    }

    unint64_t v3 = *p_size;
  }
  unint64_t v7 = [(BMMemoryMapping *)self currentWriteOffset];
  if (v7 < v3)
  {
    unint64_t v8 = v7;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_currentWriteOffset, &v8, v3);
      if (v8 == v7) {
        break;
      }
      unint64_t v7 = v8;
    }
    while (v8 < v3);
  }
}

- (unint64_t)freeSpace
{
  unint64_t size = self->_size;
  return size - [(BMMemoryMapping *)self used];
}

- (void)currentPosition
{
  unint64_t v3 = [(BMMemoryMapping *)self start];
  return &v3[[(BMMemoryMapping *)self currentWriteOffset]];
}

- (uint64_t)setSize:(uint64_t)result
{
  if (result) {
    *(void *)(result + 32) = a2;
  }
  return result;
}

- (uint64_t)setOffset:(uint64_t)result
{
  if (result) {
    *(void *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setOffsetSpace:(uint64_t)result
{
  if (result) {
    *(void *)(result + 64) = a2;
  }
  return result;
}

- (void)mapWithFileHandle:(uint64_t)a1 fileSize:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  int v2 = (void *)MEMORY[0x1E4F4FB78];
  unint64_t v3 = [a2 attributes];
  uint64_t v4 = [v3 path];
  BOOL v10 = [v2 privacyPathname:v4];
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(v5, v6, v7, v8, v9, 0x20u);
}

- (void)mapWithFileHandle:fileSize:.cold.2()
{
  __error();
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 8u);
}

- (void)atomicReadAtOffset:value:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1AD076000, v0, OS_LOG_TYPE_ERROR, "Unable to read data at offset: %ld with length: %ld", v1, 0x16u);
}

- (void)atomicReadAtOffset:(uint64_t)a1 value:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AD076000, a2, OS_LOG_TYPE_ERROR, "Cannot atomically access bytes if offset isn't 8 byte aligned. Given offset: %ld", (uint8_t *)&v2, 0xCu);
}

- (void)atomicUpdateOffset:withValue:shouldReplace:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1AD076000, v0, OS_LOG_TYPE_ERROR, "Unable to read/write data at offset: %ld with length: %ld", v1, 0x16u);
}

- (void)updateToMaxOfCurrentWriteOffsetAnd:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1AD076000, log, OS_LOG_TYPE_ERROR, "Attempted to move cursor beyond end of file, offset:%zu size:%zu. Setting to End of File instead", (uint8_t *)&v4, 0x16u);
}

@end