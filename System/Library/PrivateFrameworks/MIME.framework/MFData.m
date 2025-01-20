@interface MFData
+ (void)setDefaultMappingThresholdInBytes:(unint64_t)a3;
- (BOOL)mf_immutable;
- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4;
- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4;
- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (MFData)init;
- (MFData)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (MFData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4;
- (MFData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (MFData)initWithContentsOfFile:(id)a3;
- (MFData)initWithContentsOfFile:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (MFData)initWithContentsOfURL:(id)a3;
- (MFData)initWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (MFData)initWithData:(id)a3;
- (MFData)initWithImmutableData:(id)a3;
- (const)bytes;
- (id)_initWithData:(id)a3 maybeMutable:(BOOL)a4;
- (id)_initWithFile:(id)a3;
- (id)_initWithRange:(_NSRange)a3 from:(id)a4 retainingParent:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)subdataWithRange:(_NSRange)a3;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation MFData

- (MFData)initWithData:(id)a3
{
  return (MFData *)[(MFData *)self _initWithData:a3 maybeMutable:1];
}

- (const)bytes
{
  return [(NSData *)self->_internal bytes];
}

- (unint64_t)length
{
  return [(NSData *)self->_internal length];
}

- (MFData)initWithContentsOfFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  pthread_once(&sMFDataOnce, (void (*)(void))_MFDataInit);
  v18.receiver = self;
  v18.super_class = (Class)MFData;
  v9 = [(MFData *)&v18 init];
  if (!v9) {
    return v9;
  }
  if (a4)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  }
  else
  {
    v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", a3, a5);
    unint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E4F28390]), "unsignedIntegerValue");
    unint64_t v12 = sDefaultThreshold;
    id v13 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    if (v12 <= v11)
    {
      unint64_t v14 = a4 | 1;
      id v15 = a3;
      goto LABEL_7;
    }
  }
  id v15 = a3;
  unint64_t v14 = a4;
LABEL_7:
  uint64_t v16 = [v13 initWithContentsOfFile:v15 options:v14 error:a5];
  v9->_internal = (NSData *)v16;
  if (!v16)
  {

    return 0;
  }
  return v9;
}

- (void)dealloc
{
  if (self->_subdata && !self->_parent)
  {
    v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      os_unfair_lock_lock((os_unfair_lock_t)&sWaterMarkLock);
      NSUInteger v4 = [(NSData *)self->_internal length];
      _MergedGlobals -= v4;
      os_unfair_lock_unlock((os_unfair_lock_t)&sWaterMarkLock);
    }
  }

  path = self->_path;
  if (path)
  {
    MFRemoveItemAtPath(path);
  }
  v6.receiver = self;
  v6.super_class = (Class)MFData;
  [(MFData *)&v6 dealloc];
}

- (id)subdataWithRange:(_NSRange)a3
{
  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithRange:from:retainingParent:", a3.location, a3.length, self, sDefaultThreshold <= a3.length);
  return v3;
}

- (id)_initWithRange:(_NSRange)a3 from:(id)a4 retainingParent:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  NSUInteger v9 = [a4 bytes] + a3.location;
  if (v5)
  {
    v10 = [(MFData *)self initWithBytesNoCopy:v9 length:length freeWhenDone:0];
    if (!v10) {
      return v10;
    }
    v10->_parent = (NSData *)a4;
  }
  else
  {
    v10 = [(MFData *)self initWithBytes:v9 length:length];
    if (!v10) {
      return v10;
    }
  }
  v10->_subdata = 1;
  if (!v10->_parent)
  {
    unint64_t v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      os_unfair_lock_lock((os_unfair_lock_t)&sWaterMarkLock);
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v13 = [(NSData *)v10->_internal length];
      _MergedGlobals += v13;
      if (_MergedGlobals >= (unint64_t)qword_1E9AF72D8)
      {
        qword_1E9AF72D8 = _MergedGlobals;
      }
      else if (fabs(Current) < 5.0)
      {
LABEL_13:
        os_unfair_lock_unlock((os_unfair_lock_t)&sWaterMarkLock);
        return v10;
      }
      unint64_t v14 = MFLogGeneral();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[MFData _initWithRange:from:retainingParent:](v16, [(NSData *)v10->_internal length], v14);
      }
      goto LABEL_13;
    }
  }
  return v10;
}

- (MFData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)MFData;
  objc_super v6 = [(MFData *)&v13 init];
  if (v6)
  {
    if ((a4 & 0x8000000000000000) != 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: absurd %s: %lu, maximum size: %llu bytes", _NSMethodExceptionProem(), "length", a4, 0x7FFFFFFFFFFFFFFFLL format];
    }
    if (sDefaultThreshold <= a4)
    {
      pthread_once(&sMFDataOnce, (void (*)(void))_MFDataInit);
      v8 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      NSUInteger v9 = (NSString *)(id)objc_msgSend(v8, "mf_makeUniqueFileInDirectory:", sMFDataPath);
      v6->_path = v9;
      int v10 = open([(NSString *)v9 fileSystemRepresentation], 1537, 438);
      if (v10 == -1)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Could not create cache file at %@ (%d).", sMFDataPath, *__error() format];
      }
      else
      {
        int v11 = v10;
        MFProtectFileDescriptor(v10, 3);
        if (write(v11, a3, a4) == -1) {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Error occured in write: (%d)", *__error());
        }
        close(v11);
      }
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v6->_path options:1 error:0];
    }
    else
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a4];
    }
    v6->_internal = (NSData *)v7;
    if (!v7)
    {

      return 0;
    }
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithData:self];
}

