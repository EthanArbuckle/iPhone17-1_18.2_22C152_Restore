@interface MFMutableData
- (BOOL)mf_immutable;
- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4;
- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4;
- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (MFMutableData)init;
- (MFMutableData)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (MFMutableData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (MFMutableData)initWithCapacity:(unint64_t)a3;
- (MFMutableData)initWithContentsOfFile:(id)a3;
- (MFMutableData)initWithContentsOfFile:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (MFMutableData)initWithContentsOfURL:(id)a3;
- (MFMutableData)initWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (MFMutableData)initWithData:(id)a3;
- (MFMutableData)initWithLength:(unint64_t)a3;
- (const)bytes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)subdataWithRange:(_NSRange)a3;
- (unint64_t)length;
- (void)_flushToDisk:(unint64_t)a3 capacity:(unint64_t)a4;
- (void)_mapMutableData:(BOOL)a3;
- (void)appendBytes:(const void *)a3 length:(unint64_t)a4;
- (void)appendData:(id)a3;
- (void)dealloc;
- (void)mf_makeImmutable;
- (void)mutableBytes;
- (void)setLength:(unint64_t)a3;
- (void)setMappingThreshold:(unsigned int)a3;
@end

@implementation MFMutableData

- (void)mutableBytes
{
  if (self->_immutable) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFData.m", 665, @"Attempting to get mutableBytes on an immutable MFMutableData.");
  }
  [(MFMutableData *)self bytes];
  self->_flush = 1;
  self->_flushFrom = 0;
  return self->_bytes;
}

- (const)bytes
{
  if (!self->_bytes)
  {
    if (self->_path || ([(MFMutableData *)self setLength:self->_capacity], self->_path)) {
      [(MFMutableData *)self _mapMutableData:0];
    }
  }
  return self->_bytes;
}

- (MFMutableData)initWithLength:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MFMutableData;
  v4 = [(MFMutableData *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_threshold = sDefaultThreshold;
    v4->_fd = -1;
    [(MFMutableData *)v4 setLength:a3];
  }
  return v5;
}

- (void)setLength:(unint64_t)a3
{
  if (self->_immutable) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFData.m", 738, @"Attempting to setLength: on an immutable MFMutableData.");
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: absurd %s: %lu, maximum size: %llu bytes", _NSMethodExceptionProem(), "length", a3, 0x7FFFFFFFFFFFFFFFLL format];
  }
  else if (!a3)
  {
    goto LABEL_46;
  }
  unint64_t capacity = self->_capacity;
  if (capacity < a3 || !self->_bytes)
  {
    unint64_t threshold = self->_threshold;
    if (threshold <= a3)
    {
      uint64_t v13 = 0x100000;
      if (a3 >= 0xA00000) {
        uint64_t v13 = 0x200000;
      }
      if (a3 >> 19) {
        char v14 = 2;
      }
      else {
        char v14 = 1;
      }
      unint64_t v15 = a3 >> v14;
      if (a3 >> 20 <= 4) {
        unint64_t v16 = v15;
      }
      else {
        unint64_t v16 = v13;
      }
      if (capacity != v16 + a3 || !self->_path)
      {
        self->_flush = 1;
        [(MFMutableData *)self _flushToDisk:[(MFMutableData *)self length] capacity:v16 + a3];
      }
    }
    else
    {
      char v7 = 1;
      if (a3 >> 19) {
        char v7 = 2;
      }
      unint64_t v8 = (a3 >> v7) + a3;
      if (capacity > v8) {
        unint64_t v8 = self->_capacity;
      }
      if (threshold >= v8) {
        unint64_t threshold = v8;
      }
      if (threshold <= 8) {
        unint64_t v9 = 8;
      }
      else {
        unint64_t v9 = threshold;
      }
      self->_unint64_t capacity = v9;
      if (capacity != v9 || !self->_bytes)
      {
        if (self->_vm)
        {
          v10 = [(MFMutableData *)self mutableBytes];
          if (!v10) {
            -[MFMutableData setLength:]();
          }
          v11 = v10;
          bytes = 0;
          self->_bytes = 0;
          unint64_t v9 = self->_capacity;
        }
        else
        {
          v11 = 0;
          bytes = self->_bytes;
        }
        v17 = (char *)reallocf(bytes, v9);
        self->_bytes = v17;
        if (!v17) {
          -[MFMutableData setLength:]();
        }
        if (self->_vm)
        {
          size_t mappedLength = self->_mappedLength;
          memmove(v17, v11, mappedLength);
          NSDeallocateMemoryPages(v11, mappedLength);
        }
        else
        {
          unint64_t length = self->_length;
          if (length < a3) {
            bzero(&v17[length], self->_capacity - length);
          }
        }
        path = self->_path;
        if (path)
        {
          unlink(path);
          free(self->_path);
          self->_path = 0;
        }
        int fd = self->_fd;
        if (fd != -1)
        {
          close(fd);
          self->_int fd = -1;
        }
        self->_flush = 0;
        self->_vm = 0;
      }
    }
  }
