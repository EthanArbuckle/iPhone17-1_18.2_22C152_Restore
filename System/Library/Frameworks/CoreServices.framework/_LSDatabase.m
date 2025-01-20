@interface _LSDatabase
- (BOOL)cryptexContentChanged;
- (_LSDatabase)init;
- (id)_init;
- (id)description;
- (uint64_t)accessContext;
- (uint64_t)isSeeded;
- (uint64_t)isSeedingComplete;
- (uint64_t)schema;
- (uint64_t)store;
- (void)dealloc;
- (void)isSeedingComplete;
- (void)setAccessContext:(void *)result;
- (void)setApplicationsChanged:(_LSDatabase *)a1;
- (void)setDocumentTypesChanged:(_LSDatabase *)a1;
- (void)setSeeded:(uint64_t)a1;
- (void)setSeedingComplete:(_LSDatabase *)a1;
- (void)setTypeDeclarationsChanged:(_LSDatabase *)a1;
- (void)setURLTypesChanged:(_LSDatabase *)a1;
@end

@implementation _LSDatabase

- (void)setAccessContext:(void *)result
{
  if (result)
  {
    v3 = result;
    CFTypeRef v4 = (CFTypeRef)result[207];
    if (v4 != cf)
    {
      result[207] = cf;
      if (cf) {
        CFRetain(cf);
      }
      if (v4) {
        CFRelease(v4);
      }
      uint64_t v5 = *(v3 + 1);
      return (void *)MEMORY[0x1F4115210](v5, cf);
    }
  }
  return result;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_LSDatabase;
  if ([(_LSDatabase *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  store = self->store;
  if (store)
  {
    CFRelease(store);
    self->store = 0;
  }
  accessContext = self->accessContext;
  if (accessContext)
  {
    CFRelease(accessContext);
    self->accessContext = 0;
  }
  cache = self->schema._cache;
  if (cache)
  {
    _LSSchemaCache::~_LSSchemaCache(cache);
    MEMORY[0x18530EAF0]();
  }
  v6.receiver = self;
  v6.super_class = (Class)_LSDatabase;
  [(_LSDatabase *)&v6 dealloc];
}

- (uint64_t)store
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)isSeedingComplete
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v5 = 0u;
    long long v6 = 0u;
    long long v3 = 0u;
    long long v4 = 0u;
    memset(v2, 0, sizeof(v2));
    _LSDatabaseGetHeader(v2);
    if ((BYTE8(v3) & 2) != 0)
    {
      v1 = _LSDatabaseGetLog();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
        -[_LSDatabase isSeedingComplete]();
      }

      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)isSeeded
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  memset(v27, 0, sizeof(v27));
  memset(v26, 0, sizeof(v26));
  _LSDatabaseGetHeader(v26);
  LSDBHeader::GetCurrentBuildVersion(&__p);
  uint64_t v1 = v22;
  if ((v22 & 0x80u) != 0) {
    uint64_t v1 = v21;
  }
  if (!v1)
  {
    long long v10 = _LSDatabaseGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182959000, v10, OS_LOG_TYPE_DEFAULT, "Could not get OS build version.", buf, 2u);
    }
    goto LABEL_41;
  }
  *(void *)__dst = 0;
  *(void *)&__dst[8] = 0;
  strlcpy(__dst, v27, 0x10uLL);
  std::string::basic_string[abi:nn180100]<0>(buf, __dst);
  uint64_t v2 = buf[23];
  uint8_t v3 = buf[23];
  uint64_t v4 = *(void *)&buf[8];
  if ((buf[23] & 0x80u) == 0) {
    uint64_t v5 = buf[23];
  }
  else {
    uint64_t v5 = *(void *)&buf[8];
  }
  uint64_t v6 = v22;
  if ((v22 & 0x80u) != 0) {
    uint64_t v6 = v21;
  }
  if (v5 == v6)
  {
    if ((v22 & 0x80u) == 0) {
      p_p = (unsigned __int8 *)&__p;
    }
    else {
      p_p = (unsigned __int8 *)__p;
    }
    if ((char)buf[23] < 0)
    {
      uint64_t v11 = *(void **)buf;
      int v12 = memcmp(*(const void **)buf, p_p, *(size_t *)&buf[8]);
      uint64_t v5 = v4;
      if (!v12)
      {
        operator delete(v11);
        goto LABEL_38;
      }
    }
    else
    {
      if (!buf[23]) {
        goto LABEL_38;
      }
      long long v8 = buf;
      while (*v8 == *p_p)
      {
        ++v8;
        ++p_p;
        if (!--v2)
        {
          char v9 = 0;
          if ((buf[23] & 0x80) == 0) {
            goto LABEL_32;
          }
          goto LABEL_35;
        }
      }
    }
  }
  if (!v5)
  {
    char v9 = 1;
    if ((v3 & 0x80) == 0) {
      goto LABEL_32;
    }
LABEL_35:
    operator delete(*(void **)buf);
    if (v9) {
      goto LABEL_42;
    }
    goto LABEL_38;
  }
  v13 = _LSDatabaseGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = buf;
    if ((buf[23] & 0x80u) != 0) {
      v14 = *(uint8_t **)buf;
    }
    v15 = &__p;
    if ((v22 & 0x80u) != 0) {
      v15 = __p;
    }
    *(_DWORD *)__dst = 136446466;
    *(void *)&__dst[4] = v14;
    *(_WORD *)&__dst[12] = 2082;
    *(void *)&__dst[14] = v15;
    _os_log_impl(&dword_182959000, v13, OS_LOG_TYPE_DEFAULT, "Local database thinks system build version is %{public}s, but the OS really is %{public}s.", __dst, 0x16u);
  }

  char v9 = 1;
  if ((buf[23] & 0x80) != 0) {
    goto LABEL_35;
  }
