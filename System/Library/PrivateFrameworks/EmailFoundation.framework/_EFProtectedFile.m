@interface _EFProtectedFile
- (NSString)ef_publicDescription;
- (id)initWithFilePath:(char)a3 isSensitive:(void *)a4 protectionType:;
- (uint64_t)fileDescriptorWithError:(uint64_t)a1;
@end

@implementation _EFProtectedFile

- (id)initWithFilePath:(char)a3 isSensitive:(void *)a4 protectionType:
{
  id v8 = a2;
  id v9 = a4;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)_EFProtectedFile;
    v10 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 3, a2);
      *((unsigned char *)a1 + 16) = a3;
      id v11 = v9;
      if ([v11 isEqualToString:*MEMORY[0x1E4F28340]])
      {
        int v12 = 1;
      }
      else if ([v11 isEqualToString:*MEMORY[0x1E4F28348]])
      {
        int v12 = 2;
      }
      else if ([v11 isEqualToString:*MEMORY[0x1E4F28358]])
      {
        int v12 = 3;
      }
      else if ([v11 isEqualToString:*MEMORY[0x1E4F28378]])
      {
        int v12 = 4;
      }
      else if ([v11 isEqualToString:*MEMORY[0x1E4F28368]])
      {
        int v12 = 7;
      }
      else
      {
        int v12 = -1;
      }

      *((_DWORD *)a1 + 5) = v12;
      *((_DWORD *)a1 + 3) = 0;
    }
  }

  return a1;
}

- (uint64_t)fileDescriptorWithError:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v4 = (os_unfair_lock_s *)(a1 + 12);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
  uint64_t v5 = *(unsigned int *)(a1 + 8);
  if (!v5
    && (id v6 = *(id *)(a1 + 24),
        *(_DWORD *)(a1 + 8) = open_dprotected_np((const char *)[v6 UTF8String], 0, *(_DWORD *)(a1 + 20), 0, 384), v6, uint64_t v5 = *(unsigned int *)(a1 + 8), v5 == -1))
  {
    *(_DWORD *)(a1 + 8) = 0;
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    v7 = (void *)[v9 initWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
    uint64_t v5 = *(unsigned int *)(a1 + 8);
  }
  else
  {
    v7 = 0;
  }
  os_unfair_lock_unlock(v4);
  if (a2) {
    *a2 = v7;
  }

  return v5;
}

- (NSString)ef_publicDescription
{
  if (self
    && (BOOL filePathIsSensitive = self->_filePathIsSensitive, self = (_EFProtectedFile *)self->_filePath,
                                                          filePathIsSensitive))
  {
    v3 = [(_EFProtectedFile *)self pathComponents];
    v4 = +[EFDevice currentDevice];
    if ([v4 isInternal])
    {
      uint64_t v5 = [v3 lastObject];
      +[EFPrivacy partiallyRedactedStringForString:v5];
    }
    else
    {
      uint64_t v5 = [v3 lastObject];
      +[EFPrivacy fullyRedactedStringForString:v5];
    v7 = };

    id v6 = (_EFProtectedFile *)[[NSString alloc] initWithFormat:@"<depth=%lu>/%@", objc_msgSend(v3, "count") - 1, v7];
  }
  else
  {
    id v6 = self;
  }
  return (NSString *)v6;
}

- (void).cxx_destruct
{
}

@end