LABEL_46:
  self->_unint64_t length = a3;
}

- (void)dealloc
{
  bytes = self->_bytes;
  if (bytes)
  {
    if (self->_vm)
    {
      if (bytes != (void *)-1) {
        NSDeallocateMemoryPages(bytes, self->_mappedLength);
      }
    }
    else
    {
      free(bytes);
    }
  }
  path = self->_path;
  if (path)
  {
    unlink(path);
    free(self->_path);
  }
  int fd = self->_fd;
  if (fd != -1) {
    close(fd);
  }
  v6.receiver = self;
  v6.super_class = (Class)MFMutableData;
  [(MFMutableData *)&v6 dealloc];
}

- (unint64_t)length
{
  return self->_length;
}

- (MFMutableData)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFMutableData;
  v2 = [(MFMutableData *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_unint64_t threshold = sDefaultThreshold;
    v2->_int fd = -1;
    v2->_unint64_t capacity = 8;
    v2->_bytes = malloc_type_malloc(8uLL, 0xB5671A5BuLL);
    __memset_chk();
    v3->_unint64_t length = 0;
  }
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithData:self];
}

- (MFMutableData)initWithData:(id)a3
{
  uint64_t v5 = [a3 bytes];
  uint64_t v6 = [a3 length];
  return [(MFMutableData *)self initWithBytes:v5 length:v6];
}

- (MFMutableData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  v23.receiver = self;
  v23.super_class = (Class)MFMutableData;
  uint64_t v6 = [(MFMutableData *)&v23 init];
  if (!v6) {
    return v6;
  }
  if ((a4 & 0x8000000000000000) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: absurd %s: %lu, maximum size: %llu bytes", _NSMethodExceptionProem(), "length", a4, 0x7FFFFFFFFFFFFFFFLL format];
  }
  unint64_t v7 = sDefaultThreshold;
  v6->_unint64_t threshold = sDefaultThreshold;
  v6->_int fd = -1;
  if (v7 <= a4)
  {
    pthread_once(&sMFDataOnce, (void (*)(void))_MFDataInit);
    v10 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    v11 = (const char *)objc_msgSend((id)objc_msgSend(v10, "mf_makeUniqueFileInDirectory:", sMFDataPath), "fileSystemRepresentation");
    if (v11)
    {
      v12 = strdup(v11);
      v6->_path = v12;
      if (v12)
      {
        int v13 = open(v12, 1538, 438);
        v6->_int fd = v13;
        if (v13 != -1)
        {
          MFProtectFileDescriptor(v13, 3);
          v6->_unint64_t capacity = a4;
          v6->_unint64_t length = a4;
          if (write(v6->_fd, a3, a4) == -1) {
            objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Error occured in write: (%d)", *__error());
          }
          v6->_flush = 1;
          uint64_t v14 = 64;
          goto LABEL_18;
        }
        v18 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v19 = *MEMORY[0x1E4F1C3B8];
        uint64_t v21 = sMFDataPath;
        uint64_t v22 = *__error();
        v17 = @"Could not create mutable cache file at %@ (%d).";
        unint64_t v15 = v18;
        uint64_t v16 = v19;
      }
      else
      {
        unint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C4A0];
        v17 = @"Failed to allocate path for mutable cache file.";
      }
    }
    else
    {
      unint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v16 = *MEMORY[0x1E4F1C3B8];
      v17 = @"Failed to create temporary mutable cache file path.";
    }
    objc_msgSend(v15, "raise:format:", v16, v17, v21, v22);
    goto LABEL_23;
  }
  if (a4 <= 8) {
    size_t v8 = 8;
  }
  else {
    size_t v8 = a4;
  }
  v6->_unint64_t capacity = v8;
  unint64_t v9 = malloc_type_malloc(v8, 0xAA0AFF14uLL);
  v6->_bytes = v9;
  if (a4) {
    memmove(v9, a3, a4);
  }
  else {
    bzero(v9, v6->_capacity);
  }
  uint64_t v14 = 16;
