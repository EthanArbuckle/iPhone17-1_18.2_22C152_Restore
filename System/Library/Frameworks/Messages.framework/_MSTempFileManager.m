@interface _MSTempFileManager
+ (id)sharedInstance;
- (_MSTempFileManager)init;
- (id)writeTemporaryFileWithData:(id)a3 type:(id)a4;
@end

@implementation _MSTempFileManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

- (_MSTempFileManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)_MSTempFileManager;
  return [(_MSTempFileManager *)&v3 init];
}

- (id)writeTemporaryFileWithData:(id)a3 type:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F224F8];
  id v6 = a3;
  CFStringRef v7 = UTTypeCopyPreferredTagWithClass((CFStringRef)a4, v5);
  v8 = (__CFString *)v7;
  v9 = @"data";
  if (v7) {
    v9 = (__CFString *)v7;
  }
  v10 = v9;

  v11 = IMSafeTemporaryDirectory();
  v12 = [v11 path];
  v13 = [v12 stringByAppendingPathComponent:@"ms-XXXXXX"];
  v14 = [v13 stringByAppendingPathExtension:v10];

  id v15 = v14;
  [v15 UTF8String];
  bzero(v20, 0x400uLL);
  __strlcpy_chk();
  LODWORD(v12) = [(__CFString *)v10 length];

  int v16 = mkstemps(v20, v12 + 1);
  close(v16);
  v17 = [NSString stringWithUTF8String:v20];
  v18 = +[_MSTempURL fileURLWithPath:v17];

  [v6 writeToURL:v18 atomically:1];

  return v18;
}

@end