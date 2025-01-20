@interface CacheManagementAsset
+ (id)assetFromData:(id)a3;
+ (id)assetFromFile:(id)a3 withIdentifier:(id)a4;
+ (id)assetFromPath:(id)a3 withIdentifier:(id)a4;
+ (id)assetFromPath:(id)a3 withIdentifier:(id)a4 createIfAbsent:(BOOL)a5;
+ (id)assetWithRelativePath:(id)a3 identifier:(id)a4 expirationDate:(id)a5 contentType:(id)a6 metadata:(id)a7 priority:(int)a8;
- ($62504CD8620D4E4BE208444870B73508)createFlattenedAsset:(int64_t *)a3;
- (CacheManagementAsset)initWithCoder:(id)a3;
- (CacheManagementAsset)initWithFlattenedAsset:(id *)a3;
- (CacheManagementAsset)initWithRelativePath:(id)a3 identifier:(id)a4 expirationDate:(id)a5 contentType:(id)a6 metadata:(id)a7 priority:(int)a8;
- (NSData)metadata;
- (NSString)absolutePath;
- (NSString)contentType;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)relativePath;
- (double)consumed_date;
- (double)download_completion_date;
- (double)download_start_date;
- (double)expiration_date;
- (double)last_viewed_date;
- (id)consumedDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)downloadCompletionDate;
- (id)downloadStartDate;
- (id)expirationDate;
- (id)fullPath;
- (id)lastViewedDate;
- (int)priority;
- (int)purgeabilityScoreAtUrgency:(int)a3;
- (int64_t)size;
- (int64_t)sizeCached:(BOOL)a3;
- (unsigned)assetVersion;
- (void)commit;
- (void)encodeWithCoder:(id)a3;
- (void)setAbsolutePath:(id)a3;
- (void)setConsumedDate:(id)a3;
- (void)setConsumed_date:(double)a3;
- (void)setContentType:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDownloadCompletionDate:(id)a3;
- (void)setDownloadStartDate:(id)a3;
- (void)setDownload_completion_date:(double)a3;
- (void)setDownload_start_date:(double)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExpiration_date:(double)a3;
- (void)setLastViewedDate:(id)a3;
- (void)setLast_viewed_date:(double)a3;
- (void)setMetadata:(id)a3;
- (void)setPriority:(int)a3;
- (void)setRelativePath:(id)a3;
@end

@implementation CacheManagementAsset

- (CacheManagementAsset)initWithRelativePath:(id)a3 identifier:(id)a4 expirationDate:(id)a5 contentType:(id)a6 metadata:(id)a7 priority:(int)a8
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v25 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v15 && [v15 length])
  {
    v26.receiver = self;
    v26.super_class = (Class)CacheManagementAsset;
    v19 = [(CacheManagementAsset *)&v26 init];
    v20 = v19;
    if (v19)
    {
      v19->_assetVersion = 2;
      if (v16) {
        [v16 timeIntervalSinceReferenceDate];
      }
      else {
        double v21 = nan("");
      }
      v20->_expiration_date = v21;
      objc_storeStrong((id *)&v20->_contentType, a6);
      objc_storeStrong((id *)&v20->_metadata, a7);
      v20->_priority = a8;
      objc_storeStrong((id *)&v20->_relativePath, a3);
      objc_storeStrong((id *)&v20->_identifier, a4);
      v20->_consumed_date = nan("");
      v20->_download_start_date = nan("");
      v20->_download_completion_date = nan("");
      v20->_last_viewed_date = nan("");
    }
    self = v20;
    v23 = self;
  }
  else
  {
    v22 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v15;
      _os_log_error_impl(&dword_1A63D1000, v22, OS_LOG_TYPE_ERROR, "parameter error relativePath: %@", buf, 0xCu);
    }

    v23 = 0;
  }

  return v23;
}