LABEL_18:
  *(Class *)((char *)&v6->super.super.super.isa + v14) = (Class)a4;
LABEL_23:
  if (!v6->_bytes && !v6->_path)
  {

    return 0;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[MFData allocWithZone:a3];
  return [(MFData *)v4 initWithData:self];
}

- (void)appendData:(id)a3
{
  uint64_t v5 = [a3 bytes];
  uint64_t v6 = [a3 length];
  [(MFMutableData *)self appendBytes:v5 length:v6];
}

- (void)appendBytes:(const void *)a3 length:(unint64_t)a4
{
  if (a4)
  {
    NSUInteger v8 = [(MFMutableData *)self length];
    if (__CFADD__(a4, v8))
    {
      unint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C4A8];
      uint64_t v11 = _NSMethodExceptionProem();
      v19.location = v8;
      v19.unint64_t length = a4;
      [v9 raise:v10, @"%@: range %@ causes integer overflow", v11, NSStringFromRange(v19) format];
    }
    bytes = self->_bytes;
    if (bytes) {
      BOOL v13 = bytes > a3;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13 || &bytes[v8] <= a3)
    {
      int v15 = 0;
      uint64_t v14 = 0;
    }
    else
    {
      if ((char *)a3 + a4 > &bytes[v8])
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFData.m", 686, @"bytes being copied start but don't end within our own bytes");
        bytes = self->_bytes;
      }
      uint64_t v14 = (char *)((unsigned char *)a3 - bytes);
      int v15 = 1;
    }
    [(MFMutableData *)self setLength:v8 + a4];
    if (!self->_flush)
    {
      self->_flush = 1;
      self->_flushFrom = v8;
    }
    if (v8 + a4 > self->_capacity) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Not enough capacity to append bytes. Capacity: (%lu). New length: (%lu):", self->_capacity, v8 + a4);
    }
    uint64_t v16 = self->_bytes;
    if (!v16)
    {
      [(MFMutableData *)self _mapMutableData:0];
      uint64_t v16 = self->_bytes;
      if (!v16) {
        -[MFMutableData appendBytes:length:]();
      }
    }
    if (v15) {
      v17 = &v14[(void)v16];
    }
    else {
      v17 = (char *)a3;
    }
    memmove((char *)v16 + v8, v17, a4);
  }
}

- (MFMutableData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v7 = [(MFMutableData *)self initWithBytes:a3 length:a4];
  if (v5) {
    free(a3);
  }
  return v7;
}

- (MFMutableData)initWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if ([a3 isFileURL])
  {
    uint64_t v9 = [a3 path];
    return [(MFMutableData *)self initWithContentsOfFile:v9 options:a4 error:a5];
  }
  else
  {

    return 0;
  }
}

- (MFMutableData)initWithContentsOfURL:(id)a3
{
  return [(MFMutableData *)self initWithContentsOfURL:a3 options:0 error:0];
}

- (MFMutableData)initWithContentsOfFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  pthread_once(&sMFDataOnce, (void (*)(void))_MFDataInit);
  v10.receiver = self;
  v10.super_class = (Class)MFMutableData;
  unint64_t v7 = [(MFMutableData *)&v10 init];
  NSUInteger v8 = v7;
  if (v7)
  {
    v7->_unint64_t threshold = sDefaultThreshold;
    v7->_int fd = -1;
    v7->_path = (char *)[a3 fileSystemRepresentation];
    [(MFMutableData *)v8 _mapMutableData:1];
    v8->_path = 0;
  }
  return v8;
}

- (MFMutableData)initWithContentsOfFile:(id)a3
{
  return [(MFMutableData *)self initWithContentsOfFile:a3 options:0 error:0];
}