- (id)_initWithData:(id)a3 maybeMutable:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MFData;
  objc_super v6 = [(MFData *)&v10 init];
  if (v6)
  {
    unint64_t v7 = [a3 length];
    if (v7 >= sDefaultThreshold)
    {
      if (!objc_msgSend(a3, "mf_immutable")
        && v4
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v8 = (NSData *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBytes:length:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
      }
      else
      {
        v8 = (NSData *)a3;
      }
    }
    else
    {
      v8 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithData:a3];
    }
    v6->_internal = v8;
    if (!v8)
    {

      return 0;
    }
  }
  return v6;
}

- (MFData)initWithImmutableData:(id)a3
{
  return (MFData *)[(MFData *)self _initWithData:a3 maybeMutable:0];
}

+ (void)setDefaultMappingThresholdInBytes:(unint64_t)a3
{
  sDefaultThreshold = a3;
}

- (MFData)init
{
  return [(MFData *)self initWithBytes:0 length:0];
}

- (id)_initWithFile:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFData;
  BOOL v4 = [(MFData *)&v6 init];
  if (v4)
  {
    v4->_path = (NSString *)a3;
    v4->_internal = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v4->_path options:1 error:0];
  }
  return v4;
}

- (MFData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4
{
  return [(MFData *)self initWithBytesNoCopy:a3 length:a4 freeWhenDone:1];
}

- (MFData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MFData;
  v8 = [(MFData *)&v11 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a3 length:a4 freeWhenDone:v5];
    v8->_internal = (NSData *)v9;
    if (!v9)
    {

      return 0;
    }
  }
  return v8;
}

- (MFData)initWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if ([a3 isFileURL])
  {
    uint64_t v9 = [a3 path];
    return [(MFData *)self initWithContentsOfFile:v9 options:a4 error:a5];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MFData;
    objc_super v11 = [(MFData *)&v13 init];
    if (v11)
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:a3 options:a4 error:a5];
      v11->_internal = (NSData *)v12;
      if (!v12)
      {

        return 0;
      }
    }
    return v11;
  }
}

- (MFData)initWithContentsOfURL:(id)a3
{
  return [(MFData *)self initWithContentsOfURL:a3 options:0 error:0];
}

- (MFData)initWithContentsOfFile:(id)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", a3, 0);
  unint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E4F28390]), "unsignedIntegerValue");
  if (sDefaultThreshold <= v6)
  {
    return [(MFData *)self initWithContentsOfFile:a3 options:0 error:0];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MFData;
    unint64_t v7 = [(MFData *)&v10 init];
    if (v7)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:a3];
      v7->_internal = (NSData *)v8;
      if (!v8)
      {

        return 0;
      }
    }
    return v7;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  BOOL v4 = +[MFMutableData allocWithZone:a3];
  return [(MFMutableData *)v4 initWithData:self];
}

- (id)data
{
  v2 = self->_internal;
  return v2;
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  return [(MFData *)self writeToFile:a3 options:a4 error:0];
}

- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4
{
  return [(MFData *)self writeToURL:a3 options:a4 error:0];
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (self->_path
    && (uint64_t v9 = (void *)[MEMORY[0x1E4F28CB8] defaultManager],
        MFRemoveItemAtPath(a3),
        [v9 moveItemAtPath:self->_path toPath:a3 error:0]))
  {
    unint64_t v10 = (a4 & 0xF0000000) - 0x10000000;
    if (!(v10 >> 30)) {
      objc_msgSend(v9, "mf_protectFileAtPath:withClass:error:", a3, *(void *)((char *)&unk_1AFB403F0 + (v10 >> 25)), 0);
    }

    self->_path = 0;
    return 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MFData;
    return [(MFData *)&v12 writeToFile:a3 options:a4 error:a5];
  }
}

- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if ([a3 isFileURL])
  {
    uint64_t v9 = [a3 path];
    return [(MFData *)self writeToFile:v9 options:a4 error:a5];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MFData;
    return [(MFData *)&v11 writeToURL:a3 options:a4 error:a5];
  }
}

- (BOOL)mf_immutable
{
  return 1;
}

- (void)_initWithRange:(uint8_t *)buf from:(uint64_t)a2 retainingParent:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  uint64_t v4 = _MergedGlobals;
  uint64_t v3 = qword_1E9AF72D8;
  *(_DWORD *)buf = 134218496;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = v4;
  *((_WORD *)buf + 11) = 2048;
  *((void *)buf + 3) = v3;
  _os_log_debug_impl(&dword_1AFB03000, log, OS_LOG_TYPE_DEBUG, "Small subdata allocation of %lu bytes.  Current watermark is %ld bytes.  High was %lu bytes.", buf, 0x20u);
}

@end