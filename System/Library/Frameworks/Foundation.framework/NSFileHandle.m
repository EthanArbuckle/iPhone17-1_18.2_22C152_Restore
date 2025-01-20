@interface NSFileHandle
+ (BOOL)supportsSecureCoding;
+ (NSFileHandle)allocWithZone:(_NSZone *)a3;
+ (NSFileHandle)fileHandleForReadingAtPath:(NSString *)path;
+ (NSFileHandle)fileHandleForReadingFromURL:(NSURL *)url error:(NSError *)error;
+ (NSFileHandle)fileHandleForUpdatingAtPath:(NSString *)path;
+ (NSFileHandle)fileHandleForUpdatingURL:(NSURL *)url error:(NSError *)error;
+ (NSFileHandle)fileHandleForWritingAtPath:(NSString *)path;
+ (NSFileHandle)fileHandleForWritingToURL:(NSURL *)url error:(NSError *)error;
+ (NSFileHandle)fileHandleWithNullDevice;
+ (NSFileHandle)fileHandleWithStandardError;
+ (NSFileHandle)fileHandleWithStandardInput;
+ (NSFileHandle)fileHandleWithStandardOutput;
+ (id)fileHandleForReadingFromURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5;
+ (id)fileHandleForUpdatingURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5;
+ (id)fileHandleForWritingToURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5;
+ (void)initialize;
- (BOOL)closeAndReturnError:(NSError *)error;
- (BOOL)getOffset:(unint64_t *)offsetInFile error:(NSError *)error;
- (BOOL)seekToEndReturningOffset:(unint64_t *)offsetInFile error:(NSError *)error;
- (BOOL)seekToOffset:(unint64_t)offset error:(NSError *)error;
- (BOOL)synchronizeAndReturnError:(NSError *)error;
- (BOOL)truncateAtOffset:(unint64_t)offset error:(NSError *)error;
- (BOOL)writeData:(NSData *)data error:(NSError *)error;
- (Class)classForCoder;
- (NSData)availableData;
- (NSData)readDataOfLength:(NSUInteger)length;
- (NSData)readDataToEndOfFile;
- (NSData)readDataToEndOfFileAndReturnError:(NSError *)error;
- (NSData)readDataUpToLength:(NSUInteger)length error:(NSError *)error;
- (NSFileHandle)initWithCoder:(NSCoder *)coder;
- (NSFileHandle)initWithFileDescriptor:(int)fd;
- (NSFileHandle)initWithFileDescriptor:(int)fd closeOnDealloc:(BOOL)closeopt;
- (NSFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5;
- (NSFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6;
- (NSFileHandle)initWithURL:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6;
- (int)fileDescriptor;
- (unint64_t)offsetInFile;
- (unint64_t)seekToEndOfFile;
- (void)closeFile;
- (void)encodeWithCoder:(id)a3;
- (void)readabilityHandler;
- (void)seekToFileOffset:(unint64_t)offset;
- (void)setReadabilityHandler:(void *)readabilityHandler;
- (void)setWriteabilityHandler:(void *)writeabilityHandler;
- (void)synchronizeFile;
- (void)truncateFileAtOffset:(unint64_t)offset;
- (void)writeData:(NSData *)data;
- (void)writeabilityHandler;
@end

@implementation NSFileHandle

- (NSFileHandle)initWithCoder:(NSCoder *)coder
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0]);
  }
  v5 = (void *)[(NSCoder *)coder decodeXPCObjectOfType:MEMORY[0x1E4F145B0] forKey:@"NS.fd"];
  if (v5)
  {
    uint64_t v6 = xpc_fd_dup(v5);
    return [(NSFileHandle *)self initWithFileDescriptor:v6 closeOnDealloc:1];
  }
  else
  {

    return 0;
  }
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __40__NSFileHandle_fileHandleWithNullDevice__block_invoke()
{
  uint64_t result = [objc_allocWithZone((Class)NSNullFileHandle) init];
  qword_1EB1ECE08 = result;
  return result;
}

