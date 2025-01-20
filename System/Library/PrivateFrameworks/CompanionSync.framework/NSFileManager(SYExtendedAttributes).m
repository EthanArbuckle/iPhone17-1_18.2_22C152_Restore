@interface NSFileManager(SYExtendedAttributes)
- (BOOL)setExtendedAttributeData:()SYExtendedAttributes forKey:atURL:error:;
- (id)stringForExtendedAttribute:()SYExtendedAttributes atURL:error:;
- (uint64_t)setExtendedAttributeValue:()SYExtendedAttributes forKey:atURL:error:;
- (void)dataForExtendedAttribute:()SYExtendedAttributes atURL:error:;
@end

@implementation NSFileManager(SYExtendedAttributes)

- (uint64_t)setExtendedAttributeValue:()SYExtendedAttributes forKey:atURL:error:
{
  id v10 = a5;
  id v11 = a4;
  v12 = [a3 dataUsingEncoding:4];
  uint64_t v13 = [a1 setExtendedAttributeData:v12 forKey:v11 atURL:v10 error:a6];

  return v13;
}

- (BOOL)setExtendedAttributeData:()SYExtendedAttributes forKey:atURL:error:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!_ValidateURL(v11, a6)) {
    goto LABEL_7;
  }
  if ([v11 isFileReferenceURL])
  {
    uint64_t v12 = [v11 filePathURL];

    id v11 = (id)v12;
  }
  id v11 = v11;
  uint64_t v13 = (const char *)[v11 fileSystemRepresentation];
  v14 = (const char *)[v10 UTF8String];
  id v15 = v9;
  int v16 = setxattr(v13, v14, (const void *)[v15 bytes], objc_msgSend(v15, "length"), 0, 6);
  BOOL v17 = v16 == 0;
  if (a6 && v16)
  {
    uint64_t v18 = *__error();
    id v19 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v20 = *MEMORY[0x263F08438];
    id v11 = v11;
    v21 = objc_opt_new();
    v22 = [v11 absoluteURL];
    [v21 setObject:v22 forKeyedSubscript:*MEMORY[0x263F08578]];

    v23 = [v11 absoluteString];

    [v21 setObject:v23 forKeyedSubscript:*MEMORY[0x263F08588]];
    *a6 = (id)[v19 initWithDomain:v20 code:v18 userInfo:v21];

LABEL_7:
    BOOL v17 = 0;
  }

  return v17;
}

- (id)stringForExtendedAttribute:()SYExtendedAttributes atURL:error:
{
  v6 = objc_msgSend(a1, "dataForExtendedAttribute:atURL:error:");
  if (v6)
  {
    uint64_t v7 = [[NSString alloc] initWithData:v6 encoding:4];
    v8 = (void *)v7;
    if (a5 && !v7)
    {
      id v9 = objc_alloc(MEMORY[0x263F087E8]);
      *a5 = (id)[v9 initWithDomain:*MEMORY[0x263F07F70] code:2048 userInfo:0];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)dataForExtendedAttribute:()SYExtendedAttributes atURL:error:
{
  id v7 = a3;
  id v8 = a4;
  if (!_ValidateURL(v8, a5))
  {
LABEL_10:
    a5 = 0;
    goto LABEL_15;
  }
  id v9 = v8;
  id v10 = (const char *)[v9 fileSystemRepresentation];
  id v11 = v7;
  ssize_t v12 = getxattr(v10, (const char *)[v11 UTF8String], 0, 0, 0, 0);
  if (v12 < 0)
  {
    if (!a5) {
      goto LABEL_15;
    }
    uint64_t v20 = *__error();
    id v21 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v22 = *MEMORY[0x263F08438];
    id v23 = v9;
    v24 = objc_opt_new();
    v25 = [v23 absoluteURL];
    [v24 setObject:v25 forKeyedSubscript:*MEMORY[0x263F08578]];

    v26 = [v23 absoluteString];

    [v24 setObject:v26 forKeyedSubscript:*MEMORY[0x263F08588]];
    *a5 = (id)[v21 initWithDomain:v22 code:v20 userInfo:v24];

    goto LABEL_10;
  }
  if (v12)
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:v12];
    id v14 = v9;
    id v15 = (const char *)[v14 fileSystemRepresentation];
    int v16 = (const char *)[v11 UTF8String];
    id v17 = v13;
    unint64_t v18 = getxattr(v15, v16, (void *)[v17 mutableBytes], objc_msgSend(v17, "length"), 0, 0);
    if ((v18 & 0x8000000000000000) != 0)
    {
      if (a5)
      {
        uint64_t v27 = *__error();
        id v28 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v29 = *MEMORY[0x263F08438];
        id v30 = v14;
        v31 = objc_opt_new();
        v32 = [v30 absoluteURL];
        [v31 setObject:v32 forKeyedSubscript:*MEMORY[0x263F08578]];

        v33 = [v30 absoluteString];

        [v31 setObject:v33 forKeyedSubscript:*MEMORY[0x263F08588]];
        *a5 = (id)[v28 initWithDomain:v29 code:v27 userInfo:v31];

        a5 = 0;
      }
    }
    else
    {
      unint64_t v19 = v18;
      if (v18 < [v17 length]) {
        [v17 setLength:v19];
      }
      a5 = v17;
    }
  }
  else
  {
    a5 = [MEMORY[0x263EFF8F8] data];
  }
LABEL_15:

  return a5;
}

@end