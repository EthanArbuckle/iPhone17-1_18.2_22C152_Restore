@interface NSAKDeserializerStream
- (id)initFromMemoryNoCopy:(const void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (id)initFromPath:(id)a3;
- (int)readInt;
- (unint64_t)readAlignedDataSize;
- (void)dealloc;
- (void)readData:(void *)a3 length:(unint64_t)a4;
@end

@implementation NSAKDeserializerStream

- (id)initFromMemoryNoCopy:(const void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  *((void *)self + 1) = a3;
  *((void *)self + 2) = a3;
  *((void *)self + 3) = a4;
  *((void *)self + 4) = a4;
  *((unsigned char *)self + 40) = a5;
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (self->freeWhenDone) {
    unallocate((mach_vm_address_t)self->memory, self->max);
  }
  v3.receiver = self;
  v3.super_class = (Class)NSAKDeserializerStream;
  [(NSAKDeserializerStream *)&v3 dealloc];
}

- (id)initFromPath:(id)a3
{
  if ([a3 isEqualToString:&stru_1ECA5C228]
    || (v5 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:a3 options:1 error:0]) == 0)
  {
    [(NSAKDeserializerStream *)self dealloc];
    return 0;
  }
  v6 = v5;
  vm_size_t v7 = [v5 length];
  vm_address_t v8 = allocate(v7);
  uint64_t v9 = [v6 bytes];
  v10 = (char *)v9;
  if (v7 >= 0x80000)
  {
    v11 = (void *)MEMORY[0x1E4F14B00];
    if (((*MEMORY[0x1E4F14B00] - 1) & (v9 | v8)) != 0
      || (malloc_default_zone(), malloc_zone_claimed_address()))
    {
      v12 = (void *)v8;
      size_t v13 = v7;
    }
    else
    {
      NSUInteger v15 = v7 & -*v11;
      NSCopyMemoryPages(v10, (void *)v8, v15);
      v10 += v15;
      v12 = (void *)(v8 + v15);
      size_t v13 = v7 - v15;
      if (v7 == v15) {
        goto LABEL_10;
      }
    }
    goto LABEL_9;
  }
  size_t v13 = v7;
  v12 = (void *)v8;
  if (v7) {
LABEL_9:
  }
    memmove(v12, v10, v13);
LABEL_10:

  return [(NSAKDeserializerStream *)self initFromMemoryNoCopy:v8 length:v7 freeWhenDone:1];
}

- (int)readInt
{
  unint64_t left = self->left;
  if (left <= 3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSDeserializeException" reason:@"deserialization string too short" userInfo:0]);
  }
  current = self->current;
  int v4 = *(_DWORD *)current;
  self->current = current + 4;
  self->unint64_t left = left - 4;
  return v4;
}

- (unint64_t)readAlignedDataSize
{
  int v3 = [(NSAKDeserializerStream *)self readInt];
  if (v3 == 0x80000000)
  {
    int v4 = [(NSAKDeserializerStream *)self readInt];
    int v5 = [(NSAKDeserializerStream *)self readInt];
    unint64_t left = self->left;
    if (left < v5) {
      goto LABEL_7;
    }
    unint64_t v7 = left - v5;
    self->current += v5;
    self->unint64_t left = v7;
  }
  else
  {
    int v4 = v3;
    unint64_t v7 = self->left;
  }
  if (v7 < v4) {
LABEL_7:
  }
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSDeserializeException" reason:@"deserialization string too short" userInfo:0]);
  return v4;
}

- (void)readData:(void *)a3 length:(unint64_t)a4
{
  if (self->left < a4) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSDeserializeException" reason:@"deserialization string too short" userInfo:0]);
  }
  int v5 = (char *)a3;
  current = self->current;
  if (a4 >= 0x80000)
  {
    vm_address_t v8 = (void *)MEMORY[0x1E4F14B00];
    if (((*MEMORY[0x1E4F14B00] - 1) & ((unint64_t)current | (unint64_t)a3)) != 0
      || (malloc_default_zone(), malloc_zone_claimed_address()))
    {
      size_t v9 = a4;
    }
    else
    {
      NSUInteger v11 = -*v8 & a4;
      NSCopyMemoryPages(current, v5, v11);
      current += v11;
      v5 += v11;
      size_t v9 = a4 - v11;
      if (a4 == v11) {
        goto LABEL_8;
      }
    }
    goto LABEL_7;
  }
  size_t v9 = a4;
  if (a4) {
LABEL_7:
  }
    memmove(v5, current, v9);
LABEL_8:
  unint64_t v10 = self->left - a4;
  self->current += a4;
  self->unint64_t left = v10;
}

@end