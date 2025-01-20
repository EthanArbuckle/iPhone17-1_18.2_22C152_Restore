@interface CUKeyValueStoreReader
- (BOOL)enumerateKeyType:(Class)a3 valueType:(Class)a4 error:(id *)a5 handler:(id)a6;
- (BOOL)enumerateKeysAndValuesAndReturnError:(id *)a3 handler:(id)a4;
- (BOOL)enumerateValuesForKey:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)enumerateValuesForKey:(id)a3 valueType:(Class)a4 error:(id *)a5 handler:(id)a6;
- (BOOL)openAtPath:(id)a3 error:(id *)a4;
- (BOOL)valueExistsForKey:(id)a3;
- (CUKeyValueStoreReader)init;
- (CUKeyValueStoreReader)initWithKeyType:(Class)a3 valueType:(Class)a4;
- (id)_readObjectAtOffset:(unsigned int)a3 length:(unsigned int)a4 type:(Class)a5 error:(id *)a6;
- (id)valueForKey:(id)a3 error:(id *)a4;
- (id)valueForKey:(id)a3 valueType:(Class)a4 error:(id *)a5;
- (void)close;
- (void)dealloc;
@end

@implementation CUKeyValueStoreReader

- (id)valueForKey:(id)a3 valueType:(Class)a4 error:(id *)a5
{
  unint64_t v50 = 0;
  id v8 = a3;
  id v49 = 0;
  v9 = (unsigned __int8 *)[v8 encodedBytesAndReturnLength:&v50 error:&v49];
  id v10 = v49;
  v16 = v10;
  if (v9)
  {
    id v17 = 0;
    unint64_t v18 = v50;
    goto LABEL_3;
  }
  if (v10)
  {
    if (a5)
    {
LABEL_11:
      id v22 = v16;
      v16 = v22;
      id v17 = 0;
      goto LABEL_12;
    }
    goto LABEL_30;
  }
  id v48 = 0;
  v33 = [v8 encodedDataAndReturnError:&v48];
  id v34 = v48;
  v16 = v34;
  if (!v33)
  {
    if (a5)
    {
      if (v34) {
        goto LABEL_11;
      }
      NSErrorWithOSStatusF(4294960534, (uint64_t)"Encode key failed", v35, v36, v37, v38, v39, v40, v47);
      id v44 = objc_claimAutoreleasedReturnValue();
      *a5 = v44;
    }
LABEL_30:
    id v17 = 0;
    goto LABEL_31;
  }
  id v17 = v33;
  v9 = (unsigned __int8 *)[v17 bytes];
  unint64_t v18 = [v17 length];
  unint64_t v50 = v18;
LABEL_3:
  if (HIDWORD(v18))
  {
    if (a5)
    {
      uint64_t v47 = v18;
      v19 = "Key too big %zu vs %u";
      uint64_t v20 = 4294960591;
LABEL_6:
      NSErrorWithOSStatusF(v20, (uint64_t)v19, v18, v11, v12, v13, v14, v15, v47);
      v21 = LABEL_7:;
LABEL_8:
      id v22 = v21;
LABEL_12:
      v23 = 0;
      *a5 = v22;
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  if (self->_fd < 0)
  {
    if (a5)
    {
      v21 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960551, (uint64_t)"Not opened", v11, v12, v13, v14, v15, v47);
      goto LABEL_8;
    }
    goto LABEL_31;
  }
  self->_cdb.loop = 0;
  if ((int)cdb_findnext(&self->_cdb, v9, v18) <= 0)
  {
    if (a5)
    {
      v23 = 0;
      *a5 = 0;
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  size_t dlen = self->_cdb.dlen;
  if (dlen)
  {
    v25 = (char *)malloc_type_malloc(self->_cdb.dlen, 0x85F21751uLL);
    if (v25)
    {
      v26 = v25;
      if (cdb_read((uint64_t)&self->_cdb, v25, dlen, self->_cdb.dpos))
      {
        free(v26);
        if (a5)
        {
          NSErrorWithOSStatusF(4294960550, (uint64_t)"Read failed (%d)", v27, v28, v29, v30, v31, v32, 0xFFFFFFFFLL);
          goto LABEL_7;
        }
        goto LABEL_31;
      }
      v23 = [(objc_class *)a4 createWithBytesNoCopy:v26 length:dlen error:a5];
      if (v23) {
        goto LABEL_38;
      }
      v43 = v26;
LABEL_43:
      free(v43);
      goto LABEL_44;
    }
    if (a5)
    {
      uint64_t v47 = dlen;
      v19 = "malloc %zu bytes failed";
LABEL_41:
      uint64_t v20 = 4294960568;
      goto LABEL_6;
    }
    goto LABEL_31;
  }
  v41 = (char *)malloc_type_malloc(1uLL, 0x3A43D0FFuLL);
  if (!v41)
  {
    if (a5)
    {
      v19 = "malloc 1 byte failed";
      goto LABEL_41;
    }
LABEL_31:
    v23 = 0;
    goto LABEL_32;
  }
  v42 = v41;
  v23 = [(objc_class *)a4 createWithBytesNoCopy:v41 length:0 error:a5];
  if (!v23)
  {
    v43 = v42;
    goto LABEL_43;
  }
LABEL_38:
  id v46 = v23;
LABEL_44:

LABEL_32:
  return v23;
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = self->_valueType;
  if (v13)
  {
    uint64_t v14 = [(CUKeyValueStoreReader *)self valueForKey:v6 valueType:v13 error:a4];
  }
  else if (a4)
  {
    NSErrorWithOSStatusF(4294960551, (uint64_t)"Unknown value type", v7, v8, v9, v10, v11, v12, v16);
    uint64_t v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)valueExistsForKey:(id)a3
{
  unint64_t v14 = 0;
  id v4 = a3;
  id v13 = 0;
  v5 = (unsigned __int8 *)[v4 encodedBytesAndReturnLength:&v14 error:&v13];
  id v6 = v13;
  id v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      id v8 = 0;
    }
    else
    {
      id v12 = 0;
      id v8 = [v4 encodedDataAndReturnError:&v12];
      id v7 = v12;
      if (v8)
      {
        id v8 = v8;
        v5 = (unsigned __int8 *)[v8 bytes];
        unint64_t v9 = [v8 length];
        unint64_t v14 = v9;
        goto LABEL_3;
      }
    }
LABEL_8:
    BOOL v10 = 0;
    goto LABEL_9;
  }
  id v8 = 0;
  unint64_t v9 = v14;
LABEL_3:
  if (HIDWORD(v9) || self->_fd < 0) {
    goto LABEL_8;
  }
  self->_cdb.loop = 0;
  BOOL v10 = (int)cdb_findnext(&self->_cdb, v5, v9) > 0;
LABEL_9:

  return v10;
}

- (BOOL)enumerateValuesForKey:(id)a3 valueType:(Class)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (void (**)(id, void *, unsigned char *))a6;
  unint64_t v42 = 0;
  id v12 = v10;
  id v41 = 0;
  id v13 = (unsigned __int8 *)[v12 encodedBytesAndReturnLength:&v42 error:&v41];
  id v14 = v41;
  uint64_t v20 = v14;
  if (v13)
  {
    id v21 = 0;
    unint64_t v22 = v42;
    goto LABEL_3;
  }
  if (v14)
  {
    if (a5)
    {
LABEL_9:
      id v24 = v20;
      uint64_t v20 = v24;
      id v21 = 0;
      goto LABEL_10;
    }
    goto LABEL_26;
  }
  id v40 = 0;
  uint64_t v28 = [v12 encodedDataAndReturnError:&v40];
  id v29 = v40;
  uint64_t v20 = v29;
  if (!v28)
  {
    if (a5)
    {
      if (v29) {
        goto LABEL_9;
      }
      NSErrorWithOSStatusF(4294960534, (uint64_t)"Encode key failed", v30, v31, v32, v33, v34, v35, v38);
      id v36 = objc_claimAutoreleasedReturnValue();
      *a5 = v36;
    }
LABEL_26:
    id v21 = 0;
    goto LABEL_27;
  }
  id v21 = v28;
  id v13 = (unsigned __int8 *)[v21 bytes];
  unint64_t v22 = [v21 length];
  unint64_t v42 = v22;
LABEL_3:
  if (HIDWORD(v22))
  {
    if (a5)
    {
      v23 = NSErrorWithOSStatusF(4294960591, (uint64_t)"Key too big %zu vs %u", v22, v15, v16, v17, v18, v19, v22);
LABEL_6:
      id v24 = v23;
LABEL_10:
      BOOL v25 = 0;
      *a5 = v24;
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (self->_fd < 0)
  {
    if (a5)
    {
      v23 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960551, (uint64_t)"Not opened", v15, v16, v17, v18, v19, v38);
      goto LABEL_6;
    }
LABEL_27:
    BOOL v25 = 0;
    goto LABEL_28;
  }
  self->_cdb.loop = 0;
  if ((int)cdb_findnext(&self->_cdb, v13, v22) < 1)
  {
    BOOL v25 = 1;
    goto LABEL_28;
  }
  uint64_t v26 = [(CUKeyValueStoreReader *)self _readObjectAtOffset:self->_cdb.dpos length:self->_cdb.dlen type:a4 error:a5];
  if (!v26) {
    goto LABEL_27;
  }
  uint64_t v27 = (void *)v26;
  while (1)
  {
    char v39 = 0;
    v11[2](v11, v27, &v39);
    if (v39 || (int)cdb_findnext(&self->_cdb, v13, v42) < 1) {
      break;
    }

    uint64_t v27 = [(CUKeyValueStoreReader *)self _readObjectAtOffset:self->_cdb.dpos length:self->_cdb.dlen type:a4 error:a5];
    if (!v27)
    {
      BOOL v25 = 0;
      goto LABEL_28;
    }
  }

  BOOL v25 = 1;
LABEL_28:

  return v25;
}

- (BOOL)enumerateValuesForKey:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v16 = self->_valueType;
  if (v16)
  {
    BOOL v17 = [(CUKeyValueStoreReader *)self enumerateValuesForKey:v8 valueType:v16 error:a4 handler:v9];
  }
  else if (a4)
  {
    NSErrorWithOSStatusF(4294960551, (uint64_t)"Unknown value type", v10, v11, v12, v13, v14, v15, v19);
    BOOL v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)enumerateKeyType:(Class)a3 valueType:(Class)a4 error:(id *)a5 handler:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (void (**)(id, void *, uint64_t, unsigned char *))a6;
  if (self->_fd < 0)
  {
    if (a5)
    {
      uint64_t v33 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960551, (uint64_t)"Not opened", v8, v9, v10, v11, v12, v35);
      goto LABEL_17;
    }
    goto LABEL_22;
  }
  if (!cdb_read((uint64_t)&self->_cdb, (char *)__dst, 4uLL, 0))
  {
    unsigned int v21 = __dst[0];
    if (__dst[0] < 0x801u)
    {
LABEL_24:
      BOOL v27 = 1;
      goto LABEL_25;
    }
    uint64_t v35 = (uint64_t)(v13 + 2);
    unsigned int v22 = 2048;
    while (!cdb_read((uint64_t)&self->_cdb, (char *)__dst, 8uLL, v22))
    {
      int v24 = __dst[0];
      uint64_t v23 = __dst[1];
      unsigned int v25 = v22 + 8;
      uint64_t v26 = [(CUKeyValueStoreReader *)self _readObjectAtOffset:v22 + 8 length:__dst[0] type:a3 error:a5];
      BOOL v27 = v26 != 0;
      if (!v26) {
        goto LABEL_25;
      }
      uint64_t v28 = (void *)v26;
      int v29 = v24 + v25;
      uint64_t v30 = [(CUKeyValueStoreReader *)self _readObjectAtOffset:v24 + v25 length:v23 type:a4 error:a5];
      if (!v30)
      {

        goto LABEL_22;
      }
      uint64_t v31 = (void *)v30;
      char v38 = 0;
      v13[2](v13, v28, v30, &v38);
      if (v38)
      {

        goto LABEL_24;
      }
      unsigned int v22 = v23 + v29;

      if (v22 >= v21) {
        goto LABEL_24;
      }
    }
    if (!a5) {
      goto LABEL_22;
    }
    if (*__error()) {
      uint64_t v20 = *__error();
    }
    else {
      uint64_t v20 = 4294960596;
    }
    uint64_t v32 = "Read key/value lengths failed";
    goto LABEL_16;
  }
  if (!a5)
  {
LABEL_22:
    BOOL v27 = 0;
    goto LABEL_25;
  }
  if (*__error()) {
    uint64_t v20 = *__error();
  }
  else {
    uint64_t v20 = 4294960596;
  }
  uint64_t v32 = "Read header failed";
LABEL_16:
  uint64_t v33 = NSErrorWithOSStatusF(v20, (uint64_t)v32, v14, v15, v16, v17, v18, v19, v35);
LABEL_17:
  BOOL v27 = 0;
  *a5 = v33;
LABEL_25:

  return v27;
}

