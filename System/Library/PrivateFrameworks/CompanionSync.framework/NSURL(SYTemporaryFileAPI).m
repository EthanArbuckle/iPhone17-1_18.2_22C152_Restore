@interface NSURL(SYTemporaryFileAPI)
+ (id)_SYTemporaryFileURL:()SYTemporaryFileAPI;
@end

@implementation NSURL(SYTemporaryFileAPI)

+ (id)_SYTemporaryFileURL:()SYTemporaryFileAPI
{
  v4 = NSTemporaryDirectory();
  v5 = [v4 stringByAppendingPathComponent:@"CompanionSync"];

  id v6 = v5;
  v7 = [MEMORY[0x263F08850] defaultManager];
  int v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {

LABEL_4:
    id v12 = [v6 stringByAppendingPathComponent:@"XXXXXXXX"];
    v13 = strdup((const char *)[v12 UTF8String]);
    int v14 = mkstemp(v13);
    if (v14 == -1)
    {
      if (a3)
      {
        uint64_t v15 = *__error();
        id v16 = objc_alloc(MEMORY[0x263F087E8]);
        id v17 = (id)[v16 initWithDomain:*MEMORY[0x263F08438] code:v15 userInfo:0];
        v11 = 0;
        *a3 = v17;
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      close(v14);
      v11 = (void *)[objc_alloc(NSURL) initFileURLWithFileSystemRepresentation:v13 isDirectory:0 relativeToURL:0];
    }
    free(v13);

    goto LABEL_10;
  }
  v9 = [MEMORY[0x263F08850] defaultManager];
  int v10 = [v9 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:a3];

  v11 = 0;
  if (v10) {
    goto LABEL_4;
  }
LABEL_10:

  return v11;
}

@end