LABEL_32:
  if (v9) {
    goto LABEL_42;
  }
LABEL_38:
  _LSGetCurrentSystemVersion(v25);
  *(_OWORD *)buf = *(_OWORD *)((char *)v26 + 8);
  *(_OWORD *)&buf[16] = *(_OWORD *)((char *)&v26[1] + 8);
  *(_OWORD *)__dst = v25[0];
  *(_OWORD *)&__dst[16] = v25[1];
  if (_LSVersionNumberCompare(buf, __dst))
  {
    long long v10 = _LSDatabaseGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v24[0] = *(_OWORD *)((char *)v26 + 8);
      v24[1] = *(_OWORD *)((char *)&v26[1] + 8);
      _LSVersionNumberGetStringRepresentation(v24);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      _LSGetCurrentSystemVersion(v23);
      v17 = _LSVersionNumberGetStringRepresentation(v23);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_182959000, v10, OS_LOG_TYPE_DEFAULT, "Local database thinks system version is %{public}@, but the OS really is %{public}@.", buf, 0x16u);
    }
LABEL_41:

LABEL_42:
    uint64_t v18 = 0;
    goto LABEL_43;
  }
  uint64_t v18 = 1;
LABEL_43:
  if ((char)v22 < 0) {
    operator delete(__p);
  }
  return v18;
}

- (void).cxx_destruct
{
}

- (_LSDatabase)init
{
}

- (id)description
{
  uint64_t v3 = [(FSNode *)self->node pathWithError:0];
  uint64_t v4 = (void *)v3;
  uint64_t v5 = @"?";
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  uint64_t v6 = v5;

  if (self->sessionKey.systemSession)
  {
    long long v7 = NSString;
    long long v8 = @"<LSDatabase %p> { system session, path = '%@' }";
LABEL_7:
    uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", v8, self, v6);
    goto LABEL_8;
  }
  long long v7 = NSString;
  if (self->sessionKey.uid == -2)
  {
    long long v8 = @"<LSDatabase %p> { path = '%@' }";
    goto LABEL_7;
  }
  uint64_t v9 = [NSString stringWithFormat:@"<LSDatabase %p> { userID = %llu, path = '%@' }", self, self->sessionKey.uid, v6];
LABEL_8:
  long long v10 = (void *)v9;

  return v10;
}

- (uint64_t)schema
{
  if (a1) {
    return a1 + 16;
  }
  else {
    return 0;
  }
}

- (uint64_t)accessContext
{
  if (result) {
    return *(void *)(result + 1656);
  }
  return result;
}