- (BOOL)enumerateKeysAndValuesAndReturnError:(id *)a3 handler:(id)a4
{
  id v6 = a4;
  uint64_t v13 = self->_keyType;
  if (v13)
  {
    uint64_t v20 = self->_valueType;
    if (v20)
    {
      BOOL v21 = [(CUKeyValueStoreReader *)self enumerateKeyType:v13 valueType:v20 error:a3 handler:v6];
    }
    else if (a3)
    {
      NSErrorWithOSStatusF(4294960551, (uint64_t)"Unknown value type", v14, v15, v16, v17, v18, v19, v23);
      BOOL v21 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else if (a3)
  {
    NSErrorWithOSStatusF(4294960551, (uint64_t)"Unknown key type", v7, v8, v9, v10, v11, v12, v23);
    BOOL v21 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)_readObjectAtOffset:(unsigned int)a3 length:(unsigned int)a4 type:(Class)a5 error:(id *)a6
{
  size_t v8 = *(void *)&a4;
  if (a4 <= 1) {
    size_t v11 = 1;
  }
  else {
    size_t v11 = a4;
  }
  uint64_t v12 = (char *)malloc_type_malloc(v11, 0xB7DA8181uLL);
  if (v12)
  {
    uint64_t v19 = v12;
    if (!cdb_read((uint64_t)&self->_cdb, v12, v8, a3))
    {
      uint64_t v28 = [(objc_class *)a5 createWithBytesNoCopy:v19 length:v8 error:a6];
      BOOL v27 = v28;
      if (v28) {
        id v29 = v28;
      }
      else {
        free(v19);
      }

      goto LABEL_19;
    }
    free(v19);
    if (a6)
    {
      if (*__error()) {
        uint64_t v26 = *__error();
      }
      else {
        uint64_t v26 = 4294960596;
      }
      NSErrorWithOSStatusF(v26, (uint64_t)"Read bytes failed", v20, v21, v22, v23, v24, v25, v31);
      goto LABEL_16;
    }
LABEL_11:
    BOOL v27 = 0;
    goto LABEL_19;
  }
  if (!a6) {
    goto LABEL_11;
  }
  NSErrorWithOSStatusF(4294960568, (uint64_t)"malloc %zu bytes failed", v13, v14, v15, v16, v17, v18, v8);
LABEL_16:
  BOOL v27 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
  return v27;
}

- (void)close
{
  map = self->_cdb.map;
  if (map)
  {
    munmap(map, self->_cdb.size);
    self->_cdb.map = 0;
  }
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    if (close(fd))
    {
      if (*__error()) {
        __error();
      }
    }
    self->_int fd = -1;
  }
}

- (BOOL)openAtPath:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 UTF8String];
  if (!v6)
  {
    if (a4)
    {
      uint64_t v20 = "No file path";
      uint64_t v21 = 4294960592;
LABEL_20:
      NSErrorWithOSStatusF(v21, (uint64_t)v20, v7, v8, v9, v10, v11, v12, v23);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a4 = v22;
      return result;
    }
    return 0;
  }
  uint64_t v13 = (const char *)v6;
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    if (close(fd) && *__error()) {
      __error();
    }
    self->_int fd = -1;
  }
  int v15 = open(v13, 0);
  self->_int fd = v15;
  if ((v15 & 0x80000000) == 0) {
    goto LABEL_8;
  }
  if (!*__error())
  {
    uint64_t v21 = 4294960596;
    if (a4) {
      goto LABEL_19;
    }
    return 0;
  }
  uint64_t v21 = *__error();
  if (v21)
  {
    if (a4)
    {
LABEL_19:
      uint64_t v23 = (uint64_t)v13;
      uint64_t v20 = "Open file '%s' failed";
      goto LABEL_20;
    }
    return 0;
  }
