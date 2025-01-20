@interface BLEncryptedBuffer
- (BLEncryptedBuffer)initWithFileAtURL:(id)a3 pageSize:(unint64_t)a4 key:(const char *)a5 options:(unsigned __int16)a6;
- (BLEncryptedBuffer)initWithSize:(unint64_t)a3 pageSize:(unint64_t)a4 key:(const char *)a5 options:(unsigned __int16)a6;
- (unint64_t)_cachePage:(unsigned int)a3;
- (unint64_t)_decryptRange:(_NSRange)a3;
- (unint64_t)_writeCurrentCacheBlock;
- (unsigned)options;
- (void)dealloc;
- (void)decrypt;
- (void)setIVProc:(void *)a3 withContext:(void *)a4;
- (void)setOptions:(unsigned __int16)a3;
@end

@implementation BLEncryptedBuffer

- (BLEncryptedBuffer)initWithSize:(unint64_t)a3 pageSize:(unint64_t)a4 key:(const char *)a5 options:(unsigned __int16)a6
{
  v21.receiver = self;
  v21.super_class = (Class)BLEncryptedBuffer;
  v10 = [(BLEncryptedBuffer *)&v21 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_20;
  }
  *((_DWORD *)v10 + 2) = 1668446573;
  *((_WORD *)v10 + 64) = a6;
  *((void *)v10 + 11) = sub_100046E5C;
  if (a5)
  {
    *(_OWORD *)(v10 + 12) = *(_OWORD *)a5;
  }
  else
  {
    for (uint64_t i = 12; i != 28; ++i)
      v11[i] = arc4random();
  }
  if ((a4 & 0xF) != 0 || a4 == 0) {
    a4 = 1024;
  }
  *((void *)v11 + 5) = a4;
  unint64_t v14 = (a3 + a4 - 1) / a4;
  *((_DWORD *)v11 + 12) = v14;
  v15 = malloc_type_calloc(1uLL, (v14 + 7) >> 3, 0xDAFB3A7FuLL);
  *((void *)v11 + 7) = v15;
  if (!v15) {
    goto LABEL_21;
  }
  v16 = malloc_type_calloc(1uLL, a4, 0x81E0B489uLL);
  *((void *)v11 + 8) = v16;
  if (!v16) {
    goto LABEL_21;
  }
  *((_DWORD *)v11 + 31) = 128;
  *((void *)v11 + 9) = a3;
  if ((a6 & 4) != 0)
  {
    size_t v17 = a4 << 7;
    *((_DWORD *)v11 + 13) = -1;
  }
  else
  {
    size_t v17 = a4 * *((unsigned int *)v11 + 12);
  }
  *((void *)v11 + 4) = v17;
  if ((a6 & 8) != 0
    || !HIDWORD(v17) && (v18 = malloc_type_calloc(1uLL, v17, 0x520C1570uLL), (*((void *)v11 + 10) = v18) != 0))
  {
LABEL_20:
    v19 = v11;
  }
  else
  {
LABEL_21:
    v19 = 0;
  }

  return v19;
}

- (BLEncryptedBuffer)initWithFileAtURL:(id)a3 pageSize:(unint64_t)a4 key:(const char *)a5 options:(unsigned __int16)a6
{
  int v6 = a6;
  id v10 = a3;
  id v11 = [v10 path];
  int v12 = open((const char *)[v11 UTF8String], 2);

  if (v12 == -1)
  {
    v13 = BLBookInstallLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unint64_t v14 = __error();
      v15 = strerror(*v14);
      *(_DWORD *)buf = 136315650;
      v29 = v15;
      __int16 v30 = 2160;
      uint64_t v31 = 1752392040;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[Install-Op-Buffer] open error: %s, url: %{mask.hash}@", buf, 0x20u);
    }
  }
  if (fstat(v12, &v27) == -1)
  {
    v16 = BLBookInstallLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      size_t v17 = __error();
      v18 = strerror(*v17);
      *(_DWORD *)buf = 136315650;
      v29 = v18;
      __int16 v30 = 2160;
      uint64_t v31 = 1752392040;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[Install-Op-Buffer] fstat error: %s, url: %{mask.hash}@", buf, 0x20u);
    }
  }
  off_t st_size = v27.st_size;
  v20 = [(BLEncryptedBuffer *)self initWithSize:v27.st_size pageSize:a4 key:a5 options:v6 | 7u];
  if (v20)
  {
    objc_super v21 = fdopen(v12, "w+");
    v20->_file = v21;
    v20->_fileSize = st_size;
    if (!v21)
    {
      v22 = BLBookInstallLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = __error();
        v24 = strerror(*v23);
        *(_DWORD *)buf = 136315650;
        v29 = v24;
        __int16 v30 = 2160;
        uint64_t v31 = 1752392040;
        __int16 v32 = 2112;
        id v33 = v10;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[Install-Op-Buffer] fdopen error: %s, url: %{mask.hash}@", buf, 0x20u);
      }
    }
    unsigned int v25 = 0;
    if (a5)
    {
      do
      {
        v20->_pageEncryptBits[(unint64_t)v25 >> 3] |= 0x80u >> (v25 & 7);
        ++v25;
      }
      while (v25 <= v20->_pageCount - 1);
    }
    else
    {
      do
      {
        v20->_pageEncryptBits[(unint64_t)v25 >> 3] &= -129 >> (v25 & 7);
        ++v25;
      }
      while (v25 <= v20->_pageCount - 1);
    }
  }
  else
  {
    close(v12);
  }

  return v20;
}

