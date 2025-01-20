@interface MLModelEncryptionUtils
+ (BOOL)addEncryptionHeaderToUnencryptedFile:(id)a3 saveToFile:(id)a4 error:(id *)a5;
+ (BOOL)encryptFile:(id)a3 withKey:(id)a4 iv:(id)a5 saveToFile:(id)a6 error:(id *)a7;
+ (NSData)sinfData;
@end

@implementation MLModelEncryptionUtils

+ (BOOL)encryptFile:(id)a3 withKey:(id)a4 iv:(id)a5 saveToFile:(id)a6 error:(id *)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v45 = a6;
  if ([v11 length] == 16)
  {
    if (!v12 || [v12 length] == 16)
    {
      id v13 = [v10 path];
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v13 fileSystemRepresentation]);
      Archiver::MMappedFile::MMappedFile((uint64_t)v48, (long long *)__p);
      if ((v52[7] & 0x80000000) != 0) {
        operator delete(__p[0]);
      }

      id v14 = v45;
      int v15 = open((const char *)[v14 fileSystemRepresentation], 514, 420);
      if (v15 == -1)
      {
        if (a7)
        {
          +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelEncryptionErrorWithUnderlyingError:format:", 0, @"Error creating file %s", [v14 fileSystemRepresentation]);
          BOOL v24 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:
          Archiver::MMappedFile::~MMappedFile((Archiver::MMappedFile *)v48);
          goto LABEL_41;
        }
      }
      else
      {
        size_t v16 = (size_t)v50;
        uint64_t v43 = v49;
        unint64_t v17 = (unint64_t)v50 + 4191;
        memset(&v52[8], 0, 72);
        __p[0] = (void *)0x60000002454E4D4CLL;
        __p[1] = v50;
        *(void *)v52 = ((unint64_t)v50 + 4191) >> 12;
        unint64_t v40 = *(void *)v52;
        int __fd = v15;
        id v38 = v11;
        id v39 = v10;
        id v37 = v12;
        write(v15, __p, 0x50uLL);
        v18 = malloc_type_calloc(0x1000uLL, 1uLL, 0xFA1CA6B1uLL);
        dataOut = (char *)malloc_type_calloc(0x1000uLL, 1uLL, 0x654FC242uLL);
        id v20 = v11;
        v42 = (const void *)[v20 bytes];
        v41 = (const void *)[v12 bytes];
        uint64_t v21 = [v20 length];
        if (v17 < 0x1000)
        {
          uint64_t v22 = 0;
LABEL_32:
          id v11 = v38;
          id v10 = v39;
          id v12 = v37;
          write(__fd, (const void *)(v43 + v22), v16 - v22);
          free(v18);
          free(dataOut);
          close(__fd);
          BOOL v24 = 1;
          goto LABEL_40;
        }
        size_t v25 = v21;
        uint64_t v22 = 0;
        unsigned int v26 = 1;
        v27 = v18;
        while (1)
        {
          v28 = (const void *)(v43 + v22);
          size_t v47 = 0;
          bzero(v18, 0x1000uLL);
          if (v26 == 1)
          {
            long long v29 = *(_OWORD *)v52;
            _OWORD *v27 = *(_OWORD *)__p;
            v27[1] = v29;
            long long v30 = *(_OWORD *)&v52[16];
            long long v31 = *(_OWORD *)&v52[32];
            long long v32 = *(_OWORD *)&v52[64];
            v27[4] = *(_OWORD *)&v52[48];
            v27[5] = v32;
            v27[2] = v30;
            v27[3] = v31;
            v27 += 6;
            if (v16 > 0xF9F)
            {
              memcpy(v27, v28, 0xFA0uLL);
              size_t v33 = 4000;
            }
            else
            {
              memcpy(v27, v28, v16);
              size_t v33 = v16;
            }
          }
          else
          {
            if (v16 >= v22 + 4096) {
              size_t v33 = 4096;
            }
            else {
              size_t v33 = v16 - v22;
            }
            memcpy(v18, v28, v33);
          }
          if (CCCrypt(0, 0, 0, v42, v25, v41, v18, 0x1000uLL, dataOut, 0x1000uLL, &v47))
          {
            id v11 = v38;
            id v10 = v39;
            id v12 = v37;
            if (!a7) {
              goto LABEL_38;
            }
            v35 = @"Failed to encrypt data";
            goto LABEL_37;
          }
          if (v47 != 4096) {
            break;
          }
          if (v26 == 1) {
            write(__fd, dataOut + 80, 0xFB0uLL);
          }
          else {
            write(__fd, dataOut, 0x1000uLL);
          }
          v22 += v33;
          if (v40 <= v26++) {
            goto LABEL_32;
          }
        }
        id v11 = v38;
        id v10 = v39;
        id v12 = v37;
        if (!a7) {
          goto LABEL_38;
        }
        v35 = @"Encryption outputSize does not match outputWritten";
LABEL_37:
        *a7 = +[MLModelErrorUtils IOErrorWithFormat:v35];
LABEL_38:
        free(v18);
        free(dataOut);
        close(__fd);
      }
      BOOL v24 = 0;
      goto LABEL_40;
    }
    if (a7)
    {
      +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", @"IV is specified but it's length %lu does not match encryption block size %u", [v11 length], 16);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_14:
    BOOL v24 = 0;
    goto LABEL_41;
  }
  if (!a7) {
    goto LABEL_14;
  }
  +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", @"Key length %lu does not match encryption block size %u", [v11 length], 16);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
  BOOL v24 = 0;
  *a7 = v23;
