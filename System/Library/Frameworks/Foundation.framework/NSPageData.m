@interface NSPageData
+ (int64_t)_umask;
+ (void)initialize;
- (NSPageData)init;
- (NSPageData)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (NSPageData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4;
- (NSPageData)initWithContentsOfFile:(id)a3;
- (NSPageData)initWithContentsOfMappedFile:(id)a3;
- (NSPageData)initWithContentsOfMappedFile:(id)a3 withFileAttributes:(id)a4;
- (NSPageData)initWithData:(id)a3;
- (NSPageData)initWithDataNoCopy:(id)a3;
- (const)bytes;
- (id)_mappedFile;
- (id)data;
- (id)deserializer;
- (id)initFromSerializerStream:(id)a3 length:(unint64_t)a4;
- (unint64_t)length;
- (unint64_t)writeFd:(int64_t)a3;
- (unint64_t)writeFile:(id)a3;
- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7;
- (void)_setOriginalFileInfoFromFileAttributes:(id)a3;
- (void)dealloc;
@end

@implementation NSPageData

+ (void)initialize
{
  if (NSPageData == a1)
  {
    unsigned int v2 = umask(0);
    _NSPageDataUmask = v2;
    umask(v2);
  }
}

+ (int64_t)_umask
{
  return _NSPageDataUmask;
}

- (unint64_t)length
{
  return [(NSData *)self->data length];
}

- (const)bytes
{
  return [(NSData *)self->data bytes];
}

- (NSPageData)init
{
  self->data = (NSData *)[objc_allocWithZone(MEMORY[0x1E4F1C9B8]) init];
  return self;
}

- (NSPageData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4
{
  self->data = (NSData *)[objc_allocWithZone(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a3 length:a4];
  return self;
}

- (NSPageData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  self->data = (NSData *)[objc_allocWithZone(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a4];
  return self;
}

- (NSPageData)initWithData:(id)a3
{
  self->data = (NSData *)[objc_allocWithZone(MEMORY[0x1E4F1C9B8]) initWithData:a3];
  return self;
}

- (void)_setOriginalFileInfoFromFileAttributes:(id)a3
{
  if (self->data)
  {
    v4 = (void *)[a3 fileModificationDate];

    self->_originalFileModDate = (NSDate *)[v4 copy];
  }
}

- (NSPageData)initWithContentsOfFile:(id)a3
{
  v5 = (NSData *)[objc_allocWithZone(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:a3];
  self->data = v5;
  if (v5)
  {
    [(NSPageData *)self _setOriginalFileInfoFromFileAttributes:[+[NSFileManager defaultManager] fileAttributesAtPath:a3 traverseLink:1]];
    self->_originalFilePath = (NSString *)[a3 copy];
  }
  return self;
}

- (NSPageData)initWithContentsOfMappedFile:(id)a3
{
  return [(NSPageData *)self initWithContentsOfMappedFile:a3 withFileAttributes:0];
}

- (NSPageData)initWithContentsOfMappedFile:(id)a3 withFileAttributes:(id)a4
{
  v4 = (NSDictionary *)a4;
  if (!a4)
  {
    v4 = [+[NSFileManager defaultManager] fileAttributesAtPath:a3 traverseLink:1];
    if (!v4)
    {
      if (self->data) {
        goto LABEL_4;
      }
LABEL_6:
      [(NSPageData *)self dealloc];
      return 0;
    }
  }
  v7 = (NSData *)[objc_allocWithZone(MEMORY[0x1E4F1C9B8]) initWithContentsOfMappedFile:a3];
  self->data = v7;
  if (!v7) {
    goto LABEL_6;
  }
LABEL_4:
  [(NSPageData *)self _setOriginalFileInfoFromFileAttributes:v4];
  self->_originalFilePath = (NSString *)[a3 copy];
  return self;
}

- (id)_mappedFile
{
  return self->_originalFilePath;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSPageData;
  [(NSPageData *)&v3 dealloc];
}

- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7
{
  BOOL v8 = a6;
  if (a4)
  {
    if ((*((_WORD *)a4 + 9) & 4) != 0)
    {
      v19 = (void *)[objc_allocWithZone((Class)NSString) initWithData:self encoding:4];
      BOOL v20 = [+[NSFileManager defaultManager] createSymbolicLinkAtPath:a3 pathContent:v19];

      if (v20) {
        return 0;
      }
      else {
        return 2;
      }
    }
    uint64_t v11 = *((unsigned __int16 *)a4 + 8);
    uint64_t v12 = *((void *)a4 + 1);
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v11 = 438;
  }
  if (!self->_originalFileModDate
    || ![a7 length]
    || (v13 = +[NSFileManager defaultManager],
        (v14 = [(NSFileManager *)v13 fileAttributesAtPath:a7 traverseLink:1]) == 0)
    || ![(NSDate *)self->_originalFileModDate isEqual:[(NSDictionary *)v14 fileModificationDate]]|| (BOOL v15 = [(NSFileManager *)v13 linkItemAtPath:a7 toPath:a3 error:0], result = 0, !v15))
  {
    if (-[NSData writeToFile:atomically:](self, "writeToFile:atomically:", a3, 0, a5))
    {
      _NXChmodFile((uint64_t)a3, v11 & ~_NSPageDataUmask);
      if (v8)
      {

        self->data = (NSData *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9B8], "allocWithZone:", -[NSPageData zone](self, "zone")), "initWithContentsOfMappedFile:", a3);
      }
      if (v12)
      {
        id v17 = objc_allocWithZone(MEMORY[0x1E4F1C9E8]);
        v18 = objc_msgSend(v17, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)v12), @"NSFileModificationDate", 0);
      }
      else
      {
        v21 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1C9C8]) init];
        v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v21, @"NSFileModificationDate", 0);
      }
      [+[NSFileManager defaultManager] changeFileAttributes:v18 atPath:a3];

      v22 = [+[NSFileManager defaultManager] fileAttributesAtPath:a3 traverseLink:1];
      unint64_t result = 0;
      if (v22)
      {
        if (v8)
        {
          -[NSPageData _setOriginalFileInfoFromFileAttributes:](self, "_setOriginalFileInfoFromFileAttributes:");

          v23 = (NSString *)[a3 copy];
          unint64_t result = 0;
          self->_originalFilePath = v23;
        }
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

- (id)initFromSerializerStream:(id)a3 length:(unint64_t)a4
{
  v7 = NSAllocateMemoryPages(a4);
  [a3 copySerializationInto:v7];
  [(NSPageData *)self initWithBytes:v7 length:a4];
  NSDeallocateMemoryPages(v7, a4);
  return self;
}

- (id)deserializer
{
  objc_super v3 = +[NSAKDeserializerStream allocWithZone:[(NSPageData *)self zone]];
  uint64_t v4 = [(NSPageData *)self bytes];
  unint64_t v5 = [(NSPageData *)self length];

  return [(NSAKDeserializerStream *)v3 initFromMemoryNoCopy:v4 length:v5 freeWhenDone:0];
}

- (NSPageData)initWithDataNoCopy:(id)a3
{
  self->data = (NSData *)a3;
  return self;
}

- (id)data
{
  unsigned int v2 = self->data;

  return v2;
}

- (unint64_t)writeFd:(int64_t)a3
{
  ssize_t v4 = write(a3, [(NSPageData *)self bytes], [(NSPageData *)self length]);
  return 2 * (v4 != [(NSPageData *)self length]);
}

- (unint64_t)writeFile:(id)a3
{
  if (![(NSData *)self writeToFile:a3 atomically:0]) {
    return 2;
  }
  _NXChmodFile((uint64_t)a3, ~(_WORD)_NSPageDataUmask & 0x1B6);
  return 0;
}

@end