- (CacheManagementAsset)initWithFlattenedAsset:(id *)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)CacheManagementAsset;
  id v4 = [(CacheManagementAsset *)&v48 init];
  if (!v4) {
    goto LABEL_52;
  }
  if (!a3)
  {
    v12 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v37 = "Parameter error, asset is NULL";
LABEL_37:
      v38 = v12;
      uint32_t v39 = 2;
      goto LABEL_38;
    }
    goto LABEL_15;
  }
  if ((*(int64_t *)((unsigned char *)&a3->var10 + 1) & 0x8000000000000000) == 0
    && (*(int64_t *)((unsigned char *)&a3->var9 + 1) & 0x8000000000000000) == 0
    && (*(int64_t *)((unsigned char *)&a3->var8 + 1) & 0x8000000000000000) == 0
    && (*(void *)((unsigned char *)&a3->var6 + 1) & 0x8000000000000000) == 0)
  {
    v5 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      flattenedAssetDescription(&a3->var0);
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v6;
      _os_log_impl(&dword_1A63D1000, v5, OS_LOG_TYPE_DEFAULT, "initWithFlattenedAsset: %@", buf, 0xCu);
    }
    *((_DWORD *)v4 + 3) = a3->var0;
    *((void *)v4 + 7) = *(void *)(&a3->var0 + 1);
    *((void *)v4 + 8) = *(void *)((char *)&a3->var1 + 4);
    *((void *)v4 + 9) = *(void *)((char *)&a3->var2 + 4);
    *((void *)v4 + 10) = *(void *)((char *)&a3->var3 + 4);
    *((void *)v4 + 11) = *(void *)((char *)&a3->var4 + 4);
    *((_DWORD *)v4 + 2) = HIDWORD(a3->var5);
    if (*(uint64_t *)((char *)&a3->var6 + 1) < 1)
    {
      int v10 = 0;
    }
    else
    {
      v7 = (char *)&a3->var12 + 1;
      uint64_t v8 = [NSString stringWithCString:(char *)&a3->var12 + 1 encoding:4];
      v9 = (void *)*((void *)v4 + 3);
      *((void *)v4 + 3) = v8;

      if (!*((void *)v4 + 3))
      {
        v12 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v50 = v7;
          v37 = "stringWithCString failed for %s";
          v38 = v12;
          uint32_t v39 = 12;
LABEL_38:
          _os_log_error_impl(&dword_1A63D1000, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
      int v10 = *(int *)((char *)&a3->var6 + 1);
    }
    if (*(uint64_t *)((char *)&a3->var8 + 1) >= 1)
    {
      v14 = (char *)&a3->var12 + v10 + 1;
      uint64_t v15 = [NSString stringWithCString:v14 encoding:4];
      id v16 = (void *)*((void *)v4 + 4);
      *((void *)v4 + 4) = v15;

      if (!*((void *)v4 + 4))
      {
        v12 = CDGetLogHandle((uint64_t)"client");
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        v40 = __error();
        v41 = strerror(*v40);
        *(_DWORD *)buf = 136315394;
        v50 = v14;
        __int16 v51 = 2080;
        v52 = v41;
        v37 = "stringWithCString failed for %s : %s";
        v38 = v12;
        uint32_t v39 = 22;
        goto LABEL_38;
      }
      v10 += *(_DWORD *)((char *)&a3->var8 + 1);
    }
    if (*(uint64_t *)((char *)&a3->var9 + 1) >= 1)
    {
      id v17 = (char *)&a3->var12 + v10 + 1;
      uint64_t v18 = [NSString stringWithCString:v17 encoding:4];
      v19 = (void *)*((void *)v4 + 5);
      *((void *)v4 + 5) = v18;

      if (!*((void *)v4 + 5))
      {
        v42 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v46 = *(char **)((char *)&a3->var9 + 1);
          *(_DWORD *)buf = 134218242;
          v50 = v46;
          __int16 v51 = 2080;
          v52 = v17;
          _os_log_error_impl(&dword_1A63D1000, v42, OS_LOG_TYPE_ERROR, "stringWithCString failed for content type: [len: %zd] %s", buf, 0x16u);
        }

        goto LABEL_16;
      }
      v10 += *(_DWORD *)((char *)&a3->var9 + 1);
    }
    if (*(uint64_t *)((char *)&a3->var10 + 1) < 1) {
      goto LABEL_27;
    }
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", (char *)&a3->var12 + v10 + 1);
    double v21 = (void *)*((void *)v4 + 6);
    *((void *)v4 + 6) = v20;

    if (*((void *)v4 + 6))
    {
      v10 += *(_DWORD *)((char *)&a3->var10 + 1);
LABEL_27:
      if (*(uint64_t *)((char *)&a3->var11 + 1) < 1
        || (v22 = (char *)&a3->var12 + v10 + 1,
            [NSString stringWithCString:v22 encoding:4],
            uint64_t v23 = objc_claimAutoreleasedReturnValue(),
            v24 = (void *)*((void *)v4 + 2),
            *((void *)v4 + 2) = v23,
            v24,
            *((void *)v4 + 2)))
      {
        id v25 = [v4 fullPath];
        objc_super v26 = v25;
        if (v25)
        {
          id v27 = v25;
          if ([v27 fileSystemRepresentation])
          {
            uint64_t v28 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v27, "fileSystemRepresentation"));
            uint64_t v29 = *((void *)v4 + 12);
            *((void *)v4 + 12) = v28;
LABEL_51:

LABEL_52:
            v13 = (CacheManagementAsset *)v4;
            goto LABEL_53;
          }
          uint64_t v29 = CDGetLogHandle((uint64_t)"client");
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            goto LABEL_51;
          }
          v47 = (char *)*((void *)v4 + 4);
          *(_DWORD *)buf = 138412290;
          v50 = v47;
          v44 = "Unable to get absolute path (fileSystemRepresentation) for %@";
        }
        else
        {
          uint64_t v29 = CDGetLogHandle((uint64_t)"client");
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            goto LABEL_51;
          }
          v43 = (char *)*((void *)v4 + 4);
          *(_DWORD *)buf = 138412290;
          v50 = v43;
          v44 = "Unable to get absolute path (NSURL) for %@";
        }
        _os_log_error_impl(&dword_1A63D1000, v29, OS_LOG_TYPE_ERROR, v44, buf, 0xCu);
        goto LABEL_51;
      }
      v11 = CDGetLogHandle((uint64_t)"client");
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315138;
      v50 = v22;
      v34 = "stringWithCString failed for display name: %s";
      v35 = v11;
      uint32_t v36 = 12;
      goto LABEL_33;
    }
    v12 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v37 = "dataWithBytes failed for metadata";
      goto LABEL_37;
    }
LABEL_15:

    goto LABEL_16;
  }
  v11 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v30 = *(char **)((char *)&a3->var10 + 1);
    v31 = *(char **)((char *)&a3->var9 + 1);
    uint64_t v32 = *(int64_t *)((char *)&a3->var8 + 1);
    uint64_t v33 = *(void *)((char *)&a3->var6 + 1);
    *(_DWORD *)buf = 134218752;
    v50 = v30;
    __int16 v51 = 2048;
    v52 = v31;
    __int16 v53 = 2048;
    uint64_t v54 = v32;
    __int16 v55 = 2048;
    uint64_t v56 = v33;
    v34 = "Parameter error: asset values are invalid: metadata_len: %ld, content_type_len: %ld, relative_path_len: %ld, i"
          "dentifier_len: %ld";
    v35 = v11;
    uint32_t v36 = 42;
LABEL_33:
    _os_log_error_impl(&dword_1A63D1000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
  }
LABEL_13:

LABEL_16:
  v13 = 0;
LABEL_53:

  return v13;
}