- (MFMutableData)initWithCapacity:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MFMutableData;
  v4 = [(MFMutableData *)&v7 init];
  if (v4)
  {
    if ((a3 & 0x8000000000000000) != 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: absurd %s: %lu, maximum size: %llu bytes", _NSMethodExceptionProem(), "capacity", a3, 0x7FFFFFFFFFFFFFFFLL format];
    }
    v4->_unint64_t threshold = sDefaultThreshold;
    v4->_int fd = -1;
    if (a3 >> 30) {
      NSUInteger v5 = a3;
    }
    else {
      NSUInteger v5 = (a3 + (a3 >> 2) + 3) & 0xFFFFFFFC;
    }
    v4->_unint64_t capacity = v5;
    if (v5 >= 0x80000) {
      v4->_unint64_t capacity = NSRoundUpToMultipleOfPageSize(v5);
    }
  }
  return v4;
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (sDefaultThreshold <= a3.length && self->_immutable)
  {
    uint64_t v6 = [MFData alloc];
    NSUInteger v7 = location;
    NSUInteger v8 = length;
    uint64_t v9 = self;
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v6 = [MFData alloc];
    NSUInteger v7 = location;
    NSUInteger v8 = length;
    uint64_t v9 = self;
    uint64_t v10 = 0;
  }
  id v11 = -[MFData _initWithRange:from:retainingParent:](v6, "_initWithRange:from:retainingParent:", v7, v8, v9, v10);
  return v11;
}

- (void)setMappingThreshold:(unsigned int)a3
{
  self->_unint64_t threshold = a3;
  if ([(MFMutableData *)self length] > a3)
  {
    unint64_t v4 = [(MFMutableData *)self length];
    unint64_t v5 = [(MFMutableData *)self length];
    [(MFMutableData *)self _flushToDisk:v4 capacity:v5];
  }
}

- (void)mf_makeImmutable
{
  if (!self->_immutable)
  {
    self->_immutable = 1;
    unint64_t threshold = self->_threshold;
    if (threshold < [(MFMutableData *)self length])
    {
      unint64_t v4 = [(MFMutableData *)self length];
      unint64_t v5 = [(MFMutableData *)self length];
      [(MFMutableData *)self _flushToDisk:v4 capacity:v5];
    }
  }
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  return [(MFMutableData *)self writeToFile:a3 options:a4 error:0];
}

- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4
{
  return [(MFMutableData *)self writeToURL:a3 options:a4 error:0];
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (!self->_immutable || !self->_path) {
    goto LABEL_15;
  }
  uint64_t v9 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  MFRemoveItemAtPath(a3);
  if (!self->_bytes) {
    [(MFMutableData *)self _mapMutableData:1];
  }
  int fd = self->_fd;
  if (fd == -1)
  {
    path = self->_path;
    unint64_t v13 = [(MFMutableData *)self length];
    self->_unint64_t capacity = v13;
    if (truncate(path, v13) == -1) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Unable to truncate file: (%d)", *__error());
    }
  }
  else
  {
    unint64_t v11 = [(MFMutableData *)self length];
    self->_unint64_t capacity = v11;
    if (ftruncate(fd, v11) == -1) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Unable to truncate file: (%d)", *__error());
    }
    close(self->_fd);
    self->_int fd = -1;
  }
  if (objc_msgSend(v9, "moveItemAtPath:toPath:error:", objc_msgSend(NSString, "stringWithUTF8String:", self->_path), a3, 0))
  {
    unint64_t v14 = (a4 & 0xF0000000) - 0x10000000;
    if (!(v14 >> 30)) {
      objc_msgSend(v9, "mf_protectFileAtPath:withClass:error:", a3, *(void *)((char *)&unk_1AFB403F0 + (v14 >> 25)), 0);
    }
    free(self->_path);
    self->_path = 0;
    return 1;
  }
  else
  {
LABEL_15:
    v16.receiver = self;
    v16.super_class = (Class)MFMutableData;
    return [(MFMutableData *)&v16 writeToFile:a3 options:a4 error:a5];
  }
}

- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if ([a3 isFileURL])
  {
    uint64_t v9 = [a3 path];
    return [(MFMutableData *)self writeToFile:v9 options:a4 error:a5];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MFMutableData;
    return [(MFMutableData *)&v11 writeToURL:a3 options:a4 error:a5];
  }
}

- (void)_flushToDisk:(unint64_t)a3 capacity:(unint64_t)a4
{
  path = self->_path;
  if (!path)
  {
    pthread_once(&sMFDataOnce, (void (*)(void))_MFDataInit);
    self->_flush = 1;
    self->_unint64_t flushFrom = 0;
    NSUInteger v8 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "mf_makeUniqueFileInDirectory:", sMFDataPath), "fileSystemRepresentation");
    if (v9)
    {
      uint64_t v10 = strdup(v9);
      self->_path = v10;
      if (v10) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if (!self->_path) {
LABEL_4:
    }
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Failed to create or copy temporary cache file path."];
  }
