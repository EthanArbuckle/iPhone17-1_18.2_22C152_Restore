@interface NSFileManager(ContactsFoundation)
- (id)_cn_valueForExtendedAttribute:()ContactsFoundation path:error:;
- (uint64_t)_cn_getValue:()ContactsFoundation forExtendendAttribute:path:error:;
- (uint64_t)_cn_getValue:()ContactsFoundation forExtendendAttribute:url:error:;
- (uint64_t)_cn_removeExtendedAttributeForKey:()ContactsFoundation path:error:;
- (uint64_t)_cn_setValue:()ContactsFoundation forExtendedAttribute:path:error:;
- (uint64_t)_cn_setValue:()ContactsFoundation forExtendedAttribute:url:error:;
@end

@implementation NSFileManager(ContactsFoundation)

- (uint64_t)_cn_setValue:()ContactsFoundation forExtendedAttribute:url:error:
{
  id v10 = a4;
  id v11 = a3;
  v12 = [a5 path];
  uint64_t v13 = objc_msgSend(a1, "_cn_setValue:forExtendedAttribute:path:error:", v11, v10, v12, a6);

  return v13;
}

- (uint64_t)_cn_getValue:()ContactsFoundation forExtendendAttribute:url:error:
{
  id v10 = a4;
  id v11 = [a5 path];
  uint64_t v12 = objc_msgSend(a1, "_cn_getValue:forExtendendAttribute:path:error:", a3, v10, v11, a6);

  return v12;
}

- (uint64_t)_cn_setValue:()ContactsFoundation forExtendedAttribute:path:error:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v10))
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:1300 userInfo:0];
    if (a6)
    {
LABEL_3:
      id v12 = v12;
      *a6 = v12;
    }
  }
  else
  {
    v14 = (const char *)[v11 UTF8String];
    v15 = (const char *)[v10 UTF8String];
    id v16 = v9;
    if (!setxattr(v14, v15, (const void *)[v16 UTF8String], objc_msgSend(v16, "lengthOfBytesUsingEncoding:", 4), 0, 0))
    {
      uint64_t v13 = 1;
      goto LABEL_9;
    }
    id v12 = +[CNFoundationError errorWithErrno];
    if (a6) {
      goto LABEL_3;
    }
  }

  uint64_t v13 = 0;
LABEL_9:

  return v13;
}

- (id)_cn_valueForExtendedAttribute:()ContactsFoundation path:error:
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v15 = 0;
  int v6 = objc_msgSend(a1, "_cn_getValue:forExtendendAttribute:path:error:", &v15, a3, a4, a5);
  id v7 = v15;
  v8 = v7;
  if (v6)
  {
    if (!v7)
    {
      id v9 = +[CNFoundationError errorWithErrno:93];
      uint64_t v16 = *MEMORY[0x1E4F28A50];
      v17[0] = v9;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:1302 userInfo:v10];
      id v12 = v11;
      if (a5) {
        *a5 = v11;
      }
    }
    id v13 = 0;
  }
  else
  {
    id v13 = v7;
  }

  return v13;
}

- (uint64_t)_cn_getValue:()ContactsFoundation forExtendendAttribute:path:error:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v10))
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    id v13 = @"CNContactsFoundationErrorDomain";
    uint64_t v14 = 1300;
    goto LABEL_11;
  }
  if (([a1 fileExistsAtPath:v11] & 1) == 0)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    id v13 = (__CFString *)*MEMORY[0x1E4F281F8];
    uint64_t v14 = 4;
    goto LABEL_11;
  }
  memset(value, 0, sizeof(value));
  ssize_t v15 = getxattr((const char *)[v11 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), value, 0xFFuLL, 0, 0);
  if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v16 = [NSString stringWithUTF8String:value];
    if (v16)
    {
      v17 = v16;
      if (a3) {
        *a3 = v16;
      }

      goto LABEL_9;
    }
    id v12 = (void *)MEMORY[0x1E4F28C58];
    id v13 = @"CNContactsFoundationErrorDomain";
    uint64_t v14 = 1301;
LABEL_11:
    v19 = [v12 errorWithDomain:v13 code:v14 userInfo:0];
    v20 = v19;
    if (a6) {
      *a6 = v19;
    }
LABEL_13:

    uint64_t v18 = 0;
    goto LABEL_14;
  }
  if (v15 != -1 || *__error() != 93)
  {
    v20 = +[CNFoundationError errorWithErrno];
    uint64_t v25 = *MEMORY[0x1E4F28A50];
    v26 = v20;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:1302 userInfo:v22];
    v24 = v23;
    if (a6) {
      *a6 = v23;
    }

    goto LABEL_13;
  }
  if (a3) {
    *a3 = 0;
  }
LABEL_9:
  uint64_t v18 = 1;
LABEL_14:

  return v18;
}

- (uint64_t)_cn_removeExtendedAttributeForKey:()ContactsFoundation path:error:
{
  id v8 = a3;
  id v9 = a4;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v8))
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    id v11 = @"CNContactsFoundationErrorDomain";
    uint64_t v12 = 1300;
    goto LABEL_8;
  }
  if (([a1 fileExistsAtPath:v9] & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    id v11 = (__CFString *)*MEMORY[0x1E4F281F8];
    uint64_t v12 = 4;
LABEL_8:
    id v14 = [v10 errorWithDomain:v11 code:v12 userInfo:0];
    if (!a5)
    {
LABEL_10:

      uint64_t v13 = 0;
      goto LABEL_11;
    }
LABEL_9:
    id v14 = v14;
    *a5 = v14;
    goto LABEL_10;
  }
  if (removexattr((const char *)[v9 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), 0)&& *__error() != 93)
  {
    id v14 = +[CNFoundationError errorWithErrno];
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v13 = 1;
LABEL_11:

  return v13;
}

@end