+ (NSFileHandle)fileHandleForReadingFromURL:(NSURL *)url error:(NSError *)error
{
  v4 = (void *)[objc_allocWithZone((Class)a1) initWithURL:url flags:0 createMode:0 error:error];

  return (NSFileHandle *)v4;
}

+ (NSFileHandle)fileHandleForWritingAtPath:(NSString *)path
{
  v3 = (void *)[objc_allocWithZone((Class)a1) initWithPath:path flags:1 createMode:0];

  return (NSFileHandle *)v3;
}

+ (NSFileHandle)fileHandleForUpdatingURL:(NSURL *)url error:(NSError *)error
{
  v4 = (void *)[objc_allocWithZone((Class)a1) initWithURL:url flags:2 createMode:0 error:error];

  return (NSFileHandle *)v4;
}

+ (NSFileHandle)fileHandleForReadingAtPath:(NSString *)path
{
  v3 = (void *)[objc_allocWithZone((Class)a1) initWithPath:path flags:0 createMode:0];

  return (NSFileHandle *)v3;
}

+ (NSFileHandle)allocWithZone:(_NSZone *)a3
{
  if (NSFileHandle == a1) {
    a1 = self;
  }

  return (NSFileHandle *)NSAllocateObject((Class)a1, 0, a3);
}

+ (void)initialize
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v7.rlim_cur = 0;
    v7.int rlim_max = 0;
    int v2 = getrlimit(8, &v7);
    *(void *)v8 = 0x1D00000001;
    int rlim_max = 0;
    size_t v5 = 4;
    if (sysctl(v8, 2u, &rlim_max, &v5, 0, 0) | v2)
    {
      if (v2) {
        return;
      }
      LODWORD(v3) = rlim_max;
    }
    else
    {
      LODWORD(v3) = rlim_max;
      if (v7.rlim_max < rlim_max)
      {
        int rlim_max = v7.rlim_max;
        LODWORD(v3) = v7.rlim_max;
      }
    }
    if (v7.rlim_cur < (int)v3)
    {
      rlim_t v3 = (int)v3;
      rlimit v4 = v7;
      if (v7.rlim_cur + 2304 < (int)v3) {
        rlim_t v3 = v7.rlim_cur + 2304;
      }
      v4.rlim_cur = v3;
      setrlimit(8, &v4);
    }
  }
}

+ (NSFileHandle)fileHandleWithNullDevice
{
  if (qword_1EB1ECE10 != -1) {
    dispatch_once(&qword_1EB1ECE10, &__block_literal_global_9);
  }
  return (NSFileHandle *)qword_1EB1ECE08;
}

+ (NSFileHandle)fileHandleForWritingToURL:(NSURL *)url error:(NSError *)error
{
  rlimit v4 = (void *)[objc_allocWithZone((Class)a1) initWithURL:url flags:1 createMode:0 error:error];

  return (NSFileHandle *)v4;
}

+ (NSFileHandle)fileHandleWithStandardInput
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__NSFileHandle_fileHandleWithStandardInput__block_invoke;
  v3[3] = &unk_1E51F71D0;
  v3[4] = a1;
  if (qword_1EB1ECDE0 != -1) {
    dispatch_once(&qword_1EB1ECDE0, v3);
  }
  return (NSFileHandle *)_MergedGlobals_25;
}

uint64_t __43__NSFileHandle_fileHandleWithStandardInput__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_allocWithZone((Class)_NSStdIOFileHandle) initWithFileDescriptor:0 closeOnDealloc:0];
  _MergedGlobals_25 = result;
  if (result)
  {
    atomic_fetch_or((atomic_ushort *volatile)(result + 100), 0x8000u);
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) fileHandleWithNullDevice];
    _MergedGlobals_25 = result;
  }
  return result;
}

+ (NSFileHandle)fileHandleWithStandardOutput
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__NSFileHandle_fileHandleWithStandardOutput__block_invoke;
  v3[3] = &unk_1E51F71D0;
  v3[4] = a1;
  if (qword_1EB1ECDF0 != -1) {
    dispatch_once(&qword_1EB1ECDF0, v3);
  }
  return (NSFileHandle *)qword_1EB1ECDE8;
}

