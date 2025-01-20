@interface _PFEvanescentData
+ (Class)classForKeyedUnarchiver;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (_PFEvanescentData)initWithPath:(id)a3;
- (_PFEvanescentData)initWithURL:(id)a3;
- (const)bytes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)subdataWithRange:(_NSRange)a3;
- (id)url;
- (uint64_t)_destroyMapping;
- (uint64_t)_openMapping;
- (unint64_t)hash;
- (unint64_t)length;
- (void)dealloc;
- (void)enumerateByteRangesUsingBlock:(id)a3;
- (void)getBytes:(void *)a3;
- (void)getBytes:(void *)a3 length:(unint64_t)a4;
- (void)getBytes:(void *)a3 range:(_NSRange)a4;
@end

@implementation _PFEvanescentData

- (_PFEvanescentData)initWithURL:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)_PFEvanescentData;
  v4 = [(_PFEvanescentData *)&v17 init];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    v4->_openfd = -1;
    memset(&v16, 0, sizeof(v16));
    int v6 = stat((const char *)objc_msgSend((id)objc_msgSend(a3, "path"), "fileSystemRepresentation"), &v16);
    __error();
    if (v6)
    {
      v7 = (objc_class *)objc_opt_class();
      Name = class_getName(v7);
      _NSCoreDataLog(1, @"Unable to initialize %s.  stat() failed on '%s' with errno %d", v9, v10, v11, v12, v13, v14, (uint64_t)Name);

      v4 = 0;
    }
    else
    {
      v4->_length = v16.st_size;
      v4->_fileURL = (NSURL *)a3;
    }
    [v5 drain];
  }
  return v4;
}

- (void)dealloc
{
  -[_PFEvanescentData _destroyMapping]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)_PFEvanescentData;
  [(_PFEvanescentData *)&v3 dealloc];
}

- (uint64_t)_destroyMapping
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = *(void **)(result + 32);
    if (v2)
    {
      munmap(v2, *(void *)(v1 + 8));
      *(void *)(v1 + 32) = 0;
    }
    result = *(unsigned int *)(v1 + 24);
    if ((result & 0x80000000) == 0)
    {
      result = close(result);
      *(_DWORD *)(v1 + 24) = -1;
    }
  }
  return result;
}

- (_PFEvanescentData)initWithPath:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3 isDirectory:0];

  return [(_PFEvanescentData *)self initWithURL:v4];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  return (id)[v3 stringWithFormat:@"NSData [%s] with address %p backed by file at '%@'", Name, self, -[_PFEvanescentData url]((id *)&self->super.super.isa)];
}

- (id)url
{
  if (result)
  {
    id v1 = result[2];
    return (id *)v1;
  }
  return result;
}

- (unint64_t)length
{
  return self->_length;
}

- (uint64_t)_openMapping
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 32))
    {
LABEL_8:
      atomic_fetch_add_explicit((atomic_uint *volatile)(v1 + 40), 1u, memory_order_relaxed);
      return *(void *)(v1 + 32);
    }
    int v2 = *(_DWORD *)(result + 24);
    if (v2 < 0)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      int v6 = open((const char *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 16), "path"), "fileSystemRepresentation"), 0);
      if (v6 < 0)
      {
        uint64_t v18 = *__error();
        [v5 drain];
        v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v9 = (void *)*MEMORY[0x1E4F28798];
        v20 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v21 = [*(id *)(v1 + 16) path];
        uint64_t v22 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", v9, v18, objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v21, *MEMORY[0x1E4F28328], 0));
        uint64_t v23 = *MEMORY[0x1E4F1C3B8];
        uint64_t v14 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v22 forKey:@"NSCoreDataPrimaryError"];
        v15 = @"Could not open file.";
        uint64_t v16 = v23;
        uint64_t v17 = v18;
        goto LABEL_13;
      }
      *(_DWORD *)(v1 + 24) = v6;
      [v5 drain];
      if (*(void *)(v1 + 32)) {
        goto LABEL_8;
      }
      int v2 = *(_DWORD *)(v1 + 24);
    }
    objc_super v3 = mmap(0, *(void *)(v1 + 8), 1, 1, v2, 0);
    uint64_t v4 = __error();
    if (v3)
    {
      *(void *)(v1 + 32) = v3;
      goto LABEL_8;
    }
    uint64_t v7 = *v4;
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v11 = [*(id *)(v1 + 16) path];
    uint64_t v12 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v7, objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x1E4F28328], 0));
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    uint64_t v14 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v12 forKey:@"NSCoreDataPrimaryError"];
    v15 = @"Could not map file.";
    uint64_t v16 = v13;
    uint64_t v17 = v7;
LABEL_13:
    id v24 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v16, v17, (uint64_t)v15, v14);
    -[_NSCoreDataException _setDomain:]((uint64_t)v24, v9);
    objc_exception_throw(v24);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  uint64_t v7 = -[_PFEvanescentData url]((id *)&self->super.super.isa);
  id v8 = *((id *)a3 + 2);

  return [v7 isEqual:v8];
}

- (unint64_t)hash
{
  int v2 = -[_PFEvanescentData url]((id *)&self->super.super.isa);

  return [v2 hash];
}

- (void)enumerateByteRangesUsingBlock:(id)a3
{
  char v6 = 0;
  uint64_t v5 = -[_PFEvanescentData _openMapping]((uint64_t)self);
  if (v5) {
    (*((void (**)(id, uint64_t, void, unint64_t, char *))a3 + 2))(a3, v5, 0, [(_PFEvanescentData *)self length], &v6);
  }
  if (self)
  {
    if ((int)atomic_fetch_add_explicit(&self->_mapRefCount, 0xFFFFFFFF, memory_order_relaxed) <= 1) {
      -[_PFEvanescentData _destroyMapping]((uint64_t)self);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)-[_PFEvanescentData _openMapping]((uint64_t)self);
  if (v4) {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", v4, -[_PFEvanescentData length](self, "length"));
  }
  if (self && (int)atomic_fetch_add_explicit(&self->_mapRefCount, 0xFFFFFFFF, memory_order_relaxed) <= 1) {
    -[_PFEvanescentData _destroyMapping]((uint64_t)self);
  }
  return v4;
}

- (const)bytes
{
  id v2 = [(_PFEvanescentData *)self copyWithZone:0];
  objc_super v3 = (const void *)[v2 bytes];
  id v4 = v2;
  return v3;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (void)getBytes:(void *)a3
{
  unint64_t v5 = [(_PFEvanescentData *)self length];

  [(_PFEvanescentData *)self getBytes:a3 length:v5];
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  if (a4.length)
  {
    size_t length = a4.length;
    NSUInteger location = a4.location;
    uint64_t v8 = -[_PFEvanescentData _openMapping]((uint64_t)self);
    if (v8) {
      memmove(a3, (const void *)(v8 + location), length);
    }
    if (self && (int)atomic_fetch_add_explicit(&self->_mapRefCount, 0xFFFFFFFF, memory_order_relaxed) <= 1)
    {
      -[_PFEvanescentData _destroyMapping]((uint64_t)self);
    }
  }
}

- (id)subdataWithRange:(_NSRange)a3
{
  if (a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    char v6 = malloc_type_malloc(a3.length, 0xB4791DBEuLL);
    -[_PFEvanescentData getBytes:range:](self, "getBytes:range:", v6, location, length);
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v6 length:length freeWhenDone:1];
    return v7;
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9B8];
    return (id)objc_msgSend(v9, "data", a3.location);
  }
}

@end