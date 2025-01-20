@interface BRCLazyXattrsCollection
- (BRCLazyXattrsCollection)initWithFD:(int)a3 sizeLimit:(int64_t)a4 syncable:(BOOL)a5 error:(id *)a6;
- (const)contentXattrNamesBegin;
- (const)contentXattrNamesEnd;
- (const)structuralXattrNamesBegin;
- (const)structuralXattrNamesEnd;
- (const)xattrNamesBegin;
- (const)xattrNamesEnd;
- (const)xattrNamesListBegin;
- (const)xattrNamesListEnd;
- (id)getXattrValue:(id)a3 error:(id *)a4;
- (unsigned)contentXattrNamesCount;
- (unsigned)structuralXattrNamesCount;
- (unsigned)xattrNamesCount;
- (void)clearCache;
@end

@implementation BRCLazyXattrsCollection

- (const)xattrNamesListBegin
{
  return (const char *)[(NSMutableData *)self->_xattrNamesList bytes];
}

- (const)xattrNamesListEnd
{
  uint64_t v3 = [(NSMutableData *)self->_xattrNamesList bytes];
  return (const char *)(v3 + [(NSMutableData *)self->_xattrNamesList length]);
}

- (const)xattrNamesBegin
{
  return (const char **)[(NSMutableData *)self->_xattrNamesData mutableBytes];
}

- (unsigned)xattrNamesCount
{
  return self->_xattrCount;
}

- (const)xattrNamesEnd
{
  return (const char **)([(NSMutableData *)self->_xattrNamesData mutableBytes] + 8 * self->_xattrCount);
}

- (const)structuralXattrNamesBegin
{
  return (const char **)([(NSMutableData *)self->_xattrNamesData mutableBytes]
                       + 8 * self->_contentXattrCount);
}

- (const)structuralXattrNamesEnd
{
  return (const char **)([(NSMutableData *)self->_xattrNamesData mutableBytes] + 8 * self->_xattrCount);
}

- (unsigned)structuralXattrNamesCount
{
  return self->_xattrCount - self->_contentXattrCount;
}

- (const)contentXattrNamesBegin
{
  return (const char **)[(NSMutableData *)self->_xattrNamesData mutableBytes];
}

- (const)contentXattrNamesEnd
{
  return (const char **)([(NSMutableData *)self->_xattrNamesData mutableBytes]
                       + 8 * self->_contentXattrCount);
}

- (unsigned)contentXattrNamesCount
{
  return self->_contentXattrCount;
}

- (BRCLazyXattrsCollection)initWithFD:(int)a3 sizeLimit:(int64_t)a4 syncable:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v47.receiver = self;
  v47.super_class = (Class)BRCLazyXattrsCollection;
  v10 = [(BRCLazyXattrsCollection *)&v47 init];
  v11 = v10;
  if (!v10)
  {
LABEL_36:
    v38 = v11;
    v39 = [(BRCLazyXattrsCollection *)v38 contentXattrNamesBegin];
    unsigned int v40 = [(BRCLazyXattrsCollection *)v38 contentXattrNamesCount];
    if (v40) {
      qsort_b(v39, v40, 8uLL, &__block_literal_global_78_0);
    }
    v41 = v38;
    v42 = [(BRCLazyXattrsCollection *)v41 structuralXattrNamesBegin];
    unsigned int v43 = [(BRCLazyXattrsCollection *)v41 structuralXattrNamesCount];
    if (v43) {
      qsort_b(v42, v43, 8uLL, &__block_literal_global_78_0);
    }
    v20 = v41;
LABEL_41:
    v16 = v20;
    goto LABEL_42;
  }
  v10->_sizeLimit = a4;
  v10->_fd = a3;
  ssize_t v12 = flistxattr(a3, 0, 0, 0);
  if (v12 < 0)
  {
    v17 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    if (v17)
    {
      v18 = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        v45 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "-[BRCLazyXattrsCollection initWithFD:sizeLimit:syncable:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a6) {
          v45 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v45;
        *(_WORD *)&buf[22] = 2112;
        v49 = v17;
        __int16 v50 = 2112;
        v51 = v18;
        _os_log_error_impl(&dword_1D353B000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a6) {
      *a6 = v17;
    }

    v20 = v11;
    goto LABEL_41;
  }
  size_t v13 = v12;
  if (a4 < 0 || v12 <= a4)
  {
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v12];
    xattrNamesList = v11->_xattrNamesList;
    v11->_xattrNamesList = (NSMutableData *)v21;

    if (flistxattr(a3, (char *)[(NSMutableData *)v11->_xattrNamesList mutableBytes], v13, 0) != v13)
    {
      v27 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
      if (v27)
      {
        v28 = brc_bread_crumbs();
        v29 = brc_default_log();
        if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
        {
          v46 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "-[BRCLazyXattrsCollection initWithFD:sizeLimit:syncable:error:]";
          *(_WORD *)&buf[12] = 2080;
          if (!a6) {
            v46 = "(ignored by caller)";
          }
          *(void *)&buf[14] = v46;
          *(_WORD *)&buf[22] = 2112;
          v49 = v27;
          __int16 v50 = 2112;
          v51 = v28;
          _os_log_error_impl(&dword_1D353B000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a6) {
        *a6 = v27;
      }

      goto LABEL_26;
    }
    v23 = [(BRCLazyXattrsCollection *)v11 xattrNamesListBegin];
    unint64_t v24 = [(BRCLazyXattrsCollection *)v11 xattrNamesListEnd];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __countSyncableXattrs_block_invoke;
    v49 = &__block_descriptor_33_e9_B16__0r_8l;
    LOBYTE(v50) = v7;
    v25 = buf;
    if ((unint64_t)v23 >= v24)
    {
      unsigned int v26 = 0;
    }
    else
    {
      unsigned int v26 = 0;
      do
      {
        v26 += (*(uint64_t (**)(unsigned char *, const char *))&buf[16])(v25, v23);
        v23 += strlen(v23) + 1;
      }
      while ((unint64_t)v23 < v24);
    }

    v11->_xattrCount = v26;
    uint64_t v30 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:8 * v11->_xattrCount];
    xattrNamesData = v11->_xattrNamesData;
    v11->_xattrNamesData = (NSMutableData *)v30;

    v32 = [(BRCLazyXattrsCollection *)v11 xattrNamesListBegin];
    if (v32 < [(BRCLazyXattrsCollection *)v11 xattrNamesListEnd])
    {
      int v33 = 0;
      do
      {
        xattr_flags_t v34 = brc_xattr_flags_from_name(v32);
        char v35 = v34;
        if ((xattr_intent_with_flags(4u, v34) == 0) != v7)
        {
          uint64_t v36 = [(BRCLazyXattrsCollection *)v11 xattrNamesBegin];
          if ((v35 & 2) != 0)
          {
            unsigned int contentXattrCount = v11->_contentXattrCount;
            v11->_unsigned int contentXattrCount = contentXattrCount + 1;
          }
          else
          {
            ++v33;
            unsigned int contentXattrCount = v11->_xattrCount - v33;
          }
          *(void *)(v36 + 8 * contentXattrCount) = v32;
        }
        v32 += strlen(v32) + 1;
      }
      while (v32 < [(BRCLazyXattrsCollection *)v11 xattrNamesListEnd]);
    }
    goto LABEL_36;
  }
  v14 = brc_bread_crumbs();
  v15 = brc_default_log();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
    -[BRCLazyXattrsCollection initWithFD:sizeLimit:syncable:error:]((uint64_t)v14, a4, v15);
  }

  if (!a6)
  {
LABEL_26:
    v16 = 0;
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 12);
  v16 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:

  return v16;
}

