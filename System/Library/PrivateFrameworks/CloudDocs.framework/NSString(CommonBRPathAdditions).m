@interface NSString(CommonBRPathAdditions)
+ (char)br_pathWithFileSystemRepresentation:()CommonBRPathAdditions;
- (id)br_stringByDeletingPathBounceNo:()CommonBRPathAdditions andPathExtension:;
- (uint64_t)br_stringByDeletingPathBounceNo:()CommonBRPathAdditions;
@end

@implementation NSString(CommonBRPathAdditions)

- (id)br_stringByDeletingPathBounceNo:()CommonBRPathAdditions andPathExtension:
{
  id v6 = a1;
  v7 = (char *)[v6 fileSystemRepresentation];
  v8 = _extensionInFilename(v7, 0);
  v9 = v8;
  if (!a4)
  {
    if (v8) {
      goto LABEL_5;
    }
LABEL_7:
    size_t v11 = strlen(v7);
    char v10 = 1;
    goto LABEL_8;
  }
  if (!v8)
  {
    *a4 = 0;
    goto LABEL_7;
  }
  objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", v8);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
  char v10 = 0;
  size_t v11 = (size_t)&v9[~(unint64_t)v7];
LABEL_8:
  size_t v12 = v11;
  do
  {
    if (!v12) {
      goto LABEL_14;
    }
    size_t v13 = v12 - 1;
    int v14 = v7[--v12];
  }
  while ((v14 - 48) < 0xA);
  if (v14 != 32 || v7[v13 + 1] == 48)
  {
    size_t v12 = 0;
LABEL_14:
    if (!a3) {
      goto LABEL_16;
    }
LABEL_15:
    *a3 = v12;
    goto LABEL_16;
  }
  *__error() = 0;
  uint64_t v19 = strtoll(&v7[v13 + 1], 0, 10);
  BOOL v20 = *__error() == 0;
  BOOL v21 = v19 > 1;
  BOOL v22 = !v20 || !v21;
  if (v20 && v21) {
    size_t v12 = v19;
  }
  else {
    size_t v12 = 0;
  }
  if (!v22) {
    size_t v11 = v13;
  }
  if (a3) {
    goto LABEL_15;
  }
LABEL_16:
  if (a4) {
    char v15 = 1;
  }
  else {
    char v15 = v10;
  }
  if (v15)
  {
    if (v7[v11])
    {
      v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v17 = [v16 stringWithFileSystemRepresentation:v7 length:v11];
    }
    else
    {
      id v17 = v6;
    }
  }
  else
  {
    v23 = 0;
    asprintf(&v23, "%.*s.%s", v11, v7, v9);
    objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", v23);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    free(v23);
  }

  return v17;
}

- (uint64_t)br_stringByDeletingPathBounceNo:()CommonBRPathAdditions
{
  return objc_msgSend(a1, "br_stringByDeletingPathBounceNo:andPathExtension:", a3, 0);
}

+ (char)br_pathWithFileSystemRepresentation:()CommonBRPathAdditions
{
  v3 = a3;
  if (a3)
  {
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v3 = [v4 stringWithFileSystemRepresentation:v3 length:strlen(v3)];
  }

  return v3;
}

@end