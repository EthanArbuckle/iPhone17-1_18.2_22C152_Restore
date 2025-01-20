@interface BCSURLPatternController
- (BCSDomainItemCaching)cacheManager;
- (BCSMetricFactoryProtocol)metricFactory;
- (BCSURLPatternController)initWithCacheManager:(id)a3 metricFactory:(id)a4;
- (BCSURLPatternMatchResult)cachedPatternMatchingResult;
- (id)mostExplicitMatchingResultFromResults:(id)a3;
- (void)matchPatternForURL:(id)a3 forClientBundleID:(id)a4 completion:(id)a5;
- (void)setCachedPatternMatchingResult:(id)a3;
@end

@implementation BCSURLPatternController

- (BCSURLPatternController)initWithCacheManager:(id)a3 metricFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BCSURLPatternController;
  v9 = [(BCSURLPatternController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cacheManager, a3);
    objc_storeStrong((id *)&v10->_metricFactory, a4);
  }

  return v10;
}

- (void)matchPatternForURL:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  v9 = ABSLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v73 = "-[BCSURLPatternController matchPatternForURL:forClientBundleID:completion:]";
    _os_log_impl(&dword_2154F4000, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v8)
  {
    v10 = [(BCSURLPatternController *)self cachedPatternMatchingResult];
    if ([v10 isExpired])
    {

      goto LABEL_12;
    }
    objc_super v12 = [(BCSURLPatternController *)self cachedPatternMatchingResult];
    v13 = [v12 originalURL];
    int v14 = [v7 isEqual:v13];

    if (!v14)
    {
LABEL_12:
      v23 = [v7 host];
      v11 = +[BCSDomainItemIdentifier identifierWithType:3 domain:v23];

      v24 = [(BCSURLPatternController *)self cacheManager];
      v25 = [v24 domainItemMatching:v11];

      if (!v25)
      {
        (*((void (**)(id, void, void, void, void, void))v8 + 2))(v8, 0, 0, 0, 0, 0);
LABEL_42:

        goto LABEL_43;
      }
      v50 = self;
      v26 = [v25 domainBundleIDPatterns];
      v56 = objc_alloc_init(BCSURLPatternMatcher);
      if (![(BCSURLPatternMatcher *)v56 isValidDomainForURL:v7 domainBundleIDPatterns:v26])
      {
        (*((void (**)(id, void, void, void, void, void))v8 + 2))(v8, 0, 0, 0, 0, 0);
LABEL_41:

        goto LABEL_42;
      }
      v48 = v11;
      id v49 = v8;
      id v27 = v7;
      v55 = [MEMORY[0x263EFF980] array];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v47 = v26;
      id obj = [v26 bundleIdPatterns];
      uint64_t v53 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
      if (v53)
      {
        uint64_t v52 = *(void *)v63;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v63 != v52) {
              objc_enumerationMutation(obj);
            }
            uint64_t v54 = v28;
            v29 = *(void **)(*((void *)&v62 + 1) + 8 * v28);
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            v30 = [v29 urlPatterns];
            uint64_t v31 = [v30 countByEnumeratingWithState:&v58 objects:v68 count:16];
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v59;
              do
              {
                for (uint64_t i = 0; i != v32; ++i)
                {
                  if (*(void *)v59 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  uint64_t v35 = *(void *)(*((void *)&v58 + 1) + 8 * i);
                  v36 = [v29 bundleId];
                  v37 = v25;
                  v38 = [v25 expirationDate];
                  uint64_t v57 = 0;
                  v39 = [(BCSURLPatternMatcher *)v56 matchPattern:v35 withURL:v27 forBundleID:v36 expirationDate:v38 error:&v57];

                  v40 = [v39 extractedURL];

                  if (v40) {
                    [v55 addObject:v39];
                  }

                  v25 = v37;
                }
                uint64_t v32 = [v30 countByEnumeratingWithState:&v58 objects:v68 count:16];
              }
              while (v32);
            }

            uint64_t v28 = v54 + 1;
          }
          while (v54 + 1 != v53);
          uint64_t v53 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
        }
        while (v53);
      }

      if (![v55 count])
      {
        id v8 = v49;
        (*((void (**)(id, void, void, void, void, void))v49 + 2))(v49, 0, 0, 0, 0, 0);
        id v7 = v27;
LABEL_40:
        v26 = v47;

        v11 = v48;
        goto LABEL_41;
      }
      v41 = [(BCSURLPatternController *)v50 mostExplicitMatchingResultFromResults:v55];
      id v7 = v27;
      id v8 = v49;
      if (v41)
      {
        [(BCSURLPatternController *)v50 setCachedPatternMatchingResult:v41];
        if (MEMORY[0x2166BD6C0]("-[BCSURLPatternController matchPatternForURL:forClientBundleID:completion:]"))
        {
          v66 = @"BCSBusinessQueryServicePatternMatchingResult";
          v42 = [v41 debugDescription];
          v67 = v42;
          v43 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];

          v44 = [v41 bundleID];
          v45 = [(BCSURLPatternController *)v50 cachedPatternMatchingResult];
          v46 = [v45 extractedURL];
          (*((void (**)(id, uint64_t, void *, void *, void *, void))v49 + 2))(v49, 1, v44, v46, v43, 0);

LABEL_39:
          goto LABEL_40;
        }
      }
      else
      {
        MEMORY[0x2166BD6C0]("-[BCSURLPatternController matchPatternForURL:forClientBundleID:completion:]");
      }
      v43 = [v41 bundleID];
      v44 = [(BCSURLPatternController *)v50 cachedPatternMatchingResult];
      v45 = [v44 extractedURL];
      (*((void (**)(id, uint64_t, void *, void *, void, void))v49 + 2))(v49, 1, v43, v45, 0, 0);
      goto LABEL_39;
    }
    v15 = ABSLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v73 = "-[BCSURLPatternController matchPatternForURL:forClientBundleID:completion:]";
      _os_log_impl(&dword_2154F4000, v15, OS_LOG_TYPE_DEFAULT, "%s Found matched pattern result in memory cache", buf, 0xCu);
    }

    v70 = @"BCSBusinessQueryServicePatternMatchingResult";
    v16 = [(BCSURLPatternController *)self cachedPatternMatchingResult];
    v17 = [v16 debugDescription];
    v18 = [v17 stringByAppendingString:@"\nFrom Memory Cache: YES"];
    v71 = v18;
    v11 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];

    v19 = [(BCSURLPatternController *)self cachedPatternMatchingResult];
    v20 = [v19 bundleID];
    v21 = [(BCSURLPatternController *)self cachedPatternMatchingResult];
    v22 = [v21 extractedURL];
    (*((void (**)(id, uint64_t, void *, void *, NSObject *, void))v8 + 2))(v8, 1, v20, v22, v11, 0);
  }
  else
  {
    v11 = ABSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v73 = "-[BCSURLPatternController matchPatternForURL:forClientBundleID:completion:]";
      _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s Nil completion passed. Do nothing.", buf, 0xCu);
    }
  }
LABEL_43:
}

- (id)mostExplicitMatchingResultFromResults:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t v7 = 0;
      id v8 = 0;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v4);
          }
          v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v12 = 1000000 * [v11 totalConsecutivePrefixMatches];
          uint64_t v13 = v12 + 1000 * [v11 totalExactMatches];
          unint64_t v14 = v13 + [v11 totalAnyMatches];
          if (v14 >= v7)
          {
            id v15 = v11;

            unint64_t v7 = v14;
            id v8 = v15;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }
    else
    {
      id v8 = 0;
    }

    id v3 = v17;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BCSMetricFactoryProtocol)metricFactory
{
  return self->_metricFactory;
}

- (BCSDomainItemCaching)cacheManager
{
  return self->_cacheManager;
}

- (BCSURLPatternMatchResult)cachedPatternMatchingResult
{
  return self->_cachedPatternMatchingResult;
}

- (void)setCachedPatternMatchingResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPatternMatchingResult, 0);
  objc_storeStrong((id *)&self->_cacheManager, 0);

  objc_storeStrong((id *)&self->_metricFactory, 0);
}

@end