LABEL_8:
  map = self->_cdb.map;
  if (map)
  {
    munmap(map, self->_cdb.size);
    self->_cdb.map = 0;
  }
  int v17 = self->_fd;
  memset(&v24, 0, sizeof(v24));
  self->_cdb.loop = 0;
  self->_cdb.int fd = v17;
  if (!fstat(v17, &v24) && v24.st_size <= 0xFFFFFFFFLL)
  {
    uint64_t v18 = (char *)mmap(0, v24.st_size, 1, 1, v17, 0);
    self->_cdb.size = v24.st_size;
    self->_cdb.map = v18;
  }
  return 1;
}

- (void)dealloc
{
  map = self->_cdb.map;
  if (map)
  {
    munmap(map, self->_cdb.size);
    self->_cdb.map = 0;
  }
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    if (close(fd) && *__error()) {
      __error();
    }
    self->_int fd = -1;
  }
  v5.receiver = self;
  v5.super_class = (Class)CUKeyValueStoreReader;
  [(CUKeyValueStoreReader *)&v5 dealloc];
}

- (CUKeyValueStoreReader)initWithKeyType:(Class)a3 valueType:(Class)a4
{
  uint64_t v6 = [(CUKeyValueStoreReader *)self init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_keyType = a3;
    v6->_valueType = a4;
    uint64_t v8 = v6;
  }

  return v7;
}

- (CUKeyValueStoreReader)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUKeyValueStoreReader;
  v2 = [(CUKeyValueStoreReader *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_int fd = -1;
    id v4 = v2;
  }

  return v3;
}

@end