- ($62504CD8620D4E4BE208444870B73508)createFlattenedAsset:(int64_t *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v5 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_super v48 = [(CacheManagementAsset *)self description];
    int v53 = 138412290;
    uint64_t v54 = (uint64_t)v48;
    _os_log_debug_impl(&dword_1A63D1000, v5, OS_LOG_TYPE_DEBUG, "flattening %@", (uint8_t *)&v53, 0xCu);
  }
  v6 = [(CacheManagementAsset *)self identifier];

  if (v6)
  {
    v7 = [(CacheManagementAsset *)self identifier];
    uint64_t v8 = [v7 maximumLengthOfBytesUsingEncoding:4];

    if (v8 <= -2)
    {
      v9 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v53 = 134217984;
        uint64_t v54 = 0;
        int v10 = "identifier is too long: %ld";
LABEL_61:
        _os_log_error_impl(&dword_1A63D1000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v53, 0xCu);
        goto LABEL_62;
      }
      goto LABEL_62;
    }
    uint64_t v11 = v8 + 1;
    size_t v12 = v8 + 90;
  }
  else
  {
    uint64_t v11 = 0;
    size_t v12 = 89;
  }
  v13 = [(CacheManagementAsset *)self relativePath];

  if (v13)
  {
    id v14 = [(CacheManagementAsset *)self relativePath];
    int64_t v15 = strlen((const char *)[v14 fileSystemRepresentation]);
    uint64_t v16 = v15 + 1;

    if (v15 <= -2)
    {
      v9 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v53 = 134217984;
        uint64_t v54 = v15 + 1;
        int v10 = "relative_path_len too long: %ld";
        goto LABEL_61;
      }
LABEL_62:

      return 0;
    }
    v12 += v16;
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = [(CacheManagementAsset *)self contentType];

  if (v17)
  {
    uint64_t v18 = [(CacheManagementAsset *)self contentType];
    uint64_t v19 = [v18 maximumLengthOfBytesUsingEncoding:4];
    uint64_t v20 = v19 + 1;

    if (v19 <= -2)
    {
      v9 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v53 = 134217984;
        uint64_t v54 = v19 + 1;
        int v10 = "content type too long: %ld";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
    v12 += v20;
  }
  else
  {
    uint64_t v20 = 0;
  }
  double v21 = [(CacheManagementAsset *)self metadata];

  if (v21)
  {
    v22 = [(CacheManagementAsset *)self metadata];
    uint64_t v23 = [v22 length];

    if (v23 < 0)
    {
      v9 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v53 = 134217984;
        uint64_t v54 = v23;
        int v10 = "metadata too long: %ld";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
    v12 += v23;
  }
  else
  {
    uint64_t v23 = 0;
  }
  v24 = [(CacheManagementAsset *)self displayName];

  if (v24)
  {
    id v25 = [(CacheManagementAsset *)self displayName];
    uint64_t v26 = [v25 maximumLengthOfBytesUsingEncoding:4];
    uint64_t v27 = v26 + 1;

    if (v26 <= -2)
    {
      v9 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v53 = 134217984;
        uint64_t v54 = v26 + 1;
        int v10 = "display name too long: %ld";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
    v12 += v27;
  }
  else
  {
    uint64_t v27 = 0;
  }
  uint64_t v28 = (char *)malloc_type_malloc(v12, 0x3F5E4A8EuLL);
  if (v28)
  {
    *(_DWORD *)uint64_t v28 = [(CacheManagementAsset *)self assetVersion];
    [(CacheManagementAsset *)self expiration_date];
    *(void *)(v28 + 4) = v29;
    [(CacheManagementAsset *)self consumed_date];
    *(void *)(v28 + 12) = v30;
    [(CacheManagementAsset *)self download_start_date];
    *(void *)(v28 + 20) = v31;
    [(CacheManagementAsset *)self download_completion_date];
    *(void *)(v28 + 28) = v32;
    [(CacheManagementAsset *)self last_viewed_date];
    *(void *)(v28 + 36) = v33;
    *((_DWORD *)v28 + 11) = [(CacheManagementAsset *)self priority];
    *(void *)(v28 + 49) = v11;
    *(void *)(v28 + 57) = v16;
    *(void *)(v28 + 65) = v20;
    *(void *)(v28 + 73) = v23;
    *(void *)(v28 + 81) = v27;
    if (v11)
    {
      v34 = [(CacheManagementAsset *)self identifier];
      char v35 = [v34 getCString:v28 + 89 maxLength:*(void *)(v28 + 49) encoding:4];

      if ((v35 & 1) == 0)
      {
        uint32_t v36 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v49 = [(CacheManagementAsset *)self identifier];
          int v53 = 138412290;
          uint64_t v54 = (uint64_t)v49;
          _os_log_error_impl(&dword_1A63D1000, v36, OS_LOG_TYPE_ERROR, "unable to copy identifier: %@", (uint8_t *)&v53, 0xCu);
        }
      }
      LODWORD(v11) = *(_DWORD *)(v28 + 49);
      uint64_t v16 = *(void *)(v28 + 57);
    }
    if (v16 >= 1)
    {
      id v37 = [(CacheManagementAsset *)self relativePath];
      int64_t v38 = strlcpy(&v28[(int)v11 + 89], (const char *)[v37 fileSystemRepresentation], *(void *)(v28 + 57));

      if (v16 <= v38)
      {
        uint32_t v39 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v50 = [(CacheManagementAsset *)self relativePath];
          int v53 = 138412290;
          uint64_t v54 = (uint64_t)v50;
          _os_log_error_impl(&dword_1A63D1000, v39, OS_LOG_TYPE_ERROR, "unable to copy relative path: %@", (uint8_t *)&v53, 0xCu);
        }
      }
      LODWORD(v11) = v11 + *(_DWORD *)(v28 + 57);
    }
    if (*(uint64_t *)(v28 + 65) >= 1)
    {
      v40 = [(CacheManagementAsset *)self contentType];
      char v41 = [v40 getCString:&v28[(int)v11 + 89] maxLength:*(void *)(v28 + 65) encoding:4];

      if ((v41 & 1) == 0)
      {
        v42 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          __int16 v51 = [(CacheManagementAsset *)self contentType];
          int v53 = 138412290;
          uint64_t v54 = (uint64_t)v51;
          _os_log_error_impl(&dword_1A63D1000, v42, OS_LOG_TYPE_ERROR, "unable to copy contentType: %@", (uint8_t *)&v53, 0xCu);
        }
      }
      LODWORD(v11) = v11 + *(_DWORD *)(v28 + 65);
    }
    if (*(uint64_t *)(v28 + 73) >= 1)
    {
      id v43 = [(CacheManagementAsset *)self metadata];
      memcpy(&v28[(int)v11 + 89], (const void *)[v43 bytes], *(void *)(v28 + 73));

      LODWORD(v11) = v11 + *(_DWORD *)(v28 + 73);
    }
    if (*(uint64_t *)(v28 + 81) >= 1)
    {
      v44 = [(CacheManagementAsset *)self displayName];
      char v45 = [v44 getCString:&v28[(int)v11 + 89] maxLength:*(void *)(v28 + 81) encoding:4];

      if ((v45 & 1) == 0)
      {
        v46 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v52 = [(CacheManagementAsset *)self displayName];
          int v53 = 138412290;
          uint64_t v54 = (uint64_t)v52;
          _os_log_error_impl(&dword_1A63D1000, v46, OS_LOG_TYPE_ERROR, "unable to copy displayName: %@", (uint8_t *)&v53, 0xCu);
        }
      }
    }
    if (a3) {
      *a3 = v12;
    }
  }
  return ($62504CD8620D4E4BE208444870B73508 *)v28;
}