uint64_t __44__NSFileHandle_fileHandleWithStandardOutput__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_allocWithZone((Class)_NSStdIOFileHandle) initWithFileDescriptor:1 closeOnDealloc:0];
  qword_1EB1ECDE8 = result;
  if (result)
  {
    atomic_fetch_or((atomic_ushort *volatile)(result + 100), 0x4000u);
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) fileHandleWithNullDevice];
    qword_1EB1ECDE8 = result;
  }
  return result;
}

+ (NSFileHandle)fileHandleWithStandardError
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__NSFileHandle_fileHandleWithStandardError__block_invoke;
  v3[3] = &unk_1E51F71D0;
  v3[4] = a1;
  if (qword_1EB1ECE00 != -1) {
    dispatch_once(&qword_1EB1ECE00, v3);
  }
  return (NSFileHandle *)qword_1EB1ECDF8;
}

uint64_t __43__NSFileHandle_fileHandleWithStandardError__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_allocWithZone((Class)_NSStdIOFileHandle) initWithFileDescriptor:2 closeOnDealloc:0];
  qword_1EB1ECDF8 = result;
  if (result)
  {
    atomic_fetch_or((atomic_ushort *volatile)(result + 100), 0x2000u);
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) fileHandleWithNullDevice];
    qword_1EB1ECDF8 = result;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5
{
  rlimit v7 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (NSFileHandle)initWithFileDescriptor:(int)fd closeOnDealloc:(BOOL)closeopt
{
  uint64_t v6 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSFileHandle)initWithFileDescriptor:(int)fd
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSFileHandle)initWithURL:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6
{
  if ([a3 isFileURL]) {
    uint64_t v11 = [a3 path];
  }
  else {
    uint64_t v11 = 0;
  }

  return [(NSFileHandle *)self initWithPath:v11 flags:a4 createMode:a5 error:a6];
}

- (NSFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6
{
  [(NSFileHandle *)self init];
  v8 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v8);
}

+ (NSFileHandle)fileHandleForUpdatingAtPath:(NSString *)path
{
  rlim_t v3 = (void *)[objc_allocWithZone((Class)a1) initWithPath:path flags:2 createMode:0];

  return (NSFileHandle *)v3;
}

+ (id)fileHandleForReadingFromURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5
{
  size_t v5 = (void *)[objc_allocWithZone((Class)a1) initWithURL:a3 flags:512 createMode:a4 error:a5];

  return v5;
}

+ (id)fileHandleForWritingToURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5
{
  size_t v5 = (void *)[objc_allocWithZone((Class)a1) initWithURL:a3 flags:513 createMode:a4 error:a5];

  return v5;
}

+ (id)fileHandleForUpdatingURL:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5
{
  size_t v5 = (void *)[objc_allocWithZone((Class)a1) initWithURL:a3 flags:514 createMode:a4 error:a5];

  return v5;
}

- (NSData)availableData
{
  rlimit v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSData)readDataToEndOfFile
{
  rlimit v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSData)readDataToEndOfFileAndReturnError:(NSError *)error
{
  uint64_t v6 = [(NSFileHandle *)self methodForSelector:sel_readDataToEndOfFile];
  if (v6 == +[NSFileHandle instanceMethodForSelector:sel_readDataToEndOfFile])
  {
    v8 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v8);
  }
  if (error) {
    *error = 0;
  }
  return [(NSFileHandle *)self readDataToEndOfFile];
}

- (NSData)readDataOfLength:(NSUInteger)length
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSData)readDataUpToLength:(NSUInteger)length error:(NSError *)error
{
  uint64_t v8 = [(NSFileHandle *)self methodForSelector:sel_readDataOfLength_];
  if (v8 == +[NSFileHandle instanceMethodForSelector:sel_readDataOfLength_])
  {
    v10 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v10);
  }
  if (error) {
    *error = 0;
  }
  return [(NSFileHandle *)self readDataOfLength:length];
}

- (void)writeData:(NSData *)data
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)writeData:(NSData *)data error:(NSError *)error
{
  uint64_t v8 = [(NSFileHandle *)self methodForSelector:sel_writeData_];
  if (v8 == +[NSFileHandle instanceMethodForSelector:sel_writeData_])
  {
    v10 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v10);
  }
  if (error) {
    *error = 0;
  }
  [(NSFileHandle *)self writeData:data];
  return 1;
}