- (id)getXattrValue:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  cachedXattrs = self->_cachedXattrs;
  if (!cachedXattrs)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_cachedXattrs;
    self->_cachedXattrs = v8;

    cachedXattrs = self->_cachedXattrs;
  }
  v10 = [(NSMutableDictionary *)cachedXattrs valueForKey:v6];
  if (v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];

    if (v10 != v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v31 = brc_bread_crumbs();
        v32 = brc_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
          -[BRCLazyXattrsCollection getXattrValue:error:]();
        }
      }
      id v12 = v10;
      goto LABEL_23;
    }
LABEL_14:
    id v12 = 0;
    goto LABEL_23;
  }
  int64_t sizeLimit = self->_sizeLimit;
  if ((sizeLimit & 0x8000000000000000) == 0 && self->_cacheSize >= sizeLimit)
  {
    brc_bread_crumbs();
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      char v35 = v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Do not attempt to get xattr size cache is full%@", buf, 0xCu);
    }

    goto LABEL_14;
  }
  int fd = self->_fd;
  id v15 = v6;
  v16 = (const char *)[v15 UTF8String];
  ssize_t v17 = self->_sizeLimit - self->_cacheSize;
  id v33 = 0;
  BRCGetXattrValue(fd, v16, v17, &v33);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v33;
  v19 = v18;
  if (v12)
  {
    [(NSMutableDictionary *)self->_cachedXattrs setObject:v12 forKey:v15];
    uint64_t v20 = [v15 length];
    self->_cacheSize += [v12 length] + v20;
    id v21 = v12;
  }
  else
  {
    id v24 = v18;
    if (v24)
    {
      v25 = brc_bread_crumbs();
      unsigned int v26 = brc_default_log();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      {
        uint64_t v30 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        char v35 = "-[BRCLazyXattrsCollection getXattrValue:error:]";
        __int16 v36 = 2080;
        if (!a4) {
          uint64_t v30 = "(ignored by caller)";
        }
        v37 = v30;
        __int16 v38 = 2112;
        id v39 = v24;
        __int16 v40 = 2112;
        v41 = v25;
        _os_log_error_impl(&dword_1D353B000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v24;
    }

    if (!*a4)
    {
      v27 = self->_cachedXattrs;
      v28 = [MEMORY[0x1E4F1CA98] null];
      [(NSMutableDictionary *)v27 setObject:v28 forKey:v15];
    }
  }

LABEL_23:
  return v12;
}

- (void)clearCache
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedXattrs, 0);
  objc_storeStrong((id *)&self->_xattrNamesData, 0);
  objc_storeStrong((id *)&self->_xattrNamesList, 0);
}

- (void)initWithFD:(os_log_t)log sizeLimit:syncable:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_1D353B000, log, (os_log_type_t)0x90u, "[ERROR] Xattr name list exceed size limit %ld%@", (uint8_t *)&v3, 0x16u);
}

- (void)getXattrValue:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [cached isKindOfClass:[NSData class]]%@", v2, v3, v4, v5, v6);
}

@end