- (void)dealloc
{
  [(BLEncryptedBuffer *)self _writeCurrentCacheBlock];
  file = self->_file;
  if (file) {
    fclose(file);
  }
  pageEncryptBits = self->_pageEncryptBits;
  if (pageEncryptBits) {
    free(pageEncryptBits);
  }
  pageTempBuffer = self->_pageTempBuffer;
  if (pageTempBuffer) {
    free(pageTempBuffer);
  }
  if (self->_baseAddress && ([(BLEncryptedBuffer *)self options] & 8) == 0) {
    free(self->_baseAddress);
  }
  v6.receiver = self;
  v6.super_class = (Class)BLEncryptedBuffer;
  [(BLEncryptedBuffer *)&v6 dealloc];
}

- (void)setIVProc:(void *)a3 withContext:(void *)a4
{
  self->_ivProc = a3;
  self->_ivProcRefcon = a4;
}

- (void)decrypt
{
  if (self->_file) {
    -[BLEncryptedBuffer _decryptRange:](self, "_decryptRange:", 0, self->_logicalSize);
  }
}

- (unint64_t)_cachePage:(unsigned int)a3
{
  if (([(BLEncryptedBuffer *)self options] & 4) == 0) {
    return 0;
  }
  if (([(BLEncryptedBuffer *)self options] & 0x20) != 0) {
    return 0;
  }
  unsigned int firstPageInBuffer = self->_firstPageInBuffer;
  if (firstPageInBuffer <= a3 && self->_cachedPageCount + firstPageInBuffer > a3) {
    return 0;
  }
  unint64_t v6 = [(BLEncryptedBuffer *)self _writeCurrentCacheBlock];
  if (!v6)
  {
    fseeko(self->_file, self->_pageSize * a3, 0);
    size_t v8 = fread(self->_baseAddress, 1uLL, self->_pageSize * self->_cachedPageCount, self->_file);
    if (v8 == self->_pageSize * self->_cachedPageCount || (unint64_t v6 = v8, v9 = feof(self->_file), !v6) || v9)
    {
      unint64_t v6 = 0;
      self->_unsigned int firstPageInBuffer = a3;
    }
  }
  return v6;
}

- (unint64_t)_decryptRange:(_NSRange)a3
{
  unint64_t pageSize = self->_pageSize;
  NSUInteger v5 = a3.location / pageSize;
  NSUInteger v6 = a3.length + a3.location - 1;
  NSUInteger v7 = v6 / pageSize;
  if ((a3.location / pageSize) <= (v6 / pageSize))
  {
    do
    {
      pageEncryptBits = self->_pageEncryptBits;
      if (pageEncryptBits)
      {
        unint64_t v9 = (unint64_t)v5 >> 3;
        if (((pageEncryptBits[v9] << (v5 & 7)) & 0x80) != 0)
        {
          uint64_t v10 = [(BLEncryptedBuffer *)self _cachePage:v5];
          if (v10) {
            goto LABEL_13;
          }
          uint64_t v18 = 0x100000000;
          long long v20 = 0u;
          uint64_t v23 = 0;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v19 = 0x200000001;
          LODWORD(v20) = 1;
          ((void (*)(NSUInteger, void *, unsigned char *))self->_ivProc)(v5, self->_ivProcRefcon, v24);
          *((void *)&v20 + 1) = self->_key;
          LOBYTE(v21) = 16;
          *(void *)&long long v22 = v24;
          LODWORD(v19) = 3;
          LODWORD(v20) = 0;
          uint64_t v10 = sub_1000469E0((uint64_t)&v18);
          if (v10
            || (size_t v11 = self->_pageSize,
                int v12 = &self->_baseAddress[v11 * (v5 - self->_firstPageInBuffer)],
                size_t v17 = v11,
                (uint64_t v10 = sub_100046BB4((uint64_t)&v18, v12, v11, self->_pageTempBuffer, &v17)) != 0))
          {
LABEL_13:
            unint64_t v14 = v10;
            goto LABEL_15;
          }
          memmove(v12, self->_pageTempBuffer, self->_pageSize);
          if (([(BLEncryptedBuffer *)self options] & 0x20) != 0)
          {
            unint64_t v14 = -1234;
            goto LABEL_15;
          }
          self->_cacheDirty = 1;
          v13 = self->_pageEncryptBits;
          if (v13) {
            v13[v9] &= -129 >> (v5 & 7);
          }
          size_t v16 = self->_pageSize - v17;
          if (sub_100046AFC((uint64_t)&v18, &v12[v17], &v16)) {
            break;
          }
        }
      }
      NSUInteger v5 = (v5 + 1);
    }
    while (v5 <= v7);
  }
  unint64_t v14 = 0;
LABEL_15:
  bzero(self->_pageTempBuffer, self->_pageSize);
  return v14;
}

- (unint64_t)_writeCurrentCacheBlock
{
  if (([(BLEncryptedBuffer *)self options] & 4) == 0
    || ([(BLEncryptedBuffer *)self options] & 0x20) != 0
    || !self->_cacheDirty)
  {
    return 0;
  }
  uint64_t firstPageInBuffer = self->_firstPageInBuffer;
  unint64_t pageSize = self->_pageSize;
  off_t v5 = pageSize * firstPageInBuffer;
  int64_t v6 = pageSize * (self->_cachedPageCount + firstPageInBuffer);
  if (v6 >= self->_logicalSize) {
    int64_t logicalSize = self->_logicalSize;
  }
  else {
    int64_t logicalSize = v6;
  }
  fseeko(self->_file, v5, 0);
  fwrite(self->_baseAddress, 1uLL, logicalSize - v5, self->_file);
  LODWORD(result) = ferror(self->_file);
  if (result) {
    return (int)result;
  }
  unint64_t result = 0;
  self->_cacheDirty = 0;
  return result;
}

- (unsigned)options
{
  return self->_options;
}

- (void)setOptions:(unsigned __int16)a3
{
  self->_options = a3;
}

@end