+ (id)assetWithRelativePath:(id)a3 identifier:(id)a4 expirationDate:(id)a5 contentType:(id)a6 metadata:(id)a7 priority:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13 && [v13 length])
  {
    uint64_t v18 = stripScheme(v13);
    if (v18)
    {
LABEL_4:
      uint64_t v19 = [[CacheManagementAsset alloc] initWithRelativePath:v13 identifier:v14 expirationDate:v15 contentType:v16 metadata:v17 priority:v8];
      goto LABEL_8;
    }
    uint64_t v21 = fullPathToAsset(v13, v14);
    if (v21)
    {
      v22 = (void *)v21;
      bzero(buf, 0x400uLL);
      id v23 = v22;
      if (realpath_DARWIN_EXTSN((const char *)[v23 fileSystemRepresentation], (char *)buf))
      {

        goto LABEL_4;
      }
      v24 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = [v23 fileSystemRepresentation];
        uint64_t v26 = __error();
        uint64_t v27 = strerror(*v26);
        int v28 = 136446466;
        uint64_t v29 = v25;
        __int16 v30 = 2082;
        uint64_t v31 = v27;
        _os_log_error_impl(&dword_1A63D1000, v24, OS_LOG_TYPE_ERROR, "realpath failed for %{public}s : %{public}s", (uint8_t *)&v28, 0x16u);
      }
    }
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v13;
      _os_log_error_impl(&dword_1A63D1000, v18, OS_LOG_TYPE_ERROR, "parameter error relativePath: %@", buf, 0xCu);
    }
  }
  uint64_t v19 = 0;
LABEL_8:

  return v19;
}

+ (id)assetFromData:(id)a3
{
  v3 = -[CacheManagementAsset initWithFlattenedAsset:]([CacheManagementAsset alloc], "initWithFlattenedAsset:", [a3 bytes]);
  return v3;
}

+ (id)assetFromFile:(id)a3 withIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412802;
    uint64_t v18 = objc_opt_class();
    __int16 v19 = 2112;
    id v20 = v5;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_debug_impl(&dword_1A63D1000, v7, OS_LOG_TYPE_DEBUG, "assetFromFile: (%@) %@ withIdentifier: %@", (uint8_t *)&v17, 0x20u);
  }

  if (!v5 || ![v5 length])
  {
    v9 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      uint64_t v18 = (uint64_t)v5;
      _os_log_error_impl(&dword_1A63D1000, v9, OS_LOG_TYPE_ERROR, "parameter error relativePath: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_9;
  }
  uint64_t v8 = stripScheme(v5);
  if (v8)
  {
    v9 = v8;
    int v10 = +[CacheManagementAsset assetFromPath:v8 withIdentifier:v6];
    goto LABEL_10;
  }
  size_t v12 = fullPathToAsset(v5, v6);
  if (!v12)
  {
    id v16 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543618;
      uint64_t v18 = (uint64_t)v5;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_error_impl(&dword_1A63D1000, v16, OS_LOG_TYPE_ERROR, "unable to create full path for relativePath: %{public}@, and identifier: %{public}@", (uint8_t *)&v17, 0x16u);
    }

    v9 = 0;
LABEL_9:
    int v10 = 0;
    goto LABEL_10;
  }
  id v13 = NSString;
  id v14 = v12;
  id v15 = objc_msgSend(v13, "stringWithUTF8String:", objc_msgSend(v14, "fileSystemRepresentation"));
  int v10 = +[CacheManagementAsset assetFromPath:v15 withIdentifier:v6];

  v9 = 0;
LABEL_10:

  return v10;
}

