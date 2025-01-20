@interface NSBinaryObjectStoreFile
- (BOOL)_writeMetadataData:(id)a3 andMapDataData:(id)a4 toFile:(id)a5 error:(id *)a6;
- (BOOL)writeMetadataToFile:(id *)a3 error:;
- (uint64_t)readFromFile:(void *)a3 error:;
- (uint64_t)readMetadataFromFile:(int)a3 securely:(void *)a4 error:;
- (void)clearCurrentValues;
- (void)dealloc;
- (void)writeToFile:(uint64_t)a3 error:;
@end

@implementation NSBinaryObjectStoreFile

- (void)dealloc
{
  self->_fullMetadata = 0;
  self->_mapData = 0;

  self->_storeOptions = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBinaryObjectStoreFile;
  [(NSBinaryObjectStoreFile *)&v3 dealloc];
}

- (void)clearCurrentValues
{
  *(_DWORD *)(a1 + 8) = 0;
  if (*(void *)(a1 + 16))
  {
    uint64_t v2 = [0 copy];

    *(void *)(a1 + 16) = v2;
  }
  *(void *)(a1 + 24) = 0;

  -[NSXPCStoreServerConnectionContext setActiveStore:](a1, 0);
}

- (uint64_t)readFromFile:(void *)a3 error:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  -[NSBinaryObjectStoreFile clearCurrentValues](a1);
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:a2 options:1 error:a3];
  if (!v6) {
    return 0;
  }
  v7 = v6;
  unint64_t v8 = [v6 length];
  if (v8)
  {
    if (v8 <= 0x3F)
    {

      if (a3)
      {
        id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v10 = objc_msgSend(v9, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F28328], 0);
        v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = *MEMORY[0x1E4F281F8];
        uint64_t v13 = 259;
LABEL_11:
        *a3 = [v11 errorWithDomain:v12 code:v13 userInfo:v10];

        return 0;
      }
      return 0;
    }
    if (*(void *)[v7 bytes] != 0x6174614465726F43)
    {

      if (a3)
      {
        id v15 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v10 = objc_msgSend(v15, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F28328], 0);
        v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = *MEMORY[0x1E4F281F8];
        uint64_t v13 = 134000;
        goto LABEL_11;
      }
      return 0;
    }
    if ((unint64_t)[v7 length] > 0x3F)
    {
      id v53 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      if (byte_1EB270AB6)
      {
        v19 = (void *)[*(id *)(a1 + 40) objectForKey:@"_NSBinaryStoreInsecureDecodingCompatibilityOption"];
        if (v19) {
          int v20 = [v19 BOOLValue] ^ 1;
        }
        else {
          int v20 = 1;
        }
      }
      else
      {
        int v20 = 0;
      }
      id v54 = 0;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      *(int8x8_t *)&double v21 = SetHostHeaderWithBigHeader((uint64_t)&v57, [v7 bytes]);
      BOOL v14 = DWORD2(v57) == 1;
      if (DWORD2(v57) == 1)
      {
        *(_DWORD *)(a1 + 8) = HIDWORD(v57);
        uint64_t v22 = objc_msgSend(v7, "subdataWithRange:", v58, v21);
        v23 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v22 error:&v54];
        if (v54)
        {
          uint64_t v41 = [v54 code];
          uint64_t v55 = *MEMORY[0x1E4F28A50];
          id v56 = v54;
          v42 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          id v43 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F28460], v41, @"Keyed archiver failure", v42);
          objc_exception_throw(v43);
        }
        id v24 = (id)+[_PFRoutines plistClassesForSecureCoding]();
        if (v20)
        {
          [v23 setRequiresSecureCoding:1];
          [v23 _allowDecodingCyclesInSecureMode];
          uint64_t v25 = [*(id *)(a1 + 40) objectForKey:@"NSBinaryStoreSecureDecodingClasses"];
          if (v25)
          {
            id v24 = (id)[v24 mutableCopy];
            [v24 unionSet:v25];
          }
        }
        else
        {
          [v23 setRequiresSecureCoding:0];
        }
        [v23 setDecodingFailurePolicy:1];
        v30 = (void *)[v23 decodeObjectOfClasses:v24 forKey:@"metadata"];
        if ([v23 error])
        {
          id v54 = (id)[v23 error];
          uint64_t v44 = [v54 code];
          uint64_t v55 = *MEMORY[0x1E4F28A50];
          id v56 = v54;
          v45 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          id v46 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F28460], v44, @"Keyed archiver failure", v45);
          objc_exception_throw(v46);
        }
        [v23 finishDecoding];

        if (*(void **)(a1 + 16) != v30)
        {
          uint64_t v31 = [v30 copy];

          *(void *)(a1 + 16) = v31;
        }
        uint64_t v32 = *((void *)&v59 + 1);
        *(void *)(a1 + 24) = v60;
        uint64_t v33 = objc_msgSend(v7, "subdataWithRange:", (void)v59, v32);
        v34 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v33 error:&v54];
        if (v54)
        {
          uint64_t v47 = [v54 code];
          uint64_t v55 = *MEMORY[0x1E4F28A50];
          id v56 = v54;
          v48 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          id v49 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F28460], v47, @"Keyed archiver failure", v48);
          objc_exception_throw(v49);
        }
        id v35 = (id)+[NSBinaryObjectStore _classesForPropertyValues]();
        if (v20)
        {
          [v34 setRequiresSecureCoding:1];
          [v34 _allowDecodingCyclesInSecureMode];
          uint64_t v36 = [*(id *)(a1 + 40) objectForKey:@"NSBinaryStoreSecureDecodingClasses"];
          if (v36)
          {
            id v35 = (id)[v35 mutableCopy];
            [v35 unionSet:v36];
          }
        }
        else
        {
          [v34 setRequiresSecureCoding:0];
        }
        [v34 setDecodingFailurePolicy:1];
        v37 = (void *)[v34 decodeObjectOfClasses:v35 forKey:@"mapData"];
        if ([v34 error])
        {
          id v54 = (id)[v34 error];
          uint64_t v50 = [v54 code];
          uint64_t v55 = *MEMORY[0x1E4F28A50];
          id v56 = v54;
          v51 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          id v52 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F28460], v50, @"Keyed archiver failure", v51);
          objc_exception_throw(v52);
        }
        [v34 finishDecoding];

        -[NSXPCStoreServerConnectionContext setActiveStore:](a1, v37);
        v29 = 0;
      }
      else if (a3)
      {
        id v26 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v27 = objc_msgSend(v26, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F28328], 0);
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        v29 = (void *)[v28 initWithDomain:*MEMORY[0x1E4F281F8] code:134000 userInfo:v27];
      }
      else
      {
        v29 = 0;
      }
      id v38 = v29;

      [v53 drain];
      id v39 = 0;
      id v40 = v29;
      if (a3 && v29) {
        *a3 = v29;
      }
    }
    else
    {
      if (a3)
      {
        id v17 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v18 = objc_msgSend(v17, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F28328], 0);
        *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:v18];
      }
      BOOL v14 = 0;
    }
  }
  else
  {

    return 1;
  }
  return v14;
}