LABEL_5:
  if (self->_flush)
  {
    int fd = self->_fd;
    if (fd == -1 && (int fd = open(self->_path, 514, 438), self->_int fd = fd, fd == -1))
    {
      if (!path)
      {
        free(self->_path);
        self->_path = 0;
      }
    }
    else
    {
      MFProtectFileDescriptor(fd, 3);
      if (self->_length)
      {
        if (lseek(self->_fd, self->_flushFrom, 0) == -1) {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Error occured during lseek while flushing to disk: (%d)", *__error());
        }
        unint64_t flushFrom = self->_flushFrom;
        BOOL v13 = a3 >= flushFrom;
        size_t v14 = a3 - flushFrom;
        if (v13) {
          size_t v15 = v14;
        }
        else {
          size_t v15 = 0;
        }
        if (write(self->_fd, [(MFMutableData *)self bytes] + self->_flushFrom, v15) == -1) {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Error occured writing while flushing to disk: (%d)", *__error());
        }
      }
      if (a3 != a4 && self->_capacity != a4 && ftruncate(self->_fd, a4) == -1) {
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Error occured in truncate while flushing to disk: (%d)", *__error());
      }
      bytes = self->_bytes;
      if (bytes)
      {
        if (self->_vm) {
          NSDeallocateMemoryPages(bytes, self->_mappedLength);
        }
        else {
          free(bytes);
        }
        self->_bytes = 0;
        self->_vm = 0;
      }
      self->_unint64_t capacity = a4;
      self->_flush = 0;
    }
  }
}

- (void)_mapMutableData:(BOOL)a3
{
  BOOL v3 = a3;
  int fd = self->_fd;
  if (fd != -1 || (int fd = open(self->_path, 0, 438), fd != -1))
  {
    v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v16.st_blksize = v6;
    *(timespec *)v16.st_qspare = v6;
    v16.st_birthtimespec = v6;
    *(timespec *)&v16.unint64_t st_size = v6;
    v16.st_mtimespec = v6;
    v16.st_ctimespec = v6;
    *(timespec *)&v16.st_uid = v6;
    v16.st_atimespec = v6;
    *(timespec *)&v16.st_dev = v6;
    if (fstat(fd, &v16) || (v16.st_mode & 0xF000) != 0x8000) {
      goto LABEL_22;
    }
    unint64_t st_size = v16.st_size;
    if (v16.st_size <= 0 && self->_threshold > self->_capacity)
    {
      self->_vm = 0;
      self->_NSUInteger length = 0;
      self->_off_t capacity = 8;
      self->_bytes = malloc_type_calloc(8uLL, 1uLL, 0x52DC1BBAuLL);
LABEL_22:
      if (self->_fd != fd) {
        close(fd);
      }
      return;
    }
    self->_vm = 1;
    if (v3) {
      self->_NSUInteger length = st_size;
    }
    if (st_size)
    {
      self->_off_t capacity = st_size;
    }
    else
    {
      off_t capacity = self->_capacity;
      if (!capacity)
      {
        unint64_t st_size = self->_mappedLength;
        goto LABEL_17;
      }
      if (ftruncate(self->_fd, capacity) == -1) {
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Error occured in truncate while mapping data with capacity: (%lu) : (%d)", self->_capacity, *__error());
      }
      unint64_t st_size = self->_capacity;
    }
    self->_size_t mappedLength = st_size;
LABEL_17:
    if (self->_immutable) {
      int v9 = 1;
    }
    else {
      int v9 = 3;
    }
    uint64_t v10 = mmap(0, st_size, v9, 2, fd, 0);
    self->_bytes = v10;
    if (v10 == (void *)-1)
    {
      objc_super v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3B8];
      uint64_t v13 = *__error();
      size_t v14 = __error();
      size_t v15 = strerror(*v14);
      objc_msgSend(v11, "raise:format:", v12, @"mmap() failed with error %d - %s (File Size: %lu | Protection Class: %d)", v13, v15, self->_mappedLength, fcntl(fd, 63));
    }
    goto LABEL_22;
  }
}

- (BOOL)mf_immutable
{
  return self->_immutable;
}

- (void)appendBytes:length:.cold.1()
{
  __assert_rtn("-[MFMutableData appendBytes:length:]", "MFData.m", 711, "NULL != _bytes");
}

- (void)setLength:.cold.1()
{
  __assert_rtn("-[MFMutableData setLength:]", "MFData.m", 761, "NULL != _bytes");
}

- (void)setLength:.cold.2()
{
  __assert_rtn("-[MFMutableData setLength:]", "MFData.m", 756, "NULL != bytes");
}

@end