+ (id)assetFromPath:(id)a3 withIdentifier:(id)a4 createIfAbsent:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7 && [v7 length])
  {
    stripScheme(v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    int v10 = nonContainerForID((uint64_t)v8);
    bzero(v87, 0x400uLL);
    if (!v9) {
      id v9 = v7;
    }
    uint64_t v11 = v9;
    if (!realpath_DARWIN_EXTSN((const char *)[v11 fileSystemRepresentation], (char *)v87))
    {
      __int16 v21 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v74 = [v11 fileSystemRepresentation];
        v75 = __error();
        v76 = strerror(*v75);
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = v74;
        *(_WORD *)&buf[12] = 2082;
        *(void *)v86 = v76;
        _os_log_error_impl(&dword_1A63D1000, v21, OS_LOG_TYPE_ERROR, "realpath failed for %{public}s : %{public}s", buf, 0x16u);
      }
      id v20 = 0;
      goto LABEL_85;
    }
    if (v10)
    {
      size_t v12 = [NSString stringWithUTF8String:v87];
      id v13 = NSString;
      v79 = v10;
      id v14 = v10;
      id v15 = objc_msgSend(v13, "stringWithUTF8String:", objc_msgSend(v14, "fileSystemRepresentation"));
      [v12 rangeOfString:v15];
      uint64_t v17 = v16;

      if (!v17)
      {
        __int16 v21 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = [v14 fileSystemRepresentation];
          *(_WORD *)&buf[12] = 2082;
          *(void *)v86 = v87;
          _os_log_error_impl(&dword_1A63D1000, v21, OS_LOG_TYPE_ERROR, "Asset is not in expected location: %{public}s asset: %{public}s", buf, 0x16u);
        }
        id v20 = 0;
        int v10 = v79;
        goto LABEL_85;
      }
      uint64_t v18 = [NSString stringWithUTF8String:v87];
      __int16 v19 = [v18 substringFromIndex:v17];

      int v10 = v79;
    }
    else
    {
      __int16 v19 = 0;
    }
    XAttr = getXAttr((const char *)v87, "com.apple.CacheManagementAsset", 0);
    uint64_t v23 = XAttr;
    if (XAttr)
    {
      if (*XAttr == 2)
      {
        v24 = v10;
        uint64_t v25 = [[CacheManagementAsset alloc] initWithFlattenedAsset:XAttr];
        if (v25)
        {
          uint64_t v26 = v25;
          [NSString stringWithUTF8String:v87];
          int v28 = v27 = v23;
          [v26 setAbsolutePath:v28];

          uint64_t v29 = v27;
          __int16 v30 = 0;
          id v31 = 0;
LABEL_83:
          free(v29);
          goto LABEL_84;
        }
        uint64_t v32 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = v87;
          _os_log_error_impl(&dword_1A63D1000, v32, OS_LOG_TYPE_ERROR, "unable to create asset from file: %{public}s", buf, 0xCu);
        }
LABEL_32:
        v78 = v23;

        if (v19)
        {
          v24 = v10;
          id v31 = 0;
          __int16 v30 = 0;
        }
        else
        {
          id v77 = v8;
          __int16 v30 = [MEMORY[0x1E4F1CA48] array];
          id v37 = [NSString stringWithUTF8String:v87];
          int64_t v38 = [v37 componentsSeparatedByString:@"/"];

          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id v31 = v38;
          uint64_t v39 = [v31 countByEnumeratingWithState:&v80 objects:v84 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            BOOL v41 = 0;
            uint64_t v42 = *(void *)v81;
            do
            {
              for (uint64_t i = 0; i != v40; ++i)
              {
                if (*(void *)v81 != v42) {
                  objc_enumerationMutation(v31);
                }
                v44 = *(void **)(*((void *)&v80 + 1) + 8 * i);
                if (v41)
                {
                  [v30 addObject:*(void *)(*((void *)&v80 + 1) + 8 * i)];
                  BOOL v41 = 1;
                }
                else
                {
                  uint64_t v45 = [*(id *)(*((void *)&v80 + 1) + 8 * i) rangeOfString:@"com.apple.UserManagedAssets."];
                  if (v46 == 28)
                  {
                    uint64_t v47 = v45;
                    BOOL v41 = [v44 length] == 34 && v47 == 0;
                  }
                  else
                  {
                    BOOL v41 = 0;
                  }
                }
              }
              uint64_t v40 = [v31 countByEnumeratingWithState:&v80 objects:v84 count:16];
            }
            while (v40);
          }

          __int16 v19 = [v30 componentsJoinedByString:@"/"];
          id v8 = v77;
          v24 = v10;
        }
        uint64_t v49 = [v19 length];
        v50 = CDGetLogHandle((uint64_t)"client");
        BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
        if (v49)
        {
          if (v51)
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v19;
            _os_log_impl(&dword_1A63D1000, v50, OS_LOG_TYPE_DEFAULT, "got relative path: %{public}@", buf, 0xCu);
          }
          unint64_t v52 = 0x1E4F29000;
        }
        else
        {
          if (v51)
          {
            int v53 = [NSString stringWithUTF8String:v87];
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v53;
            _os_log_impl(&dword_1A63D1000, v50, OS_LOG_TYPE_DEFAULT, "relative path is zero length, using path: %{public}@", buf, 0xCu);
          }
          unint64_t v52 = 0x1E4F29000uLL;
          [NSString stringWithUTF8String:v87];
          __int16 v19 = v50 = v19;
        }

        uint64_t v26 = +[CacheManagementAsset assetWithRelativePath:v19 identifier:v8 expirationDate:0 contentType:0 metadata:0 priority:0];
        uint64_t v54 = [*(id *)(v52 + 24) stringWithUTF8String:v87];
        [v26 setAbsolutePath:v54];

        if (v26)
        {
          uint64_t v55 = [v26 displayName];

          if (!v55)
          {
            uint64_t v56 = CDGetLogHandle((uint64_t)"client");
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v57 = [v26 relativePath];
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v57;
              _os_log_impl(&dword_1A63D1000, v56, OS_LOG_TYPE_DEFAULT, "looking for legacy display name in %{public}@", buf, 0xCu);
            }
            v58 = getXAttr((const char *)v87, "com.apple.coremedia.asset.name", 0);
            if (v58)
            {
              v59 = v58;
              v60 = CDGetLogHandle((uint64_t)"client");
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446210;
                *(void *)&uint8_t buf[4] = v59;
                _os_log_impl(&dword_1A63D1000, v60, OS_LOG_TYPE_DEFAULT, "legacy display name: %{public}s", buf, 0xCu);
              }

              v61 = [NSString stringWithUTF8String:v59];
              free(v59);
            }
            else
            {
              v61 = 0;
            }
            [v26 setDisplayName:v61];

            v62 = [v26 displayName];

            if (v62)
            {
              v63 = CDGetLogHandle((uint64_t)"client");
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                v64 = [v26 displayName];
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v64;
                _os_log_impl(&dword_1A63D1000, v63, OS_LOG_TYPE_DEFAULT, "using legacy display name: %{public}@", buf, 0xCu);
              }
            }
          }
          v65 = [v26 metadata];

          if (!v65)
          {
            v66 = CDGetLogHandle((uint64_t)"client");
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              v67 = [v26 relativePath];
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v67;
              _os_log_impl(&dword_1A63D1000, v66, OS_LOG_TYPE_DEFAULT, "looking for legacy metadata in %{public}@", buf, 0xCu);
            }
            *(void *)buf = 0;
            v68 = getXAttr((const char *)v87, "com.apple.coremedia.asset.image", (ssize_t *)buf);
            if (v68)
            {
              v69 = v68;
              v70 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v68 length:*(void *)buf];
              free(v69);
            }
            else
            {
              v70 = 0;
            }
            [v26 setMetadata:v70];

            v71 = [v26 metadata];

            if (v71)
            {
              v72 = CDGetLogHandle((uint64_t)"client");
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A63D1000, v72, OS_LOG_TYPE_DEFAULT, "using legacy metadata", buf, 2u);
              }
            }
          }
        }
        uint64_t v29 = v78;
        if (!v78) {
          goto LABEL_84;
        }
        goto LABEL_83;
      }
      uint64_t v32 = CDGetLogHandle((uint64_t)"client");
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      int v36 = *v23;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 2;
      *(_WORD *)v86 = 2082;
      *(void *)&v86[2] = v87;
      id v33 = "asset version (%u) is not compatible with this version of CacheManagementAsset(%u). file: %{public}s. Will c"
            "reate a new asset.";
      uint64_t v34 = v32;
      uint32_t v35 = 24;
    }
    else
    {
      if (!v5)
      {
        v24 = v10;
        uint64_t v26 = 0;
        __int16 v30 = 0;
        id v31 = 0;
LABEL_84:
        __int16 v21 = v26;

        id v20 = v21;
        int v10 = v24;
LABEL_85:

        goto LABEL_86;
      }
      uint64_t v32 = CDGetLogHandle((uint64_t)"client");
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      *(_WORD *)buf = 0;
      id v33 = "no asset on the file, will try to create one";
      uint64_t v34 = v32;
      uint32_t v35 = 2;
    }
    _os_log_impl(&dword_1A63D1000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
    goto LABEL_32;
  }
  uint64_t v11 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v87 = 138412290;
    id v88 = v7;
    _os_log_error_impl(&dword_1A63D1000, v11, OS_LOG_TYPE_ERROR, "parameter error absolutePath: %@", v87, 0xCu);
  }
  id v20 = 0;