- (BOOL)writeMetadataToFile:(id *)a3 error:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v25 = 0;
  v7 = (void *)[MEMORY[0x1E4F28CB0] fileHandleForUpdatingAtPath:a2];
  if (!v7)
  {
    [v6 drain];
    if (a3)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      uint64_t v13 = objc_msgSend(v12, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F28328], 0);
      *a3 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:v13];
    }
    return 0;
  }
  unint64_t v8 = v7;
  id v9 = (void *)[v7 readDataOfLength:64];
  if (*(void *)[v9 bytes] != 0x6174614465726F43)
  {
    if (a3)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F28328], 0);
      id v25 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134000 userInfo:v11];
    }
LABEL_13:
    int v19 = 0;
    goto LABEL_14;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  memset(v26, 0, sizeof(v26));
  *(int8x8_t *)&double v15 = SetHostHeaderWithBigHeader((uint64_t)v26, [v9 bytes]);
  if (DWORD2(v26[0]) != 1)
  {
    if (a3)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      double v21 = objc_msgSend(v20, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F28328], 0);
      id v25 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134000 userInfo:v21];
    }
    goto LABEL_13;
  }
  objc_msgSend(v8, "seekToFileOffset:", (void)v27, v15);
  uint64_t v16 = [v8 readDataOfLength:*((void *)&v27 + 1)];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:512];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initForWritingWithMutableData:v17];
  [v18 encodeObject:a1[2] forKey:@"metadata"];
  [v18 finishEncoding];

  int v19 = [a1 _writeMetadataData:v17 andMapDataData:v16 toFile:a2 error:&v25];