- (void)setSeeded:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    memset(v11, 0, sizeof(v11));
    _LSDatabaseGetHeader(v11);
    if (a2)
    {
      _LSGetCurrentSystemVersion((_OWORD *)((char *)v11 + 8));
      LSDBHeader::GetCurrentBuildVersion(__p);
      long long v13 = 0uLL;
      if ((SBYTE7(v10) & 0x80u) == 0) {
        uint64_t v4 = __p;
      }
      else {
        uint64_t v4 = (void **)__p[0];
      }
      strlcpy((char *)&v13, (const char *)v4, 0x10uLL);
      if (SBYTE7(v10) < 0) {
        operator delete(__p[0]);
      }
      LSDBHeader::GetCurrentModelCode(__p);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      if ((SBYTE7(v10) & 0x80u) == 0) {
        uint64_t v5 = __p;
      }
      else {
        uint64_t v5 = (void **)__p[0];
      }
      strlcpy((char *)&v14, (const char *)v5, 0x40uLL);
      if (SBYTE7(v10) < 0) {
        operator delete(__p[0]);
      }
      _LSGetCurrentCryptexVersion(__p);
      *(_OWORD *)((char *)&v11[2] + 8) = *(_OWORD *)__p;
      *(_OWORD *)((char *)&v11[3] + 8) = v10;
      LSDBHeader::GetCurrentCryptexVersion(__p);
      *((void *)&v11[4] + 1) = 0;
      *(void *)&long long v12 = 0;
      if ((SBYTE7(v10) & 0x80u) == 0) {
        uint64_t v6 = __p;
      }
      else {
        uint64_t v6 = (void **)__p[0];
      }
    }
    else
    {
      memset((char *)v11 + 8, 0, 32);
      std::string::basic_string[abi:nn180100]<0>(__p, "");
      long long v13 = 0uLL;
      if ((SBYTE7(v10) & 0x80u) == 0) {
        long long v7 = __p;
      }
      else {
        long long v7 = (void **)__p[0];
      }
      strlcpy((char *)&v13, (const char *)v7, 0x10uLL);
      if (SBYTE7(v10) < 0) {
        operator delete(__p[0]);
      }
      std::string::basic_string[abi:nn180100]<0>(__p, "");
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      if ((SBYTE7(v10) & 0x80u) == 0) {
        long long v8 = __p;
      }
      else {
        long long v8 = (void **)__p[0];
      }
      strlcpy((char *)&v14, (const char *)v8, 0x40uLL);
      if (SBYTE7(v10) < 0) {
        operator delete(__p[0]);
      }
      memset((char *)&v11[2] + 8, 0, 32);
      std::string::basic_string[abi:nn180100]<0>(__p, "");
      *((void *)&v11[4] + 1) = 0;
      *(void *)&long long v12 = 0;
      if ((SBYTE7(v10) & 0x80u) == 0) {
        uint64_t v6 = __p;
      }
      else {
        uint64_t v6 = (void **)__p[0];
      }
    }
    strlcpy((char *)&v11[4] + 8, (const char *)v6, 0x10uLL);
    if (SBYTE7(v10) < 0) {
      operator delete(__p[0]);
    }
    _LSDatabaseSetHeader(a1);
  }
}

- (BOOL)cryptexContentChanged
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  memset(v6, 0, sizeof(v6));
  _LSDatabaseGetHeader(v6);
  _LSGetCurrentCryptexVersion(v5);
  v4[0] = *(_OWORD *)((char *)&v6[2] + 8);
  v4[1] = *(_OWORD *)((char *)&v6[3] + 8);
  uint64_t v1 = _LSVersionNumberCompare(v5, v4);
  BOOL v2 = v1 != 0;
  if (v1) {
    _LSGetCurrentCryptexVersion((_OWORD *)((char *)&v6[2] + 8));
  }
  return v2;
}

- (void)setSeedingComplete:(_LSDatabase *)a1
{
  if (a1) {
    _LSDatabaseSetHeaderFlag(a1, 2, a2 ^ 1);
  }
}

- (void)setApplicationsChanged:(_LSDatabase *)a1
{
  if (a1) {
    _LSDatabaseSetHeaderFlag(a1, 0x1000000, a2);
  }
}

- (void)setDocumentTypesChanged:(_LSDatabase *)a1
{
  if (a1) {
    _LSDatabaseSetHeaderFlag(a1, 0x2000000, a2);
  }
}

- (void)setURLTypesChanged:(_LSDatabase *)a1
{
  if (a1) {
    _LSDatabaseSetHeaderFlag(a1, 0x4000000, a2);
  }
}

- (void)setTypeDeclarationsChanged:(_LSDatabase *)a1
{
  if (a1) {
    _LSDatabaseSetHeaderFlag(a1, 0x8000000, a2);
  }
}

- (void)isSeedingComplete
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_19(&dword_182959000, v0, v1, "Database seeding is incomplete, need to rebuild", v2, v3, v4, v5, v6);
}

@end