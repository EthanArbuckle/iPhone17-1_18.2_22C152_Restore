@interface PHCPAnalyticsCachedPropertyProvider
- (PHCPAnalyticsCachedPropertyProvider)init;
- (PHCPAnalyticsCachedPropertyProvider)initWithPhotoLibrary:(id)a3;
- (PHPhotoLibrary)photoLibrary;
- (id)_cachedProperties;
- (id)_librarySizeRange:(int64_t)a3;
- (void)registerSystemProperties:(id)a3;
@end

@implementation PHCPAnalyticsCachedPropertyProvider

- (void).cxx_destruct
{
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  return (PHPhotoLibrary *)WeakRetained;
}

- (id)_librarySizeRange:(int64_t)a3
{
  if (!a3) {
    return @"LibrarySizeRangeEmpty";
  }
  if (a3 < 501) {
    return @"LibrarySizeRangeVerySmall";
  }
  if ((unint64_t)a3 < 0x7D1) {
    return @"LibrarySizeRangeSmall";
  }
  if ((unint64_t)a3 < 0x1389) {
    return @"LibrarySizeRangeMedium5K";
  }
  if ((unint64_t)a3 < 0x2711) {
    return @"LibrarySizeRangeMedium10K";
  }
  if ((unint64_t)a3 < 0x7531) {
    return @"LibrarySizeRangeLarge20K";
  }
  if ((unint64_t)a3 < 0x9C41) {
    return @"LibrarySizeRangeLarge30K";
  }
  if ((unint64_t)a3 < 0xC351) {
    return @"LibrarySizeRangeLarge40K";
  }
  if ((unint64_t)a3 < 0x124F9) {
    return @"LibrarySizeRangeLarge50K";
  }
  if ((unint64_t)a3 >= 0x186A1) {
    return @"LibrarySizeRangeHuge";
  }
  return @"LibrarySizeRangeVeryLarge";
}

- (id)_cachedProperties
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(id)*MEMORY[0x1E4F8C5C8] UTF8String];
  v3 = (void *)xpc_copy_entitlement_for_self();
  [(id)*MEMORY[0x1E4F8C5D0] UTF8String];
  uint64_t v4 = xpc_copy_entitlement_for_self();
  v5 = (void *)v4;
  if (v3 == (void *)MEMORY[0x1E4F14518] || v4 == MEMORY[0x1E4F14518])
  {
    v7 = [(PHCPAnalyticsCachedPropertyProvider *)self photoLibrary];
    v17 = [v7 urlForApplicationDataFolderIdentifier:9];

    v8 = *MEMORY[0x1E4F565B8];
    v9 = [v17 URLByAppendingPathComponent:*MEMORY[0x1E4F565B8]];
    if (v9)
    {
      v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      v11 = [v9 path];
      char v12 = [v10 fileExistsAtPath:v11];

      if (v12)
      {
        id v20 = 0;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v9 error:&v20];
        v14 = v20;
        if (v14)
        {
          v15 = CPAnalyticsLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v14;
            _os_log_error_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "CPAnalytics failed loading cache file. Error:%@", buf, 0xCu);
          }

          id v16 = (id)MEMORY[0x1E4F1CC08];
        }
        else
        {
          id v16 = v13;
        }

        goto LABEL_22;
      }
      v14 = CPAnalyticsLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_INFO, "Cache file will be missing until the first nightly caching task is done. Log message instead of error", buf, 2u);
      }
    }
    else
    {
      v14 = CPAnalyticsLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v8;
        __int16 v23 = 2112;
        v24 = v17;
        _os_log_error_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "Failed creating %@ url from baseUrl %@", buf, 0x16u);
      }
    }
    id v16 = (id)MEMORY[0x1E4F1CC08];
LABEL_22:

    goto LABEL_23;
  }
  v17 = CPAnalyticsLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_INFO, "CPAnalytics Cache not entitled.", buf, 2u);
  }
  id v16 = (id)MEMORY[0x1E4F1CC08];
LABEL_23:

  return v16;
}