LABEL_41:

  return v24;
}

+ (BOOL)addEncryptionHeaderToUnencryptedFile:(id)a3 saveToFile:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 filePathURL];
  id v10 = [v8 filePathURL];
  int v11 = [v9 isEqual:v10];

  if (!v11)
  {
    id v13 = [v7 path];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v13 fileSystemRepresentation]);
    Archiver::MMappedFile::MMappedFile((uint64_t)v23, &__p);
    if (SHIBYTE(v27) < 0) {
      operator delete((void *)__p);
    }

    id v14 = v8;
    int v15 = open((const char *)[v14 fileSystemRepresentation], 514, 420);
    int v16 = v15;
    if (v15 == -1)
    {
      if (a5)
      {
        +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelEncryptionErrorWithUnderlyingError:format:", 0, @"Error creating file %s", [v14 fileSystemRepresentation]);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
        BOOL v12 = 0;
        *a5 = v19;
        goto LABEL_20;
      }
    }
    else
    {
      v18 = v24;
      size_t v17 = v25;
      uint64_t v32 = 0;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      *(void *)&long long __p = 0x60000002454E4D4CLL;
      *((void *)&__p + 1) = v25;
      uint64_t v27 = 0;
      if (write(v15, &__p, 0x60uLL) == 96)
      {
        if (v17 == write(v16, v18, v17))
        {
          close(v16);
          BOOL v12 = 1;
LABEL_20:
          Archiver::MMappedFile::~MMappedFile((Archiver::MMappedFile *)v23);
          goto LABEL_21;
        }
        if (a5)
        {
          uint64_t v20 = [v14 fileSystemRepresentation];
          uint64_t v21 = @"Error saving data to %s";
          goto LABEL_17;
        }
      }
      else if (a5)
      {
        uint64_t v20 = [v14 fileSystemRepresentation];
        uint64_t v21 = @"Error saving ENML header to %s";
LABEL_17:
        +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelEncryptionErrorWithUnderlyingError:format:", 0, v21, v20);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    BOOL v12 = 0;
    goto LABEL_20;
  }
  if (a5)
  {
    +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:0, @"saveToFile URL (%@) should be different from fileURL (%@)", v8, v7 format];
    BOOL v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_21:

  return v12;
}

+ (NSData)sinfData
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"AAADgHNpbmYAAAAMZnJtYQAAAAAAAAAUc2NobQAAAABpdHVuAAAAAAAAA1hzY2hpAAAADHVzZXIAAAAAAAAADGtleSAAAAABAAAAGGl2aXbZofvYoEHG+Bnh6TFdS4nRAAAAWHJpZ2hwbGF0AAAAAnRyYW7aSnJxdG9vbEQ5OTltZWRpAAAAgG1vZGUAAAAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQhuYW1lAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAcBwcml2dHT7EFcJPPVjnUp9b53GcsqIfPZ2Zwq2GeQ3aigPDGVuD0OGm6NZEzuiK3dNectFh1Z5LE06hTFwi67WA/4z+7xXmX0aMBmYfYmL9dVVxwOKwJ1bpkkZkXyil21zxsKwHVn6ZSgegaKm9C5YQcyL/uY9aqYkLS2+qKVWyx/3pBVY1cAAPyNpVDBsNIpNGguNmEEA4l7IhB8Q+m1VAPCcxgngaFT6ztBjdUfseVYj3fh28t7NXhdQbZB7PNDxU2VToqvN2t1f6Gco/qc8fRXXGo12pLH346qDQezYMlbBS0w76GtyWoK+oLu3FTMjjCi7Kg1SyDDBbbDsg0RVMkyHhZ3TOFmwJklAYL7HxsWa+rCRM4Q4YOJobScLgeZ/7daGTAeX03OMT/iWgPHf+ejCVQGje+Mm+a8P5UzKpHhV9ruwF2usDUoynhmyIYr/EnrcUyQdPjLX8wG7BYMJMhh/vuaIfkwVt1M2kgFJ9T8Kz+JczEJSfLIwhW6Uy+ltyRrVnlaGfoPdrohv4P4FgaBuaUFSoKiXMuZr4IXhEHh9sCoAv6sSDIAFURgBX1wtn9HWAAAAAAAAAAA=" options:0];

  return (NSData *)v2;
}

@end