@interface MDLAssetLoader
- (MDLAssetLoader)initWithExtension:(id)a3;
- (id)loadURL:(id)a3;
@end

@implementation MDLAssetLoader

- (id)loadURL:(id)a3
{
  id v4 = a3;
  if (!sub_20B1A908C(v4, v5, v6))
  {
    uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v7, @"Could not open %@ file", self->_extension);
LABEL_8:
    v12 = (__CFString *)v11;
    goto LABEL_9;
  }
  long long v34 = 0uLL;
  uint64_t v35 = 0;
  if (objc_msgSend_isEqualToString_(self->_extension, v7, @"PLY"))
  {
    uint64_t v33 = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v30 = 0u;
    memset(&v29, 0, sizeof(v29));
    sub_20B106500(&v29, 0);
    sub_20B10C3A4(&v29, v4, &v27);
    long long v34 = v27;
    uint64_t v35 = v28;
    sub_20B1065E0(&v29);
    goto LABEL_4;
  }
  objc_msgSend_path(v4, v8, v9);
  id v14 = objc_claimAutoreleasedReturnValue();
  v16 = (const char *)objc_msgSend_cStringUsingEncoding_(v14, v15, 4);
  int v17 = open(v16, 0);

  memset(&v29, 0, sizeof(v29));
  fstat(v17, &v29);
  off_t st_size = v29.st_size;
  v20 = (std::string::value_type *)mmap(0, v29.st_size, 1, 2, v17, 0);
  if (v20 == (std::string::value_type *)-1)
  {
    uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v19, @"%@ file map failed", self->_extension);
    goto LABEL_8;
  }
  if (!st_size)
  {
    objc_msgSend_stringWithFormat_(NSString, v19, @"%@ file has no contents", self->_extension);
    uint64_t v11 = LABEL_27:;
    goto LABEL_8;
  }
  if (v17 < 0)
  {
    objc_msgSend_stringWithFormat_(NSString, v19, @"Could not read %@ file", self->_extension);
    goto LABEL_27;
  }
  if (objc_msgSend_isEqualToString_(self->_extension, v19, @"OBJ"))
  {
    sub_20B06C754(v4, v20, st_size, &v27);
    long long v34 = v27;
    uint64_t v35 = v28;
  }
  else if (objc_msgSend_isEqualToString_(self->_extension, v21, @"STL"))
  {
    objc_msgSend_absoluteString(v4, v22, v23);
    id v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v24, v25, v26);
    sub_20B0A7E1C(v20, st_size, &v27);
    long long v34 = v27;
    uint64_t v35 = v28;
    HIBYTE(v28) = 0;
    LOBYTE(v27) = 0;
  }
  munmap(v20, st_size);
  close(v17);
LABEL_4:
  if ((SHIBYTE(v35) & 0x80000000) == 0)
  {
    if (!HIBYTE(v35))
    {
      v12 = &stru_26BF51EF0;
      goto LABEL_9;
    }
    objc_msgSend_stringWithUTF8String_(NSString, v10, (uint64_t)&v34);
    goto LABEL_19;
  }
  if (*((void *)&v34 + 1))
  {
    objc_msgSend_stringWithUTF8String_(NSString, v10, v34);
LABEL_19:
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v35 >= 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = &stru_26BF51EF0;
LABEL_25:
  operator delete((void *)v34);
LABEL_9:

  return v12;
}

- (MDLAssetLoader)initWithExtension:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MDLAssetLoader;
  uint64_t v6 = [(MDLAssetLoader *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_extension, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end