- (void)registerSystemProperties:(id)a3
{
  id v58 = a3;
  v41 = self;
  v52 = [(PHCPAnalyticsCachedPropertyProvider *)self _cachedProperties];
  uint64_t v4 = [v52 objectForKeyedSubscript:*MEMORY[0x1E4F563D0]];
  uint64_t v5 = *MEMORY[0x1E4F56610];
  v55 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F56610]];
  uint64_t v51 = *MEMORY[0x1E4F56620];
  v6 = objc_msgSend(v4, "objectForKeyedSubscript:");
  uint64_t v49 = *MEMORY[0x1E4F565C8];
  v54 = objc_msgSend(v4, "objectForKeyedSubscript:");
  uint64_t v47 = *MEMORY[0x1E4F565F0];
  v56 = objc_msgSend(v4, "objectForKeyedSubscript:");
  uint64_t v45 = *MEMORY[0x1E4F56600];
  v57 = objc_msgSend(v4, "objectForKeyedSubscript:");
  uint64_t v43 = *MEMORY[0x1E4F56618];
  uint64_t v7 = objc_msgSend(v4, "objectForKeyedSubscript:");
  uint64_t v8 = *MEMORY[0x1E4F565D0];
  uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F565D0]];
  uint64_t v10 = *MEMORY[0x1E4F565E8];
  uint64_t v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F565E8]];
  uint64_t v12 = *MEMORY[0x1E4F565E0];
  v53 = v4;
  uint64_t v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F565E0]];
  [v58 addProperty:v5 withValue:v55];
  [v58 addProperty:v51 withValue:v6];
  [v58 addProperty:v49 withValue:v54];
  [v58 addProperty:v47 withValue:v56];
  [v58 addProperty:v45 withValue:v57];
  v50 = (void *)v7;
  [v58 addProperty:v43 withValue:v7];
  v48 = (void *)v9;
  [v58 addProperty:v8 withValue:v9];
  v46 = (void *)v11;
  [v58 addProperty:v10 withValue:v11];
  v44 = (void *)v13;
  [v58 addProperty:v12 withValue:v13];
  if (v54)
  {
    v14 = -[PHCPAnalyticsCachedPropertyProvider _librarySizeRange:](v41, "_librarySizeRange:", [v54 integerValue]);
    [v58 addProperty:*MEMORY[0x1E4F565D8] withValue:v14];
  }
  if (v56)
  {
    v15 = objc_msgSend(MEMORY[0x1E4F56658], "bucketNameForInteger:bucketLimits:", objc_msgSend(v56, "integerValue"), 0, 100, 250, 500, 1000, 2000, 4000, 0);
    [v58 addProperty:*MEMORY[0x1E4F565F8] withValue:v15];
  }
  if (v57)
  {
    id v16 = objc_msgSend(MEMORY[0x1E4F56658], "bucketNameForInteger:bucketLimits:", objc_msgSend(v57, "integerValue"), 0, 2, 5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 0);
    [v58 addProperty:*MEMORY[0x1E4F56608] withValue:v16];
  }
  uint64_t v17 = *MEMORY[0x1E4F56630];
  v42 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F56630]];
  uint64_t v18 = *MEMORY[0x1E4F56638];
  v40 = [v53 objectForKeyedSubscript:*MEMORY[0x1E4F56638]];
  uint64_t v19 = *MEMORY[0x1E4F56648];
  v39 = [v53 objectForKeyedSubscript:*MEMORY[0x1E4F56648]];
  uint64_t v20 = *MEMORY[0x1E4F56650];
  v38 = [v53 objectForKeyedSubscript:*MEMORY[0x1E4F56650]];
  uint64_t v21 = *MEMORY[0x1E4F56640];
  v22 = [v53 objectForKeyedSubscript:*MEMORY[0x1E4F56640]];
  [v58 addProperty:v17 withValue:v42];
  [v58 addProperty:v18 withValue:v40];
  [v58 addProperty:v19 withValue:v39];
  [v58 addProperty:v20 withValue:v38];
  [v58 addProperty:v21 withValue:v22];
  uint64_t v23 = *MEMORY[0x1E4F56628];
  v24 = [v53 objectForKeyedSubscript:*MEMORY[0x1E4F56628]];
  [v58 addProperty:v23 withValue:v24];
  uint64_t v25 = [v52 objectForKeyedSubscript:*MEMORY[0x1E4F563C0]];
  uint64_t v26 = *MEMORY[0x1E4F563E0];
  uint64_t v27 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F563E0]];
  v28 = (void *)v27;
  if (v27) {
    v29 = (__CFString *)v27;
  }
  else {
    v29 = @"Unknown";
  }
  v30 = v29;

  uint64_t v31 = *MEMORY[0x1E4F563D8];
  uint64_t v32 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F563D8]];
  v33 = (void *)v32;
  if (v32) {
    v34 = (__CFString *)v32;
  }
  else {
    v34 = @"Unknown";
  }
  v35 = v34;

  [v58 addProperty:v26 withValue:v30];
  [v58 addProperty:v31 withValue:v35];

  uint64_t v36 = *MEMORY[0x1E4F56540];
  v37 = [v52 objectForKeyedSubscript:*MEMORY[0x1E4F56540]];
  [v58 addProperty:v36 withValue:v37];
}

- (PHCPAnalyticsCachedPropertyProvider)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHCPAnalyticsCachedPropertyProvider;
  uint64_t v5 = [(PHCPAnalyticsCachedPropertyProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_photoLibrary, v4);
  }

  return v6;
}

- (PHCPAnalyticsCachedPropertyProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHCPAnalyticsCachedPropertyProvider.m", 51, @"%s is not available as initializer", "-[PHCPAnalyticsCachedPropertyProvider init]");

  abort();
}

@end