- (unint64_t)offsetInFile
{
  rlimit v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)getOffset:(unint64_t *)offsetInFile error:(NSError *)error
{
  uint64_t v8 = [(NSFileHandle *)self methodForSelector:sel_offsetInFile];
  if (v8 == +[NSFileHandle instanceMethodForSelector:sel_offsetInFile])
  {
    uint64_t v11 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v11);
  }
  if (error) {
    *error = 0;
  }
  unint64_t v9 = [(NSFileHandle *)self offsetInFile];
  if (offsetInFile) {
    *offsetInFile = v9;
  }
  return 1;
}

- (unint64_t)seekToEndOfFile
{
  rlimit v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)seekToEndReturningOffset:(unint64_t *)offsetInFile error:(NSError *)error
{
  uint64_t v8 = [(NSFileHandle *)self methodForSelector:sel_seekToEndOfFile];
  if (v8 == +[NSFileHandle instanceMethodForSelector:sel_seekToEndOfFile])
  {
    uint64_t v11 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v11);
  }
  if (error) {
    *error = 0;
  }
  unint64_t v9 = [(NSFileHandle *)self seekToEndOfFile];
  if (offsetInFile) {
    *offsetInFile = v9;
  }
  return 1;
}

- (void)seekToFileOffset:(unint64_t)offset
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)seekToOffset:(unint64_t)offset error:(NSError *)error
{
  uint64_t v8 = [(NSFileHandle *)self methodForSelector:sel_seekToFileOffset_];
  if (v8 == +[NSFileHandle instanceMethodForSelector:sel_seekToFileOffset_])
  {
    v10 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v10);
  }
  if (error) {
    *error = 0;
  }
  [(NSFileHandle *)self seekToFileOffset:offset];
  return 1;
}

- (void)truncateFileAtOffset:(unint64_t)offset
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)truncateAtOffset:(unint64_t)offset error:(NSError *)error
{
  uint64_t v8 = [(NSFileHandle *)self methodForSelector:sel_truncateFileAtOffset_];
  if (v8 == +[NSFileHandle instanceMethodForSelector:sel_truncateFileAtOffset_])
  {
    v10 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v10);
  }
  if (error) {
    *error = 0;
  }
  [(NSFileHandle *)self truncateFileAtOffset:offset];
  return 1;
}

- (void)synchronizeFile
{
  rlimit v4 = NSClassFromString((NSString *)@"NSFileHandle");

  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)synchronizeAndReturnError:(NSError *)error
{
  uint64_t v6 = [(NSFileHandle *)self methodForSelector:sel_synchronizeFile];
  if (v6 == +[NSFileHandle instanceMethodForSelector:sel_synchronizeFile])
  {
    uint64_t v8 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v8);
  }
  if (error) {
    *error = 0;
  }
  [(NSFileHandle *)self synchronizeFile];
  return 1;
}

- (void)closeFile
{
  rlimit v4 = NSClassFromString((NSString *)@"NSFileHandle");

  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)closeAndReturnError:(NSError *)error
{
  uint64_t v6 = [(NSFileHandle *)self methodForSelector:sel_closeFile];
  if (v6 == +[NSFileHandle instanceMethodForSelector:sel_closeFile])
  {
    uint64_t v8 = NSClassFromString((NSString *)@"NSFileHandle");
    NSRequestConcreteImplementation((uint64_t)self, a2, v8);
  }
  if (error) {
    *error = 0;
  }
  [(NSFileHandle *)self closeFile];
  return 1;
}

- (int)fileDescriptor
{
  rlimit v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)writeabilityHandler
{
  rlimit v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setWriteabilityHandler:(void *)writeabilityHandler
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)readabilityHandler
{
  rlimit v4 = NSClassFromString((NSString *)@"NSFileHandle");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setReadabilityHandler:(void *)readabilityHandler
{
  size_t v5 = NSClassFromString((NSString *)@"NSFileHandle");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

@end