@interface JPFileEntry
- (BOOL)releaseBackingOnDealloc;
- (BOOL)writeStream:(id)a3 toDirectory:(id)a4 error:(id *)a5;
- (JPFileEntry)initWithBacking:(void *)a3 releaseOnDealloc:(BOOL)a4;
- (NSString)pathname;
- (void)backing;
- (void)setBacking:(void *)a3;
@end

@implementation JPFileEntry

- (BOOL)writeStream:(id)a3 toDirectory:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(JPFileEntry *)self backing];
  v11 = (JetPack::ArchiveStream **)[v9 backing];

  id v12 = v8;
  v13 = (char *)objc_msgSend(v12, "cStringUsingEncoding:", objc_msgSend(NSString, "defaultCStringEncoding"));

  char v14 = JetPackFileEntryWriteToDirectory((uint64_t)v10, v11, v13);
  BOOL v15 = v14;
  if (a5 && (v14 & 1) == 0)
  {
    *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"JPErrorDomain" code:0 userInfo:0];
  }
  return v15;
}

- (NSString)pathname
{
  v2 = [(JPFileEntry *)self backing];
  Pathname = (void *)JetPackFileEntryGetPathname(v2, v3, v4);
  if (Pathname) {
    Pathname = (void *)[[NSString alloc] initWithUTF8String:Pathname];
  }
  return (NSString *)Pathname;
}

- (void)backing
{
  return self->_backing;
}

- (JPFileEntry)initWithBacking:(void *)a3 releaseOnDealloc:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)JPFileEntry;
  result = [(JPFileEntry *)&v7 init];
  if (result)
  {
    result->_backing = a3;
    result->_releaseBackingOnDealloc = a4;
  }
  return result;
}

- (void)setBacking:(void *)a3
{
  self->_backing = a3;
}

- (BOOL)releaseBackingOnDealloc
{
  return self->_releaseBackingOnDealloc;
}

@end