LABEL_86:

  return v20;
}

+ (id)assetFromPath:(id)a3 withIdentifier:(id)a4
{
  return (id)[a1 assetFromPath:a3 withIdentifier:a4 createIfAbsent:1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(CacheManagementAsset *)self createFlattenedAsset:0];
  BOOL v5 = +[CacheManagementAsset allocWithZone:a3];
  return [(CacheManagementAsset *)v5 initWithFlattenedAsset:v4];
}

- (CacheManagementAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  if (self)
  {
    BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_MANAGEMENT_ASSET_DATA"];
    if (!v5)
    {
      id v7 = 0;
      goto LABEL_6;
    }
    id v6 = v5;
    self = -[CacheManagementAsset initWithFlattenedAsset:](self, "initWithFlattenedAsset:", [v6 bytes]);
  }
  self = self;
  id v7 = self;
LABEL_6:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  BOOL v5 = [(CacheManagementAsset *)self createFlattenedAsset:&v7];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:v7];
    [v4 encodeObject:v6 forKey:@"CACHE_MANAGEMENT_ASSET_DATA"];
  }
}

- (void)setExpirationDate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_debug_impl(&dword_1A63D1000, v5, OS_LOG_TYPE_DEBUG, "setExpirationDate: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4) {
    [v4 timeIntervalSinceReferenceDate];
  }
  else {
    double v6 = nan("");
  }
  [(CacheManagementAsset *)self setExpiration_date:v6];
}

- (id)expirationDate
{
  [(CacheManagementAsset *)self expiration_date];
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  [(CacheManagementAsset *)self expiration_date];
  id v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return v4;
}

- (void)setConsumedDate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_debug_impl(&dword_1A63D1000, v5, OS_LOG_TYPE_DEBUG, "setConsumedDate: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4) {
    [v4 timeIntervalSinceReferenceDate];
  }
  else {
    double v6 = nan("");
  }
  [(CacheManagementAsset *)self setConsumed_date:v6];
}

- (id)consumedDate
{
  [(CacheManagementAsset *)self consumed_date];
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  [(CacheManagementAsset *)self consumed_date];
  id v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return v4;
}

- (void)setDownloadStartDate:(id)a3
{
  if (a3) {
    [a3 timeIntervalSinceReferenceDate];
  }
  else {
    double v4 = nan("");
  }
  [(CacheManagementAsset *)self setDownload_start_date:v4];
}

- (id)downloadStartDate
{
  [(CacheManagementAsset *)self download_start_date];
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  [(CacheManagementAsset *)self download_start_date];
  double v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return v4;
}

- (void)setDownloadCompletionDate:(id)a3
{
  if (a3) {
    [a3 timeIntervalSinceReferenceDate];
  }
  else {
    double v4 = nan("");
  }
  [(CacheManagementAsset *)self setDownload_completion_date:v4];
}

- (id)downloadCompletionDate
{
  [(CacheManagementAsset *)self download_completion_date];
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  [(CacheManagementAsset *)self download_completion_date];
  double v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return v4;
}

- (void)setLastViewedDate:(id)a3
{
  if (a3) {
    [a3 timeIntervalSinceReferenceDate];
  }
  else {
    double v4 = nan("");
  }
  [(CacheManagementAsset *)self setLast_viewed_date:v4];
}

- (id)lastViewedDate
{
  [(CacheManagementAsset *)self last_viewed_date];
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  [(CacheManagementAsset *)self last_viewed_date];
  double v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return v4;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (id)fullPath
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(CacheManagementAsset *)self absolutePath];

  if (v3)
  {
    -[CacheManagementAsset absolutePath](self, "absolutePath", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0);
    id v4 = objc_claimAutoreleasedReturnValue();
    int v5 = stat((const char *)[v4 fileSystemRepresentation], &v17);

    if (!v5)
    {
      id v14 = (void *)MEMORY[0x1E4F1CB10];
      id v13 = [(CacheManagementAsset *)self absolutePath];
      uint64_t v15 = [v13 fileSystemRepresentation];
      [v14 fileURLWithFileSystemRepresentation:v15 isDirectory:(v17.st_mode & 0xF000) == 0x4000 relativeToURL:0];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    [(CacheManagementAsset *)self setAbsolutePath:0];
  }
  else
  {
    double v6 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [(CacheManagementAsset *)self identifier];
      id v8 = [(CacheManagementAsset *)self relativePath];
      v17.st_dev = 138412546;
      *(void *)&v17.st_mode = v7;
      WORD2(v17.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v17.st_ino + 6) = (__darwin_ino64_t)v8;
      _os_log_impl(&dword_1A63D1000, v6, OS_LOG_TYPE_DEFAULT, "[%@] No AbsolutePath, calculating for relativePath: \"%@\"", (uint8_t *)&v17, 0x16u);
    }
  }
  uint64_t v9 = [(CacheManagementAsset *)self relativePath];
  int v10 = [(CacheManagementAsset *)self identifier];
  fullPathToAsset(v9, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11) {
    goto LABEL_11;
  }
  size_t v12 = NSString;
  id v11 = v11;
  objc_msgSend(v12, "stringWithUTF8String:", objc_msgSend(v11, "fileSystemRepresentation"));
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [(CacheManagementAsset *)self setAbsolutePath:v13];
LABEL_10:

LABEL_11:
  return v11;
}

- (void)commit
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0;
  v3 = [(CacheManagementAsset *)self createFlattenedAsset:&v30];
  if (!v3) {
    return;
  }
  p_var0 = &v3->var0;
  int v5 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = flattenedAssetDescription(p_var0);
    *(_DWORD *)buf = 138412290;
    size_t v32 = (size_t)v6;
    _os_log_impl(&dword_1A63D1000, v5, OS_LOG_TYPE_DEFAULT, "attempting to commit flattenedAsset: %@", buf, 0xCu);
  }
  id v7 = [(CacheManagementAsset *)self fullPath];
  id v8 = [(CacheManagementAsset *)self absolutePath];

  if (!v8)
  {
    uint64_t v9 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      stat v17 = [(CacheManagementAsset *)self description];
      *(_DWORD *)buf = 138412290;
      size_t v32 = (size_t)v17;
      _os_log_error_impl(&dword_1A63D1000, v9, OS_LOG_TYPE_ERROR, "Unable to get absolute path for: %@", buf, 0xCu);
    }
    goto LABEL_23;
  }
  uint64_t v9 = flattenedAssetDescription(p_var0);
  id v10 = [(CacheManagementAsset *)self absolutePath];
  id v11 = (const char *)[v10 fileSystemRepresentation];
  size_t v12 = v30;
  if (v30 < 1)
  {
    uint64_t v18 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      size_t v32 = v12;
      _os_log_error_impl(&dword_1A63D1000, v18, OS_LOG_TYPE_ERROR, "parameter error: buflen is less than zero (%ld)", buf, 0xCu);
    }

    goto LABEL_16;
  }
  id v13 = v11;
  int v14 = openFile(v11);
  if (v14 != -1)
  {
    int v15 = v14;
    if (fsetxattr(v14, "com.apple.CacheManagementAsset", p_var0, v12, 0, 0))
    {
      uint64_t v16 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v28 = __error();
        uint64_t v29 = strerror(*v28);
        *(_DWORD *)buf = 136315394;
        size_t v32 = (size_t)v13;
        __int16 v33 = 2080;
        uint64_t v34 = (uint64_t)v29;
        _os_log_error_impl(&dword_1A63D1000, v16, OS_LOG_TYPE_ERROR, "fsetxattr(%s) failed: %s", buf, 0x16u);
      }

      close(v15);
      goto LABEL_16;
    }
    close(v15);

    id v20 = [(CacheManagementAsset *)self absolutePath];
    removexattr((const char *)[v20 fileSystemRepresentation], "com.apple.coremedia.asset.name", 1);

    id v21 = [(CacheManagementAsset *)self absolutePath];
    removexattr((const char *)[v21 fileSystemRepresentation], "com.apple.coremedia.asset.image", 1);

    id v22 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = v30;
      id v24 = [(CacheManagementAsset *)self absolutePath];
      uint64_t v25 = [v24 fileSystemRepresentation];
      uint64_t v26 = @"no asset description available";
      *(_DWORD *)buf = 134218498;
      size_t v32 = v23;
      if (v9) {
        uint64_t v26 = (__CFString *)v9;
      }
      __int16 v33 = 2080;
      uint64_t v34 = v25;
      __int16 v35 = 2112;
      int v36 = v26;
      _os_log_impl(&dword_1A63D1000, v22, OS_LOG_TYPE_DEFAULT, "wrote asset (%ld bytes) to file: %s %@", buf, 0x20u);
    }
LABEL_23:

    free(p_var0);
    return;
  }
LABEL_16:

  __int16 v19 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = @"no asset description available";
    if (v9) {
      uint64_t v27 = (__CFString *)v9;
    }
    *(_DWORD *)buf = 138412290;
    size_t v32 = (size_t)v27;
    _os_log_error_impl(&dword_1A63D1000, v19, OS_LOG_TYPE_ERROR, "setXAttr failed, unable to commit the asset to disk. %@", buf, 0xCu);
  }

  free(p_var0);
}

- (int)purgeabilityScoreAtUrgency:(int)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  uint64_t v8 = [(CacheManagementAsset *)self expirationDate];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    id v10 = [(CacheManagementAsset *)self expirationDate];
    [v10 timeIntervalSinceReferenceDate];
    double v12 = v11;

    if (v7 > v12) {
      goto LABEL_8;
    }
  }
  id v13 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [(CacheManagementAsset *)self relativePath];
    int v15 = [(CacheManagementAsset *)self expirationDate];
    [v15 timeIntervalSinceReferenceDate];
    int v40 = 138412802;
    BOOL v41 = v14;
    __int16 v42 = 2048;
    *(void *)id v43 = v16;
    *(_WORD *)&v43[8] = 2048;
    double v44 = v7;
    _os_log_impl(&dword_1A63D1000, v13, OS_LOG_TYPE_DEFAULT, "%@ CacheManagementAssetPurgeabilityScore expirationDate: %f, now: %f", (uint8_t *)&v40, 0x20u);
  }
  if ([(CacheManagementAsset *)self priority] > a3 || ![(CacheManagementAsset *)self priority]) {
    goto LABEL_22;
  }
  if ([(CacheManagementAsset *)self priority] == 1
    || a3 >= 2 && [(CacheManagementAsset *)self priority] <= a3)
  {
LABEL_8:
    int v17 = 1;
    goto LABEL_23;
  }
  uint64_t v18 = [(CacheManagementAsset *)self consumedDate];
  if (v18)
  {
    __int16 v19 = (void *)v18;
    id v20 = [(CacheManagementAsset *)self consumedDate];
    [v20 timeIntervalSinceReferenceDate];
    double v22 = v21;

    if (v7 > v22)
    {
      int v17 = 2;
      goto LABEL_23;
    }
  }
  uint64_t v23 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [(CacheManagementAsset *)self relativePath];
    uint64_t v25 = [(CacheManagementAsset *)self downloadStartDate];
    [v25 timeIntervalSinceReferenceDate];
    int v40 = 138412802;
    BOOL v41 = v24;
    __int16 v42 = 2048;
    *(void *)id v43 = v26;
    *(_WORD *)&v43[8] = 2048;
    double v44 = v7;
    _os_log_impl(&dword_1A63D1000, v23, OS_LOG_TYPE_DEFAULT, "%@ CacheManagementAssetPurgeabilityScore downloadStartDate: %f, now: %f", (uint8_t *)&v40, 0x20u);
  }
  uint64_t v27 = [(CacheManagementAsset *)self downloadStartDate];
  if (v27)
  {
    int v28 = (void *)v27;
    uint64_t v29 = [(CacheManagementAsset *)self downloadStartDate];
    [v29 timeIntervalSinceReferenceDate];
    double v31 = v7 - v30;

    if (v31 > 129600.0)
    {
      int v17 = 4;
      goto LABEL_23;
    }
  }
  size_t v32 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v33 = [(CacheManagementAsset *)self relativePath];
    uint64_t v34 = [(CacheManagementAsset *)self downloadStartDate];
    [v34 timeIntervalSinceReferenceDate];
    int v40 = 138412802;
    BOOL v41 = v33;
    __int16 v42 = 2048;
    *(void *)id v43 = v35;
    *(_WORD *)&v43[8] = 2048;
    double v44 = v7;
    _os_log_impl(&dword_1A63D1000, v32, OS_LOG_TYPE_DEFAULT, "%@ CacheManagementAssetPurgeabilityScore downloadStartDate: %f, now: %f", (uint8_t *)&v40, 0x20u);
  }
