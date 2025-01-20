@interface CUKeyValueStoreWriter
- (BOOL)addKey:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)finishAndReturnError:(id *)a3;
- (BOOL)startAtPath:(id)a3 error:(id *)a4;
- (CUKeyValueStoreWriter)init;
- (void)cancel;
- (void)dealloc;
@end

@implementation CUKeyValueStoreWriter

- (void).cxx_destruct
{
}

- (BOOL)addKey:(id)a3 value:(id)a4 error:(id *)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v15 = a4;
  if (self->_cdbStarted)
  {
    unint64_t v82 = 0;
    id v16 = v8;
    id v81 = 0;
    v17 = (char *)[v16 encodedBytesAndReturnLength:&v82 error:&v81];
    id v18 = v81;
    v25 = v18;
    if (v17)
    {
      id v26 = 0;
      unint64_t v27 = v82;
      goto LABEL_4;
    }
    if (v18)
    {
      if (a5)
      {
LABEL_11:
        id v28 = v25;
        v25 = v28;
        BOOL v29 = 0;
        id v26 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      id v80 = 0;
      v41 = [v16 encodedDataAndReturnError:&v80];
      id v42 = v80;
      v25 = v42;
      if (v41)
      {
        id v26 = v41;
        v17 = (char *)[v26 bytes];
        unint64_t v27 = [v26 length];
        unint64_t v82 = v27;
LABEL_4:
        if (HIDWORD(v27))
        {
          if (!a5)
          {
            BOOL v29 = 0;
            goto LABEL_54;
          }
          NSErrorWithOSStatusF(4294960591, (uint64_t)"Key too big %zu vs %u", v19, v20, v21, v22, v23, v24, v27);
          id v28 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v29 = 0;
LABEL_12:
          *a5 = v28;
LABEL_54:

          goto LABEL_55;
        }
        unint64_t v79 = 0;
        id v30 = v15;
        id v78 = v25;
        v31 = (char *)[v30 encodedBytesAndReturnLength:&v79 error:&v78];
        id v32 = v78;

        if (v31)
        {
          id v39 = 0;
          unint64_t v40 = v79;
LABEL_15:
          if (!HIDWORD(v40))
          {
            id v75 = v39;
            size_t v51 = v82;
            int __src = v82;
            __int16 v84 = v40;
            char v85 = BYTE2(v40);
            char v86 = BYTE3(v40);
            uint64_t addend = buffer_putalign((uint64_t)&self->_cdb.b, (char *)&__src, 8uLL);
            if (addend != -1)
            {
              uint64_t addend = buffer_putalign((uint64_t)&self->_cdb.b, v17, v51);
              if (addend != -1)
              {
                uint64_t addend = buffer_putalign((uint64_t)&self->_cdb.b, v31, v40);
                if (addend != -1)
                {
                  if (v51)
                  {
                    int v59 = 5381;
                    int v60 = v51;
                    do
                    {
                      int v61 = *v17++;
                      int v59 = (33 * v59) ^ v61;
                      --v60;
                    }
                    while (v60);
                    int v62 = v51;
                    int v63 = v40;
                  }
                  else
                  {
                    int v62 = 0;
                    int v63 = v40;
                    int v59 = 5381;
                  }
                  uint64_t addend = cdb_make_addend((uint64_t)self->_cdb.bspace, v62, v63, v59);
                }
              }
            }
            BOOL v29 = addend == 0;
            id v39 = v75;
            if (!a5 || !addend) {
              goto LABEL_53;
            }
            NSErrorWithOSStatusF(addend, (uint64_t)"Add failed", v53, v54, v55, v56, v57, v58, v74);
            goto LABEL_51;
          }
          if (a5)
          {
            NSErrorWithOSStatusF(4294960591, (uint64_t)"Value too big %zu vs %u", v33, v34, v35, v36, v37, v38, v40);
LABEL_51:
            id v50 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v29 = 0;
            goto LABEL_52;
          }
          BOOL v29 = 0;
LABEL_53:

          v25 = v32;
          goto LABEL_54;
        }
        if (v32)
        {
          if (a5)
          {
            v49 = v32;
            goto LABEL_25;
          }
          BOOL v29 = 0;
        }
        else
        {
          id v77 = 0;
          v65 = [v30 encodedDataAndReturnError:&v77];
          id v76 = v77;
          if (v65)
          {
            id v39 = v65;
            v31 = (char *)[v39 bytes];
            unint64_t v40 = [v39 length];
            unint64_t v79 = v40;
            id v32 = v76;
            goto LABEL_15;
          }
          if (!a5)
          {
            BOOL v29 = 0;
            id v39 = 0;
            id v32 = v76;
            goto LABEL_53;
          }
          v49 = v76;
          if (v76)
          {
LABEL_25:
            id v50 = v49;
            id v32 = v50;
            BOOL v29 = 0;
            id v39 = 0;
LABEL_52:
            *a5 = v50;
            goto LABEL_53;
          }
          NSErrorWithOSStatusF(4294960534, (uint64_t)"Encode value failed", v66, v67, v68, v69, v70, v71, v74);
          id v72 = objc_claimAutoreleasedReturnValue();
          *a5 = v72;

          BOOL v29 = 0;
          id v32 = 0;
        }
        id v39 = 0;
        goto LABEL_53;
      }
      if (a5)
      {
        if (v42) {
          goto LABEL_11;
        }
        NSErrorWithOSStatusF(4294960534, (uint64_t)"Encode key failed", v43, v44, v45, v46, v47, v48, v74);
        id v64 = objc_claimAutoreleasedReturnValue();
        *a5 = v64;
      }
    }
    BOOL v29 = 0;
    id v26 = 0;
    goto LABEL_54;
  }
  if (a5)
  {
    NSErrorWithOSStatusF(4294960551, (uint64_t)"Not started", v9, v10, v11, v12, v13, v14, v74);
    BOOL v29 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_55:

  return v29;
}

- (void)cancel
{
  p_cdbStarted = &self->_cdbStarted;
  if (self->_cdbStarted)
  {
    split = self->_cdb.split;
    if (split)
    {
      free(split);
      self->_cdb.split = 0;
    }
    head = self->_cdb.head;
    if (head)
    {
      do
      {
        v6 = (cdb_hplist *)*((void *)head + 1000);
        free(head);
        self->_cdb.head = v6;
        head = v6;
      }
      while (v6);
    }
    BOOL *p_cdbStarted = 0;
  }
  int tempFD = self->_tempFD;
  if ((tempFD & 0x80000000) == 0)
  {
    if (close(tempFD) && *__error()) {
      __error();
    }
    self->_int tempFD = -1;
  }
  BOOL v9 = p_cdbStarted[20];
  id v8 = (const char *)(p_cdbStarted + 20);
  if (v9)
  {
    unlink(v8);
    *id v8 = 0;
  }
}

- (BOOL)finishAndReturnError:(id *)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  p_cdbStarted = &self->_cdbStarted;
  if (self->_cdbStarted)
  {
    p_cdb = &self->_cdb;
    bzero(self->_cdb.count, 0x400uLL);
    for (i = self->_cdb.head; i; i = (cdb_hplist *)*((void *)i + 1000))
    {
      uint64_t v8 = *((int *)i + 2002);
      if (v8)
      {
        uint64_t v9 = v8 - 1;
        uint64_t v10 = (unsigned __int8 *)i + 8 * v8 - 8;
        do
        {
          int v11 = *v10;
          v10 -= 8;
          ++p_cdb->count[v11];
        }
        while (v9--);
      }
    }
    uint64_t v13 = 0;
    v14.i64[0] = 0x100000001;
    v14.i64[1] = 0x100000001;
    do
    {
      uint32x4_t v14 = vmaxq_u32((uint32x4_t)vaddq_s32(*(int32x4_t *)&self->_cdb.count[v13], *(int32x4_t *)&self->_cdb.count[v13]), v14);
      v13 += 4;
    }
    while (v13 != 256);
    unsigned int v15 = vmaxvq_u32(v14);
    if ((self->_cdb.numentries + v15) >> 29)
    {
LABEL_10:
      *__error() = 12;
    }
    else
    {
      v17 = (cdb_hp *)malloc_type_malloc(8 * (self->_cdb.numentries + v15), 0x100004000313F17uLL);
      self->_cdb.split = v17;
      if (v17)
      {
        unsigned int v18 = 0;
        self->_cdb.hash = (cdb_hp *)((char *)v17 + 8 * self->_cdb.numentries);
        uint64_t v19 = 0x3FFFFFFFFFFFFF00;
        do
        {
          v18 += self->_cdb.start[v19];
          self->_cdb.start[v19 + 256] = v18;
          ++v19;
        }
        while (v19 * 4);
        for (j = self->_cdb.head; j; j = (cdb_hplist *)*((void *)j + 1000))
        {
          uint64_t v21 = *((int *)j + 2002);
          if (v21)
          {
            uint64_t v22 = v21 - 1;
            uint64_t v23 = (unsigned __int8 *)j + 8 * v21 - 8;
            do
            {
              uint64_t v24 = &p_cdb->bspace[4 * *v23];
              unsigned int v25 = *((_DWORD *)v24 + 2816) - 1;
              *((_DWORD *)v24 + 2816) = v25;
              uint64_t v26 = *(void *)v23;
              v23 -= 8;
              *((void *)self->_cdb.split + v25) = v26;
              LODWORD(v24) = v22--;
            }
            while (v24);
          }
        }
        for (uint64_t k = 0; k != 256; ++k)
        {
          unsigned int v28 = p_cdb->count[k];
          BOOL v29 = &self->_cdb.final[8 * k];
          *(_DWORD *)BOOL v29 = self->_cdb.pos;
          unsigned int v30 = 2 * v28;
          *((_WORD *)v29 + 2) = __PAIR16__((2 * v28) >> 24, 2 * v28);
          v29[6] = v28 >> 15;
          v29[7] = v28 >> 23;
          if (2 * v28) {
            bzero(self->_cdb.hash, 16 * v28);
          }
          if (v28)
          {
            int v31 = 0;
            id v32 = (_DWORD *)((char *)self->_cdb.split + 8 * p_cdb->start[k]);
            do
            {
              uint64_t v33 = (*v32 >> 8) % v30;
              hash = self->_cdb.hash;
              while (*((_DWORD *)hash + 2 * v33 + 1))
              {
                if (v33 + 1 == v30) {
                  uint64_t v33 = 0;
                }
                else {
                  uint64_t v33 = (v33 + 1);
                }
              }
              uint64_t v35 = *(void *)v32;
              v32 += 2;
              *((void *)hash + v33) = v35;
              ++v31;
            }
            while (v31 != v28);
            if (v30)
            {
              uint64_t v36 = 0;
              uint64_t v37 = 8 * v30;
              do
              {
                uint64_t v38 = (int *)((char *)self->_cdb.hash + v36);
                int v39 = *v38;
                LODWORD(v38) = v38[1];
                __src[0] = v39;
                __src[1] = v38;
                if (buffer_putalign((uint64_t)&self->_cdb.b, (char *)__src, 8uLL) == -1) {
                  goto LABEL_40;
                }
                unsigned int pos = self->_cdb.pos;
                if (pos >= 0xFFFFFFF8) {
                  goto LABEL_10;
                }
                self->_cdb.unsigned int pos = pos + 8;
                v36 += 8;
              }
              while (v37 != v36);
            }
          }
        }
        if (buffer_flush((uint64_t *)&self->_cdb.b) != -1 && lseek(self->_cdb.fd, 0, 0) != -1)
        {
          int v16 = buffer_putflush((uint64_t)&self->_cdb.b, (uint64_t)self->_cdb.final);
          goto LABEL_41;
        }
      }
    }
LABEL_40:
    int v16 = -1;
  }
  else
  {
    int v16 = 0;
  }
LABEL_41:
  int tempFD = self->_tempFD;
  if ((tempFD & 0x80000000) == 0)
  {
    if (close(tempFD) && *__error()) {
      __error();
    }
    self->_int tempFD = -1;
  }
  if (v16)
  {
    uint64_t v42 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v43 = [(NSString *)self->_finalPath UTF8String];
    if (v43 && (v46 = p_cdbStarted[20], uint64_t v45 = (const std::__fs::filesystem::path *)(p_cdbStarted + 20), v46))
    {
      rename(v45, v43, v44);
      if (!v47) {
        goto LABEL_53;
      }
      if (!*__error())
      {
        uint64_t v42 = 4294960596;
        goto LABEL_55;
      }
      uint64_t v42 = *__error();
      if (!v42)
      {
LABEL_53:
        uint64_t v42 = 0;
        v45->__pn_.__r_.__value_.__s.__data_[0] = 0;
      }
    }
    else
    {
      uint64_t v42 = 4294960592;
    }
  }
LABEL_55:
  [(CUKeyValueStoreWriter *)self cancel];
  if (a3 && v42)
  {
    if (*__error()) {
      uint64_t v54 = *__error();
    }
    else {
      uint64_t v54 = 4294960596;
    }
    NSErrorWithOSStatusF(v54, (uint64_t)"Finish failed: %#m", v48, v49, v50, v51, v52, v53, v42);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v42 == 0;
}

- (BOOL)startAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (NSString *)[v6 copy];
  finalPath = self->_finalPath;
  self->_finalPath = v7;

  uint64_t v9 = [v6 stringByAppendingString:@".XXXXXX"];

  if (([v9 getCString:self->_tempPath maxLength:1024 encoding:4] & 1) == 0)
  {
    if (a4)
    {
      uint64_t v20 = "No file path";
      uint64_t v21 = 4294960592;
LABEL_22:
      NSErrorWithOSStatusF(v21, (uint64_t)v20, v10, v11, v12, v13, v14, v15, (uint64_t)tempPath);
LABEL_23:
      BOOL v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_17:
    BOOL v19 = 0;
    goto LABEL_24;
  }
  int v16 = mkstemp(self->_tempPath);
  if (v16 < 0)
  {
    if (a4)
    {
      if (*__error()) {
        uint64_t v28 = *__error();
      }
      else {
        uint64_t v28 = 4294960596;
      }
      NSErrorWithOSStatusF(v28, (uint64_t)"Open temp file failed '%s'", v22, v23, v24, v25, v26, v27, (uint64_t)self->_tempPath);
      goto LABEL_23;
    }
    goto LABEL_17;
  }
  int v17 = v16;
  int tempFD = self->_tempFD;
  if ((tempFD & 0x80000000) == 0 && close(tempFD) && *__error()) {
    __error();
  }
  self->_int tempFD = v17;
  self->_cdb.head = 0;
  self->_cdb.hash = 0;
  self->_cdb.split = 0;
  self->_cdb.numentries = 0;
  self->_cdb.fd = v17;
  self->_cdb.unsigned int pos = 2048;
  self->_cdb.b.x = self->_cdb.bspace;
  self->_cdb.b.fd = v17;
  self->_cdb.b.op = (void *)MEMORY[0x1E4F14B20];
  *(void *)&self->_cdb.b.p = 0x200000000000;
  if (lseek(v17, 2048, 0) == -1)
  {
    [(CUKeyValueStoreWriter *)self cancel];
    if (a4)
    {
      if (*__error()) {
        uint64_t v21 = *__error();
      }
      else {
        uint64_t v21 = 4294960596;
      }
      tempPath = self->_tempPath;
      uint64_t v20 = "Open failed '%s'";
      goto LABEL_22;
    }
    goto LABEL_17;
  }
  BOOL v19 = 1;
  self->_cdbStarted = 1;
LABEL_24:

  return v19;
}

- (void)dealloc
{
  [(CUKeyValueStoreWriter *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CUKeyValueStoreWriter;
  [(CUKeyValueStoreWriter *)&v3 dealloc];
}

- (CUKeyValueStoreWriter)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUKeyValueStoreWriter;
  v2 = [(CUKeyValueStoreWriter *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_int tempFD = -1;
    v4 = v2;
  }

  return v3;
}

@end