LABEL_14:
  BOOL v14 = v19 != 0;
  id v22 = v25;
  [v8 closeFile];
  [v6 drain];
  id v23 = v25;
  if (a3 && v25) {
    *a3 = v25;
  }
  return v14;
}

- (uint64_t)readMetadataFromFile:(int)a3 securely:(void *)a4 error:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
LABEL_9:
    char v18 = 0;
    return v18 & 1;
  }
  -[NSBinaryObjectStoreFile clearCurrentValues](a1);
  id v8 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v9 = (void *)[MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:a2];
  if (!v9)
  {
    [v8 drain];
    if (a4)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v17 = objc_msgSend(v16, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F28328], 0);
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:v17];
    }
    goto LABEL_9;
  }
  id v10 = v9;
  id v46 = 0;
  v11 = (void *)[v9 readDataOfLength:64];
  unint64_t v12 = [v11 length];
  if (!v12)
  {
    double v15 = 0;
    int v19 = 0;
    int v20 = 1;
    char v47 = 1;
    goto LABEL_40;
  }
  if (v12 <= 0x3F)
  {
    if (a4)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      BOOL v14 = objc_msgSend(v13, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F28328], 0);
      double v15 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:v14];
    }
    else
    {
      double v15 = 0;
    }
    int v19 = 0;
    char v47 = 0;
LABEL_16:
    int v20 = 1;
    goto LABEL_40;
  }
  if (*(void *)[v11 bytes] != 0x6174614465726F43)
  {
    if (a4)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v22 = objc_msgSend(v21, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F28328], 0);
      double v15 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134000 userInfo:v22];
    }
    else
    {
      double v15 = 0;
    }
    int v20 = 0;
    int v19 = 0;
    goto LABEL_40;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  *(int8x8_t *)&double v23 = SetHostHeaderWithBigHeader((uint64_t)&v52, [v11 bytes]);
  if (DWORD2(v52) == 1)
  {
    *(_DWORD *)(a1 + 8) = HIDWORD(v52);
    uint64_t v24 = v53;
    *(void *)(a1 + 24) = v55;
    objc_msgSend(v10, "seekToFileOffset:", v24, v23);
    id v25 = (void *)[v10 readDataOfLength:*((void *)&v53 + 1)];
    uint64_t v26 = [v25 length];
    if (v26 != *((void *)&v53 + 1))
    {
      if (a4)
      {
        id v32 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        uint64_t v33 = objc_msgSend(v32, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F28328], 0);
        double v15 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:v33];
      }
      else
      {
        double v15 = 0;
      }
      char v47 = 0;
      int v19 = 0;
      goto LABEL_16;
    }
    long long v27 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v25 error:&v46];
    if (v46)
    {
      uint64_t v40 = [v46 code];
      uint64_t v50 = *MEMORY[0x1E4F28A50];
      id v51 = v46;
      uint64_t v41 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      id v42 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F28460], v40, @"Keyed archiver failure", v41);
      objc_exception_throw(v42);
    }
    id v28 = (id)+[_PFRoutines plistClassesForSecureCoding]();
    if (a3)
    {
      [v27 setRequiresSecureCoding:1];
      [v27 _allowDecodingCyclesInSecureMode];
      uint64_t v29 = [*(id *)(a1 + 40) valueForKey:@"NSBinaryStoreSecureDecodingClasses"];
      if (v29)
      {
        id v28 = (id)[v28 mutableCopy];
        [v28 unionSet:v29];
      }
    }
    else
    {
      [v27 setRequiresSecureCoding:0];
    }
    [v27 setDecodingFailurePolicy:1];
    v34 = (void *)[v27 decodeObjectOfClasses:v28 forKey:@"metadata"];
    if ([v27 error])
    {
      id v46 = (id)[v27 error];
      uint64_t v43 = [v46 code];
      uint64_t v48 = *MEMORY[0x1E4F28A50];
      id v49 = v46;
      uint64_t v44 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      id v45 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F28460], v43, @"Keyed archiver failure", v44);
      objc_exception_throw(v45);
    }
    [v27 finishDecoding];

    if (*(void **)(a1 + 16) == v34)
    {
      double v15 = 0;
    }
    else
    {
      uint64_t v35 = [v34 copy];

      double v15 = 0;
      *(void *)(a1 + 16) = v35;
    }
    int v19 = 1;
  }
  else
  {
    if (a4)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      uint64_t v31 = objc_msgSend(v30, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E4F28328], 0);
      double v15 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134000 userInfo:v31];
    }
    else
    {
      double v15 = 0;
    }
    int v19 = 0;
  }
  int v20 = 0;