LABEL_22:
  int v17 = 0;
LABEL_23:
  int v36 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = [(CacheManagementAsset *)self relativePath];
    int v38 = [(CacheManagementAsset *)self priority];
    int v40 = 138413058;
    BOOL v41 = v37;
    __int16 v42 = 1024;
    *(_DWORD *)id v43 = v17;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v38;
    LOWORD(v44) = 1024;
    *(_DWORD *)((char *)&v44 + 2) = a3;
    _os_log_impl(&dword_1A63D1000, v36, OS_LOG_TYPE_DEFAULT, "%@ CacheManagementAssetPurgeabilityScore assigning score %d, priority: %d, urgency: %d", (uint8_t *)&v40, 0x1Eu);
  }
  return v17;
}

- (int64_t)size
{
  id v3 = [(CacheManagementAsset *)self fullPath];
  id v4 = [(CacheManagementAsset *)self absolutePath];

  if (!v4) {
    return -1;
  }
  int v5 = [(CacheManagementAsset *)self absolutePath];
  int64_t v6 = diskUsageList(v5, 0);

  return v6;
}

- (int64_t)sizeCached:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1EB30C3A8 != -1) {
    dispatch_once(&qword_1EB30C3A8, &__block_literal_global);
  }
  if (v3)
  {
    int v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", *(double *)&_MergedGlobals_0);
    [v5 timeIntervalSinceReferenceDate];
    if (v6 - *(double *)&_MergedGlobals_0 <= 300.0)
    {
      uint64_t v7 = sizeCached__result;

      if (v7 != -1) {
        return sizeCached__result;
      }
    }
    else
    {
    }
  }
  int64_t result = [(CacheManagementAsset *)self size];
  sizeCached__int64_t result = result;
  return result;
}

void __35__CacheManagementAsset_sizeCached___block_invoke()
{
  _MergedGlobals_0 = nan("");
}

- (id)description
{
  id v20 = NSString;
  __int16 v19 = [(CacheManagementAsset *)self displayName];
  id v21 = [(CacheManagementAsset *)self relativePath];
  uint64_t v17 = [v21 fileSystemRepresentation];
  uint64_t v16 = [(CacheManagementAsset *)self identifier];
  BOOL v3 = [(CacheManagementAsset *)self contentType];
  uint64_t v15 = [(CacheManagementAsset *)self priority];
  uint64_t v4 = [(CacheManagementAsset *)self purgeabilityScoreAtUrgency:2];
  uint64_t v18 = [(CacheManagementAsset *)self thumbnailData];
  if (v18) {
    int v5 = "YES";
  }
  else {
    int v5 = "NO";
  }
  int64_t v6 = [(CacheManagementAsset *)self size];
  uint64_t v7 = [(CacheManagementAsset *)self expirationDate];
  uint64_t v8 = [(CacheManagementAsset *)self downloadStartDate];
  uint64_t v9 = [(CacheManagementAsset *)self downloadCompletionDate];
  id v10 = [(CacheManagementAsset *)self consumedDate];
  double v11 = [(CacheManagementAsset *)self lastViewedDate];
  double v12 = [(CacheManagementAsset *)self absolutePath];
  id v13 = [v20 stringWithFormat:@"CacheManagementAsset displayName: %@, relativePath: %s, identifier: %@, contentType: %@\npriority: %d, purgeabilityScore [u:2]: %d, has thumbnail: %s, size: %lld\nexpirationDate: %@\ndownloadStartDate: %@\ndownloadCompletionDate: %@\nconsumedDate: %@\nlastViewedDate: %@\nabsolutePath: %@", v19, v17, v16, v3, v15, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_priority = a3;
}

- (unsigned)assetVersion
{
  return self->_assetVersion;
}

- (double)expiration_date
{
  return self->_expiration_date;
}

- (void)setExpiration_date:(double)a3
{
  self->_expiration_date = a3;
}

- (double)consumed_date
{
  return self->_consumed_date;
}

- (void)setConsumed_date:(double)a3
{
  self->_consumed_date = a3;
}

- (double)download_start_date
{
  return self->_download_start_date;
}

- (void)setDownload_start_date:(double)a3
{
  self->_download_start_date = a3;
}

- (double)download_completion_date
{
  return self->_download_completion_date;
}

- (void)setDownload_completion_date:(double)a3
{
  self->_download_completion_date = a3;
}

- (double)last_viewed_date
{
  return self->_last_viewed_date;
}

- (void)setLast_viewed_date:(double)a3
{
  self->_last_viewed_date = a3;
}

- (NSString)absolutePath
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAbsolutePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_absolutePath, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end