@interface NSFileManager(GSAdditions)
- (id)gs_createTemporarySubdirectoryOfItem:()GSAdditions withTemplate:error:;
@end

@implementation NSFileManager(GSAdditions)

- (id)gs_createTemporarySubdirectoryOfItem:()GSAdditions withTemplate:error:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = open(".", 256);
  if ((v9 & 0x80000000) != 0 && *__error() != 1)
  {
    v14 = 0;
    int v12 = -1;
    if (!a5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v10 = v7;
  uint64_t v11 = open((const char *)[v10 fileSystemRepresentation], 0);
  int v12 = v11;
  if ((v11 & 0x80000000) == 0 && (MEMORY[0x1E01A20B0](v11) & 0x80000000) == 0)
  {
    if (([v8 getFileSystemRepresentation:v16 maxLength:1024] & 1) == 0)
    {
      v14 = 0;
      *__error() = 63;
      if (a5) {
        goto LABEL_12;
      }
      goto LABEL_13;
    }
    if (mkdtemp(v16))
    {
      MEMORY[0x1E01A20B0](v9);
      v13 = [NSString stringWithUTF8String:v16];
      v14 = [v10 stringByAppendingPathComponent:v13];

      if (!a5) {
        goto LABEL_13;
      }
LABEL_12:
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
      goto LABEL_13;
    }
  }
  v14 = 0;
  if (a5) {
    goto LABEL_12;
  }
LABEL_13:
  if (v12 >= 1) {
    close(v12);
  }
  if ((int)v9 >= 1) {
    close(v9);
  }

  return v14;
}

@end