LABEL_40:
  BOOL v36 = v19 != 0;
  id v37 = v15;
  [v10 closeFile];
  [v8 drain];
  id v38 = v15;
  if (a4 && v15) {
    *a4 = v15;
  }
  char v18 = v47;
  if (!v20) {
    char v18 = v36;
  }
  return v18 & 1;
}

- (BOOL)_writeMetadataData:(id)a3 andMapDataData:(id)a4 toFile:(id)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v36 = 0;
  id v11 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v37 = 0x6174614465726F43;
  int v38 = 0x1000000;
  if (self) {
    unsigned int databaseVersion = self->_databaseVersion;
  }
  else {
    unsigned int databaseVersion = 0;
  }
  long long v44 = 0u;
  unsigned int v39 = bswap32(databaseVersion);
  unint64_t v40 = bswap64([a4 length] + 64);
  unint64_t v41 = bswap64([a3 length]);
  uint64_t v42 = 0x4000000000000000;
  unint64_t v43 = bswap64([a4 length]);
  if (self) {
    unint64_t primaryKeyGeneration = self->_primaryKeyGeneration;
  }
  else {
    unint64_t primaryKeyGeneration = 0;
  }
  long long v44 = bswap64(primaryKeyGeneration);
  uint64_t v14 = [a4 length];
  uint64_t v15 = [a3 length];
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v14 + v15 + 64];
  [v16 appendBytes:&v37 length:64];
  [v16 appendData:a4];
  [v16 appendData:a3];
  id v17 = [(NSDictionary *)self->_storeOptions valueForKey:@"NSPersistentStoreFileProtectionKey"];
  if (v17)
  {
    if ([(id)*MEMORY[0x1E4F28378] isEqualToString:v17])
    {
      uint64_t v18 = 268435457;
    }
    else if ([(id)*MEMORY[0x1E4F28358] isEqualToString:v17])
    {
      uint64_t v18 = 1073741825;
    }
    else if ([(id)*MEMORY[0x1E4F28348] isEqualToString:v17])
    {
      uint64_t v18 = 805306369;
    }
    else if ([(id)*MEMORY[0x1E4F28340] isEqualToString:v17])
    {
      uint64_t v18 = 536870913;
    }
    else
    {
      uint64_t v18 = 1;
      _NSCoreDataLog(1, @"Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey", v19, v20, v21, v22, v23, v24, (uint64_t)v17);
    }
  }
  else if (BYTE5(z9dsptsiQ80etb9782fsrs98bfdle88))
  {
    uint64_t v18 = 1073741825;
  }
  else
  {
    uint64_t v18 = 1;
  }
  char v25 = [v16 writeToFile:a5 options:v18 error:&v36];
  if ((v25 & 1) == 0)
  {
    id v26 = v36;
    [v36 userInfo];
    _NSCoreDataLog(1, @"Binary store: writeToFile error = %@ and userInfo = %@", v27, v28, v29, v30, v31, v32, (uint64_t)v26);
  }

  id v33 = v36;
  [v11 drain];
  if (v36)
  {
    id v34 = v36;
    if (a6) {
      *a6 = v36;
    }
  }
  return v25;
}

- (void)writeToFile:(uint64_t)a3 error:
{
  if (result)
  {
    v5 = result;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:512];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initForWritingWithMutableData:v6];
    [v7 encodeObject:v5[2] forKey:@"metadata"];
    [v7 finishEncoding];

    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:4096];
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initForWritingWithMutableData:v8];
    [v9 encodeObject:v5[4] forKey:@"mapData"];
    [v9 finishEncoding];

    uint64_t v10 = [v5 _writeMetadataData:v6 andMapDataData:v8 toFile:a2 error:a3];
    return (void *)v10;
  }
  return result;
}

@end